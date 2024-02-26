Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80AA48668D7
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 04:47:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAA5F10EDBD;
	Mon, 26 Feb 2024 03:47:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="byQ3msQE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93AA210EDBD;
 Mon, 26 Feb 2024 03:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708919270; x=1740455270;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2iiW3naxHnEZK+lzSGzaAKebHL61cLXJIYV9IH4hNtw=;
 b=byQ3msQEbTGvytRMJNYZuC3SJ+xqKrpzmZd+D1PXURjRM+4vmoctpL+r
 nnVR2KlonxwD9Ox/7watiMmhYpgNVTuMP0qZcEESEe1gxrDEqaUIoYP0u
 UgihdXImNLsvnhMx0sJgEM82asU1aTQTw6a/eJMGSmuIQmtlwiEVZdI9U
 eJGe0ntfBEFCmdokk8LZrbDsKPaWDDJ5g2UZMG97FFFpJqej7YZkcSC2r
 /0uAC2UfxXaK0+Hbl0iqsefiBigy0DFlhdWIcHdB/+igub5ewH4wpU0HM
 fQYt6GEcbZ/1sOtP3o2JM1hr2hUzyIWKcRckrzILurhum+JPQMKYDpH0B g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="13829518"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; d="scan'208";a="13829518"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2024 19:47:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="6519582"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Feb 2024 19:47:48 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 25 Feb 2024 19:47:47 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 25 Feb 2024 19:47:47 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 25 Feb 2024 19:47:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N1EaO+W8Vq6ca3C+2ontvJrIDpdyw9tax3rvS6OiHvXJs4jXHvYUKE7yEDDm2M2a29as9wxnQUHLpSR5WLtlB3YH3rtu/5j1cegtAdp6oZ8JDswipjr47SjDML8ggLO0SEDis9G+NTHxIuALW9F/d7lUdQrCtDrCLtBz7pOvPr9VSXMNRRs6j+abOLTSOO+Um9D+/JV8dD2mhlIFyF7Cl6bvnzsIg/ikB0ysrqznBLyPFzSA1Kj1MMmI0cNBGMw6lUPpuqehbumV1KfiErvhf0apsUb6rEKCacsee0oxg6fuCh5QSDoF7ckqz5GgB0rDHzPzcXIALqsSRKUpgpfLNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IX3+4965Qqt0TusY5+wtMrbN0YTPiUxzkTLTsiIV8FQ=;
 b=CVm5QKQMXCzGy5SRRi5uw1fEYq9hbmWT3OPkll1VeaIAWFMF6grKCRGCH04v/KXxN4sFasAIERbWcX5tCwmgzk2M4g0fG3Fiu7VnTim9fm2kBbroRwL2qxqBDh7o+Dp0UfuJpMGu8n9/qmdSsl9GgItKqDTKKXKkro7nbIumqrC0jQIGVOFwU3+x0By1YYBCz1CnpzshxZwlYDveIvdg2DlDESKMHy0GfR8epL12asHsfANACytWipd4qunxLcYnm8bHi6kWZmfwNVR+Uow5SWUxa8l1WHCO2t7jGHA0GEGjr1E3qNvlrchktGx2aMz4nQS/SGJjJKt631lTVQA/aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB6168.namprd11.prod.outlook.com (2603:10b6:8:ab::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.8; Mon, 26 Feb
 2024 03:47:44 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7352:aa4b:e13e:cb01]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7352:aa4b:e13e:cb01%7]) with mapi id 15.20.7339.024; Mon, 26 Feb 2024
 03:47:44 +0000
Date: Sun, 25 Feb 2024 21:47:41 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Arnd Bergmann <arnd@kernel.org>
CC: Oded Gabbay <ogabbay@kernel.org>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Matt Roper <matthew.d.roper@intel.com>, "Matthew
 Brost" <matthew.brost@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>, Francois Dugast
 <francois.dugast@intel.com>, Dave Airlie <airlied@redhat.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] drm/xe/xe2: fix 64-bit division in pte_update_size
Message-ID: <nuwtejmu4nvxxvkobawafbmogpx6qjk3dnbnj7kobfb7gvpyw7@pxg3bv42qkop>
References: <20240224121528.1972719-1-arnd@kernel.org>
 <20240224121528.1972719-3-arnd@kernel.org>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240224121528.1972719-3-arnd@kernel.org>
X-ClientProxiedBy: SJ0PR03CA0084.namprd03.prod.outlook.com
 (2603:10b6:a03:331::29) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB6168:EE_
X-MS-Office365-Filtering-Correlation-Id: 0918f65e-447e-4dca-f7f7-08dc367db0a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rz+5pz/zjRhRYOWzp8S2FQdFTWILDc0bMaf8eP2nnKOGdEqdL9fTznWk5Ex5qgiVSfyjj7T3v9tMMWJo6yHa94DAwOnlcp0ASw0PBoh2zVcWauXBEr1L+71wMAH8D/p1EydZQ1/3I+kvTV2m3lIYg0m1D51UQOS1wz8IqzuNnOfId8DF400/Xe11ERZLj6+BkmA1YEonw1fCwrzXTU2qNazGgMa7zYs+jNbjkIyJmeEqcVFkYn/44CrSL3dOSaSi07qu+Q9Bdj1j9ZFC6lwBE9M4v+F7Sl/NE+iesehW3fgCzCJgb1UXFf10a1SAvFl+ODhWEvcIT/Ob8/p429VpOtOruhCODM/rHcWOL0G9OBPMAxte21/qr9cIie1PyfHryWkIQwfooqSZl366z7MUF3sPbbEXiPSNoVpcO2F06gG7M3UFdbqBjJOwEZzC46dUqo1SVLwNG0HvmxjnQvNOY70wizQHKjVipAtRaYTh/MImg7MsrpPjoCkDCS7rXiC9ZIzrc75JrcuJqyXWsveNaJdPD4GK8/ZnL0qLgdyhjU4dMlEBpIIqI7T6NmyX8SvcIqpLCD0DqdNpxpwx1MksxL1EFa+ixEEEO+b8ace2FauGE0gbLEOngrkxIDdy74ES
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ShSIiGvZtNEYvBQMlL353jTGwcXUeLvoDO6cjMBmapiYhhrr9q64UFAcd1Pu?=
 =?us-ascii?Q?c2GnoiKT0pX3JR9Bg7pr3dFeKFknLnKHAHdgNL0ESV5GXnT7173ylfP7hXgT?=
 =?us-ascii?Q?3jWzMKAeiYLaCVlwr9ayGaxzvj1sjoehrHep+fh09TaoeQBNbZoGk2EKVdNR?=
 =?us-ascii?Q?sug94q5BGCmt59Zbv7oSOIt4TK2sZiDyNurkn6CveLZs+3QBpFWYG+u6Q3h+?=
 =?us-ascii?Q?8g3taL+sDcBRrJmnhX6YhTiHxK9RrRSlY8HxbL0ju0It4NqlrheeMOBe81Kf?=
 =?us-ascii?Q?TMgNqOHaRbFQCzE1q4VMwwzPB3dIKrWpdJZwm4TQCa4sL3+XfrLegCUA/3a/?=
 =?us-ascii?Q?rVFNwx/etluOxPJWVmPAUGREWkEoJI6bxBhwuWRkjIV1oH7VVzgUOO+E4JdI?=
 =?us-ascii?Q?SMFcaFWT3old5SDh6rH5jy2a0zLytXFadZr5IpII6AYMeUGjh3eiGJD821L1?=
 =?us-ascii?Q?HiZaGx/Ytp2fonEauWvnnxwmoXRIlwyK4kzcRzma/T7RjnEEcvB1nue5kAjt?=
 =?us-ascii?Q?NB0hB8mqjVLy8DuPaxqZ2GgAEOd/na5Z4DF/bXsc1LvzhW1kWhCXZ2QqwiDP?=
 =?us-ascii?Q?26XHYu3gJ208rUy8hQk0b2a1CyzmLeyqCWeDvBvq/fGlb4Elc10Wbrn4dbMT?=
 =?us-ascii?Q?Kx4wKyiGm4iGDVRvPw/V3t8AtyqZXIjqqqJsDBcBPcKDC97rOmwMxrTJxZsv?=
 =?us-ascii?Q?OUJMDuv3qRsD6wJzVBQVjwUjQgYz0a4Yr5w/e9+fEIrk3sK7dzrcHTBzcI7D?=
 =?us-ascii?Q?Fz7g96CI6pe8JmUeXGxdaxeWItmqNlXrfruwIiAWa7pCUH4KB6iQawSFGfcc?=
 =?us-ascii?Q?4XdiMZlYyhA6DQtxsruoeaOnelVqBDtGafJILBcT3F+vD6jGKiO0coIk4K8Z?=
 =?us-ascii?Q?/Xq/nLm6bkhUpD4/xmKqfkI7g2/ANYMavPiHovgou2lPEsc09CZgu6yt0+CJ?=
 =?us-ascii?Q?ujkpVw2MEpygs96ZpBN7m9Xfa7T7refOEIoRiCVygJpJiMFlH7z+RuRE5Up3?=
 =?us-ascii?Q?AMyrELJP/c2v0dQLf8tUHfIxhQGiFYYSnpngD9st02KxmK79vHJOlv9ILpsb?=
 =?us-ascii?Q?kk5Rnt/qFqylSiYKO18bcl5B7gcw3Z37RnwjD26Z/et/e3CBvkoFsRkJq4Lv?=
 =?us-ascii?Q?Xtwp5GsTym8ifFRQJBM96i+Jst+sjX2cnzatuzewEAXYfbt2KnvMzwieKLMN?=
 =?us-ascii?Q?ls4lqJ/QCBwF6kb8kDEeTl7u93DOOC6ULdqS9d0ZWKN7qIYbRbyag4FnY39e?=
 =?us-ascii?Q?MIqkN3VQyfcUN5e/vAPWFNEc4blx4YerNlVuPdNwg+zV7JP+zH4NnVoy2AfU?=
 =?us-ascii?Q?WWX8VPtBBijKW7gzHtTzglMFqspRjPALwwhrEsddIFkGwuEwCovD60HhpqgH?=
 =?us-ascii?Q?ZwAsWmYq3FkrVAikRAkyk4T8IWO+Q6LWpwHbTH/aGWhy4Y3q++X4xlouN6yu?=
 =?us-ascii?Q?TanFJx0/ihSA243WgeeieBPx3Q7zGf/+vn7zGxFOcXV6c1e3s6EVdjen+pjq?=
 =?us-ascii?Q?qPIucCZ3952RStIazIDD7973uFbBiJI07XMJxRHfjr8lQLJkgcsMhXaM1J3a?=
 =?us-ascii?Q?fGOoHGG11Wi/llPrrsgTsMvNerLTHbVdlR5kMZL6D8qugU1MTuCMdcEp8Zn9?=
 =?us-ascii?Q?mA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0918f65e-447e-4dca-f7f7-08dc367db0a9
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 03:47:44.3881 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2cvj3nsZhUsVI6RT24GW5gG6wDFATcqOknVigrSCx0A9Ne1/uL+ApKAkG1Q4eQ3JK7uawQOOOI0ZN8Ovc4iO0BO4X/E7tZBaSmKBd3K2rbE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6168
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

On Sat, Feb 24, 2024 at 01:15:01PM +0100, Arnd Bergmann wrote:
>From: Arnd Bergmann <arnd@arndb.de>
>
>This function does not build on 32-bit targets when the compiler
>fails to reduce DIV_ROUND_UP() into a shift:
>
>ld.lld: error: undefined symbol: __aeabi_uldivmod
>>>> referenced by xe_migrate.c
>>>>               drivers/gpu/drm/xe/xe_migrate.o:(pte_update_size) in archive vmlinux.a
>
>There are two instances in this function. Change the first to
>use an open-coded shift with the same behavior, and the second
>one to a 32-bit calculation, which is sufficient here as the size
>is never more than 2^32 pages (16TB).
>
>Fixes: ea97a66a2218 ("drm/xe: Disable 32bits build")

same comment as in patch 2... should rather be the commit *enabling* 32b
builds?

Should this be something to be dealt with at the DIV_ROUND_UP() layer?
Why did the compiler fail to reduce it here but didn't in the other
11 uses in the xe driver?

thanks
Lucas De Marchi

>Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>---
> drivers/gpu/drm/xe/xe_migrate.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>index a66fdf2d2991..ee1bb938c493 100644
>--- a/drivers/gpu/drm/xe/xe_migrate.c
>+++ b/drivers/gpu/drm/xe/xe_migrate.c
>@@ -462,7 +462,7 @@ static u32 pte_update_size(struct xe_migrate *m,
> 	} else {
> 		/* Clip L0 to available size */
> 		u64 size = min(*L0, (u64)avail_pts * SZ_2M);
>-		u64 num_4k_pages = DIV_ROUND_UP(size, XE_PAGE_SIZE);
>+		u32 num_4k_pages = (size + XE_PAGE_SIZE - 1) >> XE_PTE_SHIFT;
>
> 		*L0 = size;
> 		*L0_ofs = xe_migrate_vm_addr(pt_ofs, 0);
>-- 
>2.39.2
>
