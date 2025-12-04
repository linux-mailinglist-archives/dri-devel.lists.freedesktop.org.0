Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87976CA2725
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 07:06:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBC9E10E1B9;
	Thu,  4 Dec 2025 06:06:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dDgM4XVm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECE7B10E1B9
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 06:06:52 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-640a503fbe8so918773a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Dec 2025 22:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764828411; x=1765433211; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JZ9/LjENMEgkqGr3qDNK6DAWAvXersuPBKAH6ygTJP0=;
 b=dDgM4XVm8cVC+55yMncTnuwm+zwR8fULOHTMjqT+Fp8Sg31XZuERwdXfXmezYNbtnd
 clkRLXWWQNKbpd6xOdE6Sx7uOeNGdTKXKQypERfinjLH1MrC6vCfixbJtTprxfk+e1dB
 o6oMt7EDRBK0tQshpUKbkDEeiTEVwQ4/9/MKRar9vZ17jucmzujfWJkg8gnFPtUYJLAP
 Yaw95PbxamVU9HyfznX4S1xRz+NLYjbJQpHOR+Po8bm2HyZfjukkRmHTPbPhd6OKi9Kj
 eLrJ9uK0YaaGV/R7XJTUk1Jt7OuqM90qyh9vpOh+5ZLRaaeIr9QZ4lHPuwC7sxLg7gcq
 5hXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764828411; x=1765433211;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JZ9/LjENMEgkqGr3qDNK6DAWAvXersuPBKAH6ygTJP0=;
 b=K05jj/NpzV61gMhSLM28jVR0DkFVRA1UlDt3A+heIJA6aManKCwjnzciSz0kEH4c0S
 cNPNQuNbGvCGwAKLsk7Zh06KSZVigteJhkF1VJjKz1tVCLhGCvqKme53M7YUv5G9gBfE
 C+sSmfO91UY9xT0Nal/hrMHG3htEl8ChA3z+TvlNhaYq/2Wa2T1mTbCW9sgDWGLbT43B
 jGKbBUSvcAOcG1VlYZ1nbWL+q0Gzf2E+7rp1c39TwQ4uJnEhejeOhXvxGLL+4NrUwUVi
 vLa1JUAHtAM4nlUvHBe+DU5w8onKLleoVIjoNbVeb9O3rwGZWNa3U/QzF/OWVAppMg06
 uELg==
X-Gm-Message-State: AOJu0Yw3dVPfj8KtbQKyEcWNM5wRY3MyVPp97BU5PN7pJUFhvHeLVHeH
 ijQgDQJJg7Fl6Gbiy1kaaEbuSEOYiDaNs5cDuY/CdHiVmZBu6ZVqPnpJ
X-Gm-Gg: ASbGncuqdRHoUD0hjEFJdKR1ZTbgNpDlqgjOIEDIKnvnJPcdQy/LbD/Xu3FdoAtrjCt
 Rz8P2JJW2MX4dzD/reFnQ2jxyEKYpMF3HUIZEwhvk7gAcndyA7sOb8SygmvLKDdpynvUR9isN3i
 9bDnb1J3k8xF+M2TFOiE6a4j460PmePy2lmLV+l6/eCyqR6pUKJuI4/qesa0/WvkUoqIwuz1PrG
 5e/crfkzISMRiqZsmuRWexT0rb4PXKpv2ZyqMw+AVO/mIVt95oxmUdFKVRZy8QT/cE+ka2ukjzm
 d6YZ7PInYe1cXAVn/1vUlcHtjAC9vucIvduhq6AaBbPgPJIBcGjfLoPFJmxAHZ/XoviQdZQYMIV
 ArW9AnzYLO6MXi7kVnzt3icUaddnK+I7kApJeGDBHguyFNIPh0ma+FYM1M8EzyBLxtwgaw2RHYP
 3cRYKgsHGU9A==
X-Google-Smtp-Source: AGHT+IGzgtbqSQa+Nunwm3tsFNhMDU83uHRCJF1GCTTEVoUczGHtwgIxvcTuLpvcqSN7APe8juko5w==
X-Received: by 2002:a05:6402:4302:b0:640:cd2a:3cc1 with SMTP id
 4fb4d7f45d1cf-647abcf4242mr1593608a12.0.1764828411280; 
 Wed, 03 Dec 2025 22:06:51 -0800 (PST)
Received: from xeon ([188.163.112.74]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-647b2ef7798sm460296a12.15.2025.12.03.22.06.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Dec 2025 22:06:50 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Douglas Anderson <dianders@chromium.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v3 0/7 RESEND] Add support for panels found in various Tegra
 devices
Date: Thu,  4 Dec 2025 08:06:16 +0200
Message-ID: <20251204060627.4727-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for panels found in various Tegra30 and Tegra114 devices,
including panels in Tegra Note 7, Surface RT, Surface 2 and Ideapad
Yoga 11 T30.

---
Changes in v2:
- dropped gpu/drm: panel-edp: add AUO B116XAN02.0 panel entry (picked into drm-misc-next)
- expanded commit descriptions
- return accum_err on prepare
- switched to devm_regulator_bulk_get_const

Changes in v3:
- lg,ld070wx3.yaml > lg,ld070wx3-sl01.yaml
---

Anton Bambura (1):
  gpu/drm: panel: add Samsung LTL106HL02 MIPI DSI panel driver

Svyatoslav Ryhel (6):
  dt-bindings: display: panel: properly document LG LD070WX3 panel
  gpu/drm: panel: add support for LG LD070WX3-SL01 MIPI DSI panel
  ARM: tn7: adjust panel node
  dt-bindings: display: panel: document Samsung LTL106AL01 simple panel
  gpu/drm: panel: simple-panel: add Samsung LTL106AL01 LVDS panel
    support
  dt-bindings: display: panel: document Samsung LTL106HL02 MIPI DSI
    panel

 .../display/panel/lg,ld070wx3-sl01.yaml       |  60 ++++++
 .../display/panel/panel-simple-dsi.yaml       |   4 +-
 .../bindings/display/panel/panel-simple.yaml  |   2 +
 arch/arm/boot/dts/nvidia/tegra114-tn7.dts     |  13 +-
 drivers/gpu/drm/panel/Kconfig                 |  26 +++
 drivers/gpu/drm/panel/Makefile                |   2 +
 drivers/gpu/drm/panel/panel-lg-ld070wx3.c     | 184 ++++++++++++++++++
 .../gpu/drm/panel/panel-samsung-ltl106hl02.c  | 179 +++++++++++++++++
 drivers/gpu/drm/panel/panel-simple.c          |  65 ++++---
 9 files changed, 496 insertions(+), 39 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/lg,ld070wx3-sl01.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-lg-ld070wx3.c
 create mode 100644 drivers/gpu/drm/panel/panel-samsung-ltl106hl02.c

-- 
2.48.1

