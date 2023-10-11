Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F057C524D
	for <lists+dri-devel@lfdr.de>; Wed, 11 Oct 2023 13:41:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5EAE10E71C;
	Wed, 11 Oct 2023 11:41:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D67E010E71C
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 11:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697024501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8NURkiBAbS6tTinRtwOYWNtz0h6Ztp9Eip3YWpE10Qw=;
 b=Kko4B7XV5o6WAN7gQn1CJ4yGT0mWZnZU4BjafXcsd5Kvcv8UpX30HKSE5YwYVm8gmYBAgC
 e/PYKeNggeo8VKtuFzwAv7oXwTWZHgv6Yq2vGJ/HPszjp00hO24f0lsCQimpoThrmFDrMS
 5LesvTPkHjNJeJbPeHELWIedTmda6pE=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-597-QXsSJSKtNoeZm_Wmg7N-Rg-1; Wed, 11 Oct 2023 07:41:40 -0400
X-MC-Unique: QXsSJSKtNoeZm_Wmg7N-Rg-1
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7741abfbe9fso132965485a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 04:41:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697024500; x=1697629300;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8NURkiBAbS6tTinRtwOYWNtz0h6Ztp9Eip3YWpE10Qw=;
 b=FVL+Ar4bq32KMFpwhXGE8RcRNW5Zp3CXbBjqvBD7j11QrIlGr1pII7zlAJ+ROMQjVq
 vlDK0ewRcpbKWFwOpYe61u3F/dAGq3YRxkepysPAVOKkMCM8Pyd+7zH3EQSpiiiZPiGv
 kUXfZoZxwH8PFcNii0qjN+m3kKrEbqaOyn59L/4omZ5PptCxr3zg528rcVaGvntZcDcg
 t7myPrAMdyWDQ9bQMRcjf7elhzd6nqw9IRr+0DIdUkUOm9jIHwDEcI3qdBGmNfXmpO/M
 hDmn8JCi8imWEk/dWA+OW/95juX4TnrwfPDLGFxaOJ9XQX06OWDlr6//Ra2CXeG8Rqbp
 +c/Q==
X-Gm-Message-State: AOJu0Yxx9QAoZC0shTqMkmSeDy8+bkAPL6KQJ2Fs9ZBMkIfXajpMKhtQ
 /AfKyKXFKm4vorDiPBksG5Rg13RVz+/AWPVt6R6/K1WQJx+iEXGpPVbW8ptYUpCXScLWcUzAIzn
 wst3tfu13Q5k+jL4r9AKJGLd+oYZB
X-Received: by 2002:a05:6214:c6a:b0:65a:fd40:b79 with SMTP id
 t10-20020a0562140c6a00b0065afd400b79mr23067472qvj.5.1697024500063; 
 Wed, 11 Oct 2023 04:41:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/PJFqEzyZ8u0zaKxnpGRj7gcP1T2JeVyTubg38E45fbagYfNnX/UGlmnBkSjQ63uUN62XNg==
X-Received: by 2002:a05:6214:c6a:b0:65a:fd40:b79 with SMTP id
 t10-20020a0562140c6a00b0065afd400b79mr23067452qvj.5.1697024499781; 
 Wed, 11 Oct 2023 04:41:39 -0700 (PDT)
Received: from kherbst.pingu.com ([178.24.169.250])
 by smtp.gmail.com with ESMTPSA id
 d1-20020a05620a136100b00774309d3e89sm5153179qkl.7.2023.10.11.04.41.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Oct 2023 04:41:38 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/nouveau/disp: fix DP capable DSM connectors
Date: Wed, 11 Oct 2023 13:41:34 +0200
Message-ID: <20231011114134.861818-1-kherbst@redhat.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: nouveau@lists.freedesktop.org, stable@vger.kernel.org,
 Karol Herbst <kherbst@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Just special case DP DSM connectors until we properly figure out how to
deal with this.

This resolves user regressions on GPUs with such connectors without
reverting the original fix.

Cc: Lyude Paul <lyude@redhat.com>
Cc: stable@vger.kernel.org # 6.4+
Closes: https://gitlab.freedesktop.org/drm/nouveau/-/issues/255
Fixes: 2b5d1c29f6c4 ("drm/nouveau/disp: PIOR DP uses GPIO for HPD, not PMGR AUX interrupts")
Signed-off-by: Karol Herbst <kherbst@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c
index 46b057fe1412e..3249e5c1c8930 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c
@@ -62,6 +62,18 @@ nvkm_uconn_uevent_gpio(struct nvkm_object *object, u64 token, u32 bits)
 	return object->client->event(token, &args, sizeof(args.v0));
 }
 
+static bool
+nvkm_connector_is_dp_dms(u8 type)
+{
+	switch (type) {
+	case DCB_CONNECTOR_DMS59_DP0:
+	case DCB_CONNECTOR_DMS59_DP1:
+		return true;
+	default:
+		return false;
+	}
+}
+
 static int
 nvkm_uconn_uevent(struct nvkm_object *object, void *argv, u32 argc, struct nvkm_uevent *uevent)
 {
@@ -101,7 +113,7 @@ nvkm_uconn_uevent(struct nvkm_object *object, void *argv, u32 argc, struct nvkm_
 	if (args->v0.types & NVIF_CONN_EVENT_V0_UNPLUG) bits |= NVKM_GPIO_LO;
 	if (args->v0.types & NVIF_CONN_EVENT_V0_IRQ) {
 		/* TODO: support DP IRQ on ANX9805 and remove this hack. */
-		if (!outp->info.location)
+		if (!outp->info.location && !nvkm_connector_is_dp_dms(conn->info.type))
 			return -EINVAL;
 	}
 
-- 
2.41.0

