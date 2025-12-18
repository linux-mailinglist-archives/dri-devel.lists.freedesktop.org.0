Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D22FCCBB48
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 13:01:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3272710EEB4;
	Thu, 18 Dec 2025 12:01:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gweqmroe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5B5610EEB4;
 Thu, 18 Dec 2025 12:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766059266; x=1797595266;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=uOmICw8FV3ANBcPhNzLl/0T6OerzPRwsFJM4ApbloVA=;
 b=gweqmroeQ6hx2P7scZotmO/wbSzRXD883Vub/CuE1Wm2P3LzFX02Ei8W
 4t9/lgwPqt3dvLsaO57gwEujW4dAETlvomifYmuCltVDbCnY60QUzNUo1
 Lh4mNlwM9LyQvT77xVZy2o7UBROTWiAGVFd6uR8lHMz3Cmj4fOoGxdx03
 1lNM+wmBrFHPgAYBF/7X6e2kytG/RWvLCUJ7tuw/EfbM1ss35vbf3QU7l
 mFEwUw/dpTqzmXeCG6SzEuYSJ9mqzP0zwLmLlJYABvNOKJUGlYNHaccs3
 pND79D7XK+r3dLGUjPoquQEEYJXs7naUYR91FSxZv2YGM1AyFX6fFfkx3 Q==;
X-CSE-ConnectionGUID: vXdr2gIaRWmkpsfEyx2boA==
X-CSE-MsgGUID: awMro1ftS2q8wbHdpIC6qA==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="79133969"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="79133969"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 04:01:05 -0800
X-CSE-ConnectionGUID: SLN+duhyQVC49bIVgvCclw==
X-CSE-MsgGUID: cOa/j4ERRZ6ZXy3SoA8zOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="197828109"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 04:01:06 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 04:01:04 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 18 Dec 2025 04:01:04 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.31) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 04:01:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W1ZEgykwRsuwQEbGFnPDXizGI0wRfvWUnNtqF4DACKDI8W8LVJWhgNy30hs4PiPgWvzWaYqVQwhOKIIJcT49R7Ky/54lQdjB0Wt947Htw5QKNu5/oD8FcdAV0OX/5eaHWCJtYJdzTdFWTa/6RZhooimlokAKOr8Foz/37HljnhC3zEn7L++NQjTG/MpsGAaJQNvMIcfaOgXS8hTLgYK5kCbs3YpvxWYqoIqKJPXFIbIePM5qC3ZoBJf6+dD81SOX/YZeN1elYG0YLneVq8lrEY1HrhlmVVQGsqw78bpzmQONd7yL++QqYSvMrgEdgShsFY0i3EsxXbIqFQFxbL5QIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E2tA1/uRr5IdpKp7St2qCtaIcAz2vxMJXonS8VrINj0=;
 b=PveKDLLGKlhc/+/O1w+RIBnlqGIBVAyX/KJzPj1AAtq9ov2XFDKs1mD0E+d4kbUz1tTfHaKoU+mt2LxrBpJITSmapt7f7nFBw3UuCs+0uxI1JYe5L7EtWtovoKredcAUPpbaMB3bEX/9yUkvorKxb/5H+WCkvRRiv0r7X4p50c+L70pwntSOOGViPHZECTToB6tqKeoOcN9vWWJNbpsHyc0dx7rh0LVLcoOyIJOEJVQbPlup8Dr7JYuSiWjNVWt4pbK9cgyT9XwoVVx+8p4yIqpiMfikZ92CTBvTZTTyQYf/GibOnbNXYAD9R6CsFYhBxHKazjD3v9QIuIGEBwdDxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by CY5PR11MB6365.namprd11.prod.outlook.com (2603:10b6:930:3b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Thu, 18 Dec
 2025 12:01:00 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%3]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 12:01:00 +0000
Date: Thu, 18 Dec 2025 14:00:39 +0200
From: Imre Deak <imre.deak@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 "Jani Nikula" <jani.nikula@intel.com>
CC: Ankit K Nautiyal <ankit.k.nautiyal@intel.com>, Luciano Coelho
 <luciano.coelho@intel.com>, Jouni Hogander <jouni.hogander@intel.com>, "Vinod
 Govindapillai" <vinod.govindapillai@intel.com>,
 <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 00/16] drm/i915/dp: Clean up link BW/DSC slice config
 computation (fixes)
Message-ID: <aUPs5_Qc9k-7Jesu@ideak-desk>
References: <20251215192357.172201-1-imre.deak@intel.com>
 <aUGW6XAOyXlhfy4H@ideak-desk>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aUGW6XAOyXlhfy4H@ideak-desk>
X-ClientProxiedBy: LO4P123CA0111.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::8) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|CY5PR11MB6365:EE_
X-MS-Office365-Filtering-Correlation-Id: c4932f8a-30f5-470b-5c97-08de3e2d1c46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|1800799024|10070799003|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?9LYik9LJiSoCSMDROrRgwVV/GSre73POes5g6VMG1a2qbuD8bKjkmviYkK?=
 =?iso-8859-1?Q?qLuztKlB97a0Awvi8T0d7bHXu4NJ6HvKWHym3YbP/cqDOtEz3iFo6P4358?=
 =?iso-8859-1?Q?3gYqBwRIkmy5n3ljsCdEvol0qdO42ORI639XeXvKgIfeaAG9D7lVgtjm6p?=
 =?iso-8859-1?Q?t0kGJaLK1nfQvxbeKvZ9UtZnJ/U9wI++uJbPGNQB7dCIjxSN4937wVKmBv?=
 =?iso-8859-1?Q?+dfoJP0801eQo7Rk8ghYLb91DqeZkUFYwZwhQUB/FUhch3Y+Fb1v2Wt60T?=
 =?iso-8859-1?Q?L2zVCl4sS6PqPStD2tEffSdy9v1munN+4nsadTM1T1NrobRLQWgUyg68eo?=
 =?iso-8859-1?Q?+RxXp49vUTpg9WzKMlzzOpaBiVg2CwdADNY265vHv0ZuKjN9SNMnEEH75p?=
 =?iso-8859-1?Q?dk+AVgto+mUrcEgzkvnRnBQ/ljaHRDSnjHIcNNcHV8SNmHiBlQbhPcL0Hp?=
 =?iso-8859-1?Q?Zy9l7DyYBArfUgQqSJlOhd1dWTzQAjSAYnpaQd/hnnJVXqvCQc3D285wl5?=
 =?iso-8859-1?Q?/AGEqsCd3nqkzK4fUUpix53gecDCl0Y7n44/Cev1F9edG+E3dC4J+iCjr4?=
 =?iso-8859-1?Q?v6tTXR8RO3LNrGDLR2tuDB35at2Vty3BgGLwHbnoZI4Ie8XH+HzCEr3F2m?=
 =?iso-8859-1?Q?ZSZa3szKsr/AUAQSrOM/GmMA7HMK3l9ofq7QnEEEMV9N/zwyIG0qTYw+/H?=
 =?iso-8859-1?Q?KQIYyvwsSQp1kkIdvONGIr54mWj/DZKhLeVlLhkneGbF+LpvUapH+gfCj1?=
 =?iso-8859-1?Q?eGm6g96C+ITukPojOpOODRAM4UK72maWmVVfn8C1ubvy2G6nBImMt0epV/?=
 =?iso-8859-1?Q?Vtc0ZxOyItkBE/xrZWtgJhsfNjN3KwKI33kmDFtBlPbJ0XbkT4gCB4O8OY?=
 =?iso-8859-1?Q?ZXEzbm8KP302Vck7JZRt428CjMWkdyRnUdFfWcYRQw+elrOoeCRtJP/9xN?=
 =?iso-8859-1?Q?BaPD0fz18RL5N27UBV7t87rUVJT3SiDmgFKua+uboeUS+/Ge8Bn+hkaIU5?=
 =?iso-8859-1?Q?ljICWr+lT7HV6LjqYqK0o1u3XGZ10TSRzv7KHLofG8zaL93SlCcS73IcY0?=
 =?iso-8859-1?Q?PBGn1apWYFZzW6u+qGZlUr0DIqO6w3BHKTGlNQhtkLXBm9oYGJ2ksc1aD6?=
 =?iso-8859-1?Q?XK0ZgF1g5q7IQnJYYmnwKtSbwD7clivKOp2sC0ZKdh0tuWq9jo42tv2AlN?=
 =?iso-8859-1?Q?lnfFI2M4zRdUjMUKnlaH4E9QinHo+qcK3dQeZu1iisAwknGKFdsad5OVsE?=
 =?iso-8859-1?Q?E7XSXfIGiyjXzIZOiUWJQR/PRXUG1H/rdBd4GbYy+079B3EJSgsKDKfegC?=
 =?iso-8859-1?Q?8oVHdaImpYLm4Fs8n2xpdKqgtOOgDsq1DobGyCTXmrK9lm/kVC0/zpXAG5?=
 =?iso-8859-1?Q?HxVzfJoDouH5JhXcVZvsyIF4v3nYD2bYKlB3BIDmuL93WkNIq0kEsZyrkE?=
 =?iso-8859-1?Q?Ua7NpKaS7oFN8Wvl3XGWnKxtZki9XVpcxf8Pe0WSP7Jt3YurEUTa+hEsVv?=
 =?iso-8859-1?Q?9PCYoqA3Oe1jvnEm9Qy5ONlNL0nqdqHNG2hJHgEjlo5A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(10070799003)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?+Gss5+PZLQO4yn1U4Mt946gSKDFkGljTu8IW/k7TzSev780YFipwagzdwl?=
 =?iso-8859-1?Q?2ngH+rChxE/5QKgUbYtfM4bqXQyBwjXqezB+YsIo7/1dKfJ9b46M9g1SJh?=
 =?iso-8859-1?Q?xNHDzgsg3LL1fwmWDhJF5f5E2BQJMgickWzlp16R9YTrlhM9S/kCoaOITg?=
 =?iso-8859-1?Q?h2nDGOV6sqnH3jwvXPdkinqY1btGBY+ZES53Qkia5RGv8spLV+FrMrzi4t?=
 =?iso-8859-1?Q?NCI97/iLcD4+K3xf7lG1JrJBi2NOvTx+s1TIXImTxpcIulNkrrZ2zQOxKY?=
 =?iso-8859-1?Q?fEcPLkDHaZMWY5R+IBi4NjB2Pp+UqQRFa5VOgxM2A62tLH8sSb561cMBTA?=
 =?iso-8859-1?Q?TO+nbPOh1ikmAgwpQZxBpIlkwcMmc7SIC9AgVO4jY0EvtykejwQ3/jSoSC?=
 =?iso-8859-1?Q?hCVgV9d8V0nDqdI2tHhFHZZgzl++Z5q1a0CPLIiEwR50Epl8ahk+fkLPX4?=
 =?iso-8859-1?Q?HiL5KNuRIi/sOjAvm6oGNOg78XPX9wtcwdRc0eKfFu4Bc5QuEajdWdKmS/?=
 =?iso-8859-1?Q?Iy3Bzq/E+fa/z2/COPqQyoBukfYZgDX6f3IHc0txiEJ7cQqkLBjkyxsX9w?=
 =?iso-8859-1?Q?N1aa8wCwd7wwJKGh/4ghRp2lR8JhRHamPa8oXb9KguUkfk5dYTJo+c2/8l?=
 =?iso-8859-1?Q?JsZGqEV27zYWYeyYED688PioVxSlSaALtcB7OOYalUt3gSUDN2ATJMqoBT?=
 =?iso-8859-1?Q?XPt3WmLF/f1OsofdbWoyemFQXY9OFe6zvpsIr8izy4r0SLTk9SITSDNPwK?=
 =?iso-8859-1?Q?+YOFZMx7Iz3Y4UKa9ihcbAANza6lIedfElCdyAqzpXajaJCZ8bAHtTMvkL?=
 =?iso-8859-1?Q?iU7bIi1WttmTlV6AUXnlMTrzT/BqrEfT/uqrRqzD/Twah9iQSYImfZcNiT?=
 =?iso-8859-1?Q?S9SZII+vn+6CISkH1vQOLYzqOdg5YBas/irfPy/3GPfimY0CnJKExP9as4?=
 =?iso-8859-1?Q?p5F7TSy8WJyrqFp2oYBvlvA9aEAvgakDvwHgTeT2TmTLatDylqBwxhF7MZ?=
 =?iso-8859-1?Q?LtdGMpAHIWmUA+9hxsroOFVP81uffHbpikJQsj66I3nU9fEYFI8sbsgyaa?=
 =?iso-8859-1?Q?gOJ5kBjbI6bCYtLenbSxM19rGN5fMZjMLTA1ntGB35vd3OnXp8MskuCPGM?=
 =?iso-8859-1?Q?MhJRTs3qNML0Dm8+g2M4XZAsiaJmrxrRqzoZ6BshfVVuY4wko6q5BgFFe8?=
 =?iso-8859-1?Q?6LVOCfgp/NU7Zm7po6Z6nxOhRIbG6q9mn8SkWKIXH6hYNRpVS2DiUvSKgn?=
 =?iso-8859-1?Q?n9KT3+jZNBv3gzGCrYcHPs5/AtjE3UnAWRNEyCdDB0/cm8NvOd8f8oL7in?=
 =?iso-8859-1?Q?26oTw30q84/COIoZNsUGfRZo/lLeS6iHmmpqo/R7nTVS27QYIR3k8UK3lg?=
 =?iso-8859-1?Q?AMS39Mci8LeFFoKvZIhRomCUsxzPX/eS7+RsBhI3pxRwIJV37bUOcIlZ+1?=
 =?iso-8859-1?Q?sFQeuSqGxMKcfmkeHZvGflTkF1DZNHo/9XINOK583qNThuGYENZ5eQCsxN?=
 =?iso-8859-1?Q?OJHTIGaZxMcYw4x2K/b4eqPC0I8wmDWA2m0xK1JqK6v5/ACq92FQjG3FNr?=
 =?iso-8859-1?Q?0AR8foPjl9iSNgc+F2uwbVx4K3/1CUx6FRDsG2WwnpAalZsPW0cuUNEy98?=
 =?iso-8859-1?Q?A98Gpy0PR5aJVz/j1zevI/MF8gJY4P4glQmBEv3i7k/AS7EdMddQIwxbH9?=
 =?iso-8859-1?Q?mJ2VcdFgASwED/SiBs+eXAbQkn8GNIJLeE4gzws2?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c4932f8a-30f5-470b-5c97-08de3e2d1c46
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 12:01:00.6330 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MRyyub7KW5qdxYnafN7yZwyzOxOjOT91VU27beOaj7ekE3rZ1u8VmYD102caaD96eu6vdr8a3br8TtiZi9VZUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6365
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

Hi all,

On Tue, Dec 16, 2025 at 07:30:40PM +0200, Imre Deak wrote:
> Hi Thomas, Maarten, Maxime,
> 
> could you ack merging patch 1 and 2 in this patchset containing changes
> in drm_dp_helper.c via the Intel trees?

any objections to merge patch 1 and 2 via drm-intel? If not, could
someone ack it?

Thanks,
Imre

> They fix an issue in the i915/xe drivers' DP DSC slice-count handling
> and do not affect other drivers.
> 
> Thanks,
> Imre
> 
> On Mon, Dec 15, 2025 at 09:23:40PM +0200, Imre Deak wrote:
> > This is the first part of patchset [1] containing only the fixes for the
> > link BW and DSC slice computation. The remaining patches in [1] refactor
> > the link BW and DSC slice computation simplifying these, to be sent as a
> > follow-up to this patchset.
> > 
> > I moved patches 13-15 in [1] later in the patchset to be sent as part of
> > the follow-up, as these patches are not a dependency for the fixes in
> > this patchset.
> > 
> > [1] https://lore.kernel.org/all/20251127175023.1522538-1-imre.deak@intel.com
> > 
> > Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> > Cc: Luca Coelho <luciano.coelho@intel.com>
> > Cc: Jouni Högander <jouni.hogander@intel.com>
> > Cc: Vinod Govindapillai <vinod.govindapillai@intel.com>
> > 
> > Imre Deak (16):
> >   drm/dp: Parse all DSC slice count caps for eDP 1.5
> >   drm/dp: Add drm_dp_dsc_sink_slice_count_mask()
> >   drm/i915/dp: Fix DSC sink's slice count capability check
> >   drm/i915/dp: Return a fixed point BPP value from intel_dp_output_bpp()
> >   drm/i915/dp: Use a mode's crtc_clock vs. clock during state
> >     computation
> >   drm/i915/dp: Factor out intel_dp_link_bw_overhead()
> >   drm/i915/dp: Fix BW check in is_bw_sufficient_for_dsc_config()
> >   drm/i915/dp: Use the effective data rate for DP BW calculation
> >   drm/i915/dp: Use the effective data rate for DP compressed BW
> >     calculation
> >   drm/i915/dp: Account with MST, SSC BW overhead for uncompressed DP-MST
> >     stream BW
> >   drm/i915/dp: Account with DSC BW overhead for compressed DP-SST stream
> >     BW
> >   drm/i915/dp: Account with pipe joiner max compressed BPP limit for
> >     DP-MST and eDP
> >   drm/i915/dp: Fail state computation for invalid min/max link BPP
> >     values
> >   drm/i915/dp: Fail state computation for invalid max throughput BPP
> >     value
> >   drm/i915/dp: Fail state computation for invalid max sink compressed
> >     BPP value
> >   drm/i915/dp: Fail state computation for invalid DSC source input BPP
> >     values
> > 
> >  drivers/gpu/drm/display/drm_dp_helper.c       | 103 ++++++---
> >  drivers/gpu/drm/i915/display/intel_dp.c       | 211 ++++++++++++------
> >  drivers/gpu/drm/i915/display/intel_dp.h       |   9 +-
> >  .../drm/i915/display/intel_dp_link_training.c |   4 +-
> >  drivers/gpu/drm/i915/display/intel_dp_mst.c   |  33 ++-
> >  include/drm/display/drm_dp_helper.h           |   3 +
> >  6 files changed, 234 insertions(+), 129 deletions(-)
> > 
> > -- 
> > 2.49.1
> > 
