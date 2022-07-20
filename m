Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26BBD57BE9F
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 21:33:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD516113741;
	Wed, 20 Jul 2022 19:33:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DB80113597;
 Wed, 20 Jul 2022 19:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qbSvOmWl9+ElFHyX4OzDqfeIk40FylSCYkoBkmd7xSI=; b=OkXflFVy/FC6KvgJhr+JyIoHkU
 VxvGdtdxAlm8IpIYi7EqtkS2IW2OLuvTyuIoh65rrjOuMbHnZJsd5XpMzj1AszU+y96LCbjrxDOzS
 F0GuaM+j91qTUw9dXekga2rl0nGvHC49i9SWr2uxpBxf4aZORbI1DOXp0XQO2cQA0Jd9z/1ZkcizH
 vKaJT6qCW9JkCyJib9acFoPYFwlKVU2QwIrWbIwYSPx0klWhjDKDI+/x4XD4hwMYyMtb44Osd5VHU
 M5F4/Emwq78bu9CtvFJYPPtf8zft+mjPNVt0urq2pt3wcqJAczXhYSg9hFyKO3lqOt0l4e6Dhz0Qp
 ZOgBlyvg==;
Received: from [165.90.126.25] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1oEFRU-000fxI-VC; Wed, 20 Jul 2022 21:33:08 +0200
From: Melissa Wen <mwen@igalia.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 2/5] drm/amd/display: remove useless FPU protection wrapper
 from dcn31_resource file
Date: Wed, 20 Jul 2022 18:32:05 -0100
Message-Id: <20220720193208.1131493-3-mwen@igalia.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220720193208.1131493-1-mwen@igalia.com>
References: <20220720193208.1131493-1-mwen@igalia.com>
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
 Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Many lines of code in dcn31_resource_construct are wrapped by DC_FP
macro to protect FPU operations; however, there is no FPU in this
region. Therefore, just remove the wrapper for clarity.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c
index 929b712cbada..6d25fcf865bf 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c
@@ -1863,8 +1863,6 @@ static bool dcn31_resource_construct(
 	struct dc_context *ctx = dc->ctx;
 	struct irq_service_init_data init_data;
 
-	DC_FP_START();
-
 	ctx->dc_bios->regs = &bios_regs;
 
 	pool->base.res_cap = &res_cap_dcn31;
@@ -2175,13 +2173,9 @@ static bool dcn31_resource_construct(
 
 	dc->dcn_ip->max_num_dpp = dcn3_1_ip.max_num_dpp;
 
-	DC_FP_END();
-
 	return true;
 
 create_fail:
-
-	DC_FP_END();
 	dcn31_resource_destruct(pool);
 
 	return false;
-- 
2.35.1

