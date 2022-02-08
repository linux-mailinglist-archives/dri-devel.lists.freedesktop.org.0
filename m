Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E251F4ADF2D
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 18:19:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69E2010E749;
	Tue,  8 Feb 2022 17:19:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8387A10E749
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 17:19:12 +0000 (UTC)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id BD0563F199
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 17:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1644340750;
 bh=FcBirewgG5GspHM+XiPFPnNhDyGu6MCNBPG4nrU1bUg=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=rHRdVmBuuDPhdMCso9V+kHmn0sYQevnw+ashxPm8IC+ZlHoPdqFI3rvmDRM/IbteY
 0cUY78ogPL0sV/q754XUhR8f66h2MU/0fSyt+HJTLoZQJK/tODnEyIPQVJ4R7IX2dK
 mAg376V+mPv7FGDcNuhj2Fh+Fk/mBolRbL7kPXZcQ8c2Glv6FFQvy2Y8dSXwu9CGOg
 ceejJfxB3fWi8w0QzcrX0Jgs2RUwYBjOTtguDNgnRZz/L0YZKfal5lnYde1tSdURle
 I6Lf84F0g9KHyImO7anDv0IOqTonXgol+lRDEendM/zM7SMMq+6/GIiMpkyBh4ztFk
 QbGBfrS16jrLQ==
Received: by mail-ed1-f72.google.com with SMTP id
 cr7-20020a056402222700b0040f59dae606so4879823edb.11
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Feb 2022 09:19:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FcBirewgG5GspHM+XiPFPnNhDyGu6MCNBPG4nrU1bUg=;
 b=LmuaDlcYpswftB/MyZJHvcTMTfV+RM6NxNPMeXZS337WW0pHjceFJYufbOkOo1BtSb
 WbzTiVjH/iDh63GHazQZhUw5xFCTIwqCVyzUe24QQNdfpLkHm/80XEOscVOGoBqOw24n
 G5X2tRjAg221QZJwt9J49wSBBYPTdF4erSsK22gWAGpBbKNGBBb9KIYWa5nCMLk4DfHO
 Mb/cMyYDk405+gSGkkj51nGm1pdMkdrXIviT7dbv0SMbcNqAMGVxRjrmHjuKJ8ZsXZM8
 tB6SDruwLiQ1czoFAAUnSmev+LU9IP3G1TgQkweAAkdcbC9MoVOmJOp64z/vDTqRLNI/
 sPhQ==
X-Gm-Message-State: AOAM5332OGIIQ1reK3oDncUk6Fby4PNsmvKqyMCEd+FoNxtDVspAnpTg
 CNf/GZ8cydM2M/seOKJah7YuyAYdZExDiS2CbU23+qETGFSmks4bHV7whbZg5mEWri8lm+z3HvT
 5HcdvnVf5vEHn4TBBhrDYof3iQAmLYe7hyD/glp6VzSQ8kQ==
X-Received: by 2002:a17:907:2d94:: with SMTP id
 gt20mr4673988ejc.501.1644340750440; 
 Tue, 08 Feb 2022 09:19:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxr5UsCRspXa4NCGOuZM5Ba8debNWt45uxZ8oMQLV+xoDrSe58nTit31OQ9lQldNaQthBGDVw==
X-Received: by 2002:a17:907:2d94:: with SMTP id
 gt20mr4673973ejc.501.1644340750270; 
 Tue, 08 Feb 2022 09:19:10 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id r10sm5125550ejy.148.2022.02.08.09.19.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 09:19:09 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH 00/10] drm: dt-bindings: exynos: convert to dtschema
Date: Tue,  8 Feb 2022 18:18:13 +0100
Message-Id: <20220208171823.226211-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
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
Cc: Sylwester Nawrocki <snawrocki@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Convert most of the Exynos DRM/Display bindings to DT schema and put
them under "samsung" directory instead of "exynos". The FIMD is used also
on S3C and S5P, so exynos is too specific.  Also most of other Samsung
SoC bindings and drivers are organized in directories by company name,
not by SoC name.

I used Exynos DRM maintainers and myself as bindings maintainers, but
feel free to propose different approach.

Dependencies
============
None. I will take the DTS patches via Samsung SoC tree.

Best regards,
Krzysztof

Krzysztof Kozlowski (10):
  ARM: dts: exynos: add missing HDMI supplies on SMDK5250
  ARM: dts: exynos: add missing HDMI supplies on SMDK5420
  dt-bindings: phy: samsung,exynos-hdmi-phy: convert to dtschema
  dt-bindings: display: samsung,exynos5433-decon: convert to dtschema
  dt-bindings: display: samsung,exynos7-decon: convert to dtschema
  dt-bindings: display: samsung,exynos-hdmi-ddc: convert to dtschema
  dt-bindings: display: samsung,exynos-mixer: convert to dtschema
  dt-bindings: display: samsung,exynos-hdmi: convert to dtschema
  dt-bindings: display: samsung,exynos5433-mic: convert to dtschema
  dt-bindings: display: samsung,exynos-fimd: convert to dtschema

 .../bindings/display/exynos/exynos-mic.txt    |  51 ----
 .../display/exynos/exynos5433-decon.txt       |  60 -----
 .../bindings/display/exynos/exynos7-decon.txt |  65 -----
 .../bindings/display/exynos/exynos_hdmi.txt   |  64 -----
 .../display/exynos/exynos_hdmiddc.txt         |  15 --
 .../display/exynos/exynos_hdmiphy.txt         |  15 --
 .../bindings/display/exynos/exynos_mixer.txt  |  26 --
 .../bindings/display/exynos/samsung-fimd.txt  | 107 ---------
 .../samsung/samsung,exynos-hdmi-ddc.yaml      |  42 ++++
 .../display/samsung/samsung,exynos-hdmi.yaml  | 227 ++++++++++++++++++
 .../display/samsung/samsung,exynos-mixer.yaml | 143 +++++++++++
 .../samsung/samsung,exynos5433-decon.yaml     | 148 ++++++++++++
 .../samsung/samsung,exynos5433-mic.yaml       |  95 ++++++++
 .../samsung/samsung,exynos7-decon.yaml        | 120 +++++++++
 .../display/samsung/samsung,fimd.yaml         | 198 +++++++++++++++
 .../bindings/phy/samsung,exynos-hdmi-phy.yaml |  44 ++++
 MAINTAINERS                                   |   1 +
 arch/arm/boot/dts/exynos5250-smdk5250.dts     |   3 +
 arch/arm/boot/dts/exynos5420-smdk5420.dts     |   3 +
 19 files changed, 1024 insertions(+), 403 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/exynos/exynos-mic.txt
 delete mode 100644 Documentation/devicetree/bindings/display/exynos/exynos5433-decon.txt
 delete mode 100644 Documentation/devicetree/bindings/display/exynos/exynos7-decon.txt
 delete mode 100644 Documentation/devicetree/bindings/display/exynos/exynos_hdmi.txt
 delete mode 100644 Documentation/devicetree/bindings/display/exynos/exynos_hdmiddc.txt
 delete mode 100644 Documentation/devicetree/bindings/display/exynos/exynos_hdmiphy.txt
 delete mode 100644 Documentation/devicetree/bindings/display/exynos/exynos_mixer.txt
 delete mode 100644 Documentation/devicetree/bindings/display/exynos/samsung-fimd.txt
 create mode 100644 Documentation/devicetree/bindings/display/samsung/samsung,exynos-hdmi-ddc.yaml
 create mode 100644 Documentation/devicetree/bindings/display/samsung/samsung,exynos-hdmi.yaml
 create mode 100644 Documentation/devicetree/bindings/display/samsung/samsung,exynos-mixer.yaml
 create mode 100644 Documentation/devicetree/bindings/display/samsung/samsung,exynos5433-decon.yaml
 create mode 100644 Documentation/devicetree/bindings/display/samsung/samsung,exynos5433-mic.yaml
 create mode 100644 Documentation/devicetree/bindings/display/samsung/samsung,exynos7-decon.yaml
 create mode 100644 Documentation/devicetree/bindings/display/samsung/samsung,fimd.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/samsung,exynos-hdmi-phy.yaml

-- 
2.32.0

