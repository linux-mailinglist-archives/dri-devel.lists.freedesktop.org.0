Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E963B6EFB09
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 21:24:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E4B210E321;
	Wed, 26 Apr 2023 19:24:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EB1B10E321;
 Wed, 26 Apr 2023 19:24:21 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33QGwraf017013; Wed, 26 Apr 2023 19:24:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=corp-2023-03-30; bh=q2mNaPnyPQXXOVMMyGNZC0+Exw9ul90KlaFLguRPbSE=;
 b=JTI3gr9Jfaw0OpyNVhlii954Oj6UeFNzJrFkR1cAXaIfNkWeWtSouV/SpKwHTdEQJMWw
 /X98SRnlDp7sHfDH6KUMIymcVxVpCLY0ijU347uq+8i/JWmX/6LpOkna0PfRTsMcC1i5
 9O9EDUtwf9ndhJccOCb7XH2fBR0/zFDUJSc8pL60V/e8Ip0BEPEVgvE+0ylpnJ3OoDP0
 2LCBvL3mVIYp4T1V25oMFXhVaOlXOLIUEkRs4940xpQ/4Ff8EQ4ly8QqKLQFm8GDwsN5
 ISUzrjPsG/S3o67CD8kFldecx7sdISs5nUEya1HA22vUxB6YT1K0i9ugOM1F8iDvnaVB /A== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3q476u28gj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Apr 2023 19:24:18 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 33QILsg2032779; Wed, 26 Apr 2023 19:24:17 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3q4618kp2a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Apr 2023 19:24:17 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33QJOGXc020578;
 Wed, 26 Apr 2023 19:24:16 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com
 [10.129.136.47])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id
 3q4618kp1p-1; Wed, 26 Apr 2023 19:24:16 +0000
From: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
To: 
Subject: [PATCH next] drm/amd/display: Fix possible NULL dereference in
 dc_dmub_srv_cmd_run_list()
Date: Wed, 26 Apr 2023 12:24:12 -0700
Message-Id: <20230426192413.143971-1-harshit.m.mogalapalli@oracle.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-26_10,2023-04-26_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 phishscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304260173
X-Proofpoint-GUID: Mog46ec3betvlKJ3ZxvRDkD0ckgkGrie
X-Proofpoint-ORIG-GUID: Mog46ec3betvlKJ3ZxvRDkD0ckgkGrie
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
Cc: dri-devel@lists.freedesktop.org, Josip Pavic <Josip.Pavic@amd.com>,
 amd-gfx@lists.freedesktop.org, error27@gmail.com, Leo Li <sunpeng.li@amd.com>,
 kernel-janitors@vger.kernel.org, Qingqing Zhuo <qingqing.zhuo@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org,
 Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>,
 Max Tseng <Max.Tseng@amd.com>, Alvin Lee <Alvin.Lee2@amd.com>,
 Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
 Alex Deucher <alexander.deucher@amd.com>, Jun Lei <Jun.Lei@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Eric Yang <Eric.Yang2@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We have a NULL check for 'dc_dmub_srv' in dc_dmub_srv_cmd_run_list()
but we are dereferencing it before checking.

Fix this moving the dereference next to NULL check.

This issue is found with Smatch(static analysis tool).

Fixes: e97cc04fe0fb ("drm/amd/display: refactor dmub commands into single function")
Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
---
Only compile tested.
---
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
index d15ec32243e2..62d3473c32bc 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
+++ b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
@@ -125,7 +125,7 @@ bool dc_dmub_srv_cmd_run(struct dc_dmub_srv *dc_dmub_srv, union dmub_rb_cmd *cmd
 
 bool dc_dmub_srv_cmd_run_list(struct dc_dmub_srv *dc_dmub_srv, unsigned int count, union dmub_rb_cmd *cmd_list, enum dm_dmub_wait_type wait_type)
 {
-	struct dc_context *dc_ctx = dc_dmub_srv->ctx;
+	struct dc_context *dc_ctx;
 	struct dmub_srv *dmub;
 	enum dmub_status status;
 	int i;
@@ -133,6 +133,7 @@ bool dc_dmub_srv_cmd_run_list(struct dc_dmub_srv *dc_dmub_srv, unsigned int coun
 	if (!dc_dmub_srv || !dc_dmub_srv->dmub)
 		return false;
 
+	dc_ctx = dc_dmub_srv->ctx;
 	dmub = dc_dmub_srv->dmub;
 
 	for (i = 0 ; i < count; i++) {
-- 
2.38.1

