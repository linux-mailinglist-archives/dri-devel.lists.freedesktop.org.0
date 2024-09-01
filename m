Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D6F967BFA
	for <lists+dri-devel@lfdr.de>; Sun,  1 Sep 2024 22:11:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00DBA10E0FB;
	Sun,  1 Sep 2024 20:11:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="COqMwbpk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
 [209.85.210.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94DD610E0FB
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Sep 2024 20:11:44 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id
 46e09a7af769-70f73ca989aso839156a34.2
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Sep 2024 13:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725221503; x=1725826303; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uBC2/uLA65a/EWpnVpljuN87NwCZzasGJhTxIeoibZk=;
 b=COqMwbpkSI1+7WcmQ14jUk5sUjWj08nNMwhBnAnwtspzW4q4BWLXr/UG5xm0G317o4
 378GVwiBO6UwsRVpK83la7G/IHcI4xH81dHbDEt9ac2c024mKzNKN4E9+U1Pxe0ZyLkP
 nBQri5ZXAKOrUptTZp9wwIbNH01j2jQN4DGS1up2VKVfi3Vc9ErGMk3YYNpLEdQXMVph
 2jspn+Wbyr4ma6ZgerGkFNuEWu9eUP62lDjk/aTnc5CHuTy2+fpoXDFKS3yfu1SlbCMH
 jky6T3JwKN98DFwHpOxmbhIJqyfqml/1QNQlPzU/uVrnOsKlBFW1eI8DizSCYDWWNuTx
 zW9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725221503; x=1725826303;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uBC2/uLA65a/EWpnVpljuN87NwCZzasGJhTxIeoibZk=;
 b=dJtMxGzmuGB8O9qSMSq360wDj0ShykAVNZujgxnruat+AfzQ1SqDnDMGHVXkCoXsNi
 yyvg39PLLtoqAlz36E7kwZKozoeKRjpg+JKvh3nbkmnkyb1rI/z2spAvP9n3bh1VPuv0
 YsFhhyrfKJ8r6c/X32ixZxCXkV+aipCr5+IL/m9gk0Ke4jllhYj1+oA20O8NSFutQeZh
 d1c+el/96mSFHsUTzvdHw6ce6DcEdPojFKZoug6qp9XR5qL2yXE/9hlbslEfjo7PGGio
 Mgm0vqiDLidz4p/n4Fgng0jBjq2TbN8UbERuroyjHk0lXMmrMWWKZpfNrBEvLHBQegYs
 Kj0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXalL2dQXqpOz5LXK3WSD0fJVqqAZmzCYNyk48WDVrRrVPMkLHQTg3LI4Wyl2Y+0oYxOJfGXo42Zrw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yytqm72lrsVvxrbDYC9qKqf/tlnUqXoB3LGQLZewT//JRmxOyxo
 nXkNfWrkPoQqFs/14O5DAnsmBv12gXDnihBGLs3exbk6r3IRGSvJ
X-Google-Smtp-Source: AGHT+IFur+Spr/+YKSoyKdsfNG0q/ygJL/7E799LPj2janhXF3NGmK4P4j8JKZJ1JWgkdy+PGJK1cA==
X-Received: by 2002:a05:6830:34a9:b0:70f:3318:1c68 with SMTP id
 46e09a7af769-70f5c4280e1mr13772234a34.29.1725221503641; 
 Sun, 01 Sep 2024 13:11:43 -0700 (PDT)
Received: from localhost.localdomain (ool-1826d901.dyn.optonline.net.
 [24.38.217.1]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6c340bfa823sm35926966d6.7.2024.09.01.13.11.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Sep 2024 13:11:43 -0700 (PDT)
From: Alex Lanzano <lanzano.alex@gmail.com>
To: Alex Lanzano <lanzano.alex@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Mehdi Djait <mehdi.djait@bootlin.com>
Cc: christophe.jaillet@wanadoo.fr, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/2] Add driver for Sharp Memory LCD
Date: Sun,  1 Sep 2024 16:10:48 -0400
Message-ID: <20240901201118.3179206-1-lanzano.alex@gmail.com>
X-Mailer: git-send-email 2.46.0
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
 drivers/gpu/drm/tiny/sharp-memory.c           | 682 ++++++++++++++++++
 5 files changed, 801 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/sharp,ls010b7dh04.yaml
 create mode 100644 drivers/gpu/drm/tiny/sharp-memory.c

-- 
2.46.0

