Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 279E2350021
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 14:25:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51B4F6EA7E;
	Wed, 31 Mar 2021 12:25:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2087.outbound.protection.outlook.com [40.107.236.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC30F6EA74;
 Wed, 31 Mar 2021 12:25:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d/Rxos9NbnSAhNKgNjjCB17R5z14t+3Q7wJnPqu2Mb6ZysVWwhHcNCA5WOtDSXsKAwN9BNxVb3gF/kVNpud5K+f+rVmNSa7rUC72BLuNmA4qc0rwa0xBlFZLYzl5U3aj9/C/ERyqaEqXyr+cv0CZJzvmnMgv2jvEjSstLMTDplp6ZMVywruuATicfDPhh51WuuifP0mAVmx1nrgFUFQv7AJ1yubtvttbVSGMa2q/NuNOxd9aEbl/g+MGV4AkaiSB0LJfvpC3ha2GRDunoX0CzTlrGBdW4sHqrO2RNoDmebgxLvOHm3bzMqRCaEF5uh/NJfoPW6BWSCBXdobnG6pUqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9y5wbRCtLQJpHx8pVo/WUMaSNk17spzJQ0rddFRwD1A=;
 b=KX7KXtYKbzfOkSpOtOt1/+84V/e/P+g1+h1jfyVSxmRTBwoVfMHcl65ompy0bspKIR5VotD7jakEs34KCdELzmoThGJVTAAJhjmwIXfaD5dzVf5c5d+VdoTRESR5hWCmFxRRmX6qpadKA+8YHNBQXT9Z1nDtxnO6SGtm4Z+FxovCnsAXnIIU6VYfd3hUy12PNN8b7KAvOUb2H9EAoBxLJy3mg3FobDX0+pRfePAcUGjxjGNAqCWLeIRUJacHCPsVF12HXE/O1UrNDl550FRWC/EPgLh61WRvVp26IOC+wG1FDzO5CrGgYnFHeIF8/SKdzcExqWVJvQY+XsRx3WqnjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9y5wbRCtLQJpHx8pVo/WUMaSNk17spzJQ0rddFRwD1A=;
 b=blji3G0SIx50WRI9eFMbYOxoDHlNM5c38dsT8/WcPgADwbBrcTlDksX0nFafbKGwaKfuq/0u2xvuvIo1FkknYcp4AI6sKpGYsBwD3nsOkY9p8S6SD54c5furU0EUdt2fpph7IVC1fEd9zJXVA0pWSUTL2Yz3Rq6Hp41EcatWRKI=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB2601.namprd12.prod.outlook.com (2603:10b6:5:45::27) by
 DM6PR12MB2937.namprd12.prod.outlook.com (2603:10b6:5:181::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.27; Wed, 31 Mar 2021 12:25:23 +0000
Received: from DM6PR12MB2601.namprd12.prod.outlook.com
 ([fe80::3d2c:5edf:5d51:4101]) by DM6PR12MB2601.namprd12.prod.outlook.com
 ([fe80::3d2c:5edf:5d51:4101%7]) with mapi id 15.20.3977.033; Wed, 31 Mar 2021
 12:25:23 +0000
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Harry Wentland <harry.wentland@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, Peter Zijlstra <peterz@infradead.org>,
 aric.cyr@amd.com
Subject: [PATCH 3/4] drm/amd/display: Add ref count control for FPU utilization
Date: Wed, 31 Mar 2021 08:25:01 -0400
Message-Id: <20210331122502.1031073-4-Rodrigo.Siqueira@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 27778832-082f-4a72-43be-08d8f4400ebc
X-MS-TrafficTypeDiagnostic: DM6PR12MB2937:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB29377A6B42C30930873E7196987C9@DM6PR12MB2937.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:138;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4zrQZ85agqKy9QOo7ZP7BHBQ6uFGXPuTMbEkScAZAtg/NJSI4tKw/deJmKL40NgJbC1UNBTpGvluRDwOBiMYfq7TT4nZQBJuCOFnsIVG+DIAVfG55GMxCyuP05i6qvGxKGiEvNdk1xK1m5RlzhhnwOMzb+6Hq101YyrTqzAX5vYgayb1Risub/ludmw+MN1cfpZXWOOF8LIua2pMKh+JhVny6tnmzgPyxDl/EY4rCa7X/lSE8NrDTlI6dMy3cjx4yhvPV+WdMDCAxgwByBvEPWn244f9OkioTQgi7t3Bwk7us8U8mnNOoIxIoxbhMhL5Q5jkbn43GlqGxTEZASucnNHzb+Q2BCL/oV+FWE7c6cZrsxIoOtLKUnSNLznkzcbD/QhEE6y6lWzCtrSawOXelRgzE8ik4n5LPAbt54NtCPdcXE8nCQ++YjLbxVkEiB4Bgfhsljz01K1UeDYHsaAdWZ49Yq3vAaDYY/5xHzfvsqSg0ND/sK13GUqNq1kdMy7P6pzXEs1uvf80vqrXgXJNmLUf2jj2r//Fs3zskZEbJdOB5ibn0YMMxZdRYlf4jyuQppmEPA3JP1JE/7YRvK0iPrq+CGPYHM49R2vo25JANHaxLjn6Hy5/hl9YlZ8wWy4bUkdFOcDn31GZDv3mYfwoTx9ASoL1gfjH14eGXWiovRo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2601.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(376002)(366004)(136003)(39860400002)(316002)(38100700001)(2906002)(6636002)(6666004)(4326008)(5660300002)(66946007)(36756003)(8936002)(83380400001)(478600001)(66556008)(66476007)(6486002)(8676002)(186003)(16526019)(6512007)(52116002)(1076003)(2616005)(110136005)(86362001)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?PbaEqm9n6xIFnUPui/397BFeE9UzZ2Z16AqmIRZejZb5laJajClQJe8HHZoa?=
 =?us-ascii?Q?bP7GSAnYIHtUFe/Os9lx/dzQUlHstAqGZjvF45d3oU42iut/+plhBTnw4e2z?=
 =?us-ascii?Q?CdtyC5QFyB6CsEXrKCAhkNc1MzjG1BYgDqDnvRuAFNkr66kHCwcTPVrVOY4T?=
 =?us-ascii?Q?jF7kLUb95M4AXs146w23rkWvN2Tgm5TakXK63NGwePE+oMeUlsYjYxVDTOgG?=
 =?us-ascii?Q?WsBsW/cj77sasOY7fc6xjuhBseiQstihpWqQOQTeLq2KZE4XuiZDTsJ0hQz8?=
 =?us-ascii?Q?94lowSv+wL60xy89Qk3JBDGuygfjtD8p1ppfF6JipoeXAwI2BGWt+YK3Ggvy?=
 =?us-ascii?Q?CAktfOzPTQzcrDJw0lAD/6B3vPr8wmDgXf2tYjRV4eTnth8Ic5AQI1jh9r3J?=
 =?us-ascii?Q?XaY2zcMFU8FYhkqKqkNKYjnnfm8pC8VawkqMNDhf3FwDKun14IwDzQr5brIb?=
 =?us-ascii?Q?G83R0I07r40lnhGXQ7mMRuepnJRVVPhLXpUAtn+p9de2XDO4APV+VLCjvzeE?=
 =?us-ascii?Q?cEljsPdWsIcombjoRemCd0fx30KTMlJl8L6xhmRshJLaDz8M/SsSqZkdfsdD?=
 =?us-ascii?Q?DE/tI/gVSzw/jwUt09CXwBGIMr4PabhaywGs65VLNlfoZU+HiKzwW+7ZPuwn?=
 =?us-ascii?Q?LcBaiZSDwbqzxe6f4RMrODEfuBTsM/eBFCnJZx7Regd8gNYhJHnaspUb7kBi?=
 =?us-ascii?Q?yiRQSGhJQoopmV9dSam21ERFwyEERWinvW9bCVlSQttt2Jx/qPCsvkmsjvTq?=
 =?us-ascii?Q?jZtfHgyPFhHo15HNnf0F9rx6qlkFBBYC59GzLOWOACrgJXLKS4o7G74sYzPb?=
 =?us-ascii?Q?xrQ+XM//kGTnoVL96iLXVUeQPEpyZIHcmqnrzsN7ThI03OhMrlrrDwZyXs5S?=
 =?us-ascii?Q?DAuuIo+VA/HA3Fq0SWFwnEcHck4cznlKlpoFJQAEp+2TTuAgvpNLQ8uoEhG/?=
 =?us-ascii?Q?kbB1u9vb8EPezCLDhIjednHr2ZxVx3oiqz+WXHHFC+jMcwuaWubCAf7JtLO+?=
 =?us-ascii?Q?CdDDsjxBBTowyQNCadlwGbzGuSYUHqgc8T1EEXN3uc49DDdQ852+dWxLWZMK?=
 =?us-ascii?Q?U0XcMY2Ces4xD5Y68SnaY5lm/kOxnyk2yCKyYxD5OKN1cwIC7QN2ssC7GgKd?=
 =?us-ascii?Q?0QCYSGj/xaSBhEc62o/x1xw3ewTouYIR0jtQaA97Kq5H8HQt0N5g58a2kbqH?=
 =?us-ascii?Q?8q0EBWaj2GbBry6PtOvS77z1OkDqJKS6w1f+2KR4IjqTiRIwBAtYYr0CbzEm?=
 =?us-ascii?Q?+xMEI39gIBsyTO8Fm4+08J5hSYfZiDmRysYjhLtuRgngstnDuPqK7jSo8qtH?=
 =?us-ascii?Q?zTmQx0Kjndfs0ZsqPWi79t/bX2nYxuIPcCjs6RyAwcVw+4X1NDOTvZqSjMdA?=
 =?us-ascii?Q?6WRU2q6NkMgYlVNCBsf+8cp9tYJ+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27778832-082f-4a72-43be-08d8f4400ebc
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2601.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2021 12:25:23.7147 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Le5suaRCvYiNPPJjuFn3EbsmSBkW2IVLR48FVpkHKc4Zlts+0nIHYqD2quRNr2IWeDud808kziwE/zS9w7N93Q==
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

DC invokes DC_FPU_START/END in multiple parts of the code; this can
create a situation where we invoke this FPU operation in a nested way.
For avoiding this situation, this commit adds a mechanism where
dc_fpu_begin/end manages the access to kernel_fpu_begin/end.

Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Acked-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_trace.h   | 13 ++++---
 .../gpu/drm/amd/display/amdgpu_dm/dc_fpu.c    | 34 ++++++++++++++++---
 drivers/gpu/drm/amd/display/dc/dc_trace.h     |  4 +--
 3 files changed, 40 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
index 230bb12c405e..cd4f0d3f37fb 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
@@ -638,23 +638,26 @@ TRACE_EVENT(amdgpu_refresh_rate_track,
 );
 
 TRACE_EVENT(dcn_fpu,
-	    TP_PROTO(bool begin, const char *function, const int line),
-	    TP_ARGS(begin, function, line),
+	    TP_PROTO(bool begin, const char *function, const int line, const int ref_count),
+	    TP_ARGS(begin, function, line, ref_count),
 
 	    TP_STRUCT__entry(
 			     __field(bool, begin)
 			     __field(const char *, function)
 			     __field(int, line)
+			     __field(int, ref_count)
 	    ),
 	    TP_fast_assign(
 			   __entry->begin = begin;
 			   __entry->function = function;
 			   __entry->line = line;
+			   __entry->ref_count = ref_count;
 	    ),
-	    TP_printk("%s()+%d: %s",
+	    TP_printk("%s: ref_count: %d: %s()+%d:",
+		      __entry->begin ? "begin" : "end",
+		      __entry->ref_count,
 		      __entry->function,
-		      __entry->line,
-		      __entry->begin ? "begin" : "end"
+		      __entry->line
 	    )
 );
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
index ff34007509de..5dcefe193523 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
@@ -28,6 +28,19 @@
 
 #include <asm/fpu/api.h>
 
+/**
+ * DOC: Overview
+ *
+ * DC core uses FPU operations in multiple parts of the code, which requires a
+ * more specialized way to manage these areas' entrance. To fulfill this
+ * requirement, we created some wrapper functions that encapsulate
+ * kernel_fpu_begin/end to better fit our need in the display component. In
+ * summary, in this file, you can find functions related to FPU operation
+ * management.
+ */
+
+static DEFINE_PER_CPU(atomic_t, fpu_ref);
+
 /**
  * dc_fpu_begin - Enables FPU protection
  * @function_name: A string containing the function name for debug purposes
@@ -40,8 +53,14 @@
  */
 void dc_fpu_begin(const char *function_name, const int line)
 {
-	TRACE_DCN_FPU(true, function_name, line);
-	kernel_fpu_begin();
+	int ret;
+	atomic_t *local_fpu_ref = this_cpu_ptr(&fpu_ref);
+
+	ret = atomic_inc_return(local_fpu_ref);
+	TRACE_DCN_FPU(true, function_name, line, ret);
+
+	if (ret == 1)
+		kernel_fpu_begin();
 }
 
 /**
@@ -56,6 +75,13 @@ void dc_fpu_begin(const char *function_name, const int line)
  */
 void dc_fpu_end(const char *function_name, const int line)
 {
-	TRACE_DCN_FPU(false, function_name, line);
-	kernel_fpu_end();
+
+	int ret;
+	atomic_t *local_fpu_ref = this_cpu_ptr(&fpu_ref);
+
+	ret = atomic_dec_return(local_fpu_ref);
+	TRACE_DCN_FPU(false, function_name, line, ret);
+
+	if (!ret)
+		kernel_fpu_end();
 }
diff --git a/drivers/gpu/drm/amd/display/dc/dc_trace.h b/drivers/gpu/drm/amd/display/dc/dc_trace.h
index d598ba697e45..c711797e5c9e 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_trace.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_trace.h
@@ -38,5 +38,5 @@
 #define TRACE_DCN_CLOCK_STATE(dcn_clocks) \
 	trace_amdgpu_dm_dc_clocks_state(dcn_clocks)
 
-#define TRACE_DCN_FPU(begin, function, line) \
-	trace_dcn_fpu(begin, function, line)
+#define TRACE_DCN_FPU(begin, function, line, ref_count) \
+	trace_dcn_fpu(begin, function, line, ref_count)
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
