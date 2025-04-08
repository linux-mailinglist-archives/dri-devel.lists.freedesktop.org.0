Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A60A7F321
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 05:25:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DD3A10E1D8;
	Tue,  8 Apr 2025 03:25:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BEFD10E1D8;
 Tue,  8 Apr 2025 03:25:10 +0000 (UTC)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5383GKqd014976;
 Mon, 7 Apr 2025 20:25:02 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com
 [147.11.82.252])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45tyt4b0k1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 07 Apr 2025 20:25:01 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 7 Apr 2025 20:25:01 -0700
Received: from pek-lpg-core1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Mon, 7 Apr 2025 20:24:57 -0700
From: <jianqi.ren.cn@windriver.com>
To: <stable@vger.kernel.org>
CC: <patches@lists.linux.dev>, <gregkh@linuxfoundation.org>,
 <linux-kernel@vger.kernel.org>, <jianqi.ren.cn@windriver.com>,
 <harry.wentland@amd.com>, <sunpeng.li@amd.com>,
 <Rodrigo.Siqueira@amd.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <chiahsuan.chung@amd.com>,
 <alex.hung@amd.com>, <daniel.wheeler@amd.com>, <hersenxs.wu@amd.com>
Subject: [PATCH 5.10.y] drm/amd/display: Skip inactive planes within
 ModeSupportAndSystemConfiguration
Date: Tue, 8 Apr 2025 11:24:56 +0800
Message-ID: <20250408032456.3437393-1-jianqi.ren.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 5-F-MLBWDWSd1-w6nLaD6MTbksbZORpR
X-Authority-Analysis: v=2.4 cv=RMSzH5i+ c=1 sm=1 tr=0 ts=67f4970d cx=c_pps
 a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17
 a=XR8D0OoHHMoA:10 a=zd2uoN0lAAAA:8 a=t7CeM3EgAAAA:8 a=jWJrOWpaenu_S2W2EP4A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 5-F-MLBWDWSd1-w6nLaD6MTbksbZORpR
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_01,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 lowpriorityscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 mlxlogscore=999 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504080022
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

From: Hersen Wu <hersenxs.wu@amd.com>

[ Upstream commit a54f7e866cc73a4cb71b8b24bb568ba35c8969df ]

[Why]
Coverity reports Memory - illegal accesses.

[How]
Skip inactive planes.

Reviewed-by: Alex Hung <alex.hung@amd.com>
Acked-by: Tom Chung <chiahsuan.chung@amd.com>
Signed-off-by: Hersen Wu <hersenxs.wu@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
[get_pipe_idx() was introduced as a helper by
dda4fb85e433 ("drm/amd/display: DML changes for DCN32/321") in v6.0.
This patch backports it to make code clearer. And minor conflict is
resolved due to code context change.]
Signed-off-by: Jianqi Ren <jianqi.ren.cn@windriver.com>
Signed-off-by: He Zhe <zhe.he@windriver.com>
---
Verified the build test
---
 .../drm/amd/display/dc/dml/display_mode_vba.c | 27 ++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.c b/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.c
index b32093136089..7dfcb1e0a6ff 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.c
@@ -825,11 +825,30 @@ static unsigned int CursorBppEnumToBits(enum cursor_bpp ebpp)
 	}
 }
 
+static unsigned int get_pipe_idx(struct display_mode_lib *mode_lib, unsigned int plane_idx)
+{
+	int pipe_idx = -1;
+	int i;
+
+	ASSERT(plane_idx < DC__NUM_DPP__MAX);
+
+	for (i = 0; i < DC__NUM_DPP__MAX ; i++) {
+		if (plane_idx == mode_lib->vba.pipe_plane[i]) {
+			pipe_idx = i;
+			break;
+		}
+	}
+	ASSERT(pipe_idx >= 0);
+
+	return pipe_idx;
+}
+
 void ModeSupportAndSystemConfiguration(struct display_mode_lib *mode_lib)
 {
 	soc_bounding_box_st *soc = &mode_lib->vba.soc;
 	unsigned int k;
 	unsigned int total_pipes = 0;
+	unsigned int pipe_idx = 0;
 
 	mode_lib->vba.VoltageLevel = mode_lib->vba.cache_pipes[0].clks_cfg.voltage;
 	mode_lib->vba.ReturnBW = mode_lib->vba.ReturnBWPerState[mode_lib->vba.VoltageLevel][mode_lib->vba.maxMpcComb];
@@ -849,8 +868,14 @@ void ModeSupportAndSystemConfiguration(struct display_mode_lib *mode_lib)
 		mode_lib->vba.DISPCLK = soc->clock_limits[mode_lib->vba.VoltageLevel].dispclk_mhz;
 
 	// Total Available Pipes Support Check
-	for (k = 0; k < mode_lib->vba.NumberOfActivePlanes; ++k)
+	for (k = 0; k < mode_lib->vba.NumberOfActivePlanes; ++k) {
+		pipe_idx = get_pipe_idx(mode_lib, k);
+		if (pipe_idx == -1) {
+			ASSERT(0);
+			continue; // skip inactive planes
+		}
 		total_pipes += mode_lib->vba.DPPPerPlane[k];
+	}
 	ASSERT(total_pipes <= DC__NUM_DPP__MAX);
 }
 
-- 
2.34.1

