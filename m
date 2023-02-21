Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC8269DD51
	for <lists+dri-devel@lfdr.de>; Tue, 21 Feb 2023 10:52:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A68B510E152;
	Tue, 21 Feb 2023 09:52:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0963A10E152
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Feb 2023 09:52:12 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id o16so4253313pjp.3
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Feb 2023 01:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I+ZwZOlvy1Ieyd+NawnN26j/EK/CvIkDa4Muyk3m0b0=;
 b=daZg1Pec7EJrMORTMITKYWij1J4BgliqjsZvb3TbYCCLcJJYZeZTMDf99ihvRH/kTf
 qxVIbEHtaec6WttYcZTg4c0AYs6bRMwz5JsRVbGRpthUOwl5yb6srFbp+pgjSrWwn4nv
 0rSdKxM9oSYymDaRhj4yMXFEWlGma1u8CDn2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I+ZwZOlvy1Ieyd+NawnN26j/EK/CvIkDa4Muyk3m0b0=;
 b=lOD+sJs5PBD+lJFcUaseSf2PbBr7PXzlBv2GdtSqPunYX1bSHmWCxb8Ku6DMbLiiTW
 q2tg5NRrNWV8mRpvrkCDlr+TbNW0PWOHbMBSYfC9s0AfOiJ59wtbFGSt1C8LLdxLLWuj
 7WDRARBtc5fQyh47fNdIUfeGYys3Xuu9UhfOi9VtGeyTGBJCaSWe8jCzrEZZbcwkHCZE
 R9jHjjcrz5z/31P3efL0mkhPl2xCoJKrQmCIPYEKyqu65IWAFTrVF6C9IUgH4UrCqBGy
 nRgttfwi2//398Rxb6NV8SGhivtykm5chfaJpcJ72R+c3dDbAg/L4vNhwdLZ5k+2rtuw
 KmYw==
X-Gm-Message-State: AO0yUKUOfB8HgBLofhwIv9na3dSCvMPJeMUDj+gkuVtm6Tsxh2iwdpnW
 ab9l0MyR9NP2aFl1Y+ZzA2Fv0A==
X-Google-Smtp-Source: AK7set8HfGPAaKpQmAs84raUeV4ejCG0h7+PitATt7AQBNDfQ8PcDz5YsTFC935Sjmq3p9k0M4//0g==
X-Received: by 2002:a05:6a20:429a:b0:c0:c9b8:64 with SMTP id
 o26-20020a056a20429a00b000c0c9b80064mr5162345pzj.17.1676973131621; 
 Tue, 21 Feb 2023 01:52:11 -0800 (PST)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:a1f5:f58d:584e:5906])
 by smtp.gmail.com with ESMTPSA id
 t25-20020a656099000000b004eca54eab50sm3524918pgu.28.2023.02.21.01.52.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 01:52:11 -0800 (PST)
From: Pin-yen Lin <treapking@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Prashant Malani <pmalani@chromium.org>, Benson Leung <bleung@chromium.org>,
 Guenter Roeck <groeck@chromium.org>
Subject: [PATCH v12 09/10] drm/bridge: it6505: Fix Kconfig indentation
Date: Tue, 21 Feb 2023 17:50:53 +0800
Message-Id: <20230221095054.1868277-10-treapking@chromium.org>
X-Mailer: git-send-email 2.39.2.637.g21b0678d19-goog
In-Reply-To: <20230221095054.1868277-1-treapking@chromium.org>
References: <20230221095054.1868277-1-treapking@chromium.org>
MIME-Version: 1.0
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 linux-acpi@vger.kernel.org,
 =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>, chrome-platform@lists.linux.dev,
 Allen Chen <allen.chen@ite.com.tw>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>,
 Pin-yen Lin <treapking@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace the spaces with tab characters in the Kconfig file.

Signed-off-by: Pin-yen Lin <treapking@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

---

(no changes since v10)

Changes in v10:
- Collected Reviewed-by tag

Changes in v7:
- New in v7

 drivers/gpu/drm/bridge/Kconfig | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 12e8f30c65f7..28dc7711bf5f 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -74,19 +74,19 @@ config DRM_FSL_LDB
 	  Support for i.MX8MP DPI-to-LVDS on-SoC encoder.
 
 config DRM_ITE_IT6505
-        tristate "ITE IT6505 DisplayPort bridge"
-        depends on OF
+	tristate "ITE IT6505 DisplayPort bridge"
+	depends on OF
 	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_HDCP_HELPER
 	select DRM_DISPLAY_HELPER
-        select DRM_DP_AUX_BUS
-        select DRM_KMS_HELPER
-        select DRM_DP_HELPER
-        select EXTCON
-        select CRYPTO
-        select CRYPTO_HASH
-        help
-          ITE IT6505 DisplayPort bridge chip driver.
+	select DRM_DP_AUX_BUS
+	select DRM_KMS_HELPER
+	select DRM_DP_HELPER
+	select EXTCON
+	select CRYPTO
+	select CRYPTO_HASH
+	help
+	  ITE IT6505 DisplayPort bridge chip driver.
 
 config DRM_LONTIUM_LT8912B
 	tristate "Lontium LT8912B DSI/HDMI bridge"
-- 
2.39.2.637.g21b0678d19-goog

