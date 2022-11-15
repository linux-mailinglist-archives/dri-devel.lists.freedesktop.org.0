Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E246262996E
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 13:57:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77AEF10E13B;
	Tue, 15 Nov 2022 12:57:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5846C10E3C6;
 Tue, 15 Nov 2022 12:57:03 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id l14so24112872wrw.2;
 Tue, 15 Nov 2022 04:57:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=l3npKNO7EdnZMJchPseofSyg8OvoZM8dnC8E9718dj4=;
 b=SDBOJ9o8aDYmio2B7zkkXLe/1Vh/h/Iqa5PZ63quI+gZpgjuS+ZKqvuFioZeRw5lh4
 swINKn34NNLGKfZRRFRWGGU4X3oQR8iGhKimzrVjMstpdal5MQhr8vvcjjM/vlXxRqk1
 VB0RJUAJZ4dVUDJtjyr/Nbk0jEuAV8hWPlGp3OWFWUZW3kL/nlK2U2raRye5qUaywWee
 sg0Op7ZpYx5yFCPfg8Zgw77JuwrR462NEkfuNmeZOZGtnjQrznz8lWkYRWKZGCMbnzzv
 j7s/jUcRh1zI0Y6BIAgukQucOwc00yv6t5dSaoReN1lRVkBjYqrrSpm3DMZprMTlfRGd
 /YDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=l3npKNO7EdnZMJchPseofSyg8OvoZM8dnC8E9718dj4=;
 b=l68bwjxALflvyzwOiVUGXtVNUJZel7/T+NvCKLFx7HX/GIaM3LQdbth3d8zzyA83SK
 D0E62xVFPDeOSlc2DBPbuV5NE+4PWpjUac8u7lkrqgKrUPEuGfe1d+1Aa2FeG02W5ViP
 lTmY5ABoHAWIayxwUbs52pTCyyWMzr0/6NK2kxi2QLLxQWECd1LYu4lkx/xv0Lf/E+Ii
 6ZnKgEe5S4jBgCRXdBQlc24XnpsXTPoLpIZ/31DqN0Sk2oUsIuBlcKDdUnqYLpKTLwTT
 qz87IJoJrwU8sdhJPZnysvmmrGz9kQ1fNfjgkJ37dspsH7qKzpEgFv6D8oKVVtmb+HOY
 bocw==
X-Gm-Message-State: ANoB5pkllYVB4r+53InUjCS9AZ+NPK31iCbRmftBYJQWfSjdm9gqRqAw
 7L3yBy1cGWs4KbnDjQ6suZdsY2y6VHJhFA==
X-Google-Smtp-Source: AA0mqf5WcSOrPcctHKA15TDbRyvs6c4/8xVmIbSG+fo7UP6Z8FoZdW/9b6SQUMJFkiQPDDyDDtH99g==
X-Received: by 2002:a05:6000:605:b0:236:6f3c:1f2f with SMTP id
 bn5-20020a056000060500b002366f3c1f2fmr10888123wrb.89.1668517021867; 
 Tue, 15 Nov 2022 04:57:01 -0800 (PST)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 p5-20020a05600c358500b003c6b9749505sm24241770wmq.30.2022.11.15.04.57.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 04:57:01 -0800 (PST)
Date: Tue, 15 Nov 2022 15:56:57 +0300
From: Dan Carpenter <error27@gmail.com>
To: Evan Quan <evan.quan@amd.com>
Subject: [PATCH] amdgpu/pm: prevent array underflow in
 vega20_odn_edit_dpm_table()
Message-ID: <Y2ZH2FPSuX/msEL1@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, kernel-janitors@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Darren Powell <darren.powell@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Lang Yu <lang.yu@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In the PP_OD_EDIT_VDDC_CURVE case the "input_index" variable is capped at
2 but not checked for negative values so it results in an out of bounds
read.  This value comes from the user via sysfs.

Fixes: d5bf26539494 ("drm/amd/powerplay: added vega20 overdrive support V3")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c
index 97b3ad369046..b30684c84e20 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c
@@ -2961,7 +2961,8 @@ static int vega20_odn_edit_dpm_table(struct pp_hwmgr *hwmgr,
 			data->od8_settings.od8_settings_array;
 	OverDriveTable_t *od_table =
 			&(data->smc_state_table.overdrive_table);
-	int32_t input_index, input_clk, input_vol, i;
+	int32_t input_clk, input_vol, i;
+	uint32_t input_index;
 	int od8_id;
 	int ret;
 
-- 
2.35.1

