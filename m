Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D33F1AF51AB
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 15:09:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 400E610E177;
	Wed,  2 Jul 2025 13:09:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IZps/Pr+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9611110E177
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jul 2025 13:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751461782; x=1782997782;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PY1EJ26qPoFgll/Xnadsrd1E1IYKtXFVoKt/44QMD2k=;
 b=IZps/Pr+jMcOBW7wi2zTASxLrm4HZfuZ8Y+/hJ8IXPiriHHazuzrEteZ
 VPgrLRsUznPIybgfzNOaD4/wF7N1P0YvwhWLKVNE8U3arZ3IOrG/cUjjd
 wF/M5FOGWTD2D1BbmWu5yIu6vY/OBTBl9f25O82pya1hXcD47Yv/p5Tcm
 L6cJVZlyNGcdaaZb1HubDx+0zIyzoaaVHrqE5KbsRJ2aHon+6bysHLFro
 v30TtLib0311GSiu5T/f9HwSwY42+sVv9+pvFY72x0s3P2F7DoJEr7/Tv
 9xOTN83kSfxweD+zvrIGECcI16j3+oJenviB41Yd2/VadG1OXr92uS4op A==;
X-CSE-ConnectionGUID: 4OhMNm2NRR2Yoez1zL+7kw==
X-CSE-MsgGUID: 8OR5ipn8Ty2vNnnBBzmOOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="57563552"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="57563552"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 06:09:14 -0700
X-CSE-ConnectionGUID: mJeA0g8YRiCyI0O3XenecQ==
X-CSE-MsgGUID: VWhKlF/kQ6S9lSzzP6cTDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="185016557"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 06:09:13 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 06:09:13 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 2 Jul 2025 06:09:13 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.77)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 06:09:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j9Yio+VG9n5Oq1pSDz/QEMJamJahEJQ4PafrumbVY0EVjx9nekxJVeEhXGaPxoj4d6NpcV80eG6ljGuDCbgpASsYvHX3cpidPOp/hK2n/SkpLQ7aySY44rcoa97cnZvdqa/byFqLg0UI0FG4ZgeK21gxSluBLaW9CJra9770oL0BRNKrD3KfRcuHp5vj84GESxWh1Q4fF34kitDJgxr/PrzUGJ/5NbzeMwX14mGRK/QCIHANYypzciDLiOMgzFXUNZ2i0mZAOOQO5pEX1gTCt1AteQwX/pSLKZaz4oDeFY6qPG2rivYEgHOTuvPQA1CYLRNB5Uk1s6YAuG/SLaPAOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nw3EBDuZN5M+9A8O60p/C6I7h1rsZzoP3zzG18Oh+Ho=;
 b=lwCtznkWKcmh7WsnfLuVDkqKvA5Xm+6V9J4ZC2FnrE/icGsPM7rFdGQ0tJoIJkjVrX/zF9wy98yII1hAwlx/VvP6HDaXXzi8LYF9Iq0eW3uvQfPxIMm1jxL4C0qX4dGwISmIG9XX8inLw5shIVpIIV258khm2NCC+KcTadlV8xEVruJm4khnoV3Aiqf96bOLzKaNPuxU8eiiOKRvxP2lYhPvIFP59l9bqHetso0mtiZZ7ii9X/8QG8R3BTtLmGJMofaq/VZB//gAb947PoitXAYKMHZOv6fvyyDwiRQ2aSv0UpvUDGsG8zRzzqkWfJkk+kXlL20CUWS2NeoUn4iLhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by CYYPR11MB8329.namprd11.prod.outlook.com
 (2603:10b6:930:c7::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.31; Wed, 2 Jul
 2025 13:09:11 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::9c2a:ba60:c5fe:6a64]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::9c2a:ba60:c5fe:6a64%5]) with mapi id 15.20.8857.026; Wed, 2 Jul 2025
 13:09:10 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>
CC: Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, "Nikula, Jani" <jani.nikula@intel.com>, "Deak, Imre"
 <imre.deak@intel.com>, "Murthy, Arun R" <arun.r.murthy@intel.com>, "Dmitry
 Baryshkov" <lumag@kernel.org>, Andy Yan <andy.yan@rock-chips.com>, "Dave
 Airlie" <airlied@redhat.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org"
 <kernel-janitors@vger.kernel.org>
Subject: RE: [PATCH] drm/dp: Clean up white space in
 drm_edp_backlight_probe_state()
Thread-Topic: [PATCH] drm/dp: Clean up white space in
 drm_edp_backlight_probe_state()
Thread-Index: AQHb61CYyo10iQGAfkCqedIKzRgWr7QezizA
Date: Wed, 2 Jul 2025 13:09:10 +0000
Message-ID: <DM3PPF208195D8D423BDB8FC477429FCA3BE340A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <30b896c2-ae71-4cf2-9511-2713da7e1632@sabinyo.mountain>
In-Reply-To: <30b896c2-ae71-4cf2-9511-2713da7e1632@sabinyo.mountain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|CYYPR11MB8329:EE_
x-ms-office365-filtering-correlation-id: 69581193-4fa8-46ee-cda6-08ddb969a2ac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Sy2h5bP/h9SdjuY4dQeVViOcZ8VeXAdLdEAayt2TY+YSV1QGATj2Og3SyjY/?=
 =?us-ascii?Q?6FQA+m27ShVrWpUyPW0MbVnq4k05xOAivIiEeNNpTWmdJ3Cgm0WViNP6RWry?=
 =?us-ascii?Q?WHF0nhKwvcBtZgU9w7Kd5fnnKYm9bQh/lJGWN1+CnvLa6XRrHY0cqWN5EKFm?=
 =?us-ascii?Q?abA1+mbsEu8vuVfqKPW3q0O/ItyyaMAD+D7kVsDtLDrAeUOLI2oKVQAcItok?=
 =?us-ascii?Q?IpW55nOkrB4E3+G23VESQ+S7abj3+rQ3Ila/Dt2aTFPZAcsYd7gYecDoGaFf?=
 =?us-ascii?Q?f4EmYahzLMP/u+8TZ/mRUHUHg+w4q9mqv4LeArKIWmKGcaHhvoPG9NV5y7xd?=
 =?us-ascii?Q?jkkaw6zK5uCB2G+HlUATMPbTddXuq1rx8r8RAj34S63aUjKmUwb/CreB5yJO?=
 =?us-ascii?Q?1W+iolxz53td0bOjPq2YTu9F1JPKGI2uxa0gKMfoDfMN5uLAqpu5WwRDnKDX?=
 =?us-ascii?Q?akyLAxoG/QJXvOJObDMmXaorCOshKdsETBMkcc1wq4NW8FzfM9Iy9R5ZUHCY?=
 =?us-ascii?Q?u+nJnGbYU4OFtNt6lH+4fN1fuyLe1MSTh3rMER0FLjOvRzQZi/Bfpjo/PGNV?=
 =?us-ascii?Q?bvX0D60oK2Bskqka4qlZxEN9F7CvZ/34Tumh0BshapbFa65aZifndhEgrqEL?=
 =?us-ascii?Q?5lw4mRB3Zkstq8ybi1iNZJqh1DAUDtfOwtO3/6ipFUjTrogoG5to9nSZdcRD?=
 =?us-ascii?Q?vXdii0OU51vv7rLuVvHpyC4CYZgw1VZbc6XXk+xtexWDS0BOe1Q2uIQfU6dw?=
 =?us-ascii?Q?zJezPknHxFyHPayHirR+nfZtG0HDZFkz03cy/athqf8OG6vLOZGvKS/elCMe?=
 =?us-ascii?Q?7axongub1vNrfLb0ghM3nhjXxbapCvQYO/62IJHEQfcCH6FqtASbhoZO3fvn?=
 =?us-ascii?Q?QYGWfy32FQAuOS7EUsZOHkpFhrrMFPYwfLHaPUl1UNHQH0NI3O6IXTQ0i6sm?=
 =?us-ascii?Q?g4cX4uoHD6PKgpCBpM7s7k10ghfmNhitJWT1H/fGlRH7rWYIqMkdSTgfp4if?=
 =?us-ascii?Q?7CrVY63OnZq3MRex8G82dudrd2bQNQu2Djcm2BIgQXuoTD5Lz+pbT0uxYUXW?=
 =?us-ascii?Q?xiViGhKzxYoPXOc4unOC+BlQuNzwg5K0TA/V/Yu0+RtB7w+pN7eP6FAR4IaM?=
 =?us-ascii?Q?QfJ+TwryIzO2uPruCe3wRVbHvHLkcI6+2NF6hBz11baiT854ObgE+l7sE5vE?=
 =?us-ascii?Q?8gQyyWxyTZvwEACf2ZP/s+7N0JR79VhOx3lq/2wsZ/9WsUYfsTON7kTp60bk?=
 =?us-ascii?Q?xrrGngHHCPl9GD8O5j7jGbNkPDAdty4Thasn7RVKjQRM5hW8G7nwxzOcpq18?=
 =?us-ascii?Q?my51UG8Kxdvnv17t3ZYsYC29qWane7zPJTfXBq1Id265TamvxbL1F8e3rcIF?=
 =?us-ascii?Q?VdDEBEc4X9zhtr+V0Pv32zXCEpV/0DCLOPgEDXPpp2XWeZVdUbch35oEPRGF?=
 =?us-ascii?Q?BcwtNG8FJ98QGYgJpo8zf0LbBVohyV6RBB4wDjZlG7G5E+LxiEKUmQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?KZSS5b+5WZRDYkwcbG9qRBjYMSNRjyGu0B2oi40ghS5M36neoSW4PMKgWK3z?=
 =?us-ascii?Q?7/LpLr186x45QwgTL7iP+F/iIT7fT5JpWHfEgg+spvCIEg5+FRqv/hEvQw4f?=
 =?us-ascii?Q?VX91s4xs7vTRtDrVbKoiGkKNhqTxecPSKal0fiIFTMyoJZcIg0NtY8QLKHld?=
 =?us-ascii?Q?8DTXPFcqe2XKfJoBOdLJyxE82b1xWGZMaieykY+7fxg7QCWrK6H8L/QhvfKw?=
 =?us-ascii?Q?uF7dRc1Sh4lfK8LRA4g2tZRrQGVxwzYLnvyckpldmwwCqP8OeFXfkYLBxf6n?=
 =?us-ascii?Q?weRkzoVqMVYMgJ+SgLpq150ExP1qVSfqqBbcbVHQADiPzJpqKPRbA2haNwAD?=
 =?us-ascii?Q?zCHK/RGVpnBMVGG9hlORZeInPN7mmTivFotIJbASWW4cjGxMjPj5p7MPUYD+?=
 =?us-ascii?Q?cCLg+nV2jn19wuIPs5LMVJ1kOuLVjvNV0zYHDmJfv91LpMDWIz7CgcrnlkEO?=
 =?us-ascii?Q?GjKY5wsvNVMDuNlDADw3R08UHexMRLU1yGkgJNwZRbIRSeuONIHXChVozskx?=
 =?us-ascii?Q?LX10VwxqR3ysm+1MDn0EmxGlzMLeWM+MhCriDfVzfTYrivuD/c0eGQmxbRFe?=
 =?us-ascii?Q?wzW8uxSMSV8eEtMREuNL6FFRkaOVMI+YkzdCKtfG8hWlQC252KWiys50fxNF?=
 =?us-ascii?Q?o/0TC2WeUHwvoaoP2tqrFyYrATH3Rco7jHYlgvGB7COGV61vzpyW3ILK6mt7?=
 =?us-ascii?Q?Fvlbv7B2tPo1WjQQVnUsgUT07UW7YdcOf/P6cl+hr4NdoT53y7my5Syze8jV?=
 =?us-ascii?Q?Swky8p8LgQBBE0VeOPlpFsEK/LZEBDvEk/qombE7Hib3jD+totUFoValxXu5?=
 =?us-ascii?Q?3NJE11n27bvpyduZS9wJQ2kdXeJF04Z8LR2QP5/R6EI4MsAsdZpeLBWbgO9D?=
 =?us-ascii?Q?BL6nmKCgaplHdiBuCL5TMHdPLx2gesPSwhgEp0CMLmy4zNwcyo2W3oONecZS?=
 =?us-ascii?Q?Mm2Xyvr4sBFrMNs6eKmtY9YLqYvzvK88neBXKC8NlCqnCgJryjxfpl3O7jPQ?=
 =?us-ascii?Q?wlf925IbBbVv6TRkqLZbV5OUuGZ4tZzjnme5fHrt/1wvhOAQUZ01QOCwEIV0?=
 =?us-ascii?Q?F4zuFAPq869rDRUwQ7B4GkZiXAk6mvNGFjuQm9JK5wvaY/nib3ll841gezOc?=
 =?us-ascii?Q?LLT2knT9BeF+7FCLrgycUDoagvXp5OA9NsFcl8waq1j4P11aeNvu0CwPqApG?=
 =?us-ascii?Q?Wg0aWMPGy68gjY4uRytwu6VYrjP2gxEZ/t79s5qW3Quxv9fpePsKRxpBE3pH?=
 =?us-ascii?Q?4rX0WfTIJwYE51mOCbM6g1jI0ftlhYP9kKx0uB7j3uEhxQbpHLKKrSouYA2/?=
 =?us-ascii?Q?Bmck36bzIfQXELrsrY/wRH4h0gJLMaDVFVtO6iGwSGT7d0yT7WPhP/IdR03b?=
 =?us-ascii?Q?6ZzVLuOoW9Jn76pivJabaxSgHrmWBnWcHbvFCYgci9I42e8xrWh/XkzhLqOX?=
 =?us-ascii?Q?LekY5KOIpebxRpbmnGFHphwuUzm/Ie8B3eKYYlmB9lgtadfi7VV7S4ox2K4A?=
 =?us-ascii?Q?0ROfeRKOjliawD7OQZ+aGO/GlQGwP2hQ9Mpk5nS9+pref/OwzHbhcl+NFc8a?=
 =?us-ascii?Q?EBAgErKlvGHvAu3/wqx1HyLFUdjfZPanaGs8XuP4?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69581193-4fa8-46ee-cda6-08ddb969a2ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2025 13:09:10.8045 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ctIP4rmk9sHIm41ZA6WegNTguHAvhyhncErDPt2huOJLgXpMflOW432FPgLbyPYj7uB8aoLnE+L3ix3GzCewww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8329
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
> From: Dan Carpenter <dan.carpenter@linaro.org>
> Sent: Wednesday, July 2, 2025 6:25 PM
> To: Kandpal, Suraj <suraj.kandpal@intel.com>; Maarten Lankhorst
> <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>; Thomas Zimmermann
> <tzimmermann@suse.de>; David Airlie <airlied@gmail.com>; Simona Vetter
> <simona@ffwll.ch>; Nikula, Jani <jani.nikula@intel.com>; Deak, Imre
> <imre.deak@intel.com>; Murthy, Arun R <arun.r.murthy@intel.com>; Dmitry
> Baryshkov <lumag@kernel.org>; Andy Yan <andy.yan@rock-chips.com>; Dave
> Airlie <airlied@redhat.com>; dri-devel@lists.freedesktop.org; linux-
> kernel@vger.kernel.org; kernel-janitors@vger.kernel.org
> Subject: [PATCH] drm/dp: Clean up white space in
> drm_edp_backlight_probe_state()
>=20
> This code needs to be indented one more tab.
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> ---
>  drivers/gpu/drm/display/drm_dp_helper.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c
> b/drivers/gpu/drm/display/drm_dp_helper.c
> index db7896c7edb8..1c3920297906 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -4245,14 +4245,14 @@ drm_edp_backlight_probe_state(struct
> drm_dp_aux *aux, struct drm_edp_backlight_i
>  					    "%s: Failed to read backlight level:
> %d\n",
>  					    aux->name, ret);
>  				return ret;
> -		}
> +			}
>=20
> -		/*
> -		 * Incase luminance is set we want to send the value back in
> nits but since
> -		 * DP_EDP_PANEL_TARGET_LUMINANCE stores values in
> millinits we need to divide
> -		 * by 1000.
> -		 */
> -		return (buf[0] | buf[1] << 8 | buf[2] << 16) / 1000;
> +			/*
> +			 * Incase luminance is set we want to send the value
> back in nits but
> +			 * since DP_EDP_PANEL_TARGET_LUMINANCE stores
> values in millinits we
> +			 * need to divide by 1000.
> +			 */
> +			return (buf[0] | buf[1] << 8 | buf[2] << 16) / 1000;
>  		} else {
>  			ret =3D drm_dp_dpcd_read_data(aux,
> DP_EDP_BACKLIGHT_BRIGHTNESS_MSB,
>  						    buf, size);
> --
> 2.47.2

