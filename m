Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFEE3993D43
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 05:04:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06A3110E447;
	Tue,  8 Oct 2024 03:04:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cYXZUfEI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB07B10E447
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2024 03:04:50 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id
 af79cd13be357-7a9ab721058so519144985a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Oct 2024 20:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728356689; x=1728961489; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QGhZ9VuDoP4GsoTXaMvOaT1WODV/aEdRH+9/FcI3aps=;
 b=cYXZUfEIARm/GKbOSoGuDB1HfxlIWXF2FCz4pM10eUM4v25wSTkFZ2GU5tL1zFkHBO
 MdmUzqUC6/1lQSt9vf1w+iust+inhozhbiRi8ugfcLjmERREIrSrK98cXKH6RvsP6PXr
 zHNMF65nY55BY0vnA8O/2+FL+mUhL9yn7q0H9XaNiaL4QhUrhIS28mM8k2EDIBi58+Em
 d6WEGRXrmiMfa833KX0Bvlg/gHRT7NGvcqOLoCBqHDYzWrm5qz6uhwZDVn9iXylfjiwy
 eDKC8wUUnAeT+TxCViFwjjF4Sv6+D8eAbOzmN38+RBVv0vym8R6OpD026hWJKMTUc5+D
 x8xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728356689; x=1728961489;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QGhZ9VuDoP4GsoTXaMvOaT1WODV/aEdRH+9/FcI3aps=;
 b=pAaGnk/678b/pj9AuNasaDroDj8Psnkjn01VADJ+zByntpKKaAr+ovkf3fK+Q6SdFp
 nUolL5Iv/1MrA1vhvAnQ13JLVeX34KnzuvhuS4x5oM/v7QSvu+YqEgzN4e1aUI3nfeRa
 UQPsJKAQgGmOi/4+n51rNilOuCAz5F1AZVHVRftMIqIpZdjgNK8/qkMmbh5z4fDQB2Y2
 2cH+4GzCR8DHieV+g6Nr4lzPQFHFPccHtYU6fWcXozU4LNRdr45VSc6bgoEXepmO21JX
 of+uy+jLrIfroNurlPlGJilUfdRQJAvVptCphETBSsY3+Ef88FwA0cbtdbVH3RlC2MzB
 IHnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnCxwaSrMbch7ty/d7nM2rkbYAMN5YkVGGwFICI5xtjIyM/9uRiLCV+wmLi6mQrBkb8mJCd/97wJY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyDyB0JH3clUd1qyJABW97R6EyhZCWs4yYcY102cmIn7gouIqFj
 XGeHJhDeMazkPOEyFwZ2BCn4gjx7ThNf+ka8ni4B6SRL0kCvzCGt
X-Google-Smtp-Source: AGHT+IEogcPxh7rtiPjTL7FYbzz/R9JCFjhQzfI0u9Q655Yju+TjjSDcnvCTZAxwaHKGj7/ldWfmCQ==
X-Received: by 2002:a05:6214:4291:b0:6cb:4835:b1bc with SMTP id
 6a1803df08f44-6cbba921706mr41803976d6.4.1728356689370; 
 Mon, 07 Oct 2024 20:04:49 -0700 (PDT)
Received: from localhost.localdomain (ool-1826d901.dyn.optonline.net.
 [24.38.217.1]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6cba46f1912sm31107156d6.61.2024.10.07.20.04.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2024 20:04:48 -0700 (PDT)
From: Alex Lanzano <lanzano.alex@gmail.com>
To: u.kleine-koenig@baylibre.com, Alex Lanzano <lanzano.alex@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Mehdi Djait <mehdi.djait@bootlin.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: [PATCH v10 0/2] Add driver for Sharp Memory LCD
Date: Mon,  7 Oct 2024 23:03:09 -0400
Message-ID: <20241008030341.329241-1-lanzano.alex@gmail.com>
X-Mailer: git-send-email 2.46.2
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

This patch series add support for the monochrome Sharp Memory LCD
panels. This series is based off of the work done by Mehdi Djait.

References:
https://lore.kernel.org/dri-devel/71a9dbf4609dbba46026a31f60261830163a0b99.1701267411.git.mehdi.djait@bootlin.com/
https://www.sharpsde.com/fileadmin/products/Displays/2016_SDE_App_Note_for_Memory_LCD_programming_V1.3.pdf

Co-developed-by: Mehdi Djait <mehdi.djait@bootlin.com>
Signed-off-by: Mehdi Djait <mehdi.djait@bootlin.com>
Signed-off-by: Alex Lanzano <lanzano.alex@gmail.com>
---
Changes in v10:
- Address comments from from Uwe
    - Replaced -EINVAL with PTR_ERR
    - Error check pwm_apply_might_sleep function
    - Remove redundant error message

Changes in v9:
- Move pwm and software VCOM generation to probe/remove functions instead of crtc enable/disable functions.
  pwd_disable will suffice on driver removal.
- Change comment format to match Linux Kernel style.

Changes in v8:
- Addressed review comments from Uwe
    - Replace pwm_get_state with pwm_init_state
    - Use pwm_set_relative_duty_cycle instead of manually setting period and duty cycle

Changes in v7:
- Add Reviewed-by tag back to dt-binding patch

Changes in v6:
- Rebase off latest drm-misc-next
- Replace pwm_apply_state with pwm_apply_might_sleep

Changes in v5:
- Address minor style issues in sharp-memory.c

Changes in v4:
- Remove redundant dev_err

Changes in v3:
- Fix file path in MAINTAINERS file
- Address review comments
- Simplify mode selection based on match data instead of model

Changes in v2:
- Credited Mehdi Djait in commit messages
- Renamed sharp,sharp-memory.yaml to sharp,ls010b7dh04.yaml
- Using strings instead of int for vcom-mode in dt-binding
- Fixed indentation of binding example
- Removed binding header
- Removed extra whitespace in sharp-memory.c
- Fixed error handling in sharp-memory.c
- Added match data to of_device_id table to be in-sync with spi_device_id table
- Replaced redundant function with spi_get_device_match_data
- Sorted header files in sharp-memory.c
---

Alex Lanzano (2):
  dt-bindings: display: Add Sharp Memory LCD bindings
  drm/tiny: Add driver for Sharp Memory LCD

 .../bindings/display/sharp,ls010b7dh04.yaml   |  92 +++
 MAINTAINERS                                   |   6 +
 drivers/gpu/drm/tiny/Kconfig                  |  20 +
 drivers/gpu/drm/tiny/Makefile                 |   1 +
 drivers/gpu/drm/tiny/sharp-memory.c           | 669 ++++++++++++++++++
 5 files changed, 788 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/sharp,ls010b7dh04.yaml
 create mode 100644 drivers/gpu/drm/tiny/sharp-memory.c

-- 
2.46.2

