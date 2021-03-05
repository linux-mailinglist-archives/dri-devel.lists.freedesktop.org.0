Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3AE32EBB8
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 13:57:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C983E89E63;
	Fri,  5 Mar 2021 12:57:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2057.outbound.protection.outlook.com [40.107.237.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D031A89E63
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Mar 2021 12:57:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RZcZRI8OCZnnNEiWIzTV/Vj2AypbhE1B5NozmCmbI/7Z3wVE8ej9rLdWO71DdQHvOsf1EFfIPyw0ezxIpAJd57FxGoL2MRWqsS+n6yR1pEzBAJBOoCBfMd3ZiHuEISj4jGVUZAYJcQQFDBbttSPJuSZWdyPOnOYke+LP4Sl2mUeBqlBFhu1sllaDeMf8mz+Tc2MbVnWHmnmznb/m5miDajyiMdrtzmdQW9w0sFxQbWv5LQlKtWDJEZlHbl1CfXvpPpQdAE7z3JwZjauZgwwzGeJwygjV7mjgD+z/huJvIBbjzO0IMbs8XPNyn5VKhTinc8bHESAnPt7G6N35FkwdqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K7HT1DcSfKz6dcM6YVYC5uIYq0aDcZKU/p63O6Q+SkE=;
 b=NS8IFU2nNrH5BL7qabeEWeBCXCs335SKsAZ9T8+m4w+xagxWKpjNmDEqJFeAUDFHmSEw5TE4kPFpGacEfEqczeI1ccnYAtSvmJKmATqBpTqYVuLqbxYp5lTyHOlSkNtjm4uU/mvW6s8A8Y0j/HjLXfCjLSW7y5AeTbLCzWrXEgsaRCiybM76cd0BGn/NE7HLjFxx2xvGMIezbRq8cQvbqi+6JMP5JKeVtApLhsmG9Dw1zimVHQg77Vq80v5qTugaukCHf7GDl1AuHyOS/jnXMWhghd/jbC1SwFjO5NLLKPCZvdUZ3Sgo+WR4KtO3hvlYChQk/EeneetwRg2LUKMwjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K7HT1DcSfKz6dcM6YVYC5uIYq0aDcZKU/p63O6Q+SkE=;
 b=BVjSDJiZq6bvebzr90XyZdBfD3AclNwXEFGFOIN3sZLcEP+MeADV0ppi46BbsTojq3sIZ7vAoJd9E4KIMOG0Z1YHpUbR+IlxyrX1Odn3naIqMcwIf15HEaLei7Jl77346jrGd+zUrp1kuZAl5/bywTlMcLJDfKdw1Bha/c737dw=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from CY4PR12MB1463.namprd12.prod.outlook.com (2603:10b6:910:e::19)
 by CY4PR1201MB0232.namprd12.prod.outlook.com (2603:10b6:910:21::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.23; Fri, 5 Mar
 2021 12:57:14 +0000
Received: from CY4PR12MB1463.namprd12.prod.outlook.com
 ([fe80::6504:7fc4:d02f:77f2]) by CY4PR12MB1463.namprd12.prod.outlook.com
 ([fe80::6504:7fc4:d02f:77f2%3]) with mapi id 15.20.3890.030; Fri, 5 Mar 2021
 12:57:13 +0000
From: Nirmoy Das <nirmoy.das@amd.com>
To: Christian.Koenig@amd.com
Subject: [PATCH 3/3] drm/amdgpu: use tiling_flags of struct amdgpu_bo_user
Date: Fri,  5 Mar 2021 13:56:59 +0100
Message-Id: <20210305125659.9923-3-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210305125659.9923-1-nirmoy.das@amd.com>
References: <20210305125659.9923-1-nirmoy.das@amd.com>
X-Originating-IP: [217.86.122.77]
X-ClientProxiedBy: AM0PR10CA0123.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::40) To CY4PR12MB1463.namprd12.prod.outlook.com
 (2603:10b6:910:e::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from brihaspati.fritz.box (217.86.122.77) by
 AM0PR10CA0123.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17 via Frontend Transport; Fri, 5 Mar 2021 12:57:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4a4fbba2-6ed2-44ba-7308-08d8dfd63291
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0232:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY4PR1201MB0232DC9AD220AD93C1C0C9AF8B969@CY4PR1201MB0232.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wdKqJ+UPU4VSRqtFKET2oFKH5flpLoTo8Ke8/GCoC68Otfaubahs6vQrX6iYnxFzjn9gUCv+Xr67+b2VfzPMI3Y745rckJFfDIbddlZYZL0i28m/X+o/uU+zOQSNplNu/+1dDaVjqF+J5gVRYhPTm3lqIuvNlYIWVO2TpnXjptSu2q0BCJUOLUp1cJ94LpR8QcF6CTCuM+rIZJDf33N/Fm/G4V9+UbujGK7qq6xiccPXKbNshdsbhq4KhG2aiYv6zXXrA5+6amphKN2W1KNDAgX7U6ayEEx/Jgz/w0V3c945qlgq9ePQGEbD/xSWCVekrhnXYCM3nvtFO7xB5jMJbHaYVc/H7VM/UgI6W3+yBsjT1la/OaaK7ddYuz7lPrL7juEthnd/xuv7qlEmLXqhg55yA67U+XZ6rrbOOolEMtCvjg5Nrkn3PE6q9QMNp9oTQAe+HBvWNg0WUFm08DwZO93NKEY9Q1q6pVljvWVJ/NNcTo5DUp+a5Wr49rnUqKrlBsTIzQQ685ITszJu5eEJHg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR12MB1463.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(396003)(376002)(39860400002)(16526019)(6486002)(6636002)(26005)(36756003)(2616005)(5660300002)(37006003)(52116002)(66556008)(186003)(66476007)(6506007)(956004)(6666004)(66946007)(34206002)(6512007)(1076003)(478600001)(4326008)(8676002)(316002)(2906002)(86362001)(8936002)(83380400001)(44832011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?YiP4+xaUoaoAijhdi9ZeZnQaWe92M31zOtkObSY+w4ZENmglmaTKyl/fVjds?=
 =?us-ascii?Q?x2xFHCyEVlGXIrdwS54EApmiUbsy2oTXm/Lbqe4kGpqcSRozI7hiSJuGXXB9?=
 =?us-ascii?Q?PKXM2ixK1ilZYTZ08864oZWh5yQkZTVe4eHPC9DSmfS9f7q4jeXFJ6iP1n1F?=
 =?us-ascii?Q?Nt+WuHxZGN8fPn0gtp825KI4SBID7vyU6Bp4MXiJA5pVp9SK4eoBeKDT3jGW?=
 =?us-ascii?Q?S4rr5aN5Pwr0FslG2uhgOVL4t6TIXVxFNCbH9DoJ7Ibnpwj/133wSsKd+Q34?=
 =?us-ascii?Q?e3g/NIkCfCucL+OOhOlAOg4/QGoW7YpnmHVsjSLIKT35LvJX3wX5jXWUnjK+?=
 =?us-ascii?Q?5xMVrsEYf+7TNvMa1JYez/pto8rov0E/JgltkRf8zt9auQfOLoVyZHRBi05U?=
 =?us-ascii?Q?IdftoF8xbSzH1uwEw4ZmoN2Au6vQ/x3hoE7yCfSGLvsKqlVn22bF5HpoDsff?=
 =?us-ascii?Q?uidf3UTJR3rkKJQE90PdHo+ZpJowsI1lLnDOReRkDLxzb8beG9D6FEUjFNfU?=
 =?us-ascii?Q?oSdx2iohrr+J6SyMJw19BU/mVML+mzGLntifnl2j1iXtUIxVbMMbtR7Phc/H?=
 =?us-ascii?Q?oaq0HVAhGoH9YAxpVzLc+Gu1ZQLt2SrH6rb+0h7u/RrJeaySnXcfqnB6Ndx3?=
 =?us-ascii?Q?W2qL37b4V3BZs8RRDmQiBMBSD7fCqvOtdR31/HJ0o0jjfYVpVvAKzt361ZNI?=
 =?us-ascii?Q?YiST4kNqE5l1x31wsH3kWT4fbPGqr5WO7oDMbvWqVCvojOcDwi6BjK/oHhYt?=
 =?us-ascii?Q?oNHeH++X+5+ee+a1VfnEu7nRn3o1aV3pPJ7CPmKDhUAkOdXqr94A+1wlz4CA?=
 =?us-ascii?Q?KfHO3fe3Z5G6a1fJO2kP7WgZ1H1IRKambK7H6qLRgXkaMPKfjaXgivCOf0FI?=
 =?us-ascii?Q?SJnFJv+hc1ReXnGpuH7oy7ufmkrsHAQraolsWMqMrM7SW12+45PYPCD7zzWK?=
 =?us-ascii?Q?uEg4sqZWLN4VEkuW2lKxz5uGDA69olnWbg/jMMKiFCpxHDTLcBPEMdGl4ffO?=
 =?us-ascii?Q?ysn8N9mXkauJ1UiYYMHKcMHy1nXAlEX8tb8+K4ItxHDm+Nvhh6c9HuOdIg/e?=
 =?us-ascii?Q?mMi3JpYgP1AQto6w1cmcF+vRHQO+xLswOTw9AGbIcypY1qw2kJZRxLanBs2H?=
 =?us-ascii?Q?is0fdMREcgMCipmA/VOQHBANrrvv1ji1aPQI4OhWnTayccFoZfQaO6iw0on+?=
 =?us-ascii?Q?I2395Kb6rtQB4P1mYFink93lE/7eOGeABgKdAw16aaOs3DW6iUlLNeTinYCm?=
 =?us-ascii?Q?Yczilvu+gFOsgsYKqs209Xz3HpYxI1heI6+sfe0607ZI0vXo1zse10sIN+VS?=
 =?us-ascii?Q?87gDI1hGcGU+iXy/Qz2l+Hur?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a4fbba2-6ed2-44ba-7308-08d8dfd63291
X-MS-Exchange-CrossTenant-AuthSource: CY4PR12MB1463.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2021 12:57:13.9302 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: //yfPqGGfcOhOex/iaExORpLsIyLukYJK9cE3FijQ7jSD5a6lbDzdZCK+nBrtn6MagZcgC0nSbJ6cauA+CHM6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0232
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
Cc: Nirmoy Das <nirmoy.das@amd.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This flag is only needed for BOs created by amdgpu_gem_object_create(),
so we can remove tiling_flags from the base class.

Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 19 +++++++++++++++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h |  1 -
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index f21679f38383..c19cb6863966 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -1190,12 +1190,19 @@ int amdgpu_bo_fbdev_mmap(struct amdgpu_bo *bo,
 int amdgpu_bo_set_tiling_flags(struct amdgpu_bo *bo, u64 tiling_flags)
 {
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
+	struct amdgpu_bo_user *ubo;
+
+	if (!(bo->flags & AMDGPU_GEM_CREATE_USER)) {
+		DRM_ERROR("can not set tiling_flags for a non-amdgpu_bo_user type BO\n");
+		return -EINVAL;
+	}
 
 	if (adev->family <= AMDGPU_FAMILY_CZ &&
 	    AMDGPU_TILING_GET(tiling_flags, TILE_SPLIT) > 6)
 		return -EINVAL;
 
-	bo->tiling_flags = tiling_flags;
+	ubo = container_of((bo), struct amdgpu_bo_user, bo);
+	ubo->tiling_flags = tiling_flags;
 	return 0;
 }
 
@@ -1209,10 +1216,18 @@ int amdgpu_bo_set_tiling_flags(struct amdgpu_bo *bo, u64 tiling_flags)
  */
 void amdgpu_bo_get_tiling_flags(struct amdgpu_bo *bo, u64 *tiling_flags)
 {
+	struct amdgpu_bo_user *ubo;
+
+	if (!(bo->flags & AMDGPU_GEM_CREATE_USER)) {
+		DRM_ERROR("can not get tiling_flags for a non-amdgpu_bo_user type BO\n");
+		return;
+	}
+
 	dma_resv_assert_held(bo->tbo.base.resv);
+	ubo = container_of((bo), struct amdgpu_bo_user, bo);
 
 	if (tiling_flags)
-		*tiling_flags = bo->tiling_flags;
+		*tiling_flags = ubo->tiling_flags;
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
index 332e269c3fd1..7164c0799534 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
@@ -91,7 +91,6 @@ struct amdgpu_bo {
 	struct ttm_bo_kmap_obj		kmap;
 	u64				flags;
 	unsigned			pin_count;
-	u64				tiling_flags;
 	u64				metadata_flags;
 	void				*metadata;
 	u32				metadata_size;
-- 
2.30.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
