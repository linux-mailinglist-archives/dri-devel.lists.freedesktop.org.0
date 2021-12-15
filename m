Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F97474FE3
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 02:02:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2615D10E1A6;
	Wed, 15 Dec 2021 01:01:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAF9F10E155
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 01:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639530075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=egd8kr8D5VITAG77xs5mGgXddS6XZa0CNEo6AVoMvtE=;
 b=OEm+QfXuq3p/bwn96XufuozggecGUY2UqZS5sWnKKyt5BD0bj/Nyb+s3u8wQC08qymdYE9
 OWBaj9GPNHhDH2Rkk0LWMAEATE2smRavltO3cPIk/mkT6PNm4/ol8fZ+x0uzlG0VDtgOX1
 pvFmxmiZw199+G1U7bA9Rq+xdgIsFL4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-336-N--SMp5lM8u7laQ8v4Idzg-1; Tue, 14 Dec 2021 20:01:13 -0500
X-MC-Unique: N--SMp5lM8u7laQ8v4Idzg-1
Received: by mail-wr1-f72.google.com with SMTP id
 m12-20020adff38c000000b001a0cb286eacso1154097wro.9
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 17:01:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=egd8kr8D5VITAG77xs5mGgXddS6XZa0CNEo6AVoMvtE=;
 b=sNG4GDMsgVmCveVrsWp1QwwSMQs160xMIcezBxuYxGT+0mfXzv0pGohFwUlT+FEmlW
 W8/7H7ZubnUQOrzRM6fgQQs+diHGKZ1CfUoJv34MfLLiXtywjeMCRvreCgAZQDhyaBDf
 TyJQJFqIIDEKZ214SDh3JHseXXTdGmvTK6OZul4UjeoSwMb5qucv2pc2fOQE0wWf6gmW
 LkJS9BCOYW5/A2COohtyIqjE0iAcRaSwxc+YcHPxPy+pNRvR1EWA1CnOTeJpZmURKNQz
 yVfRNnoB84oyIoGvmTV28b32hFlk4gUeNCc12NbT7+htUzGPTPC0my3lrosnQconU+aJ
 R5jA==
X-Gm-Message-State: AOAM531QXisYXBzXuJFdxmMdFGS41b4M3sODpv5sigQRKsz+qeof+VIV
 ToOpj9IVTsdpNzApmC6CzIel8LFFIkk5UDifIaZL1iqBS6dHsdhQiNpXbWO1fW2PWxC4LVSEfiO
 UXJmEsuG0z8jbsVsefu5qWf5k9pjh
X-Received: by 2002:a5d:50c7:: with SMTP id f7mr2078110wrt.327.1639530072721; 
 Tue, 14 Dec 2021 17:01:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz9M4WdmFvo/zg8Ix3tcksV20w3c47J2dT2pX0KN0YMYhw/R4HIWcodbzHQHCqkqo3USOkChA==
X-Received: by 2002:a5d:50c7:: with SMTP id f7mr2078097wrt.327.1639530072490; 
 Tue, 14 Dec 2021 17:01:12 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id o64sm334543wme.28.2021.12.14.17.01.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 17:01:12 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 26/60] drm: mxsfb: Add support for the nomodeset kernel
 parameter
Date: Wed, 15 Dec 2021 01:59:34 +0100
Message-Id: <20211215010008.2545520-27-javierm@redhat.com>
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
Cc: Marek Vasut <marex@denx.de>, Javier Martinez Canillas <javierm@redhat.com>
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

 drivers/gpu/drm/mxsfb/mxsfb_drv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index 86d78634a979..1359fc99c6f0 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -342,6 +342,9 @@ static int mxsfb_probe(struct platform_device *pdev)
 			of_match_device(mxsfb_dt_ids, &pdev->dev);
 	int ret;
 
+	if (drm_firmware_drivers_only())
+		return -ENODEV;
+
 	if (!pdev->dev.of_node)
 		return -ENODEV;
 
-- 
2.33.1

