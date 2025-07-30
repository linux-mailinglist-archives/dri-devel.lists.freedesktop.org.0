Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D8BB15F30
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 13:21:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3308610E198;
	Wed, 30 Jul 2025 11:21:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GvvJkktv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC07F10E198
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 11:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753874484; x=1785410484;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=NQa+qn4dc1na81zP2f0WNrML6mvu/3UbgDkzbVzxI5k=;
 b=GvvJkktvEypPEwvF00EIFj70eo3DcTtZWkrKhPJaPPIelZMqXahl28Nk
 6P+fih5foCjQoBFo2jBYoh/NEKvTry9XJ6TGGETgIEGYKgaJhz3Q8WSEE
 1U0E9/Vkc7pJDrPzz01sbQGetwhMvNYm9MXM1b48WH1OVEsjK7sGe2h8L
 GgiJwA/IAxUu12/sG/nlq7hIlBqTydq4ebqEsSVIL743+6956FqrgkD2f
 jbw9zbrpYn4bWHNnMyKNvumPv9alxTTBGIfax6I59FI4ztPqnBnOS9qmA
 n89e0ksFsvzo8rDAnpKXVbDxiso4/ZDuVQVyGMZuocyUqLb8H3XGa5MDj g==;
X-CSE-ConnectionGUID: 8Mwuc7+gThGaEb3EYYgZkw==
X-CSE-MsgGUID: AZZ0Bky3TvasTHiAhFckAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="59997907"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="59997907"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 04:21:24 -0700
X-CSE-ConnectionGUID: /mlw4RqOTNGUgtQlbMDb9g==
X-CSE-MsgGUID: w/SQJkOhTueSyJOsYgpMSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="162681682"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 04:21:24 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 30 Jul 2025 04:21:23 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 30 Jul 2025 04:21:23 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.73) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 30 Jul 2025 04:21:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ofHOiAYA3IncSiMoYSbK4u9z5KkAovrNIzqTL19QgP1NfzcuR8S2xXMT5C59+LjRQXohWqm80GmY7pd+UGrKVoNjn4kPOco391ZNN+VNZC3lZDM6+gmXqCiZWYIrv/D2k6PMuDZ3p9MswvUbe/8+BN9BJJicC5SJooClY3xevg0CMhiCmXeKlF44QT1q8FkcdPDSzg79kwCJqidgCRISjQMzYu5MKeqRVfce1CqftwLx3fNQ7AQXVwwufD40lFC6D2coCmgHcGWGQVTJ7vGDTfe9JtWY5dHRQdoGy6K20VeVqlys3qfJYx+Mtxa6GkbAD7IMjbAtwAAeSi2PrBN17g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MkB01uvAjQOyh6DqVDemwwSFzblShdPs6au/2VGIwtQ=;
 b=RM/Wyhhle/fig7PSHJ2SLuRL53qP1iMdX4ZFxQ/+8Ej3dU8K/+w0olhGYmSFlxCS4DZee/aa7rp0L3M2cp3G5x3snQN3dyWuh23tUWGhIVmkHXkid4EoDs/Yv///2K5+3mp4I3Mw/OVGqshcrzUx4r18470cS7l2gjSu1lpGJfQc8y2R57ec+ukgH71Y8xXQwb+EjFsKaMQWN8u1Xz5Tdk6adQ9GOYM7lKn+vfIRvolewyT2am2GRrk2105MkiPc39wR3vrb/ZKVa2VzSF+E4cIxBmtY5Kv4K34yFvooA6QOhfeYvy5cfpgCn3dNNeIb4jIYh2I3DKVTQCFX34ilKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by SJ1PR11MB6201.namprd11.prod.outlook.com (2603:10b6:a03:45c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Wed, 30 Jul
 2025 11:21:21 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%5]) with mapi id 15.20.8989.010; Wed, 30 Jul 2025
 11:21:21 +0000
Date: Wed, 30 Jul 2025 14:21:15 +0300
From: Imre Deak <imre.deak@intel.com>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, "David
 Airlie" <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, Ville =?iso-8859-1?Q?Syrj=E4l=E4?=
 <ville.syrjala@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Alex Deucher <alexander.deucher@amd.com>
Subject: Re: [PATCH 2/3] drm/nouveau: Pass along the format info from
 .fb_create() to drm_helper_mode_fill_fb_struct()
Message-ID: <aIoAK3FcDAqTJgxO@ideak-desk>
References: <20250728101603.243788-1-imre.deak@intel.com>
 <20250728101603.243788-3-imre.deak@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250728101603.243788-3-imre.deak@intel.com>
X-ClientProxiedBy: LNXP123CA0019.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::31) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|SJ1PR11MB6201:EE_
X-MS-Office365-Filtering-Correlation-Id: f84fa9b4-b0da-432e-e63e-08ddcf5b3607
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|10070799003|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?z8JmRjON3BnEb9BWmZVuQL1bRfJ5TX26KSkjHZnlgiOpZAKr5Rbae1d65w?=
 =?iso-8859-1?Q?biolGILYsRI/ndLd9eB0JV5Q6l3QPXVUoEZxv1P8ndujHE8gs92Pg1HZ60?=
 =?iso-8859-1?Q?syCHvFfy9/h23V/GCyXOhvwLNjXNu9XbNFlRSc1jBmPNTpccs3ODgUI0bR?=
 =?iso-8859-1?Q?beqdBDkegJh+i0tgiFRkWbhf4T2Qqk4sxxqboJa0PkOpCMIcY/n9A8+d75?=
 =?iso-8859-1?Q?HfVXyCMtB2wC+wNXhpdA/Q5eAhxLti0G9E4SZnhrGkJwwI/feuBvS1YZJB?=
 =?iso-8859-1?Q?UVPv94dRdRpfQFm3+Uxys54TvJwKmY58D7/+eSUeXvzy+fD58Wn+A1KBl8?=
 =?iso-8859-1?Q?4S6kHVF72+McUOpdO/D1gtTgEmkl//KyOQqC6ZZOBKbvibAnS7NlT+Nmvn?=
 =?iso-8859-1?Q?AXy4N/ac8yLd1VoQ8TYnZNpKRLWmADv661V6zJmmAWTyEKOpHcS+62Eqg4?=
 =?iso-8859-1?Q?Grkhm8T1d2FT/WLGGKIAadIEQgHtOg4RPQXNvJtGznE0TVjLiVj/1BHyrn?=
 =?iso-8859-1?Q?aC0QQOd+Zxepa36vFRLq/hQgymA1oQ8WukchA/c1LkKGEPu2xoqoSiGTWm?=
 =?iso-8859-1?Q?eqCb9++qLBsGioODI+gFtmIIuKYd40tg1Ua+yr3za1UXJeIM3cuE9txBuH?=
 =?iso-8859-1?Q?NqiXWbKcnovios/wzeT1FaRWsfnb3o11bmgdx1ymwF8Xj0bQNb6XhzPSIL?=
 =?iso-8859-1?Q?DWRRnTgkYYr+4pZXmMb1QHXtXyCqGqbfoFCNmQlG1T8ECwsx+Lngk2vyCW?=
 =?iso-8859-1?Q?c/5QfNmKzd2UcoTWea9BiIZpZl2FbVD/O2Q+Zd3ZerOjY2vQYFfeda0hd8?=
 =?iso-8859-1?Q?e/4C4BmydRvR5uoyVAuP6tfFhBWFn0C1R6bEQ4AeJSmbAY61monrp+loWg?=
 =?iso-8859-1?Q?hCtvxM5um2JV3ghlGQKw8ZTjyszzJ26HZ3b1dlGxgFnjs7dxxUao6xgb55?=
 =?iso-8859-1?Q?hbWpslW+VjMVg1dNWnBuJS9HMPxJ3aT0LZtoYve4hvM3n3tPt1GFX0GM3P?=
 =?iso-8859-1?Q?pokH2FKw8oMq9aroSBQFrm7tK2nM8tvn/hXEil4cgoIya7olKXU7/Df2x7?=
 =?iso-8859-1?Q?VS6PyNnZPqY9rH070hf0H6R+RDcy8sx0Fzv9NbbWsfxxvTtyXTzDik72Pi?=
 =?iso-8859-1?Q?CpDfRVSsDft8xuDVf4Ys6JW/BKZcee7JkVFSpO7CV4XD8QWFbmmpVdKfYr?=
 =?iso-8859-1?Q?UQj+NqcQNTSJjadtpU57zE/PkdGjrCcNO3Pf8iURIb6XoJmJ0sr28IAeB5?=
 =?iso-8859-1?Q?5IRmnproWpNFfJWqskgCKDTI/uqoBoFBixrFiGgceosPJAbNYuHd0sp5nT?=
 =?iso-8859-1?Q?l3/oAqndYbGehdua/lys5GRJ+H46NSC+N3Z9VBEP+878kbd1IrtZ4xESth?=
 =?iso-8859-1?Q?FcgbYN5U8chm0gXENruESn48K6YPGXlTroYA5Mka+/nZ/jwV1vI9WTjU/f?=
 =?iso-8859-1?Q?T2+xq5LkUHhHsZpyGkWB3s2W4AmJ+WMuad134T4j3UyAgOBukKB8bvoIYS?=
 =?iso-8859-1?Q?Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(10070799003)(366016)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?9Y/GLAcxaVxt0RLXku3XmOCMi0mpnpG6HQIEY/lXE6FsQNpMK2OGoJlhX+?=
 =?iso-8859-1?Q?+vYQJgFSOOwA5WSRKUJvKHGe9Sehw+QC+2kmr0DUIeNHvxdVlM2BlRQsms?=
 =?iso-8859-1?Q?pCJP6yNB+tAePuN93tsevMKGxDap8S6aJBAeyl3deSu/rP9nghDWXTHRtz?=
 =?iso-8859-1?Q?V0Lp7u2Ar55N2N/jMr8QrJx+LD2vinNZYyKZ776AHEGudnhkhN3VsV/BlH?=
 =?iso-8859-1?Q?ClvgJQh6LqYP7GhZmG0/5FJPqQ1gtbxDThC9e2pht3UqcAA+jDONIqjoPg?=
 =?iso-8859-1?Q?VUoA1rqV7OjwiWfzLUmIMtKgS+OF7Y2nC5/FchNEyYs516vLZ/8swzLGBO?=
 =?iso-8859-1?Q?KjYO8YDa1MzY/UT08wy3TX62sDrLE5AC0y7FBtQ3NZc6YlQJYaS5XDmaGU?=
 =?iso-8859-1?Q?1r3SnnjTE1MtbKv8MmjQj0uh+yU7WBa52nddZ466ZM6LoQP1L4FOwNumT4?=
 =?iso-8859-1?Q?rLT7hSt/GY0ye+6AVR96j+KKx4/+86Z91YgcDnSAcf2+nkJzAVrvKcQUJY?=
 =?iso-8859-1?Q?VFL6ZhmtubIOlKbNYvRjbqYupG714A9fnhnfXbD/oyNtAibw50M9aNpUwL?=
 =?iso-8859-1?Q?K9ubdhL6tF5pMbPx85N8apF0/tnMWuSr9RSHSainNGb4lRezrqOI7kPy5s?=
 =?iso-8859-1?Q?z9ueR1txwQeGhJbG5filHzFLOEOG9yik//haivRzHX3Ozvf/NyzlIjt4Cu?=
 =?iso-8859-1?Q?SOlH4cZjFuE8mLrlSmNf1a7CIOKbAm45aVQZQNhejja+emEI/NPVVy3LFA?=
 =?iso-8859-1?Q?Bmxhv1BlyTEXY4dBbIJgob57kr7y6D3jB98wpuxwkikPU2dG6zAH3Lg3o8?=
 =?iso-8859-1?Q?/AtQKlr3PaWsc2FXwJr0vHB4cCp6Dj0yUH6GvKtjxF69422ilAvvmnMP5k?=
 =?iso-8859-1?Q?0FhRLUm88EXesc8fEkMp9NBVrnIMxqBffHnSQTXGu4D9Gy+TLcMUKg9lx5?=
 =?iso-8859-1?Q?ByxHHHZ9BcytzpwSqhLKurpXkF5SUapNasSJHfk5pDV91YbnuWcR/B5+r/?=
 =?iso-8859-1?Q?17tkoTgju5F49O15bZ1BAz9dSMsaRRF1Gbi/Xdr8KLsqMK+FfcrXQ/FwH0?=
 =?iso-8859-1?Q?j9ZR970r2An5r5Acs+bzuonWzl7XyBHj7RVnJv1AQN/uXfBRCqIeias+8L?=
 =?iso-8859-1?Q?BzAeK3zApE0XelnJgQcVfjuRiUxXyIo9Wt1R20rbeiTgRQvbSDYHcOHk64?=
 =?iso-8859-1?Q?MGFX2ioAAPve+4PVJz2W9CgFjgSVjhyPKI8yC1rd9W59OjoUJhvO4dNvmE?=
 =?iso-8859-1?Q?4mueF7NR6RuzdNrJz5pNFesQ3QIkRNkrqxUfatmnCbqr5HIMR9Yu4u/5Y6?=
 =?iso-8859-1?Q?fqFzvDRj6oSTUIZD6EA48Ihe/0Tvr4WGKhq0gFzGmXd4ETtHYBShTpvmfZ?=
 =?iso-8859-1?Q?mfsX1xgNtN7JCyOt0FL7Q6eBnB925ry2hAN59nM1V9J2nuQNHuO60JhOcb?=
 =?iso-8859-1?Q?hj02/nsxIO67bCLbBAo1J/SwdxGJXqah1osvTiUGysNeShdMaARVsptUns?=
 =?iso-8859-1?Q?GkkKfOJnvtmzbGuEU6gmioroxUEiTGFfbZlev5ZwwX8wDl3XnJAuZA4Dpp?=
 =?iso-8859-1?Q?US5FI7ifPSQHqa3KRUp+3nEGgYulJoMIspwZYmkr5VMzXPZgxhci6xZqNX?=
 =?iso-8859-1?Q?QstORkCLNYZYbVD8uv644eRhJHw1EAonOYz+NULm0eGFViSJ6WFIDGJ1+3?=
 =?iso-8859-1?Q?XZczoS7S9pvWtnnpJJ8f5AfmTneLH9TiDhDkSi3p?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f84fa9b4-b0da-432e-e63e-08ddcf5b3607
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2025 11:21:21.3597 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YiyDq/8m1ljZhXlBQuPcWcD2QQuNcNtLIIM9Rx4F9drsFOxUNBT71x/C3FOJS31XZeKpaJW7zgr2Vdl3/DG/qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6201
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

Hi Lyude, Danilo, Dave, Simona,

could you please ack this patch? Note that it fixes commit 41ab92d35ccd
("drm: Make passing of format info to drm_helper_mode_fill_fb_struct()
mandatory") which is already part of Dave's 6.17-rc1 pull request at:

https://lore.kernel.org/all/CAPM=9tzVm80-v6_5nt6kko3nR+aQLZ7R98i419FV8f4-ayQWUw@mail.gmail.com

Alex already acked the patchset, but patch 1 and 2 are still missing an
ack/reviewed-by from maintainers.

Thanks,
Imre

On Mon, Jul 28, 2025 at 01:16:02PM +0300, Imre Deak wrote:
> Plumb the format info from .fb_create() all the way to
> drm_helper_mode_fill_fb_struct() to avoid the redundant
> lookup.
> 
> The patch is based on the driver parts of the patchset at Link:
> below, which missed converting the nouveau driver.
> 
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Fixes: 41ab92d35ccd ("drm: Make passing of format info to drm_helper_mode_fill_fb_struct() mandatory")
> Link: https://lore.kernel.org/all/20250701090722.13645-1-ville.syrjala@linux.intel.com
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_display.c | 9 +++------
>  drivers/gpu/drm/nouveau/nouveau_display.h | 3 +++
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
> index e1e5421263103..805d0a87aa546 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_display.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_display.c
> @@ -253,6 +253,7 @@ nouveau_check_bl_size(struct nouveau_drm *drm, struct nouveau_bo *nvbo,
>  
>  int
>  nouveau_framebuffer_new(struct drm_device *dev,
> +			const struct drm_format_info *info,
>  			const struct drm_mode_fb_cmd2 *mode_cmd,
>  			struct drm_gem_object *gem,
>  			struct drm_framebuffer **pfb)
> @@ -260,7 +261,6 @@ nouveau_framebuffer_new(struct drm_device *dev,
>  	struct nouveau_drm *drm = nouveau_drm(dev);
>  	struct nouveau_bo *nvbo = nouveau_gem_object(gem);
>  	struct drm_framebuffer *fb;
> -	const struct drm_format_info *info;
>  	unsigned int height, i;
>  	uint32_t tile_mode;
>  	uint8_t kind;
> @@ -295,9 +295,6 @@ nouveau_framebuffer_new(struct drm_device *dev,
>  		kind = nvbo->kind;
>  	}
>  
> -	info = drm_get_format_info(dev, mode_cmd->pixel_format,
> -				   mode_cmd->modifier[0]);
> -
>  	for (i = 0; i < info->num_planes; i++) {
>  		height = drm_format_info_plane_height(info,
>  						      mode_cmd->height,
> @@ -321,7 +318,7 @@ nouveau_framebuffer_new(struct drm_device *dev,
>  	if (!(fb = *pfb = kzalloc(sizeof(*fb), GFP_KERNEL)))
>  		return -ENOMEM;
>  
> -	drm_helper_mode_fill_fb_struct(dev, fb, NULL, mode_cmd);
> +	drm_helper_mode_fill_fb_struct(dev, fb, info, mode_cmd);
>  	fb->obj[0] = gem;
>  
>  	ret = drm_framebuffer_init(dev, fb, &nouveau_framebuffer_funcs);
> @@ -344,7 +341,7 @@ nouveau_user_framebuffer_create(struct drm_device *dev,
>  	if (!gem)
>  		return ERR_PTR(-ENOENT);
>  
> -	ret = nouveau_framebuffer_new(dev, mode_cmd, gem, &fb);
> +	ret = nouveau_framebuffer_new(dev, info, mode_cmd, gem, &fb);
>  	if (ret == 0)
>  		return fb;
>  
> diff --git a/drivers/gpu/drm/nouveau/nouveau_display.h b/drivers/gpu/drm/nouveau/nouveau_display.h
> index e45f211501f61..470e0910d4845 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_display.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_display.h
> @@ -8,8 +8,11 @@
>  
>  #include <drm/drm_framebuffer.h>
>  
> +struct drm_format_info;
> +
>  int
>  nouveau_framebuffer_new(struct drm_device *dev,
> +			const struct drm_format_info *info,
>  			const struct drm_mode_fb_cmd2 *mode_cmd,
>  			struct drm_gem_object *gem,
>  			struct drm_framebuffer **pfb);
> -- 
> 2.49.1
> 
