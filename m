Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JCHOog1l2k/vwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 17:08:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 947CB16086C
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 17:08:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECBB410E712;
	Thu, 19 Feb 2026 16:08:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Htj8cvuR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE2BE10E708
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 16:08:29 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-4359249bbacso1436996f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 08:08:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771517308; x=1772122108; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w4GCVw8fx6uhMabcHsgAh0C5ss/bqhWZd2wvtI2G17s=;
 b=Htj8cvuRxBmy0ZPGMtN89WlPHsAezYuOS/P3lns+tXEXDE/F/79y5tjNAVRWuSkpFU
 TI3m+aSgSdIV30osFthP5Mdukvw6yiE7DA6k+ae+FqY/016Oc4pZqYmyzh7pthburnR8
 yV0h1QzZPw1uyGtaZe5DYqMfQ1+EQXvwBXg/Qsyj1KSvMinxxz91ySiO8pokGomj4QVR
 pH/fRjNe543Gi9udSfjZqOvCn/lnjT105tJiWFqNd8uwBRifq+c26piSGUxrfG/3EwjR
 gzdReuNJButt7+GMo/vwIhhkw1kQxSsZueisRxjZC6epuWUVV3GIs8ZdgqNvGEQI1vI6
 U1+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771517308; x=1772122108;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=w4GCVw8fx6uhMabcHsgAh0C5ss/bqhWZd2wvtI2G17s=;
 b=s2zBecFKhzpM2y2TCpNFQ6TECehMtGUc0n2HYtG565EW1hfzjU8Gm0ymc4xKjXb0EA
 hJTClbhR33Mj2kgACI0H5ZWMb7S/vEVH27P9spdsOvBGEVLeDO4u7qgmeg57a7/4eZUk
 N/tvdRjVanfnV74XhBAx6UTW5wtHeHeleWfnWYSyuWJ6TtPaUb/nj8pVr4fu+t2AMBU9
 BCb6tc4dR6FgFx1G3Z9b2tZzIaqlKRMIG81jTnBg5ut+hXuVlFsv6FiFlEq6BcvkgL4O
 TG+A8yWJakV6LD/rQBwrcI8UQGFHxdWE2wBpl8Oe1pmrPR4xr/KhFGgbNfVeaN9nqlNY
 aR/A==
X-Gm-Message-State: AOJu0YzpVYyP4Dz4a7D3SORdOtSltKAkuWUPDvcyn8r5YjZYgLHky90N
 W9ybJRkddnL5PXU0WPor/I75tlCgOr1+498xIDub/Sl6nGBvVfRPLt3m
X-Gm-Gg: AZuq6aJxGHzD+j21DaDpWX7DItXaJIm05SDRlKy30JNmoqNwtVKZ34z6VnHXYYA/qu3
 nsUj5GtAdyEe/ZwBzldzODpzETJUwZQgnC7UA65auqeOo024B/yms77x8O0ycJpXworctBtCoDL
 F5vJHiuzocFbGsH+HZW8FMqu77GHyjSTFhbvY48OyYLMlaBivHfrzbJEGuAzPTDwnWU79owGPsu
 zhmZ6mHr076NzGrKTtOw+kHC51lHlgAxwM/pkZSDCChwazJKziu5jgw8Y3sQTIVQ2aYdUkTGOv+
 RLomU64kxUJ1Nkw/2lFrKH5rSRpQ91d1Zcn3UoTtNXdyGbThr4jbAn1fkXLW0INp8gaPpPPZv7H
 LN9wOKAk9Limzle5XXkpZ4vVa+kIeEa0ppeFbef5QlA0aIpDWd2uSS7ZWzhNC/ENT05njMu8j3G
 fpRG1w+2xYTZ9uGN1ItULjrS5Cg2fjnGTg9jCu
X-Received: by 2002:a05:6000:1a8e:b0:436:180e:78d9 with SMTP id
 ffacd0b85a97d-439625c6600mr4068949f8f.1.1771517308090; 
 Thu, 19 Feb 2026 08:08:28 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:1503:b900:9c42:5977:662a:d02d])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796ac82f7sm54580031f8f.28.2026.02.19.08.08.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 08:08:27 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org,
	matthew.brost@intel.com,
	sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 2/8] dma-buf: detach fence ops on signal v2
Date: Thu, 19 Feb 2026 17:07:05 +0100
Message-ID: <20260219160822.1529-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260219160822.1529-1-christian.koenig@amd.com>
References: <20260219160822.1529-1-christian.koenig@amd.com>
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:phasta@mailbox.org,m:matthew.brost@intel.com,m:sumit.semwal@linaro.org,m:linaro-mm-sig@lists.linaro.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[ckoenigleichtzumerken@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ckoenigleichtzumerken@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,amd.com:mid,amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 947CB16086C
X-Rspamd-Action: no action

When neither a release nor a wait backend ops is specified it is possible
to let the dma_fence live on independently of the module who issued it.

This makes it possible to unload drivers and only wait for all their
fences to signal.

v2: fix typo in comment

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Reviewed-by: Philipp Stanner <phasta@kernel.org>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/dma-buf/dma-fence.c | 16 ++++++++++++----
 include/linux/dma-fence.h   |  4 ++--
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index d3c4e23bf297..ae77f900c267 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -371,6 +371,14 @@ void dma_fence_signal_timestamp_locked(struct dma_fence *fence,
 				      &fence->flags)))
 		return;
 
+	/*
+	 * When neither a release nor a wait operation is specified set the ops
+	 * pointer to NULL to allow the fence structure to become independent
+	 * from who originally issued it.
+	 */
+	if (!fence->ops->release && !fence->ops->wait)
+		RCU_INIT_POINTER(fence->ops, NULL);
+
 	/* Stash the cb_list before replacing it with the timestamp */
 	list_replace(&fence->cb_list, &cb_list);
 
@@ -537,7 +545,7 @@ dma_fence_wait_timeout(struct dma_fence *fence, bool intr, signed long timeout)
 	rcu_read_lock();
 	ops = rcu_dereference(fence->ops);
 	trace_dma_fence_wait_start(fence);
-	if (ops->wait) {
+	if (ops && ops->wait) {
 		/*
 		 * Implementing the wait ops is deprecated and not supported for
 		 * issuers of fences who need their lifetime to be independent
@@ -603,7 +611,7 @@ void dma_fence_release(struct kref *kref)
 	}
 
 	ops = rcu_dereference(fence->ops);
-	if (ops->release)
+	if (ops && ops->release)
 		ops->release(fence);
 	else
 		dma_fence_free(fence);
@@ -639,7 +647,7 @@ static bool __dma_fence_enable_signaling(struct dma_fence *fence)
 
 	rcu_read_lock();
 	ops = rcu_dereference(fence->ops);
-	if (!was_set && ops->enable_signaling) {
+	if (!was_set && ops && ops->enable_signaling) {
 		trace_dma_fence_enable_signal(fence);
 
 		if (!ops->enable_signaling(fence)) {
@@ -1025,7 +1033,7 @@ void dma_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)
 
 	rcu_read_lock();
 	ops = rcu_dereference(fence->ops);
-	if (ops->set_deadline && !dma_fence_is_signaled(fence))
+	if (ops && ops->set_deadline && !dma_fence_is_signaled(fence))
 		ops->set_deadline(fence, deadline);
 	rcu_read_unlock();
 }
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index 9d8a4ebe8bf7..80db7ede91de 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -472,7 +472,7 @@ dma_fence_is_signaled_locked(struct dma_fence *fence)
 
 	rcu_read_lock();
 	ops = rcu_dereference(fence->ops);
-	if (ops->signaled && ops->signaled(fence)) {
+	if (ops && ops->signaled && ops->signaled(fence)) {
 		rcu_read_unlock();
 		dma_fence_signal_locked(fence);
 		return true;
@@ -508,7 +508,7 @@ dma_fence_is_signaled(struct dma_fence *fence)
 
 	rcu_read_lock();
 	ops = rcu_dereference(fence->ops);
-	if (ops->signaled && ops->signaled(fence)) {
+	if (ops && ops->signaled && ops->signaled(fence)) {
 		rcu_read_unlock();
 		dma_fence_signal(fence);
 		return true;
-- 
2.43.0

