Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADEB4CAF83D
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 10:54:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9C2310E1C5;
	Tue,  9 Dec 2025 09:54:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SihoOA6w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DABEF10E4EE;
 Tue,  9 Dec 2025 09:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765274043; x=1796810043;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 in-reply-to:mime-version;
 bh=kzSyWMVgmg7sb8szgqLe8R6jeAsdjJ3Hcm9AKUYPKkU=;
 b=SihoOA6weGTpObmH5d14gJwYeA81/n6MNR7SlMA7gybekZOgw+6oOxBs
 4n+TyFOgk4+J9it9GljlVgIcd4Vxd45zbSutVd8SdCIsfgjLMFUVtguYx
 8tf7IS83Hdo4Uo4uoTh1q90oJF0PRxLl2CRrNbSBhDRZ87dmSig+l3EgG
 d67d+vRC+HoeoXY7VD0olIdGz3WAbXDjwdIohEw1QJmH4UGZxIBEbFO0S
 KWb+C+yTA8iKmsyFK+no3GZ5Djm+fFT4zy5Z3LFk4sfIJ/JA0P5i5xHRB
 9M7/N7pQU6foyJXSrGrZc/cNkL6+Th0Uuob33MXHgTwmnTnGY4LLVafOH w==;
X-CSE-ConnectionGUID: CngNFhYnR9+LegZ3ztvvEA==
X-CSE-MsgGUID: AQNo6PtbTji9GEsUE6wtXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="67278539"
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; d="scan'208";a="67278539"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 01:54:03 -0800
X-CSE-ConnectionGUID: kwb2vgs7Q0OnRdoa4g0nsg==
X-CSE-MsgGUID: vU1TX1DFT5ypOSmKMRqV+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; d="scan'208";a="196234402"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 01:54:03 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 01:54:02 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 9 Dec 2025 01:54:02 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.1) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 01:54:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=smMImsib6qbmYcyVlJWw/B9OvZBymifyuK3dz5aMpxEKpjw5dPxGnIJW98Gf0ehJkcDNZpfP2qKKvZVVUgHEsAxC0hw/nUwJSvDk0k5UI6+DVR7iCCpXymo0xllhrpT96ANWa00B6bsVNuUKdMFV+kriHRJaoTFMZ5hy3lSyC3UkyzfSr1FAJKhTHSYlqbCTC+GDEy1nb0yQv3hX7zfCXcLAalVvEFn8VS6w85jfKzqG3+xUtttI/Pu5iyIBmsXvRb0dE9NBVQNpjqbea6HPHdkTteDmsTlbOzf7qrWWQteAtJ2imOmG5OZBw69ii2+wOiXApM9DZQ4yQpvvO//Xyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gw+luA0b/sKZWBBrFKPrsbXoLGLrxOzCuvla7xjEVRI=;
 b=T1wFjYhVdfvX8IB/W8d4SfHDx5B3FNKTAb+Vss2xnxAuVIK3Z0AhLWJBkALZcJjaL0WgLrEOtNbjPeX4Oxf9jMq47OLX4IyGOGzShaF1lhFj6/UAUaL+3MGjlnak9CGt9kHQAcCTp4zrs5B/Z2uwsR82XtMXGapiNG/PFcbuM9TR34rbkTduwXS4LiaWxVE/c1QvHVPXvevVR1SVofIH5Hd6NXvTtZoYqrxsRoceUi0XqPmH4Dx6ATPvHzasemNonfGK9o4+7CaC13O9IgCu5SR53Cb+dO1Rr7efeTvDbUyohOmqrOCI4i3U1aFe8VXh2YUcMou6amIK1lCdqQH5VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by SN7PR11MB7666.namprd11.prod.outlook.com (2603:10b6:806:34b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Tue, 9 Dec
 2025 09:53:59 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%3]) with mapi id 15.20.9412.005; Tue, 9 Dec 2025
 09:53:58 +0000
Date: Tue, 9 Dec 2025 11:53:45 +0200
From: Imre Deak <imre.deak@intel.com>
To: Luca Coelho <luca@coelho.fi>
CC: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 03/50] drm/i915/dp: Fix DSC sink's slice count capability
 check
Message-ID: <aTfxqfQ72KLZLGnz@ideak-desk>
References: <20251127175023.1522538-1-imre.deak@intel.com>
 <20251127175023.1522538-4-imre.deak@intel.com>
 <a1dff2ea30fe3d2f25bab96da1963e8a308eb3c0.camel@coelho.fi>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <a1dff2ea30fe3d2f25bab96da1963e8a308eb3c0.camel@coelho.fi>
X-ClientProxiedBy: LO6P123CA0056.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::13) To PH0PR11MB4840.namprd11.prod.outlook.com
 (2603:10b6:510:43::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|SN7PR11MB7666:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bd935e8-442a-41bf-8457-08de3708db29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|10070799003|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qS8ons9yZaMe8JwsiPTCbUavxqfZirR2T85bNr2STMiDXRHemGyIZ3xZtWS4?=
 =?us-ascii?Q?G7Vd8EzkrQWNpf097+6uKmYXYN5fiO16wihy9MPcg+TTIHEcXLtXkA8oYSRc?=
 =?us-ascii?Q?ljwQyVfO9Pb2Jzaz1ZAx2PhRrc3NBl/ECpTlCE/9Xcqb3ar+0vobPh/Hip2O?=
 =?us-ascii?Q?3Q3shltHflgWPHq6k74OSjBP2o1RS5TI56tomdr09npesEQf/xiwBCf1zsFD?=
 =?us-ascii?Q?8rVsnV359ynnoG8l003QFXdFYiTT4IiL+gBJLVTb5B2lG68lThW5UR6sbsJ8?=
 =?us-ascii?Q?UhuU9zQO1nTMLgnXxcn/+2+4NqV/ZHEajtLJwMGF/XFYmPrO3iCvmOkg1WhD?=
 =?us-ascii?Q?HKuyV5/DBvyRvVTPQMRFkMyHmymfTTe8hkudjisPL0XxNs/NhZGNh7S5mU+B?=
 =?us-ascii?Q?18KgN3XfsDBprFRxpmWg26TVdWJCw1Truot2GhugYo4SubSfJJ/BOj/exiM6?=
 =?us-ascii?Q?lD0/+IgmaL/7yF7plfQCyjltA3wn2rB1QwRJJ+alDZQKWlVEi8DeAmv/4+kb?=
 =?us-ascii?Q?cb0bKH3/ntOve0lOTODiTXyuMPvyltzWr78haAJWeE+nFXVQubsp2hIfQ226?=
 =?us-ascii?Q?slPZS3HDctFdH/Hz+x23T5wou1P80clPd84AUv6wrnjEpI1i6Lx0fpFoF1qp?=
 =?us-ascii?Q?EO8z3uiKgjOURRcbMKs7RwUwkf8n/GXWS/FSg3g7MT2nzYNCljZETLQycGOH?=
 =?us-ascii?Q?8ixp86mQ0Vj+u36GBFjg0ejhavz04CancZnevvAXjUhYlRtF9zYXyCWnxLFu?=
 =?us-ascii?Q?o4t+xF6vPfi24DzVtrR13QApgyHuQ7P2NbyEBuLA+3295Ba232WuVg/oB1HS?=
 =?us-ascii?Q?ZWxIhBAHv55oFffJZ8JHT89aAp3W1yZtH+8sjatq7+Imil+V8u8FPtZMwEqG?=
 =?us-ascii?Q?HKrY8dVVYedcHUMiVhqHOvv3WsQpCSuBFSnMDoU3vzCdZ4fhSEq/oEFpdbDy?=
 =?us-ascii?Q?QGBrIHKE79PW0cUL4Ck0nAJ7a+bfQb8iXqPzfy3dGuzhlmLZu8Hd+wsx45Qi?=
 =?us-ascii?Q?nF7kt78laHyIXwn0oFFwQRYWswJmBLUd4mHtIoO1c6MvxGT5jtI7fzBzj74Q?=
 =?us-ascii?Q?Mwifbl47aQwC/e95VCyOXyYeuz1+4L6CKN84EPeJU+ubL+Zt7169d5NC075S?=
 =?us-ascii?Q?ITlyk+HsYORhpa/FSB1zdgYFse9j8x2RbToU5DD65IWOD86Lw4aAjNLAQGq9?=
 =?us-ascii?Q?rmkvP9ZI91rfYQOGmXqVsc46O4hpB7bNS4hZR6pU0xwHcuR1qBD4hWCUIOLb?=
 =?us-ascii?Q?PFqltN3TnIAu+TM4r77JGTOt1wB6RsNEOcvZYNh/B6eyQqLmYPORN6ju5LZ6?=
 =?us-ascii?Q?4d0GCy84aJaQ2cXyPC2BHot+nMNKBrztFmfb/0Xo26j5vbnuWtffX13jP13h?=
 =?us-ascii?Q?zaG/Xdha9QkS1Sj2LmZI/YBMrlQppaPzby0p9ltvcns0kD4XGmCXk71QG27k?=
 =?us-ascii?Q?SvIE+iErt/DklLx+cWJKebrjtWExqkFL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?X0xqgO1bFzYvRogK54hvA1C3Kb3Gz2PUKRMWJIZMrvxolbcKgfI0aJ8Rgq3V?=
 =?us-ascii?Q?/zIMePycB5T37TaFdnCZC4rLGuNpt068YSrl22u9YKi7LLMpAnbq0WX4TrnH?=
 =?us-ascii?Q?IDRWBITSYI5vhlHpHad7BiBMQgJkM8arIoC1D069Uhx/y9pWPaFvWd10m54o?=
 =?us-ascii?Q?RLZhZAHUw5uFwa6UEnQ1J5Wz1UKX/FqqO86+4PIMkt7Nku0LM1ck41FneBWk?=
 =?us-ascii?Q?dmegUzYXYTZ2dDjZ9w/mXTbgPuBfooWWIr1U8ZEGT1ivNvkQGVYZRR78N7Tf?=
 =?us-ascii?Q?7CuirH3NyYGTu420GGCXHT+st6esaVxigjlJrZPpkEomLUwoAgk3tHd2yCmp?=
 =?us-ascii?Q?vx5+vqr0r8pfHbYe3yQDdnxhrbNV0+AxUBIxWN7DK6DVu7cWFEX33IU0SG2v?=
 =?us-ascii?Q?ltMUCtKs7hx5LUrGbEhKooA69/0HAmJujjdPHMI4zT3AvMG4DhqmXHqDt2TS?=
 =?us-ascii?Q?TuenIuEMgNa0N+PcEN2G/crfu9L0wFOc1aP3FbsB4DfhnbDTR1j7YYBaktQK?=
 =?us-ascii?Q?bXc5S0Zx2A9rGSOdGmusFAxY/t39yTp9MF7cnhWq/1ufN0XSeO/MeYfMVse5?=
 =?us-ascii?Q?0ETBvtUxLtnmvkY46SnTdTB3ZoXVIwjzhnWNcObzahxaIldkOikW4QPe6AnR?=
 =?us-ascii?Q?Mqo8MwSqa/VZjfphVeJC0Ul2iVa3fVe/xp2hgwzzl0QDIfnxsbCDtz8i3y/W?=
 =?us-ascii?Q?PGTGdzlqMkMhCoQmdFDJV49SQjGSklSIRBU3IztWwUNZWp3GTK34oyVR3oke?=
 =?us-ascii?Q?ofOdrx5EF6V6moQZvTugR9M4mzniwlbuY4dw3Arb6VF5DsOF49YFj5iF02Ss?=
 =?us-ascii?Q?DCCMUp1pfulGeEpLAcBTKm7g0CeMeRLCKJVIKN3mmFrBeJttvu/A+DevehxI?=
 =?us-ascii?Q?0jZoJwCtH+sXqpM5fWA2CVoF3ZA9gludmyri9dM9wP0NLE2SYBSVH/d2pSXY?=
 =?us-ascii?Q?dk61qOYqo1zfATlp4HUybqxOO91fMQQfSVEVaVOd9hJ9+S3fvLaFqOwrHPe3?=
 =?us-ascii?Q?VJza/k5fKuMulxhpAAnoK9ruL8vZymPpynSNhncFdhlfnDzUw3E4EI6KkN6i?=
 =?us-ascii?Q?1rb+mblBmw/zHGzpQdhdsfW+YF6glbmMtXcTRmC4qQgwPMBN/U+dIGNR5RHP?=
 =?us-ascii?Q?ceuODG3u3XS3dWAmV0rg4M9HwTvjtCUW1I1iQldJDpTO1lCIBMVaHgqXmyY4?=
 =?us-ascii?Q?7/1if0xkvri5cWJdn2HNIEvRkOQYmnbw2mZ7ythAymLmeEcW8Zzldvh7RO2U?=
 =?us-ascii?Q?5p8Hq9Hqsngqmfakb+FbqA4f+ZyhZwjhzi5JFeFcL93TeCsHQl3uhhlCG+eR?=
 =?us-ascii?Q?jcZK27P5vmhZBoTxBC8PvZRlgXWUu/NOiy9SRKj1ho+hKf3YkeW7xiCudLKA?=
 =?us-ascii?Q?qiKZ1QSY/K0eqqVQieC/iXjUAKeZhJgtVqmILNd8qg/sIfHHdlaVPUmf1XQU?=
 =?us-ascii?Q?TUkTZafMLI3x3Iwguf6HpYZO4Sp6UCf0zeokRVfD7F7ECi7/qFGOl5roTsZo?=
 =?us-ascii?Q?6pQI9hgnWuP5Xqc4hWi0n5o4FST6uycz9M4cCkSqfacExElaNgO7SvhuzdQG?=
 =?us-ascii?Q?B29sJXn0ifXNv8lM6NdVZvtGVRQafLtq9C26StrDhPVhzn83XSQzjtJOOUU7?=
 =?us-ascii?Q?h/Ejjnh4/E4l1y1311WzeX/pCeVlzxedc2SCVobL/z1d?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bd935e8-442a-41bf-8457-08de3708db29
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4840.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 09:53:58.0916 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KiZ7hUB0RRfnvxgAi8yDS85+tc1QEGlpKe5ysjWILGyFXY3vc0PzNh+ZM8eckIXp3ubrBWP5G1IAaTByYo2zAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7666
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

On Tue, Dec 09, 2025 at 10:51:10AM +0200, Luca Coelho wrote:
> On Thu, 2025-11-27 at 19:49 +0200, Imre Deak wrote:
> > A DSC sink supporting DSC slice count N, not necessarily supports slice
> > counts less than N. Hence the driver should check the sink's support for
> > a particular slice count before using that slice count, fix
> > intel_dp_dsc_get_slice_count() accordingly.
> > 
> > Cc: dri-devel@lists.freedesktop.org
> > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_dp.c | 18 +++++++++++++-----
> >  1 file changed, 13 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> > index 0ec82fcbcf48e..6d232c15a0b5a 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> > @@ -1013,6 +1013,8 @@ u8 intel_dp_dsc_get_slice_count(const struct intel_connector *connector,
> >  				int num_joined_pipes)
> >  {
> >  	struct intel_display *display = to_intel_display(connector);
> > +	u32 sink_slice_count_mask =
> > +		drm_dp_dsc_sink_slice_count_mask(connector->dp.dsc_dpcd, false);
> >  	u8 min_slice_count, i;
> >  	int max_slice_width;
> >  	int tp_rgb_yuv444;
> > @@ -1084,9 +1086,9 @@ u8 intel_dp_dsc_get_slice_count(const struct intel_connector *connector,
> >  		    (!HAS_DSC_3ENGINES(display) || num_joined_pipes != 4))
> >  			continue;
> >  
> > -		if (test_slice_count >
> > -		    drm_dp_dsc_sink_max_slice_count(connector->dp.dsc_dpcd, false))
> > -			break;
> > +		if (!(drm_dp_dsc_slice_count_to_mask(test_slice_count) &
> > +		      sink_slice_count_mask))
> > +			continue;
> >  
> >  		 /*
> >  		  * Bigjoiner needs small joiner to be enabled.
> > @@ -1103,8 +1105,14 @@ u8 intel_dp_dsc_get_slice_count(const struct intel_connector *connector,
> >  			return test_slice_count;
> >  	}
> >  
> > -	drm_dbg_kms(display->drm, "Unsupported Slice Count %d\n",
> > -		    min_slice_count);
> > +	/* Print slice count 1,2,4,..24 if bit#0,1,3,..23 is set in the mask. */
> > +	sink_slice_count_mask <<= 1;
> > +	drm_dbg_kms(display->drm,
> > +		    "[CONNECTOR:%d:%s] Unsupported slice count (min: %d, sink supported: %*pbl)\n",
> > +		    connector->base.base.id, connector->base.name,
> > +		    min_slice_count,
> > +		    (int)BITS_PER_TYPE(sink_slice_count_mask), &sink_slice_count_mask);
> > +
> >  	return 0;
> >  }
> > 
> 
> I think this patch could be squashed into the previous one.  IMHO it
> makes it a bit easier to see how those functions defined in the
> previous patch would be used.

The practice I follow is to keep the DRM core and driver changes in
separate patches. At least one reason for that is that the DRM core
patches may need to be applied to the DRM core trees separately.

> But nevertheless:
> 
> Reviewed-by: Luca Coelho <luciano.coelho@intel.com>
> 
> --
> Cheers,
> Luca.
