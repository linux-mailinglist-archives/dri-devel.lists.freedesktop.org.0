Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 163B7A28EBD
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2025 15:16:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4914510E7C6;
	Wed,  5 Feb 2025 14:16:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KM3i6NmG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1551C10E0AC;
 Wed,  5 Feb 2025 14:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738765015; x=1770301015;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uRdSiBJV/7hHQNB6v9DtnnBagbQWclQYmhEzVuJDFPU=;
 b=KM3i6NmGTjuZ+c4GzHeNr0hMAz6qCp8F/h2ctAcBcs5s7n7J9avn6l+J
 fBcVpH7gE9NoZ4//x31DOZLDpT3zazUFBMSIp3cg+tamBV2ytajd9JYu5
 jDkmB5+YyxPq+xtpvpz2N05d12tLLb8bRZWKPvbxr9iTUxg2NQOcUnbdU
 9DKiPnQd7fZGsIWlnvswDZB/WYp9AyGMD5Pq5NbVgx8fKOPMvUcA2jAkw
 +eDIuywI2djCp1Evzy6qObue0VKFxD1Q0nVLIzukU1hOckrXjoq1L5F/C
 IfRdGMv3EhlqW5gnJXHz9lZVsqi5u7MnH1YJQEBCtgk9f+U6RzXHlqp+l Q==;
X-CSE-ConnectionGUID: oG4Y2gFwR06SmR/KWLLxNg==
X-CSE-MsgGUID: k847ZGuvREG8YziIH2nJVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="50320207"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; d="scan'208";a="50320207"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 06:16:55 -0800
X-CSE-ConnectionGUID: BeCfZnk4RP62SUgqKE3SQA==
X-CSE-MsgGUID: 6zcIw/r1SRq666EBiFu6Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="111800725"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Feb 2025 06:16:55 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 5 Feb 2025 06:16:54 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 5 Feb 2025 06:16:54 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 5 Feb 2025 06:16:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AXy0cziB5DEzjp/5tJyHNyst45dMQkmSUL3vDQblQwbSAJQ5OOT5/lC8qb6Crt4fSycqILwdxeyHnMg64pUcdp4c/JuaNhAMn+HfrEBySdDuN4lUv42NE1IAJKTPe7w4li218TEiGTnDGnaflZZ5NiK76kIf0vM3Xn+8T9Mn+y6mdlWtYVEgGebACi9oGWL+0FxZ0CQW4sC3/mVDl/QnLbSixHh/UQeRg0Jf76t9uUe+FRP+25twkNmtXzk05y+qCbIiJc7vC1hEBSctNd5JPfliyO6iQf1xAmTZBvchVwoRg3yHkvklcU7YkmJgeVM1Ebai0mS0Zjz0GWhxjOz1mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Us6V2zRNbXnljv0656cNZ+X4Z+fDXKDPU0+EjC8+eV4=;
 b=SI4n3hV7sLakcorjgidRLOhqVjHXbPjqpHagprFn8leYO8ZZDioqoYmNsU+MAEbbQ7JTDZXoIvgePjNCzVcooFp/Zr9dnjUoIdQZTbV8p1tFCcrDVAS9HRAPsT/zHhy+TdGcRvnqq/K0BFB+t2NSlkcZxr6Md9e6wGkzVAPIZtHZ5YyKILIlt1SlVY9Z2wcneoh+CA9pme+lk/S0Gz+LSBIK4t/A0dxG6bezXwK5IQgRirYqxJJUIJihNeAE8opEcO0PtaxN+AvhBcLQR6th7ZeGUiZUSRW7kYNksOhzCO8MaVOBysPoLIuNvz3pdgdFQuowNxZ8IYfo+sQJ0DuT8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by DS7PR11MB6152.namprd11.prod.outlook.com (2603:10b6:8:9b::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.25; Wed, 5 Feb 2025 14:16:50 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%5]) with mapi id 15.20.8398.025; Wed, 5 Feb 2025
 14:16:50 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "Shankar, Uma" <uma.shankar@intel.com>, "Nikula, Jani"
 <jani.nikula@intel.com>, "Kao, Ben" <ben.kao@intel.com>
Subject: RE: [PATCH 2/7] drm/i915/backlight: Use proper interface based on eDP
 version
Thread-Topic: [PATCH 2/7] drm/i915/backlight: Use proper interface based on
 eDP version
Thread-Index: AQHbdwNjl/l4zuWxCEaUT2MND/d+9rM4wpWA
Date: Wed, 5 Feb 2025 14:16:50 +0000
Message-ID: <IA0PR11MB73077A787020DDC533FF8D14BAF72@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20250204125009.2609726-1-suraj.kandpal@intel.com>
 <20250204125009.2609726-3-suraj.kandpal@intel.com>
In-Reply-To: <20250204125009.2609726-3-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|DS7PR11MB6152:EE_
x-ms-office365-filtering-correlation-id: d61ec3a2-8812-40b6-0e75-08dd45efbb7a
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?M/Z6+i83umUAt5j4AK7Xl2NcnXstblhOaSDxPDdl5DPKr1oUXA45MW7t2P1N?=
 =?us-ascii?Q?x33ETJh3LrYGiLsk07439AyMdiXO990OD/q9efR0o/32ePw8vuzQmsjVlTiu?=
 =?us-ascii?Q?LUnbHjuaXfe2SIRyCipO+Y1pcTnWQOmz28+SiBd6bnOkGRyj5dfvZAxC81yX?=
 =?us-ascii?Q?iZ0n3sS+Lt4mwVl35cm3l5MEQWxcpCtV+/7BO+Gia2DEr6FB6kDqxO98VBLw?=
 =?us-ascii?Q?Vf3VLpGzRNY5hbIW39uNB99YdIWaVrBHYgJ0mBoQnCsrJfGy8+mZ2H7wvepB?=
 =?us-ascii?Q?58Yc1YFD/vEF7p0TLPPojZgZQ7HEo3+aWGyGEy40Jl7j6krl28lOtzjcnomq?=
 =?us-ascii?Q?f2GbREalP+YDWRSFXeXn8izXgvK1yylxkB1jOr6Xx0sFkKRpQQu9o7SBc3OP?=
 =?us-ascii?Q?Awe8wrXWziE32rNXC11vCIbDnTto7jbub+nc4SQ7cdIe+qDENLjbcgXxR3m5?=
 =?us-ascii?Q?OlGUUUrD2fDUdJbiV1/+iyjP68DgGp9+/QEcKTynUONG2/kXYAkklhy2srvR?=
 =?us-ascii?Q?KXn+iSRvNux6bVQWVfZekYXvpwZAtfcxPpzia4ySjDCbToWsQcfDZJx8SFRH?=
 =?us-ascii?Q?fpOzKInFRy1aJCFOfzFZZcML3zb6zUtaIlulMjMPg6Wy3SOA5thw8fG8ub9+?=
 =?us-ascii?Q?N0YzuemenlPK/6IdUpA7HqBYpDNsnqJq1fl3/7ZZO4W66N+xysjWfk6Y+I65?=
 =?us-ascii?Q?KejzOwu5QKRMtcAr8CQb/88+D1Amx73ArrEwRXY3+49v4ZvEbscl5nG3I4/6?=
 =?us-ascii?Q?j7BHJXtP6BEqR4jZ/U7Ck5vs3HDuO385uK2KTm8QwFabuZnPmefbssXSpr9Y?=
 =?us-ascii?Q?tF6eFpF55BJz/oA7tEErrBjVhFM1Z/gJL99PQSvUlpUEp0HfYZhakafETqpk?=
 =?us-ascii?Q?JIvyoQ4tLBuhrqJ7TXtpTwSdpvpdSHfJZVBdLE7BmQPqnZeUxhPpo06RPU+Z?=
 =?us-ascii?Q?ktWeAQrfGXeBKcJcAdFHLFa/M40HeYfp3dyl9/xO+svv+7kevq5RuR26ZPK0?=
 =?us-ascii?Q?xIw0J7tsdHvlVFv9PoPYi0P5DYP3o758jOL5Hexu5nRUqzkiRyar+FdRwbH/?=
 =?us-ascii?Q?oiBI6Pyxb9uA0dO0975mGZJ5nWO02vvqGQppQ9AHBvXhmjSEhoFZI+Sw96z2?=
 =?us-ascii?Q?slVN46ajNScM1/Iqf+xE17anU8VV0A2MqYAWA0e98YBL3mXrAbAQ8/tIR0mh?=
 =?us-ascii?Q?nAc7unHEiA66NL+MfKtx8Fsz+vLW/wOQIJ4iRadPqjmnF0Wk09oOUnk2Pw3S?=
 =?us-ascii?Q?VkjY43KVaSnUO4mz/8cbLb4B97ZB/g8lFFcpouFCVaZYAOlHtVRV5yoM+7oc?=
 =?us-ascii?Q?HthLg2OjT4lIbQRP/5dr0QqXlcCko3cwVaR3YN5p6iinThq5OzKnDMNV+Ckq?=
 =?us-ascii?Q?Bgva1B6kJcpr4W9fvct7nSUhRVFZ8kBhe8hoTe2aiEYDkAnn+UNk6Zqwa7h1?=
 =?us-ascii?Q?uJa9Onesi/qWZLPomGDF58HLT4hSB3N8?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?cQK9rBzNK4ny9iJllluB35pQ7Pt7/mDztXoLcuH8hnqHI5q3DEQOLHVUaP/5?=
 =?us-ascii?Q?4BV8EEbjDo6Un/iiaUhzeuVLrrcqtJ6lymVlZu0+BHmTa5a5JmYAZy1reezd?=
 =?us-ascii?Q?EPElFqxxfsk6/w5wM/BU+7SfWOO1x6DbFfwkkwqylZ62KG7N9dBPXJrOW5sC?=
 =?us-ascii?Q?5gaRP0GM8yKH9I6YcrA3tntEm3UpNkM9t17AvRjUmFxgdD4h8Ytxv2RuJ15W?=
 =?us-ascii?Q?5hDcuR0+6aOntHrQTYh1nTQk4ygvg+CbOUt8BR6XqSVL2C5Jghf5yq4MFvkB?=
 =?us-ascii?Q?LR5hLzlu+DU8O4FKxmW+Y94YJOwDnCYQKXGpRjLaudzAu1zFNJfmpI5h3rL8?=
 =?us-ascii?Q?zjOISKMPNqBh1LAGcWCE/ZSZhRxgFk3atiRJn0Mfxh0As5prrczs4Zh48F7E?=
 =?us-ascii?Q?+fDXYLEvxsbggpI65+QQMZL5R9Ecbo1M/p8Ds6oLw1F0fFFTvHt6Nev896aB?=
 =?us-ascii?Q?ix/WSVQcIx5WmwUbCK90y3h4HcheyWIUSTXXZXJMzsGJblgrUSnAVzdeRr+O?=
 =?us-ascii?Q?MWjIyI5FUfP/5sukGTKOBZZDld7i+RNH4O6qMQ8nb4FIv3nH14j1upNqQI8+?=
 =?us-ascii?Q?SzY8ozgV+ta1HVN0PPeJV5diyAnLpV2zpB5ciUP4OeSjGnafwa4r/okBmtEU?=
 =?us-ascii?Q?uXEo/JMbtjtxjpr8wHHAGMFrNvX8C3pr1qGEvdMVs+rFSdXPsszUp0azT1oj?=
 =?us-ascii?Q?2H/1LyoA00xItqJe4UitnQlcTkm1KjXlApn3gbQXXV21c4zi061yhAPKac46?=
 =?us-ascii?Q?6IprKI7hIWr6CMn9EDByUbKq2xMcSzv2jAHmZM9QN5R8HnmGjipsivaU4CKF?=
 =?us-ascii?Q?9OWELaIMoOpE36jW/Tf1I3+r5zjnANqThva6jZv6jRv+lT5NuaRSSvTMOd5f?=
 =?us-ascii?Q?qZ7u5kYKNNL6EcRyF4SgixA6ca4lQne0Per+g1KO+o/hbe7jdHCDW1CxvYw4?=
 =?us-ascii?Q?8ucBlonIdEHL+XwNVac6NJqR5JqeIlCoBNVPswxiKhr1Y3kDmoOxr7x0q0+V?=
 =?us-ascii?Q?lZ9L48hTh9RueSRQUV/UNWYQrpCTPCoLdwLYqmzxL5VRZD/TMqX1ZwDCU8J2?=
 =?us-ascii?Q?Q2A2I+DxpNIhf/mfgMAlIxevUsyMB/nWsCZxF61x+JouYT5PKDSdHwWX21bv?=
 =?us-ascii?Q?/JPoBInfFDBZ15spbZs1Ns1VvYHmiTV+gXBg/0FYnv4nWzQ0NDETNsCOkLw/?=
 =?us-ascii?Q?TZ+gxWohgxWXBG+IlywYY45GbCOZXTFMCyarlgFsgP9JlE9sxORCx2CqoY7W?=
 =?us-ascii?Q?sxoIQ+cCVwa48zuUjMCjKYqQDQCbS1b9bpctX31KY2gEUJKiujZjhDi1hy9Q?=
 =?us-ascii?Q?wghujndm3Lat+PiOvBpGkkRNAm8T42lUbHpjdOZ8kkXTY4UVEyK3jgYRi5tw?=
 =?us-ascii?Q?VpH1fHX9xumbCo4i+w4k7hT5/6AubGyTnLBd77LcPQchBQBZuzlzAWSppeuU?=
 =?us-ascii?Q?pVCewnvdMcCG8TWwonvM8BgS7pg4fAdhmQSMmDJn+AJdMbmJEifB7Lrw1q53?=
 =?us-ascii?Q?XO9jgNuRPjcTVjy6rhB1NQzHUiEzTs+D2ahZcGW9jc58DZTHdhIXH9mqqnzP?=
 =?us-ascii?Q?AphpfyCQtPBX2pipnCAc0gw2eOH8F6yAU5EhWEFv?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d61ec3a2-8812-40b6-0e75-08dd45efbb7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2025 14:16:50.0963 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hewHAWqbinPcY9Z9rjt5i3QxlabAK7P6lVl+NUJpt/oaebmTE6u6djF2UhvKckmrRCPoZEDRXkw/n4qdJkPOZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6152
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

> eDP is supposed to use VESA interface when using revision 1.5 and above, =
use
> Intel interface for backlight control otherwise. Add check to use correct
> interface.
>=20
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> Tested-by: Ben Kao <ben.kao@intel.com>
> ---
Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>

Thanks and Regards,
Arun R Murthy
--------------------

>  drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> index c846ef4acf5b..09e82f24d030 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> @@ -604,6 +604,7 @@ static const struct intel_panel_bl_funcs
> intel_dp_vesa_bl_funcs =3D {  int intel_dp_aux_init_backlight_funcs(struc=
t
> intel_connector *connector)  {
>  	struct intel_display *display =3D to_intel_display(connector);
> +	struct intel_dp *intel_dp =3D intel_attached_dp(connector);
>  	struct drm_device *dev =3D connector->base.dev;
>  	struct intel_panel *panel =3D &connector->panel;
>  	bool try_intel_interface =3D false, try_vesa_interface =3D false; @@ -6=
40,6
> +641,10 @@ int intel_dp_aux_init_backlight_funcs(struct intel_connector
> *connector)
>  		break;
>  	}
>=20
> +	/* For eDP 1.5 and above we are supposed to use VESA interface for
> brightness control */
> +	if (intel_dp->edp_dpcd[0] >=3D DP_EDP_15)
> +		try_vesa_interface =3D true;
> +
>  	/*
>  	 * Since Intel has their own backlight control interface, the majority =
of
> machines out there
>  	 * using DPCD backlight controls with Intel GPUs will be using this
> interface as opposed to @@ -653,7 +658,8 @@ int
> intel_dp_aux_init_backlight_funcs(struct intel_connector *connector)
>  	 * backlight interface at all. This means that the only sensible way fo=
r us
> to detect both
>  	 * interfaces is to probe for Intel's first, and VESA's second.
>  	 */
> -	if (try_intel_interface &&
> intel_dp_aux_supports_hdr_backlight(connector)) {
> +	if (try_intel_interface &&
> intel_dp_aux_supports_hdr_backlight(connector) &&
> +	    intel_dp->edp_dpcd[0] <=3D DP_EDP_14b) {
>  		drm_dbg_kms(dev, "[CONNECTOR:%d:%s] Using Intel
> proprietary eDP backlight controls\n",
>  			    connector->base.base.id, connector->base.name);
>  		panel->backlight.funcs =3D &intel_dp_hdr_bl_funcs;
> --
> 2.34.1

