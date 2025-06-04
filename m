Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C886CACE232
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 18:28:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2403D10E77D;
	Wed,  4 Jun 2025 16:28:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Acav7xgT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 529CF10E7D1;
 Wed,  4 Jun 2025 16:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749054481; x=1780590481;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=tDYB/RcTH9Wp2RI2yEDiMDQHJKsL0/MbD1HU8BXMVOw=;
 b=Acav7xgTWeMghTPcPZ2CRbd3pxANmjQMsvcgvLKRn//UpHjcqPPCgo7P
 dndCo0gRSpC5XBNIyh9xa3DdXSZ4KBMEZWE0sMzc/jEu/cpe+fENdzAJd
 FPp3sJEa99kISw0USnJata3oMPd7ImTe4JowyjnCS8bDyFKv/XVQAsyWf
 2h+kXCpz1eQCoFmohO4fbhnqOEUJxolrQ48CrhHIariqQFqpnYcmJh2gr
 HtU2vpT1cphS5GJovSn/90SnRAVXmLwi1d/XrFvUVkYTYGEDsBWKOctmG
 bDERQeo3W8r+rLgWaLab6eKQvUCMsoX1itRTlDwpouAatkC1U4PM5WNbJ w==;
X-CSE-ConnectionGUID: vetZ0EffQA2Y6MhS4yeAhA==
X-CSE-MsgGUID: NDF7neu0RU6O4pQPXRku1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="50263341"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="50263341"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 09:28:01 -0700
X-CSE-ConnectionGUID: OBAdN8rkQvmgsEBIu/tc2g==
X-CSE-MsgGUID: op9VIPfiT2qXreOkFoAV4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="146176085"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 09:28:00 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 4 Jun 2025 09:27:59 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 4 Jun 2025 09:27:59 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.55)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 4 Jun 2025 09:27:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M+GjDRQxEM2CRpleT5ml5MuRIP+iUe76B/zFnQGkTo7rBNSNquJhSs0Q/ywAtAlr6ikQceFYMf9Whd6VwrMLu8vOB/vFJszzl+3QnRrDfYF6hHUuHjCWiM3WJ6OiB9bj2Thw8VYlJLHM7dpVdsAiUVEjpaqVSMYQr12/SXcaxhky9c1Prm0wTC6i3Ya71LcpUIEl150k6QNBdx7+xTfJ99MP8wjsnRd2LqTFJYNBEjZj4gmwDVzyGrjVYv720LZ1DOM5YQxT0CBhcEnqYU7z44ABPm2m3uFCZDBUffeUs1BCiIAaXK6kl0lB2i8pDP0Y8ymovlHukijoMcqZHGGcpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RCpXHx6+p81T8fg9XPXz/sYVw9C6qARqldnwJmqeOtI=;
 b=bmEj/9UZA55FSVr6Lc6dG/zSy/961F5O6ECkl50M4Vdk5K1LBNXV7YkjJKo7PGGueHfBIkXROAokuuTdrtLGxh8qdkaffYJv1UrDr9hTLnISvsj3m1nP1iA15zci2TA5foRW50WpZdZSYbYeVnDFLawBZM1U4s1IVqmBpISsJGeK0fdyjC4HU5lBu1SdHUriznIaC1ZxpLTwg6D/dpDCUI3Noem6HcjZt1uItynyOuwaDUvvGboERh2vwuHTAOvso2hInrV+Qt+KzCkr6RYex3XyiwnBRBmwOJqim4Pjo7sE7LTcjSZ5reldSSe3FvnS57s+vyXcM4vGfjK/s8RyTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by DS4PPF2AD6B04BA.namprd11.prod.outlook.com (2603:10b6:f:fc02::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Wed, 4 Jun
 2025 16:27:57 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%2]) with mapi id 15.20.8769.037; Wed, 4 Jun 2025
 16:27:57 +0000
Date: Wed, 4 Jun 2025 19:27:50 +0300
From: Imre Deak <imre.deak@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, Ville =?iso-8859-1?Q?Syrj=E4l=E4?=
 <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2 2/4] drm/edid: Add support for quirks visible to DRM
 core and drivers
Message-ID: <aEB0Blqeb5JhK6Aq@ideak-desk>
References: <20250603121543.17842-3-imre.deak@intel.com>
 <20250604091315.16703-1-imre.deak@intel.com>
 <5e16fc31d59f2f284a0be57bf0e508c13ebb0a1a@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5e16fc31d59f2f284a0be57bf0e508c13ebb0a1a@intel.com>
X-ClientProxiedBy: VI1PR04CA0092.eurprd04.prod.outlook.com
 (2603:10a6:803:64::27) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|DS4PPF2AD6B04BA:EE_
X-MS-Office365-Filtering-Correlation-Id: 78cfcd8e-e5a3-4b30-0025-08dda384c3f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?QW3cjL/jPvJzl8mHKAkpZQhUcBcvHd4L80otiCVuL5Rh6hw9G7CktVA32M?=
 =?iso-8859-1?Q?L7bnNly51e3aES+C3e3+UwqwrI1n0zFIiN9CTlfZQpsko4boLKga2BMfST?=
 =?iso-8859-1?Q?TXDUCPCnUS461vqisaS3jSUocXjsm9kyLjJ73hdn9eGREv45Fz72u7bJCg?=
 =?iso-8859-1?Q?4QnQyMoYfkAOcygE/fDUogWNWGasdgdL2odd3kT8rTC0ebWd3+81GtsC5D?=
 =?iso-8859-1?Q?ZVHlDzdOPJ62mwLlSYrPH0Mzs0Fz6lwETgWq65En1fKQbG1netd6W9umRY?=
 =?iso-8859-1?Q?Un4j9jPZ3GOY4KH/FaNiM32WXoYTxqbDwHsEg+45+Go+IkbcjPJNZtYNij?=
 =?iso-8859-1?Q?KXeHX2+ORFKxJAYNMuQmVl3W8PGYd6XMgNgoZC92tPgQ1Rrlvmzriy1vym?=
 =?iso-8859-1?Q?fhgMn9ZthL7eeHemeJgczcZWMPLsgH2d0aCcbbFF8XenTGPDEXOZTl9+RX?=
 =?iso-8859-1?Q?X5JcoiZ/Sbj7fjJig6kNBjPK5Lg0BmFQO8FP3s1V83ZTwrpXAsdnKnQSkH?=
 =?iso-8859-1?Q?QG0tue9ugufIsI4iwk3v3dDz4VOl9hgs+IBBK6JQq6KpA1EqPUQqS48zjo?=
 =?iso-8859-1?Q?mUd2rBe6CnXoau0HHN2frVZdHVGB4R3mv1e6/dfMNGsrMTkwKuP/2xHkr5?=
 =?iso-8859-1?Q?x8CumU+/bEI74hu+80oqj6bhrt06xXPL7CHVjSjtXFR7FFBBb9nrSoxkQX?=
 =?iso-8859-1?Q?R9DGb0Tw9RcnFXyNtmXJQEHqtSgio+DcFmeotiZSpYFPM7n+BOvnW0Rc3l?=
 =?iso-8859-1?Q?12oqCTJ5AokCGGq/W/332qbSiNT1FEeyEw7nb78BFJ16oN/4MDaRxb3R7Q?=
 =?iso-8859-1?Q?mqZZ1vQ6dHt7ONr72KjK5byTfAfowr4n1cNGylhXcDEDODHeIUxmIaKYHB?=
 =?iso-8859-1?Q?oFnCi2MhFqB0RKjWuJ2tP8hp4AN9kvaMRxHG98dIrpuswzYp57xAw9Ffle?=
 =?iso-8859-1?Q?10+f1eQ8yFEdpEhzUgC7orLR7xnLoCuulkD3a9oNHtHcanEBmXuQ82mKvE?=
 =?iso-8859-1?Q?2iA4QXiI+7OHQISlQdlZddYNtu7GGhspYYpgaAYUVMP3w3a/J3JSlXu62x?=
 =?iso-8859-1?Q?YciGR/XZCcuQILqQ9nmDbjDSTfebFtlu/pTepfQlCNKXyoEBxU2r7wVLC4?=
 =?iso-8859-1?Q?pdfNH87suj/y7niekgmPkhqpdselZbwWbdu8Ljbfek9UZ0Dn/lUBcd0XxD?=
 =?iso-8859-1?Q?fzi358NV3cyUXdTpc4D+hLxRhoU+bRF24gwK6T2L0FbpgrWri0V6hRO921?=
 =?iso-8859-1?Q?NHUSMO3R4wLB9t86HOr4blYBqPsvvEM4MUxqtTiaNfb3XucCoEJanugOL1?=
 =?iso-8859-1?Q?JvzjSsmWMhQA2vJHLjhvJ4HAPR4V9mJxf1IBtfw5k+m59qrM7LJx31xScw?=
 =?iso-8859-1?Q?hNMv0e56zJipwvAPWHd5IBTak0FQok5pLQxRGQavGm+XSQhyEz1nUBBG9P?=
 =?iso-8859-1?Q?mubZrGXXsETYyTGBwFHcXl1jCXn8GbgsjTcclTHwFJxWhmA9FLsFoUfuBQ?=
 =?iso-8859-1?Q?4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?PuvpTu+1x18r/5wtolizp+ykAKELKMe+r1xsoltaWpaW5AS2ej/q4wsRYb?=
 =?iso-8859-1?Q?R/PJRuthfGcjnORz5mfInTN8ps0f4homqBHasxiva/mLsmNR40efHALinH?=
 =?iso-8859-1?Q?xkyCwsmWtrGlvc2gV1BHonM5msaV4Oo1n7wbgRqePQCIcE4+omNvvXypEG?=
 =?iso-8859-1?Q?zEhDRd8Ie3FvGOxC4i5jIoP6z3CPfBtNu34oU6lqXI60wIZD1CejgjoTW+?=
 =?iso-8859-1?Q?Rq+ocPAcmeCvZWYY+YgNLi551kPagouUxCXCYdeJJ0OkEitONHVN2j+sgE?=
 =?iso-8859-1?Q?7F5Z66C1KfCGh7FmRMqY0U9015RxO9GWCFGLVVFwEBmhTuqvOJaN9Vx8Pc?=
 =?iso-8859-1?Q?zxpq6/X2aAcXYmYOJZmBxstUuQdSVCGtVrFIwc2E77QCaLR/fcjtlS7DJm?=
 =?iso-8859-1?Q?o4KiGAcJF3EWNRt958l7DxFmccirvf8o7R7uqPAfpBP9/0V2huOGwsg3QC?=
 =?iso-8859-1?Q?r55tQVmC+nq9Qihn4mew7BjF3qSO2XUrkk1zexqVpEt+g9qCo7tuNulD/F?=
 =?iso-8859-1?Q?lZ9r+zM4qA/TBu9vBXo8mqnqyy/H1I90Kh7aWQYm/O7MNPTrUZcA/Msmc7?=
 =?iso-8859-1?Q?eCqoo1bwD/0qAM7QiRwqWKPcbcDlvlGTF2uQMQTmi6ND7x3MZBMvc8fQe8?=
 =?iso-8859-1?Q?Wv4itrjksIFrPJRS+i/UcSZsTADTGIwa4vWhKFYkv2cwSJ3frKJnOP3HxN?=
 =?iso-8859-1?Q?8pfpFv0IpMjRCjHl7jn7NW2bUP2edB+3jT794WUctMgT2ApbZuRm9nRCRm?=
 =?iso-8859-1?Q?kecyNTJchq7hK/04CMx3oK7x66TjAn93Zrm9RxPxcwd/idmZ5Hwtt1hnra?=
 =?iso-8859-1?Q?lKIgZWOMecabaNEJ6UodCKNMQ/USFoSliURstcYteXlMW72lD4PqMOe3ui?=
 =?iso-8859-1?Q?ixvWKQtC+0xl5ie0oJN3/qmaroFlFE93Iak9EbAtFQt5vwnPrbr0ROGqaQ?=
 =?iso-8859-1?Q?dscBn4fTLorWwN/A3qd8Je2NIGAM4L0HqqByHRrx0iKxTfPIgNVVmV/ym0?=
 =?iso-8859-1?Q?A4ThTDi9C/ukPewKqJ1Plk8RRe8cayXRN1CN9Ra6Iw+c4HUyd96CvaJP5x?=
 =?iso-8859-1?Q?X3LCy2uYN7m6KHCcLx/P+HqS71qUyXSYIRhujBWF6lZzQ2KAoz/UTVjAHb?=
 =?iso-8859-1?Q?EC7IGXV5E4DKeeviqjwqyPh1o2pzwrbQJxGyHlOp1rOfXqRNhjudYc5hti?=
 =?iso-8859-1?Q?0MwXivzmKvRyWH9pGhrNli09sQkzl3mdD9l8XpQH/KlEDupn8F0fQNuOij?=
 =?iso-8859-1?Q?tnP6e9Bfi4yCbJ6UWGUi4ntDIuDtfkQEGLvNwsaI6F1PJAa9uM1MydRK5A?=
 =?iso-8859-1?Q?jPXC7LdACKTu/nWq/gtVnhRHg+PkFagIdTTuN6UHuGNtIwcJZ/4b/eR42e?=
 =?iso-8859-1?Q?S7NauTF++grmpQ0zx4VByScAm4ULLkMVP2Ya/UXm9ga7R6pHDIrfiVxe7B?=
 =?iso-8859-1?Q?o41NJh16BgfEPUjZ+FVDsqtCFIks0c8SIuVnbZdyjjZMqmuU6GjUiHsCs3?=
 =?iso-8859-1?Q?bHJuWNzIlPV1pgGqGFOjiE4yn1ZexCbrlGO13xKKHjGz+dyDcUM5qCgsSx?=
 =?iso-8859-1?Q?svObjYXwVoTrOQN/R4rKKyJcPNZYWdA+DR6h6u/mtD+kIQIlaF2HcwIx6s?=
 =?iso-8859-1?Q?eYYwbMRmTxorCRqfCu4Ehjq7Xf8hJaC9IV?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 78cfcd8e-e5a3-4b30-0025-08dda384c3f4
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 16:27:57.7830 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IYv5Jg/nT8OO/kMngsxEkSP135yGLUmixvpYUlFZaSwHf03uswTMPAb/SenDHGMy1DNQYNrRJbrHR9Tu7MhUTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF2AD6B04BA
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

On Wed, Jun 04, 2025 at 01:02:57PM +0300, Jani Nikula wrote:
> On Wed, 04 Jun 2025, Imre Deak <imre.deak@intel.com> wrote:
> > Add support for EDID based quirks which can be queried outside of the
> > EDID parser iteself by DRM core and drivers. There are at least two such
> > quirks applicable to all drivers: the DPCD register access probe quirk
> > and the 128b/132b DPRX Lane Count Conversion quirk (see 3.5.2.16.3 in
> > the v2.1a DP Standard). The latter quirk applies to panels with specific
> > EDID panel names, accordingly add support for defining quirks based on
> > the EDID panel name.
> >
> > v2: Reset global_quirks in drm_reset_display_info().
> >
> > Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > ---
> >  drivers/gpu/drm/drm_edid.c  | 34 +++++++++++++++++++++++++++-------
> >  include/drm/drm_connector.h |  5 +++++
> >  include/drm/drm_edid.h      |  5 +++++
> >  3 files changed, 37 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> > index 74e77742b2bd4..5d3a25cbc4d36 100644
> > --- a/drivers/gpu/drm/drm_edid.c
> > +++ b/drivers/gpu/drm/drm_edid.c
> > @@ -114,15 +114,21 @@ struct drm_edid_match_closure {
> >  #define LEVEL_GTF2	2
> >  #define LEVEL_CVT	3
> >  
> > -#define EDID_QUIRK(vend_chr_0, vend_chr_1, vend_chr_2, product_id, _quirks) \
> > +#define PANEL_NAME_ANY	NULL
> > +
> > +#define DRM_EDID_QUIRK(_panel_id, _panel_name, _quirks) \
> >  { \
> >  	.ident = { \
> > -		.panel_id = drm_edid_encode_panel_id(vend_chr_0, vend_chr_1, \
> > -						     vend_chr_2, product_id), \
> > +		.panel_id = _panel_id, \
> > +		.name = _panel_name, \
> >  	}, \
> >  	.quirks = _quirks \
> >  }
> >  
> > +#define EDID_QUIRK(vend_chr_0, vend_chr_1, vend_chr_2, product_id, _quirks) \
> > +	DRM_EDID_QUIRK(drm_edid_encode_panel_id(vend_chr_0, vend_chr_1, vend_chr_2, product_id), \
> > +		       PANEL_NAME_ANY, _quirks)
> > +
> 
> I'm not sure why this has to change. It's not explained in the commit
> message.

The reason for the change is to add a way to define quirks based on the
panel name, also referred to in the commit message. I can drop it from
this patchset, adding it only later.

> 
> >  static const struct edid_quirk {
> >  	const struct drm_edid_ident ident;
> >  	u32 quirks;
> > @@ -248,6 +254,9 @@ static const struct edid_quirk {
> >  	EDID_QUIRK('A', 'U', 'O', 0x1111, EDID_QUIRK_NON_DESKTOP),
> 
> Don't we want the other quirk list also be this concise?

The quirk defined by the standard is panel name based. Imo the new macro
to add a quirk should allow for matching any panel ID _or_ any panel
name and I came up with the way above. But I'll drop it from this
patchset and use only EDID_QUIRK adding the DPCD probe quirk needed for
now.

> >  };
> >  
> > +static const struct edid_quirk global_edid_quirk_list[] = {
> > +};
> > +
> >  /*
> >   * Autogenerated from the DMT spec.
> >   * This table is copied from xfree86/modes/xf86EdidModes.c.
> > @@ -2937,13 +2946,14 @@ EXPORT_SYMBOL(drm_edid_duplicate);
> >   *
> >   * Return: A u32 represents the quirks to apply.
> >   */
> > -static u32 edid_get_quirks(const struct drm_edid *drm_edid)
> > +static u32 edid_get_quirks(const struct drm_edid *drm_edid,
> > +			   const struct edid_quirk *quirk_list, int quirk_list_size)
> >  {
> >  	const struct edid_quirk *quirk;
> >  	int i;
> >  
> > -	for (i = 0; i < ARRAY_SIZE(edid_quirk_list); i++) {
> > -		quirk = &edid_quirk_list[i];
> > +	for (i = 0; i < quirk_list_size; i++) {
> > +		quirk = &quirk_list[i];
> >  		if (drm_edid_match(drm_edid, &quirk->ident))
> >  			return quirk->quirks;
> >  	}
> > @@ -6614,6 +6624,7 @@ static void drm_reset_display_info(struct drm_connector *connector)
> >  	info->vics_len = 0;
> >  
> >  	info->quirks = 0;
> > +	info->global_quirks = 0;
> 
> So I am not sure if we really need or want two lists.
> 
> I think we could have
> 
> drm_edid.h:
> 
> enum drm_edid_quirk {
> 	/* ... */
> 	DRM_EDID_QUIRK_MAX,
> };
> 
> drm_edid.c:
> 
> enum drm_edid_internal_quirk {
> 	FOO_QUIRK = DRM_EDID_QUIRK_MAX,
>         /* etc ... */
> };
> 
> And just make info->quirks big enough. I think it feels simpler overall.

The internal quirks are not listed in an enum. That conversion is a
bigger change, but I agree it's a better way to define quirks. Did that
now, will follow up with it, this also allows using a single quirk list
as you suggested.

> >  
> >  	info->source_physical_address = CEC_PHYS_ADDR_INVALID;
> >  }
> > @@ -6660,7 +6671,10 @@ static void update_display_info(struct drm_connector *connector,
> >  
> >  	edid = drm_edid->edid;
> >  
> > -	info->quirks = edid_get_quirks(drm_edid);
> > +	info->quirks = edid_get_quirks(drm_edid, edid_quirk_list,
> > +				       ARRAY_SIZE(edid_quirk_list));
> > +	info->global_quirks = edid_get_quirks(drm_edid, global_edid_quirk_list,
> > +					      ARRAY_SIZE(global_edid_quirk_list));
> >  
> >  	info->width_mm = edid->width_cm * 10;
> >  	info->height_mm = edid->height_cm * 10;
> > @@ -7566,3 +7580,9 @@ bool drm_edid_is_digital(const struct drm_edid *drm_edid)
> >  		drm_edid->edid->input & DRM_EDID_INPUT_DIGITAL;
> >  }
> >  EXPORT_SYMBOL(drm_edid_is_digital);
> > +
> > +bool drm_edid_has_quirk(struct drm_connector *connector, enum drm_edid_quirk quirk)
> > +{
> > +	return connector->display_info.global_quirks & BIT(quirk);
> > +}
> > +EXPORT_SYMBOL(drm_edid_has_quirk);
> > diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> > index 73903c3c842f3..996ecf229f8c7 100644
> > --- a/include/drm/drm_connector.h
> > +++ b/include/drm/drm_connector.h
> > @@ -847,6 +847,11 @@ struct drm_display_info {
> >  	 */
> >  	u32 quirks;
> >  
> > +	/**
> > +	 * @global_quirks: EDID based quirks. Can be queried by DRM core and drivers.
> 
> Might mention that you should not access directly, but using
> drm_edid_has_quirk().

Ok, will add a comment to quirks about this.

> > +	 */
> > +	u32 global_quirks;
> > +
> >  	/**
> >  	 * @source_physical_address: Source Physical Address from HDMI
> >  	 * Vendor-Specific Data Block, for CEC usage.
> > diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> > index b38409670868d..3d8e168521c82 100644
> > --- a/include/drm/drm_edid.h
> > +++ b/include/drm/drm_edid.h
> > @@ -109,6 +109,10 @@ struct detailed_data_string {
> >  #define DRM_EDID_CVT_FLAGS_STANDARD_BLANKING (1 << 3)
> >  #define DRM_EDID_CVT_FLAGS_REDUCED_BLANKING  (1 << 4)
> >  
> > +enum drm_edid_quirk {
> > +	DRM_EDID_QUIRK_NONE,
> > +};
> > +
> >  struct detailed_data_monitor_range {
> >  	u8 min_vfreq;
> >  	u8 max_vfreq;
> > @@ -476,5 +480,6 @@ void drm_edid_print_product_id(struct drm_printer *p,
> >  u32 drm_edid_get_panel_id(const struct drm_edid *drm_edid);
> >  bool drm_edid_match(const struct drm_edid *drm_edid,
> >  		    const struct drm_edid_ident *ident);
> > +bool drm_edid_has_quirk(struct drm_connector *connector, enum drm_edid_quirk quirk);
> >  
> >  #endif /* __DRM_EDID_H__ */
> 
> -- 
> Jani Nikula, Intel
