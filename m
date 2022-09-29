Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E5F5EFC51
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 19:52:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 290BC10E00D;
	Thu, 29 Sep 2022 17:52:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 408 seconds by postgrey-1.36 at gabe;
 Thu, 29 Sep 2022 17:11:49 UTC
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt
 [IPv6:2001:690:2100:1::15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 633E710EB52
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 17:11:49 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 51236600879F;
 Thu, 29 Sep 2022 18:04:58 +0100 (WEST)
X-Virus-Scanned: by amavisd-new-2.11.0 (20160426) (Debian) at
 tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavisd-new, port 10025)
 with LMTP id l2l_SUiehblj; Thu, 29 Sep 2022 18:04:55 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt
 [IPv6:2001:690:2100:1::b3dd:b9ac])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id D1294600EAE6;
 Thu, 29 Sep 2022 18:04:55 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tecnico.ulisboa.pt;
 s=mail; t=1664471095;
 bh=qNenn2KoN9zsjzwvPudq5tWXFGJfOVtrVSY36thZMz0=;
 h=From:To:Cc:Subject:Date;
 b=OpO/4NDjuz87aKNYsZvEOxeQ52dTnhKpraERjSySCyK5tuhWXGGMXYWPAxKWu/QRe
 mUbgaItpqNijEHI7Mdcdxm8PkDSdGE0lqYK8HBjAnkPoEt91UjuIovpQLhrWg6ckzj
 jiyBePpLy8UOjqS4Yiu6HiCn7+TpSfiY3R1BylNk=
Received: from wslaptop.lan (unknown
 [IPv6:2001:818:dcb5:dc00:7a88:7f12:8ed8:518d])
 (Authenticated sender: ist187313)
 by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id D072F360086;
 Thu, 29 Sep 2022 18:04:53 +0100 (WEST)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To: 
Subject: [PATCH 0/4] Add JDI LPM102A188A display panel support 
Date: Thu, 29 Sep 2022 18:04:58 +0100
Message-Id: <20220929170502.1034040-1-diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 29 Sep 2022 17:52:24 +0000
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
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 arnd@arndb.de, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 jonathanh@nvidia.com, Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
 robh+dt@kernel.org, thierry.reding@gmail.com, linux-tegra@vger.kernel.org,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello!

These patches add support for the JDI LPM102A188A display panel,
found in the Google Pixel C.

Patch 1 adds the DT bindings for the panel.

Patch 2 adds an optional register clear to the Tegra DSI driver.

Patch 3 adds the panel driver, which is based on the downstream
kernel driver published by Google and developed by Sean Paul.

Patch 4 adds the DT node for the Google Pixel C. 

There is one point in this series on which I would like to ask for
some advice:

Since the device's bootloader leaves the display on and in patch 3 I
have assumed that the panel must be reset when probing, I was forced
to add patch 2, discovered by poking at the DSI module's registers until
the panel initialization sequence succeeded. However, if it is okay to
keep the panel on from the bootloader then it would be possible to
forego this second patch. Any comments on this would be highly appreciated.

Thank you!

Diogo Ivo (4):
  dt-bindings: display: Add bindings for JDI LPM102A188A
  drm/tegra: dsi: Clear enable register if powered by bootloader
  drm/panel: Add driver for JDI LPM102A188A
  arm64: dts: smaug: Add display panel node

 .../display/panel/jdi,lpm102a188a.yaml        | 100 ++++
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts |  72 +++
 drivers/gpu/drm/panel/Kconfig                 |  11 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c | 511 ++++++++++++++++++
 drivers/gpu/drm/tegra/dsi.c                   |  29 +
 6 files changed, 724 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/jdi,lpm102a188a.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c

-- 
2.37.3

