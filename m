Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE473ACB797
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 17:29:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FDDF10E556;
	Mon,  2 Jun 2025 15:29:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="SWL/GjsS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A98910E2B4
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jun 2025 15:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LdawdXmBfDMHLyA8lDmp9rFN6T9shSw+vKGYAcHqkWs=; b=SWL/GjsSGAcWF74iYIVvbeJ+Rp
 6hCMJQ1hOEt1VUK5TgJCJ+XdVGCwWNUYeg50HV8ufHX2weTyzDtyBbBHhDzV7baSCfrqFblWU+EGC
 26LHu7786RNFfTNNv7I7XZaYYarYCEsjuTlavG1zYRUo1zm/QszNUSetPGUAB/UhthCMCDc2QzUQN
 Qr1ed7XjixRaXalvrxWNRIg6kMIPDuIfHDQyc3tgpsAHi9+AD5anfdeG1/lPF9zBqOOUu2LGDo7tB
 I/dvBerp5rEO9d9MnA8/PeiDmBFiHnZSmyva7o5aiMDatqQSQdbrHyLX71r+bQ9ZIHUYmWgKjnA38
 3Zx+ZzZw==;
Received: from [81.79.92.254] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uM76V-00GKNk-7U; Mon, 02 Jun 2025 17:29:35 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 0/2] TTM pool shrinker improvements
Date: Mon,  2 Jun 2025 16:29:27 +0100
Message-ID: <20250602152929.18017-1-tvrtko.ursulin@igalia.com>
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

Just two small patches to make the TTM pool shrinker respect the shrink target
configured by the core, and to also signal the core it can cheaply free more
than the default 128 pages.

Motivation was that I was running some VK-CTS tests and noticed shrinker
callback was getting called quite a lot so thought why not make it a tiny bit
more respectful and efficient.

Cc: Christian König <christian.koenig@amd.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Tvrtko Ursulin (2):
  drm/ttm: Respect the shrinker core free target
  drm/ttm: Increase pool shrinker batch target

 drivers/gpu/drm/ttm/ttm_pool.c | 28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

-- 
2.48.0

