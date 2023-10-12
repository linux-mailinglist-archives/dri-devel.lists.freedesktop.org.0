Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A16A7C6DA1
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 14:10:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEA1710E4C4;
	Thu, 12 Oct 2023 12:10:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C00310E4C4
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 12:10:11 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-5789ffc8ae0so654991a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 05:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1697112611; x=1697717411; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EKvw4zddkb6Qa9xRN4ldaVGepo11VyVyzfjfLVplvoc=;
 b=iuMjALyGOfya6ZJ6K+AyvcdL1JUSClMjTLbhHuvW1W8r3Piq8nHtrWAf78nGiazQoT
 SQA4Cxq8nq3qoXunKbfDndztTjV9JRmR2pOXht1agQH9NqGXOeEZ2sH//ZRCaGG5UEAj
 DfIUS9bb3LGDN7BuEps/JuSEHcC4vbxVkeoOtaFf5b2V/lipk3YQVNt5GYS49TzD4ZEf
 i76k469EEiM9vZfa7QLvE1Esb75IqlVd68tt9kevmnhsheBMXkx2C1ONJWfFSuwth0PX
 hQGWC4Ld0AgUUifPgQdxA2cKpwIUhtguczTrlsQ31NLeMtxrMho5H2xraOO4vS41mBS+
 5uxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697112611; x=1697717411;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EKvw4zddkb6Qa9xRN4ldaVGepo11VyVyzfjfLVplvoc=;
 b=HV95M8/8PwcXH3xUd2Kcpox1I0/RqyXrtcajDhlhBP5SRpgrgF7zC5+iGLwqXv5TrH
 EzFrsSkb2fOfLQ9FyA7Q3vkF1k37rXUpbBNj45SS7F6jcWS6mBOn6FoueEEsi+0zS5UG
 xsb/PGjbfdx54oMypM0E1e54YMPcfD2JrUyyjsqEZayLH16tHBLRol42MbKukVWF5fG8
 VrekWh7m7/i7WNtcwd1qe/4y07MU1tTBlqT9TGl2fRyeAzvntTYoygJ9zbK/5MRpfPBk
 j6hovuUauC+6DWMbIf4+JH56DXRBJmib/5QqORKme7YLvxylnMA76I3JX3kQeq+eycPn
 gGXA==
X-Gm-Message-State: AOJu0YyUdOlL8wHcC34HbcFzbZnrhVO4GvERUHqq9DaErz5C7k51wQAr
 +H7WfBPNMzSaz/s+/lIqwYF+8A==
X-Google-Smtp-Source: AGHT+IG6jnTqJ1YML86LiacCxNMsFk/LrYf5hwvLiucGBGomiioCxcJZjpcp98BBHFqCUKg7O1xNmg==
X-Received: by 2002:a17:90b:390d:b0:27d:25a0:cf12 with SMTP id
 ob13-20020a17090b390d00b0027d25a0cf12mr748535pjb.14.1697112610932; 
 Thu, 12 Oct 2023 05:10:10 -0700 (PDT)
Received: from yc.huaqin.com ([101.78.151.205])
 by smtp.gmail.com with ESMTPSA id
 ds2-20020a17090b08c200b00256b67208b1sm1664455pjb.56.2023.10.12.05.10.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 05:10:10 -0700 (PDT)
From: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@google.com, hsinyi@google.com, linus.walleij@linaro.org,
 swboyd@chromium.org, airlied@gmail.com, catalin.marinas@arm.com,
 will@kernel.org
Subject: [v3 0/3] Break out as separate driver from boe-tv101wum-nl6 panel
 driver
Date: Thu, 12 Oct 2023 20:10:01 +0800
Message-Id: <20231012121004.2127918-1-yangcong5@huaqin.corp-partner.google.com>
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
to ili9882t_unprepare. I tried this scheme and the test failed, because
the touchpanel reset was already pulled low before the panel enter sleep,
which did not seem to meet the timing requirements. I hoped that the current
adding delay solution can be apply to solve the special requirements of this IC.

[v1 2/2] https://lore.kernel.org/all/CAD=FV=XtqPJ77dx8uRb0=tMvC3CvgH5X+7mUJeXgcG228kZfUg@mail.gmail.com/

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

