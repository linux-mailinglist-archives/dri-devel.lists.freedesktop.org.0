Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32774AB4D26
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 09:45:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EFA610E528;
	Tue, 13 May 2025 07:45:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="nJzzwRtj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DF8010E521;
 Tue, 13 May 2025 07:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QAQu03T+0Cw7dpCbcuwxezen/s/XSrGtmte1ESndrNA=; b=nJzzwRtj5rV4zm2BpXSExInOyl
 o+FiA6T2ZBQBZoFyP9bdpBf+plLyFBsh6DtlQcaCevNGUUSxKZ2II6aBlcQiqALNTWX0jQ9c26Txm
 m4ZabxWLa2XvffNwzC66rHXryigcue+Q/koh/Bx7DeCiff+f7w8RsAgU1BCzpvatumBQVU1KQBp8i
 imXydBDHX/27eYLMER9jc1g4xr2vUa9GWYNNz8k+enWVPlG5opJGbHUWsYTdAp8hNxEl820KZEa40
 I4P4eRHmjhTL6qbHbssnUkiRrrpLxYPL2O8ULOpsIhKL73Eda7xJpHLg6To5RxLCTm8VAB5DHMTXI
 nANvQSUA==;
Received: from [81.79.92.254] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uEkF5-007Tvi-M3; Tue, 13 May 2025 09:45:30 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: Rob Clark <robdclark@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [RFC v3 08/10] sync_file: Protect access to driver and timeline name
Date: Tue, 13 May 2025 08:45:11 +0100
Message-ID: <20250513074513.81727-9-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250513074513.81727-1-tvrtko.ursulin@igalia.com>
References: <20250513074513.81727-1-tvrtko.ursulin@igalia.com>
MIME-Version: 1.0
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

Protect the access to driver and timeline name which otherwise could be
freed as dma-fence exported is signalling fences.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/dma-buf/sync_file.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
index 212df4b849fe..ad87116baa24 100644
--- a/drivers/dma-buf/sync_file.c
+++ b/drivers/dma-buf/sync_file.c
@@ -136,11 +136,13 @@ char *sync_file_get_name(struct sync_file *sync_file, char *buf, int len)
 	} else {
 		struct dma_fence *fence = sync_file->fence;
 
+		dma_fence_access_begin();
 		snprintf(buf, len, "%s-%s%llu-%lld",
 			 dma_fence_driver_name(fence),
 			 dma_fence_timeline_name(fence),
 			 fence->context,
 			 fence->seqno);
+		dma_fence_access_end();
 	}
 
 	return buf;
@@ -262,6 +264,8 @@ static long sync_file_ioctl_merge(struct sync_file *sync_file,
 static int sync_fill_fence_info(struct dma_fence *fence,
 				 struct sync_fence_info *info)
 {
+	dma_fence_access_begin();
+
 	strscpy(info->obj_name, dma_fence_timeline_name(fence),
 		sizeof(info->obj_name));
 	strscpy(info->driver_name, dma_fence_driver_name(fence),
@@ -273,6 +277,8 @@ static int sync_fill_fence_info(struct dma_fence *fence,
 			ktime_to_ns(dma_fence_timestamp(fence)) :
 			ktime_set(0, 0);
 
+	dma_fence_access_end();
+
 	return info->status;
 }
 
-- 
2.48.0

