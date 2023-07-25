Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0892676122A
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 12:59:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED78710E0C9;
	Tue, 25 Jul 2023 10:59:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9E3210E0C9
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 10:59:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 02EE86164D;
 Tue, 25 Jul 2023 10:59:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 174C9C433C8;
 Tue, 25 Jul 2023 10:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1690282787;
 bh=fBwH6do8fLXuBrWtFFFz+C2h8zLxgC0R4Fmj5/GQkjI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=o45GTKZkCUbdoRoK8PCkQurIly8z9wvNrMScsadJH/B+SqHlyitUp4gafwE+wra2H
 YHzuy0fPh7SllD572de7IVsFpRo4CbcyctxVW55cqncjsFc6sdWGF3uq8w/YmF/Krp
 ndFOpyzHrGOSrEFlakJTG0RoGd0GowMV3yjhN+zY=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Subject: [PATCH 6.1 026/183] dma-buf/dma-resv: Stop leaking on krealloc()
 failure
Date: Tue, 25 Jul 2023 12:44:14 +0200
Message-ID: <20230725104508.847407285@linuxfoundation.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230725104507.756981058@linuxfoundation.org>
References: <20230725104507.756981058@linuxfoundation.org>
User-Agent: quilt/0.67
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, patches@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linaro-mm-sig@lists.linaro.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

commit 05abb3be91d8788328231ee02973ab3d47f5e3d2 upstream.

Currently dma_resv_get_fences() will leak the previously
allocated array if the fence iteration got restarted and
the krealloc_array() fails.

Free the old array by hand, and make sure we still clear
the returned *fences so the caller won't end up accessing
freed memory. Some (but not all) of the callers of
dma_resv_get_fences() seem to still trawl through the
array even when dma_resv_get_fences() failed. And let's
zero out *num_fences as well for good measure.

Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Christian König <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linaro-mm-sig@lists.linaro.org
Fixes: d3c80698c9f5 ("dma-buf: use new iterator in dma_resv_get_fences v3")
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Cc: stable@vger.kernel.org
Link: https://patchwork.freedesktop.org/patch/msgid/20230713194745.1751-1-ville.syrjala@linux.intel.com
Signed-off-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/dma-buf/dma-resv.c |   13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -566,6 +566,7 @@ int dma_resv_get_fences(struct dma_resv
 	dma_resv_for_each_fence_unlocked(&cursor, fence) {
 
 		if (dma_resv_iter_is_restarted(&cursor)) {
+			struct dma_fence **new_fences;
 			unsigned int count;
 
 			while (*num_fences)
@@ -574,13 +575,17 @@ int dma_resv_get_fences(struct dma_resv
 			count = cursor.num_fences + 1;
 
 			/* Eventually re-allocate the array */
-			*fences = krealloc_array(*fences, count,
-						 sizeof(void *),
-						 GFP_KERNEL);
-			if (count && !*fences) {
+			new_fences = krealloc_array(*fences, count,
+						    sizeof(void *),
+						    GFP_KERNEL);
+			if (count && !new_fences) {
+				kfree(*fences);
+				*fences = NULL;
+				*num_fences = 0;
 				dma_resv_iter_end(&cursor);
 				return -ENOMEM;
 			}
+			*fences = new_fences;
 		}
 
 		(*fences)[(*num_fences)++] = dma_fence_get(fence);


