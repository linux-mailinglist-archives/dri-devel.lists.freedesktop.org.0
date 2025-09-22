Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 830CDB90125
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 12:36:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B7BC10E192;
	Mon, 22 Sep 2025 10:36:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gXBB7JAZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38F3D10E192
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 10:36:38 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-77f343231fcso313778b3a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 03:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758537398; x=1759142198; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ja79xQC+jV0B6iDYhE4odk4g+YamsPvZ5MHaPQIPNoM=;
 b=gXBB7JAZiyLVIKSmsvKHJjr3i/18BCnwY2PQ4u4gaAgZrs9otbz+cjQUu6UnID4pLa
 Zhn3IU2KUgEJwefKWIs2KyvcyiwTphxlU3GOK6t4k5NkH3MxSBu9qy9oHJxZ8BQiDQ/0
 aNouOtlGdLWXost4EfyID8shZAcJfFEQs9brPINMEbAetKqcBMK47Ducjv0f9r0AJ/zo
 l76sgsBamf2XUXIGGK2B1vqvihaMYZ2jmKjivyH2GdaNTnQdMA67237gev/8AX/mqdbd
 QKjQDb3Xyx3zxFTRf3ANoXaZrsVYFP8e5dxZ1ztIccBxdVR6Y7ImFptPyLd6cIRT+CUR
 gLAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758537398; x=1759142198;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ja79xQC+jV0B6iDYhE4odk4g+YamsPvZ5MHaPQIPNoM=;
 b=TFDGJUip0n8SjxuyG2KJRi7IK1V0Xk6o6ks9h0tXIkagWoN8IP05zu3EsdCkROEr8B
 JHkKjT+t41sba9wifw6ufbpMhm9wgWk2NSfOlwHa4vs6RATu52fZQ137OdPH6zfHpNL5
 UbXgq53AvXpLGP1ge6+Ih3FJMh4f1pWSrJd/0iBsxU1U6ufUGRZSrNrAofUlo7SqBpAr
 sbqLfsgcZJZelokuQwUfzoXwXem+Wm4gAOFiKPwLn0sLgWbmF703OhbjtYeZZd0I2LWG
 O1Y4kLDawck2s7DGYCwnKe3TluOcwrr+UbJqPM6PnPhy74vGb67+dlo0Eva2Q+9PLes1
 XgNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFf7rK4Y694MYDqhBzy+RPUG/TKwPOBlT4t9fayxT2oHA7KiXLyD7GpxlrkZkpxRVFSRLzQzQEz7k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YydqYMaq7UVwaB+t8xM2yPHstZGzihJ+dHst2G+mma1prZeVPap
 BptatpNUE3SmH/duqrQ45pcwmHz9Cw9Y4M+5sAMMq7pHZ6+11SRYFxPV
X-Gm-Gg: ASbGncuWSl61NMSJJ9lcWeN3rqGR7gnM/MCJT25J5QOSlSkMMuCmMeOC4dJMmDVr5fZ
 zNPwf5qbWtEqH5+KOVc8OJCQrewZ1vmNsd3s0C8u5jTbYxphocpx0VCFiGqGbykMJraRjoUDgvp
 ftGKxfgT2s7UJUOkd9PE6m28tSMxjNLBqU8HsQrvMPNK5vGO3sBsBin7w7OM/Kqc3j3Ei2mmVJx
 nS19tvrMDovSutKVD+9XPhv45tyKhzavt0w5aHsBbLcISb0+B8ZglJA82+EtuKJZNnWMMjSyqGS
 J9+r9udqpetmIiR4c/CfbBl/5g4OEwUMCf6sNoMBpl29EPglM/bAHRkEvKjDEjY+Fxo2Pj9jQV/
 KES5ThYBGvbthFqPXWhvKWA==
X-Google-Smtp-Source: AGHT+IFjbk1Ge/dq+0OQP8qlAA9psarcE8O7P0zDwLh4eJYft0zHWrPMxSR3ke/HuW5RGmagj5p9LA==
X-Received: by 2002:a05:6a20:6325:b0:2b5:769f:254a with SMTP id
 adf61e73a8af0-2b5769f2904mr3892589637.6.1758537397559; 
 Mon, 22 Sep 2025 03:36:37 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77f43b6f6afsm1391686b3a.65.2025.09.22.03.36.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 03:36:36 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id 8D31D4266764; Mon, 22 Sep 2025 17:36:34 +0700 (WIB)
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
 Ard Biesheuvel <ardb@kernel.org>, Arvind Sankar <nivedita@alum.mit.edu>,
 Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v2 1/3] Documentation: fb: ep93xx: Demote section headings
Date: Mon, 22 Sep 2025 17:36:14 +0700
Message-ID: <20250922103615.42925-3-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250922103615.42925-2-bagasdotme@gmail.com>
References: <20250922103615.42925-2-bagasdotme@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1404; i=bagasdotme@gmail.com;
 h=from:subject; bh=5AEGBnus0Qpin8vE8E3VJOLKJlPJziaZtjsBzVOmbM0=;
 b=owGbwMvMwCX2bWenZ2ig32LG02pJDBkX1QLfr+8rFNv9puHYSc34IO/K7k2cE549Xpo+tULlQ
 0oDe3JeRykLgxgXg6yYIsukRL6m07uMRC60r3WEmcPKBDKEgYtTACbiGsnwz9w0YcmvlaXnjLN1
 9yqKHxcS3Hx0B8+XW6usP5+SLeKd/Ifhf9INZrngmfMshXZ+kV68wfn1zFd6m9ZkZ1ZZHT3xm0V
 7AwMA
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

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
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

