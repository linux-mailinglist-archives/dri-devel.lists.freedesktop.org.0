Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B691D2B564
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 05:25:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 835D310E7E4;
	Fri, 16 Jan 2026 04:25:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="JrBIhnda";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012056.outbound.protection.outlook.com [52.101.43.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F419910E7E5;
 Fri, 16 Jan 2026 04:25:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aMPCp08OVpBduWA1I8FDnAS4ZxKmN56TjcstjoQUIwxqTglHgVkIZ5+GgXqLg5PuYEcvl/wNia2guT7mILNq5PPglwsw13h+vuigwH0K18xvVQIOt82z2l2tfBjJwl6vyTapyaxvgeaGRsh90alyhNHwuPsRz6nHxiyyawZ5dkt5hwIZcZkjgOguf6EMXXraHMA7Kdf3o7mfiH00niEMgqkbDQ2AyXRnl5+FRZaZt7MjM20hAWWxEf3YBJmzQUkghRHnz5k/8CSb1TwqIVC5YEAU+70A+uLZF9OZ3lV6wYyIBkmuqgb6S+IcTdH1PdAbbJIKEgLBrH9Y6HgeXbpwBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yt2xArM4PimbyjwV3mDUKdXLilLDoGk3ta3ffeI/Q0U=;
 b=V8iwp5UoBOdrJMMEQmzGh1jmsxN19RgZHTw+x1Clxr1IW6+FyRP2DclmJUCgmowXqALXAqGJjj8l9Yv9uq0uhiWLsrHBs64ylzggyoI2ODRloS4eJOtqGy+A9GpvrL9bUhowJ+2WeF5wk/UoKDXzBqCojxppqf/XSlu4U3Kr8G/YwpLOz6/MVw3gRNxq0kgDqZEl6eA7pxs0u2VSfEIl2VFr2LVGsKrLHcpxQqq4/zbL6nNNPOcUfHD0aM+mkk6VGvkDTP9boyUYlxE+2ED9LSsjUDIfp7HNoV3XR3Dm3jAsTDOEFq7JLfD7sE5n9hIlCZ5k09Fq7lZ/oHFaHFWz5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yt2xArM4PimbyjwV3mDUKdXLilLDoGk3ta3ffeI/Q0U=;
 b=JrBIhndaSl50fj/sXFZWgGJ/DApFUmTkCT9H22llPbX+HbwY9CWAtzPdUg/rF8N4iZYP1zVkwRyugSDPcbFTI1LLaiGe36yRuhoZBAKYfPzSme44PGTP3NpRLMoTB7ILxcsJiM7VlQUJXAf4eMNa/8mZ3qScgehjucJlDz0AoStHdhU3gSsmZVf3TIhKKPnUlJ3LtHHER75s/vgqeTtJXUJ08HMe8y77rR6x9DYUkUM+RK/L4n9QcUhUceCMI04gGLJWUVZeNECmTbDhrflUUmTpv1sfowpTgC3iC9ZQg6X7dwOFtWbRNzU7LLbHvpW3xlgAG27HyEew4LR5lvow+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH0PR12MB8800.namprd12.prod.outlook.com (2603:10b6:510:26f::12)
 by LV3PR12MB9188.namprd12.prod.outlook.com (2603:10b6:408:19b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 04:25:18 +0000
Received: from PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d]) by PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d%4]) with mapi id 15.20.9520.003; Fri, 16 Jan 2026
 04:25:18 +0000
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
Subject: [PATCH v5 3/6] kernel.h: move VERIFY_OCTAL_PERMISSIONS() to sysfs.h
Date: Thu, 15 Jan 2026 23:25:06 -0500
Message-ID: <20260116042510.241009-4-ynorov@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260116042510.241009-1-ynorov@nvidia.com>
References: <20260116042510.241009-1-ynorov@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0407.namprd03.prod.outlook.com
 (2603:10b6:408:111::22) To PH0PR12MB8800.namprd12.prod.outlook.com
 (2603:10b6:510:26f::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR12MB8800:EE_|LV3PR12MB9188:EE_
X-MS-Office365-Filtering-Correlation-Id: fc23c2d5-5ed2-4ff9-1672-08de54b74154
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7416014|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zLt+GseKnDlk4ZoIUSkPiC+yoaYiuZAE8oWx1Ry/0Bs+IvuGUo9EmrW2hpy5?=
 =?us-ascii?Q?I3005WD/jmVJ6lDF3OXBYSDfQvdNBmo/kFavsTO5SyLzcrnPLPbDXGNz9Wbd?=
 =?us-ascii?Q?YLHg5NQmWIp0Y1WNU9KsS5KunaL4ra8XDOoIiX6sdPdKY5G3dLr9Z5SjaOvG?=
 =?us-ascii?Q?4cJCNyfzM1070vKhrmPvrgzVmmJxq6vUGqp4DOnQ9tLpZbzxUyo2De/mSxya?=
 =?us-ascii?Q?mPpJ67LlRvnyBfx1T7XaCiEJFx1YlsNJDGtxOhgsid3JRVsKIYABGWCUuViF?=
 =?us-ascii?Q?VqQEtPJ23wnh2QxdAPJA6f99oWEpDkkcEJZmaaG/lPz6/Y8VPrCjcnWdjGj6?=
 =?us-ascii?Q?N9DO7JPBltLYC9i9Mjikrk0TrVfaNmVgcFYsT3OUjmW/O+K1Fe1TdNhs2s3i?=
 =?us-ascii?Q?nZWinexQm79+lhwDGT88dIHmqyW+dzGT80QuP8gJBGJ5ws2PPTmuf2za/xPi?=
 =?us-ascii?Q?8pYjlbrESsJ/YEQcLtz55pt4pntMeZ9wWO9/B2rthuZDoAKJkJtPP0ENvEpu?=
 =?us-ascii?Q?byF0EsZxzpad9721BmG3OLzzc/Tlxa847apX4HeyjOFts/3C9Z2tV+apFwAX?=
 =?us-ascii?Q?GUcA2QMUgc3arQcIIDlczLOAygi+zmHERGORhr6AkUP+bTA85WjiwYokk7JE?=
 =?us-ascii?Q?T0X688uL7/LEX6sJQJ+bWHyKXAsi6PY91gJcM2Q0+fzjIc/SNUwWg3xSNcLj?=
 =?us-ascii?Q?iE8TcZtmPHVfxTwLp9RlMzgivmPewd3hCEMTUxwGZqvUfT2zngE/Z43TccZv?=
 =?us-ascii?Q?+64KK8F03FqO9TJq3NkxYHg6cFN3v5bgxzJGgQQotzq8qKSfvlQDI1dtA/Fe?=
 =?us-ascii?Q?GtYkxEGMNSyb8sY/JL8wqcvZl0ZynSBTDt/1v04ERdTZ6nubC5GqhTSkgkIh?=
 =?us-ascii?Q?gfVuTQSinyD3TiKcGnBvut+NjgEogWp8plerRBkku57VkxF4sVIh5sNYVEB5?=
 =?us-ascii?Q?n+IZXsZ3aStxuri2WcNDrunUXjnI+qzuDf7OkscK6ndpV3WlxOWGZEOnz7bg?=
 =?us-ascii?Q?n25seZPT8zKrzpFhlAcS/f4RPWNdzLJ7CtJ/UJEZI067K5htTSO2FjJff8lG?=
 =?us-ascii?Q?rwjijIB0yVLUCiEevheknLCEdc8nphOrTzJjGi0jFjodpSt9NaUziAhw/y7o?=
 =?us-ascii?Q?4mYTwmA45K+iDcRCS19I/aQsSP6d0oz68DQHNKuH5qT+atWfKhz1355UkVdK?=
 =?us-ascii?Q?r82ivgKisiDQVAA1e3mR8Hbqc5nYhuflReYgZNFAbohBns7kZXCAajKKQEp1?=
 =?us-ascii?Q?uaXWZXm7Eeh6oXAQHN5mjRmj8lmuMz3XTw6ZfVJptHEiW3DbV85Xksu++OPx?=
 =?us-ascii?Q?OF1KHAyF5VusHuaNd76xW3jY7CfL38B6iAkWPJ0Wcj5UiOTIYIQPYYRJRJZs?=
 =?us-ascii?Q?GGr6eoCgaJAxv/hWmCiRQUmhQAiKwbbqEuUSZXTNic8x1j0h+vkaBzEJTKf4?=
 =?us-ascii?Q?O+oapIuWfPPkBrJ1lNtceN8uQzs+7mOmjbTfOQ0o/nCFNl3A4Yt3xat2u6Nl?=
 =?us-ascii?Q?tG7AMmerlt0CLQsUyLGirdnoZ2nqpVobjEBPZhQBilbe7enOWXJF/4+trn2r?=
 =?us-ascii?Q?OQ85YIa/nwlLoKkF/3dhO+7FZNACFR3cHS8q8TmairhnA2OHuV3OXgkf/UK4?=
 =?us-ascii?Q?dA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR12MB8800.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7416014)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BIi5S3PDEX8PftecZiekcFIzuj4v9eqxSNXa5/zSEnrSwFOkP8cjkqLbGMMT?=
 =?us-ascii?Q?xXRrsPZGnTkizJlvmf1z0h/02AI4asYjtndD92kYpdU1m6RzHfFAbbQpgo4+?=
 =?us-ascii?Q?w759HiSZ8viA1fmFVaJonzn0KvSuI+QzAuGYwSlkqDuqQtN9BjvBnRGNSz2o?=
 =?us-ascii?Q?MNz+Fjv3G1iq0YgcHA973c9KToKeeuWiuTUZ79bK+3CD0cA3ZeuQumHcitrq?=
 =?us-ascii?Q?UDItNr3/jo4+Vqq1jxT7dhNG2h6tHYt77DEZ3O9axZ1wYSKjmwzn9Z4k1OjW?=
 =?us-ascii?Q?VyzePZB1GP9XSQ28EiYkcnZ9n+bBfrztQhJcESP1suKy+eEWXR0Gwkqske5X?=
 =?us-ascii?Q?9buGFegJ7v2XnfqE/KMIeZlhUOTC75y+17xYbK9cRQ9zWZUs7hrNT2qFoRnW?=
 =?us-ascii?Q?pfBtNCFQWyhsHYcdZmtk24b9oaMc9+gKBkwl30gaQ/yTidIAHnLdcqWfoOEc?=
 =?us-ascii?Q?FysF+hvFuWYiHuIZTD4hsVbJPLTQBaIOVn9hVoa+DJa1yzZEvP9KLe8nvdoD?=
 =?us-ascii?Q?D5YbBysXFTzzpDzsMbn61MoC3wWIIsf++MFfn5ZHEbSVmKZVcOuuQIhQSy5P?=
 =?us-ascii?Q?+cEg3HRJXwuZmRCvoamdData0yk+ZkztKEhmgnrokaILYgeVl4zuh5mHp0vW?=
 =?us-ascii?Q?lXGEXj0gCqawsaRTSPgK0Vwa08sdXQa1cAED6U1zLhRKoKj8YLYIBoa63Dkl?=
 =?us-ascii?Q?HgaYvylE2I5soOly5yt1+4rrmLpk9U8B6AIUx/oTvaiTPlZ/Of98soQLkMSB?=
 =?us-ascii?Q?hoqnkW43VD3f9VFFILaGhK824yS/1DAEjQRbP6G2k6596F3UhMfDK8st7rX4?=
 =?us-ascii?Q?CZQ+yFCB8f8cZQCa2oGxlTBP6jMBB/iCNo76gdhtswTa/LJOS/0hFZLvaW7/?=
 =?us-ascii?Q?rpiLf8kGisTXoUFDtfwHm+69crEUGWQ3tayGz0t3y9yncqg+/LDjAaG7rIv5?=
 =?us-ascii?Q?0tv0HO5ixvRupiI9uM+yQmkIA6B//HKkVlJL/w2QExw9fOA2wiCHqEVjKiRD?=
 =?us-ascii?Q?sXmS3q86BVL8A9EpKYg+d1IsxQN6AqxekjQh73LwXHyUSN8Ux6X9UfJkwBlx?=
 =?us-ascii?Q?VGt+j7XQ6vBdlm0fk6pnlzVrd+RscmlV7kgqivh6LqsfHRL3d5xWmoms3I1y?=
 =?us-ascii?Q?e29ADnJL+wSmIG/5Ko/s6RJ4tdNdS7g8qbhWCKwkqwBVkkkB4/OFeOeGhn0I?=
 =?us-ascii?Q?6D+LWK+Tbj357jnlOi9UNH1BW9TabyoItadcFkjBrNepPkrJC6REwWpuajva?=
 =?us-ascii?Q?ilH1xkqdVN0wz7GFZUWei2CMwI7AuabccmHD8wVo3DjpigEeQp7zBjXQtdjz?=
 =?us-ascii?Q?Lxp2E9xXaO+RPtZN+V5tFUiGB2ETDcri0WZ4BnrGCaYvi58NHWOnCWn3dY4o?=
 =?us-ascii?Q?dZ6choo41XxzXH+QCvDpzTlP1LjatW/LnkWHA+KmI8nU4kRNG6kz9U91YREf?=
 =?us-ascii?Q?gx8CWABrFGJrD5GfPqtvSEEPtMI+4H+gKkm15KPr83/aLwGzpSZVAsiffH3T?=
 =?us-ascii?Q?l+1ECSYqvQ3LySMMLCG79enTlR5G2mr0NaTzpnFbyy/M27ziyA3+f2y8/mdI?=
 =?us-ascii?Q?RhlfQHgv7U/Ld09qjr0oWcuzyHya8Wo9LTi/+4U5P5uMdnWxiOMlS7F5VKW1?=
 =?us-ascii?Q?zsAvkcqQxQ4BMqdMHiX35DI9FVqXyjnW/C7clNuidLyk+7KPrzyFAoLqsojP?=
 =?us-ascii?Q?RHeF3tSJntWAZra+J84lU62sTrsqZA+FCDGzqK6xcPrL9Kei4VwaU2Vpc/gq?=
 =?us-ascii?Q?/BMeC1vNUbx6NbzCupid6/A5rSPILbMpJnnlocgw++gk8L554E7K?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc23c2d5-5ed2-4ff9-1672-08de54b74154
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB8800.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 04:25:18.6300 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +gebbi3mheNSbKuJ9YW7k+ZyN5to1G0zCt5MPhhw3nWmOuf9Zab0Gbay6NPZV1VXOsHRYKg3O1J6kRCUqqcQXQ==
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

The macro is related to sysfs, but is defined in kernel.h. Move it to
the proper header, and unload the generic kernel.h.

Now that the macro is removed from kernel.h, linux/moduleparam.h is
decoupled, and kernel.h inclusion can be removed.

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
Signed-off-by: Yury Norov <ynorov@nvidia.com>
---
 Documentation/filesystems/sysfs.rst |  2 +-
 include/linux/kernel.h              | 12 ------------
 include/linux/moduleparam.h         |  2 +-
 include/linux/sysfs.h               | 13 +++++++++++++
 4 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/Documentation/filesystems/sysfs.rst b/Documentation/filesystems/sysfs.rst
index 2703c04af7d0..ffcef4d6bc8d 100644
--- a/Documentation/filesystems/sysfs.rst
+++ b/Documentation/filesystems/sysfs.rst
@@ -120,7 +120,7 @@ is equivalent to doing::
 	    .store = store_foo,
     };
 
-Note as stated in include/linux/kernel.h "OTHER_WRITABLE?  Generally
+Note as stated in include/linux/sysfs.h "OTHER_WRITABLE?  Generally
 considered a bad idea." so trying to set a sysfs file writable for
 everyone will fail reverting to RO mode for "Others".
 
diff --git a/include/linux/kernel.h b/include/linux/kernel.h
index 61d63c57bc2d..5b879bfea948 100644
--- a/include/linux/kernel.h
+++ b/include/linux/kernel.h
@@ -389,16 +389,4 @@ static inline void ftrace_dump(enum ftrace_dump_mode oops_dump_mode) { }
 # define REBUILD_DUE_TO_DYNAMIC_FTRACE
 #endif
 
-/* Permissions on a sysfs file: you didn't miss the 0 prefix did you? */
-#define VERIFY_OCTAL_PERMISSIONS(perms)						\
-	(BUILD_BUG_ON_ZERO((perms) < 0) +					\
-	 BUILD_BUG_ON_ZERO((perms) > 0777) +					\
-	 /* USER_READABLE >= GROUP_READABLE >= OTHER_READABLE */		\
-	 BUILD_BUG_ON_ZERO((((perms) >> 6) & 4) < (((perms) >> 3) & 4)) +	\
-	 BUILD_BUG_ON_ZERO((((perms) >> 3) & 4) < ((perms) & 4)) +		\
-	 /* USER_WRITABLE >= GROUP_WRITABLE */					\
-	 BUILD_BUG_ON_ZERO((((perms) >> 6) & 2) < (((perms) >> 3) & 2)) +	\
-	 /* OTHER_WRITABLE?  Generally considered a bad idea. */		\
-	 BUILD_BUG_ON_ZERO((perms) & 2) +					\
-	 (perms))
 #endif
diff --git a/include/linux/moduleparam.h b/include/linux/moduleparam.h
index 03a977168c52..281a006dc284 100644
--- a/include/linux/moduleparam.h
+++ b/include/linux/moduleparam.h
@@ -8,7 +8,7 @@
 #include <linux/compiler.h>
 #include <linux/init.h>
 #include <linux/stringify.h>
-#include <linux/kernel.h>
+#include <linux/sysfs.h>
 #include <linux/types.h>
 
 /*
diff --git a/include/linux/sysfs.h b/include/linux/sysfs.h
index c33a96b7391a..99b775f3ff46 100644
--- a/include/linux/sysfs.h
+++ b/include/linux/sysfs.h
@@ -808,4 +808,17 @@ static inline void sysfs_put(struct kernfs_node *kn)
 	kernfs_put(kn);
 }
 
+/* Permissions on a sysfs file: you didn't miss the 0 prefix did you? */
+#define VERIFY_OCTAL_PERMISSIONS(perms)						\
+	(BUILD_BUG_ON_ZERO((perms) < 0) +					\
+	 BUILD_BUG_ON_ZERO((perms) > 0777) +					\
+	 /* USER_READABLE >= GROUP_READABLE >= OTHER_READABLE */		\
+	 BUILD_BUG_ON_ZERO((((perms) >> 6) & 4) < (((perms) >> 3) & 4)) +	\
+	 BUILD_BUG_ON_ZERO((((perms) >> 3) & 4) < ((perms) & 4)) +		\
+	 /* USER_WRITABLE >= GROUP_WRITABLE */					\
+	 BUILD_BUG_ON_ZERO((((perms) >> 6) & 2) < (((perms) >> 3) & 2)) +	\
+	 /* OTHER_WRITABLE?  Generally considered a bad idea. */		\
+	 BUILD_BUG_ON_ZERO((perms) & 2) +					\
+	 (perms))
+
 #endif /* _SYSFS_H_ */
-- 
2.43.0

