Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFC892DA5C
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 22:45:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 929C210E2DE;
	Wed, 10 Jul 2024 20:45:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XYBlGUN3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D4B310E189;
 Wed, 10 Jul 2024 20:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720644323; x=1752180323;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Sepl/xwXxl90T20ycO6dT52srMMdR5VXGZYiR6GamH4=;
 b=XYBlGUN3jc040MwJreyWhVqDXWHw1m2wjDKTMSaMCPnQLnVfq0y1Rz7a
 HLGydKg1J6ZBce3nMbwdRbya2+mf6vWSswbHFebBB3/SpZTpWp18nkFMm
 GUGML6RsOjcIRN90jcHxb32sZ9aD1Jb+TwrLcCdMrxgDO4g5DsCak6qUk
 /qYUaasJSweOZHf1nG2HroX1Af7QvdyBwGTvYdt4aF5htZxmLVwcKA1f6
 1GsyRjvcDuTASQONOuH90/ijzVjf4zpww+2mz4X3FZUKtH4uvrkQHBeS7
 OVIaTlj1SOyi3Z/ubzv8T7s29FzkojTnz8WurKSSxP5eze0j5qS8MD4ET g==;
X-CSE-ConnectionGUID: Qv2D5NPsTVWFHJdqd1RTGg==
X-CSE-MsgGUID: NJPwfqM2TuW3qXUrIGzyuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="17863865"
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; d="scan'208";a="17863865"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2024 13:45:17 -0700
X-CSE-ConnectionGUID: H9ylAMZaTUmCWy0kiK0MlA==
X-CSE-MsgGUID: cTv8YyOVQg2/lY9yc8N13g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; d="scan'208";a="79475471"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jul 2024 13:45:16 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 10 Jul 2024 13:45:16 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 10 Jul 2024 13:45:16 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 10 Jul 2024 13:45:16 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 10 Jul 2024 13:45:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FJ2L0yXTlWbWGo34HXx0KsGJkJDmVv3Qr2Bpg6WNieq0NEKkiQQ9tamqi7gb9q/HUTXMCI7pL+kpHZMjxjoUMExvLO4yczDyM/sgVRllJoyXfPpCNj/HXqHy8Hgb5lJ3garHQdhpmVsjUKpreo9bEZDHzCe/tpdErgntLa0LoXU56HzqXpyA/3fxIPzENO3ZeSXYEAIIDD2cIcf2A4avNUIXdv8ZuffT3cOQ+HNVg063ziGz3yfLsAD5DEv2Q/QjB1QDcJ2qIK0r3lXaTyhtufvNVm225Dt525plZ7B6CR5RimF8mwmSzspk3DSz0C8DrQTCHH67Gh5q4rsQ7Hd3Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l+MqGuje4jwQHuNsh6VXwtDG6DMHUWO0e0jCrdrYykk=;
 b=S4F4Boy/4i5nujQXD8v9BBRv1VTYaM6ybhPXZZYL6jS4kbDWZI/9wNJO9hFVuIWEJvFLKZgHxSv49Klv/r7DFdf7PnU5vWcXam01VPUuwoLN1FgHVk3vi9il9GgcI5rmQaPqV6yDyD+/5ccvHNjK+1qXJ6xqivHGxNiwckWmq3J16ySSwKLsq4pmzksdIUlCw6XH4phnTkRG20QgwoMK0xOqrGPRYrXFC7bcdEle9S7KLXOqHOI5vWX3D9+9E1OJ7Whl8QCBclgSNIoCifWXA7tW5ylwkqyD7F/RjCFwSWpWNFkEEM+LnDh9OVK9LXNqpRMHfPmBd289Dpk24K4lgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by DM6PR11MB4516.namprd11.prod.outlook.com (2603:10b6:5:2a5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Wed, 10 Jul
 2024 20:45:04 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7741.033; Wed, 10 Jul 2024
 20:45:04 +0000
Date: Wed, 10 Jul 2024 16:45:01 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, "Oded
 Gabbay" <ogabbay@kernel.org>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dim-tools@lists.freedesktop.org>
Subject: Re: [PULL] drm-xe-next-fixes
Message-ID: <Zo7yzc8L4qU5wuIH@intel.com>
References: <Zo2sO4t32dxqy6Q7@intel.com>
 <75cpujr5wxkeul2nnrlwunjryt2lqykzms7vudur5xoxl4dris@lz2hhlv5x767>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <75cpujr5wxkeul2nnrlwunjryt2lqykzms7vudur5xoxl4dris@lz2hhlv5x767>
X-ClientProxiedBy: SJ0PR03CA0170.namprd03.prod.outlook.com
 (2603:10b6:a03:338::25) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|DM6PR11MB4516:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c9a9d6d-d76e-486f-3841-08dca1212d13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7416014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?GKOlEpGkaJRbq/2OXi+5kD7fLFVnXGvzPWV/8sF1LPsOkL6u5DSYLBzezN?=
 =?iso-8859-1?Q?7c5pJ7UGoRODd0gSShV0BYpelOh4iItQ/nLZ8fbO58q28UwZNZu97wazsq?=
 =?iso-8859-1?Q?n0v6H9tzAhzDGhFwGW4WRi2as98q8LGa/gG+MUmIDgpeVYKav4ncAnfmBq?=
 =?iso-8859-1?Q?H/XvBhXHMsgylgEMYPl4OovjDKR+ALFuZRK6nE5BNvQ62HCCqlxs2Gep4k?=
 =?iso-8859-1?Q?1yvSdnKCU4d60R6Eve9c0LQpFgARbqE1eQkJRh7FxTmwpty8YRfCesAeGy?=
 =?iso-8859-1?Q?G2NjstaFMG/kV8t/kV9Yir+jNcw3o93JufZikBWv8njgGTHzj2IAvRFnkv?=
 =?iso-8859-1?Q?yPxkekY4AtmVy/57vXGAqaLYdJn95p6lNQ3q59DZQ6a1TN+TVAhO8XHvA2?=
 =?iso-8859-1?Q?g7gjkhLo/WB+9xi9X/0ggA4tREAczVDmQOQlDV6QZDXehhopZl7oxjRLmV?=
 =?iso-8859-1?Q?obIZNhBFkwJSgQgeXbyit5nUi+72d3g2kXGEjatbROfCcSkvXDp9VSd5Jm?=
 =?iso-8859-1?Q?VIWFzGAaNaVqf3IuwP2njkUjRC/+dnxhZxVTe6e44dnTRAAGZPdqklNZ7k?=
 =?iso-8859-1?Q?SEVUjmZU/D593lJs/Nn1sKXKMkvZa5yr95GW8Xpbfhvzl3Lfze8UO39jjT?=
 =?iso-8859-1?Q?rUpXa4Z/Wd2sp5ozugINMKQ+7lDfzlsSs7envdKJxjf10ym0icCbqfKmqu?=
 =?iso-8859-1?Q?Or2e1tNM3cOcRH7GXy16GpMAknShUcjW82bl9DNGFiJkMqyTQj+FRNuviA?=
 =?iso-8859-1?Q?p6bDM7cf840w8vlLhxPTNxemdcG0qzJrEagcCG4qMjFP/IzWMhw6OI8Jol?=
 =?iso-8859-1?Q?yihYLSt4FsiDS2JQFJzHz81XXmhWpyShkt+RQ3m+zlKS51xVLmEgS6RPYi?=
 =?iso-8859-1?Q?Nek2x9ORTArXB09NPSemMY8Xznoek8cNIlF/skL9SUaaRW01sfS1HeJifp?=
 =?iso-8859-1?Q?9Ay1ogXuew6lKyO727vRSfxW/nTJPRXe9XBu4063d8szuF/OgKG9WfuC8n?=
 =?iso-8859-1?Q?lz6SsZooi9sjZu1l9Rk1oyC0NUECQhbfKKwwFTvpf2aX8rHppXyjW7AUqM?=
 =?iso-8859-1?Q?WV8qWOlVoV4lfRj8stgqDjuNHLX6pXAy6VrrN5NzHC95jECFC7aS/TI9yu?=
 =?iso-8859-1?Q?JJwlWO2I+yxRVICCaJyi/akfyXRQWO2eZfVg9hj+6R4U642QHqQkaVnKYg?=
 =?iso-8859-1?Q?DQ1YrvcA4PyiHqXHJdnuxK01as2fJcBuKDen2VXdoX0AVJCn+uH7cejEmo?=
 =?iso-8859-1?Q?j9RmCzXRcGWwfZw2rSP2JNwXbFBv5FJWbst/fAHeIMp4w8bcK6/wSOye/L?=
 =?iso-8859-1?Q?mAxXe/HG1M8eL9qhBKXT8JMjabNiYVAtG13REJYliE6pJIY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?jU+uC3m5z95uDNrIV1lGvgFfOiMpkkBSL/YnayBcfrFFxZqpg8WDrtMUiL?=
 =?iso-8859-1?Q?070oELKrbOmW/yCJ2f3Vu5v6fSOzWck+MC456AMhU8+dwI9CK4oyLscEKJ?=
 =?iso-8859-1?Q?uLPtQDiiGZrcJoqEsj8Y/Plvh1onj3ch477r2ZneuKJCun2lwV4pIT1WsC?=
 =?iso-8859-1?Q?6wC9K2HxPo46TwaldIjpLOoVqMF8iKmbk+wEop1U4S5XfPyVhsuGpciikq?=
 =?iso-8859-1?Q?bwk27VDwHZvr1yOJiSaCL79aSL6ftQ5KgG5LPlwQN20blGFrJcvMBblnNb?=
 =?iso-8859-1?Q?3D6tXzzcs7d1KiMMOkEspZfWrhucdN8imnef3fIOsXc4eiEV7jzcX8H/2i?=
 =?iso-8859-1?Q?6U0ww4jcMNBXsKSJQrnxOXlwxpel7q9IIhP103K/Lh5Vt+JpuEvCEKZXer?=
 =?iso-8859-1?Q?0OqdYYDXLZD2aSePIU6wivTadJDgmWrRi26ma2patj+QEv23kDbzpJHYIX?=
 =?iso-8859-1?Q?toXp2Z4VtILDdfa/ruh+pEmvrmE4ZldqsTzPr9I2f3/jCNkJPsB81ZKIto?=
 =?iso-8859-1?Q?133DokoxNaChCzs2O83tEhoNDJQWaDATKgHYjVGdlg+z3Ah75JiBsqi7/D?=
 =?iso-8859-1?Q?OT1KyF+K34XJapqlCd0H7xNaq6jibdj0PTUjWY1PUF6Fj8aNae3TaejQAL?=
 =?iso-8859-1?Q?MkCoTxXRJNbWXPpntSj6WyvGuLsCq+IC6qtk5LdduwT3++u4aVSECohSa3?=
 =?iso-8859-1?Q?GqNxCwwo5EJB04dc40QPuNCrFynwvmCbWTBV0kQRt/zXkVgMFn+wA13InQ?=
 =?iso-8859-1?Q?++jalEcpzls+6Yq4EGiB9WHk38ov56gRrhJWIsVHaHIXTo2WtcldG55+Yy?=
 =?iso-8859-1?Q?RIAJolnWfO5GGecUCCPwC6F2HU9po/At9IlJ9yYEaV+j2BetOlsrMoyipz?=
 =?iso-8859-1?Q?v+FCR7KxDuEGrZ1bYngo4xnKMERj0f22A1pXXbxg8VYha1LPfBClAltXHa?=
 =?iso-8859-1?Q?KroQihtQe5bfCEj9R9a4wgdD6DgakxzFa+rUiz4c6MP32db/prhE6iSLv9?=
 =?iso-8859-1?Q?tysKWwl0mJpa3pjl9kOPNmNian3J9tJqBCi7v7FHPTmEqErjFb0xBF8pZ9?=
 =?iso-8859-1?Q?HzGwlRidGkUVRoHB9vQyi4/jfZhmuzWHXOq32GA3DMCAh8QimKkuX4pHsA?=
 =?iso-8859-1?Q?Ihth5vt+bgoeStAPzlOtX1LiD6jL4+pPdMuUjQzM3JOnlZ7hCR4AkIp+ko?=
 =?iso-8859-1?Q?yXVz/EZ0YsrF5qXMFU3mT1KJbX0WCl4i8tGMTEmROpOTFAAlIiQI1FWpvW?=
 =?iso-8859-1?Q?GRFXsSNN7F7lYqwea3dKodS2p0r9HqNwtraD2/cKY89iJsHcBFkGY+Yckb?=
 =?iso-8859-1?Q?/37wWDC517yiszVplhZhKJujkEalQYSMWNi+FKvRtUAA9k7uqNp0/0CN6c?=
 =?iso-8859-1?Q?4N7GuNeGigWXroKhmp3byqIy05TJctgSSldh9NuN4tJj+mAg//j2Ed5x5Q?=
 =?iso-8859-1?Q?tXr33cvqSVuhlHO8DLrhFJZ8jR+5y2rjltWnAg4ro0E2pmuJ0ZvxTcVQ2v?=
 =?iso-8859-1?Q?qQyH8VfVaFJlPh/pe2yIf15QsSOF53RJXMLpkxLduCKeSzRuprx3jkZs8f?=
 =?iso-8859-1?Q?b6CDGXfte2tES6uTUGWXQNioeCrvtc6l+cw6k3LKZqUL2SNk0xX/aJn3EI?=
 =?iso-8859-1?Q?Vk6P30vIBHBUn8Abkd/nSgTQ/RHTqaghecICVK/IBUbdmryfQpdxxZ/Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c9a9d6d-d76e-486f-3841-08dca1212d13
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2024 20:45:04.5265 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3H30ZbPFWWLwP6tukBalyTl07aATnM6p+FXND7f2+UgHuN1rPDDqXTrz14g6Ga++riQZuy+za9Pz3Di2btkgBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4516
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

On Wed, Jul 10, 2024 at 02:42:38PM -0500, Lucas De Marchi wrote:
> On Tue, Jul 09, 2024 at 05:31:39PM GMT, Rodrigo Vivi wrote:
> > Hi Dave and Sima,
> > 
> > Here goes a very early drm-xe-next-fixes with 2 important fixes
> > that are going to impact user space.
> > 
> > 1. The first one is the rename of the OA stuff from the bad 'perf'
> > name to the xe_observation. Although the rename in the uapi
> > header is likely inoffensive because our UMDs always copy the
> > header to their code, there's a sysfs filename change that is
> > impacting mesa.
> > 
> > For this one Mesa MR is ready and they are only waiting for this
> > pull request to be picked by you so they can merge that to Mesa:
> > https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/30027
> > 
> > With both sides in place, there won't be any kernel version
> > released with the bad naming and no Mesa released using that
> > filename. This is the main reason that I'm sending this PR
> > earlier than normal.
> > 
> > 2. The second case, which also impact user space is the
> > write-back caching mode for system memory on DGFX. In this case
> > we introduce a limitation in the cache selection uapi that is
> > transparent to UMDs. I mean, no change on their side is needed.
> > Coherence is maintained with some know possible visible and
> > acceptable/accepted differences in CPU access speed.
> 
> but this commit is also going to drm-xe-fixes, so I don't think we
> should have it in this pull. I'm looking at some changes to dim to avoid
> this kind of problem in future.

okay, let's avoid the churn then.

Sima, Dave, please ignore this PR. I'm going to drop this patch and resend
this PR with the other two.


> 
> Lucas De Marchi
> 
> > 
> > Thanks,
> > Rodrigo.
> > 
> > drm-xe-next-fixes-2024-07-09:
> > UAPI Changes:
> > - Rename xe perf layer as xe observation layer (Ashutosh)
> > - Use write-back caching mode for system memory on DGFX (Thomas)
> > 
> > Driver Changes:
> > - Drop trace_xe_hw_fence_free (Brost)
> > The following changes since commit 62a05f4ae9c1fb70bc75d494c9c1c373d2c2e374:
> > 
> >  Merge tag 'drm-msm-next-2024-07-04' of https://gitlab.freedesktop.org/drm/msm into drm-next (2024-07-05 12:45:41 +0200)
> > 
> > are available in the Git repository at:
> > 
> >  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-next-fixes-2024-07-09
> > 
> > for you to fetch changes up to 463108053c19f24fa228863824698d5ca72826b6:
> > 
> >  drm/xe: Drop trace_xe_hw_fence_free (2024-07-09 16:21:26 -0400)
> > 
> > ----------------------------------------------------------------
> > UAPI Changes:
> > - Rename xe perf layer as xe observation layer (Ashutosh)
> > - Use write-back caching mode for system memory on DGFX (Thomas)
> > 
> > Driver Changes:
> > - Drop trace_xe_hw_fence_free (Brost)
> > 
> > ----------------------------------------------------------------
> > Ashutosh Dixit (1):
> >      drm/xe/uapi: Rename xe perf layer as xe observation layer
> > 
> > Matthew Brost (1):
> >      drm/xe: Drop trace_xe_hw_fence_free
> > 
> > Thomas Hellström (1):
> >      drm/xe: Use write-back caching mode for system memory on DGFX
> > 
> > drivers/gpu/drm/xe/Makefile          |   2 +-
> > drivers/gpu/drm/xe/xe_bo.c           |  47 +++++++++------
> > drivers/gpu/drm/xe/xe_bo_types.h     |   3 +-
> > drivers/gpu/drm/xe/xe_device.c       |   4 +-
> > drivers/gpu/drm/xe/xe_device_types.h |   2 +-
> > drivers/gpu/drm/xe/xe_gt_types.h     |   2 +-
> > drivers/gpu/drm/xe/xe_hw_fence.c     |   1 -
> > drivers/gpu/drm/xe/xe_module.c       |   6 +-
> > drivers/gpu/drm/xe/xe_oa.c           |  34 +++++------
> > drivers/gpu/drm/xe/xe_observation.c  |  93 +++++++++++++++++++++++++++++
> > drivers/gpu/drm/xe/xe_observation.h  |  20 +++++++
> > drivers/gpu/drm/xe/xe_perf.c         |  92 -----------------------------
> > drivers/gpu/drm/xe/xe_perf.h         |  20 -------
> > drivers/gpu/drm/xe/xe_trace.h        |   5 --
> > include/uapi/drm/xe_drm.h            | 110 +++++++++++++++++++----------------
> > 15 files changed, 227 insertions(+), 214 deletions(-)
> > create mode 100644 drivers/gpu/drm/xe/xe_observation.c
> > create mode 100644 drivers/gpu/drm/xe/xe_observation.h
> > delete mode 100644 drivers/gpu/drm/xe/xe_perf.c
> > delete mode 100644 drivers/gpu/drm/xe/xe_perf.h
