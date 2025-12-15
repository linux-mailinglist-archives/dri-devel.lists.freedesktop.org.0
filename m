Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A3FCBECD0
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 16:58:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DFB510E70C;
	Mon, 15 Dec 2025 15:58:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SAlrjXFH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9525D10E6F9
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 15:58:18 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-477563e28a3so27713045e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 07:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765814297; x=1766419097; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=j5xnr554TtYoRpbiQVpIVqZ94ylKVMynqnLIjhVFhbc=;
 b=SAlrjXFHJNIuS4RKmFqstZgZCyagDMdGkRU/ExwTCalnyyLmAk/O2x/j/Fl+kogXIs
 zmY/Sf9Vjrgdyu9uLyi+XdqFnCJcAD00LZqlBoCKGyIEscJ3n3Yz4VTjIo28/2/PnP2u
 BdueRQLwxHlpsuzN+e3/hcLP9kAflJbYYaK8HHk0f9V8tzCSHCt6Tdst0dvPaT/p3fvF
 EYtyRTvaG1zAwii67mfdMIaa1K9ixgGuQRHhPs/1PR+3w3BhtslCZy0qnPGhJGuvHC68
 9FEZzt67Y2v1nuNxHp1bUeB6q/iZ2LZvJ0h6gu7QDfHn1KbhgPEnTIOY/BEs8GzTFmSI
 hUUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765814297; x=1766419097;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=j5xnr554TtYoRpbiQVpIVqZ94ylKVMynqnLIjhVFhbc=;
 b=d7CxytK/xikvX+4Uq1F/40ejOXMt1Jk5DvQA2BvhxzeUXIWZ/v59i0L/P4dJHyYtKj
 fpDEhuIIw7ya1Ahxasz2fhil6xTWbj9HE/Uw9ejXAvxfIAg74ccqI8ANPHAS5i2SlRoh
 Yj3cQDSj7V9JSUEYjzLQ07IAcpeDBC8tng8IYcv8EawKGFOrAJ79uzoX+06gO6vOi/K5
 Qlj5FPOwQl/cYPMfGgtOb1TeieTaqb1wD7KS9CiYTCNZHkgYrdR+mYWv/Y3XrI0DE/O+
 B7kfL06Mu1CZM1tshoKH876PqkVdCljulILiYwgVvmR8Uer7ZqOmKLCe4Ymsi9sU43wt
 rA+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7hPHCpDodiYsiem4m2VvbeYf2mznuMJHZSOvWnF2qhlKzAijZwJwrCp9UpVAupv1AGS0dZEQf1vU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxacS98K4tkbYr1qdetLqfFNL10hy4QbJR7SKYhAX6SX99gfnT/
 WvfjrZ0XxNfowIuY/NvPYWRR1pUnYN6hhblPQr5DEF5TkJl3/h8db9df
X-Gm-Gg: AY/fxX4DH4OlP68jT9BnKd2LHywOZ5aF58pnvODQ+hFMkScng6mD9rvThbqhgDKc/1U
 bbTf6jsUVlSJJuZ97Gjo63L1ZXkMys3OQS1EH6JX7/5PkqpyZLisSlKcFrpvgvhTKbP9o3DQgel
 WOVQSP52oiE0HSiN1cd1y8UWsjZqgJT2DVcc+vZhgfqrVKuc6Yd7DCG0oimG4mvfBvLb+MxU2yU
 PgJEVvy+nHuMqEQrm0pH3PHF6spaP3DciP4WuFznuX+KgbARV4ow62Nr1xsGUYx9CngWaedKkFO
 8km0kezWMHABimnRJCl1sKO7G2fGL0KkKXzgqd4ALSm+uXgtlxRrKoeRmJpfqI9LFjIG4wCRRz1
 onwEwcxEY47eIjFyEwGzB8WTSsTkzXHU1Myk8SzBpEJErCGVJXUV4upTfzZ+h/TRoTMwXT/TJQE
 mvY76whdSRCSz+4WLo8wI2NYuiu66P0H9w9FpI6sDrkXh877bE4zBXAg==
X-Google-Smtp-Source: AGHT+IHg35WoITkMiGDualxHoa4S7x3nYKLJdG+oJFRoF7ngTCh3uk/xv1zFZFYVRyvKfVEk7l8FKQ==
X-Received: by 2002:a05:600c:529b:b0:475:d9de:952e with SMTP id
 5b1f17b1804b1-47a8f09428fmr129477115e9.1.1765814297020; 
 Mon, 15 Dec 2025 07:58:17 -0800 (PST)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.238.173])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a8f3a1be5sm70209665e9.1.2025.12.15.07.58.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 07:58:16 -0800 (PST)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 15 Dec 2025 16:57:56 +0100
Subject: [PATCH v7 3/3] MAINTAINERS: Add entry for Sitronix ST7920 driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-st7920-v7-3-36771009ec01@gmail.com>
References: <20251215-st7920-v7-0-36771009ec01@gmail.com>
In-Reply-To: <20251215-st7920-v7-0-36771009ec01@gmail.com>
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

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
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
2.52.0

