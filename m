Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF06B1EA8B
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 16:42:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D30F310E952;
	Fri,  8 Aug 2025 14:42:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mcADDjIH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F280110E952;
 Fri,  8 Aug 2025 14:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754664169; x=1786200169;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=a4Da0v+sgXErpDSTmVbtgZfwuxt8TPzYVP91pSHkU/w=;
 b=mcADDjIHcyyePquL2Sov6OGAzV99VNUisMQzQQQT8E1ycvKE5Mp1SXeX
 iYkXlSEDUin9fox/TN2G0MdgzVWSNSHih1wu/rjlV/4Nn0by01IWL80px
 y/9jAjOmf2q3uZxmAi6u600Q2SbOqseSsL6BWc9B2OYAWvhZBtx2SAL9c
 UbXzt4WN5Y9fGkDFlUL7GZoqqOrpqrgdmepMEOWuAALsVPRKmBr5nbmD9
 buR8KBKbPXXMcCpd1+ndye32Y7oKG7+tSmgm1XQagcyGRwmtfLKjyebMa
 bVMpodnViWp1aMPtjOLUyOTla/98ANgKo3gn6W0JZuIu02+oXdBHSfyov g==;
X-CSE-ConnectionGUID: kiCZb3V9SC+2z6lUSSju+w==
X-CSE-MsgGUID: BsCIChMtSByovt5ZMurh1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="56935437"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="56935437"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 07:42:48 -0700
X-CSE-ConnectionGUID: RZGoiTQRT1GrHl6U3JY+8Q==
X-CSE-MsgGUID: PE4O1qiuToKXltYm4GN7ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="165247255"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 07:42:48 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 8 Aug 2025 07:42:47 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 8 Aug 2025 07:42:47 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.86)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 8 Aug 2025 07:42:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rGc+hsm8wgZ9BqAA6BdEaVkPXHxRlxnSCBU/amrMPQQugILgwAo78aNRxWaQix3d6HoKQe45hb2Sze9XmGFbdz4wCsbUMLT7IHtchBECRRp++tApPDR3l2yvss6RNzR1giRRjasVwS6Avgm8ztexnIxPqFJaoc6jkn8SugCp/LBhoGnd+c+CaJaPCrGuXBPHBfNJC2vp0zqOUa7vheCf+OSzjZSY9sS6TalIpqhZbM6tXfmNRORdBwDpnNLzBAaByOnw/MTZODLUS7BPPjqyxv40ginp7D2sfk/fh9+f11HNQSqPEGQSFnTon0S/pbzixGytCg2HKd65hLzcla/Cig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=92Fhhwt3jzsOmm9/JTdEPNwvM8mdPSH7umV0Br53FXk=;
 b=adY148/G3Fvyst+0g+DAyaJwSkEqclAQEiQOpgRAiZXkmwV1nl/Qokb0SdDqXBDHl7rUisYrD9RSbl6GiNtfKfEHnbTVE8DWXxf4S8OGwBn4TcGQ68stJmUDjPeu0YMZif+dPRvS5kaLi3HZpbtWy3H2XTEbbB62sNaUATRTbWGgOVEM2vwJbAvCWbAf6bWKyKr7LMW+hrVAHjpSFnLpnMvM8p+4rM0QEWJ4oJ7weH8HXF1ryCSGi44pYRaGBPwtJhTs+9IUkoCT8hh8108LGTDFV4ZBV0E2efk9NncVa7m/HXEhmHkfSawTC+K+k0toI6QBDdNeB+L8oAIf6r0fug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SA2PR11MB4972.namprd11.prod.outlook.com (2603:10b6:806:fb::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Fri, 8 Aug
 2025 14:42:44 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8989.018; Fri, 8 Aug 2025
 14:42:44 +0000
Date: Fri, 8 Aug 2025 10:42:39 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
CC: <joonas.lahtinen@linux.intel.com>, <tursulin@ursulin.net>,
 <jani.nikula@linux.intel.com>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <mairacanal@riseup.net>
Subject: Re: [PATCH 9/9 v2] drm/i915: Remove todo and comments about
 struct_mutex
Message-ID: <aJYM320pi9PKUhW5@intel.com>
References: <20250807170212.285385-1-luiz.mello@estudante.ufscar.br>
 <20250807170212.285385-10-luiz.mello@estudante.ufscar.br>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250807170212.285385-10-luiz.mello@estudante.ufscar.br>
X-ClientProxiedBy: SJ0PR03CA0057.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::32) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SA2PR11MB4972:EE_
X-MS-Office365-Filtering-Correlation-Id: 237ded0c-d891-41c4-b309-08ddd689d58c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VUdWRWdpYm12TmRGV0V1VVdpS1dLM2U3czgrelRraG41Ukk3SXhpNjdNY3N1?=
 =?utf-8?B?QjF4WGI1NmdiLzJQSVJ5RHI3Zk9pbGtNNDBvZG9FSUUxb3J3TElkQWVkYlBi?=
 =?utf-8?B?ZDBoYkgyTzZhb1d2OGpmaGYzT1hPZWlXM2lXZHRENUUvcERDTXZHNFpYZ1hi?=
 =?utf-8?B?akpURE9SQmJOMHBMUVJoWnB4QkVpdWtUaTlvdlgrWThNajhhNzZNc0hZVVo2?=
 =?utf-8?B?TUE2NFQ3dzF1R0owc2tVYm8vYnZEMkcyemZUcDI1anFJODk3b2gxbmFvTW01?=
 =?utf-8?B?Ym9hZzViVDA5cFVHYlV4eW5kWml1Q2pPa2hGNU5QV29CUmZCSXJPQW1YckFL?=
 =?utf-8?B?UTZVaHNoemE5RDJCN2N3SDRkYndvc0E5V3RBM1RJL0dUcWFrL25FWVUreWpY?=
 =?utf-8?B?eFJNNmZsVTk3cTRlZUJRd1M1djBVak1BN2JwUC9SODRKN0J4MzcwaHREdmpK?=
 =?utf-8?B?aFp4SFNIQkFSZC9udE8rYmhQdE1OV0owT0NNK1l4MFl3OHhGZ29TUHRRaWgw?=
 =?utf-8?B?MUw2Und0Y0lKaTlDdmdXVzdkYUlyYWcwTHlaL0lnY21UakhJY1NJOWEwT2lm?=
 =?utf-8?B?b1lYUHhTYkp4anhIa0R1a09VanJLZmtOb2l0T1l1YS9CeWNYNGgyS1RPL1Jv?=
 =?utf-8?B?ZnRpOU5RTUUvdHBIY3NrQ2F0bzVaR3YyaWsrSUp6bnk5NSs1V0lFR3JkUWtW?=
 =?utf-8?B?YmZRR3M3S0QxejQwZXlLR0IrNVNrblhodnU2QkVSZnZsNmZFZmVlVzlLMXNX?=
 =?utf-8?B?SEhMNnV6eFp2am8xT2dZNnN5S29TTVg5ZzA3cTU5MDdOSWdVU3h2V3YwSG1B?=
 =?utf-8?B?ZEtEaUsxb245S2tvY0dlK2RObUNiblZ2NzFXL0JUc1ZTQXA2K2VkTUVHT1dr?=
 =?utf-8?B?a3J5cXkxSzdKZExhWGQ3Smk1cU1rdzBSd28zSERZQ29TSGtuVDdTOXB0dHh0?=
 =?utf-8?B?WUVSTEI4MmczZE5XY3ROOGVKank4L0N4OEdXbk8vaFBtRXB2VDhmQVlPZGNw?=
 =?utf-8?B?R3NxT09QVlNac0xMSjYwWFF4eTNhbEtXMTVnNVlEVkdBYjl1MkdRWkRjQ0J4?=
 =?utf-8?B?U0JBYWtSa1ZJZVI3VjFQamVKdVU4LzkrNjFRWFk5NDRtNnNHNUw1TzNJMlRw?=
 =?utf-8?B?NC9RK3dDSFVYdXEvQ2JVNmRlRHhSN05nTHE4M2Y2ME9RSXU0N1JHc0V6amU0?=
 =?utf-8?B?VzF2Q0wwR2Nuc3VvUFNhSnhKVmNyRVFrNUVGQzBGZkhLOGdTYlJXaHBONllo?=
 =?utf-8?B?NVp4WVF4NjNTRk1lemtoMEFKMWlDa2hGckpYMUxyRUt2Tks1TklaY0FTUHJS?=
 =?utf-8?B?S0dCWDVxWFRudGViNVlnMFhZWHV2QnBZOXFaUjZBOTNZUU9CT3h2L2t1Ykh0?=
 =?utf-8?B?TUpRVWV3TVJrM3dlWEhpWmNiRUgyUE50c1lJRmxyVFlOdmpXcmJRdXI1d0o1?=
 =?utf-8?B?ckxLWUpMbmtQNkFFdU4vQVVqamdqUEFJQ1dzT2Jqbnp0TmlEOGExSFpzTmtY?=
 =?utf-8?B?R2czc2dvaFZJRjZvT2xCcHRnVkVkTmpPb1RBOFJuY2UwWDBJQ0E5TnBDYkFj?=
 =?utf-8?B?YzNjSm92Z0F2NzUyNzd5YkVIYzZpWVRNWElGUmdUS1pDTUFXblNmaFAzWHli?=
 =?utf-8?B?SlUxenU1YVFhQzB3VG9BRC9uRXJ3VStRa0lxbmxrRU1IVW9iekF0TEs1R29E?=
 =?utf-8?B?a2hjQXkxaERNODlxeUN1K2lZZzNHek9IVllDOWdzYnd0TWdlS3N2enJLWnpF?=
 =?utf-8?B?bmNqdnp0Z2NZUHE1cElUVGQzb0IrVlVNUVNiakM1c1pUTFZyUk5VcWgvNWdj?=
 =?utf-8?B?NGJkbkVVWTUvVSsrZit1WTZQdGplMjA4UzFnTHVZN1BDUzFrb3NyQStJTDhz?=
 =?utf-8?B?MmthV2FZWnlUZm1Qdkp0UEN4N3ZpRjV2RklJSU14b3B3eC9kTVJja1RkSVhB?=
 =?utf-8?Q?dThAvnr1pFs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MjRxWnllUXdna09RczVVN1l2dFdOVnE2Q0lQOUhzVXJRUFhMdHpaNWhuMWlv?=
 =?utf-8?B?bUZtZ0xqQko2ZFZvSEJJQTNVQVpETTd1TjMvbmdjMFhoZGJQdE1QTkM3M3JU?=
 =?utf-8?B?VTVlK2xHVm9xQ3k2R2s5d0Jwa0krK09TaXhWMmhkbVhiK1FGN2VpYTAydEF6?=
 =?utf-8?B?V1NWMGpUWDdsU2JpZk50MVlsQ0FRUVNmd2oyMFYyeTRBaVErcVhuVHpHSnlW?=
 =?utf-8?B?ZEI1UFJGYThQTThQRVp4V0dGUHEwSUV0M1BoUUpvazdyUmsrKzFxbzJ1cnRk?=
 =?utf-8?B?b242azZFQTJDRGloU2F2WDUrR2paZ2lhd0FJWjVQbk9SSTZHR09wQW9PT2xN?=
 =?utf-8?B?S09IR1I1WVVCRUZwdTlBblI2Sm5pb0JCMHltSlZHTWFGRWpaNVZGQmtKazF5?=
 =?utf-8?B?Q01QR3o5aFROVDBlYXpVOUduWlptZ3BvVkJjeDNYRVd3S1JCTllrcTJoWnBu?=
 =?utf-8?B?TmxFOHdocmdyeExYY1REWkljVnQwMzNpbmo1TFJaZ2E2RnVzV096aDRmWHRT?=
 =?utf-8?B?SnRCNnc3K21KZTJ5a3R4ZmpUMEF6NVYyWTMwVm9ndFNzMzZIQmxNN04wWEEr?=
 =?utf-8?B?clhuSzFtNXYvd0tjUDFxZ2o5STRhRDQ2VWxYTjRZaHlJa2FWZGVjNXd0emwz?=
 =?utf-8?B?TTRsckFra0NDSCtFbUY4WGxVNjY1WHl4cFYxaUxOTy9pa0d1N1pqbUZJbFl6?=
 =?utf-8?B?cy9jS3hNam9LaWpsaDBxb29JQ1pvbzA4QVZ4YzMvZXR4cFJHcHRZZUMzdFR4?=
 =?utf-8?B?RXNwcU16d2lrYVlyTU1rRWVtZGQ4M1J0UWY0a09VTjNmcEU0NWE2bWVzWVFL?=
 =?utf-8?B?Q0FOdEtON3ZaUng0S3dkSE92OHVOWVRQZWFFUGc4UHhjQW9IYTZ5dU9MVEJC?=
 =?utf-8?B?U2EvQXdFNkg0YzVRL25vdGYvbnpIRzRwU2pkcWlXRmJoYnZ3em1KM2dIN21Y?=
 =?utf-8?B?OFhITVFnN2ZtZHRGQVIvdlkvM3lWd21rcVJ6cGFmS245dWlKQWZYYk1WZFpv?=
 =?utf-8?B?UDVIc2t6N2JLMmRyQXVJZlVLUnFNSTI5OXJVTml2eitvdjhDaTY0ZktoZUVG?=
 =?utf-8?B?SGZhMS82amN1WGFPZVBJOHNNV3lVek50SXVDcVRaWkl3czNXUytNZlBGVk54?=
 =?utf-8?B?Znd3Znk2emJGN2g0d2UwK1VpNzF0SUlwM1hYY2R2eks3bWxKdVB1MW93MjMv?=
 =?utf-8?B?QWdPK25uek9Bd0JWamQ1SkVoMThZSGFXc3NBRDNkSnVzdklzdUZVRjNCTmlu?=
 =?utf-8?B?Y0NSYVdwYnE2NXcyNW5IektqUi91eW9mNHpnQkhzNE11Umx3WllldnRJN3pB?=
 =?utf-8?B?ZmZERDhCL1U5Skk3b092OHVpR1I0RXhlSWVrOXk4TUJrSS9HeXU4bHdEeitN?=
 =?utf-8?B?UVozNHRsMnNHQmdGOVp5bnhTQ0Z4UVpwK2Zzeld2NUVLazdPckhhT1VaNlRm?=
 =?utf-8?B?VG11MjdDZmp0OWsrODRWaHFWaStNUThEVUI2YXlCKzBxc0ZUc3pQVGRhN3VI?=
 =?utf-8?B?eE5hRzJ0QUZzdGNwY0VudVl5NzVIaURZbUFCZDh2YUNKU3hGYk9mMFhmbGlP?=
 =?utf-8?B?V3VFeUlKTFExSU9IaXkyczZwZmUxa2RNWHhGVU10UUE3NHUvUmhpL2FXWnFh?=
 =?utf-8?B?Vml2VnhLZHJidDlsSEhNN1pyZDcyenRNbnpMd042bmN4T2kyaEdFcU5hYm9H?=
 =?utf-8?B?NkhlcS9JRjUwSGoxY24zR0llTUJJeXpQdjlHWXlZcS9heE5CcDFiUmdabU9h?=
 =?utf-8?B?Nk9vOFdpS0Z6OXVjempMeHFoeVRXRThsYmxJYUpHRitBZmFNQmJET3dObFlz?=
 =?utf-8?B?U0lzTExIQ01ZRlpSa25kaFRnTDlSUTR2M3VnT0lMaGcvSm5Hc3VJU2NQWmV2?=
 =?utf-8?B?cW45Z2JMZ1BQeWkvTktsK1pCOFIxdkFnYjYzc3hKdEQzNmtPVzd0U25RRHNW?=
 =?utf-8?B?Mm43ZENjTG5LZmlENGJ1em9YQnVZSnJZRkt6QVJCcFV1ejNPaGhWUk5lN3Ra?=
 =?utf-8?B?Tis1UzEzZTFFM1M3Zko0ajltdjMxSUw3SWFET0F4RDNEaTU3ZFhGbFZMSHVn?=
 =?utf-8?B?WC9IRll3L2poZzhsN05xREM0aXMzQWlrNUxQdDVIRTlPM2diZktWUlI1Rkgw?=
 =?utf-8?Q?xWFaTBpS+3hq9ESYyYaiQX4gT?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 237ded0c-d891-41c4-b309-08ddd689d58c
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 14:42:44.0342 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jbb0TjM1/VwR329uk/E96PRp/cDxwBmNlDf1YCDMhyf9LIVwYO5QHHsfH8J2mTmmbo3phrzAqjGqrRY70smjww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4972
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

On Thu, Aug 07, 2025 at 02:02:08PM -0300, Luiz Otavio Mello wrote:
> This patch completes the removal of struct_mutex from the driver.
> 
> Remove the related TODO item, as the transition away from struct_mutex
> is now complete.
> 
> Also clean up references to struct_mutex in i915.rst to avoid outdated
> documentation.
> 
> Signed-off-by: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
> ---
>  Documentation/gpu/i915.rst |  7 -------
>  Documentation/gpu/todo.rst | 25 -------------------------

misc Maintainers, I also need your ack here to get this through drm-intel-next
please.

I wondered if it would be better to have a split patch to clean up the
i915 doc separate of the drm one, but I believe this single all in one
patch for the doc part is okay...

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

>  2 files changed, 32 deletions(-)
> 
> diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
> index 72932fa31b8d..eba09c3ddce4 100644
> --- a/Documentation/gpu/i915.rst
> +++ b/Documentation/gpu/i915.rst
> @@ -358,8 +358,6 @@ Locking Guidelines
>  #. All locking rules and interface contracts with cross-driver interfaces
>     (dma-buf, dma_fence) need to be followed.
>  
> -#. No struct_mutex anywhere in the code
> -
>  #. dma_resv will be the outermost lock (when needed) and ww_acquire_ctx
>     is to be hoisted at highest level and passed down within i915_gem_ctx
>     in the call chain
> @@ -367,11 +365,6 @@ Locking Guidelines
>  #. While holding lru/memory manager (buddy, drm_mm, whatever) locks
>     system memory allocations are not allowed
>  
> -	* Enforce this by priming lockdep (with fs_reclaim). If we
> -	  allocate memory while holding these looks we get a rehash
> -	  of the shrinker vs. struct_mutex saga, and that would be
> -	  real bad.
> -
>  #. Do not nest different lru/memory manager locks within each other.
>     Take them in turn to update memory allocations, relying on the object’s
>     dma_resv ww_mutex to serialize against other operations.
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index 92db80793bba..b5f58b4274b1 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -173,31 +173,6 @@ Contact: Simona Vetter
>  
>  Level: Intermediate
>  
> -Get rid of dev->struct_mutex from GEM drivers
> ----------------------------------------------
> -
> -``dev->struct_mutex`` is the Big DRM Lock from legacy days and infested
> -everything. Nowadays in modern drivers the only bit where it's mandatory is
> -serializing GEM buffer object destruction. Which unfortunately means drivers
> -have to keep track of that lock and either call ``unreference`` or
> -``unreference_locked`` depending upon context.
> -
> -Core GEM doesn't have a need for ``struct_mutex`` any more since kernel 4.8,
> -and there's a GEM object ``free`` callback for any drivers which are
> -entirely ``struct_mutex`` free.
> -
> -For drivers that need ``struct_mutex`` it should be replaced with a driver-
> -private lock. The tricky part is the BO free functions, since those can't
> -reliably take that lock any more. Instead state needs to be protected with
> -suitable subordinate locks or some cleanup work pushed to a worker thread. For
> -performance-critical drivers it might also be better to go with a more
> -fine-grained per-buffer object and per-context lockings scheme. Currently only
> -the ``msm`` and `i915` drivers use ``struct_mutex``.
> -
> -Contact: Simona Vetter, respective driver maintainers
> -
> -Level: Advanced
> -
>  Move Buffer Object Locking to dma_resv_lock()
>  ---------------------------------------------
>  
> -- 
> 2.50.1
> 
