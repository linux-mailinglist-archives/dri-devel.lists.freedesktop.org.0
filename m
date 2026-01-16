Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE268D387CD
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 21:43:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2377410E92E;
	Fri, 16 Jan 2026 20:43:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W1wqaPaD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1C0010E92E;
 Fri, 16 Jan 2026 20:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768596218; x=1800132218;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=POsODI7Q9Bb+az1Bxgk0tCgzldN8gu4RRyztz2ghz9M=;
 b=W1wqaPaDxdu6wjCRI3odlw1I1/V+ydeGcu+Q9kEueupXU+UyILFBbfif
 NlQpQ4lmOcPHVhk77m7lLRvXzlYn2zVU0C7xine/jKSwhl6kSYk7CejYR
 7AVRjl88/LoNIzaJWNip9GQB2BCQxXF3eI19VWEs6Yjo1yt/yFm7Liwy5
 2+KNUooU5stKn03wxuRDBgPvSLCvR4jZRH0bXBwfXPzD7Zlf+qFGLpfMM
 V9sdatuBXgEW28GP5iKYSDQI0Ia8iVqYzvWQDy1Y4QuZApOLQD7dF/7gI
 bd/+wkA3MSi2iTz7xzIibnltdiGJzlaMPJoena08BLpnR0o26wNgvFeNN A==;
X-CSE-ConnectionGUID: sytJmRDDQw+7NXLWXglokw==
X-CSE-MsgGUID: VOUWg2CKQzCHVVwUBEP+Mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="70000591"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="70000591"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 12:43:37 -0800
X-CSE-ConnectionGUID: 47Yeq+GgS1yOMwlDrA7KLg==
X-CSE-MsgGUID: odk2tNPRQL2uovWvYRCFTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="210346842"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 12:43:37 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 16 Jan 2026 12:43:36 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 16 Jan 2026 12:43:36 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.61) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 16 Jan 2026 12:43:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MvqtlM7gTLC9JJ/jo92s68QnK6S3pP7GstTyI7xQEw7kqF7gc0qwGXNEkH0hlWkDMqKMF+SV0IffUzJ38jqhkoZcb4m8eqMXIijRSAEUCWg9IYEqaG9quTmJ0FbPG95rj5mnb93FtrOY0Qc6j3kLzYiD30M7yvdsDtcGhI+RQ6+0Fgw73873+jn1WX4hOElep6BXbchTC60uckAdUE+SvEVbLYvKAbyKExCr+B4ysPAe5gYsJVk0+8EFZ4cvWdbgpB4U6kpmqRfFI+8pNzpbqgpqQXi0fX7VKg3eMF0udz75xveStMdFGsKoo0Rw9Z5YIbCDU1JgbYeOrehWW1KLOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/YM9SriXuowedEAW3cjZ0D5rxNCvdt4radpOEaHLpO4=;
 b=v/29OT5K97bIP5K5wV8u76u9bhdCHfVaiWdSDDBdXC+B+JXUnRAkFC67w86IGNQgiuRSTfGm5JGol1ilIvxEUHBXKgHZIpv/2lwwNGvJhn+sQAd5Pm0Aue/NuQT0DPEu6q6wlBM5iIZDGVmiD5O7IeA2j7b8WvO2u7sTS/YFDhaRfwxPuwlDeQB45eK3LpVnyNj0TYEpzd5CImSG/wbtmDQEOEOgn2f2KPjYl4tIvsnVr7FVeX/xX+8uSovUHqe0fStQ+r+tX4JbAkeEozMUxwcZqn93Cw+7ewkBI1ajcBiimhLvV3OC974c39jrKamLasN0od6/+ZgQoUrwAO6dpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SJ2PR11MB8566.namprd11.prod.outlook.com (2603:10b6:a03:56e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 20:43:32 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e%5]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 20:43:32 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Niemiec, Krzysztof" <krzysztof.niemiec@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: Andi Shyti <andi.shyti@linux.intel.com>, Janusz Krzysztofik
 <janusz.krzysztofik@linux.intel.com>, "Karas, Krzysztof"
 <krzysztof.karas@intel.com>, "Brzezinka, Sebastian"
 <sebastian.brzezinka@intel.com>, Chris Wilson
 <chris.p.wilson@linux.intel.com>, "Niemiec, Krzysztof"
 <krzysztof.niemiec@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v3] drm/i915/selftests: Defer signalling the request fence
Thread-Topic: [PATCH v3] drm/i915/selftests: Defer signalling the request fence
Thread-Index: AQHchx8rRR6EDVgUE0uspEaUfkN3TLVVQDoA
Date: Fri, 16 Jan 2026 20:43:32 +0000
Message-ID: <CH0PR11MB544448C1C04D9D0E8BD77450E58DA@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20260116193354.80806-2-krzysztof.niemiec@intel.com>
In-Reply-To: <20260116193354.80806-2-krzysztof.niemiec@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SJ2PR11MB8566:EE_
x-ms-office365-filtering-correlation-id: 7b407e18-9452-4c0e-cda0-08de553fe96d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?cl0VZ8OihUY109XKm77wvQvNR1rVR42sXBieRoMJMNsok0kbPtEA5ZYTRlkt?=
 =?us-ascii?Q?bpTV50ZAilY0x46Dlxymo5/ErFD6Cs32M84BYuBHy1nRRHto5JR5AN56xXxX?=
 =?us-ascii?Q?35Ky79LPi77hyYIOLc7VAcVAK4QBvcm0KdeNpzA6jAsd2+uIOvi9WYG3aG+B?=
 =?us-ascii?Q?lyjgCVRvSd8IXvlyf0yCSgZsK7KGgXSHLFKuErbdAL1gGaoiyxE/zbunoZ0F?=
 =?us-ascii?Q?91C9ETzLR57XFDL0mrspUe6VB/k9mBczgoqzJyU1z2KQe9tN3C2ODXIB+O4X?=
 =?us-ascii?Q?9ZNEMfKb9HC9gA+XaFjecI+gpBVzFJRH/2ku+aNaomy45eRi2ewfBzC8TlnS?=
 =?us-ascii?Q?jEt3Mm1olxJpnS57oR+DgkBGLV1J/JjCHid8zCboG2I5gZSYtRLmMKFn4ZoJ?=
 =?us-ascii?Q?9MmuJubMT07DWHaZYdDGq4VEMNA06pcxUW2heDJih+eNCWHOa2wRUsisRPMk?=
 =?us-ascii?Q?wDorMeCcmiKGVyI8aMCmRmeN9zo489foHviG5gdms8qfk2Sa/wR29biTqneq?=
 =?us-ascii?Q?UjFTM66iKwl6ztVZOuN6YbvOtxzwnpc14zbtoLUFo4c7EKUdq8OEcenxDaN7?=
 =?us-ascii?Q?VWGpNae/YrEUFyIQYB9zFJa8mnQwdPLzpOViGD1hNpiA23Jp05Z8S81Id51x?=
 =?us-ascii?Q?83lZS2JMXvH6hTgPJvwlAgNFJrstJsn7CNbY931NUp2+h6/qaMRI2Pxn8HxQ?=
 =?us-ascii?Q?xDFlcysE5NpaIX7VNwieChn792TQBxCnJsCPk12SKqsTp5NW3d0Vk3vYZp5s?=
 =?us-ascii?Q?qACCqAD9bFastTHZwm0cIqX7USFSsdejkft8WeiHa96ce0mmuVINepbx7S9j?=
 =?us-ascii?Q?/SYFxIt8Pw5mVAD9TICewF8q5RVqdj7hRNWoXe0HWEnbr/NRhXDyYB0hI7eq?=
 =?us-ascii?Q?PXSe5Y+XNmX2AvPi7GxYCoLOJ05dwiy6Ro1qmCHhav153HqnOqgEVU6CdSuW?=
 =?us-ascii?Q?pyhBGEc3vtcUQ44GMpQiwqd111o7MoIvW1JaOtH+UZdOTVpdeTofbeu5OQ8I?=
 =?us-ascii?Q?uz0VYt1zSMzHhKjdeRW1DHr2pWPne8YTvAU0X53iOYaTWXJ7p0MYzJyN8Ybf?=
 =?us-ascii?Q?zFU2sLgE61Fwm4HbpCNBliRzWtZalNqIFA1bPeArU6tbwjGNoZHymX+kUoO7?=
 =?us-ascii?Q?QezQPknBpJdaQKXphrzWkuUwt844H12E0jV9USswa85Q2wVoLNX7Ok0Ty0uX?=
 =?us-ascii?Q?K2C6jihmi6h8L5JIYma/+2e6RUxjMPlkhTzP7ylh97ebUOo9LfhLRXRUV26x?=
 =?us-ascii?Q?Yzi2kyx4Vyw1AtSZZNaBtkMgMUyK5Z75Qb4qQDrEgI57NmkJU9PwBhZUozcQ?=
 =?us-ascii?Q?BAOQ0LA3rH7wnsxNiS2HrFEsjeRnX6Gy2aXurv0XvBC9ozDsYZQTZlai1WfD?=
 =?us-ascii?Q?05BEvIDPRZjhXI+M0CkY1DANpVn2fAkFFsgOzt8rjctwfLG1VS/iuH8epT2x?=
 =?us-ascii?Q?t+vXWCjhjfbVx2aEZA3r6DjJi+NCC6sidXYDKX/ZGECz1pzSHlc2KcGoHds0?=
 =?us-ascii?Q?HTh0cfPDtidY1puIIf62ZUid/OytJLQ+27FcOLxRb6cF4nN7VMD/NlBf6j2F?=
 =?us-ascii?Q?Z6SwpoIJJcc4JyItVnr+wNqdSb7LPZXqR22eHXegFYo4SU9gZ+76eiHkrZ7k?=
 =?us-ascii?Q?wvL/N19jHMBHEvno34Dswzc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8FmGRuh5Fzffo6QkKf9u4mpK5+7Sjhyt7if4Jv/joCvebfr9i+lmV9G++ac8?=
 =?us-ascii?Q?+SX5R4PxnbCCeomYDS3sFZLMxyHhK6SYSHtB94eqBdDjLJWty8seVtJ1+vh7?=
 =?us-ascii?Q?NLRVxjCtye+3i2LdqplLQATMSKrCZ45pRh2v8YSCinfUKqeRo/aqDbhA+LpP?=
 =?us-ascii?Q?0F++GsNaPUoIQwlp1O0Sa1GkSN+FCdZvPSTLkgwupSr14bHZ2bdoks+85/ye?=
 =?us-ascii?Q?KyGsttEhFAHGlRPOLQDm/sJv4RA1yfGNmmrLoVi+yjRzKp5i4+CdX5dYP7Tf?=
 =?us-ascii?Q?8rcY7Hpk6Lr2szi6wEdXydngfeBvA4PqkvhIDaC1OmBSgG7JyKA5f6V4KVbG?=
 =?us-ascii?Q?ktiMJRr9sSPRrRapHG8nbfzKlhUXYWlyuxtLMJacvRFlMSC14TpO/8cZ3X0K?=
 =?us-ascii?Q?qzq19s4R5wbcelxRc1Uu1OD4dUDwYVO7T0sfCKinzMbot+0YcQ+zV9H/htwb?=
 =?us-ascii?Q?154ca7r8VanbbKIyj97E2JL3Am5Xx5xKfdJMllwhLuMb5NhVEBY4g69EEvCn?=
 =?us-ascii?Q?Kae8T6xhY6HRuVHmDCvPMCP/7nQD9LuwZ1z+zCm5K8LDpxfcULw3k1RsX61E?=
 =?us-ascii?Q?3N3/o29gbvm2KwBkA7EjW9b8mOuUSizTDMOUKkzpexMfFEfAhZrgXp57A5fq?=
 =?us-ascii?Q?ZUVn/h9M+e4dvqgH03WUXPdwH4gauP/BqTvRoLQIdamQe++U302Bii+OETtW?=
 =?us-ascii?Q?tr684hercu0hcwbnvSPRLlyDA96uC53pEG0RdsypRACG7LJhvad7exMJa0mN?=
 =?us-ascii?Q?cgpjtRWf/TWZvv4TJvgeaqQXM548tsngtKlQkwMFryK7m4fFp9LbgA9qo6Cg?=
 =?us-ascii?Q?6ivHrZpMLAZolBocdFpRGqM6UbdGvSnX3GZiCtTyDnGAkIAIXVWzuUbwSYJU?=
 =?us-ascii?Q?ibMGyndsilg5cgGl+76NvFsYWwUilt5JwGTHw4YwOkLY3OSbYMydAnb89Cmq?=
 =?us-ascii?Q?mpwLlW1ZLVy9Hoo0ISlkqF5IgMOuImhI8MHi1nPp6TBY1BPcRpujO9leJbQ+?=
 =?us-ascii?Q?7S2FJMCXPeTwphiUoyt5nTrL5WKDVHgD5k+MFjbrrRpHveP7qQM+okWS+TFR?=
 =?us-ascii?Q?ZZnq90iEXlt5KtHkYDre3VTbk6qLfnM6isXKcqxruN7bhDVnHUCJpYvawX8b?=
 =?us-ascii?Q?xZpqt/vlgOrZBvqwst3DfEVMx+hTk8AbYm0EjrtTf/N++Y8GdUU9Y5W9hskr?=
 =?us-ascii?Q?Gb6BMFj2LGJwBnG8Z/Qnv9YjpMNjJSFbNg7OX+ta2GRfP2H8Dkm5PGY1T0Yr?=
 =?us-ascii?Q?TI4evRzEaah31dO5p6s8yCli0E5Jq8YGcvy438dbo5O7rBdi6jJRvo3yYOGr?=
 =?us-ascii?Q?eE2rTnBVPlQF+u9DlSjlu2eV/UPj2uPcktY+Nfy54c1NQUT6uhynpWfn1zOn?=
 =?us-ascii?Q?vNMbTMrZ8XB0UeplYoH4mEMjzcHktsMDqEMEi29yAlmHC8rPjgLyfWJaVOpj?=
 =?us-ascii?Q?VKi48gNUf3zT8ANbOrS7oCwesaKsxCCHctZkujmQNhOJI3OldDfIy4P/uwZ6?=
 =?us-ascii?Q?oSvab+atbnuQoJp6mK2rZYdKNgEgFIPhcPatsx/kFyAh46kyG8YfMb0sYhK/?=
 =?us-ascii?Q?7Yh7FIyd1CYiRJ5Lvj1yb7oBOaFlozz7MfwuCkJU7U1XVfdfuuwldjO6Zc88?=
 =?us-ascii?Q?lbsMOjhGjRjkrukJBJOhKKShYqxIo82+PiJq4G5X6qVvQQ8ZUnxaLy1irRu9?=
 =?us-ascii?Q?Lya9dC/dVzF+B+dJZZHQGuU3IISKesjbZOYH7fjTgYWgFvgxRFV8H+ah+W6P?=
 =?us-ascii?Q?Len7d21xUw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b407e18-9452-4c0e-cda0-08de553fe96d
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2026 20:43:32.0612 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VxRZk7Vo/LNUbeCDYEqgU41qiDfDXAKOgiCSHkosa2Mfemtm5+tq5ZLjt8eSpiZefxqA2WZIUQ1HPYntZ/qkuFbZthsDUNS7NYKfC62WK2U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8566
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

-----Original Message-----
From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Krzy=
sztof Niemiec
Sent: Friday, January 16, 2026 11:34 AM
To: dri-devel@lists.freedesktop.org; intel-gfx@lists.freedesktop.org
Cc: Andi Shyti <andi.shyti@linux.intel.com>; Janusz Krzysztofik <janusz.krz=
ysztofik@linux.intel.com>; Karas, Krzysztof <krzysztof.karas@intel.com>; Br=
zezinka, Sebastian <sebastian.brzezinka@intel.com>; Chris Wilson <chris.p.w=
ilson@linux.intel.com>; Niemiec, Krzysztof <krzysztof.niemiec@intel.com>
Subject: [PATCH v3] drm/i915/selftests: Defer signalling the request fence
>=20
> The i915_active selftests live_active_wait and live_active_retire
> operate on an i915_active attached to a mock, empty request, created as
> part of test setup. A fence is attached to this request to control when
> the request is processed. The tests then wait for the completion of the
> active with __i915_active_wait(), and the test is considered successful
> if this results in setting a variable in the active callback.
>=20
> However, the behavior of __i915_active_wait() is such that if the
> refcount for the active is 0, the function is almost completely skipped;
> waiting on a already completed active yields no effect. This includes a
> subsequent call to the retire() function of the active (which is the
> callback that the test is interested about, and which dictates whether
> its successful or not). So, if the active is completed before the
> aforementioned call to __i915_active_wait(), the test will fail.
>=20
> Most of the test runs in a single thread, including creating the
> request, creating the fence for it, signalling that fence, and calling
> __i915_active_wait(). However, the request itself is handled
> asynchronously. This creates a race condition where if the request is
> completed after signalling the fence, but before waiting on its active,
> the active callback will not be invoked, failing the test.
>=20
> Defer signalling the request's fence, to ensure the main test thread
> gets to call __i915_active_wait() before request completion.
>=20
> v3:
> - Embed the variables inside the live_active struct (Andi)
> - Move the schedule_delayed_work call closer to the wait (Andi)
> - Implement error handling in case an error state - the wait has
>   finished, but the deferred work didn't run - is somehow achieved (Andi)
>=20
> v2:
> - Clarify the need for a fix a little more (Krzysztof K., Janusz)
>=20
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14808
> Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>

Some nits below, but I don't have any reason to block this, so:
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

> ---
>  drivers/gpu/drm/i915/selftests/i915_active.c | 47 +++++++++++++++++---
>  1 file changed, 41 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/selftests/i915_active.c b/drivers/gpu/d=
rm/i915/selftests/i915_active.c
> index 0d89d70b9c36..2052a3c2e563 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_active.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_active.c
> @@ -19,6 +19,10 @@ struct live_active {
>  	struct i915_active base;
>  	struct kref ref;
>  	bool retired;
> +
> +	struct i915_sw_fence *submit;
> +	struct delayed_work work;
> +	bool work_finished;
>  };
> =20
>  static void __live_get(struct live_active *active)
> @@ -74,11 +78,19 @@ static struct live_active *__live_alloc(struct drm_i9=
15_private *i915)
>  	return active;
>  }
> =20
> +static void __live_submit_work_handler(struct work_struct *work)
> +{
> +	struct delayed_work *d_work =3D container_of(work, struct delayed_work,=
 work);
> +	struct live_active *active =3D container_of(d_work, struct live_active,=
 work);
> +	i915_sw_fence_commit(active->submit);
> +	heap_fence_put(active->submit);
> +	active->work_finished =3D true;

NIT:
A lot of the handling here relies on container_of correctly finding the req=
uested structures.
Assuming this will always succeed, there's no need to change anything, but =
it might be
necessary to perform some error checking here if they can fail.

> +}
> +
>  static struct live_active *
>  __live_active_setup(struct drm_i915_private *i915)
>  {
>  	struct intel_engine_cs *engine;
> -	struct i915_sw_fence *submit;
>  	struct live_active *active;
>  	unsigned int count =3D 0;
>  	int err =3D 0;
> @@ -87,8 +99,11 @@ __live_active_setup(struct drm_i915_private *i915)
>  	if (!active)
>  		return ERR_PTR(-ENOMEM);
> =20
> -	submit =3D heap_fence_create(GFP_KERNEL);
> -	if (!submit) {
> +	INIT_DELAYED_WORK(&active->work, __live_submit_work_handler);
> +	active->work_finished =3D false;
> +
> +	active->submit =3D heap_fence_create(GFP_KERNEL);
> +	if (!active->submit) {
>  		kfree(active);
>  		return ERR_PTR(-ENOMEM);
>  	}
> @@ -107,7 +122,7 @@ __live_active_setup(struct drm_i915_private *i915)
>  		}
> =20
>  		err =3D i915_sw_fence_await_sw_fence_gfp(&rq->submit,
> -						       submit,
> +						       active->submit,
>  						       GFP_KERNEL);
>  		if (err >=3D 0)
>  			err =3D i915_active_add_request(&active->base, rq);
> @@ -132,8 +147,6 @@ __live_active_setup(struct drm_i915_private *i915)
>  	}
> =20
>  out:
> -	i915_sw_fence_commit(submit);
> -	heap_fence_put(submit);
>  	if (err) {
>  		__live_put(active);
>  		active =3D ERR_PTR(err);
> @@ -154,6 +167,8 @@ static int live_active_wait(void *arg)
>  	if (IS_ERR(active))
>  		return PTR_ERR(active);
> =20
> +	schedule_delayed_work(&active->work, msecs_to_jiffies(500));

NIT:
500 ms seems like a long time to wait before initiating the task.  Was this=
 time
arrived at through trial and error?

I guess it's not a big deal assuming this isn't being run in a loop, but mo=
st execution
delays with similar purposes in the test code rarely exceed a 10-50 ms, so =
it's a bit
eyebrow-raising at first glance.

> +
>  	__i915_active_wait(&active->base, TASK_UNINTERRUPTIBLE);
>  	if (!READ_ONCE(active->retired)) {
>  		struct drm_printer p =3D drm_err_printer(&i915->drm, __func__);
> @@ -164,6 +179,15 @@ static int live_active_wait(void *arg)
>  		err =3D -EINVAL;
>  	}
> =20
> +	if (!active->work_finished) {
> +		struct drm_printer p =3D drm_err_printer(&i915->drm, __func__);
> +
> +		drm_printf(&p, "active->work hasn't finished, something went\
> +				terribly wrong\n");
> +		err =3D -EINVAL;
> +		cancel_delayed_work_sync(&active->work);
> +	}
> +
>  	__live_put(active);
> =20
>  	if (igt_flush_test(i915))
> @@ -184,6 +208,8 @@ static int live_active_retire(void *arg)
>  	if (IS_ERR(active))
>  		return PTR_ERR(active);
> =20
> +	schedule_delayed_work(&active->work, msecs_to_jiffies(500));
> +
>  	/* waits for & retires all requests */
>  	if (igt_flush_test(i915))
>  		err =3D -EIO;
> @@ -197,6 +223,15 @@ static int live_active_retire(void *arg)
>  		err =3D -EINVAL;
>  	}
> =20
> +	if (!active->work_finished) {
> +		struct drm_printer p =3D drm_err_printer(&i915->drm, __func__);
> +
> +		drm_printf(&p, "active->work hasn't finished, something went\
> +				terribly wrong\n");
> +		err =3D -EINVAL;
> +		cancel_delayed_work_sync(&active->work);
> +	}

NIT:
This exact code snippet is also run in live_active_wait.  Perhaps this coul=
d be collapsed
into a helper function (along with the other err =3D -EINVAL case above, as=
 the error
messaging is nearly identical between the two tests).  I don't think it's s=
trictly necessary
to do that here and now, though.

-Jonathan Cavitt

> +
>  	__live_put(active);
> =20
>  	return err;
> --=20
> 2.45.2
>=20
>=20
