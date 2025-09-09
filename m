Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB0AB4A264
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 08:38:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05A1810E62A;
	Tue,  9 Sep 2025 06:38:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RkLNwo8P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC5CA10E62B
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 06:38:01 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-244580523a0so56387445ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 23:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757399881; x=1758004681; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g270YyKIrBevOK4fPlqJKWoE5PLhUjpLa5PhsUHs33U=;
 b=RkLNwo8PhmJO1XwNozDQqP17zftEXNSrHmZWq5XGUVfUihkL1O2rhIZfx8C65ysWWF
 7OXfP++BEPYgwG8ZACdCMYlqmYQP0d+PxAeHked6VyyGKhACxtABUjBIoEPAUyATbtkx
 udWfiz7LKB6txlzUZM0OxmXGyHv3O6Ei9os8gxXcovXAs9SIWQJ3wYbbtig0QtN7RDvW
 gTHPyq/oE1uNH571ufdDyFa3MVUH3wZWHtHz41oXVDJyzVnHLDrHeh9HvpMTHhiPQGlY
 RcyM17+7/Cou1QLoFTZ0tzW9eH4wSdYAAPNhKs/ft4lf+YEQkChxCkgqi1qaGdA/uU2k
 /Fag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757399881; x=1758004681;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g270YyKIrBevOK4fPlqJKWoE5PLhUjpLa5PhsUHs33U=;
 b=Qkty6qDFDqNsFVF/M+UokrvARaUp3sdb8En8J8hejD2mhwj0K8Lu/Ud+Bm9fqOJgmA
 x+HQs3Mr0Vi/yImdEWu2ojUiFZey0270UcGddG3M5nZ/ZDuLsje1NmIGM1WK4CgYsb+7
 i4tT/koc1odN+tVC3m5ZW/B1i1vKCRhjRpsh9SlRGXH7phlLHezgbw8A6kbshvp/wjJ9
 dgy04IgJaPOwD9Walj/Z/BlJT8LKXODDabeneStiU1lbXZhRq0CB6UmNszOIsVdYxrVn
 BYs2UKY+citRIRxnneJ8tq9iDAGwM9x5hqp4sgDgoLwRSZgxXijLdASPl198HXX5ixab
 4Irw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXsMizPeHfM/uMovI95MiJuqEOvCh2eF/ybF9yll+Z0zqONLIY+BHOB9fFN+qNJyphxMYoHAUgieE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyhLtwTAvxrbGlPQY/0oIwTrzYEMTUYfBtRPi0gzMpu7NYfRl3K
 XelXBKVbr+tTGZiJaOmnqSo9gEAIt6CF2OeyEFzBXhYsN1racGJRrg4h9uTR4hIg
X-Gm-Gg: ASbGnct1lK48oGrc5TiD2gloATnTNWJA8eP9uRQ9QLVFldqZhmZAzrnF2pzHhHyZwiL
 NebryFJpllS0XTQhQMeIAFGTQr5cgpUBnhtIyV7JinSVMYQYFFEOsAQXxJqgOrFUo1ZqkYS2TGz
 +Pj5gaKt50gAJPgj+SfQG1rlKFUb5/xIhYaU4YzKSN7yUalkcnxFiVxfHiRf1EYAdyGLs6UjsIS
 GM1o5rXQnoPsx/SZWRtsssWYiOa96iA8/4YpGuH2Yl+yGRhMMF+1dKBYTq/1k1lHRcGumLiKA8n
 E0dmSTXDMw3qY7/ZEBqqE+kXeoPoLqpQ8XuHEy1BpWhnXkJ8MGrbjji6KcpMVS5W8ywsdqc4cSI
 C0TkmUdMX6Vnzi0Z1Ea0dSSOZwQ==
X-Google-Smtp-Source: AGHT+IE09Vd5suFOpX68LFKhPPmahV9nA3jIm/tqi6CxQ5Yys9D9wYL4f/cGw7U7nLr6pnOmMN+/QA==
X-Received: by 2002:a17:903:2b06:b0:24e:e5c9:ecf7 with SMTP id
 d9443c01a7336-25170c416ebmr134604565ad.34.1757399881128; 
 Mon, 08 Sep 2025 23:38:01 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-25125d76218sm83975455ad.119.2025.09.08.23.37.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 23:37:58 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id 6DE6B41F3D84; Tue, 09 Sep 2025 13:37:56 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux Framebuffer <linux-fbdev@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>
Cc: Helge Deller <deller@gmx.de>, Jonathan Corbet <corbet@lwn.net>,
 Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH 3/3] Documentation: fbcon: Use admonition directives
Date: Tue,  9 Sep 2025 13:37:43 +0700
Message-ID: <20250909063744.30053-4-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250909063744.30053-1-bagasdotme@gmail.com>
References: <20250909063744.30053-1-bagasdotme@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2647; i=bagasdotme@gmail.com;
 h=from:subject; bh=ppPTTyuY/PaFOyKjbTMo6eVL8nyf2NMkBqkAEYcpBFk=;
 b=owGbwMvMwCX2bWenZ2ig32LG02pJDBn7Tx3cOpHbgmdSxvWYfYznAzWz3UsMpW+GRVbrPBbse
 csR5mfZUcrCIMbFICumyDIpka/p9C4jkQvtax1h5rAygQxh4OIUgIkwrGdk+PeJM2/H+4LOlpen
 MyzCtwp8WnH11rHXZY3frvL5rr+zS4iRYVn2ZUNf/mNGTaH1m/dNv5edyV52YuqPhb6vk5osJwm
 v4QQA
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

Use reST syntax for admonitions (notes and custom admonition
for gotcha).

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/fb/fbcon.rst | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/Documentation/fb/fbcon.rst b/Documentation/fb/fbcon.rst
index 3ed98b3ce64713..a98a5cb0b0d8bd 100644
--- a/Documentation/fb/fbcon.rst
+++ b/Documentation/fb/fbcon.rst
@@ -39,11 +39,13 @@ Also, you will need to select at least one compiled-in font, but if
 you don't do anything, the kernel configuration tool will select one for you,
 usually an 8x16 font.
 
-GOTCHA: A common bug report is enabling the framebuffer without enabling the
-framebuffer console.  Depending on the driver, you may get a blanked or
-garbled display, but the system still boots to completion.  If you are
-fortunate to have a driver that does not alter the graphics chip, then you
-will still get a VGA console.
+.. admonition:: GOTCHA
+
+   A common bug report is enabling the framebuffer without enabling the
+   framebuffer console.  Depending on the driver, you may get a blanked or
+   garbled display, but the system still boots to completion.  If you are
+   fortunate to have a driver that does not alter the graphics chip, then you
+   will still get a VGA console.
 
 B. Loading
 ==========
@@ -117,9 +119,10 @@ C. Boot options
 	outside the given range will still be controlled by the standard
 	console driver.
 
-	NOTE: For x86 machines, the standard console is the VGA console which
-	is typically located on the same video card.  Thus, the consoles that
-	are controlled by the VGA console will be garbled.
+	.. note::
+	   For x86 machines, the standard console is the VGA console which
+	   is typically located on the same video card.  Thus, the consoles that
+	   are controlled by the VGA console will be garbled.
 
 4. fbcon=rotate:<n>
 
@@ -141,10 +144,11 @@ C. Boot options
 	Console rotation will only become available if Framebuffer Console
 	Rotation support is compiled in your kernel.
 
-	NOTE: This is purely console rotation.  Any other applications that
-	use the framebuffer will remain at their 'normal' orientation.
-	Actually, the underlying fb driver is totally ignorant of console
-	rotation.
+	.. note::
+	   This is purely console rotation.  Any other applications that
+	   use the framebuffer will remain at their 'normal' orientation.
+	   Actually, the underlying fb driver is totally ignorant of console
+	   rotation.
 
 5. fbcon=margin:<color>
 
-- 
An old man doll... just what I always wanted! - Clara

