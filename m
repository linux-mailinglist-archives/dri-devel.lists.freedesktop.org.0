Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91963350DD7
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 06:24:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83F8B6EC60;
	Thu,  1 Apr 2021 04:23:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2076.outbound.protection.outlook.com [40.107.94.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E368C6EC39;
 Thu,  1 Apr 2021 04:23:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mBU7izFflMV13YLDWZPsn+2BN/Jh6p1KrgMByCNAzRDCNIj4Kx0tx+SpLZ3dZU5DM9txunBSSFxh3AwLhyxs/f0sq2UU2mo9xCzbZN4+wx+cuLoKbnHKl2Xb/tOdol2fyh9XGRoL11OuN3p5gTZKFgTb9YK+Jue3HT/wxtQ+OLRRnJkDwmf036oUZWybOOaXUsNKoTvOZ6M/QTDXMIY0BJUb/m82uXObydshGYnjSltRHiippklsYfhogJU7lVdUD9KyuBEBTa85iP8S/37L0x++julXDjCdYVoUzpZ211rOULfB6p7yb5LVHwsaKEHtpHEKywyZ4YLKAKQX3wNNqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DcF7K0ZLe+Wvl2kOACxjDZtWl044vyYDvqaO3gRyjR0=;
 b=TCnvfwYb6nNGpkt71S+V/j6IP5anG3IfL6b4JAch4uuiU2xNeZf/p8CHF77MJNcBJzqCSPVE13SENfEzY3FIjf3RffsjcgZgXrxQ7YywrVSRXCRzXw5XtchxndEsAQ2sRFg9/61dq23uwhp5N2tdehCd+0Yt2fof/ZZBGbF73/8QnE4i71aXvZp9X2pNKIj0m9JuHyIUmIZEucOQpkyuIxwijZMCP1N/moSVOZDn/ckxN2TsotXUxv4pg9wOBbLDF13Pj1coWlmsbK/Q3Py9h5EqgBs0Br5dfJB4aoScaOom4Xb0IjFLCKCBImtyOk0Tdn6EzorppXz5GjNx9IZIlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DcF7K0ZLe+Wvl2kOACxjDZtWl044vyYDvqaO3gRyjR0=;
 b=zAxgWrW3qGJNlmlk6hJEdRAtDQSHBzJGYfwg2RgBv7sUtcOqm4B1qL6CK5ozUEqycK8QR/s7igAoasuHQRc0uo5E9exBnHFGyaVdhdQGbsHSMU6a7QvweCSsdXaM/QU+fSmSpmbRhXTNUYME3wZjPBqlSRNpdsLowsfyvR8x6zc=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4222.namprd12.prod.outlook.com (2603:10b6:208:19a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Thu, 1 Apr
 2021 04:23:42 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.039; Thu, 1 Apr 2021
 04:23:42 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 33/34] drm/amdkfd: Add SVM API support capability bits
Date: Thu,  1 Apr 2021 00:22:27 -0400
Message-Id: <20210401042228.1423-34-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210401042228.1423-1-Felix.Kuehling@amd.com>
References: <20210401042228.1423-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0088.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::27) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0088.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.32 via Frontend Transport; Thu, 1 Apr 2021 04:23:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 04af5167-7a5b-438c-4234-08d8f4c5ddf8
X-MS-TrafficTypeDiagnostic: MN2PR12MB4222:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB422296AE30DA38BF0F49177D927B9@MN2PR12MB4222.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j7eDOBoajG3pCjG0MptSlJrbEfR2O6wdoiAtdkOSBLroDPLCqm/Vwks0QETmQ3PQ9PMafa3TZoXQfainVBxIMDtG8O/Ib11Xv1MheDFPsNHzAN5o6LlH7B1kZfXezA/wtj8haeOszCsPODzAFj+fMevZ2y654etjT4srbdzXTF6xGxWinX1+G2xZvCmJXn6iYip76kGwP8P4rxMAoxhjUQBs+0dtZdR39C+rQP1SJfQt5GEX+fr1Fw5WDvGPiSLulXPYwToW5luCvav33tp/ODCzxZXq9MMqu2uUGSQzO4tFbtq9YvVjkGkVbXmDtVDLqlN0gOlngWxPIeckVOQI2EXY/fSPRDLbYRzkeESkZR6AEP23Ebx5pME8xfnZPSD6b8MyMYa75NDXNEDVvv6sM0cJimguJC8sMgVw4Xd4hyDIfKF3+xVXV3aPNUJTDk/6fSUiW6efVb37utZyW1kO/pPa+U81H1hRK3pgPlREPUUE0z/FqpSNJUa4MDQ6fJrexH8/IMQf9UmHdSSfp/GziANZIucuR7MbcgL4NBqG7c9yAAOTnaBblOtp+xOx/77ZI2BVWrcuwR/BgkUWWW6RTDw0ly2TQlDsVrc1hKNNkppIKCco9y6tB3dZDrAp53O0SRtnvpGjSaSNhVAwJc8DMnKy8uUZBqsqyWikfYApihs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(396003)(376002)(39860400002)(1076003)(316002)(52116002)(66476007)(38100700001)(2616005)(956004)(5660300002)(2906002)(6666004)(186003)(16526019)(4326008)(450100002)(66556008)(8936002)(83380400001)(36756003)(86362001)(8676002)(6486002)(7696005)(478600001)(26005)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?fYOedYKGCL+t/fcdN6xi4uQ6zew9qA0eaZ9Bihmf7nz2ALlgg7mJhdmE2D7w?=
 =?us-ascii?Q?mEheXtkGJgKSJRk9Rxi7+rm9BJcGmQBD59WZMe99Ll4b1uomIpojHpEXABI5?=
 =?us-ascii?Q?76WquvaJJHY/lX3D2rie8BPEeujYpehjUF3jt0AWRKYGPxF38zSz7tRuz6/T?=
 =?us-ascii?Q?9+TvazU7wwKNMf9gyfKSdiARNXHG7qhHcaIiY1yih8FGT+anwOOwQim5kfSs?=
 =?us-ascii?Q?BecbD49TYTOrTTQmFe0cb740/uqmkt+FoU4n8r0YVMsy7URLBCKpdvf/4t3e?=
 =?us-ascii?Q?zMJdq7US5NUshP4ptRJ1DOZOBSXhIsyTyIYGhACf0om6+Sj8VUvAG6Zq34yL?=
 =?us-ascii?Q?MAsZg87ZC8jTaHWPfeUEyIegNKUtVR7H2989PO0TJIwWfsjTJVIO59L9+SmA?=
 =?us-ascii?Q?+t2lSRWQc4dzl4BJtMoLOVq0jlfwT+tu6fq94U24isgH3UfdCQquxmEUOA9O?=
 =?us-ascii?Q?iiYWZZIUjdfFsUtO++qTei27r7W7uEo5Zf2/K3lE5AVN+sXWuaPVb6oVaECc?=
 =?us-ascii?Q?DvYuxXghCHMFa9YhOrEcE81MeG/z25Ss33CZ8nShMD266vwHvDpNLASD+WQB?=
 =?us-ascii?Q?qsisW+AIxGGAH+nn3SMLgw50SBOqHVfeYFpWF2Z6CGli20du35XLpbwBw4+q?=
 =?us-ascii?Q?ouQfhHx8bTG657hyGa2vkBxUFduhpxTuuPY2QBhfTvRBkcVzrCE5rLSOJ6OR?=
 =?us-ascii?Q?XOJiVyfnG9H/QcIrt4ynU7k09VtMvd/kmgBGE9dS2Ci5mFVOWgd3qKYOsXew?=
 =?us-ascii?Q?fex5OmWYCGS1+JLHJx6Fvt4GuP0DH52BIcbZctKxzTjqykhSrx+/+bMPrPPy?=
 =?us-ascii?Q?1j2dGJ4zmqgcIdYRtlYEM7DGd5qd3LhDnEIgvlB78qEt7cktT+5lVIDieeg+?=
 =?us-ascii?Q?N43BAJvom6ak035VcOsG2iFfLuZ1wY2lu7tUEqFTitPztYHNJc7PTv7buUxT?=
 =?us-ascii?Q?Sz7nMc7ZW2YJeHiqboH/W7a8Y+chjNsKzGHukCe6XvL14c8qnUezvSQe701Q?=
 =?us-ascii?Q?bVUQp4iMMuv3F97XZhOzcctxJd5vptGrBVNBMI7naHClHVvS5MEAsEHcPF6M?=
 =?us-ascii?Q?LoEGuOQ4Hf75xelPdxfy2rO/J1k8o8RiGOFzuh0PjO8TxslflK+QtqaVer4F?=
 =?us-ascii?Q?LbrS3a4Gm1BjKK9YEc7jlPIkpdg9xPUMQzx4xFFwfzHEhMDYRC4uFLiG0A6L?=
 =?us-ascii?Q?pimcn0UWW+rPka8Ulv4WS9CWqlL/bW5ZbQIRwWHL2Xv2PyCH55r36XnggrvT?=
 =?us-ascii?Q?4kvMyJjBmAwNpz/+KRcTgBPjl+Y+Wyt9z4l/VV+9GhwF2CNrGFzkbL+a30G8?=
 =?us-ascii?Q?Y2DfY4j7mtKO9FBZWQUNA/zW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04af5167-7a5b-438c-4234-08d8f4c5ddf8
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 04:23:14.5173 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FgRu+zz8u44dChVACEZiuVDKUEV3cyjBxykaqgsttZbRDhNfkseLTPtoxAQVEzFQ6o+fEijLZvtkNP1UkaEr/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4222
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
Cc: Philip Yang <Philip.Yang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Philip Yang <Philip.Yang@amd.com>

SVMAPISupported property added to HSA_CAPABILITY, the value match
HSA_CAPABILITY defined in Thunk spec:

SVMAPISupported: it will not be supported on older kernels that don't
have HMM or on systems with GFXv8 or older GPUs without support for
48-bit virtual addresses.

CoherentHostAccess property added to HSA_MEMORYPROPERTY, the value match
HSA_MEMORYPROPERTY defined in Thunk spec:

CoherentHostAccess: whether or not device memory can be coherently
accessed by the host CPU.

Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c |  6 ++++++
 drivers/gpu/drm/amd/amdkfd/kfd_topology.h | 10 ++++++----
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
index cdef608db4f4..ab9fe854b4d8 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
@@ -1419,6 +1419,12 @@ int kfd_topology_add_device(struct kfd_dev *gpu)
 		dev->node_props.capability |= (adev->ras_features != 0) ?
 			HSA_CAP_RASEVENTNOTIFY : 0;
 
+	/* SVM API and HMM page migration work together, device memory type
+	 * is initalized to not 0 when page migration register device memory.
+	 */
+	if (adev->kfd.dev->pgmap.type != 0)
+		dev->node_props.capability |= HSA_CAP_SVMAPI_SUPPORTED;
+
 	kfd_debug_print_topology();
 
 	if (!res)
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.h b/drivers/gpu/drm/amd/amdkfd/kfd_topology.h
index b8b68087bd7a..6bd6380b0ee0 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_topology.h
@@ -53,8 +53,9 @@
 #define HSA_CAP_ASIC_REVISION_MASK		0x03c00000
 #define HSA_CAP_ASIC_REVISION_SHIFT		22
 #define HSA_CAP_SRAM_EDCSUPPORTED		0x04000000
+#define HSA_CAP_SVMAPI_SUPPORTED		0x08000000
 
-#define HSA_CAP_RESERVED			0xf80f8000
+#define HSA_CAP_RESERVED			0xf00f8000
 
 struct kfd_node_properties {
 	uint64_t hive_id;
@@ -98,9 +99,10 @@ struct kfd_node_properties {
 #define HSA_MEM_HEAP_TYPE_GPU_LDS	4
 #define HSA_MEM_HEAP_TYPE_GPU_SCRATCH	5
 
-#define HSA_MEM_FLAGS_HOT_PLUGGABLE	0x00000001
-#define HSA_MEM_FLAGS_NON_VOLATILE	0x00000002
-#define HSA_MEM_FLAGS_RESERVED		0xfffffffc
+#define HSA_MEM_FLAGS_HOT_PLUGGABLE		0x00000001
+#define HSA_MEM_FLAGS_NON_VOLATILE		0x00000002
+#define HSA_MEM_FLAGS_COHERENTHOSTACCESS	0x00000004
+#define HSA_MEM_FLAGS_RESERVED			0xfffffff8
 
 struct kfd_mem_properties {
 	struct list_head	list;
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
