Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5826B8B3C00
	for <lists+dri-devel@lfdr.de>; Fri, 26 Apr 2024 17:47:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2F29112668;
	Fri, 26 Apr 2024 15:47:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VWDAnN/P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 404AD112668;
 Fri, 26 Apr 2024 15:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714146436; x=1745682436;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Wrkm0gMDlzCKaLHlZpc0StHomTlxNkn5/TvnFKR7xEI=;
 b=VWDAnN/PQ+NFQnhsvlz3iYDZAX/kIV0oALTZW4ZsXNyHsRyY/vaQPzTo
 lsEhPb+P2hf68DFkTMV1cliAZ9O87AWieRtmQiVdvgEumxxiGYkwWJQKt
 uC3SiaVkP0pBPGd5UeNKB3O7X51SD1zQ3NeC9Mpo5XCXPBxJPhO4CAbeP
 pUUW87s8Zf/vTkDiULVoaqz1DFomKj0pgaCiTVM2r8XO35slv/cXG13IZ
 W0elfwfW7n0X9n6W4tWqHM9bkh3vSVqmOLIWVRfCGBPhXii8h+JBV1W71
 bICckxIMblwM2SbiSoRjSu2JcVusqh2rkX4uJtEtko6vHxgakPyYxnCiO g==;
X-CSE-ConnectionGUID: nhINP30pTKWJ9oBRSyylHQ==
X-CSE-MsgGUID: 6xZSc+p6Q6ubewGYJQu+Rg==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="13674581"
X-IronPort-AV: E=Sophos;i="6.07,233,1708416000"; d="scan'208";a="13674581"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:47:15 -0700
X-CSE-ConnectionGUID: QBz7WPYRQAymUjN5rIWgrQ==
X-CSE-MsgGUID: y01z4mD6QuuzuLvtj1ZJhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,233,1708416000"; d="scan'208";a="62932619"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Apr 2024 08:47:15 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Apr 2024 08:47:14 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Apr 2024 08:47:13 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 26 Apr 2024 08:47:13 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 26 Apr 2024 08:47:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QzrcgDPrwDQbtM/CeryDIAsK2gHoMseThTy9VrbPd4oemV4Fnn6dG0aGIRxGAb4cw/0yLA087F9F7mqzKFncYYOP2p8YiED42ayOgeyHs7H2E702L+Lb3Kn+Rom72RpmomObEH+tDVleEodnBgykyWYvY4Qu0/xZ2MEST1l7Pq5ZnQ1NVxia84bOnHC8cyWQCaWBDP/pFkacvYYQO2AUjxxcRrgdwtOTeFCBESNvMQSC+sWQsm8PYMEk6EbAvZfIh66K7ylxNHxyvy2nRFS4801qKV/UgURZVwRCGcrbSEwUEsTYJRVCHrLoWXJksdANOo6yMbBWUnTR4p0+knyW7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w5GsBE544ikW2sJEtj+RFaS7wPjwCl1fI56hCXAK+aY=;
 b=Vxup85Q9Qr/D7FOLJNTonTgQcc+T3mtx5KyxOtYtqLWEevxTia2XSAN90rLioA9VwMJKgEjW7aSgml2lm8paR4ffDGEOpOcgydDa0W3dkReoGHIv7Q+a9a0sOoOO9dCkYGkL+l5OAz9yeqdZjBifoeFuLo4lfEDiVGdReBtACPbHKNMhoN3d1OifiZPn6HIDSpgRwMPJAh7b9gS+WuI1jSzqY6k6BL/AkadHgTckut+URaSqvpdSTS7uoMruWalIYBJ3LvphB0yBcbZ9d7TLVgqO1I2sX3WvLMGcO68REgn+vUMvehZrRuNlkqGngmI+BKSN5zxmwQoP1mRFQEZ1CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS7PR11MB7908.namprd11.prod.outlook.com (2603:10b6:8:ea::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7519.22; Fri, 26 Apr 2024 15:47:11 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9365:d8e6:4e8d:8711]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9365:d8e6:4e8d:8711%6]) with mapi id 15.20.7519.030; Fri, 26 Apr 2024
 15:47:11 +0000
Date: Fri, 26 Apr 2024 10:47:09 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Ryszard Knop <ryszard.knop@intel.com>
CC: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>, Jani
 Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH] MAINTAINERS: Move the drm-intel repo location to fd.o
 GitLab
Message-ID: <bq7u2v4mtkxyjnjeu2ijgh2jzw5iorkrlagva7eazir4i6kbes@2vvesiqaujpi>
References: <20240424114159.38719-1-ryszard.knop@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240424114159.38719-1-ryszard.knop@intel.com>
X-ClientProxiedBy: SJ0PR13CA0085.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::30) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS7PR11MB7908:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c1d9a0a-ebdc-4000-5588-08dc66082311
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2IPG79mm+x54LmzNrKuietQ12uHBDcZpjOCY0ENXlkFRjaseaVa67fRPXlUT?=
 =?us-ascii?Q?/uAM9O/HC1tevPa+7tsWeJFxEmrWBlOWPoTokypjNw/p0wz2AUpgijTxsoAo?=
 =?us-ascii?Q?FILLLokt1LWzUZ3pN0AscNKM7rt+G7WPJ2gDLqI6hkwhS2QJaW3qQxxz3Th+?=
 =?us-ascii?Q?1t3nlnVj+O/44ddcvILk0HFPA4PPgJIoCHA3YlG4Pxh/28W4lHvqlyXSb6cz?=
 =?us-ascii?Q?vWD8/jrN4BbegGQmRbiusV4TwjtAUiktgIMPURO1q0wPxcDk1XNF9WQdFjfG?=
 =?us-ascii?Q?976d2TtVXeHH2HfjvwSKG8ILuEK+P+Z9hfoJ5HQvfUYw+c7MrD0LABwdYMcP?=
 =?us-ascii?Q?4aNEBgGt1mI+1Az9M7IxIXwp+R1Dp5ZefYej4EZK8Zcnvb14kAdA4IlbD9yz?=
 =?us-ascii?Q?YbAWHMTxv1q4QZypWYbPv+g7W7+jM2+gUdDv0j4FTH1jGKOrEuhViTkWO4pu?=
 =?us-ascii?Q?zn9DsOZG5hloWv4p/Rl8WG16tZRxk3Jl4EVCir81wJkZ+ERwRwq0PCB7SBGp?=
 =?us-ascii?Q?n5ovxo2L4Il2viJOr0JHCcL0ZrVKXP4kYDJ4rgVw8E26vlmv5d2wGtzXylTh?=
 =?us-ascii?Q?XJ2GpYG42QWZMwvwN4OsWJdMXKE3tUfSmzanKQh0Z/fUzzCnEXyoDolbI+fE?=
 =?us-ascii?Q?fkzoq1gsmuU1MriTjubm19UA36RhroXm+ncRRcmrr7ZkeZh9Z02i7oSs7Zia?=
 =?us-ascii?Q?YIrcRbvUG5YArmh5rHHD54v+zVR8HtIdlywBTjvo3PoYAX0z5b3qPMlmta89?=
 =?us-ascii?Q?Rm6ut6DbSiIujCPeemKMASBxMPDGqcodtn1zhqtu2hFdsVsSZ3kI4WF9LRhx?=
 =?us-ascii?Q?D3FcdX6nW/1xhC7ruoKlnbfRl2HRU1N1BGPd+Xzg9tum3xtnswSXZw9HR2yy?=
 =?us-ascii?Q?urY+ErbijKlgg97FROLxLntomdRyONbmCYsXI9/t2kV7PzOrGCoU6LvLjDdP?=
 =?us-ascii?Q?6BxrYmX6iHr8zzuNbkFYNpU677WC8N4Tn3/MfKEVNa33+IxkExuJaUKqkjMs?=
 =?us-ascii?Q?hTQK6vT9iobngaXKc29h4NW01DNmBomLSTAyegvOu5ERwSZ356ljrMtAaFU4?=
 =?us-ascii?Q?AbYbIReGLGmtkJAhVrrd7E8KJlAOU2YQX4qv/dxUoaGFjE9DEC3XKTjWuTEH?=
 =?us-ascii?Q?ll/81XmSISJHqAvr2zynT0Bjn+XeK71BMcOSdl56oH4JOCDQMDjFqt9c+NxR?=
 =?us-ascii?Q?q61+oFl1iMxJCW2FpCrwd6sGD2M/+sV8fZrk+RidXAZDyzgAqv1GQooPkX0?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q/Gch4pqFgn1F8NwCMlo2Q5w5P33sUNhI2gjMrXYFOHu+4X1jpHYX7MKQeLh?=
 =?us-ascii?Q?k1gBUvg4jcKF4Hj5HuS6qqDeMQ7gOFdRVbaipnKxz5JbBZ23IqqLaEOXy4IM?=
 =?us-ascii?Q?lRC6ccAFAnI/vJFqVdnUGSEz//jjVciJeSgzr0jYHvxRQwbgAOXy6rdsRJed?=
 =?us-ascii?Q?U9gi7jVlq8IXqPPy+mrexZYSUj7wBh0adt1dgmoRVYpaND0FUDwrfrPxA7po?=
 =?us-ascii?Q?klygKc0m7784lhBVFEOQdNNUrqjBhfvwiMTx/QMnUyWyduKAhh4gS9K+QSgT?=
 =?us-ascii?Q?S7ATYLwv/JhNQN6Hi/wz/A9GQAs8RBXONTk1f62s/QKtNKy5sjQLT7P2eldT?=
 =?us-ascii?Q?mA0Ktn0LhZDVkBf/T+X/fgUxLV8nP9zUxmoRyjlG07CD8foXp8eGI5pT44qt?=
 =?us-ascii?Q?6EoV+3lLjN53OeA7pQ0H7jX9/xWTgK5H5L9czfzT63pwgmrRIeG64cA+Kug+?=
 =?us-ascii?Q?c97mUqVo/AKcPwOvsK50ZyURQxN+ivRKpnpnmBr05nAU1Vbs/Dv8rtU4RFLm?=
 =?us-ascii?Q?L/R0MIXG9b4dIxUxTWuMgvjKs/Hoxr5ojWivSLhDvsUwpyOU+DmiAJvy8wf7?=
 =?us-ascii?Q?Gp8GYoUFzXiBIPskRBZzM7v0xBwsXwHdJwmRcrcEpXZLCqpxgUftSLCfOtti?=
 =?us-ascii?Q?sR+Gq0NY6olzoL3Rf/KJTO6h//oWxpWJOd92QujJB2P7WpSmauCj++H0GZom?=
 =?us-ascii?Q?kIOLx/81+F0nC8h9EitJDi2gpO/lsVidJgDDI8H93f07NVYfvfz9iIDT3fkH?=
 =?us-ascii?Q?NATs0m5a0K/7Oj7SBntoT+ScP+5R8oAj8nXg5UDgGDG9oIOqD+xAiEp/b/vI?=
 =?us-ascii?Q?DhVm0mt5sqOmebWVMWb31xXz9YuUrYyNYVDPSaI0AHxeHbie9QkkSBeA2vaM?=
 =?us-ascii?Q?idmt9WrEVWiuHYR+hot/S9wbPffNm19t6vXMj50DKfgK2CWbUj2husAhOTJf?=
 =?us-ascii?Q?oofBIFUU8+rXCpPcnL8Pktd16hxqUdccniajBtdzcTcjDz4QCf0Vo4wLQVCI?=
 =?us-ascii?Q?+8JHlhYM7qcdoRaQIzwHRz2bqV4+zmjK9xPwfHoizAQGS4H1xI2WnahA8rhb?=
 =?us-ascii?Q?tYkjbQcNCkJXl73fiJ4Llwy+MEi94+37PMLZqBEK8mplr0/q7FngnqkH7Mt2?=
 =?us-ascii?Q?y8yupP34M0GnJWTRUowpPD6zb0RYYgD0HHXK1vk8nqNQzG1ZhNvJO1Buc1H0?=
 =?us-ascii?Q?sS56+agBqcq2J8h4vdKW8P7Avxq/x/vDMieJ5BKNvL5HkSeN5TFkS2pk7gfp?=
 =?us-ascii?Q?+EVJrXdHyLgNOUMd5hoG+v37gAFC0nWiw0TUSEHNuXaOlQaj3czzCag0YmMW?=
 =?us-ascii?Q?Dh6kaBWzxAvV+oEs0D4P85hJjC0EiUNtXMp1ZWc0R0YqKGv2FJZwJjMLBZPp?=
 =?us-ascii?Q?xJQldmJDS9CFQubg8UmpJSjBVsrZXEZiwp33d26lJuwNnAAJ88LPwFf2MKSW?=
 =?us-ascii?Q?BxbrYYmArO6d5l+7kqH8X4EDM/QqEAJolUlmUkBEWnYZSGsESvKQj4t8nrtP?=
 =?us-ascii?Q?H4Er6tozak3JS6bTOQyMRrO1itUk8ShiS3/lQB4lk55aIWMq4fqLU4eoLNU8?=
 =?us-ascii?Q?9/f1OFbB+QdhoQcGOy3yWjv6AVtuiKtplNbGvi8ZiDmMEWvOtPGEvm1xmAlF?=
 =?us-ascii?Q?xA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c1d9a0a-ebdc-4000-5588-08dc66082311
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2024 15:47:11.5651 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XC/sXgTUbqnpJFUtILQHEyZz5055qjK0Fwgc0H0OicMz6qOzYEpeAZGS0ni+eTvQK39aouOd3mD7bUYPNS0HlIw8fCQDyR2iTltmk6NTCtg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7908
X-OriginatorOrg: intel.com
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

On Wed, Apr 24, 2024 at 01:41:59PM GMT, Ryszard Knop wrote:
>The drm-intel repo is moving from the classic fd.o git host to GitLab.
>Update its location with a URL matching other fd.o GitLab kernel trees.
>
>Signed-off-by: Ryszard Knop <ryszard.knop@intel.com>

Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>

Also Cc'ing maintainers

>---
> MAINTAINERS | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/MAINTAINERS b/MAINTAINERS
>index d6327dc12cb1..fbf7371a0bb0 100644
>--- a/MAINTAINERS
>+++ b/MAINTAINERS
>@@ -10854,7 +10854,7 @@ W:	https://drm.pages.freedesktop.org/intel-docs/
> Q:	http://patchwork.freedesktop.org/project/intel-gfx/
> B:	https://drm.pages.freedesktop.org/intel-docs/how-to-file-i915-bugs.html
> C:	irc://irc.oftc.net/intel-gfx
>-T:	git git://anongit.freedesktop.org/drm-intel
>+T:	git https://gitlab.freedesktop.org/drm/i915/kernel.git
> F:	Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> F:	Documentation/gpu/i915.rst
> F:	drivers/gpu/drm/ci/xfails/i915*
>-- 
>2.44.0
>
