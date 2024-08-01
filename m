Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C12E6944E00
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 16:28:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9306310E986;
	Thu,  1 Aug 2024 14:28:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UDc//o49";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E491E10E985;
 Thu,  1 Aug 2024 14:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722522511; x=1754058511;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8cg8kieySRK6DIZik4yp1rY70hZ2wCrFo4mrLlrBtj8=;
 b=UDc//o49vuaEwXQjCLJpA9J1clJdcAhLNZ4Q7n3cVu+pexWD52VR5PgH
 6hkdSdQNJ5TFfoiMBhYuodnzCUoEmEsAmhznIWL/Ce5f6aGk/6Z0pVqwF
 wqfBZbuW45+M5Wh9ChML3MuDmgzOB3bEHz34PHfo/JND0/FKpamjPokwQ
 KVsYEESCk9Kc/zZkWv2+DCpMDk5xGwTQ5yh43k73ZtM6eoJ+9m/21bZR7
 ZpvoiwPAwpWOuvEc4/ABIvvQ7yc02hqsh1JlBiysPhlwlkd7Jkfms0lV/
 TvCTYL2UKiiktBVvXxT+jQMbUacr8WVupwc5HFZ8VMLr6LUpI8GKOhHay Q==;
X-CSE-ConnectionGUID: OS+l9KkPTVK6GDrur1MM4Q==
X-CSE-MsgGUID: WbkpjdedQ6OfuA8/0Sl93g==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="24341995"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="24341995"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 07:28:31 -0700
X-CSE-ConnectionGUID: jFDF/B4GSsagGyQAEqCatQ==
X-CSE-MsgGUID: W6Hn367WR4OxSaM0oCAHnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="59867600"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Aug 2024 07:28:31 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 07:28:30 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 07:28:30 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 1 Aug 2024 07:28:30 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 1 Aug 2024 07:28:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NqT/ysm7P2dBcp3amNM8psUd6+ddgDomywJwRryj2potwUEVbyWn2c091ckkfM9swDRL0L9UnGDPkyS8cTvv5PRmy+XqD+uwq/AQCvKAfJdvqt347wmlTgLAetC/9ctBNEec/qFPmlzeUTZOs8k/IeYCgf/luZP3PKz4Eyf6AH9swX3Sveg8Z5wb+9BTwTTG75w64JjHkgL2I7o2XSNQzThIh9TY1XMojV/hibLSVSzh54laLkT1UeCGg0pGhMtiuIOWd28qxKQVTi60sgmZq/GUd31KEIU/1nxsgBqAbVOeCUatZse5nBXbWaxUtfe82gpxv04+X5ViDwhv0+aMZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nRU5Q00BPgXEPhn8nXaJAlCfjhaZC4hxm4qVlsvzIrs=;
 b=rxffYS1g8ltsXEJuDN7EGF4yXteZZQY8cTB0U1zX6l0UX/lFTnfotjuKeK+NsydlSHDo3SDbb4PLhKurywN9JT64dlfxZPiWB06nMH+KQkeAi6uANfdk5xOnxAZ41xYIIjWmPSbqUX/RVwDyeoxISAr3GEtVWJcApJyvAnAKTKFk8ClYSZx2U6Bak8C7YCFKRZ4RmD5YCi9WFHz80SV/gdL2pkSWPoGJ/2vangqUxAJ3Do9eExxtfUZDB9BUn/+cWVE8MfJPEFuqAVfgc1Rh16vKsFVd1eg68u3dSRvEd2Nz4byf2pDK50livwmJavuAzKjVV9CEX4oFgfVGKgjIbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY5PR11MB6534.namprd11.prod.outlook.com (2603:10b6:930:42::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21; Thu, 1 Aug
 2024 14:28:27 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7828.021; Thu, 1 Aug 2024
 14:28:27 +0000
Date: Thu, 1 Aug 2024 14:27:31 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <maarten.lankhorst@linux.intel.com>, <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v4 2/3] drm/printer: Allow NULL data in devcoredump printer
Message-ID: <ZqubU87gb9pqVgrS@DUT025-TGLU.fm.intel.com>
References: <20240731213221.2523989-1-matthew.brost@intel.com>
 <20240731213221.2523989-3-matthew.brost@intel.com>
 <87le1gwtvi.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87le1gwtvi.fsf@intel.com>
X-ClientProxiedBy: BYAPR05CA0055.namprd05.prod.outlook.com
 (2603:10b6:a03:74::32) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY5PR11MB6534:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fea06f3-7720-4505-224c-08dcb2363561
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YNkrkKb1ahwMr4yV47uDbWYPJPqgohKH7PCXPdAjHK/5WfRirjjbfgzM6n2G?=
 =?us-ascii?Q?cwMsAskuMeEEhRHuMXIgLtnQGnkw/1ouA/AgaQKoq8fXRHsAoQNKYfowzZzP?=
 =?us-ascii?Q?7qS6yvqUNshEi/H2rcYMAWhy4W3gry8zOrxBagB2Qie8KjxYu6ru/uwkRQRW?=
 =?us-ascii?Q?Z9OKAAdwLsralg4HrVLYxiJ0O7pgcFnNnWbA9GUYOtAD/H1DTd8coK/JIqcA?=
 =?us-ascii?Q?R730oo52ngzLpC0d3wwkCv2kfWBgRv6Veigs/Li+jkwLLyoKpAfF4bajfs1h?=
 =?us-ascii?Q?T3Vk6babMdtQhNJylp0EuWuWyaT2aH3sQlIggslLZ3CRmj0UhkYfgGm5LaI2?=
 =?us-ascii?Q?uvVWVwwCoMyGUO/4d3wIwmOTqk4EO1xFbNclrHuwvfE6VoBwBIla2B6uDG1i?=
 =?us-ascii?Q?oBLVhEDEoqGs8VBenkXrU7qClznH3gjXF1kpzR1cW2xBDoqAT3EtQTG13Tlw?=
 =?us-ascii?Q?FhskrFBY/UzeunvgdhG3P5uXplq2ciN1BkTL27r6I3rREk5Er7f+A48+gJXM?=
 =?us-ascii?Q?JYMIgf64DnRj0XS6dfb1PGyfiPUzB28g4e+7qAm1+LzrWJ9CXVyiBIOoGveD?=
 =?us-ascii?Q?Y8VB/+SW/RVpcV3TBkEbDLLeh16gbfJJdDxvAOUdFmLEedpf8hEspwph/iTO?=
 =?us-ascii?Q?cgWuZHew0tw1cT8BkUGCSdhdcGfYHpqHeMkExxyQRsywwRgCau7oZNlWF2aI?=
 =?us-ascii?Q?ixsCsVUTxrnyXQGG5TDI9dY2Pe48re81Tj09lUIQWRyFSylCkx7Sv1aehpTq?=
 =?us-ascii?Q?QE89dca9JSQLfDiOF42RwmEk4NxsFsmCVfk7HLHNZD1mtpx91LKYjinnl3dY?=
 =?us-ascii?Q?EYP4WItTP8izCrT5C6WgU5smHONtbfdGNm7QvA09DIAd4aGL2XOIxtI55dFF?=
 =?us-ascii?Q?eny1cAEIX2H5D2XgdBA0dXbIN5wJXIFMzzKJHVk2NimDIC2uIsCEGrZo3Kyp?=
 =?us-ascii?Q?ihkgQgC3LB8jswUSMuI5xBV+i9BayOjXWt2VUEJL7gDpsDsW/4enYQjHcMu0?=
 =?us-ascii?Q?93Z+aUwfa7MMxBl/94Pc+7FVEcph3qeymdQTE92S+JBNXyLI1dYOcDMEsjOQ?=
 =?us-ascii?Q?0bpeOeP5AnFQovANLp0k4dNVbKFCHX9+DWTQWSvQPhLybFETpo9i90Bpc3e+?=
 =?us-ascii?Q?rzkR5z4W14mm4vrUwKwNhIwF3CH6ncqhV3nYPl/dzZOiyTIqLl7eQiNfd/iW?=
 =?us-ascii?Q?sBB0Jd8X+T074nER5OyeaC+mxrttEZAkByXu9+UPSNqw3c5nucba6l2sAAqJ?=
 =?us-ascii?Q?41vYnqajYV7h3E32lB6pOlZIQ/dgJOPKKN+ztA5Jad/1XjCPPixsRBPMSJ4W?=
 =?us-ascii?Q?FJO9SLtVi6mpDWh0uAynVCU8wckY2k70T+s3vw2hg58zwQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DxNGLSTRphFkXohbGH1YcDVrWP2ov3F8MfW/c3GpJG2Hbct874/D9/F/QSfR?=
 =?us-ascii?Q?xPPAE2LyuyAMfXLNjllfBC+83dV9Biua5+T9qv8xOxoECRB/sMwRlALH2HkA?=
 =?us-ascii?Q?8BwDxfFolXdZYooqYf9UXd1acOrFg8+ltPdLpQVRO/ZXfs5yX+EzpNedXe3Q?=
 =?us-ascii?Q?2MEaIYxQEIv0FYl1j4JGZhfi4kG9DezM+l/aN4hIKv4tcDhzAj6BCVvvDJwx?=
 =?us-ascii?Q?nV099ym3FlEXo+xcqnhNQm038Ph0CtoQccoLW2B24h3fUn5Xf/PabQ5mzcEv?=
 =?us-ascii?Q?6yBwgolK/kFNyoZnl3mwwS3QdonvTedRuSSlNghCEOixK/TOzCXvPwR+Pidt?=
 =?us-ascii?Q?614CbikIB8k7qJxkFzNmQ9wSPTie9Uax2MgCaScdWWWZ3m1OrR8KJh9yoDqM?=
 =?us-ascii?Q?kl0r2BTAE157eP0DwsPUTQphpCrej3i5Z3PPKPER08Vq5arJtbTaS7OOaANM?=
 =?us-ascii?Q?mB05EXT+0F5pkyi8vyAjAYsTMr9QYJ/Exr4l57VJeGfmmSEf6xhTgK/uVrff?=
 =?us-ascii?Q?UqBeB6YQGlrAdB6aJBXrFHEyeac5Mg+p1jB8FPpfAjZGtxctnIyraQb3ybvz?=
 =?us-ascii?Q?UbNIuDqzixQWN16ZGWuSxGSe+Z7FjZSFKZoK/vBiJb2yCNSxzgrxG71nXirF?=
 =?us-ascii?Q?JgUScle7Vb8ztJ3aDfKDIr6AycuLQbX3FW7X1V7L2fjnwyDEAEcVdxsSRvOW?=
 =?us-ascii?Q?RjpxF+aDnpt4wTJKGxP6r0Q+DrX6u4PQFVIvaoHNCyULq/jhFafil4v0yA25?=
 =?us-ascii?Q?iZbv3+/byTvsp+MHBANucUxTK0U0ApPupvtBqc+qtxygZdD3t5ZgY9Op1eQc?=
 =?us-ascii?Q?0Qt1k/Vpqrrm5YQkj1EF7bqPDVCAYQxrZQlGK+l8rSi7STnpJAx6k95Vw/7E?=
 =?us-ascii?Q?qzPpjANyQW2ri9ISrtXbwI2hGLedHp4owiUtBxdXLlmkloRPaVbLLPZJAKQu?=
 =?us-ascii?Q?TYWgVPfZulRZW2raIghRaYRHwdqODcs7X8pnuq5o7Wncpb1oEO403HIoJtGr?=
 =?us-ascii?Q?e+jw8ok2zbMnWtH/5VmvuOczKq2qW+AxlIobCltXkWrL8e07peMc2HoSlfjC?=
 =?us-ascii?Q?FA89FOY6trNBOWv7P9xxvVUKV5qOm4tYVkDEmUainCNHtkH2JBJbb0n663yZ?=
 =?us-ascii?Q?XwkwWQViYl9Jv6ubV3o6rtVe3+Zhfi7I4OjdNPb1Ui2AfjAJgKpvrbzx+dbF?=
 =?us-ascii?Q?joS8rnV9jH5dNO6HBopxuAQBj4ULng7vrzWlETVwCJdvlMswXrKtWELnmVL/?=
 =?us-ascii?Q?w9SkChGhNVtFULd/sO5XEp/qynQCrHixqgkCVrrh6VQR5mZ16ogcUihJGERL?=
 =?us-ascii?Q?5Y45Td5FxdeVHGMfivySkFjH6Qep9wqPk6X8T/7WONJJNwC3GfZL5JKtPeXZ?=
 =?us-ascii?Q?8c3oGXz1Xn/HsEtgTZXz98obbKELpAC4HuTD52P85fhspMSCcT92rIUkruNh?=
 =?us-ascii?Q?1SrlzKSxkZo0CIbxvIZAddn/nyy04T9PO9TYHs8/uBFa4PpYK9E8HF9Sx/43?=
 =?us-ascii?Q?FDVanB4O9zJG6ESE1EfBFbsNniitW2Kgfwew/PZsWsu1s/GOPlJYfAVPid1m?=
 =?us-ascii?Q?9QiW/h9r1S7XEYinOGVJfQBIlS/eqJpjoHTYC2HK574JXsp3SkbG5QvwYLN3?=
 =?us-ascii?Q?nQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fea06f3-7720-4505-224c-08dcb2363561
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 14:28:27.4757 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O3v56L+CwRi2HGE1sDnyxdP9YBzBYGrWIS7LQA+PgwA/2D/mHTodTxJyCew11g9PrijhWVAXd00LEMpL33UpIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6534
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

On Thu, Aug 01, 2024 at 11:05:21AM +0300, Jani Nikula wrote:
> On Wed, 31 Jul 2024, Matthew Brost <matthew.brost@intel.com> wrote:
> > Useful to determine size of devcoreump before writing it out.
> 
> I find it useful to have this special case documented, with an example,
> so it's easier to see how handy this really is.
> 

Good idea, will add some kernel doc explaining the problem devcoredump
in Xe and how use a devcoredump printer with NULL to make it faster.

Matt

> BR,
> Jani.
> 
> 
> >
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/drm_print.c | 13 ++++++++-----
> >  1 file changed, 8 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
> > index cf24dfdeb6b2..a1a4de9f9c44 100644
> > --- a/drivers/gpu/drm/drm_print.c
> > +++ b/drivers/gpu/drm/drm_print.c
> > @@ -100,8 +100,9 @@ void __drm_puts_coredump(struct drm_printer *p, const char *str)
> >  			copy = iterator->remain;
> >  
> >  		/* Copy out the bit of the string that we need */
> > -		memcpy(iterator->data,
> > -			str + (iterator->start - iterator->offset), copy);
> > +		if (iterator->data)
> > +			memcpy(iterator->data,
> > +				str + (iterator->start - iterator->offset), copy);
> >  
> >  		iterator->offset = iterator->start + copy;
> >  		iterator->remain -= copy;
> > @@ -110,7 +111,8 @@ void __drm_puts_coredump(struct drm_printer *p, const char *str)
> >  
> >  		len = min_t(ssize_t, strlen(str), iterator->remain);
> >  
> > -		memcpy(iterator->data + pos, str, len);
> > +		if (iterator->data)
> > +			memcpy(iterator->data + pos, str, len);
> >  
> >  		iterator->offset += len;
> >  		iterator->remain -= len;
> > @@ -140,8 +142,9 @@ void __drm_printfn_coredump(struct drm_printer *p, struct va_format *vaf)
> >  	if ((iterator->offset >= iterator->start) && (len < iterator->remain)) {
> >  		ssize_t pos = iterator->offset - iterator->start;
> >  
> > -		snprintf(((char *) iterator->data) + pos,
> > -			iterator->remain, "%pV", vaf);
> > +		if (iterator->data)
> > +			snprintf(((char *) iterator->data) + pos,
> > +				iterator->remain, "%pV", vaf);
> >  
> >  		iterator->offset += len;
> >  		iterator->remain -= len;
> 
> -- 
> Jani Nikula, Intel
