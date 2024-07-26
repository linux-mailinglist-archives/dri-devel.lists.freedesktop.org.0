Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDF293D93A
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2024 21:45:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 611E010E294;
	Fri, 26 Jul 2024 19:45:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KBVzz+Kc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07AF110E294
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2024 19:45:04 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id
 6a1803df08f44-6b7b349a98aso7915936d6.3
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2024 12:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722023103; x=1722627903; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ij7udA+D2YyUWRgHBnNSpIqZuzldiGFVb6iQhXMCGwo=;
 b=KBVzz+KcJyduA6LqR6zXMC0pWFysSViHbovv0ka6GxxtgrkBZ1f+5fgemrpxmZOE9d
 vKziWzdE/75sHbnrmAyfVBw80i8m6qhSy9ZmSJMndXf8KViIfFyxlBIZ6TB7DglI5Byv
 CLrDhbVSbInDDYqTp/DXEBBCMPIqHGjlL70WQbZtOg5z1T7XDqNBI7QY1qvy0W4ulrlF
 0lbjgDzqDMTyAewYI/IxhGFhHDi7kKfAia1ql6SLG2rd1hOtZDtNqrKFh79nN6R5oKqT
 nCECqf1fdklAirtFJ9fnS9hUmsatTBZMQLHSKV+aWNQmX0UXdpsxKjX4L6vpKl5MAga8
 C0bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722023103; x=1722627903;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ij7udA+D2YyUWRgHBnNSpIqZuzldiGFVb6iQhXMCGwo=;
 b=rR3myGk4/9XUNA1Tvru6aFkgKcp3Va859rk4FmH2qxpWDvCb0LJVlKWVZ5heCHIWrp
 VyT2y6UyW4LYTGSwUW7MF15Jw7efavxWgqKbzWa8nxJZxBPdbeZORkFyDURKuejDF1cc
 GGCpaJYUadi5rtF4g6EDV6QV+6RbuuuKJb1Ur0++F9ceQvmkZCgp6h3jXg4OleTQ0fVH
 ZhZRuwkaeZymiSeYTWYPeQKMOQ8j9KRsN5mmB/Biuw/mZeOuhen92WcH3zwRkK2WZa/d
 nBMvwQEWh2YbZ2p2T7pWkFZBu/rZ0Zx7PEOpPruml9cVpXNvBQ/5+gQYTQ2jopR5YG/6
 yFTQ==
X-Gm-Message-State: AOJu0Yw62c7LfzyifVFsWc+lcSUa3CO30lbfPAmH8ZwNipEGUiO7Kbt5
 gq0SMSV4F119aKLINNjRZ3OPzoPRJKya7+InnB8bF3Ahq55ouIBp
X-Google-Smtp-Source: AGHT+IGt5dvyu4jj5Vq78r+w49BboaXBabmT4d7u334UZ2Zv8odJ9lpR08MB7TDHUbxTtGgFjBxY2A==
X-Received: by 2002:a05:6214:20c3:b0:6b4:fc6f:17ba with SMTP id
 6a1803df08f44-6bb55a65896mr12048276d6.33.1722023102861; 
 Fri, 26 Jul 2024 12:45:02 -0700 (PDT)
Received: from localhost.localdomain (ool-1826d901.dyn.optonline.net.
 [24.38.217.1]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6bb3f8f83c9sm19409986d6.38.2024.07.26.12.45.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jul 2024 12:45:02 -0700 (PDT)
From: Alex Lanzano <lanzano.alex@gmail.com>
To: mehdi.djait@bootlin.com, christophe.jaillet@wanadoo.fr,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alex Lanzano <lanzano.alex@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] Add driver for Sharp Memory LCD
Date: Fri, 26 Jul 2024 15:44:24 -0400
Message-ID: <20240726194456.1336484-1-lanzano.alex@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240725004734.644986-1-lanzano.alex@gmail.com>
References: <20240725004734.644986-1-lanzano.alex@gmail.com>
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

Signed-off-by: Alex Lanzano <lanzano.alex@gmail.com>
Co-developed-by: Mehdi Djait <mehdi.djait@bootlin.com>
Signed-off-by: Mehdi Djait <mehdi.djait@bootlin.com>
---
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

 .../bindings/display/sharp,ls010b7dh04.yaml   |  93 +++
 MAINTAINERS                                   |   7 +
 drivers/gpu/drm/tiny/Kconfig                  |  20 +
 drivers/gpu/drm/tiny/Makefile                 |   1 +
 drivers/gpu/drm/tiny/sharp-memory.c           | 727 ++++++++++++++++++
 5 files changed, 848 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/sharp,ls010b7dh04.yaml
 create mode 100644 drivers/gpu/drm/tiny/sharp-memory.c

-- 
2.45.2

