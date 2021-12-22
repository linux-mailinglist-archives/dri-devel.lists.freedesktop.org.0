Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4918747CE45
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 09:29:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EADE61126E3;
	Wed, 22 Dec 2021 08:28:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA9E710F4D9
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 08:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640161730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3N2KnVsfLEPnGk4GM83SnUnjHj7nisH0v3Qa0ml2DP8=;
 b=OZxvDLZ9JbowHoXzfmbAS0wwr1+gCbpvWuGqHo97/yJhkYwoMUWQvTZMqcicnTRVTBDRr6
 Z9bGXFvYqlQilRp2506LKb1EE5qhLKi951ZZiZKw1ypHYp34qXJusuXtugGrTpPhXrTbCD
 1+bVeXt8KRPqTQl09JXmQjsTYjraVsw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-622-nxJoBZhfOOiAAzrCv2L35Q-1; Wed, 22 Dec 2021 03:28:49 -0500
X-MC-Unique: nxJoBZhfOOiAAzrCv2L35Q-1
Received: by mail-wr1-f70.google.com with SMTP id
 h12-20020adfa4cc000000b001a22dceda69so520640wrb.16
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 00:28:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3N2KnVsfLEPnGk4GM83SnUnjHj7nisH0v3Qa0ml2DP8=;
 b=qM/DWyCbQaKXaqV8rcUW1GyYriea+Ls8Nj02Q+7TE33Q+TJ23Qsg7lISWJWqZqEhMY
 Qqcz83yJi7i/qWsA5NbBnu51PEngYj8ZX9TOewySimB0EOtafd8elxBQC8xtPF+kekP1
 IRGa0r9sivuCA9VuTQcAFn2m0Q2M/fZiCQrSqdPFukUzGGnuXCALMUUXaQxw4bMbsgq9
 mknHtZxOI/NXXXIAoYjsFYpRA4aAqEEvEFFW8soh7fSHPvJ1QmR/TZz0oQuVoo1GkKDB
 q50UhRH5xi7N7weiNp8CkRw+Uc5q1Uue1X0vigRbqb096LVLUIJKVO3c16HrzVOqi+3Z
 1BHg==
X-Gm-Message-State: AOAM532gArwCc1CEdpQ7aJXp2plUKKG8ZPQrP0bhgRYpXSnSt9hi14OW
 uZ+VdS/QbtANWcLYw8utapMZ4imEJnUCcO6vUTroAJBK/zldh8h6PxOf38G+GtFZPVSjLRieJU0
 v1ontwQPhlEYpH7fSaRBFiTs11v0l
X-Received: by 2002:a05:600c:2119:: with SMTP id
 u25mr97754wml.93.1640161728594; 
 Wed, 22 Dec 2021 00:28:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyclg3C9m1lfpdHzwWRKr1jtDWrqzNKG6YD/sARAOTo22q6Tb8b2/EF4W39n16Lc2X5xTgEsA==
X-Received: by 2002:a05:600c:2119:: with SMTP id
 u25mr97738wml.93.1640161728427; 
 Wed, 22 Dec 2021 00:28:48 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id m17sm1247080wrz.91.2021.12.22.00.28.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 00:28:48 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 07/10] drm/imx/dcss: Replace module initialization with DRM
 helpers
Date: Wed, 22 Dec 2021 09:28:28 +0100
Message-Id: <20211222082831.196562-8-javierm@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211222082831.196562-1-javierm@redhat.com>
References: <20211222082831.196562-1-javierm@redhat.com>
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
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 David Airlie <airlied@linux.ie>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace module_platform_driver() with drm_module_platform_driver(). The
DRM macro respects drm_firmware_drivers_only() and fails if the flag has
been set.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Lucas Stach <l.stach@pengutronix.de>
---

(no changes since v1)

 drivers/gpu/drm/imx/dcss/dcss-drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/dcss/dcss-drv.c b/drivers/gpu/drm/imx/dcss/dcss-drv.c
index 8dc2f85c514b..24147ee7080e 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-drv.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-drv.c
@@ -6,6 +6,7 @@
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/platform_device.h>
+#include <drm/drm_module.h>
 #include <drm/drm_of.h>
 
 #include "dcss-dev.h"
@@ -131,7 +132,7 @@ static struct platform_driver dcss_platform_driver = {
 	},
 };
 
-module_platform_driver(dcss_platform_driver);
+drm_module_platform_driver(dcss_platform_driver);
 
 MODULE_AUTHOR("Laurentiu Palcu <laurentiu.palcu@nxp.com>");
 MODULE_DESCRIPTION("DCSS driver for i.MX8MQ");
-- 
2.33.1

