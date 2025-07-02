Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDACAF644B
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 23:47:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CC7510E0B1;
	Wed,  2 Jul 2025 21:47:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Le4lwzSQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E1A010E074;
 Wed,  2 Jul 2025 21:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751492822; x=1783028822;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=B8UBigZBGcKy6QldUFfSb+u4sGFSEQk7MLrz0fBD62Y=;
 b=Le4lwzSQhs9N0pZWiLSU9n5CAUCnUrZyvhUZz5YgbvAkVnzPV75nYuP3
 fOXsQUnfsa3BmzUEApdaKb6xLDONIfY3e3vtsDB/5XoWjgIqxLqgwLx0V
 HBxVN8NYQ/GU20OK5WnLVQmDhg1omGIZo7SIJ7TDMl4kx9yZaH5vcSuwD
 9NLYQ6sJ/z76kOR7KV+7pn5Pjn6c9UK+84Sxm2p7Vj2B3dTtlcVvc8yLZ
 nDVpkR1jLrxXneiTkFLSZQPNwk8eORXRFC/j76A8vw9Imv91l4gvqUaNQ
 5h0xtyaNoUkd5pemurHJBdjmv6uj8thpF4Wn3YTMgmsPP2LNbRLSQTu7g g==;
X-CSE-ConnectionGUID: 0tcXzg/gRhSPKNEV7cM4hA==
X-CSE-MsgGUID: ZVs+uXnWTdW0MyeztrNlTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="64050839"
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="64050839"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 14:47:01 -0700
X-CSE-ConnectionGUID: D4GzjPujRmecj2aUWOqAcQ==
X-CSE-MsgGUID: /zCbN9NfSJSi4lXk/g31Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="153958544"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 14:47:01 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 14:46:59 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 2 Jul 2025 14:46:59 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.70)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 14:46:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I7Gn+Dze6zP+inzVGLEXak/mU+0rasxZ+ybghWng0U8G2nPGp3cD+Ql/lfRLgJg9CM2xMqy4xe0xKQFRugvVSCJY0jeUbur94HLkMs8WxWoM98ptOGCugK/cKdMPDmfKI/pyu+9owBcl8T22JqbuzyPo6w8i386mG9XgaGNrpzY1MZztgPkChVBrHFI55bVnDgUH58PhQVfQ/BtPj6Ba4v2W8KUSH8au3lob7x6zUORbMjLGhehmAUpJgckKJb2s25SyZW7X+Y887zL9EMfK5Y/JUZfqPhkX3ZeHKpuUZ4VfFud6ouQZIWIbY8g2CY/p5Nsh6yYPKnKJ3reQqEJlow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3xjP8WX5SO/KXJQpzcP1U50fKm8yi1UKPSUwzC7M+Eo=;
 b=wwoNuM6Uxo+FlcHmBJWMq+kQRMIM1zhqxLch7K7LoVVS2xm17TUB879uV9Pjpu0ujT3Bro2QwKptXnPugZVHlj1iV+I+/0dOLrLm7SUiLh1f+6fFP0zz4c91NAOGPQS9D8pA25V/Y3vbMGtqvbQp9eeRMraVMKrI6Q7j8bl4sGrA1zqsjdCegnKCIJvKKX896ZHKtHklo2k1066DpYdKYd0LQoGfmNA9+0TdB0iae/SxqE+goVXNG/RmRaslv7RKU9S6+5dA09lEkqppKI1CYprL/+AIoD9N5nfqYQaS7vFWR0kLYsBYCSqfkfULcJEbJwGJ1VDSzYTk/Y8rt8If1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8427.namprd11.prod.outlook.com (2603:10b6:806:373::19)
 by DS0PR11MB8084.namprd11.prod.outlook.com (2603:10b6:8:158::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.31; Wed, 2 Jul
 2025 21:46:39 +0000
Received: from SA1PR11MB8427.namprd11.prod.outlook.com
 ([fe80::b156:b61b:d462:b781]) by SA1PR11MB8427.namprd11.prod.outlook.com
 ([fe80::b156:b61b:d462:b781%5]) with mapi id 15.20.8880.021; Wed, 2 Jul 2025
 21:46:39 +0000
Date: Wed, 2 Jul 2025 17:46:35 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <anshuman.gupta@intel.com>,
 <alexander.usyskin@intel.com>, <gregkh@linuxfoundation.org>,
 <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH v5 07/10] drm/xe/xe_late_bind_fw: Reload late binding fw
 during system resume
Message-ID: <aGWooERKYBmoCBM9@intel.com>
References: <20250702165216.557074-1-badal.nilawar@intel.com>
 <20250702165216.557074-8-badal.nilawar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250702165216.557074-8-badal.nilawar@intel.com>
X-ClientProxiedBy: BYAPR05CA0046.namprd05.prod.outlook.com
 (2603:10b6:a03:74::23) To SA1PR11MB8427.namprd11.prod.outlook.com
 (2603:10b6:806:373::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8427:EE_|DS0PR11MB8084:EE_
X-MS-Office365-Filtering-Correlation-Id: 8639ea8d-f11c-4479-d3ab-08ddb9b1ecf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wviPdK3loPcWew1do+a+ZZxrpwhoMFZ6lOepKS96tL1O3d1C4Ikc8KVAtWWB?=
 =?us-ascii?Q?rWzZpDOq10aYwrLN2wmPaJ454P3vNRa7Vf7lLCwZx2ErKO+g/lzepK9ZmBAq?=
 =?us-ascii?Q?zV7L3WvVhHnMfhAwfRBvbrnoqrnn6780ZFiyBkHvkwRXKtqC414crs3XtMqn?=
 =?us-ascii?Q?K5DGsomTefY2Hj0y0ZluZrvIW3hfcS6T1VUj5bnYfDiA1wQMsnYdyzK8G+us?=
 =?us-ascii?Q?88u4sNGtk4aeecTfRCga7tpJq2TnCfNFjZCtitDBSnL9cA5QqAHuHzLEbOI7?=
 =?us-ascii?Q?5pXvsTFX0uqCurHgRIaR/7AjLmNKq216zT2QWwmNwNEHRPS/eAgtaE/HCk4k?=
 =?us-ascii?Q?ipuqNCtb6ILF6HZ/siuvHGBcgWHFR3xvEmGiJzsKbNjDHxFCA423ZPIYCGbj?=
 =?us-ascii?Q?FjOZnftZiUownZdeiu6CocfR+KdmIPYU7BH32SKY+MOM3A8YQ72J05c9oF4u?=
 =?us-ascii?Q?uG19NrgMcg2gb6F7OP5PsippTHFHdwaXj+99lyFnNiDccDH3LN5PvLVDAT6s?=
 =?us-ascii?Q?08buu6UKBEWbLLaXK3kFxM8ECaZFOEDQM1NPZQRmb9TXi8nI0zhmt/XZAYHa?=
 =?us-ascii?Q?CbXs704uBf8otojCFxWpsDKwWrVE8cJ3fnkAYU+kyMH6iujvPwXhP55Jr3Nn?=
 =?us-ascii?Q?WLcXEXCXoQlKC8i5BbMAc3tVqw0Zcv5ilPHCgbWJK7qV6vLPqWrYMBNLPcH8?=
 =?us-ascii?Q?AJUe3KUbPL4WFgXah8znprTJA5z+IbFxgscbCunGOZjtJJvIu0Gc1+UwQTix?=
 =?us-ascii?Q?bz6usl13dXvVnIam3Mk5YLCi8gW3RwOufxxyClDRoTJSuhkMgFEmREQle8O/?=
 =?us-ascii?Q?f8x5QOLtEBi7tYBp8EBC1tsF5UlPuIS+BtzPXrhzguQgQyDGPeyWGWXJH3Xc?=
 =?us-ascii?Q?KLZa3g3OMppz/tBCItvLxXgXV9jEluFP/j2brYbW1iaQwTxggvcv2uugvQLP?=
 =?us-ascii?Q?sbu4siPS20mAZoxi0eYAkBgtL5UTqKrT38mSOkFNhSruGboJrYODECu2mKrr?=
 =?us-ascii?Q?Ill1M1FtR3xWCVgSHo3L53EPV6Jc/mxKcubROR0wWcIn5jCRNR8KGNJCOq9n?=
 =?us-ascii?Q?/n5BLVjG4Q+yS4dh0O6ByJIXITptz+AR1SrzhduW52VAEjiM0MiRlJygghdj?=
 =?us-ascii?Q?12qQSkyWFUg7/LS1iOeXlkiH647FbNoYS7y2MojePTGrbD7ogHk6qffCb7QA?=
 =?us-ascii?Q?AeboWtYR5r9E2FpEwjtLzvO76UFseX8BB7rmtkLtTa/UjApRh8wki9Km+oHM?=
 =?us-ascii?Q?/aqI0fAYq5zV2ECf8rp3ROT3Eht/LNF/ldz23yLYTxrG/zTp1Xw/15k9UEbT?=
 =?us-ascii?Q?0WMgDtUWQv3ei1iG60sVxpcPJxVyWS1Q41PGctPhDyhD9W60sZB1N44+wrDI?=
 =?us-ascii?Q?e/ca93lMZa9cPRWt5klZopItQhOTqZsP0gXXc2ovddGOvWOMV9lIURp8bhUd?=
 =?us-ascii?Q?G7/YDByPXU8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8427.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EvqoA4WCKymsgJetJCNzXfpX8E9FrUaPnJPvYiEpOtzLzDsBCD7KSDCX2cLJ?=
 =?us-ascii?Q?ZReSov1K2NuEZwfn0z2C3dH1/grLwgCZ/Xc+6ji//7iCbThXaRFjzt9G6SeY?=
 =?us-ascii?Q?/bgbORdiSJ61DpybQZY7VXCgGN5IqJw2Rj3c8MwsLCUWPRoDykmS1O05ZhlI?=
 =?us-ascii?Q?wvOeNWOx9R9QOACtVnfG3hmTUNptZpWWBgX18I3rnQTJsxHnxfk52mihIugj?=
 =?us-ascii?Q?bnlECalMn6HUIKlzAZFV+R2VAD4XozterBgO7LOGzg94TlQ9VMt2+vCja0qk?=
 =?us-ascii?Q?jsrx2UDdObBsnxFoAYUkf/ryUMNiJQ676S0IHY5eR2h8oC+NIVJnqxwmos7c?=
 =?us-ascii?Q?62IqacJTiU5E2ClqvdTF/uPK6rnuFv00dATHTi8RyI34WEJAt/7i6MNd35sR?=
 =?us-ascii?Q?HH0BjufF7HUVs/x+ToCTpe823Lpt3nIBm5+cDW4dl/Rsv+3npBZmqpcNKkAP?=
 =?us-ascii?Q?LEmHgAqsGHHcwxue9OMfxZvKUrV9aeDGMbA/YUMSvyyfhyq0lJ+be3Jv1pUO?=
 =?us-ascii?Q?rdbirC3MS2ege5uLZxpl+++xjZDZ804b6suqWyr9RX/4pw8KJp/vCaZe3pXm?=
 =?us-ascii?Q?aSOG+sRoWS0cvC3gCc46AErBTynStvuIUsXDIAS4obD/wW+DHLim9PyU/0MC?=
 =?us-ascii?Q?1cjz5qC2jL4nBTKcMbmefM15dCxp2GCYxTbvVayRJiFJXi/4yTSZwg0mqb3R?=
 =?us-ascii?Q?nxlLBhjCBVib3SN0MV5gSnvYBObAivv4nsQzhuwnrJ2XYo9bp7U7utWLt8Zd?=
 =?us-ascii?Q?jouttzwexamVL03BdOhwT7LaTugJCHn/9p99AlPQ6ggWfPZ1mkdUzHUB1V/3?=
 =?us-ascii?Q?JKtLo+TY4Q66ypfhoYc1JRX7FjKMGjf5tpbqmGLaHyFf9VU9jCAyJk4o7POT?=
 =?us-ascii?Q?EIGX3VcWxowJ6Hz9a1NDqTau88aVMzZMocVr+rra/d708zNw3YGXRXWIKQom?=
 =?us-ascii?Q?9oTx5Yy6wPNz+UZ5Z7ZJwG6odM1dz0cYHslZf/GGS/J3zlMFDKptMsEjzpXO?=
 =?us-ascii?Q?fEdW+deqZYOlUC/WASgl3ngJSu3V6ljMKQU4WPUhMmHtcsKqHnABtZvutS9u?=
 =?us-ascii?Q?jLkyRmm3IFfOu9x615+Is5AeoODxQMLA+t0MQwKfhfkt3brkReRIZVQF0TIs?=
 =?us-ascii?Q?N7QXCNCLawQSOyafSpXt2CXP073qfPPbiYx7C8uVfH7JgUtPrGwYMJpI5N9k?=
 =?us-ascii?Q?klBW9lLxI4sgVNVk8TDBch/DnlmZFTHm7jx5BQXrtZVkEM1cW9+9TMf86TIx?=
 =?us-ascii?Q?7vEZBopfxVQCn36EFRUPEjFG2tz2XXDCo1mO6AB97IO2GsaIwqdCQ4gFTaP6?=
 =?us-ascii?Q?6WsQ1szCSXN9PGJrKTbE8myeeN47HOlU3JsFEXhyzPisoMe5UCLq7ilu7pIp?=
 =?us-ascii?Q?oQaxlqVeeuy962oZHPq9VEC0YBKzR44hNLWSXIHulg6yJaanNMVfhMBqbVX5?=
 =?us-ascii?Q?dwYjpmzQmncBdiCuFaozeztNKOJHbnZ9Koy8N6URkqpxfR81zKT+Bxxv9NYG?=
 =?us-ascii?Q?2l99H3ajhk4a7y/K89wDEEDVYZ9M1wzDpGVa668aXwSqtQ3soZXFb2vfyGLt?=
 =?us-ascii?Q?Gwg/+4H4nxqhqjbCns/4ysLW/Uo8tcTyVD/2R7N6aJcLAsIsoHzDvUP/U2n3?=
 =?us-ascii?Q?xA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8639ea8d-f11c-4479-d3ab-08ddb9b1ecf2
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8427.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 21:46:39.4425 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k6RlFmcCa6ioYGC4attowvdLo7cQhPEMcLd04J0r0EzRrmDUs64qmbWvp8FFJwEOujMxHaov8SF/Or6B80TTLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8084
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

On Wed, Jul 02, 2025 at 10:22:13PM +0530, Badal Nilawar wrote:
> Reload late binding fw during resume from system suspend
> 
> v2:
>   - Unconditionally reload late binding fw (Rodrigo)
>   - Flush worker during system suspend
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_pm.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 734fe259600e..13afaf97d831 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -127,6 +127,8 @@ int xe_pm_suspend(struct xe_device *xe)
>  	if (err)
>  		goto err;
>  
> +	xe_late_bind_wait_for_worker_completion(&xe->late_bind);
> +
>  	for_each_gt(gt, xe, id)
>  		xe_gt_suspend_prepare(gt);
>  
> @@ -205,6 +207,8 @@ int xe_pm_resume(struct xe_device *xe)
>  
>  	xe_pxp_pm_resume(xe->pxp);
>  
> +	xe_late_bind_fw_load(&xe->late_bind);
> +
>  	drm_dbg(&xe->drm, "Device resumed\n");
>  	return 0;
>  err:
> -- 
> 2.34.1
> 
