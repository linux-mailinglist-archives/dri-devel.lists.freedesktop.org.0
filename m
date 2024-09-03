Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF4296A23C
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 17:25:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24FBA10E5B3;
	Tue,  3 Sep 2024 15:25:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vun6ftjI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5115410E5B3;
 Tue,  3 Sep 2024 15:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725377146; x=1756913146;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=/erV45q3RJ7FYyBW5BZjda1vCJsEz2wDbWLv3HhOqiM=;
 b=Vun6ftjI0L3t2jaZ8eCOSwsISLu+j4gPUGplm3ZPQlGc25FPYyfOCcLu
 PdHvo9mjplbkRKF0YdvxZf+waWZ8MDuRbo8KM6QNm+le1fMKa0bvqmOxl
 Xa3YVtTZ2B/IO6P/GfI4EnkulN8Tc3vqhXR9xqtkEEZEIzuj3pkk3kYSf
 Cf5679CDogRQEiW1hjGoBGIJUtSDOQZXB3E8BLxvkKsI24Yyt2P6Kxm2U
 pyUCAHQW2b0EUkrp6ebFsL/E8au124gzjGIL8SomkXRZew4mLCUSCI0nM
 TUkc8v2pnTknnu+6GVzKl9s6qGV5BDfY9KYgLzIfnAu1Cf1NnN+cGfs08 A==;
X-CSE-ConnectionGUID: h4zlNjSfRv+VBftxM2nEnQ==
X-CSE-MsgGUID: ocH907BcRO2MEKm7g8bLUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="35140187"
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; d="scan'208";a="35140187"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 08:25:46 -0700
X-CSE-ConnectionGUID: to+uao2kSuSOSZ1zB1s1Cg==
X-CSE-MsgGUID: 7Cc4f1SlQf60DnXI0GMK2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; d="scan'208";a="69744774"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Sep 2024 08:25:46 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Sep 2024 08:25:45 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Sep 2024 08:25:45 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 3 Sep 2024 08:25:45 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 3 Sep 2024 08:25:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WsDcL3wLhfCzj39THwOqGAQjDZeLMxEEM4qLT+KsJ5saj2wFqNEqKF9G9BOnq/PRwRmzQHE1/VcMcHxpUVt1VNHW+2d79sYGi8G9yAjN1k7UjWyri8XwJM6gzHh67k8y6Zdz/nH1tOfaSJJxs2VgLy1f8TudULUOIYJN5wM7YD9+Lx/eUZzMkANkP+mR/ybiWqOq3TS5lZHQelEMEjhV8YF1QvujN27TdPmxu3292I0oEjogxxt/n79aV2TV8HldYiTpM74REFGMx2cfQ8t3nVm2qxgNKIvDnSb9o3EMA7urcivy0dAqRNDfRY8AbXMCXv6lwvmip5G7esboj7w2sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sr9IHiRBfvJNiVhxJW5e8tYx0s0GhLp1BXgSyefYcF4=;
 b=VuheV/4nIjkxz1qvaTe4ZQSYCTOZeLibnujoHmcA2ca9WYB6WXW4RJ95jajXXcMLC+g1tDqviPstdzlvlz0WSWuHt0yLZzGDNpeTaUJZqu0F5vE98rx5OAgEdcSGpJgYnL5tyv1+EzvNXDRUVNlvmdS3KsnxmTfILR65NUY/3QgojNvGi8GqKo0O875h0lJPMukJ81gziFpMwqwixIzOPxcEz+aKk3ybE4KyGpqJpUEbmwqloq6cCASIgTJeiUKmlSDs1q8UlkEcMrfkgwUg7rRVdA7V916bSkqMf6bMZKE+/lYmT+3sY78dwAQJiP6o2lCm53Te77Qg0ZpuEr/29g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by PH0PR11MB4853.namprd11.prod.outlook.com (2603:10b6:510:40::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Tue, 3 Sep
 2024 15:25:38 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 15:25:37 +0000
Date: Tue, 3 Sep 2024 11:25:31 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dim-tools@lists.freedesktop.org>
Subject: [PULL] drm-intel-next
Message-ID: <ZtcqaxYKgA5F7BXT@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4P221CA0002.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::7) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|PH0PR11MB4853:EE_
X-MS-Office365-Filtering-Correlation-Id: 5da5165a-6d9b-486d-e38b-08dccc2ca96e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?llNyS5qr5FvELwLQypuFMIpwctkV+x5+NpENfqAHrjd+qIIudS5TzSC2qC?=
 =?iso-8859-1?Q?kTM5Et551QGxZL+s5TYYO2vjQIhCaXrCDcAmtlWxaiL5DWBDzvVef8YBhi?=
 =?iso-8859-1?Q?ZMZKXf/ccJzVvalAKW5/dhexZ2pu7ygq3FssSmIsDi3EnvNMP2d0ATrbR1?=
 =?iso-8859-1?Q?/p22ob9Y5UJiBLr5Y/Fb4YD98Z5wnTDArEt4wwQqD3C1Pj3/W8DeSAye3U?=
 =?iso-8859-1?Q?mlNKJjcVEhpkKsolF1T8kBkGZULLuC61WLc+Iwt12vJx3yPFSWR0rmqqy5?=
 =?iso-8859-1?Q?RQcA/jm+eRno2Vf4qCUOV/5RQUz7UvIR31+ZLyLB4tWGftphabuWpo/pOU?=
 =?iso-8859-1?Q?RcA5CwyKwYlvzTcO8WsK63xhts/jmxXvT4rCmOh01RxY/+PGIiIpeewFP6?=
 =?iso-8859-1?Q?o6LUIPBHGy/lmNPgLIUAGcPoAOOlnnng3bMxZ5r7906R9I+SuDFVIlBZ7+?=
 =?iso-8859-1?Q?cyLO4JqxNLMpePCkeUD0cv4mhakHp2vWDEMao6hpJr2MEe+KQVlJut44u7?=
 =?iso-8859-1?Q?xPHDS5jgsdgbgViXDThoKBU0KxHAJZ1cHwrzA7E0xbvhiXzWAs7leOJY0o?=
 =?iso-8859-1?Q?9aGVafOQsIgIYlcQSYimwr0oZ3W/2lvhNg4m/qZ7riq4D0Lp9N0uk1y4JD?=
 =?iso-8859-1?Q?Vn4k211pJiv1NepwsUeyvZhCktmkrQNrzrAWE/UKm6llj11A1ICnQZoAsN?=
 =?iso-8859-1?Q?/Aod/ie88w3njLy9Y1lgSBREn5alhcJU4six/XehuAMQbJcqZFdGnnY/aL?=
 =?iso-8859-1?Q?RVMI2OayfvGmR4+CiuoRdr67WgIhTKCi1Q43qznDcv+vCgo3jHiEcpeCaW?=
 =?iso-8859-1?Q?D+Yj94W822bTHxY+i2ojlkbbvuBoBE8ktu64twtTqGbqwu28e5reGepsZL?=
 =?iso-8859-1?Q?GKoeDK2F99gih9UP5sA1i/AVicACLR3pcEe+GlXqv3sPugTQYZSUznUhKc?=
 =?iso-8859-1?Q?9J+lglOxnTE9zd55FZmBuyyLVkB6l/fUE3soWBpE+qSYM2EFfdisITwF1r?=
 =?iso-8859-1?Q?QFUxjbGnXvnLD6vSUBoR0/zar3tJdAaJJEI6qwuHjV2yKAcoB39QZW6LeM?=
 =?iso-8859-1?Q?8k4XujBPvpEsq9zqCNSbpOvMZCcifXKM/bB4uVNrmzWwBVGa8YrnIvJVhH?=
 =?iso-8859-1?Q?3jiuqRzuOTCd5koq+gUwqxy3Nm3Nvd+hIDgOSeb6p34xAn7a1hRBMKAsIU?=
 =?iso-8859-1?Q?+lhsouVtMoL3M8Z7SoL/HboFhVRsyIqEVJl8EHYqMMT2IbyBZZUx/qnUpy?=
 =?iso-8859-1?Q?aQLOfkvY9mvijsTHJdePzBZpENVFg3rGi9PxJlsBHH4eJK9Z2xVuIwD3y/?=
 =?iso-8859-1?Q?KksdyFB142FjfhFLYPW5f78rLy1QzzTFtvA5c3/tfsJ2BDk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?pmrrkUVuKHfssFDeAMGOHj5LKNPWJNYTZH2laKaKKMFs/mzXslSLdwoJIe?=
 =?iso-8859-1?Q?K4v2lf3fUyYziqzYX8Ohe9gbqyYfdCgtX4CBK5gL+vb59c+KZhfvhcagPV?=
 =?iso-8859-1?Q?8Sv2J0wSawSbI8vz8KBKNq90Y7g6hr++iY7Yz/KAL51/vA+go6cB9IaBdL?=
 =?iso-8859-1?Q?M/6pza5/XUbyO7ooIxcdg/jKOZ5ghI+UItpYyGRP6J0IEh3wcr4rdmoQQs?=
 =?iso-8859-1?Q?k1kldgCkjP1mwuHtUsamk8t18eDf9toErRoDKpiwC4kMSVCwRS8hwKjpe9?=
 =?iso-8859-1?Q?Wn5DAuN29jFgeBEsBxaXCjgOHUyJ9L4zpRc8jTuX8eZqg8EBalKkYhHn52?=
 =?iso-8859-1?Q?xrCGddOvThySNyRDjxMW50gVkrjk1OHxLcMu76FRG9MXCjhBojTPj6S4B/?=
 =?iso-8859-1?Q?8qRN/ciX3Ux3sqtZ7nnhvyBIkWiy8bfmb56X0byWhfpib3TIWQENNrMjUJ?=
 =?iso-8859-1?Q?N5eSCJlKUAcuCv2y6vQO+tZDzvVSgt/rKgF02HqiiQ2k7JSeEUJzlwdHU2?=
 =?iso-8859-1?Q?JJ5q//I9ZzKKUSU1wfyxzBUguhQBAAzaYDVT29SNuqGjyZ2Yj6keGjtWHq?=
 =?iso-8859-1?Q?TLL5yE7yAug/cxiYDdRh195VdiwC9xMPWdbwJ8dRpD6h5Xl34P+dBcrycH?=
 =?iso-8859-1?Q?SYMJGi/0+kvNTXHyvGlRHsWs6+zhy+XQpRM3FuncQqIFMSrdV6pI5gXaQ3?=
 =?iso-8859-1?Q?/ulXm4f0LqRFbkEk7BuzjyhB+SQZpCW2hLfK5TyAbeocqSFZ5pFk+7qDIl?=
 =?iso-8859-1?Q?8U1bUQxXsC5WjK5JaJ52AmH5zhkxfsULdzWxpB+1JuOmPHZ1LKGq//1uJG?=
 =?iso-8859-1?Q?rcjY4y95ZNpRUKeKlRY/NoihscNh2gLqFIpYdC+z5hgmM0TsdDzyzjUEyX?=
 =?iso-8859-1?Q?gqbYOwBjpRtYJ6i7k4/oP0njCw0GDgpSu5XM7+9sAsneVV61AJOTFf2KB/?=
 =?iso-8859-1?Q?PvkIgblK6q32MLYr1pyqQ/V0IYZbgFbi/1tQw6VFgTdXudONaYvOCkFv9Y?=
 =?iso-8859-1?Q?yHPhNkAIwGt8NnEf/kO82NUsU+ZqP6FSkQMQ2yDx+8YXh29RWz8WbfSkUk?=
 =?iso-8859-1?Q?PwwoWayJdGqAMtvyMUg3YkNCDb74qM5ewGgNxXhc7/G5MiAL/zZ9I+ia4f?=
 =?iso-8859-1?Q?Hrazyi2LPq8g3OJiOfwm3421ph9j7+MIR9rhjmaujyom9QdROTwA2Lz7O7?=
 =?iso-8859-1?Q?r3sAVcvfkQB5xQ3AgYSaXnDFtVekBEu5pmh7SWyJPi1J+SLi3nWGruxhTi?=
 =?iso-8859-1?Q?wMljIlIt3JmZMFNpDaxgPHoBe/YC8jzZFyX1ls7kCKP94GOHnnBGn+kJ5E?=
 =?iso-8859-1?Q?l/5pjH/juBAiTuos3nC0Qs3INgg/Nv+G+OPFBsUkxW11TZuC5RFVEc1Nxp?=
 =?iso-8859-1?Q?hm5zppTyi+1s7tMJp6AIwaBfQMTGNxAeQEdTpPg3/WCGELl6LbIW7AhejD?=
 =?iso-8859-1?Q?gGMYLCseefCFp4PDRtp0s04nUklODc5e30OUHjNCLNxM/0GsSWdgbLzfhm?=
 =?iso-8859-1?Q?z7MWqvE7th3hvCHDqWqc+HmSrZmBl5IvTxMmZvWwUs/XHSgOluhHcztOUK?=
 =?iso-8859-1?Q?Y3fX0Ke2QkCLV8KO0q9GCn+aT+SJ2UiY8pS/ZMNWV4mJk1Ly2yzAcltb0W?=
 =?iso-8859-1?Q?Wem6/zWkmVinY6D471+SxJwDnOxlNJzfBRiJO/rPCnGZok4hO05vQn7Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5da5165a-6d9b-486d-e38b-08dccc2ca96e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 15:25:37.6373 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eUuwA03u89Lg3Wji9Ex1lOFpyqVdXgBCuEaLRugRYD2YD5I7EcQ8ifs77hMHohryLEJe99iXBIaEZzR78got8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4853
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

Hi Dave and Sima,

We'd like to include this extra display clean-up
towards the 6.12. Hence this extra pull-request on top
of what I declared as our last one last week.

It only delayed because it touches both Xe and i915 and
it depended on xe changes that propagated through drm-xe-next
last week + backmerge after that.

Thanks,
Rodrigo.

drm-intel-next-2024-09-03:
- Fix probe on 'nomodeset and deprecate i915.modeset=0 (Jani)
- Update new entries in VBT BDB block definitions (Dnyaneshwar)
- Fix clang build (Andy Shevchenko)
- More clean up on drvdata usage in display code (Jani)
- Increase fastwake DP sync pulse count as a quirk (Jouni)
The following changes since commit 6d0ebb3904853d18eeec7af5e8b4ca351b6f9025:

  Merge tag 'drm-intel-next-2024-08-29' of https://gitlab.freedesktop.org/drm/i915/kernel into drm-next (2024-08-30 13:41:32 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-next-2024-09-03

for you to fetch changes up to 963ed4efe0c6416f5a2f61e107ee3a27f0bb757d:

  drm/i915/dp: hide dp_to_i915() inside intel_dp.c (2024-09-03 17:11:25 +0300)

----------------------------------------------------------------
- Fix probe on 'nomodeset and deprecate i915.modeset=0 (Jani)
- Update new entries in VBT BDB block definitions (Dnyaneshwar)
- Fix clang build (Andy Shevchenko)
- More clean up on drvdata usage in display code (Jani)
- Increase fastwake DP sync pulse count as a quirk (Jouni)

----------------------------------------------------------------
Andy Shevchenko (2):
      drm/i915/fence: Mark debug_fence_init_onstack() with __maybe_unused
      drm/i915/fence: Mark debug_fence_free() with __maybe_unused

Dnyaneshwar Bhadane (1):
      drm/i915/bios: Update new entries in VBT BDB block definitions

Jani Nikula (19):
      drm/i915: fail module probe on nomodeset and i915.modeset=0
      drm/i915: deprecate the i915.modeset module parameter
      drm/i915 & drm/xe: save struct drm_device to drvdata
      drm/i915: support struct device and pci_dev in to_intel_display()
      drm/i915/audio: migrate away from kdev_to_i915()
      drm/i915/hdcp: migrate away from kdev_to_i915() in bind/unbind
      drm/i915/hdcp: migrate away from kdev_to_i915() in GSC messaging
      drm/xe/display: remove unused compat kdev_to_i915() and pdev_to_i915()
      drm/xe/display: use xe && 0 to avoid warnings about unused variables
      drm/i915/hdmi: convert to struct intel_display
      drm/i915/dp: convert g4x_dp.[ch] to struct intel_display
      drm/i915/dp: convert intel_dp_tunnel.[ch] to struct intel_display
      drm/i915/dp: convert intel_dp_aux.[ch] to struct intel_display
      drm/i915/dp: convert intel_dp_link_training.[ch] to struct intel_display
      drm/i915/pps: pass intel_dp to pps_name()
      drm/i915/pps: convert intel_pps.[ch] to struct intel_display
      drm/i915/psr: convert intel_psr.[ch] to struct intel_display
      drm/i915/ddi: stop using dp_to_i915()
      drm/i915/dp: hide dp_to_i915() inside intel_dp.c

Jouni Högander (2):
      drm/i915/display: Add mechanism to use sink model when applying quirk
      drm/i915/display: Increase Fast Wake Sync length as a quirk

Rodrigo Vivi (1):
      Merge drm/drm-next into drm-intel-next

 drivers/gpu/drm/i915/display/g4x_dp.c              | 152 ++--
 drivers/gpu/drm/i915/display/intel_alpm.c          |   2 +-
 drivers/gpu/drm/i915/display/intel_audio.c         |  34 +-
 drivers/gpu/drm/i915/display/intel_ddi.c           |  14 +-
 drivers/gpu/drm/i915/display/intel_display.c       |   2 +-
 .../gpu/drm/i915/display/intel_display_debugfs.c   |   2 +-
 .../gpu/drm/i915/display/intel_display_driver.c    |   8 +-
 drivers/gpu/drm/i915/display/intel_display_irq.c   |  13 +-
 .../drm/i915/display/intel_display_power_well.c    |  15 +-
 drivers/gpu/drm/i915/display/intel_display_reset.c |   7 +-
 drivers/gpu/drm/i915/display/intel_display_types.h |  14 +-
 drivers/gpu/drm/i915/display/intel_dp.c            |   6 +
 drivers/gpu/drm/i915/display/intel_dp_aux.c        | 130 ++--
 drivers/gpu/drm/i915/display/intel_dp_aux.h        |   6 +-
 .../gpu/drm/i915/display/intel_dp_link_training.c  | 105 +--
 drivers/gpu/drm/i915/display/intel_dp_tunnel.c     |  77 +-
 drivers/gpu/drm/i915/display/intel_dp_tunnel.h     |  11 +-
 drivers/gpu/drm/i915/display/intel_dpll.c          |   9 +-
 drivers/gpu/drm/i915/display/intel_frontbuffer.c   |   7 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c          |  10 +-
 .../gpu/drm/i915/display/intel_hdcp_gsc_message.c  |  67 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c          | 500 ++++++------
 drivers/gpu/drm/i915/display/intel_hdmi.h          |   1 -
 drivers/gpu/drm/i915/display/intel_hotplug_irq.c   |   6 +-
 drivers/gpu/drm/i915/display/intel_pch_display.c   |   3 +-
 drivers/gpu/drm/i915/display/intel_pps.c           | 563 +++++++-------
 drivers/gpu/drm/i915/display/intel_pps.h           |  10 +-
 drivers/gpu/drm/i915/display/intel_psr.c           | 848 +++++++++++----------
 drivers/gpu/drm/i915/display/intel_psr.h           |   8 +-
 drivers/gpu/drm/i915/display/intel_quirks.c        |  68 ++
 drivers/gpu/drm/i915/display/intel_quirks.h        |   6 +
 drivers/gpu/drm/i915/display/intel_vbt_defs.h      |  37 +-
 drivers/gpu/drm/i915/i915_driver.c                 |   4 +-
 drivers/gpu/drm/i915/i915_drv.h                    |   8 +-
 drivers/gpu/drm/i915/i915_module.c                 |   9 +-
 drivers/gpu/drm/i915/i915_params.c                 |   3 +-
 drivers/gpu/drm/i915/i915_sw_fence.c               |   8 +-
 drivers/gpu/drm/i915/selftests/mock_gem_device.c   |   2 +-
 drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h  |  13 +-
 drivers/gpu/drm/xe/xe_device.h                     |   8 +-
 drivers/gpu/drm/xe/xe_pci.c                        |   2 +-
 41 files changed, 1546 insertions(+), 1252 deletions(-)
