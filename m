Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0547B91286E
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 16:49:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80FA510F1C8;
	Fri, 21 Jun 2024 14:49:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cv3ANeSN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13A0510F1C4;
 Fri, 21 Jun 2024 14:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718981384; x=1750517384;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+o+1z30YAAtzEwB8SqULijK5ya8eaqPixR2l+1bDY/A=;
 b=Cv3ANeSNkQf8AnlqYAqmLiU++dFFJIaaLncwzsxRkRWvoTqOG7GKm7AR
 VTok8DYGap0q3WklXUy3xUbGLZZ7UQrKP6bUh5qV8u+jIZ+G7V93uRBox
 ++FOGYDrSHR6c7e5V8jwPBHKNbVZXbxoqMM2k6WRBMhFPg60cCEYJfkRh
 Ku2dvK3j0mXJQ9591HE/Ngoik+iZ8u3M7VWS0W7bbQsso6iKOgiuhtY+a
 ryRhhbwPC1tPPNwee40gHRCPcWZH3OAQv3t3UQamPFW9FgRDprHCK5289
 BmceY3xMR3Jzigwj+Fnpxxx4z1map/fjlpnkkgsN5GDkvU4gzCXPIUDao w==;
X-CSE-ConnectionGUID: ZGQxFSgpRmmpODx4kjU7lw==
X-CSE-MsgGUID: vpY7JD5KS9+icHFS+PFv9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="33560629"
X-IronPort-AV: E=Sophos;i="6.08,255,1712646000"; d="scan'208";a="33560629"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 07:49:43 -0700
X-CSE-ConnectionGUID: Fe2YmypETwO+TaOEf1Q9yA==
X-CSE-MsgGUID: CyL15yzcQqWiBhYE8FKmJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,255,1712646000"; d="scan'208";a="42699609"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Jun 2024 07:49:43 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 21 Jun 2024 07:49:42 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 21 Jun 2024 07:49:42 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 21 Jun 2024 07:49:42 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 21 Jun 2024 07:49:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hosEZfZcBElxTjxsM5OE9v8VnFbN4PEXZwkKsgQ1dEcraTKrrluPnN5ad3JozuglB4D1YwOiRgQZfxGE0fRKvSW8Lh4oG1PGQvd+1iGATzDwvnFqwEbIL0m2T6q/n1B4nJzN6ie7WqiFAWzLvIetdzA/YJ9vzakRjhSrGp06bP8lMX+dibpVvd7qtYdrV8BYgCz8P202/IQjGiJoIzkuR1WanrddZF1uJVoHfYK1SVA9A6jFxiMjHIT3h+1cxqlJ085Yx543/6GKvCq448LdvlmNOvsRBw3gEBahJRqCXR5ZW8GH08na0xrf1gahMvcRNBDQwyc4hGzPDe0aG9W0rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZfrC3z8YeHgs9aEeISlwNanE9IsCAHGLN01lENpBUCg=;
 b=JXou8hr0PF3GFSLV/Y8cg8U2Jaw14W4rCAzITQTcdh3LJq3kRiNMzJNHS3zZPtSBo4b0r+zbkoFUzC8emHnMtFLTHMC5+2zRRRBaCSeN55Qy5q1vOjAex0xObweriAmIzqhU6vbeQjPH1iFEfaWrhyQNybdXarHYYO9SLqaYJsP3erdwp83Gw5uSDIOmvz7Fb5AxTUrbT9zUP/ec72bu8UaCskifTxZZ/WvbzDpED8VpIRVMmP70HZGOT7lmJDeqyK1QxDKQ42k8BzFR08HzGQNUs9gY7Hexh6pDyb9aPdA5OegFgse3f7dTUCyUj2Yko2ecnH2C1ZGNQNdYJBZ18g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by CH3PR11MB7370.namprd11.prod.outlook.com (2603:10b6:610:14e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.22; Fri, 21 Jun
 2024 14:49:39 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7677.030; Fri, 21 Jun 2024
 14:49:37 +0000
Date: Fri, 21 Jun 2024 10:49:34 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Alan Previn <alan.previn.teres.alexis@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH v1 1/1] drm/xe/bo: Fix fixed placement ggtt pinning code
Message-ID: <ZnWS_vL37sJT9OQm@intel.com>
References: <20240621071506.912055-1-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240621071506.912055-1-alan.previn.teres.alexis@intel.com>
X-ClientProxiedBy: SJ0PR13CA0045.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::20) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|CH3PR11MB7370:EE_
X-MS-Office365-Filtering-Correlation-Id: b410cde1-5b50-4a82-aa18-08dc92015f45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|1800799021|366013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?C2UfpiLovrOemliSX0ejRRALcCCiO4T1rgC+9p9Pr8oXEgY7AX0kz67ne/ZP?=
 =?us-ascii?Q?foBWkmIeLrTPzw8oJSEur7u4dUFoaBjzF49rV85MJnWpMC9MjfrFoszgZ2s4?=
 =?us-ascii?Q?1/a/dqgvrjXTH0nx/PqdFosOcZgYctnjbxM/x9osnMhcrseyTzdlFogIG/lA?=
 =?us-ascii?Q?StfHQLEwYRrT0T8cHwzCB3dHejjc5iD9mR77oSFu94vQvOAGEEWVhqXgxnTe?=
 =?us-ascii?Q?5/5g/PMMLxVSfhynxnDrHeYPLDHvWgjEZq8bnUWCrUgqf3IN7k5HCLEfVR6M?=
 =?us-ascii?Q?IcooF2WW7yafOndU2AUHnDeMJjArNleP6yxDxBBpAFJNR13lYj43w3vvI3lO?=
 =?us-ascii?Q?UbFeMj2dkHJ1ahsDGfOKvKWK81WheuACKKNgRUkegHSSUJ6w3f1Dzb028H8i?=
 =?us-ascii?Q?Rodm1dRTWhqHo9IkmgmfFVfTxugw7CMqMEyi8fcmXwsgrvBbX97FrVpI5SsB?=
 =?us-ascii?Q?GlfFWIhLQ+WpST6GpXmlm4m8bMQbWrYC/QnOzQeirHmVQjFKdAlJWAkl7WsJ?=
 =?us-ascii?Q?vTGvonBivyDlaJZt8q1zmStB8NL55lFXTZLIIxIJ2u1h5YO7KpoTBnZTMc45?=
 =?us-ascii?Q?Y/AH3efMU+XG05xSlMdYd9kG9lIFAGCwW9eCBCmLBRNOXLITJBMIiH/hvevd?=
 =?us-ascii?Q?/LI28S6kJgnOpx8aJiOKDYFRlY73/fctGRvo4su1w70Y2mcx4DlhkKQJiKH+?=
 =?us-ascii?Q?70T2htItXTEN753YYM1Gxqmq08LGjD/EaqHwk35XQSQC4FA4tnY1bejn7EtF?=
 =?us-ascii?Q?kV5ysQkJJgrnLNFnx4KH13s3jXokPZDIy4Lp+HyaoxxirXZaKt45OyBs/Udn?=
 =?us-ascii?Q?jbovNFefcpioMAGqafUZWYXKDX8QUgpxj5X92lg6fGmw9XV1h6hRqGkdStut?=
 =?us-ascii?Q?BJ8uPt9saPzcBUzJK40HPwSbtlo9qufndg2MQcGFzrqVDbto+3qXAyJe9+P7?=
 =?us-ascii?Q?ypZcjTWHOUYaKulFs37FUQheQ33ee4orGqu7bCqnNQOZsmpbxfGHDgj9jkBg?=
 =?us-ascii?Q?pR58uHbQCm9KfO0U8XndbhV4gtGH3eT3K+2qDSj9ajsvX9xUK9c80udbit29?=
 =?us-ascii?Q?mN735vMF0Yhphty8v3Yg6r3DxJE7WkXjTcRTrJlJZ6mZMuz4w4dfKeLp/y8a?=
 =?us-ascii?Q?JEAUe+crp9clzxhC7P4nxsPhJ3z3VHA5Iq7v8LYX90UGMkpVxISk9IRT8I/W?=
 =?us-ascii?Q?xYT1b3bS9aI8LIi9it9cMPby7IaN2YBjgEVjmag4u2UbC7GYj9JKikIP2tbw?=
 =?us-ascii?Q?MsJHzoOFu4mCxZK7nVdh4jRdd+Z15K+ob5zgNG31lw5P5s20teoKYJ3ZaFt8?=
 =?us-ascii?Q?Tic4uYJGiaISMmP+K8GZDhkJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(1800799021)(366013); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vzdDRWckVycKuQOfpMLkGRVABs3aj9xAhVgA7Ul+hvoCJl9cOD3jEOrhXo1X?=
 =?us-ascii?Q?xjyL9zvGBDHNXdqQJXihqDjvCai2VdER/c8qX4rWgN228MMYQ76gK6PqhEG8?=
 =?us-ascii?Q?15+/ZJd+9c0XRfF/40MHi/E/Qqt8FZbYHVZuIv7kaQoF+wKw+auPk5yLvyKT?=
 =?us-ascii?Q?jJyHkaTU0TRgaPIJ195mNCT6ZSJo+ojNht3bUPnheHa32FnrvwJb+T7QMn21?=
 =?us-ascii?Q?B/yfdaJPkta8whOwmkHFFECs7zqfOvbs8svJpt/kDdOA71T7cQ3lrs15Au84?=
 =?us-ascii?Q?M9nFqhwsDcNa2b69HJHsllnpx7klpMrkxYtelD1DOn9VRUAKAqxt6fe1afz8?=
 =?us-ascii?Q?HNASpaJ1v+UdabzGkJria+tV9zAoIsEjqzhHALUd/bXsiL9D5yIgB2h3Qmd3?=
 =?us-ascii?Q?Jq+gzlqBm7zN97qifSdKUTt5vD06rjl49zRmu2N05KfDhPty+PjzMP9ZiDM1?=
 =?us-ascii?Q?qi28A1gGKXnjebndBKtg+ym9Ds4XY8oyvIWdWFRNim8aAizzmCExnvpElCsI?=
 =?us-ascii?Q?K6YN1AqK8CwvRfuxYPyjSlN773O5gP4AuJlhKHJKr1zIs4DUMKsKbxsEZWZm?=
 =?us-ascii?Q?+gRRjNhFW1KTYXU2Yc8nyUGoDfNgw5uXgfJD43mtZx70XhQoEC6fJCf7owdA?=
 =?us-ascii?Q?TvjPvRi427WSmoFa7H57cRd8jRYQWCASkYtIaVmXfIwtyZAtwSD7Ktyivud7?=
 =?us-ascii?Q?0dH3BHHxYLwFTxWw0NzWeqqB8g2t/5ktTwHvYy32g6T+KooikumtxnK7Mljy?=
 =?us-ascii?Q?B8l+pkxqhg2MT0eEugTHHVlcvg9APw6Z8FgzhckpPYkGAd84xktWy/iDXnlp?=
 =?us-ascii?Q?fB3GBid5wHYwOLA3zjzoagBFSIA+OUB6Upzb+sibZYzyTaJCEtBxZQNHGuGT?=
 =?us-ascii?Q?mzUMlelrA6txXArupP9Y+iupeU5On3v94ggYWLkMJgcA21iO2fUn6H2msr4H?=
 =?us-ascii?Q?ocSYTZ226ywMbTxFvpbVEFsG13ehPaqSe+8ZgBzYQOhd33E9SL847J29UdAp?=
 =?us-ascii?Q?P/HkAuDl8diX5DxyknwASQLaLvkbeVlmA/ywTMbHVPbwcIQP6+HWcs6ItG/S?=
 =?us-ascii?Q?u6aA3gwDsBrSdnlge9DOdxsBS1UqPS+Sl1Y6H4n7QMMKT/h5LZJRmswzEzI1?=
 =?us-ascii?Q?QDsQGCDHLpNamhOQiGFmJWHWKeIVdS2pfCVg1cenb37M5DtKUIkAs4by+DJ1?=
 =?us-ascii?Q?cta1uvHg4Ydr0y6VRE1i4YgagOAviDDTu3SXA/jAyQdrsXy9jWV4ODOouWoz?=
 =?us-ascii?Q?w2X4PqxZ54DrHq0nu3iYNgxSEqYy51TUhSzIJQlkXSglXou3EJBeBwaVc0QK?=
 =?us-ascii?Q?XxycMr5P4Aos2EV5Bl3FyyJJeZDqJcNxH+fhxFtm2jUiS3IzKLFePAj6g8Lv?=
 =?us-ascii?Q?sbgPcyQrcOH4o2cAgxf74AnufZMjlw5Ve+xVE8q0mvjFzZyLPYW4dnQIfjPj?=
 =?us-ascii?Q?0THF/2pxQv8iD7JlZL9UdVa3wdOrmYhxJkwcNPYY157+JJeyiSyV3jDNUKmy?=
 =?us-ascii?Q?vPFgvNEZa8xH4CF5QoG+UOUtg22HLid7iZybBIT6m8BP9KcYdegOPARj3hol?=
 =?us-ascii?Q?N+qSiev0rozozIPmjznW1UNKidZvOqOM0tp7esPC?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b410cde1-5b50-4a82-aa18-08dc92015f45
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2024 14:49:37.3983 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aBO0T2zWhhJhod6Lp7HSIurefFfAkNRFqOMcqo89nXPmN2TurSkl3Bybre5EthRT4BcMTzLrW0+DCIqA9mm7Wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7370
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

On Fri, Jun 21, 2024 at 12:15:06AM -0700, Alan Previn wrote:
> When calling xe_bo_create_pin_map_at, use the correct
> starting offset provided by caller at xe_ggtt_insert_bo_at.
> 
> Fixes: 44e694958b95 ("drm/xe/display: Implement display support")
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 74294f1b05bc..cc6101b49c08 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1436,7 +1436,7 @@ __xe_bo_create_locked(struct xe_device *xe,
>  
>  		if (flags & XE_BO_FLAG_FIXED_PLACEMENT) {
>  			err = xe_ggtt_insert_bo_at(tile->mem.ggtt, bo,
> -						   start + bo->size, U64_MAX);
> +						   start, end);

interesting! o.O

looking up to the initial_plane_bo and down to the drm_mm_insert node
I don't believe this ever worked, right?! We were never reusing the
plane and just getting the blank screen on the start until it got
recreated?

is there any link to any open issue or history?

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

>  		} else {
>  			err = xe_ggtt_insert_bo(tile->mem.ggtt, bo);
>  		}
> 
> base-commit: cffd77865f476994680892601e09bc2164179907
> -- 
> 2.34.1
> 
