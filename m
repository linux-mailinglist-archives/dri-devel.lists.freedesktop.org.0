Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE7D953A74
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2024 20:58:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7598310E4F0;
	Thu, 15 Aug 2024 18:58:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VyDdZCT5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70C7210E4FE;
 Thu, 15 Aug 2024 18:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723748315; x=1755284315;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xQTgThGlAtED6vpoSfbPOPi7JZ8zJHzhbtxw1okrqos=;
 b=VyDdZCT5mki5LEo3oiEXmbO5XA4o3ZdyjTwY4ytWXItZUHKNbIT4a/fp
 UbWu5L1VUX22zmgECw9xO/7FOjUX8O3nQxetGw7sCawQtvwlkySLRGJGI
 MO4Th9VrOdCC9PnPyrQtder6gf5toeDKZgexsn45yf93R+E1W6pfEiCdC
 KXpmHm0pBRWLYKnvyywV0Ud6mo5PM3SS94s/mARnAqXb8NlCJq0i70G32
 NwphFsj5EkInYZaLjZH2Gon8li/9LPr/up+QULGzDUYJT9LYvfGuv+evb
 cKPdmVXkuFpAdgCPonpJMPyGxcdiHwmNNkfxHu7ksEzik/OUeCTyhU8Dq A==;
X-CSE-ConnectionGUID: W8VGPaBjRdWkOlEni+qMyQ==
X-CSE-MsgGUID: kXBALY4+Tc60uflUgwQGkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="22165943"
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208";a="22165943"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 11:58:34 -0700
X-CSE-ConnectionGUID: l7F1v/VxT+ydtzX7jMZxLw==
X-CSE-MsgGUID: ZX+HnP7RRPaf5gMiJBqCyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208";a="64286774"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Aug 2024 11:58:34 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 11:58:30 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 11:58:29 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 15 Aug 2024 11:58:29 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 15 Aug 2024 11:58:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QVJyUda0skini/IUFObCH2DO7MXdyc7KIgjCXgZ8WHtJViY7fEMl0rIBU86kvSppoN/ZUS/XIIMLraI4LFlmR9qa64U8+r9iKecV7YmIh0t2kkZ8SVTY9REzpqVjJ+e1yKPrJzoKegSXF57y030LmDDg41M9Zoo+v7CKOT8wfx9JK1mRa51HgxIPIx9PfExRIgxUvxYBOWJYPrh8jsLK4zw62fDe1UUITlDzN0O7Cca90N4igmnW4m0m1KjPEOMo6mBEDTzkjMdCPpKy6i0yR6ZbBYNvdZEB1RS7yyYsexPFX1H5Wy2YB3j8uGVrYM8eN278giP9jBzSWJjw9Qttvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sbit4r/bUdcXOSifMcQw2dZNSxiWlMGfO47rOVjnsWg=;
 b=Lgrv0dLvKhbts+YtL7iXixRLCD30zX8oAmRHN6IWB+8EbOAqO4DI+y/YVBhLaKKiVNM2r5J25eSrajHzjJ8cIZQOM0VR5dCUXcv4p3jxA9rocxlWzFxq0rZ8puiWlJx6fauvm7rhfFSDdH7zFbVN48onbZJLIa2FM7oH2iuwsCwMSeiA7ARdg5fie6TV07My7JvyQJ7x66y3NTDW7ndLTFcmc+z/lW/F/kePwwLqUqqK4kDcYT9aYLgfKfUjsm44R3KITBu8FADnM1WfHVcQ5fEEdgX/ozBikW3UDEN13Hy/5tZ4tcs+jGyl1lxcphHB14y15YvP/W5DD8s5cAyHGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by CY5PR11MB6318.namprd11.prod.outlook.com (2603:10b6:930:3e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.32; Thu, 15 Aug
 2024 18:58:27 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7828.023; Thu, 15 Aug 2024
 18:58:27 +0000
Date: Thu, 15 Aug 2024 14:58:25 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
CC: intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>, Krzysztof Niemiec
 <krzysztof.niemiec@intel.com>, Chris Wilson <chris.p.wilson@linux.intel.com>
Subject: Re: [PATCH] drm/i915/gem: Remove unnecessary cast
Message-ID: <Zr5P0XW6sPGwKCrG@intel.com>
References: <20240814175947.169590-1-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240814175947.169590-1-andi.shyti@linux.intel.com>
X-ClientProxiedBy: BYAPR06CA0042.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::19) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|CY5PR11MB6318:EE_
X-MS-Office365-Filtering-Correlation-Id: 6aa35471-4bef-4bfe-179d-08dcbd5c3efd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9QNMvO4b5CSi8z8+A1JPH652F2/ID2twI+S34egKGC2XQiEal7WaMHw91Tu1?=
 =?us-ascii?Q?acRfKJzrlY0W6hc451JYJdB5p2tyMZmfWF6tPuTGJB2x2PxTLWG2kwXgifnY?=
 =?us-ascii?Q?3+61W61wT57EsiGUz2uNVcWKa9X+rebgqX4L4EhoWyO0s0yhz6PV7C/AH44P?=
 =?us-ascii?Q?eQIOZ9hXf2I/5g9h8DLE3d9Z0AjVs8gGygreOkd2+NrOvGlNCE9Xa3aHFBi1?=
 =?us-ascii?Q?h63jDRvgRbZPpSptZcWM07f98T8fFIFRs9vOYbDIzGcXiB8XdcjBPztpaRTi?=
 =?us-ascii?Q?FtO4LsOJV1TNQw1MKx2zj18yS0i/VdYj2iA3GIo/+fmwBkYOaEcwcw6Y/305?=
 =?us-ascii?Q?EHBe6dqpN2OY7yoxUPeMWgtImW6Sj3Y9SMeQGtPgGg8+nqobLVmPQVKyvWu+?=
 =?us-ascii?Q?h+G27JLPybiJM2FVzslVcZol6bBkuWH25PinYUCiFSoAGMZEcs9m0V/V2MTl?=
 =?us-ascii?Q?uvezUfX8DLQ2PHZhZkv4tbeTmiwnxDS8PVBl8cMB1CwI5FMt7yFlpnJbkB/k?=
 =?us-ascii?Q?dFfmsIYo6yaEeYcBQMkHdGY9LACfkmOvI9EcPSYlQb1Df5uWjEVlqXINoigl?=
 =?us-ascii?Q?Vx3FZ7UG0xBs/56o0O4tY7Rv2/17TPz7VuYRFm/sov37vLaPO0V2MemQ14uI?=
 =?us-ascii?Q?PcywMvAbcGJauHKnrE3InlmJERv/uVtmdFu35LiNWVy0URFiwCdGxT/Rp9/p?=
 =?us-ascii?Q?rvfkZdObPa/liqma0h6hop89TDT8hud+YxF6lOZOlIcAhiQOWg6QZNA1CmZG?=
 =?us-ascii?Q?aMK5ZTVUB/jZr8DgkVSswFuVXW3htLOkonEMORcPWYpjdtGa6oCWUz3U/4Vn?=
 =?us-ascii?Q?sTZOdjb046B4pUswetyX81Edd9NVyHijwQbK6i2lBTt1F97wIaoNIbBkZo83?=
 =?us-ascii?Q?GcU3Zl25TQL8+O9K59bmGg7uA8TtWpApqI9jl5tV5QYoOvn9WK8kTK07ZhMR?=
 =?us-ascii?Q?WilEhaADXz8P5GewKsTUiJ0vX7/XpWKk6Bh/VQia8vUrZkedtQ0a3vmwmhdB?=
 =?us-ascii?Q?jIGcpF/QvFez+QzPAetDzOgN8gcOBde+jPp48/iTn7UumDcTifvoF4p+hD6D?=
 =?us-ascii?Q?uQzCsoI0hvL7xRWe9wwuEiSQ+/s+ebYe47XhLqiYSeiPFJrEgPoDi6MBoLlf?=
 =?us-ascii?Q?AyuxXG1YXm9+kAcvoq//9lLIIR9CX3aZ2raqBsYS2L1WEldqBtCWZrLDdLZ3?=
 =?us-ascii?Q?KXtrLBaSrxWeljTTmF7k5VZ2lS5VGWsJ4CJwU1/dSthFkQ5MQ3poAQ4RkbIW?=
 =?us-ascii?Q?RUcRTCwHS5evir2qug2tkRSRPe+qNF4WLXk/Pd/J57XErp32TSQ/6M5Kd1Yo?=
 =?us-ascii?Q?+plNNBxnLBqlq1hDo3rPa1b2VLbYl+QFXnc7E3Hi+97GjQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HZT4JqKeWML24RVnm9LQpGX36WuU25KU2G543L2SMPOwveiMR3DlGTvVY2ct?=
 =?us-ascii?Q?gom6VMALg4twPfv3zxXVPCwU61hbeM8dhrDfbH1/S23NUicFtgPrLy0uVPHV?=
 =?us-ascii?Q?QlfaOnubkqC5S1auzg5O0iDl+Ak65qeW1EkvfLv+WzwSIs0XkhPJXX9u5S/E?=
 =?us-ascii?Q?2C/xsgxGW4abh4rEDF744wXzevKXTc3M5M300v+NV9UFeWZW0ZAoaXaVdI7D?=
 =?us-ascii?Q?+cfE8gd4NS6hGn4RT3B+gGNsNfZZiB46fKww7FHN54e8zz0UbXcUknJ4PxNG?=
 =?us-ascii?Q?JeO2QwoYtf0VLoGDCBCBgi13QvNR1vHqDo1JepcWnLfVkjsAWeJEHSSl0VUN?=
 =?us-ascii?Q?uvQoPvNeZQ7uDc92eZ415ciyFPDrahc0qZH0+iTymVulZwsrlHy3ob7ad4Fa?=
 =?us-ascii?Q?mCNqJMxqjywCQoHJNDddqhMh5nV8b/n7HkpIqAhItiVG0hKLANSCg4CwwZUI?=
 =?us-ascii?Q?5l+IDINXTFZ5G7T7lUR2VSbZERPoLGq6hiaIjAfeMTR/kN+ISryKvRDbMmUT?=
 =?us-ascii?Q?sZS19sGnp74zWo6pK7h7xrQ63o8dP3N/+ZksWQEKT0gVPR5Xn32DmGOKXh07?=
 =?us-ascii?Q?lA4OtTaPsaBya0+S9bOtQxF+9bLo5JNv4yRDAEmGLiTA9XsvX/QW8Ovj5lTo?=
 =?us-ascii?Q?MquBzOHKn5Epe5FFr8wLJEY0AS44kq1g9hWqyQQE57RMiCHgoPCfBjKiM99l?=
 =?us-ascii?Q?WPYZzcmhvRr/QoRFU2XzFT0sAeNE+CYaWg2+d+IOyhlfpDO6fI58OGMBdb7V?=
 =?us-ascii?Q?RvlT/i4hEIagVJhE84aY3FIvV5hZMk/O8IlbL8MeOTkxMxlIvqr9bHBEWuLR?=
 =?us-ascii?Q?fgf3U/8C7pRPIDeP04TBbOBpLBEYMDmtSJtuFedIBT62bHRlNfYBC60z4jkN?=
 =?us-ascii?Q?yIBW59z21q+kcAG2bH5T4qXf+vL+PYlP4S8L06ZIkYjkAr4BOuI3bDKpy5t6?=
 =?us-ascii?Q?dmKck9Rt+PnNKdRY/f75K/WuiZhO86tQ7pc1qgtZoRl6WzL8w/82vH+lV7kj?=
 =?us-ascii?Q?g3q1OAKnM1iv/jDqu7G4hNGhZtnCYNtsPZKVOuMuqfHkr6DDa3iltuQtaeph?=
 =?us-ascii?Q?R9Y8Qm2fj7jYQKKgDPPK0zg6rzby5TdNI+nSmcykSP0GI55SICQiU+yytLJp?=
 =?us-ascii?Q?oGXtAbLOM2j1nVybgY3u9ptEWsc/r6iTiwbw21MmXht3FfCvlia5KjNNp73F?=
 =?us-ascii?Q?Dea7TiOdYWhhdOsnJMOuRcpcrVB3trO6v0q/MqZIMbBAHGQ/r6hlipTqjmhD?=
 =?us-ascii?Q?VT647w2lkcPmIYB+XKV54Pq0G39r6/7fHWKuIpr2yEwSNfJdXD+37YRLmwTr?=
 =?us-ascii?Q?g+McMzrBD1XumDMiY2OMB7E16w6GLGfCKFor4Hy4DJkSzQLnvdNL4aBAFAwT?=
 =?us-ascii?Q?zbWEYSrkSEQF47ACyrIwNq/GQC7xtgtyhpeUMIo96kuBZTNBWfTVLPI3Jjt8?=
 =?us-ascii?Q?fwW0rhrk7PdZqrPsAVTji0Kc30azo280FcKYvhAwvYb7RJ9DecO8+Rd5h7KA?=
 =?us-ascii?Q?v/s7AghjXhkiKJqbIuAKNs+vq7XlRdaPeDw5e5/2HW2kg+jF6OPu7fsqLhgm?=
 =?us-ascii?Q?e0g2ZXJ4bebrO6Xyy0/QyP73KFluiO8ykugUgslX?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6aa35471-4bef-4bfe-179d-08dcbd5c3efd
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2024 18:58:27.3281 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uT7Wwt5PrHAGOn3eky0z+jta7g9jbqO3rQQbhPjscCEp7137JZrMBjr4Lzap41zJnjjhvxl0oQnFARGDBkSBVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6318
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

On Wed, Aug 14, 2024 at 07:59:47PM +0200, Andi Shyti wrote:
> The cast from "long" to "unsigned long" is unnecessary. Remove
> it.

I don't believe we can be that bold in this statement.
Some static analyzer tools might not agree and tell that
if the start or end are negative values we could have
undefined behavior.

> 
> In this case, the variables "start" and "end" are of type long
> because they need to account for the possibility of negative
> values. However, they are subsequently moved to "unsigned long"
> since addresses are typically handled as unsigned values.

right, but the static analyzer tools won't agree and complain
and people will start try to add this back.

Do we really need this patch?

> 
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_mman.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> index e9b2424156f0..80528ba90a56 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> @@ -323,8 +323,8 @@ static void set_address_limits(struct vm_area_struct *area,
>  	end = min_t(long, end, vm_end);
>  
>  	/* Let's move back into the "<< PAGE_SHIFT" domain */
> -	*start_vaddr = (unsigned long)start << PAGE_SHIFT;
> -	*end_vaddr = (unsigned long)end << PAGE_SHIFT;
> +	*start_vaddr = start << PAGE_SHIFT;
> +	*end_vaddr = end << PAGE_SHIFT;
>  
>  	*pfn = (gmadr_start + i915_ggtt_offset(vma)) >> PAGE_SHIFT;
>  	*pfn += (*start_vaddr - area->vm_start) >> PAGE_SHIFT;
> -- 
> 2.45.2
> 
