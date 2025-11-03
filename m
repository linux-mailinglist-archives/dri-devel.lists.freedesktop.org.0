Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA23C2B3D7
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 12:07:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 645CE10E1C9;
	Mon,  3 Nov 2025 11:06:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YJLwFjpe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1EDA10E1C9
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 11:06:58 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id
 d9443c01a7336-2952048eb88so41950495ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Nov 2025 03:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762168018; x=1762772818; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=msKPrbmLk4Pe+fn3QzDxAI35yUJEjQv+lopXWiS4lts=;
 b=YJLwFjpeiVhX+a7xTy5OiiqYLFFTlVDBz2dxqAR/cxyVymtCgliAZ8QCTXWgvZPSlh
 nDT1UfcOUKrUY6n1EbR3DTWSKe7Gwj25W5ic3e0MN5j9sV0zu2X1owQML1ht2p2oJ1ew
 OroWmssL+keNu3Nes1cqHEkAWCGMbP/BgCfSW3o3VsbsNtlcWb3/XNjlrRYW4CJhJMeA
 4p7wSqku/DYYF9WT1k+oLzv7QSKiVm8BiTWqvWfbF5yCjdTO8WziWq4vTinY7PB36mjs
 QxNBLPltxStlzCxhw/kqfVKYc+GwfQ46assdjHpWbZlj7mAJ//VQH/tnbQaQiXPmk27R
 h/yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762168018; x=1762772818;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=msKPrbmLk4Pe+fn3QzDxAI35yUJEjQv+lopXWiS4lts=;
 b=TosktUJjpTnFc3yCmw13VxOfnQK6dBmPPHOA7dRxTUnL1Q+acgpD1ryKmLHe/zGzot
 znzQniC9R9845c2L0IyqhNy1zZ9GqGA1eSUA5CFMihAwwygS4p46rxLRgZ91V1gSfokB
 fDmoEQ8wMs3MJEqSAZGCvZZE/TtY8Nx+WLHFJIPSvNOmYmuxwduJdZirmMS+ebogdskC
 GvFt6baa99zStWz+3jTXjC88QPb+8q3rmdohRdD7XaBkmjJtZcEIrZcbXIpinFTyI3ng
 nYNBGYZlfcmosvvjNt3QBxNxP6M8+JugQlE2RQdmrL/offI40XlU2I1+5A/jhSB2UvdL
 RsdA==
X-Gm-Message-State: AOJu0Yx5bQi1gi2oW9FM8P9ZEEko2B2JUC5n4eQ/vXiQtmSN5pG8+SM7
 z6wtKmqTJbg8sBwTO809cvYSGKgOxhzJQVN2YqDvqM7zxJd06ZTnF3J13Qx13jXHl1N5NA==
X-Gm-Gg: ASbGncuZ3F8KPlxkubnUptnLAK4E38dzA54DcRvK7i0s7rjq8EpdrMNOU/nm076jRtS
 1Uq1dnN/X9WfN/tVYvHYiToR+62PNTD9Fpc5s/SxZ+BV3lCa0KQHkj0JiF6Rn+iQuX+MhDsIcqp
 xGepPv5UPbSx9ivOkYcG1yD4GPWLFmRq8rS/H5oM7BdG1xFcL8kX0YDPcUX7SFzD8xP+mIJvMQY
 nPCdPh6jH0cpEOpUPps4mIhGJ6Gu4hS6XOlbntlLOrHn2EB1nDEzcfcFBPhdBsqdKiqbOGO/Z5K
 bJc/v+TvWDKsr0PCHoRkPJgLMqCg/2l8oGxN6YpjDCLlLZu5JRA+Wwh3WguU7Zd+bISJWJxsFfn
 m1T2/5mL4fQUrIivCWoW5N8TF7RxLTZ8JJ6CKCv3tR99q/StYr2SEWSM6fYHIlxAFkCGJb6a6Po
 Ob15fB129ALEoRZeK8CQ==
X-Google-Smtp-Source: AGHT+IG3q2ScRjcYVlSQKEOGzfSShOd+VCm6j/zTtP/syrwGIinOh8u7Pw68B0XoVDTjaFHiUhDd5Q==
X-Received: by 2002:a17:902:e74b:b0:269:b30c:c9b8 with SMTP id
 d9443c01a7336-2951a55923fmr150821025ad.56.1762168018110; 
 Mon, 03 Nov 2025 03:06:58 -0800 (PST)
Received: from VM-0-14-ubuntu.. ([43.134.26.72])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2955615d720sm84025575ad.65.2025.11.03.03.06.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Nov 2025 03:06:57 -0800 (PST)
From: Junjie Cao <caojunjie650@gmail.com>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, Pengyu Luo <mitltlatltl@gmail.com>,
 Junjie Cao <caojunjie650@gmail.com>
Subject: [PATCH v2 0/2] backlight: aw99706: Add support for Awinic AW99706
 backlight
Date: Mon,  3 Nov 2025 19:06:46 +0800
Message-ID: <20251103110648.878325-1-caojunjie650@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Pengyu Luo <mitltlatltl@gmail.com>

Add support for Awinic AW99706 backlight, which can be found in
tablet and notebook backlight, one case is the Lenovo Legion Y700
Gen4. This driver refers to the official datasheets and android
driver, they can be found in [1].

[1] https://www.awinic.com/en/productDetail/AW99706QNR

Signed-off-by: Junjie Cao <caojunjie650@gmail.com>
---
base-commit: 72fb0170ef1f45addf726319c52a0562b6913707
---
Changes in v2:
- add handler for max-brightness and default-brightness
- add properties(max-brightness, default-brightness) (Krzysztof)
- use proper units for properties (Krzysztof)
- drop non-fixed properties (Krzysztof)
- include default values in the aw99706_dt_props table (Daniel)
- warn when a property value from DT is invalid (Daniel)
- drop warning when optional properties are missing (Daniel)
- add a function pointer into the aw99706_dt_props table to handle lookup (Daniel)
- use a lookup function instead of hardcoding the formula for the iLED max (Daniel)
- move BL enalbe handler into aw99706_update_brightness (Daniel)
- Link to v1: https://lore.kernel.org/linux-leds/20251026123923.1531727-3-caojunjie650@gmail.com

Junjie Cao (2):
  dt-bindings: leds: backlight: Add Awinic AW99706 backlight
  backlight: aw99706: Add support for Awinic AW99706 backlight

 .../leds/backlight/awinic,aw99706.yaml        | 100 ++++
 MAINTAINERS                                   |   6 +
 drivers/video/backlight/Kconfig               |   8 +
 drivers/video/backlight/Makefile              |   1 +
 drivers/video/backlight/aw99706.c             | 492 ++++++++++++++++++
 5 files changed, 607 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/awinic,aw99706.yaml
 create mode 100644 drivers/video/backlight/aw99706.c

-- 
2.51.1.dirty

