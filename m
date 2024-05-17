Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 363298C8E4C
	for <lists+dri-devel@lfdr.de>; Sat, 18 May 2024 00:40:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BF4210E0F1;
	Fri, 17 May 2024 22:40:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S6OT0mTz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 901AD10E0E8;
 Fri, 17 May 2024 22:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715985634; x=1747521634;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6U8HjqZN6PKQxCJo+n9y8vrIm96MaQOuQlVkGC0nIII=;
 b=S6OT0mTz8PbNOZqwQqpyZnuBCDdgStYpdXlsiT+JMJZgWWFDtg2MNATQ
 dc+OeFpRQTlKU8Xt0M8V7SWutmk4br1dphS93R0MJ8ga9mlIqg8i6/Wa6
 RMNLLCUTa9yHdZtE2Auefyyza4+B8jmlPP8AVpissN2ahKlnjLmXByMeH
 Yqy5IxAH1J8C0VVKKW1jK1juqD1pz/1MpaDtPgv117vsfsSpEVZwqddpX
 hQz04ydx4QA4hHEfMKWx4jY7gu5fwjPRkbjbP2GgjMpwywcdkCosszdM2
 M6Xo83A1g4Utm4MpEIqhrIVFqgIJ1OLa6agvXL4NKIk31O3Y+FIiGi9rq Q==;
X-CSE-ConnectionGUID: TcuNCkVqRXWmu1iUO+ZwfQ==
X-CSE-MsgGUID: /q8gs8WTT7iHXVVCrQTJ4Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="11987399"
X-IronPort-AV: E=Sophos;i="6.08,169,1712646000"; d="scan'208";a="11987399"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 15:40:32 -0700
X-CSE-ConnectionGUID: MVB06U3gR9C/MoSNjMNShA==
X-CSE-MsgGUID: 1mVOuWydS0aBjTeMif2JqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,169,1712646000"; d="scan'208";a="36838323"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 May 2024 15:40:32 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 17 May 2024 15:40:31 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 17 May 2024 15:40:31 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 17 May 2024 15:40:31 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 17 May 2024 15:40:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=alG4wssZ1HrwXKEcLlZ4D34NSrRh7y1VogEBmMptgF6Jy1U4FMzTD+MwN5cyJN3dZJJfcQBH/q6/JJfQxWpa6AMFoCtakTB1tQwfleD4ZX+RCObwt0CsGusbiOnDD84VaOFadDpBghTB83h8F+lGNp+jqBK06vkb1KGr36yXyQM0oaURYWLs1J/CPd+j1wDyPv8haBaEhdTTqDN3vSRqOpfvFtI0IWgJrFcumPJpLshr8JyZsGULQPp2zNrBjm7/0IHvTY1rf3yirWZqP9Uem9jQRTPnrVbCA5ezhdnGWia9BUsqWGPIuomqqyXu+fGujjLX/O0ZWxFMTdLgo6nNMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ngRKb4HNzImI+/a6RfoFexlVF9ugBFqbTbW5xV9kRM=;
 b=XFVKRsNHPxVdsYcX1AOcAkvQgQYDXbVrUDdksSvx5fAQ4SzAyOjnNp9CObIXAu31amWBAXstalE1IkZlK9fUBUVSKNiJ1giHJ8iIq9q73L2CT+fw5NbXGk/qzfzZ74Rih7dqBtvjXrhqbs/GvrhvgYCvbwKel/V9MGaN0GDg0RmCQmd06D1CV0zIGqf1YMPJuwPhKGU9f3rrKvx5wyY83mdXE7xGkVqQcJvhqF5a7g+T9k8Gu64zIuiwIGl6lOUj6ZnKwT7p3metCpl9EZLywHu1Wsfz7IlOyCrfrCUNZFgG11NeZu028wzuIaIVo5RwT4HCvY+SeFhiFnwWNXW/1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA3PR11MB8074.namprd11.prod.outlook.com (2603:10b6:806:302::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.29; Fri, 17 May
 2024 22:40:25 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7587.028; Fri, 17 May 2024
 22:40:25 +0000
Date: Fri, 17 May 2024 15:40:22 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v5 5/8] drm/xe: Add helper to accumulate exec queue runtime
Message-ID: <20240517224022.GC2343622@mdroper-desk1.amr.corp.intel.com>
References: <20240517204310.88854-1-lucas.demarchi@intel.com>
 <20240517204310.88854-6-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240517204310.88854-6-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR04CA0002.namprd04.prod.outlook.com
 (2603:10b6:a03:40::15) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA3PR11MB8074:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a1564ed-5e7c-4bbc-07c3-08dc76c257e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HCQCukwY6mU6JRVWdtlp8ekQAzy9bmywF+dFF8DpFjTwGcVCLFrpRw8Uw9wg?=
 =?us-ascii?Q?AFRCxASUmbOyyxeli2tASNFbpaRUn6Zt2QUiO9LMsgk3OC4SBq/MFzYR+XZ0?=
 =?us-ascii?Q?If8koAx4uS9iXm8mkdfAExPXGkf2QPVKPzs1xY7w8njXTboD4yhluJAjO987?=
 =?us-ascii?Q?ANSTCqY+GzEok7BhKwXu8odJVoPaQ+aUAm7sk8DGkhy3e3cTi5eUwoQQ/8/h?=
 =?us-ascii?Q?gWMdBpnQOTMsH7o8CTc6e9PxsIGHgoFxHxN7/gkvRhNXz0LgN5u8MZA9Nv7Y?=
 =?us-ascii?Q?Dk32gpvcnmcSf9qznvE576AV5LuVTVqjFBctXu9TTZqvim5skbE87ZlLl5Af?=
 =?us-ascii?Q?4hp4D+l4DIzj2+vzVyUhAK6AVbhqDmFX6oFj1MwETwerVakAOk3qeFKiPysz?=
 =?us-ascii?Q?TzEgj0MhWfRmOfw83tf7SwgXaJlqoR7frfpEnJKXFYi/xw8mH0WA0XibRp+e?=
 =?us-ascii?Q?RmGcBbHLCAYKn3MDHR5NTVzRK/arBpIBCxDNv2NpNyxG/zb2kgLN1KYM96mV?=
 =?us-ascii?Q?u0JoBjxeBz2lhNzsrfR/3QqoyGgC7ud6VLMPQ/CuQcZQ8jSnj49cLnj1t7Cl?=
 =?us-ascii?Q?FF+E81ab60CvJnDJHJ19G4S1H/I5piIt8YFgENE0/7/R8eN1PiV+s/Aal0RL?=
 =?us-ascii?Q?XaXzfBJKqZQHy6cSVHfcTJGFIpB9ikGYSAwCpu2Yvi2WQ3Aa/O4JNTKYasjI?=
 =?us-ascii?Q?G6/Y/24GPAtwXfQ9rSpJISJdiBQ2QovgH7nwHX0MsZLOAZSiKZsCuqSMT2yk?=
 =?us-ascii?Q?XXhS5oBROIK9MaYAh7kv8fbthg+W0ZXh80hAmoD7US0muXU2awp9XIBjJdBd?=
 =?us-ascii?Q?/Sq9BFO4eGhSPBJRKlTo5ZPSwaJtNpeHUBBvk9JGzcXj1HFwbHzNOUC0rOgX?=
 =?us-ascii?Q?myw2gezheFWewZsp40+IOc9v5bTmCVoMocRE4s26DAWjoRmU+ZTGMS3DmwEX?=
 =?us-ascii?Q?BZa9Z16i/Mxn0Hbmvbiw7NoLkTLIPqWLoAFqz0oWvF9aIwqPlmWA/+1SiycO?=
 =?us-ascii?Q?KEm1WUDGZJ48r23GBVH1tN5KeDDgWlHhFRBEOm0twbD7YnCVeAwuKY9bOvqO?=
 =?us-ascii?Q?yVLNqvTqCwFBOwvM5HQ6YNQn7GTlnb7x8VbfwkVpgOm1iB9z5632Jo8Vewfs?=
 =?us-ascii?Q?8TYjUs6MV8Ze7pnoP9mJ/QFxQcSL7KDyNil/0AbSPR8z6d4VucHZe5NLZjKe?=
 =?us-ascii?Q?If+5MWO5k+irpfdiN3C1Xjy563jPazyf5q3c2CqQNJAgyT9cNZT5qqrleteq?=
 =?us-ascii?Q?jqN9EpCLjOVUc206FNWpA+17qFLdrMiP/eJh9aW0/w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+5njFQItDkOHhSudRtEjsqAYUQ1bMinB1U/g9My9Rqb+ooktugFhtiqg5+nv?=
 =?us-ascii?Q?V13Ts62a8eBTQWksfYq06MC50y2aAbAWTyFm56f0C50AdDGvnemNyNV7cVeS?=
 =?us-ascii?Q?oEDdpwMNNz7c8eAun0oeQCd/PZyUlXBQ2ogk1CFtC9oZn7T0oCvCV4AxJ7ay?=
 =?us-ascii?Q?ZjmUgKeiKzilO384SN17aEu1hiWunMpMxaNRS0hmp65zXKApZqTJhWPHhq82?=
 =?us-ascii?Q?MCBvMtWFw4h5ePDdvSmQhtxEctJ7VpHJSHb/T0MQYJ0WZBHhxAcI+wWUsrXU?=
 =?us-ascii?Q?+FaKOgKW5bCcka2Nbh9ojNB3sNQ0YKB2fSfmc2jOfhliodtzK9xJk1p0hLAy?=
 =?us-ascii?Q?21JBaTWojW3fTqiwHmNvfODLr38hbJO81aGwaeI5k5EqjS/gI3N1VaS2EfLJ?=
 =?us-ascii?Q?d9Zj3Fkt3raQANX/o0PyKRWEHiKE6LwzUuM+CK4L7zLZXkcFHErp+WbzYrgB?=
 =?us-ascii?Q?czdEI3NJ029pjKHITvuz6AbdYLWod7UmOPz0CxgK9Xb/bvwXGT/Ag9g01Qla?=
 =?us-ascii?Q?lERbu2rG2Z2+Z3QLZX5+LVMNakTwazcMydrlBKfr11DJ5tNhze3A/clszF9k?=
 =?us-ascii?Q?ZVbHrmx69rheyPwl4A09tlXTR45bEJGYu2bEMdYQd0J1u6bKUDByVNlKi1tg?=
 =?us-ascii?Q?hN/nF2iVckOy8aojm+hU5vzRGSJZbB8qZCkIW6dynbK0W4OwGhMzNVdsxLys?=
 =?us-ascii?Q?2InvhBkKOB9b70Y+3zU79xVYnIJskdPRv2b7ciF5qt42R7AhymdAbsRl5wpF?=
 =?us-ascii?Q?XxeJTOPOJoh5q5Lzup7hdFoJ/liosdqSSBHZbxBW/dpnG/ARm7VA0ew4+k0H?=
 =?us-ascii?Q?3OrWQSEjLcc/4TGBN/jVZbDOnJQkAwcnqHgU0gj5qe9FIiuO7APp7pEXQGu/?=
 =?us-ascii?Q?4HGZMDuPPVx/jL6B2nfnodlX3gCdhf+N8gmilSwMWcU9PvGakg0Hj7XGmSKV?=
 =?us-ascii?Q?Zk5Ww1UH6KqT7OSVWlP9xXb+4czRI8HrlSu5Y8YJ28zF3+PzWUxFvp4kG6cq?=
 =?us-ascii?Q?AmnM0DpEHbW6k4p8i8LsYCc6derZPbA2a3OKehhzDfue1IMabEmVf3s4EMfM?=
 =?us-ascii?Q?WgnF9di+2N2kqtWp6Ru8IIUhNhyykOCSMPQG/vDUzeUCf5PYSMJGJ3X9Jhie?=
 =?us-ascii?Q?xgUuiyJGOzWBCyfE4d+3qgbkyRnQ43CkAFhRFfAX8hLXTq90p9ZA9Jo/ML5U?=
 =?us-ascii?Q?tVgNd2Pg/P4PMbF6k5ELqYUkw2S5YbC66nHSNNYlCIvToPzf1Eb9vJuaFRfh?=
 =?us-ascii?Q?dT5bSHoITqun4p+iRQWrz6COR6XGcykpbLv9qretI0HyCH0QxrQlSrAkrc5S?=
 =?us-ascii?Q?2uFD7if6M0q2+H0JiBAFXzLbNrKly6w4VgOJzrfE7XuXos2um8/xwqeOGXHp?=
 =?us-ascii?Q?AhW0RtVWBvBlWUDmCwr7Fd3b4kQwWjAa53Sx9p9dzguVi6YlMbw9j48cjlgT?=
 =?us-ascii?Q?ZatOYk8lGxwqNmH2CGcQvqXwLqQ/ZrOvKnqigOcL5UvQp4dMyiq/VmIzeae+?=
 =?us-ascii?Q?b63F0/Z//jShYtKuYPHuYWn9hqLOBRLB9YBdQ5vn/qii4B9gegOz5JnwmDZi?=
 =?us-ascii?Q?fKI6ZkiX0wMTbiikzoiOvCzEzNc/qyUZ+haOog5V8z6GXcFIlvrRAo/4XAIZ?=
 =?us-ascii?Q?BA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a1564ed-5e7c-4bbc-07c3-08dc76c257e4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2024 22:40:25.3519 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UAlKdcNaVUCxfeEJ49lUiY2ZflPXwnz3A2K5dG65I8ZUDJCvZKXuVLG+Ia3g52K0nG9GfXAmfGSw49EryPIO+ESKJ6U8HNtXXDxS56iQjyI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8074
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

On Fri, May 17, 2024 at 01:43:07PM -0700, Lucas De Marchi wrote:
> From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> 
> Add a helper to accumulate per-client runtime of all its
> exec queues. This is called every time a sched job is finished.
> 
> v2:
>   - Use guc_exec_queue_free_job() and execlist_job_free() to accumulate
>     runtime when job is finished since xe_sched_job_completed() is not a
>     notification that job finished.
>   - Stop trying to update runtime from xe_exec_queue_fini() - that is
>     redundant and may happen after xef is closed, leading to a
>     use-after-free
>   - Do not special case the first timestamp read: the default LRC sets
>     CTX_TIMESTAMP to zero, so even the first sample should be a valid
>     one.
>   - Handle the parallel submission case by multiplying the runtime by
>     width.
> v3: Update comments
> 
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h |  3 +++
>  drivers/gpu/drm/xe/xe_exec_queue.c   | 37 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_exec_queue.h   |  1 +
>  drivers/gpu/drm/xe/xe_execlist.c     |  1 +
>  drivers/gpu/drm/xe/xe_guc_submit.c   |  2 ++
>  5 files changed, 44 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 5c5e36de452a..bc97990fd032 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -555,6 +555,9 @@ struct xe_file {
>  		struct mutex lock;
>  	} exec_queue;
>  
> +	/** @runtime: hw engine class runtime in ticks for this drm client */
> +	u64 runtime[XE_ENGINE_CLASS_MAX];
> +
>  	/** @client: drm client */
>  	struct xe_drm_client *client;
>  };
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 395de93579fa..fa6dc996eca8 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -769,6 +769,43 @@ bool xe_exec_queue_is_idle(struct xe_exec_queue *q)
>  		q->lrc[0].fence_ctx.next_seqno - 1;
>  }
>  
> +/**
> + * xe_exec_queue_update_runtime() - Update runtime for this exec queue from hw
> + * @q: The exec queue
> + *
> + * Update the timestamp saved by HW for this exec queue and save runtime
> + * calculated by using the delta from last update. On multi-lrc case, only the
> + * first is considered.
> + */
> +void xe_exec_queue_update_runtime(struct xe_exec_queue *q)
> +{
> +	struct xe_file *xef;
> +	struct xe_lrc *lrc;
> +	u32 old_ts, new_ts;
> +
> +	/*
> +	 * Jobs that are run during driver load may use an exec_queue, but are
> +	 * not associated with a user xe file, so avoid accumulating busyness
> +	 * for kernel specific work.
> +	 */
> +	if (!q->vm || !q->vm->xef)
> +		return;
> +
> +	xef = q->vm->xef;
> +
> +	/*
> +	 * Only sample the first LRC. For parallel submission, all of them are
> +	 * scheduled together and we compensate that below by multiplying by
> +	 * width - this may introduce errors if that premise is not true and
> +	 * they don't exit 100% aligned. On the other hand, looping through
> +	 * the LRCs and reading them in different time could also introduce
> +	 * errors.

At the time we're executing this function, those LRCs aren't executing
on the hardware anymore and their timestamps aren't continuing to move,
right?  I don't see where error could creep in from just looping over
each of them?

I guess parallel submission is mostly just used by media these days,
where the batches submitted in parallel are nearly identical and
expected to run the same amount of time, right?  Do we have any
userspace (or potential future userspace) that might submit
heterogeneous batches in parallel, which would make this inaccurate?

I'm not very familiar with the use cases of parallel submission, so I'll
trust that you've got a better understanding of the userspace usage than
I do; everything else here looks fine to me.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


Matt

> +	 */
> +	lrc = &q->lrc[0];
> +	new_ts = xe_lrc_update_timestamp(lrc, &old_ts);
> +	xef->runtime[q->class] += (new_ts - old_ts) * q->width;
> +}
> +
>  void xe_exec_queue_kill(struct xe_exec_queue *q)
>  {
>  	struct xe_exec_queue *eq = q, *next;
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
> index 48f6da53a292..e0f07d28ee1a 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
> @@ -75,5 +75,6 @@ struct dma_fence *xe_exec_queue_last_fence_get(struct xe_exec_queue *e,
>  					       struct xe_vm *vm);
>  void xe_exec_queue_last_fence_set(struct xe_exec_queue *e, struct xe_vm *vm,
>  				  struct dma_fence *fence);
> +void xe_exec_queue_update_runtime(struct xe_exec_queue *q);
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> index e9dee1e14fef..bd7f27efe0e0 100644
> --- a/drivers/gpu/drm/xe/xe_execlist.c
> +++ b/drivers/gpu/drm/xe/xe_execlist.c
> @@ -306,6 +306,7 @@ static void execlist_job_free(struct drm_sched_job *drm_job)
>  {
>  	struct xe_sched_job *job = to_xe_sched_job(drm_job);
>  
> +	xe_exec_queue_update_runtime(job->q);
>  	xe_sched_job_put(job);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 4efb88e3e056..ad2b8067d071 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -749,6 +749,8 @@ static void guc_exec_queue_free_job(struct drm_sched_job *drm_job)
>  {
>  	struct xe_sched_job *job = to_xe_sched_job(drm_job);
>  
> +	xe_exec_queue_update_runtime(job->q);
> +
>  	trace_xe_sched_job_free(job);
>  	xe_sched_job_put(job);
>  }
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
