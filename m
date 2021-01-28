Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C83B7306E4F
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 08:14:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF7C46E8EC;
	Thu, 28 Jan 2021 07:13:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750054.outbound.protection.outlook.com [40.107.75.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A8FB6E8EC;
 Thu, 28 Jan 2021 07:13:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DRGtLiM1UBxBOSMJVIN8Kz787FV+nuQ4lAk/SwoaIrMDoP419gTRQyoGcFEUqN9Xvfjb/ZftITED0DyOj3DcrPeX/CBF92h5yBUPc/JZB2FoMzK2GVAhO93kEmUgAg+aGzLpxFLWLjkzrXwaKxJK+CPIQVVT0LNW76KY9o01oCfyGVP2gRtx1sMZDghpVSb+FnFB9sXLnCTnEHWyDQ5Ri71s2XQBpgv4OuctZr1Gu9ry7PwIPlqgvyUkSS9KhVH3K2+Zm9uJwt5FS4yk3rLuX+dbpEZcXLyVoaXZREpS8DtW2pjEgeqmRKgtMmX0Gvu2R0G2VAbnhfUtumsi0ALjiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K9/I1puIorNi8RY54XsNMOz/PlxSnp6AyjYtDNjnqto=;
 b=js2HCYkhLBhomodqI65Md1hKQr+nQ7uH7RRApu+kXOu5d0SOBHwPBDVDhrjsFNR3OaTRv00Q8YE4rMCPm2S9VUPzzVH0IK+5AFlqA/htUiDFRkqjidp+WeobpA0JlOJkAn/G55rHt8ET5AM8QyoWSRbgMZ3SQyOYl5or7XYwAVU4Yu84l4qmlQEqYUsml2iHq1kpSOhQr4hPmpnvJVo2eWUb8d5oJ9/I3E58jLPF3MXYQmRjHwInh9gFem7GCfo7/NslSOltFIZmQtsbgvasDqBHgNWvYAOdPOJbj4G/XBENMSCa5X+q/kd4ANBVl7v2sDJLKRPt2TcgFjnkWVVtvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K9/I1puIorNi8RY54XsNMOz/PlxSnp6AyjYtDNjnqto=;
 b=TupMh8F93IPzANYKqdEGfX5z3orYgA1AQ8KTZ+P3Q/E0JJrbLkSZfFrL5L2kqkOjtt75blUcCoe2G0Er2g0+n9PDDG9+QkR6g2k8z+QJIjpz7uF0ki+iqWTkjcMTEpYUh9l7R0dfmfMWATvhU+F/Z0Wr0fGvUuTb/P9+DWsOA5U=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3022.namprd12.prod.outlook.com (2603:10b6:208:ce::32)
 by MN2PR12MB3280.namprd12.prod.outlook.com (2603:10b6:208:ad::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Thu, 28 Jan
 2021 07:13:55 +0000
Received: from MN2PR12MB3022.namprd12.prod.outlook.com
 ([fe80::709e:b0ae:fbde:fcc6]) by MN2PR12MB3022.namprd12.prod.outlook.com
 ([fe80::709e:b0ae:fbde:fcc6%7]) with mapi id 15.20.3784.019; Thu, 28 Jan 2021
 07:13:55 +0000
From: Kevin Wang <kevin1.wang@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [RFC PATCH 3/3] drm/ttm: add ttm mem trace event support
Date: Thu, 28 Jan 2021 15:13:22 +0800
Message-Id: <20210128071322.24313-4-kevin1.wang@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210128071322.24313-1-kevin1.wang@amd.com>
References: <20210128071322.24313-1-kevin1.wang@amd.com>
X-Originating-IP: [58.247.170.245]
X-ClientProxiedBy: HKAPR04CA0010.apcprd04.prod.outlook.com
 (2603:1096:203:d0::20) To MN2PR12MB3022.namprd12.prod.outlook.com
 (2603:10b6:208:ce::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from MZ01-CE0.amd.com (58.247.170.245) by
 HKAPR04CA0010.apcprd04.prod.outlook.com (2603:1096:203:d0::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.17 via Frontend Transport; Thu, 28 Jan 2021 07:13:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 670bde82-359f-4668-2e8a-08d8c35c462e
X-MS-TrafficTypeDiagnostic: MN2PR12MB3280:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3280571E7A7020065ECBEFE1A2BA9@MN2PR12MB3280.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:76;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7VNlfMpjYxhTXuXjh7ixir7hU16XVmDAdP6H7tpLIHvcXcySBbx43GgTAnon8DaPAYw+uCA23dmx+E2XcPJ30P/OPULewS/UVcfDgph8zPk8JDA53ZR+5rLKl9SyA6imHjdoNs4G7Q6KMoNfajItXFvq9agcDKkQJIByy6K+ps550T/8tgnXkVEhLoCheWzkTb/2CgzR2pimYszcvoI7TuRxM5rKbppr6M66mPF+XqkKUcGWPYzITjCRAUo9/2Moo2kx6Dqb7qC1GyEvMGJ7nWez8cVuJiOkDs8B4+3d14SXV0YtQ2sE0QicSoMS+u/So/AX2S+XkX47m1TELu0gk5uELqJXxgSKi4i6RCcuN1pAYvURSxYt5e9rUUduHuuTdFbEFilVhm/cYLz11ycTjIUju9juj41uRiBsyb8iw63lpBtyvUkHO4OQ2GRlU3ooo8qLcTBaBZoy7EqlnaCcdqAiTx7FHb2T9sLN7jAyCPD8MhRRlpDbKfs9BH0b6WL+jA+xnd9srxEs+lrhwVJiKQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3022.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(39860400002)(396003)(366004)(376002)(186003)(450100002)(66946007)(2616005)(66556008)(66476007)(6486002)(26005)(316002)(8676002)(5660300002)(36756003)(8936002)(83380400001)(1076003)(16526019)(2906002)(86362001)(478600001)(7696005)(6666004)(956004)(52116002)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?bxyiRPDW4l7RJfGiPC/OmjV23vvour1nmyzw+RnSKrY+0+YCWPxqu9ZMshbQ?=
 =?us-ascii?Q?wzTilU0pBGBiIXNSejWjSNmjymzgzNsSh7rdOys5OTbpKLTJNnePIYVK0VtE?=
 =?us-ascii?Q?WQrGEHgMHEwraSKBKq0MzdtY2QNbfqeCRvR+DYhGn6RZoS1knOvmyrLGBCp4?=
 =?us-ascii?Q?821la7OaRlOARCNvBCxlOTTEbtuPpLcuQ220HcI7G9ET2NMeqMfoL3CueYad?=
 =?us-ascii?Q?R1h8ETfRqJAGM50ITnyAj/vcU2lBl4P/TRXY/p7MYSGC8DSm4HLOgAFbWFEJ?=
 =?us-ascii?Q?xfbTAT05HFcIQjHnQej/hoEA6+Mc7C7CXIu/KJBsLM3NcP6iYeI11Yeajd9s?=
 =?us-ascii?Q?sdP9gy2m2aadGJLOvCEdUFab7MZBAz7LokIcoHn/sLks6IJFwLftTmdd+7UJ?=
 =?us-ascii?Q?4gyL5JwwzgdAVm3MOzvjoBt2EOFuuyJ1NUkCVMUn4VFByqlzvMb7EAB0F91I?=
 =?us-ascii?Q?n5eCwPt046svS6FUWs0ps9LkQmfEp5n7cEl5YcNaOTeoxoMjwYJe2i2Ty1k+?=
 =?us-ascii?Q?m4Q11W+4i99cl+s6AjX7JLxTBzz5Smd9isxEYSVxQn2PuiXnH3oBv2SHECiQ?=
 =?us-ascii?Q?KVOc6MYVu90WgISTNwGYiIZbvOPxgJSsRKIQVjoaVllMBzhPyXM3WC7ceWiM?=
 =?us-ascii?Q?82HLNu1oGaav8I5kChZ3nUPZHIqTAybpts000k/a3DjEXKQG6IC86WFOwtLt?=
 =?us-ascii?Q?yJqiP8JcQUUbjuMhtp41PM37ZMfSyb2nLSQKzMTUe97HzFvyzYiCJYhG0UFD?=
 =?us-ascii?Q?0DfddTGhaMMfOk+ztjEZNBH5+049I5RwviEjxE/s/BXkgp3tot26IuzNTfDG?=
 =?us-ascii?Q?GMy2LJEEhNbQp2r0t8Bjo5b97KQqmS82XXibY3eBzgRbEkwROXI3xCKrv7OQ?=
 =?us-ascii?Q?kIm17rgC0ooddtqZtar2fcJMkerXRo8TXY7xxtGEnq5rLNYcTUfuFKtcaa9U?=
 =?us-ascii?Q?4RMCkUoOap8IeUGhWn7mFVdkBQsr+U5B+D7hdgPL3y/t58M2oIH6/M48DrFs?=
 =?us-ascii?Q?C8+PJHJkPdqEBn1uviMscV9ItZZwuXkjWZJej/DH81zGzmbFYSARVe1A71Rg?=
 =?us-ascii?Q?MX/5OE/l?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 670bde82-359f-4668-2e8a-08d8c35c462e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3022.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2021 07:13:55.6393 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NfE1aqbspIILYwYMRlct2x8MW2F2aYDAv01tJGQcf3QGT28vEezG1MibArPYEeHn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3280
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
Cc: ray.huang@amd.com, christian.koenig@amd.com,
 Kevin Wang <kevin1.wang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

add ttm memory related trace event support

trace events:
ttm:ttm_shrink
ttm:ttm_mem_global_reserve
ttm:ttm_mem_global_free

Signed-off-by: Kevin Wang <kevin1.wang@amd.com>
---
 drivers/gpu/drm/ttm/ttm_memory.c |  7 ++++
 drivers/gpu/drm/ttm/ttm_trace.h  | 70 ++++++++++++++++++++++++++++++++
 2 files changed, 77 insertions(+)

diff --git a/drivers/gpu/drm/ttm/ttm_memory.c b/drivers/gpu/drm/ttm/ttm_memory.c
index acd63b70d814..27470b1f1f13 100644
--- a/drivers/gpu/drm/ttm/ttm_memory.c
+++ b/drivers/gpu/drm/ttm/ttm_memory.c
@@ -39,6 +39,8 @@
 #include <linux/slab.h>
 #include <linux/swap.h>
 
+#include "ttm_trace.h"
+
 #define TTM_MEMORY_ALLOC_RETRIES 4
 
 struct ttm_mem_global ttm_mem_glob;
@@ -272,6 +274,7 @@ static void ttm_shrink(struct ttm_mem_global *glob, bool from_wq,
 	int ret;
 
 	spin_lock(&glob->lock);
+	trace_ttm_shrink(from_wq, extra, ctx);
 
 	while (ttm_zones_above_swap_target(glob, from_wq, extra)) {
 		spin_unlock(&glob->lock);
@@ -518,6 +521,8 @@ static void ttm_mem_global_free_zone(struct ttm_mem_global *glob,
 		zone->used_mem -= amount;
 	}
 	spin_unlock(&glob->lock);
+	trace_ttm_mem_global_free(single_zone->name, amount,
+				  single_zone->used_mem, single_zone->max_mem);
 }
 
 void ttm_mem_global_free(struct ttm_mem_global *glob,
@@ -590,6 +595,8 @@ static int ttm_mem_global_reserve(struct ttm_mem_global *glob,
 	ret = 0;
 out_unlock:
 	spin_unlock(&glob->lock);
+	trace_ttm_mem_global_reserve(single_zone->name, amount,
+			      single_zone->used_mem, single_zone->max_mem);
 	ttm_check_swapping(glob);
 
 	return ret;
diff --git a/drivers/gpu/drm/ttm/ttm_trace.h b/drivers/gpu/drm/ttm/ttm_trace.h
index 9f7cc34b243b..e25b8a2c423c 100644
--- a/drivers/gpu/drm/ttm/ttm_trace.h
+++ b/drivers/gpu/drm/ttm/ttm_trace.h
@@ -388,6 +388,76 @@ TRACE_EVENT(ttm_bo_vm_access,
 		      __entry->offset, __entry->len, __entry->mem_type)
 );
 
+TRACE_EVENT(ttm_shrink,
+	    TP_PROTO(bool from_wq, uint64_t extra, struct ttm_operation_ctx *ctx),
+	    TP_ARGS(from_wq, extra, ctx),
+	    TP_STRUCT__entry(
+			     __field(bool, from_wq)
+			     __field(bool, interruptible)
+			     __field(bool, wait_gpu)
+			     __field(uint64_t, extra)
+			     ),
+
+	    TP_fast_assign(
+			   __entry->from_wq = from_wq;
+			   __entry->extra = extra;
+			   __entry->interruptible= ctx->interruptible;
+			   __entry->wait_gpu = !ctx->no_wait_gpu;
+			   ),
+
+	    TP_printk("ttm_shrink: from_wq=%s, interruptible=%s, wait_gpu=%s, extra=0x%llx(%lld)",
+		      __entry->from_wq ? "true" : "false",
+		      __entry->interruptible ? "true" : "false",
+		      __entry->wait_gpu? "true" : "false",
+		      __entry->extra, __entry->extra)
+);
+
+TRACE_EVENT(ttm_mem_global_reserve,
+	    TP_PROTO(const char *zone_name, uint64_t amount,
+		     uint64_t used_mem, uint64_t max_mem),
+	    TP_ARGS(zone_name, amount, used_mem, max_mem),
+	    TP_STRUCT__entry(
+			     __string(zone, zone_name)
+			     __field(uint64_t, amount)
+			     __field(uint64_t, used_mem)
+			     __field(uint64_t, max_mem)
+			     ),
+
+	    TP_fast_assign(
+			   __assign_str(zone, zone_name);
+			   __entry->amount = amount;
+			   __entry->used_mem = used_mem;
+			   __entry->max_mem = max_mem;
+			   ),
+
+	    TP_printk("zone:%s, amount=%lld, used=%lld/%lld",
+		      __get_str(zone), __entry->amount,
+		      __entry->used_mem, __entry->max_mem)
+);
+
+TRACE_EVENT(ttm_mem_global_free,
+	    TP_PROTO(const char *zone_name, uint64_t amount,
+		     uint64_t used_mem, uint64_t max_mem),
+	    TP_ARGS(zone_name, amount, used_mem, max_mem),
+	    TP_STRUCT__entry(
+			     __string(zone, zone_name)
+			     __field(uint64_t, amount)
+			     __field(uint64_t, used_mem)
+			     __field(uint64_t, max_mem)
+			     ),
+
+	    TP_fast_assign(
+			   __assign_str(zone, zone_name);
+			   __entry->amount = amount;
+			   __entry->used_mem = used_mem;
+			   __entry->max_mem = max_mem;
+			   ),
+
+	    TP_printk("zone:%s, amount=%lld, used=%lld/%lld",
+		      __get_str(zone), __entry->amount,
+		      __entry->used_mem, __entry->max_mem)
+);
+
 #endif
 
 #undef TRACE_INCLUDE_PATH
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
