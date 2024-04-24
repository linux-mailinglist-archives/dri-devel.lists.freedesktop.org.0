Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D5A8B0064
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 06:09:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6458C10E141;
	Wed, 24 Apr 2024 04:09:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IvpTJr0g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F177310E141;
 Wed, 24 Apr 2024 04:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713931747; x=1745467747;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kBMGieC+l5umOQrMolkxE+1/rW6IoPGUNo+LVChsOTo=;
 b=IvpTJr0gHMy3MJsd5FwHsCAaRG44vOMXgPVSI5T1uRZ6PrseARjF3lst
 +1QadHTkHkwpmZFOjq5xn2EZoOJBHpjB12BO7P+v8AS1tDkPaNhkAy4ME
 0BgLQwKVPi2pCpyRWTAGmnrZSyTb2hLf2ollHgP7TR0v112p5nMw8ZOwU
 Yrthl7yDUsNYpn5N/1UfZOyNr6N8uqyEXSwMC0cBaQCukaqAgYBKHfwQY
 m7ihY5sy/zmxmbeRY5ppxyW9N+d3F2GJ8mYX+dPjxHV+w9iyiuIHk9aOk
 hlBkrywo225iGKQSRqUtRjGuVGufCPmqrYSp614Dn11GVK1NMutvTkes2 A==;
X-CSE-ConnectionGUID: IqXutCguTniB7PHqHz8SfQ==
X-CSE-MsgGUID: OZYQm5+ITqazeb5u7hLGKw==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="13333412"
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; d="scan'208";a="13333412"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 21:09:06 -0700
X-CSE-ConnectionGUID: FcJw9rruSh+L1hRnA9EWgA==
X-CSE-MsgGUID: H2PlsaI/QF2cg4/lcR/DgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; d="scan'208";a="29220192"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Apr 2024 21:09:07 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 21:09:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 21:09:05 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Apr 2024 21:09:05 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Apr 2024 21:09:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NiZ6JL+iZkOFBxnvrDLAhZOYreAzaQKob4PLWi2y8PT4IzIow8j9nTz8RJT9eMO3eONx/UsFOLr7yMd/PqEMGFzWIFvvMkxWuni8VRTkIQcw4TqBPQ2uxVf5oW1cj/W+QYy/LCc4wxF1TbLZFURqN87xv5S/7sGYnrNhOVZKgw/akQzvzsfWEl3sNl+RwcUkEyv/cGzb0rekbev77IgilQYpO7qldr2xVqtkT/sYFaThcTpRv/6BOfCul6hceitUv9yr3hwOPZWKFvIO2jV9w4rKd2ZHDcZP5QFUAMt13m5Ml/gUv2NvoHtPh9EoGBpHgllOopyT/99k+7PIk1E+dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UgcsePsa31VO6WIaoi0hzcE5GWOIAkOb+7LEyEFy2CM=;
 b=N+4R83KYn0jNzg0QNJSJvItOa8HoS/QOW64orvII98z7Nmbr/iIEWVwS3HH7E/CrMzJ8YM7g4ys4EdO5KaaTj4bqdaMEOxBwBkWXrYcgY8LWn8ArojXo67zV5TpQWkXbT9GAraunxOcBnIms7fSx9WMUsPXOQMAp0nQt2PxWtAnZy7mjS52TTmge1AjmP4czPAzYlz4LQ1fDoy5ZTsqRCL7+JfcuJO6xoCGjJb3Rof+QEfLZysiRpP+EculkvechhYdH1x9DO2FNQBhLblhEz1/h711GyRsRfKF8rQ8hUVsiHdYOL4AdMyag4JSqbpdKi2vJEY0EmYGzojDeWZH5FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB6958.namprd11.prod.outlook.com (2603:10b6:303:229::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Wed, 24 Apr
 2024 04:09:03 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7519.020; Wed, 24 Apr 2024
 04:09:03 +0000
Date: Wed, 24 Apr 2024 04:08:29 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, Umesh
 Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>
Subject: Re: [PATCH v2 3/6] drm/xe: Add helper to accumulate exec queue runtime
Message-ID: <ZiiFvZYWhpdi8ZKL@DUT025-TGLU.fm.intel.com>
References: <20240423235652.1959945-1-lucas.demarchi@intel.com>
 <20240423235652.1959945-4-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240423235652.1959945-4-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR11CA0037.namprd11.prod.outlook.com
 (2603:10b6:a03:80::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB6958:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fc4b2ed-105b-474e-160c-08dc6414471d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gmdBZ+qfUoKsGMHlTF1MzVxCUrV0Hklf2U4H/skwi30g/65lS2gnw13+VtgV?=
 =?us-ascii?Q?oskTSxcR9eXBS/CWyHaqbmd3NL5ISv198P8UOsQKGZS4lNi2rbkdQQSgiPQG?=
 =?us-ascii?Q?TIbfpc4clX2UP1+VIWlWGtTpd0tPNSZzYGMCwnB1nsAfxEa8GQvLjmPNX2uh?=
 =?us-ascii?Q?6py2Jt2Bz0r5m9jUPM4VjcM8OrXmL1xmD78WWENAaYVD02sjg+0dbgMpVw1T?=
 =?us-ascii?Q?FVN3qYRQ5IsN6KnCydczsPnjX3zfBpdn3/RbAkSZtIVgL7mNYbdeSdvlMB8Q?=
 =?us-ascii?Q?RHVD9pblf2hEE7eeSrvjd5SPgZo00anxUmbPXjgat0txDQEJ+z8zJ6f/Ljiw?=
 =?us-ascii?Q?bs9HHAd+M+uWh8xXx99a6UabxbMvBfdSF4naFDfN9Ess4dq32B3WZxni9+2c?=
 =?us-ascii?Q?AIYfEcxR20YQzIvBHvIwt9wKTRXWgLkPoKVizKAlqpiPvG8vv9TW9TFaRY+m?=
 =?us-ascii?Q?yHReAv28QwuZqeY/+UVgwKFDc6B0+1EBn3PCGJx0iGfMub4xqxYvL9lVG8bc?=
 =?us-ascii?Q?qP6DTPtb3gWUqTORIGU3QF+zE2Q2Wcc6/0YQFkEBHRhhZ9TnC4uX9NsKRcRr?=
 =?us-ascii?Q?Y0ZjbKTY9tbSBht1RoTbX8pjaCqX/a/Q3N6xLCDAt71+s1EsRGBkaSyq9DcV?=
 =?us-ascii?Q?yR2fO5Temu3hQQ4rl4EoX2T77HNDEjH4ExO12U9yE+vT14qjmSAff3tT2C2C?=
 =?us-ascii?Q?MxvS/lx3mE2z2kKOD6oYdn4lUj8GNZLwiCn6/D9ljQ8HaPHwpN6MZmgSpq/0?=
 =?us-ascii?Q?XakcfG392jA/9+QU14IQ+tpNrmuDsXMpUcF18HsjZzuk+csz3tjD+7bEtYTK?=
 =?us-ascii?Q?OYgtJga4PTFlbPWTogOO7IFvMKg0FabiWklgQeiXpgXrfc/v63L0kh6IaCYI?=
 =?us-ascii?Q?siYD1XAtHCWpRLsuVhR9znv/oOGa3qqNGEgguobHtknSZHT2N217PmMdAlVe?=
 =?us-ascii?Q?xH6bhAGuqdCyN83mnTyJUskZsA8RiIaNaxWw2n08NK33iMRTAssZC+37viQs?=
 =?us-ascii?Q?AFyNpVwUyxzQwv9s42LSt+a2awPTDBcSLRQQ9+Epac65euUK8GHq/wWN2XKJ?=
 =?us-ascii?Q?7aQfj4zxXLxpkanVBMReJTvV5OWEvej4fLpjJzQGNpaSYiTW6K10Lekm/da7?=
 =?us-ascii?Q?TYytWUhhRzb8Z/XUB+kLvvFabdo3ZyXBjHQ4DDQSdtDOyttCv966RwNEiKg8?=
 =?us-ascii?Q?dM/wLCytQa8wWezu25HamcN6tZiz4wdHat7bbqvBfHvUTx70Hbs91WAOAUWg?=
 =?us-ascii?Q?VlT7UqkfRuKHKW/U78dYR5GX/V+IGFlV2ezca0tHAA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?04ngcQbEMObBKYfUyLa8tX+djc063vjs4bxfmHIiX9Q621dVgTbLphc8nQxv?=
 =?us-ascii?Q?qzN5oiXDT/5Hlw/c5m6fPU9bIVDYGd9THejbnhRKVNSoqhAb9rGvpZ6HK2/l?=
 =?us-ascii?Q?JveHkhtIKS7XLiFtu1whrF9lDaye6c//RM9X/fI3VXuax4U1Q2AZWIWWpAdY?=
 =?us-ascii?Q?WcEjl9B2LyCZEa12vcp+D9yNeiceAxpOcuwkCyk5FG/62u2t4WTAXVdRfsUj?=
 =?us-ascii?Q?2paji49+0kuu3S0r+UgGTgAIPhQeAPM9OvGs0Pyeq5rJOLgnrN0ImSwbqMyA?=
 =?us-ascii?Q?q0kdAg1D24jbe7eaIEqwv6pn5maO4eKSK225OQKq9IG9VqBGyO7R1oK3CrzQ?=
 =?us-ascii?Q?er3E+wiUGCBS2Em36gL77gsqVPRly1/x8YlForHI9iEvgwLseWb62xOaHEQu?=
 =?us-ascii?Q?l9jRY3jFQgkypkHHUz4cenpUIJY6uUv/OTXgmgH6OHeUOzzQqGOexXL5qlXT?=
 =?us-ascii?Q?+CbcajmFApRtg7wulLJCJi5Gy6KCQk7iXCrC2qbfeJ55PYzvGvtnZfo3a1rr?=
 =?us-ascii?Q?R54ijLA3B3kh45zHdyAIvvIR0YB0nafB+JvJ1A1ApWmzBPrLPyJSkkJaUNFo?=
 =?us-ascii?Q?udQuP2aTySYZiymTJN/cOJQckrLCHx7Vz2rSCgl5XAeTVvwtYh9MMAtghVAS?=
 =?us-ascii?Q?lb1L7LEbI6+NA63YhaHL7UB2jb8CYvyyYwnR8CxMdn4ThNpPzMdwFUHSJvW9?=
 =?us-ascii?Q?uYVt/BELxUWFmZgZJtGtNZEjQpuXx9iyaOReXZ0M17aQT07M4/jTJ0Tr/fWJ?=
 =?us-ascii?Q?xcPBs3T70Juw3wB9puSCxQs6OR4Af00Pu8EqfojFybj6QHUUE55TgoaybKF2?=
 =?us-ascii?Q?TU9kiEZUqzDuE7sPd5PNk7DcMCOwY4TykvEwqGbuf/HYa4xfrPphB5Vw6Vei?=
 =?us-ascii?Q?J/eSdHvNRE+Exos8ZshC6auYaPEsdM5EQ88vxR4semIeqmSXOXMXgItS+Amp?=
 =?us-ascii?Q?fqbYQeo0XPyi1x8dzJeir81qPTFtqSBaoRq/arMC0TFQcJWxVH26wywtWATd?=
 =?us-ascii?Q?T0v6BDrOC9ph9ubMUI0vPW+51UnXYxq9JSSU6Ex7xbNMe+98FpL94MdW/hny?=
 =?us-ascii?Q?l/8uGab4tl46g8whz0lYSlquhjZebNfU8pA4eP4RXuMNgTa+by2lxkYlDneu?=
 =?us-ascii?Q?TaV/yAO3G/bhUW78YoN29dR2TLuv9V2rxw6NuCDvsQmIRkRXUtYoP0yXWh73?=
 =?us-ascii?Q?gXR/1XVnRBK0/ZCkzNum3fPKoAYsX29mlzRUI0v45iz7dLPfUT+udQz60AHr?=
 =?us-ascii?Q?gOZpJKEgablmJSxl/XjFkdEDQES4pAAjD4frOs0J0JRIgaHBfKcSZU2ebvfL?=
 =?us-ascii?Q?2bYTjaRfq7TQz5NuM5TkuFuBz1cU2N7TK7gvK08ohpRiikBfyi59uNHIikym?=
 =?us-ascii?Q?Q7/WeDKNzcoRt3FDQiUpJ8TE8NpCxhjsjq2BDclYBP3KjaNuClfU+D9q7XTw?=
 =?us-ascii?Q?RAThpeHuiRNcMuIAx6tDR2uUZvmIaX4cnXpeMer+aSX6fXPEUP2PiGWPvccT?=
 =?us-ascii?Q?U9g9fX89/JxgLW+bchLlhVzXqRoVTlDL4/1ZRjZJQZQxYQlk3OktAOvneIgx?=
 =?us-ascii?Q?5esFXKG01QoRLPDdAEEZVN7kqXcNYVVRnNLw7OThydqVbuhltESPI/hTEfrB?=
 =?us-ascii?Q?uA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fc4b2ed-105b-474e-160c-08dc6414471d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2024 04:09:03.6935 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C3/bS4csRstVRnh85WcTjz8sTHyUasDIRPy06BW/i+sJrz/+cfC1zJaw5HDBA3xD9JFWAfdZ7HwmhmpUWtqEwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6958
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

On Tue, Apr 23, 2024 at 04:56:48PM -0700, Lucas De Marchi wrote:
> From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> 
> Add a helper to accumulate per-client runtime of all its
> exec queues. Currently that is done in 2 places:
> 
> 	1. when the exec_queue is destroyed
> 	2. when the sched job is completed
> 
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h |  9 +++++++
>  drivers/gpu/drm/xe/xe_exec_queue.c   | 37 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_exec_queue.h   |  1 +
>  drivers/gpu/drm/xe/xe_sched_job.c    |  2 ++
>  4 files changed, 49 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 2e62450d86e1..33d3bf93a2f1 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -547,6 +547,15 @@ struct xe_file {
>  		struct mutex lock;
>  	} exec_queue;
>  
> +	/**
> +	 * @runtime: hw engine class runtime in ticks for this drm client
> +	 *
> +	 * Only stats from xe_exec_queue->lrc[0] are accumulated. For multi-lrc
> +	 * case, since all jobs run in parallel on the engines, only the stats
> +	 * from lrc[0] are sufficient.
> +	 */
> +	u64 runtime[XE_ENGINE_CLASS_MAX];
> +
>  	/** @client: drm client */
>  	struct xe_drm_client *client;
>  };
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 395de93579fa..b7b6256cb96a 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -214,6 +214,8 @@ void xe_exec_queue_fini(struct xe_exec_queue *q)
>  {
>  	int i;
>  
> +	xe_exec_queue_update_runtime(q);
> +
>  	for (i = 0; i < q->width; ++i)
>  		xe_lrc_finish(q->lrc + i);
>  	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && (q->flags & EXEC_QUEUE_FLAG_VM || !q->vm))
> @@ -769,6 +771,41 @@ bool xe_exec_queue_is_idle(struct xe_exec_queue *q)
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
> +	lrc = &q->lrc[0];
> +
> +	new_ts = xe_lrc_update_timestamp(lrc, &old_ts);
> +
> +	/*
> +	 * Special case the very first timestamp: we don't want the
> +	 * initial delta to be a huge value
> +	 */
> +	if (old_ts)
> +		xef->runtime[q->class] += new_ts - old_ts;
> +}
> +
>  void xe_exec_queue_kill(struct xe_exec_queue *q)
>  {
>  	struct xe_exec_queue *eq = q, *next;
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
> index 02ce8d204622..45b72daa2db3 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
> @@ -66,5 +66,6 @@ struct dma_fence *xe_exec_queue_last_fence_get(struct xe_exec_queue *e,
>  					       struct xe_vm *vm);
>  void xe_exec_queue_last_fence_set(struct xe_exec_queue *e, struct xe_vm *vm,
>  				  struct dma_fence *fence);
> +void xe_exec_queue_update_runtime(struct xe_exec_queue *q);
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
> index cd8a2fba5438..6a081a4fa190 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job.c
> +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> @@ -242,6 +242,8 @@ bool xe_sched_job_completed(struct xe_sched_job *job)
>  {

This seems like the wrong place. xe_sched_job_completed is a helper
which determines *if* a job completed it *not* when it is completed. The
DRM scheduler free_job callback is probably the right place
(guc_exec_queue_free_job or execlist_job_free). So just call
xe_exec_queue_update_runtime there?

Matt

>  	struct xe_lrc *lrc = job->q->lrc;
>  
> +	xe_exec_queue_update_runtime(job->q);
> +
>  	/*
>  	 * Can safely check just LRC[0] seqno as that is last seqno written when
>  	 * parallel handshake is done.
> -- 
> 2.43.0
> 
