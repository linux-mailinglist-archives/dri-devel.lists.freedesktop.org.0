Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E12A04781A7
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 01:39:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 199F710E245;
	Fri, 17 Dec 2021 00:38:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43EBC10E2F5
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 00:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639701515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LS45ptuKLtucyzrI9aH/fv6UqLJgOvCJlOd2PAEqfE8=;
 b=SfqwF8GE49BXYLj7tN3oDZLb5U9JM5XR3JZj3YiFOLTGqikT9mEtTc7tC/4ceJddR7v34B
 +gJcBWIgYJciOzxm1b8Kc2feeGUAhD1/vJdchogUFcfp0sMpWyPv3Hn7nJQS63WCI57sSx
 DKhqNzrhm9PjZYVY4o5A2d2StZ2ChSE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-290-TK5IwUQmPvCy61vxPvBRAw-1; Thu, 16 Dec 2021 19:38:34 -0500
X-MC-Unique: TK5IwUQmPvCy61vxPvBRAw-1
Received: by mail-wr1-f72.google.com with SMTP id
 k11-20020adfc70b000000b001a2333d9406so148820wrg.3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 16:38:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LS45ptuKLtucyzrI9aH/fv6UqLJgOvCJlOd2PAEqfE8=;
 b=alYmQEqWyVn2r4Q5D5lYgSPJWuUnJC9eSPanMQ0Mwn56W3Tf1jpDNXEj1O/kH1CcHt
 Rs7hlPJAQ0U2yGeNCdKeHpeLM5ct8oGXTZfYaziV3l9Yb++pnA2jJZYPuFDDH6u9QLOp
 Op7iSS8ipLQ0PMR7mh3oxdbtRP6dUL8QWfrddVoFATgKNzzHtUvBl/StFq4zSPv+ONW7
 PeJl+BVZGu5NSiyB54JXO+BhTh2RFbVO1r2usb+6HSd/BZfFM6EGtlWeajl47vOJ/2tH
 Wy+hwon4qZtzTFhotYbmORTv8oyyav8oXcgnU4G14LzqznZ11D2RwkTz1TWYbovQrl7i
 RO6Q==
X-Gm-Message-State: AOAM532ZUFVo2Mr4sVilSzkAWBWO5Uy9RJtDB2chEdx2dT1JbaaYhmbT
 77Huij/it4gS/25U1c62pkVG6sfinZ+GGj7DsBhMdJSB/jYCzs4RWt5EG8rtI86kVd+mbhErPjj
 0BwMQ3xgDXc5XR6vMK9IQ5flb5Nju
X-Received: by 2002:adf:ed83:: with SMTP id c3mr369003wro.169.1639701512790;
 Thu, 16 Dec 2021 16:38:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzgNRxmXpv8ar/HlM4TfNJSibrarj6nNRlhhEoWvFkpXvNFl1qNA/H5nvze7GA/dpw0kCtyVQ==
X-Received: by 2002:adf:ed83:: with SMTP id c3mr368998wro.169.1639701512577;
 Thu, 16 Dec 2021 16:38:32 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id bg12sm7368433wmb.5.2021.12.16.16.38.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 16:38:32 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 36/37] drm/tilcdc: Add support for the nomodeset kernel
 parameter
Date: Fri, 17 Dec 2021 01:37:51 +0100
Message-Id: <20211217003752.3946210-37-javierm@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211217003752.3946210-1-javierm@redhat.com>
References: <20211217003752.3946210-1-javierm@redhat.com>
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
Cc: Jyri Sarha <jyri.sarha@iki.fi>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Tomi Valkeinen <tomba@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

According to disable Documentation/admin-guide/kernel-parameters.txt, this
parameter can be used to disable kernel modesetting.

DRM drivers will not perform display-mode changes or accelerated rendering
and only the system framebuffer will be available if it was set-up.

But only a few DRM drivers currently check for nomodeset, make this driver
to also support the command line parameter.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

(no changes since v1)

 drivers/gpu/drm/tilcdc/tilcdc_drv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
index cc567c87057d..eee3c447fbac 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
@@ -604,6 +604,9 @@ static struct platform_driver tilcdc_platform_driver = {
 
 static int __init tilcdc_drm_init(void)
 {
+	if (drm_firmware_drivers_only())
+		return -ENODEV;
+
 	DBG("init");
 	tilcdc_panel_init();
 	return platform_driver_register(&tilcdc_platform_driver);
-- 
2.33.1

