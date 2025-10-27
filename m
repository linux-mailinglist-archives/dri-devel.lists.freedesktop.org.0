Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCFAC0CB54
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 10:38:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63B3F10E428;
	Mon, 27 Oct 2025 09:38:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DA8LYzwO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5DE710E023;
 Mon, 27 Oct 2025 09:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761557903; x=1793093903;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VwXT15C6NnQRWW9NmsZHXvGX2TyRtiRlhQtuFVcXMew=;
 b=DA8LYzwO/1ZNWXxeN6JV8FLzLAiCEYFORizt8baM2tQLUQVhP2vKOPLr
 qbmnciOGrC6jUYO7SAU78dbno9yPAMyGl9LmW4gwwqNgzyoQUTixiGVHi
 nBZqHL7DcHX4lprb2mprEOIOqZee/BFeMEiCJMOah8zHrqs8DnR+xuTL3
 +HlTSleDtGWdgXA2ulWwjCL4R0BH9N/DBMNsA8JQLd7yD7EQE7y9/N+kU
 ELFPxxQW5JnchbQ+deFY5yGqPC4LaG8Xoq4vEicjtiXuj5wLg1OHWQNOI
 ZPw4xhZN/41YxeC0HoqAXp9pKq8kjYDyGKek7TNenb7H8UZYlsT7Ig/KX g==;
X-CSE-ConnectionGUID: P/ixbyJtSLCv4qBgZImyrw==
X-CSE-MsgGUID: 7He0aFERSvW32PNDMlqRNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62663203"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="62663203"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 02:38:22 -0700
X-CSE-ConnectionGUID: Jx32vVFQQ5qaaDqemRDSJw==
X-CSE-MsgGUID: 2IiaPpQcQ1m+kNXF+oJZwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="185757133"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 02:38:22 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 02:38:22 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 02:38:22 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.40) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 02:38:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zBBVy5a8Jk9LxGp2QgacPjLrH3galwCXZ7uVLo98E+hENgUkCOFOeghKM5vcd0+YX3gYZh48HqUr7kZhFwPKhdnOWW4VSJJsXotgOkEgBNseYTI/ssgdY7lbk7piv9KimOHOiRWH0LO2jusqlSOH23Xm9d1OscvufSk/DbY8WJTnxOhg8ODG+dYjGA/FNNzwaSQXdqwjOV5/DDICuZU9aVb825wXGi0AwoF9/nDpN6wJKdxXLPhC+i/D1swFR8nV9hIr4iahVrogCH7bI7YdieEhf5yfx7q2Wm8cn9MzUP1gZN9pwxbvT1z/pVcC9RGzNyqFnAIVH8iE0HxDQFBvkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+aJFIaotYg7zTof8Nb9Z+RyS6UrMfL5XUELy8doGzf0=;
 b=Q9ojrQOpricTRNLteuNq8/+EBjQK9MIAJQkwpfXaGg/y/cP9+nxRATa+q1elGjSxvLx3ryE6A6tr73PyBgnA2WLAZW7MPX7qT0OqZ9pNw8I2fCe5dYIi/FbI9eO2QAPQwL6vgY6Ozqrl9ewPOZ9E4uvSURLIwzaCCUEIeoGEb59nVCHdW/LfLz8P0SN1MGiRPUuPR+Ga0+AzngbWZTvRtpC6veFknCJ9D0uR8VUjC1iYWTqnFXUAZTkMd81FVOKclGOqvLTZ1SNL96uaOYoVtadhn5iB4AJvko7AcUUvj5cuVe0tmv9Zg0/f9TkEEuDj63FI/H9vle5g1t8ghhxUOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by CH3PR11MB8435.namprd11.prod.outlook.com
 (2603:10b6:610:169::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 09:38:20 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc%4]) with mapi id 15.20.9253.013; Mon, 27 Oct 2025
 09:38:20 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Shankar, Uma" <uma.shankar@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "pekka.paalanen@collabora.com" <pekka.paalanen@collabora.com>,
 "contact@emersion.fr" <contact@emersion.fr>, "harry.wentland@amd.com"
 <harry.wentland@amd.com>, "mwen@igalia.com" <mwen@igalia.com>,
 "jadahl@redhat.com" <jadahl@redhat.com>, "sebastian.wick@redhat.com"
 <sebastian.wick@redhat.com>, "shashank.sharma@amd.com"
 <shashank.sharma@amd.com>, "Sharma, Swati2" <swati2.sharma@intel.com>,
 "alex.hung@amd.com" <alex.hung@amd.com>, "Shankar, Uma"
 <uma.shankar@intel.com>
Subject: RE: [v5 09/24] drm/i915/color: Add helper to create intel colorop
Thread-Topic: [v5 09/24] drm/i915/color: Add helper to create intel colorop
Thread-Index: AQHb6zDw/v5by/j9jUWswB1MK6PL+LTWc9sA
Date: Mon, 27 Oct 2025 09:38:20 +0000
Message-ID: <DM3PPF208195D8DEFC6EDA9E1A972ED7DFCE3FCA@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20250702091936.3004854-1-uma.shankar@intel.com>
 <20250702091936.3004854-10-uma.shankar@intel.com>
In-Reply-To: <20250702091936.3004854-10-uma.shankar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|CH3PR11MB8435:EE_
x-ms-office365-filtering-correlation-id: 6d3eb7ac-39f6-41bc-cc33-08de153c9099
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?EfmUK8+tYdgz6f9uoNGlGDPr07cPC5lyp43U8BrWtWenMd6q3fKBXpkiSWY6?=
 =?us-ascii?Q?YimVu6KWtvgmS1GZDznc6eCp/12W+GYDZL+7CUWT50BDV9VCrcCrcf3AnS8n?=
 =?us-ascii?Q?M46Z/nQ63gEIDlHLzZ3CrLix/IVpDK1lD24QY3Fyk7d+DjgaxalSkN1eUXc/?=
 =?us-ascii?Q?vlWztseay+3FvMFd66bJCX7qzxQlSbFZenot3mOox8Huy73kdWaYH3hKGqLx?=
 =?us-ascii?Q?OTa9ytf5oLSobcG4PB67D3gnm3YBFQYrsl06wCPvrfG2OPLmBbVl3o80weTV?=
 =?us-ascii?Q?2z9SKZeMnnZHVuomUTjepNx/o6EWCXDV8jYbEc6uHms83NvnaFKnfQ9AZELW?=
 =?us-ascii?Q?tumJBlNOrI8gmsAuIvPtp47z8eVdRO6pRFnr3sRvMLV8+kD38VV+936oi18X?=
 =?us-ascii?Q?XN2AL3gMtVefFTM6MQ4v1+ACW60HgjLW+hrsya73Np4qCuZuKnkbGnxJBnAs?=
 =?us-ascii?Q?FOMs67oveiJn6LnYVIZ4yFfgsR3AAVLZ9hGdD/BjE56LFp/XtHTh3LeOVHGX?=
 =?us-ascii?Q?Igir6gs+B+PJv2U7riuleQe3kiQX+t5LIjxOTJPjlbmJu8R8yU7VhA8WADoc?=
 =?us-ascii?Q?1zKRsSixXoAOkseM09eG1cihvFUerWdL76aS10ytVdL6+KUC6PVoDRwQhzCM?=
 =?us-ascii?Q?nbT8mtILrdvgHVT1hzivnRh8QPuad4zZSNyu25y9aNPCgAMYcSPSUTBCX4P0?=
 =?us-ascii?Q?mPq7hUwzSuryYgERAlxEZKGwMjIXusU3si9S6ZbdlPBF18e4mhJCaKtyOaCO?=
 =?us-ascii?Q?wnZKIeYCxy+r+PmLvUSOjyYgEH2otiZ8s509+H/iUPW4rrCCH+0hzlazwNHI?=
 =?us-ascii?Q?qyG1w8h9ED3oFwpD0FRa/+I8v9uNAz/Z9XuCmL3M+7lLbMbTneJKXGIgt6Vh?=
 =?us-ascii?Q?cKuypNKYVmxdWYCqraNdZobA39L8VEhICAIBxnaEuS/foPRmHmBcHCZSu7iP?=
 =?us-ascii?Q?UJcI2r6CANO4jPG3kC6s3smnf+GXJrxl97POAgj8UB+I1p8BgrHh1Dd9uxi3?=
 =?us-ascii?Q?HPgckcMnPNCr8Pmy114CP45X94z5RU8ocR3vkoImhUuZlvBjxwSvE0KkMWbv?=
 =?us-ascii?Q?RSnCsCCKDUCjni+Ov+whpKNc1js9naYVYP51/nOd3YwgsHqW+gjirDuyMWMT?=
 =?us-ascii?Q?L4if1fD7CQrStz5m0d1JlwbhZBC0DveT70JUWR2ymhvD7V1FcMeY7NJA/X6k?=
 =?us-ascii?Q?sLWJV6owXWg/e1IzIADmRwcsEDT3y+/9vIa26Si7dE5J4dM9Bm3DxlzP07Z2?=
 =?us-ascii?Q?Wu77J8svQu9wYe4alUV/sBrHR5GU6fxxiNFnDvfgXSewS9owb4CY/5J948ig?=
 =?us-ascii?Q?E3UQq0jIky+biMGYFO7vYiLAUqHMv8Uz1ia5XAz4IsA2mbn4/3+zVOJh8Yry?=
 =?us-ascii?Q?+380aPfJHEv2jU20XtHl7jyW/nrVUcIh1/up1rulJUkA9sSSMU3BKRg0lMos?=
 =?us-ascii?Q?87SchD2VyhPbnWmACuRhiDdm6M7rCN4U1P+rOn6r0ikJf483dWKqFqiZgqIu?=
 =?us-ascii?Q?tGHXrnruUsEKLUbxPwaAR7xFh8/KU4eIQsvr?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?dcO3AUCLQzAkwvA82ra3cq6l1ayzd2ibYg5myL6ceqngDhwE0dBUqMI7U0XL?=
 =?us-ascii?Q?7ts2zNcZvKvZXk3JDfY/U0UC35bCrHHLZH3okJjDEdTO9lW2oVwgrh46RCp3?=
 =?us-ascii?Q?QOufLhT6fYQZKkKOWPlT7+UiTuizKPH7Aq22MDaoi7N4+3OQBqKLbSHaXEQe?=
 =?us-ascii?Q?xTsXGnEiIAq6xYhULfGFYrHRaBxfP1090+nBj1oQGS6zlFGtkVl4cRVVD0c2?=
 =?us-ascii?Q?qZi6wPxbL+b6WqOhodlbDxqZ3LXr0UM1Ed+pFX3n1JTRhSK7Ng4+K52YX6ik?=
 =?us-ascii?Q?a4mHk7dQGE6FDaG1y2eX6+5Une3yUso+KWCeipAEwLxyGiAFzgZoKX6IFGhx?=
 =?us-ascii?Q?sMkTTEfQbHBPrj1hYL94aF3swNKfXh4OwTRUXorTLkGgubZeZWGMA3fUX4lo?=
 =?us-ascii?Q?WNhO9BwonJG/Y+1+Ztax/MqunwhigAjjq7atDxNynPIQfzzZW4K0SV8o4K2P?=
 =?us-ascii?Q?6JwNFH2GElrmva0355acIAfXBTYVF32ToPCpfdNTGH7udw7jTxhO5U8OkrMA?=
 =?us-ascii?Q?SU+9WG8foxVAKw2Q27xPkSw/mrfGGx7BLRVfvDUdn4X/h+Xzewot1rkVjIip?=
 =?us-ascii?Q?zgrvp9t435Sb7sVul9Zw8GT+7Gack1Lk1KypFhtimzl4APQyTp2oU9IXZ6t/?=
 =?us-ascii?Q?12mUC3Jv85RClsbcUEQxqoPG5YIB1Ler5u7w5c+iBKKpbFytOiL96NsrVybw?=
 =?us-ascii?Q?5e6LyVO96kvz0q+sUKRw6EZoizxw9vlrV/v7Q+9wDqK+dWiQTxl+dJlS+Vy3?=
 =?us-ascii?Q?oLVVPnM0XOiT71HG5+BdtG7X0xtOPO/qBvjSlQRlze07VmImtCwNLMCsJQvx?=
 =?us-ascii?Q?+vKuwr1KkqB5NFJQoR1pDudazE5oagtAIE9A7OaPN8XVAErcGu/8BCW7tl5/?=
 =?us-ascii?Q?pBJgp/ePt+wIDH2lhCQwEESXmbBkDP+tNF71nH4GPBnoI7LfPzB2Kf6ik9gS?=
 =?us-ascii?Q?gFzZVuRQuRdmWrg4DAcIxeLzqpU13P57aXAu2dxaX17W+VLd2QizNlrGUYGY?=
 =?us-ascii?Q?yLMIICmxBQY7i80NPEHdOZhlzkuxd4Lop9yonIf66Qze/IY2Cp19hHNYai1j?=
 =?us-ascii?Q?v+oKCCE6K2qC699nlB96QzoM0TTMGU7obkXotWwCUDG9sWkxY9k3LDVqII1Z?=
 =?us-ascii?Q?6nGK/JNkniWCU1covsJGqbe+ZwpFNZV/ogZcDNx/bA5GYQEGl/mQ0DSuG1LC?=
 =?us-ascii?Q?EoSTSs+a9TBB9Sc/CkZeojR4vH2gHomKp9/D2C1xKakgXHr3ZDhHkt4iphsT?=
 =?us-ascii?Q?F8qpJGuAhcf7IBWRsQrbcIYSLLVIFGjKUuHjJ9wz/t1ZD1KUjUfMB4GxjTyk?=
 =?us-ascii?Q?VJbXv0dcn1IWq2WHAIgyx3FbazbKYo8voNQJvR7fHam3u5O+gcYxFsKry7ob?=
 =?us-ascii?Q?4LyXZC/1CTmQdBvwULpDThETe+AhTBFkcPAqB8vmIvYOuITuY+NIwrQWo5IY?=
 =?us-ascii?Q?y6VUkIQ9EaAiK+smxcSwaS+OVZXsi9B3ZLRKIRQBwJpxBeFXRB3r1SBoRuUc?=
 =?us-ascii?Q?VZdoRly4N07Gs1cZX2fOErupHUk+OXgHjlY5NNNNZneZaYuK1+irESgtkp6q?=
 =?us-ascii?Q?aktpLv89XGdWW5TuVf8prkkgLUD9X4NusesyVAxy?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d3eb7ac-39f6-41bc-cc33-08de153c9099
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2025 09:38:20.1080 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iftVMnczXPC8NniQwoQY4xkDYyug0dQxfRgxnbhrEYW9XDkPnKYhYUSk3eUvDE8246Tv8iPqnWP4GPfCeDzDUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8435
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

> Subject: [v5 09/24] drm/i915/color: Add helper to create intel colorop
>=20
> From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>=20
> Add intel colorop create helper
>=20
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_color.c | 39 ++++++++++++++++++++++
> drivers/gpu/drm/i915/display/intel_color.h |  3 ++
>  2 files changed, 42 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_color.c
> b/drivers/gpu/drm/i915/display/intel_color.c
> index 671db6926e4c..5f38a5ff541c 100644
> --- a/drivers/gpu/drm/i915/display/intel_color.c
> +++ b/drivers/gpu/drm/i915/display/intel_color.c
> @@ -3962,6 +3962,45 @@ static const struct intel_color_funcs
> ilk_color_funcs =3D {
>  	.get_config =3D ilk_get_config,
>  };
>=20
> +/* TODO: Move to another file */
> +struct intel_plane_colorop *intel_colorop_alloc(void) {

For function which are non static we usually have the file name as prefix
For function name
So this needs to become intel_color_colorop_alloc()

> +	struct intel_plane_colorop *colorop;
> +	struct intel_plane_colorop_state *colorop_state;
> +
> +	colorop =3D kzalloc(sizeof(*colorop), GFP_KERNEL);
> +	if (!colorop)
> +		return ERR_PTR(-ENOMEM);
> +
> +	colorop_state =3D kzalloc(sizeof(*colorop_state), GFP_KERNEL);
> +	if (!colorop_state) {
> +		kfree(colorop);
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
> +	/* TODO: Add color op reset


TODO should be on the next line

> +	 * intel_colorop_state_reset(plane_state, plane);
> +	 */
> +
> +	colorop->base.state =3D &colorop_state->uapi;
> +
> +	return colorop;
> +}
> +
> +struct intel_plane_colorop *intel_plane_colorop_create(enum

Maybe intel_color_colorop_create()

Regards,
Suraj Kandpal

> +intel_color_block id) {
> +	struct intel_plane_colorop *colorop;
> +
> +	colorop =3D intel_colorop_alloc();
> +
> +	if (IS_ERR(colorop))
> +		return colorop;
> +
> +	colorop->id =3D id;
> +
> +	return colorop;
> +}
> +
>  void intel_color_crtc_init(struct intel_crtc *crtc)  {
>  	struct intel_display *display =3D to_intel_display(crtc); diff --git
> a/drivers/gpu/drm/i915/display/intel_color.h
> b/drivers/gpu/drm/i915/display/intel_color.h
> index bf7a12ce9df0..f3c7cd694b99 100644
> --- a/drivers/gpu/drm/i915/display/intel_color.h
> +++ b/drivers/gpu/drm/i915/display/intel_color.h
> @@ -14,6 +14,7 @@ struct intel_crtc;
>  struct intel_display;
>  struct intel_dsb;
>  struct drm_property_blob;
> +enum intel_color_block;
>=20
>  void intel_color_init_hooks(struct intel_display *display);  int
> intel_color_init(struct intel_display *display); @@ -40,5 +41,7 @@ bool
> intel_color_lut_equal(const struct intel_crtc_state *crtc_state,
>  			   const struct drm_property_blob *blob2,
>  			   bool is_pre_csc_lut);
>  void intel_color_assert_luts(const struct intel_crtc_state *crtc_state);
> +struct intel_plane_colorop *intel_colorop_alloc(void); struct
> +intel_plane_colorop *intel_plane_colorop_create(enum intel_color_block
> +id);
>=20
>  #endif /* __INTEL_COLOR_H__ */
> --
> 2.42.0

