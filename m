Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B515ECD1B89
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 21:13:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8379010F00C;
	Fri, 19 Dec 2025 20:13:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O0gXnP1S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 069A910F00C;
 Fri, 19 Dec 2025 20:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766175202; x=1797711202;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XjC6mVmFf/mmlvl7N7UCgXAy4AM9LzpxzHOuME8QJ14=;
 b=O0gXnP1SVv4KIZ7V3S6vJVhBjr8X1zObHcnOlTQ4MTJhTLbfX+L6YCnW
 KsxnbtBwaBr7aMZxcoyWdk0iSLSujfXxqior9NARVwnhcOozeEcgEjDIs
 HVKzDuGTlcNAgpxDcVkTUb1cBJrN4SKu+Rrjl7Ar+FJUUMLgCq5yv7f/A
 tQDQ9FPqp9aLXm9hel6Pjsgq7srqBojoN7le5MR0DDVbvzpldM2Nl/5Mw
 Nyizhq0tVUPk878hl1sh8eteRH1S8i0I6ATRy+kcnLYghmthJ6noKnnyB
 ZNXr00gG1joxHb9FVsefJ5heUb3KS1FmsT+lu2X1ChZ29QpEGa6GFUes5 w==;
X-CSE-ConnectionGUID: 0d4MTSAzRBiOhfiTCm3cZA==
X-CSE-MsgGUID: 8WJ2sn/5QqasJU7KvxsPWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="67334662"
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; d="scan'208";a="67334662"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 12:13:21 -0800
X-CSE-ConnectionGUID: V6QUdvQHQ5OBcaNlEGRc0Q==
X-CSE-MsgGUID: bqjJfn6JTB21rTQDJyDsyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; d="scan'208";a="198706053"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 12:13:22 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 12:13:20 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 19 Dec 2025 12:13:20 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.12) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 12:13:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YOR40hdh1zqmiQTK0lSfJibaZ6KReTB7NW3U79g9p0rEAH8ZEntloKkuGChPNDDa/YSa7GGIIrzpYu0RCgt/ZWl+Fx8T1QaPemnPVDeKjgV7USFuRdNiDidquh7dLymOwme8Xg+0VCVWJJ71UKWhZlyyL6s+x4QUnywLPyw2g1kY3wkQy5skHZF+a36uP4hiD7SAkrPNUimE52s9v/16PEQ7hv1NStcb0hudLtEbQPLMvxO9cMjUc3aoy7y5SJQKF+1MzhCIB/WDhsIjrTrd88ip+82Mwgp//3zo0QHt/YfDjLV3tSGPg8JpTTvE7+ZT8W5F21qlMYMbiMgaz9GJLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=033aI9OyvPKw7oJ4EZcukkEOStI7akpgrVSAv4XFb7A=;
 b=Nw8+EMJ+gZSHacwX8sY+Kwf3cO0qtv/wvhiH4Nc6uWRFnxLUy1m2mADqDmFmQSL+lllbiZMtsRCIMWR0hNz6pk8jGMGv0pm4IDFNhhX5oRktB7Q+rNrmEEVkezFuubGvQPJRurwIl/7swSOBJ+rImrhigK/D7ljJqP+k6D3j3rq5r+9Hn5Fr0fvfnGC8eLQdp6tqMC9hV7Oq35Rt4Y1NanY8RJwdfeEOB5ntz7W8sSkXVAC0sa9M0lI+aJqWz9JS/H04hqPRgN5RMaSVFLWSisMMLVt9hL48MMV4jLT3dpn3TGB10dYNvDEpE1GnjOuHCmdR7ZxqnIGCeRrCPX55Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 20:13:18 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 20:13:18 +0000
Date: Fri, 19 Dec 2025 12:13:16 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 3/4] drm/pagemap: Add helper to access zone_device_data
Message-ID: <aUWx3BLs9mUBoNJ+@lstrano-desk.jf.intel.com>
References: <20251216201206.1660899-1-francois.dugast@intel.com>
 <20251216201206.1660899-4-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251216201206.1660899-4-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR13CA0123.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::8) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA3PR11MB9256:EE_
X-MS-Office365-Filtering-Correlation-Id: e9fc9adc-6ffb-4e98-072f-08de3f3b0ccc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GhlMa6iDdnwg8fcNkZLUfwIbTXzM6VqElOoMMszFOv8NwMJtymJZt+mFmrGF?=
 =?us-ascii?Q?tvmowhG7SSrxTEZwEvBDUY1oe58t+V53+syHiVZWf+8KM3Bh/zDCO4xQuD/Z?=
 =?us-ascii?Q?VjjSlzKplhxGgubp5sjGATRxb9TMBoc+XjhGgGRKWATqSEExZfqKI8bgF1df?=
 =?us-ascii?Q?MMF5TjaQ0jkFTNwsnph1zYHkV4Gn6mBAnzHCa1OjzyKj16hkfC+HOoUSrXXp?=
 =?us-ascii?Q?U5+nROzRabobeMnZ5ArbO1mEBpCaXyou6NqRJnSpTx2GlG1kpzkZU8rIOPxw?=
 =?us-ascii?Q?dzyp5HTMEMlts4evQUzFoppFG5fnNtrRDK5A6D67YkBEdEsDGsHN+IXGKX6C?=
 =?us-ascii?Q?/PdnxWIbetj/bi/JwtfJD2v1b6o3CuVMTvAJ8FIl7BnoOoobcJZKAskrM3yf?=
 =?us-ascii?Q?Os+44otQ/c6FCHASQbJXlIFhuyaUwenSjgY8FrlgeOzy9JsTfjd3mHvhu/V7?=
 =?us-ascii?Q?iiX0P116qr3uVcqMbhS3FGV1nDSHL2vRS8M/VbL8xaP2ek2j9sf+MV40UgMn?=
 =?us-ascii?Q?nnG66hIEnAC2KPC6LKmwrTgg38uOw1akpU1SHW+SaLgzKjnoiK4ai8/sHvlL?=
 =?us-ascii?Q?Lo8xDEIC2sGK3RQxvO8yyjRSSgZrVFVD+dTZFnfkfyUh7zdz5sknE8aSD81s?=
 =?us-ascii?Q?rxNHseyI8ha2X+dZeM9vlyp4GJfoMG9du6qXHGbtlJacLI/WQMT1AmEYMSQn?=
 =?us-ascii?Q?1MLoKBLdkJfVN7guy0sQfZH9mNWQCJUz/t4wRlwaWpa4a1/Qj4bn2dNGd+al?=
 =?us-ascii?Q?1gWAJqx1plB03wJyd3JGw6rIj7HAMJyKLc4wuW3yZwl1J3KpCoIoBnMgFvg4?=
 =?us-ascii?Q?vwspctDhTC2YcSO/j9g8ahnYuFMvsSYms/GMtN0WeRNrCqpQs1/HArpEmnnl?=
 =?us-ascii?Q?R3/qdAP1SGS3YdetNfDmkaURIOKS82X8FdBKEO/cJM9/K2gZ5aOOYAvyfmx/?=
 =?us-ascii?Q?58CVBHCl0pf+tCYwFw01KW+yxbcSV9ljJLlYWZeThuH5958A/evAgSzn9Lp6?=
 =?us-ascii?Q?fJaCppkvny0twBip4CQC7++zmUou4Dk6ciOQ3oUVFtrDFAJbS9QVgBeC08OF?=
 =?us-ascii?Q?LPUVpDSaMLeych2D8zMpsldGJwMc3Wth5XgnrdaqgUkxZilVqc5vbWcxSFPF?=
 =?us-ascii?Q?1GHCHIL1zmu06M5FkRk+LsK8WvEv0QLyV2gcvcbTtp6uN88yek+xT0DR5G6E?=
 =?us-ascii?Q?N0p5z7MySRjeB2OhjdDiW2E0IhaABqVx8N6UByr7zVxjP9yf3QYymw1yZ8nL?=
 =?us-ascii?Q?9TUINVRp4Hg2EtqRNZLOkuza/SJP/6Z4KlKhHiN8/H1vdoJ+8XygBBJZapqa?=
 =?us-ascii?Q?NjHP4cjcRzIn9Tsb+/HEpVSihWRTwqTjwg3Px5Ws5EZ2WthBV6100uTHpqrj?=
 =?us-ascii?Q?5zdJnjWYv3cG82xvb2oyoqz8BKoLWqeGIL50yEo7HJt3nw42/Mb2wuaJKDok?=
 =?us-ascii?Q?E7jccNAyeUJfCH5K6RVcE0JOG9tfNnOg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?X70A/TJfSCTF7/zfBbeuleiQt2k23eOOE/B21nHOYHxS4coJmjFTbERF5Apw?=
 =?us-ascii?Q?5lPNNGxF8ID0X59H2deSxFAyWMQcMMoIelAEmI8DogYNx4DX5acCKDgMYlC4?=
 =?us-ascii?Q?dySHasjLfpjBMEsPKxqXk5H4me/vwHFMbbaKd9tqOayY2sawbKh539kSLnYQ?=
 =?us-ascii?Q?PzZ/rK3k9KpB+2Q7gNYmWZmteyBAfiPezh+uJhG83hxAvvR4BjZ09l4DCReU?=
 =?us-ascii?Q?Tmf6vje8hy34h8q9g8KUiv5uuC28+AdxBQQxVvAzQbbuTzDurB4vee+A2ZKf?=
 =?us-ascii?Q?gEySfUeAj8ckgCSvxKpzJ7LcnLekQY1MYEjJtIfWL8L1iUvZnWn4nhDyq/wO?=
 =?us-ascii?Q?VUiTPcht8Y8fHhh98hmbSn2Qmwq7EIc+xZY7gH2wsqSfW493ARQfQyp5Pfsa?=
 =?us-ascii?Q?K6/l2H67SA/JmGztappBH6WIkWHyskOWT4+O2+bB/hLiiozOlSCOvkQfxpHw?=
 =?us-ascii?Q?Qrwh/VHFqFo0o12Myp1VzvJHixJ8gvJtTUQXltXJgDyz9ZSFwnZ1Eo/DSHpR?=
 =?us-ascii?Q?iIou/YG0ujuzAX7Sz+3pneZHj+mgk2lBleP5nvrzX3HppEmFH9XL7pxEVQ2S?=
 =?us-ascii?Q?fIDeVd0Tn6yac//iP9VxGv9IOxCPqVxHSjC3WVM7CGlYQl4L29e7sQgXD98R?=
 =?us-ascii?Q?1mjt9JfF0+aKCqHsE2nM7HTqHbs0XhHnF1LXemRmrQjgwPwvOnrnxOvN86o9?=
 =?us-ascii?Q?2RGM6aoc1uxQvpFIK/dDGJMGflCH3aclx1shs5d/uUPVLgOWz++wRuiVJFGX?=
 =?us-ascii?Q?Yh6DCq6tIBCEjFhqfrnmqjiBUiNAU4/cb7ZWcTSyFqaEodjtBriamozDaL+0?=
 =?us-ascii?Q?5YLgIJTqTrbGzxlGEgvY562299glmyyOxKSe2NWviKy7KmSqJvkGlATSB6dl?=
 =?us-ascii?Q?jgGF0Iv/OtPJS4dBMnHp4grTPdfCB9vQYg6s3BYpt+RpWGlMA6+4EujLamDT?=
 =?us-ascii?Q?7oWNSawuFICL6eoIXeyYEn6T8p9/362w6vwza6dK8CdE+OKmozmOQJPQUhEL?=
 =?us-ascii?Q?I5cpL5S6rvQ4vSsfKcz4c6loqrW+KpK2ewiocwWaGNXQKtn12llSppsOlirw?=
 =?us-ascii?Q?gAF1P+W5yhc1nDasOhwylEQOr+X4SaPj43XeJcu3NiNQUTHBwhg6NIzWXEMY?=
 =?us-ascii?Q?pqj4Caj6E8fTGm+drvN0ujx3SSnRos0mdK7AhjqEWNCEzFUDhUuC/M1sN87M?=
 =?us-ascii?Q?1rPTSzhAzXE/YABQuYTviOJDwNzyUdzRkqcH1GaQs+UwsZ+oju1dBSK7jkBa?=
 =?us-ascii?Q?BTM0uq4O+TN+PYdVru2U3v3e1mfG9LDI/hd0jbgHeJBZ5GGdoWwi5BvqZj5h?=
 =?us-ascii?Q?F0Z0Qy192ej1A7ImRDUEyuRnvKcUd3KTa/xTTr9Z2RSGRbKk4+ekMVdJwZkM?=
 =?us-ascii?Q?VDt3+rtXcktdZ6ipaQWLHonoabqFfLeK9HDvMNVCDuKevQl+EbpwX2U2sHwX?=
 =?us-ascii?Q?u7DeimDzaEpS9iwzvttoYVFeehFX5Xgs7qq+87Ueg5ElNm5/hALknbqvgClp?=
 =?us-ascii?Q?mdLsMzA4dmpabuvbzwA2vqJItQujL02r/dNKaA2G9RAvH0sZpyh69bZQ4D6p?=
 =?us-ascii?Q?DNdQAiJv+nK7yZXcLpyNX1wcwhFJEHDLvFi8sQqIe5afSp4hgxtEfr7qC36N?=
 =?us-ascii?Q?HzE2Ygzg6j0AdN07S6huGZwI0d8ZwrBT2Jh1xMfTllbPSxDjJWB/3ohxCrHR?=
 =?us-ascii?Q?8O1mvx/QS2pW0PR6gMShk/wS1aGHYEuLrrJ1zObGKwzxfZCkH/rcrzIkfLbj?=
 =?us-ascii?Q?4arVqD3v7Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e9fc9adc-6ffb-4e98-072f-08de3f3b0ccc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 20:13:18.4943 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eMMG205WwDNOEdTx5a64CfS7+XoXuKdH/PAW1zadjebNKjt+kcrREDkkVyBkaNE93YDYL3oKj6R2k3nWtmwUlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9256
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

On Tue, Dec 16, 2025 at 09:10:13PM +0100, Francois Dugast wrote:
> This new helper helps ensure all accesses to zone_device_data use the
> correct API whether the page is part of a folio or not.
> 
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  drivers/gpu/drm/drm_gpusvm.c  |  7 +++++--
>  drivers/gpu/drm/drm_pagemap.c | 32 +++++++++++++++++++++++++-------
>  include/drm/drm_pagemap.h     |  2 ++
>  3 files changed, 32 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
> index 39c8c50401dd..d0ff6b65e543 100644
> --- a/drivers/gpu/drm/drm_gpusvm.c
> +++ b/drivers/gpu/drm/drm_gpusvm.c
> @@ -1366,12 +1366,15 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
>  		order = drm_gpusvm_hmm_pfn_to_order(pfns[i], i, npages);
>  		if (is_device_private_page(page) ||
>  		    is_device_coherent_page(page)) {
> +			struct drm_pagemap_zdd *__zdd =
> +				drm_pagemap_page_zone_device_data(page);
> +
>  			if (!ctx->allow_mixed &&
> -			    zdd != page->zone_device_data && i > 0) {
> +			    zdd != __zdd && i > 0) {
>  				err = -EOPNOTSUPP;
>  				goto err_unmap;
>  			}
> -			zdd = page->zone_device_data;
> +			zdd = __zdd;
>  			if (pagemap != page_pgmap(page)) {
>  				if (i > 0) {
>  					err = -EOPNOTSUPP;
> diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> index 491de9275add..b71e47136112 100644
> --- a/drivers/gpu/drm/drm_pagemap.c
> +++ b/drivers/gpu/drm/drm_pagemap.c
> @@ -192,6 +192,22 @@ static void drm_pagemap_migration_unlock_put_pages(unsigned long npages,
>  	}
>  }
>  
> +/**
> + * drm_pagemap_page_zone_device_data() - Page to zone_device_data
> + * @page: Pointer to the page
> + *
> + * Return: Page's zone_device_data
> + */
> +void *drm_pagemap_page_zone_device_data(struct page *page)
> +{
> +	struct folio *folio = page_folio(page);
> +
> +	if (folio_order(folio))
> +		return folio_zone_device_data(folio);
> +
> +	return page->zone_device_data;
> +}
> +
>  /**
>   * drm_pagemap_get_devmem_page() - Get a reference to a device memory page
>   * @page: Pointer to the page
> @@ -481,8 +497,8 @@ static int drm_pagemap_migrate_populate_ram_pfn(struct vm_area_struct *vas,
>  			goto next;
>  
>  		if (fault_page) {
> -			if (src_page->zone_device_data !=
> -			    fault_page->zone_device_data)
> +			if (drm_pagemap_page_zone_device_data(src_page) !=
> +			    drm_pagemap_page_zone_device_data(fault_page))
>  				goto next;
>  		}
>  
> @@ -670,7 +686,7 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
>  	int i, err = 0;
>  
>  	if (page) {
> -		zdd = page->zone_device_data;
> +		zdd = drm_pagemap_page_zone_device_data(page);
>  		if (time_before64(get_jiffies_64(),
>  				  zdd->devmem_allocation->timeslice_expiration))
>  			return 0;
> @@ -722,7 +738,7 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
>  		if (!page)
>  			goto err_finalize;
>  	}
> -	zdd = page->zone_device_data;
> +	zdd = drm_pagemap_page_zone_device_data(page);
>  	ops = zdd->devmem_allocation->ops;
>  	dev = zdd->devmem_allocation->dev;
>  
> @@ -768,7 +784,9 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
>   */
>  static void drm_pagemap_folio_free(struct folio *folio)
>  {
> -	drm_pagemap_zdd_put(folio->page.zone_device_data);
> +	struct page *page = folio_page(folio, 0);
> +
> +	drm_pagemap_zdd_put(drm_pagemap_page_zone_device_data(page));
>  }
>  
>  /**
> @@ -784,7 +802,7 @@ static void drm_pagemap_folio_free(struct folio *folio)
>   */
>  static vm_fault_t drm_pagemap_migrate_to_ram(struct vm_fault *vmf)
>  {
> -	struct drm_pagemap_zdd *zdd = vmf->page->zone_device_data;
> +	struct drm_pagemap_zdd *zdd = drm_pagemap_page_zone_device_data(vmf->page);
>  	int err;
>  
>  	err = __drm_pagemap_migrate_to_ram(vmf->vma,
> @@ -847,7 +865,7 @@ EXPORT_SYMBOL_GPL(drm_pagemap_devmem_init);
>   */
>  struct drm_pagemap *drm_pagemap_page_to_dpagemap(struct page *page)
>  {
> -	struct drm_pagemap_zdd *zdd = page->zone_device_data;
> +	struct drm_pagemap_zdd *zdd = drm_pagemap_page_zone_device_data(page);
>  
>  	return zdd->devmem_allocation->dpagemap;
>  }
> diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
> index f6e7e234c089..3a8d0e1cef43 100644
> --- a/include/drm/drm_pagemap.h
> +++ b/include/drm/drm_pagemap.h
> @@ -245,4 +245,6 @@ int drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
>  			    struct mm_struct *mm,
>  			    unsigned long timeslice_ms);
>  
> +void *drm_pagemap_page_zone_device_data(struct page *page);

I missed this in my previous reply:

s/void */struct drm_pagemap_zdd */

Matt

> +
>  #endif
> -- 
> 2.43.0
> 
