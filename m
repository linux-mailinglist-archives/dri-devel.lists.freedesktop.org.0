Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 370F280A017
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 10:58:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D00CE10E26F;
	Fri,  8 Dec 2023 09:58:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F9BE10E26F;
 Fri,  8 Dec 2023 09:58:38 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3B899OeI013547; Fri, 8 Dec 2023 09:58:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=corp-2023-11-20; bh=2YndOjHyhkOb5ckp2udC88cU2qRc5IjcyuuMfvzEG5s=;
 b=BqbDp0gTHP3wpVEIJustI0v+6svVIhsFfuHYNANgGfuwIT4RvHoQYSm3vvTRkjd1fnMz
 /+ycAEhrvj/uRrzOZsWRP6qvbg5rNLmB18zpRFz/UZL8t+IKht1S7ldwXtw7kPgMuewD
 F/aCkO6dH6aJ9t5WTCPF5DkRu4i1vTgcJQmCNvrCo4FUjbUHq/zfhK6Zxo2FXvXvvM/u
 AbT0zgUn6yhYBsz2+l0HJETEtY5RFPwEn3DvzKY8zm4n30gMWedCUVw/JJBSDDQNYs3t
 1FmkooNXFe0ZI6OlSPLrTh1aFBEvFawy2uwpQu0Y+4QS3RFrMSnAar5ja0isslA469N2 oA== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3utdda5ny1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 08 Dec 2023 09:58:30 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 3B89q0Th037399; Fri, 8 Dec 2023 09:58:29 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3utan8pwxw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 08 Dec 2023 09:58:29 +0000
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3B89wSfL027743;
 Fri, 8 Dec 2023 09:58:28 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com
 [10.129.136.47])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id
 3utan8pwxb-1; Fri, 08 Dec 2023 09:58:28 +0000
From: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Sherry Yang <sherry.yang@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sasha Levin <sashal@kernel.org>, Roman Li <roman.li@amd.com>,
 Claudio Suarez <cssk@net-c.es>, hongao <hongao@uniontech.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amd/display: Fix memory leak in dm_set_writeback()
Date: Fri,  8 Dec 2023 01:58:24 -0800
Message-ID: <20231208095825.1291730-1-harshit.m.mogalapalli@oracle.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-08_05,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 malwarescore=0
 suspectscore=0 mlxscore=0 adultscore=0 bulkscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2312080082
X-Proofpoint-GUID: -_K5URp7pXXN0p40jxNmPb_EV7voda20
X-Proofpoint-ORIG-GUID: -_K5URp7pXXN0p40jxNmPb_EV7voda20
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
Cc: harshit.m.mogalapalli@oracle.com, kernel-janitors@vger.kernel.org,
 error27@gmail.com, dan.carpenter@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

'wb_info' needs to be freed on error paths or it would leak the memory.

Smatch pointed this out.

Fixes: c81e13b929df ("drm/amd/display: Hande writeback request from userspace")
Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
---
This is based on static analysis and only compile tested
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index afdcc43ea06c..333995f70239 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -8871,12 +8871,14 @@ static void dm_set_writeback(struct amdgpu_display_manager *dm,
 	acrtc = to_amdgpu_crtc(wb_conn->encoder.crtc);
 	if (!acrtc) {
 		DRM_ERROR("no amdgpu_crtc found\n");
+		kfree(wb_info);
 		return;
 	}
 
 	afb = to_amdgpu_framebuffer(new_con_state->writeback_job->fb);
 	if (!afb) {
 		DRM_ERROR("No amdgpu_framebuffer found\n");
+		kfree(wb_info);
 		return;
 	}
 
-- 
2.39.3

