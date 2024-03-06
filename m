Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC11874104
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 21:03:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F3A41134FD;
	Wed,  6 Mar 2024 20:03:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="KRpAmPpQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D461C1134FD
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 20:03:56 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-6e6277f72d8so97270b3a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Mar 2024 12:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709755436; x=1710360236;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZN7e0pJZKOddfIvwqdPKggGVUrxfJ9WHuIjs3oUr49M=;
 b=KRpAmPpQFJqZNASIYXbGnQ2CBIgmc4Sv1OJ+fpxMAFmJvxHorbE2bLRF7LRItKSSX4
 RnTvmUKcz7HZZwn4wd7zqJLZN0YEeBxJXVV9q5Bw+Y+9B7tStzBAaR08GLzSE4fdyk0H
 USkqhRwgt45xJOYKvlGYyFjkGQhd+jA0/8TUk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709755436; x=1710360236;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZN7e0pJZKOddfIvwqdPKggGVUrxfJ9WHuIjs3oUr49M=;
 b=ahYz/DYvN8PVNnYH/Y67K0D86XNy4yEyVc3ncE6L9I25SV4yVVIoeCa9oBWCJZGLGJ
 lRcmtr8Wc53v1DOZPv7WFNXxPHmkAZ7A7QN1hQkkigaPsjUL1xc6Ev3a3zbyLiWARDAp
 15Y54yPgKwxB/9phG9Qzb15NGL7rm66ahHHFNlSMU5vuwzNimBezkYQMZtCknc5hGelB
 24pBiQiFKHopiWlki026/L8UkZPCP3ua6IaVlxcz/+CcbJyb5kd3SMtCw9vfJ81SJCFX
 ri2rYlbp81H65rqU17JIS0ku1jo4woFTBE1xQbZwnF9v/mwC2uBA0Reh6a0MX/YLL6gN
 cNDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVU3WkbSzGd5azvLBNG+qfH7Qk7fD5FLZfEgWjWwfDlasH1qfnonA4yffUmzyQPwzoSgWubdCZDY4LQgdokwm4yYQAqltr+QkRS2sRJE4b5
X-Gm-Message-State: AOJu0Yw59BEP/SDkZyRfWwDsMR7Fe4E5KIsfejfMhX+QRGdlN8ZyuqT/
 oBi/JbusMBAbI/klniQHU3UcHiPkRatFlYA408u3kXUVWZAGHbL4jNLNDNt16g==
X-Google-Smtp-Source: AGHT+IFCRFRPzQaRQxQDBTisRpAscTzqe9et1jiEZnW6JMEM2ocO0K/Vg9EBcJ1GFCqJUu9p8wgQgg==
X-Received: by 2002:a05:6a21:81a6:b0:1a1:4d53:b931 with SMTP id
 pd38-20020a056a2181a600b001a14d53b931mr4525246pzb.43.1709755436238; 
 Wed, 06 Mar 2024 12:03:56 -0800 (PST)
Received: from hsinyi.sjc.corp.google.com ([2620:15c:9d:2:a215:f6c0:3224:5460])
 by smtp.gmail.com with ESMTPSA id
 e3-20020aa79803000000b006e5667793d4sm11124241pfl.66.2024.03.06.12.03.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Mar 2024 12:03:55 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Douglas Anderson <dianders@chromium.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/6] Match panel with identity
Date: Wed,  6 Mar 2024 11:55:50 -0800
Message-ID: <20240306200353.1436198-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.44.0.278.ge034bb2e1d-goog
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series is a follow up for 1a5e81de180e ("Revert "drm/panel-edp: Add
auo_b116xa3_mode""). It's found that 2 different AUO panels use the same
product id. One of them requires an overridden mode, while the other should
use the mode directly from edid.

Match the panel for identity (id and name). If not found, fallback to match
id.

v1: https://lore.kernel.org/lkml/20240223223958.3887423-1-hsinyi@chromium.org
v2: https://lore.kernel.org/lkml/20240228011133.1238439-1-hsinyi@chromium.org
v3: https://lore.kernel.org/lkml/20240304195214.14563-1-hsinyi@chromium.org
v4: https://lore.kernel.org/lkml/20240306004347.974304-1-hsinyi@chromium.org/

Hsin-Yi Wang (6):
  drm_edid: Add a function to get EDID base block
  drm/edid: Clean up drm_edid_get_panel_id()
  drm/edid: Add a function to match EDID with identity
  drm/edid: Match edid quirks with identity
  drm/panel-edp: Match edp_panels with panel identity
  drm/panel-edp: Fix AUO 0x405c panel naming and add a variant

 drivers/gpu/drm/drm_edid.c        | 144 +++++++++++++++++++++++-------
 drivers/gpu/drm/panel/panel-edp.c |  68 +++++++++-----
 include/drm/drm_edid.h            |  11 ++-
 3 files changed, 166 insertions(+), 57 deletions(-)

-- 
2.44.0.278.ge034bb2e1d-goog

