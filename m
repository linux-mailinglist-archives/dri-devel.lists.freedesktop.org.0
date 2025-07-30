Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5A6B158D4
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 08:17:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 220ED10E035;
	Wed, 30 Jul 2025 06:17:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="BAFmtw/n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9AEA10E36E
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 06:17:54 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-2406fe901c4so11009235ad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 23:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brighamcampbell.com; s=google; t=1753856274; x=1754461074;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=52xEfYQKRs8hJ1j3pgv2iCPTOPncEtEYrZ8Fw+FLizE=;
 b=BAFmtw/nVNhsm9c9bvbulz24rPX+sRxbnFQPWpsoPF78de9FiJ3UfgBmoXnSEOVGJz
 3YN7tB5WuHl912UiFUi0SjhfUTqQN39seVpUhCyXlq1pTWNSTDIh/i6RPm0VqIogDpOu
 nC0oqPJJnwQJ4vO3lQvqVAMpDj/wj5ZczWm20IMgm0Yzz7Kfb+sCw5/kR6C47dJyt+Jn
 qyWXEj97/m0ZdZza8+J1O2piOLLY88dreU1rUWF/fCpfG5Mi5Qtdts4nK3IhPy8rpzvW
 dL9sYiOEyL+2oHCnnrSNkF9VLjZdNEduBHgFsYTpuhdeSDymb9KNRnfe3KB/UxyWVUFi
 CsPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753856274; x=1754461074;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=52xEfYQKRs8hJ1j3pgv2iCPTOPncEtEYrZ8Fw+FLizE=;
 b=mPTsuJKAm1WsU6ej6fR/rseY/N5RwEcjf2ByytaMdfVYC/DDisXHM3Wz486jbEotef
 kAT5848sg7yspIeMznxCn4/Hl/QR5btUnkw9V/r3t9HnNDgJ7BLUokPpC1OlUhrR2DTz
 EiGBDk4WtnVr91NeFfWlR02VBzQkoKQWGVSEU7+BCbyg9/ePl0q3N5iIIMrFHwCH2kPx
 AK8u5QL+JvyVyS1WENqi9l0EsvJOSBAEMDkzdE7CQkLmtQWGGLl5zhK4B5+/nhAxEtn3
 Yjy9G2CJ7DTZtRPVn8Capdwo2l7auIvYekyCBNmtWM7MDu7w3OmLLL0JMqVEeeP6+Hcm
 ePKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8H/YB01comL5Y2YquGcFN1It5Pwgy9NNCi2/tYDD/Iw8o7SvdMOMVZ7EjIdbHyzbXFfMQzioJnoM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxGvYwhlko7i0f05IekDZWLY9l37sfM14jxk5BI5LQNtU+dvs9h
 FZ0jwWC+/4infCS8q/u9ZvH/ihBvN+YSOrwhGPtq27DJyBzooutQe89o0SZTts1fl2CGdjXtKsF
 BOs5bWtmunw==
X-Gm-Gg: ASbGncsJKgPF/0keRwD53wBRGgr07EMMFP4sKSMHGkT7bzdCYh5S+R32GsAbrNXwZ9S
 CUcfV57ekuJpxslNXkRVGlYHa1mKS8zlt2B2C2zmxTjFFIsXf0eoKO8Num6g8mgxqwLY5je2B+H
 OIM7vpXu59H71iG6BxxAS4qyGBzjEcLzjhT1AAxsdWRKdzyLSd0dKOQmdPo4OVE3OeBUWzYW2Hs
 TGTCYP4rc2odIJYoHecHv41ssDHMQhxXHc1I4hsGVyWNOlfXin0eleIrf2/YVgJMPJfIW9SdaZN
 kIhLX3SuVEosCime0CSxtb8pd5Nr9GO+bKyWwd9LAbhIHMu59OJT9mpXn2eVEszEfZOCAXpEao7
 q5hTFiSVhtAeZetd7WJcrT0wwJqi7duQ7LOPFI+HsYiSYDW6LaA==
X-Google-Smtp-Source: AGHT+IHyEWFTQDnTXUtR2Jyv+AM6C4D4XNrd6963rDHySiItD68akYv1yW4JeDtRX9x0xFCJT4X5Uw==
X-Received: by 2002:a17:903:1aa3:b0:240:8cec:4803 with SMTP id
 d9443c01a7336-24096a68233mr26935725ad.7.1753856274216; 
 Tue, 29 Jul 2025 23:17:54 -0700 (PDT)
Received: from mystery-machine.tail542cf.ts.net ([64.71.154.6])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23ffa37f078sm75017815ad.115.2025.07.29.23.17.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jul 2025 23:17:53 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, linus.walleij@linaro.org,
 neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com, sam@ravnborg.org
Cc: dianders@chromium.org, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Brigham Campbell <me@brighamcampbell.com>
Subject: [PATCH v3 0/3] drm/panel: novatek-nt35560: Fix bug and clean up
Date: Wed, 30 Jul 2025 00:17:45 -0600
Message-ID: <20250730061748.1227643-1-me@brighamcampbell.com>
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

