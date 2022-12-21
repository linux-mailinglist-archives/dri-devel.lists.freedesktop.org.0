Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D647652FE1
	for <lists+dri-devel@lfdr.de>; Wed, 21 Dec 2022 11:54:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5042A10E145;
	Wed, 21 Dec 2022 10:54:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2878410E12D
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 10:54:35 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id f18so14522407wrj.5
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 02:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dYF4aCoOjNocXMp5ObQdxM+1IiESaniY5tGPacmK2hI=;
 b=UPW7reYDRuGDUoiD+Lb3uTPFeJy8MKOAkABhUJagUeaIYU2k84h1Kbzb2indRGVCZ/
 +nH3idszhlY/oUm6Zvg6tHwqhKOVw6u5cipKErnxKQsnKJ8G4IvA3UyMnfjorA8szIBA
 I9JsUylJt8PX4aPDA8l4ich2/9lN6I4mEyMBRk5iXtA6hhfqo3IxHTZFJZRjqFMLKbsp
 dEzycxHUNgzX6Ur9PxTwGkpja06mu+WlioLu0T/qj0rgpVbaFCaQJJdD17J208t5tQ1c
 T3ywqFaYmQE6qB2qnWrGLYiyPdKqjcE/oxCRMdnGXpufnq9kZVHvaGfHYtDof2gIy8sE
 hSEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dYF4aCoOjNocXMp5ObQdxM+1IiESaniY5tGPacmK2hI=;
 b=PsW2RmAFbMie4vMj+irEEkB2f2Z59WmDq6avKug8CHFtsLrITqzVX8WRjgSEQBxLXY
 9FlM9uvs94B/6JedFWF5LAWmkaWQiKWHLm6vy2B8MiQwU6EGt1L89+uCeIRc9bqIZ0bk
 JsiBvfzocfLIpTK9990/4GbkUplUvF+yYZQETovVf3dsobSHfaXK8qvu9pdaEdXD8WGt
 qreBn9jAEocvDW9PrS6Axx2xrpkQiWVVbfA4Q8tAePEmj90nl05wwaa5wQNxNKOL31gh
 IK9u0cuBfR52xCxaH5hB8nDxHnJgM9Ej/mg1MHpZKS/MV80nCW677gvbKHksJdJOiJ5H
 9RaA==
X-Gm-Message-State: AFqh2kr4uKUiRoCqgXdv7wK7B4erd7IgTc7Gruo4Wc0EL8zs0p1w7HNb
 X+BtZOC+PS7qmG0QIyYcMWg=
X-Google-Smtp-Source: AMrXdXtIftRiBiFpiF6+MSGQS3GVWuGnzm/NgMFLOBRRFdQV+jBuHN9wNcOzPNqZa5/poEcZ9eVQBg==
X-Received: by 2002:adf:eecf:0:b0:24a:852d:e292 with SMTP id
 a15-20020adfeecf000000b0024a852de292mr779711wrp.46.1671620073626; 
 Wed, 21 Dec 2022 02:54:33 -0800 (PST)
Received: from localhost.localdomain ([37.55.203.63])
 by smtp.gmail.com with ESMTPSA id
 y5-20020a056000108500b0023657e1b980sm15080156wrw.53.2022.12.21.02.54.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 02:54:33 -0800 (PST)
From: Markuss Broks <markuss.broks@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] Add generic framebuffer support to EFI earlycon driver
Date: Wed, 21 Dec 2022 12:53:57 +0200
Message-Id: <20221221105402.6598-1-markuss.broks@gmail.com>
X-Mailer: git-send-email 2.39.0
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
Cc: Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 linux-fbdev@vger.kernel.org, Muchun Song <muchun.song@linux.dev>,
 Markuss Broks <markuss.broks@gmail.com>,
 "Paul E. McKenney" <paulmck@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-efi@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Helge Deller <deller@gmx.de>, Randy Dunlap <rdunlap@infradead.org>,
 linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kim Phillips <kim.phillips@amd.com>, Will Deacon <will@kernel.org>,
 Jami Kettunen <jami.kettunen@protonmail.com>, linux-serial@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Borislav Petkov <bp@suse.de>,
 Jiri Slaby <jirislaby@kernel.org>, Ard Biesheuvel <ardb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make the EFI earlycon driver be suitable for any linear framebuffers.
This should be helpful for early porting of boards with no other means of
output, like smartphones/tablets. There seems to be an issue with early_ioremap
function on ARM32, but I am unable to find the exact cause. It appears the mappings
returned by it are somehow incorrect, thus the driver is disabled on ARM. EFI early
console was disabled on IA64 previously because of missing early_memremap_prot,
and this is inherited to this driver.

This patch also changes behavior on EFI systems, by selecting the mapping type
based on if the framebuffer region intersects with system RAM. If it does, it's
common sense that it should be in RAM as a whole, and so the system RAM mapping is
used. It was tested to be working on my PC (Intel Z490 platform), as well as several
ARM64 boards (Samsung Galaxy S9 (Exynos), iPad Air 2, Xiaomi Mi Pad 4, ...).

Markuss Broks (2):
  drivers: serial: earlycon: Pass device-tree node
  efi: earlycon: Add support for generic framebuffers and move to fbdev
    subsystem


v1 -> v2:

- a new patch correcting serial/earlycon.c argument name to "offset" instead
  of "node"
- move IA64 exclusion from EFI earlycon Kconfig to earlycon driver Kconfig
  (IA64 has no early_memremap_prot)
- move driver from fbdev to console subsystem
- select EFI earlycon by default
- fetch stride manually from device-tree, as on some devices it seems stride
  doesn't match the horizontal resolution * bpp.
- use saner format (e.g. 1920x1080x32 instead of 1920,1080,32).


Markuss Broks (3):
  drivers: serial: earlycon: Pass device-tree node
  efi: earlycon: move to video/console to prepare for changes
  efi: earlycon: Add support for generic framebuffers

 .../admin-guide/kernel-parameters.txt         |  12 +-
 MAINTAINERS                                   |   5 +
 drivers/firmware/efi/Kconfig                  |   7 +-
 drivers/firmware/efi/Makefile                 |   1 -
 drivers/firmware/efi/earlycon.c               | 246 --------------
 drivers/tty/serial/earlycon.c                 |   3 +
 drivers/video/console/Kconfig                 |  11 +
 drivers/video/console/Makefile                |   1 +
 drivers/video/console/earlycon.c              | 305 ++++++++++++++++++
 include/linux/serial_core.h                   |   1 +
 10 files changed, 336 insertions(+), 256 deletions(-)
 delete mode 100644 drivers/firmware/efi/earlycon.c
 create mode 100644 drivers/video/console/earlycon.c

-- 
2.39.0

