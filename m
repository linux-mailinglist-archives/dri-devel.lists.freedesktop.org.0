Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2ACF7C81C8
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 11:18:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E53A10E12A;
	Fri, 13 Oct 2023 09:18:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87D7910E12A
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 09:18:53 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1c9b1e3a809so14383645ad.2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 02:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1697188733; x=1697793533; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YKCIbtV8WnukKJuXFhMCZ9SvuRK5tqzYeWgDJ+APahI=;
 b=3KqgJOdgpZgi0JHI3i8w6dIGwoDvxJjIfTf/kkGD2FIa+DHatSx3hfUqUklf5gpqXR
 x9xv3JSr4Sn8JZ37MWRc6KcExbMDiv9839D5R7edxtOXoO8nCTYm71JjZvx5g4VBwT4F
 h6fJnL6pKRy59xt56B615luD9N+m14d/PL6thHCLEARZJ9SCK+fvUjhJvt2fCQ7VGDca
 b2CG6e/OehiNDebP5dWDaSgeOmfu+G/5L3dpDwvfrhy8yclpAO0mv5X5jmifE0QYnt7C
 tPWFMa/yvTPCdCayGAWJz5s6M0UmFm8iUyWFItfvqRRYRKUMJXCVeI2Y28y8TTsD+0Gs
 RsUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697188733; x=1697793533;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YKCIbtV8WnukKJuXFhMCZ9SvuRK5tqzYeWgDJ+APahI=;
 b=lsLRnA84ZrSoIiCH5NdHt134GqPgE64zPDf2coUZfPGsRFUnLa990mvPRpjyJDTZze
 BT7GduZaWyW2jrxOq7edKcDdZOI3GQ9M3e+UWAr5EXKt9UpFToJr/nJw8mEVx5hXU0PX
 wihWJqSUDDeRnXwJBLMFYhwxTomjHes60CR3zHxLIGRJF0U4TXwLj+kJs7Fb4o5ru/6H
 KM3WECgd4Hqz/l4xlEEyrz0i/BOaNUmyEQbit6/LQbuconGRO4A9lNB3U9CfMkIakpfS
 i3TElvh28jjSxx/G64agwE+S4InrjKU9bbpsCkgHL6T9KHSQSWHrGH5bHNYUpNJlHLOk
 /7lw==
X-Gm-Message-State: AOJu0YwgDBw1RIWstvdsAwmLqS3bjg6otME7k4XoQmlChpwAwoNbJDgg
 b6UeAyMxvDf3hTr/yWlLERssXA==
X-Google-Smtp-Source: AGHT+IEG9OjVPF/VEhiUBlffADAgOUJY7z3anwrCYwfYiBthHVgZmCoI9r1Ym+LvCxQkniigjEekSQ==
X-Received: by 2002:a17:902:e847:b0:1bd:d92d:6b2 with SMTP id
 t7-20020a170902e84700b001bdd92d06b2mr28665282plg.10.1697188732952; 
 Fri, 13 Oct 2023 02:18:52 -0700 (PDT)
Received: from yc.huaqin.com ([101.78.151.205])
 by smtp.gmail.com with ESMTPSA id
 jw22-20020a170903279600b001b8a3e2c241sm3427168plb.14.2023.10.13.02.18.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 02:18:52 -0700 (PDT)
From: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@google.com, hsinyi@google.com, linus.walleij@linaro.org,
 swboyd@chromium.org, airlied@gmail.com, catalin.marinas@arm.com,
 will@kernel.org
Subject: [v4 0/3] Break out as separate driver from boe-tv101wum-nl6 panel
 driver
Date: Fri, 13 Oct 2023 17:18:41 +0800
Message-Id: <20231013091844.804310-1-yangcong5@huaqin.corp-partner.google.com>
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
Cc: devicetree@vger.kernel.org,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Linus series proposed to break out ili9882t as separate driver, 
but he didn't have time for that extensive rework of the driver.
As discussed by Linus and Doug [1], keep macro using the "struct panel_init_cmd"
until we get some resolution about the binary size issue.

[1]: https://lore.kernel.org/all/20230703-fix-boe-tv101wum-nl6-v3-0-bd6e9432c755@linaro.org

In [v1 2/2], Doug suggested move the ili9882t_enter_sleep_mode function
to ili9882t_unprepare. I tried this scheme and the test failed. I will 
continue to investigate the rootcause with ilitek, which may take a long time .
So if possible, apply this patch first. If there are new solutions later, I 
will continue upstream.

[v1 2/2] https://lore.kernel.org/all/CAD=FV=XtqPJ77dx8uRb0=tMvC3CvgH5X+7mUJeXgcG228kZfUg@mail.gmail.com/

Changes in v4:
- PATCH 2/3: Change usleep_range(50000,51000) to msleep(50);.
- Link to v3: https://lore.kernel.org/all/20231012121004.2127918-1-yangcong5@huaqin.corp-partner.google.com/

Changes in v3:
- PATCH 1/3: Remove "init_cmd_length" and "linux/of_device.h" .
- PATCH 2/3: Change usleep_range(50000,51000).
- PATCH 3/3: Add a little background for commit.
- Link to v2: https://lore.kernel.org/all/20231010121402.3687948-1-yangcong5@huaqin.corp-partner.google.com/

Changes in v2:
- PATCH 1/3: fix Doug comments,define "_INIT_SWITCH_PAGE_CMD" and remove the "shutdown".
- PATCH 2/3: Modify ili9882t_switch_page function instead of hardcoding.
- PATCH 3/3: Enable new config in defconfig.
- Link to v1: https://lore.kernel.org/all/20231007060639.725350-1-yangcong5@huaqin.corp-partner.google.com/

Cong Yang (3):
  drm/panel: ili9882t: Break out as separate driver
  drm/panel: ili9882t: Avoid blurred screen from fast sleep
  arm64: defconfig: Enable ILITEK_ILI9882T panel

 arch/arm64/configs/defconfig                  |   1 +
 drivers/gpu/drm/panel/Kconfig                 |   9 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 371 ---------
 drivers/gpu/drm/panel/panel-ilitek-ili9882t.c | 779 ++++++++++++++++++
 5 files changed, 790 insertions(+), 371 deletions(-)
 create mode 100644 drivers/gpu/drm/panel/panel-ilitek-ili9882t.c

-- 
2.25.1

