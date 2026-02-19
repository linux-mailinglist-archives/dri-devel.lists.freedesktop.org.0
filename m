Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGNZFoc1l2kCvwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 17:08:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F280016085D
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 17:08:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B284010E70E;
	Thu, 19 Feb 2026 16:08:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Rsa0XiI0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B80C10E709
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 16:08:32 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-43621bf67ceso792298f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 08:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771517311; x=1772122111; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/+0DKumpevcDFDLkmeoW4poNM+E3SoCT3N9QX32xG/4=;
 b=Rsa0XiI0yMqhX8ie4TdWfGyKVnWaVVLwon2IzIaWdnFEw7zZqMA5JbeuF89DLaBTfW
 usnzmaykbn7eZ19hAleVlnxcUjWK/Nefj2v0/RV5OHfK9HlKMtOJWen2yYUuDw3h1svI
 emBX/FRYtdU1HBodatlZGOGJQeySTkY0CAWOv82tGge6SKdckV06nnX0TJMEV59APnqK
 b4JR9R7J8w/sQvR4R6JhlKJwcPPwgD7S/ZOtjHDkA1ibRTMdLEq90nSZDKMxla04L+3g
 QcRS+xVbiOYyWk0XNH6z8kC9LTeyFfkbC/twQzYc2EHskalYW/YcYLTUgBP1yU8OZmDQ
 qENA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771517311; x=1772122111;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/+0DKumpevcDFDLkmeoW4poNM+E3SoCT3N9QX32xG/4=;
 b=kCX/g2Bzvg2JuOSYdwnbPwjHOHfgHHxut2XWt4H3D5qK8a+N6eVMmu30qDeSXRxF/M
 hFUpaTrNVKb/UE/sWdmYv9UD7QikmtXM5pMIYYgpR2n71dVj+dk75qCqvyL4I0a8Ui+s
 fixFTojUlPf7lqaSCVcbjZ0OIG8/BQUxDbbQrT4qXymz7GrB8sxcFBeitjKj646vRzfk
 cOp3da35wxLjbrlUti4VjAYyjxrAC2Ewj49CI/bAX/e7sk5FeLivnVpbxQA6AQVvCBc2
 F2keplWktj+QOmUMwLGQpC3/RyWMgiQVf9k6EYbQer56z02EiNYM4SzsU1fAjVC/z4xX
 zGUA==
X-Gm-Message-State: AOJu0YwJr7SLWuKvdgSs9IsafC6mwVB5RHvAkhvga5UaDlQ+WyHQ0j9M
 SjirFjJXilXJ656zG8L8jweDwd2i9QLT8FbOxTamWBRCTBXM1adNkef0
X-Gm-Gg: AZuq6aKe7nto8WUTefpwVm+It+LZpQjTlmtET3ltlZ2F6h9zAC58QJeQ78ShMzFb9Zu
 lIHt52pKJABk59o493+EptUuv6CY4eohBtNtPtAQhXP1iNkXsbDzuHIxpvfxkALLjAUH/Y0yhWg
 PY8LQPpRf+/zgTe8dpWND0zr8bN/58gzwwMe7oIyft23tUkqGjmlpPsw5+Ipl3QmQNp0aPhwgFV
 aOvKCm3irWk0qntqBNL2zLroxWCdOYEQhppzY4xtl4TyiD47TIOgx2XdV5MB4O7g9BlDwucx1Eh
 Li2hdP9hXLeu02odFRDPGELU7q+f4TT1eOLwflSqXGL95Ma99R/WsM78epWI+/jI8BC4h2ssO8A
 TetJ7dtkvuWJYoVlDPaN5t3ahmteCgBJGJjJR8IJLIRWz7rdvpm/0qWENhd0uDtE4dm689GRMQb
 p8hR/hA3bk5OXXMm2jeRVffUJznKYajSyw/lX9
X-Received: by 2002:a5d:5d89:0:b0:437:9d2f:8bf1 with SMTP id
 ffacd0b85a97d-4379db8cdf6mr37041945f8f.38.1771517310937; 
 Thu, 19 Feb 2026 08:08:30 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:1503:b900:9c42:5977:662a:d02d])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796ac82f7sm54580031f8f.28.2026.02.19.08.08.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 08:08:30 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org,
	matthew.brost@intel.com,
	sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 6/8] dma-buf: use inline lock for the stub fence v2
Date: Thu, 19 Feb 2026 17:07:09 +0100
Message-ID: <20260219160822.1529-7-christian.koenig@amd.com>
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
X-Rspamd-Queue-Id: F280016085D
X-Rspamd-Action: no action

Using the inline lock is now the recommended way for dma_fence
implementations.

So use this approach for the framework's internal fences as well.

Also saves about 4 bytes for the external spinlock.

v2: drop unnecessary changes

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Reviewed-by: Philipp Stanner <phasta@kernel.org>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/dma-buf/dma-fence.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index 39f0a4d08a2d..133cb9033b2c 100644
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

