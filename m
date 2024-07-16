Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5ECF932E99
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 18:48:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A72B10E7E2;
	Tue, 16 Jul 2024 16:48:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oq3VkrCe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DB3710E7E2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 16:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721148511; x=1752684511;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=AgWXBoEe+FKxPi2eEk8rCmPsD5PywfbBUYyq05+sa/c=;
 b=Oq3VkrCez2CHFBFpSA1993X/59hBeBmSmOWIKkaimbFAj6LwiGf9UNPU
 jUwW9kBq1hQfmn7DwZdD8q45J0xa82qkwtJ3d5H9YQ2e9Qfo/hapAI3G3
 CAou+2RHGQlttKWoVGgO2z6HdOXQBrgZJ/U3Xnh9KbqBoPvg4RzhebGEc
 sqpq+mm0q0HGs/8T84s254/A42ItavF+ynju47U8m6yGVADoZZ2jHQxUO
 qnoGRaSaKzjr1kaXGmPSRJq+HhMNWJPY+5NJ6UwJTgeyz+XzLYyWi5D1+
 UPp+Y9lzLZnLxbqwo5hP7ZXdYp+4WFzMsc07ObZWg3VV9whAY99hmwapo g==;
X-CSE-ConnectionGUID: j8xnhZiQRE2Rc/xXVpujmw==
X-CSE-MsgGUID: hwzKkrxqRaOeIglroNUwBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="29277504"
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; d="scan'208";a="29277504"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 09:48:30 -0700
X-CSE-ConnectionGUID: au6utRPXTkalhGfCm75eSg==
X-CSE-MsgGUID: z7IgEwh6SNKk/1m++KrmsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; d="scan'208";a="50442873"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jul 2024 09:48:31 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 16 Jul 2024 09:48:30 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 16 Jul 2024 09:48:30 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 16 Jul 2024 09:48:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KWgZ8Dt47z9qh5YGocY0m/OhaGO7YXQ6EiTufJ5hvplnjYQDq8g30RXjNafoKbBXSQ4CWAtEONyzPWrfyDorwcGwSo1nVw2m83In/6i4UJk3FKB5kQQ2pVCWIKKDxuEJlH7Sw61wrLcpxMUMDWV2m+Z92fCV2KgPNNtLMSp7fzkzsy8WO2w+phYgy73FZlhZnWoHNrceGosXutC6BtvV5zsBtgzuQBmzpy8R8FatAPAQYSSdYrJIBYL8gzOBJwMSZ/DkNVESf/kLhZXnJq6yvtSzBiW15hnP0PdsT65EODluxIdlxWfv4g98VMKbLcQMTqJIooSlzDHe5pz21ZwpzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kS2Izegj/2N4V9cxcZRHv3DvBTZBtIuucIfWIdp3dyA=;
 b=iEac+HN3HVRahTk/tOxfywr4ndCPEt7HTWGKHKRMpXqXn3AcBnacFFUba9GFFx+CGi4ECaZasP73G220jUeFeG7Yd38zoa1O2kKn3qNb6Za6D0mFYZnUG5X4Cs5yAX5eohWVcDzfctrfcJctVvTGcBl3BuYYmOFd0UegORMpMdq4oxXW8raAiE1kOKW9XKNHg/U5GWk9PVoC0riJOpSr725E+ZnXg40JACUadDJyEgoyDbvZ8Zcz3xFEr17DZRtTkC95ypwwNdzIzGWQq/ehKIxtWVu80VoweySHY+luZUKfL90fwTjIkJg8pdAHilxwCf3HeP8Tiz/q7ZUuJ/GzeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB8445.namprd11.prod.outlook.com (2603:10b6:806:3a9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Tue, 16 Jul
 2024 16:48:27 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7762.027; Tue, 16 Jul 2024
 16:48:27 +0000
Date: Tue, 16 Jul 2024 16:47:40 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Philipp Stanner <pstanner@redhat.com>
CC: Luben Tuikov <ltuikov89@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, Marco Pagani <marpagan@redhat.com>
Subject: Re: [PATCH] drm/scheduler: Use ternary operator in standardized manner
Message-ID: <ZpakLNAkQHsJTM3g@DUT025-TGLU.fm.intel.com>
References: <20240715071533.12936-1-pstanner@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240715071533.12936-1-pstanner@redhat.com>
X-ClientProxiedBy: SJ0PR03CA0079.namprd03.prod.outlook.com
 (2603:10b6:a03:331::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB8445:EE_
X-MS-Office365-Filtering-Correlation-Id: b81a1d15-aa73-4e67-8e0c-08dca5b71d5b
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?L59emBr3kUQzA4qsJY78TuLKr4DKhtn3JHTeBNFOc8mW1KIvuaURC2cdMG6I?=
 =?us-ascii?Q?6YJdO8KkeN0hE36NrUora4FqiBD5uNQN1iGH2BwYLyw+nNhwu6N/YfbpGAEw?=
 =?us-ascii?Q?tKqm9biSxLr0VcR52Nrv2xpK/ZJVdJFcSMjoJ7JT4DvKmgNbrexpVex4MGaD?=
 =?us-ascii?Q?Z5eW0Cwpzk64iU6txxxyalDytZXL6UvBrXQJTO+q31QTBOMKAO9+YXO8kUes?=
 =?us-ascii?Q?nKXdtE6OsCZYnhanPgSsc53zIDFuL1SZvCXtVLNxADRpN2M5yaT59qG3k1Dj?=
 =?us-ascii?Q?+w0kVsu/riwbbPrqmrHSh/r1knLb6wL8o+GpxfxpMfaJfE1I6ORbRnBMxUQY?=
 =?us-ascii?Q?S6b/Oj5Zsk4WVzZFyyYFRExrySQdjG1j0rnV/lgK5N+FRuzPkRb7Dcdck3HL?=
 =?us-ascii?Q?uhNv9qm30oupgaL4+w5qhKkKD2HFR2YBkksyF2vyMeX8CYEFx5a3vJqI6taC?=
 =?us-ascii?Q?/zNvoVZ4Btu3DSyY87NyA1oYlOGosXHsYCKVcUbi6PbLEKgnrhYrZPOxLPxg?=
 =?us-ascii?Q?gokLUJ9xlU3FBBuCs2vkuQLVGuJ1f7YTZM2D69LGVUFRiHsSqKohY5UMDix4?=
 =?us-ascii?Q?d5nwfo0URRkyTCLusZVqWRBpO0majVezXhcAwFtxXR8wYTNDIAdXpQGPKO7d?=
 =?us-ascii?Q?Fqi4y/fMCXZ7FiTSKMlLRSZmDttP7GlZSN981hsyOGnk14qXFhomTR5ETxiH?=
 =?us-ascii?Q?7e6zvW06I+wJM+A13LiQ8UUDqoLEJp+efgQBIoGXeJbK1MK2FJ22El8ar4Mc?=
 =?us-ascii?Q?ETGQjWkrwPS2+LeBOm4jOmhol2YCum47hckL3m6fN//jVN5VY4gmnNr9k1F+?=
 =?us-ascii?Q?JTd+Q5X+1l5DxuIRHuJ17/gSNE/pv7ciu4lk6NgRL0n99oPR2g7g8E2ULKO1?=
 =?us-ascii?Q?0htixkqs1WkNVOjScf+TvgG+A7gqE7O3xsd4sT3NnP1UCNwPDS4MroGupkMo?=
 =?us-ascii?Q?GSRw0Wk3jxuX66SjkQjcavUKdVMIV5mwjHEYvHmx3iv+Z4ygYYp0eJBUytLA?=
 =?us-ascii?Q?VEsshkMA9TITur/Gg5U+MwegxO3oNQwGzt6hTMuzS/poPRQm6kkVmKQoiqbb?=
 =?us-ascii?Q?8wqzVZcYFwVUk6Tf+Q0+ikwEGBTz0koCxBXBwjEfC6haMI9HA7vGDwY8PjyJ?=
 =?us-ascii?Q?0MR2i0H8vRvcJvUaa8Wu3NIL/S3xhCXBxeZhXEDkmkjLugbNbC7annAzqQA2?=
 =?us-ascii?Q?V51Um23CU/xsXedCmFUYK1yHhuENag1umA7kRVDo1RnBqQ9T5lPQC2K60h/X?=
 =?us-ascii?Q?8QmNQMOUH2J8mVrEBErRhhDJFYd8SiStVG2Hqo7WHNYcEvYxjGRqg/giTlmk?=
 =?us-ascii?Q?WZcMk1kDbf8oM7V23A1hKb7tFhXwRs9DywMsDq5aWXklTw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tkkcZ+Zzkb4a5VkDpv9VOcUy2wxYM2SYE62eMUnWjm0v7fQc1rSZ5um8ZQYH?=
 =?us-ascii?Q?IgDu5+nZ41yzh8dAOokFDl3zCpdauVTExcs9x3hdhJqYXJXI44qI7AOZjdsE?=
 =?us-ascii?Q?kngMv6F4hrx/+7itTwHyI+If61nQIDcABv+7NP5bRGtWpbhHuu1fOpDzCWBF?=
 =?us-ascii?Q?7ZuEAFmKWPdzmxL48MWBOqVwiLgWW5UcRWFMGgeJ20w2NAwURMKQ62UaRsUE?=
 =?us-ascii?Q?RvUegeTLavsEwuSCRSr/OalgKBTjbfJj+HfpuH5yU+yaI+ywn8WuGK2zp7DH?=
 =?us-ascii?Q?p4Yd0y1rb1wa4TS+lkg34qkl7lmZITkM89xKNIT/Au6xlRXCjonBlyuoHdN3?=
 =?us-ascii?Q?6xM2FcdZKM9/K2pGVbzixMDYvaB3JmVCtVibg3OQij0jSyli0WzFrr9SiPYh?=
 =?us-ascii?Q?A4tK4YlsV22AZlakD7Tzo0pOzreMJloy4afInoRtZXSjGRN/4LvSjJFrDFHe?=
 =?us-ascii?Q?YzdScBt0VcNa6wsrxVSYUUUwYO9+/OlpVpWiC3OrFVZuVU+u+AC4Aw+XqEOJ?=
 =?us-ascii?Q?n23VVfpNKE0t5AmU26JxHVp98Pg85htAkUa+SKanAFzJBbit35pirFjJ6k1/?=
 =?us-ascii?Q?wLjz7HVzmszTS0zc8frWuBEi9PGLFQ5m7LViPoYNSQ+I7rrzfSfsGanOGNk5?=
 =?us-ascii?Q?e7Xlp77P0JdPXux1FBrG7MMsM7o9WFW0+E0ZMBOGxg4qb7srYUUYxJsqKM5x?=
 =?us-ascii?Q?KshZ99huBsG0uwOp1eK1GVoEYEsSqg4izUmlCKSG9emNdsk5kkBjbzdlaFLt?=
 =?us-ascii?Q?1wsdURRA1xvONJWGkdX6IMfCaPaBhOSPplk9JVE12Kk8EV68MJk/rGV1MqoA?=
 =?us-ascii?Q?5EOUoQO/wp8MdvGvqIlZRhHZTyxqG4IBRfgCQ1X6b1O4CzcPAqm3hTppkNq1?=
 =?us-ascii?Q?I+iQ9bew24mmqXrnYxr8wVAUvcGg2Ucvi4GbCISZAF+tWI4ESPn0erbyGBle?=
 =?us-ascii?Q?fv7zLv5kNnF9M5CBAAmq8gUUkicYC9zkRM/dZTxUoivuEtI1LR5TE/D58dZr?=
 =?us-ascii?Q?hVwfnfNAW8zZ2rPnAOXicjBBwRBOiRtyT3uxGKqBtStyqmxlNeQ8TyWRsgQ/?=
 =?us-ascii?Q?I4TeQVeZKP4wmOaeOUzRe6eWSViffJwAGS7F1UWL8yiSiBX7LdZ58UtaT8kM?=
 =?us-ascii?Q?EgoenOSJ1wLWVez020ICbslH1vkeRIU/5aC9y+IdvQcs6iE2Jj8ofvSUDFy9?=
 =?us-ascii?Q?tn4aApYi5CbmsyZ1sBVu2AOwIRxkAjSk+Od/gjrIH2ekNcDEdraz/NpiIaLp?=
 =?us-ascii?Q?9SpeFYa2F5aWhLKG3PLIOhvef4CsNA//GWba/y2UXgVdQuP9s2fqX27q6C13?=
 =?us-ascii?Q?inNykUS7TxvKyLfic4HwkIvrY4vxZVyFfeQgtemiCizGNROoJsbZ5cxPdtwb?=
 =?us-ascii?Q?N/HWoo0U9PrBhTp2pvbX4oN/qPLg+PnWGF4YW5RSiRPPPhtvmO/0l89nEfou?=
 =?us-ascii?Q?wLg7GVWsdNRTfRRua/Xd3qFVpB6m2qWs6RhduLfwt0bRsJnfhu/LByuMpTmc?=
 =?us-ascii?Q?stbndZeNnA8fSEsPZKLanz+1L7KDgCo4JWvknwwQiyu12G/4XEuT9ct1aHC5?=
 =?us-ascii?Q?mYkD2G7rFbgpAADbuvinVN4ZgS1hQjZWpx1BJeN05xNY/rK9+Tkz7IN/H8R/?=
 =?us-ascii?Q?Pg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b81a1d15-aa73-4e67-8e0c-08dca5b71d5b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2024 16:48:27.1549 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HN7yH0rN0yEtZzRTY9Fj0OiYaSHGjjH86AQQau51WhkhyukjwK0ZPwm5Lz7JbqrD+TmIOEeKAGSWJ4Cefen0Kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8445
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

On Mon, Jul 15, 2024 at 09:15:33AM +0200, Philipp Stanner wrote:
> drm_sched_init() omits the middle operand when using the ternary
> operator to set the timeout_wq if one has been passed.
> 
> This is a non-standardized GNU extension to the C language [1].
> 
> It decreases code readability and might be read as a bug. Furthermore,
> it is not consistent with all other places in drm/scheduler where the
> ternary operator is used.
> 
> Replace the expression with the standard one.
> 
> [1] https://gcc.gnu.org/onlinedocs/gcc-14.1.0/gcc/Conditionals.html
> 
> Suggested-by: Marco Pagani <marpagan@redhat.com>
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 7e90c9f95611..02cf9c37a232 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1257,7 +1257,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>  	sched->credit_limit = credit_limit;
>  	sched->name = name;
>  	sched->timeout = timeout;
> -	sched->timeout_wq = timeout_wq ? : system_wq;
> +	sched->timeout_wq = timeout_wq ? timeout_wq : system_wq;
>  	sched->hang_limit = hang_limit;
>  	sched->score = score ? score : &sched->_score;
>  	sched->dev = dev;
> -- 
> 2.45.0
> 
