Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C06791868C
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 18:01:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5160B10E934;
	Wed, 26 Jun 2024 16:01:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K6OA0KL8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69CA510E92C;
 Wed, 26 Jun 2024 16:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719417709; x=1750953709;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=XRBVYeDPQIwLupUlrKT7pzIs8ydrTMHXfs34B3Fj97w=;
 b=K6OA0KL8FlKggMaptHxWDkhJBkKv5ABzm7vn9BdcApx8/iQdYx1A+Tpa
 C+YDXniIyDcM4FDN7Wk41Qsz5SIHwzQs1WDxsJ65VJlW5d4SSoVAJ4mA4
 rxhC7IY9OwhNoP4UOXvmNNnxUpt+J48lDorjTw3gip50Jl17b7Iq9jnE1
 om8QvPVV7dWs88rI7TbuGdYhZcfMRV05R9Zg4Ln4Xcla8NVQj+oyGU8oh
 zzFoAyHsgDZfolDytSD3pykrKJ1UKjlhdkochFoXWxUPcm85X+W1CDhdh
 C/hS/C/oDBb/CweO5ojz9yPJhIRo3iux6/iKaPhpgH25r9/2SC52/t7Kz A==;
X-CSE-ConnectionGUID: prHpsrd5Sf+4vHd7E+bz1g==
X-CSE-MsgGUID: GCcY0bDiQ2m0BKJXYz1mVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="16461465"
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; d="scan'208";a="16461465"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 09:01:46 -0700
X-CSE-ConnectionGUID: ZYyoq7RgSru0wxoRM8XiTQ==
X-CSE-MsgGUID: pf7lIPBiTAeijgjukl5Arg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; d="scan'208";a="44766293"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jun 2024 09:01:42 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 26 Jun 2024 09:01:41 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 26 Jun 2024 09:01:41 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 26 Jun 2024 09:01:41 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 26 Jun 2024 09:01:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B1hfAl0aZxeteTNNYJ5hS7sJKF3YBpXaaKaCbTEqf2BlRVrrKdZa85L0k5eS5Xrklpgo01Yb7pa22s2oHFedDGyK2bsggXId9cb2TGBK5oz+u/itiL8A9ChlfrLMmyjie9m7qpzbhDW+vhskXV3inu5mlaDBtFCH8s14LkUcP/uUgbfUGcvrbuLSFvp6ClqD1omZLrb2K1Wd8+Lx9PkQp03uQpbSKRQlVdCF3gWAAoA8zndIStRlSNEN3MRkMrJnOi7+vhVfEmwGDMBc4VFuCpgDksexjcWHrV47Xo0fn7bMCyv3ElDL9vQh3JjkNd1dSuD4kqJFQrVhW4wvXn8pLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6y7QGVA1GjCnJS6YEMX9kD3b9fAEiXQb9LPQmQDGF6c=;
 b=L2rETJLvy5drO4CvhCyHqQKKOeB8X1cB4fNaxaw33HN29PMCjP6Nw/tVUu71LsvQvHf1R0Rsdu4giv/zZ24vQydtLZ2B44Sq+ind/9hORQs//iW/1LTa/b0TBzBPQqttusOYZFNYHhzUVYMsUb+NgvXtmxLOai/yApfns0uIyNg/m1hazuLnrUYFI8wrqyA9yAikRZQ7xKa4/aZF3efwAiWDfwVzoJuHyVHtfbu+71XVJMSYCnzH1tXouW9doUAHr0DtKZwuCEbTA/4e7AtF10v2Q7uaDHbiMwPzt3sO0sS900CM8VGRZ1VNpa5TpU659GpVoifsS4Ygnm9bWNK1gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by DM4PR11MB6237.namprd11.prod.outlook.com (2603:10b6:8:a9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.28; Wed, 26 Jun
 2024 16:01:37 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7698.025; Wed, 26 Jun 2024
 16:01:37 +0000
Date: Wed, 26 Jun 2024 12:01:29 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Alex Deucher <alexander.deucher@amd.com>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, Rob
 Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean
 Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <intel-gfx@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 <freedreno@lists.freedesktop.org>
Subject: Re: [PATCH v5] drm/display: split DSC helpers from DP helpers
Message-ID: <Znw7WYxcW_iKE4B7@intel.com>
References: <20240623-panel-sw43408-fix-v5-1-5401ab61e738@linaro.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240623-panel-sw43408-fix-v5-1-5401ab61e738@linaro.org>
X-ClientProxiedBy: SJ0PR05CA0204.namprd05.prod.outlook.com
 (2603:10b6:a03:330::29) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|DM4PR11MB6237:EE_
X-MS-Office365-Filtering-Correlation-Id: 67e39589-c4c3-436b-cab9-08dc95f94246
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230038|366014|376012|7416012|1800799022;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?jqsdiZ9Mo/oy1ktij0aixgR2BvJHCjasQvYRBr5OaUx/mzJo9hfhEZNOPA?=
 =?iso-8859-1?Q?EH3jRPT0FRbpfVeJjY+G3Kx6MXrlFJdUqhNn9oiExWJIRVVk91OeCc70tZ?=
 =?iso-8859-1?Q?obM4+VPDrQAv/6J3MGHWJIFlh98IrBRIivP0/jh+NuhAiHMUfZODkmY06K?=
 =?iso-8859-1?Q?BrA/Y37cwssFWksMACyCq8lHVXB/v56+8hS1eLEWT+HkcDaCcPWolJmdq1?=
 =?iso-8859-1?Q?EBmJV0FV/VsN5N5YW3Eo4Ew7IHvzxysLA22fH/2k90FOt13sqqRq5No5CP?=
 =?iso-8859-1?Q?4BwM5zs3GtU2e9x2BF//Sxn60b/Q8qQCWPgVpnnauwcTRUrz+3lN9BWPLx?=
 =?iso-8859-1?Q?KfEnCKV1gTzbLiraea9JBiOgVh7cRKALz0repzznaRwzAiJoEldnoSR602?=
 =?iso-8859-1?Q?uimDSpPNArmqtAQzGX8tboevXaDtxNu+dp3gobAWsJipbLoqtZuAvObIP9?=
 =?iso-8859-1?Q?P/k1JFxSj+yU6kb/uwDTKvqfeab/obS347v67lVOrVvB4IRTwundwP8Pcb?=
 =?iso-8859-1?Q?cqpEeX3IW5vfVBV1IuRYV6OEnYC54R9hcIRibq76/bwmKoSc8UmpdrlPMg?=
 =?iso-8859-1?Q?iVnD8gCtff6inbj7ZNOhw4aw6fYH8Py0DfFXlk89StIXvkEMpdNU5J6fcQ?=
 =?iso-8859-1?Q?xLSSo2O4A4zKS972adFgygaA3hFUwV00hXU0uq/QOSaftFwQgrGLAbtQD7?=
 =?iso-8859-1?Q?aZNF419JT8PNMRpHz4LZmBCzCWDz2lHb3/YT24oMxllpeQj5VkmA7KfYGG?=
 =?iso-8859-1?Q?xUuXFLRIOt0PjKXXopXJoK/UuxQ+Iulpbz8DS3I95tgq52ztP0CdCc82xh?=
 =?iso-8859-1?Q?zTW2FV1pspajFUb0dVz3Bh1WWMXmumGGsHl8WVVJisdD/S0rczisu5BUwp?=
 =?iso-8859-1?Q?k7JNhDfplGkdab0S0BrQ58xAprB+lMetFSqt3+tBNzhDPzUqFNHRv2w86w?=
 =?iso-8859-1?Q?hJwUMpUqx/9iQ57bGMcodL0RLy0JNzVi0XmcSA4sxx4JLfjj8wZOhhmtqI?=
 =?iso-8859-1?Q?Arle/rZ/HBNM8DfEUWJkqmb6zYfCWScHwupZ55aj4HZea0TT0Y2kfaZaKV?=
 =?iso-8859-1?Q?IVccn20gTDKzLcWZUUoH2S0m7y9MZldexbrblWRY3VKHhHhMqe4yQRZuiO?=
 =?iso-8859-1?Q?tge0b0swOK8YDJshwMosglSBPXdfKnMR/3S6S+2kn2dFvIvh9PrXKS4O63?=
 =?iso-8859-1?Q?cNM2dq1qJy06QVUI5JAd2G530i9N881xqlgrC+1EDXiQ55bw5kiyOPe44z?=
 =?iso-8859-1?Q?sZTgNydJP4OmnUlmyTPjXaBlH7cTh67IV867SaI6gdZ3xAVh0B948/hHSP?=
 =?iso-8859-1?Q?rUQM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230038)(366014)(376012)(7416012)(1800799022); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?mP+n6ubT218sRiPMFRebtea7Re4iKCs69abWpIzOsQtnFhfpCZhCK36Bcc?=
 =?iso-8859-1?Q?fcKJ3X5LL6tTIKzK+PXrVTilbGxOU7P4psl1JGwEzmHZfyfROgcwjA6aut?=
 =?iso-8859-1?Q?DCT4HgDg36AhG5KUr3jgHgeRtCtB9+RXeKARYdrhQTFzL7MDmyhIgSIVbD?=
 =?iso-8859-1?Q?PzRTsaFXoH+IhzlP7IdcTyR9F3g3pf5SOaGbnAj3gCB7GhwbWFw6sXsHrk?=
 =?iso-8859-1?Q?UY7JagzHU65IWCaTkbAQXjbrHbuICYSJSjosa4R8o4yeNPg52mTVVws8Xr?=
 =?iso-8859-1?Q?8Xr2GugfVee/ZqYxsrNjeeCxi1qlpB/+mWkpvojo520unVOgF4xZg0mOcC?=
 =?iso-8859-1?Q?Dp5aU7JTUa5ZC34kVNeGCB3K/8IfCmHbDvZP/PsK3ZiJJyBsr36359g7to?=
 =?iso-8859-1?Q?Eir2dcIsnHc6/K7qowuZ0M1GjiG80VppwCtsk+PzejIYXVY3XQEOarp62C?=
 =?iso-8859-1?Q?I50lpYhb8gEFdxKabHBiSzb3Gx1vQhwJdJIv+wWRTkGUI0Q9Opbzwdm5tD?=
 =?iso-8859-1?Q?aNikdXIRNbBfjnBWhBkSV7dODeOkpBts5tYFAEKH6Kpsw75cG6fPI5izy1?=
 =?iso-8859-1?Q?U6FHdfquFjvb27t6hPdJVeDAaeJ0USlfLNOXKg3RlYlIcBEwkKP+4Bfs6W?=
 =?iso-8859-1?Q?6NRWRF4asTNgW7e7mtcstxgF7QyOrJCD9iTECr6PMGz44ZmXmV3iJYWqm0?=
 =?iso-8859-1?Q?OSZSZ1KYl+SVK9i3CPqgKYinhM+yZJFWPsHxTqdZDn0r0sDS3f+OxNP/SM?=
 =?iso-8859-1?Q?eZ4k2VO9fdV64H82+fiFf9uQj6nhO2kjpz+2mRGOUmJfRT+iEmQY0N9QLT?=
 =?iso-8859-1?Q?JaqauONs1EqqLWR/OFMpRkmtqr5oin6mYq5XPJrLcOHavxie3x496xIAUS?=
 =?iso-8859-1?Q?dYBN9aRMxgqk8PconWI8I+N6oA9Y+4yYBhaghP47nwGt6yinMblt76HHqc?=
 =?iso-8859-1?Q?QiinAtLwd/9VfsJoghwCeT6J8T1ziHp5nRsuX3BF+h8SYgK2HlAR3iRwK2?=
 =?iso-8859-1?Q?QMZ6m4j1eyW6TnCzc/oyvKlh1TYPB+GlIX5+AdOaafbXG7DHjkK4wvt3V/?=
 =?iso-8859-1?Q?s8hlQB9cX/wJFnxG+srMk2QiGhhGw2P0dKniSwfKhTQPgRRhk+405Oeae3?=
 =?iso-8859-1?Q?BfoCrgJaaLDTiScErdj9dFq0JoePgNU5jADwbAQaa8O4qUlubQhbx94LvZ?=
 =?iso-8859-1?Q?QCM3LRewDpoyHFjcln+kwq99PyTVj7nB2+P+b3yO29S7FziMXrD6LryeI2?=
 =?iso-8859-1?Q?QOC1PpQfXnGO3RRdr8Mk4HLULoZuutCBw+XG1cNgmqUjM6gviSkzC0xjTG?=
 =?iso-8859-1?Q?4RL6lxxpBwvqinoPfk3eKQHbMVugif31Rk2cxpyOgu772PEyUAkajfbCO6?=
 =?iso-8859-1?Q?Dow52OifdGk+6bgvsp3DWFYAGjHZZYDOsONsIdamHWs2wHZ0kfCduSpNJG?=
 =?iso-8859-1?Q?QeAI56PSgwDO5EFVG2qZ9xkQ7PvXpRicMfwWk/Std+azBw7oDesz3tNYrN?=
 =?iso-8859-1?Q?tXtAd+QPfCqZP7BFoej1OsX6wmSyhAidU6mOjH2FkqbiaDL+F0wOLAPfvC?=
 =?iso-8859-1?Q?fQRGdjghDSGHeuxVO2RIepoIb2Jv5yynXkuBvOTHS2RApkAWYhAhCZbd9K?=
 =?iso-8859-1?Q?mO628q5PTIbW6jOgo7DvK9iZwNbbr8rBJ2?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 67e39589-c4c3-436b-cab9-08dc95f94246
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 16:01:37.3442 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RQoDfpKWlhgx1VXhqjII4HIyUpHqEV/pkVE/aCNY1RngaRncgCnYY3BJF6MZJeD4TkNKDuFEjfjp4jshBdzzNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6237
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

On Sun, Jun 23, 2024 at 01:44:19AM +0300, Dmitry Baryshkov wrote:
> Currently the DRM DSC functions are selected by the
> DRM_DISPLAY_DP_HELPER Kconfig symbol. This is not optimal, since the DSI
> code (both panel and host drivers) end up selecting the seemingly
> irrelevant DP helpers. Split the DSC code to be guarded by the separate
> DRM_DISPLAY_DSC_HELPER Kconfig symbol.
> 
> Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> To: Alex Deucher <alexander.deucher@amd.com>
> To: Christian König <christian.koenig@amd.com>
> To: Pan, Xinhui <Xinhui.Pan@amd.com>
> To: David Airlie <airlied@gmail.com>
> To: Daniel Vetter <daniel@ffwll.ch>
> To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> To: Maxime Ripard <mripard@kernel.org>
> To: Thomas Zimmermann <tzimmermann@suse.de>
> To: Jani Nikula <jani.nikula@linux.intel.com>
> To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> To: Rodrigo Vivi <rodrigo.vivi@intel.com>
> To: Tvrtko Ursulin <tursulin@ursulin.net>
> To: Rob Clark <robdclark@gmail.com>
> To: Abhinav Kumar <quic_abhinavk@quicinc.com>
> To: Sean Paul <sean@poorly.run>
> To: Marijn Suijten <marijn.suijten@somainline.org>
> To: Neil Armstrong <neil.armstrong@linaro.org>
> To: Jessica Zhang <quic_jesszhan@quicinc.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Cc: intel-gfx@lists.freedesktop.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Changes in v5:
> - Drop applied patches
> - Link to v4: https://lore.kernel.org/r/20240528-panel-sw43408-fix-v4-0-330b42445bcc@linaro.org
> 
> Changes in v4:
> - Reoder patches so that fixes come first, to be able to land them to
>   drm-misc-fixes
> - Link to v3: https://lore.kernel.org/r/20240522-panel-sw43408-fix-v3-0-6902285adcc0@linaro.org
> 
> Changes in v3:
> - Split DRM_DISPLAY_DSC_HELPER from DRM_DISPLAY_DP_HELPER
> - Added missing Fixes tags
> - Link to v2: https://lore.kernel.org/r/20240510-panel-sw43408-fix-v2-0-d1ef91ee1b7d@linaro.org
> 
> Changes in v2:
> - use SELECT instead of DEPEND to follow the reverted Kconfig changes
> - Link to v1: https://lore.kernel.org/r/20240420-panel-sw43408-fix-v1-0-b282ff725242@linaro.org
> ---
>  drivers/gpu/drm/amd/amdgpu/Kconfig | 1 +
>  drivers/gpu/drm/display/Kconfig    | 6 ++++++
>  drivers/gpu/drm/display/Makefile   | 3 ++-
>  drivers/gpu/drm/i915/Kconfig       | 1 +
>  drivers/gpu/drm/msm/Kconfig        | 1 +
>  drivers/gpu/drm/panel/Kconfig      | 6 +++---
>  6 files changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/Kconfig b/drivers/gpu/drm/amd/amdgpu/Kconfig
> index 4232ab27f990..5933ca8c6b96 100644
> --- a/drivers/gpu/drm/amd/amdgpu/Kconfig
> +++ b/drivers/gpu/drm/amd/amdgpu/Kconfig
> @@ -6,6 +6,7 @@ config DRM_AMDGPU
>  	depends on !UML
>  	select FW_LOADER
>  	select DRM_DISPLAY_DP_HELPER
> +	select DRM_DISPLAY_DSC_HELPER
>  	select DRM_DISPLAY_HDMI_HELPER
>  	select DRM_DISPLAY_HDCP_HELPER
>  	select DRM_DISPLAY_HELPER
> diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
> index 479e62690d75..a2e42014ffe0 100644
> --- a/drivers/gpu/drm/display/Kconfig
> +++ b/drivers/gpu/drm/display/Kconfig
> @@ -59,6 +59,12 @@ config DRM_DISPLAY_DP_TUNNEL_STATE_DEBUG
>  
>  	  If in doubt, say "N".
>  
> +config DRM_DISPLAY_DSC_HELPER
> +	bool
> +	depends on DRM_DISPLAY_HELPER
> +	help
> +	  DRM display helpers for VESA DSC (used by DSI and DisplayPort).
> +
>  config DRM_DISPLAY_HDCP_HELPER
>  	bool
>  	depends on DRM_DISPLAY_HELPER
> diff --git a/drivers/gpu/drm/display/Makefile b/drivers/gpu/drm/display/Makefile
> index 629df2f4d322..df8f22c7e916 100644
> --- a/drivers/gpu/drm/display/Makefile
> +++ b/drivers/gpu/drm/display/Makefile
> @@ -6,7 +6,8 @@ drm_display_helper-y := drm_display_helper_mod.o
>  drm_display_helper-$(CONFIG_DRM_DISPLAY_DP_HELPER) += \
>  	drm_dp_dual_mode_helper.o \
>  	drm_dp_helper.o \
> -	drm_dp_mst_topology.o \
> +	drm_dp_mst_topology.o
> +drm_display_helper-$(CONFIG_DRM_DISPLAY_DSC_HELPER) += \
>  	drm_dsc_helper.o
>  drm_display_helper-$(CONFIG_DRM_DISPLAY_DP_TUNNEL) += \
>  	drm_dp_tunnel.o
> diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
> index faa253b27664..db400aad88fa 100644
> --- a/drivers/gpu/drm/i915/Kconfig
> +++ b/drivers/gpu/drm/i915/Kconfig
> @@ -11,6 +11,7 @@ config DRM_I915
>  	select SHMEM
>  	select TMPFS
>  	select DRM_DISPLAY_DP_HELPER
> +	select DRM_DISPLAY_DSC_HELPER

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com> #i915

>  	select DRM_DISPLAY_HDCP_HELPER
>  	select DRM_DISPLAY_HDMI_HELPER
>  	select DRM_DISPLAY_HELPER
> diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> index 1931ecf73e32..6dcd26180611 100644
> --- a/drivers/gpu/drm/msm/Kconfig
> +++ b/drivers/gpu/drm/msm/Kconfig
> @@ -111,6 +111,7 @@ config DRM_MSM_DSI
>  	depends on DRM_MSM
>  	select DRM_PANEL
>  	select DRM_MIPI_DSI
> +	select DRM_DISPLAY_DSC_HELPER
>  	default y
>  	help
>  	  Choose this option if you have a need for MIPI DSI connector
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index bf4eadfe21cb..afae8b130e9a 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -349,7 +349,7 @@ config DRM_PANEL_LG_SW43408
>  	depends on OF
>  	depends on DRM_MIPI_DSI
>  	depends on BACKLIGHT_CLASS_DEVICE
> -	select DRM_DISPLAY_DP_HELPER
> +	select DRM_DISPLAY_DSC_HELPER
>  	select DRM_DISPLAY_HELPER
>  	help
>  	  Say Y here if you want to enable support for LG sw43408 panel.
> @@ -558,7 +558,7 @@ config DRM_PANEL_RAYDIUM_RM692E5
>  	depends on OF
>  	depends on DRM_MIPI_DSI
>  	depends on BACKLIGHT_CLASS_DEVICE
> -	select DRM_DISPLAY_DP_HELPER
> +	select DRM_DISPLAY_DSC_HELPER
>  	select DRM_DISPLAY_HELPER
>  	help
>  	  Say Y here if you want to enable support for Raydium RM692E5-based
> @@ -916,7 +916,7 @@ config DRM_PANEL_VISIONOX_R66451
>  	depends on OF
>  	depends on DRM_MIPI_DSI
>  	depends on BACKLIGHT_CLASS_DEVICE
> -	select DRM_DISPLAY_DP_HELPER
> +	select DRM_DISPLAY_DSC_HELPER
>  	select DRM_DISPLAY_HELPER
>  	help
>  	  Say Y here if you want to enable support for Visionox
> 
> ---
> base-commit: 2102cb0d050d34d50b9642a3a50861787527e922
> change-id: 20240420-panel-sw43408-fix-ff6549c121be
> 
> Best regards,
> -- 
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
