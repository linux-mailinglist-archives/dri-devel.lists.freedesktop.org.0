Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CA56532ED
	for <lists+dri-devel@lfdr.de>; Wed, 21 Dec 2022 16:10:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D1AD10E130;
	Wed, 21 Dec 2022 15:10:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37DA610E130;
 Wed, 21 Dec 2022 15:10:19 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BLDonRx012598; Wed, 21 Dec 2022 15:10:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=s/n7LfhKNXMJO7cKF05rI7a8p2Cj1T1UqOe64kYAbq4=;
 b=d2jnJcU6KjXbGyOLhl1xxvIWSrOapQzvy4aVfZ3UL+MzubDAuiVJwKoN1PvADJRs4n9d
 2vd6KDxcdeWXf/4ipeA/IylslYA4uPOq2Ec6/OrQ65JuKH4af0qdBK6/oQArUdlFxz9P
 DTD665E+uYBkSxd5gffEhP3AvDLm8AqCVeeR6WoleGRVeoFZ7ou4vJ9doXIOQVaagx96
 e/fvKRTwYVqjpwBKczYfNVFGDNmC72k6t1WoOwmvAVBFyt1oP9WWeWHsmcKakXwOYr+R
 P37ilpp/wWSEd446K+MMLEdi8CyFmrhNof5bXgMNbi+zH70UUfniFON745BM4b/OTCPF rw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mkcxvb3sn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Dec 2022 15:10:15 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BLFAEq9001881
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Dec 2022 15:10:14 GMT
Received: from hyd-lnxbld559.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Wed, 21 Dec 2022 07:10:09 -0800
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: freedreno <freedreno@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>
Subject: [PATCH v2 1/4] drm/msm/adreno: Fix null ptr access in
 adreno_gpu_cleanup()
Date: Wed, 21 Dec 2022 20:39:56 +0530
Message-ID: <20221221203925.v2.1.Ib978de92c4bd000b515486aad72e96c2481f84d0@changeid>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: lCwHDYWW87FrXWVrycegm73ushsI0UHO
X-Proofpoint-ORIG-GUID: lCwHDYWW87FrXWVrycegm73ushsI0UHO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-21_08,2022-12-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 impostorscore=0 clxscore=1011 lowpriorityscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 spamscore=0 mlxlogscore=999 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212210126
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
Cc: Sean Paul <sean@poorly.run>, Dan Carpenter <error27@gmail.com>,
 Emma Anholt <emma@anholt.net>, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Maximilian Luz <luzmaximilian@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, linux-kernel@vger.kernel.org,
 Luca Weiss <luca@z3ntu.xyz>, Jonathan Marek <jonathan@marek.ca>,
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

Fixes: 17e822f7591f ("drm/msm: fix unbalanced pm_runtime_enable in adreno_gpu_{init, cleanup}")
Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---

Changes in v2:
- Added 'Fixes' tag (Dan Carpenter)

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

