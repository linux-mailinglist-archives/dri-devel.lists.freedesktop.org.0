Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3E7B006EF
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 17:34:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A571810E90F;
	Thu, 10 Jul 2025 15:34:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R1pyyJiR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5971410E90F;
 Thu, 10 Jul 2025 15:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752161694; x=1783697694;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ufZxmnbW+8vewwcetELgklPCNYK8nFFUNz5ZqOiAeJI=;
 b=R1pyyJiRdCtMDJPd1iRYIAB6RSvt+hGqHUHMbgkTcOtRN6PwvadGOL68
 Kb7dQBWqbDoBHhw4FMxfq7uTGtED7aV8SYzHINbDjlPwP9n0BXc0CsUUm
 IwhPfsuoxAtF14AxqUZDz4106VDz5SBOSykUVWncTDK58/jeaodyc3MQ3
 s1A2FMXaUlJDPRHkkOVt1d+oyKTYZwYvlZdUFR2hgIuhU+DvjzFxsDYsa
 e1nLU7S0QATftLtQPoPuZBzDQus+7+GSTLGi3mhU/9hrt1hGYtPgeVBzC
 pp1+BfSyAEZwmJ1ZhmIgi/XtebbiJWcZl6V66Vtzic0UmMCNOQGAndgeH Q==;
X-CSE-ConnectionGUID: HGbDASHpT/OxkzCqIVRlEA==
X-CSE-MsgGUID: wbrlQwx9Tq66KkbLsvZoJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="72032579"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="72032579"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 08:34:54 -0700
X-CSE-ConnectionGUID: XK++EeloTOaD0EDHWZQEpg==
X-CSE-MsgGUID: HreAase0STakXcU/cPCEfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="160146109"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 08:34:53 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 08:34:52 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 10 Jul 2025 08:34:52 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.52) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 08:34:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XgfLjVipWsG7LsFTyu5wwlvPo6sjeR0FI8XSUrdv5X1+A97ppfh8okeAwaAQtz9vRMk/oDuJIMiHlPxDWB6gcsdvapvOgQBdsR5Jq/SRQ1uosp8sZ51DmzbiXUX4+pTljCL2wD/L97n9WhX0V6Y9eE/mF5GaUB5DB4ciBPKvsI/Y0Vbyh3yJ6F8rsAuWPG1YISnkueejqPm86CIhvME+h04xrmBA5C6ZF2BFCGQfj2IoD5mrVw4xiJc4V7PwZ6ykaWyaQzMKX4J/OpVVhiOO61HP1LXrcuPd+ak8fviyQ5Uj0HanBJk1tbAHJ4C3psZF9ZiRLdYsLPzRIfC0daxYpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VGvCesLzR3jsW+H6MEyjKav0vrgQpt0fk5f4RZ2wM54=;
 b=inUTSQhJJmmm0yAIfvmPiWkA4V5kiC4tx1avMSd6iWJYU0dmShBSW6btH4pD2x+NMaP8IqJJ2w+VmOJn45mu8bM+cOYxGUbEQezrt/6BWgmgN6oQgCM772EUwVEfWFOKjoqbBXdihqtlmt3QZTSOgtSPufCxBqahTnsSdy44EyAiCovW5KC5ZQfSxwVpwjmHcDPgPgaKndojrHnwiIbg/uVDY7tpYNCtDKW+/ojT4UITy3FMQaOy6p86Cowip53qTtxwZGWIUjg8natQtmszMscfOZTlplGSI8v861Xy5p6VT176GYYx3WG09h/P0xTO7OxI7RtGVyJmXlt3JovGYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SA2PR11MB4811.namprd11.prod.outlook.com (2603:10b6:806:11d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.29; Thu, 10 Jul
 2025 15:34:49 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8901.024; Thu, 10 Jul 2025
 15:34:49 +0000
Date: Thu, 10 Jul 2025 11:34:45 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Hans de Goede <hansg@kernel.org>
CC: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH resend] drm/i915/bios: Apply vlv_fixup_mipi_sequences()
 to v2 mipi-sequences too
Message-ID: <aG_dlWJO-3YwXeub@intel.com>
References: <20250703143824.7121-1-hansg@kernel.org>
 <aGetkP3IZ0FYHzAz@intel.com>
 <c2b14619-c981-4caf-a295-2571506cc955@kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c2b14619-c981-4caf-a295-2571506cc955@kernel.org>
X-ClientProxiedBy: SJ0PR03CA0273.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::8) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SA2PR11MB4811:EE_
X-MS-Office365-Filtering-Correlation-Id: abb64cc2-9fc8-48c4-6c14-08ddbfc74ea8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?D+kIr8z6nBd/j2k9z0XsU3g3IOV8vNfBHg7CkpFjS6LvSgtL2iLksnFiVr?=
 =?iso-8859-1?Q?6e3llBn18TB0deefnqBDI3hWtYsNB4FrCSdJiPvTHVRl/xJnrP8KLzeFgL?=
 =?iso-8859-1?Q?DmiYOrohz7zk+wog8CEbxlyKx/i9F+yb/gNBAfdmhUSYbpoAD08zBcW6tY?=
 =?iso-8859-1?Q?yq7lyjyalUR3sU0WxarQhYrZ2+RLAeGwEpWPZiMbUZIYGdOdNIozr1+Fvw?=
 =?iso-8859-1?Q?WvBvOYY7gpNddwNmYOwnivMUQISOoslhK222wqIfKki5QjxaMWyOH9qFLs?=
 =?iso-8859-1?Q?wsnHR6fiKUE/gVp2H2CljFwFPFrDRaBHYy52wkq+q5AAibguFO1PusAqEp?=
 =?iso-8859-1?Q?Xba5/eGak2zqskZKj8OkBjXec1iKbjcdXSk8QvB0538A+1fqCaALqD0Szk?=
 =?iso-8859-1?Q?WT/06HmNTh3YNndbKnguEJyCoj42ymfk/AOPFzJECN6N3i1uF7lcjp/2OD?=
 =?iso-8859-1?Q?TLfvY0/ee5+IApXmePLG4Ob3fWstqRqMW4b7HnTbXu6lJaQbJ/bpbAaXiA?=
 =?iso-8859-1?Q?OPx9OErExRTC8LfmQRJjjE8GsS5oosDvtil1q+SIFjkmvpF0odyu/eNpha?=
 =?iso-8859-1?Q?yxT3xUFa3038Wm+wg6dFetD0Nsl7GHlS4uuDKx9RTd5ngTMbSlJoU4Plms?=
 =?iso-8859-1?Q?zem+COXlDQn3pMVbZpEzBfVhoVR67g8JHc0uXJy6yUWP28g/IyW4YaGw0L?=
 =?iso-8859-1?Q?mAX3Ztk7BuKuamhyoREezKHG/P4GoyaKe4ulYyxrecsv5vmtJQAo+K10Q5?=
 =?iso-8859-1?Q?CXji1J+L7CuYqkedB4BniHQrzqlHWFn7lMEYRMiiF2AQOpfyndqWy5i7Oe?=
 =?iso-8859-1?Q?TQEdLg9TDaTVpLi3J8sb7/fMlXHQbluLz559donov/2uHHLK/70bmcbLu3?=
 =?iso-8859-1?Q?CXvrf5/7Ce51ELKI8TVv/maRvgap/hAW4oloJBExFdlcB16wjPfsCIuFB1?=
 =?iso-8859-1?Q?WO+h07VqWQXsG6xpRXzskYvUlXWnNlmMiYlnykMUQ1YBZL3aCceoptIPZ+?=
 =?iso-8859-1?Q?er2NcjYqstop9zLSvFR6ZJpBLE4lG1poe5DJIe8jki/ZTnrnfSXVTa4uyi?=
 =?iso-8859-1?Q?uiq7kqUAz37en0aD+Nuabu5IYNYCesY9FPHPOd3VZYhahU9nEM/wWp9cBE?=
 =?iso-8859-1?Q?DW9OlcFVtDgqOODnVEtbSorATbELJbXUadak766wBPVAhOaud81qfb4M3m?=
 =?iso-8859-1?Q?AvvvrsgJjbwbzVeP68bl8GSkF7h2AdEXHxcl46KBPkHOTYnqhU0zgIkuPA?=
 =?iso-8859-1?Q?85PufRYte562BWxHKUK0Q1DX1jGxlOrEz0SHYLsS31tPx/+HK+MvUVaPoa?=
 =?iso-8859-1?Q?qetm2xqBvQiwH38aAH2zah67LQufdpnLbtV03vqMgsp+lRluCrqpM6/1ib?=
 =?iso-8859-1?Q?PQH49Wl2jzNiplob9TQzrH/Px5Dh5BCOxzLqEqvMcawYLXvzI2ogU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?dELQ0JBoCrpH/3b4cA1zLSXWnwMQxJEnFXoKoUxMIj2WjDH4uXyz+PQBDE?=
 =?iso-8859-1?Q?vZU9TtXSp19bpfniOJ7RsF4inIT75JKREeAiiSGtjdevI+FXbu5MD4PY5o?=
 =?iso-8859-1?Q?g8JRzBMUsAj/r7nOp490c3K5Uw6JZPMxZW+VE+EB8ZQIsdbj1lQ5N24/1X?=
 =?iso-8859-1?Q?1R2m+73XgTwmqbN4DDmVB1jJ09oIl+YRXcU9vJ1xixRwsaQsgpOOuzQGUB?=
 =?iso-8859-1?Q?cUKR9ni+/MZdCZS1hIJFVfFsHPI/2Nz6zGYrutmLK/+Uh4nnDuEN2gfCBe?=
 =?iso-8859-1?Q?2TYbjqLlzPgdj8/Ocn1rqzVmTjVCicu544908Jl+qhCZ9G/O5NN67QZSVZ?=
 =?iso-8859-1?Q?fv/l6QdgSlrTYtFGNLRp9gBqaDzw77q9qGEml22rhZCMWHFcV9Z9cSU4lB?=
 =?iso-8859-1?Q?P/yqLL7PT0m/HB1tNyNtLZsv3XqgwC7NSIiuemPUjxyqCaAH5GEr63V5Pg?=
 =?iso-8859-1?Q?Z1t6pCQWfYcniJTo2fwQzyQEToD3IJC4XSN+APlHMU3SptLHCmn3hkBSKt?=
 =?iso-8859-1?Q?9gySpjPPdHXwbEkklMVKIKytn5HQVGp2Tv1nUB3jO6Ti9VmoJjrd6YYapV?=
 =?iso-8859-1?Q?AOsmQa2r0D1oUY7UTt2chCxwHCBk1QFdQ95f5ktK4+GPJQV7t9izC4ivMR?=
 =?iso-8859-1?Q?GAGb8sPQyH27NWIrQq3slSdcdU09c6XsVQkBdi8SHozuy+GBwRGdnLIUdJ?=
 =?iso-8859-1?Q?WOh/Efgva+zd7+QOvXKsvzFk06T2/cbgloSOshnHCuP8d2jwRwdHI/kRxp?=
 =?iso-8859-1?Q?b6FwpJFEx2VIhI7G3xwpokEZ8HmdU7mN5MwNG/6NfrbkG/DKzUC4VP3BMM?=
 =?iso-8859-1?Q?BF+k+Rxpjzg0L64UbFVvwgAXtkTl4HOZ9ilZZxIhq9rFUYUkiwqa/2S7dV?=
 =?iso-8859-1?Q?3CV9vrwQCqDRJ7wNw9WkblhkTjtJDpBz1sl/imKCMxwikWShsOX037o9Ut?=
 =?iso-8859-1?Q?UwJgF8mkeD8QXD7o5HnKQy/dUH1uM1dl52SHSRP8OA7BoCn1DH2O0AFTT+?=
 =?iso-8859-1?Q?sDyrM/bfL2xIAOG4yqPIAvAl4IqZTeLNXT+5CfPjHUV7aqXYMfo81J80HS?=
 =?iso-8859-1?Q?aa17/vU+oO5DR1OGF92Vdf4LOayFsyIbQw1J8Ee026kPWu13M8D/ECxgLc?=
 =?iso-8859-1?Q?u1hFYErPcGzGktzHvdgqOqI2ylHt3sTjiV1+bgV09F8WuCfWsBGdOI/gAt?=
 =?iso-8859-1?Q?N0tAldraVk1E9c5/XX4xn5+8KlBvdFkXDwLtCzWCeIXe648aWZmYU9J0O/?=
 =?iso-8859-1?Q?hJPN1fR3q82zrqePUlUfQTwjr5jqjXWZRQYzTZ4fnqRPOob7BzfC0OfdmO?=
 =?iso-8859-1?Q?/sItzs5ws9mYD5PmG6xR9Ek96Ntz8IOlX1WFAaBEFqpMYJPPnOFZ4C18u/?=
 =?iso-8859-1?Q?7qmrmnzrVvYRqn8uZRH+PSQ17NogiyIkjkHP/My78CUSQ6Cw4y/MLvirOv?=
 =?iso-8859-1?Q?25QsQ5cNMWZVufg6WuFk8v1bko3ibTlT6hOPp3k+jHA7LHyTIx73t2MBOD?=
 =?iso-8859-1?Q?wltKy+8PrIw4jsn9PkX9TA0MYKg8UVqWCGG6H+o/m9zNgft512G//j0S4c?=
 =?iso-8859-1?Q?G7idQVelmVB3NJkidPDeS1VHEJgD6Xt/G+9a+9GyC/ZCFxFfRSQ0X+WZTJ?=
 =?iso-8859-1?Q?6QSD9MxsGPI9Tg0w3PoOHYFMXuFLfcy7XNBR2Bj7OkGOa+r8DhZdSS9A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: abb64cc2-9fc8-48c4-6c14-08ddbfc74ea8
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 15:34:49.7983 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bJW3A24gGMdGJrhrZr6i4CoUvZspOdmAKwrc3ID3ke44C2XalmhzZFHAr1eYG6DY4KdZOgfTyydqg0o392ubGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4811
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

On Mon, Jul 07, 2025 at 11:10:59PM +0200, Hans de Goede wrote:
> Hi Ville,
> 
> On 4-Jul-25 12:31 PM, Ville Syrjälä wrote:
> > On Thu, Jul 03, 2025 at 04:38:24PM +0200, Hans de Goede wrote:
> >> From: Hans de Goede <hdegoede@redhat.com>
> >>
> >> It turns out that the fixup from vlv_fixup_mipi_sequences() is necessary
> >> for some DSI panel's with version 2 mipi-sequences too.
> >>
> >> Specifically the Acer Iconia One 8 A1-840 (not to be confused with the
> >> A1-840FHD which is different) has the following sequences:
> >>
> >> BDB block 53 (1284 bytes) - MIPI sequence block:
> >> 	Sequence block version v2
> >> 	Panel 0 *
> >>
> >> Sequence 2 - MIPI_SEQ_INIT_OTP
> >> 	GPIO index 9, source 0, set 0 (0x00)
> >> 	Delay: 50000 us
> >> 	GPIO index 9, source 0, set 1 (0x01)
> >> 	Delay: 6000 us
> >> 	GPIO index 9, source 0, set 0 (0x00)
> >> 	Delay: 6000 us
> >> 	GPIO index 9, source 0, set 1 (0x01)
> >> 	Delay: 25000 us
> >> 	Send DCS: Port A, VC 0, LP, Type 39, Length 5, Data ff aa 55 a5 80
> >> 	Send DCS: Port A, VC 0, LP, Type 39, Length 3, Data 6f 11 00
> >> 	...
> >> 	Send DCS: Port A, VC 0, LP, Type 05, Length 1, Data 29
> >> 	Delay: 120000 us
> >>
> >> Sequence 4 - MIPI_SEQ_DISPLAY_OFF
> >> 	Send DCS: Port A, VC 0, LP, Type 05, Length 1, Data 28
> >> 	Delay: 105000 us
> >> 	Send DCS: Port A, VC 0, LP, Type 05, Length 2, Data 10 00
> >> 	Delay: 10000 us
> >>
> >> Sequence 5 - MIPI_SEQ_ASSERT_RESET
> >> 	Delay: 10000 us
> >> 	GPIO index 9, source 0, set 0 (0x00)
> >>
> >> Notice how there is no MIPI_SEQ_DEASSERT_RESET, instead the deassert
> >> is done at the beginning of MIPI_SEQ_INIT_OTP, which is exactly what
> >> the fixup from vlv_fixup_mipi_sequences() fixes up.
> >>
> >> Extend it to also apply to v2 sequences, this fixes the panel not working
> >> on the Acer Iconia One 8 A1-840.
> > 
> > Do we have the full VBT for this machine already in some bug? If not,
> > please file a new issue with the VBT attached for posterity.
> 
> I've filed: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14605
> with the VBT attached and I'll add a Closes: tag pointing to that
> to the patch while applying it to drm-intel-fixes.

Hi Hans,

Thank you so much for all the work here.

Just one thing here is that in drm-intel and drm-xe branches,
differently from drm-misc ones, we push to the -next variants, and
then the maintainers run cherry-pick rounds to propagate to the -fixes ones.

I have just moved it around with a force-push, pushed to drm-intel-next and
cherry-picked back.

Thank you,
Rodrigo.

> 
> Regards,
> 
> Hans
> 
> 
> 
> > 
> >>
> >> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> >> ---
> >>  drivers/gpu/drm/i915/display/intel_bios.c | 8 ++++----
> >>  1 file changed, 4 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
> >> index ba7b8938b17c..166ee11831ab 100644
> >> --- a/drivers/gpu/drm/i915/display/intel_bios.c
> >> +++ b/drivers/gpu/drm/i915/display/intel_bios.c
> >> @@ -1938,7 +1938,7 @@ static int get_init_otp_deassert_fragment_len(struct intel_display *display,
> >>  	int index, len;
> >>  
> >>  	if (drm_WARN_ON(display->drm,
> >> -			!data || panel->vbt.dsi.seq_version != 1))
> >> +			!data || panel->vbt.dsi.seq_version >= 3))
> >>  		return 0;
> >>  
> >>  	/* index = 1 to skip sequence byte */
> >> @@ -1961,7 +1961,7 @@ static int get_init_otp_deassert_fragment_len(struct intel_display *display,
> >>  }
> >>  
> >>  /*
> >> - * Some v1 VBT MIPI sequences do the deassert in the init OTP sequence.
> >> + * Some v1/v2 VBT MIPI sequences do the deassert in the init OTP sequence.
> >>   * The deassert must be done before calling intel_dsi_device_ready, so for
> >>   * these devices we split the init OTP sequence into a deassert sequence and
> >>   * the actual init OTP part.
> >> @@ -1972,9 +1972,9 @@ static void vlv_fixup_mipi_sequences(struct intel_display *display,
> >>  	u8 *init_otp;
> >>  	int len;
> >>  
> >> -	/* Limit this to v1 vid-mode sequences */
> >> +	/* Limit this to v1/v2 vid-mode sequences */
> >>  	if (panel->vbt.dsi.config->is_cmd_mode ||
> >> -	    panel->vbt.dsi.seq_version != 1)
> >> +	    panel->vbt.dsi.seq_version >= 3)
> >>  		return;
> >>  
> >>  	/* Only do this if there are otp and assert seqs and no deassert seq */
> >> -- 
> >> 2.49.0
> > 
> 
