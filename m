Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF06864198B
	for <lists+dri-devel@lfdr.de>; Sat,  3 Dec 2022 23:42:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF3E010E1FA;
	Sat,  3 Dec 2022 22:42:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9A0510E1FA;
 Sat,  3 Dec 2022 22:42:05 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B3MfMqg007991; Sat, 3 Dec 2022 22:42:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=1720mK3ENuwblwaixmKXbdKP6GzFCMbgPkajMRDFOYE=;
 b=WS0VJ8BrPUcRUSoaa3uKvlBGmbmTDUrVansCyW6562iu6DgrDuJKM9eL9xy5d3OSitp0
 uuG1cm13bDSXfYOjVcQe0g7kxDLScBLr0/hip5Y3p4vtIWIFF0iENYpfQCkJmD2GABfy
 J+7hjO+HBAy6jc5Eap7qP37D7lajyHtmGnDt9YkWzvNKfy6hy/FeT+gLzaqapFgs1eUg
 cHHyIGXOpJ6hLUdym/ltnRZ77FJokIc1c1LC0+jckd3cb6PcgTLJ9C8pGBYX2fZyC/w5
 P4jhSZbwT9C06eK3ZLJCgFXtXDtMPQ4LxBBdporpQ+H9FvcnQKvtpbMhu6gUTsBWDgHZ rw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3m7xj0h7ck-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 03 Dec 2022 22:42:02 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2B3Mg12i004758
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 3 Dec 2022 22:42:01 GMT
Received: from hyd-lnxbld559.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Sat, 3 Dec 2022 14:41:57 -0800
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: freedreno <freedreno@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>
Subject: [PATCH 1/4] drm/msm/adreno: Fix null ptr access in
 adreno_gpu_cleanup()
Date: Sun, 4 Dec 2022 04:11:41 +0530
Message-ID: <20221204040946.1.Ib978de92c4bd000b515486aad72e96c2481f84d0@changeid>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: teh7lf8t4F_5LQd-wwBoXhm5_q29eTJG
X-Proofpoint-ORIG-GUID: teh7lf8t4F_5LQd-wwBoXhm5_q29eTJG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-03_12,2022-12-01_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 mlxlogscore=999 clxscore=1011 impostorscore=0 adultscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212030202
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
Cc: Dan Carpenter <error27@gmail.com>, Emma Anholt <emma@anholt.net>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the below kernel panic due to null pointer access:
[   18.504431] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000048
[   18.513464] Mem abort info:
[   18.516346]   ESR = 0x0000000096000005
[   18.520204]   EC = 0x25: DABT (current EL), IL = 32 bits
[   18.525706]   SET = 0, FnV = 0
[   18.528878]   EA = 0, S1PTW = 0
[   18.532117]   FSC = 0x05: level 1 translation fault
[   18.537138] Data abort info:
[   18.540110]   ISV = 0, ISS = 0x00000005
[   18.544060]   CM = 0, WnR = 0
[   18.547109] user pgtable: 4k pages, 39-bit VAs, pgdp=0000000112826000
[   18.553738] [0000000000000048] pgd=0000000000000000, p4d=0000000000000000, pud=0000000000000000
[   18.562690] Internal error: Oops: 0000000096000005 [#1] PREEMPT SMP
**Snip**
[   18.696758] Call trace:
[   18.699278]  adreno_gpu_cleanup+0x30/0x88
[   18.703396]  a6xx_destroy+0xc0/0x130
[   18.707066]  a6xx_gpu_init+0x308/0x424
[   18.710921]  adreno_bind+0x178/0x288
[   18.714590]  component_bind_all+0xe0/0x214
[   18.718797]  msm_drm_bind+0x1d4/0x614
[   18.722566]  try_to_bring_up_aggregate_device+0x16c/0x1b8
[   18.728105]  __component_add+0xa0/0x158
[   18.732048]  component_add+0x20/0x2c
[   18.735719]  adreno_probe+0x40/0xc0
[   18.739300]  platform_probe+0xb4/0xd4
[   18.743068]  really_probe+0xfc/0x284
[   18.746738]  __driver_probe_device+0xc0/0xec
[   18.751129]  driver_probe_device+0x48/0x110
[   18.755421]  __device_attach_driver+0xa8/0xd0
[   18.759900]  bus_for_each_drv+0x90/0xdc
[   18.763843]  __device_attach+0xfc/0x174
[   18.767786]  device_initial_probe+0x20/0x2c
[   18.772090]  bus_probe_device+0x40/0xa0
[   18.776032]  deferred_probe_work_func+0x94/0xd0
[   18.780686]  process_one_work+0x190/0x3d0
[   18.784805]  worker_thread+0x280/0x3d4
[   18.788659]  kthread+0x104/0x1c0
[   18.791981]  ret_from_fork+0x10/0x20
[   18.795654] Code: f9400408 aa0003f3 aa1f03f4 91142015 (f9402516)
[   18.801913] ---[ end trace 0000000000000000 ]---
[   18.809039] Kernel panic - not syncing: Oops: Fatal exception

Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---

 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 382fb7f9e497..118d07e5c66c 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -1073,13 +1073,13 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 void adreno_gpu_cleanup(struct adreno_gpu *adreno_gpu)
 {
 	struct msm_gpu *gpu = &adreno_gpu->base;
-	struct msm_drm_private *priv = gpu->dev->dev_private;
+	struct msm_drm_private *priv = gpu->dev ? gpu->dev->dev_private : NULL;
 	unsigned int i;
 
 	for (i = 0; i < ARRAY_SIZE(adreno_gpu->info->fw); i++)
 		release_firmware(adreno_gpu->fw[i]);
 
-	if (pm_runtime_enabled(&priv->gpu_pdev->dev))
+	if (priv && pm_runtime_enabled(&priv->gpu_pdev->dev))
 		pm_runtime_disable(&priv->gpu_pdev->dev);
 
 	msm_gpu_cleanup(&adreno_gpu->base);
-- 
2.7.4

