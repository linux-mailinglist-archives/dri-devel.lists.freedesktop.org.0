Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iKEpEXj/pmk7bgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 16:34:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B131F1F2B8E
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 16:34:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3B8310E83D;
	Tue,  3 Mar 2026 15:34:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tv/RAOM9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB8FD10E83C;
 Tue,  3 Mar 2026 15:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772552053; x=1804088053;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1/d1tcuDu3aaSyBN0oLUEUKjAaI09tZ2TQYDGuCTsyE=;
 b=Tv/RAOM9UevOpCLNd5EMABk5Zc4jOBWNwgqiKck/GC7Th3cwL+6126oN
 bJ26V+IvWnDlR7BImTezai/SXpwTERbLvj3B4dY/hOP4A/uJU6Xa/Zs6p
 8DmIAI2qYzkxVPBStZFpLdudxaktrCMZ+OD5bUYWRrGg+xLinus6/1Cvo
 lHnyBPYObdopeN2N/qe441hPXY+C5xk8rXn7CwgUgL2guRqcXsCJGcbth
 vNKkwz3/AzBuwm+rGG0TYvt2u5+kSKVskEP2LHfj34vM+bk8TFJtSE0b5
 roYxYJUadFi9MIfb6TfXqBFGr8JlnAfjnO4/4xIHHJ0glEih2W734+aJr Q==;
X-CSE-ConnectionGUID: rF0ZwKIoSDeU1jYB5IYmuw==
X-CSE-MsgGUID: UX5tJB8xQumNjIqfadjCBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="73506599"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="73506599"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 07:34:12 -0800
X-CSE-ConnectionGUID: EYjLZb98Sjmi0j/zUgyibA==
X-CSE-MsgGUID: 2o9MbvkyQJKMyKVL/Yi93w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="217270360"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 07:34:13 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 07:34:11 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 3 Mar 2026 07:34:11 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.47) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 07:34:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sybANzME0o18ntF6wDxux0j6Tfl23dnS/Ix/vumwxTnO3+nLlgxPONJHlpoz92q8J/T8+FYru3AypzYOpYW7oB0OvH317QcYinWokBpTsYNIXCLbgQhSiu700xWcYJU+uIXrJ+DCcjzK0V5T6fUH3SCL2dhFfjch3a+xZ0DZHymc4et1GBBRHTWU7qhLUNtdkmVBafAv0PvlSp0DP5W37UstMFXC9A2TcALjrxEIt5cMNaydUL2cKKl53mYoDc9aVPwIH28cwBnzc4c+rU+Bze6Fqq9WsyfmXX9WLxUQIdWPGKRpFz0b6VX+nvuL3GORurLFnyt47L52RhaGDZPYpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KOTNUMOEE3BfzxR+cLr/XFxj2JKUfj7Hw7nlQtebT3U=;
 b=fjBsaRWXrugFjRPpFGvARI7LZWxDoNt2ZPdwtbS9lEJvB42dlboONP9VcT0bjJS6jC4wKLZC2eLpAvRK26f/QN7uC5nGjDyYF7tmtyPKZRI37vdpuYeWivb0VkOzRqvJsHilOCeBbPkwbFgSBZ/Nkj8lBEz3vqAn4rAdL4dKFzZ3ZuM7h4TtUxmxlfblUPu9P46mHzGmcbgKnO7s1qTR29BViSPWE0tBLtsjsWD13evEascHOqd6uX/hUfTpSJnpK0AJSqyYTiX/g/OFXxopFD/TqJhIKqpATTy25KW/TOvpVXNsH9HOauN+XwycC5CLqJwgNpKoZLSZuKSMsQiWVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH7PR11MB6979.namprd11.prod.outlook.com (2603:10b6:510:207::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 15:34:09 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9654.020; Tue, 3 Mar 2026
 15:34:08 +0000
Date: Tue, 3 Mar 2026 10:34:02 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <mripard@kernel.org>,
 <matthew.brost@intel.com>, <riana.tauro@intel.com>,
 <christian.koenig@amd.com>, <andrealmeid@igalia.com>
Subject: Re: [PATCH v1 3/3] drm/xe: Send 'none' recovery method for
 XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET
Message-ID: <aab_amf1hcjppzL1@intel.com>
References: <20260303110556.3577612-1-raag.jadav@intel.com>
 <20260303110556.3577612-4-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260303110556.3577612-4-raag.jadav@intel.com>
X-ClientProxiedBy: BYAPR02CA0049.namprd02.prod.outlook.com
 (2603:10b6:a03:54::26) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH7PR11MB6979:EE_
X-MS-Office365-Filtering-Correlation-Id: 3652b5c7-a7e7-4489-b170-08de793a4f49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: e/Etr4F6w5kUPXdFSzSmFdII6vtZmYNNkr2nmFfjhusUZPJRtHh4boa+7z8TAZerMSQ+K29yGlEQFLeTjmOHopKo4d5cRE9/9pHc/q26f1AVD+uo7UqRF8EvRQF0txju93BIKApfioDNFGDU4R8XpuEWEImZAMVXX04u1w2vmipl9YjXOb23t8ppSrRNWOmUWthVdYfrwqrqgjJ3aP2T+4JQ4+DULNcQoIwhhxoLl0FGgJOutkj+K2ZJvfo682DH7knbSkfL5LNoIhbf72b5xN20TnUtevfttr7ITZmVU9MGQyJ/d2WgMLK6Xr3RzDW0iqvC0cSp83oNDD2gUATijSKTCqhXU7k2DuyOHaOEv0TmDb5LlZp0sUE5S1h9e010G0ky6HAiJiTkdDbuGpAytUdrLcObs1cOqKNGmT3GLKSDL0kWi8hi5dMuXk7eJVv+9p48KLn9zN1FUDWGXE1eNzvtoChzvxd3am7xsFb8LalpRBkhT8VRNpPgJV0JJZbMpujGCnWRJ8j1tOHy+M0sxFnxCE0R0AGreJncw1ZG15LTzdX1NCck4120woEZIXxT04fhuEPo9wlDdS5HhJTaoYjZNA9LbTaPU55XyQq6z5RcMhxgD5MgDi+R3vdxzYleMqlu5EhNdZuBzi/0rk+YOY3HIQ9SkkT0VB2iRfO72VRkQCy1DUCp6x7MJpKkVT2hqtNdQI7/K5GZgyJIklK7wfICtQQ9/KBigo594JbZgps=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IhafC+WOe4RNykOYxzmbe1sRpM8hhZQwYb+GqWKGm6V0vF5gSfxW3G3z88AR?=
 =?us-ascii?Q?IvmW0Lfcgf2kWQKPSAohM1m1pmgBWUUSu6IxN9COQfZPjVZ/5S4u7/yRBc4B?=
 =?us-ascii?Q?ocpZ+Ogjs+kQDFY1WMeNJIPdVEwoihuIq94VNAEUe9dHO0agx4NWDHEr+Qxu?=
 =?us-ascii?Q?ow5JyyZ8gNl2lO+YL5Yl438ZC4gskhw/p/HKi/Nb0ABz/Z0/wya1MgrUkZPE?=
 =?us-ascii?Q?vZM1oyr4u4Y3OHFuVt9F/f9lVr72Es5ns+24RtLp2VPLMR99PCcHnaJayQJ1?=
 =?us-ascii?Q?ToOyeKjhs4rIWKFqYGKcB+QaHtcpQTrsfzj8bZbmXvZ/wUva5MU10bh7mj+6?=
 =?us-ascii?Q?YD/UY6R66aPbDeSfN05cgzskVhD0c+SW98SjHRpcbcQPRHPCBGE0xcyK9XlY?=
 =?us-ascii?Q?HPDS8IfxR5TLHM2cnsbTYu+WhAl7P+P1KQwsDNjzY/T7RAfdbiNnsUe6MvDB?=
 =?us-ascii?Q?VvmvprnbMYjLK3et0pRqId6gqRDyG167D8/ve3K3h0LYr9MC1rI9qWfwRrZT?=
 =?us-ascii?Q?SXJpssX6+a3GReKlpWMNww2m1jJ0PWQInFeoXPRxKoBmPBjdctvHKzn4OjQM?=
 =?us-ascii?Q?LKwHxZ2MuPc3Dz7ZhaCCGPIXNNgFzu25IYObY3t/dWefsdtjrLSW1rfPnXVg?=
 =?us-ascii?Q?BpLPh/sb6fFOICYUxctEFuRFWZS0qjW5UtGErJ9za/X0tiYcrwTbPlKS7pxy?=
 =?us-ascii?Q?2/4GzOsAqm5Ep3qi0giy7NtSXVSrTC50vEbrO2mWJdP4LuNIM4p3b362I0lL?=
 =?us-ascii?Q?iPxWaZrh1kEdsaJuvVv7mdoH5IbHNMtojrKfg7cIJNZSkF9Q0WheYy+MYl0v?=
 =?us-ascii?Q?AsmHzvlzG9FfMBktpEQ3ETz7cEeQVioSdIgeGAq9RwHvtw4DcpfD9y3jPRd2?=
 =?us-ascii?Q?PDXN8gj/Holbuniv7v+kLA7ofBZlsZ/xE7RAJxe0wm2zhQC5urJ5KhH4aXAX?=
 =?us-ascii?Q?Be6hoii9LMkuMtNSir2qpX3Jtes3J8MHkrHdqsB/yNYENndhtmv3mhBVazpn?=
 =?us-ascii?Q?iojkU33H2xJH8PDxApm1XHqplB/DNB0NV3HdkxntospM3xW+WToMDWPNPYTi?=
 =?us-ascii?Q?UdppSho6dClhCyNhKTMIZJ9kDDqBc0VYV/Z93e/cwx0huSEShHaW8srctUsv?=
 =?us-ascii?Q?5PHhMD+ClLSivSY2miOpnfF2KpQ8mwFrN9untonjuJ4zcjG3ixMEx8o9Khlb?=
 =?us-ascii?Q?Nfu6tVIrNgqgcb23G1aV0qM5AuEvIDg1l4p0dz81TP7UuFdj4NcuNPG0EsMi?=
 =?us-ascii?Q?/lGnl/7LOQnOlJYDfOzZLnGhwxpwiaj5H3Vdoh+sHKKOPA+S9aSMsJUYYOhf?=
 =?us-ascii?Q?CNAJYRiQClQzBpZCoIpunI0Fn2DiwvaW2KtSs6ch+hiRPUSvkw/g8DkQw5Ei?=
 =?us-ascii?Q?Do+RrHf8VxLE4bRK2jxvSSWSFZcJ7vV7dLSmRCxPfrFinGSQXW0XgU1/XGEG?=
 =?us-ascii?Q?f6ZvdSful4Itzy8+cF2Y22X+U1ZQatZpCOKss9r2nj+XvORTmQya9VYz9fv7?=
 =?us-ascii?Q?hwe1p8tozg4+xKnpdQvFZfCkE4pMld+5afveU8E0Lhtn/jjHpxQENwtYavI5?=
 =?us-ascii?Q?QLCNmD7muzDgFzxY5mxNf3uWO8g2PA2I0z8Udd/RzvZbGKCgEU7P7zuMQJEx?=
 =?us-ascii?Q?H38FIUzVUyEmfAepbe3s80kQmjesvXfK41lLTg95g8GCQPU/Wy79XH8qy1bS?=
 =?us-ascii?Q?hWIVcQmIFVf3HDEejrD0eK7qtCb6sE6PgXayi1mVQMz7Bp2rjNYOkDUGFXNe?=
 =?us-ascii?Q?vDSSXRl5fg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3652b5c7-a7e7-4489-b170-08de793a4f49
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 15:34:08.1017 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0uS1M9+TTkk1fsAOdf7cVPUHz+AR6uSa/V8hsJNgXxWxguZWeI7BDqAaIAP6gSD37NwuOgaKWPGww0IEM0bliA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6979
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
X-Rspamd-Queue-Id: B131F1F2B8E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,gmail.com,ffwll.ch,kernel.org,intel.com,amd.com,igalia.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,intel.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[rodrigo.vivi@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 04:35:19PM +0530, Raag Jadav wrote:
> XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET is intended for debugging hangs,
> so wedge the device with 'none' recovery method and have it available
> to the user for debugging.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index c137dc0a1840..eeb626737760 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1329,8 +1329,15 @@ void xe_device_declare_wedged(struct xe_device *xe)
>  		xe_gt_declare_wedged(gt);
>  
>  	if (xe_device_wedged(xe)) {
> +		/*
> +		 * XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET is intended for debugging
> +		 * hangs, so wedge the device with 'none' recovery method and have
> +		 * it available to the user for debugging.
> +		 */
> +		if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
> +			xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_NONE);
>  		/* If no wedge recovery method is set, use default */
> -		if (!xe->wedged.method)
> +		else if (!xe->wedged.method)
>  			xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_REBIND |
>  						    DRM_WEDGE_RECOVERY_BUS_RESET);
>  
> -- 
> 2.43.0
> 
