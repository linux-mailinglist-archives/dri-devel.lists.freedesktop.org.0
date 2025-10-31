Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF049C2525F
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 14:02:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27AA410EB1D;
	Fri, 31 Oct 2025 13:02:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XKRqTA+N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E4F310EB1D
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 13:02:31 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-475e01db75aso14829865e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 06:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761915750; x=1762520550; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2FQGZCGnHsgyhdfpYgLWb8UhWYQWnOT5iNG04Z0iL94=;
 b=XKRqTA+N0FlOH8g4WHUgiXhqQ/loz/G5ZlKgaVEfoZLS2mbiBhdpYBSRAWcziIbiOB
 wxdtLh5V1RDNiW9e3+Jw2IisjSQ8qlfMbjMuQjGiUomYpJWUw53BEMZLE/TzMO7/Q91x
 88kdR8rBUgBDbK0JN3TpBUYYF6H8iCTrVH2ioBAI5TKBg0YbLpfUkKS6kXtSQLxWARdp
 IM4x85Zur4MDY/sMlthQvp8AA1pJcGwGP/dUnnhFy4yNk0jPJXBs+28clAC3TSzjXt4k
 ftRhlSl2aStRu7ClP1sjUDhEM7DvnyfpLvVeI5Nk6oihVMFS9iy7n+Sz4HwalZRTjumR
 Vz2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761915750; x=1762520550;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2FQGZCGnHsgyhdfpYgLWb8UhWYQWnOT5iNG04Z0iL94=;
 b=v7z6gRJXsMl9AcBX5+Rd16jTJ/onSm/Q7EHjIwPfzvloNRryQw5MvXvX3WiQpW2K/N
 EM5RqRcSR27+VhPUbKrnSkuvZWyEffblU7bDgt6kTTNbdaQk9hdDE1QYundqVCuF9Ceu
 fTE63iZoV9EQmvQ8O9S7wBfK/DljZTSJDx3ErOUxdpNdaWsXfyI8b40OzQMC9Pwxh+4f
 I4QI/99ebUkzJYCirNoLaAnSy0JagZDJreh/z1nqg8XKp904O2o0PxgXXolkO5TScVgC
 dDvSLmiTIi1Tvil8XlN11VZIZJd2QtZ6hXw7YHe2qWlRs4nCQkOZR/cycxFnFdpHpgUK
 Woag==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4THCmXxisZE0HZuvEHqJZR4mbJmJlUBJwmx9UJPQL3hVNcZq4Zk6RFaHAzzvRpLdXLT3Vw1TjfKk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzwtlQOC7N4ufSYH3jNq/BpGRcuTOJyZ3oxEwHQRPlEhTtB5del
 2JPaA5K9tFEUbowm/RqTrA/DQUaN2WdjIzajN3CVmxcIqM7Lza6cj7oxOfX8KuFAbd4=
X-Gm-Gg: ASbGncuX6VnHE9BRyMMcqpQf5juBobHUyI66Aq2vW2snvwbDc1HnMKymGzFFFviX6IG
 pFtzA2SHfqTdlJChXK2E5lMiHkCUIxT1r3ENfcmIx6GIfuFA1ejZjTzCm5LJpvJl0ldInl+WGZY
 rwog+Nr4EYTrlC7cQwBL4dTegMo16vw91nzrjhHYXAAz4myfIwE2mDFI7+M6am/3eQ49SXGfuXQ
 p+0I5rFChuO9Ddz2vsXt6oD87LTIPn1Z0+kEoUwg7TDaTZmYfJPdlivqr+wvfnTbvx3APUTECwm
 3TpS8zHo8JggfYLCoJuahsgHTv4/zEZ09pMn6+mnpFNBpAE549cFHvzo/zm4B+9mebmLSXr/vVs
 57TCrbRSWZfzRN5evJ7Yw3ISonkY5KiNdH/cWh/CsE+uusukNfY63KNNcjFtE09uLKHnl2WbEqO
 jsWDmIkg==
X-Google-Smtp-Source: AGHT+IFtOV4W0Y8ZfIuQZW9gadDZKRpyQvtO7XZin6e2iW2zHXOgFcxmDRDXqGF4RU8aG0zT2NZ4TQ==
X-Received: by 2002:a05:600c:3149:b0:475:dd89:acb with SMTP id
 5b1f17b1804b1-4773089c4a1mr29545645e9.22.1761915749827; 
 Fri, 31 Oct 2025 06:02:29 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4772fbc32d9sm22667605e9.1.2025.10.31.06.02.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Oct 2025 06:02:29 -0700 (PDT)
Date: Fri, 31 Oct 2025 16:02:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Harry Wentland <harry.wentland@amd.com>,
 Harshit Mogalapalli <harshit.m.mogalapalli@gmail.com>
Cc: Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Hamish Claxton <hamishclaxton@gmail.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Zaeem Mohamed <zaeem.mohamed@amd.com>,
 Michael Strauss <michael.strauss@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/amd/display: Fix logical vs bitwise bug in
 get_embedded_panel_info_v2_1()
Message-ID: <aQSzYV0ytfQK2kvN@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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

The .H_SYNC_POLARITY and .V_SYNC_POLARITY variables are 1 bit bitfields
of a u32.  The ATOM_HSYNC_POLARITY define is 0x2 and the
ATOM_VSYNC_POLARITY is 0x4.  When we do a bitwise negate of 0, 2, or 4
then the last bit is always 1 so this code always sets .H_SYNC_POLARITY
and .V_SYNC_POLARITY to true.

This code is instead intended to check if the ATOM_HSYNC_POLARITY or
ATOM_VSYNC_POLARITY flags are set and reverse the result.  In other
words, it's supposed to be a logical negate instead of a bitwise negate.

Fixes: ae79c310b1a6 ("drm/amd/display: Add DCE12 bios parser support")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
Please note that I have not tested this.  It's straight forward enough to
see that logical negate was intended, but it's always good to test things
as well.

Harshit and I only recently created this static checker warning.

 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c b/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
index 04eb647acc4e..550a9f1d03f8 100644
--- a/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
+++ b/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
@@ -1480,10 +1480,10 @@ static enum bp_result get_embedded_panel_info_v2_1(
 	/* not provided by VBIOS */
 	info->lcd_timing.misc_info.HORIZONTAL_CUT_OFF = 0;
 
-	info->lcd_timing.misc_info.H_SYNC_POLARITY = ~(uint32_t) (lvds->lcd_timing.miscinfo
-			& ATOM_HSYNC_POLARITY);
-	info->lcd_timing.misc_info.V_SYNC_POLARITY = ~(uint32_t) (lvds->lcd_timing.miscinfo
-			& ATOM_VSYNC_POLARITY);
+	info->lcd_timing.misc_info.H_SYNC_POLARITY = !(lvds->lcd_timing.miscinfo &
+						       ATOM_HSYNC_POLARITY);
+	info->lcd_timing.misc_info.V_SYNC_POLARITY = !(lvds->lcd_timing.miscinfo &
+						       ATOM_VSYNC_POLARITY);
 
 	/* not provided by VBIOS */
 	info->lcd_timing.misc_info.VERTICAL_CUT_OFF = 0;
-- 
2.51.0

