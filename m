Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82997AA6C9F
	for <lists+dri-devel@lfdr.de>; Fri,  2 May 2025 10:37:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F65D10E38B;
	Fri,  2 May 2025 08:37:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HIgJWEGP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B11610E068;
 Thu,  1 May 2025 22:56:58 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-224341bbc1dso19310225ad.3; 
 Thu, 01 May 2025 15:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746140218; x=1746745018; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/hNkK+w3Tp9coSVbvDk0ynLkJTLG4CIBrvDHTnzboy8=;
 b=HIgJWEGPAMdzHbTymEgdob4F/IpdlMjXU/9wTIV/HuoMJkdtGKfd5B46NK3OwmpioX
 ZNbwSOFhuTOrCImm+EwYfJ1zvKCdk2JNaEsCl6rb0YeYTfYPbwzsv+vF96+SFXN9u3I/
 SWeNiGVSQLIC5qPhKxpfSq9F+oE06FvZYHUL2HTSmd2B3qhMUFQhwsOPEsMy5ocdZHmL
 xw6t3e6BB/LAYM44ix5jvrX6gmArtbaGbWTtOeUpdEfjVS8qhjLVH/svMYU4X+HEk4ln
 3Qckq8HVcs/LdHLBpk1jtf6sn0GCiKCeEhVNdcbDsSF/TdegF2ECMwg2E6STLghQiu45
 SzfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746140218; x=1746745018;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/hNkK+w3Tp9coSVbvDk0ynLkJTLG4CIBrvDHTnzboy8=;
 b=gusu4p9wmEz8Z/nZuglMx8P/jQtdEdF/sPH5KB7C814cuKfPc0rPpIC24rvZeJgv5L
 5lnaIIlnLyAek33x2+VVUqxgRr4V12UMCGztZMF6BG6UbWDh3Zofm6LVro7dzIyxF+TF
 IYhqrEO+89ITAYDwoeh5TVJHXfSzmLyLM122aMQmm+NSCkAqG2jvCtqp4rTX9f8UeYqR
 MFDPY9og0a92pPThDoRv7tRbfIZlD/LI+3Jy6bxMwJfn9E4J34r2qKFy4nYxCtCW94yb
 BWFp3I+B47wlGi+Mm8y3qG+fn9X931zMUAU8zVemkEj8HihBFNbv/qgVHQ2/icD+Lp70
 Akjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWi6OzCY4oKaPUdFfbv5xFuGPw0Y9NVp99WCvy5c56WJgQnU9l410NrgjxIjzBwtVNpfcaN4Hq9sdyS@lists.freedesktop.org,
 AJvYcCXHtiMMuvH9tutlA5n/KBHbMce2wEC1mEqbU+0R7IB0rCdiuKDgA1xnvgjihnA6vmQSy7aG9XNo@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxu5dCIXV1awKlTC2uxgHRe9fnHL0svBS7EVuV/kmJGPeHzTUHD
 8FpT+u9hPMY/vW5GeBTSSRUF1RwtQlA2LppHDXhlxygphtOdI4+o
X-Gm-Gg: ASbGncs+vXuCtvi2TyYBDRULd8VO17yu+k6JhGalRb0F0+60XHddZd8jJlUdQYXr2bk
 NvQ/BuutESRdkWFo8GLnvWQ+RWD90CXC2nGTAbDuT/vy91IvEIy09bT3bizEryT54h24qR6g8R8
 efK/GKeF8iGqF0URwpM1j7/gbEJTGmIaEB2o4yzi5D7eZLX5cjvgxfQMKp97bnBuKbQtkEvJrSq
 0aeMedJsf+Q+E5EzTnkJVSZKyC3K1EWlEyrHAj65yRy7vLqrrOJGXe9vlgylEvF3zty3hQkQahi
 NR4IfQHh8CCwDKmssEZPfyVM5Hr2TOOjtWjUYy97mMAeIkIEtIUTWo1Wf7bBrAOy6xQ=
X-Google-Smtp-Source: AGHT+IEarAC2eFg7d3ZW4mf62+B5cI/GaP5mkjDWb1YIfunCJvJuoypDDwci1vTBHHoTIRldxtIArw==
X-Received: by 2002:a17:903:194b:b0:223:58ff:c722 with SMTP id
 d9443c01a7336-22e10307ee1mr13151415ad.28.1746140217507; 
 Thu, 01 May 2025 15:56:57 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:33:8de4:daf8:3fba:733f:c905])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22e109144d3sm1662335ad.170.2025.05.01.15.56.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 May 2025 15:56:56 -0700 (PDT)
From: Sebastian Aguilera Novoa <saguileranbr@gmail.com>
X-Google-Original-From: Sebastian Aguilera Novoa <saguileran@ime.usp.br>
To: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch
Cc: saguileran@ime.usp.br, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/amd/display/dc/irq: Remove duplications of hpd_ack
 function from IRQ
Date: Thu,  1 May 2025 19:53:34 -0300
Message-ID: <20250501225343.76300-1-saguileran@ime.usp.br>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 02 May 2025 08:37:49 +0000
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

The major of dcn and dce irqs share a copy-pasted collection
of copy-pasted function, which is: hpd_ack.

This patch removes the multiple copy-pasted by moving them to
the irq_service.c and make the irq_service's
calls the functions implemented by the irq_service.c
instead.

The hpd_ack function is replaced by hpd0_ack and hpd1_ack, the
required constants are also added.

The changes were not tested on actual hardware. I am only able
to verify that the changes keep the code compileable and do my
best to look repeatedly if I am not actually changing any code.

Signed-off-by: Sebastian Aguilera Novoa <saguileran@ime.usp.br>
---
 .../dc/irq/dce120/irq_service_dce120.c        | 29 +--------
 .../display/dc/irq/dce60/irq_service_dce60.c  | 31 +--------
 .../display/dc/irq/dce80/irq_service_dce80.c  | 31 +--------
 .../display/dc/irq/dcn10/irq_service_dcn10.c  | 29 +--------
 .../display/dc/irq/dcn20/irq_service_dcn20.c  | 29 +--------
 .../dc/irq/dcn201/irq_service_dcn201.c        | 29 +--------
 .../display/dc/irq/dcn21/irq_service_dcn21.c  | 29 +--------
 .../display/dc/irq/dcn30/irq_service_dcn30.c  | 30 +--------
 .../dc/irq/dcn302/irq_service_dcn302.c        | 19 +-----
 .../dc/irq/dcn303/irq_service_dcn303.c        | 19 +-----
 .../display/dc/irq/dcn31/irq_service_dcn31.c  | 29 +--------
 .../dc/irq/dcn314/irq_service_dcn314.c        | 29 +--------
 .../dc/irq/dcn315/irq_service_dcn315.c        | 29 +--------
 .../display/dc/irq/dcn32/irq_service_dcn32.c  | 29 +--------
 .../display/dc/irq/dcn35/irq_service_dcn35.c  | 29 +--------
 .../dc/irq/dcn351/irq_service_dcn351.c        | 29 +--------
 .../display/dc/irq/dcn36/irq_service_dcn36.c  | 29 +--------
 .../dc/irq/dcn401/irq_service_dcn401.c        | 29 +--------
 .../gpu/drm/amd/display/dc/irq/irq_service.c  | 63 +++++++++++++++++++
 .../gpu/drm/amd/display/dc/irq/irq_service.h  |  8 +++
 20 files changed, 89 insertions(+), 489 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/irq/dce120/irq_service_dce120.c b/drivers/gpu/drm/amd/display/dc/irq/dce120/irq_service_dce120.c
index 953f4a4dacad..33ce470e4c88 100644
--- a/drivers/gpu/drm/amd/display/dc/irq/dce120/irq_service_dce120.c
+++ b/drivers/gpu/drm/amd/display/dc/irq/dce120/irq_service_dce120.c
@@ -37,36 +37,9 @@
 
 #include "ivsrcid/ivsrcid_vislands30.h"
 
-static bool hpd_ack(
-	struct irq_service *irq_service,
-	const struct irq_source_info *info)
-{
-	uint32_t addr = info->status_reg;
-	uint32_t value = dm_read_reg(irq_service->ctx, addr);
-	uint32_t current_status =
-		get_reg_field_value(
-			value,
-			HPD0_DC_HPD_INT_STATUS,
-			DC_HPD_SENSE_DELAYED);
-
-	dal_irq_service_ack_generic(irq_service, info);
-
-	value = dm_read_reg(irq_service->ctx, info->enable_reg);
-
-	set_reg_field_value(
-		value,
-		current_status ? 0 : 1,
-		HPD0_DC_HPD_INT_CONTROL,
-		DC_HPD_INT_POLARITY);
-
-	dm_write_reg(irq_service->ctx, info->enable_reg, value);
-
-	return true;
-}
-
 static struct irq_source_info_funcs hpd_irq_info_funcs  = {
 	.set = NULL,
-	.ack = hpd_ack
+	.ack = hpd0_ack
 };
 
 static struct irq_source_info_funcs hpd_rx_irq_info_funcs = {
diff --git a/drivers/gpu/drm/amd/display/dc/irq/dce60/irq_service_dce60.c b/drivers/gpu/drm/amd/display/dc/irq/dce60/irq_service_dce60.c
index 2c72074310c7..d777b85e70da 100644
--- a/drivers/gpu/drm/amd/display/dc/irq/dce60/irq_service_dce60.c
+++ b/drivers/gpu/drm/amd/display/dc/irq/dce60/irq_service_dce60.c
@@ -46,36 +46,9 @@
 
 #include "dc_types.h"
 
-static bool hpd_ack(
-	struct irq_service *irq_service,
-	const struct irq_source_info *info)
-{
-	uint32_t addr = info->status_reg;
-	uint32_t value = dm_read_reg(irq_service->ctx, addr);
-	uint32_t current_status =
-		get_reg_field_value(
-			value,
-			DC_HPD1_INT_STATUS,
-			DC_HPD1_SENSE_DELAYED);
-
-	dal_irq_service_ack_generic(irq_service, info);
-
-	value = dm_read_reg(irq_service->ctx, info->enable_reg);
-
-	set_reg_field_value(
-		value,
-		current_status ? 0 : 1,
-		DC_HPD1_INT_CONTROL,
-		DC_HPD1_INT_POLARITY);
-
-	dm_write_reg(irq_service->ctx, info->enable_reg, value);
-
-	return true;
-}
-
 static struct irq_source_info_funcs hpd_irq_info_funcs  = {
 	.set = NULL,
-	.ack = hpd_ack
+	.ack = hpd1_ack
 };
 
 static struct irq_source_info_funcs hpd_rx_irq_info_funcs = {
@@ -391,5 +364,3 @@ struct irq_service *dal_irq_service_dce60_create(
 	dce60_irq_construct(irq_service, init_data);
 	return irq_service;
 }
-
-
diff --git a/drivers/gpu/drm/amd/display/dc/irq/dce80/irq_service_dce80.c b/drivers/gpu/drm/amd/display/dc/irq/dce80/irq_service_dce80.c
index 49317934ef4f..3a9163acb49b 100644
--- a/drivers/gpu/drm/amd/display/dc/irq/dce80/irq_service_dce80.c
+++ b/drivers/gpu/drm/amd/display/dc/irq/dce80/irq_service_dce80.c
@@ -37,36 +37,9 @@
 
 #include "dc_types.h"
 
-static bool hpd_ack(
-	struct irq_service *irq_service,
-	const struct irq_source_info *info)
-{
-	uint32_t addr = info->status_reg;
-	uint32_t value = dm_read_reg(irq_service->ctx, addr);
-	uint32_t current_status =
-		get_reg_field_value(
-			value,
-			DC_HPD1_INT_STATUS,
-			DC_HPD1_SENSE_DELAYED);
-
-	dal_irq_service_ack_generic(irq_service, info);
-
-	value = dm_read_reg(irq_service->ctx, info->enable_reg);
-
-	set_reg_field_value(
-		value,
-		current_status ? 0 : 1,
-		DC_HPD1_INT_CONTROL,
-		DC_HPD1_INT_POLARITY);
-
-	dm_write_reg(irq_service->ctx, info->enable_reg, value);
-
-	return true;
-}
-
 static struct irq_source_info_funcs hpd_irq_info_funcs  = {
 	.set = NULL,
-	.ack = hpd_ack
+	.ack = hpd1_ack
 };
 
 static struct irq_source_info_funcs hpd_rx_irq_info_funcs = {
@@ -303,5 +276,3 @@ struct irq_service *dal_irq_service_dce80_create(
 	dce80_irq_construct(irq_service, init_data);
 	return irq_service;
 }
-
-
diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn10/irq_service_dcn10.c b/drivers/gpu/drm/amd/display/dc/irq/dcn10/irq_service_dcn10.c
index 9ca28565a9d1..4ce9edd16344 100644
--- a/drivers/gpu/drm/amd/display/dc/irq/dcn10/irq_service_dcn10.c
+++ b/drivers/gpu/drm/amd/display/dc/irq/dcn10/irq_service_dcn10.c
@@ -129,36 +129,9 @@ static enum dc_irq_source to_dal_irq_source_dcn10(struct irq_service *irq_servic
 	}
 }
 
-static bool hpd_ack(
-	struct irq_service *irq_service,
-	const struct irq_source_info *info)
-{
-	uint32_t addr = info->status_reg;
-	uint32_t value = dm_read_reg(irq_service->ctx, addr);
-	uint32_t current_status =
-		get_reg_field_value(
-			value,
-			HPD0_DC_HPD_INT_STATUS,
-			DC_HPD_SENSE_DELAYED);
-
-	dal_irq_service_ack_generic(irq_service, info);
-
-	value = dm_read_reg(irq_service->ctx, info->enable_reg);
-
-	set_reg_field_value(
-		value,
-		current_status ? 0 : 1,
-		HPD0_DC_HPD_INT_CONTROL,
-		DC_HPD_INT_POLARITY);
-
-	dm_write_reg(irq_service->ctx, info->enable_reg, value);
-
-	return true;
-}
-
 static struct irq_source_info_funcs hpd_irq_info_funcs  = {
 	.set = NULL,
-	.ack = hpd_ack
+	.ack = hpd0_ack
 };
 
 static struct irq_source_info_funcs hpd_rx_irq_info_funcs = {
diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn20/irq_service_dcn20.c b/drivers/gpu/drm/amd/display/dc/irq/dcn20/irq_service_dcn20.c
index 916f0c974637..5847af0e66cb 100644
--- a/drivers/gpu/drm/amd/display/dc/irq/dcn20/irq_service_dcn20.c
+++ b/drivers/gpu/drm/amd/display/dc/irq/dcn20/irq_service_dcn20.c
@@ -130,36 +130,9 @@ static enum dc_irq_source to_dal_irq_source_dcn20(
 	}
 }
 
-static bool hpd_ack(
-	struct irq_service *irq_service,
-	const struct irq_source_info *info)
-{
-	uint32_t addr = info->status_reg;
-	uint32_t value = dm_read_reg(irq_service->ctx, addr);
-	uint32_t current_status =
-		get_reg_field_value(
-			value,
-			HPD0_DC_HPD_INT_STATUS,
-			DC_HPD_SENSE_DELAYED);
-
-	dal_irq_service_ack_generic(irq_service, info);
-
-	value = dm_read_reg(irq_service->ctx, info->enable_reg);
-
-	set_reg_field_value(
-		value,
-		current_status ? 0 : 1,
-		HPD0_DC_HPD_INT_CONTROL,
-		DC_HPD_INT_POLARITY);
-
-	dm_write_reg(irq_service->ctx, info->enable_reg, value);
-
-	return true;
-}
-
 static struct irq_source_info_funcs hpd_irq_info_funcs  = {
 	.set = NULL,
-	.ack = hpd_ack
+	.ack = hpd0_ack
 };
 
 static struct irq_source_info_funcs hpd_rx_irq_info_funcs = {
diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn201/irq_service_dcn201.c b/drivers/gpu/drm/amd/display/dc/irq/dcn201/irq_service_dcn201.c
index 1d61d475d36f..6417011d2246 100644
--- a/drivers/gpu/drm/amd/display/dc/irq/dcn201/irq_service_dcn201.c
+++ b/drivers/gpu/drm/amd/display/dc/irq/dcn201/irq_service_dcn201.c
@@ -80,36 +80,9 @@ static enum dc_irq_source to_dal_irq_source_dcn201(
 	}
 }
 
-static bool hpd_ack(
-	struct irq_service *irq_service,
-	const struct irq_source_info *info)
-{
-	uint32_t addr = info->status_reg;
-	uint32_t value = dm_read_reg(irq_service->ctx, addr);
-	uint32_t current_status =
-		get_reg_field_value(
-			value,
-			HPD0_DC_HPD_INT_STATUS,
-			DC_HPD_SENSE_DELAYED);
-
-	dal_irq_service_ack_generic(irq_service, info);
-
-	value = dm_read_reg(irq_service->ctx, info->enable_reg);
-
-	set_reg_field_value(
-		value,
-		current_status ? 0 : 1,
-		HPD0_DC_HPD_INT_CONTROL,
-		DC_HPD_INT_POLARITY);
-
-	dm_write_reg(irq_service->ctx, info->enable_reg, value);
-
-	return true;
-}
-
 static struct irq_source_info_funcs hpd_irq_info_funcs  = {
 	.set = NULL,
-	.ack = hpd_ack
+	.ack = hpd0_ack
 };
 
 static struct irq_source_info_funcs hpd_rx_irq_info_funcs = {
diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn21/irq_service_dcn21.c b/drivers/gpu/drm/amd/display/dc/irq/dcn21/irq_service_dcn21.c
index 42cdfe6c3538..71d2f065140b 100644
--- a/drivers/gpu/drm/amd/display/dc/irq/dcn21/irq_service_dcn21.c
+++ b/drivers/gpu/drm/amd/display/dc/irq/dcn21/irq_service_dcn21.c
@@ -132,36 +132,9 @@ static enum dc_irq_source to_dal_irq_source_dcn21(struct irq_service *irq_servic
 	return DC_IRQ_SOURCE_INVALID;
 }
 
-static bool hpd_ack(
-	struct irq_service *irq_service,
-	const struct irq_source_info *info)
-{
-	uint32_t addr = info->status_reg;
-	uint32_t value = dm_read_reg(irq_service->ctx, addr);
-	uint32_t current_status =
-		get_reg_field_value(
-			value,
-			HPD0_DC_HPD_INT_STATUS,
-			DC_HPD_SENSE_DELAYED);
-
-	dal_irq_service_ack_generic(irq_service, info);
-
-	value = dm_read_reg(irq_service->ctx, info->enable_reg);
-
-	set_reg_field_value(
-		value,
-		current_status ? 0 : 1,
-		HPD0_DC_HPD_INT_CONTROL,
-		DC_HPD_INT_POLARITY);
-
-	dm_write_reg(irq_service->ctx, info->enable_reg, value);
-
-	return true;
-}
-
 static struct irq_source_info_funcs hpd_irq_info_funcs  = {
 	.set = NULL,
-	.ack = hpd_ack
+	.ack = hpd0_ack
 };
 
 static struct irq_source_info_funcs hpd_rx_irq_info_funcs = {
diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn30/irq_service_dcn30.c b/drivers/gpu/drm/amd/display/dc/irq/dcn30/irq_service_dcn30.c
index a443a8abb1ea..2a4080bdcf6b 100644
--- a/drivers/gpu/drm/amd/display/dc/irq/dcn30/irq_service_dcn30.c
+++ b/drivers/gpu/drm/amd/display/dc/irq/dcn30/irq_service_dcn30.c
@@ -139,36 +139,9 @@ static enum dc_irq_source to_dal_irq_source_dcn30(
 	}
 }
 
-static bool hpd_ack(
-	struct irq_service *irq_service,
-	const struct irq_source_info *info)
-{
-	uint32_t addr = info->status_reg;
-	uint32_t value = dm_read_reg(irq_service->ctx, addr);
-	uint32_t current_status =
-		get_reg_field_value(
-			value,
-			HPD0_DC_HPD_INT_STATUS,
-			DC_HPD_SENSE_DELAYED);
-
-	dal_irq_service_ack_generic(irq_service, info);
-
-	value = dm_read_reg(irq_service->ctx, info->enable_reg);
-
-	set_reg_field_value(
-		value,
-		current_status ? 0 : 1,
-		HPD0_DC_HPD_INT_CONTROL,
-		DC_HPD_INT_POLARITY);
-
-	dm_write_reg(irq_service->ctx, info->enable_reg, value);
-
-	return true;
-}
-
 static struct irq_source_info_funcs hpd_irq_info_funcs  = {
 	.set = NULL,
-	.ack = hpd_ack
+	.ack = hpd0_ack
 };
 
 static struct irq_source_info_funcs hpd_rx_irq_info_funcs = {
@@ -447,4 +420,3 @@ struct irq_service *dal_irq_service_dcn30_create(
 	dcn30_irq_construct(irq_service, init_data);
 	return irq_service;
 }
-
diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn302/irq_service_dcn302.c b/drivers/gpu/drm/amd/display/dc/irq/dcn302/irq_service_dcn302.c
index 8ffc7e2c681a..624f1ac309f8 100644
--- a/drivers/gpu/drm/amd/display/dc/irq/dcn302/irq_service_dcn302.c
+++ b/drivers/gpu/drm/amd/display/dc/irq/dcn302/irq_service_dcn302.c
@@ -126,26 +126,9 @@ static enum dc_irq_source to_dal_irq_source_dcn302(struct irq_service *irq_servi
 	}
 }
 
-static bool hpd_ack(struct irq_service *irq_service, const struct irq_source_info *info)
-{
-	uint32_t addr = info->status_reg;
-	uint32_t value = dm_read_reg(irq_service->ctx, addr);
-	uint32_t current_status = get_reg_field_value(value, HPD0_DC_HPD_INT_STATUS, DC_HPD_SENSE_DELAYED);
-
-	dal_irq_service_ack_generic(irq_service, info);
-
-	value = dm_read_reg(irq_service->ctx, info->enable_reg);
-
-	set_reg_field_value(value, current_status ? 0 : 1, HPD0_DC_HPD_INT_CONTROL, DC_HPD_INT_POLARITY);
-
-	dm_write_reg(irq_service->ctx, info->enable_reg, value);
-
-	return true;
-}
-
 static struct irq_source_info_funcs hpd_irq_info_funcs  = {
 		.set = NULL,
-		.ack = hpd_ack
+		.ack = hpd0_ack
 };
 
 static struct irq_source_info_funcs hpd_rx_irq_info_funcs = {
diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn303/irq_service_dcn303.c b/drivers/gpu/drm/amd/display/dc/irq/dcn303/irq_service_dcn303.c
index 262bb8b74b15..137caffae916 100644
--- a/drivers/gpu/drm/amd/display/dc/irq/dcn303/irq_service_dcn303.c
+++ b/drivers/gpu/drm/amd/display/dc/irq/dcn303/irq_service_dcn303.c
@@ -77,26 +77,9 @@ static enum dc_irq_source to_dal_irq_source_dcn303(struct irq_service *irq_servi
 	}
 }
 
-static bool hpd_ack(struct irq_service *irq_service, const struct irq_source_info *info)
-{
-	uint32_t addr = info->status_reg;
-	uint32_t value = dm_read_reg(irq_service->ctx, addr);
-	uint32_t current_status = get_reg_field_value(value, HPD0_DC_HPD_INT_STATUS, DC_HPD_SENSE_DELAYED);
-
-	dal_irq_service_ack_generic(irq_service, info);
-
-	value = dm_read_reg(irq_service->ctx, info->enable_reg);
-
-	set_reg_field_value(value, current_status ? 0 : 1, HPD0_DC_HPD_INT_CONTROL, DC_HPD_INT_POLARITY);
-
-	dm_write_reg(irq_service->ctx, info->enable_reg, value);
-
-	return true;
-}
-
 static struct irq_source_info_funcs hpd_irq_info_funcs  = {
 		.set = NULL,
-		.ack = hpd_ack
+		.ack = hpd0_ack
 };
 
 static struct irq_source_info_funcs hpd_rx_irq_info_funcs = {
diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn31/irq_service_dcn31.c b/drivers/gpu/drm/amd/display/dc/irq/dcn31/irq_service_dcn31.c
index 53e78ae7eecf..921cb167d920 100644
--- a/drivers/gpu/drm/amd/display/dc/irq/dcn31/irq_service_dcn31.c
+++ b/drivers/gpu/drm/amd/display/dc/irq/dcn31/irq_service_dcn31.c
@@ -128,36 +128,9 @@ static enum dc_irq_source to_dal_irq_source_dcn31(struct irq_service *irq_servic
 	}
 }
 
-static bool hpd_ack(
-	struct irq_service *irq_service,
-	const struct irq_source_info *info)
-{
-	uint32_t addr = info->status_reg;
-	uint32_t value = dm_read_reg(irq_service->ctx, addr);
-	uint32_t current_status =
-		get_reg_field_value(
-			value,
-			HPD0_DC_HPD_INT_STATUS,
-			DC_HPD_SENSE_DELAYED);
-
-	dal_irq_service_ack_generic(irq_service, info);
-
-	value = dm_read_reg(irq_service->ctx, info->enable_reg);
-
-	set_reg_field_value(
-		value,
-		current_status ? 0 : 1,
-		HPD0_DC_HPD_INT_CONTROL,
-		DC_HPD_INT_POLARITY);
-
-	dm_write_reg(irq_service->ctx, info->enable_reg, value);
-
-	return true;
-}
-
 static struct irq_source_info_funcs hpd_irq_info_funcs  = {
 	.set = NULL,
-	.ack = hpd_ack
+	.ack = hpd0_ack
 };
 
 static struct irq_source_info_funcs hpd_rx_irq_info_funcs = {
diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn314/irq_service_dcn314.c b/drivers/gpu/drm/amd/display/dc/irq/dcn314/irq_service_dcn314.c
index e0563e880432..0118fd6e5db0 100644
--- a/drivers/gpu/drm/amd/display/dc/irq/dcn314/irq_service_dcn314.c
+++ b/drivers/gpu/drm/amd/display/dc/irq/dcn314/irq_service_dcn314.c
@@ -130,36 +130,9 @@ static enum dc_irq_source to_dal_irq_source_dcn314(struct irq_service *irq_servi
 	}
 }
 
-static bool hpd_ack(
-	struct irq_service *irq_service,
-	const struct irq_source_info *info)
-{
-	uint32_t addr = info->status_reg;
-	uint32_t value = dm_read_reg(irq_service->ctx, addr);
-	uint32_t current_status =
-		get_reg_field_value(
-			value,
-			HPD0_DC_HPD_INT_STATUS,
-			DC_HPD_SENSE_DELAYED);
-
-	dal_irq_service_ack_generic(irq_service, info);
-
-	value = dm_read_reg(irq_service->ctx, info->enable_reg);
-
-	set_reg_field_value(
-		value,
-		current_status ? 0 : 1,
-		HPD0_DC_HPD_INT_CONTROL,
-		DC_HPD_INT_POLARITY);
-
-	dm_write_reg(irq_service->ctx, info->enable_reg, value);
-
-	return true;
-}
-
 static struct irq_source_info_funcs hpd_irq_info_funcs  = {
 	.set = NULL,
-	.ack = hpd_ack
+	.ack = hpd0_ack
 };
 
 static struct irq_source_info_funcs hpd_rx_irq_info_funcs = {
diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn315/irq_service_dcn315.c b/drivers/gpu/drm/amd/display/dc/irq/dcn315/irq_service_dcn315.c
index 2ef22299101a..adebfc888618 100644
--- a/drivers/gpu/drm/amd/display/dc/irq/dcn315/irq_service_dcn315.c
+++ b/drivers/gpu/drm/amd/display/dc/irq/dcn315/irq_service_dcn315.c
@@ -135,36 +135,9 @@ static enum dc_irq_source to_dal_irq_source_dcn315(
 	}
 }
 
-static bool hpd_ack(
-	struct irq_service *irq_service,
-	const struct irq_source_info *info)
-{
-	uint32_t addr = info->status_reg;
-	uint32_t value = dm_read_reg(irq_service->ctx, addr);
-	uint32_t current_status =
-		get_reg_field_value(
-			value,
-			HPD0_DC_HPD_INT_STATUS,
-			DC_HPD_SENSE_DELAYED);
-
-	dal_irq_service_ack_generic(irq_service, info);
-
-	value = dm_read_reg(irq_service->ctx, info->enable_reg);
-
-	set_reg_field_value(
-		value,
-		current_status ? 0 : 1,
-		HPD0_DC_HPD_INT_CONTROL,
-		DC_HPD_INT_POLARITY);
-
-	dm_write_reg(irq_service->ctx, info->enable_reg, value);
-
-	return true;
-}
-
 static struct irq_source_info_funcs hpd_irq_info_funcs  = {
 	.set = NULL,
-	.ack = hpd_ack
+	.ack = hpd0_ack
 };
 
 static struct irq_source_info_funcs hpd_rx_irq_info_funcs = {
diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn32/irq_service_dcn32.c b/drivers/gpu/drm/amd/display/dc/irq/dcn32/irq_service_dcn32.c
index f839afacd5a5..e9e315c75d76 100644
--- a/drivers/gpu/drm/amd/display/dc/irq/dcn32/irq_service_dcn32.c
+++ b/drivers/gpu/drm/amd/display/dc/irq/dcn32/irq_service_dcn32.c
@@ -129,36 +129,9 @@ static enum dc_irq_source to_dal_irq_source_dcn32(
 	}
 }
 
-static bool hpd_ack(
-	struct irq_service *irq_service,
-	const struct irq_source_info *info)
-{
-	uint32_t addr = info->status_reg;
-	uint32_t value = dm_read_reg(irq_service->ctx, addr);
-	uint32_t current_status =
-		get_reg_field_value(
-			value,
-			HPD0_DC_HPD_INT_STATUS,
-			DC_HPD_SENSE_DELAYED);
-
-	dal_irq_service_ack_generic(irq_service, info);
-
-	value = dm_read_reg(irq_service->ctx, info->enable_reg);
-
-	set_reg_field_value(
-		value,
-		current_status ? 0 : 1,
-		HPD0_DC_HPD_INT_CONTROL,
-		DC_HPD_INT_POLARITY);
-
-	dm_write_reg(irq_service->ctx, info->enable_reg, value);
-
-	return true;
-}
-
 static struct irq_source_info_funcs hpd_irq_info_funcs  = {
 	.set = NULL,
-	.ack = hpd_ack
+	.ack = hpd0_ack
 };
 
 static struct irq_source_info_funcs hpd_rx_irq_info_funcs = {
diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn35/irq_service_dcn35.c b/drivers/gpu/drm/amd/display/dc/irq/dcn35/irq_service_dcn35.c
index ea8c271171bc..79e5e8c137ca 100644
--- a/drivers/gpu/drm/amd/display/dc/irq/dcn35/irq_service_dcn35.c
+++ b/drivers/gpu/drm/amd/display/dc/irq/dcn35/irq_service_dcn35.c
@@ -127,36 +127,9 @@ static enum dc_irq_source to_dal_irq_source_dcn35(
 	}
 }
 
-static bool hpd_ack(
-	struct irq_service *irq_service,
-	const struct irq_source_info *info)
-{
-	uint32_t addr = info->status_reg;
-	uint32_t value = dm_read_reg(irq_service->ctx, addr);
-	uint32_t current_status =
-		get_reg_field_value(
-			value,
-			HPD0_DC_HPD_INT_STATUS,
-			DC_HPD_SENSE_DELAYED);
-
-	dal_irq_service_ack_generic(irq_service, info);
-
-	value = dm_read_reg(irq_service->ctx, info->enable_reg);
-
-	set_reg_field_value(
-		value,
-		current_status ? 0 : 1,
-		HPD0_DC_HPD_INT_CONTROL,
-		DC_HPD_INT_POLARITY);
-
-	dm_write_reg(irq_service->ctx, info->enable_reg, value);
-
-	return true;
-}
-
 static struct irq_source_info_funcs hpd_irq_info_funcs = {
 	.set = NULL,
-	.ack = hpd_ack
+	.ack = hpd0_ack
 };
 
 static struct irq_source_info_funcs hpd_rx_irq_info_funcs = {
diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn351/irq_service_dcn351.c b/drivers/gpu/drm/amd/display/dc/irq/dcn351/irq_service_dcn351.c
index 7ec8e0de2f01..163b8ee9ebf7 100644
--- a/drivers/gpu/drm/amd/display/dc/irq/dcn351/irq_service_dcn351.c
+++ b/drivers/gpu/drm/amd/display/dc/irq/dcn351/irq_service_dcn351.c
@@ -106,36 +106,9 @@ static enum dc_irq_source to_dal_irq_source_dcn351(
 	}
 }
 
-static bool hpd_ack(
-	struct irq_service *irq_service,
-	const struct irq_source_info *info)
-{
-	uint32_t addr = info->status_reg;
-	uint32_t value = dm_read_reg(irq_service->ctx, addr);
-	uint32_t current_status =
-		get_reg_field_value(
-			value,
-			HPD0_DC_HPD_INT_STATUS,
-			DC_HPD_SENSE_DELAYED);
-
-	dal_irq_service_ack_generic(irq_service, info);
-
-	value = dm_read_reg(irq_service->ctx, info->enable_reg);
-
-	set_reg_field_value(
-		value,
-		current_status ? 0 : 1,
-		HPD0_DC_HPD_INT_CONTROL,
-		DC_HPD_INT_POLARITY);
-
-	dm_write_reg(irq_service->ctx, info->enable_reg, value);
-
-	return true;
-}
-
 static struct irq_source_info_funcs hpd_irq_info_funcs = {
 	.set = NULL,
-	.ack = hpd_ack
+	.ack = hpd0_ack
 };
 
 static struct irq_source_info_funcs hpd_rx_irq_info_funcs = {
diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn36/irq_service_dcn36.c b/drivers/gpu/drm/amd/display/dc/irq/dcn36/irq_service_dcn36.c
index ea958628f8b8..f716ab0fd30e 100644
--- a/drivers/gpu/drm/amd/display/dc/irq/dcn36/irq_service_dcn36.c
+++ b/drivers/gpu/drm/amd/display/dc/irq/dcn36/irq_service_dcn36.c
@@ -105,36 +105,9 @@ static enum dc_irq_source to_dal_irq_source_dcn36(
 	}
 }
 
-static bool hpd_ack(
-	struct irq_service *irq_service,
-	const struct irq_source_info *info)
-{
-	uint32_t addr = info->status_reg;
-	uint32_t value = dm_read_reg(irq_service->ctx, addr);
-	uint32_t current_status =
-		get_reg_field_value(
-			value,
-			HPD0_DC_HPD_INT_STATUS,
-			DC_HPD_SENSE_DELAYED);
-
-	dal_irq_service_ack_generic(irq_service, info);
-
-	value = dm_read_reg(irq_service->ctx, info->enable_reg);
-
-	set_reg_field_value(
-		value,
-		current_status ? 0 : 1,
-		HPD0_DC_HPD_INT_CONTROL,
-		DC_HPD_INT_POLARITY);
-
-	dm_write_reg(irq_service->ctx, info->enable_reg, value);
-
-	return true;
-}
-
 static struct irq_source_info_funcs hpd_irq_info_funcs = {
 	.set = NULL,
-	.ack = hpd_ack
+	.ack = hpd0_ack
 };
 
 static struct irq_source_info_funcs hpd_rx_irq_info_funcs = {
diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn401/irq_service_dcn401.c b/drivers/gpu/drm/amd/display/dc/irq/dcn401/irq_service_dcn401.c
index 8499e505cf3e..fd9bb1950c20 100644
--- a/drivers/gpu/drm/amd/display/dc/irq/dcn401/irq_service_dcn401.c
+++ b/drivers/gpu/drm/amd/display/dc/irq/dcn401/irq_service_dcn401.c
@@ -109,36 +109,9 @@ static enum dc_irq_source to_dal_irq_source_dcn401(
 	}
 }
 
-static bool hpd_ack(
-	struct irq_service *irq_service,
-	const struct irq_source_info *info)
-{
-	uint32_t addr = info->status_reg;
-	uint32_t value = dm_read_reg(irq_service->ctx, addr);
-	uint32_t current_status =
-		get_reg_field_value(
-			value,
-			HPD0_DC_HPD_INT_STATUS,
-			DC_HPD_SENSE_DELAYED);
-
-	dal_irq_service_ack_generic(irq_service, info);
-
-	value = dm_read_reg(irq_service->ctx, info->enable_reg);
-
-	set_reg_field_value(
-		value,
-		current_status ? 0 : 1,
-		HPD0_DC_HPD_INT_CONTROL,
-		DC_HPD_INT_POLARITY);
-
-	dm_write_reg(irq_service->ctx, info->enable_reg, value);
-
-	return true;
-}
-
 static struct irq_source_info_funcs hpd_irq_info_funcs = {
 	.set = NULL,
-	.ack = hpd_ack
+	.ack = hpd0_ack
 };
 
 static struct irq_source_info_funcs hpd_rx_irq_info_funcs = {
diff --git a/drivers/gpu/drm/amd/display/dc/irq/irq_service.c b/drivers/gpu/drm/amd/display/dc/irq/irq_service.c
index eca3d7ee7e4e..fe593eba1246 100644
--- a/drivers/gpu/drm/amd/display/dc/irq/irq_service.c
+++ b/drivers/gpu/drm/amd/display/dc/irq/irq_service.c
@@ -41,6 +41,15 @@
 #include "reg_helper.h"
 #include "irq_service.h"
 
+#define HPD0_DC_HPD_INT_STATUS__DC_HPD_SENSE_DELAYED_MASK     	0x00000010L
+#define HPD0_DC_HPD_INT_CONTROL__DC_HPD_INT_POLARITY_MASK     	0x00000100L
+#define HPD0_DC_HPD_INT_STATUS__DC_HPD_SENSE_DELAYED__SHIFT		0x4
+#define HPD0_DC_HPD_INT_CONTROL__DC_HPD_INT_POLARITY__SHIFT     0x8
+
+#define DC_HPD1_INT_STATUS__DC_HPD1_SENSE_DELAYED_MASK 			0x10
+#define DC_HPD1_INT_STATUS__DC_HPD1_SENSE_DELAYED__SHIFT 		0x4
+#define DC_HPD1_INT_CONTROL__DC_HPD1_INT_POLARITY_MASK 			0x100
+#define DC_HPD1_INT_CONTROL__DC_HPD1_INT_POLARITY__SHIFT 		0x8
 
 
 #define CTX \
@@ -177,3 +186,57 @@ enum dc_irq_source dal_irq_service_to_irq_source(
 		src_id,
 		ext_id);
 }
+
+bool hpd0_ack(
+	struct irq_service *irq_service,
+	const struct irq_source_info *info)
+{
+	uint32_t addr = info->status_reg;
+	uint32_t value = dm_read_reg(irq_service->ctx, addr);
+	uint32_t current_status =
+		get_reg_field_value(
+			value,
+			HPD0_DC_HPD_INT_STATUS,
+			DC_HPD_SENSE_DELAYED);
+
+	dal_irq_service_ack_generic(irq_service, info);
+
+	value = dm_read_reg(irq_service->ctx, info->enable_reg);
+
+	set_reg_field_value(
+		value,
+		current_status ? 0 : 1,
+		HPD0_DC_HPD_INT_CONTROL,
+		DC_HPD_INT_POLARITY);
+
+	dm_write_reg(irq_service->ctx, info->enable_reg, value);
+
+	return true;
+}
+
+bool hpd1_ack(
+	struct irq_service *irq_service,
+	const struct irq_source_info *info)
+{
+	uint32_t addr = info->status_reg;
+	uint32_t value = dm_read_reg(irq_service->ctx, addr);
+	uint32_t current_status =
+		get_reg_field_value(
+			value,
+			DC_HPD1_INT_STATUS,
+			DC_HPD1_SENSE_DELAYED);
+
+	dal_irq_service_ack_generic(irq_service, info);
+
+	value = dm_read_reg(irq_service->ctx, info->enable_reg);
+
+	set_reg_field_value(
+		value,
+		current_status ? 0 : 1,
+		DC_HPD1_INT_CONTROL,
+		DC_HPD1_INT_POLARITY);
+
+	dm_write_reg(irq_service->ctx, info->enable_reg, value);
+
+	return true;
+}
diff --git a/drivers/gpu/drm/amd/display/dc/irq/irq_service.h b/drivers/gpu/drm/amd/display/dc/irq/irq_service.h
index b178f85944cd..bbcef3d2fe33 100644
--- a/drivers/gpu/drm/amd/display/dc/irq/irq_service.h
+++ b/drivers/gpu/drm/amd/display/dc/irq/irq_service.h
@@ -82,4 +82,12 @@ void dal_irq_service_set_generic(
 	const struct irq_source_info *info,
 	bool enable);
 
+bool hpd0_ack(
+	struct irq_service *irq_service,
+	const struct irq_source_info *info);
+
+bool hpd1_ack(
+	struct irq_service *irq_service,
+	const struct irq_source_info *info);
+
 #endif
-- 
2.43.0

