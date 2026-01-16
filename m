Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D101D2B576
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 05:25:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2CEE10E7E5;
	Fri, 16 Jan 2026 04:25:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="cMNVDF39";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010000.outbound.protection.outlook.com [52.101.85.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A981B10E7E5;
 Fri, 16 Jan 2026 04:25:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vf80Wy0S8njQqCW3Q2y3alYISzhLIEcSmBaRCYhwnPeR68rFj/rHWhxyaO2kFnYGYTk2q3GFhRFs8lruzt/pF5urUGvfClUsxLsZ1JFm47rEPJ0c8Lq4xeFkOIXXczPCw0EWr39pd9mq9iHVxNVC7dPty4YLiDQPzFvuxExRhuFlr9ZGMuBAeSCm0/R7Dl2HlzXTRabyVj5XHG7kVKUCLChvrfKh3UvK8ncmQQWC2PQrOoF3iJtgwXthY05y5G+ppKfVjD7P7q9texXphAiYxtOuueC1PTGWsHRwByJjE0hnqFZmJVNV/ucDAJDzZWXst8Q5KwSRyOPtSbIwo8TpZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=49uKfNCblPIbuAaIumNUQfnpfJGhQ6JmPFcix/5b4L8=;
 b=wWvt0CzLfNFdegLyd6JHvYw98rYBxG6/gsOC8XLmTv+lTkVKlWm4KIxEiDGIJJPTTgcYKrCfNKWh3mW5Bs3JhRFmrOg6+RSRjggGfxwo4bQWVSCiWi1QWdrMmQgP+Jh5z0CujZhBGgp9Qvj9ujr60GJDc7v6yjL2Z5fGBCabL+u7o70Ah0QHCU0LekWBoD0RJzYFat5FARCapi3HypOfrO7KU1uURp2ZELGMWRIGhM1vQ3ptG+q1EA6doI651sG8h7XXm+E8lrCYFfvQoH/pIIZe1CLeTD72gcs2Gfqh/Ez6GNi+g6nzH+umGbVtahUVWrSkRRn6PrB1g2PfsYroTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=49uKfNCblPIbuAaIumNUQfnpfJGhQ6JmPFcix/5b4L8=;
 b=cMNVDF39ji1jsuL0vXhvD8kXiAuWBzAPjtN5dCjuyzkkdd+rmTBiPnvn4rAs+WxjGCUzfhDbgg1n7uvEhi/F2STW3N4E/r//23RrHC+6h2QxsNq83Ez1vC+814lu7ciJGoBtABPIxOZ4DQQfx7RvN4KqgASTI8W4gS7guWAYZhLfSamqfW+MLCN4w9wgY0WQTeNTB+DNCXUOzvopsKqGyQQE28zzXD0mrZxSH9ArAIkjsq3SN9v1z9VFKfB4CgTCJtOesKbDRYRKJ4iJ+7/jLLYi+lBC7MAcwJxmhJRUWP/1ADD5rW6954/URN0jSNLWeqM/vNJb5ELHktAZLFz7vg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH0PR12MB8800.namprd12.prod.outlook.com (2603:10b6:510:26f::12)
 by LV3PR12MB9188.namprd12.prod.outlook.com (2603:10b6:408:19b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 04:25:24 +0000
Received: from PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d]) by PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d%4]) with mapi id 15.20.9520.003; Fri, 16 Jan 2026
 04:25:24 +0000
From: Yury Norov <ynorov@nvidia.com>
To: Steven Rostedt <rostedt@goodmis.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Christophe Leroy <chleroy@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, Ingo Molnar <mingo@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 David Laight <david.laight@runbox.com>, Petr Pavlu <petr.pavlu@suse.com>,
 Andi Shyti <andi.shyti@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Daniel Gomez <da.gomez@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-modules@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org
Cc: Yury Norov <ynorov@nvidia.com>,
 "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
Subject: [PATCH v5 6/6] tracing: move tracing declarations from kernel.h to a
 dedicated header
Date: Thu, 15 Jan 2026 23:25:09 -0500
Message-ID: <20260116042510.241009-7-ynorov@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260116042510.241009-1-ynorov@nvidia.com>
References: <20260116042510.241009-1-ynorov@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0240.namprd03.prod.outlook.com
 (2603:10b6:408:f8::35) To PH0PR12MB8800.namprd12.prod.outlook.com
 (2603:10b6:510:26f::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR12MB8800:EE_|LV3PR12MB9188:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ea75a62-1f90-4e6d-136a-08de54b744fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7416014|10070799003|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nG1AHkiCyRfaCsw1gIJ40CZU5fmj84GDNfIKQRPEF20l/W/4HXRMg5YV74s1?=
 =?us-ascii?Q?2Hi8uejwiF0sPfkQgTzIKQB6YQMMZhcNsFicbe86pPnjsax2Y0hCWmPOxH+P?=
 =?us-ascii?Q?WSYd/kG2rsehnmCiQRBQLXZsO5lKe6XSGjwqIhO9W4cJh2ON15eAts4cpghY?=
 =?us-ascii?Q?0ZTMFwpjNirXA39BLk3BNE1/ktZBdeIEbKH05klzh8TqNL5ZehTmTLJGI8Sj?=
 =?us-ascii?Q?cnYiU8wYq7JM/xp4nHWg07hu2jhC4fhgRdH878LPspXpJ/9vXPts3ul2l87L?=
 =?us-ascii?Q?T3/1MdzQFs6aMNDMfoytTz4o8KA1r0BbJVOQd8CBJkoF9oUsui8KuATNVnaL?=
 =?us-ascii?Q?GVl7RArjXHU49dwNkyYd1s8rNiC/qKUZMan7/hHR/UrJa0yOekKZeACvHkl0?=
 =?us-ascii?Q?ybpBGsaMSR9W8u/+VVV5WLVIy2C0HzLtrvc9B0078w5RZqcUEIwI0LfIOy9H?=
 =?us-ascii?Q?9QJAPRve0BGPgtRtxuespdhvynvXk7YJYSmelnGL4LsrLjZk8YHXyJBH0+Rq?=
 =?us-ascii?Q?MlqgbZIibU+7lq8AKtksekY20CfATh7Ns+imZ4bciub7Tg3TErS7+UC0U078?=
 =?us-ascii?Q?xGOpRVsT9rBDa/erAQV1B6VLM8fpvm8kXs4Qq0zrAsvuRh7vVlo0rLa/2jDg?=
 =?us-ascii?Q?rVNmiaZraKtRQ6M4zCKR7zX3eljVD28bFBdIB8AHqHA6sM8E3R2s1FaZrfIO?=
 =?us-ascii?Q?XA3oMUpidWRh6cvquu4imnAWLgP1jxuRmA+KOe9XLyO/ug/j0f0lISWYgN7o?=
 =?us-ascii?Q?apNbDXzC6F+0NVbua8/8yUKZotERdHo+quxJ/hy7NbtoP57knuNbqDYTuOFH?=
 =?us-ascii?Q?P4AinSvjCmxnQCSkqzyKvfslAMe3pcMRxXLLpMn9ObkgVz5ejU/j87L8dylo?=
 =?us-ascii?Q?JDv0z2BvjDB13GmVXZUPcUurn4mVXHH46IsZMoaeYtlTvYnrHQNDAuX64fo9?=
 =?us-ascii?Q?rpdw341DXetDG6tQqxUcgsBqDyyqssY+pSTCmtdGtnsrLsG6xnM28KS2d8hz?=
 =?us-ascii?Q?vOVxXz5jao0iSGcypbrU4Pl9MWY/ofkaelUc4qLSr45y4KW2yQPnobkk7f0G?=
 =?us-ascii?Q?J+gDX1WSJxsPAjIt7L7zJeb8wEgjmL2nydii99HgWWcPI3VQzqinaTl6X0o6?=
 =?us-ascii?Q?toFU9y0Xj7UzqggculXu96WlOQpY7FoUsOJAj3xLY+uiEOoRkfkl2z5A9FGt?=
 =?us-ascii?Q?3EEeYANXrquH70Jg0BLbiIUF6oAkb6htgpMY6Wu4UV9WvSTI4D2zwA52+uPe?=
 =?us-ascii?Q?1LFdXLtZF0/N7eP/M2/f29QU4vIp3NRqDzZN5FdoatBuTcchZj7j0PnrVOUN?=
 =?us-ascii?Q?ZsVgKtpZcaKRXtBaJOMuYXNwnF9mcoJFlKPd3l5sF1vjScgILrx30RCxjyfO?=
 =?us-ascii?Q?Jxd9ncE0X/cequrcwfIiEEMbNS47+BwgD7ekajti3S56891CldQhRbziof5W?=
 =?us-ascii?Q?0WYYF4G90LH4ulCEQMgwJle9G2B88J3voTaRjqPrG0uJ1zNcoPLnrfOr1N/G?=
 =?us-ascii?Q?8qlnFBrKeu0HAZMtzToZueNKtGGxcHUm+h8Rdptj8IU4L7ugVMfuWZhO5vX9?=
 =?us-ascii?Q?JqJSLY59fopkN0C5+Du4L3pLeo3a791N93aCMOfeBED/vPC/+WuALK7fj9w8?=
 =?us-ascii?Q?EQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR12MB8800.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7416014)(10070799003)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?obni4u9IV/bJzc11tsN3P1b4OMZ8D7gdescnZI5IshXZ9+zrhtUQ6JUPoK8R?=
 =?us-ascii?Q?NQ+YeV1NvbSvpZ/UAaiwDy7SMAd7YzO0qhE4GYbOUAOgFsz3NafjbMbJ0gJg?=
 =?us-ascii?Q?1wKKSwTZOsTlV01sw84LBpqZzqq9j9JQ01mVAg19SCK/zj5+j+wEAk9yLa7u?=
 =?us-ascii?Q?hWtpwaJJRpXVwzO+xZYfyJeNm2fZC9ud5nSVaQki1QjHpM14vIxZpO+8gBXz?=
 =?us-ascii?Q?9GSef/kv3gdmWc63jF4dJnezIA6t72YFMKTt6kkMd4lPJyMJl0LDv/e9VZn1?=
 =?us-ascii?Q?mAK9Ip8fLpwM36uwjmqt6MaqYRv3MxGGub43vMrTZ3MgR+2PEPiRkh+EiEOC?=
 =?us-ascii?Q?vO1qLd35L8du/rnHoetnCtnp7XUrBcEvE5cqEoINPR9/6fA8zib+/Jhbz+cn?=
 =?us-ascii?Q?uafJ9w+ea1E+rYRAsxP7W8SVms8xbcQd0Rp7phyBWjLJbZNKbY2ObjgKTEQK?=
 =?us-ascii?Q?yN+rKP6E2arA1dJwak+lXbyj4kO3xk2F0SF/RRArT+RLt1NDRMxJl+eVkyom?=
 =?us-ascii?Q?/07w2ijaaCiXsttyK0jAhqTywM4njY3eiWc8a6VSwBzCaQDyraaYuAiu6/O7?=
 =?us-ascii?Q?om7yjN98pTK+fAgryLr4POMskWxTdkIi2THVtUa2h5rsjyq3qhqvqL1fT5UV?=
 =?us-ascii?Q?taEcSxHHF6hVkgCVBMIyDyAbx5DMz28Rw0ZWwTA/I3ELlbpONts5xDCVgbvh?=
 =?us-ascii?Q?Gs565B2JOGdWVTj3rBrLc5fJINggH/yMlsZ2/G/nlDIQQDRO0P5XiQAIQamj?=
 =?us-ascii?Q?tjbKFEep1CiKP2eKBD9dNRqYFcdzWE+OKAdGPTs35sd5+d4n+/5YFHBbNF/H?=
 =?us-ascii?Q?z3GliEmhkOwaIwLiNqQb/xqsRcULmbME2WjoTSSanq3B6fHakD4W0jnCVHfg?=
 =?us-ascii?Q?lq1lUTDjIETcyUuxt4B0Yz2VR4AsbmsFatp4tzeurjcxl5ZBDd3fkWUiRWUj?=
 =?us-ascii?Q?6TAC0z+yUA1hF5hojFl9v4t4LJKWws8g4em/5wIbvMWwLMtxne6r5FS6KHoA?=
 =?us-ascii?Q?xUa82kCAICT6xCNXiKysi6yYBHkxA7oZqJH3WcsAie9QsOxO3FUB4QIfTVKo?=
 =?us-ascii?Q?5DO+BBGYkyZ7NZgOJ0iLF5EnqnGc8M2JO76ZjhWjf3sDuXOhaIL8lHQ8KO7j?=
 =?us-ascii?Q?a+LQbLuvIjHFbZuROtlhWgWNIj7F9mmvi+LjvX8e6aDKRApJWeiY21ptdmRo?=
 =?us-ascii?Q?GV8emoFcw4kn1MwaMMFQQPwCwssiyv/4fSH/YEC44vJuNZzGeMtHV9da0/IP?=
 =?us-ascii?Q?zoabmLT22gqmntV640tbWdt6jmtXelZF4dF7ATfdD5QANBAwc/ot4VyXnIfI?=
 =?us-ascii?Q?J4GRDpmuyq7KdGpF+7y7g7GpYykdPeaXR0ozHQKqP1US3Y2eCmQTtRevaA2Y?=
 =?us-ascii?Q?Ws+n9XPg7bapvgOVu3iAvMjq8FkcaSWNI3aiIg0c9wvcUfIqfBvxrc9j35Dp?=
 =?us-ascii?Q?7ot6y9ktPDcPs2Zi6WuPhF42ZDffyRNnZOZsjdT19BddR2jJFG3w0Vv4eRV7?=
 =?us-ascii?Q?TGKWhf4AEpznUDmd3M/+ctwTREIBT76C2SJrO2ipVNz9D5zVftIgEU7LWW66?=
 =?us-ascii?Q?WYZ0pkFRwBTcqrWEH6bSl5IH8Ut5lyIjj35Qhs5KuUh1L4oIOajwyN6Z87SX?=
 =?us-ascii?Q?1YJ2HnJMblETT0upNgZrFtJTyx904+HfgNzTJ40/zf2gxEyDCgxl7zVGCsX1?=
 =?us-ascii?Q?dz2VcC1/DoUeng1zmK1X04WazwSNYbnURUuSRGX+zy3TAyquTA7Vbz0AZYUT?=
 =?us-ascii?Q?7aubNa8r8s0sIGU68WVGE8BgswSPSxSqLKUU64KPu9F6KXHEH7dj?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ea75a62-1f90-4e6d-136a-08de54b744fd
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB8800.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 04:25:24.8318 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7SBbOHBn1D79Evj5xeDpMoJBIVOiybRvxCge2iA4a7UG/LuPgj9OfyO/v0idb4vVMtng4z19iiWDYEVSIdbcSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9188
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tracing is a half of the kernel.h in terms of LOCs, although it's
a self-consistent part. It is intended for quick debugging purposes
and isn't used by the normal tracing utilities.

Move it to a separate header. If someone needs to just throw a
trace_printk() in their driver, they will not have to pull all
the heavy tracing machinery.

This is a pure move.

Acked-by: Steven Rostedt <rostedt@goodmis.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Yury Norov <ynorov@nvidia.com>
---
 include/linux/kernel.h       | 196 +--------------------------------
 include/linux/trace_printk.h | 204 +++++++++++++++++++++++++++++++++++
 2 files changed, 205 insertions(+), 195 deletions(-)
 create mode 100644 include/linux/trace_printk.h

diff --git a/include/linux/kernel.h b/include/linux/kernel.h
index 4ee48fb10dec..a377335e01da 100644
--- a/include/linux/kernel.h
+++ b/include/linux/kernel.h
@@ -32,7 +32,7 @@
 #include <linux/build_bug.h>
 #include <linux/sprintf.h>
 #include <linux/static_call_types.h>
-#include <linux/instruction_pointer.h>
+#include <linux/trace_printk.h>
 #include <linux/util_macros.h>
 #include <linux/wordpart.h>
 
@@ -190,200 +190,6 @@ enum system_states {
 };
 extern enum system_states system_state;
 
-/*
- * General tracing related utility functions - trace_printk(),
- * tracing_on/tracing_off and tracing_start()/tracing_stop
- *
- * Use tracing_on/tracing_off when you want to quickly turn on or off
- * tracing. It simply enables or disables the recording of the trace events.
- * This also corresponds to the user space /sys/kernel/tracing/tracing_on
- * file, which gives a means for the kernel and userspace to interact.
- * Place a tracing_off() in the kernel where you want tracing to end.
- * From user space, examine the trace, and then echo 1 > tracing_on
- * to continue tracing.
- *
- * tracing_stop/tracing_start has slightly more overhead. It is used
- * by things like suspend to ram where disabling the recording of the
- * trace is not enough, but tracing must actually stop because things
- * like calling smp_processor_id() may crash the system.
- *
- * Most likely, you want to use tracing_on/tracing_off.
- */
-
-enum ftrace_dump_mode {
-	DUMP_NONE,
-	DUMP_ALL,
-	DUMP_ORIG,
-	DUMP_PARAM,
-};
-
-#ifdef CONFIG_TRACING
-void tracing_on(void);
-void tracing_off(void);
-int tracing_is_on(void);
-void tracing_snapshot(void);
-void tracing_snapshot_alloc(void);
-
-extern void tracing_start(void);
-extern void tracing_stop(void);
-
-static inline __printf(1, 2)
-void ____trace_printk_check_format(const char *fmt, ...)
-{
-}
-#define __trace_printk_check_format(fmt, args...)			\
-do {									\
-	if (0)								\
-		____trace_printk_check_format(fmt, ##args);		\
-} while (0)
-
-/**
- * trace_printk - printf formatting in the ftrace buffer
- * @fmt: the printf format for printing
- *
- * Note: __trace_printk is an internal function for trace_printk() and
- *       the @ip is passed in via the trace_printk() macro.
- *
- * This function allows a kernel developer to debug fast path sections
- * that printk is not appropriate for. By scattering in various
- * printk like tracing in the code, a developer can quickly see
- * where problems are occurring.
- *
- * This is intended as a debugging tool for the developer only.
- * Please refrain from leaving trace_printks scattered around in
- * your code. (Extra memory is used for special buffers that are
- * allocated when trace_printk() is used.)
- *
- * A little optimization trick is done here. If there's only one
- * argument, there's no need to scan the string for printf formats.
- * The trace_puts() will suffice. But how can we take advantage of
- * using trace_puts() when trace_printk() has only one argument?
- * By stringifying the args and checking the size we can tell
- * whether or not there are args. __stringify((__VA_ARGS__)) will
- * turn into "()\0" with a size of 3 when there are no args, anything
- * else will be bigger. All we need to do is define a string to this,
- * and then take its size and compare to 3. If it's bigger, use
- * do_trace_printk() otherwise, optimize it to trace_puts(). Then just
- * let gcc optimize the rest.
- */
-
-#define trace_printk(fmt, ...)				\
-do {							\
-	char _______STR[] = __stringify((__VA_ARGS__));	\
-	if (sizeof(_______STR) > 3)			\
-		do_trace_printk(fmt, ##__VA_ARGS__);	\
-	else						\
-		trace_puts(fmt);			\
-} while (0)
-
-#define do_trace_printk(fmt, args...)					\
-do {									\
-	static const char *trace_printk_fmt __used			\
-		__section("__trace_printk_fmt") =			\
-		__builtin_constant_p(fmt) ? fmt : NULL;			\
-									\
-	__trace_printk_check_format(fmt, ##args);			\
-									\
-	if (__builtin_constant_p(fmt))					\
-		__trace_bprintk(_THIS_IP_, trace_printk_fmt, ##args);	\
-	else								\
-		__trace_printk(_THIS_IP_, fmt, ##args);			\
-} while (0)
-
-extern __printf(2, 3)
-int __trace_bprintk(unsigned long ip, const char *fmt, ...);
-
-extern __printf(2, 3)
-int __trace_printk(unsigned long ip, const char *fmt, ...);
-
-/**
- * trace_puts - write a string into the ftrace buffer
- * @str: the string to record
- *
- * Note: __trace_bputs is an internal function for trace_puts and
- *       the @ip is passed in via the trace_puts macro.
- *
- * This is similar to trace_printk() but is made for those really fast
- * paths that a developer wants the least amount of "Heisenbug" effects,
- * where the processing of the print format is still too much.
- *
- * This function allows a kernel developer to debug fast path sections
- * that printk is not appropriate for. By scattering in various
- * printk like tracing in the code, a developer can quickly see
- * where problems are occurring.
- *
- * This is intended as a debugging tool for the developer only.
- * Please refrain from leaving trace_puts scattered around in
- * your code. (Extra memory is used for special buffers that are
- * allocated when trace_puts() is used.)
- *
- * Returns: 0 if nothing was written, positive # if string was.
- *  (1 when __trace_bputs is used, strlen(str) when __trace_puts is used)
- */
-
-#define trace_puts(str) ({						\
-	static const char *trace_printk_fmt __used			\
-		__section("__trace_printk_fmt") =			\
-		__builtin_constant_p(str) ? str : NULL;			\
-									\
-	if (__builtin_constant_p(str))					\
-		__trace_bputs(_THIS_IP_, trace_printk_fmt);		\
-	else								\
-		__trace_puts(_THIS_IP_, str);				\
-})
-extern int __trace_bputs(unsigned long ip, const char *str);
-extern int __trace_puts(unsigned long ip, const char *str);
-
-extern void trace_dump_stack(int skip);
-
-/*
- * The double __builtin_constant_p is because gcc will give us an error
- * if we try to allocate the static variable to fmt if it is not a
- * constant. Even with the outer if statement.
- */
-#define ftrace_vprintk(fmt, vargs)					\
-do {									\
-	if (__builtin_constant_p(fmt)) {				\
-		static const char *trace_printk_fmt __used		\
-		  __section("__trace_printk_fmt") =			\
-			__builtin_constant_p(fmt) ? fmt : NULL;		\
-									\
-		__ftrace_vbprintk(_THIS_IP_, trace_printk_fmt, vargs);	\
-	} else								\
-		__ftrace_vprintk(_THIS_IP_, fmt, vargs);		\
-} while (0)
-
-extern __printf(2, 0) int
-__ftrace_vbprintk(unsigned long ip, const char *fmt, va_list ap);
-
-extern __printf(2, 0) int
-__ftrace_vprintk(unsigned long ip, const char *fmt, va_list ap);
-
-extern void ftrace_dump(enum ftrace_dump_mode oops_dump_mode);
-#else
-static inline void tracing_start(void) { }
-static inline void tracing_stop(void) { }
-static inline void trace_dump_stack(int skip) { }
-
-static inline void tracing_on(void) { }
-static inline void tracing_off(void) { }
-static inline int tracing_is_on(void) { return 0; }
-static inline void tracing_snapshot(void) { }
-static inline void tracing_snapshot_alloc(void) { }
-
-static inline __printf(1, 2)
-int trace_printk(const char *fmt, ...)
-{
-	return 0;
-}
-static __printf(1, 0) inline int
-ftrace_vprintk(const char *fmt, va_list ap)
-{
-	return 0;
-}
-static inline void ftrace_dump(enum ftrace_dump_mode oops_dump_mode) { }
-#endif /* CONFIG_TRACING */
-
 /* Rebuild everything on CONFIG_DYNAMIC_FTRACE */
 #ifdef CONFIG_DYNAMIC_FTRACE
 # define REBUILD_DUE_TO_DYNAMIC_FTRACE
diff --git a/include/linux/trace_printk.h b/include/linux/trace_printk.h
new file mode 100644
index 000000000000..bb5874097f24
--- /dev/null
+++ b/include/linux/trace_printk.h
@@ -0,0 +1,204 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _LINUX_TRACE_PRINTK_H
+#define _LINUX_TRACE_PRINTK_H
+
+#include <linux/compiler_attributes.h>
+#include <linux/instruction_pointer.h>
+#include <linux/stddef.h>
+#include <linux/stringify.h>
+
+/*
+ * General tracing related utility functions - trace_printk(),
+ * tracing_on/tracing_off and tracing_start()/tracing_stop
+ *
+ * Use tracing_on/tracing_off when you want to quickly turn on or off
+ * tracing. It simply enables or disables the recording of the trace events.
+ * This also corresponds to the user space /sys/kernel/tracing/tracing_on
+ * file, which gives a means for the kernel and userspace to interact.
+ * Place a tracing_off() in the kernel where you want tracing to end.
+ * From user space, examine the trace, and then echo 1 > tracing_on
+ * to continue tracing.
+ *
+ * tracing_stop/tracing_start has slightly more overhead. It is used
+ * by things like suspend to ram where disabling the recording of the
+ * trace is not enough, but tracing must actually stop because things
+ * like calling smp_processor_id() may crash the system.
+ *
+ * Most likely, you want to use tracing_on/tracing_off.
+ */
+
+enum ftrace_dump_mode {
+	DUMP_NONE,
+	DUMP_ALL,
+	DUMP_ORIG,
+	DUMP_PARAM,
+};
+
+#ifdef CONFIG_TRACING
+void tracing_on(void);
+void tracing_off(void);
+int tracing_is_on(void);
+void tracing_snapshot(void);
+void tracing_snapshot_alloc(void);
+
+extern void tracing_start(void);
+extern void tracing_stop(void);
+
+static inline __printf(1, 2)
+void ____trace_printk_check_format(const char *fmt, ...)
+{
+}
+#define __trace_printk_check_format(fmt, args...)			\
+do {									\
+	if (0)								\
+		____trace_printk_check_format(fmt, ##args);		\
+} while (0)
+
+/**
+ * trace_printk - printf formatting in the ftrace buffer
+ * @fmt: the printf format for printing
+ *
+ * Note: __trace_printk is an internal function for trace_printk() and
+ *       the @ip is passed in via the trace_printk() macro.
+ *
+ * This function allows a kernel developer to debug fast path sections
+ * that printk is not appropriate for. By scattering in various
+ * printk like tracing in the code, a developer can quickly see
+ * where problems are occurring.
+ *
+ * This is intended as a debugging tool for the developer only.
+ * Please refrain from leaving trace_printks scattered around in
+ * your code. (Extra memory is used for special buffers that are
+ * allocated when trace_printk() is used.)
+ *
+ * A little optimization trick is done here. If there's only one
+ * argument, there's no need to scan the string for printf formats.
+ * The trace_puts() will suffice. But how can we take advantage of
+ * using trace_puts() when trace_printk() has only one argument?
+ * By stringifying the args and checking the size we can tell
+ * whether or not there are args. __stringify((__VA_ARGS__)) will
+ * turn into "()\0" with a size of 3 when there are no args, anything
+ * else will be bigger. All we need to do is define a string to this,
+ * and then take its size and compare to 3. If it's bigger, use
+ * do_trace_printk() otherwise, optimize it to trace_puts(). Then just
+ * let gcc optimize the rest.
+ */
+
+#define trace_printk(fmt, ...)				\
+do {							\
+	char _______STR[] = __stringify((__VA_ARGS__));	\
+	if (sizeof(_______STR) > 3)			\
+		do_trace_printk(fmt, ##__VA_ARGS__);	\
+	else						\
+		trace_puts(fmt);			\
+} while (0)
+
+#define do_trace_printk(fmt, args...)					\
+do {									\
+	static const char *trace_printk_fmt __used			\
+		__section("__trace_printk_fmt") =			\
+		__builtin_constant_p(fmt) ? fmt : NULL;			\
+									\
+	__trace_printk_check_format(fmt, ##args);			\
+									\
+	if (__builtin_constant_p(fmt))					\
+		__trace_bprintk(_THIS_IP_, trace_printk_fmt, ##args);	\
+	else								\
+		__trace_printk(_THIS_IP_, fmt, ##args);			\
+} while (0)
+
+extern __printf(2, 3)
+int __trace_bprintk(unsigned long ip, const char *fmt, ...);
+
+extern __printf(2, 3)
+int __trace_printk(unsigned long ip, const char *fmt, ...);
+
+/**
+ * trace_puts - write a string into the ftrace buffer
+ * @str: the string to record
+ *
+ * Note: __trace_bputs is an internal function for trace_puts and
+ *       the @ip is passed in via the trace_puts macro.
+ *
+ * This is similar to trace_printk() but is made for those really fast
+ * paths that a developer wants the least amount of "Heisenbug" effects,
+ * where the processing of the print format is still too much.
+ *
+ * This function allows a kernel developer to debug fast path sections
+ * that printk is not appropriate for. By scattering in various
+ * printk like tracing in the code, a developer can quickly see
+ * where problems are occurring.
+ *
+ * This is intended as a debugging tool for the developer only.
+ * Please refrain from leaving trace_puts scattered around in
+ * your code. (Extra memory is used for special buffers that are
+ * allocated when trace_puts() is used.)
+ *
+ * Returns: 0 if nothing was written, positive # if string was.
+ *  (1 when __trace_bputs is used, strlen(str) when __trace_puts is used)
+ */
+
+#define trace_puts(str) ({						\
+	static const char *trace_printk_fmt __used			\
+		__section("__trace_printk_fmt") =			\
+		__builtin_constant_p(str) ? str : NULL;			\
+									\
+	if (__builtin_constant_p(str))					\
+		__trace_bputs(_THIS_IP_, trace_printk_fmt);		\
+	else								\
+		__trace_puts(_THIS_IP_, str);				\
+})
+extern int __trace_bputs(unsigned long ip, const char *str);
+extern int __trace_puts(unsigned long ip, const char *str);
+
+extern void trace_dump_stack(int skip);
+
+/*
+ * The double __builtin_constant_p is because gcc will give us an error
+ * if we try to allocate the static variable to fmt if it is not a
+ * constant. Even with the outer if statement.
+ */
+#define ftrace_vprintk(fmt, vargs)					\
+do {									\
+	if (__builtin_constant_p(fmt)) {				\
+		static const char *trace_printk_fmt __used		\
+		  __section("__trace_printk_fmt") =			\
+			__builtin_constant_p(fmt) ? fmt : NULL;		\
+									\
+		__ftrace_vbprintk(_THIS_IP_, trace_printk_fmt, vargs);	\
+	} else								\
+		__ftrace_vprintk(_THIS_IP_, fmt, vargs);		\
+} while (0)
+
+extern __printf(2, 0) int
+__ftrace_vbprintk(unsigned long ip, const char *fmt, va_list ap);
+
+extern __printf(2, 0) int
+__ftrace_vprintk(unsigned long ip, const char *fmt, va_list ap);
+
+extern void ftrace_dump(enum ftrace_dump_mode oops_dump_mode);
+#else
+static inline void tracing_start(void) { }
+static inline void tracing_stop(void) { }
+static inline void trace_dump_stack(int skip) { }
+
+static inline void tracing_on(void) { }
+static inline void tracing_off(void) { }
+static inline int tracing_is_on(void) { return 0; }
+static inline void tracing_snapshot(void) { }
+static inline void tracing_snapshot_alloc(void) { }
+
+static inline __printf(1, 2)
+int trace_printk(const char *fmt, ...)
+{
+	return 0;
+}
+static __printf(1, 0) inline int
+ftrace_vprintk(const char *fmt, va_list ap)
+{
+	return 0;
+}
+static inline void ftrace_dump(enum ftrace_dump_mode oops_dump_mode) { }
+#endif /* CONFIG_TRACING */
+
+#endif
-- 
2.43.0

