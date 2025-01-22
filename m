Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90EC3A18B38
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2025 06:13:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C4FE10E2C0;
	Wed, 22 Jan 2025 05:13:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N+UCUGmD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7B8510E1D8;
 Wed, 22 Jan 2025 05:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737522810; x=1769058810;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=EWqchxGDXB7h9hA+FJnm2Dnh0O9YB6gtbyZFdIlED6Y=;
 b=N+UCUGmD82Qma/w6YyWTP+B5lRD7HMyG61vKhhGco9xZEM2rdXmlQ4on
 OHoN36FSOdrTSW44WxQ6q7Ly1n3mY04B9GRTbttsh28SBRbyILi4vf4Bw
 j1BfV0QgNgLWnY/i4TVLcnY/HFIhw+jh/u6HSKu8EMEf3/NGVUloWu93k
 9y1jtfRKge5FDK+3oF25YIXObvKwMeJmcm4+Tvxl36wtLe9H3znTtZb5V
 Y0Qg5sLGZ59bNxJV8aTOXRHLGFwBMfHpNQuU5u28eBd7l7WnZjMrBR8H2
 /2Euf8JpInJ9XHIxrIoKgUWB1SlIsVHUXC5ueYVfBmR2hwawS+NUlJl3H w==;
X-CSE-ConnectionGUID: 2SdPZvCTQBWoGMqcCvzINA==
X-CSE-MsgGUID: n0cCKNmrTAqmyX5rzxOMNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="37234504"
X-IronPort-AV: E=Sophos;i="6.13,224,1732608000"; d="scan'208";a="37234504"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 21:13:29 -0800
X-CSE-ConnectionGUID: SwmeIQXQRkCVKeGUOTMAyQ==
X-CSE-MsgGUID: Ls3AEiKYTK65yplzrI0iUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,224,1732608000"; d="scan'208";a="137847691"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Jan 2025 21:13:29 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 21 Jan 2025 21:13:28 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 21 Jan 2025 21:13:28 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 21 Jan 2025 21:13:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cr87+xzcNZBz85qmDKA5ZMufa7QoJYayAtmulqD9q9oWEIKhqXB/DlY1iewlGeyThVXPx81UiJp6XCvmn1w25xrgIL1zqUdP3b9rDvvZqmQjDzm0z08qRyCJ0inisC7IP7zsrGbD2h6SEZkXgraWFNe4dT1kffd10m17c67hPyvRyAw6XbmGoDUL3tCKhbWQjBj/BgEZFwVpMqFS1JYUgpyJw8QLp9W6VaFBlPclxtmOypmk33ocaahKUGcTIqZCkJ1y0BWlc5QRhQx2TRPjjht8iQgjowzJ9nv9Xbzgib9ReGg2rU8pA+Ehq9ukb5n8cF683HecVG2vhxSOQb6osg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rzynNg17v9msDNPqBsALkV9b2+/q+zUSesgVAe31Ef8=;
 b=P7Fk2pJXU8L1DVFrqXsW0bDlb5YrhsOhHCTqQdmttilegRip7Bnzgh6vscPDfPe5EIO5Ito5izMLA6d52OcnT1tsdCNmNeklIFz+PR5kN3zIQGvHAXbFGxdExsM5idXTQZh8sHDkAAkKM5q4lgJDnsPNbw9j7Fy8S9eWq45odQlniBIuO0050tr98ZNJ80RGSbmhvdVmt7digFHxQnM+Mq0fGy3n8D5YffVgCKcKpM1N//mG1lqUsJtCPDRKeVlWuzPvxTCZhVqRDSIs00KWzqf8WCG/oAkYp93WWaiDU1paCogOWP6dMZVr9wpTm449Zt4seqStfdTrevN3tStB7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by LV3PR11MB8726.namprd11.prod.outlook.com (2603:10b6:408:21a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Wed, 22 Jan
 2025 05:12:45 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%2]) with mapi id 15.20.8356.020; Wed, 22 Jan 2025
 05:12:45 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>, "dmitry.baryshkov@linaro.org"
 <dmitry.baryshkov@linaro.org>
Subject: RE: [PATCH 3/3] drm/i915/lttpr: Enable Extended Wake Timeout
Thread-Topic: [PATCH 3/3] drm/i915/lttpr: Enable Extended Wake Timeout
Thread-Index: AQHba8qQ/JYaaZ2XnEa+AmFPVA1KL7MiPyQA
Date: Wed, 22 Jan 2025 05:12:45 +0000
Message-ID: <IA0PR11MB730764FC2D1F998E995DFC00BAE12@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20250121060522.1296166-1-suraj.kandpal@intel.com>
 <20250121060522.1296166-4-suraj.kandpal@intel.com>
In-Reply-To: <20250121060522.1296166-4-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|LV3PR11MB8726:EE_
x-ms-office365-filtering-correlation-id: 5066f38f-633c-4c93-afa2-08dd3aa3683a
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|10070799003|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?+7VGeasL08XoRYBHcROVqBdtylIapX5ZIMRZDAgy2HP0pDHx9mGvJ7v/dLQd?=
 =?us-ascii?Q?nQjzknLPKh3Ix3vafYwRSAL8TODT5GhQOsGQwRhou4KTiqa1uOzuOTXXv39S?=
 =?us-ascii?Q?wuXT7xKSDUf2SpSDFZ3iPiZBT+t+WYfaqhecTncYhnV1f0efYHhcFRfvAUDO?=
 =?us-ascii?Q?9uVz6S/w8usNW9T7owgIIcRlXqKofPyTyiLxzpUxEDhuN8G9v/sLmhbC1omL?=
 =?us-ascii?Q?L7Kt8K21s/vQj+ZfjdQGidJnfdHq90GKvVTHFsVBQ17Guy4qRKVfcXWZhaG2?=
 =?us-ascii?Q?AZVnaURZOrGTLSjFV+hfmJEXo4ir/Y+zmg331RG3fCjY3dPmGYlY3Re8Pwjp?=
 =?us-ascii?Q?jV6cNspBBHn5oXj7/45MJa79dI4NbBeQwoq5vLYCL1NbfnhLqsmiN/AoESjI?=
 =?us-ascii?Q?dANZoWXhR504lfeluv2GAaO0lE8S5ROz03TZD2IXtXqUUCRmsWZUJwlnvrjR?=
 =?us-ascii?Q?A+7EuadDvIxRD1+THWuadS0d3HWYzW6Ng5u+S+Db3sq1OAj4PeF+KiEBgQur?=
 =?us-ascii?Q?RHaxdFapk5EtRVFsKBFRXIyIm9IljQFi2gvK3Lm1W57QewAZLn7rnjpDwRYU?=
 =?us-ascii?Q?M0W3EFhiykxPEAXyGf8eig9Ba9o+OlRsqYLpqZcmveqWUEZE8QU4h3CjHVK/?=
 =?us-ascii?Q?jZwH410UqFAmGXecNus3kb2XFtkJe/8bssMap5FrbBsSbJYgHemQZ1pQMYrL?=
 =?us-ascii?Q?CVTT+OyG1SBSdJyMiRJJHox5uDATaC5BbGyUDfth7F9g6LK/SWqEtCvMZIx0?=
 =?us-ascii?Q?QRySyYCgoykJ26whO0uJfF3jUmPNOqe9q1ixFQvEFy8EUfTWQ25/OpaWcjJq?=
 =?us-ascii?Q?pRYTquKv28pxlMpoMTI5wDVfMj3mKIek2eRuZS3CKdn6j53oMYaCgR/YRgLh?=
 =?us-ascii?Q?Utzwp8aaH2b1SSDOiNVX1VRa/iIpDbuCTb1SXEtdrjNzBiwpym6QYCtJdxRV?=
 =?us-ascii?Q?JyPrNgNbQA3uNjle4i/ND6c4aWn/3yQXsLkWgL7P6z8H97/Y27ZdgJhksi9F?=
 =?us-ascii?Q?LwkMQ2aHsrwGQsrdW50NE7jUSuueMkDoZpENcioX8Lx8M9jFtimGacoHJm8Y?=
 =?us-ascii?Q?lUhm/CVsZNWLykxMJyOkgQhU9T/BCyuEwMYXkDn4Hzj/ZHHxaVHhs1R9UhRM?=
 =?us-ascii?Q?vOdYQv3QGday5HzxXj3lRa4EpvUrQw5E5V/XS7NmhJkRMu5A+2g1jl+Q1t/8?=
 =?us-ascii?Q?+WiJbkYUEb4vc3PNoz9hu7btF3KlkeMKtdp19YmreklhR8yFOT23XDcliJHR?=
 =?us-ascii?Q?opPscjclIRlaVNwwsjo5ZuAn9L1uHN7Qn/jHJyKJOSGfp8SrzgW5RKKlEYzT?=
 =?us-ascii?Q?okqwiwiQ8y6onxdPr6hB797AUFZD+NECoEQfc9HSisc+t98xsYe6+gH/0FLK?=
 =?us-ascii?Q?m/L3+wDQs+Az4o2XONZCl/oWweIsCcbB/mcAxXw5gjHvWVL6S/ZDktOmSKYZ?=
 =?us-ascii?Q?W0jjctEl4TMHytVWDTdWbKZcWw6pyJMQ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(10070799003)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Ch0i4DPsNJTfVAm9LaJ/tYALWmiiGYyVMDVk82sJDumTBr1eTxoSgNB4OL/y?=
 =?us-ascii?Q?wRkvmgMaH6skfv/j5zhg0iI1BJPGEADPgJVo7E1ataiJIKiGkIcE5BdgEw9s?=
 =?us-ascii?Q?+6stre8wbsZH7xPQtacvSFy5DQLAAIof/OsK9udXbyFb9oo9qG2OfhUgPUOk?=
 =?us-ascii?Q?4/3lGk1PKR2tmAFf+V0UE/RBz5mXiKOzz1HqQTRDhNjoR9qhsFxY3ad73F7L?=
 =?us-ascii?Q?7zo8i9PolHJiVsMYbGoIrPYckTOWNxVSrr5XFJcuPKBYbAddUIYzYiOHQYO1?=
 =?us-ascii?Q?Fjgy7zb+hXQM3pCBcmWI/pI9suXe2hzWtrXV7iCEy5x355L9jFaSQ367zcrb?=
 =?us-ascii?Q?gLyrQdTscmxZWhAI10qS0H8I21dmGn0n9hgqJamgc1c8cktHAsZ0SE90Kdfk?=
 =?us-ascii?Q?UE+d8p7MIw/sJERtNBRtZxaPMB251ve3syCo8avhGeOquD7Vs67DveiVrajz?=
 =?us-ascii?Q?JJZ5JO+vMs+kIYj5/BDH0ZaeROO20LXycnBSZIa4GeIpmFxbrpnCFOndQ/bN?=
 =?us-ascii?Q?ZeaB4MLj7Jy7HYlBjQOmRTYNlirzUdvNkOkqe/7MRu/a7EA42lm+lMH05tEA?=
 =?us-ascii?Q?v+PPnzvxiTeHHbxP4FuXFg9MLD/epsA6mubobfP/2yshLdCOH2GUsCgZtZJp?=
 =?us-ascii?Q?bUm5TeunK90z0z8tMoyC479rS68pgiFl/LZ0/7rDaRfZW8I+C1EGnCT021oU?=
 =?us-ascii?Q?WT5jMyK2BK4woorpAnjnIAZPY2/EgvuMbb/OfZYtD1MOj/Fge2BfnsxMm6wf?=
 =?us-ascii?Q?2a3KLrKtUIPqpZmVpythsjzb1UzEdyYZ5l36Hf6smEfpQf39NA8K56WlqBS1?=
 =?us-ascii?Q?vcnjl72ZM7kxZzQAsSKpdINhgKPL+i6WZhfZvc9AZfKQMtSYlHjLdGWUENBL?=
 =?us-ascii?Q?OMfqOX2JEPrA/J81Y/lUKNoEUi0NeULEOlWnQbKmyuncNDLYEeu/L0LgT25y?=
 =?us-ascii?Q?nFn1x2yMD5hRXrpHoRXdNiPY6A3zQeBdrzWFd5DUGsfAMX4mwT6VYJ6OWmzE?=
 =?us-ascii?Q?MIrkZUGK35Xl5G0PGYojqyOKWYIIHAp22gsFNLApgHC9PKrJRQAwZEBOk7Fa?=
 =?us-ascii?Q?xzF8i5Aow0cu0UfeZIiCHXp0DGqFxfJoDDfMNpclHJ/ZVIE28U6a9tr2MXhA?=
 =?us-ascii?Q?/Jdbe5alLJYo9qlVsopEm3zufOJx4IUTVnRRP/i08H84xScB4v2NP+u/mXfh?=
 =?us-ascii?Q?6FRDhLg68O1I5Pj7wQ32Y1jBO2W4j2RMCuKxDtIh40z/+dQUzjr+RQRW9+9i?=
 =?us-ascii?Q?ElLuyH0uuv8s9jGUXpDzxoCUAbHLxPqLzXzi62GJlq02a2o+cbaiqiOZWV+b?=
 =?us-ascii?Q?7qSpPcIButJcMIg8+lmwMtsTah3GNCkj3T7wmouS308qB1ZIdhBZJlTU95Mn?=
 =?us-ascii?Q?tT7XYQrMB+NaaYhChdXVKcFL9bfGOMp58Gu3xka/C623caU70BUvJ1WRIs7B?=
 =?us-ascii?Q?p9SyKfEC/JMHPixDRXPYFx4JqjSAHJKbwY/eaSkrR496KA+wkeBpOV4Weokt?=
 =?us-ascii?Q?Vi5Vj9BSoBGC9lBp92roT1YynNTzSotL13va0rLUlJ2th9YQcCT7cc8xja1H?=
 =?us-ascii?Q?gy8VCwB9FNnSizBT5wNxl8OwMzuIelEAb2LFzJVQOaRsS1/oZJdcRbnJHRbW?=
 =?us-ascii?Q?3s7II8w5JRTFHAv1tjz2tOcm9ZmlONW5Y+Bbf4bTbuk/?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5066f38f-633c-4c93-afa2-08dd3aa3683a
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2025 05:12:45.8761 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pPPAZJ0Ty6pxbsnm4U83j40c3hkRrqxK1CHYjEyuEVBx0e2fY8/l8FmMN2kj3cxfkwKRUNhLjBpf3YllbN+9CQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8726
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

> Usually retimers take around 30 to 40ms to exit all devices from sleep st=
ate.
> Extended wake timeout mechanism helps to give that additional time.
>=20
> --v2
> -Grant the requested time only if greater than 1ms [Arun/Jani] -Reframe
> commit message [Arun]
>=20
> --v3
> -Move the function to drm_core [Dmitry/Jani]
>=20
> Spec: DP v2.1 Section 3.6.12.3
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>

Thanks and Regards,
Arun R Murthy
--------------------

>  drivers/gpu/drm/i915/display/intel_ddi.c              | 4 ++++
>  drivers/gpu/drm/i915/display/intel_dp_link_training.c | 2 +-
> drivers/gpu/drm/i915/display/intel_dp_link_training.h | 1 +
>  3 files changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c
> b/drivers/gpu/drm/i915/display/intel_ddi.c
> index acb986bc1f33..0aec4b958af6 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -2594,6 +2594,7 @@ static void mtl_ddi_pre_enable_dp(struct
> intel_atomic_state *state,  {
>  	struct intel_dp *intel_dp =3D enc_to_intel_dp(encoder);
>  	bool is_mst =3D intel_crtc_has_type(crtc_state, INTEL_OUTPUT_DP_MST);
> +	bool transparent_mode;
>  	int ret;
>=20
>  	intel_dp_set_link_params(intel_dp,
> @@ -2645,6 +2646,9 @@ static void mtl_ddi_pre_enable_dp(struct
> intel_atomic_state *state,
>  	if (!is_mst)
>  		intel_dp_set_power(intel_dp, DP_SET_POWER_D0);
>=20
> +	transparent_mode =3D
> intel_dp_lttpr_transparent_mode_enabled(intel_dp);
> +	drm_dp_lttpr_wake_timeout_setup(&intel_dp->aux,
> transparent_mode);
> +
>  	intel_dp_configure_protocol_converter(intel_dp, crtc_state);
>  	if (!is_mst)
>  		intel_dp_sink_enable_decompression(state,
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> index 8b1977cfec50..c0f8473e7223 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> @@ -128,7 +128,7 @@ intel_dp_set_lttpr_transparent_mode(struct intel_dp
> *intel_dp, bool enable)
>  	return true;
>  }
>=20
> -static bool intel_dp_lttpr_transparent_mode_enabled(struct intel_dp
> *intel_dp)
> +bool intel_dp_lttpr_transparent_mode_enabled(struct intel_dp *intel_dp)
>  {
>  	return intel_dp->lttpr_common_caps[DP_PHY_REPEATER_MODE -
>=20
> DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV] =3D=3D diff --git
> a/drivers/gpu/drm/i915/display/intel_dp_link_training.h
> b/drivers/gpu/drm/i915/display/intel_dp_link_training.h
> index 2066b9146762..46614124569f 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_link_training.h
> +++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.h
> @@ -15,6 +15,7 @@ struct intel_dp;
>=20
>  int intel_dp_read_dprx_caps(struct intel_dp *intel_dp, u8
> dpcd[DP_RECEIVER_CAP_SIZE]);  int intel_dp_init_lttpr_and_dprx_caps(struc=
t
> intel_dp *intel_dp);
> +bool intel_dp_lttpr_transparent_mode_enabled(struct intel_dp
> +*intel_dp);
>=20
>  void intel_dp_link_training_set_mode(struct intel_dp *intel_dp,
>  				     int link_rate, bool is_vrr);
> --
> 2.34.1

