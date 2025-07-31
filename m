Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C59AB16ACE
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 05:23:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB19110E23B;
	Thu, 31 Jul 2025 03:23:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="Do3iedgX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8497610E23B
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 03:23:49 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-2402774851fso5103985ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 20:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brighamcampbell.com; s=google; t=1753932229; x=1754537029;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=o/0ay50DHxiyPzyuFZGUiLzFtgNbpo/gDuEWB9tyHxI=;
 b=Do3iedgXn39QRla2dMgLx1a5iFFXt9yG1qtCzJQC3cffoWMBQqlwoy31XLnYwmdwNh
 QtKsUtO/8m4kG7t4hlA2TXWQDV1DIK58ami5lKH1krjxdHJMVLgLj3aIKAXalpbPHcsg
 UTSynk4OMhrRLQIxNPtdmQel/1rpYCkRAA64wVQfEztkbF/3Em56nFSk1piQBEox7hsf
 jzJfbJrkDZrUTW01cuXYQ+gzDTI8+4yc/YY8abN24+CkVoAupvdb7gw0d3ln49eFFhrh
 uEWE/EHPPGsIPw6HaN+dmG6+c3auYyTf8W3HIVZFOa02uYkIikxd4uGywNTh1AkG+dtR
 gtbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753932229; x=1754537029;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o/0ay50DHxiyPzyuFZGUiLzFtgNbpo/gDuEWB9tyHxI=;
 b=g/ZyEAlU04Co018zMeo6nj4D7hsH+ochQWRzyhnd+WJxk+cX/n3Kbib322Xo5LAc/J
 ztOsvwJ/hTvZ9x+G11AwjtvatiuzzjzGI48kTA05JfjuzqB1q2UDkwbetv7A4McBZsZo
 Rk7Q1LzNAtvdY+a3AluxOw21i+eLjpU9wtdK5dB1X0S4SbfYE2goh2ysYS+O7XG1iTgT
 WQCKRvl8DxjJzAC42YF1WrvPxq4pqPUSD4OFW4osxzn2pCagQ56Hx2SDxItyVTGYxDxD
 A8o0rZs9RzIObF9fSaTzWqUZvD3LFx+G2KIurPd40zjNkCU3uKkNKwvd6ns7R942SK42
 xPsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8s2t7eubOyMfNIDFDFtFD+3u3HjLBAX5Qu4KfykMjPpXIcr9PfDigAZVNSYUZQobud4MtW3dSak0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywbk8BACFImEBxA981IF1VQmpFdMpFBwdbnJFJh3ljdM44WIk9C
 BE0kcF7XeaGRD0tmDCLWL/wmMbZn43wQk5ZrAeHJ55mIVe/YzV2OnwH13qIfamESN4s=
X-Gm-Gg: ASbGncsDQR1I5rLH3wHW45OzUXBUiwlT9mlNbJ1eeCkGiI03BFrsRGMdZLy8BILgqSD
 fIbgHcs8xrzHX9t83IGINkqa8e9yJsdEEL3XM+CAKq9ZRLi+wr5B3hpjSOtK6Enr3qh1HlYKFT+
 eYkZK+cK85T84vhQG04tICTM+yMiwNH62xLAlF+fjw0X/eqiB1zMVF1iyzfqDClhlu6OnZsPQOB
 hRFSrfBlCWx3kFUbavkzMu+If/0bnDBcU1DQNiAYSiKWT3WP6SG3IRrSM9WV6yHtmAs579blyys
 OwUi+VZhnoV99Dxj0HurAZpkT81jZYLGYzAguh5bl0du9o/O/u/AOgTO14U6Oi2lwjOZlH92NlZ
 psUso+jjMZb0cmFRnHoSljgxkZGDn+5hxJkLHxcd4oPWoqkXRKN2kPpnCKYaO
X-Google-Smtp-Source: AGHT+IFbmyHUAZjzYXWConGjVtJnP4/KGTKSPvl0mvsildNQPPwPbZ1hL2oDeNwXOjX58/iQ7MIXHg==
X-Received: by 2002:a17:903:1967:b0:237:e3a0:9d63 with SMTP id
 d9443c01a7336-24096b62eeemr79230975ad.43.1753932228913; 
 Wed, 30 Jul 2025 20:23:48 -0700 (PDT)
Received: from mystery-machine.tail542cf.ts.net ([64.71.154.6])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241d1f15092sm4854795ad.66.2025.07.30.20.23.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jul 2025 20:23:48 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, linus.walleij@linaro.org,
 neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com, sam@ravnborg.org
Cc: dianders@chromium.org, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Brigham Campbell <me@brighamcampbell.com>
Subject: [PATCH v4 0/3] drm/panel: novatek-nt35560: Fix bug and clean up
Date: Wed, 30 Jul 2025 21:23:40 -0600
Message-ID: <20250731032343.1258366-1-me@brighamcampbell.com>
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

Fix bug in novatek-nt35560 driver's nt35560_set_brightness() which
causes the driver to incorrectly report that it "failed to disable
display backlight".

Add mipi_dsi_dcs_read_multi() to drm_mipi_dsi.c for improved error
handling in drivers which use mipi_dsi_dcs_read() multiple times in a
row. Add mipi_dsi_dcs_write_var_seq_multi() and
mipi_dsi_generic_write_var_seq_multi() to drm_mipi_dsi.h to allow
drivers to more conveniently construct MIPI payloads at runtime.

Clean up novatek-nt35560 driver to use "multi" variants of MIPI.

Changes to v4:
 - Replace "non-static" in kerneldoc comment with "non-constant"

Changes to v3:
 - Fix incorrect Fixes tag. The bug was introduced by an earlier commit.
 - Minor formatting improvements.

Changes to v2:
 - Separate bug fix into its own commit for backporting.
 - Add var_seq_multi() variants of MIPI write macros for sending
   non-static MIPI messages.
 - Minor formatting improvements.

Brigham Campbell (3):
  drm/panel: novatek-nt35560: Fix invalid return value
  drm: Add MIPI read_multi func and two write macros
  drm/panel: novatek-nt35560: Clean up driver

 drivers/gpu/drm/drm_mipi_dsi.c                |  37 ++++
 drivers/gpu/drm/panel/panel-novatek-nt35560.c | 198 ++++++------------
 include/drm/drm_mipi_dsi.h                    |  35 ++++
 3 files changed, 132 insertions(+), 138 deletions(-)


base-commit: 33f8f321e7aa7715ce19560801ee5223ba8b9a7d
-- 
2.50.1

