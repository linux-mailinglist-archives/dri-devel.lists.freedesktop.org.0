Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD0283103A
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jan 2024 00:57:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26F5C10E0DA;
	Wed, 17 Jan 2024 23:56:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Wed, 17 Jan 2024 23:56:29 UTC
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5FE410E0DA
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jan 2024 23:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705535790; x=1737071790;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/RPX2j6SQhj+csgzwfWCqOyYclIzqfMRoeO8/fezFKg=;
 b=W9IRTsPgJBMtFerfQE2MtOGGZozhbWL9ES27BKaRNNPdEgX+N5Lfl7Ot
 EBaTfn1Vdu9hUpzkio1ipdWBjnvIPziTr5i4N0aYvyOHOMECfInfNjwog
 q8S9ztNGQO+WRzMBw2eGv6CDT9zCEoMOyJVWkPN2pokT74t7cPc3lr4oC
 ufAvuPGIWe8N/RMdv+kc/CkyDWIpP/Vjkpa6w9si96CSv4ZbafsnWP8T8
 iQKQSUyKqdbXdgAxo6X75PHu7UwnXzAe81KHU/v0QJhQp7PWy/nfFN1Tf
 VvNdY3f+3l1OK2vyW9z/vQnBEyzQTTayfEEhPXaPVlpK74diAgdX3/Vwu Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="210114"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="210114"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 15:49:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="777571862"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; d="scan'208";a="777571862"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jan 2024 15:49:22 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Jan 2024 15:49:22 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Jan 2024 15:49:21 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 17 Jan 2024 15:49:21 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 17 Jan 2024 15:49:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I0c3CXgS88qcCExVCFNjI/sDlHkCiuHKa02wTXfmcySonZbJR9eSh2NUaIGFeOdXhDLTwmfgzu8ZgDnH4fm+wwriYZv60jauetmw/UW38aUycNHva3QZMv8sY8fKwP0kR/2xMAUJEZqDdVE5CFosZ744jDxzoBf3oeyxcPDgTj0hBBkj2XUvLbvmIWmdQc5nRxOm6d4Sl2eDAWOc6XPRoIo1EfX3Gy+Qty0W5teleGKKOkmNJWoWENbu2I4DwbxV79tOycPi3EmyvIdjA5s6u5JRlgE7bLYmro96+nE2tIjlbNwDDJsti+NiWTBSO2OMHuP+V4yHCk8kPwKOXvIFWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xzgG/e3Z5MQV5kXwuY52enklRlg1NoRb2z9kv/p+75E=;
 b=M4a1RkjZC5TkMpYUsDDwx7M0gg0VxJBYMiDUy3Eea6jZRFtEw1GYu+0vIbUq7SgnjoxRD5ooBXlHVJzFe3Uzllyl7Fir+dNsdx81vErvkEHGFowa7zJAP3K8GtwU6FDXFujrnon7GLx6Yn3xi4/8QxhsmBXU1oqN7M8mIpE2DZ1Zu++D49GGW4puzMDMNUL877elMcO9QafQqsVEqLxwC+Bv2Q/lWW7Hkw/netjCWFziA/lCd3stMd7CV4MDo7Uhrg3Xb3vwf91rG1Gf4ynTRs5tU0Vd+x95841xfo/DcRDQOwGhNes+Y7W9Yh0c1bvZn6jOhAV0MdZ1YSpajP7TWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA1PR11MB6893.namprd11.prod.outlook.com (2603:10b6:806:2b4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.23; Wed, 17 Jan
 2024 23:49:20 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3%4]) with mapi id 15.20.7202.024; Wed, 17 Jan 2024
 23:49:20 +0000
Date: Wed, 17 Jan 2024 15:49:17 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH v2 1/5] drm/xe: Use _ULL for u64 division
Message-ID: <20240117234917.GP45138@mdroper-desk1.amr.corp.intel.com>
References: <20240116174050.2435923-1-lucas.demarchi@intel.com>
 <20240116174050.2435923-2-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240116174050.2435923-2-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR01CA0054.prod.exchangelabs.com (2603:10b6:a03:94::31)
 To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA1PR11MB6893:EE_
X-MS-Office365-Filtering-Correlation-Id: 35633209-2d82-4bbf-9056-08dc17b6ec83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ni5uMN1tYyP0GJbYL0RdLFV1SVjyb+FIXs0fQ/244BsLicTApfRE9j+wSKoSNU9gofm3OxY56qKA50wC+VJeyB4/B80uEtHqfkJWGhueSVEQCVLd+hXY9nQ6GXtHiVpaZJua0IhqbL1FeNHKtVmRha7DmFLB/5gUCU1kqKLnrvo0/QckPioYh92gyBNSG9qi6MCOX4dmv9HOw4P7dO++4G70DgyGNtqsIR6LQQY/R1rguHkIvW8qrYpb8UHwPt9JQM5pROB0kR6Ku/dd73YCdAg3YRqnNgiyB4amxihsM35+oV+G5Ua4B/odwXk0piXVMbI89Mq6Rkx2T3Wvl4OQSGa1OQIFMubTgXof1dsdFa6dO1RehEPYBeEeUdPYp+ujIyEBf3qiWIp9ZtDFK3kpa85IpO75upAAHYDHgycW0zVgqdDT0MZbv9tb6BqFO+z3f8gFTFcpsJI4+56UjG5Rgq0+Liq6EQKGTBUfadaXurvmIPyr/xqpkfWhDEojm2vRsUUfWjBES2rE2YWKgEV/cVOHVKF5+i+SYNRyIbf4hGNEDIcHBKnXAM5O58nRLGI/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(346002)(39860400002)(366004)(396003)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(83380400001)(8936002)(450100002)(478600001)(6862004)(5660300002)(4326008)(66556008)(316002)(6506007)(6636002)(8676002)(66476007)(6666004)(6486002)(66946007)(6512007)(26005)(1076003)(2906002)(38100700002)(82960400001)(41300700001)(86362001)(33656002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yUnqJuVfou9ovU/3Ei3Z1D8/8mK1DcTF8JXjzvH9+G6kVfs8T4SCJYTj2Ruo?=
 =?us-ascii?Q?9Gcb+C/e5qleVUP+dZQhsWDp4EqEp3Hu8ovIkHj3te31G8ShLG3E8H8DCVgz?=
 =?us-ascii?Q?p6te4DAqoPvZxI1KzdA+kl7DK6OYwOJGSGwE5OdqouxdegRmODH5V0fwutNE?=
 =?us-ascii?Q?ZqaSM1I+0Z69g7O43CQK+loVyT7Jlv1+iowg0+H25MHK8V5/wkeUYSBXpFi/?=
 =?us-ascii?Q?Lv/YWouxMhrCDamWVMSKomXNhYkrxO+hgymcdGV0wPLd3DrXA206kpdKRGod?=
 =?us-ascii?Q?ZVN1ylBG3L9M5FLU4pZyUZR5CCEptAbLe+J7Gve9NDPW5agWcBPrITDFXF5z?=
 =?us-ascii?Q?p5D9k0nRDpGKr7j0Apu43gIVvQIbOiDuvUbE9zGxwwOdekPJ2vkt9V5bR3JS?=
 =?us-ascii?Q?oAedASJHEzxUyiVF07op2YXHSIyOsUETiH5qwR3J0yfAvj0nBA94G46u6D2u?=
 =?us-ascii?Q?eoxkE7iHv0/1Kf8VSI5sI+Gs+87uSY88Ov9ysPmbln7rBLi+UmXViuf5UkAb?=
 =?us-ascii?Q?bEr0hqv7uj3YgrIH9JIUCs7py5E+UFUe2A8eBHPoEHGDKazgmfwyJYhxmoYX?=
 =?us-ascii?Q?auH71I0bW0ZQPuaJ+FVBQKNeszhHt8fgn95swS21PEDw47ktSUmnOdS82AiX?=
 =?us-ascii?Q?c/+Zc4z+ro0G1mtGSzlO5Wylh4JRgiGrul8TrMFhkKQRiQVBxw26LJR6PaID?=
 =?us-ascii?Q?xb7fOyUXNcNL3CmlxEi9fuu/7vJMNcdEA7sq8pnr/Qpu4a3C63pRrfdg7Gig?=
 =?us-ascii?Q?OfC2aIF+5lg2KfkVslPW/STqKVa28YeoyqWF2g8T7KCxVAOeR7cO4+NH7ipc?=
 =?us-ascii?Q?2OLV7gfrwLI/B2VKbMGQluMSeByw+oKje1nlkTGME/YT+YtTszZBOxadGmK1?=
 =?us-ascii?Q?gFO2usfPu70PfYRz2WKXGOgGZPEoQtjtNnFNQcNLeLQ0w41bIePRS139Bq7I?=
 =?us-ascii?Q?vbgHbjhaeDVoFuTdbYwAMV88FN0N5hj30jEW5G6VNY7w2m0oxlmjn0GiqVZW?=
 =?us-ascii?Q?TqRw5VXooOO226jwFCel633RVSwyCXAgmgHCxRagc6Yqu6j1svOMBOLiS3iG?=
 =?us-ascii?Q?Op36A7R3MF+u6IOXSY97uVGIMRat8oZig71YsL0k5o5Y1SwXyyzx1Z6EgF5+?=
 =?us-ascii?Q?MVin1IEY4rcA5xoBJgzPthrsFbcPvg8q58snIyeGqwjQcqB7xaOcGWRMhG2Y?=
 =?us-ascii?Q?P+KM8Adkjbtjdn+7uK/H2U57miUGGZcP7VCQViCU2yqrOQTY0YgmNttyLgq4?=
 =?us-ascii?Q?Ibt5g4U7hqGXDFvLUXtQ6qbi1v/MEC8ypksYP46PkeBwhsEWkl+sPZwLSUzm?=
 =?us-ascii?Q?2YeE4ihVQdHjPR8PbiE4A32zG3Sd+7iZpuk3AYwk8/XMaKIY9zFt5DXZfES8?=
 =?us-ascii?Q?x/UGyAs2TNudrP6WcABWhd4kc1sC1xjqMC/UZaAg+AodN9nY7UO3ZBbbo8dr?=
 =?us-ascii?Q?UfL3hb+/PGx8la4dwE4rc1xPeUfaCkjgHo/a4tCzB4crlb0OcXiLFZr/7YFw?=
 =?us-ascii?Q?1fF0hvjCt4G3PwKEHiReBQ6bJfcTlHpM+UJtX253gypkbzq2sIDKxf/Wlg4M?=
 =?us-ascii?Q?lMNEPwI/YHXeH1GDtsO7GH4RxsiFwNJAOFjcCI86plNBqZ26KsZof7U9XhNe?=
 =?us-ascii?Q?JA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 35633209-2d82-4bbf-9056-08dc17b6ec83
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2024 23:49:20.0339 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sMXmFpcS6uroq7bY+/SqVphS+VR0A852Ekm30ZhWOlQQQyMoJM9iJAY3+qkxB2yYiLx5zW6By2wAr914muLjRiiXSggD+0l9vRco5nanZzY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6893
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
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 16, 2024 at 09:40:46AM -0800, Lucas De Marchi wrote:
> Use DIV_ROUND_UP_ULL() so it also works on 32bit build.
> 
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index a94c0b27f04e..5f5e3c7132d3 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -624,7 +624,7 @@ void xe_device_wmb(struct xe_device *xe)
>  u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size)
>  {
>  	return xe_device_has_flat_ccs(xe) ?
> -		DIV_ROUND_UP(size, NUM_BYTES_PER_CCS_BYTE(xe)) : 0;
> +		DIV_ROUND_UP_ULL(size, NUM_BYTES_PER_CCS_BYTE(xe)) : 0;
>  }
>  
>  bool xe_device_mem_access_ongoing(struct xe_device *xe)
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
