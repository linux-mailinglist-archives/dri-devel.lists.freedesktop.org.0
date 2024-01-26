Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CE283DD19
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 16:12:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACC7C10FB5E;
	Fri, 26 Jan 2024 15:12:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 902 seconds by postgrey-1.36 at gabe;
 Fri, 26 Jan 2024 09:12:42 UTC
Received: from mickerik.phytec.de (mickerik.phytec.de [91.26.50.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67E1F10ED4A
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jan 2024 09:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
 q=dns/txt; i=@phytec.de; t=1706259456; x=1708851456;
 h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=44w1Eo7RhlW6nXS4kAM9bhh18vbkIhL0x13ZWpwygyQ=;
 b=LFfwpKA9SmBgFuFZshgLaYZpbu3cL0WgOGget8JdV4wT3XvJn+7ZQfZcHJI+wVJ1
 eEjzo3DsrX6QtGABRUdGgjU7YlJeZBzQims94kD+XpsfPgTROsSrJdPNLSBxUvrc
 mvVb4+bOobmeQcYa8+9mjQv/h211vFOk4QLWw4Wxh04=;
X-AuditID: ac14000a-fadff7000000290d-b9-65b374007dc9
Received: from berlix.phytec.de (Unknown_Domain [172.25.0.12])
 (using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client did not present a certificate)
 by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id A0.F9.10509.00473B56;
 Fri, 26 Jan 2024 09:57:36 +0100 (CET)
Received: from lws-moog.phytec.de (172.25.0.11) by Berlix.phytec.de
 (172.25.0.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Fri, 26 Jan
 2024 09:57:36 +0100
From: Yannic Moog <y.moog@phytec.de>
Subject: [PATCH RFC for upstream 0/4] Add support for ETML1010G3DRA LVDS
 display on phyBOARD-Pollux
Date: Fri, 26 Jan 2024 09:57:22 +0100
Message-ID: <20240126-wip-y-moog-phytec-de-upstream-pollux-lvds-v1-0-8ec5b48eec05@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPJzs2UC/52OwQrCMBBEf0VydiUbY1s8CYIf4FU8hO7WBqoJS
 Y0W6b8bK4JXPS2zzLyZh4gcLEexnj1E4GSjdZcscD4TdWsuJwZLWQsllZaIFdyshwHOzp3At0P
 PNRDD1cc+sDmDd113vUOXKEJZLJtCaqKKKpF5PnBj71PXQex329evceF1PnlxzKK1sXdhmCYln
 Nx/tCcECVoh1QZlXrLavAML4qklqS+y0r+QVSaXWBaNxpUxVHyTx3F8AslXSwtUAQAA
To: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP
 Linux Team <linux-imx@nxp.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>
X-Mailer: b4 0.12.3
X-Originating-IP: [172.25.0.11]
X-ClientProxiedBy: Berlix.phytec.de (172.25.0.12) To Berlix.phytec.de
 (172.25.0.12)
X-Brightmail-Tracker: H4sIAAAAAAAAA02SbyzUcRzH7/v7dz+3tJ9j83VNliWxhTbXvm1lPev7QMmMWbW48Ru3u5zO
 qdTWmaQc+dOGuTiHsroTOXSINLMwxZpoCe3ogXYihahM+7m1PHt93p/3Pq8nH5aUzlAyVpmm
 47VpCrU/I6EafUS7Dol0rXzYzIIXGnxfR6ClhkKAGntGCLT1rJRENf0jNHq3usQgx3gUspR1
 Uqho3kEi29wEjQy/HpNorKuKQbXL7RTKy2+g0VLnJECDBgeNcu5VkOhWT78YbdptFHq00Q7Q
 fJs32ugyUahtoZRGBYuBKHdKfsIHN5oaAe5ZM1O40zgtxjZLPoOnJroZbBqKxp8KBgjc+kCP
 iwtyafxz9SmNWxY7CFy8GYZLu2/gB+XjDG4dvo5/2Pae4c5KjiXzauVlXhsakShJnXwxDdKd
 4qsrTVY6G1QzBsCykAuHuc1yA5CwUq6egBWz9wnX4ACwt/cLMAA3luH2w7n5GVpgT46Hs5sb
 YoEpLgA+dBq3O+7ceTj1vFvsYg84VPmZEgQkFwSbu0KFmOT8oP1rFSnch5yVgNWF9m2ZF2dg
 oNP2hnG1VgCsswcIDDlPeLtukhBYyvnC+dG7YlfuB8tHnKSLY2H7ip0oAR7GHW7jf7dxh9sM
 SAuQXlQmqXitUhWSnpql45NCknkbEH7ASyTpAEVVuA8QLOgDkCX9vdzD5S281D1ZkXWN12oS
 tJlqPqMP7GEpf293650YXsqlKHS8iufTee2/LcG6ybJBzuvqhPqOo3FrwVuRau5KgF4xbLZw
 8cedojKd78k/L32jj2TvC1yKqP+YeGq45IM6Il5l/SZf+75YFrhcazYN+MWNHVzUaBQxFeV+
 CxcCSlfKC/WnQUqUftRZfy5cdun3292ZmobK2snIJ7JX1vX2GvN60Lip6WanOPZACfTO86cy
 UhWHg0lthuIv5lOKUvECAAA=
X-Mailman-Approved-At: Fri, 26 Jan 2024 15:12:02 +0000
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
Cc: devicetree@vger.kernel.org, Yannic Moog <y.moog@phytec.de>,
 upstream@lists.phytec.de, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Primoz Fiser <primoz.fiser@norik.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series adds the LVDS panel support in simple-panel, introduces
device tree support for the LVDS panel on the phyBOARD-Pollux and
enables the FSL_LDB config option needed for the driver for the imx8mp
ldb bridge.

---
Primoz Fiser (1):
      drm/panel: simple: Add EDT ETML1010G3DRA panel

Yannic Moog (3):
      dt-bindings: display: panel-simple: add ETML1010G3DRA
      arm64: dts: imx8mp-phyboard-pollux-rdk: add etml panel support
      arm64: defconfig: enable i.MX8MP ldb bridge

 .../bindings/display/panel/panel-simple.yaml       |  2 +
 .../dts/freescale/imx8mp-phyboard-pollux-rdk.dts   | 74 ++++++++++++++++++++++
 arch/arm64/configs/defconfig                       |  1 +
 drivers/gpu/drm/panel/panel-simple.c               | 30 +++++++++
 4 files changed, 107 insertions(+)
---
base-commit: de927f6c0b07d9e698416c5b287c521b07694cac
change-id: 20240118-wip-y-moog-phytec-de-upstream-pollux-lvds-763f604dd8d8

Best regards,
-- 
Yannic Moog <y.moog@phytec.de>

