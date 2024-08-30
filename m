Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D18B3965826
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 09:15:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E8AC10E826;
	Fri, 30 Aug 2024 07:15:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 946 seconds by postgrey-1.36 at gabe;
 Fri, 30 Aug 2024 04:10:18 UTC
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6C1A10E143;
 Fri, 30 Aug 2024 04:10:18 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.17])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Ww45d4QKPz1j7gj;
 Fri, 30 Aug 2024 11:54:13 +0800 (CST)
Received: from kwepemd200012.china.huawei.com (unknown [7.221.188.145])
 by mail.maildlp.com (Postfix) with ESMTPS id EC8E01A0188;
 Fri, 30 Aug 2024 11:54:26 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemd200012.china.huawei.com
 (7.221.188.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Fri, 30 Aug
 2024 11:54:25 +0800
From: Wang Wensheng <wangwensheng4@huawei.com>
To: <harry.wentland@amd.com>, <sunpeng.li@amd.com>,
 <Rodrigo.Siqueira@amd.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <wayne.lin@amd.com>, <alex.hung@amd.com>,
 <roman.li@amd.com>, <mwen@igalia.com>, <alvin.lee2@amd.com>,
 <danny.wang@amd.com>, <dillon.varone@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
CC: <xuqiang36@huawei.com>
Subject: [PATCH -next] drm/amd/display: Delete redundant null check for
 'steam' and 'plane'
Date: Fri, 30 Aug 2024 11:41:03 +0800
Message-ID: <20240830034103.121722-1-wangwensheng4@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.112.208]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemd200012.china.huawei.com (7.221.188.145)
X-Mailman-Approved-At: Fri, 30 Aug 2024 07:15:39 +0000
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

Since commit 15c2990e0f01 ("drm/amd/display: Add null checks for
'stream' and 'plane' before dereferencing"), the
dcn30_apply_idle_power_optimizations() function would return
if these veriables would be null. So no need to check again before
using them.

Signed-off-by: Wang Wensheng <wangwensheng4@huawei.com>
---
 drivers/gpu/drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c
index eaeeade31ed7..ffc35a5653fd 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c
@@ -925,11 +925,9 @@ bool dcn30_apply_idle_power_optimizations(struct dc *dc, bool enable)
 			if (!stream || !plane)
 				return false;
 
-			if (stream && plane) {
-				cursor_cache_enable = stream->cursor_position.enable &&
-						plane->address.grph.cursor_cache_addr.quad_part;
-				cursor_attr = stream->cursor_attributes;
-			}
+			cursor_cache_enable = stream->cursor_position.enable &&
+					plane->address.grph.cursor_cache_addr.quad_part;
+			cursor_attr = stream->cursor_attributes;
 
 			/*
 			 * Second, check MALL eligibility
-- 
2.17.1

