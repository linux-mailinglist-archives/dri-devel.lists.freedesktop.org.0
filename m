Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0409BD2B56E
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 05:25:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C93C510E7E8;
	Fri, 16 Jan 2026 04:25:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="nNF1+DXm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010022.outbound.protection.outlook.com
 [52.101.193.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2011010E7E4;
 Fri, 16 Jan 2026 04:25:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jXE5+Nv3sfFcgD5pal0YOq93UFXP/c4ifFDBYsL1g3WsocsQuSzZYRoompWieSPQ1OpBBdMM5t/FZXhxV9XUCdESUgOHxxRco2TXlFljn9j8lwDZ/q4hTFO87YteeZWY2XJBdYjpSPv/tTzgdyGEvrXQBFURz3jLBF90HBCOtsHjFuFMIYeh4AOVUSrhHUWf3s98pkLqhoGs3ZtfcLkZwFZxFztliAexK6eFBBpiJDkLp/QL23mNdkUDgKh1qv/9QtPRGUkp6cxfxLalCMtVt16jRO/dLI1tDn+Mxcyj4wE/C3tLYai9WWx5LQGrI50XAdCDgvro8rVKALaycu67XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TUx1bEFo2/v5hM0VtLV7AEBmP7HSjOB7jjV48rab/Ys=;
 b=yZGFyJJyCug+JDoLqlmHyFAGKtu+jzKMVLWbx+3w2M94+uvCck3RceoUJuOJvFVwy5oUX4tCVeYh9aJaB81OGqEfoxg6SutP1XlRUrQnvOcIHl+RFDJNFY2PPJ3QXylZbNpTiJWQDMRhz2kZCw7UPZUnJgK7AnDKTXZXXIwWQeq9kauP81O5l/jSZyKEGIAPihbsRnUqGR3nGshYve+3zmm6XeprWAmbo5rM5qmEPVfZl8dBZAcME/PgWgxSiDOKshb/VVvoWC+h9kXaWGIUUqIPkfQUk2NAWe2Fmw9jNkqeO6Ggqmq8SdbwZZXIKnEggt3UAShTv/ysxD4PRAUOKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TUx1bEFo2/v5hM0VtLV7AEBmP7HSjOB7jjV48rab/Ys=;
 b=nNF1+DXmmNzB1mH/6Q+KnfrFoUqDWWxOM+ycW+Eqd5boVtKdLnFe/EJ0j3AoKrQN59LA29F15IbL2/nRpEtRV4lf4dyVAx81ZeBETNeWi0z8CKgLWnsayE1opcFrt/guDWKUB2xmK45tYrkII8u6Erhw7c2Q7p0Uf1QB2KDDIx0V7NSWfUl4/NYknnaTduk+HrUB1Gl+xsNzMW4hsSZgP841H6lS16jQkxUQa7JvERN8gSD06f8yYRSOfzE/pv1BSETuffWjsJ6ZV5tXmRUK35hIpmDs82jWu7kinPKbjx5VEVSwx1U2FNhflHdY578CcWpL5tBwysTVpWVD3+CrOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH0PR12MB8800.namprd12.prod.outlook.com (2603:10b6:510:26f::12)
 by LV3PR12MB9188.namprd12.prod.outlook.com (2603:10b6:408:19b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 04:25:22 +0000
Received: from PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d]) by PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d%4]) with mapi id 15.20.9520.003; Fri, 16 Jan 2026
 04:25:22 +0000
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
Subject: [PATCH v5 5/6] tracing: Remove size parameter in __trace_puts()
Date: Thu, 15 Jan 2026 23:25:08 -0500
Message-ID: <20260116042510.241009-6-ynorov@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260116042510.241009-1-ynorov@nvidia.com>
References: <20260116042510.241009-1-ynorov@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9P223CA0014.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:408:10b::19) To PH0PR12MB8800.namprd12.prod.outlook.com
 (2603:10b6:510:26f::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR12MB8800:EE_|LV3PR12MB9188:EE_
X-MS-Office365-Filtering-Correlation-Id: e531d0e3-73ba-4596-2458-08de54b743ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7416014|10070799003|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?e2rxGABtZdMeXgCFC2e4VHFWprIUNGjuYEPO9IoM8Bpz7h4nrTLVK7BQ6OPg?=
 =?us-ascii?Q?Dc7ob/s2cYaSXuTPObyleWV21+pZfN8ey7Nr9mmJui5qwQJtYl4qod32pkMr?=
 =?us-ascii?Q?wpexCwBTuSA8B06hbRfKLMTme/Hc7EaG34tTEg7BxxbSFkr7jHvB2vT7hPBj?=
 =?us-ascii?Q?/1N1n6i8TS42SPpSe14jyT10WyE/49I1I2beMMSYt+82RdizwCD3hvLzZdss?=
 =?us-ascii?Q?sSPf9f8wx/ot3ygOJAJCMdm9xRCvolTn4+kRVuncIdVqNksZd9rmTkS47qFX?=
 =?us-ascii?Q?uJgjUOBGLiv/t9sLHndYTFRMTesjRKeteMO0djvHDZxNbkv6UBlc17IplBeg?=
 =?us-ascii?Q?iS0rlM0gGPzlF+0cr9OxpGaNETRFeoKJIlgoznRy2lYsixZM33Cf7pujiXHU?=
 =?us-ascii?Q?1VO3SaTSeJRuMtTqLKDILVW7xZuRpm3XhodttdMHsyzhRBxM+D8pHUDs6NzS?=
 =?us-ascii?Q?qW5N4JMFyWksQ5yGPe1ZYos4et0hL7KQwgX86zX261hpwdZ2p6gQrOgv4hWD?=
 =?us-ascii?Q?19xIF+yZTIKBQe3DvRJlAroLt/ZkTzsj/VAoNCKxD9AoIMuiSirD3ZZfeSRw?=
 =?us-ascii?Q?p2sEueUWPGY1x4orPu+Vyq8KzfoRw05IIoPht/d78JtVVm01dJXh1r0CVR64?=
 =?us-ascii?Q?6Z+FEQr9bx4mWQbSeErXKM6FEN8jJpwSeRRYq+m/qTR6vJmTkmVUqxPO5xMd?=
 =?us-ascii?Q?TmLO+z8Gpt175L+vPnB41FSpnwOn2PY/wFzOii4uHNrainIoQhJadw85mWvl?=
 =?us-ascii?Q?qfGLLKwBT+tApjLf58OvxhVPSyfEmu1eUdHrUKbCzuM9panl8jhbcKGJmW8Q?=
 =?us-ascii?Q?FEI/XpPHGgE/fNfqU2Qzi/8JcPZaDpJ01q3hOlwB3XgUSqx6f145QQB2C0RM?=
 =?us-ascii?Q?jTZV6KaQg/KAqwXFjyN1GW6AwzBx7IaxRqsbW2sboGN81dxZEE0cCDJ6ziSs?=
 =?us-ascii?Q?9Z2UvvyfFwGPxe4Am/Zf3YtWVb3b0U9L5Mmv0dw6XdwZL0g+x6dZt4MfTaCX?=
 =?us-ascii?Q?9MY5MOHvzw75ToTINBDgGs5ynfIAaZFOLlXdUXDNLaPykArlHTMBYmaPu3vJ?=
 =?us-ascii?Q?LGQaVmnmmIOIQGJ+pJA7vaQTjaOwAdiegGWcE4UgU9Sy8GdBehXK2tVMPYbo?=
 =?us-ascii?Q?cavSSw7UiYj5yKWFBgBDnc3xQiwdcMBNSM6K/yBNQs+SwlV9OfYFhszcuRsJ?=
 =?us-ascii?Q?49UDMSoFVJliEXUDiNDn0j2pdgDKh/0mjH7H8JBRhFyYiBVyLzZ21UrWEwDg?=
 =?us-ascii?Q?GmDK6cYWweGMJff0EIRNZyyi+QIfcq3SYG1dR3dOGvDOis4OmmQkYNIEYOj1?=
 =?us-ascii?Q?JaHXdtMGm9IZnwlAPhbuEeWqP8AgfSn8xNSK2GTIP9DhsmSXfyDWqdUwAClC?=
 =?us-ascii?Q?jM++0bZKlSnL/vKQT0q68BsDk1ZF4bY0nkKibzhAjQhPoNlTboZnsbhpzAwe?=
 =?us-ascii?Q?x7KCAaguDrQ4hle3QOlS+4Yqk0hTWk+2i6Jca4suTQSY3GWP2zj8C9C0wppH?=
 =?us-ascii?Q?t766SDev4YT+Z/7JE4r0BAPtbUZ2oILR/lEOfvnmYJRWzuq+pjm2r6ucSdOU?=
 =?us-ascii?Q?x+AdGHwMhcHGD3qrkBLkPNCpChaSYMOFDxzeKzIplI3YLzRej3/2T538dgIG?=
 =?us-ascii?Q?3xQ0lqcL3EE+kC5ElHTBWoI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR12MB8800.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7416014)(10070799003)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uwthsp518GTqP8cyPTa6sCOY0sbWptUecVwTzq/ecj2Ag97YOAcPpcDhOSQw?=
 =?us-ascii?Q?6ZNSHdtEG9yaBPlZmjZ2beK3SROApROouWZmaWtBuQ2cbvn4Zy5VAVGojMQK?=
 =?us-ascii?Q?R0E3cHqM7C/YmvnwbXTkPcTbq9YRBEomN4Ij5MtwD/ii2rtvkfGn/BfcVkY9?=
 =?us-ascii?Q?ziFHaAx5LM5nSD9Qp6+xxGaXOxxu0WjgVZs67NC4Wmj4Sgxbb2VWklsXhuEq?=
 =?us-ascii?Q?YLDSoQuUTMFaO65HsCZ4xJU7eRr4y3FEAj+idR6ylnfmzYPikECUQycLg+mH?=
 =?us-ascii?Q?wWMp8+eO6oxUqjYhgrU5NxGqfpsvVyilNm9taPBf9Pv4dfP9PpgWE5jAtor+?=
 =?us-ascii?Q?hGQJrTRIcRxMon81OkVgZKDRApbvtnRUp7Ln9EDsYHe6ppxztBkaTk1mrdIA?=
 =?us-ascii?Q?ybxh1eiJeHgTwd6TVvH1gmTe8UK8fN10t43IM0dW0bRy7xCqw53hY74ZXrqi?=
 =?us-ascii?Q?0oTp+dv4e8H3OA3nJ3shqgcYaLWZDhQnTGxlrB/9JNpIPL7gyzRVH12dsLh/?=
 =?us-ascii?Q?pNShVa75HUSu85PwJymzGwtsRVa4DsIbq/Edrta7VwyNfQ9EYfFBiwAw/nRF?=
 =?us-ascii?Q?vq+nUbM2YbKy6SqVC4vI2gS+Eci856uJa6ehQk53Cg3pvCQLiOueK0aSG6A5?=
 =?us-ascii?Q?ugxETAqUtyVFXIJX2nFZ6PvCbcGBAXF6ltsEAQbyJAFJ6d4Slo+RclrSm3k/?=
 =?us-ascii?Q?aTqsOGPTzEcWxRJp52WADR2qPCKtWiXmkzUKQu+RQNq7taH9EvjoPbuvj62h?=
 =?us-ascii?Q?6DHIlL2WTtNsb1qPoh+V7aOBxifU++ALxePCrdEYtIvQowXPARVX36wMA3/F?=
 =?us-ascii?Q?JeVn8JNyxvUQJHr1t3yqtGj1O5u28TOgsme6NVcfnSBlVozv6tnIGYXWce6p?=
 =?us-ascii?Q?KHW8kXBGTJt+5tAcvDYmgGCMpHUJmKx3e2IP+6AtiJjWyUtikqkLgHEHIibA?=
 =?us-ascii?Q?pjJqyba6j7jp8jC5/4EpwXx7qCuWy8mIouPdIKPs9a/6bl1QIIpuLq4fsxgG?=
 =?us-ascii?Q?CmEfj7ruNyMODG9mRRXr7iVZCIzOsQ2nxRNHE3bP79R75/vLhz6dVOEfEz+B?=
 =?us-ascii?Q?xxaL0undOxYre7IkW6s+D+H3TsV7MwfGOtRGJv87SXgd0ledFTBdm7l51KyE?=
 =?us-ascii?Q?8u4pu0VLU0rVHAJ9xEw/zrpRsM1ES/GQjcyieWClLBgjE9NkX7uzdcZfrQtK?=
 =?us-ascii?Q?dyDoIFIvN2ICKL3BikgLwWKjyplvpBMckZh0HyEfC39lYaYF2C9ZAbWBHfyD?=
 =?us-ascii?Q?+/XqCQEXmrPFwveYf+l8Xaf9e4vrTgC/rD8FBR7I5hF1lu9CCToGFaiTFg5K?=
 =?us-ascii?Q?zeUFfive/2QxAKmiYCgZW6/NmL4azct0zjeLCRzDE24FN11w6LMU0NIf+6Kj?=
 =?us-ascii?Q?R6m9sV8ha6rgDaAaAnFaU9y7PAv1oo3UV0nTik55rBhU51YnDcFappuXGxbP?=
 =?us-ascii?Q?296XEa0aFpEv31mvsk9ZdnFPrc1t1c3aZM2IE+DLeVx+U/XamXUoDLC0Sx1W?=
 =?us-ascii?Q?EJJ3idrVMrJj4XtVLF/1JP9riFhEYJJkSVLs5BpXubDkqM0hnX9NQogEWUkp?=
 =?us-ascii?Q?2xEU6eJSOIVxhK9+xMSWrSz5k/Xyof6744FqCmO3XJqZCXsgEuBg35YDUlrJ?=
 =?us-ascii?Q?A9g84zlOG5ADuIuYgU3eHmmx76DpDLKGlOYKbtpfCXLq0jbHvR15HID3aPvQ?=
 =?us-ascii?Q?sM/GUphUzhj8TTAbb8sLIEArZ1fzQcYHXejJOW7VuR83qfH6vtNLqeycBpbw?=
 =?us-ascii?Q?FxBzvkNcf4Hs+ItEfFO6zNtauQeWs4x4spAZlQsEo1qCq7Pam5KX?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e531d0e3-73ba-4596-2458-08de54b743ca
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB8800.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 04:25:22.7902 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u70UcDSq2y82N6CD3sJN8mF4KFq9sfd+sgY11Cygz/C2OLGLwjdDT4XbcWU03FuxSIMUov9DM85c4kEeY9NiLA==
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

From: Steven Rostedt <rostedt@goodmis.org>

The __trace_puts() function takes a string pointer and the size of the
string itself. All users currently simply pass in the strlen() of the
string it is also passing in. There's no reason to pass in the size.
Instead have the __trace_puts() function do the strlen() within the
function itself.

This fixes a header recursion issue where using strlen() in the macro
calling __trace_puts() requires adding #include <linux/string.h> in order
to use strlen(). Removing the use of strlen() from the header fixes the
recursion issue.

Link: https://lore.kernel.org/all/aUN8Hm377C5A0ILX@yury/

Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
Signed-off-by: Yury Norov <ynorov@nvidia.com>
---
 include/linux/kernel.h | 4 ++--
 kernel/trace/trace.c   | 7 +++----
 kernel/trace/trace.h   | 2 +-
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/include/linux/kernel.h b/include/linux/kernel.h
index 5b879bfea948..4ee48fb10dec 100644
--- a/include/linux/kernel.h
+++ b/include/linux/kernel.h
@@ -329,10 +329,10 @@ int __trace_printk(unsigned long ip, const char *fmt, ...);
 	if (__builtin_constant_p(str))					\
 		__trace_bputs(_THIS_IP_, trace_printk_fmt);		\
 	else								\
-		__trace_puts(_THIS_IP_, str, strlen(str));		\
+		__trace_puts(_THIS_IP_, str);				\
 })
 extern int __trace_bputs(unsigned long ip, const char *str);
-extern int __trace_puts(unsigned long ip, const char *str, int size);
+extern int __trace_puts(unsigned long ip, const char *str);
 
 extern void trace_dump_stack(int skip);
 
diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index baec63134ab6..e18005807395 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -1178,11 +1178,10 @@ EXPORT_SYMBOL_GPL(__trace_array_puts);
  * __trace_puts - write a constant string into the trace buffer.
  * @ip:	   The address of the caller
  * @str:   The constant string to write
- * @size:  The size of the string.
  */
-int __trace_puts(unsigned long ip, const char *str, int size)
+int __trace_puts(unsigned long ip, const char *str)
 {
-	return __trace_array_puts(printk_trace, ip, str, size);
+	return __trace_array_puts(printk_trace, ip, str, strlen(str));
 }
 EXPORT_SYMBOL_GPL(__trace_puts);
 
@@ -1201,7 +1200,7 @@ int __trace_bputs(unsigned long ip, const char *str)
 	int size = sizeof(struct bputs_entry);
 
 	if (!printk_binsafe(tr))
-		return __trace_puts(ip, str, strlen(str));
+		return __trace_puts(ip, str);
 
 	if (!(tr->trace_flags & TRACE_ITER(PRINTK)))
 		return 0;
diff --git a/kernel/trace/trace.h b/kernel/trace/trace.h
index b6d42fe06115..de4e6713b84e 100644
--- a/kernel/trace/trace.h
+++ b/kernel/trace/trace.h
@@ -2116,7 +2116,7 @@ extern void tracing_log_err(struct trace_array *tr,
  * about performance). The internal_trace_puts() is for such
  * a purpose.
  */
-#define internal_trace_puts(str) __trace_puts(_THIS_IP_, str, strlen(str))
+#define internal_trace_puts(str) __trace_puts(_THIS_IP_, str)
 
 #undef FTRACE_ENTRY
 #define FTRACE_ENTRY(call, struct_name, id, tstruct, print)	\
-- 
2.43.0

