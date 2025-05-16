Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C215ABA9DC
	for <lists+dri-devel@lfdr.de>; Sat, 17 May 2025 13:43:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2033B10E174;
	Sat, 17 May 2025 11:43:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HUGeAvRb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1707710E0EF;
 Fri, 16 May 2025 23:35:32 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-54b166fa41bso3566145e87.0; 
 Fri, 16 May 2025 16:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747438530; x=1748043330; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=m/UJ81NU6SEe9/os128VngMenn6RX/mPtCB9eJUEZR0=;
 b=HUGeAvRb0NzRdAJToEnO78Iytump0zXdnIKuJCIJyGXG1gZAr6kBgJ/muxGPcpQTqU
 vo9s0LEWsLmfz/JphHgH9M3emlnfZ4vo3BeM7AqSCVXZ2ZXaEGv5w9FKsc1DoXSak5vd
 fUrYk87SluYgzgG9OBbyuOgY4IyNcgmpwo0P2+rcHK2Lh7+q9vze9DopoX2L05R5d64m
 9a+TVKzsOfn7ZImtB51lUdRxe0Tj4HhQy1DmPju/FbDqKaiB3iW+K2JjHRZ6U+OSD+Ku
 v81R9TkGg+6bNFJ9oVDvauCC2XN2i/F+6QQwZHuWLLBnb3FwBCGnQyWhrrMsZzAOxTjm
 tUCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747438530; x=1748043330;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=m/UJ81NU6SEe9/os128VngMenn6RX/mPtCB9eJUEZR0=;
 b=LHoRmLJZTSOkuL6VAQ8VyNjFsYNzqqSc1nemyQzE7aTgyWfWDgMlaEKg38ejf1lsjQ
 S6IIr2bQ+7E9UI8rdLBUdkC/6C2apnVkmjikN5Vz/QwddYYzKDZPdhvqxlBFt3iqeS08
 Miu7XAmots7WY9GEKSeuyolC3OJz+lhVJvGj82bTIocbE3viAXDWqLMj0zUJAzeUy1lM
 IZwdGTBap/ISIDHJEKSyL4j9MaV58hO4d+b6gtRRMyu+kVv0xTQ6EWuC4ZUXOt3Gs7UN
 UDCbTVOpzuykC6mcFWjDWY3+qPQl2O9ARj59jKjX+6GqbKnw3atOikxsOyaBayoZ1m4C
 WXww==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCZmQmUGNpGeEFskOzr0QULtOq22mw9QVtLOA41kGwlBZ8AIYlTFG5aYpbqhtFYD6ovIE2sYbf@lists.freedesktop.org,
 AJvYcCVgrfX3YUv/OC5WrMG+4c2sJljheqAQrOdvfOow7vpxNyWM6r3QRpYioiY3IJ7aVzNq+1nSzUobNeTk@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyIuk9GpUx4g04QDViz/yp/NPT9PlTj7iz/piD398d15Q+FUc29
 0pEmrUUBUEkCxmdXy4yOkkC8p35cPiR14OvneStA9EFXmsa5tbMHooB8
X-Gm-Gg: ASbGncsvDkd1/3y+sXmNBCGMm0DACKh0rZdXTqnDEuX/ghwujoWyf361YMk1M9w3n1n
 O5hKdxPi6GTicb4Xsphkhi409quRykEjxrnf+I3RX344iJ7ala4SzBB/kx6ECR9IQupfOvve7AF
 DvUT61bd8eXmfY8EDMMym9oGUje2r73xviIwKzAkjQWhQJDIvRVs78Z7S1tlfDU7jMONPp+Ky95
 VIsNAzSzvEOXT7+Ihna2x31p4OqkZHvHJVZPvc1hRhGhx4i4Ji6ENvEVAWPdHBvkWkp+5ReY1HB
 qiM0GNqfMsxJHlgAy/kxG+VrKngwIoWXB/lTw1pp1uCap+Zn/DrR9BcOAAn+WJPuFHdX
X-Google-Smtp-Source: AGHT+IEQC4DeuYTJhufYSI6129vfrr80bHmVfYOe0SjjWY523RPLnpdKb5yhbp53P0ChZXzr9q90wA==
X-Received: by 2002:a05:6512:2613:b0:545:652:109 with SMTP id
 2adb3069b0e04-550e7253122mr1527825e87.51.1747438529935; 
 Fri, 16 May 2025 16:35:29 -0700 (PDT)
Received: from danyaPC.localdomain ([192.145.30.107])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-328084ca251sm5952871fa.38.2025.05.16.16.35.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 May 2025 16:35:29 -0700 (PDT)
From: Daniil Ryabov <daniilryabov4@gmail.com>
To: alexander.deucher@amd.com
Cc: christian.koenig@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Daniil Ryabov <daniilryabov4@gmail.com>
Subject: [PATCH] drm/amd/display: fix typo in comments
Date: Sat, 17 May 2025 02:35:16 +0300
Message-ID: <20250516233516.29480-1-daniilryabov4@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 17 May 2025 11:43:17 +0000
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

Fix double 'u' in 'frequuency'

Signed-off-by: Daniil Ryabov <daniilryabov4@gmail.com>
---
 drivers/gpu/drm/amd/display/dc/basics/dce_calcs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/basics/dce_calcs.c b/drivers/gpu/drm/amd/display/dc/basics/dce_calcs.c
index 681799468..d897f8a30 100644
--- a/drivers/gpu/drm/amd/display/dc/basics/dce_calcs.c
+++ b/drivers/gpu/drm/amd/display/dc/basics/dce_calcs.c
@@ -1393,7 +1393,7 @@ static void calculate_bandwidth(
 						if ((bw_mtn(data->dram_speed_change_margin, bw_int_to_fixed(0)) && bw_ltn(data->dram_speed_change_margin, bw_int_to_fixed(9999)))) {
 							/*determine the minimum dram clock change margin for each set of clock frequencies*/
 							data->min_dram_speed_change_margin[i][j] = bw_min2(data->min_dram_speed_change_margin[i][j], data->dram_speed_change_margin);
-							/*compute the maximum clock frequuency required for the dram clock change at each set of clock frequencies*/
+							/*compute the maximum clock frequency required for the dram clock change at each set of clock frequencies*/
 							data->dispclk_required_for_dram_speed_change_pipe[i][j] = bw_max2(bw_div(bw_div(bw_mul(data->src_pixels_for_first_output_pixel[k], dceip->display_pipe_throughput_factor), dceip->lb_write_pixels_per_dispclk), (bw_sub(bw_sub(bw_sub(data->maximum_latency_hiding_with_cursor[k], vbios->nbp_state_change_latency), data->dmif_burst_time[i][j]), data->dram_speed_change_line_source_transfer_time[k][i][j]))), bw_div(bw_div(bw_mul(data->src_pixels_for_last_output_pixel[k], dceip->display_pipe_throughput_factor), dceip->lb_write_pixels_per_dispclk), (bw_add(bw_sub(bw_sub(bw_sub(data->maximum_latency_hiding_with_cursor[k], vbios->nbp_state_change_latency), data->dmif_burst_time[i][j]), data->dram_speed_change_line_source_transfer_time[k][i][j]), data->active_time[k]))));
 							if ((bw_ltn(data->dispclk_required_for_dram_speed_change_pipe[i][j], vbios->high_voltage_max_dispclk))) {
 								data->display_pstate_change_enable[k] = 1;
@@ -1407,7 +1407,7 @@ static void calculate_bandwidth(
 						if ((bw_mtn(data->dram_speed_change_margin, bw_int_to_fixed(0)) && bw_ltn(data->dram_speed_change_margin, bw_int_to_fixed(9999)))) {
 							/*determine the minimum dram clock change margin for each display pipe*/
 							data->min_dram_speed_change_margin[i][j] = bw_min2(data->min_dram_speed_change_margin[i][j], data->dram_speed_change_margin);
-							/*compute the maximum clock frequuency required for the dram clock change at each set of clock frequencies*/
+							/*compute the maximum clock frequency required for the dram clock change at each set of clock frequencies*/
 							data->dispclk_required_for_dram_speed_change_pipe[i][j] = bw_max2(bw_div(bw_div(bw_mul(data->src_pixels_for_first_output_pixel[k], dceip->display_pipe_throughput_factor), dceip->lb_write_pixels_per_dispclk), (bw_sub(bw_sub(bw_sub(bw_sub(data->maximum_latency_hiding_with_cursor[k], vbios->nbp_state_change_latency), data->dmif_burst_time[i][j]), data->dram_speed_change_line_source_transfer_time[k][i][j]), data->mcifwr_burst_time[i][j]))), bw_div(bw_div(bw_mul(data->src_pixels_for_last_output_pixel[k], dceip->display_pipe_throughput_factor), dceip->lb_write_pixels_per_dispclk), (bw_add(bw_sub(bw_sub(bw_sub(bw_sub(data->maximum_latency_hiding_with_cursor[k], vbios->nbp_state_change_latency), data->dmif_burst_time[i][j]), data->dram_speed_change_line_source_transfer_time[k][i][j]), data->mcifwr_burst_time[i][j]), data->active_time[k]))));
 							if ((bw_ltn(data->dispclk_required_for_dram_speed_change_pipe[i][j], vbios->high_voltage_max_dispclk))) {
 								data->display_pstate_change_enable[k] = 1;
-- 
2.43.0

