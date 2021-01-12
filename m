Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDDE2F4636
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 09:22:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 550EA6E114;
	Wed, 13 Jan 2021 08:21:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2C0089D46
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 18:14:52 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id b26so4756908lff.9
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 10:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NQd3TCvrr2TP4Frx3nhwn9PTWSRPzGosIJsNeSPerMA=;
 b=huQskgPf8fX+bWVYEDXOnmdO8Kd5bVKMJgzDd+b7Hoc1bGLNr8/e24WpMesxNuzWdV
 l2BbKE7djqjRJUCbpEgeDdF2QlYdUI47ShsvutrpFxtgFMDwPGGMxPMqqG8IhPlpYrdq
 d/bA3y3LSzekrcXhf308TTnNrHy9wbcbTe54AKrbgFIVCM+WRhZq5YMj3SHkqyJ+X9Vt
 4HxpPIULU5eEs1yq7HMSPD1ulrVwcspTn2IJT/LMeEx3uYJu9v3S6au1Siv9L1/rjSpj
 hhPkHLStIGlLOyUM5Ahm+yI2PrY76BVTr7Hyi/cAL5RiHr1HklIW4RnWrz6rM6ZI5lhD
 1cKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NQd3TCvrr2TP4Frx3nhwn9PTWSRPzGosIJsNeSPerMA=;
 b=nMUaWFeLqQ9Rkueztd6Ji8vap1I+yJgiX7zxw3lqPhoY1TMAGJiDNvoK3knomqjVSA
 gKiDhxGu01MEuVAD2VcG4arBdIUm6nBiqdM/sSd5D7/5kxXTlueSpim/IQZCOO/2Qak8
 Iq7y2Nh5JPD90Wi6FvK2W8tbGneBoC6BZ9GkMtzhbsglxVcJzhWA2TRMSTa4bud5m3l1
 W5PxVbvQwzo04MXbqwuLnj+wXDcD1X5dSuGSDEZIodtvLqHyQn58nQgkbKD1UkqYHGfe
 bG/Oou9yetpPSG9ZYzMYzurrZonoCdCy/15Txt0rsgm/lphkbK4vXfFebv9Zsvyu0TRk
 /mFw==
X-Gm-Message-State: AOAM531Pfp/61G40oH4VDWwlDFDMR0qeT4yod0CRBpq8uKJT4pwhyGDp
 Y63U26FaaPKeCJ5VM3uC7Oc=
X-Google-Smtp-Source: ABdhPJyFAlrix7w6midQ1sAuu83XXb7Qxyzp6UuQZp5EYIfcA50sPOGdP6bvIP6jvffVN28kmG6j8g==
X-Received: by 2002:a19:c158:: with SMTP id r85mr60609lff.405.1610475291381;
 Tue, 12 Jan 2021 10:14:51 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.gmail.com with ESMTPSA id r8sm417420ljd.140.2021.01.12.10.14.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 10:14:50 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mikko Perttunen <cyndis@kapsi.fi>,
 Anton Bambura <jenneron@protonmail.com>
Subject: [PATCH v1 1/3] drm/tegra: dc: Enable display controller driver for
 Tegra114
Date: Tue, 12 Jan 2021 21:14:19 +0300
Message-Id: <20210112181421.21293-2-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112181421.21293-1-digetx@gmail.com>
References: <20210112181421.21293-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 13 Jan 2021 08:21:20 +0000
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Display controller driver isn't listed as a DRM sub-device for Tegra114,
thus display driver isn't loaded on Tegra114. Enable display controller
driver for Tegra114 SoC.

Tested-by: Anton Bambura <jenneron@protonmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/drm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 1472042da2a7..e24e05a47197 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -1315,6 +1315,7 @@ static const struct of_device_id host1x_drm_subdevs[] = {
 	{ .compatible = "nvidia,tegra30-hdmi", },
 	{ .compatible = "nvidia,tegra30-gr2d", },
 	{ .compatible = "nvidia,tegra30-gr3d", },
+	{ .compatible = "nvidia,tegra114-dc", },
 	{ .compatible = "nvidia,tegra114-dsi", },
 	{ .compatible = "nvidia,tegra114-hdmi", },
 	{ .compatible = "nvidia,tegra114-gr3d", },
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
