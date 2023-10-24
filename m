Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA1F7D5A35
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 20:11:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D79ED10E456;
	Tue, 24 Oct 2023 18:11:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6D8D10E458;
 Tue, 24 Oct 2023 18:11:45 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-6b26a3163acso3779667b3a.2; 
 Tue, 24 Oct 2023 11:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698171105; x=1698775905; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tzIVqFd7BYIfD+/BtUvd6UdU+bq+nB9/4vc6HwyRwDA=;
 b=buBgboPOvFv4rw3YNGtPWDY2m0jx8zxoxWm0BmfIEUsxESBtRvYCARjCAx8s3OkkWV
 n7Akn5wMThzyIxEc02EoQVVs+JtsXdSfGcitsnRe1jtAuLq2D/9u+JcBqGRh+v4HDCQW
 tcfoJjSQoLeympOoSWRYXZBnxS7p6XgRnCwOe4nrtGx64Bx9yERHDDejPIm7mb/ittIB
 FyxT/oMUnUncl7ef6qZqWnB8X/f8WFPrK8ZthAyvZLtWtsCRKhNhpxo2QmGGDXSwoN4n
 LKY9q8YakIXCbRr8Lc81vgWsoix3Ce67u5G9SXdl5vzHJHCf9AqK0MCys3wm/A6GQ2Xw
 8gFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698171105; x=1698775905;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tzIVqFd7BYIfD+/BtUvd6UdU+bq+nB9/4vc6HwyRwDA=;
 b=JBWjKQIvxRf1/P0MexvPdvjWgO0Uz4vvsq8vtsDfChgQKxh0/dpCwFmag8ckMXH7gr
 960X9EgvXC5RTuRV9i1bHtlCRimU8DIjucT1cwLPDmgpM6u1ocdTCHBxG56uxU9vdDTA
 vzQCQjbZX+dWLz9rAvI9s9wJ3BYFsS+hOVUaP2onNww5rne8Y5Sus7bw3i1osTvcWzYH
 aAlbtJUw4lENwPFpnMaCn7uKU7RweLMLTooQJ2AnKmLGbqxVrtGOn2zwr0TPukJVfk+E
 i4K88U+8XWPyTnj/FFh5i3Secm6HffsHfUZ7kyU8J+RH7aS2adhj4IiM1Le6fc8wIMEX
 3DXw==
X-Gm-Message-State: AOJu0Yyo4/1HaWjj9NNhzjPf2bRXRYsUdZDqTJLRLPxaVB1qLpA8RjNz
 httRwe4PdgZ991nd/pyn0cM=
X-Google-Smtp-Source: AGHT+IG5DZEa19Ut0ZSvrY2ONpv/RDUeT44JgOW71UKte+JD4T2cdfJWV5R/00U1mA6OiWjjJuWe+g==
X-Received: by 2002:a05:6a00:1915:b0:68e:3eb6:d45 with SMTP id
 y21-20020a056a00191500b0068e3eb60d45mr10917135pfi.30.1698171105386; 
 Tue, 24 Oct 2023 11:11:45 -0700 (PDT)
Received: from brag-vm.. ([117.243.121.127]) by smtp.gmail.com with ESMTPSA id
 z64-20020a633343000000b005898a3619c7sm7335210pgz.48.2023.10.24.11.11.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Oct 2023 11:11:45 -0700 (PDT)
From: Bragatheswaran Manickavel <bragathemanick0908@gmail.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 daniel@ffwll.ch, airlied@gmail.com, Qingqing.Zhuo@amd.com,
 alvin.lee2@amd.com, wenjing.liu@amd.com, jun.lei@amd.com,
 Samson.Tam@amd.com
Subject: [PATCH] drm/amd/display: avoid variable reinitialization
Date: Tue, 24 Oct 2023 23:41:34 +0530
Message-Id: <20231024181134.48066-1-bragathemanick0908@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org,
 Bragatheswaran Manickavel <bragathemanick0908@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The member variable enable_hpo_pg_support is already initialized 
and hence the reinitialization instruction can be removed. Issue 
identified using the doubleinit.cocci Coccinelle semantic patch script.

Signed-off-by: Bragatheswaran Manickavel <bragathemanick0908@gmail.com>
---
 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_resource.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn35/dcn35_resource.c b/drivers/gpu/drm/amd/display/dc/dcn35/dcn35_resource.c
index 99d55b958977..1fd9df8da09c 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn35/dcn35_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn35/dcn35_resource.c
@@ -739,7 +739,6 @@ static const struct dc_debug_options debug_defaults_drv = {
 	.disable_boot_optimizations = false,
 	.disable_unbounded_requesting = false,
 	.disable_mem_low_power = false,
-	.enable_hpo_pg_support = false,
 	//must match enable_single_display_2to1_odm_policy to support dynamic ODM transitions
 	.enable_double_buffered_dsc_pg_support = true,
 	.enable_dp_dig_pixel_rate_div_policy = 1,
-- 
2.34.1

