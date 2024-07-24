Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F5393B0E7
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 14:25:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0542E10E6A4;
	Wed, 24 Jul 2024 12:25:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aPne3P3E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8975A10E6A6
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 12:25:05 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-2cdadce1a57so747047a91.2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 05:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721823905; x=1722428705; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4RS7gU16ITnoH4uJ2P4cBrWFJTcLfxSuNNT2bfx+93A=;
 b=aPne3P3EwEmoz4rMYxfWyvTJnALD84FR3NbsguinKoH8oYScY9BS+iK9tj2nu8jrIG
 uVk/eUnDuoWp2cKHLQqQeS1SwA6bx37t/6DugNw4czr3ipxFcFOwoXD0Ox5bCGWbSq87
 A27cOrbFKrg8crRFtAE+OKPKPiSFvRycKRXWGJmJln1OI2zIYDVy7gvbTRWOBrYokXYQ
 V6BLzMW0Ew8QCaWr6ASjigmLDvXl9fMaVGnjaWQzyddNP9/taeJmYzcjT2VPysx6+3gV
 d1sa4l7D7nQ5dsUhYQluGx8FkFFZPG7X6XaCRW1PnsG7ZMj0TFCuHjab23bN+teE38xd
 xuVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721823905; x=1722428705;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4RS7gU16ITnoH4uJ2P4cBrWFJTcLfxSuNNT2bfx+93A=;
 b=ulF9wJbbXjFFVR3FxThFrUoQCUFYwxye0+U8bEIeaV7VrYyI130dcuk9FkGG9OQ2AD
 8c1kbI7vY8+znlYJPuLt+foq6Ap/s9GLH49nyk+jAYKT/HaIEUULsDGS0hGsz634g/Ej
 RNf6evNMfF1I8Csv25bZ5JDzN+Rw943o1/cjVBzjb+WuyRiGhr9a3d/oKVdL4wEm/eJX
 WOMecy0enjKi8YWmqclmG3ZQaxNYMantZm5+2BVfjXHYsiVZZhH6LxlC9qfeY+HlympW
 cop/K2WonXf0nCLezNJq5jUafOV1h+7AYnTYnelxm1Ko/WuA+9VMCyFrLM6bKCAr+0E1
 LHlg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU59pcaKt0h40Tiea/KsVrTXJKak13011gOXaWozaDbcLtKWoPrm+Y2ZGWCMrgOZ8J8u5LlxwFbO/8xrmd/QXDXek9pVD5NL6J+LbWqbKzn
X-Gm-Message-State: AOJu0YwAT1CIjEwxQ53mQzKmh/riSkq9lVVVZhqJNmpe+UJ8ZEjq9diG
 d9nIP2bwqXiyjYGmOnoT/fk4toQNB1lcyC82Q4t74JxK2aqzV/lyqSM9BV5qPho=
X-Google-Smtp-Source: AGHT+IF7OVyonWCCnCVBX9lx5jU8mzF0yeNoeycLEZCNLMHS8GfiaraNhErqelj7XcB9qfI2jnBS2g==
X-Received: by 2002:a17:90a:d301:b0:2c8:53be:fa21 with SMTP id
 98e67ed59e1d1-2cdb51ce903mr2067038a91.34.1721823904996; 
 Wed, 24 Jul 2024 05:25:04 -0700 (PDT)
Received: from distilledx.srmu.edu.in ([103.4.221.252])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2cdb76001d6sm1481454a91.48.2024.07.24.05.25.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jul 2024 05:25:04 -0700 (PDT)
From: Tejas Vipin <tejasvipin76@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de
Cc: dianders@chromium.org, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Tejas Vipin <tejasvipin76@gmail.com>
Subject: [PATCH 1/2] drm/mipi-dsi: Add quiet member to mipi_dsi_multi_context
 struct
Date: Wed, 24 Jul 2024 17:54:46 +0530
Message-ID: <20240724122447.284165-2-tejasvipin76@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240724122447.284165-1-tejasvipin76@gmail.com>
References: <20240724122447.284165-1-tejasvipin76@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A "quiet" member is added to mipi_dsi_multi_context which allows 
silencing all the errors printed by the multi functions.

Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
---
 include/drm/drm_mipi_dsi.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index 0f520eeeaa8e..75855c1c7dae 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -217,6 +217,16 @@ struct mipi_dsi_multi_context {
 	 * end to see if any of them failed.
 	 */
 	int accum_err;
+
+	/**
+	 * @quiet: Controls if a function calls dev_err or not
+	 *
+	 * Init to 0. When the value of quiet is set to 0, the function
+	 * will  print error messages as required. If this is set to 1,
+	 * the function will not print error messages, but will still
+	 * change the value of accum_err.
+	 */
+	int quiet;
 };
 
 #define MIPI_DSI_MODULE_PREFIX "mipi-dsi:"
-- 
2.45.2

