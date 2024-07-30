Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D49E094126A
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 14:50:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2327910E22B;
	Tue, 30 Jul 2024 12:50:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="E4srRijU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B13E10E22B
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 12:50:36 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4281ca54fd3so18465315e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 05:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722343834; x=1722948634;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Z4fILNbTnV4ZUaEZHGGwWYZeuafakFEBk9A0Y4htmCY=;
 b=E4srRijUqY+kbPFnH1UXgLLOvVzY0rbGchOfqjsphIqitjWBQHaNHWHK4474qw1N/L
 5BAVzfyugYzXyDkKz8v54g6XrpU9dnnwhDStuRVBuBzXNvUVsD5y5q/tp3scqf1j9VW/
 4PRIyBAfZabdqx5sbY0s5bKLK5bW0S3fINFvcX+rSNONpC8Jbyc2FyvLphrjSNLtkexN
 Ug0mowXml0OFQDNcsrkr/XRT+uBj4IUS6lTs34QnL+zS/HPlXHga8wk2dkuqjMRjZpW1
 bzlNZ1yPkamo0qBpCz6oCSm0aV7Q7lTgCVPp52UWWxwi7uCZHC8umHWhXfq7Sq4h0bQw
 c1zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722343834; x=1722948634;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Z4fILNbTnV4ZUaEZHGGwWYZeuafakFEBk9A0Y4htmCY=;
 b=mqM+agejJ39hdLc7ZL1vTs2zvDPotNtMn2veUUuF0+tZndcLfnYnTskvDxt3GhPu59
 zGECeJzW6QzObfKTR8tEMKgN1cOVILO5htDnwxl63N4Xq7F+ZD1murkJJrjDPk8DhJgk
 UYEQqLdwQ0Xpz0kUfxqZ1xAfgw+QcniXnJBS2hPC3XhgI4JBIz9g5s9/0bieJCWw2XDL
 faSgb9fhE0R+CxMUZsM9k4LK43fmj6GIKk/732MT8EVXafcWBbjdPycli0krZNLReaSu
 hqsPf7ouRfleMlQPiGjc71/OFYdYB+hFbMrDRDwCWvkNnXwIhFV2XJB5zLvd+b8HGJ8P
 9/zw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4xwnb9zMIu4EkeMis0MzG5/ldOoms21ValktuVKVuZUBUkHWvRFQ4coO2/paO8+/+dK9auzBw6B0kCl9Zkx8FOsZpVDQD6XXG/iqgHuBi
X-Gm-Message-State: AOJu0YzZs3GeBmJ7iWbLUF6aCpl6gygJE/LjPsCbnWWCNT253HW2rvQa
 XPjOzwZzkn+Y558DHwfOOi7SCQxm/dTCyqlEvbU11TF7ybLIOqTK/EBkOkpVfOY=
X-Google-Smtp-Source: AGHT+IGPWSWAb+fvyUmPtwRvrlH6PC4ifMEhNzFkX9yIiubcqRcDAdw6bR9TYsXHuvl/XIZUdNlSDw==
X-Received: by 2002:a05:600c:3547:b0:426:6773:17 with SMTP id
 5b1f17b1804b1-42811e12d26mr72308275e9.30.1722343834506; 
 Tue, 30 Jul 2024 05:50:34 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:291e:4a48:358e:6f49])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-42805730e68sm216521405e9.9.2024.07.30.05.50.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jul 2024 05:50:34 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/9] drm/meson: dw-hdmi: clean-up
Date: Tue, 30 Jul 2024 14:50:10 +0200
Message-ID: <20240730125023.710237-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
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

This patchset is a clean up of the Amlogic HDMI phy driver.

It is part of an effort to remove the use HHI syscon from the driver
and properly use frameworks, such as PD and clocks, instead of going
for an incorrectly global register region.

When this is done, it should be easier to remove the usage of the
component API from the Amlogic display drivers.

To be clear, this patchset does not go this far yet. It stops
short of making any controversial DT changes. To decouple the HDMI
phy driver and main DRM driver, allowing the PHY to get hold of its
registers, I believe a DT ABI break is inevitable. Ideally the
register region of the PHY within the HHI should provided, not the
whole HHI. That's pain for another day ...

The last 2 patches should not be applied yet. They depend on DT
changes which recently got applied. Time is needed for the DT changes
to sink in u-boot and distros, to avoid breaking platforms which don't
take DT from the kernel. These 2 patches are provided as a note that
this should happen eventually.

Jerome Brunet (9):
  drm/meson: hdmi: move encoder settings out of phy driver
  drm/meson: vclk: drop hdmi system clock setup
  drm/meson: dw-hdmi: use generic clock helpers
  drm/meson: dw-hdmi: fix incorrect comment in suspend
  drm/meson: dw-hdmi: split resets out of hw init.
  drm/meson: dw-hdmi: convert to regmap
  drm/meson: dw-hdmi: use matched data
  drm/meson: dw-hdmi: don't write power controller registers
  drm/meson: dw-hdmi: drop hdmi system clock setup

 drivers/gpu/drm/meson/meson_dw_hdmi.c      | 746 ++++++++++-----------
 drivers/gpu/drm/meson/meson_dw_hdmi.h      |  49 +-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c |  16 +
 drivers/gpu/drm/meson/meson_vclk.c         |   8 -
 4 files changed, 389 insertions(+), 430 deletions(-)

-- 
2.43.0

