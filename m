Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0A3622CD5
	for <lists+dri-devel@lfdr.de>; Wed,  9 Nov 2022 14:51:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ACFF10E5C7;
	Wed,  9 Nov 2022 13:51:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9220410E0A8;
 Wed,  9 Nov 2022 09:24:22 +0000 (UTC)
Received: from canpemm500010.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4N6fft0M8DzmVgY;
 Wed,  9 Nov 2022 17:24:06 +0800 (CST)
Received: from huawei.com (10.175.101.6) by canpemm500010.china.huawei.com
 (7.192.105.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 9 Nov
 2022 17:24:18 +0800
From: Liu Jian <liujian56@huawei.com>
To: <harry.wentland@amd.com>, <sunpeng.li@amd.com>,
 <Rodrigo.Siqueira@amd.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <nicholas.kazlauskas@amd.com>, <Charlene.Liu@amd.com>,
 <alex.hung@amd.com>, <duncan.ma@amd.com>, <aurabindo.pillai@amd.com>,
 <michael.strauss@amd.com>, <rdunlap@infradead.org>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/amd/display: delete the duplicate .set_odm_bypass
 initialization in dcn314_tg_funcs
Date: Wed, 9 Nov 2022 17:31:22 +0800
Message-ID: <20221109093122.6566-1-liujian56@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.101.6]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 canpemm500010.china.huawei.com (7.192.105.118)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 09 Nov 2022 13:50:32 +0000
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
Cc: liujian56@huawei.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix below sparse warning:
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn314/dcn314_optc.c:244:18: warning: Initializer entry defined twice
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn314/dcn314_optc.c:257:18:   also defined here

Fixes: 5ade1b951dec ("drm/amd/display: Add OTG/ODM functions")
Signed-off-by: Liu Jian <liujian56@huawei.com>
---
 drivers/gpu/drm/amd/display/dc/dcn314/dcn314_optc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_optc.c b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_optc.c
index 47eb162f1a75..58d38de6a0f8 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_optc.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_optc.c
@@ -241,7 +241,6 @@ static struct timing_generator_funcs dcn314_tg_funcs = {
 		.set_dsc_config = optc3_set_dsc_config,
 		.get_dsc_status = optc2_get_dsc_status,
 		.set_dwb_source = NULL,
-		.set_odm_bypass = optc3_set_odm_bypass,
 		.set_odm_combine = optc314_set_odm_combine,
 		.get_optc_source = optc2_get_optc_source,
 		.set_out_mux = optc3_set_out_mux,
-- 
2.17.1

