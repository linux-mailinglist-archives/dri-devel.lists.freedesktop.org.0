Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1B0AD05B7
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 17:45:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8761010EAE8;
	Fri,  6 Jun 2025 15:45:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cSveSs7J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E65610EAE4;
 Fri,  6 Jun 2025 15:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749224731; x=1780760731;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:reply-to:content-transfer-encoding: mime-version;
 bh=E+pPaNsaIc61aOtPjsRB+GBK8nvyjRi6m+3CeLB+AqA=;
 b=cSveSs7J9ZbQh7g5bCSpwUIQs/cpOK5vJsVy8ubsbpu7a+akYPM84yBn
 hf+Xfj/Pj9xWFJk3eNe3QEfchBdVzQDPzHtSgVov9uXD+fpBLOydHYVtw
 w3h2T9bflW1AELQfp2Y6XUXAY/E3HVz/qxKF+Lmw544A9VFjbOi1AOr/Z
 7LNoMQx5KeAcEZxi7NJWNKxux7T9s53i7On9ZCboAv7NRpVCJGywZKiDM
 YA3eNOuJKQPWT9qfpYC35ytOXPSk+EKt6VIRVSLdlbpsNIUi2kLowHxIN
 mXZUiIjQBF+NhO52ok0RgLHDvTmKzArtAoxDQNFjlYsqKceltc/ocKl/h w==;
X-CSE-ConnectionGUID: D7NgE1rhSZOs9tDBylgSGQ==
X-CSE-MsgGUID: E5K8kCGLQV6IrywtdUfNeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="68818961"
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="68818961"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 08:45:30 -0700
X-CSE-ConnectionGUID: pMbT/4v7Q5aYz5fYWkZ4kg==
X-CSE-MsgGUID: Jw+zx2xEQnuzYoKijuCkVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="169046140"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 08:45:28 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 6 Jun 2025 08:45:28 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 6 Jun 2025 08:45:28 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.65)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Fri, 6 Jun 2025 08:45:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N8GFumiyBpLDoXnjVIMWQKBfqo+9PjhG0+T8iHGIkXmbg94d3FYvCSdysjqf3/abUntHEbN4WrLC4hugvIxXqI/kNsY68SJPpOWTwGlf4h/wnv8UYPEk4wSnyTWO4WCOxpEuHjZNYhuwL0nAG4s15wBAzZzY553Oc/DIqELJ6OKPZVFhJ9jbFhn7sVIRzsuPnD9KHD0ySVKiq6zp06J68bxSFz91nNkAtSuIRonAjwKRY7AqSMUwOhKKkNkia7vl24Le1ysDYoIDZjfc2AeZiF2bwDzLd4UH5ya1ED7ZfwccSnalcReC7BOfKplb6Fmc98DVweo9GeYrondpifEvYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=txNFlNr2YHftYGyJZJfkF2sW0A9hNdCMd6bSKyGJAuE=;
 b=C9YmO1FXK2yNEjU9jzEzwQWiIVdwtFyZ/gsIlEXcOMna9F66lgvBNN7PNP1x92JOSN0bmau/VJBGRy7ac3IsYTxI9NlP+c5mSpU8ZbJKA4n4Kz8eEowDdtPzA7WCW/EYWQU1RDFNWKNMNUi7Mj0fSzy5POE89XNrRgN1l7lsfIVxVanR18DOz1KAWkCgcZ6Ufp4ftpucFF6Kj7UME29snbINOLd5ie9/lZ/Zal177kf46QSceRGCokLBX7kNbbLCfeV2zwABIZ3eQPUQKFb6mpl+kU5hM1Qb0zWjuWzP/jt7pnnoIZDCV/zi5fpfXJnkwwtddlabd2XUzT7orGrr4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7578.namprd11.prod.outlook.com (2603:10b6:8:141::16)
 by IA0PR11MB7934.namprd11.prod.outlook.com (2603:10b6:208:40d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Fri, 6 Jun
 2025 15:45:25 +0000
Received: from DS0PR11MB7578.namprd11.prod.outlook.com
 ([fe80::ba7:2682:35a5:945c]) by DS0PR11MB7578.namprd11.prod.outlook.com
 ([fe80::ba7:2682:35a5:945c%4]) with mapi id 15.20.8769.037; Fri, 6 Jun 2025
 15:45:25 +0000
From: "Lee, Shawn C" <shawn.c.lee@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Heikki
 Krogerus" <heikki.krogerus@linux.intel.com>, "Wysocki, Rafael J"
 <rafael.j.wysocki@intel.com>, "Yang, Simon1" <simon1.yang@intel.com>, "Doug
 Anderson" <dianders@chromium.org>, Maxime Ripard <mripard@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, Jessica Zhang
 <jessica.zhang@oss.qualcomm.com>
Subject: RE: [PATCH 1/4] drm/panel: use fwnode based lookups for panel
 followers
Thread-Topic: [PATCH 1/4] drm/panel: use fwnode based lookups for panel
 followers
Thread-Index: AQHb1sJNM0oNgs+Vo0a5ge9iqW8oBLP2REYQ
Date: Fri, 6 Jun 2025 15:45:25 +0000
Message-ID: <DS0PR11MB7578FD4878DB620F0F5D0908A36EA@DS0PR11MB7578.namprd11.prod.outlook.com>
References: <cover.1749199013.git.jani.nikula@intel.com>
 <1ed7cfca02f8cf14347dadfe027197dc15791383.1749199013.git.jani.nikula@intel.com>
In-Reply-To: <1ed7cfca02f8cf14347dadfe027197dc15791383.1749199013.git.jani.nikula@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7578:EE_|IA0PR11MB7934:EE_
x-ms-office365-filtering-correlation-id: 51338215-b590-42f2-13f9-08dda5112794
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?f9Y0utUVOPv9ParJOvZilOAlZgfoRG0W+vuj9NaYUGmRvCwwjJKZENLCLoms?=
 =?us-ascii?Q?+Ao2V/voh+SqTSTaU9VaikuIILFXJuzVtLKWfLGN8rjwjVRMPYXQakTvI/IT?=
 =?us-ascii?Q?SDjZJOB9wJKkHuPpthhm40x6jHq8QuojEG55PlqkwsVZb0IsQAI5222vkYR9?=
 =?us-ascii?Q?+I0YJSLcqw6wzUT7Cv9xogNlwytTLB3IbVahZDI7ufW4+W3OUIO87HCunxaA?=
 =?us-ascii?Q?iS6UVPLDdeeg6kbfmFa69Flsf/gVcXJFjkiaPu14RiIL/B/DfXYFJqO9ASdY?=
 =?us-ascii?Q?+Ca2JsX8mAvgrq9Md7W52m/OhCiAb8Z0MpZF1z4HKbuxRE2nmoF/elWZo72X?=
 =?us-ascii?Q?S2pyXHaY27/UFsqzfYKAS6z0AopxrNER0siJgdn5VLgFxaebMmbcSZsOHUdg?=
 =?us-ascii?Q?y5M8fCZ1CLWydR3ylf0sUj+8eeI6Li/VnG/CV5y9lPOiReOjjCC0p0g1JXeU?=
 =?us-ascii?Q?vQP00hdWoLtBpZNGtzjymVKPY9kcLbHG9OAavGlB59irJ08lwyWQPg1WA/ig?=
 =?us-ascii?Q?mMY0AbiYbAXYzuvIEqNjmmM8PJ3jUlFrjUkYUg6qVkmYAkmgRfdQ1UebWlcd?=
 =?us-ascii?Q?qq9uDl+116WNfhpkWaJwZ5/Vsd42KcPkbT4C7bTTHLdnN+boW2SN66lV4LUl?=
 =?us-ascii?Q?EpJJc8rmIkjT6FtiXQ1NPC9pmhfgmbOC2g5YBDhyPUei5wcz8pzW1cRNjU9z?=
 =?us-ascii?Q?urHX+S2Jv3EMEe2cZg4sIJCJTu3zlyZYJ8hkG6Vzuh9K9lZO70dlf6AQ04wv?=
 =?us-ascii?Q?lRnzthpxFamToroh7VehEIfQ4przIqldXWYGc+O5TfNC6OB0F+O3yXARX3oY?=
 =?us-ascii?Q?xHlD6LB9OrChkwss7faoq5Hotbb4lfBmPGl/9V3B3dzqJzVAh5CGAcwqCfzJ?=
 =?us-ascii?Q?jw8bDnnNhywI8mzRsyuqnjJLdnqTiaJ6Ydw8X8MZdP8cZ0XjO5zSokC8daWE?=
 =?us-ascii?Q?8I5bfwzTnzKmASHIPGsnarGZVxLe+14q1ktzIhxU5EBSQ109S1HM/4FyRv1g?=
 =?us-ascii?Q?IBKo/ZFVF1MLeyuLSYx2wFn1171wt5Ax39GK0jWHYBKeaxFF+weseDy4y8Ps?=
 =?us-ascii?Q?WMO5zp2nfgpkuqew1eUqpV8LJJwYLl7Przv/l1+JSDI8vUdTFbfQlz3v7C7p?=
 =?us-ascii?Q?HEBNoGdxBPpO/y+DBqUs4qNebFxIWYV+Az0sQ282PP7PzBAzORp07DgXYaBR?=
 =?us-ascii?Q?MLUtwOzfEp0UKRGoc02OfrocwfeavSeljjFB6Vf5qVb/84rYqZlvIjf6ng3P?=
 =?us-ascii?Q?dG7oUI6xQ0SH8mCjwWRfCowu43ECpw/ubzT/Tus5CnXECrSScsv9Qj6D6bk8?=
 =?us-ascii?Q?5xbHvRqlEwIBCEs9uqQCKYzzLfk6/zB3DlDaaJxC8l4/K58uX3TuNVzNgUWp?=
 =?us-ascii?Q?e1fcKznvq5D+/sZyWSCFQssl7WBvh673wHj8eZa1qCeXeQGXGnZ26gBVRXV9?=
 =?us-ascii?Q?XC4604zpiWizBqsD8N5cSxa68NGMw0G1d2EfEKu41W0Ydp1SmNFYoxCQYTIT?=
 =?us-ascii?Q?nI+ydCBy1jmoQm8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7578.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Kn9kPC2FrNFuglsGXJ7mxfczv1+oM3OUi9DDcLWszKR45TZ6qn4QeN6//W0e?=
 =?us-ascii?Q?JkDyxo6MQGoUw0X/OadgidcA2Q7/ugCqnm5W0pu9HW4tZHG7oVkxD2FPl8mU?=
 =?us-ascii?Q?eL1nfOp/Lp/9TjWaPC9NW8OH2avdZTsiT3FuET3fMIXU0HiTMx7BfTcN98pZ?=
 =?us-ascii?Q?2j14cRlLmeG+QmGcg/4FRwwS44X2XEm/NH4bNnTLxdoagzzNg1NuMFjDxYn9?=
 =?us-ascii?Q?wX5AfvGtoLd2ef7wmLW7yR7+rITsXGa9vzuShtsXufTeBJvhi0xyHD1gdBci?=
 =?us-ascii?Q?hRQ7Y/sXJ2GZa07CGwgVMROd/3GMkzuCsIt5JuXTs7PGoDKSpwAZoSlxeNtM?=
 =?us-ascii?Q?IZmLGLBZnBVEog/fpcOCYKZK7FsDhQK3/PRfgqHFLKpQgukJGWsodjPNDxNY?=
 =?us-ascii?Q?udoDDFQgZH2QvW/jWfWSo1xCjr0rEzrkjeYemoDLrPTyafhI3O/MgljNUalS?=
 =?us-ascii?Q?BmsRSJRVkexw7jhUATPIgSybechNDe8tmwcWZv0hUCvjS6PullOpyiWOe0kg?=
 =?us-ascii?Q?zbknjLqIR1p2FFtEjk8EwHJ0YBdD/zJLL9PplG0ji3vf/Cj0DeCybWRepdIN?=
 =?us-ascii?Q?hQHOw//9dzIBzS3rWKg/cOIINjuHWS/wQZIIeCe9UQU7lUYu9r4/8R3dSUYy?=
 =?us-ascii?Q?6rjwFB0tmKX9TcKeh6pfMSq+KOtQbYMRZR11qfhmayoxl1t6uvCRZZ0v3B6m?=
 =?us-ascii?Q?E6AvasLa7pJOcCVFn8xKP0/Eor2xpA0WS09Lhr3y+jw5yEj6eGmvXwnnbSLF?=
 =?us-ascii?Q?+SK8cGUtETQ/gNsCQ4q2/ndTXivZ0D7AsZbdvv2CYEtdrZc181ZObGMUuoLa?=
 =?us-ascii?Q?EWTpQeX4OfSe1qBsDEMY7zkHIIhXwtgcva+7Vja5tR5LR41zqBCS9JV4acQA?=
 =?us-ascii?Q?SlT/wz6GuwJ6TU8S+OIyVDZ6M1H9hvie+jgPkcpx/OLnE0ZpTPe22d03ZrFl?=
 =?us-ascii?Q?U+G2Lfouwy2I9LCWmKrUQMbMs/G4t8jT2GxcAbqAuB/Q4XcBnSVTcQFFmZBM?=
 =?us-ascii?Q?PAlFYDcWRKYhxDEbHlwloIKJPY5Ly1FyWYgYca42zCooMeLLcdTtGUkzwTZA?=
 =?us-ascii?Q?EtgK1ledbJdY18U5iznrSTw9OSEzZ6YUmCkv4LKOWwxatjkJ7KBInk0UtCEV?=
 =?us-ascii?Q?IVv3P1ALvQQIHLIW79U/yUUVm1a7nz5WNRi2TCdvKzhlL+aXJ4D7mqnIWYPW?=
 =?us-ascii?Q?gB9d6Gnq76/hNtaEo/qWBKNIBBERENtMNay8qJqF8ZbtFTMqVg55v2gqNQ9O?=
 =?us-ascii?Q?pmWyGMpLDLKI0zokaqVY+dfaV3R2woJ8ha7CNsJrpLQE+LMh/UtkWXvlZSa3?=
 =?us-ascii?Q?+7zM1qkF+5vpVBAsj167Vt21Tmgvq3A/c3f41K1MrDGO/+ZABARchkQTG80G?=
 =?us-ascii?Q?cJ0lrELkRAKEEqZZy12YDEeKosAgAjLonxy0/wvNwEiJsagqSgxxJUWMwSt9?=
 =?us-ascii?Q?ekvsIDS2TeL+5QjQC2s5GY2Tj/y6efAMy3NYj2IVYJlc2qqgvq4zDkmOKB7U?=
 =?us-ascii?Q?sewvuu6ev8GFyvg3Kah8uSmq/e/Tg2BxaIoB6CxBgaTS4PtKykShnaQG9os1?=
 =?us-ascii?Q?5uhkUmhVbuK2w2ENbgGWJ6Hb45PTxKkp0tcfWT3P?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7578.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51338215-b590-42f2-13f9-08dda5112794
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2025 15:45:25.3181 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LBujPwnefyHxgLPa/D65ygLGz2ZplqqUtuZNFD4bwONPdkE8Jd7p6GuA5QbZZ4R+1kq6xMyx1CCvLlKbbzU59g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7934
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
Reply-To: "1ed7cfca02f8cf14347dadfe027197dc15791383.1749199013.git.jani.nikula@intel.com"
 <1ed7cfca02f8cf14347dadfe027197dc15791383.1749199013.git.jani.nikula@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On June 6, 2025, 9:05, Jani Nikula <jani.nikula@intel.com> wrote:
>Use firmware node based lookups for panel followers, to make the code inde=
pendent of OF and device tree, and make it work also for ACPI with an appro=
priate _DSD.
>
>ASL example:
>
>	Package (0x02)
>	{
>		"panel", \_SB.PCI0.GFX0.LCD0
>	}
>
>Suggested-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>Cc: Neil Armstrong <neil.armstrong@linaro.org>
>Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>Cc: Maxime Ripard <mripard@kernel.org>
>Cc: Doug Anderson <dianders@chromium.org>
>Cc: Lee Shawn C <shawn.c.lee@intel.com>
>Signed-off-by: Jani Nikula <jani.nikula@intel.com>

This patch series was tested on my local device. And panel follower works w=
ell.

Tested-by: Lee Shawn C <shawn.c.lee@intel.com>

>---
> drivers/gpu/drm/drm_panel.c | 39 +++++++++++++++++++++++++++++--------
> 1 file changed, 31 insertions(+), 8 deletions(-)
>
>diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c ind=
ex fee65dc65979..3eb0a615f7a9 100644
>--- a/drivers/gpu/drm/drm_panel.c
>+++ b/drivers/gpu/drm/drm_panel.c
>@@ -473,17 +473,40 @@ int of_drm_get_panel_orientation(const struct device=
_node *np,  EXPORT_SYMBOL(of_drm_get_panel_orientation);
> #endif
>=20
>-static struct drm_panel *of_find_panel(struct device *follower_dev)
>+/* Find panel by fwnode */
>+static struct drm_panel *find_panel_by_fwnode(const struct=20
>+fwnode_handle *fwnode)
> {
>-	struct device_node *panel_np;
> 	struct drm_panel *panel;
>=20
>-	panel_np =3D of_parse_phandle(follower_dev->of_node, "panel", 0);
>-	if (!panel_np)
>+	if (!fwnode_device_is_available(fwnode))
> 		return ERR_PTR(-ENODEV);
>=20
>-	panel =3D of_drm_find_panel(panel_np);
>-	of_node_put(panel_np);
>+	mutex_lock(&panel_lock);
>+
>+	list_for_each_entry(panel, &panel_list, list) {
>+		if (dev_fwnode(panel->dev) =3D=3D fwnode) {
>+			mutex_unlock(&panel_lock);
>+			return panel;
>+		}
>+	}
>+
>+	mutex_unlock(&panel_lock);
>+
>+	return ERR_PTR(-EPROBE_DEFER);
>+}
>+
>+/* Find panel by follower device */
>+static struct drm_panel *find_panel_by_dev(struct device *follower_dev)=20
>+{
>+	struct fwnode_handle *fwnode;
>+	struct drm_panel *panel;
>+
>+	fwnode =3D fwnode_find_reference(dev_fwnode(follower_dev), "panel", 0);
>+	if (IS_ERR_OR_NULL(fwnode))
>+		return ERR_PTR(-ENODEV);
>+
>+	panel =3D find_panel_by_fwnode(fwnode);
>+	fwnode_handle_put(fwnode);
>=20
> 	return panel;
> }
>@@ -506,7 +529,7 @@ bool drm_is_panel_follower(struct device *dev)
> 	 * don't bother trying to parse it here. We just need to know if the
> 	 * property is there.
> 	 */
>-	return of_property_present(dev->of_node, "panel");
>+	return device_property_present(dev, "panel");
> }
> EXPORT_SYMBOL(drm_is_panel_follower);
>=20
>@@ -536,7 +559,7 @@ int drm_panel_add_follower(struct device *follower_dev=
,
> 	struct drm_panel *panel;
> 	int ret;
>=20
>-	panel =3D of_find_panel(follower_dev);
>+	panel =3D find_panel_by_dev(follower_dev);
> 	if (IS_ERR(panel))
> 		return PTR_ERR(panel);
>=20
>--
>2.39.5
>
