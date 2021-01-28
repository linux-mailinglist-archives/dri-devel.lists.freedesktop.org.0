Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B53C9306E4D
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 08:14:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 566226E8E9;
	Thu, 28 Jan 2021 07:13:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2083.outbound.protection.outlook.com [40.107.93.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 012D06E0D6;
 Thu, 28 Jan 2021 07:13:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OsJFLOlgpcaPTtlC2gbBFKFSSDAqrdiA4WaZhYKwndIghMphtzNIUSDWppdSo8fduziqH4Jc7hwSzreLVLfi2Y8E7vdxHSoqXZzr/Vcvyak8dLn2fIi5vfOl+ln5tMhSPikNml2hBGjho4UueFTueHu11SXNH1vK6KC0TX5BRuJBAOJ1WqBJjY1kBsJhGHDNFk6H/X5C4U9WN4sg5c8xkwlFP1PCC+zOpFpb4FtLbO/NnHheLS70KNqdxzXH9nXWj/DPLSKcqbR/8/y7jSJW60fmmMwTSRTZyPRVyNmfo/2ML0iV75ypiqysR4+nb24XNSmgQm9f3Das9gp64j/Z+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GVJwrrsVqNs5J+D+L953s05SuHhnmBsC3KYlWzAZhvk=;
 b=i/VKUUFdIN6Y2KuTyXp6BPtylCih3kzRlLIIhju+FIpO+dwnNGqGs2B78NciwnKJ9e9TpB56/5WJW8Wl3YWxnnvQrDsOZM0Dz0bs3xgZlZbtPlFFkmgRXot99uiYye2sM9y3IdEhUuPSwjJlfR2ab0N1RNkD7lJ51asvz8vQpvdAse5FQuILcCrNsCGPy2BN7r4jnWwdZJhcy7ymfEzsR4OM6y4YE7Ow0ZaAoUdjHoMMwGZ4A5cwP4kksLnh7wqhZUZuUmvPbQ2Vv/iSAgbUIPSndNkIwBkO8vt1AWz96aWsFkMuPPzDJTSsoyH7fLVxNJohf4Ro/ai/Pv+HaheCvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GVJwrrsVqNs5J+D+L953s05SuHhnmBsC3KYlWzAZhvk=;
 b=qNkSbCWX1i14OW3hTjGfoKmphfAV2w4NeU1Jw0VIuKr4RBe3Cah/rkpAaXry+RJwzNaP1VicrsnAxCRmyFX5OecWigLJ6Gtth6KZh2VpW5iHaJ+L8pwoR2h33bEaEm4/3ykmXxJbZhllPUn5ODsPNSi9Yzg+qshv99KQtvmqqC0=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3022.namprd12.prod.outlook.com (2603:10b6:208:ce::32)
 by MN2PR12MB3280.namprd12.prod.outlook.com (2603:10b6:208:ad::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Thu, 28 Jan
 2021 07:13:51 +0000
Received: from MN2PR12MB3022.namprd12.prod.outlook.com
 ([fe80::709e:b0ae:fbde:fcc6]) by MN2PR12MB3022.namprd12.prod.outlook.com
 ([fe80::709e:b0ae:fbde:fcc6%7]) with mapi id 15.20.3784.019; Thu, 28 Jan 2021
 07:13:51 +0000
From: Kevin Wang <kevin1.wang@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [RFC PATCH 1/3] drm/ttm: add ttm bo trace event support
Date: Thu, 28 Jan 2021 15:13:20 +0800
Message-Id: <20210128071322.24313-2-kevin1.wang@amd.com>
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
 15.20.3805.17 via Frontend Transport; Thu, 28 Jan 2021 07:13:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9d7dfdbb-9b37-4878-5b57-08d8c35c433c
X-MS-TrafficTypeDiagnostic: MN2PR12MB3280:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3280A4D3A826677BC629C358A2BA9@MN2PR12MB3280.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qqKfLvzFuuDtvvH6B3O63co/kCwvTcG0KwrO/CVIQhX3bNVaRQFz+md9nY9SzYcLnRQzKTa1w+Kr6GN9Fqp5f/st0nDf6WHK9v5zrI42wSaEhI3pYxA7RWWXX6Jjf7YKr3bMZC66I52N+GGnJ3xkkgdQxrDIqcWfFZs2ViwcV1tDg4qJ4nlguzDyphkTDUm0Cs26lWqFG4NhWrFwwEDRiI1Hy2sQ4y+tB0f9VxlmF5Ol+TYJOIwEPiEDYAEQXZnD603zuZRtvEskD6tD5+4uXGyF2v8lqf8QJHdYfgkuvFNNsQ5uFUEulQoLOmyL8mnpS9xgNd/7eNHw0wkjs/mtM+TPlPR0BVCQW/OtHddNEI5EDJeWNjDPvV4u+wgzR4rrm2PxPVQPM6DnxmMCCaP/5uvOQ5Zo0ZOCLzxukURIHr+z/ywGyUZW+Yn3luiomy746e3T23MgN45EVMnjkC7ijcnrC3/kHFO4De4vGsxtrAxkD3LXC0c2trfBxwIVvltvtJ5JzSHwzD69wzAg6ltTSw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3022.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(39860400002)(396003)(366004)(376002)(186003)(450100002)(66946007)(2616005)(66556008)(66476007)(6486002)(26005)(316002)(8676002)(5660300002)(36756003)(8936002)(83380400001)(1076003)(16526019)(2906002)(86362001)(478600001)(7696005)(6666004)(956004)(52116002)(30864003)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?9dNfhjqkNo05H5f0IFnKs8alms+a0QzoupJDUQX3fZRn7xarIqA5NN6/5aO6?=
 =?us-ascii?Q?lrrB4soaDcSfAeiVoqc45lH3N66b+MOwaWG3KeiV3cL7jTB2KuO+mrBDSv7j?=
 =?us-ascii?Q?G7P+05B4arZE/ayMm1TI+6K1d59vQMFRToB5Yn3+q1X7tuwHYje3qENmXsrS?=
 =?us-ascii?Q?QzP3l//9xtO5STR4dO8N37qI/AOR/KC25vGiflQQdchI2PZR+WVFcqTMrOmK?=
 =?us-ascii?Q?lmG7f489it4iNyJFJn8eFEsBFwxT6FePu6NuPborDx0uZ2Ur86wH2afkOKAU?=
 =?us-ascii?Q?Wb1wLKG9IA0wPkd8IgcwsNF6UfkBb+Nd/n22d7eiEqd9yZ+/e4DQO6gB5U6N?=
 =?us-ascii?Q?JI6IrVWTu419A2uJ2RhC2TEnKynBnajkUKlsJreazsrl64QQMKip1BClvISQ?=
 =?us-ascii?Q?tzhmxRi8giJgtZhcqpEFQevKCPHmr0lRhkYFbosdc7K6xWEB+4T8bmjSrGAE?=
 =?us-ascii?Q?IeJeOUAuP0ZVBo9ZWVTtdTKgrloTLcr0zaugpc63c6MH9QlKvM2jWfBr8Jhs?=
 =?us-ascii?Q?SONkk0YLqF2i+HaFp4Es5DrSfyZndWBYi6LGecpSQLrg8bOubgV6H5ZHHMGT?=
 =?us-ascii?Q?WkCSX7bgZcMbrWiHGpwJMXdiOFqAZ8A6YrtxRWrUGVrYkN8Dcgk8e1/DJGAJ?=
 =?us-ascii?Q?/cOqtgMHZGKD4HYuiZkU96O85I9WH0u/Scf+tx/WtcyNhnfHTbH72QZfLTmQ?=
 =?us-ascii?Q?ihBMBOIXhYZQuKTTaHynATPIjq0Sv6/e4YJ/NT0iCfXEP2oeSdNCtTibznfQ?=
 =?us-ascii?Q?qVlcR8rpkLUDObTEXd83XSHyUKGirJkxfqiPhkXKCqM5yP2aFqSURJkfF67F?=
 =?us-ascii?Q?ijjkpRUS/b/R8IcPl8jd8OnWuscCGMpo5p/5lP2EJEUYROhOCo0cWhrl0YoO?=
 =?us-ascii?Q?uRUEvjqpPrIHg82/RZtyemcJtnAdYIvZwKiNHsctuxZtP0HFgR6g5avLilDE?=
 =?us-ascii?Q?Vpeoh7BRiRbusVIGTUhnnEOko3cNaXDfGHk5qoolDjDqLYIOMADom4MClN6k?=
 =?us-ascii?Q?5zjQXuKyLqSEopkOh+0NsYAQ2BJeRlu4hhQJn2lFo6oMVWckivazcyRqrPb9?=
 =?us-ascii?Q?IExqeg/b?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d7dfdbb-9b37-4878-5b57-08d8c35c433c
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3022.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2021 07:13:50.8989 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7NnVmd4tsnfqagbYdV6nGUdx6fwQNzO5T+g+WxYoQIIDq9ChbfiFIOi+hKNbkKtR
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

add ttm bo related trace event support

trace events:
ttm:ttm_bo_add_mem_to_lru
ttm:ttm_bo_del_from_lru
ttm:ttm_bo_move_mem
ttm:ttm_bo_wait
ttm:ttm_bo_evict
ttm:ttm_bo_swapout
ttm:ttm_bo_device_init
ttm:ttm_bo_device_release
ttm:ttm_bo_init_reserved
ttm:ttm_bo_validate
ttm:ttm_bo_release

Signed-off-by: Kevin Wang <kevin1.wang@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c     |  23 +++
 drivers/gpu/drm/ttm/ttm_module.c |   3 +
 drivers/gpu/drm/ttm/ttm_trace.h  | 321 +++++++++++++++++++++++++++++++
 3 files changed, 347 insertions(+)
 create mode 100644 drivers/gpu/drm/ttm/ttm_trace.h

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index e3931e515906..074afd05aaa8 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -43,6 +43,8 @@
 #include <linux/atomic.h>
 #include <linux/dma-resv.h>
 
+#include "ttm_trace.h"
+
 static void ttm_bo_global_kobj_release(struct kobject *kobj);
 
 /**
@@ -143,6 +145,8 @@ static void ttm_bo_add_mem_to_lru(struct ttm_buffer_object *bo,
 	if (mem->placement & TTM_PL_FLAG_NO_EVICT)
 		return;
 
+	trace_ttm_bo_add_mem_to_lru(bo, mem);
+
 	man = ttm_manager_type(bdev, mem->mem_type);
 	list_add_tail(&bo->lru, &man->lru[bo->priority]);
 
@@ -167,6 +171,8 @@ static void ttm_bo_del_from_lru(struct ttm_buffer_object *bo)
 		notify = true;
 	}
 
+	trace_ttm_bo_del_from_lru(bo, notify);
+
 	if (notify && bdev->driver->del_from_lru_notify)
 		bdev->driver->del_from_lru_notify(bo);
 }
@@ -299,6 +305,8 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
 		}
 	}
 
+	trace_ttm_bo_move_mem(bo, mem, evict);
+
 	if (bdev->driver->move_notify)
 		bdev->driver->move_notify(bo, evict, mem);
 
@@ -542,6 +550,8 @@ static void ttm_bo_release(struct kref *kref)
 	size_t acc_size = bo->acc_size;
 	int ret;
 
+	trace_ttm_bo_release(bo);
+
 	if (!bo->deleted) {
 		ret = ttm_bo_individualize_resv(bo);
 		if (ret) {
@@ -668,6 +678,8 @@ static int ttm_bo_evict(struct ttm_buffer_object *bo,
 		ttm_resource_free(bo, &evict_mem);
 		goto out;
 	}
+
+	trace_ttm_bo_evict(bo, &evict_mem);
 	bo->evicted = true;
 out:
 	return ret;
@@ -1151,6 +1163,8 @@ int ttm_bo_validate(struct ttm_buffer_object *bo,
 
 	dma_resv_assert_held(bo->base.resv);
 
+	trace_ttm_bo_validate(bo);
+
 	/*
 	 * Remove the backing store if no placement is given.
 	 */
@@ -1263,6 +1277,8 @@ int ttm_bo_init_reserved(struct ttm_bo_device *bdev,
 	}
 	atomic_inc(&ttm_bo_glob.bo_count);
 
+	trace_ttm_bo_init_reserved(bo, size);
+
 	/*
 	 * For ttm_bo_type_device buffers, allocate
 	 * address space from the device.
@@ -1487,6 +1503,8 @@ int ttm_bo_device_release(struct ttm_bo_device *bdev)
 	if (!ret)
 		ttm_bo_global_release();
 
+	trace_ttm_bo_device_release(bdev);
+
 	return ret;
 }
 EXPORT_SYMBOL(ttm_bo_device_release);
@@ -1537,6 +1555,8 @@ int ttm_bo_device_init(struct ttm_bo_device *bdev,
 	list_add_tail(&bdev->device_list, &glob->device_list);
 	mutex_unlock(&ttm_global_mutex);
 
+	trace_ttm_bo_device_init(bdev);
+
 	return 0;
 }
 EXPORT_SYMBOL(ttm_bo_device_init);
@@ -1580,6 +1600,8 @@ int ttm_bo_wait(struct ttm_buffer_object *bo,
 
 	timeout = dma_resv_wait_timeout_rcu(bo->base.resv, true,
 						      interruptible, timeout);
+
+	trace_ttm_bo_wait(bo, interruptible, timeout);
 	if (timeout < 0)
 		return timeout;
 
@@ -1670,6 +1692,7 @@ int ttm_bo_swapout(struct ttm_bo_global *glob, struct ttm_operation_ctx *ctx)
 	 * anyone tries to access a ttm page.
 	 */
 
+	trace_ttm_bo_swapout(bo, i);
 	if (bo->bdev->driver->swap_notify)
 		bo->bdev->driver->swap_notify(bo);
 
diff --git a/drivers/gpu/drm/ttm/ttm_module.c b/drivers/gpu/drm/ttm/ttm_module.c
index 6ff40c041d79..8b70e8aebecb 100644
--- a/drivers/gpu/drm/ttm/ttm_module.c
+++ b/drivers/gpu/drm/ttm/ttm_module.c
@@ -35,6 +35,9 @@
 #include <drm/ttm/ttm_module.h>
 #include <drm/drm_sysfs.h>
 
+#define CREATE_TRACE_POINTS
+#include "ttm_trace.h"
+
 static DECLARE_WAIT_QUEUE_HEAD(exit_q);
 static atomic_t device_released;
 
diff --git a/drivers/gpu/drm/ttm/ttm_trace.h b/drivers/gpu/drm/ttm/ttm_trace.h
new file mode 100644
index 000000000000..7c5e55725e8e
--- /dev/null
+++ b/drivers/gpu/drm/ttm/ttm_trace.h
@@ -0,0 +1,321 @@
+/*
+ * Copyright 2021 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: Kevin Wang
+ */
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM ttm
+
+#if !defined(_TRACE_TTM_H_) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_TTM_H_
+
+#include <drm/ttm/ttm_bo_api.h>
+#include <drm/ttm/ttm_bo_driver.h>
+#include <drm/ttm/ttm_placement.h>
+#include <drm/ttm/ttm_module.h>
+#include <drm/ttm/ttm_page_alloc.h>
+#include <linux/types.h>
+#include <linux/tracepoint.h>
+
+#define TTM_PLACEMENT_FLAGS_TRACE \
+	{ TTM_PL_FLAG_SYSTEM,		"SYSTEM"	},\
+	{ TTM_PL_FLAG_TT,		"TT"		},\
+	{ TTM_PL_FLAG_VRAM,		"VRAM"		},\
+	{ TTM_PL_FLAG_PRIV,		"PRIV"		},\
+	{ TTM_PL_FLAG_CACHED,		"CACHED"	},\
+	{ TTM_PL_FLAG_UNCACHED,		"UNCACHED"	},\
+	{ TTM_PL_FLAG_WC,		"WC"		},\
+	{ TTM_PL_FLAG_CONTIGUOUS,	"CONTIGUOUS"	},\
+	{ TTM_PL_FLAG_NO_EVICT,		"NO_EVICT"	},\
+	{ TTM_PL_FLAG_TOPDOWN,		"TOPDOWN"	}
+
+#define __show_ttm_pl_flags(flags, mask)		\
+	(flags & mask) ? __print_flags(flags, "|",	\
+	TTM_PLACEMENT_FLAGS_TRACE			\
+	) : "none"
+
+#define show_ttm_pl_flags(flags)		\
+	__show_ttm_pl_flags(flags, ~0UL)
+
+#define show_ttm_pl_mem_flags(flags)		\
+	__show_ttm_pl_flags(flags, TTM_PL_MASK_MEM)
+
+
+TRACE_EVENT(ttm_bo_add_mem_to_lru,
+	    TP_PROTO(struct ttm_buffer_object *bo, struct ttm_resource *res),
+	    TP_ARGS(bo, res),
+	    TP_STRUCT__entry(
+			     __field(struct ttm_buffer_object *, bo)
+			     __field(unsigned long, size)
+			     __field(uint32_t, placement)
+			     __field(enum ttm_bo_type, bo_type)
+			     __field(uint32_t, mem_type)
+			     ),
+
+	    TP_fast_assign(
+			   __entry->bo = bo;
+			   __entry->bo_type = bo->type;
+			   __entry->size = bo->mem.size;
+			   __entry->placement = res->placement;
+			   __entry->mem_type = res->mem_type;
+			   ),
+
+	    TP_printk("bo:%p, size=%lx, bo_type=%d, mtype=%d, placement=%s(%x)",
+		      __entry->bo, __entry->size, __entry->bo_type, __entry->mem_type,
+		      show_ttm_pl_flags(__entry->placement), __entry->placement)
+);
+
+TRACE_EVENT(ttm_bo_del_from_lru,
+	    TP_PROTO(struct ttm_buffer_object *bo, bool notify),
+	    TP_ARGS(bo, notify),
+	    TP_STRUCT__entry(
+			     __field(struct ttm_buffer_object *, bo)
+			     __field(unsigned long, size)
+			     __field(uint32_t, placement)
+			     __field(enum ttm_bo_type, bo_type)
+			     __field(uint32_t, mem_type)
+			     __field(bool, notify)
+			     ),
+
+	    TP_fast_assign(
+			   __entry->bo = bo;
+			   __entry->bo_type = bo->type;
+			   __entry->size = bo->mem.size;
+			   __entry->placement = bo->mem.placement;
+			   __entry->mem_type = bo->mem.mem_type;
+			   __entry->notify = notify;
+			   ),
+
+	    TP_printk("bo:%p, size=%lx, bo_type=%d, mtype=%d, placement=%s(%x), notify=%s",
+		      __entry->bo, __entry->size, __entry->bo_type, __entry->mem_type,
+		      show_ttm_pl_flags(__entry->placement), __entry->placement,
+		      __entry->notify ? "true" : "false")
+);
+
+TRACE_EVENT(ttm_bo_move_mem,
+	    TP_PROTO(struct ttm_buffer_object *bo, struct ttm_resource *res, bool evict),
+	    TP_ARGS(bo, res, evict),
+	    TP_STRUCT__entry(
+			     __field(struct ttm_buffer_object *, bo)
+			     __field(unsigned long, start)
+			     __field(unsigned long, size)
+			     __field(uint32_t, old_placement)
+			     __field(uint32_t, new_placement)
+			     __field(uint32_t, old_mem_type)
+			     __field(uint32_t, new_mem_type)
+			     __field(bool, evict)
+			     ),
+
+	    TP_fast_assign(
+			   __entry->bo = bo;
+			   __entry->start = res->start;
+			   __entry->size = res->size;
+			   __entry->old_placement = bo->mem.placement;
+			   __entry->new_placement = res->placement;
+			   __entry->old_mem_type = bo->mem.mem_type;
+			   __entry->new_mem_type = res->mem_type;
+			   __entry->evict = evict;
+			   ),
+
+	    TP_printk("bo:%p, start=%lx, size=%lx, mtype: %d -> %d, placement: %s(%x) -> %s(%x), evict=%s",
+		      __entry->bo, __entry->start, __entry->size,
+		      __entry->old_mem_type, __entry->new_mem_type,
+		      show_ttm_pl_flags(__entry->old_placement), __entry->old_placement,
+		      show_ttm_pl_flags(__entry->new_placement), __entry->new_placement,
+		      __entry->evict ? "true" : "false")
+);
+
+TRACE_EVENT(ttm_bo_wait,
+	    TP_PROTO(struct ttm_buffer_object *bo, bool interruptible, long timeout),
+	    TP_ARGS(bo, interruptible, timeout),
+	    TP_STRUCT__entry(
+			     __field(struct ttm_buffer_object *, bo)
+			     __field(bool, interruptible)
+			     __field(long, timeout)
+			     ),
+
+	    TP_fast_assign(
+			   __entry->bo = bo;
+			   __entry->interruptible = interruptible;
+			   __entry->timeout = timeout;
+			   ),
+
+	    TP_printk("bo:%p, interruptible=%s, timeout=%ld", __entry->bo,
+		      __entry->interruptible ? "true" : "false", __entry->timeout)
+);
+
+TRACE_EVENT(ttm_bo_evict,
+	    TP_PROTO(struct ttm_buffer_object *bo, struct ttm_resource *res),
+	    TP_ARGS(bo, res),
+	    TP_STRUCT__entry(
+			     __field(struct ttm_buffer_object *, bo)
+			     __field(enum ttm_bo_type, bo_type)
+			     __field(unsigned long, size)
+			     __field(uint32_t, old_placement)
+			     __field(uint32_t, new_placement)
+			     __field(uint32_t, old_mem_type)
+			     __field(uint32_t, new_mem_type)
+			     ),
+
+	    TP_fast_assign(
+			   __entry->bo = bo;
+			   __entry->bo_type = bo->type;
+			   __entry->size = res->size;
+			   __entry->old_placement = bo->mem.placement;
+			   __entry->new_placement = res->placement;
+			   __entry->old_mem_type = bo->mem.mem_type;
+			   __entry->new_mem_type = res->mem_type;
+			   ),
+
+	    TP_printk("bo:%p, size=%lx, bo_type=%d, mtype: %d -> %d, placement: %s(%x) -> %s(%x)",
+		      __entry->bo, __entry->size, __entry->bo_type,
+		      __entry->old_mem_type, __entry->new_mem_type,
+		      show_ttm_pl_flags(__entry->old_placement), __entry->old_placement,
+		      show_ttm_pl_flags(__entry->new_placement), __entry->new_placement)
+
+);
+
+TRACE_EVENT(ttm_bo_swapout,
+	    TP_PROTO(struct ttm_buffer_object *bo, int priority),
+	    TP_ARGS(bo, priority),
+	    TP_STRUCT__entry(
+			     __field(struct ttm_buffer_object *, bo)
+			     __field(enum ttm_bo_type, bo_type)
+			     __field(unsigned long, size)
+			     __field(uint32_t, placement)
+			     __field(uint32_t, mem_type)
+			     __field(int, priority)
+			     ),
+
+	    TP_fast_assign(
+			   __entry->bo = bo;
+			   __entry->priority = priority;
+			   __entry->bo_type = bo->type;
+			   __entry->size = bo->mem.size;
+			   __entry->placement = bo->mem.placement;
+			   __entry->mem_type = bo->mem.mem_type;
+			   ),
+
+	    TP_printk("bo:%p, size=%lx, bo_type=%d, mtype=%d, placement=%s(%x), prio=%d",
+		      __entry->bo, __entry->size, __entry->bo_type, __entry->mem_type,
+		      show_ttm_pl_flags(__entry->placement), __entry->placement,
+		      __entry->priority)
+);
+
+TRACE_EVENT(ttm_bo_device_init,
+	    TP_PROTO(struct ttm_bo_device *bdev),
+	    TP_ARGS(bdev),
+	    TP_STRUCT__entry(
+			     __field(struct ttm_bo_device *, bdev)
+			     __field(struct ttm_bo_driver *, driver)
+			     __field(bool, need_dma32)
+			     ),
+
+	    TP_fast_assign(
+			   __entry->bdev = bdev;
+			   __entry->driver = bdev->driver;
+			   __entry->need_dma32 = bdev->need_dma32;
+			   ),
+
+	    TP_printk("bdev:%p, driver=%p, need_dma32=%s", __entry->bdev, __entry->driver,
+		      __entry->need_dma32 ? "true" : "false")
+);
+
+TRACE_EVENT(ttm_bo_device_release,
+	    TP_PROTO(struct ttm_bo_device *bdev),
+	    TP_ARGS(bdev),
+	    TP_STRUCT__entry(
+			     __field(struct ttm_bo_device *, bdev)
+			     ),
+
+	    TP_fast_assign(
+			   __entry->bdev = bdev;
+			   ),
+
+	    TP_printk("bdev:%p", __entry->bdev)
+);
+
+TRACE_EVENT(ttm_bo_init_reserved,
+	    TP_PROTO(struct ttm_buffer_object *bo, unsigned long size),
+	    TP_ARGS(bo, size),
+	    TP_STRUCT__entry(
+			     __field(struct ttm_bo_device *, bdev)
+			     __field(struct ttm_buffer_object *, bo)
+			     __field(enum ttm_bo_type, bo_type)
+			     __field(uint32_t, page_alignment)
+			     __field(uint32_t, placement)
+			     __field(unsigned long, size)
+			     __field(size_t, acc_size)
+			     ),
+
+	    TP_fast_assign(
+			   __entry->bo = bo;
+			   __entry->bdev = bo->bdev;
+			   __entry->bo_type = bo->type;
+			   __entry->placement = bo->mem.placement;
+			   __entry->page_alignment = bo->mem.page_alignment;
+			   __entry->size = size;
+			   __entry->acc_size = bo->acc_size;
+			   ),
+
+	    TP_printk("bo:%p, bdev=%p, bo_type=%d, %s(%x) size=%lx, accsize=%lx, alignment=%d",
+		      __entry->bo, __entry->bdev, __entry->bo_type,
+		      show_ttm_pl_flags(__entry->placement), __entry->placement,
+		      __entry->size, __entry->acc_size, __entry->page_alignment)
+);
+
+TRACE_EVENT(ttm_bo_validate,
+	    TP_PROTO(struct ttm_buffer_object *bo),
+	    TP_ARGS(bo),
+	    TP_STRUCT__entry(
+			     __field(struct ttm_buffer_object *, bo)
+			     ),
+
+	    TP_fast_assign(
+			   __entry->bo = bo;
+			   ),
+
+	    TP_printk("bo:%p", __entry->bo)
+);
+
+TRACE_EVENT(ttm_bo_release,
+	    TP_PROTO(struct ttm_buffer_object *bo),
+	    TP_ARGS(bo),
+	    TP_STRUCT__entry(
+			     __field(struct ttm_buffer_object *, bo)
+			     ),
+
+	    TP_fast_assign(
+			   __entry->bo = bo;
+			   ),
+
+	    TP_printk("bo:%p", __entry->bo)
+);
+
+#endif
+
+#undef TRACE_INCLUDE_PATH
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/ttm
+#undef TRACE_INCLUDE_FILE
+#define TRACE_INCLUDE_FILE ttm_trace
+
+/* This part must be outside protection */
+#include <trace/define_trace.h>
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
