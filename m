Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F27B87818
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 02:37:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49B4F10E90D;
	Fri, 19 Sep 2025 00:37:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Db6dny+B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC01510E123
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 00:37:03 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-3304dd2f119so1109787a91.2
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 17:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758242223; x=1758847023; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+BZ6UPkHLusu3qwn8I/3S9JaRleSEd5bS7OxTGQX0u4=;
 b=Db6dny+BCXJZMMlg5cufw27OEvENGuEW4HcDls116PADo7Iem8g6vul3ugwxZ25d0G
 ntO16eqizm5fVoM6llhh6a29PMOnwXn/JvuVhQhPcw9Mf5nu0beOqJpcLWgeLZt4LU06
 GidTOZO4lXg4jYFXMTeJ4sX8ijcuqPwvVepMl24J813r+RlrgfACEMpVrWOUwvypPyc8
 d6GpZbM+ARVQMhiPtz+dAeiJXZO+1ITneyKp9o+ojhsYZwP5OBsZTLOOUZmZCz1wRqyS
 V35iPowempJoQhWZGPcs4gMuTJfdBDPWGuDpaYablw9FLawNsaxNiNZieUrqb/hT7KJZ
 HoAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758242223; x=1758847023;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+BZ6UPkHLusu3qwn8I/3S9JaRleSEd5bS7OxTGQX0u4=;
 b=GuS90OXQhd2SzDgM2QIQC4xyx5stRJoHF4acW6fjJylhhDrvWNyG1yq8ZC5qpulQRu
 osumwq3cF0wLLzgWBCC1V5FK/BKO1CCDFuQXf2rMbBKDYvZtWJL+ITswc8t/u7yGq6Yu
 A0trmtGzeLUhoCY01Wv1OmVnEPP7yD5X5PZ+HwkYI2HIUtlI4fCE7IREdSjUES6Nf/Vt
 pwwnnaGjdXtkX0GWxCG9VNhoYgWUm/7gi9lMzp5fYB2snd6FjSlXFwBMpLNZYxkJdruN
 60cRu37gnn7J8NR3lx9o9S4R0qc+ehRnEMJ1N52+pktFq/4vkayMl50omKZ4shoLOE9r
 dFwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSOoav4drlXd3gcm3FCYsNJ9aue0qfnpwZ9g4uPVC57v3bfkKLXZMDNfQZQGHwp7auT8OFq4RpEAA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyUJ/PLPWCwpPR294G8lv9jh+xcdKv2Z0IPhWRieS8G0L8S1TbW
 QlXqsp5+eLCDWKdjFPFwnQiJBYS7c/l5xRmeEJAeYAGP0l2zNR3A5G70
X-Gm-Gg: ASbGncs0a34Rg8gHJO1JfgecY4la4yT6wJYNnKj6dhQ/Vo+WkbvRWxo2tG1dcy2JGYX
 ifGAqX0am/zOreX7g8q8quXyPBoRGKRrObSc9weqrE0P07OsBr3bhvJjQqKctUqoGcd09aMxUla
 Z/DdayPSO5Hcl/yu0yC5seHi2qXUKc4+hDr72ZSVt457EUurN4xZzH19WAWjTLb105phXn4kSsV
 C5vgopj+YJwq0l1mQoHm8WiGSFbbsUqtUE7D2Ok+1/FSukJjVXD/X7P3fzJCViYrqgxqRCTYYLM
 dJIq6Dx8G6LMe99w8zRjXmyIEwroVopBHDnC4QCNlo+rHdnr53Gmuc92fLKeD5pm6PTpsbtoQlN
 6uLyNUIK9dLjdAvq0EtBPbA==
X-Google-Smtp-Source: AGHT+IG/P523B4qIxsdV3Nd5mcbbm4HW+mCWBHfwsee7qzkuiimd0XP3XyafaGOXtbk4LwCXLc7haA==
X-Received: by 2002:a17:90b:4c10:b0:32e:3830:65e1 with SMTP id
 98e67ed59e1d1-33098385815mr1650016a91.33.1758242223152; 
 Thu, 18 Sep 2025 17:37:03 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-32ed275e795sm6694557a91.19.2025.09.18.17.37.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Sep 2025 17:37:02 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id 4EF954227236; Fri, 19 Sep 2025 07:37:00 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux Framebuffer <linux-fbdev@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>
Cc: Helge Deller <deller@gmx.de>, Jonathan Corbet <corbet@lwn.net>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Teddy Wang <teddy.wang@siliconmotion.com>,
 Bernie Thompson <bernie@plugable.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Arvind Sankar <nivedita@alum.mit.edu>
Subject: [PATCH 2/3] Documentation: fb: Retitle driver docs
Date: Fri, 19 Sep 2025 07:36:39 +0700
Message-ID: <20250919003640.14867-3-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250919003640.14867-1-bagasdotme@gmail.com>
References: <20250919003640.14867-1-bagasdotme@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7088; i=bagasdotme@gmail.com;
 h=from:subject; bh=WfEfpEV/WCNT+LtNWeUNac+ZML6LQG345dmWyepkyJs=;
 b=owGbwMvMwCX2bWenZ2ig32LG02pJDBlnlrS/8Nye9a0yIeSf/J4/z++5JVYv2heZzKS8ePmU/
 6eMjF6v6yhlYRDjYpAVU2SZlMjXdHqXkciF9rWOMHNYmUCGMHBxCsBEFqQx/K8+L+yU84W9I33f
 i99PY3/ETdPtjkqZdm0KU+mpsiffir4yMnQVGErLTNm6fXPM34zvS9Y/Uuyay6hr/nRC0xbHb5Z
 vNbgA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp;
 fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
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

Many framebuffer driver docs are copied from vesafb docs as their
template, including "What is <driver name>" title. Such title
implies the introductory section, however, and not the whole docs.

Retitle them.

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/fb/aty128fb.rst | 8 +++-----
 Documentation/fb/efifb.rst    | 6 +++---
 Documentation/fb/gxfb.rst     | 8 +++-----
 Documentation/fb/lxfb.rst     | 9 +++------
 Documentation/fb/matroxfb.rst | 9 +++------
 Documentation/fb/pvr2fb.rst   | 6 +++---
 Documentation/fb/sa1100fb.rst | 9 +++------
 Documentation/fb/sisfb.rst    | 6 +++---
 Documentation/fb/sm712fb.rst  | 6 +++---
 Documentation/fb/tgafb.rst    | 6 +++---
 Documentation/fb/udlfb.rst    | 6 +++---
 Documentation/fb/vesafb.rst   | 6 +++---
 12 files changed, 36 insertions(+), 49 deletions(-)

diff --git a/Documentation/fb/aty128fb.rst b/Documentation/fb/aty128fb.rst
index 3f107718f933fc..0da8070a552165 100644
--- a/Documentation/fb/aty128fb.rst
+++ b/Documentation/fb/aty128fb.rst
@@ -1,8 +1,6 @@
-=================
-What is aty128fb?
-=================
-
-.. [This file is cloned from VesaFB/matroxfb]
+=========================================
+aty128fb - ATI Rage128 framebuffer driver
+=========================================
 
 This is a driver for a graphic framebuffer for ATI Rage128 based devices
 on Intel and PPC boxes.
diff --git a/Documentation/fb/efifb.rst b/Documentation/fb/efifb.rst
index 6badff64756f49..3d4aab406dee0a 100644
--- a/Documentation/fb/efifb.rst
+++ b/Documentation/fb/efifb.rst
@@ -1,6 +1,6 @@
-==============
-What is efifb?
-==============
+===================================
+efifb - Generic EFI platform driver
+===================================
 
 This is a generic EFI platform driver for systems with UEFI firmware. The
 system must be booted via the EFI stub for this to be usable. efifb supports
diff --git a/Documentation/fb/gxfb.rst b/Documentation/fb/gxfb.rst
index 5738709bccbbf3..3fda485606bdc1 100644
--- a/Documentation/fb/gxfb.rst
+++ b/Documentation/fb/gxfb.rst
@@ -1,8 +1,6 @@
-=============
-What is gxfb?
-=============
-
-.. [This file is cloned from VesaFB/aty128fb]
+=======================================
+gxfb - AMD Geode GX2 framebuffer driver
+=======================================
 
 This is a graphics framebuffer driver for AMD Geode GX2 based processors.
 
diff --git a/Documentation/fb/lxfb.rst b/Documentation/fb/lxfb.rst
index 863e6b98fbae55..0a176ab376e30e 100644
--- a/Documentation/fb/lxfb.rst
+++ b/Documentation/fb/lxfb.rst
@@ -1,9 +1,6 @@
-=============
-What is lxfb?
-=============
-
-.. [This file is cloned from VesaFB/aty128fb]
-
+======================================
+lxfb - AMD Geode LX framebuffer driver
+======================================
 
 This is a graphics framebuffer driver for AMD Geode LX based processors.
 
diff --git a/Documentation/fb/matroxfb.rst b/Documentation/fb/matroxfb.rst
index 6158c49c857148..34cafaa00bab19 100644
--- a/Documentation/fb/matroxfb.rst
+++ b/Documentation/fb/matroxfb.rst
@@ -1,9 +1,6 @@
-=================
-What is matroxfb?
-=================
-
-.. [This file is cloned from VesaFB. Thanks go to Gerd Knorr]
-
+==================================
+matroxfb driver for Matrox devices
+==================================
 
 This is a driver for a graphic framebuffer for Matrox devices on
 Alpha, Intel and PPC boxes.
diff --git a/Documentation/fb/pvr2fb.rst b/Documentation/fb/pvr2fb.rst
index fcf2c21c8fcfeb..315ce085a5855b 100644
--- a/Documentation/fb/pvr2fb.rst
+++ b/Documentation/fb/pvr2fb.rst
@@ -1,6 +1,6 @@
-===============
-What is pvr2fb?
-===============
+===============================================
+pvr2fb - PowerVR 2 graphics frame buffer driver
+===============================================
 
 This is a driver for PowerVR 2 based graphics frame buffers, such as the
 one found in the Dreamcast.
diff --git a/Documentation/fb/sa1100fb.rst b/Documentation/fb/sa1100fb.rst
index 67e2650e017d12..c5ca019b361a94 100644
--- a/Documentation/fb/sa1100fb.rst
+++ b/Documentation/fb/sa1100fb.rst
@@ -1,9 +1,6 @@
-=================
-What is sa1100fb?
-=================
-
-.. [This file is cloned from VesaFB/matroxfb]
-
+=================================================
+sa1100fb - SA-1100 LCD graphic framebuffer driver
+=================================================
 
 This is a driver for a graphic framebuffer for the SA-1100 LCD
 controller.
diff --git a/Documentation/fb/sisfb.rst b/Documentation/fb/sisfb.rst
index 8f4e502ea12ea7..9982f5ee05601b 100644
--- a/Documentation/fb/sisfb.rst
+++ b/Documentation/fb/sisfb.rst
@@ -1,6 +1,6 @@
-==============
-What is sisfb?
-==============
+=====================================
+sisfb - SiS framebuffer device driver
+=====================================
 
 sisfb is a framebuffer device driver for SiS (Silicon Integrated Systems)
 graphics chips. Supported are:
diff --git a/Documentation/fb/sm712fb.rst b/Documentation/fb/sm712fb.rst
index 8e000f80b5bc6d..abbc6efae25f46 100644
--- a/Documentation/fb/sm712fb.rst
+++ b/Documentation/fb/sm712fb.rst
@@ -1,6 +1,6 @@
-================
-What is sm712fb?
-================
+==========================================================
+sm712fb - Silicon Motion SM712 graphics framebuffer driver
+==========================================================
 
 This is a graphics framebuffer driver for Silicon Motion SM712 based processors.
 
diff --git a/Documentation/fb/tgafb.rst b/Documentation/fb/tgafb.rst
index 0c50d2134aa433..f0944da1ea5ef1 100644
--- a/Documentation/fb/tgafb.rst
+++ b/Documentation/fb/tgafb.rst
@@ -1,6 +1,6 @@
-==============
-What is tgafb?
-==============
+=======================================
+tgafb - TGA graphics framebuffer driver
+=======================================
 
 This is a driver for DECChip 21030 based graphics framebuffers, a.k.a. TGA
 cards, which are usually found in older Digital Alpha systems. The
diff --git a/Documentation/fb/udlfb.rst b/Documentation/fb/udlfb.rst
index 99cfbb7a192238..9e75ac6b07c36a 100644
--- a/Documentation/fb/udlfb.rst
+++ b/Documentation/fb/udlfb.rst
@@ -1,6 +1,6 @@
-==============
-What is udlfb?
-==============
+==================================
+udlfb - DisplayLink USB 2.0 driver
+==================================
 
 This is a driver for DisplayLink USB 2.0 era graphics chips.
 
diff --git a/Documentation/fb/vesafb.rst b/Documentation/fb/vesafb.rst
index f890a4f5623b45..5ffb35efd4538a 100644
--- a/Documentation/fb/vesafb.rst
+++ b/Documentation/fb/vesafb.rst
@@ -1,6 +1,6 @@
-===============
-What is vesafb?
-===============
+===========================================
+Generic graphic framebuffer driver (vesafb)
+===========================================
 
 This is a generic driver for a graphic framebuffer on intel boxes.
 
-- 
An old man doll... just what I always wanted! - Clara

