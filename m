Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wDfcDfkGi2kdPQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 11:22:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C21AB119980
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 11:22:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2A6910E548;
	Tue, 10 Feb 2026 10:22:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VJwejGYA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D17FD10E544
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 10:22:41 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-481188b7760so38536175e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 02:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770718960; x=1771323760; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T37NO9UEmIhobl9HkIgJO4B/gLXZ/gygJYg11TDr05c=;
 b=VJwejGYAO2xC1XHQaZPgYaOxBleemLnxg4LmcUxk6yllvxbyCykHTuaxzYgPgrfM9I
 n6KofJjewVe7rYokX0BVKxNPG8OO2d1uicodza+hO/VFgIPmAErryno66wMv0CmE3Kdd
 zPsMBHNrEqC0qxfQaBxLs+ZoV+f56ztLZmxDxO8oajEp6oD0gxC1E9/Pn5udAjUSS19O
 1JOxRcWrsFUPQwJ0i4JrPGKX96DpLTh7LJyjBiSlnKTFYJqJKjiYKFEJaNubcAw49T6k
 2aUT6zt+IVxPkEMS692DSI2jQtmddl33pV3ff0Ldq/bknF0RnLnMAjFRnzwxZ3HH2ZU+
 GBpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770718960; x=1771323760;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=T37NO9UEmIhobl9HkIgJO4B/gLXZ/gygJYg11TDr05c=;
 b=cZF8m70vCCqGdJhsNxg3qxV0jS0U05I+co+4b/EgxO+rmbMLOX9JkyukYZS709yrnS
 TpvzUjJj6O/AXF8tENjlxN73umLHJ4WEDvMAcy8ps9X51O4UbnH2gOOiUZWEDQJUyjM8
 hAEUjzwuQR1GJIVEwiYNiRyrrOS45jLjWF6yE++lvm+pHXI2lgk5MxGcAVYy4niPWXw4
 VmydR85C1W9vFCahYNs2X5V4Elx8bLrWfqoTJ/jUIQhxZCzH5DaOSaLmJ4AFL+y4xbNs
 1mC/FI1e3JSBOf6+B+/u60JbPvU6HEnzceNrhFAfqn3RtLy6c1lnZZM1LLjP4s2dR3Qt
 U6nw==
X-Gm-Message-State: AOJu0Yymwl++HpBpG2W7aRYWrfxVFyEVXYZvnVXxmkn74uG+/DHr04h7
 q7JF7XXtzgd7Gr/1np3+9zqdj5RYUkeFmMxKTxEY+AM8q0bTTNETOaMq
X-Gm-Gg: AZuq6aIVrU1a2ThPxxSkSc3ClsL4jyWf7KDnspyTi3GxG+8ev+VhwsDB/905AypfMXs
 XfYXaAvy3RXveHPigAZj4uYmclY3Lu3bIepJkJU+suT4cz2Rt8nQv1bLD/QC6Xnlo++eepkToDa
 BoGEvkFVbDEEyaNYDy+Tha/Edi7NeEJxPBtaR+uUM66O4NKPtObSOnPNgylg4A4sVb5s1gMu2np
 Pfpdm02TUrl1B3Ig2sPUsx1WQlK/yf/Zz/04vWbSUSHkGaHLOeNhP9gjFRQC/Un9HrYVxTf1gOZ
 LtySZdkutCp3MZIjRoU+0nOTlZLNoMN1qlMM7/BwHXmsraoivWk+DbBlQkorKkgecdZNUVYlbSO
 hEwSuYMM2kQ1qCKU1+t9TDRSHLLJOdzMZhVRk4q3Zyn5piXDIFIvLzuZoV/AaxoTr6myXwlgcll
 XyVlNQIqjEnkRf8/iJLLQDXGyrUZH+PNRmAr3Y
X-Received: by 2002:a05:600c:3582:b0:480:3230:6c89 with SMTP id
 5b1f17b1804b1-48320933594mr235144105e9.12.1770718960285; 
 Tue, 10 Feb 2026 02:22:40 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:152a:6000:83ca:11f0:7e35:a75d])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d5d8ebfsm81549605e9.2.2026.02.10.02.22.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Feb 2026 02:22:39 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org,
	matthew.brost@intel.com,
	sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 6/8] dma-buf: use inline lock for the stub fence v2
Date: Tue, 10 Feb 2026 11:02:01 +0100
Message-ID: <20260210102232.1642-7-christian.koenig@amd.com>
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
X-Rspamd-Queue-Id: C21AB119980
X-Rspamd-Action: no action

Using the inline lock is now the recommended way for dma_fence
implementations.

So use this approach for the framework's internal fences as well.

Also saves about 4 bytes for the external spinlock.

v2: drop unnecessary changes

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Reviewed-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/dma-buf/dma-fence.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index 1833889e7466..541e20aa4e6c 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -24,7 +24,6 @@ EXPORT_TRACEPOINT_SYMBOL(dma_fence_emit);
 EXPORT_TRACEPOINT_SYMBOL(dma_fence_enable_signal);
 EXPORT_TRACEPOINT_SYMBOL(dma_fence_signaled);
 
-static DEFINE_SPINLOCK(dma_fence_stub_lock);
 static struct dma_fence dma_fence_stub;
 
 /*
@@ -123,12 +122,9 @@ static const struct dma_fence_ops dma_fence_stub_ops = {
 
 static int __init dma_fence_init_stub(void)
 {
-	dma_fence_init(&dma_fence_stub, &dma_fence_stub_ops,
-		       &dma_fence_stub_lock, 0, 0);
-
+	dma_fence_init(&dma_fence_stub, &dma_fence_stub_ops, NULL, 0, 0);
 	set_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
 		&dma_fence_stub.flags);
-
 	dma_fence_signal(&dma_fence_stub);
 	return 0;
 }
@@ -160,11 +156,7 @@ struct dma_fence *dma_fence_allocate_private_stub(ktime_t timestamp)
 	if (fence == NULL)
 		return NULL;
 
-	dma_fence_init(fence,
-		       &dma_fence_stub_ops,
-		       &dma_fence_stub_lock,
-		       0, 0);
-
+	dma_fence_init(fence, &dma_fence_stub_ops, NULL, 0, 0);
 	set_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
 		&fence->flags);
 
-- 
2.43.0

