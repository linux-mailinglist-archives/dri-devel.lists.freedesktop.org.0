Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DB729FFBC
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 09:24:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4FC86ECF7;
	Fri, 30 Oct 2020 08:23:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 228436E94C;
 Fri, 30 Oct 2020 04:04:06 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id g12so4095048pgm.8;
 Thu, 29 Oct 2020 21:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=omeX/7USjZZ0bCTBjHGOVLTjZl1oqWJzp7gUz7b6h8o=;
 b=nDvPvTn9phgjic1rYziuxJbM/OAHLhdXJG7ZM3/oaHXZLLEojGVPRr0/dOJEMOX2ZV
 0y48gTkP0J6wfHakJaZv98m/RyzH64FNDGl4ALrV2KM0/WaO9GWXgd60CUeWwwTgZd9x
 OwQYnx4Jv+QedwVrqKomnqgBSkiMcVlKi+DDXHX4aEeYmacKedUyw4sfEn2NK2gooOAW
 UUng2XwfDd6pkqZjUw9pOpsV8BXzcYBMYGqGFu+80jE1qe25+6V+wsPRSdQkpdAXnQQN
 9ksbWoIOgpNjOQYJQIpN/EEZBgTd8eMZ5xqHhYPSPdH0UiU2VOZ5eOZ6WszqRidIbY3A
 /BOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=omeX/7USjZZ0bCTBjHGOVLTjZl1oqWJzp7gUz7b6h8o=;
 b=AAYVBi6x8snrJoy7nRAHyTbNGbog+iyU6tV1qEBe5lnQyOp4WqXigqW1mHV5OMHSSJ
 YzwB/cjg/drWIaEhdvTUO8Qv7b8haFMTP15OE0nhszBhMpCtaaqM7zsPQnzmd6hUNTTX
 n8Fg7hdi/xvDF2QQHXn1heKFmC2zBcDneSe38bbKsv5ZuhMZY4Gmljbbp7ThV2op8Fpn
 bBNVfnKyKWOlK4Vq1q4AHM5PggWjqKPg7NRhPNAJDJkXRePqWdC1XFX4Hw6qqiM8jOm/
 qzdk2uiRYzGyAlJkLV06RXh+CduJx6Y/tK3wcv2lGSG12irzFq1E3gwRvn3XnHeE8bVj
 Z1rA==
X-Gm-Message-State: AOAM531T6sdKkd9U09X5EaBwfLHlR6d63llwkJNEQCkun2IXLIv+GAbq
 PnvolNxojGsLIKP0G4KwTNg=
X-Google-Smtp-Source: ABdhPJwln0YHLlt3cQgyT3IiP+FDpP1bJ7gzY5729HwxsrRS9rA7GRyYw5IR8mCvUPP0U5gk7iKY8g==
X-Received: by 2002:a63:5152:: with SMTP id r18mr458807pgl.381.1604030645846; 
 Thu, 29 Oct 2020 21:04:05 -0700 (PDT)
Received: from my--box ([103.98.79.70])
 by smtp.gmail.com with ESMTPSA id j2sm4048182pgi.48.2020.10.29.21.04.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2020 21:04:05 -0700 (PDT)
Date: Fri, 30 Oct 2020 09:33:59 +0530
From: Deepak R Varma <mh12gx2825@gmail.com>
To: outreachy-kernel@googlegroups.com,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/amd/pm: replace kmalloc+memcpy by kmemdup
Message-ID: <20201030040359.GA276414@my--box>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailman-Approved-At: Fri, 30 Oct 2020 08:23:17 +0000
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
Cc: melissa.srw@gmail.com, daniel.vetter@ffwll.ch, mh12gx2825@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use kmemdup() for instructions using kmalloc() + memcpy(). More
information here: https://lwn.net/Articles/198928/
Issue reported by coccinelle script: scripts/coccinelle/api/memdup.cocci

Signed-off-by: Deepak R Varma <mh12gx2825@gmail.com>
---
Changes since v1:
   - Update patch subject and log message to match proposed change.
   
Please Note: This is a Outreachy project task patch.

 .../gpu/drm/amd/pm/powerplay/hwmgr/vega12_processpptables.c  | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_processpptables.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_processpptables.c
index 740e2fc7a034..1e79baab753e 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_processpptables.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_processpptables.c
@@ -252,12 +252,11 @@ static int init_powerplay_table_information(
 	phm_copy_clock_limits_array(hwmgr, &pptable_information->power_saving_clock_max, powerplay_table->PowerSavingClockMax, ATOM_VEGA12_PPCLOCK_COUNT);
 	phm_copy_clock_limits_array(hwmgr, &pptable_information->power_saving_clock_min, powerplay_table->PowerSavingClockMin, ATOM_VEGA12_PPCLOCK_COUNT);
 
-	pptable_information->smc_pptable = kmalloc(sizeof(PPTable_t), GFP_KERNEL);
+	pptable_information->smc_pptable = kmemdup(&(powerplay_table->smcPPTable),
+						   sizeof(PPTable_t), GFP_KERNEL);
 	if (pptable_information->smc_pptable == NULL)
 		return -ENOMEM;
 
-	memcpy(pptable_information->smc_pptable, &(powerplay_table->smcPPTable), sizeof(PPTable_t));
-
 	result = append_vbios_pptable(hwmgr, (pptable_information->smc_pptable));
 
 	return result;
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
