Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F52B32EBB7
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 13:57:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A62989DC9;
	Fri,  5 Mar 2021 12:57:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2056.outbound.protection.outlook.com [40.107.237.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A775089DC9
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Mar 2021 12:57:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bLtQSECc1E5i6Z1ZNXoLemJuo5Y0xXUgvlZA+yHc2b/DEukxM2AiJzumrnekQdwshxKgLffzG1m8WxF8K7okFgcmj278vDUo8XDD7B6WjeMjNHqNEvwAs2Kmo95PDgOp861GvCiz/Wj2DySdGpJpM0Hr8dPnT1nmf2wHdfpWCw+ooWLr0vCQmCWAi9ME9uEPhWhTW+u1lQUdFvkhJcEoTOt05CFv048SBYoleDTHXz5Dbc92FWktZE69qnH4zqPSxv14VEtuXjtYjJJvPPWycYO8VRVfbRR4X067YM5/vGfCKmiYl5/jK1wvvhuMVKoB9q1bmfgztudr1LgcvEpHew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tRNm38OXyXD8Vw4A7dPde5m0bpn1eQIpWdBogmUKO8o=;
 b=bzbTOS0gqUgLeYd+njwXW7iaP9VYECS9ywbHMq9Viqu70EPDc0tA6RFhYyrRW3YPE269MUVcvQTTf/+hcMqio0o2NHWZuy9lyKEFByBi7sN2rKqxI8n2IhHHT2fGNCefO0wMIogLpPN03V4TTDlWB2yU+dz8NRMth08+l/wlxFMakMrROlbqk4JLStlJA6yf28utYrBvGFqhejjjC2ZVFAMnnxOrL1BzySttRUB5frHH+8IzCPZDb0mwr2cIxgA4m/CehRT2yUTgkzqZuwr91EyU3OaCFRiWzLgmfuJaBnC9iplo8LBovJAVmkmtT97DFBibya+Aw0wms6XFJR40Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tRNm38OXyXD8Vw4A7dPde5m0bpn1eQIpWdBogmUKO8o=;
 b=N5uK0NivPeKR3JsEfc8uP7ZzFNqoy83I3MCHpt2fVyuDFkO3WNiStBwU2ZBvDKeAmeiuAjMQMT/EfifbuGSLllpU6dEcZN22onz1aNigiskipXaGXc1NQ74H0akDWzY5+0TV0ZAb152IwKhdDCf64DvgrjZEHvdK2LDu3jDo2HE=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from CY4PR12MB1463.namprd12.prod.outlook.com (2603:10b6:910:e::19)
 by CY4PR1201MB0232.namprd12.prod.outlook.com (2603:10b6:910:21::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.23; Fri, 5 Mar
 2021 12:57:11 +0000
Received: from CY4PR12MB1463.namprd12.prod.outlook.com
 ([fe80::6504:7fc4:d02f:77f2]) by CY4PR12MB1463.namprd12.prod.outlook.com
 ([fe80::6504:7fc4:d02f:77f2%3]) with mapi id 15.20.3890.030; Fri, 5 Mar 2021
 12:57:10 +0000
From: Nirmoy Das <nirmoy.das@amd.com>
To: Christian.Koenig@amd.com
Subject: [PATCH 1/3] drm/amdgpu: introduce  struct amdgpu_bo_user
Date: Fri,  5 Mar 2021 13:56:57 +0100
Message-Id: <20210305125659.9923-1-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.30.1
X-Originating-IP: [217.86.122.77]
X-ClientProxiedBy: AM0PR10CA0123.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::40) To CY4PR12MB1463.namprd12.prod.outlook.com
 (2603:10b6:910:e::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from brihaspati.fritz.box (217.86.122.77) by
 AM0PR10CA0123.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17 via Frontend Transport; Fri, 5 Mar 2021 12:57:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 939fa5b5-942b-4f2d-fb45-08d8dfd630c4
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0232:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY4PR1201MB0232CF6EC0AA1E84D21B64FA8B969@CY4PR1201MB0232.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SIdZTYn7m9FDQsz8s6zKASPl8V4pAVzLuVRbpkjZIH+mCqxA56zK/eDfKUBXTTo00DRA1n8ZeEOPh3nOTGvjpwzJho2qfBIao6J/JMcC3pwiC42jIwdSRVeoIwxGg70Wfql0kZDHcq07Niy7B7UxvPKTERofFtpnzxgfEJsq2q9bLiimucKZkeB8HsJgFb/sFdeiS2ID1aO711GWBXPDe16gfd5PXLQIBjLxVnfiGN6L8gLpZK3cxa/vMxkqittnwHTZ4iG1QVl2SH78CsKXy3q9uN1UkZX9Hjl9kxaMS2Z/bwI3c5sKoVR1E0Z0X9QW2K0X88DVv8Y5BgnYGwLPEzbyviC4nirF0/+MSSHoQYA8x/d5ENRhhf0A6JfuRbA5bvQYIXqAM9vOdo08GFEiG1z8ilR6Fm7Of+RAKziNzRWlkJFYZoUp+qqOpUuNKVO5CTWhoWc8Xqtp+Nae8ZplJVGXhHt5U1R+k1yO4se5cdsJlBR/dbnj6kgtAFz41SdBrIIbEaL1n95cAAe5+SjWhg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR12MB1463.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(396003)(376002)(39860400002)(16526019)(6486002)(6636002)(26005)(36756003)(2616005)(5660300002)(37006003)(52116002)(66556008)(186003)(66476007)(6506007)(956004)(6666004)(66946007)(34206002)(6512007)(1076003)(478600001)(4326008)(8676002)(316002)(2906002)(86362001)(8936002)(83380400001)(44832011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?TKB3Ks3E4lFveNzMDOru7W+p/49DzN1+ewBLi+srV0KqdSomG41LgSP57xAG?=
 =?us-ascii?Q?2nqvG7BUZVUg3KNH850Meri/D/7jEG1FK3EZVdOPoj6lt//xtutiOULeRswj?=
 =?us-ascii?Q?e5sYLHkLglACO2T85+YmVt5yjt4cJFn7Ve/t9ZEq2L/xvVMbY69RG5m8yyOG?=
 =?us-ascii?Q?PMAqUPuz5C3jcqPUqIIpSe9febD/AiF0y++IDo09J0/wH2LcgZoUuwHeFg8Q?=
 =?us-ascii?Q?WB3ys7KDoUrIIjx7zsFO6ENembwOKHYXMElT0nmg+jh1/kMwsW8MtfXxM3pc?=
 =?us-ascii?Q?5Aw+Es6sDNbwsT5k3VaGDgWVxbPHCgxVTawamX4wwUlTjVONu432gX3HMpsu?=
 =?us-ascii?Q?9gqhxvug4pDCuaeHpximMlnx2zkJu329hn9jU3lwoBU9tAfiqxPBuTCFpB+O?=
 =?us-ascii?Q?eICwxPCUz08MQQsulS5KKjxdCBsqwqxlTgU4PNV3pLkKpjPhORNmRuvyuFvH?=
 =?us-ascii?Q?o8dR1Q1swjsR//ADpHzbgPwyJ0oxbrodI6Ohx+v3VEyEA1sBz7hsHG0ApcEk?=
 =?us-ascii?Q?FSjVfgUFE8Xg/QQVqery27dT+sZ5vXEqNRhk6eC/Ri7RTdhEtoHSsMugByQ7?=
 =?us-ascii?Q?ya1lJC0BXfMiuXvpNq2gPmxPXY0mYzSOF9DpiMLtiD5hPZnN/M5sZg1ed1wH?=
 =?us-ascii?Q?GIPmzNzhUaWjM055rykNRQ5YhWaJXzTK8ybek9KpQiPEG92T9tSUtiXAWrGw?=
 =?us-ascii?Q?GCRvIT8WqH60qbUMy/UMPYtX0uXao3EEbP1KV4PBVnziA2tr7BJTtWzFMSwQ?=
 =?us-ascii?Q?fRvhJWj3QafpQ2yffP0m/sc/EHqEoXztAQGdYP5bDvm9HkybiTfEJaJvkTPR?=
 =?us-ascii?Q?lNTZ5pgeud4v3HaNhxVy0jqFEySgtLSof5CO7FvyLWtHOz3BGiyRawMwPw6f?=
 =?us-ascii?Q?KMJ0b84YJow/q4JAWqDTqjVHIDkxQQzPcgyS+W4YawmaJwmixYD/DezvFPsX?=
 =?us-ascii?Q?B3pP+wk5TcLgPXZwVbCcA1mPY8QQL4ku9X7lebQ3I4HawRDjbkj3rhpRgAYP?=
 =?us-ascii?Q?+56KIlGwnM5CFCK8p+OFfC7KeATmb5ex0nr02TwIY7oEdgCWbC8ejbvpxCZn?=
 =?us-ascii?Q?fhwzv3mKhmZxdQMBSF7BTkTkxKkMbRURwURdclFkWNsxWvSTOU4VbHwNbHU7?=
 =?us-ascii?Q?jcgHx45ZYFHh2KfXMpw/Ffb1P4YCNyyH/ZHO/fb2RIywUAgf8YMQm2e9iFx2?=
 =?us-ascii?Q?9CFMLQ1lqtT1z/qsaQ2RnRBx1QIhlDYMrMTTOx2RUS5C3cU59JTyCTDh9idN?=
 =?us-ascii?Q?XbA/G97Fz9H9QY+WT73pRe655vz9h1icZNxdibdXRoJNFpXcGwv+myLeqtIQ?=
 =?us-ascii?Q?a5cyEWjS2NQ84rp7hiHz/tFC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 939fa5b5-942b-4f2d-fb45-08d8dfd630c4
X-MS-Exchange-CrossTenant-AuthSource: CY4PR12MB1463.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2021 12:57:10.8755 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g+2JEY9tHmXnPueSZ3w1xZxnw4qNT7+V64D4kGlUKiGfS7MWMeRKGHpYv0//NVIP3YzF6qq61kJ429b0KMTSXQ==
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

Implement a new struct amdgpu_bo_user as subclass of
struct amdgpu_bo and a function to created amdgpu_bo_user
bo with a flag to identify the owner.

Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 44 ++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h |  9 +++++
 include/uapi/drm/amdgpu_drm.h              |  2 +
 3 files changed, 55 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 745393472564..f21679f38383 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -699,6 +699,50 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
 	return r;
 }
 
+/**
+ * amdgpu_bo_create_user - create an &amdgpu_bo_user buffer object
+ * @adev: amdgpu device object
+ * @bp: parameters to be used for the buffer object
+ * @ubo_ptr: pointer to the buffer object pointer
+ *
+ * Create a BO to be used by user application;
+ *
+ * Returns:
+ * 0 for success or a negative error code on failure.
+ */
+
+int amdgpu_bo_create_user(struct amdgpu_device *adev,
+		     struct amdgpu_bo_param *bp,
+		     struct amdgpu_bo_user **ubo_ptr)
+{
+	struct amdgpu_bo *bo_ptr;
+	u64 flags = bp->flags;
+	int r;
+
+	bp->flags = bp->flags & ~AMDGPU_GEM_CREATE_SHADOW;
+	bp->flags = bp->flags | AMDGPU_GEM_CREATE_USER;
+	bp->bo_ptr_size = sizeof(struct amdgpu_bo);
+	r = amdgpu_bo_do_create(adev, bp, &bo_ptr);
+	if (r)
+		return r;
+
+	*ubo_ptr = (struct amdgpu_bo_user *)bo_ptr;
+	if ((flags & AMDGPU_GEM_CREATE_SHADOW) && !(adev->flags & AMD_IS_APU)) {
+		if (!bp->resv)
+			WARN_ON(dma_resv_lock((*ubo_ptr)->bo.tbo.base.resv,
+							NULL));
+
+		r = amdgpu_bo_create_shadow(adev, bp->size, bo_ptr);
+
+		if (!bp->resv)
+			dma_resv_unlock((*ubo_ptr)->bo.tbo.base.resv);
+
+		if (r)
+			ttm_bo_put(&(*ubo_ptr)->bo.tbo);
+	}
+
+	return r;
+}
 /**
  * amdgpu_bo_validate - validate an &amdgpu_bo buffer object
  * @bo: pointer to the buffer object
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
index 848dc0a017dd..332e269c3fd1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
@@ -114,6 +114,12 @@ struct amdgpu_bo {
 	struct kgd_mem                  *kfd_bo;
 };
 
+struct amdgpu_bo_user {
+	struct amdgpu_bo		bo;
+	u64				tiling_flags;
+
+};
+
 static inline struct amdgpu_bo *ttm_to_amdgpu_bo(struct ttm_buffer_object *tbo)
 {
 	return container_of(tbo, struct amdgpu_bo, tbo);
@@ -257,6 +263,9 @@ int amdgpu_bo_create_kernel(struct amdgpu_device *adev,
 int amdgpu_bo_create_kernel_at(struct amdgpu_device *adev,
 			       uint64_t offset, uint64_t size, uint32_t domain,
 			       struct amdgpu_bo **bo_ptr, void **cpu_addr);
+int amdgpu_bo_create_user(struct amdgpu_device *adev,
+		     struct amdgpu_bo_param *bp,
+		     struct amdgpu_bo_user **ubo_ptr);
 void amdgpu_bo_free_kernel(struct amdgpu_bo **bo, u64 *gpu_addr,
 			   void **cpu_addr);
 int amdgpu_bo_kmap(struct amdgpu_bo *bo, void **ptr);
diff --git a/include/uapi/drm/amdgpu_drm.h b/include/uapi/drm/amdgpu_drm.h
index 8b832f7458f2..9b9a4ac6f00f 100644
--- a/include/uapi/drm/amdgpu_drm.h
+++ b/include/uapi/drm/amdgpu_drm.h
@@ -141,6 +141,8 @@ extern "C" {
  * accessing it with various hw blocks
  */
 #define AMDGPU_GEM_CREATE_ENCRYPTED		(1 << 10)
+/* Flag that indicates the BO is created for userspace */
+#define AMDGPU_GEM_CREATE_USER			(1 << 11)
 
 struct drm_amdgpu_gem_create_in  {
 	/** the requested memory size */
-- 
2.30.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
