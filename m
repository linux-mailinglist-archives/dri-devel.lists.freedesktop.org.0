Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B73B9581D8
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 11:16:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1327810E593;
	Tue, 20 Aug 2024 09:16:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="R3JR9Xff";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
 [209.85.167.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C6B110E573
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 09:16:12 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id
 5614622812f47-3db130a872fso3290219b6e.2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 02:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724145371; x=1724750171; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KZnaHK4EX6IXmSa9S9DVv4ypDChh4Hz7REiF4MLYT2E=;
 b=R3JR9Xff6VUWo0xAxNWnM4Wq+O/p4cMa1N2bPUkoURnqIIFNN5gKEnEFtUqjrIbi21
 E6c4u/vI44WAEpew6dnXboFw9MeiAAgN+i9xErRMROsU47QJJNhWHdr7fTcI8/Ml/CRL
 ZmAh9WJ0mvyA9WzD1c65+gaoiHmsHn6zwwoG3mY72wO8M6Q4wHAl7PCwZw+h8+mRoMqY
 ylrJ9fnMYW2wj8o0wWjWeMTbS4QrOeOQ6qtEX/n+Mr3Ym1LaLMU2ilY/Ljs8zpU2AlK4
 rh2+gmGaZetpFoCx+BXirKJwvnlvRA7xizJXsfhMEFeeKvBv95U70Xc5BFIUbmeWe+J6
 +R/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724145371; x=1724750171;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KZnaHK4EX6IXmSa9S9DVv4ypDChh4Hz7REiF4MLYT2E=;
 b=WaPh3FKtDlGM6A1urw14Vcvw3L2snIaVu9OOZc0a7JmM0j6V5CMY3KJXr8f0AgZIHA
 1EWiitwpl7Mvj3LujEKzItucEBg91hVnYf90/PE5F6YKeVS3VmY1bJzws9Q7w2LMygNL
 WZjQKd/dphHkI2M5Lpc2k5XRcvvWmJffyvBILRYCqX+kExZ6b5PXoMmsKnHdcfXC50iA
 nG2dM4q86kOSw2VX010mykIZ8jv5ONjQvITCd7zzg3zZ7odxssq6JdPyX0653b05VeeM
 Nywh9BfPhq7gnXhW5O6mMVkVP6xxYvV7PWB6fthstcJGIUJ8nsH385qss+bChfH2b6Ca
 6xmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJV1KG6MZb/VUvvQ5AC7nVrc4fplGoIx0/bZZ+3gbCmL2Xba9NYx+Diq3UvkuJizW7aJVFSHgx8Hg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwbTKJkuhcG735pW1u6RStQezyJgX8sW5jeX4O0ZFK3xAHpgEpe
 40CS8bA7ORS77ecN+fqCY7I6IZOB8FpfWRtdz/z8um5nGBG1UTPd4oZ++HAi
X-Google-Smtp-Source: AGHT+IElZDUwhMSDH0FDHumsr9AKfUYm79jWusnz6NH1EUP4PLg/jLaGdGff1MfL5CxZm62Q+HYkWQ==
X-Received: by 2002:a54:4e8d:0:b0:3d9:3f51:f351 with SMTP id
 5614622812f47-3dd3acec2ecmr12843378b6e.11.1724145371166; 
 Tue, 20 Aug 2024 02:16:11 -0700 (PDT)
Received: from distilledx.srmu.edu.in ([59.152.80.69])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7c6b61c6f12sm8998575a12.35.2024.08.20.02.16.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2024 02:16:10 -0700 (PDT)
From: Tejas Vipin <tejasvipin76@gmail.com>
To: agx@sigxcpu.org,
	kernel@puri.sm,
	neil.armstrong@linaro.org
Cc: dianders@chromium.org, quic_jesszhan@quicinc.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Tejas Vipin <tejasvipin76@gmail.com>
Subject: [PATCH v2 2/2] drm/panel: mantix-mlaf057we51: write hex in lowercase
Date: Tue, 20 Aug 2024 14:45:54 +0530
Message-ID: <20240820091556.1032726-3-tejasvipin76@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240820091556.1032726-1-tejasvipin76@gmail.com>
References: <20240820091556.1032726-1-tejasvipin76@gmail.com>
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

Converts uppercase hex to lowercase hex for cleanup.

Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
---
 drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c b/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
index 2a365eaa4ad4..4db852ffb0f6 100644
--- a/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
+++ b/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
@@ -23,7 +23,7 @@
 
 /* Manufacturer specific Commands send via DSI */
 #define MANTIX_CMD_OTP_STOP_RELOAD_MIPI 0x41
-#define MANTIX_CMD_INT_CANCEL           0x4C
+#define MANTIX_CMD_INT_CANCEL           0x4c
 #define MANTIX_CMD_SPI_FINISH           0x90
 
 struct mantix {
@@ -50,18 +50,18 @@ static void mantix_init_sequence(struct mipi_dsi_multi_context *dsi_ctx)
 	/*
 	 * Init sequence was supplied by the panel vendor.
 	 */
-	mipi_dsi_generic_write_seq_multi(dsi_ctx, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5A);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5a);
 
 	mipi_dsi_generic_write_seq_multi(dsi_ctx, MANTIX_CMD_INT_CANCEL, 0x03);
-	mipi_dsi_generic_write_seq_multi(dsi_ctx, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5A, 0x03);
-	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x80, 0xA9, 0x00);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5a, 0x03);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x80, 0xa9, 0x00);
 
-	mipi_dsi_generic_write_seq_multi(dsi_ctx, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5A, 0x09);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5a, 0x09);
 	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x80, 0x64, 0x00, 0x64, 0x00, 0x00);
 	mipi_dsi_msleep(dsi_ctx, 20);
 
-	mipi_dsi_generic_write_seq_multi(dsi_ctx, MANTIX_CMD_SPI_FINISH, 0xA5);
-	mipi_dsi_generic_write_seq_multi(dsi_ctx, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x00, 0x2F);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, MANTIX_CMD_SPI_FINISH, 0xa5);
+	mipi_dsi_generic_write_seq_multi(dsi_ctx, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x00, 0x2f);
 	mipi_dsi_msleep(dsi_ctx, 20);
 }
 
-- 
2.46.0

