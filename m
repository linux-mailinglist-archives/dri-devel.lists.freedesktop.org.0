Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F2BB87812
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 02:37:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A41C10E123;
	Fri, 19 Sep 2025 00:37:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="m3QCivSk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4349710E123
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 00:37:04 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-b5515eaefceso536424a12.2
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 17:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758242224; x=1758847024; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bWbzRPCjSF9zkkrc1WhzONXArq9qHtgULo12Vo1t/Ms=;
 b=m3QCivSk5/P2GEPa44StJOWSwHp0Wo8ysec8zT8iwkCWgubJjNMnktJHBj7dFy7lEa
 AT1Zw2oPUb2k/Ir4LbcD41sCEUX/RlN2sfHenU6pWSfIbUSQUu54gY80TBx9ccZ3XF+8
 LKlnksu4t4PFZu0iH+4dexTIIpfa2WXHqfLWVxlyBg90LM2lj70W5RgzP1zEIllVM7Ec
 2wQFYudAQPQM5ZTf1XXjPLWz/dwLzuy3Lic6LGAlho6RBq+zfrtzxNoh3OzZn9GXcUxd
 phtaUIx1YxicvPAzW7E0xrzH13Cb4a6BtPUTSXqzdmUjCmHFb9KY8xJtk7Ln793tmbSn
 vdWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758242224; x=1758847024;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bWbzRPCjSF9zkkrc1WhzONXArq9qHtgULo12Vo1t/Ms=;
 b=QL93eCIBC1EaO3XeD8rxT1GQwVsU+5LS0foGnIilByLkmrZGT3jODaASYlrbvlzQKY
 IrMevia80jmCXkpVdBYIEsW6wRAiXWQACFY9QvCk+bhNVwjyXgR+u1Vvl7ncSbjdmWZv
 uH5Gu8MKnyav2hpl8qT20YAptxpKEG3C0Iepiz+StqRz4rIK4yef1MPYw0GJSf7yVW1g
 WaCDueJ6sIwCQQxh6bPWbvJ5ziwMRZJdkGXWKm04dxTOnYtsM//yrkUV1OSJTJdQ5Mu5
 sJLblhoPN/MzABC4qoB/Eb133ZuEMEtu480Eh9XCLB7wI67zES+3UrnyDu8hwvCGNPdC
 WK8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3SI2hoHFVNqP/8UzG5uLk7mPfvJypFEWHMYeMRjbgOFJTczW204GdsloHpqmP0/udePwrY2TLSQc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyFVp4cup8jLlHEmt+8lHT8Qte3HkE+eRo8wpOWWXsuTvVPwgS8
 gQPFY5LWuOyBa0AylovVh3Pt5XkmKpuoko9ZHg3+aqBtaaXYFS7W3f+a
X-Gm-Gg: ASbGncvxZXIxZQR0mFgqg0WgXjGbq3N8Rd97s4jlazrKU3YGWYXXe831qOjhUf4JgjG
 DMAiGomCMw0EqHmkuxn1h2nIo0xbyh/kPjkXvNmj8TYxRBquQf49jesHnJgFUQWsc+d3TIbwL1k
 jibVtTqB6GUiQfg33EbYY/9CnjxfKJdxXG34oS1HQinVuZLpKXopJ7H9TnreGJh4/Yj3IVxAuOV
 6fZtARz73K1+HdbNp8uJb9Rx4aBfkWTQaR/A6GmVKNgcRWaGbDV8fbFwTEMtAOqAel+2E5EqVl8
 peYPsNpGXQtIOs8Fgf2e3W+k54ovPoHgn3N2KdPyHnTsa0CyvwN0HHUSlhB5rcoo2F2kVZJyI1r
 vfxSwMagWcvRoNH/9vwqwHAIFckhHKfdm4scPfUCP
X-Google-Smtp-Source: AGHT+IF04noo2z6nfhj/WjW4j01+xVKhsQR6t2wKDzK6qpg/OEXcEUFT4SqFii2oCqgKJ7SG0yCTqw==
X-Received: by 2002:a05:6a20:7348:b0:243:d1bd:fbbb with SMTP id
 adf61e73a8af0-29274fb7736mr2077670637.59.1758242223625; 
 Thu, 18 Sep 2025 17:37:03 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b54ff445dd7sm3349864a12.51.2025.09.18.17.37.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Sep 2025 17:37:02 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id 3E9BB4227234; Fri, 19 Sep 2025 07:36:59 +0700 (WIB)
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
Subject: [PATCH 1/3] Documentation: fb: ep93xx: Demote section headings
Date: Fri, 19 Sep 2025 07:36:38 +0700
Message-ID: <20250919003640.14867-2-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250919003640.14867-1-bagasdotme@gmail.com>
References: <20250919003640.14867-1-bagasdotme@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1304; i=bagasdotme@gmail.com;
 h=from:subject; bh=k2dBfrdNtLGAZ64PrS3NFKJy0ruuW50Pp0bwQuFiRAw=;
 b=owGbwMvMwCX2bWenZ2ig32LG02pJDBlnlrS7CYsEXRY8VzLlwce97sGs77MD52g9PZglITvF2
 tHuyhHhjlIWBjEuBlkxRZZJiXxNp3cZiVxoX+sIM4eVCWQIAxenAExE4R0jw7Fzb+umPpMMTd19
 ISEk4PLmfTIrrl+Uj/V6U3ad46ODfhsjw4eweXXK7uvdzLu5XZkaBaaXbdrsO/exk8VUf/bH/u0
 yjAA=
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

Section headings are formatted the same as title heading, thus
increasing number of entries in framebuffer toctree. Demote them.

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/fb/ep93xx-fb.rst | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/Documentation/fb/ep93xx-fb.rst b/Documentation/fb/ep93xx-fb.rst
index 1dd67f4688c751..93b3494f530979 100644
--- a/Documentation/fb/ep93xx-fb.rst
+++ b/Documentation/fb/ep93xx-fb.rst
@@ -41,7 +41,6 @@ your board initialisation function::
 
 	ep93xx_register_fb(&some_board_fb_info);
 
-=====================
 Video Attribute Flags
 =====================
 
@@ -79,7 +78,6 @@ EP93XXFB_USE_SDCSN2		Use SDCSn[2] for the framebuffer.
 EP93XXFB_USE_SDCSN3		Use SDCSn[3] for the framebuffer.
 =============================== ======================================
 
-==================
 Platform callbacks
 ==================
 
@@ -101,7 +99,6 @@ obtained as follows::
 		/* Board specific framebuffer setup */
 	}
 
-======================
 Setting the video mode
 ======================
 
@@ -119,7 +116,6 @@ set when the module is installed::
 
 	modprobe ep93xx-fb video=320x240
 
-==============
 Screenpage bug
 ==============
 
-- 
An old man doll... just what I always wanted! - Clara

