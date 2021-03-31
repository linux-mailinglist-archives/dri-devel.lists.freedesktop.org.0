Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 245CB350027
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 14:25:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3692E6EA88;
	Wed, 31 Mar 2021 12:25:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2087.outbound.protection.outlook.com [40.107.236.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F7786EA79;
 Wed, 31 Mar 2021 12:25:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jnFTJYtCswXMCm3g9D6WEedynr9t+mB+IbR88f7itq42Q1oEjrf5TNDC4oO3wnUDFaWLoEKucZAyha57bSgYjuW5Iya0MD1jKllqr/ieUD0oI7iINeSUdof4qFn1JAlA42KtlPFyZ046jhr5X2Y4L8Rqzp5nU2quoDTpxTHmB3JLJHff4wpB6DPpf85rAplf80EH/l2QEyBrCM3caB+v1pl7mvJgSTDjAeqofn0DSfqTo/J+sobSY/4nPjZsLDhB8sQp9eBOFecU1YeA+VMs0ybJ1FBz3LGYyX0xplthVaoI8eh2yKDmgcu1CKA4PkDpiHtsdazEyf/xdDSMWaw+zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZEeVdYb7Uw9QHXqJevQuZrbFXTm9cMPtaQlV9xW2rJg=;
 b=mjPx7HG0vbk27DesXJ1lFW+iHwm30D01vXtpL/BgzOUKyk6u4Xk8xsQjuqavDJO8F/cJO77MYcRwftbZPX9IB/HkGpyz1LzoGjJbbsFcdJ09RPBr1ouzbvrRIEdMNpHgBUrH8kVnvmnNVsWJx45SuZDd18pyXgwx4bfANqBLuzdfL4yJA+JA8z9CkNsaMg0YM2Hdyjl5UzXKmt72XoXWlNxYlbZ9+GOXkVeVnNZeeL+JeT0IB2Z+IbtqV9ZMu7TL/f1SdOIHP1MR0bKRQxakn+pGrPY24+AvnA7lvTdxRVOSbOEuZwpRH7xEjWhoCYDRJ1PQ+7POXARhgIYOK5K6gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZEeVdYb7Uw9QHXqJevQuZrbFXTm9cMPtaQlV9xW2rJg=;
 b=Ev5o5woch5pABysR2qPgm1kXWnmoyq8W/g/utrbbnvSf8oI3TiX8DDQB4SvM+hj4Q8i17o0/+VNGL5lyZKqcgIwrVRciQJ1kyU9L5+DTlta9ug5nUEUWAxOTa6ct1x1NzV03buyHAapLj4S0PUKa6+qjC2cuidV2UUQEsGiyAv0=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB2601.namprd12.prod.outlook.com (2603:10b6:5:45::27) by
 DM6PR12MB2937.namprd12.prod.outlook.com (2603:10b6:5:181::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.27; Wed, 31 Mar 2021 12:25:24 +0000
Received: from DM6PR12MB2601.namprd12.prod.outlook.com
 ([fe80::3d2c:5edf:5d51:4101]) by DM6PR12MB2601.namprd12.prod.outlook.com
 ([fe80::3d2c:5edf:5d51:4101%7]) with mapi id 15.20.3977.033; Wed, 31 Mar 2021
 12:25:24 +0000
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Harry Wentland <harry.wentland@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, Peter Zijlstra <peterz@infradead.org>,
 aric.cyr@amd.com
Subject: [PATCH 4/4] drm/amd/display: Add DC_FP helper to check FPU state
Date: Wed, 31 Mar 2021 08:25:02 -0400
Message-Id: <20210331122502.1031073-5-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210331122502.1031073-1-Rodrigo.Siqueira@amd.com>
References: <20210331122502.1031073-1-Rodrigo.Siqueira@amd.com>
X-Originating-IP: [2607:fea8:56e0:6d60:1683:1bc7:ac8c:6a3]
X-ClientProxiedBy: YTBPR01CA0006.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::19) To DM6PR12MB2601.namprd12.prod.outlook.com
 (2603:10b6:5:45::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from atma2.hitronhub.home (2607:fea8:56e0:6d60:1683:1bc7:ac8c:6a3)
 by YTBPR01CA0006.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.30 via Frontend
 Transport; Wed, 31 Mar 2021 12:25:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ab9f4f65-71ea-4b88-ff84-08d8f4400f28
X-MS-TrafficTypeDiagnostic: DM6PR12MB2937:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB2937CB5C85D555E18323F7B0987C9@DM6PR12MB2937.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cRky6JTFpNx7Cvu9kF61QoEnS7Vcm9lF5Bm0dB+C34qMUeCNkZ6M+12CCq3yWXcxac193cWqywQLoyTW8MLUPje5Q6Dcs3BXPwqb1hA3e5vABulAtWpuq797NS0O/sin/9zaYG3UQoutxath9Ai5Ntx19lDgI87mNI0e0uAyJUcbFu3FIEctISWxyyF0zdYf4ANQNZWFaKvBrAwibUVotq9vQC8W00nM43L7BoC34hdWtx6ygsUaCB9hIV/G+6Hi49r6ySqBmmO1Ln5YZW7Wxk9p28emPJ+XRDaNGHVaUG0+oVicw5gMG39UBwBo51koaO5PFyQZgGn59HW96WjH1WUIClELmgPjySFjXMLlxptLTSbQtCYj+dozS2VzRH3vawP90HwcnUQD8VW08vT6rZQln9wRHgMf7REY1fRy13Z3XsAkedHAAIqHAPb4FspADeqr3jMnXW1ZRMKHfSuPvx3MzcIfZQvYch3clY8ENatJp4QiQiS4sHpcJmzAYjFWCqd2E3dlyH9kz1DoyxIgeMPWN5sSA4Bk1yCr1FBA+yALPM3TGyR9JWKzVmtmeoEvD8NLCoESQAiP1tlzVm3oIigouRAcIPCwUdvaIzGQBsIywy1rsuGUK0Ulp1EtmTWI+Ms0pjPF/nUeFHBg3OuCrjRKNfTAR1NKAOMzj5VR9ao=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2601.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(376002)(366004)(136003)(39860400002)(316002)(38100700001)(2906002)(6636002)(6666004)(4326008)(5660300002)(66946007)(36756003)(8936002)(83380400001)(478600001)(66556008)(66476007)(6486002)(8676002)(186003)(16526019)(6512007)(52116002)(1076003)(2616005)(110136005)(86362001)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?vOvBoocQigbhHI1EWY2fcvdpuzYiLmcW2u1I8aGr3rgA8DWfbdkihqQWzCzy?=
 =?us-ascii?Q?HG04EKS/zkbB0gWLSqPpHUDxiiWryPpTFZ78tHHKMpyShWC6zA1c2FS0JdJ/?=
 =?us-ascii?Q?Jc2q5eTtzLdFn8qnloTbN+CLyE50OA1dnDc3b66I4UkcTXdxb6Xd1Ij2Fgzp?=
 =?us-ascii?Q?Z90KZG3D35loBHNcMPIuHuazuV57vrEgfnDue5dD8eNkeUSRN6q4vJLbHID2?=
 =?us-ascii?Q?ppY/LVAt5moxXXlLPlKWA7ZM7YZ4wQcYs1Zwog/ZF+ktrW/0d5HuWiRVugdP?=
 =?us-ascii?Q?DMfqxcTauVeS69rJZ74DsY+Nx/gY1zIK0X2xjVkn3cQcEzQF7IuTZkvD6Fy2?=
 =?us-ascii?Q?RAbvCYlQo6SjYtidKfToZDS/u+Us2gpNcaqyZKjAXyZzsmqNr4xFfwfUOG0H?=
 =?us-ascii?Q?XXa7vtnccOroYuVB/lpQIjEWAnQP/OioApW04bhE0XNtRqWLHNyZOORrj4qv?=
 =?us-ascii?Q?lbZ4lMIEULZGN3sGwrsUs6b5xMVCYG+Io8re4pGkRref2UypSmm9MSxI9xUQ?=
 =?us-ascii?Q?iP2Ju2hfrQtPQWrS+qKRDcylQOcph8DedSkqHk++ZQYxCvyBpbiSbLpV8Yn0?=
 =?us-ascii?Q?eyDEV98PgnxnJKbsnCP0Gcg3I6MnbvfX9mREiMf78zV7mHM5jmKfdcy/GJdn?=
 =?us-ascii?Q?XVzBqSBTZmo2k9vxDmy8R+lBxi2sX+6/2EnhIaCGV1Q/IzkKNopRHO2FzDuP?=
 =?us-ascii?Q?h8/6bIjmA2NmZvFd76VyDr7F7t4H12mvFSb2shRxH6d5fcR+ZTqaTu91dcPq?=
 =?us-ascii?Q?GZrcBR9R3CHxxwaBqOjDCU8bdhoweNzf93Kz3vy+moj99aOD7OxThWuEYhMn?=
 =?us-ascii?Q?quJAyG5Ugpgxa3Myh/KwroE62VoAB6l8RNqU5KgRFFk+qfw1RkpeVDB0cFC9?=
 =?us-ascii?Q?hEo0hEmprM4QP8ebQBWdA4YbvX+8KH9rb7YUZTlPmepRigvTsUwRNm+YiSC7?=
 =?us-ascii?Q?MUk4VgyXDnqEpLqsMbVaTnPlbpoDM6vF21a9poqSo5NCHHA68y8EhidhoZv5?=
 =?us-ascii?Q?JJT1pSn9hELWTaeQsRfwAbZ0Hk7wK6Uo3qFRIjVDhLIbiBbzk8NsLB54X/qV?=
 =?us-ascii?Q?lGQhPxLfyIBQpUjpcj94fXcBE+wOZpem3hs7deX4TL3oVKV3fhCifs7GmGvu?=
 =?us-ascii?Q?yToMcV+Ll8lBfb1Xk3Ra4rLW2IdNIwnmN9BZgYxkniV95sM82bqObSf9sNBc?=
 =?us-ascii?Q?nRksXTZHtBjULcixyeF7p5WIFjBxG4/KbqMm2p5JfntI5jsuphxK2+FVdRpf?=
 =?us-ascii?Q?oKkCIZ6MWWNBPpPIJFz/lwtvUXc4RFQ6lYUa6Zb3repWYdQj1QWdylKMo5tO?=
 =?us-ascii?Q?Rd2YiAF3MYWZRuXIPLwt6Am8sk2PIDdTgkUDqWjmW3H2LO2yq5NXrRvust0e?=
 =?us-ascii?Q?14v9A9ffmo5/bkOJSKcIhaNaUCl6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab9f4f65-71ea-4b88-ff84-08d8f4400f28
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2601.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2021 12:25:24.3603 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H9+yZhSTKnkRIGTZrWhGXfOHzuDq5zxI/gWJiapH8lwstChfNBsJBjloY4cMIRdVEnUGu2NQRdVmMaWMXUTNVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2937
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To fully isolate FPU operations in a single place, we must avoid
situations where compilers spill FP values to registers due to FP enable
in a specific C file. Note that even if we isolate all FPU functions in
a single file and call its interface from other files, the compiler
might enable the use of FPU before we call DC_FP_START. Nevertheless, it
is the programmer's responsibility to invoke DC_FP_START/END in the
correct place. To highlight situations where developers forgot to use
the FP protection before calling the DC FPU interface functions, we
introduce a helper that checks if the function is invoked under FP
protection. If not, it will trigger a kernel warning.

Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Acked-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/dc_fpu.c    | 34 ++++++++++++++++---
 .../gpu/drm/amd/display/amdgpu_dm/dc_fpu.h    |  1 +
 .../drm/amd/display/dc/dcn20/dcn20_resource.c |  2 ++
 .../drm/amd/display/dc/fpu_operations/dcn2x.c | 17 ++++++++++
 4 files changed, 49 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
index 5dcefe193523..0d95f680b62b 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
@@ -40,6 +40,25 @@
  */
 
 static DEFINE_PER_CPU(atomic_t, fpu_ref);
+static DEFINE_PER_CPU(atomic_t, fp_dc_enabled);
+
+/**
+ * is_fp_dc_enabled - Check if FPU protection is enabled
+ *
+ * This function tells if the code is already under FPU protection or not. A
+ * function that works as an API for a set of FPU operations can use this
+ * function for checking if the caller invoked it after DC_FP_START(). For
+ * example, take a look at dcn2x.c file.
+ *
+ * Return:
+ * Return true if we already enabled FPU protection, otherwise return false.
+ */
+inline bool is_fp_dc_enabled(void)
+{
+	atomic_t *fp_enabled = this_cpu_ptr(&fp_dc_enabled);
+
+	return atomic_read(fp_enabled);
+}
 
 /**
  * dc_fpu_begin - Enables FPU protection
@@ -55,12 +74,15 @@ void dc_fpu_begin(const char *function_name, const int line)
 {
 	int ret;
 	atomic_t *local_fpu_ref = this_cpu_ptr(&fpu_ref);
+	atomic_t *fp_enabled = this_cpu_ptr(&fp_dc_enabled);
 
 	ret = atomic_inc_return(local_fpu_ref);
 	TRACE_DCN_FPU(true, function_name, line, ret);
 
-	if (ret == 1)
+	if (ret == 1) {
 		kernel_fpu_begin();
+		atomic_set(fp_enabled, 1);
+	}
 }
 
 /**
@@ -75,13 +97,15 @@ void dc_fpu_begin(const char *function_name, const int line)
  */
 void dc_fpu_end(const char *function_name, const int line)
 {
-
-	int ret;
+	bool ret;
 	atomic_t *local_fpu_ref = this_cpu_ptr(&fpu_ref);
+	atomic_t *fp_enabled = this_cpu_ptr(&fp_dc_enabled);
 
-	ret = atomic_dec_return(local_fpu_ref);
+	ret = atomic_dec_and_test(local_fpu_ref);
 	TRACE_DCN_FPU(false, function_name, line, ret);
 
-	if (!ret)
+	if (ret) {
+		atomic_set(fp_enabled, 0);
 		kernel_fpu_end();
+	}
 }
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h
index fb54983c5c60..e782dfa640bf 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h
@@ -27,6 +27,7 @@
 #ifndef __DC_FPU_H__
 #define __DC_FPU_H__
 
+bool is_fp_dc_enabled(void);
 void dc_fpu_begin(const char *function_name, const int line);
 void dc_fpu_end(const char *function_name, const int line);
 
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
index b58edd012038..d0771e29c243 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
@@ -2351,7 +2351,9 @@ int dcn20_populate_dml_pipes_from_context(
 	}
 
 	/* populate writeback information */
+	DC_FP_START();
 	dc->res_pool->funcs->populate_dml_writeback_from_context(dc, res_ctx, pipes);
+	DC_FP_END();
 
 	return pipe_cnt;
 }
diff --git a/drivers/gpu/drm/amd/display/dc/fpu_operations/dcn2x.c b/drivers/gpu/drm/amd/display/dc/fpu_operations/dcn2x.c
index 32b23a182428..1c8a97d342c0 100644
--- a/drivers/gpu/drm/amd/display/dc/fpu_operations/dcn2x.c
+++ b/drivers/gpu/drm/amd/display/dc/fpu_operations/dcn2x.c
@@ -42,6 +42,22 @@
  *    that deals with FP register is contained within this call.
  * 3. All function that needs to be accessed outside this file requires a
  *    public interface that not uses any FPU reference.
+ * 4. Developers should not use DC_FP_START/END in this file, but they need to
+ *    ensure that the caller invokes it before access any function available in
+ *    this file. For this reason, public API in this file must invoke
+ *    ASSERT(is_fp_dc_enabled());
+ *
+ * Let's expand a little bit more the idea in the code pattern number for. To
+ * fully isolate FPU operations in a single place, we must avoid situations
+ * where compilers spill FP values to registers due to FP enable in a specific
+ * C file. Note that even if we isolate all FPU functions in a single file and
+ * call its interface from other files, the compiler might enable the use of
+ * FPU before we call DC_FP_START. Nevertheless, it is the programmer's
+ * responsibility to invoke DC_FP_START/END in the correct place. To highlight
+ * situations where developers forgot to use the FP protection before calling
+ * the DC FPU interface functions, we introduce a helper that checks if the
+ * function is invoked under FP protection. If not, it will trigger a kernel
+ * warning.
  */
 
 static noinline void _dcn20_populate_dml_writeback_from_context(struct dc *dc,
@@ -84,6 +100,7 @@ static noinline void _dcn20_populate_dml_writeback_from_context(struct dc *dc,
 void dcn20_populate_dml_writeback_from_context(struct dc *dc,
 	struct resource_context *res_ctx, display_e2e_pipe_params_st *pipes)
 {
+	ASSERT(is_fp_dc_enabled());
 	_dcn20_populate_dml_writeback_from_context(dc, res_ctx, pipes);
 }
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
