Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3FBC3287D
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 19:10:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EE7D10E2AD;
	Tue,  4 Nov 2025 18:10:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZUdFFqCl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC9E710E2AD
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 18:10:03 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-3ecdf2b1751so3780404f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Nov 2025 10:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762279802; x=1762884602; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HBEyfODAKvgwzHmkCm17lPDKK7nQ8zv0WCO9yDZDp4E=;
 b=ZUdFFqClkpfJwwZaQYamXBij5zQPlpUGMioqOSLWcyobvl9PJrZy/wGWBvsYErpxDt
 BeQ+YK6WshgdU1Qng0hbafBOL307tI4DqsxxnHCfp3BFqsckyvJBPtN9/XxKPP3PIllc
 MXK6R5QIIe9Dptj5ALUDTP1lNfwOgjZ727baXJuYnthRPmzPut1zJb67heaD7RurEJZp
 IyQT3nu8ixWd9rTfnv3nzFq3UvhP9ipaTXEbdCyb+qYg/4LEtjQDX7oW8w90pBlXynHw
 abOrRrf7FG6vCNdroGvhKnLcjBdObg/eE9HcKgyfZudZxnXqqvoOO0l9WD7EeY03pjXX
 VGrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762279802; x=1762884602;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HBEyfODAKvgwzHmkCm17lPDKK7nQ8zv0WCO9yDZDp4E=;
 b=K9nsISGZyt+BZgGsJD4meVDdYj+byNSzGu4a0v831CsfBC7iAE7lRJgeJ/2U1ZFi7x
 4MUVxWcrQVFavI22INwe8KwINEsnaGjLjof6QBk8TKM+Qr2/6E4ZN/BnhAInK9QKPGge
 qf0w2FeGkguowPu930rjyoua0BAax00UOtnQ3beVWm7ib+bnIvId1dwWN0I2lXDSebft
 4yzGjXjODMXCRYK2whpDBCZF668n/4rXCVyRxnTU3TVjF1kX0s80NrCQ8RkZd6CDRgAK
 cTwAgRdzexo3ylHaDZBju7VvVbbIiWqwKVBkOphmmC5SLVH7TG2ds1sH9W6dJ16eCoWx
 8NFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfGaMQ5PvkxMzdtFUa4qyjixt/RorykvyW66R1l7CiTjAiItk+x14oggOHvLeinbZf8JEcYwkcHUU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyF50wSwZhAo5sK7JhVFgaquUMYJdQPpwgXpr0ELmvO7Hg69wY3
 WPWevE4pUeylBxM15MXCGwCf/yX9kD7Hl/zSgd4MDMFfZTNVMaTIU2zT
X-Gm-Gg: ASbGncuERdRfRN/qWs93azwOwestVJq4i4DOo1agczVQ9DDh9F+UPMkcvNP9DTvMdZL
 fSqy7TJrKA9+4msA8ah9xI4SsCMmZvDIwv6SYKTqw4h/qTjPcW5qGcVrj2EQTGd7bCnp7RFg6Tt
 7Sus9XoholbeCm9EULeUiPvffOUVsm/8sCxaRm9SSVkDKL8gkq6dmf+PBRWj4BKpkgvUUCRMC5J
 D1omzF1KHLZ9ZxkgfBQsFkVbwMJISfd55kxFu2rd42DjQmEu6heX2R1F+4TJuQnA7h1MzFsTWi+
 DoTzExZloN9aeS5iuq+0cTvoBBFKsXkFbGGJcKsR/ott9uj/8Pwg4CvWAgO3aI1UaE+UqZUE1wF
 eEsZAIPPLI2zwofLel4AjcZslUNz2qOFmEkTJpdyzrPnGLSl9FUFlgHixAMl6z8mFbjL4E0phc4
 x6OIcmNZEpFamhXaAz+A==
X-Google-Smtp-Source: AGHT+IE+3VWITYfmpHgFCOUqnzMrVHgHtPMl6DRBEJeRwc9yMJmO7cxC+Ce40qfK3g3txnNqIhsCKA==
X-Received: by 2002:a05:600c:6388:b0:458:a7fa:211d with SMTP id
 5b1f17b1804b1-4775ce1874bmr2405065e9.29.1762279801598; 
 Tue, 04 Nov 2025 10:10:01 -0800 (PST)
Received: from jernej-laptop ([178.79.73.218])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477558c1a03sm24688685e9.2.2025.11.04.10.10.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Nov 2025 10:10:01 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@csie.org
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 00/30] drm/sun4i: Refactor layer code for proper DE33
 support
Date: Tue,  4 Nov 2025 19:09:12 +0100
Message-ID: <20251104180942.61538-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.2
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

Current DE33 support in sun4i-drm driver is based on my PoC code. It was
written with *a lot* of hacks, because it was never meant to be upstreamed.
Fortunately, DT parts were never merged which give us a chance to do it
right.

This is first of three series with proper DE33 support for H616 SoC. It's
the longest, since it prepares terrain for new drivers in remaining series.
Point of this work is to completely decouple mixer and layer code. Till
DE3, mixer and layers were intimately connected. However, from DE33
onwards, this is no longer the case. DE33 and upcoming DE35 planes are
shared comodity between all mixers and can be assigned in any way driver
(or user) prefers. This requires planes code to be completely independent
from mixer. The only exception is mixer clock frequency which is used in
VI scaler, but in that case mixer pointer is obtained through currently
assigned CRTC.

Second series will introduce separate driver for DE33 planes and adjust
mixer code to new DT bindings. Third series will introduce TCON(-TOP)
adjustments, HDMI PHY and finally, DT updates for several boards.

Current WIP code for remaining two series can be found at [1]. Code has
been tested on Tanix TX6, which has DE3, for any regressions and on Myir
MYD-YT507H board [2], which has DE33, with HDMI and LVDS panel outputs
running simultaneously and independently. This confirms that plane code
is properly decoupled.

Please review.

Best regards,
Jernej

[1] https://github.com/jernejsk/linux-1/commits/sun4i-drm-refactor/
[2] https://github.com/jernejsk/linux-1/commits/okt507c-v3

Changes from v1:
- collected tags
- updated commit messages
- added missing kerneldoc description
- moved vi_scaler_num position

Link: https://lore.kernel.org/linux-sunxi/64c0a4e1-15a5-4f41-9fba-852b0e83fd6f@app.fastmail.com/T/#t

Jernej Skrabec (30):
  drm/sun4i: mixer: Fix up DE33 channel macros
  drm/sun4i: mixer: Remove ccsc cfg for >= DE3
  drm/sun4i: de2: Initialize layer fields earlier
  drm/sun4i: ui_layer: Move check from update to check callback
  drm/sun4i: vi_layer: Move check from update to check callback
  drm/sun4i: layers: Make atomic commit functions void
  drm/sun4i: Move blender config from layers to mixer
  drm/sun4i: ui layer: Write attributes in one go
  drm/sun4i: vi layer: Write attributes in one go
  drm/sun4i: mixer: Move layer enabling to atomic_update
  drm/sun4i: de2/de3: Simplify CSC config interface
  drm/sun4i: csc: Simplify arguments with taking plane state
  drm/sun4i: de2/de3: Move plane type determination to mixer
  drm/sun4i: ui_layer: Change index meaning
  drm/sun4i: layer: move num of planes calc out of layer code
  drm/sun4i: ui_layer: use layer struct instead of multiple args
  drm/sun4i: vi_layer: use layer struct instead of multiple args
  drm/sun4i: ui_scaler: use layer instead of mixer for args
  drm/sun4i: vi_scaler: use layer instead of mixer for args
  drm/sun4i: layers: Make regmap for layers configurable
  drm/sun4i: csc: use layer arg instead of mixer
  drm/sun4i: layers: add physical index arg
  drm/sun4i: vi_scaler: Update DE33 base calculation
  drm/sun4i: mixer: Convert heuristics to quirk
  drm/sun4i: ui_scaler: drop sanity checks
  drm/sun4i: mixer: Add quirk for number of VI scalers
  drm/sun4i: mixer: split out layer config
  drm/sun4i: layer: replace mixer with layer struct
  drm/sun4i: vi_scaler: Find mixer from crtc
  drm/sun4i: Nuke mixer pointer from layer code

 drivers/gpu/drm/sun4i/sun8i_csc.c       | 113 ++++++-----
 drivers/gpu/drm/sun4i/sun8i_csc.h       |  16 +-
 drivers/gpu/drm/sun4i/sun8i_mixer.c     | 217 +++++++++++++--------
 drivers/gpu/drm/sun4i/sun8i_mixer.h     |  65 ++++---
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c  | 183 +++++++-----------
 drivers/gpu/drm/sun4i/sun8i_ui_layer.h  |   7 +-
 drivers/gpu/drm/sun4i/sun8i_ui_scaler.c |  44 ++---
 drivers/gpu/drm/sun4i/sun8i_ui_scaler.h |   4 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c  | 244 +++++++++---------------
 drivers/gpu/drm/sun4i/sun8i_vi_layer.h  |   7 +-
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.c |  51 ++---
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.h |   6 +-
 12 files changed, 475 insertions(+), 482 deletions(-)

-- 
2.51.2

