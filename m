Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBDBFAE7161
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 23:12:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 594B710E14C;
	Tue, 24 Jun 2025 21:12:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bhnmC1Qy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA3B910E14B;
 Tue, 24 Jun 2025 21:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750799523; x=1782335523;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MmEvXRIbPTX7oS6JmY8wMSOhBNOK/ww/CUWFHaD2jCg=;
 b=bhnmC1QyEs6mNJNw5us+2K8u+YvzhtU+Pp434VOkBma7KAXtci+q7w35
 Eu0vqyZEja+fk+XMSU2itHZ3huRLOZ/Pya9Djwhi3S690Ku+uTtDPgSSe
 KIs7molIHH0Tye2yaTGgMX0/lo+Qt/UcKydwlCNJAdBq58PJXB6N+KYmY
 ft+r++Yrwez5my7XH7We0U9hXQxbraYbtnf5e/TS72jya2cVlwkcFuQm0
 KAlHEXBq/wiO1+AptTd5bHMttm+b/FdJy7AtmTwcsdxGHJaeAr+HrvQ6p
 CrjHT7l2RoUkiBG5JkB7c8Tx1f4hQuPFkOQn6Dk4eUv73okRoB9aGi5GQ w==;
X-CSE-ConnectionGUID: xpuDeVFzRKS3VkHtEJxk5Q==
X-CSE-MsgGUID: G+y8b89KQrS0mJ3WrIkTWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="53153690"
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; d="scan'208";a="53153690"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 14:12:02 -0700
X-CSE-ConnectionGUID: 6S598rb2RPefB4e33t40uw==
X-CSE-MsgGUID: Hr87KiIuQ+WVcXvl3O5MhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; d="scan'208";a="152546352"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 14:12:02 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 14:12:00 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 24 Jun 2025 14:12:00 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.53)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 14:11:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vNuJx8BG7+JEq13WKO8L7Oye1CS8jvSCoHvMOSqjlxKTiSr0Up5FdaFGTcFFhtNF+b1Y86cMLbHnFu8+6r0hGTCB9nEoUU6HRFk4bjC4MprWdvfYYOUg1i+csZ9sYiQaaatKNxEmnTknBv29VQEgeSk/XnhXddYgt8CCnbydaZ+vY26NLqu+XXS8dinVreAdjyHnT5AJ9HXLk6YMXAHGEjX86MV9d/AP/DK+Vpsh/YP9nBTqE9Z+etpKWqPjvUtXct0uoXQxPbGBHOPUo+8hKhrXdny5hGuObgf5eoKx/CZe7Nl+eA5DdH9PiAIKJPs8Kf/O6c2bVyurVP4+ZywsyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D9JwSM+cQR/dkcMiXJqZI5b7z0tFX4/ICpkrPseZDSE=;
 b=M7X/C4zg4ScvG7uROUyXdkkVwBEmdfKuhO5rQrknQVLV1qzh1ZfefRSBlT+C69HvgnQYGk1TCuSxiB+IgwQOiPyBvBsymiKxR5qqakCRhT2lE28Mm8BjhYMGFZsA17fG5Kcel9StATGxWqUUInGkYDVqM0KmoKzBFT/MwmZmgD19MZ45CW+lixxJJhP8DALupAPA+/iVgI7xfAOgejskUOMw4X3hWKKklLNt91s3N+Kf4c1BacJThXBc6NVGLe5vQwYsd9STWnje0tLImbE02yuGLCMK5o/qyyUiWqcFpNgkqntj0TbENgXWrA8m989lJpwdm30QcqFLlwjXEGCJyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH8PR11MB8037.namprd11.prod.outlook.com (2603:10b6:510:25d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Tue, 24 Jun
 2025 21:11:57 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8880.015; Tue, 24 Jun 2025
 21:11:57 +0000
Date: Tue, 24 Jun 2025 17:11:50 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Arnd Bergmann <arnd@kernel.org>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Nathan
 Chancellor" <nathan@kernel.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
 "Ashutosh Dixit" <ashutosh.dixit@intel.com>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>, Arnd Bergmann <arnd@arndb.de>, "Nick
 Desaulniers" <nick.desaulniers+lkml@gmail.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Matt Roper <matthew.d.roper@intel.com>, Ville
 =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, Nam Cao
 <namcao@linutronix.de>, <intel-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <llvm@lists.linux.dev>
Subject: Re: [PATCH] i915: fix build error some more
Message-ID: <aFsUllcRshBtV9xc@intel.com>
References: <20250620111824.3395007-1-arnd@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250620111824.3395007-1-arnd@kernel.org>
X-ClientProxiedBy: BY3PR05CA0040.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::15) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH8PR11MB8037:EE_
X-MS-Office365-Filtering-Correlation-Id: 57f14a00-8e68-4e1d-44be-08ddb363c06c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mlOkWFHQrDeHzqk0CakhlbOgCRjX6ShgNxtHofjRPTiNus35uOTrR9M9y8l7?=
 =?us-ascii?Q?T3QNWRrv3l6cbNSlLmhaLc46XMuKSYTE4luAq2IhrFCKCqd95iOz8Qg7tQuJ?=
 =?us-ascii?Q?4sqS2CGlHRPiRvXDUHmxs8BVtnCbs4HQ8orf5xNzvYDsZSTOA/l5dmiZxi/o?=
 =?us-ascii?Q?Idkv9iYIpbOO5MgQnMm/s9h4Y8NheGHEB1sv1xbyy6thpSOotKK06BMmUOA5?=
 =?us-ascii?Q?h/2IAAwydEr0qghEjZUrat42WvkTnMgbZ/fLbuJBElr0s9y5nNvqZyIMd2sZ?=
 =?us-ascii?Q?acorxQsJrZfs3E20MznKGQZGSIzKvaSORArN5Yokym5yKLkhBZuydNhq8mRy?=
 =?us-ascii?Q?l3RSh0PRsHWa+uH/qbFiYg+8zPZoGW46JKLOIjD8Skf/03M3Z+yx/jRD4bBu?=
 =?us-ascii?Q?OnOY4ijzvO7oCV0fNxJye4pj85FJlPqCcBnbGXBomEdiN3GFSPGR3vzSaPdv?=
 =?us-ascii?Q?5ss5KyYcp2ETDINvNKH42ZYS2c6FpqzEEG2aRyEUNBNb5JIt7rdvniuJTnm6?=
 =?us-ascii?Q?I3r5grO5dT/hBnuj7tziiHRVPDoQqAKH+IpFUbvTA+skPh/HIUoMzwMjt2FY?=
 =?us-ascii?Q?uh7zdsV1Mq2snusxXmTWVp0ced0voR6tUwnI7uvg0fQHJzm7vGd4hk2ubwfl?=
 =?us-ascii?Q?3AEZewvKe4paDwqs5f/lQRItkQjY4XGV1cgebtmJPEdc8dTTmFOjX6uzYQp4?=
 =?us-ascii?Q?W0HKPQwJN2M3TJuQ/yrtexM3QVfK2BrfB5FV/YDBN7mt7RWyY4kMdBrIFWl4?=
 =?us-ascii?Q?nGthY4pY7aKtrB7jwSfoIlEyeThtNGF93fHN452PP/L8E5jlqJNqLP122lPQ?=
 =?us-ascii?Q?PQg6SG/APxo2SYjDjnrmOE2zrGiIydIPyetvOXvAkDN9EpBOgAVAPJpjQL8L?=
 =?us-ascii?Q?ForxokuhV6KQp9KBrns6hnh/OyzCzeF+U8jL+r5MnJLp392GeABs4CPnwxMG?=
 =?us-ascii?Q?MIx0YwGptDMyYxmuu2KtjtSuK8TEqgwgvVhQfc7HFruCcI2cPsF0IBZj11Dq?=
 =?us-ascii?Q?N/b2Qg3j8SaXCRmbyJSVPA2O0yOnrTgiwLADkTUCoNMU4DOA6VmoyUQrX2M9?=
 =?us-ascii?Q?sqbHkr0xUi6g5bD8axJRQZ4Wv/Hel4rsDL+J0PEDUvUZY3Aiyulzi8yDMqxC?=
 =?us-ascii?Q?XTiyoT/Djn+Dx3Syb/o4Y9MipxAAqJIJ6dAZxXsm2NIKEJJqaiB/huHFLBRL?=
 =?us-ascii?Q?NhmNTU96x/64t7B7rH4/yk7Wl9Jc6cocXSk6DdY5dVIq1m9mjo9hpUmshrnw?=
 =?us-ascii?Q?Vt/hZbz1avUoV5fMT45odIyEfygl06ky8Lv1ZAyP7togQAp5nl0KLX/MQgy0?=
 =?us-ascii?Q?+9WdQWE8YHPTRH5R5tJrfmw5v4kBbRCqd24pDwa4Rl46YrxOTn114xKkT8jH?=
 =?us-ascii?Q?37kUUxN27vjETiyVCA031RPHNxNZnQbB4gbHS8o6lwckkbORlA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4zgNhYr8C7oGEzy5WOz1f6Mx8Boh3iXlU8wuignO4qXADIz/l2jZ5kgwNFr2?=
 =?us-ascii?Q?QsJIjcCc8TFj2yyn3cKprX2XeAh/a2eiGJ3cD7OSYESQtSXwoag8wdBuEY3P?=
 =?us-ascii?Q?kmfL/RTBJs52oXmdYEJjksictr0eqKts1gpHvLnCtYLHMopN1LaxayqmjUPm?=
 =?us-ascii?Q?zT73AyNGfG4BZQ8Ovat4lSJifiDbkPi6KVJ77bjiQnwN/MBsezvSdoA5BBAR?=
 =?us-ascii?Q?M7GaNUtNp0dTQ54Q7neeq8np65jJn3fMoJZr6OIa1c5BqfozdCRucLFJk9Ww?=
 =?us-ascii?Q?pWecaHalq1Qh8uBWPeH0xtfx2biPoEEPG3a7zHinRMZtPpSa46XJ9gCh3RIX?=
 =?us-ascii?Q?kSYiZt6b+Ac9JGAAAUhANGBRE69/+sFP1UFVEe/wttT0fPvQdzxQybE+e19V?=
 =?us-ascii?Q?zKwr1ozxurxFp2Q93qUvORPBbI/14TOyX3EaxiImAlRDXPGY0uEIm6zN3st7?=
 =?us-ascii?Q?aIS/dF7LhJKC2Z1e3ItLZrQgQbM44LyPyc+QEa0tDWxNLzkd+ipuvdRMot6F?=
 =?us-ascii?Q?eadXG0Hw06VTTcI0kBZuP+o+/SpwiftPzyODW+4fhW2mLrm1BkKmS38pXWAa?=
 =?us-ascii?Q?BuN4V9H8GqCBLlr7PLL8HXjLfGJpvo9BC4dV9U/ClHR6r+wW/4AavVnOIjSC?=
 =?us-ascii?Q?C4jbUnY7XYRX4NyqNj0ZDcd2i0fOr5VlDFtVMTKtYrkoojYRFEwKYbnQZPF0?=
 =?us-ascii?Q?2eHXem7FvgkZAe0cKN6JDe6tmjzcjoQSsW8bJV6gddwNp/gUAHQDW4jxdaxf?=
 =?us-ascii?Q?VKrLgDppZ1yXVgEiBp3Oc5ZWubHe5rjoCmlZmimciIx5AFDu8nUo/xbkVwlB?=
 =?us-ascii?Q?/t4gnLHNSiIMqzZdvkFIsWfQbBebA/5fvQHaq8EiW7XVbHU15VqgwCXTOeub?=
 =?us-ascii?Q?RFdxM618t2KJQCAhFbewPwiTzQv0DXOILnKJXb9fD8tY4G+WbRQU8Zzo9pTm?=
 =?us-ascii?Q?IGyD62nwuwEkK0jBSK4qic5wq0oEZeMPMyKrpUJCBdPLq3gQuoNxa+3DuIT9?=
 =?us-ascii?Q?YJSWU0TwPdBZndTfRdqavQh+dAIqFPPhfFCz490gIwVYXd/3Y7Z39HA0U3kb?=
 =?us-ascii?Q?zrftogXKfxYNQuxbbRid5s7ZnSgGs+DQVsIXXjYieMYfTUIGQB6iX8QwPud8?=
 =?us-ascii?Q?SQgtMwRP3xWSpp90lwEywi7Vw5jsCplp9IVgG0igLLwzZFL8gK9vqYoyc8fl?=
 =?us-ascii?Q?gEyZ42/9fSTzAKvKFA9rItDjTTSt/b5TQVBo94TYphnKbkte2Q1V4cNt7xaN?=
 =?us-ascii?Q?uy0C118aGo7oZpz9yDpgl/blzqN4cNgg1/XoJUXqRHa9zG+AsrDwGikjEftN?=
 =?us-ascii?Q?Pk/PkWwn72/Pgl+wWL/Lk3VQud6m45rEDUiB5TVY+vWqB+NA8wl0apF4m9Q7?=
 =?us-ascii?Q?e51tFl8TzJg71B3yIw76pstRH7y9WEPs8KbF2dgI2/Z444+goeuo3/IO/QMm?=
 =?us-ascii?Q?+wpL12LJs4GSK6eHebAEHCDSrB15UmREQuhHjbR7LObKjhj/pYbXdr2cKrwa?=
 =?us-ascii?Q?u7/k2lfi5aZj7U0ZmuERGxCJoVCnt/GcRv2bXQoYR6ZTlG6CXTJZcVNArJMR?=
 =?us-ascii?Q?elLKggCseOwiwAdu8xpPtEU/aBSmGv7bk6Nb0eqT04kEJoYmdS19w/9mKq4a?=
 =?us-ascii?Q?Wg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 57f14a00-8e68-4e1d-44be-08ddb363c06c
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 21:11:57.1116 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9HUX+xl62zIr9elL3J1mm5OFXWBm4cNXUtuwGFAwlwKeyByBJNqpMo1JUcaP1xbHqEHVZAEa+3s4a5qSAZFn1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8037
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

On Fri, Jun 20, 2025 at 01:18:18PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> An earlier patch fixed a build failure with clang, but I still see the
> same problem with some configurations using gcc:
> 
> drivers/gpu/drm/i915/i915_pmu.c: In function 'config_mask':
> include/linux/compiler_types.h:568:38: error: call to '__compiletime_assert_462' declared with attribute error: BUILD_BUG_ON failed: bit > BITS_PER_TYPE(typeof_member(struct i915_pmu, enable)) - 1
> drivers/gpu/drm/i915/i915_pmu.c:116:3: note: in expansion of macro 'BUILD_BUG_ON'
>   116 |   BUILD_BUG_ON(bit >
> 
> As I understand it, the problem is that the function is not always fully
> inlined, but the __builtin_constant_p() can still evaluate the argument
> as being constant.
> 
> Marking it as __always_inline so far works for me in all configurations.
> 
> Fixes: a7137b1825b5 ("drm/i915/pmu: Fix build error with GCOV and AutoFDO enabled")
> Fixes: a644fde77ff7 ("drm/i915/pmu: Change bitmask of enabled events to u32")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/i915/i915_pmu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
> index 990bfaba3ce4..5bc696bfbb0f 100644
> --- a/drivers/gpu/drm/i915/i915_pmu.c
> +++ b/drivers/gpu/drm/i915/i915_pmu.c
> @@ -108,7 +108,7 @@ static unsigned int config_bit(const u64 config)
>  		return other_bit(config);
>  }
>  
> -static u32 config_mask(const u64 config)
> +static __always_inline u32 config_mask(const u64 config)

hmm, it looks like the __builtin_constant_p() with BUILD_BUG_ON is a bit fragile
design down here. But this always_inline will enforce deterministic behavior
indeed.

So,
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

pushing to drm-intel-next right now as well...

>  {
>  	unsigned int bit = config_bit(config);
>  
> -- 
> 2.39.5
> 
