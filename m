Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGi7CW/Gl2lg8QIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 03:26:55 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0EB1643FD
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 03:26:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0A8D10E76E;
	Fri, 20 Feb 2026 02:26:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FXTdqFwx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ACC710E76C
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Feb 2026 02:26:47 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-48371bb515eso20376765e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 18:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771554406; x=1772159206; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yfpS8DlXvvljKpn2dCpU5kHCKROr07RH+HWjYwPkZPA=;
 b=FXTdqFwxQd7HUnnG9Q32QziejdMH+6YJvDiRJyBAi5OUSyTn5d3KGw0xEWwZwVf7B8
 eeUly52EEkFsbjrJzNOlG9/2E6XsF/Ra3IcHvK36+cEniwmlwsk56tzllGk/JlKO03I4
 vYm34zt5yQNe/GZJa+5KxvcutmjC3H+YeBQu65fltae49c+apnE3bo1LlwH5fKedIR37
 3y3tmGv2nvtjxILeWnu8PZBkGfonJcE+xhUN4MoVOnJ5Ox+2Nw7gD5AILJJSYmIbETLe
 JTlDiuMwvRTUfOuDZAJe/MAaYMSeb/KDgBCXAW4fAgKpqpHZC270c9btFQxpk460esHr
 dH8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771554406; x=1772159206;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=yfpS8DlXvvljKpn2dCpU5kHCKROr07RH+HWjYwPkZPA=;
 b=tHW1/+d3gqFHOYhM7XiQhxbDqwER4PYRewhc0J5Hf16oib8NsuT3KZqDXoQklkO6GG
 mXOgzfPjBtGRS5xAjgKb7pmRmnW9Ln9zsyYYC8aF2Rat/A0waVwVLLi06H2/bfrNHPyV
 Wu9y+3TUq4OgFsYrJyDUH2XFyIRktgqCYOAOIx6rFKfQ0WLoIh4TuPL5vJPamNfVwpZx
 VGFJHoVGHtWHXC32DHEqlm7A+ZCekyV1+66AFTgjJ+3vFCzeq2IwnNJv4DCi9i0yz62H
 dD7T5o8eEMYcicmPwenetUMOXB5duWr1mQbwfDrOlJNAL2st1+bZFsir7b3HPUuzHgR8
 5vQw==
X-Gm-Message-State: AOJu0YyKuT3/BHx+NNbUIo2EPtCg9m8STVaSNuzhOXRs5YjGJSVVdWHX
 wlY1x24DC7aDefHtFdI6M/rklDSwY2HKMZRbCvQsjhGE+Edg91T3L590
X-Gm-Gg: AZuq6aJE1PHryxiuL2YlSYpWPbEaxG2EOgEiaW76Bu+8uZdRKw1KGO6OGlQWFSBuR8n
 80PCTKKR7SgSwQGFTC5bQ/r6fsIY0ZJOvH65zEDA2xR6XNpoo42KDwCXK8rd1JQataJn5VSVUu7
 GtSwWbzXShHp6Hu2dR7k8JuyQiHIRtNJXvELI3tnhWhmkNkw85fFKvlfbMoNXhCBLokXT4KyUym
 stHs/N7I/3F0JHBhp1R1mYiAVb5jSiZOzuCu4m9CasxlwUO9iW6PDTJb8cSL8+S5XsyDJQdacto
 7cIV/qsWcPu3b9wdC8dxHvzFZRnRcxoWIJwkB2rcobRVGaFvFjWliCDh3j81De7O8BJ9toT0pWr
 Q+ErcoZf+wmfGSXkv4XyVQVHAui+Kk2TvB0QKcCU5wO1iWFFR1R0CupACrgMVJKg60iTw+YbXsU
 nQ/8OMjpnuicyO4pQGoOZVfI+lg5UACY92dEu3ArL1Kw+jMwtYtAJ0C0u8mITnjS7+ZqDs
X-Received: by 2002:a05:6000:26c6:b0:434:2569:275d with SMTP id
 ffacd0b85a97d-43958e0cde3mr13182560f8f.26.1771554405557; 
 Thu, 19 Feb 2026 18:26:45 -0800 (PST)
Received: from Arch-Spectre.dur.ac.uk ([129.234.0.168])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796ad0166sm53446975f8f.35.2026.02.19.18.26.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 18:26:44 -0800 (PST)
From: Yicong Hui <yiconghui@gmail.com>
To: christian.koenig@amd.com,
	michel.daenzer@mailbox.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
 Yicong Hui <yiconghui@gmail.com>
Subject: [RFC PATCH v2 1/3] drm/syncobj: Add flag
 DRM_SYNCOBJ_QUERY_FLAGS_ERROR to query errors
Date: Fri, 20 Feb 2026 02:26:26 +0000
Message-ID: <20260220022631.2205037-2-yiconghui@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260220022631.2205037-1-yiconghui@gmail.com>
References: <20260220022631.2205037-1-yiconghui@gmail.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:michel.daenzer@mailbox.org,m:linux-kernel@vger.kernel.org,m:skhan@linuxfoundation.org,m:david.hunter.linux@gmail.com,m:yiconghui@gmail.com,m:davidhunterlinux@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[yiconghui@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,linuxfoundation.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yiconghui@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: CB0EB1643FD
X-Rspamd-Action: no action

Add flag DRM_SYNCOBJ_QUERY_FLAGS_ERROR to make the
DRM_IOCTL_SYNCOBJ_QUERY ioctl fill out the handles array with the
error code of the first fence found per syncobj and 0 if one is not
found and maintain the normal return value in points.

Suggested-by: Christian König <christian.koenig@amd.com>
Suggested-by: Michel Dänzer <michel.daenzer@mailbox.org>
Signed-off-by: Yicong Hui <yiconghui@gmail.com>
---
 drivers/dma-buf/dma-fence-chain.c | 52 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_syncobj.c     | 21 ++++++++++++-
 include/linux/dma-fence-chain.h   |  1 +
 include/uapi/drm/drm.h            |  1 +
 4 files changed, 74 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
index a8a90acf4f34..076d78b73379 100644
--- a/drivers/dma-buf/dma-fence-chain.c
+++ b/drivers/dma-buf/dma-fence-chain.c
@@ -76,6 +76,58 @@ struct dma_fence *dma_fence_chain_walk(struct dma_fence *fence)
 }
 EXPORT_SYMBOL(dma_fence_chain_walk);
 
+/**
+ * dma_fence_chain_find_error - find the latest error
+ * @fence: current chain node
+ *
+ * Walk the chain repeatedly until reaches a fence with error, or the
+ * end of the fence chain. Does not garbage collect.
+ *
+ * Returns the first error it finds in the chain.
+ */
+int64_t dma_fence_chain_find_error(struct dma_fence *fence)
+{
+	struct dma_fence_chain *chain, *prev_chain;
+	struct dma_fence *prev;
+	int64_t error = 0;
+
+	chain = to_dma_fence_chain(fence);
+	if (!chain)
+		return fence->error;
+
+	if (chain->fence->error)
+		return chain->fence->error;
+
+	while ((prev = dma_fence_chain_get_prev(chain))) {
+		prev_chain = to_dma_fence_chain(prev);
+
+		if (prev_chain) {
+
+			if (prev_chain->fence->error) {
+				error = prev_chain->fence->error;
+				dma_fence_put(prev);
+				break;
+			}
+
+			chain = prev_chain;
+		} else {
+
+			if (prev->error)
+				error = prev->error;
+			dma_fence_put(prev);
+			break;
+		}
+
+
+		dma_fence_put(prev);
+
+	}
+
+
+	return error;
+}
+EXPORT_SYMBOL(dma_fence_chain_find_error);
+
 /**
  * dma_fence_chain_find_seqno - find fence chain node by seqno
  * @pfence: pointer to the chain node where to start
diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 2d4ab745fdad..322f64b72775 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -1654,14 +1654,17 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
 {
 	struct drm_syncobj_timeline_array *args = data;
 	struct drm_syncobj **syncobjs;
+	unsigned int valid_flags = DRM_SYNCOBJ_QUERY_FLAGS_LAST_SUBMITTED |
+				   DRM_SYNCOBJ_QUERY_FLAGS_ERROR;
 	uint64_t __user *points = u64_to_user_ptr(args->points);
+	uint64_t __user *handles = u64_to_user_ptr(args->handles);
 	uint32_t i;
 	int ret;
 
 	if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ_TIMELINE))
 		return -EOPNOTSUPP;
 
-	if (args->flags & ~DRM_SYNCOBJ_QUERY_FLAGS_LAST_SUBMITTED)
+	if (args->flags & ~valid_flags)
 		return -EINVAL;
 
 	if (args->count_handles == 0)
@@ -1680,6 +1683,22 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
 		uint64_t point;
 
 		fence = drm_syncobj_fence_get(syncobjs[i]);
+
+		if (args->flags & DRM_SYNCOBJ_QUERY_FLAGS_ERROR) {
+			int64_t error = 0;
+
+			if (fence)
+				error = dma_fence_chain_find_error(fence);
+
+			ret = copy_to_user(&handles[i], &error, sizeof(int64_t));
+			ret = ret ? -EFAULT : 0;
+			if (ret) {
+				dma_fence_put(fence);
+				break;
+			}
+
+		}
+
 		chain = to_dma_fence_chain(fence);
 		if (chain) {
 			struct dma_fence *iter, *last_signaled =
diff --git a/include/linux/dma-fence-chain.h b/include/linux/dma-fence-chain.h
index 68c3c1e41014..b4ada124d7b6 100644
--- a/include/linux/dma-fence-chain.h
+++ b/include/linux/dma-fence-chain.h
@@ -122,6 +122,7 @@ static inline void dma_fence_chain_free(struct dma_fence_chain *chain)
 	     iter = dma_fence_chain_walk(iter))
 
 struct dma_fence *dma_fence_chain_walk(struct dma_fence *fence);
+int64_t dma_fence_chain_find_error(struct dma_fence *fence);
 int dma_fence_chain_find_seqno(struct dma_fence **pfence, uint64_t seqno);
 void dma_fence_chain_init(struct dma_fence_chain *chain,
 			  struct dma_fence *prev,
diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index 27cc159c1d27..2640cc0a09fe 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -1044,6 +1044,7 @@ struct drm_syncobj_array {
 };
 
 #define DRM_SYNCOBJ_QUERY_FLAGS_LAST_SUBMITTED (1 << 0) /* last available point on timeline syncobj */
+#define DRM_SYNCOBJ_QUERY_FLAGS_ERROR (1 << 1) /* fill out error codes if they are found */
 struct drm_syncobj_timeline_array {
 	__u64 handles;
 	__u64 points;
-- 
2.53.0

