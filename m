Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB95796E836
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 05:27:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 188F810E969;
	Fri,  6 Sep 2024 03:27:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tcwbx8HT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17FEF10E967;
 Fri,  6 Sep 2024 03:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725593238; x=1757129238;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8jOdv9O0/zP208jtDpXo0G+lZ6wEYjnZ36+w/808At4=;
 b=Tcwbx8HT8FRpdWLLuPLeducaz4mTNlSSyFfugE3dQ0B8VP0d4I8/nVtg
 pHwkQAlir9NVtTOed4rSxZNQnBCRDAJf9Q26fuZAy8VxTwjDLDy4n5+J9
 sJQoem34Aji3OoXefpOIA7dYm5++bIhS1dDSXuSm7KfwcuJSX9jGEi7Zq
 YO7tcQ1nB2JtO/W3Kwp3z0uqd1Y0MN3oCNoB9k5lcNjXRUS1yZV6sZn0o
 z0neCHgpNpvyrR3/qUZEooTpsNNp5fyyriZwlbqJZeHs06mZf97qNRCGW
 pRbhYxLjBRB+XfZhS/YB3yKpSYYkM+GiTPHRBv/If0Oww6pp+9NsevOOu g==;
X-CSE-ConnectionGUID: feNv8RSIR3WqBlyEOW/Pzg==
X-CSE-MsgGUID: oEzrssnrTv6ScrA7HKg3CA==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="35695984"
X-IronPort-AV: E=Sophos;i="6.10,206,1719903600"; d="scan'208";a="35695984"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 20:27:18 -0700
X-CSE-ConnectionGUID: xCNxx+/bQgSGBSJqWyRoXA==
X-CSE-MsgGUID: UAxTkjvQRNCNy/ZUCH/b8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,206,1719903600"; d="scan'208";a="65817940"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Sep 2024 20:27:18 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Sep 2024 20:27:17 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Sep 2024 20:27:17 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 5 Sep 2024 20:27:17 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 5 Sep 2024 20:27:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bFQHD0KXVOZ32DTy+vXgGKnwTnwJ0/kID+GqdbVS9+ORjPlwtu6b4gSM5oit1GQ9pqge2FrsJHVP1h88E4fZbWJwXPbktdjLd9A/LYMaOlLtc87syh1xwgt6yDXZ9djE/ZtxuEkBdTrrbX0EIqpDjfcwyHw3GR6LeCO6YuyT8n4GqsWnuD9HYSg8SeV2fUKaBAn4zYtcH1Fo2Hdkn+62BIuXbqA4+HUBzuT8w3o30xDdeaJmTxNd9ticWrruERTftkNIi8qcY/G2z0w5N/NVB32/iFk73GlVWoz/WSU/QYB3oxzkKCmYY1sD6eshl27WgEVQSw17Q/vySiayUyT1tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EQLW4a4eyfXhTIGRgVYSPx31oPouL7nGr1Vt/Z5ipsg=;
 b=gERPcvzk+icNsYQCUFlqMfZr6kTdWQ+IDwhcr1X9s7aW9YPZf8UD06u0+0V+Pprnxdvdr201rra+hqycZ+oLFnEw7C6IvCs0D4NNhkbzKQZtBiH9UluAk8GixKqRfpeF5XX7QPbvrPtJrao4W6TS97iB9QPFQg0g3aESEcLbaEIgdxFgT4kxJ0oInjkpY8HEUKfp9N9V1Y3Nu5Azus6q/RK9V/+VGyA5sMivTUZ3bIe6Awuyf1YVcxnnxuW6Vc4dAvggV8ZEJNUL3G+TLad3KOAL9pqEH6LLEqB0cglTNGciyll8CrPBr1hXWr42LNy5nB/Eo0asonkA1DbYBso85Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB7510.namprd11.prod.outlook.com (2603:10b6:806:349::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Fri, 6 Sep
 2024 03:27:15 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7918.024; Fri, 6 Sep 2024
 03:27:15 +0000
Date: Thu, 5 Sep 2024 22:27:11 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
CC: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, DRM XE List
 <intel-xe@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the drm-xe tree with the drm-intel
 tree
Message-ID: <uw7zsh4pcsaxgektzf6ie2bqvn2ukfwtxf7onsw5eq6wysiq7h@vu2jei2cshvl>
References: <20240906131502.7a7d1962@canb.auug.org.au>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240906131502.7a7d1962@canb.auug.org.au>
X-ClientProxiedBy: MW4PR04CA0302.namprd04.prod.outlook.com
 (2603:10b6:303:82::7) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB7510:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b16f3ed-85d1-4a6a-311a-08dcce23cd95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TwvYHZvfcaT4LfNg12R7WssLCK4EFk/KZZRmCIyd+ZVcIbFjPgKKQzuSWf/p?=
 =?us-ascii?Q?qIlRvOmXEuQCUE46f4qVa3Zuu7MsMElWixqZlDd/qgCzkR0Sy42+1tRO3g8H?=
 =?us-ascii?Q?ZfRkxuZcp6i0LbZuK3xQEoKzXWxKu67sPN6nwr0N/sFxBi9AmHfMDBFLpQWx?=
 =?us-ascii?Q?KW+UALvcZ4fh9DdGQciOBgD1mkrF7qwIhpjN4G2LOdqCez550VDP3//jeQO5?=
 =?us-ascii?Q?5ZJKuHMh55MxjhCKYAgQPsKsu5H/lbtU/PsR9wB4t8hMpa6S8j0+HzJNc+IV?=
 =?us-ascii?Q?JYm/o5vdB7b4veM4bzYdefUvVGTolkZvVRw+L15lpvNwLScRv4eLMu8afHbA?=
 =?us-ascii?Q?czGkutGEEuCKEpQGa7iSxfPozg0piwAp3obDj13BlptMfCKxv/drQo5tFKS7?=
 =?us-ascii?Q?TZPV0nwmfhqZjNCMUTwK85PXSN+EYtgP6O9Ei3W28Vv3dc3QSbLwjnzDFFzS?=
 =?us-ascii?Q?9sEEKbI0fe4IZ7ePFzJO7ejG6yD1KKfLgaIrmonnI0Of8jAyLqsq9zqeQ0EC?=
 =?us-ascii?Q?YDrLt2dXjUYjH8QomV6jUT8inVRssj2gA4FKhOzo0ZLW2/W5vDa53qiESSCv?=
 =?us-ascii?Q?KhOxWx512szPrA6Oi6mbngB0NlUolpmy0Dw5ojVipIDwGIAGKDObUdq0YbQq?=
 =?us-ascii?Q?WUeSkBbDrVW9PRHpFTolI45Sinvzxzwr1qiyIauhYb7PzLw+3RXZRtLo7d3o?=
 =?us-ascii?Q?eBaKd3ZLtnjzD7SUpFNEEyiTgu8nnIzkstKvNLgsMbazVnnD3nd2C5Ppmyi2?=
 =?us-ascii?Q?IbXs4nu/mmOvsz0amTYv+q+rl34VMd25wlhcAo57Z5OGkFqJCrtrCH+pEeJl?=
 =?us-ascii?Q?DTqt7BJ26A3jlGaKgBv/O6bnxkRWRwcyifKKFUN+Rb5FHUprCGm6Tgfd2P7J?=
 =?us-ascii?Q?p1qwMN4A/2P2zcmVYby+BZcEtEvqJEtn4Oyce5fnCxPCFlgzaAmAuWDw6SXK?=
 =?us-ascii?Q?EyU6D9qFMabYuJnWbHjY2UMjL0EBUO7zw3de9Q04HMU+/Yl6PVPh7jO1xWx6?=
 =?us-ascii?Q?rmxJnLs9jwmOpvNpxMsKV4QUzGMYFSc8k99p5T6ciAXDY0c8FHyLu8xMRvh4?=
 =?us-ascii?Q?X2h79mej3KxwLra3YGz64K2Qr+/J0/zLkCQt/G12hZ2JsXT8ByYaB7b6STRM?=
 =?us-ascii?Q?USHsnop7mQgFa67ZPabOBna+DETstjQPfRSrOUei0rLD5Xk8f+QhS3fKdbYs?=
 =?us-ascii?Q?+uBszOKw9fmZeY2NcV7o+9RhBk4DFpjHU5Y0SH/1JuUugU9tAoac85OPhONg?=
 =?us-ascii?Q?F7rpd77dmR0/ipLilCcav4EuWZDVM+vcDFXIPGYHed0XxjrV6d+8i3TtuNMC?=
 =?us-ascii?Q?uJLyXrgyGxdDkjIT6w0mEXN+AsTaOKHEMA+2X04+ZLB+DQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5S1Rl94GF1YXrtb7Z5IrJJ9m+Llt+p5fSFRlRQkGIp/kesBOdj6aYI9lBfoi?=
 =?us-ascii?Q?KWeD6DTyI0dOkT59c7AWLsF3VM/jb5IYqdaDXvMhgfuIN7me86S81bc3/lHh?=
 =?us-ascii?Q?ABXRHKPuEgB7mncbtlcqjkv9EG3mpkGdXc8MgrMGNAstYdUc96Q14lP08xp1?=
 =?us-ascii?Q?AAl/wzhokRYm6T4zfJx32q8gXwyv/ETsO/xpDfGKxZ7HSxsn8PjqJFTVH5dV?=
 =?us-ascii?Q?zkWDbL3a0neZ6Myot/+7vqGEtEps3jfuy5uxsNHEX4zVtuJHmHkMM6XexYIm?=
 =?us-ascii?Q?8iGP9yC9R4s8A+mbKoIzDniWB8CPnnjfYw49no8yo7wafumJVPf4y/f2g4ZD?=
 =?us-ascii?Q?dcAeAKxONJAfBCmFX3NiwiTV68CxyXFD3mgP1UTYPYpHwymbxBYMd9oxcf9I?=
 =?us-ascii?Q?hpZ7B/5AdcpcQsdKIugx6dfNYyl1D2NCyIdwBDDbIU8J1GU1zsjLj3rSgQkB?=
 =?us-ascii?Q?gaMOtpimjajfEnQ7hOIr/5wIut28ofxo4s+rfCr3+IGaT0tdOA0qzEvAB88+?=
 =?us-ascii?Q?G6BJgxcRiiEuXkmZ6uAekEdxO5Ys8I94q5ldqyh90ULySoLeXzrJmV9smToe?=
 =?us-ascii?Q?xaFmgsK1EHoBlO7Fdi+tE8dcgmzm6VrJ0C/yNzv2qq5snqOBn2FWbmy4kJSd?=
 =?us-ascii?Q?OiCNnG4bBanWnUspLXIf4GGvvD/kl5aUBDYVrustijaVsd33LJh8EWXTnjH8?=
 =?us-ascii?Q?nM5goXthENH2vHQAraRL7TL9Y5wtDXZ4iRaz6Sg/FLteN3o981bQ1rtfkAnZ?=
 =?us-ascii?Q?dSC6tir9K55CoUk6T6NhpD4sXgXKf7emVY4bREEoJVwQAA/AaXPDM1fk9fO8?=
 =?us-ascii?Q?mPzEPe4oRvG+LE3YNuuMzeE/4gklAb8sbHlh27SKBp40AIly3Ae260CFbsRD?=
 =?us-ascii?Q?JpaJgmN4WZySTWzDwDRvYw53Xv49agJd96f0B2cSFs853lvc22hm7RLGyEVn?=
 =?us-ascii?Q?deqyJ5VMV8+818wgRTqc7pXyCvOhzFD3MjKpk3R9b7ecgsJSwJxFfL6fGGqP?=
 =?us-ascii?Q?4hXfDbASIryeGu0E7zskxbhd0KpaAAXyyTgJlZ8zoYvPUz0dgQ80FoIVN8nA?=
 =?us-ascii?Q?wXVNvT1DzP5ORyZjqgx8z4fPrlietBGh/4bIYY3K5JWPoOXsnemouXGRwv+I?=
 =?us-ascii?Q?nD1wMQ+dUZwcCL6QuDfb9l0KqjdrPX92blGsb8eTKDGOhTNP671RoZGg6ZgD?=
 =?us-ascii?Q?lEc3VFObdv62GNr3BRm7hxTjSO1OgmvX36q2sY0a2gx1fWGUwiNXCA9jv2AM?=
 =?us-ascii?Q?rAVy8ojeKXf2NRmS5aK7jJQVzhUaoHSKq4TngTRwrgvRcXLiQyw/3AbkghbH?=
 =?us-ascii?Q?KEdM+DPpVDqiya6ewliAp0v/zPVpc7/z+CDUGqy4Zw6cBnLg/ivMGME0i2EG?=
 =?us-ascii?Q?I8m33c+eSNW7dQyWUJSPJBUxsYwMC39htK3Bgwufd+0fkv5grd6YvYnZXWY6?=
 =?us-ascii?Q?ICBzFunMkR4GZzbk49Uw3Mp4vd9AGVgwBQJxuT5H1HTQGVJkYNwukyTS/Pae?=
 =?us-ascii?Q?nn4X+6NlbONPJY8NT/KdRmRo0BRMlXIe2hZKVLBZThN5ybU/lc8q7FIlPG/1?=
 =?us-ascii?Q?lpLc83GQqp2HgfAM9i/baGJ3e9ASml7c4ZQ4RTL645kh//JfQHL2SkU6TWHj?=
 =?us-ascii?Q?2A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b16f3ed-85d1-4a6a-311a-08dcce23cd95
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 03:27:14.9937 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QqS1Z5/k7HWfJz7VGBQjvAMzuSJPL+JK0JoEnDu0ffbS3GFTlyNf8yB6+rOds2piAX+U458jejHP5+NJV9MEgOAczOh7ideFMCpOj5U42po=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7510
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

On Fri, Sep 06, 2024 at 01:15:02PM GMT, Stephen Rothwell wrote:
>Hi all,
>
>Today's linux-next merge of the drm-xe tree got a conflict in:
>
>  drivers/gpu/drm/xe/display/xe_display.c
>
>between commit:
>
>  11d0613af7c5 ("drm/i915/display: include drm/drm_probe_helper.h where needed")
>
>from the drm-intel tree and commit:
>
>  87d8ecf01544 ("drm/xe: replace #include <drm/xe_drm.h> with <uapi/drm/xe_drm.h>")
>
>from the drm-xe tree.
>
>I fixed it up (see below) and can carry the fix as necessary. This

looks good, thanks

Lucas De Marchi

>is now fixed as far as linux-next is concerned, but any non trivial
>conflicts should be mentioned to your upstream maintainer when your tree
>is submitted for merging.  You may also want to consider cooperating
>with the maintainer of the conflicting tree to minimise any particularly
>complex conflicts.
>
>-- 
>Cheers,
>Stephen Rothwell
>
>diff --cc drivers/gpu/drm/xe/display/xe_display.c
>index 303d00b99a68,75736faf2a80..000000000000
>--- a/drivers/gpu/drm/xe/display/xe_display.c
>+++ b/drivers/gpu/drm/xe/display/xe_display.c
>@@@ -10,8 -10,7 +10,8 @@@
>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_managed.h>
> +#include <drm/drm_probe_helper.h>
>- #include <drm/xe_drm.h>
>+ #include <uapi/drm/xe_drm.h>
>
>  #include "soc/intel_dram.h"
>  #include "i915_drv.h"		/* FIXME: HAS_DISPLAY() depends on this */


