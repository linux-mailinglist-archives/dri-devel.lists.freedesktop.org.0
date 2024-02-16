Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDFD857604
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 07:28:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8B8610E261;
	Fri, 16 Feb 2024 06:28:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="T2N8PVS8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD84310E261;
 Fri, 16 Feb 2024 06:28:40 +0000 (UTC)
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 41G4xZru032307; Fri, 16 Feb 2024 06:28:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=corp-2023-11-20; bh=11lhowEku9JauzXkE/wObrLIf2iNOyLR/O51AA5UCuY=;
 b=T2N8PVS86lByXQAks6rnchO2FxtwcI5Br/7b/QZMXkzC3UZT7wiOFORaIb/K3rsrLWRk
 zx6lHb4LDyFvLTSiPt9XBtlDpH80p4VGbHNC2wa7YX7mpnOUdWtupzrERO47lICHydus
 JgYCYpJ6tSPtYEzuYDOSEqp8bf91a3YWV1H1Ra3+h300GS40H8Pdsv3v57Z/Og2KlMHL
 EPymbvpIgpxDybp6yVOq4WhwD4zpVttTxVQwJ/aOsa/92dDmr0m9Ma+KAJdcfKXAOCXD
 MtGXSVdc2uGK7G+0HDUgKsxnny/hatnPFri7xe79TIeQXhkEaBNWoktZ3Zmcmc/wlLyy Dw== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3w91w6vduw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Feb 2024 06:28:33 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 41G5P48i024566; Fri, 16 Feb 2024 06:28:32 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3w5ykj07sn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Feb 2024 06:28:32 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 41G6P0w5021393;
 Fri, 16 Feb 2024 06:28:31 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com
 [10.129.136.47])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id
 3w5ykj07qv-1; Fri, 16 Feb 2024 06:28:31 +0000
From: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Alvin Lee <alvin.lee2@amd.com>, Qingqing Zhuo <Qingqing.Zhuo@amd.com>,
 Wayne Lin <wayne.lin@amd.com>, Duncan Ma <duncan.ma@amd.com>,
 Samson Tam <samson.tam@amd.com>, "JinZe.Xu" <jinze.xu@amd.com>,
 Josip Pavic <Josip.Pavic@amd.com>, Cruise Hung <cruise.hung@amd.com>,
 Hersen Wu <hersenxs.wu@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, dan.carpenter@linaro.org,
 Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
 kernel test robot <lkp@intel.com>, Dan Carpenter <error27@gmail.com>
Subject: [PATCH] drm/amd/display: fix a possible NULL dereference bug
Date: Thu, 15 Feb 2024 22:28:22 -0800
Message-ID: <20240216062825.165627-1-harshit.m.mogalapalli@oracle.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-16_05,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402160051
X-Proofpoint-ORIG-GUID: kc0_sxQHa_Md3hCzniJTwJnbPLO9kRu6
X-Proofpoint-GUID: kc0_sxQHa_Md3hCzniJTwJnbPLO9kRu6
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

Smatch warns:
	drivers/gpu/drm/amd/amdgpu/../display/dc/dc_dmub_srv.c:136
	dc_dmub_srv_cmd_list_queue_execute() warn: variable dereferenced
	before check 'dc_dmub_srv' (see line 131)

Fix this by moving the dereference "dc_dmub_srv->ctx" after the NULL check.

Fixes: 028bac583449 ("drm/amd/display: decouple dmcub execution to reduce lock granularity")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <error27@gmail.com>
Closes: https://lore.kernel.org/r/202311141141.GoLAPxD5-lkp@intel.com/
Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
---
Only compile tested
---
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
index 0bc32537e2eb..a4bd46ec6da4 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
+++ b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
@@ -128,7 +128,7 @@ bool dc_dmub_srv_cmd_list_queue_execute(struct dc_dmub_srv *dc_dmub_srv,
 		unsigned int count,
 		union dmub_rb_cmd *cmd_list)
 {
-	struct dc_context *dc_ctx = dc_dmub_srv->ctx;
+	struct dc_context *dc_ctx;
 	struct dmub_srv *dmub;
 	enum dmub_status status;
 	int i;
@@ -136,6 +136,7 @@ bool dc_dmub_srv_cmd_list_queue_execute(struct dc_dmub_srv *dc_dmub_srv,
 	if (!dc_dmub_srv || !dc_dmub_srv->dmub)
 		return false;
 
+	dc_ctx = dc_dmub_srv->ctx;
 	dmub = dc_dmub_srv->dmub;
 
 	for (i = 0 ; i < count; i++) {
-- 
2.39.3

