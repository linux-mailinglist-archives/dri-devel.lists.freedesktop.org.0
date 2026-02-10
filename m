Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yNA5APoGi2kdPQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 11:22:50 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A55B9119987
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 11:22:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10F7B10E549;
	Tue, 10 Feb 2026 10:22:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="T0UFjxZz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FF4110E548
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 10:22:42 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-47ee07570deso35425815e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 02:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770718961; x=1771323761; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8Gle1rSCrgOdmOiKTLZAKAartjs2E9YbHLm7AYnBWog=;
 b=T0UFjxZzvjzrhEB6RMlEvqzJ5bL4KWmI+Omb3YRXoMrTnMSnB1QT6gmjIlEmEaFlkz
 2ng0gxvNdoFMViyB2A/3jhuPun18FToJkpcPRlXCRm0kRaAR5CZVuidwFFiXdIWBFzIh
 /t2vlaVqWcFFkyUN8NzcgWGvYcWgDAX7uPepSdTG5X/3M/QDudqMbF+eS1xhuj65nHvU
 QmZprLaQsNJM1apHvN0jwz9Xjn+HwH6GI/CZHYbRpwSeg6qmkP0K79Ec47hCo+lCFkIH
 5QQswW1SqVbdTbaEgfCxqkht4Fx7krGFBlHF86lnRoKeecZt8mpLPsPX1HG6wcdcSofa
 KK7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770718961; x=1771323761;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=8Gle1rSCrgOdmOiKTLZAKAartjs2E9YbHLm7AYnBWog=;
 b=HSmiZKIfoSn8sZu/sBNU632/FJoBYtz9wXpgaZfgnNjWA7nypEIA2AEwap+cYXOV4m
 6uAIfoCshp7Ikn35OzSNaGkBdDa84z38VrgLJc9IKgSDYZacp40rDMIpY8D3JbE84J/+
 lH8rBi2dRLbMzulrYGZGMDJQsXlsrYrwsiXxXrcIw+LoH3QuFW7DsJNxpizDywf6XnDM
 0bynY8Ztrc3v4coneicoaAMkZEH3lxq7fSF8r6XMoWW+O8EnIUaaOsF1wXKM7H4HjA2O
 ZreUTJfxqg3z1jXUyfkawPGC6HRZHRgq+sgzu5prTlbh+I1EXlwM23SxMKOCxbHDdliV
 Togw==
X-Gm-Message-State: AOJu0Yy/ctCxMwfvy73boj8H5Va0Qjd32DBUp19ORnuGIgFTb9btMAuh
 iz4GqLWwkpVsqnO4GCH1z8oXQgBysfYyyC+5at61Q6xyLhs6ekL+LZEg
X-Gm-Gg: AZuq6aIxohFIHLb4r/OnP8auOIOPCwIaEdbSXWl9g3U0E1SqP0cMLmrNp5uUNVtP6gK
 kYIbUAqnqcmUYS8fkxnlSUZ5Y4s3paL0TBfBjvAMGqME7NEvXAjHCXuzjpB0PixmRCDXdiIs+NK
 78lIjsDlP74iqcK3CIMUNht64VodReaHwPLsq/VCvtJcFLeMJmHWl49nTYqN3xNjTFEeNZOIugz
 mCdvFmnuOeu+aA5FbpZwlYqc+ukS6VtWK1nV0WbLlTAGXCL/z8F1Lt/Y+iq4ERNxu6OJH90Coto
 cq/KFaNdafu3M6JMRzk2hgPPPnGFLCSt3DsUDEn6VN6zj89lHiM9cy5sAlkdXF1kHchemIqfMaP
 EMWJ9g7hhXilmfdl8wMHutPLxmT/d8wHJ4XcfEnFug4uqZqY8qeHIw+NLcUxcZinLGQtCtQaEO7
 nJdBNPpkRmKRHYGSbbSsfKtzU2DtBJJmhTss+KwJlXpVABnFM=
X-Received: by 2002:a05:600c:528b:b0:477:2f7c:314f with SMTP id
 5b1f17b1804b1-483201e25b5mr192551625e9.10.1770718960956; 
 Tue, 10 Feb 2026 02:22:40 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:152a:6000:83ca:11f0:7e35:a75d])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d5d8ebfsm81549605e9.2.2026.02.10.02.22.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Feb 2026 02:22:40 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org,
	matthew.brost@intel.com,
	sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 7/8] dma-buf: use inline lock for the dma-fence-array
Date: Tue, 10 Feb 2026 11:02:02 +0100
Message-ID: <20260210102232.1642-8-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260210102232.1642-1-christian.koenig@amd.com>
References: <20260210102232.1642-1-christian.koenig@amd.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:phasta@mailbox.org,m:matthew.brost@intel.com,m:sumit.semwal@linaro.org,m:linaro-mm-sig@lists.linaro.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[ckoenigleichtzumerken@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ckoenigleichtzumerken@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,igalia.com:email]
X-Rspamd-Queue-Id: A55B9119987
X-Rspamd-Action: no action

Using the inline lock is now the recommended way for dma_fence
implementations.

So use this approach for the framework's internal fences as well.

Also saves about 4 bytes for the external spinlock.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Reviewed-by: Philipp Stanner <phasta@kernel.org>
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

