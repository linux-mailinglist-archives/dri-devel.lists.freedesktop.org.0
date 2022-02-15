Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 314E44B7B6F
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 00:54:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D2F510E5BC;
	Tue, 15 Feb 2022 23:54:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2548010E1A1
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 23:54:51 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id l8so632978pls.7
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 15:54:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+nTGNa9s6u2rYcAhXWuxtwf4TTMMDST6LAdmBGRAZ9k=;
 b=gs536kU/AcOsO1s8ccJDa8Cl0nWLPsH7Kt25IJC2NXtxM4/uhdTZ7KeEnxZrtKMymL
 zH6keBd92K6elTWTQEjtZE6PdxQPQR8vAQAFW5ySaqRI73Yt09rfKaekwn1ZO5fl4OEO
 HBm2IfP4hQJkgGJLfWLHZdJG788fplKYLh48k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+nTGNa9s6u2rYcAhXWuxtwf4TTMMDST6LAdmBGRAZ9k=;
 b=XX2xO7Zocj0if6/8MJ88OO7aW3uDw0tUDM8BQQOUEEUglsz2gy9TjL7Na24EVZzNtb
 3BBetwv/U2IMeLwbcZhHvUUxmrFuM3xvlWHxsq3bMXeTUlFh6Ey6rOPLfmCUBzMqQchZ
 3aCThEUmN/WiSOXAIGgOx/VnyJ216Z4oKFwJhnGY2FQgWyQNtRLV/ifYTbFUbAFvW2dz
 BEHLjaZa4zfR28XhLeO5otPGD8eHa+76xPjLFlZE3hbeXB3C0Y7DeF7on0QOE09Kyimo
 LyMVx0uyAnRyOnYTW+VQhIxfrr9J3iW1fgebRS/R4Os5BavaXbLN6bo1kaiwcTPVF4pl
 9MRA==
X-Gm-Message-State: AOAM530xy1hXxJvmHsDKjnlasooPtxPUZQciSdengCdXZ6uyEvqudLyP
 AwWddlXhkJ8Sz8dE4aenx/eKxA==
X-Google-Smtp-Source: ABdhPJyfgHzglRsCZcuCTEveJ50IZg7QeQSve0L8/LjgLavRV70CR8Eoi0SvPPKabLI0pw/ZoVXdZQ==
X-Received: by 2002:a17:90b:4c8e:b0:1b9:f99f:1218 with SMTP id
 my14-20020a17090b4c8e00b001b9f99f1218mr7174869pjb.75.1644969290754; 
 Tue, 15 Feb 2022 15:54:50 -0800 (PST)
Received: from localhost ([2620:15c:202:201:97ca:4b5:7d22:b276])
 by smtp.gmail.com with UTF8SMTPSA id k5sm10176304pfu.180.2022.02.15.15.54.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Feb 2022 15:54:50 -0800 (PST)
From: Brian Norris <briannorris@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/2] drm/bridge: analogix_dp: Self-refresh state machine fixes
Date: Tue, 15 Feb 2022 15:54:18 -0800
Message-Id: <20220215235420.1284208-1-briannorris@chromium.org>
X-Mailer: git-send-email 2.35.1.265.g69c8d7142f-goog
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
Cc: Jonas Karlman <jonas@kwiboo.se>, Brian Norris <briannorris@chromium.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sean Paul <seanpaul@chromium.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Sean Paul <sean@poorly.run>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

I've been investigating several eDP issues on a Rockchip RK3399 system
and have two proposed bugfixes. RK3399 has two CRTCs, either of which
can be used for eDP output. For both fixes, we have bugs due to the
relationship between the generalized "self refresh helpers" and the
analogix-dp bridge driver which controls much of the PSR mechanics.
These bugs are most visible when switching between CRTCs.

I'm not a DRM expert, but I've been poking at a lot of Rockchip display
drivers recently. I'd love some skeptical eyes, so feel free to ask
questions if I haven't explained issues well, or the proposals look
fishy.

Regards,
Brian


Brian Norris (2):
  drm/bridge: analogix_dp: Support PSR-exit to disable transition
  drm/atomic: Force bridge self-refresh-exit on CRTC switch

 .../drm/bridge/analogix/analogix_dp_core.c    | 42 +++++++++++++++++--
 drivers/gpu/drm/drm_atomic_helper.c           | 16 +++++--
 2 files changed, 51 insertions(+), 7 deletions(-)

-- 
2.35.1.265.g69c8d7142f-goog

