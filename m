Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0A1A7AE46
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 22:25:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 028BC10EA74;
	Thu,  3 Apr 2025 20:25:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BKiwAlD0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02B6310EB50;
 Thu,  3 Apr 2025 20:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743711901; x=1775247901;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 in-reply-to:mime-version;
 bh=7xhkOpSmQawbRMNKOlumJvCQQ4a8H1ZKMD7JhuTifLM=;
 b=BKiwAlD0KShJwi1cQNxGZ5FOCpuGA2h7boHawRSVlCm2X1MFBkmC/nwk
 z8VIkwKXTzOXRQnwwmHpkG86kvuTrbqHI5d+5edpx3eVjMxHbRAPpF7Qq
 xC2sE9zuBmimjUiIyOWca8HrcObgL2p/9bcO+ZraK1wVDqgAug4Os1jyu
 cC8m3ZffAer2P/0VKwgjBQ3zyJu16OPpeem0bc+MN2kEP2LFEAihKmWor
 66a1GCzjGucEeLfK1bEPXskrzZ+ulxuRKAR8R0rNCWgai4u8AuQFHuRbY
 /ke6gL64q6gE0josd9IZ/Z7klQ0TfjWZueVbZna5+jg1YLo08iBNu0FyH g==;
X-CSE-ConnectionGUID: N4z7+oN8RqaI3vfLrN8Suw==
X-CSE-MsgGUID: PrtxDLzTSsCEbLCIu9c7Tg==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="70514197"
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="70514197"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 13:25:00 -0700
X-CSE-ConnectionGUID: Q54+MpyBTuCEbV7SjW4bvw==
X-CSE-MsgGUID: i40ldyC4R9+9x0GxKncFMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="131973217"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 13:24:59 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 3 Apr 2025 13:24:59 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 3 Apr 2025 13:24:59 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 3 Apr 2025 13:24:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aV8idBlG9sXgaL9asIrDg/NbYwKYR29ajzqzSR2o/R21eRXpgIpMekGGoKqLCiHxBOYzYSfS/RIRT918fJ3p3WHzqreJzh8XqrOWp4jgWG2hBTBSNIeoP63Pn3LNPBQWDgbXZePrSjExVJ1J7IyDTHk59nQkhzn8MAOGqMSL5Qxe3v1QvV8jNOnvRtIWJ9/dxbjZWqDaPDHwqaf8kIVQApeK//A0U5F7xFhmQeNrCa0lhg4IX3NXSmTJazxx+wM/NzqzTZ40m3dKIDcNZlt032fLaRPNC4eP3B+AxJvQ63YGVTxII46lBB65AsLh6NDdelYZo2nqZo+60BVL5C5e1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tB4aju7YpVFuUdfEYnKjxlqfl7v21hEOY8SKQ+6Ssco=;
 b=HaXJBqcek0ASW6pX+gCAdlnLXne3bX7DO2HnvgaTAhGYcRukT8mKMf6WoKegOOqd/NPHI0jQliq/2JK5WK5Qs/pgdkAXE311NMIkFbLOXaNOqfng/VW4IKjYy4h8LkrHUqh1xXP7Eqk9xpGCjzaFw8QyjDssvMyaAkKHMvMzogmhJgj75/nEFSnZJmKgWWRhuVd8593QcmpybSRSrVVdL+iwRV00MGqfNmPvUQ5DKCtduU4gTMtCh0ioaEBXvQlXlFAm2ejq36811f6GI+kLBJ6qsIKPfYHtUPSrQsREyKzGf8hnfM8769uwsxPLPtoD0mlMpkVxNohRUWzvO9p+Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by DS4PPFA08475C7D.namprd11.prod.outlook.com (2603:10b6:f:fc02::3f)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.42; Thu, 3 Apr
 2025 20:24:29 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%6]) with mapi id 15.20.8534.048; Thu, 3 Apr 2025
 20:24:29 +0000
Date: Thu, 3 Apr 2025 23:24:28 +0300
From: Imre Deak <imre.deak@intel.com>
To: <shantam.yashashvi@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: drm/i915: Add DSC/FEC support info to debugfs
Message-ID: <Z-7ufGS4D2cMDenl@ideak-desk.fi.intel.com>
References: <20250403190448.29795-1-shantam.yashashvi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250403190448.29795-1-shantam.yashashvi@intel.com>
X-ClientProxiedBy: TL2P290CA0021.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:3::15) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|DS4PPFA08475C7D:EE_
X-MS-Office365-Filtering-Correlation-Id: 56e0d25a-aaff-4746-b910-08dd72ed8968
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6Q8YKDRP0UxokaXEhIzAJn+HFRJEkPC55j89VNYzxSsu7bryhbG5/Eb8JMGv?=
 =?us-ascii?Q?QVfhSCcP5ixa+psvFsvZjNQXAYw2+wAU9kjH9EXqYwcl6VUvf3N7xgVe6W5M?=
 =?us-ascii?Q?xBh4QY7+oZGlE/w9mOnfsGoIAPdX1S+f4PNjx9aVdaTnlliRrOxlbg1AmfrL?=
 =?us-ascii?Q?nuQq7en1gqoyqVgFk+tM634VkErqymzdTToP92U2dJD8VyDHNHQEkIowUO3q?=
 =?us-ascii?Q?nRWfgm/4JjHf0vfF2YbJpojZCkcSgMFKwHuNJafkMKCGgbyhy+lo8NSty4oF?=
 =?us-ascii?Q?U2FeApbI0yN+2SAskOyvz2RVyGLhn+5kEV7Yn9zV+9B+Z2Z48+c8BykQEIFp?=
 =?us-ascii?Q?2GVIambKhIxY5Q65z2mAtqeOetxxLHt9gimfiN4reowo8fLTmdgG5Q2ib7y4?=
 =?us-ascii?Q?r3oQnqrkKrk0EdjFUFHNVGJO51VQC13Xtymd7gsyzC4CybPq0vZujYJMhoCJ?=
 =?us-ascii?Q?Yi5UKWM95ffg5bzY2ZP5LOeTwh82wh9IBZ/FZCxYF0I068hJICjXtC8KRtCm?=
 =?us-ascii?Q?S32wo4tGsUBo1cGzCooEfyk60tTnlQI2aLaHJAKDaSK4MYV8IM+wtC0SIOWI?=
 =?us-ascii?Q?mSLM2YjSVBiMDuT4ZfEPXIVABACkD0VgUeE59U5fHrfopFcmhtQS/AOCZynM?=
 =?us-ascii?Q?Z8h/5j7kUkePqZ3DWtKb7rXR6lIbDAFFSOXmXD3HlDy9mOzcoKXs01MNucro?=
 =?us-ascii?Q?8OK25euLnWi12ekXA51wgW6rda3kCPu+g1HEEvDjuHfybQgkBeVQOYXjFsLA?=
 =?us-ascii?Q?jwyBIDB7eLbpvaEOBG8ZyWfYDS9Yx97GSY0kSRh2VdDvqYbrxNrPtGqCHm6m?=
 =?us-ascii?Q?1SqGmLm/r25ZLZ9fRwvWPYWX+0mpbuDGrc5JM8uXtYYzZArv5CU+nFDd7Qi4?=
 =?us-ascii?Q?SdmMdCOVq5w2f0S/WNvNaQLylY+1wZKv+hscx/jFWHndTTHlD+sKNob8LQlN?=
 =?us-ascii?Q?kOkWE2LwDuy0up2S+jUPGGw7D3vrFFIDSHJo6XXslkxwMy9XdcdDGk8Ed36l?=
 =?us-ascii?Q?ve9XGkZhHWJL4JZkRhh34zsK5RETefhUe8C3jqy9lwbk8GYC7c7v67gUkZo5?=
 =?us-ascii?Q?QcBIovUfXoZRMk4wQJ3Klfw7MmspWCrPcWU1FkUliu7SE6Eb5NuytxTeWttZ?=
 =?us-ascii?Q?zDtSSMe5lundSkK2ht05KYMnQQ3M6dsnBnRTsY4dLra2ncvEY44n405UhWBC?=
 =?us-ascii?Q?VWHsMk6lMZ1SukVHGGfkE6IzZhxpAb1x5PuZBwcAFfBZqlW2vKyKcq+dD4Cn?=
 =?us-ascii?Q?O0kkjhVxqUQ9ePgMLG3lsQEfoYnVqlDSvfqvlVMAM9wK4DJT3XoI4pRUjAc5?=
 =?us-ascii?Q?h8W3kc5IrtbIdHEcVQFreU7esFgZLUBGXO60T1f3+G6r4iDKnyR6a/83G9tg?=
 =?us-ascii?Q?betkfva3K8Ff7Z8IFuUAeJb7TAVNsF6tZp+M7qfgrwYS63KjFQmY4dKOON14?=
 =?us-ascii?Q?93cjcO/3VYM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Sg56Qy39dwGGaAKcHUf1tIYQpZnVJl9OO6Xt8EB4jDol0FMSZvycAauMO+zF?=
 =?us-ascii?Q?Efv9n49e5DXTY66e1hAGXtyv+GMc3io3ATH0TDT3aNU5AqewcZQYMCWEdCp2?=
 =?us-ascii?Q?GM2+mw7W8K5/5EPahSiSDg1VJZv0LTKFLdgK2LVsDzmRCdCV9ITU+kbIJMjo?=
 =?us-ascii?Q?QrfcF1ada2hTqTfzwAx4riOS4tgLdr0eLeBMgTfyfgRaDT6ZXEayAWVt/7St?=
 =?us-ascii?Q?LnMaAYv+2fg/MFnrpvtyTEtRLltfb8zUeHYkRUOIgpAI2KzYuPNOZHSy7QA0?=
 =?us-ascii?Q?V8QPziMKrjaEFW2VbjbU02XV+7we1liiDSc281BZC0s7KwS/niiDgsOTfDPe?=
 =?us-ascii?Q?PR4mRs4NCn4No30Jk5suuw0o0nxt0c++8syye3nCTB+TVNZnkGk1IryXMYcU?=
 =?us-ascii?Q?6euhLtFCTtBuu2np4R6tQfZahpEU3TJ/sKeRTPUzcPoT+3YG4mGZ5r1AOrHi?=
 =?us-ascii?Q?FJZYGuX+EtcTvwRHrBGqD2BFlQwg9zpBlronFZ7qadFUfLuWWUocAO2ijG3l?=
 =?us-ascii?Q?/ZqYgQE8/bI3KF7HgmdH4JYpKQOYBEsoGwZ25GU5sygieFfymn4f0kbO8L9p?=
 =?us-ascii?Q?V16cSpQ3cSO3VC6XceBmNc3HbMO3AX7B6U4GcKLOFyNTEsXYPv+Kh6BtmMwk?=
 =?us-ascii?Q?cIpoc8DoPW4LJ+xSZVFurG9dDGGYFkYY+rzRnrtEiDyzfN/VUd4vJrfRT2Vt?=
 =?us-ascii?Q?qTPnfyuzm6hSTMpPYIDCkI3JX7/XCPBO3hpTgoz7sSVb8Q+9QMQiW/vCefbA?=
 =?us-ascii?Q?/G83sm8l66+YQ0+4fD9j762ZPakzxYVvp/9+ENj03MtCotBPk7JxGyo8OlHr?=
 =?us-ascii?Q?TgIOol1nCyNRBRd9aW5K85eZ05LSXZr6bnugES2LsU13Ftt15io17DWalMcv?=
 =?us-ascii?Q?qxxf4VueD+voPg+CRUhYPnFJQ02kL+3/RNXRkRVkZaSZL5VqhmfdkQ27cGmZ?=
 =?us-ascii?Q?OuSqBG+IaeTtQYsQvmQR/VwdOOoCUC9FIg82bmvWmHZd7DKI4ROkJ8En7pdj?=
 =?us-ascii?Q?++yTDeV6YU/Fwh8cYdZB5kQKEx2hPpz7ZTdgjbAw1z5maBmsIML5R+B38irc?=
 =?us-ascii?Q?LuLEh/rfDVXT0fvqP95/OZ7iNRsu3IYZoAASV8itM4x9IMtQ0dU2sdHTOyzL?=
 =?us-ascii?Q?4+743x10RoMPgi/tAKOPJzFEf3tP4bi4lbu1homzELzjtQ2u3q0UEJcIpLe0?=
 =?us-ascii?Q?pXAB+R3GVrdtR8xOCbcYU8HzC9vPNCXm2x4vVasBwgl9tU0AyrJFF9EdEbjf?=
 =?us-ascii?Q?Nikv9PBlzAS5geeYDQHvg6rE+hfAmWi4vY/vRbxvxa14w1zUAfdR3MtD38dp?=
 =?us-ascii?Q?KXpiQ91ynxlh+Sls+fBoZsQcaNLX87CzTOgxe+te/MnwIOJ26ehXeFNFcacT?=
 =?us-ascii?Q?QOdE6+7HUCSYr2h44A1Bl92FUcLyk4ZwraiZrn347GGvG9Ia3CoLCYvUAvfs?=
 =?us-ascii?Q?vPVSGSeOpE4oWWOhfkcyiOMrkm5X+t+6kWNIKTm9bJtY8VLy7SwPnd/XoiBx?=
 =?us-ascii?Q?GIVnJmEoB5ofgWD1Te+twZl2otrix6s9jtPbI5lFPuIo+Dp2lSdrb2hJdDNN?=
 =?us-ascii?Q?wGaS5Ii3i/AY5FWEljX2K7INFj+lCw3FONFimMo9?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 56e0d25a-aaff-4746-b910-08dd72ed8968
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 20:24:29.6142 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 836algKTqXbYwce9N/ce5gm8V67RR64AytBTE83ZVrBcnqUzcYkhvRZb54w5IAvOTyWJXP3b4f7LH8uv6S1DgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFA08475C7D
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
Reply-To: imre.deak@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 04, 2025 at 12:34:48AM +0530, shantam.yashashvi@intel.com wrote:
> From: Shantam Yashashvi <shantam.yashashvi@intel.com>
> 
> Signed-off-by: Shantam Yashashvi <shantam.yashashvi@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display_debugfs.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> index 057a8ce0c2c97..b8d3a438a34d9 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> @@ -276,6 +276,7 @@ static void intel_connector_info(struct seq_file *m,
>  	struct intel_encoder *encoder =
>  		to_intel_encoder(conn_state->best_encoder);
>  	const struct drm_display_mode *mode;
> +	struct intel_dp *intel_dp;
>  
>  	seq_printf(m, "[CONNECTOR:%d:%s]: status: %s\n",
>  		   connector->base.id, connector->name,
> @@ -301,6 +302,16 @@ static void intel_connector_info(struct seq_file *m,
>  			intel_dp_mst_info(m, intel_connector);
>  		else
>  			intel_dp_info(m, intel_connector);
> +
> +		/* Add DSC and FEC Support Information for DisplayPort / eDP Connectors */
> +		intel_dp = intel_attached_dp(intel_connector);
> +		if (intel_dp){
> +			seq_printf(m, "\tDSC_Sink_Support: %s\n",
> +                str_yes_no(drm_dp_sink_supports_dsc(intel_connector->dp.dsc_dpcd)));
> +			if (!intel_dp_is_edp(intel_dp))
> +				    seq_printf(m, "\tFEC_Sink_Support: %s\n",
> +				        str_yes_no(drm_dp_sink_supports_fec(intel_connector->dp.fec_capability)));

Both of the above info is available already in the connector's
i915_dsc_fec_support debugfs entry. As I understood the aim is having
each CRTC / connector show its own properties, instead of combinining
all those into one debugfs entry (as this is done in i915_display_info).
Based on that I don't think more (duplicated) information should be
added here.

One issue with the i915_dsc_fec_support entry is that it doesn't show
the sink capabilities if the output isn't enabled on the connector, I
plan to follow up with a fix for that.

> +		}
>  		break;
>  	case DRM_MODE_CONNECTOR_HDMIA:
>  		if (encoder->type == INTEL_OUTPUT_HDMI ||
> -- 
> 2.25.1
> 
