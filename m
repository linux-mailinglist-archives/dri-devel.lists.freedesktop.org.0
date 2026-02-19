Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAU6EIg1l2kCvwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 17:08:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD714160864
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 17:08:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCE1A10E711;
	Thu, 19 Feb 2026 16:08:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XvuYn7gU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4223410E709
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 16:08:33 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-4362507f396so1189946f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 08:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771517312; x=1772122112; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sHYMqIdBeCXpl3TZbgvp21IohfSKQ4Ex+gLdhg50lgo=;
 b=XvuYn7gUfE4ip8mLtFl2D+SZxMG1wtUEsPPDdZwOpAa9A1hquuLciaKJPPXO8RD1eh
 2MRYXBuN3x+KJaYEwiiJqN4Z23pFE/tCJIZBs/GyDut+SIeWnnCE3ckLSV11KMyYuXpV
 DZakigCA1cry2ATFLnPiiBRavwOJrfhXU9EETzf7eLdzLZn6sSStSX1sPkjpnGCbPr/o
 UYTlnYc4SWRISbqhzAsjRSEc4LTB35VRX7HYyj5iZF+i04vHHf0urk4K+jKThqUZovzN
 rGti6Tl07Vpr5xh8fNnjEPx5E9qTc89kXBmn6+XkycwhXZeE+vH5my6NTUQpBwfOFQ0z
 b/8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771517312; x=1772122112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=sHYMqIdBeCXpl3TZbgvp21IohfSKQ4Ex+gLdhg50lgo=;
 b=i1FvBEvvV5RfPukyop+JJaBdRhh+cGjXrA3i413HKPsVpUgI5iWEFO2nUhTVwAwR0s
 lfwHuYJqJybMtmobM6NTGK95REg/ZWVIvd+TEH3yepiGZbjyA1T1/0XG0FyUKjlG+qW6
 ZNoLwqdMMhPOmk8pGSmd0Brz/EXO+/6zosSdwnHXgsK/cYIRm5khBew+RrlVyKVpT1/O
 Hp9fAsI++46ikwHEOMhJZ5Yxs3YsEC6FDXpdPxmxwRgg1uov+iLaZoeTsnrB0Eqm3yPv
 yuawwc8d4IJZOZ5ADMwsrnq3rJGDAVixBPcOF+uP7XOonSsyHKi1XYOCYt/speriYlGS
 HOEA==
X-Gm-Message-State: AOJu0Yw5iAieIrErbeZyi9UDoNgfwwdOha4QBILcUr97lwomrOccrt05
 xDK6H/3jguptQ1Q1ILhnJNE7VhXc2hy691kN9ZLutPqy+yZsMiGGXST/
X-Gm-Gg: AZuq6aKywO3cfEG9NiWrq55iD8LEqhRyzCuV1pckM6I1JWwDEZUOuFN8xAZJ2zwdclf
 P7O8YMoBZ7pxld+JWJd+WLeHiUGoFLC+ARZ6adJWBv8mAj8YU2T4u3vEPXnDkewH5M1MI+slaPT
 D+dblPeMqjMi9VNHshf8HKmcTROr0oh4RkfCB5jTjPuyRJcrbY4rf07PiLnbedieRC4VesDxplu
 vq+H9FkqADf+6qHG+NmAJZkD4EjrxAFAMCCF1QpnU7sN/ElDqohmVp2nwrp89Rrug+ED/ZL3ekx
 yYfQmQdL7XnwRwnt8NfZgV4y/1V9ZzrqBmlsreOlInkZkLaF5e8OgTv9Dra5fNJXzntTcsihzZX
 8YhwpedgmuCiRBhWBU9SdPu4WVEsPRmwTgbAsIbIUOhKqsCoH3FTRmSqkdQvAQFoG9ukq0F2zoL
 BxnNMyPPMnxBYEcEWoCHLvcKJ6qsWMmv+T/P/bczRxoKjMnCY=
X-Received: by 2002:a05:6000:250c:b0:437:711c:8754 with SMTP id
 ffacd0b85a97d-43958df14b1mr9207829f8f.7.1771517311656; 
 Thu, 19 Feb 2026 08:08:31 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:1503:b900:9c42:5977:662a:d02d])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796ac82f7sm54580031f8f.28.2026.02.19.08.08.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 08:08:31 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org,
	matthew.brost@intel.com,
	sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 7/8] dma-buf: use inline lock for the dma-fence-array
Date: Thu, 19 Feb 2026 17:07:10 +0100
Message-ID: <20260219160822.1529-8-christian.koenig@amd.com>
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
X-Rspamd-Queue-Id: DD714160864
X-Rspamd-Action: no action

Using the inline lock is now the recommended way for dma_fence
implementations.

So use this approach for the framework's internal fences as well.

Also saves about 4 bytes for the external spinlock.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Reviewed-by: Philipp Stanner <phasta@kernel.org>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/dma-buf/dma-fence-array.c | 5 ++---
 include/linux/dma-fence-array.h   | 1 -
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
index 6657d4b30af9..c2119a8049fe 100644
--- a/drivers/dma-buf/dma-fence-array.c
+++ b/drivers/dma-buf/dma-fence-array.c
@@ -204,9 +204,8 @@ void dma_fence_array_init(struct dma_fence_array *array,
 
 	array->num_fences = num_fences;
 
-	spin_lock_init(&array->lock);
-	dma_fence_init(&array->base, &dma_fence_array_ops, &array->lock,
-		       context, seqno);
+	dma_fence_init(&array->base, &dma_fence_array_ops, NULL, context,
+		       seqno);
 	init_irq_work(&array->work, irq_dma_fence_array_work);
 
 	atomic_set(&array->num_pending, signal_on_any ? 1 : num_fences);
diff --git a/include/linux/dma-fence-array.h b/include/linux/dma-fence-array.h
index 079b3dec0a16..370b3d2bba37 100644
--- a/include/linux/dma-fence-array.h
+++ b/include/linux/dma-fence-array.h
@@ -38,7 +38,6 @@ struct dma_fence_array_cb {
 struct dma_fence_array {
 	struct dma_fence base;
 
-	spinlock_t lock;
 	unsigned num_fences;
 	atomic_t num_pending;
 	struct dma_fence **fences;
-- 
2.43.0

