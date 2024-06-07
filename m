Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1625D900883
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2024 17:18:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28F4610ECA7;
	Fri,  7 Jun 2024 15:18:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="byOhRIzE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 984D310ECA7;
 Fri,  7 Jun 2024 15:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717773500; x=1749309500;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WLPZmI78lB7oSyTAsI/RC6k90rI4hgaJCcdPSUrHmIM=;
 b=byOhRIzEB85PEvQqXp5GCzLhcipSQ3Ld2iuSXAaam7uf9kB17JI0HJri
 RHBxId/wafZMHGp817DyofHAxeCkOXFagcnLYiYTxMEByvihrP4vU297u
 I2U4wHzdwVHR5HZDb5VDkrjTu7hRoWXPTWwTWSXZb5RmLxtx4jeD674jS
 2l56WIuWJHeRDrKGYQHrP6NJwuYblEvQMuiJu5FJnit3YglrDLLp9Cf5V
 wt/xTv84Ooi7CBK7kcnzDWJ0GsOmeD4w83fNEq6LCXHbptctJ6revTsPS
 dHAv5qi5Avu9Jo/mGGb3pV6dkY/1D1PPP/8yJXe4G7wMol6VH6HmEFUYG w==;
X-CSE-ConnectionGUID: QdzuX4bgRQy7lRixKbqDqw==
X-CSE-MsgGUID: uPiwQe1mS2yfpHq7CWIwdw==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="25126811"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="25126811"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 08:18:15 -0700
X-CSE-ConnectionGUID: /4DRbzZ3Q5SHlEV0apKLig==
X-CSE-MsgGUID: VwWteCgrSliS0HlcKQlV9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="42917785"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Jun 2024 08:16:43 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Jun 2024 08:16:42 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Jun 2024 08:16:42 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 7 Jun 2024 08:16:42 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 7 Jun 2024 08:16:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zcb6defDeOq9cX5xw6u8p9tFo+Zl/AvM6L96miFMT8vawTcgGGzmyYJH4dYjdaNKlj6M3tA+tmteMzQ7aRAzDp3NIm7mKZ+silQX5gK5aaHHgBIvIJJ0UdX1Z9V7+GnYE51onmVTGkOPDloNnUVG2LpeZ9olH4B8l3XMcOUXiLqGuajrtpiCZhGjsGjC/yToGT5OqUehWpevmE/Fr89QRZDyTeoHRwGf08yARqBD2vAweOUQEBAkfQAjN677MTd6QU1gfaN3hculuySrCUY8UlyJXO1608qaIK6ZTFjbI4lh7mWg/QUWMYmgtFz/Ao6IlUja3jBPmpCgizCnEW8ePg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3PHxTfqgl/U//RWrtqBAkqW6mb78zKY8LGPxri8r5zk=;
 b=UzpSaQ2Ryz6N4zh4sMpb6eEkCgb6Gf86taLI4qHmChyDqbj1WZsomb5Ohdnj8ciFUOyFNmmTR5McI6hBy7ayGxiHVyepUg84X5ylS8TjMgjqqvnaxR7Swm2K96mFZ8iBTDQExEQArpVYbdlG4lKiB9I8gMSOivi/Kg3L+lPKF+VEjxKAjPdlooIRdqxkYfEa3iOMakNfKpjlOjS10jJDEGMhYmgb+tQ5HxCdffa6I2W9KNKue1poRlThZ0SVjovUPaFILRg09Y8XP7WfGbx//PiczuIHx3+ljwyqDLr+dIxc895EnMrw9kG9QD9UAtEIccCUOIbRv+6xURNa8dGmeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by PH0PR11MB7472.namprd11.prod.outlook.com (2603:10b6:510:28c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.34; Fri, 7 Jun
 2024 15:16:27 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7633.033; Fri, 7 Jun 2024
 15:16:27 +0000
Date: Fri, 7 Jun 2024 11:16:24 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
CC: intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>, Nirmoy Das <nirmoy.das@intel.com>, "Janusz
 Krzysztofik" <janusz.krzysztofik@linux.intel.com>, Chris Wilson
 <chris.p.wilson@linux.intel.com>, Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH] drm/i915/gt: debugfs: Evaluate forcewake usage within
 locks
Message-ID: <ZmMkSHoUhfuK61fT@intel.com>
References: <20240607145131.217251-1-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240607145131.217251-1-andi.shyti@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0134.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::19) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|PH0PR11MB7472:EE_
X-MS-Office365-Filtering-Correlation-Id: a5707698-76bd-4319-2d69-08dc8704cd5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1xwNIFFe827pQ18Tqw1bUH3gMaGBbOFC2z5OBk61tJ0GmcWPFiTnoC+W2LCV?=
 =?us-ascii?Q?Ad0MXM6pUoYWaxBR5XuAm7N9T7EwpdcBUTT17EuOh9X/8dwgPCf7fiKQAnDm?=
 =?us-ascii?Q?zTAgnVhfMsHgBOds5vIG7cIOeCCKmfEB5t9YwLsE2ysAgpCIVrFqsQpOc/to?=
 =?us-ascii?Q?/RuDfH+XmGCYN6FBuX9byqAhF5RB7Y/WzAwJro8hyeR4AwPYblUb+vesUt85?=
 =?us-ascii?Q?4/eIgmjO75EYGZlNqC4FGwe/5HsgqqJUMPQin41LJjHrJQ8axjvDLHg5s3vl?=
 =?us-ascii?Q?TJyQDvQNHgVBDqez4LOHJZp+fb9xqcCnIWMZHA8V8xBk8Z6KRA32seDZpM2c?=
 =?us-ascii?Q?P0yJHFoFEDAecLQUeL1BkuyrXPuuS8L4ZmcPn7U9ODriFKMbA2kk+Blr4sFF?=
 =?us-ascii?Q?/L5TRCWBy0khS6akOaYA0DBC31oX7qTW3zu5s7ro4TOWtMIFouP9zuA6Xo+0?=
 =?us-ascii?Q?WKtJjd2qN0+/IC3KbUaOu2spp8GYscI5IFjEvzENHeMW25mV9XI3b+OB6WtP?=
 =?us-ascii?Q?CSo8Fw6e/etdyOG2UlJ8r750uADhik8eaaoOa9dzvQKaGIzGiSb5ihKbZnR2?=
 =?us-ascii?Q?muHLOcJdfzCnN6FwddWdm8sOHAxO/cN+GwVWLkTA9LQW2x1g6EMGa9up/R8l?=
 =?us-ascii?Q?AiW45oynZx5r526h/ypaFeSUmCwCwRL5Xy7N7lcjbdXV9Nv9iJEOEQEBpV2n?=
 =?us-ascii?Q?OrLXtfMm9ccWt3KTX847eoDp8XgR5re/zB4jb7s3jZArp/vHwGENHIGP3hK9?=
 =?us-ascii?Q?dgjpeoEqfxJXGhcrgaEeRUwY+0nO9ZpUvIviDQpojhvKrsHOY5Olrd15GWBy?=
 =?us-ascii?Q?zVUshS781ErS6lJhJHmFyMl9bKILlcMsrjYrSHaobBRQnFOet9F9ZJRB7bn1?=
 =?us-ascii?Q?akGsW3eH3ngVIkliRuarw+ij0XTlhjAgVdVTAiQWc0bDlGajts7AYzxqZB4D?=
 =?us-ascii?Q?1VRM1QnTbt3JK1G5WmYGoKwblepJVlldI91PHn/4q8IseVcyJFgDRaqaT2si?=
 =?us-ascii?Q?tpuX1M79HHDXW6Ag7WRDYqf/4tShz630mjn5sXZfmJKTvOsfocBc4JmoywS/?=
 =?us-ascii?Q?fMWXMKLtyGtH8eUWUuMO53Gd0fX/5lh1E3MaL2Ky5HEjeizuxRSuqnEm+trk?=
 =?us-ascii?Q?se5Ehb9MCXCV2e3odkvO73c+f2PkASQgIJpI7NSbOQ5oFG/03bdRvvagjzCJ?=
 =?us-ascii?Q?sPlvd1cvr+U4sPRPL8tX2zWmkH4ZbqMIz1wyC5DIkryb6PKUMYscBcXzn/l2?=
 =?us-ascii?Q?e2q7QOLcapM22sLAj5cfMZmJ5YrLOIWdN2wb41IPBfbSGb08SM9O5oDXJy2r?=
 =?us-ascii?Q?EtLcYKqcpuRSK7hNr/wu1y7g?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?e7o9FB2y4D5tlbO7n3rFRc66jwjQh5nbPUDfpXsUzvRAKlAsn6ykeXjyh+Fe?=
 =?us-ascii?Q?ssmdElPmWsxDytiIpm9JBMS1uadZ+KuYJyyRR86DgiDNlDJz8sLH/CpiFMvf?=
 =?us-ascii?Q?nlqyQlcRzQtOpVP7XRWpZpgdLZfBnh7QDQU0+alSLR4GN/mewVySQ2XmtJ8e?=
 =?us-ascii?Q?io9XkmIESozMWu4G5NOqPg/IaVyY6XI8vNECal2vVUsf4jEqByIz0ydZMrL9?=
 =?us-ascii?Q?VL2t01J0WhyEWdxSW0/wvL+lrBqWks08o4UiWu1xcPwsVWkZmCxvTDbzPKvs?=
 =?us-ascii?Q?qcfyV6b1KYmeJQoqjqHyundrW9NSRlRdGLf7iFALGTPcutGeQxV4rk1fhDXG?=
 =?us-ascii?Q?9ykfpomA+Cq5QL5PVlCfv4bFGRntSre8v9ZAOMPvzT3hjfDW66X8hf96ESx5?=
 =?us-ascii?Q?J0xBnSPMqL2tQ9jSGFh6FR1AIzY7dZ9JV0bsNfC4QwCGsEBvt+FIi3+EdBjF?=
 =?us-ascii?Q?LSppYYF7nlWPi4pax1YjKg0y2W/63nAPgrajngI7HIDYVm75+dImTgCQnBlb?=
 =?us-ascii?Q?R+RQWjcUyHM1mQpFY2NpK1XKtE0C75q0F+8TZZY/Bv83Iih18hNKwCRVsPCd?=
 =?us-ascii?Q?AIjwe9ra94fY4nWdJBRTOe5z35euY6U02niRxbaO5HGu9ZbU8ZXuSa02O7Wa?=
 =?us-ascii?Q?GeiJEBtN5wC1aW4qqPl2MKTpMz+BESvsldnT6Me+8c+bayT4bNrkY9xk7edk?=
 =?us-ascii?Q?3Dr1/rKTv8omMLLrMbD0FiJ2jGOUl6F5egr8sFxm6pXg9gLH1tq9FJ8RtaAc?=
 =?us-ascii?Q?rvOz0/9TdbzaPLa+VnzTS5iJ7MOpL9bvUGFNke+2HxzxrASSA69yPV9J6OQ7?=
 =?us-ascii?Q?LnmIjKSAReIrkXN83N5XTE4xNavkNag9Mq/cJCLpn/OqygGvWY9xayfKitTU?=
 =?us-ascii?Q?vWqLwyi6PFkP7ydyiPPUmHxPGmNKAir226SGIAT8EhTenAHYRCdDWCl4LxGK?=
 =?us-ascii?Q?fyOdawm/gFTxc00crNeZmnA9F7Z42HNGWwreXpvQ8G0VXVut+OSi6wdkX6W9?=
 =?us-ascii?Q?+I9T9piZEmW+9VhMKOjKxyIQ9LKiiJ33gDmPyW/E/lW8MNt2qjdOsePB67y+?=
 =?us-ascii?Q?4j9D3fLN9dk1LZB291Pxx0qNk46PgXJZFgvMSbyjmTtoWNlF+R3D2MrBOBVy?=
 =?us-ascii?Q?RRNAryjMkWzmwRGeHPCUc+XRXa0pzT5dnzsj6BVDZOnXYccnZb2BSQsJZzh4?=
 =?us-ascii?Q?QT/eT4JQbU1pnCcgj+KebRrG/Pd+SyQUZ8EDqlyvQaQvcsl1pYddtHDe8J8L?=
 =?us-ascii?Q?V3LuUQt6+xswsoxQts3tVFZNrPlQmsuOy/jBRs9rOsh+jjhaJOCoh01VY5iu?=
 =?us-ascii?Q?RT5usOPcahgAIO8tdbAf38eAX6r+77bZk5H2bBDGZSeoGAP21iU6bxJX8kRY?=
 =?us-ascii?Q?VKO4wuumTbg1F6hbXsTanX8Zz0FGij55+sh7pCUnEMVBGLUk0rNgADJXWC24?=
 =?us-ascii?Q?RmBeKJcStix2jgBEYHloufWyyerI1NO2GUcsKH5228M0+cFK7txgzIWVnltQ?=
 =?us-ascii?Q?JqtdZ+Gf6SCOJPu60nsPfiOt6/wdTEuexFsmvmDdxUhhj8rxg24FniMzfwK/?=
 =?us-ascii?Q?05Q1v17tZcGIhroZNrH7HEV1UIW+evHcC2B1szNq?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a5707698-76bd-4319-2d69-08dc8704cd5e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 15:16:27.6968 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 91UusxVwsSxpcMaotNM0SgFn/4J9RzYOW2Xa5gb1I+u2VYd+ei4JKy0aus5R/oQQTGi9rMmZ+ilZGrBFWBD7iQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7472
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

On Fri, Jun 07, 2024 at 04:51:31PM +0200, Andi Shyti wrote:
> The forcewake count and domains listing is multi process critical
> and the uncore provides a spinlock for such cases.
> 
> Lock the forcewake evaluation section in the fw_domains_show()
> debugfs interface.
> 
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
> index 4fcba42cfe34..0437fd8217e0 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
> @@ -71,6 +71,8 @@ static int fw_domains_show(struct seq_file *m, void *data)
>  	struct intel_uncore_forcewake_domain *fw_domain;
>  	unsigned int tmp;
>  
> +	spin_lock_irq(&uncore->lock);
> +
>  	seq_printf(m, "user.bypass_count = %u\n",
>  		   uncore->user_forcewake_count);
>  
> @@ -79,6 +81,8 @@ static int fw_domains_show(struct seq_file *m, void *data)
>  			   intel_uncore_forcewake_domain_to_str(fw_domain->id),
>  			   READ_ONCE(fw_domain->wake_count));
>  
> +	spin_unlock_irq(&uncore->lock);

I was going to ask to move all of this to a function inside intel_uncore.c
so we keep the lock access in there.... But then I noticed it is already
spread all over :(

Well, perhaps we should start from here to set the precedence and move
things to its own component... but well, I won't block or make it hard,
we do need this change and the overall uncore cleanup could be orthogonal.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> +
>  	return 0;
>  }
>  DEFINE_INTEL_GT_DEBUGFS_ATTRIBUTE(fw_domains);
> -- 
> 2.45.1
> 
