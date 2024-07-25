Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2085693B9E9
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2024 02:48:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 438B610E11D;
	Thu, 25 Jul 2024 00:48:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="F7uGiS80";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com
 [209.85.217.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E1F210E11D
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2024 00:48:02 +0000 (UTC)
Received: by mail-vs1-f41.google.com with SMTP id
 ada2fe7eead31-492a8333cb1so123554137.3
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 17:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721868481; x=1722473281; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wHKWUDPIV4clF6YOoBaSMKxb/Zv5MDSd4xPKLGghseo=;
 b=F7uGiS80m1p3IGIjCBmyDJGbrUghN8qxClFQTiZoxyk/n8PAWrq3j6QJAElZJ0I/8r
 z+w+lCGOu1K7BZucVUyCEr0kTYA1vy3pJNepef2VAd5el5iIn/yrLq+7Ulxjs4ixGSZw
 sL6HEzZJuWvR2CWA1atP0qvSDoZpHEl4xp55wc4qWwYNGuc2CYpEbSxDHaVJQXVPVIw1
 O0xGcYy2Uu3J3qJ86+qZv+W1BhJ51WlZyy+St4kSn5kZm+bGBR/1/EznSNJO9yhn+9Ji
 CLQADVzD+pxIJOTZt8iRYm1xF6XC0vK8ls+ozOBpAG2EvzWfkzyPq25uvU2OGL9XR1ST
 kSZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721868481; x=1722473281;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wHKWUDPIV4clF6YOoBaSMKxb/Zv5MDSd4xPKLGghseo=;
 b=JoyQo/JIw9KGVyuJxacfVb7Oa5wrVeVmal+7OOe5jLmEhMyfYZtZO+pVqtRa+HxKO/
 pFJgQNbkR4JrJc9sax9h9ml0fW8FXjsB5juJH4BVEE213Gm60MeILqbILc2OrjO8JTW1
 vi1b+Z+DGbU5DgKThJplahnBQdXgvdj2ZleGT90fLiPAB4wispy09vf6XxkIU0O/CJ4b
 ckztjehoAiIlhwoUUPaBI1m2ghaBhoMZUc+n3vh8UzaC7//HHyCswNrxqmJA2WIX33VD
 e/FCrLzbob9Se+yej6DztjvdtqV2wA8aViOn6d86TsbqJ5LzbTGqvpWeZEqGgD7wi5Y7
 9geQ==
X-Gm-Message-State: AOJu0YwsAz5nt3HsbOYUSAcWOGUNA7Ap2naG5RZDS+bqyanSdmAjSkKc
 HpgwjNXj4M2pEpVcOSaDYgQRfEszWgJpv5QU3WYA682XcEfIZr4B
X-Google-Smtp-Source: AGHT+IEk+USncAJXYQ/qAoPZDDO3Y90etc9xEl5EV1x0/2+kl+CiyTfU1zbBKBON3fuy2iBElf26HQ==
X-Received: by 2002:a05:6102:3fac:b0:48f:428a:2379 with SMTP id
 ada2fe7eead31-493d65425ccmr1622793137.30.1721868480883; 
 Wed, 24 Jul 2024 17:48:00 -0700 (PDT)
Received: from localhost.localdomain (ool-1826d901.dyn.optonline.net.
 [24.38.217.1]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a1d74353e6sm19339885a.87.2024.07.24.17.47.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jul 2024 17:48:00 -0700 (PDT)
From: Alex Lanzano <lanzano.alex@gmail.com>
To: mehdi.djait@bootlin.com, Alex Lanzano <lanzano.alex@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Add driver for Sharp Memory LCD
Date: Wed, 24 Jul 2024 20:47:01 -0400
Message-ID: <20240725004734.644986-1-lanzano.alex@gmail.com>
X-Mailer: git-send-email 2.45.2
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

Alex Lanzano (2):
  dt-bindings: display: Add Sharp Memory LCD bindings
  drm/tiny: Add driver for Sharp Memory LCD

 .../bindings/display/sharp,sharp-memory.yaml  |  97 +++
 MAINTAINERS                                   |   8 +
 drivers/gpu/drm/tiny/Kconfig                  |  20 +
 drivers/gpu/drm/tiny/Makefile                 |   1 +
 drivers/gpu/drm/tiny/sharp-memory.c           | 741 ++++++++++++++++++
 include/dt-bindings/display/sharp-memory.h    |   9 +
 6 files changed, 876 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/sharp,sharp-memory.yaml
 create mode 100644 drivers/gpu/drm/tiny/sharp-memory.c
 create mode 100644 include/dt-bindings/display/sharp-memory.h

-- 
2.45.2

