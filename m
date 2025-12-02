Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA820C9BF6A
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 16:32:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B33B10E66F;
	Tue,  2 Dec 2025 15:32:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bC1pj/Ct";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5713310E662;
 Tue,  2 Dec 2025 15:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764689572; x=1796225572;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TlZPvHF8MBTx+N0jjywqboZUcoBLkjgrEsMnfDwO0pU=;
 b=bC1pj/CtDBjyNw4AS7+mnTsX8dOI21IGmvn7xdfIDnZE7CvlfrySMbv4
 Kx/RAqMa9CoQULqbG8r7NpIvXpVdG4Z5S7OxyrAq4PdpuJJBN5UdKQhqN
 oQhXlKXsDi4D4tt5Q2P9lG1ycCmFqurMT+vELLGcA9Zs4JqNZLYqW3evG
 GWXvYHJMV489XXBnudZOJY/3FIVId+8H8U9hD+u4hA3zXsJJcUylMtaYb
 xKMVt471o9CUWiECkOaqsWUh4OFFmfecF0IVeODt507Rz3zri0Ej3r2MX
 nXaFWVO2RjF5JxwzOmQ1N/DD8lfPnUEa8G1hTeFo5o/m+1rf78+R5BqxK w==;
X-CSE-ConnectionGUID: lSEhSL6nTZ69ekANNJUVQg==
X-CSE-MsgGUID: 6t0c0HQ0QhyqEgRYIIj8/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66734738"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="66734738"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 07:32:50 -0800
X-CSE-ConnectionGUID: nc8B0UBdR72M5Veq1EsKPg==
X-CSE-MsgGUID: ZieatL11RjiMYbw1FQjunQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="193707558"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 07:32:50 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 07:32:49 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 07:32:49 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.44)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 07:32:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YZE5kRGxnJr9BLZQLRLrxzkZgVtJgCq6+FhnOR8Qbkk9rOYX6s+PXg+5Tz4AVI1f63V9aMs37LRWqmpW7n48SArEXNv/hl6NlfFiNRXxUNASAtQsDpkhZRpg4d3N4UxSOIbc3O26stS7xsKl8etWEZT4slN5ZS3POOTGDrHDKsHZc6z6RDUA2txGPxDOUqJq4Kb/gJR+DYi46BmyEJ/K/P0BVaWStG19/09Cl2zrxM+e+r0lT0+B4ypEIGwKFe8ZJRWwLBIRWdOlWNPXlmV/ysuwRVkdWBI9RyZnyBH92e2SbYttsftPJFsyEPMR5sTv4+SPXdiQqHULaXNknYCgKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IF2GHb/Xb2spNhCbu0x0xgGtxFq/hoz1s0igfRb83jo=;
 b=I99NipbvtGBmwHh3+rhLh2Ynjogmw6oZYru+q5smyk7O9J5+6OPiJ1BkDg1Pxq2IspAzGTNFsML87K3BcwI70/UqLbAx4UxRIE/MEZj8hA3N3jpccXtRxPV85Vyws146mNN0d359nTjJiNHqpc21gF9wOIk4CgvXzrrLRt8+lbF8PowMj75F8sSFAuERMgWVz5CsFyyHlXiOBWdeWDONDcPXf8nGBQKKw9KADE2l02U/PU0WogOx90efJJ9FoarrXWTicuUicoErIxdk0lHfzbwxLILq62BYR6qi5i9ZL+wZQ07JntXYplLdPPbOqjWkGoafd02IRHFUktQumhexcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by SA0PR11MB4655.namprd11.prod.outlook.com
 (2603:10b6:806:9d::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 2 Dec
 2025 15:32:47 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc%6]) with mapi id 15.20.9388.003; Tue, 2 Dec 2025
 15:32:47 +0000
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
 <sebastian.wick@redhat.com>, "Sharma, Swati2" <swati2.sharma@intel.com>,
 "alex.hung@amd.com" <alex.hung@amd.com>, "Nikula, Jani"
 <jani.nikula@intel.com>
Subject: RE: [v7 12/15] drm/i915/xelpd: Program Plane Post CSC Registers
Thread-Topic: [v7 12/15] drm/i915/xelpd: Program Plane Post CSC Registers
Thread-Index: AQHcYozPlp5SSnNE7E6b0tiWlj901LUOe0TA
Date: Tue, 2 Dec 2025 15:32:46 +0000
Message-ID: <DM3PPF208195D8DFD85AA38F3B352353836E3D8A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20251201064655.3579280-1-uma.shankar@intel.com>
 <20251201064655.3579280-13-uma.shankar@intel.com>
In-Reply-To: <20251201064655.3579280-13-uma.shankar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|SA0PR11MB4655:EE_
x-ms-office365-filtering-correlation-id: 066790e2-9b7d-4640-fa61-08de31b80b84
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?ghBIZrz5AzL+zMFTpqR8qAS/kDFPfV9EH/LzhqAbwudQQvISYfuXizb+yLDO?=
 =?us-ascii?Q?8b13q7ONeMAwMj7dee+9mwOfeYnAkVc8NJFXS2rXuScJKAKRjfhTtMkuknrT?=
 =?us-ascii?Q?0VtHdQoNGwVNV+3Ti+gVLiRCcabvpW3VJUgclR5fN09eTFmVp+aqBvVeymeB?=
 =?us-ascii?Q?g4d+LzaPV0+xNqH/MXp6j37w3w9sM6e3j+QBqtocdSedof7QjXn6WHaTL079?=
 =?us-ascii?Q?ceB/yH9pvuq9K+r4V4f5l5xlKZ5bv1U2gWenaSypL0jX32enqfwaSo/Ck/4w?=
 =?us-ascii?Q?bISy+OIv4SNlc6NOmCwp3yunYzeJyVz0G8jzcPg0qq8jVIniAQZ9SBEdPUZy?=
 =?us-ascii?Q?SB4ymtkFyyWfmGh5TB+eJq8/ya1CKXTFIAVQghKNhE+rDw+q0p2mxEBvv16c?=
 =?us-ascii?Q?Nms8W3gx9PKNMs8W3E90h6an8Rqd2P+VC4ynGd7+U8KZOLIo9rz0FV8Z/bqi?=
 =?us-ascii?Q?6GFChOzFeF/TW8q8VfEb8tYIIYARemtdKvVgcjR6W1RTu8IUp+b+I2bZEPz4?=
 =?us-ascii?Q?AHQFv1T8AMn18fvz2ZMy4cvgNuBKiXPtosEzM78dFPEuZ3AUaJ/klwzrHqRk?=
 =?us-ascii?Q?BvpMPkvk1anm9zxNV9qOcGTQXxGwHWNKd4OCCgoEoa6lU24pKtgF7sIQe/IA?=
 =?us-ascii?Q?zdoJP/fmoyl01HVlotfhj/VFyHoeXKJ1nJ/22cllJ95tIhQlP7th6EW4ulgQ?=
 =?us-ascii?Q?gVabckmKKguEd4574G1gU4YW6HJVYCr9yny9Pw1v16VI+0sKfAx/T4L5jpnR?=
 =?us-ascii?Q?g+YzZrE7WJ9EVeHLGuM9p1EDrIlhbCREGS6UBWYR6v2QXeZIysewDC4Hw/Ai?=
 =?us-ascii?Q?RKLulgr/MWpcn0hxWEMhTWvQM2M6nslPH5UbUCPOhmsTTyzWanUGkshEkOtd?=
 =?us-ascii?Q?HfNmAiSy0ClZ0d4GeLzbHsSa8nkRNVzMfT9/gL2qW2ZJQQF5d5H/Wq2D7beQ?=
 =?us-ascii?Q?CMKL1xtfeDhMJH8twSLI+FxbrT5fykOOJVCQ0MyKCidKDFpHOfsGeXmh7IOS?=
 =?us-ascii?Q?kc7t4ClsaXp8pt+c9ECVaoXF1QlFh1T8muqn6xOjTFfqBCxMr/pZr7SFcrJQ?=
 =?us-ascii?Q?nDKy8Dih6Tk/kGgVdgTVj1Y4ue7G4BLwWZNrngl5Yl9fVkcBA94FXk9FJ8FV?=
 =?us-ascii?Q?RAaLrlXMO8BccFgDa5JnRwCEeLrMHX7r42p6xh8ZwXkvoEyzO46vmrnzhroO?=
 =?us-ascii?Q?eerCmVy9wusc/UoyhoL16XWyFaQ7PCblWAWzq8X6r5LmS/ZHsdSXvjapTAaq?=
 =?us-ascii?Q?Wnzv7Cr6aNSz4KBvkjOk8tkyxAAlYFKrgb2B3ISw7ryPcaDJQhOs379SZLsl?=
 =?us-ascii?Q?7loDkWFumBKH8BVNfuPsMpaFFBmi4JZk+ClefYK8SXIQ3rvfG8TJDSe7at0q?=
 =?us-ascii?Q?JZn5gHdUG9qzmL4zMn/xBXFzSJrUYGHdHTwS5otn2PeJhNuVHQa/Fkbug93Z?=
 =?us-ascii?Q?s3iC/WcHP8y5bCfgus+4o7syfUwugph0o8X0sqkQ2uT4sC9g9kG0Y52dje2i?=
 =?us-ascii?Q?3ZYShAv/kjDQUqSDV2kVQdgT1X0r4qrnHjOz?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GW3A03FxzLEcIatvcnmw9HoOoxnrAHQx7Cctd9Ty1sdxq3xsXcM+n5VM8Lb8?=
 =?us-ascii?Q?nStT+mSo3kQ7RvRKzO2OaadQytpxJB1hd1E6xwsBLS3AtT+qJH0j6+Rqrykw?=
 =?us-ascii?Q?dbWE87Kv7Hp5O9trweUDMmJZKAIR8MDVx9+1aybswnczXcdjMCQKNRghcimv?=
 =?us-ascii?Q?3Wa/WDOqoi3J2SbJJeOvcbg0zX2++xG9quslPmRyx9oorh9XayKNlkDMsWd+?=
 =?us-ascii?Q?lNjYM3cVSudy1mP6q9R6ZM0Uc462jbHDZ0UqyWyqfYuXXFIYduRmz/BgQd4H?=
 =?us-ascii?Q?b8LBtBhkLiHpqzCWC1dP06KZlGMY9g7vt+4JDv/8M0yEHeNLYF/Cr6ABwRZS?=
 =?us-ascii?Q?Y+AfJGg2Nxxy7NlybCnrDYUepQ9uvOrbdLVlU+QM/YcHRPM9m6BeTQf2dsTU?=
 =?us-ascii?Q?2Ie9bdYrlPEQtfXvfFiUOpmjPYhlwzWUwTvANNR8++XG4yZEaG0J9csXKHdq?=
 =?us-ascii?Q?XEZQs1cFZuRepEDOLAnEsJ5YZrmxD+EYLL8dlL6ND4MLIvMjFwL13UKsvWY/?=
 =?us-ascii?Q?yvpEEJ7QgnetZSgGbNDRuUagJIgbYswPc66pdSmry7CYsmHsELG4ga4aQlRL?=
 =?us-ascii?Q?NB2E0/mYmCAMPUmflvmZOWoxSDHnOaB5eKzKYLnz/WBHe6SGfXV0Lj9VodrY?=
 =?us-ascii?Q?RrT5BEog6Con/gKVJ/JBOha1xWsvdS9OQn+nILwGKTyNa2J+IPi442M2xFjn?=
 =?us-ascii?Q?BmwclOJfNl4uKGFm7QIOII0XoWRK+tuB/V/lwarhL9/fjT37DCh1tYPwArVD?=
 =?us-ascii?Q?kptMwM+/VfiHdPvo49DUhcJXIIt61HdL8suVcsBf6LGJKWCXLCoOoOYpgucW?=
 =?us-ascii?Q?JnR7HlRZdQiyKBFYbsL7W9PAZAeMRhYMiY8xHZJee5SUQ3LU2yYbDLEnxt+M?=
 =?us-ascii?Q?eKAsSWH34sYPFOQFsMB0pJUtkN5587vjqmxttPh1MpXkzciqlhAig3R8731i?=
 =?us-ascii?Q?AznGCmr3+B+T9iEg6olFyRCEN89tR9V7nsCZNKAUWJguyBzUA6Ut0YmyEQKB?=
 =?us-ascii?Q?iNSLiDGTXGH8n5Zkw7R7qCW5OKBjU1jDwMWngSxtOdYsqqrPXT2XMm7FQhpj?=
 =?us-ascii?Q?FSMCN8w7s8xr5ma8arIHcsH43TnKIoqT8/klrwKibhVvNIxl9qlbqDrrDYsZ?=
 =?us-ascii?Q?wMroGzGqOgo6MR0xZqaGTdxC+b05k/AfzR6/PZVaoiSkGDFwWHivugohFDzY?=
 =?us-ascii?Q?6285oG5oNEhqi+vuHCCZ4N+tE0312yq5uVVjqq3S4cG1R5r6Zwi91y6Y7h8I?=
 =?us-ascii?Q?+sjMdjz50weeELarDMeWl3TZRdTlVwJKDvHXavHoXslYEtT2Z6rCZP99olGO?=
 =?us-ascii?Q?AcRaqY87TaGUFOAzriu4HyXwZDTcub7bi2bMagOQdK4LPZQQYii6oryt0qsX?=
 =?us-ascii?Q?oOOTZBwZkmdO4R0z1kg2iO0xsdY/SbURKl6lwWXnWUBHP4Bs+BH2l/oQKlMk?=
 =?us-ascii?Q?wBaY0hnBbsXQX36M4G1mUm1JDoRLqguJP94TaF5ISuhKvPLLy+L5pxwHYC0X?=
 =?us-ascii?Q?zKcA45x75pKTtugrS7LAP3nSV3NL5p8vhb1Bep8MTGyJHFdhTKjWtRyK3JB6?=
 =?us-ascii?Q?7qyhs8KO7kS79kfUyK7aex4sYEnpQyekd5uUePjO?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 066790e2-9b7d-4640-fa61-08de31b80b84
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2025 15:32:46.9614 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D2TftyyNCpEOaJZ/7TD+yeGWv802VSJqsrrHwD4NsfGFJuTW7g0vkkIcgYiedmYbSaDeuh8qQ4Ra8mDZ48L+LA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4655
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

> Subject: [v7 12/15] drm/i915/xelpd: Program Plane Post CSC Registers

This needs to be i915/color:=20

>=20
> Extract the LUT and program plane post csc registers.
>=20
> v2: Add DSB support
> v3: Add support for single segment 1D LUT
> v4:
> - s/drm_color_lut_32/drm_color_lut32 (Simon)
> - Move declaration to beginning of the function (Suraj)
> - Remove multisegmented code, add it later
> - Remove dead code for SDR planes, add it later
> v5:
> - Fix iterator issues
>=20
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_color.c | 59 ++++++++++++++++++++++
>  1 file changed, 59 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_color.c
> b/drivers/gpu/drm/i915/display/intel_color.c
> index 2a114d2964fa..86d1fbc906bf 100644
> --- a/drivers/gpu/drm/i915/display/intel_color.c
> +++ b/drivers/gpu/drm/i915/display/intel_color.c
> @@ -3996,11 +3996,70 @@ xelpd_program_plane_pre_csc_lut(struct
> intel_dsb *dsb,
>  	}
>  }
>=20
> +static void
> +xelpd_program_plane_post_csc_lut(struct intel_dsb *dsb,
> +				 const struct intel_plane_state *plane_state) {=20
> +	struct intel_display *display =3D to_intel_display(plane_state);
> +	const struct drm_plane_state *state =3D &plane_state->uapi;
> +	enum pipe pipe =3D to_intel_plane(state->plane)->pipe;
> +	enum plane_id plane =3D to_intel_plane(state->plane)->id;
> +	const struct drm_color_lut32 *post_csc_lut =3D plane_state-
> >hw.gamma_lut->data;
> +	u32 i, j, lut_size, lut_val;

j is un-uninitialized here and it remains un-initialized even when first us=
ed can cause unforeseen errors

Regards,
Suraj Kandpal

> +
> +	if (icl_is_hdr_plane(display, plane)) {
> +		intel_de_write_dsb(display, dsb,
> PLANE_POST_CSC_GAMC_INDEX_ENH(pipe, plane, 0),
> +				   PLANE_PAL_PREC_AUTO_INCREMENT);
> +		/* TODO: Add macro */
> +		intel_de_write_dsb(display, dsb,
> PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH(pipe, plane, 0),
> +				   PLANE_PAL_PREC_AUTO_INCREMENT);
> +		if (post_csc_lut) {
> +			lut_size =3D 32;
> +			for (i =3D 0; i < lut_size; i++) {
> +				lut_val =3D
> drm_color_lut32_extract(post_csc_lut[j++].green, 24);
> +
> +				intel_de_write_dsb(display, dsb,
> +
> PLANE_POST_CSC_GAMC_DATA_ENH(pipe, plane, 0),
> +						   lut_val);
> +			}
> +
> +			/* Segment 2 */
> +			do {
> +				intel_de_write_dsb(display, dsb,
> +
> PLANE_POST_CSC_GAMC_DATA_ENH(pipe, plane, 0),
> +						   (1 << 24));
> +			} while (++j < 34);
> +		} else {
> +			/*TODO: Add for segment 0 */
> +			lut_size =3D 32;
> +			for (i =3D 0; i < lut_size; i++) {
> +				u32 v =3D (i * ((1 << 24) - 1)) / (lut_size - 1);
> +
> +				intel_de_write_dsb(display, dsb,
> +
> PLANE_POST_CSC_GAMC_DATA_ENH(pipe, plane, 0), v);
> +			}
> +
> +			do {
> +				intel_de_write_dsb(display, dsb,
> +
> PLANE_POST_CSC_GAMC_DATA_ENH(pipe, plane, 0),
> +						   1 << 24);
> +			} while (i++ < 34);
> +		}
> +
> +		intel_de_write_dsb(display, dsb,
> PLANE_POST_CSC_GAMC_INDEX_ENH(pipe, plane, 0), 0);
> +		intel_de_write_dsb(display, dsb,
> +
> PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH(pipe, plane, 0), 0);
> +	}
> +}
> +
>  static void
>  xelpd_plane_load_luts(struct intel_dsb *dsb, const struct intel_plane_st=
ate
> *plane_state)  {
>  	if (plane_state->hw.degamma_lut)
>  		xelpd_program_plane_pre_csc_lut(dsb, plane_state);
> +
> +	if (plane_state->hw.gamma_lut)
> +		xelpd_program_plane_post_csc_lut(dsb, plane_state);
>  }
>=20
>  static const struct intel_color_funcs chv_color_funcs =3D {
> --
> 2.50.1

