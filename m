Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF354AF903
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 19:09:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE67A10E27E;
	Wed,  9 Feb 2022 18:09:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90AE910E27E;
 Wed,  9 Feb 2022 18:09:47 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 219HHLoO008871; 
 Wed, 9 Feb 2022 18:09:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=L4d1sraIGs/1pvhljM+OKntVSxhDrRe+O4+cbYCOoFw=;
 b=Bo6ucyWhzRAUDKcpTG1frNMVAEBRPvCCtc2AOQ/VAylOb5BG4g5WoqHt0d8pN7VS+UXD
 PTFczqlqQaAHPjsl/nV8boB+I6JqCMsOhIPkAN3iYSYJRq8SIRUGj1I3Gj0NwFfXl9gC
 0D1X2/lvyyoOdtAkUkrOwBhc81GcTqso940mowwOkbwXCAVOsoFuui3IH4k3S4VzPowx
 oAjEzmI2CLTlaDv6SHRjwcv8v3RyPZiHuVdq/yFvt3FV9Lp7yFyyTkTIbdmw5DRE9Au/
 PeN7tA/R6KvarghL78m+ojfueNv78HPyjx3NZAF7eMWYa0L6rJFN8XJIzBUpYEtmnS3a 7w== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e3fpgnhwp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 09 Feb 2022 18:09:43 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 219I28GU066958;
 Wed, 9 Feb 2022 18:09:41 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
 by aserp3030.oracle.com with ESMTP id 3e1f9hss2r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 09 Feb 2022 18:09:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RiQac+afHbkPWBrO3bk9qoQ4SMsMgXEgceXUcAeiBWd5T630ajc/6GpA5ZG9Urtjq98y9i/3u+2brpVBLz8qPzfDjt6tfMb52qxc3WZUJwh5khrDRuvSF51sIFInlWxd3yZKWrfR6ilNOqE94rwR1DxE7ZSQZIw2MDSzX85/pp6TAwI/05P2TrSDl4DlNukpJX5eEDpQNnnAr3joTz927vHy6AvEGFNxR5xA76X/RDJX2CjECBPJGNGoG/raKd/D/qEQ1Uuz5iPlBpuer0L+5mxomkxpkrXY8wpSS18tviEkInzvC4sYpYsVacMZ5UFX03zk/dnbA/I3RN6QSiMeMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L4d1sraIGs/1pvhljM+OKntVSxhDrRe+O4+cbYCOoFw=;
 b=b7l2R0gxvmGULEpH/hGROVdmuKLS+NSwa4xgzMY4t6JLUHM2OcBBcjdBEAvbRK4z+GgSzgx94E96H9soN1afEmo7JpAy5UQl2bwEsg71XXATEaslIZuUlDDoy4qWhor69/JsuxGWBqYEjgw244ALeLBTTYGM3i2XbUil9UktCDPc56RBRreftg2d72fke+wELqyQs9IdtzAX2bNaLSvviVOPOhI7kQs7axwGhOBF4O+w4HnNZxYM4tNNBN/NarbQc1WR6rqGCMhq6UJqNhunQ3We8AYimr3mGLlNRxDzp0zCcGGAdpYujVzgawi0El0irxsfp18a1iwH3MFgDNx06A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L4d1sraIGs/1pvhljM+OKntVSxhDrRe+O4+cbYCOoFw=;
 b=jWkk+biBYoorQvK8QhA49qegPg8soaVLtVx1XU0i2RB9Z5xm+tsAB+WAItpExKs4ByX3CoatRDRfS2DSQlzKsd+srYV7xii5kBKOy0jXCANhg0UmoBrzCa+NISBZ3cttaCGe7dHbssn8sfeldyyOapLCk+Y7tWnfY0P5PUAkv+M=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BLAPR10MB4833.namprd10.prod.outlook.com
 (2603:10b6:208:333::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Wed, 9 Feb
 2022 18:09:39 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::e5a5:8f49:7ec4:b7b8]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::e5a5:8f49:7ec4:b7b8%5]) with mapi id 15.20.4951.018; Wed, 9 Feb 2022
 18:09:39 +0000
Date: Wed, 9 Feb 2022 21:09:27 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Felix Kuehling <Felix.Kuehling@amd.com>,
 David Yat Sin <david.yatsin@amd.com>
Subject: [PATCH] drm/amdkfd: CRIU fix a NULL vs IS_ERR() check
Message-ID: <20220209180925.GB18385@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0026.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::13) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dfb58534-d3bb-48fd-e3c3-08d9ebf75682
X-MS-TrafficTypeDiagnostic: BLAPR10MB4833:EE_
X-Microsoft-Antispam-PRVS: <BLAPR10MB4833EE32C71D842FB6162E2E8E2E9@BLAPR10MB4833.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:229;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QtyNR0+0QhuzB0y9FasleZABBI7UN3Fu2FF66IYHCkQx0laTzah3P3EzykjRDmeAKA5YKhelY1K1bFCHJe00TGEYMpjySsbftu/VF+pbdnDu0m7fxnasbFszVm8sG3q9RGAfj11O0dsvOIyyrByY2XW/L1gNdk6CW8/UKfSUv7RvLA9YMyE1/Sz4Jtrswx4tHcbwFHvRTXaAFEnruEZ4+nETsj6vxZDNPW8TVJWPPD5XhWrLyzJN5NYVLLSme9klyRdKXHmUWU0UnXmzRw6mLbqx+oSBJWho2xyc9/LKaN9hAMI063GZmN2kurB5twY3Hu8w1eRBI6Z1rgzTTHTsMbYjBiHL1Oc+OilDIDi9plTNhQ2+c4hncyN2K5OCwtCvMaYKP1t6ebMmZGMIlCR+hCSiw8s7uiLIXGIV3JKu8mIdJ4rlWE2FJYQ/AZk2sEMdCnvmLaVPa5PK22s/OgjIkKebsCbHR0sUnicZ79oSh1hp6jjXXz0xDEfO3rSm0PjgE6WsgbwaQs7nas6GgRutCAtA046zBJym3knQupfJVvhXBn/0he8+mq74CTjXoOC3Q02LJO6G90q7y2AP5ia8yvtulo2x7+2qVZbDuvMG+dwPlpGcoGSJR6A5OEyy2iDmgHnKRT8XMA2Ko1Ii7k0av0a5QSfvEvvYi/yeAvHRSjfxJGNsD9R5zuJJFntXq5nrim0WjS2uLKc5qtiYttBTWQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(52116002)(33716001)(66946007)(83380400001)(316002)(66556008)(110136005)(508600001)(33656002)(6486002)(6512007)(8676002)(9686003)(86362001)(54906003)(6666004)(4326008)(6506007)(26005)(186003)(8936002)(1076003)(66476007)(4744005)(7416002)(2906002)(44832011)(5660300002)(38350700002)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NrPwKxe9N8XlVn1ah/h+sdwjsuWd3pYYBEnZ5kty6s3KBNEZ3W3fSAKvaVGW?=
 =?us-ascii?Q?gt7t1c0dCU5vkifNq7dNl9uPUfdHq2NR0Lo5P/t88+qyKAo6GXau5YvCNsay?=
 =?us-ascii?Q?5yTU8pC/U0J63LsF0BhBvbLtpXbyQFMZcPHDM2jSi3hWuSlhU12Gn5J6UAv3?=
 =?us-ascii?Q?0H+ptkc3BMbN+asV/GixuZ2Fks+nl7FZgLsnG19h4k4I//3OpXaoBUXOb4lC?=
 =?us-ascii?Q?wNHeRjPpgVuiRElle8eTdQ5s/aO6a7MnN3JVDgCkRw/1WtIJXLYoVTLAH0ON?=
 =?us-ascii?Q?XET8WAH5mlP+Zs7ghtjeFGc3sF/6adyhwX6iC0/Rzxpj+AtREhq9SBk9o3s6?=
 =?us-ascii?Q?LHIJsOCzENwFwp6sHi2OgVdEid9yjUb98nJpsQFpg5eFte0DRYM5fmAuWI29?=
 =?us-ascii?Q?ovcVEGgkZISxpPZVRiAyQZEYJwfukYa28K4XWG8CaJFXxwIZiptzmK3zKZcj?=
 =?us-ascii?Q?IvNEE8hjtmxxBbgO8u/XZav6dzKMKSu6FrfhWjwF9mreIebuBOETy1iNpIDP?=
 =?us-ascii?Q?EHKpeBUZtyoEElaXPDO+y0ljaI7a8dcEO+8no9QHgG9+g3z3hDXHUoHafrss?=
 =?us-ascii?Q?6iVS8wvit+XcYGGLVAYrAnb/GbtvpnNO8BG+iOI4TOWxIOh8J7rhlYK8Hr56?=
 =?us-ascii?Q?0ApZGy14rDSnf7JO/W0MwBfaiTQmR8zLem8xwrwfM29NjUBKoLN0fYgnK2gz?=
 =?us-ascii?Q?Fdra0XQ6KUEVfW+q8OZ+aUlgG4lGjsFr1n51mrr3J5oUHExc5hNEm+rcaqMW?=
 =?us-ascii?Q?YaSZ2mIm+CV7Wjp1GZw733o+e0hvIxv33v+VP9ga3dvY9YUuhYtDWR3Jasqk?=
 =?us-ascii?Q?fufdmY4C2dgdLXzCBYQ+NgenCOiN00hfDcAraByQNQ3B8ZI/gur17YQq9PxI?=
 =?us-ascii?Q?j5JygVXvSAa2a93OKjJStSdtKpm+M6JhQDZ4i6XwxScL2wz5xeVBiDHsDTB9?=
 =?us-ascii?Q?JaHg+sx9v3i5+RNzOm6Ljo0n/KpiaZum+k0dFVdLjyIEc6BqleErL+44tz6v?=
 =?us-ascii?Q?SnkB5Xp/8q6sDxPYPCQQEwB5yy7RMREeh19XLf/kLKh73wXRJNPmCpldN5wJ?=
 =?us-ascii?Q?aTMrNwRlAVBq2wpIXZ1XsnL4cIIKUs247Es3PiTNhMsFjOTS17k/Qcto2Z3m?=
 =?us-ascii?Q?Qd1Leb32+JDwn0LFXzShBz+Z5JEi+T5jGsUJUTN8ucZrdBDWS53o0eReYVsq?=
 =?us-ascii?Q?0GdLjPiAwnlwpBo0D2TVm+N/sVbKfkcdUXJW8Aj6Wc9zdFDR/1dZvVmgmxb6?=
 =?us-ascii?Q?SfJ5iV7pAoLkjjlob1Iho1Kyeeuf5D+WAPwmKKgD06gdQiq1qXsA5lYJyLjn?=
 =?us-ascii?Q?XlPVhP5Ehx707wIsETFlxBe40zAjaa9KnBE3pSnM51De34tGin6bI37H8DIM?=
 =?us-ascii?Q?JP/sFbFtTljmYZ1JIV+7+HSmZn3VB2/t5tmInpI9ZClCQzmXMefGAIYor0rQ?=
 =?us-ascii?Q?RAxeZpDtY/mb1B8SIDp3ES3Qmp8FTTZm1MaiZtgGETrKuE87fNh6+O6BxdED?=
 =?us-ascii?Q?LWJuSw/SatwkdOka80Dp9ArFaPIqxy0LU2JCkkVoqLa0NzwrVnjaNxAGrSTt?=
 =?us-ascii?Q?mP+BVE9X9KXwK7LJHEURaIlZ+HsVr/lh3DcelyMB38QR3zxP8ibtehQVUEcT?=
 =?us-ascii?Q?HjVSqdbHndfREEPPSZXPn+/28dWALBgN+KUn3kOCHaDTQ7XpHqeZaNb8xWsg?=
 =?us-ascii?Q?/++P7Q=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfb58534-d3bb-48fd-e3c3-08d9ebf75682
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 18:09:39.1910 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Mj2brt/fmiIMA8FAIMNlOhgNm5g/wEqTG59xC+2/nQXNtcKQ86QLoCN/sXB5H6H9vtAh9XjKYzSoc3kdzMc8c+l/rkqMb7qQI0rFbZDAII=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4833
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10252
 signatures=673431
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 mlxscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202090097
X-Proofpoint-GUID: hifdR4GIbuqAjPtHaGG7v7UTEk4K1asc
X-Proofpoint-ORIG-GUID: hifdR4GIbuqAjPtHaGG7v7UTEk4K1asc
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
Cc: David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 kernel-janitors@vger.kernel.org, Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The kfd_process_device_data_by_id() does not return error pointers,
it returns NULL.

Fixes: bef153b70c6e ("drm/amdkfd: CRIU implement gpu_id remapping")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 64e3b4e3a712..75aca99f6ece 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -2526,7 +2526,7 @@ static int criu_restore_bos(struct kfd_process *p,
 				break;
 
 			peer_pdd = kfd_process_device_data_by_id(p, bo_priv->mapped_gpuids[j]);
-			if (IS_ERR(peer_pdd)) {
+			if (!peer_pdd) {
 				ret = -EINVAL;
 				goto exit;
 			}
-- 
2.20.1

