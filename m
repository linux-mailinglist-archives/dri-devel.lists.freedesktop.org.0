Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 340CD3CF0F1
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 02:49:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26F0B6E176;
	Tue, 20 Jul 2021 00:49:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2079.outbound.protection.outlook.com [40.107.243.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 076A36E15E;
 Tue, 20 Jul 2021 00:49:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=La25EDrUvJJYQzSFPEQaxzuAquoCNJPCY1hFsY1DTTVdUu85fsuCo/gu5NWRpnKVD3oyGuzu4z478zLbJV3z0RwaIa37AsLT7uvw3Hzj17I84tzucO1Pi9jn8sE5bax0JHjI/q7fc6kSSndUvo7eVFIyz3004VqCKejlD7pMVgJVVYF1hF9KaqY9qC0G7z4Mw0JDDlwnQQ5PDyISnYSQwghzhTXQxPGesrznvePczWBB8u4unsilHbSdsrkaysdWL5A3DXqzT8rFpz8P1n3ji4+NdnWSv9oE7JYn69M2qY+UR2iS3yfKxjuirO6/9K3HNfVp6RI5fHgJpaxctGsBlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2dBt126uCiBnN2jSieRkteK5vnQEkFdUDmJ4eVv1nv4=;
 b=R0YeQsFoWMkXc9VFT9MXbxvzccQkSJ/zybS4u7HIdGZrpkkJCukYASjzCGbr04pkUw8k/hHMnbBFvp+kyKXQNGp9Z0EnbtMrnr6MannB/WTmfSRtgJi+Thk8sp82xTsiiaNpmONX8ZZMAqbyjqfZBFB99xjJGbIZudsFKPvIQ11JM2w2FSgYwMgSzdfII9SLPCqWP1C5Z0fgZLMdyNDj81GVscqZ1mkLQ5AZcWjp1lBf/c1pk5CUGcyMIs54/QDGfhsz7CfVLQQYNAMxG+BaeRNgd4TfNB/B9lRwyF1+7z3KwU6ICPiUPpp1+JdlUck1iP9jRMxFZ5SQFUmhDvEAkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2dBt126uCiBnN2jSieRkteK5vnQEkFdUDmJ4eVv1nv4=;
 b=a+qWKG5fC3tu4ue6WDx4A17GdgK09hvME2TyldayNenZprPxt0k4fJ6eWL8CgVFPcZao3Ric5dc2tgozn6Zo/DT0/Ow5+cP8tQBjKhNRepgSPFbvkTButUoTAy5iuz/MeEaDxMcc9s2EUF5DS0tjERvqaBS7djPCTXfo+p/rmgc=
Received: from BN9P223CA0020.NAMP223.PROD.OUTLOOK.COM (2603:10b6:408:10b::25)
 by DM5PR12MB2534.namprd12.prod.outlook.com (2603:10b6:4:b4::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.26; Tue, 20 Jul
 2021 00:49:32 +0000
Received: from BN8NAM11FT025.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10b:cafe::d5) by BN9P223CA0020.outlook.office365.com
 (2603:10b6:408:10b::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22 via Frontend
 Transport; Tue, 20 Jul 2021 00:49:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT025.mail.protection.outlook.com (10.13.177.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4331.21 via Frontend Transport; Tue, 20 Jul 2021 00:49:31 +0000
Received: from atma2.hitronhub.home (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 19 Jul
 2021 19:49:30 -0500
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Peter Zijlstra <peterz@infradead.org>, Daniel Vetter <daniel@ffwll.ch>,
 <roman.li@amd.com>, <sunpeng.li@amd.com>
Subject: [PATCH v3 4/4] drm/amd/display: Add DC_FP helper to check FPU state
Date: Mon, 19 Jul 2021 20:49:14 -0400
Message-ID: <20210720004914.3060879-5-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210720004914.3060879-1-Rodrigo.Siqueira@amd.com>
References: <20210720004914.3060879-1-Rodrigo.Siqueira@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 17383591-646b-4e89-c404-08d94b183ca2
X-MS-TrafficTypeDiagnostic: DM5PR12MB2534:
X-Microsoft-Antispam-PRVS: <DM5PR12MB2534349504AC330764F480F198E29@DM5PR12MB2534.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tXbKHiAmBBCdfYSrvQIkZe4bzoK+Zwcw8YQC3xguwitYCfFbXfuMscsGZh8EkspZxV+zCWcag8iva39XaU7hCzMcOiW8IRa5U8YVWSIYZHk6rE9yYuguX7WsxlCro3lNxiMzQRmmdXGS/yRLEdKeZm5hB5A1Opqkp5PbwZrB8NmtMgIpGsJhRAmvNicckPS7zvsSMF49fsHNgKtmAvvdGeWRdWUhR0TErpOGqd+r8PT9D729E1T1jxmLoPlsWjscNMeK035sSwcyKsbCaA1CNAO+++n20apXKm6MT2YaMTmeXjAZsZpiLPN7hu5as/+HarPo5Ymwhfux7glDq7L54PMuvr+5kLtME5QhlTs72vI467j97+HuQutD/WnQzsienlI0kqgGi8sza65W7sOnx0yu9exQA/soR2KZPBrXSdIuUrQX5+suwPyWqGqnnzuxY6FusvXIpOjUOGz40pj4DCq86jNg6TBEWrMvuILKfxJhUT3t0FaiUHnbr10XyXUZ4vJExiPXXlT3xFSn75i89JC3vA5OnAyd6M+hTLQRi/EBzWbmVRYiKF+SDTsiddF4X9UoOOL9qEuSrq6/tGAx3pPcO4VPgpeYjzj2cBYnrPeZ/Uk54ghY9YCNC2Lxgh04udwSTqHwr5h5Dn1WBEBJpV241T6deWZxWPhJEusBS+MT9LHAxIKXcGA9FppDzgk3rEDKixFuHJa7uf03dhMOCDf+g6R/lLTAKTZbb95VeLo=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(316002)(5660300002)(6636002)(2906002)(54906003)(4326008)(508600001)(110136005)(336012)(1076003)(83380400001)(82310400003)(66574015)(426003)(81166007)(6666004)(47076005)(86362001)(2616005)(70586007)(70206006)(8936002)(186003)(36756003)(356005)(8676002)(16526019)(36860700001)(26005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 00:49:31.7724 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17383591-646b-4e89-c404-08d94b183ca2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT025.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2534
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
Cc: Anson Jacob <Anson.Jacob@amd.com>, dri-devel@lists.freedesktop.org,
 Hersen Wu <hersenxs.wu@amd.com>, amd-gfx@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
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

Changes cince V2 (Christian):
- Do not use this_cpu_* between get/put_cpu_ptr().
- In the kernel documentation, better describe restrictions.
- Make dc_assert_fp_enabled trigger the ASSERT message.

Changes since V1:
- Remove fp_enable variables
- Rename dc_is_fp_enabled to dc_assert_fp_enabled
- Replace wrong variable type

Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Anson Jacob <Anson.Jacob@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Hersen Wu <hersenxs.wu@amd.com>
Cc: Aric Cyr <aric.cyr@amd.com>
Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/dc_fpu.c    | 19 +++++++++++++++++++
 .../gpu/drm/amd/display/amdgpu_dm/dc_fpu.h    |  1 +
 .../drm/amd/display/dc/dcn20/dcn20_resource.c |  2 ++
 .../drm/amd/display/dc/fpu_operations/dcn2x.c | 18 ++++++++++++++++++
 4 files changed, 40 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
index d0d3e8a34db5..107e1c50576e 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
@@ -41,6 +41,25 @@
 
 static DEFINE_PER_CPU(int, fpu_recursion_depth);
 
+/**
+ * dc_assert_fp_enabled - Check if FPU protection is enabled
+ *
+ * This function tells if the code is already under FPU protection or not. A
+ * function that works as an API for a set of FPU operations can use this
+ * function for checking if the caller invoked it after DC_FP_START(). For
+ * example, take a look at dcn2x.c file.
+ */
+inline void dc_assert_fp_enabled(void)
+{
+	int *pcpu, depth = 0;
+
+	pcpu = get_cpu_ptr(&fpu_recursion_depth);
+	depth = *pcpu;
+	put_cpu_ptr(&fpu_recursion_depth);
+
+	ASSERT(depth > 1);
+}
+
 /**
  * dc_fpu_begin - Enables FPU protection
  * @function_name: A string containing the function name for debug purposes
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h
index fb54983c5c60..b8275b397920 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h
@@ -27,6 +27,7 @@
 #ifndef __DC_FPU_H__
 #define __DC_FPU_H__
 
+void dc_assert_fp_enabled(void);
 void dc_fpu_begin(const char *function_name, const int line);
 void dc_fpu_end(const char *function_name, const int line);
 
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
index f99b09643a52..d0b34c7f99dc 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
@@ -2355,7 +2355,9 @@ int dcn20_populate_dml_pipes_from_context(
 	}
 
 	/* populate writeback information */
+	DC_FP_START();
 	dc->res_pool->funcs->populate_dml_writeback_from_context(dc, res_ctx, pipes);
+	DC_FP_END();
 
 	return pipe_cnt;
 }
diff --git a/drivers/gpu/drm/amd/display/dc/fpu_operations/dcn2x.c b/drivers/gpu/drm/amd/display/dc/fpu_operations/dcn2x.c
index 95a0b89302a9..3ea90090264c 100644
--- a/drivers/gpu/drm/amd/display/dc/fpu_operations/dcn2x.c
+++ b/drivers/gpu/drm/amd/display/dc/fpu_operations/dcn2x.c
@@ -43,6 +43,22 @@
  *    that deals with FP register is contained within this call.
  * 3. All function that needs to be accessed outside this file requires a
  *    public interface that not uses any FPU reference.
+ * 4. Developers **must not** use DC_FP_START/END in this file, but they need
+ *    to ensure that the caller invokes it before access any function available
+ *    in this file. For this reason, public functions in this file must invoke
+ *    dc_assert_fp_enabled();
+ *
+ * Let's expand a little bit more the idea in the code pattern. To fully
+ * isolate FPU operations in a single place, we must avoid situations where
+ * compilers spill FP values to registers due to FP enable in a specific C
+ * file. Note that even if we isolate all FPU functions in a single file and
+ * call its interface from other files, the compiler might enable the use of
+ * FPU before we call DC_FP_START. Nevertheless, it is the programmer's
+ * responsibility to invoke DC_FP_START/END in the correct place. To highlight
+ * situations where developers forgot to use the FP protection before calling
+ * the DC FPU interface functions, we introduce a helper that checks if the
+ * function is invoked under FP protection. If not, it will trigger a kernel
+ * warning.
  */
 
 void dcn20_populate_dml_writeback_from_context(struct dc *dc,
@@ -51,6 +67,8 @@ void dcn20_populate_dml_writeback_from_context(struct dc *dc,
 {
 	int pipe_cnt, i;
 
+	dc_assert_fp_enabled();
+
 	for (i = 0, pipe_cnt = 0; i < dc->res_pool->pipe_count; i++) {
 		struct dc_writeback_info *wb_info = &res_ctx->pipe_ctx[i].stream->writeback_info[0];
 
-- 
2.25.1

