Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB40B5A11D
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 21:13:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D47610E769;
	Tue, 16 Sep 2025 19:13:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NH6x7qJv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64C6B10E3E0;
 Tue, 16 Sep 2025 19:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758050008; x=1789586008;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=caeuer8hOIo6Y8P/G7xY5ofdXGRw/gAgYsp/l8DevmY=;
 b=NH6x7qJvWz5g0e3c8FaWRThpkUIS1Dau5jWxm7IQ3s6Nup/rJKaG+9gg
 /XRhPkjdOMmSgYmJkBCt5E1En6Ntyrh1WL8C7CP0asZIUldagUycmE9Y4
 9fVFxA4U7fEfJcQ/YhEfpAo0PncL9lF3O1pGterVyGjEoJJNq6ViyHWEH
 Srv/Uddk4CPOiW/8RjoKMuxqV0u8hEf1cPWrcjG/F5mODQrDQoJ/iVYSt
 vAJ6QlqbBPxFVROABPhyYtDwdzCPaK9YOHFHes6L9rAMrehvv3BURSZfJ
 5h07CXjx9kCa439gYzX30TaL9NMLZ1XQXwI+MtuPv3SFASyvBBGGF7d/r g==;
X-CSE-ConnectionGUID: XPynf8aXTOGy0oGUpB4/QQ==
X-CSE-MsgGUID: 84QgHIQZRQmvFWCKhUKPjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="60273054"
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; d="scan'208";a="60273054"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 12:13:28 -0700
X-CSE-ConnectionGUID: lbHI6euNTxW8tkl3LrDp2A==
X-CSE-MsgGUID: Elt9lrpFQZ2YZ08/5VFgiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; d="scan'208";a="198720469"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 12:13:28 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 16 Sep 2025 12:13:27 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 16 Sep 2025 12:13:27 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.49) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 16 Sep 2025 12:13:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FKIHkh4gKtHBJ+So0b0UQg5YEONmoroje/Hd0/ooYUf15r4mG4sGJ/qrb2VKZ/r7RjO5kHdWZgja2Pc3vgiuV7Z0Kubbt74CMsm8RkL8Vz5v2E/cea5KfAQrHI7k7kf7pCqF2WiVgGDN4DBtRL4azQxey5MR4LOjcOKT1nUGfZLVkLX5SFFecYaHT9bcaU2ORX7gjI/tqZsPIwwhCgEoyjiS80gmLZibVakAF0uPd2ErCR8u8TkodRkrYDDWlOOQY7npuciHFzBRp5LD4LBprCa/tfQjgTnnW2RyYYXTtPeQNcGkVSIAoDsKVjJ2vPgPT/knbA6EZeP/dbKhpITreA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A4g6be3hbPLW+k30u6VygUzZ1NQDEKlat5F9aH/3vLA=;
 b=yvrzX6+rntEV8MEKKebcXxYQdNnLb9onN04iBm+cERtyTHoGtvCeSaXxFoQ/BrXOZh03KoJN5ED/kVIrm9gwpYwwim6ZNrDLaw2QYhE5DHeKe9zN6uVcarOKocjowgDDktP6MPMZ430uMGEN9Z0jKpVvZPa+mO/8FGDwBEiSj7t6atn9bgJ9uDLwfCZhy3C79/0PdLFRurZb8xxCRh860H/J/rf8fz+94kWRYei3sXecJzatvmphAUS6wi9vpFvaDLL0wT45sm5UBn5eJyL4he80WH3dCE1pKQL0cG3oxRPDplcX/LwgJka3orrTvYPNViOCcrgt3DqBif07MlIiOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB7993.namprd11.prod.outlook.com (2603:10b6:806:2e5::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Tue, 16 Sep
 2025 19:13:24 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9115.022; Tue, 16 Sep 2025
 19:13:24 +0000
Date: Tue, 16 Sep 2025 12:13:22 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
CC: <dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 5/5] drm/xe/pt: Add an additional check for dmabuf BOs
 while doing bind
Message-ID: <aMm20vlkX0o+AG0t@lstrano-desk.jf.intel.com>
References: <20250915072428.1712837-1-vivek.kasireddy@intel.com>
 <20250915072428.1712837-6-vivek.kasireddy@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250915072428.1712837-6-vivek.kasireddy@intel.com>
X-ClientProxiedBy: SJ0PR13CA0217.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB7993:EE_
X-MS-Office365-Filtering-Correlation-Id: 11cd3ea7-1294-40a6-c25d-08ddf5551bb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?q5sZ61gPZPoxCbWvGhyuvH6AT85eithUDxjR5P24OjpPY4EpsZ1eVvIuhkNW?=
 =?us-ascii?Q?Y8N/SMwu1pDDmVczYgQD5bwmFWsGCYIsLNM2RNV2j9PlHNJqxdxO9kn22hE2?=
 =?us-ascii?Q?Ni5t0C3U0P6FX/v5RZ9nT1pHKhVcISyB/g7q2Y6IizOGHinkL2g4L20AlTMR?=
 =?us-ascii?Q?I/AXuXvJdcAmb+bANXaqVcTRBvQcOP58XTduCDpmMtro6IfgL0p90Q/MlVev?=
 =?us-ascii?Q?mAybw+rZ2NkRFXlbRF6i74dI0XJ3KCwajFJSO+MZcS0nClYF7V5re0Wn+Pyy?=
 =?us-ascii?Q?ckAjMDi9ZyY/DajEMjwsqHqUsC5PA8bOYcPOik19FEYiej7BIXQcES9s1qN7?=
 =?us-ascii?Q?fm3POyXBGO0A6gY8HNIihRe+YWys12t8nqF2njLSFQ/MBvjst3mKV2ssnwnk?=
 =?us-ascii?Q?AkAyP+qkERmuNttcyW+4DFiQb46dFMaeV856wGAfwhDpqiNC0Dm/F0CdIK0d?=
 =?us-ascii?Q?/nYSxcI/unnLHR/HiwYoJ9h3E61MDbfHowPDh7amQe3rWVFTZsnToe9aarde?=
 =?us-ascii?Q?i0quIz/5/LRHviO6OwGLwtL0DHZc5i8e1ecxNvE88wT4Xms9EFescszd1Jp2?=
 =?us-ascii?Q?mSD4FeGdu8NI9e4yrKkOwR6PDBT8Q6an06wry1rbK8gUo4swMOuc48v212RB?=
 =?us-ascii?Q?fI3eMO7ZWEgEkWKQQXE6dBCR+60yjy/91bUds8Ovyc51HuN0IXCUNpY5gk29?=
 =?us-ascii?Q?egzJklRfa+OylpJZUX1FpFY/zetMbW1uOmOQE9H/QJ/WotHo7S4o4y8Tyvis?=
 =?us-ascii?Q?rGLF42H3H9JXXTI1RHjysMC1nsmnAz8PA7sxeJe9XaDUr/MLfvEPgigcw8P8?=
 =?us-ascii?Q?e8WbM3BGN9rZPsSTuiz3e3hK/d1RvctkO/HBKFyFNDO41y1qBwZ5X5BSahg5?=
 =?us-ascii?Q?U4FrCkYAZJLb4dT0knedyejHTGl10IxKW7MO2v9n+QSFfeCTH6hhaaMHnpT+?=
 =?us-ascii?Q?mmAC139BgooIwMVowAm1KdRe+i58sWtjGj70wIxRMfTXMajH6UrbHaGo+4TV?=
 =?us-ascii?Q?SLqMMK6NQJarpN30hbZ+qVGa7tY7HyspOWestu5fZdngPS6DyYPpI8SMl8Zs?=
 =?us-ascii?Q?j5SexYsFc5onMIuvVQdODVx0ek4x0HN0bxKL0+ACWGkjizsL/JwNHOrKqozK?=
 =?us-ascii?Q?S0ta0wDEsxQzfD01dLNNw/J9kDuomuHGYhDWUcknXezQlfoan8GcjQdJSOfv?=
 =?us-ascii?Q?XkMxLKyOXeRaoP0CbK4xkY15nvF+wqG3xc0CYPGxQhwXtfBp6iHgnTb1iQpl?=
 =?us-ascii?Q?Fujbdpylny4GK0Z9Mz0JNvttnr1+ylY4+FQNLidX8DRNrh0O5kim6MOFcDsK?=
 =?us-ascii?Q?RRuaH9VN56uxP1EFU4xn7Yk5IRIw+u3olB3y0T15DPM5TvUDGnJM5r712aCX?=
 =?us-ascii?Q?ewtbJC23X3O0LsfO73WjbV7I5JpHufkU444wbxL1JuBv5SwC+n9ofeOrRg3d?=
 =?us-ascii?Q?ej3GzSLeCyU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Lhz3KBjqzHEOQkYJD/8Ej8QYyHhVG/UXY4x2tCr31rsG4rudv9Z7BleVfbK6?=
 =?us-ascii?Q?sSGtCSQ2wm2iZKBGfOoRtbula835cZK5hzBbRqt4Tst8m67bBnIUiYlPZqFw?=
 =?us-ascii?Q?phgGfBPD4B0ZiOrNZNCBCOww7v/ZHrvGXOXWhTt5FzSdR0kfDDjcTDs8gFIu?=
 =?us-ascii?Q?u0xD/62U0fZSLIvkAG7BGa7b7TCjxu4Fom2qzRfaPtHfLE07apv+y4B78FLA?=
 =?us-ascii?Q?b8bRRosfOSIyZap29tGjnG6qzrSbyREQxcJZTTaF3yTSIMDxBWIjh1HMvvtk?=
 =?us-ascii?Q?Aj0dc/cIIRLEVpvVunyK/dlXc4tdY9BVNGZF2GZkbUbeJGTe4lQx9dxtPsJe?=
 =?us-ascii?Q?/l5Do4FNz1/csNX6EtMzajAgljntAP8PE+oj6CYlBpfz/xOp1GJC9Iv1IliD?=
 =?us-ascii?Q?nlATQ8V2gG/2+81Q4r5P7CdKmFcIfKR4wt5atdbGeTyZJfe9Zqqx9eLrkYf0?=
 =?us-ascii?Q?pGXb+UtKGF8Xhg2sBMH/9Iv0fFO9/9XWtvDbkw6py5QYnV1zfuX1avgxllmD?=
 =?us-ascii?Q?JMdsy1T+RU18E7vu6rPOQOPVg/rNIBxsX9KngMwftXpvhCpYgi2fE/Sbm8bk?=
 =?us-ascii?Q?9gbWdHrl7v+I2H1vuzxPnO7cHcFJAQcf3WyCscWhQ3xcnEQkiPz4Qs0lmjSc?=
 =?us-ascii?Q?jsFJBYB4H0PjwXiJmNMJK97t9tdVGqc43SJTlkljfKA5CCT8lXSBmUW4/Bgy?=
 =?us-ascii?Q?yg0f4qnVAtlcghNai9U69Yrw+8RIqTR9m610zVAttUi49fHPNEXyQ79Mqgqc?=
 =?us-ascii?Q?oywKZeOgFGFIORDvrgDooLu/7shW+uUJNQiK3bHr1rpD0NUFM/vB3UTMGt7f?=
 =?us-ascii?Q?LUvKPua/A0GB0GVlGquNsVS6WsYo6UdvCM4VUahNdRa+/8aJcaUBoRw5DZxT?=
 =?us-ascii?Q?emOCFsP+xcVcdrbWdCcpvmNytL9y4defP8J3wW1ignWUjRWivDh23Xp+Ft59?=
 =?us-ascii?Q?/kGz+oxdX055tjlWmphFCnxBRVG1mowwwBRLfCdcAZxRErIDAbbih+MyC0Pu?=
 =?us-ascii?Q?sIjSBi1LkLf+wOacMT259szhwkY+xu49JWllxfH5wAAVkgK3JT+EA5QYtQFr?=
 =?us-ascii?Q?LezNSAWXfHXiB++Q+i6439ZePv3mZm22ciWp4vHcZH6rqmHu38AYeizVW1U1?=
 =?us-ascii?Q?Y990R64rFemmLTHOkvXKZNQdmRqiGKqJgNJDtfVN9apmy4TMT9hdVVeQ6L+n?=
 =?us-ascii?Q?9sbX+ZYwCjJBbgtsFr+/K6yzDbTNLsf0miynZD3oS7X7JOhbBxb228Nb/tbE?=
 =?us-ascii?Q?WCWhsMrxLedldY15kc84utF/7soEIlG4DjUl+V1kiaKobG6cr+9CBZ7qg9v/?=
 =?us-ascii?Q?ljUqYx/STUJUocUThos9UFERrB+g3kwbSUrezLQ4AumJIN2J8GqxL2y7NXEz?=
 =?us-ascii?Q?4UEZ9ob0zbekL7GLxvuZcC1x+IGIBUXkuKu/NIriQ1GN0YQixZeHy8+kFxgL?=
 =?us-ascii?Q?x4tfb7Owqbhekn7UghVlzkbjkVopfUciOnwwtfcdfZS8INvwC9IncZfyQD1H?=
 =?us-ascii?Q?WmDVWqDZGXT6ZqY8XZD8025yTDgG7FkxiA+aSVcIxTCefJTG5wf+YEsx/+QH?=
 =?us-ascii?Q?BPK5eXinhomog8msKTBmG6FfSAZ9InQgS1sga6giySLyXJwEFlksnOU9ehGJ?=
 =?us-ascii?Q?mw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 11cd3ea7-1294-40a6-c25d-08ddf5551bb5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 19:13:24.4345 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MkVVKNkZO3TGCompSIMddAwBLJzbJpHQ9pie820S53/+wXDYI2apsa1U5QlHnZLwlLik/nVMOAZNeVoFpjLseg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7993
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

On Mon, Sep 15, 2025 at 12:21:09AM -0700, Vivek Kasireddy wrote:
> If a BO's is_devmem_external flag is set, it means that it is an
> imported dmabuf BO that has a backing store in VRAM. Therefore, in
> this case, need to iterate over its dma_addr array.
> 
> v2:
> - Use a cursor to iterate over the entries in the dma_addr array
>   instead of relying on SG iterator (Matt)
> 
> v3:
> - Since XE_PPGTT_PTE_DM is added to the PTE flags in all cases,
>   remove the bo->is_devmem_external check added in v2
> 
> Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pt.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 01eea8eb1779..a4b60fbcbc74 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -760,6 +760,10 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>  
>  	xe_walk.default_vram_pte |= XE_PPGTT_PTE_DM;
>  	xe_walk.dma_offset = bo ? vram_region_gpu_offset(bo->ttm.resource) : 0;
> +
> +	if (bo && bo->is_devmem_external)
> +		xe_walk.dma_offset = 0;
> +
>  	if (!range)
>  		xe_bo_assert_held(bo);
>  
> @@ -770,6 +774,10 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>  		else if (xe_bo_is_vram(bo) || xe_bo_is_stolen(bo))
>  			xe_res_first(bo->ttm.resource, xe_vma_bo_offset(vma),
>  				     xe_vma_size(vma), &curs);
> +		else if (bo && bo->is_devmem_external)

See my comment in previous patch, I think is_devmem_external can be dropped.

This patch LGTM though:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> +			xe_res_first_dma(bo->dma_data.dma_addr,
> +					 xe_vma_bo_offset(vma),
> +					 xe_vma_size(vma), &curs);
>  		else
>  			xe_res_first_sg(xe_bo_sg(bo), xe_vma_bo_offset(vma),
>  					xe_vma_size(vma), &curs);
> -- 
> 2.50.1
> 
