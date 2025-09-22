Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC4BB91EFC
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 17:31:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E45F10E4C5;
	Mon, 22 Sep 2025 15:31:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CC70xNUD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8A9F10E4BE;
 Mon, 22 Sep 2025 15:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758555064; x=1790091064;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=TboPqkU3caW+wgHK8SuTZY0NMxeC6H4z+wyZfvtE0lE=;
 b=CC70xNUDx46yj/xdRJW+S7+pIlgk4eE6jDFqCWsznWCrcv+Ig4v+X+sc
 JWZ9MbdHQZUpjuS/oXcePFKCWmDVvoZiqWjRjv8UemReoFJPzV+Tldd5c
 Jq2k0gSy1FBobuBVpQMdvC2gyhcU2BvGYEaWTA/+wMMfdQL/FFkqZNE3n
 tyY2Oi55+XSlsc6Ivjw3QH7LrUUhDQs4XXi1uUnaWSfauA0ULcPdOJarH
 E9Lq0ILDuo8XDG+9d2Ql4nBS6sAhxk4yd274xGkJxCMJZSfnvDHMrBzQx
 hARjRyC09cwGXnmhh4yEoV8YPiH4+07gLt2X/D8RAsUEuGA95GekGGX1G A==;
X-CSE-ConnectionGUID: sApAOSn+QE+yh5uXL+GoWw==
X-CSE-MsgGUID: CKIZIAeMRc2tQQLLRBZoOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="71925422"
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="71925422"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 08:31:03 -0700
X-CSE-ConnectionGUID: 57wmeo3wT++b2q4jzaC0yg==
X-CSE-MsgGUID: xsY0KpQERbukh4YotDBiRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="180906386"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 08:30:54 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 08:30:53 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 22 Sep 2025 08:30:53 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.61)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 08:30:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fBFi7UxaHJBCaRxCi9/b6USrUH60C3p086gmOZDXTf5lwf+ceB0sRuc3wDzGOsPKBmf+8S0nniV3QyFnRzOBZmj1mnHNhN16EtA/EvshWHpjD4TAcUbNou06a3VnhdTtGbETxc4eRHz+VnXQsxNg1+9wnJcBqEvK6+csFZK12JL83emk5CKtLGoYpGDsJrmBVaNq+Y/SeufkSdz7R2It7qYbba8RVkSgG15F7EXzbg5jEsPxEuLnwaX898WEX8I9TXGz8HXwDelBLh5lpDmo7b2uywnN1EYdsTsUoa1ZRkU/3NM+jyVEP55RPoCLoIiBwqLTN8QODenZ4VgROhVF2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3PdB+2qZhqKw1fVBwIDtrfPYsDdvTOMVFs5UA/gm1lo=;
 b=vFQCZtFUNnSdReB9RlnVmILgUsJq/ukVatMD90cTDXnky45qpwhP6dE4MJ8tZnGLVgSKAv46conC9QBpGXzDNuEEb42rpIuBYd4NKmYKRCXui6Frx0UzzoA7UhpCNsbB9ZusFQmgc+g4Yq8HY1nb5FNLVo0MBm78WmGGUk5fdkmwjdpWi8UjJPkB78GJDeJrTzIRCg4GDUTddzeC1KrmJGxjqgaP8hLt+Ltf7BUWGyNNG6wNKtAB4WWPkRX5t7YqWqP5xPRbk6DOZ2t/EFdYYOsZJYTpnSEL8WjpKUO9E5t7pqYVw0+KLTyGYTq8iWIhg468v2s/B3Cpo1cYNttPew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6467.namprd11.prod.outlook.com (2603:10b6:208:3a5::18)
 by CY8PR11MB7361.namprd11.prod.outlook.com (2603:10b6:930:84::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.18; Mon, 22 Sep
 2025 15:30:46 +0000
Received: from IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::af0a:68bb:7bbf:5a45]) by IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::af0a:68bb:7bbf:5a45%3]) with mapi id 15.20.9115.020; Mon, 22 Sep 2025
 15:30:46 +0000
From: "Garg, Nemesa" <nemesa.garg@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [RESEND 02/10] drm/i915/display: Introduce HAS_CASF for sharpness
 support
Thread-Topic: [RESEND 02/10] drm/i915/display: Introduce HAS_CASF for
 sharpness support
Thread-Index: AQHcKXMwc1S8ViZfgkmPgwLCfFenq7SfD/sAgAAbiACAACse0A==
Date: Mon, 22 Sep 2025 15:30:46 +0000
Message-ID: <IA1PR11MB646721F5B101A5B98D0D017DE312A@IA1PR11MB6467.namprd11.prod.outlook.com>
References: <20250919143418.3102605-1-nemesa.garg@intel.com>
 <20250919143418.3102605-3-nemesa.garg@intel.com>
 <fb4e8118c7e7cc0f566ed1e8ee09b4d58d801c73@intel.com>
 <293909a8-26f8-4513-abd4-97cf6f1052fe@intel.com>
In-Reply-To: <293909a8-26f8-4513-abd4-97cf6f1052fe@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6467:EE_|CY8PR11MB7361:EE_
x-ms-office365-filtering-correlation-id: 98b0c7f3-4a1b-4ad6-6f5c-08ddf9ed003f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?CeGl8McnrFqGBVZUh2CoyAwPIZeLQ/Vj3AHY9iJOjZGGbkpRRVIdkkRyWB5z?=
 =?us-ascii?Q?8q5MrGYNJh8Sn4afcDtO2k/4IWjto3DdbWTAOpaO+9mu7zLMN68iAlJ3P6o7?=
 =?us-ascii?Q?oya39rKFYP0w8OlybNA7RmXdGU3NJ3ry+4R08LCj+IMASdeR2jlauk+BF3ip?=
 =?us-ascii?Q?ncLJR7vipqLmOEIJW6ljInKVw/5Y2knGpX49XE+ifg4SQrl3S+wIxcSiWr+V?=
 =?us-ascii?Q?6vKyBvlOMdRYFGNya+8v/Ahlx6mrLvD3jd+PN4seOaCH637/eHit6XV42t7x?=
 =?us-ascii?Q?UzeaJ+quBRyB9S6l3B/SFhseZD94jE33O3F12grUPy9C/jc1bpYHWb1nyHbZ?=
 =?us-ascii?Q?mRBE/ZQBlIxLtcQ9A7LaCH3tFHOcCmHdUlFQmEdnRaVhs5Etg1huHajSJdv6?=
 =?us-ascii?Q?RbAAWyTkzA+4RKK561YWSWo7GUd6Ccp63Zsr49VcgAAoka/f/gg51fIsrvrM?=
 =?us-ascii?Q?5geqG+HWk0jzIrmL4oImz5PvWCBeM+1MvBKF/N6tU1qhWcsExaF7UFDbut8O?=
 =?us-ascii?Q?2RdDXJeUTzoFK7rsn4CqRxSoKtsSiMl44u/R01rFZlu+BBbU/xeMQxhYr5+4?=
 =?us-ascii?Q?kvRNQqoFV3ryFCWxN/wGMxK2dnI3USONt/phc8Py8pgZRFxAlYaUKfnKnoc2?=
 =?us-ascii?Q?4ufXUJkt4lZv5SYplbo0kcRbClgzVBA4A2s/KwBrPWx/nhgnhBySmzfRHx+R?=
 =?us-ascii?Q?40G2z89DLTAizVj3BwICSixSd7Y/ygJ6BmtjnNEnMubWfD+Wkmjecv12X3p6?=
 =?us-ascii?Q?qW7SMNOhdXnjgq84QKg7eGJtHSXZdAcQz+KNp+vQ+P7BNVGnBIiMi4ihCgpG?=
 =?us-ascii?Q?lJu65Sr191lLZRFri3wmDULL3zmjQvwcwtfN5HCeXNWNtM5oK1qXnJP7kL7M?=
 =?us-ascii?Q?a/Y2Ph+kDI1X9NzgpIzh6NReAeh2RYVheHQdajK1gHGUIW0fjbLT6yty2oWS?=
 =?us-ascii?Q?AjbfA3nVusT9gyzarn2TxKv3ARSwxSPcFlUesi/E524k4l8oABxLxwtzjoRV?=
 =?us-ascii?Q?qrKyCBPeF+cqQFUnLu5RDxmVxj4OfBRHGpB78jSQI9uYkFtRN9vaI+Srff8W?=
 =?us-ascii?Q?EV3zBUHkfoMdZ8m6ot1cxj/4xujK+iHHLAQzc+31c5M737ZHsqqXWgXQpWHr?=
 =?us-ascii?Q?5VrEBzOSZglChlrAYK1W5Rt0hC2xQEu20K9D5U9nGggJ9Owz68WislumjTN+?=
 =?us-ascii?Q?8fD7lpOKlq4GUaAmYRjJg3dFZNS0qQYTZz7hUoKgBb2vTIPcpelP9tt1yVgO?=
 =?us-ascii?Q?JamP7SG+eixhhBJ+QQHsUWqoNsiZF2dYA3iSSZm8OSFym2GIEgjg1b8AB6eZ?=
 =?us-ascii?Q?b3+alg847+3wFBXxWsoN8rFT0s01SzdmC/82oOjYk5Et49EkyTC1274Y8S5G?=
 =?us-ascii?Q?dj8g1kFfa19Fys2I1DXkBhC1pVVI8BABjuBaua/XcPs7oT11RjSGc1QUCYP/?=
 =?us-ascii?Q?vvhJWUDpLdU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6467.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?v42IkvFHLyHnf1noowWFTzBBEJLoEUqIWmzthzx0UzGNcKwDpBM75o8aoGx3?=
 =?us-ascii?Q?M0Ga+CLGuMK33NOmLtgcFUvp3YpNkL/xQ9XP6yhkk+K4MKzAzHceeqCRU5GY?=
 =?us-ascii?Q?AzD93co+oYcP3iXyWqt/mEwAtxFGMm21N+lzTtgLe10Pj6BscYcKvAY91OMt?=
 =?us-ascii?Q?+IiOnpidWWk6Are/gY5TPZZtbwySxInp8xGFLdm+GiJOxZs5Qmm6/CjsKOna?=
 =?us-ascii?Q?2o7qXcIeYPGaz7eK8WFSaFuczzcNrSqn82qtm8tvax+6ybeh6/i1uCDCRBxd?=
 =?us-ascii?Q?VIivxojqUoRD0mLI4rQkEvtsh92fx12tAG6kSPWXfhE8XBUfEC1uCq99wOq6?=
 =?us-ascii?Q?s6zQFwYmZu59HHLOSfKX9OriIdXAzdkfX7HAvOeOXSIk+ko7SvUz0YcNyQKt?=
 =?us-ascii?Q?+kI99N38G5mDdFOEESnzGOnPYnXGQJhlZbVvaTgTxpzh+oueeHSKqmQgTpVb?=
 =?us-ascii?Q?2OpaSNvbZOUDw2iyi7lUCiQ94yr1mGWRJK5ASs7cTOrGCJ0vdHYMiLc1N9gz?=
 =?us-ascii?Q?QdiEFkXVwzMIPWLDHuLOVDNpjL/CGqX6fYdqe0HgVaxtyC4xOKXUoCEfwG5G?=
 =?us-ascii?Q?06DMRuW+N8kXvKJpRoFEBHP3de0KDPJSESgT9T2dsflYGQVSTHQMatHgjAmj?=
 =?us-ascii?Q?jaQGBN0Z2cbL0OFoCfKvMxcz/H+JEso7sqytPTE5O62Vm0UoB9KLlwSrtDaF?=
 =?us-ascii?Q?KvD9Kl8FwsXKZoxuKwkmtOUQX/1/6dn/aVBmvKdxfdiCC/vQLBqeQjLvagDY?=
 =?us-ascii?Q?XaD21lGo1C8dIQBkz7XSvfRkhUAifvYJ26lzJht9Bk584kyn7VT/x0A8i5D7?=
 =?us-ascii?Q?Y8Ev5ZDnlfteXfrbmZ7LWIcbbfkQteA+s6WqlaVKowqKkUDxY2ZX8LMnamFp?=
 =?us-ascii?Q?yQIW+mEyS1cefM7k1HYVUEWQGhy0o17ltvIaerrIBFWXTSjLx+Job2GHYzGR?=
 =?us-ascii?Q?Ut4Ee+4wf1w0UEq5aqVRP0WBfFa5NQE4v5PJI8GlCretvNpJyFYscVce6o2V?=
 =?us-ascii?Q?P6/wobuALSeOD6KToxxqKkoFEmSEGIPFtPqGSjF+FJI2/ZNEFDo5TrMBaliI?=
 =?us-ascii?Q?aTwklNr2Dh0MNSfprin5MS6B4WdZ+UpsQZayJbUjJo8wPMXfsoSB6nTKJjDk?=
 =?us-ascii?Q?3EBBrqyVkt5o08M4Z+P3jGUOo2Myp187MWZY+Dj4N8RgXTLU7Byzfy7yWN+y?=
 =?us-ascii?Q?IYxGjfr8seTmNbMMgkodiuznSSXp+Bf4ClfqlxKyuoJR+sT4w6Cor76azvW6?=
 =?us-ascii?Q?Y4UB+8jcB3d5QCGG5HjG+pf29FDSqkVq6ZOPPsf31JUuP7LGNONf/ju8TQpD?=
 =?us-ascii?Q?ZRGRSJ22B7C6lc9EwQF3zrR2WckF/NCZvWkbpScj8WpSj4odIInThwUUGEd/?=
 =?us-ascii?Q?o2NDplZco+Ca4nGKFIkExbbcW2ZzyiLyaYyWz6ZfwoeBugLmvcAZrNfwbgeW?=
 =?us-ascii?Q?lsc1xT2VT/mFpK3LrXKkqhhQ/isFpLz2gzQGq7hpt/eAWQWZAvnvhj6Lw8lX?=
 =?us-ascii?Q?tNk05FLZGB7j6zMpjaUCxV9duXDS74vyL9S5IJOrOqfHLdp/I/f2E0+pb80f?=
 =?us-ascii?Q?ygWgLqQ5znBjeW0TRKj4/GeM8BQNRGq/wXhA0NEi?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6467.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98b0c7f3-4a1b-4ad6-6f5c-08ddf9ed003f
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2025 15:30:46.2935 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 21DazdYBCpU5KgmyRsDG25IwQXEPXV+mAV1PgHKmEKRhwHO+KXvXg8ogA1AkIUQweeG/orl+3IyOvSKlN6NMCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7361
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



> -----Original Message-----
> From: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>
> Sent: Monday, September 22, 2025 6:19 PM
> To: Jani Nikula <jani.nikula@linux.intel.com>; Garg, Nemesa
> <nemesa.garg@intel.com>; intel-gfx@lists.freedesktop.org; intel-
> xe@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> Subject: Re: [RESEND 02/10] drm/i915/display: Introduce HAS_CASF for
> sharpness support
>=20
>=20
> On 9/22/2025 4:40 PM, Jani Nikula wrote:
> > On Fri, 19 Sep 2025, Nemesa Garg <nemesa.garg@intel.com> wrote:
> >> Add HAS_CASF macro to check whether platform supports the content
> >> adaptive sharpness capability or not.
> >>
> >> v2: Update commit message[Ankit]
> >> v3: Remove \n from middle[Jani]
> >>
> >> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> >> Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> >> ---
> >>   drivers/gpu/drm/i915/display/intel_crtc_state_dump.c | 7 +++++++
> >>   drivers/gpu/drm/i915/display/intel_display_device.h  | 1 +
> >>   2 files changed, 8 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
> >> b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
> >> index 0c7f91046996..bc6a041cec13 100644
> >> --- a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
> >> +++ b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
> >> @@ -373,6 +373,13 @@ void intel_crtc_state_dump(const struct
> >> intel_crtc_state *pipe_config,
> >>
> >>   	intel_vdsc_state_dump(&p, 0, pipe_config);
> >>
> >> +	if (HAS_CASF(display)) {
> >> +		drm_printf(&p, "sharpness strength: %d, sharpness tap size:
> %d, sharpness enable: %d\n",
> >> +			   pipe_config->hw.casf_params.strength,
> >> +			   pipe_config->hw.casf_params.win_size,
> >> +			   pipe_config->hw.casf_params.casf_enable);
> >> +	}
> > This breaks bisect, because it's referring to things that aren't there =
yet:
> >
> > ../drivers/gpu/drm/i915/display/intel_crtc_state_dump.c: In function
> 'intel_crtc_state_dump':
> > ../drivers/gpu/drm/i915/display/intel_crtc_state_dump.c:378:43: error:
> 'const struct <anonymous>' has no member named 'casf_params'
> >    378 |                            pipe_config->hw.casf_params.strengt=
h,
> >        |                                           ^
> > ../drivers/gpu/drm/i915/display/intel_crtc_state_dump.c:379:43: error:
> 'const struct <anonymous>' has no member named 'casf_params'
> >    379 |                            pipe_config->hw.casf_params.win_siz=
e,
> >        |                                           ^
> > ../drivers/gpu/drm/i915/display/intel_crtc_state_dump.c:380:43: error:
> 'const struct <anonymous>' has no member named 'casf_params'
> >    380 |                            pipe_config->hw.casf_params.casf_en=
able);
> >        |                                           ^
> >
> This is strange, the patch where this was RB'd was not having this piece =
of
> code [1].
>=20
> Seems like things were moved after the patches were RB'd, without mention
> in history :(.
>=20
> This indeed needs to be re-looked.
>=20
> [1] https://patchwork.freedesktop.org/patch/644360/?series=3D138754&rev=
=3D11
>=20
>=20
> Regards,
>=20
> Ankit
>=20
> > I thought about simply reordering the patches in the series, but the
> > patch that adds casf_params depends on HAS_CASF() introduced here, and
> > there are other similar issues all over the place. I can't merge this,
> > sorry.
> >
> > Every commit must compile, no exceptions.
> >
> > Checking this is as simple as:
> >
> > $ git rebase -i drm-tip/drm-tip -x make
> >
> > with whatever remote and build command you use.
> >
> > And yes, I obviously do this before merging anything, also no
> > exceptions.
> >
> > I'm more than a little annoyed that there have been umpteen versions
> > of this series, I've been incessantly pestered about gathering acks
> > and getting this merged, and there are still basic things like this
> > that nobody looked at or cared about when I'm on the verge of merging.
> >
> >
> > BR,
> > Jani.
> >
> >Sorry for the trouble. I checked the kernel compilation but forgot about=
 checking each patch
compilation from last few versions. From next time will be more careful abo=
ut this.

Thanks and Regards,
Nemesa
> >
> >> +
> >>   dump_planes:
> >>   	if (!state)
> >>   		return;
> >> diff --git a/drivers/gpu/drm/i915/display/intel_display_device.h
> >> b/drivers/gpu/drm/i915/display/intel_display_device.h
> >> index 1f091fbcd0ec..157aa0b8f36e 100644
> >> --- a/drivers/gpu/drm/i915/display/intel_display_device.h
> >> +++ b/drivers/gpu/drm/i915/display/intel_display_device.h
> >> @@ -144,6 +144,7 @@ struct intel_display_platforms {
> >>   #define HAS_ASYNC_FLIPS(__display)	(DISPLAY_VER(__display) >=3D
> 5)
> >>   #define HAS_AS_SDP(__display)		(DISPLAY_VER(__display) >=3D
> 13)
> >>   #define HAS_BIGJOINER(__display)	(DISPLAY_VER(__display) >=3D 11 &&
> HAS_DSC(__display))
> >> +#define HAS_CASF(__display)		(DISPLAY_VER(__display) >=3D
> 20)
> >>   #define HAS_CDCLK_CRAWL(__display)	(DISPLAY_INFO(__display)-
> >has_cdclk_crawl)
> >>   #define HAS_CDCLK_SQUASH(__display)	(DISPLAY_INFO(__display)-
> >has_cdclk_squash)
> >>   #define HAS_CMRR(__display)		(DISPLAY_VER(__display) >=3D
> 20)
