Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4FF9185A4
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 17:24:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8668B10E90D;
	Wed, 26 Jun 2024 15:24:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FwuAKNYV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 743E510E905;
 Wed, 26 Jun 2024 15:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719415454; x=1750951454;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jcRd+6VIXoU/bojNRDzTh/endq+2s0bDirGzr2t0AaI=;
 b=FwuAKNYVJTnSy4sIXad/oOpJUg379tZqKX3iPykwQPxem+ZsKC42Y6X4
 KTo8MpVpqRKQ0/L27ZKvGi3a+5Si9s3ruYTD2DisDwkhd9XRwSPOb1WJi
 M/F4UEBFbkiVoTbJH2Fd9s0jus3Uzg3ik9AXdUckWRBs42QXtM2GceXGm
 jnlLg/wdIAOK60McmgaZOVt2uFqfTx4JKLm2DNhc4TErC4T/QvsJts3kB
 yn9J3Lg1xTu1haEcaLHD1p9xX7a5wd9OLOAi29dmA7GBGlQtYxum7Nmd3
 iwMCH8yd5lOJihZNwmWvMJ7aTWyjHOv7mxcdKamtYHYPpxldlDGhzStb3 g==;
X-CSE-ConnectionGUID: 0jbSDxH9T3yJfZ1p4Jw1OQ==
X-CSE-MsgGUID: v5UHKYakRSiFajCJxQiiJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="20268766"
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; d="scan'208";a="20268766"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 08:24:14 -0700
X-CSE-ConnectionGUID: xH3CSAFJSbG50tV5DT05tA==
X-CSE-MsgGUID: kouq/ng+T/Cq1a3kSCHU1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; d="scan'208";a="48405579"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jun 2024 08:24:13 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 26 Jun 2024 08:24:13 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 26 Jun 2024 08:24:13 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 26 Jun 2024 08:24:13 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 26 Jun 2024 08:24:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YIqgZjjHQzExA+ss1nyFzy7lJmcdvfhnXKM6JAqVJh1roKtiuInMicl5ZIFQazNAD7OGRbZ12ftQmiKhNZwVt1V7DlI2oDzrAFYuZQiLJHoZQbpXUaouZMSLaMkhtTXVc0mOQeccBOwsfz7SlntIQxOrxRpjeCeLnY9NmeGdHrr7Xqh2wwcf8l8MoMiXy1vLITEvwTMcw2qkt5YCwdbVT0mNsj8s8SBndEoTIc6f3WVSteQ93VOHdWiyOLTusVNJZLmg1T6qQmY3LH4lSVTKfhng1g0tebf7DBC4nna54jIFYDL2ZQXDFLObT3RQHgy8eqY/3Mv7VU6dGjb+4MB6vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Vrz368pS24pDc7Fvi/V4EHAobdCvfMxMo4SN5bOPMs=;
 b=Bn5a973ALJ7dHXdCN7GWzEGYXxDuub/c3905G7OcZiGxXIJm3EYDu1S6fd2M20+ojFt+/JuKd24QcMTK1/Ttj/GD2ISc3d31ca5loAOvSoX/E+n23sKBahLTpN5QAz6UaWYmamXVwemTfYJ1MpYjQ0V5GV3z4VDhD/HO/8c5W15vKnqRy8MpDe3UjZUZMEyr3eh5aIkIQS1F7sjHV/6en8XdfiB8iOj0seDlmU9+v8sdME41eAAJyS7SmW8Ya+AAeyxVcwcAdixJYt2fZdQkcyvd9B7nKrpZdKjiYKqFOVpi3RLLMysz/1dxeYQk2KPgWKugNUdAQOc4CbEwmTMBGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by CY8PR11MB6961.namprd11.prod.outlook.com (2603:10b6:930:5a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.30; Wed, 26 Jun
 2024 15:24:09 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7698.025; Wed, 26 Jun 2024
 15:24:09 +0000
Date: Wed, 26 Jun 2024 11:24:04 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, Andi
 Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH] drm/i915/gem: Suppress oom warning in favour of ENOMEM
 to userspace
Message-ID: <ZnwylM64-5HqQr4R@intel.com>
References: <20240626143318.11600-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240626143318.11600-1-nirmoy.das@intel.com>
X-ClientProxiedBy: SJ0PR03CA0211.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::6) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|CY8PR11MB6961:EE_
X-MS-Office365-Filtering-Correlation-Id: 55bd8f9c-a88b-44d8-0b79-08dc95f4062c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230038|366014|376012|1800799022;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?w/l4G0y/YU6UmOYRF3f4jr4GpsIoBwfN2pJOXRmM9VEMqw9fYYHXZs9V9JS0?=
 =?us-ascii?Q?od8JsbJnrAmm19JSjqrGMIkkvP6HtYkT9+Ws6nnXEgMLo3tttTja4ZPXPq6b?=
 =?us-ascii?Q?0GLMsHYdOa9u4e2qDsEcmvKEaBHHD1j7lphtr8YVK+l1Zlx4u3tk8VfrThFz?=
 =?us-ascii?Q?wfzmlCVlmOWNS45s7eNLXkb1Pnioj4SwqzV31rPs4uXEVgXx51VJWBASzU3W?=
 =?us-ascii?Q?0gVMF7/cQi20kflu+ZqTVhGLxVdnFoM3IKUuMgKCE/X5nJf82+L2q9LGJWPE?=
 =?us-ascii?Q?sJHRtRzD9ysX1l7EVqsoPDR4ulP7up0CMnDcCU5lWBlQXSWxRHBaXxaXH+Mc?=
 =?us-ascii?Q?BPPYjum1UGVnXJdeo7oWo6WpAZrVdZbu5iiFWSKKl1AAsZA+s9e6RsAIF9bc?=
 =?us-ascii?Q?Yt9QdzWIRLhlBsBWIgLk+1cvnD33X3bMpQgIn5w0iujk9xRkbrLDKXUhGAJE?=
 =?us-ascii?Q?tM5McpCNwaEkVv9hPmBti+D2Kw+OMfCzvVtpcr3vGCQgwQdP0JaXTsPtldXF?=
 =?us-ascii?Q?S+arqsPqo+d727Mp5QIV1ncjvnvVgiHwZXMBQrOjR9RbFusd3gFKRTuP7owx?=
 =?us-ascii?Q?syWK5CXOaMfjrm78M7EDoqDP9/Gqz2bVwckfUev+GxXmH/lCEtmZf4UqyS7N?=
 =?us-ascii?Q?3xgmRoehF4bS1N4fcg7OcBxdM0nrWIV3pytuz6Y+XgyQR32UU/WcpF37rmLe?=
 =?us-ascii?Q?PkpyxrFk7GDDWW49u2aVQqPpEckVManDDtaQLj6VQGebfDOy+xtw3qU9Kk2V?=
 =?us-ascii?Q?c32KLr98YXophk8a4zlfbLFZpCJ4rSee1rWNY9Zbmpcqd95U+C4/st0AsJ1Y?=
 =?us-ascii?Q?2fgzXtf/RR6X9xbnTxzT8TwzseXOb13lnb1zW6ltGnhz6Nimm+No/VHWIEF/?=
 =?us-ascii?Q?kTTpmSJNu4sgGkpk84PUnRIepPq6w/6uwE1c/588S3y0AJDtin26TKlXCkrU?=
 =?us-ascii?Q?LxHWFMsbQZd8jMoHWvc/HMfjAwrBFFVlRbO2Bf4ImipxsTy9X578tJ/BHmZa?=
 =?us-ascii?Q?0yy3V+lcc1zNNhsmJG0I1tKgjmcBF+a+gdQPfZmf4SZebPSSnoVCj3eMkupH?=
 =?us-ascii?Q?ooXIjEkeB2lEXPGD5h/A9YFPBNjn4Hv1oMSSIKyUkQEwurEPkcbcQh76IKgN?=
 =?us-ascii?Q?pyBDlue80mcI6Lq22x4OClISBYAcbfQvikqfVY9WAPzDxIEObZwRcIc3Na0R?=
 =?us-ascii?Q?rdjo54anUCk8VxKUBLh3RYX9L3ba9MhPjvmHQVhzbTcWYRmvuAX1t9GzMXXx?=
 =?us-ascii?Q?8gMID3Ty7dGToZlJZyqz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230038)(366014)(376012)(1800799022); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?X1Ry8T72+iJcBdCyaCNOLKsQC0AAemvASZG5U+HjbO44UxMImvP1Fl6Pn8bV?=
 =?us-ascii?Q?id4bovPYEahwRCepggo9o6q7QXL0aZ8Zhd8MBqzTuUicXcwpZhGIgbjGajGR?=
 =?us-ascii?Q?JybKVVm6oycXy008WK5VLYbmsl3ptdsDE4HXiaezgWVLfLVsPRx9hc4aW2RI?=
 =?us-ascii?Q?w0JeDdNExiAtk1GWxr4+92AywFz9zyrbAnEC1gCfWLc1NXQq6zdCL7PIHytO?=
 =?us-ascii?Q?chnKxuDscmBV90UJd9SvLWT3ZCybYi9/PGBHIbDqjiY87tbBbzTP/FXEw6+p?=
 =?us-ascii?Q?4aSfcnV32zq+WOZYYHcsuJuF0FZakYJBkzbHMXtsOFPx3YfZztnwHQPxzUsG?=
 =?us-ascii?Q?cT9nv1O0SZ0FdH7MMsjy3jiZJeVsg8xr71gHEZphflAsswxd3y0CzYJUZW14?=
 =?us-ascii?Q?/zADi+w+AHRhViGHTLrakpK7EwMZygWz5dTiLPztLnV3R28p5JBmXsT6pLMk?=
 =?us-ascii?Q?YS7a3LTM3Wjpyr5d6anry99cXxTho5erGbXbOUrD0fDvuDZ2Pb26kRmzKG96?=
 =?us-ascii?Q?C5LEzIPG+s6sRXqtR7NxQUz8/st/zxfo1rRE0Tuhg+eIQqGOmAPpEoVU/w0W?=
 =?us-ascii?Q?1nCRDJcbcKprGVTQFlhbhCnJtrGG1LHcvRjGleHOrOCDx/WSU4cz4drNN4db?=
 =?us-ascii?Q?PQq3jaMHTZjAdueJ/8WB7xcOa73tUiI4cz8TSjC0yZrmqK5X/Qih8eEW3YWW?=
 =?us-ascii?Q?cKC8Ly+vK07OFg9uOj/5FEWuKaWz+IFzNwVjx4xPwlxGEinAuzIei840xuyv?=
 =?us-ascii?Q?tiI31LkhzLc8LdveFXgkzSymwAJH43ql1mvXSiFHTkFPxrBZ0uVSWTtLu1fC?=
 =?us-ascii?Q?VuorKLKxEMYStyy2i3C85sIoKWn/dBefHqFC9X2frtIOt1RcpuTc4KMAi18t?=
 =?us-ascii?Q?8iEbMUREEJZOspqo4UENiM76W3zjRSq3mTFZJ87qoevj+PBAwGte0y1efOO6?=
 =?us-ascii?Q?2IL+X6r0/FriFlPhL/OH9sH8aK7bdv7747h+u0j7u5Wr0n/Jqfo3ETjWIAGn?=
 =?us-ascii?Q?baLLPKyCRLTX7Kd3fGwoH3hxJEl/Kp2qHQq3B21cbWmIuiSQE9/y1dyRtoJO?=
 =?us-ascii?Q?9gD3Cv16TxIj1RF2ds0h9QsojvvTDq42erIfjMhTIpjH8mX8oW0X7vZ7aaPu?=
 =?us-ascii?Q?86YD86mvnS9IoYRHP6Wloc/rdEGlgRAUcPK4tEvqK9lztK63Plx41I108OQI?=
 =?us-ascii?Q?gEJDhTVyM3CPpyqNXf7ah2cIkNkDFG6U92OvxVOz0QtAaeOMECVI1Tn9kkmc?=
 =?us-ascii?Q?Q4vnQtGlo9YiBeRgfrpD0LaK6D5X6k9lD+2E24Gu2VMhJ2ub9Q+uO2Nb/i9J?=
 =?us-ascii?Q?IcKpdMF8gcmw7WBM9ImQjb2i7AVLTQXK8c39Y5sAs+9qQ0MW2K9tX0WmWnet?=
 =?us-ascii?Q?z4mUF1NlKViyY4vMotUmvG7ww8G6G/1iyhuR9ilmlHKT8BKDtomzhU9LYVyD?=
 =?us-ascii?Q?O3qyQ9UzZSZlWeRc56TO4L/mKNgNfSWV3S+UtrJuHQMELsI/PWvjmly6/eEQ?=
 =?us-ascii?Q?umcse1Avpp3TMNLWn+OjsWXaFiOtJMxGmFnkegpXM6YTgCTpRQqy5rqv8hAq?=
 =?us-ascii?Q?M0HE0BH7VXIK778pnYENec/K5RbUpjOUhypOmQpq?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 55bd8f9c-a88b-44d8-0b79-08dc95f4062c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 15:24:09.0832 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bnPrdusLGRIFxqQRjiG1rNYFKfRfQKBI7UJibZXIHoocQOAF8vGISowsn5ze1mteYSuGBYSf07EP03pzgVpf+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6961
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

On Wed, Jun 26, 2024 at 04:33:18PM +0200, Nirmoy Das wrote:
> We report object allocation failures to userspace with ENOMEM
> so add __GFP_NOWARN to remove superfluous oom warnings.
> 
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4936
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_scatterlist.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_scatterlist.c b/drivers/gpu/drm/i915/i915_scatterlist.c
> index e93d2538f298..4d830740946d 100644
> --- a/drivers/gpu/drm/i915/i915_scatterlist.c
> +++ b/drivers/gpu/drm/i915/i915_scatterlist.c
> @@ -90,7 +90,7 @@ struct i915_refct_sgt *i915_rsgt_from_mm_node(const struct drm_mm_node *node,
>  
>  	GEM_BUG_ON(!max_segment);
>  
> -	rsgt = kmalloc(sizeof(*rsgt), GFP_KERNEL);
> +	rsgt = kmalloc(sizeof(*rsgt), GFP_KERNEL | __GFP_NOWARN);
>  	if (!rsgt)
>  		return ERR_PTR(-ENOMEM);

is it really safe?
I don't believe we can guarantee a good fallback plan here if allocation fails.
__i915_refct_sgt_init
might end up in a null dereference, no?!

>  
> @@ -104,7 +104,7 @@ struct i915_refct_sgt *i915_rsgt_from_mm_node(const struct drm_mm_node *node,
>  	}
>  
>  	if (sg_alloc_table(st, DIV_ROUND_UP_ULL(node->size, segment_pages),
> -			   GFP_KERNEL)) {
> +			   GFP_KERNEL | __GFP_NOWARN)) {
>  		i915_refct_sgt_put(rsgt);
>  		return ERR_PTR(-ENOMEM);
>  	}
> @@ -178,7 +178,7 @@ struct i915_refct_sgt *i915_rsgt_from_buddy_resource(struct ttm_resource *res,
>  	GEM_BUG_ON(list_empty(blocks));
>  	GEM_BUG_ON(!max_segment);
>  
> -	rsgt = kmalloc(sizeof(*rsgt), GFP_KERNEL);
> +	rsgt = kmalloc(sizeof(*rsgt), GFP_KERNEL | __GFP_NOWARN);
>  	if (!rsgt)
>  		return ERR_PTR(-ENOMEM);
>  
> @@ -190,7 +190,7 @@ struct i915_refct_sgt *i915_rsgt_from_buddy_resource(struct ttm_resource *res,
>  		return ERR_PTR(-E2BIG);
>  	}
>  
> -	if (sg_alloc_table(st, PFN_UP(res->size), GFP_KERNEL)) {
> +	if (sg_alloc_table(st, PFN_UP(res->size), GFP_KERNEL | __GFP_NOWARN)) {
>  		i915_refct_sgt_put(rsgt);
>  		return ERR_PTR(-ENOMEM);
>  	}
> -- 
> 2.42.0
> 
