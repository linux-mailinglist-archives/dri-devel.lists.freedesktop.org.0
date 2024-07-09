Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0453A92C486
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 22:27:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B92C610E668;
	Tue,  9 Jul 2024 20:27:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YBLllkpo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAD2D10E05C;
 Tue,  9 Jul 2024 20:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720556861; x=1752092861;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=XD/EREl0NaSWfSvutiPZifQXvekQr1FYCv/njsY9J6I=;
 b=YBLllkpoKZ8+FQnTQ5TzXQ1HJlv/Kuy4Wel42+Eqe2ZeJqxfK3NCHYN4
 or6KxThJDrjaCiLbS8DA+/uOSvdkMvsR8W+Trr9et37gqSYW0t2HWdLcY
 j19QtpV/sLyvT7HLq9W9hCqUYW8JSmJ2lolB6KdLFX6vdgPXE15TU6fce
 Kkn3u5fNROXCoU1C7FR9G96rUM/OK2bw77y6ZnrVKWJLadWD3kgEElCz+
 aaKD39HCd4BpLjX9n9+HRmdRpWqUsNHi/Jr8JGsj4VOAeRzkQJ1GESmpM
 tix2S8eMEOnEbLrrHZ4lx5iDF8mrTzffni8rQZ6buyd1v8Mgl9qt7L7Hv w==;
X-CSE-ConnectionGUID: e7AYROtIQYuRXpFgtDyvgA==
X-CSE-MsgGUID: 4hfHPRCITOKl7X0txOlCKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="29242579"
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; d="scan'208";a="29242579"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 13:27:41 -0700
X-CSE-ConnectionGUID: wRxj8X+2TFWakityb6iYcw==
X-CSE-MsgGUID: FASNy4v8R3i7INyakemF+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,196,1716274800"; d="scan'208";a="48427699"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jul 2024 13:27:40 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 9 Jul 2024 13:27:38 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 9 Jul 2024 13:27:38 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 9 Jul 2024 13:27:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YoJtVwlceDcalE8AEouADzoI3k6Chj3+qAl2nUJa8oZQOKXMqWruLikUmh1lzqZAFxT+w73BbTO8uSH4pRwzspgt3Kl3EREF0RR12gpyg1QtcxQaCwdaBTOr2Kj48KKpw7y9WkV0WPLS1Lq4gLdhHGUsoff9j3yrgGJZkLdx6+f+QSjkKZVDio1Qt1zSiZHJakDjXu15J6b4VjFvhTscPbDp1oHroPD/RJSFbtVOK0SONVGcFJcqVSUD2vh869VwAXAcHFcUKTNcTNgsc1F8HDRknj3i2jCncwxbDM0KdpXDCgQQqfBat8ANdWzJxlPeMt77paqTSjGNEg4QFGfE+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ruRaixHSHvXDvSwjPlTckke/n/+SedpGi4rQEMKtKHQ=;
 b=ZrpxmWtMYCv8YXYrzx0A14B9U+iErDIeHBgCYgHUNBaIvJcncy2vN2IFR67NUvj34z+8xsolBuYP4uQFPXfMereKdLpDO3tS/ndm+i+hqu0T5U21cc+sVVOqWNrF3ZzEN8UFlHTpbQANXdH1IGVgVVzkWe6D9hZEya6Fi7ac+a6Xzoje0OX3v5UfsSjdF0u7dDtL8j3rSgsLvx9GosQHzyRWfu2CZZwcy5ohSB6ROAreSAdG6jUXSa3kPaMhhiwOSSj7PyLiHZ5ntE0nDh3AwdWVbqnURzkTGuLGofel2I+wAcB9psfQfRsvhaTwgcsbLy6SoHzTI5PaAfiYz7E4+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2859.namprd11.prod.outlook.com (2603:10b6:5:c9::14) by
 SA1PR11MB6846.namprd11.prod.outlook.com (2603:10b6:806:2b0::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7741.33; Tue, 9 Jul 2024 20:27:35 +0000
Received: from DM6PR11MB2859.namprd11.prod.outlook.com
 ([fe80::4063:4fec:bf76:f095]) by DM6PR11MB2859.namprd11.prod.outlook.com
 ([fe80::4063:4fec:bf76:f095%3]) with mapi id 15.20.7741.033; Tue, 9 Jul 2024
 20:27:35 +0000
Date: Tue, 9 Jul 2024 16:27:18 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
CC: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, "Oded
 Gabbay" <ogabbay@kernel.org>, Lucas De Marchi <lucas.demarchi@intel.com>,
 <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <dim-tools@lists.freedesktop.org>
Subject: Re: [PULL] drm-intel-next
Message-ID: <Zo2dJlm2pUMyQq0y@intel.com>
References: <875xttazx2.fsf@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <875xttazx2.fsf@intel.com>
X-ClientProxiedBy: BYAPR07CA0044.namprd07.prod.outlook.com
 (2603:10b6:a03:60::21) To DM6PR11MB2859.namprd11.prod.outlook.com
 (2603:10b6:5:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2859:EE_|SA1PR11MB6846:EE_
X-MS-Office365-Filtering-Correlation-Id: 3be3bda0-f270-43e1-d2a3-08dca0558fc4
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?VluvU6dpk9V+eIgfJK3VValCXZ0sjLYDQy5TIc8RGmGo2JlxjHwTeVSDR5?=
 =?iso-8859-1?Q?LIvRRaryPZ9RePFL1Xs9zkkC/xOKkkFsBouNPALcasKpXkYMx0XUWoWgSq?=
 =?iso-8859-1?Q?d/wXtR0+2hMa/ClCIQNn1H3niYf6KlL71JQcU8AUOmN64/LcbuhUyawPoy?=
 =?iso-8859-1?Q?GjfALvkzxK0KECLfvhV/pJ+tbK8bSAknEoNX3H2r3i4XOsTu7J6aPK6xaH?=
 =?iso-8859-1?Q?gNG9KSXjVa1JUJHyPmOkpx8gSDGGJ87q5H5csOGUc5+lArB5WuTGo6iRl/?=
 =?iso-8859-1?Q?R1mkxKdgB4/xHLfnVg8CPemSq/r6Xm5zdqg4YlA/NvODSuVckmYjf1Wr69?=
 =?iso-8859-1?Q?0nJb9WSmgf56IyTKqD0SJaVbVlqZFvfm6tfapBbevTwrrgyLHhRrfScMGM?=
 =?iso-8859-1?Q?DGTLKaXve5oZh5U0AJNiGDk2U+0RGXne2zc5xPPMOk40UfuosNTcsgh3Y4?=
 =?iso-8859-1?Q?fcN5vtjppe6lBD+iV/JrrwDjCWvYsmK4t9IOMk25JAvsMrhip9fZYnud65?=
 =?iso-8859-1?Q?ehwSy55sXLiEshsPHEuAfxTeKJnxtM/6GygR6VBW15aodvKq0NlfS9aVOo?=
 =?iso-8859-1?Q?savTkBFyAiynBllUTfhE6/PSsQ/4W/Us0x1guQeuCMs1LoltplshBWIS9q?=
 =?iso-8859-1?Q?tSpptiXtLvNvYesWkyJN4m/odOUaMDOrQBBoeJLjSKe4E4fD838B7zZYiA?=
 =?iso-8859-1?Q?5dBuFWnzXKJQY47H6NIfpMuQURY38A3i8TezcsjtG796i2WKzufn3N3p2n?=
 =?iso-8859-1?Q?ANC7wKOoxFwxCajKRijpL7uWt+VPw8W5ayEELURGtbJNc7iaSE8B+w0ggg?=
 =?iso-8859-1?Q?+Di8mS6HPrSYJGk5dg+ZDASLNLYsV5dzTWBCQS9EotVUPI5hhRMJspRdIZ?=
 =?iso-8859-1?Q?SH+/JHk0MFmEr4SwaYkox0oNjZgIK3nrPkr9taJSnrM4sbirgu/9r+xABX?=
 =?iso-8859-1?Q?9PONO4EXRGdfIyG2TKUqj2rVZU4O2pxVGxM5/rfDoArovALrSOykfxClrP?=
 =?iso-8859-1?Q?bi08YwOFTXS9t2EgPs7G72Yi+RE5nE6deDqldwSjHlaxqwCviC/GRQ53Sw?=
 =?iso-8859-1?Q?Cbjocia6BiBTa1NqytthX0jWYMzmWmU7Tv/oFNTxkM94brNKt2+Xq8Rb6P?=
 =?iso-8859-1?Q?2uf8uMtUhcikNB7cv4ZeL9Md8+QJ7ojuLO5rz6XRQxUQVzsHK5wNSDNHQA?=
 =?iso-8859-1?Q?Z4ZLS6XXsIXUUWvea8hGUNFnTn/wWImr4HZvKBaZ5PsUkqkWRUP/jzeUTC?=
 =?iso-8859-1?Q?bmOQrQ5LM3EhPOr25X2coJx6aO/OipQ99ntU66cgQrpoYn0v/M3kK71NGS?=
 =?iso-8859-1?Q?R4gImREkZuvNCZITJQdkueYye3nDPMqQEcSOnrHM5I4g28Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?FN+25NaXHWUBTDE6BhtbjZhbuVoCA9V+vrC56OkOUzH3DbzMK6zl/A2ZR0?=
 =?iso-8859-1?Q?ry6k1v9qzgRyDxesSeCjb5dwq++nseJpnHkLMsureea/K5hrVfcISqqxI3?=
 =?iso-8859-1?Q?nWXUGeAfqM7iTjXMVGwEWOUxwq0L9FcHQcmwVVbAq8+Ff0F2cLLo/HOHre?=
 =?iso-8859-1?Q?rTG3u4msntGQwS9L+NhS4mIl0q5VFClo1ouqrJBpRLs4PEEar8rRrKLsC3?=
 =?iso-8859-1?Q?Gv0HVFYPze0rlP7WKlKmTNLcFX0X99El7ukyH/sO/OVstX5dIPd8iDGei1?=
 =?iso-8859-1?Q?XyckNUVTBdusklmZkjlwH1FG+EHfLjiktjCuFRmCiSJ9GwswWYioJfQhpu?=
 =?iso-8859-1?Q?tLZKBVf3K8z7bELvIJ0mRQTGJDgai6JFDWG+gQsfVj7/7fOqtEWsZq+JPs?=
 =?iso-8859-1?Q?kgJGRQEvZEJDQxHyyuRbfQYrc5imq/Ae69e3VSeWkUpdF+32FbpCJzVSsQ?=
 =?iso-8859-1?Q?efUdDqQxHLWwQPEbH4yRDiN/ZM/KoN2dBINJfe2iU0BgFFhb1v+gAK9QST?=
 =?iso-8859-1?Q?ppfrtmtPobLkqUCjKNU7AejMKglgSlO+uhr/CxU5GHmuK4fS7S96Jq+9oV?=
 =?iso-8859-1?Q?6bYtc0Ef6NJxabgz/aWNddnOzv6JxTP+Ki1o5IFFFHcZz5Bubilu5F4PTF?=
 =?iso-8859-1?Q?07LUAOi5raed51zrqiQeF5LrP4cs9V7HqWhgVMzdXtIJY6anhTTyB4yf1O?=
 =?iso-8859-1?Q?loI8kTtHQSEw07BQ8HZJUHdzVt7UjHwnrjn95W0A3M5+jCQCYG/vvi0XO1?=
 =?iso-8859-1?Q?v6/kSToWZHiUOHu0uQdoszkznKeBBnHV948o7MiIWsyk+5Wd35rGByNgAM?=
 =?iso-8859-1?Q?svkvyQEXnL7XkDVus6O5YWkvr30Wop6Ij/mOWrKtq1yv5fC0DoyI6eWB9R?=
 =?iso-8859-1?Q?zxaVRkUe/OId8nHUVD3r2UlMYmQA/eUo5M7wguXXNkhXT+Hj5fI5l/aNrc?=
 =?iso-8859-1?Q?iPkzrRPPxSd74m7qytD2VXr7W2C8BLiS+7tendiZWbu7hvRYjkEnSPWm75?=
 =?iso-8859-1?Q?ucj40Tpk8VL6yUFsi0JYXulzzjCUkNoEuJbHVvIm0AduWwI7efTV9Lc8Hm?=
 =?iso-8859-1?Q?GHHgoAlSqPLMhLOiS/porEhi4qESOGZ5YN3H9hQVJPvQAk8EH23dQXc9YQ?=
 =?iso-8859-1?Q?ivThbb+CFGyi9/iFHaVXoRhJNECItKBQcPkkupGH5A2q5q4tBOU78vzQlA?=
 =?iso-8859-1?Q?7Y2ubTbDDtA8u6KnObIBI7WMV29Rv5OOdxfNmXB5tvDJYweoXEOlDwJq7I?=
 =?iso-8859-1?Q?5w8gHstgyNJuVd+kMk1JI1yT9iksz+RMpH3BYFbOIs+Lj92SsipzMxYcx5?=
 =?iso-8859-1?Q?RX07k/JzqUfilIGUBVUbXJo7OAkwuOpKJF6aSEmGXeD3aSXQCz3hEV674L?=
 =?iso-8859-1?Q?um0+iAF8oIdnqlW/Cx6Xruu/+wvPCtOMnp9Ew64nZZQeW0AHmkBTTUoBVB?=
 =?iso-8859-1?Q?eW7plwbD2nFoKax+lS797LkHeDcpl38IOQ1MvCWCXLsbZ+0e0tMQ6MGMhQ?=
 =?iso-8859-1?Q?kbrpB32YhgoNQD8r3dShp72Nka9yWiEolQYv5JGnf87fxxpEhS2g6jGvdi?=
 =?iso-8859-1?Q?JZO5yRo76QEW7cNFmXNgptaZmZ92UQqzqstTjRIJuHfiuoOKVau2toNbhg?=
 =?iso-8859-1?Q?5qac0Mks306D2ZzRi0DvxK0mRxD/n2C74mwkYnul07QUl8gFlRY7wdJg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3be3bda0-f270-43e1-d2a3-08dca0558fc4
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 20:27:35.1646 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vui0xUTpqwtCaGTK06nltWZcdfmaR902bmwFt7jPAUJOOoPYwK17Q8nGJdOvzM0FYhR/1P3q6TSjE9YPAJsf0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6846
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

On Fri, Jun 28, 2024 at 05:46:01PM +0300, Jani Nikula wrote:
> 
> Hi Dave & Sima -
> 
> Another feature pull towards v6.11, hopefully last. This should also fix
> the 32-bit build issue [1] seen in drm-next.

Sima, Dave,

I just noticed that we don't have this one yet in drm-next.

Anything missing or wrong with this PR?

Thanks,
Rodrigo.

> 
> BR,
> Jani.
> 
> 
> [1] https://lore.kernel.org/r/CAPM=9tyNGA2wEgnsKdSyjHRGVikywZLdueZj=syTMFYEUNzxhw@mail.gmail.com
> 
> 
> drm-intel-next-2024-06-28:
> drm/i915 feature pull #2 for v6.11:
> 
> Features and functionality:
> - More eDP Panel Replay enabling (Jouni)
> - Add async flip and flip done tracepoints (Ville)
> 
> Refactoring and cleanups:
> - Clean up BDW+ pipe interrupt register definitions (Ville)
> - Prep work for DSB based plane programming (Ville)
> - Relocate encoder suspend/shutdown helpers (Imre)
> - Polish plane surface alignment handling (Ville)
> 
> Fixes:
> - Enable more fault interrupts on TGL+/MTL+ (Ville)
> - Fix CMRR 32-bit build (Mitul)
> - Fix PSR Selective Update Region Scan Line Capture Indication (Jouni)
> - Fix cursor fb unpinning (Maarten, Ville)
> - Fix Cx0 PHY PLL state verification in TBT mode (Imre)
> - Fix unnecessary MG DP programming on MTL+ Type-C (Imre)
> 
> DRM changes:
> - Rename drm_plane_check_pixel_format() to drm_plane_has_format() and export
>   (Ville)
> - Add drm_vblank_work_flush_all() (Maarten)
> 
> Xe driver changes:
> - Call encoder .suspend_complete() hook also on Xe (Imre)
> 
> BR,
> Jani.
> 
> The following changes since commit d754ed2821fd9675d203cb73c4afcd593e28b7d0:
> 
>   Merge drm/drm-next into drm-intel-next (2024-06-19 11:38:31 +0300)
> 
> are available in the Git repository at:
> 
>   https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-next-2024-06-28
> 
> for you to fetch changes up to 32a120f52a4c0121bca8f2328d4680d283693d60:
> 
>   drm/i915/mtl: Skip PLL state verification in TBT mode (2024-06-28 12:50:52 +0300)
> 
> ----------------------------------------------------------------
> drm/i915 feature pull #2 for v6.11:
> 
> Features and functionality:
> - More eDP Panel Replay enabling (Jouni)
> - Add async flip and flip done tracepoints (Ville)
> 
> Refactoring and cleanups:
> - Clean up BDW+ pipe interrupt register definitions (Ville)
> - Prep work for DSB based plane programming (Ville)
> - Relocate encoder suspend/shutdown helpers (Imre)
> - Polish plane surface alignment handling (Ville)
> 
> Fixes:
> - Enable more fault interrupts on TGL+/MTL+ (Ville)
> - Fix CMRR 32-bit build (Mitul)
> - Fix PSR Selective Update Region Scan Line Capture Indication (Jouni)
> - Fix cursor fb unpinning (Maarten, Ville)
> - Fix Cx0 PHY PLL state verification in TBT mode (Imre)
> - Fix unnecessary MG DP programming on MTL+ Type-C (Imre)
> 
> DRM changes:
> - Rename drm_plane_check_pixel_format() to drm_plane_has_format() and export
>   (Ville)
> - Add drm_vblank_work_flush_all() (Maarten)
> 
> Xe driver changes:
> - Call encoder .suspend_complete() hook also on Xe (Imre)
> 
> ----------------------------------------------------------------
> Imre Deak (5):
>       drm/i915: Move encoder suspend/shutdown helpers to intel_encoder.c
>       drm/i915: Pass intel_display to the encoder suspend/shutdown helpers
>       drm/xe: Use the encoder suspend helper also used by the i915 driver
>       drm/i915/display: For MTL+ platforms skip mg dp programming
>       drm/i915/mtl: Skip PLL state verification in TBT mode
> 
> Jouni Högander (12):
>       drm/i915/psr: Set DP_PSR_SU_REGION_SCANLINE_CAPTURE bit when needed
>       drm/i915/psr: Check panel ALPM capability for eDP Panel Replay
>       drm/i915/psr: Inform Panel Replay source support on eDP as well
>       drm/i915/psr: enable sink for eDP1.5 Panel Replay
>       drm/i915/psr: Check panel Early Transport capability for eDP PR
>       drm/i915/psr: 128b/132b Panel Replay is not supported on eDP
>       drm/i915/psr: HW will not allow PR on eDP when HDCP enabled
>       drm/i915/alpm: Make crtc_state as const in intel_alpm_compute_params
>       drm/i915/psr: Perform psr2 checks related to ALPM for Panel Replay
>       drm/i915/psr: Perform scanline indication check for Panel Replay as well
>       drm/i915/psr: Check Early Transport for Panel Replay as well
>       drm/i915/psr: Modify dg2_activate_panel_replay to support eDP
> 
> Maarten Lankhorst (2):
>       drm: Add drm_vblank_work_flush_all().
>       drm/i915: Use the same vblank worker for atomic unpin
> 
> Mitul Golani (1):
>       drm/i915/display: Consider adjusted_pixel_rate to be u64
> 
> Ville Syrjälä (28):
>       drm/i915: Use REG_BIT() for bdw+ pipe interrupts
>       drm/i915: Document bdw+ pipe interrupt bits
>       drm/i915: Sort bdw+ pipe interrupt bits
>       drm/i915: Extend GEN9_PIPE_PLANE_FLIP_DONE() to cover all universal planes
>       drm/i915: Nuke the intermediate pipe fault bitmasks
>       drm/i915: Enable pipeDMC fault interrupts on tgl+
>       drm/i915: Enable plane/pipeDMC ATS fault interrupts on mtl
>       drm/i915: Extract intel_crtc_arm_vblank_event()
>       drm/i915: Add async flip tracepoint
>       drm/i915: Add flip done tracepoint
>       drm/i915: Introduce intel_mode_vdisplay()
>       drm/i915: Pass the whole atomic state to intel_color_prepare_commit()
>       drm/i915/dsb: Plumb the whole atomic state into intel_dsb_prepare()
>       drm/i915/dsb: Convert the DSB code to use intel_display rather than i915
>       drm/i915/dsb: Add i915.enable_dsb module parameter
>       drm/i915: Drop useless intel_dsb.h include
>       drm/i915/dsb: Document that the ATS fault bits are for mtl+
>       drm: Rename drm_plane_check_pixel_format() to drm_plane_has_format()
>       drm: Export drm_plane_has_format()
>       drm/i915: Introduce the plane->min_alignment() vfunc
>       drm/i915: Introduce fb->min_alignment
>       drm/i915: Split cursor alignment to per-platform vfuncs
>       drm/i915: Split pre-skl platforms out from intel_surf_alignment()
>       drm/i915: Move intel_surf_alignment() into skl_univerals_plane.c
>       drm/i915: Update plane alignment requirements for TGL+
>       drm/i915: Nuke the TGL+ chroma plane tile row alignment stuff
>       drm/i915: Use vblank worker to unpin old legacy cursor fb safely
>       drm/i915/dsb: Try to document that DSB_STATUS bit 16 is level triggered
> 
>  drivers/gpu/drm/drm_atomic.c                       |   7 +-
>  drivers/gpu/drm/drm_crtc.c                         |   6 +-
>  drivers/gpu/drm/drm_crtc_internal.h                |   2 -
>  drivers/gpu/drm/drm_plane.c                        |  32 ++--
>  drivers/gpu/drm/drm_vblank_work.c                  |  22 +++
>  drivers/gpu/drm/i915/display/i9xx_plane.c          |  75 +++++++++-
>  drivers/gpu/drm/i915/display/intel_alpm.c          |   9 +-
>  drivers/gpu/drm/i915/display/intel_alpm.h          |   2 +-
>  drivers/gpu/drm/i915/display/intel_atomic_plane.c  |  35 ++++-
>  drivers/gpu/drm/i915/display/intel_atomic_plane.h  |   6 +
>  drivers/gpu/drm/i915/display/intel_color.c         |  13 +-
>  drivers/gpu/drm/i915/display/intel_color.h         |   3 +-
>  drivers/gpu/drm/i915/display/intel_crtc.c          |  59 ++++++--
>  drivers/gpu/drm/i915/display/intel_crtc.h          |   1 +
>  drivers/gpu/drm/i915/display/intel_cursor.c        |  64 +++++++-
>  drivers/gpu/drm/i915/display/intel_cursor.h        |   3 +
>  drivers/gpu/drm/i915/display/intel_cx0_phy.c       |  11 +-
>  drivers/gpu/drm/i915/display/intel_ddi.c           |  11 +-
>  drivers/gpu/drm/i915/display/intel_display.c       |  15 +-
>  drivers/gpu/drm/i915/display/intel_display_irq.c   |  50 ++++++-
>  .../gpu/drm/i915/display/intel_display_params.c    |   3 +
>  .../gpu/drm/i915/display/intel_display_params.h    |   1 +
>  drivers/gpu/drm/i915/display/intel_display_trace.h |  50 +++++++
>  drivers/gpu/drm/i915/display/intel_display_types.h |   8 +
>  drivers/gpu/drm/i915/display/intel_dpll_mgr.h      |   1 +
>  drivers/gpu/drm/i915/display/intel_dsb.c           |  66 ++++----
>  drivers/gpu/drm/i915/display/intel_dsb.h           |   4 +-
>  drivers/gpu/drm/i915/display/intel_dsb_regs.h      |   6 +-
>  drivers/gpu/drm/i915/display/intel_encoder.c       |  44 ++++++
>  drivers/gpu/drm/i915/display/intel_encoder.h       |   4 +
>  drivers/gpu/drm/i915/display/intel_fb.c            | 151 ++++---------------
>  drivers/gpu/drm/i915/display/intel_fb.h            |   3 -
>  drivers/gpu/drm/i915/display/intel_fb_pin.c        |  39 +++--
>  drivers/gpu/drm/i915/display/intel_fb_pin.h        |   3 +-
>  drivers/gpu/drm/i915/display/intel_fbdev.c         |   5 +-
>  drivers/gpu/drm/i915/display/intel_psr.c           | 166 +++++++++++++++++----
>  drivers/gpu/drm/i915/display/intel_sprite.c        |  26 ++++
>  drivers/gpu/drm/i915/display/intel_vblank.c        |  10 ++
>  drivers/gpu/drm/i915/display/intel_vblank.h        |   1 +
>  drivers/gpu/drm/i915/display/intel_vrr.c           |   2 +-
>  drivers/gpu/drm/i915/display/skl_universal_plane.c |  85 ++++++++++-
>  drivers/gpu/drm/i915/i915_driver.c                 |  51 +------
>  drivers/gpu/drm/i915/i915_reg.h                    |  80 +++++-----
>  drivers/gpu/drm/xe/display/xe_display.c            |  18 +--
>  drivers/gpu/drm/xe/display/xe_fb_pin.c             |   3 +-
>  drivers/gpu/drm/xe/display/xe_plane_initial.c      |   4 +-
>  include/drm/drm_plane.h                            |   2 +
>  include/drm/drm_vblank_work.h                      |   2 +
>  48 files changed, 873 insertions(+), 391 deletions(-)
> 
> -- 
> Jani Nikula, Intel
