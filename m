Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3529E478178
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 01:38:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40B3210E1F9;
	Fri, 17 Dec 2021 00:38:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC3FA10E1C5
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 00:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639701490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2i+a0Hx2N4MuSgyTPRig6ZtnqKsO/4+K9evEKBHNXQ4=;
 b=HUz5m/U3sKOcoT9V5DJjdWvLS66UvjPZvIKsa9E0/HGAxHzzxcgDMTwUZ3Hl6qftLcLk8G
 K3PqnvVDHcqjg3TbWGgizxXfQnEF7i70KqscZS/hMSnymBjUA56t/6hWPVj0c4jszzGYo3
 DDBnSG5LR7aHyDZECrLmKQe/AMc9RxI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-150-1K1OB9nIP36pxDCZ6O2J6A-1; Thu, 16 Dec 2021 19:38:09 -0500
X-MC-Unique: 1K1OB9nIP36pxDCZ6O2J6A-1
Received: by mail-wr1-f71.google.com with SMTP id
 p15-20020adfaa0f000000b001a240b45c1fso146288wrd.4
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 16:38:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2i+a0Hx2N4MuSgyTPRig6ZtnqKsO/4+K9evEKBHNXQ4=;
 b=59VI2j8cm3IOp+iy1m21KUnaSa4uc5WymFuPNUw1aieoSvJoalIq21JaYHkDN/2dOb
 /Y1KngmqMmKf4QHhzLBe2RjnNiXDK92REJnUlmk/zTqcMoo7cZJk+L/Jb/Xd2D7K4y7T
 8MTw9IW9qolxe6rigBCPyupRqWvOlUZ98FqNYj+AnYyfsU/4i/sD0p54MaSTnfxbSkV7
 LY0X4MfC27inzsxaofTv1pMNLM/FgclK6GBIQ5P4ZvDvJuKtzCvenT3HbrGVcfngwCZa
 AhRY04BTdBBLI6z/pIj5oqjB+Wt5uXZW9bu10rkbOTzjU7ExPxI8t9QG3Gf91Ve05lM4
 ZmPQ==
X-Gm-Message-State: AOAM533IH01t8wxCCV/Fnmq1n3EbUX4TcHogW0QbJyeXu7QecMajCxoW
 dWS+y+y2qDhMM73Cfc230zxTtFGH7HOVvEDwY+2qzehArJ2t0LEKb46gkaAjz6P8hjN+r7mM0ne
 1HpE39jPkv7NNgd1pn7k+Buvr5KdS
X-Received: by 2002:adf:ee47:: with SMTP id w7mr385084wro.368.1639701488362;
 Thu, 16 Dec 2021 16:38:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwYVfZs5fU18IrDElvj2aJ/BiUWFslqZecT53FQv/BKzpw1z6c0hElAqSLMPto0t2VKeJh+zg==
X-Received: by 2002:adf:ee47:: with SMTP id w7mr385080wro.368.1639701488193;
 Thu, 16 Dec 2021 16:38:08 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id bg12sm7368433wmb.5.2021.12.16.16.38.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 16:38:07 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 10/37] drm/imx/dcss: Use drm_module_platform_driver() to
 register the driver
Date: Fri, 17 Dec 2021 01:37:25 +0100
Message-Id: <20211217003752.3946210-11-javierm@redhat.com>
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
Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Javier Martinez Canillas <javierm@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The macro calls to a DRM specific platform driver init handler that checks
whether the driver is allowed to be registered or not.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Lucas Stach <l.stach@pengutronix.de>
---

(no changes since v1)

 drivers/gpu/drm/imx/dcss/dcss-drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/dcss/dcss-drv.c b/drivers/gpu/drm/imx/dcss/dcss-drv.c
index 8dc2f85c514b..f3d2bb07facb 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-drv.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-drv.c
@@ -131,7 +131,7 @@ static struct platform_driver dcss_platform_driver = {
 	},
 };
 
-module_platform_driver(dcss_platform_driver);
+drm_module_platform_driver(dcss_platform_driver);
 
 MODULE_AUTHOR("Laurentiu Palcu <laurentiu.palcu@nxp.com>");
 MODULE_DESCRIPTION("DCSS driver for i.MX8MQ");
-- 
2.33.1

