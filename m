Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDE5660DCE
	for <lists+dri-devel@lfdr.de>; Sat,  7 Jan 2023 11:23:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EAFE10E19E;
	Sat,  7 Jan 2023 10:23:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BAA510E1A4
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Jan 2023 10:23:30 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id c4so4302480plc.5
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Jan 2023 02:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jPjxduVrJWs9QjkeXTkdGS+Nv07pQY0+SOufeW3dySQ=;
 b=VAby6WZCH1RNyfPHYEYvwOnU7lAtqP30DQd34eP7184DCo5NTNph2MXVKKJADin8fF
 N+pKqrVdarUq6FQa6NSx46KqcuCnAGYNfd/79JPb255Feo/8qiMy96S/KSphN9jXx1Qz
 qwHVWpgtdLdEJz1rIW01zxOZcF5lNSBSaEMHM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jPjxduVrJWs9QjkeXTkdGS+Nv07pQY0+SOufeW3dySQ=;
 b=a67j1dXIr32s+ueTWQZTzgd53fVWlL1TvC5d1On9WsX8h2YkHRlldblm5/Is9/DpWr
 uFOlnr8oTnBrrqdEy03zR/BSvM7xogxetgeU9iQeGkASvUO0vZAVBt6J1mNdJ3qpDmt9
 xozx8H8lSLxgpDJgQLGTGdxbd0zub/giQl7a1aMptH1xaq9/uQFBEx0P5z6rCPmaqaFP
 s1cN//xiJYnDjlsjARE+9K7w0lUy+YcF274XIvH+8qDmkV9DN/LvSwo6xiShrTXAl6ab
 gwBe5FbJZA5NcyYwmO15yAPaOp/mo9DJ1GUlg4En6HkXu/ns9iiY3zNzbKV/OzNiC98Z
 hcEA==
X-Gm-Message-State: AFqh2kpKdbdcuxW68Qt2CSogiFHuzT3EAh6TMDQj/Nm3jeiDcXbGIBwN
 G6Mi61CojZtad/q5xx623CVBxA==
X-Google-Smtp-Source: AMrXdXvf1y9sqiC9xkGXKV+FqQL+flHd2zaO1f5iJNKwxz1hCAKSBvA6HdvYG2vX0MeonhOSfTnAAg==
X-Received: by 2002:a17:903:2411:b0:192:d9dd:167d with SMTP id
 e17-20020a170903241100b00192d9dd167dmr17302313plo.43.1673087009918; 
 Sat, 07 Jan 2023 02:23:29 -0800 (PST)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:180d:95e8:f4:84fb])
 by smtp.gmail.com with ESMTPSA id
 b1-20020a170903228100b001892af9472esm2366362plh.261.2023.01.07.02.23.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 02:23:29 -0800 (PST)
From: Pin-yen Lin <treapking@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
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
Subject: [PATCH v8 8/9] drm/bridge: it6505: Fix Kconfig indentation
Date: Sat,  7 Jan 2023 18:22:30 +0800
Message-Id: <20230107102231.23682-9-treapking@chromium.org>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
In-Reply-To: <20230107102231.23682-1-treapking@chromium.org>
References: <20230107102231.23682-1-treapking@chromium.org>
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
Cc: Marek Vasut <marex@denx.de>, chrome-platform@lists.linux.dev,
 linux-acpi@vger.kernel.org,
 =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>, devicetree@vger.kernel.org,
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
---

(no changes since v7)

Changes in v7:
- New in v7

 drivers/gpu/drm/bridge/Kconfig | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 57946d80b02d..737578dd57ed 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -85,19 +85,19 @@ config DRM_FSL_LDB
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
2.39.0.314.g84b9a713c41-goog

