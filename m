Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13581990ECA
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 21:42:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9197D10EAA7;
	Fri,  4 Oct 2024 19:42:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="M1j5meyJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com
 [91.218.175.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64B6C10EAA7
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2024 19:42:30 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1728070948;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=6EzcXnrKJjq6UuWp+kgm49KbbcmUTLQ08qDVQkcSwYc=;
 b=M1j5meyJY2jcw/bOYM6ojGMrPY5f3uDR12gFSUTIFSZ2bowvRE4b51yA9OR/hNNsWy6w4v
 hwVB/FeaWwZSR0qPXDrH8HCr+uWX01WY1Jg9dCTGPbgPi5KOT1k0VusyMO0YFwIOBbv+l7
 ygH8ap4is79A3i69XWemC4AVts5niIE=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [PATCH 0/3] Fix GPU virtual address collosion when CPU page size !=
 GPU page size
Date: Sat,  5 Oct 2024 03:42:04 +0800
Message-Id: <20241004194207.1013744-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

Etnaviv assumes that GPU page size is 4KiB, however, when using
softpin capable GPUs on a different CPU page size configuration.
Userspace still doing the allocation with 4KiB page as unit. This
results in userspace allocated GPU virtual address ranges collision
and therefore unable to be inserted to the specified hole exactly.

The root cause is that kernel side BO takes up bigger address space
than userspace assumes when the size of it is not CPU page size aligned.

To solve it with no GPU VA range space wasting, we first track the size
of a buffer that userspace/GPU think of it is, then partially map and/or
unmap the tail physical page with respect to this 'user size'. Ensure
that GPU VA is fully mapped and/or unmapped.

Sui Jingfeng (3):
  drm/etnaviv: Track GPU VA size separately
  drm/etnaviv: Map and unmap the GPU VA range with respect to its user
    size
  drm/etnaviv: Print an error message if inserting IOVA range fails

 drivers/gpu/drm/etnaviv/etnaviv_gem.c |  8 +++--
 drivers/gpu/drm/etnaviv/etnaviv_gem.h |  1 +
 drivers/gpu/drm/etnaviv/etnaviv_mmu.c | 42 ++++++++++++---------------
 3 files changed, 24 insertions(+), 27 deletions(-)

-- 
2.34.1

