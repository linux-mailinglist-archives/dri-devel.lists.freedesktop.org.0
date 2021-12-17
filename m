Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0E04781A1
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 01:39:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D38EA10E2D2;
	Fri, 17 Dec 2021 00:38:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6059F10E216
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 00:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639701500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aro9Nni/tJ9jlKm8kD+solQuJshNFFRMvr/HoiFuQkE=;
 b=MvXTQyMTOs71wQmUDan0Upesb+z0uc5Cx0Ryx4jhE9YfSg0EPDSsSYsv/ataOrBPhftAK0
 5nco0BBnMwp68P2JQ6pXP8p+B3xAgbIg2Ti9XYFbwU8INhe/i3CUTKqBpCGAh2t5CGFsJB
 YbI+Ar5txe114ZVHSt5MB5AVfHXPkPA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-169-IjyU1J8TNg6ISxp5Ja-RkQ-1; Thu, 16 Dec 2021 19:38:18 -0500
X-MC-Unique: IjyU1J8TNg6ISxp5Ja-RkQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 k8-20020a5d5248000000b001763e7c9ce5so138823wrc.22
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 16:38:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aro9Nni/tJ9jlKm8kD+solQuJshNFFRMvr/HoiFuQkE=;
 b=cN/yaXBZEGF6oJghpeno33JBeEzTq46onE2o7msHVUMlPjkkqnzWprrg0OHGP2969A
 /z5RdA38ACQOgmBqIeR99fIzloga7oRviYrUhD2oashlvFQUltPscJ4WEKRANkcY3U8X
 sJgvIwi1pRTL0QwbmdfCLPwW/PGrqhUv2rBJr8OzDVLaRgX/M7hIXB+2GDOqQcqbv+K1
 18LpQCSzZE5Ikqd2XgCFXX0QUrMyJuZTgfXcMZ3CHH8yz9W6ZII485SDE4tyHog+7Ie2
 PW10cM545qyaXtUuUoDjnfVBYrivxrxjx0toOIh9HEmSxSyQ3Fqeqev77PHiv4XYsTK2
 hZrw==
X-Gm-Message-State: AOAM530mRQnvwX3wGmi/07au5uFufD8uOxSm/zmpwO7cKgfHv35P1qSj
 cyjPDx+nZhwViRqqXnkEXl1lm12Pj175ru5BUskuPPjIiKET/MYCmz1C0X0hPl8JFhVPiHhhSlA
 Oyi5+BapuYa1Y+i0SlPEyu1CC7Fi+
X-Received: by 2002:a1c:741a:: with SMTP id p26mr7367087wmc.133.1639701497625; 
 Thu, 16 Dec 2021 16:38:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxBD5MWnCftfU41wLw4KyALiYsF6+lJ+n1/l4WeDW6hQzr2fmxHvIg+BhSFpM7Bahl+mg3bsQ==
X-Received: by 2002:a1c:741a:: with SMTP id p26mr7367075wmc.133.1639701497383; 
 Thu, 16 Dec 2021 16:38:17 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id bg12sm7368433wmb.5.2021.12.16.16.38.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 16:38:16 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 19/37] drm/tve200: Use drm_module_platform_driver() to
 register the driver
Date: Fri, 17 Dec 2021 01:37:34 +0100
Message-Id: <20211217003752.3946210-20-javierm@redhat.com>
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
Cc: Javier Martinez Canillas <javierm@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The macro calls to a DRM specific platform driver init handler that checks
whether the driver is allowed to be registered or not.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---

(no changes since v1)

 drivers/gpu/drm/tve200/tve200_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tve200/tve200_drv.c b/drivers/gpu/drm/tve200/tve200_drv.c
index 7fa71c8bb828..b1c35c13faeb 100644
--- a/drivers/gpu/drm/tve200/tve200_drv.c
+++ b/drivers/gpu/drm/tve200/tve200_drv.c
@@ -266,7 +266,7 @@ static struct platform_driver tve200_driver = {
 	.probe = tve200_probe,
 	.remove = tve200_remove,
 };
-module_platform_driver(tve200_driver);
+drm_module_platform_driver(tve200_driver);
 
 MODULE_DESCRIPTION(DRIVER_DESC);
 MODULE_AUTHOR("Linus Walleij <linus.walleij@linaro.org>");
-- 
2.33.1

