Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B368EAB18A8
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 17:34:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEF3A10EA87;
	Fri,  9 May 2025 15:34:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="qy+pr17r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB36D10EA70;
 Fri,  9 May 2025 15:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=r8Pjg2msokWYcuhupUxz/k2tjiv/iKmS3Yjcj/950W0=; b=qy+pr17roTkKORBXq71WVY/uIa
 /J5NbEt2JQlr5+7KnNRvTsRciVSLTV+hsj2g9IduxKtvjI1VkWvgQUz4kw4JrKA71uT3DV+z8L7u3
 yKcoayoLIXSUewXs5ot+vi7rvUT35HgaEMYgw/xcocvy3UnzhDJLdyQMqI0No9ZFS7kIlUMFeI/5s
 ATFrCAubycNhj1hhpzCZHvjjzDUZhB+VlXmxIK5YxI+LFSjXNmVnonWDS0pg+NJ9obBZU9HE8bFtq
 K2nSYB5bVjjM0UjCZruZWWKhppwDm8qPK47G5sx5spHhE3hX4i10TONhOe5+mhE7wvm0iFUha/Dx8
 teybWipg==;
Received: from [81.79.92.254] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uDPfJ-005oEr-Mp; Fri, 09 May 2025 17:34:10 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [RFC v2 05/13] dma-fence: Add helpers for accessing driver and
 timeline name
Date: Fri,  9 May 2025 16:33:44 +0100
Message-ID: <20250509153352.7187-6-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250509153352.7187-1-tvrtko.ursulin@igalia.com>
References: <20250509153352.7187-1-tvrtko.ursulin@igalia.com>
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

Add some helpers in order to enable preventing dma-fence users accessing
the implementation details directly.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 include/linux/dma-fence.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index 5bafd0a5f1f1..c814a86087f8 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -387,6 +387,16 @@ bool dma_fence_remove_callback(struct dma_fence *fence,
 			       struct dma_fence_cb *cb);
 void dma_fence_enable_sw_signaling(struct dma_fence *fence);
 
+static inline const char *dma_fence_driver_name(struct dma_fence *fence)
+{
+	return fence->ops->get_driver_name(fence);
+}
+
+static inline const char *dma_fence_timeline_name(struct dma_fence *fence)
+{
+	return fence->ops->get_timeline_name(fence);
+}
+
 /**
  * dma_fence_is_signaled_locked - Return an indication if the fence
  *                                is signaled yet.
-- 
2.48.0

