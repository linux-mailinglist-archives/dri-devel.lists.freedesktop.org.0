Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B39CB8567
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 09:56:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CDDC10E371;
	Fri, 12 Dec 2025 08:56:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KHX+wh5E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B1BE10E57E
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Dec 2025 08:56:48 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-42fb03c3cf2so361996f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Dec 2025 00:56:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765529807; x=1766134607; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=j5xnr554TtYoRpbiQVpIVqZ94ylKVMynqnLIjhVFhbc=;
 b=KHX+wh5EtIdxbu6jAxU81ekr2YIQ/JPuOmW7ADZ1O4K9x0xTDBsEyzb+eMYgDs2Zyq
 eP3cctEtZrSChVo1JsjYuNL+mxWMWCKEjKEcDCGQOzjA6hmKmnNPnDD5YsVJcfTMOTDY
 Ju5n/02cBGrJzwS7lbHC/XtTibQcm7xd7KWmA+d1f+KrFeiChe4LQTvs0zoBIW5pyusg
 L8gQ82gfaCQKs0baheiTWixbQARgmnOzChy8nvnIFWUPUzzI9+Un6HD2goorDYTwdLMT
 57ezafkLhpbtjAYDxyAqvZEtaYfAO7Bu4q1d6uCl8YRJsl3r5zPVYA6NkqhSMzqEPvtC
 XLHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765529807; x=1766134607;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=j5xnr554TtYoRpbiQVpIVqZ94ylKVMynqnLIjhVFhbc=;
 b=LqxHKkjMIc6hSqai9eDr2+5OihZNEihjRdfzKKni8eubvih3gRuSRz9Bbb8q6KNEmr
 nmoOtq+OxAJlVk+fBgboqiVZWXwifIJT7I4Qvs8aVTYbHWSBOG1L7vf/VBXmJjUF3wMm
 yEDe15DPifhRkzPuGmDjo1UyGtp+Dhc69R2yj4ZtlPw8vAFnr2uGi1oZxhpGOzny1/xO
 21rDhIuansiuLzl1ulPRtweM+q0PKu/4K2cxVHV/hxwKYinDtltujPXazqIdzyZIF4rl
 aKkS9PNK3lKMM0RPVKOoVdC41hTq0XtgD6t7wjedp0UDcReZG6xsTt4rE5yibQCpuaTW
 2Fdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFL5nyWRSvIJHwc5HidsMuRFUcK4YsoX5SctbRxv/AUmRYj+SbfH4EsNV+Np/Y8fkGg2OsbbMpZqo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxS6/tUE21cDHHsz3IGEzN7t5lyW/trZpBKyBgucntyT222npuf
 6UdpuQw6LLFuT0iTBNUZLP1+obPcL6lImSWRewt+1zPJeAJyJgAgACen
X-Gm-Gg: AY/fxX44aGugQHPu9WtrIamMq/wuHVb57xWSQQCIPTquWdvzbq1YS5JwvEDAjZWYhJE
 gdDlX5gDUv4pkJBiyxjqFZqwJUby6d6VUw9uhBXDVxh8MA6KNzVL9nEMwX2pQrL06JFjH4xPqcJ
 fmyj8Y0jMbV4Ar5AYoL8+CArcQbys/2dT07pucRA4Bj37GRehhisjL30ArRlRtkDLNNK5S+iBO6
 0bp0UPQxpVVaqzDRjIx7wIH4mGE2nrJQiJRzcI9Hir+DLVuP0B1QdxZSkW69lrGFCFp8Nr8oXm+
 lr3qMJKo5oAO+c7U8+3tg40Cb7iNx5ahAB+mznng5hljB6dqSJO1ExAcesE089soDgm8nbBVVMg
 Ioz31yE7MKQeIsjmi3rGEjqEbib+taETgXmhtRP4GWtdwRaN5wJ1Ct/Meld/pUJ8lv37wTjSk6e
 yRunbX79Jasl3ont7EH4ChRcNjH6ZcPSYiE48TciQ3GiixubQ=
X-Google-Smtp-Source: AGHT+IHhnZmeHlyh2oJIh0NH3wEUOJqDSyyPvBS/9IvuDCpY2NGik74JNPW9/wJK41l2NNkWH9pPYw==
X-Received: by 2002:a05:6000:40cf:b0:42b:3246:1681 with SMTP id
 ffacd0b85a97d-42fb44a3ee7mr1344789f8f.18.1765529806668; 
 Fri, 12 Dec 2025 00:56:46 -0800 (PST)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([89.7.8.79])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42fa8a09fbesm10501696f8f.0.2025.12.12.00.56.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Dec 2025 00:56:46 -0800 (PST)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Fri, 12 Dec 2025 09:56:10 +0100
Subject: [PATCH v6 3/3] MAINTAINERS: Add entry for Sitronix ST7920 driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251212-st7920-v6-3-4d3067528072@gmail.com>
References: <20251212-st7920-v6-0-4d3067528072@gmail.com>
In-Reply-To: <20251212-st7920-v6-0-4d3067528072@gmail.com>
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

