Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A21470A3C
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 20:19:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5E9A10E2BB;
	Fri, 10 Dec 2021 19:19:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5344510E2BB
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Dec 2021 19:19:46 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id x7so7536731pjn.0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Dec 2021 11:19:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9xCRIEX3mJadk+zhGNeFnmFOi8JPSOho1pncxPdFuxM=;
 b=OcCe9jlVmNdLSAyD/D2tvxJT0DKzapY9a7uUn1P60UMdKCALULVl1IOUZxViXtK41j
 AKFUsK66COy/j5WSuRobnybKv6HCehDYxTruv+rOVcwKa6neic6bZuSCIzJJq4U58MjJ
 4nLoMdWXxAGqIBp1hJBtmL38j9+W14QbieHbg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9xCRIEX3mJadk+zhGNeFnmFOi8JPSOho1pncxPdFuxM=;
 b=G7xvbHlhaerwngvf/aneqexnY2k/g7Ik1LbIhiyyqOMYsipgsxAPcLHjlzJX034AAV
 PK7DicjuWKUIfDrArdmzy7qugW1KVDgpp1YNlWnr4+Jizfvryd3DUrA7LgFfZH0OvHtT
 /uuCDpvANwBM8SVGrbQsqPQO0E3Uzk+eBQZeHCrrC83FvdPYvmpj0/EEAZf6PtzBMJQR
 nkw3djij8eSg2NPDqcYz8wpuOiN1VUfFvSbkSVSXtstpOHbGHhhTIeStZknT5KpBW95U
 FhpuxfZIGFcI8WaCbyzfUUa7J3scBC41GXz1JpIUXrh+xRz3PROEf7dTDjS1EEXbn//S
 hdiA==
X-Gm-Message-State: AOAM533Hd61k0FfSIORVKCCQ+lRiUuA5uRt9zKYepNNH8/GHnXD/oftJ
 SyPG1VKvo4nnyEG3vRQJyvVlcw==
X-Google-Smtp-Source: ABdhPJzEv4S+mm8UXhw6Wo/5W67zkVR2DN8Dny453Ti3m31FgmA9xtHhNDXRFXEbDpsfohWlLTCyYg==
X-Received: by 2002:a17:90b:3e8b:: with SMTP id
 rj11mr26393861pjb.63.1639163985905; 
 Fri, 10 Dec 2021 11:19:45 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:28d6:2bae:633e:b110])
 by smtp.gmail.com with ESMTPSA id o62sm3493022pfb.211.2021.12.10.11.19.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 11:19:45 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Inki Dae <inki.dae@samsung.com>
Subject: [PATCH v2 0/4] drm: exynos: dsi: Convert drm bridge
Date: Sat, 11 Dec 2021 00:49:18 +0530
Message-Id: <20211210191922.2367979-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
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
Cc: linux-amarula@amarulasolutions.com, Jagan Teki <jagan@amarulasolutions.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Updated series about drm bridge conversion of exynos dsi.

Patch 1: panel checker

Patch 2: panel_bridge API

Patch 3: Bridge conversion

Patch 4: Atomic functions

[1] https://patchwork.kernel.org/project/dri-devel/cover/20211122070633.89219-1-jagan@amarulasolutions.com/

Any inputs?
Jagan.

Jagan Teki (4):
  drm: exynos: dsi: Check panel for panel helpers
  drm: exynos: dsi: Use drm panel_bridge API
  drm: exynos: dsi: Convert to bridge driver
  drm: exynos: dsi: Switch to atomic funcs

 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 208 ++++++------------------
 1 file changed, 51 insertions(+), 157 deletions(-)

-- 
2.25.1

