Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 191AC474FC3
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 02:01:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EA6F10E14E;
	Wed, 15 Dec 2021 01:01:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E15C510E14A
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 01:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639530060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hlwmMpDs7rI0oeMFDz50CNwBVV8B4o70fliBdr6Ssvs=;
 b=dZG3ugCUngbUsDXW2b7D0jS6elKWME+4CYifQevcJ/u1wjjvy4O38V/SZBQI3rdrVAuNTZ
 d4XiVgbX2qHAVOmh2jZJ3ZPw2zdW3BAyfk6QH7a5Y5TCHD+hUORT4xomf2y/z4w9BSh+EG
 OETs1EvXNjbKGC8xXYkN/M7AXkgSax8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-454-5j3M9PJ6OlSUqrXlwhP4DA-1; Tue, 14 Dec 2021 20:00:58 -0500
X-MC-Unique: 5j3M9PJ6OlSUqrXlwhP4DA-1
Received: by mail-wr1-f72.google.com with SMTP id
 w15-20020adfee4f000000b001a0e51ed4e5so790533wro.3
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 17:00:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hlwmMpDs7rI0oeMFDz50CNwBVV8B4o70fliBdr6Ssvs=;
 b=xa0SOj1RrPhNJg7UyxGvs0TmBunqe2i5o/2aRVLOxRohFBT40mgyd829kHTWsy6Lcr
 HFULiw7PSQAUn53ar6Pi4TJKrRJTCF3xi4FaY2M/7yD6o/qdjneqVAfncKLFX5vScK/E
 ugjNU8+1WgcF/8SxnuTa2lBg2D685VnC/RdRAbmwWCOiLNER0Q7Q/4WQagnsElJa3IzG
 IP1rDwNOdQ/GcW3IP9XavrlKPTuEOQnFUbaeZpyMKR0bJCtVnxw8+P0Nzo0H7jpve6qZ
 L3C6JPopJ40g5XMB3fSU0DO5ZGhM4gJ85PzolHxqxuEk7M0Ou5faSybg1RDyGTYC4JIh
 hOzA==
X-Gm-Message-State: AOAM532B2IjRwnZRl2k9HUVaXLOPsueGUko4GEA1RUjIWENJaiG/T2I8
 n+n7x5peszw4GRrit2UN8V5L29OpYSg6GkZTWyFjfjwItEegek7bche23tFJVZIvGELSGny2cmc
 sntQ4YUJ7T3wRbFjFzpXNggTrIGxx
X-Received: by 2002:a1c:2:: with SMTP id 2mr2292568wma.41.1639530057583;
 Tue, 14 Dec 2021 17:00:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwNXHTo+e2PB/eHuFET+/zbQRmAraTRzbs4BC9O1M1wtzs+H5k80hNY0ix6RAXDNXF/Bpcp6Q==
X-Received: by 2002:a1c:2:: with SMTP id 2mr2292557wma.41.1639530057411;
 Tue, 14 Dec 2021 17:00:57 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id o64sm334543wme.28.2021.12.14.17.00.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 17:00:57 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 09/60] drm/fsl-dcu: Add support for the nomodeset kernel
 parameter
Date: Wed, 15 Dec 2021 01:59:17 +0100
Message-Id: <20211215010008.2545520-10-javierm@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211215010008.2545520-1-javierm@redhat.com>
References: <20211215010008.2545520-1-javierm@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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
Cc: Alison Wang <alison.wang@nxp.com>,
 Javier Martinez Canillas <javierm@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

According to disable Documentation/admin-guide/kernel-parameters.txt, this
parameter can be used to disable kernel modesetting.

DRM drivers will not perform display-mode changes or accelerated rendering
and only the systewm system framebuffer will be available if it was set-up.

But only a few DRM drivers currently check for nomodeset, make this driver
to also support the command line parameter.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
index 660fe573db96..9b9e1b200005 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
@@ -255,6 +255,9 @@ static int fsl_dcu_drm_probe(struct platform_device *pdev)
 	int ret;
 	u8 div_ratio_shift = 0;
 
+	if (drm_firmware_drivers_only())
+		return -ENODEV;
+
 	fsl_dev = devm_kzalloc(dev, sizeof(*fsl_dev), GFP_KERNEL);
 	if (!fsl_dev)
 		return -ENOMEM;
-- 
2.33.1

