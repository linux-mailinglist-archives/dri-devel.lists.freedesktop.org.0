Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BE692D2CA
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 15:30:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F287A10E79D;
	Wed, 10 Jul 2024 13:29:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="oOeCuMrZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8866510E79D
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 13:29:59 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-52ea0f18500so5997697e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 06:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720618197; x=1721222997; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=60aav+xK4jpl7xG8YPKnbprg8tIY6Nqk/IZH7bl4w4w=;
 b=oOeCuMrZOoMgLsPQzmGecxTBG1eH7TfIXwgw3C5T1VZXHSv1sMTn3Mpqy6pPyJLLjb
 GBwOIrcYKCVKh7+Rg82v863JzqO9uzFLYQa6p9riSktepFAYEeZPRguFQTkiIs80zsqB
 I/Rsv1KyhEZ7nGcFXYiE6j2hnqmPc46GADO7/WpRxUgP3ZDCtCxWXJzpxxTc43JAVXg/
 rdeTPPP6lyx04sI1e6F2bbLAalsPTVZtKOApQh4DO/fwxZqqtNrDSAKzejCCUIhZMCiR
 vX0ecN4kFsIXBESVr5frFT2j5xrZfB8zKvX5YbmjwP4jBOe0bjVHpGlh9OX6CfLJZ5i2
 rlHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720618197; x=1721222997;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=60aav+xK4jpl7xG8YPKnbprg8tIY6Nqk/IZH7bl4w4w=;
 b=VLGmHerq9U+XC4oedY8/AUoLt7eNBkfzNCgCDH0zQNO6idL5KrnJYf7C/4qqMfkHaI
 KGdvhi/y2lcyf7/Q4eb1Gc2HXf8UezwTEqMuSXYXFZYH4Ms9olEr7J5XbBX2lJKBFntq
 MbwylEiQD6XMnNKxhaMqIxfwUm0sw+OBg4hEfZslfbe5sYx2zBUvakS7ulZDXemOcMxj
 7GWvLPyQ5psXXoR9H3qQs7s8ayCNh4TBKEo42qjnbb+biRxze08xxtes5pswwqr876rH
 w8jL99sJ4xHHkyCPoYGLAEhRq9Ip2bGtTEZcHOIaupJt+5+IhlxMofZ1IR2L9CB3hbPH
 JuIg==
X-Gm-Message-State: AOJu0Yy4XQToG0YdSoM9+p7i3r9HMXVA7p565JFEfzi2DX1hYkce3DCZ
 C0l2XBOltr2H2ijQDtAoA4NNfLEzukYigOopiymS4Ubv8DpuULAvbfZ0NDTwytc=
X-Google-Smtp-Source: AGHT+IHBHuYCCPwlgq5edN/L9l0kJT3pRxlv0eRV0p1+UE+pPGfeFREyn6CNWYa3giyYGhc2Ub/T0Q==
X-Received: by 2002:a05:6512:1285:b0:52c:818c:13b8 with SMTP id
 2adb3069b0e04-52eb998fc87mr3918196e87.4.1720618196964; 
 Wed, 10 Jul 2024 06:29:56 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cde7e07fsm5304369f8f.17.2024.07.10.06.29.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jul 2024 06:29:56 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 airlied@gmail.com, mripard@kernel.org, dianders@google.com, 
 hsinyi@google.com, awarnecke002@hotmail.com, quic_jesszhan@quicinc.com, 
 dmitry.baryshkov@linaro.org, 
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240709134754.28013-1-lvzhaoxiong@huaqin.corp-partner.google.com>
References: <20240709134754.28013-1-lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: Re: [PATCH v6 0/5] Support Starry er88577 MIPI-DSI panel
Message-Id: <172061819595.1968965.12553404194809762882.b4-ty@linaro.org>
Date: Wed, 10 Jul 2024 15:29:55 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, 09 Jul 2024 21:47:49 +0800, Zhaoxiong Lv wrote:
> The Starry is a 10.1" WXGA TFT LCD panel. Because Starry-er88577
> and boe-th101mb31ig002 have very similar inti_code, after
> discussing with Dmitry Baryshkov, We will modify it based on the
> panel-boe-th101mb31ig002-28a.c driver instead of using a separate
> driver.
> 
> Changes between V6 and V5:
> - PATCH 1/5: Corrected the use of "->init" in struct panel_desc, and modify indentation
> - PATCH 2/5: No changes.
> - PATCH 3/5: No changes.
> - PATCH 4/5: Modify the commit information and "reset gpio" binding.
> - PATCH 5/5: Add two lines of init_code (D1 and D3) to modify the internal resistance of the mipi channel.
> - Link to v5: https://lore.kernel.org/all/20240704072958.27876-1-lvzhaoxiong@huaqin.corp-partner.google.com/
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/5] drm/panel: boe-th101mb31ig002 : Make it compatible with other panel.
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/24179ff9a2e4524ce83014b8827a73ad03a25c13
[2/5] drm/panel: boe-th101mb31ig002: switch to devm_gpiod_get_optional() for reset_gpio
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/7f58ebaccb67cb22b2936ba79c844f1e446dc73b
[3/5] drm/panel: boe-th101mb31ig002: use wrapped MIPI DCS functions
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/a16b680a2140e6cbda41ac144564696c3ee2815f
[4/5] dt-bindings: display: panel: Add compatible for starry-er88577
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/3808a15e3248820c0859d9b8a0f2c7e5c8259044
[5/5] drm/panel: boe-th101mb31ig002: Support for starry-er88577 MIPI-DSI panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/e4bd1db1c1f771983393bf5574854dff26ca7532

-- 
Neil

