Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C08A4B11220
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 22:23:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C154D10E09B;
	Thu, 24 Jul 2025 20:23:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="aQMUfLNm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D914610E09B
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 20:23:43 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-235f9ea8d08so12559615ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 13:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brighamcampbell.com; s=google; t=1753388623; x=1753993423;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aNZbwQw5iHEb9CKajVAO1swZ1MthUYrqZ1xdxET+ZZU=;
 b=aQMUfLNmcStO4qjZdqfKRQ/Qlc7iTw7ImBUyDNP0c7XmzemvzPQMc0vSplPoQ18GU0
 yzHL/tn+YSi0jeyNN3ahfVh7tH5I5dCbH4ELVJBRazQI19T8/jG1fQdgb+tNC/BPMitp
 Sijtj420bsiFabCjct3CfKD5u/HE5Y4EbecHyw/4MvS91GDKrB0lYeBLMj+NEx5oPY1D
 l8MAzYtGz7mlrKDi73Y3gvyEmdV8z7RXNkS+6ppbZPkZr7qX0YLgffUFQUfAZ6rJUhRZ
 bO56ptu9Guu+KnDZOqVBDZr4gHE+qelnrpobVgNeo9f/Plmn03PX53v7AJE6D8Nrx4qe
 OQRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753388623; x=1753993423;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aNZbwQw5iHEb9CKajVAO1swZ1MthUYrqZ1xdxET+ZZU=;
 b=KR54Cw1w/CUkbitKkUDBFzXCn6U3OBD+nVhTAVXOS3TpgvlK8vqm6SwQxMc8lIfxHW
 GQcwHQ6bKAUYaHwIgpWDM1R6HCh/tNLZefIVMX+SieMj+IEUM41dw4QOf4jUtYD3IKvy
 UwmREHSb7vJ/JSn10ihZTJpfVppGmEpL/r2/TjNjKYfdVP2zNv41rBMXVdthiYnv548E
 TackVG+sxJ97M7cBNekqR88Xay+mkk1XgEH1EbFPlGmyYadpbyEmVGryoVVMGPlJ+6ao
 BcjXRDlpH6HgxcmWXVyADA+tFXskfzDJgy13PkC/pkETXt4CeetsedQF42iBECJ54ecu
 Qb4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMc1AgnoBr4lsRgrK3p6RsN4HrJn0a5voyzmteInw/mCuK1lmQy4Qfed3X+mNsC8xT+cFobfO1KJ0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw00s0x1qkwJdoxNrpkqYj9dsBxaHG9ltVHhZGQj3iVgulLD1uT
 Eek7hnFQ0hQo4FmEX0IC0hkeBF37vvUUNGALP9Ieq3mStNXtXnXlozd1AR3JxXmO7I8=
X-Gm-Gg: ASbGnct01pfx+RB+6Ta+E01rVirAUH41pcgsoD8CHxxIm+wCOjvrZxrtcmVnuXohCEN
 gYYlJm1k5Cn1fwH+pqabk2M/fYEkYeDiLnKbzm0IfEx2RAFqyJrWLHWO+9qg/uQtmAZjUcufBuY
 8m0IXd6UA6fUL3r4Ix2AvlO1N0p0a7BIzZFmf7Ys250b/mfBV2pQdI4/WOz10c0sqqlWti311KS
 NGb7FJLN5HEL9RASr9Wefp31EemeGVOBWcZSGdUbclO/g3WokOUpqqWik4H0YakdoYQdi6LYL8u
 BO3+6AvzekkOoGf4HOm2d7Obfgdpr+W6BpVjYYBzM93LGml52GuGrf5ztwzI1zt+P9DAbPU+1uq
 ue22JHYijKUH27oHCakD8gghD1XhZ508QIWJSg/dezpn5ybI0NA==
X-Google-Smtp-Source: AGHT+IGPSLo7EaVXZqu37vUKdjxS3cia3ql+tqXEMZ48FC5JJP2rAz+cHkmUkDzlL3JzUsZOXDC49Q==
X-Received: by 2002:a17:903:8c8:b0:23f:6fa4:1567 with SMTP id
 d9443c01a7336-23f98146861mr98965735ad.8.1753388623215; 
 Thu, 24 Jul 2025 13:23:43 -0700 (PDT)
Received: from mystery-machine.tail542cf.ts.net ([64.71.154.6])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23fa48dbfccsm22077815ad.138.2025.07.24.13.23.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jul 2025 13:23:42 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, linus.walleij@linaro.org,
 neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com, sam@ravnborg.org
Cc: dianders@chromium.org, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Brigham Campbell <me@brighamcampbell.com>
Subject: [PATCH 0/2] drm/panel: novatek-nt35560: Fix bug and clean up
Date: Thu, 24 Jul 2025 14:23:36 -0600
Message-ID: <20250724202338.648499-1-me@brighamcampbell.com>
X-Mailer: git-send-email 2.50.1
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

This series does the following:
 - Add mipi_dsi_dcs_read_multi() to drm_mipi_dsi.c for improved error
   handling in drivers which use mipi_dsi_dcs_read() such as the
   novatek-nt35560 driver.
 - Fix a bug in nt35560_set_brightness() which causes the driver to
   incorrectly report that it "failed to disable display backlight".
 - Clean up novatek-nt35560 driver to use "multi" variants of MIPI
   functions which promote cleaner code.

If there's a reason that mipi_dsi_dcs_read_multi doesn't exist, I'm
happy to drop it.

Brigham Campbell (2):
  drm: Create mipi_dsi_dcs_read_multi()
  drm/panel: novatek-nt35560: Fix bug and clean up

 drivers/gpu/drm/drm_mipi_dsi.c                |  37 +++
 drivers/gpu/drm/panel/panel-novatek-nt35560.c | 212 ++++++------------
 include/drm/drm_mipi_dsi.h                    |   2 +
 3 files changed, 105 insertions(+), 146 deletions(-)


base-commit: 1511d3c4d2bb30f784924a877f3cef518bb73077
-- 
2.50.1

