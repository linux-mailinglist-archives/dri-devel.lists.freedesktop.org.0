Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0D8A93B2F
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 18:43:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A725888FF9;
	Fri, 18 Apr 2025 16:43:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="QahTuf5W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12F5210E22F
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 16:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=P5I0hbbVY6XpzeeIc+1DstWJ3qYoVYtUpQ6/7hiEJcI=; b=QahTuf5WVPheGZubXNV9xq6R3c
 N6VhuFtZiySqjmGbzxwTR0vBgzaDVW2fANbayJVDkzC4bGcoHZxxJCbIeBJTBmdDBu6t7GFVLS2S0
 CfCVQXfRnOdsa7/8YR73Nv4w4LmUOEJPl1BEw4cXY74MowR6EzEoKc8RJOKffuWgGmgF6MUVEkNi+
 68IrpW0itp/FuuIGQkKnHoffLCTtfKeuAQyNBUmri5KGy6dbkH4bBK9KR7Us/GcVWVmcHGFCzceMl
 nPzznKLYukzhz/8BO+wkpV2xSvlNiUD70MQ2dmGEhV7n9aYp8M977g3ZjBYHZlBts78motngOMa4g
 9VaXbM8w==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1u5onn-001Hbm-7x; Fri, 18 Apr 2025 18:42:55 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [RFC 0/4] Some (drm_sched_|dma_)fence lifetime issues
Date: Fri, 18 Apr 2025 17:42:42 +0100
Message-ID: <20250418164246.72426-1-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

Recently I mentioned to Danilo about some fence lifetime issues so here is a
rough series, more than anything intended to start the discussion.

Most of the problem statement can be found in the first patch but to briefly
summarise - because sched fence can outlive the scheduler, we can trivially
engineer an use after free with xe and possibly other drivers. All that is
needed is to convert a syncobj into a sync file behind drivers back, and I don't
see what the driver can do about it.

IGT that exploits the problem:
https://patchwork.freedesktop.org/patch/642709/?series=146211&rev=2

Different flavour of the problem space is if we had a close(drm_fd) in that test
before the sleep. In that case we can even unload xe.ko and gpu-sched.ko for
even more fun. Last two patches in the series close that gap.

But first two patches are just shrinking the race window. They are not proper
fixes. This is what I want to discuss since I understand reference counting all
the involved objects has been rejected in the past. And since the problem
probably expands to all dma fences it certainly isn't easy.

To be clear once more - lets not focus on how this does not fix it fully - I am
primarily trying to start the conversation.

Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <phasta@kernel.org>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Tvrtko Ursulin (4):
  sync_file: Weakly paper over one use-after-free resulting race
  dma-fence: Slightly safer dma_fence_set_deadline
  drm/sched: Keep module reference while there are active fences
  drm/xe: Keep module reference while there are active fences

 drivers/dma-buf/dma-fence.c             |  2 +-
 drivers/dma-buf/sync_file.c             | 29 ++++++++++++++++++++-----
 drivers/gpu/drm/scheduler/sched_fence.c | 12 ++++++++--
 drivers/gpu/drm/xe/xe_hw_fence.c        | 13 ++++++++++-
 4 files changed, 47 insertions(+), 9 deletions(-)

-- 
2.48.0
