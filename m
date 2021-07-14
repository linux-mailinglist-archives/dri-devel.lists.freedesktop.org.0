Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BC33C895E
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 19:08:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DECF56E433;
	Wed, 14 Jul 2021 17:08:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-canonical-0.canonical.com
 (smtp-relay-canonical-0.canonical.com [185.125.188.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C00B6E433
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 17:08:30 +0000 (UTC)
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id D841540616; 
 Wed, 14 Jul 2021 17:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1626282508;
 bh=DAhaMqtw5C577LQ/86AWeIBpEHxNYnclBIEh7gDqyRs=;
 h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type;
 b=hGj93JOz4sro6FFib6OFcRkkCEj08LkdkXruz9NsF78S3lLGUa9Zc5u/sxX5Si9YR
 3x3gsuFUNOyJa/sno36q9lWN6smJKvXRRPX9MgdnteZZcQE7w3bBStaxfkGuqIPUTW
 uCX3mdzNcdbgsApBlI83EgTGE/ke8I7SGfX9z413ZwPf7sX/45f+Tu6gPEmOPudLMG
 cfeydL7tviF3q9igjU2ar3tPL+ypF+CPkhAULnoUl16h2LclBPPSEzwK5qvN0EpVtG
 syz3WWkyOrdiY7nEULFP2zsFwZZPeuyYf9b9C6ttX4+r5VeGQhZHh66kEpZ+e7kUjE
 WMsSubseTWtog==
From: Colin King <colin.king@canonical.com>
To: Evan Quan <evan.quan@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Pan@freedesktop.org, Xinhui <Xinhui.Pan@amd.com>,
	David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/amd/powerplay: remove redundant assignment to usTMax
Date: Wed, 14 Jul 2021 18:08:28 +0100
Message-Id: <20210714170828.147618-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Colin Ian King <colin.king@canonical.com>

Struct element usTMax is being assigned a hard coded value that
is never read and it is being re-assigned a new value immediately
afterwards. The assignment is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/process_pptables_v1_0.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/process_pptables_v1_0.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/process_pptables_v1_0.c
index f2a55c1413f5..20e528c166f9 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/process_pptables_v1_0.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/process_pptables_v1_0.c
@@ -977,8 +977,6 @@ static int init_thermal_controller(
 			= le16_to_cpu(tonga_fan_table->usPWMMed);
 		hwmgr->thermal_controller.advanceFanControlParameters.usPWMHigh
 			= le16_to_cpu(tonga_fan_table->usPWMHigh);
-		hwmgr->thermal_controller.advanceFanControlParameters.usTMax
-			= 10900;                  /* hard coded */
 		hwmgr->thermal_controller.advanceFanControlParameters.usTMax
 			= le16_to_cpu(tonga_fan_table->usTMax);
 		hwmgr->thermal_controller.advanceFanControlParameters.ucFanControlMode
-- 
2.31.1

