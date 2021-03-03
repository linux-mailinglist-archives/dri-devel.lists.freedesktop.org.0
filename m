Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E1032E3C6
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 09:37:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 430656EB48;
	Fri,  5 Mar 2021 08:37:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75B806EA26;
 Thu,  4 Mar 2021 15:20:13 +0000 (UTC)
Message-Id: <20210303132711.340553449@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1614870845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=W7oApS46MDPIMz++QVI+vaMG2S2wg5cT666lhSAPmrA=;
 b=qB10s7b6LEeIwHAxokpDovRbZ4E7paZAZz8Ep8zuCisdn5vUVu1cODeEP868R5dWht+Ccy
 hTRcgGssSmtpXoIdTHAFyKB1D7ns4yAQSqo8sWDj9gCvOU0oiLphaEUJVRVPP5l4uHhMxA
 KYFX3xRyBfIS2hbVdCTGXXtx7AdHM56BnSAjFOf8niMB8SNd1G7daMIL9XF3ic0euJni5w
 8L4hiHYyq4dU/Egvn6CcnMKftiK9UK1oLEdt4NfM3VpFfkvBUZz1VJkxcfHPaB2vQd2kn8
 raDJVfyRetjdhytPQrdrf6GOZynJke5+7R6ynEqgS4wGsS1YkSv+Povw5ZhF/A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1614870845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=W7oApS46MDPIMz++QVI+vaMG2S2wg5cT666lhSAPmrA=;
 b=2DQyCJ6XggnTkGy39/on30lgXHHfArioCYAj6vuZB/jAFSaqLL57CRl58SOtKKbLbX5JmL
 njvWi7Pub9fsXoBg==
Date: Wed, 03 Mar 2021 14:20:24 +0100
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch 1/7] drm/ttm: Replace kmap_atomic() usage
References: <20210303132023.077167457@linutronix.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 05 Mar 2021 08:36:53 +0000
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, Roland Scheidegger <sroland@vmware.com>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, Huang Rui <ray.huang@amd.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 spice-devel@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Christian Koenig <christian.koenig@amd.com>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thomas Gleixner <tglx@linutronix.de>

There is no reason to disable pagefaults and preemption as a side effect of
kmap_atomic_prot().

Use kmap_local_page_prot() instead and document the reasoning for the
mapping usage with the given pgprot.

Remove the NULL pointer check for the map. These functions return a valid
address for valid pages and the return was bogus anyway as it would have
left preemption and pagefaults disabled.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Huang Rui <ray.huang@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/ttm/ttm_bo_util.c |   20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -181,13 +181,15 @@ static int ttm_copy_io_ttm_page(struct t
 		return -ENOMEM;
 
 	src = (void *)((unsigned long)src + (page << PAGE_SHIFT));
-	dst = kmap_atomic_prot(d, prot);
-	if (!dst)
-		return -ENOMEM;
+	/*
+	 * Ensure that a highmem page is mapped with the correct
+	 * pgprot. For non highmem the mapping is already there.
+	 */
+	dst = kmap_local_page_prot(d, prot);
 
 	memcpy_fromio(dst, src, PAGE_SIZE);
 
-	kunmap_atomic(dst);
+	kunmap_local(dst);
 
 	return 0;
 }
@@ -203,13 +205,15 @@ static int ttm_copy_ttm_io_page(struct t
 		return -ENOMEM;
 
 	dst = (void *)((unsigned long)dst + (page << PAGE_SHIFT));
-	src = kmap_atomic_prot(s, prot);
-	if (!src)
-		return -ENOMEM;
+	/*
+	 * Ensure that a highmem page is mapped with the correct
+	 * pgprot. For non highmem the mapping is already there.
+	 */
+	src = kmap_local_page_prot(s, prot);
 
 	memcpy_toio(dst, src, PAGE_SIZE);
 
-	kunmap_atomic(src);
+	kunmap_local(src);
 
 	return 0;
 }


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
