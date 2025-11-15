Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B0BC60BF4
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 23:20:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7DF910E0A8;
	Sat, 15 Nov 2025 22:20:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GVmjIZ25";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFE6910E06D
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Nov 2025 19:42:28 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-2953e415b27so30323555ad.2
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Nov 2025 11:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763235748; x=1763840548; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pPC//MKTJx0p4rlyodABKyWHPBkP7FnZTmd024KA6E4=;
 b=GVmjIZ25w8ULjRIwyLh32jm0erCDFfzctNWgwz0Q8Xy/nCy/VhlDQchSC0gFhQ5G8V
 4E/TFjjfzwPn/DxhB4guWlFRLmqqpHjhws6Nkc+i2cMn76rXNg8VOAZkMSnk94dv0dVx
 N2n0++4mC3ECOnu87crr2XsFfjf80UP4dwMN+2GESJMdRQ20KddrcpM5hP0Vstf2Citg
 GOg3Exnrn2LRHDXXTTBavSpxv5r69VBF8hPTFeYva+Dmx2hK0OdOM5j6kGo3mmIAGLNO
 gtBzNQ8C4t/QRXB4+8/JQL5MkZqHWC0/8U0Rjgv1J1lR+FtHxvbBbMt9F3tz7PIBs15t
 ymMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763235748; x=1763840548;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pPC//MKTJx0p4rlyodABKyWHPBkP7FnZTmd024KA6E4=;
 b=Hvu2FF3oOaqK6c0ODGY9xHNPKg+muMPKCkQvXZgPFuj7fI+XdvOri/HmZEoMFHJpip
 jnfEw94PcZdSKOoEsiE3zPykj91VsqTAP5isho1FAvRYSJ5H7dXDp913vrpeFXlq4REc
 ebz6a++TXdj/hrtWkCex0tQCaaejmnVlo0P8hicy6EV1a1BT9qzrKwWJaoT4GsHfV4eL
 5BpPNjT+a6pCIdYIUuNYzXWhnU2Yi77Btw8KvxMaOa0xRh0txE/Dit5MdYt9d+KtwVeU
 88BjLQlWoea+QF7D3GsJyGSAxyp1YF6ElpEo0mI314U7lOSEDK8fM7PG4JRmn2Ge0Chz
 ypyg==
X-Gm-Message-State: AOJu0Yyqncf7xHrO5LaQtmwoWIk76CsJQQvOvnL6mSjnyrvO9SMpd7k/
 /9xFRHao8WJAls4L+zv7CTemx+DQo+p27gazCkJPv5ekoqtulxnd4Y8PEwMLkw==
X-Gm-Gg: ASbGncsA0OlK3t370EwWgCG0AkfSJdd1CI7dxjg4oIcBoybEyDfY7vNpOxGDq3aaf6n
 OGJud28RvKloMiWOv3txWWKkKlw0Vvdz8CaBa3oYU7+dRSNq1ALRgwRWt68Qkvp2hxFq5NHxUx/
 QY0I8zNIJep7N9tetgEMTCyd1PCYS/mZwFE4p9FwzIkWZ3BZick5aocII4rpROc8m3mGGHYDAvJ
 OLOFgGgY1RUGwMzxvv1wc1+pEXnPQX9SUafzrP2WoVN1e2Cl5LKrtMNiryhJX513r12iNWtM2i+
 Ya9Es7TE+qXc8p8QSutQ6nhUu4JwWrHF5HzTxssG5wvET9/jXaynuP96IYWqcZAEtb6xugEcWSb
 4IABNPna+xyAgF9VuIiveTa0/rkdKxzZ3jMNY7i3nAmu8mzf9C/NqToybZenLFhzCitYHmkjrbf
 eI6zV+v1NFkfuZ2jVGlihyve6+rIXWNogZWtLr
X-Google-Smtp-Source: AGHT+IFfroPQ+K/O79k3gCfogAuIxKuiwhy3M9mQ+dq+aIEPKQDVxtSYq5Zce8J4DPwQ3991vlPG3g==
X-Received: by 2002:a17:902:cf42:b0:297:c4b0:8d53 with SMTP id
 d9443c01a7336-2986a76a2d7mr91436965ad.54.1763235748178; 
 Sat, 15 Nov 2025 11:42:28 -0800 (PST)
Received: from ideapad.tail50fddd.ts.net ([139.5.199.70])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-bc37507fc7bsm8057442a12.23.2025.11.15.11.42.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Nov 2025 11:42:27 -0800 (PST)
From: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: javierm@redhat.com, maarten.lankhorst@linux.intel.com,
 Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
Subject: [PATCH] drm/solomon: ssd130x: Use kmalloc_array() to prevent
 overflows.
Date: Sun, 16 Nov 2025 01:11:56 +0530
Message-ID: <20251115194156.44375-1-ayaanmirzabaig85@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 15 Nov 2025 22:20:22 +0000
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

Replace three open-coded multiplications in kmalloc() with calls
to kmalloc_array() to prevent potential integer overflows

Signed-off-by: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
---
 drivers/gpu/drm/solomon/ssd130x.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index eec43d1a5595..8368f0ffbe1e 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -1498,7 +1498,7 @@ static int ssd130x_crtc_atomic_check(struct drm_crtc *crtc,
 	if (ret)
 		return ret;
 
-	ssd130x_state->data_array = kmalloc(ssd130x->width * pages, GFP_KERNEL);
+	ssd130x_state->data_array = kmalloc_array(ssd130x->width, pages, GFP_KERNEL);
 	if (!ssd130x_state->data_array)
 		return -ENOMEM;
 
@@ -1519,7 +1519,7 @@ static int ssd132x_crtc_atomic_check(struct drm_crtc *crtc,
 	if (ret)
 		return ret;
 
-	ssd130x_state->data_array = kmalloc(columns * ssd130x->height, GFP_KERNEL);
+	ssd130x_state->data_array = kmalloc_array(columns, ssd130x->height, GFP_KERNEL);
 	if (!ssd130x_state->data_array)
 		return -ENOMEM;
 
@@ -1546,7 +1546,7 @@ static int ssd133x_crtc_atomic_check(struct drm_crtc *crtc,
 
 	pitch = drm_format_info_min_pitch(fi, 0, ssd130x->width);
 
-	ssd130x_state->data_array = kmalloc(pitch * ssd130x->height, GFP_KERNEL);
+	ssd130x_state->data_array = kmalloc_array(pitch, ssd130x->height, GFP_KERNEL);
 	if (!ssd130x_state->data_array)
 		return -ENOMEM;
 
-- 
2.51.0

