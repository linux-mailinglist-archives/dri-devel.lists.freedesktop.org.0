Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC71FB4A261
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 08:38:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03F4D10E62E;
	Tue,  9 Sep 2025 06:38:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eCT7NEgF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1B8710E630
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 06:37:59 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-772481b2329so5436436b3a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 23:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757399879; x=1758004679; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zgXaASlXjGFVjUJ/ZBrWtnsm4G9IgZXSsCGm5rp0YN4=;
 b=eCT7NEgFu2Xgrqs6kMrrdfFgOb4av6jGbw7bpwFy8SvVRN7C4mX92WqfDNKQOB5vPb
 OOLGkQT1R7mcEFP/BHbJwxtxtwHQGUG9H5tl4lHLBdCIHRLzvltUze51RAp28jaZJJrY
 F1P/nSRhsQXncIwRBwtRunYvF5Fwlkyc439gp1Rxp2fHQU2YRsNRzsA+GLR+Wfpzbtvn
 7Q3tP9qe7h0RsQylpDqjfw3P9Wwcglun/0r22kdjiyCsNtTiRUfUinmiWLESiHwKeVNw
 SrXKTTQ7swpotHIBz2Y25feYao36HFuF0Ijx6SA1f/Slg9ui3qxAl2p9iFVCbciXlS9N
 wU0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757399879; x=1758004679;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zgXaASlXjGFVjUJ/ZBrWtnsm4G9IgZXSsCGm5rp0YN4=;
 b=jv4JWKvhu/feMhlLLZidgKKP6uETBmRMUAWAw1PJcWXCsW06f/+XVAWkZe5RYbiFwi
 AM22RI2gyCNXYjn2VmJuWyp7pgxaUpUyPzOqUX4grDGUrqoMwyZZ95FQHyAQr5QrKDL5
 w1wioozPjIf82uu6nNI+RtLbdjQgQVKtbYx/9425GuqO0OyPUNpOlJnb7xPw7MO0lp5E
 1Ciy03RI91eMXU+knYm/RSI/Vh07AYtNKOlG53H5Jjkm21tPq1OzJf3YAt3bDax701NU
 3Jod+JwDEDoJgd38lotlp5G5fywxBmtitf5v0U8V/5+93FTHTXbVsaEjBlwqjLDQcRzO
 9/8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcO9YwbdM4OgESCVDCBZEVnFx9O5uLSbGU7CDPHA8YnFF8XdfBSIvNa98949G73j5KrPRF2nlOYms=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx62ySHYvrOQf25E34D6Fa4RzDHHksD6wIuebuRsCi92K8KawMg
 AAaIRQ81sMADwNjUBxYCBO/VryDwaXREiBXCIEcNe5SM8oTyAyEyWgnQaGFHZItE
X-Gm-Gg: ASbGncu+cRkZJVQyhkqUJlTHJkFyY3tlL1SsAeL34nld2xzPHzg+SAVGVbTzH6y2yX7
 gJPEJbjawlD02XNXAc7AFchaLBrn9F+rlyYkVven4IggC88XPKQJojj0AduLMitM0+yJOOyGYqY
 OvsvygZIW9l5hHBoyLXo/pCuqGcYBOFpgfGcS/Z7smJHmae8nq5iHmS/KxK2B3aPhxdVCKyyuic
 WFm1MutLzBoE0gRcAXB+Id+qoPfpbqeuWRE/A+wyjRZTUgpqzVZQib6tpsRvoR/mp67Wpsan6/j
 vnWRsTpGBi9C4x1JjACmgEc3EkHecr9WhdxOI70jjmUns+UXNLwu8r6emwYt7RQxVQRWr4y0JOZ
 BPKGVJfQHs3og+TaQdBJ+yRTDWx5hSKyDNv5S
X-Google-Smtp-Source: AGHT+IG6+uKhAARr7UhkwbpUZaECdPB7dPFA+WM5GrddjHbis2bBcSqGfb34MVFU/2f1IDfS0fsxGQ==
X-Received: by 2002:a05:6a00:1a8f:b0:772:2850:783d with SMTP id
 d2e1a72fcca58-7742dedf06emr13704013b3a.22.1757399879056; 
 Mon, 08 Sep 2025 23:37:59 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77466290d84sm975093b3a.65.2025.09.08.23.37.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 23:37:58 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id 49A9C41FA3A4; Tue, 09 Sep 2025 13:37:56 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux Framebuffer <linux-fbdev@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>
Cc: Helge Deller <deller@gmx.de>, Jonathan Corbet <corbet@lwn.net>,
 Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH 1/3] Documentation: fbcon: Add boot options and
 attach/detach/unload section headings
Date: Tue,  9 Sep 2025 13:37:41 +0700
Message-ID: <20250909063744.30053-2-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250909063744.30053-1-bagasdotme@gmail.com>
References: <20250909063744.30053-1-bagasdotme@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1183; i=bagasdotme@gmail.com;
 h=from:subject; bh=7KhPgY9CNs+EyWne3MtjBbauIv/3NliTxGyLPRrBtVk=;
 b=owGbwMvMwCX2bWenZ2ig32LG02pJDBn7Tx0s7WQpKWwo33WmoaP/l4nBEv9vbeycaUnb5V3+s
 2zmPMHWUcrCIMbFICumyDIpka/p9C4jkQvtax1h5rAygQxh4OIUgIn49jP84V5aYP3wy4o9nyNb
 Zdti/25iObrHI4fx3oeHJQI6P2sv8jMy3GPlYzxz01k2cKGpS9rPqjKeHZ+WS93f7HxvZef/TbY
 FrAA=
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

These last two enumerated sections headings are in normal paragraphs,
making both sections merged into "Loading" section instead.

Add the headings.

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/fb/fbcon.rst | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/fb/fbcon.rst b/Documentation/fb/fbcon.rst
index 212f7003cfbab2..b9ddc145aa9f6a 100644
--- a/Documentation/fb/fbcon.rst
+++ b/Documentation/fb/fbcon.rst
@@ -74,6 +74,7 @@ Possible scenarios:
 	 over the console.
 
 C. Boot options
+===============
 
 	 The framebuffer console has several, largely unknown, boot options
 	 that can change its behavior.
@@ -172,7 +173,8 @@ C. Boot options
 	The value 'n' overrides the number of bootup logos. 0 disables the
 	logo, and -1 gives the default which is the number of online CPUs.
 
-C. Attaching, Detaching and Unloading
+D. Attaching, Detaching and Unloading
+=====================================
 
 Before going on to how to attach, detach and unload the framebuffer console, an
 illustration of the dependencies may help.
-- 
An old man doll... just what I always wanted! - Clara

