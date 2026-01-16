Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D71D2B55F
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 05:25:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D53E710E7E0;
	Fri, 16 Jan 2026 04:25:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="rvGsLkTW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011047.outbound.protection.outlook.com [40.107.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4BCA10E0CE;
 Fri, 16 Jan 2026 04:25:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EVFDhRZR4d8iBCRerRhD0ChE7un/AwXx0ZavwBG81cOpunY2QmWGnBJ0Jb+dXdckxtpngzymYWK1rnB67v41kgQfyNqCbszq0YdTRENpVQPa6myvvGvYbOHUjpTSSlcJNLCWf+BhqLc814cUeVEg1N3JC8G0Xbd5UgaUYc+OJgzDFTLYRqYbG1sfaC4Noxk9m2axA+FjitNaG8es3cjTYgk6wHrsRJxAuefkMbehrwXwGB7KZDUaKasFta5Jk5CoH8xptvYrwkJLikfZlvOV2SAXciq7KfoROhF2H2gdHyoj0oGvp+BhTfMMRWF3Tf8cbhraLW6rp/wed8eCk1QECA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yov1Pi8MbNbUTubi/SC1PcUJkrHxPzst2GUMSIwemnE=;
 b=gZ/a2QIytFNUJ5/BDM2eVrWiuWZgDWOnAfJRykzidbqHZ3RwcWxFqUtX/qX229OYr91rK++FwL6YtXU24okBzsByhhMQ/5tOmmk5wcHHd1RZhzLfgKx3mKUTA47kZLErnwW8I45na/QdNNmgSp8jE5El2NIbQyp3i2g26uaG9XPGRUjzY8XHIkv96CrOKMXByAL2K6BMcuzwzmtFolzg03JXHFoFSEJHBKYECdalFjUltCCaVHdVF8sP22clVNsB2jfCtUcBuuKEJyNGPWyDALEwgxsWqMXC+Ii1SjSoPlGmmL7vhMgQuWPDrBrQryZWmrpM5SPWV7kDvUkZ1mpxvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yov1Pi8MbNbUTubi/SC1PcUJkrHxPzst2GUMSIwemnE=;
 b=rvGsLkTWPt4GW8xcM1FAqIXMAxdYDTEQg4Jk+8MkjX1p27vPrqtbsYpk7Zrf6qgcKeIqQX6DiXKy2eGQeP2SLQPp72dTphFILPst43cAbGVnORNAbtpi29v5NF8hNwkBONo9jM2t4D7U181j4TYcIApZglKZJCidHSF6r289oVOEnieF2jQlkRczB3V417T8p9rfpV35nlf1H6cfDiPX9bI2rTf98y4hy/SkVpdYOBuXOgyOjCh2z44NR6yNKaWiFTHe/JLxTQF9BNKheVFLJFpiAoaFswsIywhNbu9Xu0Z4n8AChWGOrb6r79xWFit/wJUhcd09B4RttPmOaB0FVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH0PR12MB8800.namprd12.prod.outlook.com (2603:10b6:510:26f::12)
 by LV3PR12MB9188.namprd12.prod.outlook.com (2603:10b6:408:19b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 04:25:16 +0000
Received: from PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d]) by PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d%4]) with mapi id 15.20.9520.003; Fri, 16 Jan 2026
 04:25:16 +0000
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
Subject: [PATCH v5 2/6] moduleparam: include required headers explicitly
Date: Thu, 15 Jan 2026 23:25:05 -0500
Message-ID: <20260116042510.241009-3-ynorov@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260116042510.241009-1-ynorov@nvidia.com>
References: <20260116042510.241009-1-ynorov@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0061.namprd03.prod.outlook.com
 (2603:10b6:408:fc::6) To PH0PR12MB8800.namprd12.prod.outlook.com
 (2603:10b6:510:26f::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR12MB8800:EE_|LV3PR12MB9188:EE_
X-MS-Office365-Filtering-Correlation-Id: c97778a2-ba33-4f08-b7d6-08de54b74024
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7416014|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9R4qvtqAf+DM92pVWxzXAFrTyIgT3gxibXeaR4pOsfRWcIW8+1Kp2FDEXeAT?=
 =?us-ascii?Q?i1oVs9IP8jTn4YY/SIeveGfu5tUYGxwBIfN6WYiB5Je4ApvGbdL6tMFT2DeU?=
 =?us-ascii?Q?uFhrXGkFc8e0uF9xX5/ioKUOjucifTkuma9fXSHPGHniQ6mmFN5ZThZIFj1M?=
 =?us-ascii?Q?FNg+Af79kDVr/rVSyZzrTnpQjdyn6OvJuiD0qMXbGy3WPaezvEstNX+fJbZ0?=
 =?us-ascii?Q?SDAgbXf9K/vovk0ga5MhOcOf0v7PTQuop3OWjRr5txPmsVql1SHUsn4Q2vf8?=
 =?us-ascii?Q?NyAWLIx8PsITWpwlvcd4mvLy2iGYyteDINnaL0Y0/eOASztwmkLPvXOmLPK1?=
 =?us-ascii?Q?XUwV0l9rT4+bdd2q9PB+r+wuHarZnpncVFcgNuhlsoAsntdGOLHHzquZ3mom?=
 =?us-ascii?Q?RyIWoXibKFnSzVENhGZknkVNXBd1onu7Ok6HowFUEjn0eRcoZ+FA1508qBo8?=
 =?us-ascii?Q?RC+3rXGdFCkFG6WAXF8ha0uHi5MRxMYNooqJMjHYOnYyxUhG5HtSByBtVdm/?=
 =?us-ascii?Q?/gl7j6vbjricH202jsISNlHEKCsK9kQq0makFv8/oejkllLm0bPxtFplQG3P?=
 =?us-ascii?Q?28qBoygAv8ubtKG0C1s6+omMTrr4C2EHm/RKdMlN/Q2fi581u3cdoG3eEtit?=
 =?us-ascii?Q?Txgwax1oWfS5HC5BIWLtjwZ1eHhO8LpZwaFLGCrvaF1AMwhdk3VUgUI0kF7H?=
 =?us-ascii?Q?lX3jGInmmICTHytzHfLVeSS5dofcN49YIaxQC+DIQVTXSqYvUq7eL3v+eNzQ?=
 =?us-ascii?Q?GkakVGnn35wOvSdZdebHTMClFTE4WhXrK3k3tzyjh6S/oyCDk2KOW0Nd4C7B?=
 =?us-ascii?Q?6nwOJNioDYGWAqzgFqxk7YKvZRsEg0vjqQyKl4CsK4yrYtQ2V425HLCeiGLR?=
 =?us-ascii?Q?7yQmiIKPC80IdN3P0imqC+wRSuSK6K56DzZkImjAuQjNSaNGomnr05Hsj1I+?=
 =?us-ascii?Q?OmqBs3ZpbhBITWRf8Qf+4MdKW4xT055VTdk3KE9ZtmafGbRt0EZ8/1ZzLXnW?=
 =?us-ascii?Q?XNifYK1arVEnA8DK4npTWNnKkSzueOGIk9IaggYjcf47PCDD6aMK5MxKNIFg?=
 =?us-ascii?Q?XmFVRyREblPcLDSvmUvXz6qmW23r2+brwYeOFXob/nWhMfjLWl4Dl+dQy1Et?=
 =?us-ascii?Q?Ce5w2LoXBekrjMNdoy6Z37Ymd33NmE5Zm02iDTtX7yox6SLxDcLwd+FoM0sw?=
 =?us-ascii?Q?yUmxJmVAgyyuxF3XnzjTAvBLu78GTDLdqXUdYy1wnNIElOpese+JlkKTNmeL?=
 =?us-ascii?Q?g6VxvOjZpND2AzQapjZHMGqOz0TArutfw02RCz///HrGe0Xr1CevSc2WjFRR?=
 =?us-ascii?Q?0ESIXvZ3qKyRBMsuH5rG1SDCkzS0vhkhhUUrLIxFsyP61En8X7iZfpdfprgH?=
 =?us-ascii?Q?4oufnWZUC5ezz/xZAQ6bniIBSVAyaIUmYqOoxtz+WaT0bA0aYlorxUYklrZT?=
 =?us-ascii?Q?DMCV9wXpZBwRVbXjkP/pWhe7upnJCmYg4sfk9/94eGoxMhZR0JA6GIaQ/aI7?=
 =?us-ascii?Q?W+8ZccioM02cgA9NoWYrdHkwsNOdyjJk576li1VP5eozhI/37u7TWe14k7Xo?=
 =?us-ascii?Q?UocNJc2DCr/9jG5pwKsg4DuKLCi6uNgJ7D9/nokX5PGyr8/PiJPmw8LHWQuB?=
 =?us-ascii?Q?5g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR12MB8800.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7416014)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BmnPhwwjnhXpz8dDR4vDoaFGtIoKjvKb0hAqaVVaTdQwwC0Ssj3cXaiOYNAX?=
 =?us-ascii?Q?XWP7NGtOJcFF0AY9bn1A7K1CzxxAxzUJC8idz9IO4ONa66byk4SqaPLHwU+5?=
 =?us-ascii?Q?9usEVcdPVD34zq3mY0kiYfCwDOtN6Xm0nrt6MSabRim4JQOi6aovZW6KzBum?=
 =?us-ascii?Q?NIFlTSgy7veQe02glvuYt+xEicWid+ebAbHc31teWQ8aiueK/zoMNFLDJpx7?=
 =?us-ascii?Q?eorh4CqlFwQ1or3ophbaOOvsYdi3IZhraOBVUA5gV6E+EnVPraZRtas6yH6U?=
 =?us-ascii?Q?sHGnReVdwiBUYalODVUYkXlEEtgCjD0W0hZcRsyaIoblkUX31svsv7iOJQqX?=
 =?us-ascii?Q?k+7kSf7ivp3vv8DhJKQ170Q35XHx/zzeOfnJg0qjPTHTTzRS73/X64nDg/Ha?=
 =?us-ascii?Q?NIbuKmf/e/CKdzwXR66phaxuifTzZZmGTUIGAC3ivRNSx+CbeJvthfE1ry/z?=
 =?us-ascii?Q?2cPmPUMyyssOPo68hNGudpOO7sZzQk6MLH+Ao8URAP7suOMuMXPBdzXpBSuh?=
 =?us-ascii?Q?+CO+MYiaRj7DKYDLCKiM+hahHwNHCN9xwE3i/tLOmcjd5AjlxNxLKRrnbxul?=
 =?us-ascii?Q?U3xgolveIuFuprBDS3N6qqpCHqaC7OOXS5NTBZ3amjOXGwYqCGE24KuSFFVw?=
 =?us-ascii?Q?RbEFjW1ueGC2VBws0dSsF3LSEo0H7FUs+wcKC4bV4MWC2RcH+MuHsGTyvBUP?=
 =?us-ascii?Q?hLTx3cdyCsJapxIr8ijfnF4B5SGc7jNoxTDM1+tv3Xj2zc/siWbqHA6hkqFm?=
 =?us-ascii?Q?vcPFFEb/zQVSQLs1e7NFMa8oBQuQu8URZSgUzJpd1vfXcnNoAPbArzaYO7y3?=
 =?us-ascii?Q?7IiTxs5Q/IdFi6QN35OPr9Y9mTE7l48FCykmYhJQZj6baOKfFiAm6kuUFtFX?=
 =?us-ascii?Q?7EIP/9xIpk2WGWB35k3DvfV9zqVyPmBGp0N+0S+ycqxdVxmiNjIK5/6CSCly?=
 =?us-ascii?Q?Kx1Rc/yE9xYgj4IDJU7NF31srNstpenjxNMKEKP4rARqKGZR72YPqo0N0Cz/?=
 =?us-ascii?Q?ZluUWMll1r1+rjRVr2RtRRs6Y3Ur1XZRGyPYDnkD4EwhBNufTOn26s4sNJGw?=
 =?us-ascii?Q?gH0POG84IAElvOy/KWW0dmz/lK0kpIVuRvetKEQSoMwcSu/oChcwbcqN/fIj?=
 =?us-ascii?Q?0ldNJFbePaxuogAvjWr5G92lioL52+bENg6AycMKa6cXKGPElHGOmEXMMrA9?=
 =?us-ascii?Q?rNGoypgb75Knrp7h+DOA7adr2X9j6wBuGY3C39dsB25byrsE1ln81BMAZ8TV?=
 =?us-ascii?Q?RBPKcu3JTwE8DLxcfnbUXyo0N1ge7xnL7OPGyb9PMsNw36LUTPSlBYVfboRi?=
 =?us-ascii?Q?5I7j+hxtWkcF7MUjQUEk6FErt6ulOTt/lZLi+xqgr1mgdg07aclUXqYyvhfx?=
 =?us-ascii?Q?IuQjNw2+/MdExo/380WJ7rmcICe1Xq2y1XwlPgRiJ/2JPIH8MVphNrDBccGS?=
 =?us-ascii?Q?743ly/ege3rjJ8cpkHzH4wFLL2JUeU/Kw9iXzH/xQRZTVlgJxFevpGZhRZlV?=
 =?us-ascii?Q?xB46y+Sd+8sy2mQvxF0Av+bqTvdGyAdFVLfotzXpLLD/RjKfZgDU8+9sBL6F?=
 =?us-ascii?Q?n1kWI0CxdiquBL/WsR4avS1kNoGtuc9Bo8Y9gfDMiYNSyx/nyV51vQuKlKcC?=
 =?us-ascii?Q?azoswlB6p82DJjfB/55xWGyxdEd9pTgls45MLR2GIh2+FDGlR5l2tb4zVvqd?=
 =?us-ascii?Q?ESlkXqciqNdiK0YJTtVjPrhYufElHpqhc/uJgHzA+ylufsNr1zToLQ5V0WP7?=
 =?us-ascii?Q?rt9GNnt2ECLiaoXZJF3HnzojQSdIEujwEyPZnar+w+DzcQFtFpm6?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c97778a2-ba33-4f08-b7d6-08de54b74024
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB8800.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 04:25:16.6535 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KtMPQHxKTiO4vAVuLOWaMu0M22dcb0rsZjCUvQ9vrX1ct5cVTmumt/ScG7S7O4BzByqsH/VVgQeUB2+ej3PeKQ==
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

The following patch drops moduleparam.h dependency on kernel.h. In
preparation to it, list all the required headers explicitly.

Suggested-by: Petr Pavlu <petr.pavlu@suse.com>
Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Yury Norov <ynorov@nvidia.com>
---
 include/linux/moduleparam.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/moduleparam.h b/include/linux/moduleparam.h
index 915f32f7d888..03a977168c52 100644
--- a/include/linux/moduleparam.h
+++ b/include/linux/moduleparam.h
@@ -2,9 +2,14 @@
 #ifndef _LINUX_MODULE_PARAMS_H
 #define _LINUX_MODULE_PARAMS_H
 /* (C) Copyright 2001, 2002 Rusty Russell IBM Corporation */
+
+#include <linux/array_size.h>
+#include <linux/build_bug.h>
+#include <linux/compiler.h>
 #include <linux/init.h>
 #include <linux/stringify.h>
 #include <linux/kernel.h>
+#include <linux/types.h>
 
 /*
  * The maximum module name length, including the NUL byte.
-- 
2.43.0

