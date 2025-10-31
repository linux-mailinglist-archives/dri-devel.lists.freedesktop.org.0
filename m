Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35046C24004
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 10:05:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E52F10EADD;
	Fri, 31 Oct 2025 09:05:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jRz9PBBL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D78010EAD8
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 09:05:42 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-47728f914a4so9743055e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 02:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761901541; x=1762506341; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=m97kyP3HTS70kAnw3EPRct0ZUapkHpzYxU+r81cO+AM=;
 b=jRz9PBBLRZDsLbuyFwq5GoUFqlwYUKMhNEmxEM0h/bH0545bIf88/zvMFdlKnNfjYk
 /gsqFMr1mIOQIdL8TbaupzjwoJcsaewWxXFXxkanUW3pnY5Qp0mvHB1lOtiKCZIshUGk
 LNTr/CNnc/Y+ZPhwltIY1GVrgAdWlUuJBnKCUmAQGW2wPTHfZ52FJEYtoHpunb34VG+i
 z8zf5V6vfScDPuNAGRmEN/mtD9i9ILFOHcWXl5enxWuhaX4PdCX5rN74qDEhcUjcOJI4
 2yYEaodoWT/hy2nTU9GKZyVgV/U8pBJavcFen9acRkS9w2jn5EbBpu6BYA/XqZCnAeTq
 0i8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761901541; x=1762506341;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m97kyP3HTS70kAnw3EPRct0ZUapkHpzYxU+r81cO+AM=;
 b=OHmVaZiAacpXkn8FGXaktLKeeAXYuD/hOFUsMQcBi6MwQZuOYYfOoDTSbuqBm2v5tp
 GUoBipptIRVyqqwyWK91RGQY1q+FaTyGne/5bM8kHubL8g3w8o54qjH3syNhlwcClobt
 3Fv5sqbGZm1uDRx2UdgLc3OV2Tkq/ZQvmqIRIXviPTo6zNafNUdlQ9SGeO/4G4vHLoZR
 J9IRhgUgXMAp9hAr1eC1lWtcLnJCxoZOvDbXVcDwjoD+HdPqBvftpbjbgKsd02YjR3Ml
 dpV7XAMTKud3fGoCyvpFU+9iJirzWc9/ZInZagyHXRNCTLHj2LuwwjZc6EzZXFA0/g4H
 SYAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKQVxYBcxQ1P4c0lq29i12oVpuVQBMIa/HC7GuEX2AYJVtre10HRZRqIb31dwBpDW5wfqJT9WHaEQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzNFqMfvRjwzJhEvy+ZuaMsl5sD2jHL0zgLPc4Uvi9f2qX+YDev
 Ciaz5AQ0m/bje69mV6eB9W60ffx64x+QNSm0IgN0egGPM5iDJLkL9MGx
X-Gm-Gg: ASbGnctB18apo4UesGUKXpckFb5/J4jrTLUP+RTpEGIOGFapvbWax0SX8ED7VAM/4FZ
 tYAo/WUuL3kmp/b6xOeuqtiCCr/Mwh2oMCfWWnjizo+wHSoe1DHsZ1m0Zf1hI0KytQA1O8ivFIz
 DHloMgfsUaRf+cWGLQgb7J1yJK5sIvHqYNH44Q77ESXBbMg7HLXWUvZnH/z6IsO+zUxAlodrsUg
 z1T0QRl9s7xdmhsRF04yahd6quNbAqQkVVxu6JkE4IR6XLFbz9QJFb06OzX5ndtq/LHczmV+BAD
 YGiietNw0uS6RvJNmGCoYXJ0KNidBMLGjYpdXV4elkw3+fLX5+GfHfpVLrKNgG6jjAyXDrJfJNd
 9Dlvc81+vNehSWC0H8fiEyswg64btX1y9D9Szc0zU9+KUXLjiqviA5x33vpYWTds/2GGXV3VhFM
 XkiCvsh8coMdi/Da6t1945jde0Lkee4df5mQZyEIQXgUuZscq5NS9H
X-Google-Smtp-Source: AGHT+IHaEdfxWwYT2zJAyLRZyUAgi4BdK3quhN7NkvDh1BylxO25NofIDcQ0FfuX8++X59NClzV6hw==
X-Received: by 2002:a05:600c:1e06:b0:477:1be1:9afe with SMTP id
 5b1f17b1804b1-477307b879bmr22506295e9.9.1761901540395; 
 Fri, 31 Oct 2025 02:05:40 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([5.225.139.156])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477289adaf8sm93454475e9.7.2025.10.31.02.05.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Oct 2025 02:05:39 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Fri, 31 Oct 2025 10:05:19 +0100
Subject: [PATCH v4 3/3] MAINTAINERS: Add entry for Sitronix ST7920 driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-st7920-v4-3-35291f8076b2@gmail.com>
References: <20251031-st7920-v4-0-35291f8076b2@gmail.com>
In-Reply-To: <20251031-st7920-v4-0-35291f8076b2@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Iker Pedrosa <ikerpedrosam@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
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

Add Iker as ST7920 driver maintainer.

Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5ddf37f0acc960039422ef988cadfa7176972fc5..79b8a277e38b55ebcff05450d6c565c0d87c6b51 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7861,6 +7861,13 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/sitronix,st7735r.yaml
 F:	drivers/gpu/drm/sitronix/st7735r.c
 
+DRM DRIVER FOR SITRONIX ST7920 LCD DISPLAYS
+M:	Iker Pedrosa <ikerpedrosam@gmail.com>
+S:	Maintained
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	Documentation/devicetree/bindings/display/sitronix,st7920.yaml
+F:	drivers/gpu/drm/sitronix/st7920.c
+
 DRM DRIVER FOR SOLOMON SSD130X OLED DISPLAYS
 M:	Javier Martinez Canillas <javierm@redhat.com>
 S:	Maintained

-- 
2.51.0

