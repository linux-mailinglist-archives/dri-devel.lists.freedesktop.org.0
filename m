Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E9CAE12EF
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 07:29:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C656910EACE;
	Fri, 20 Jun 2025 05:29:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ji8tWPjS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15CBE10EAC6;
 Fri, 20 Jun 2025 05:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750397386; x=1781933386;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ALKuEDiSBVuMxx+APkCWaISc8+Tu1U9TyUzsdakqNFA=;
 b=Ji8tWPjSI/AXRcpTTwHs7oQCBj88mxFu5EwOgYT0xakA/3ctSLvsJsHR
 c1CrShU0r9FrzLn9Gh5+c6JNV7j/zOytb39SRvXXu7q7POfOS5ufS/pw5
 NtBxSzqAqnfBsJLImYWsEuD9ZZiBqtV/SOULZyc+vz8q5Lozj0hH0LR8E
 eSkFpWzJB13ZkjT/yPwzsrt5Ooqu8dnsHppkRnCtVQFuPvIBchX7jgM/g
 XJ+jUplJS/rmPjG+Ir6XBnxf9lx3DqIIq9YSLuGvqwGClczO96w/y6ioq
 WoUKQgJVR+sKI/FdudN845D1yQTZys7D/RAfsjCK7YzZHzDqaXOdj3kIj A==;
X-CSE-ConnectionGUID: f+KExx4/QI2/j211lNLUeQ==
X-CSE-MsgGUID: jZP97IyWRB6EGaJd9rvNrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="52531661"
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; d="scan'208";a="52531661"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 22:29:46 -0700
X-CSE-ConnectionGUID: WQ7x6WJMTcK5knV2JrWzVg==
X-CSE-MsgGUID: 5A2ei1N6SmmpdfWTlRnoxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; d="scan'208";a="151347943"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 22:29:43 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 19 Jun 2025 22:29:40 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 19 Jun 2025 22:29:40 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.72)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 19 Jun 2025 22:29:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=buM56FVFlz9eApNkwutDdO0K+RFtyFPporMprAhZWmQEMc2Gge98goWH9+e7Ua1LUe06+oMCDV7oSGfov0Bb5QoImiqW6zYqjIrIWcbM6hMsSpXAWqXaLYuAco/lf0lV/J5LB3x1TgZTdACvjz8nC9zGZIUsH0QZLRN5C8WWqe/swNm14GI8VrdLDhSzeAnPJnk4w7Qd5ItVMvPctKifGcvJbp+gFMUx93m6zJo8iIJGj7tGtB45XjodiI/b3NfRB3NgKZfHrFVQiYxAPOWifBxDnQFYSNPdFSdiIC/0/c2tJsAID69SHJejaJmCGx2iNDEIAS124sKdzRXQflFSMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vXGAeWmRf1LLeOx6rdcloqojFvALrQCkggvrFgFHMRc=;
 b=iGDAz5G9UjGVn49ms2FZmiJeRAvwlfSMONX0QC6XU7JggmYFhyeoITa7DsM0pX3o9wM6/6DMzyX3sXKZwTyDRTOInnBrE60cogbk3Vo9xZLs2epa7+80xhRw7hyAncdH44ozfyGL9GFp/LAWUszwGKgrA6R+ok2dDErXmWniJBGql9OVnGKTijNHhRbEvmMAI0RwITljPpDpAtzwjm+JVB0/3M0aNWCRN2YGKnKyunY+Jy1i/3Zew5w/lG5jX9/jGgrf3oVVhGvROWS28STIzmHhbbboGz+iFWL/EKJLn3u4YnE1z9tAk5tVMw2Ha8Kr3fQ3wyCDIvkIYh/aR/vRuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by MN2PR11MB4646.namprd11.prod.outlook.com (2603:10b6:208:264::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.23; Fri, 20 Jun
 2025 05:29:39 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%3]) with mapi id 15.20.8857.019; Fri, 20 Jun 2025
 05:29:38 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH 11/13] drm/i915/backlight: Use drm helper to initialize
 edp backlight
Thread-Topic: [PATCH 11/13] drm/i915/backlight: Use drm helper to initialize
 edp backlight
Thread-Index: AQHbrPQv9hZI19dojkutRVVg6KuFlLQL4szg
Date: Fri, 20 Jun 2025 05:29:38 +0000
Message-ID: <IA0PR11MB73071E1E8218FCF2EC03B2EDBA7CA@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20250414041637.128039-1-suraj.kandpal@intel.com>
 <20250414041637.128039-12-suraj.kandpal@intel.com>
In-Reply-To: <20250414041637.128039-12-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|MN2PR11MB4646:EE_
x-ms-office365-filtering-correlation-id: 1b418cc6-f370-4a1f-8bf1-08ddafbb7394
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|10070799003|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?MtIVWwpKy3JkIRRdzAkCevn/OVXqQ6sfcUJYgtoGtremquNN0D+/y7fLu8DX?=
 =?us-ascii?Q?qAb6NrwoYObtC/p53WFKtLhI4bmZqunEIvDs/kziix8J0Dj8ivdNc0T1uGHc?=
 =?us-ascii?Q?Y7mqQVtsCHmvnv1mcDF+DGqjfw2D4RB+Z4HZ6OQdPZSFCLGhxG+AE4c9dMzd?=
 =?us-ascii?Q?FAw0ErLt1+pRQeYgWDs6+pPY9XQvnCOwkrDTHjDIO61GJk8OGJHCovyzvrC3?=
 =?us-ascii?Q?lxUIU1KkS6ZP4Ndj+xMgSHY6MwYFhnuIabHm38J/e2wXD36XrDUL9COfpl/F?=
 =?us-ascii?Q?/pDaQLfGsvNfvJFVC9aajpqYEANCfipPnYtzG+QB8sLC8ug/9iHYOXBfmEJL?=
 =?us-ascii?Q?V4JTRUBidUtaUH6fCMLWrGqwCcMjUg12tnjHz3IEoq4ej4IoAlMoWLWo5Ynf?=
 =?us-ascii?Q?oj1isWsv1J/a/5BjNr36CNJ/jHImzCBd2eYcnnKICFNiFyub6ABvzD7jTgRZ?=
 =?us-ascii?Q?HbEX76oEYQ0YB1KUjOe0SC6366vEFuMPFwwF2iL3QVdlUWaHBnEbMqs5NTtT?=
 =?us-ascii?Q?MC4BLO2UVEUIUEC8DNKFfbbhEbk4+rHuUwuEgbZRJVm8GX4o2igImeSjrB8/?=
 =?us-ascii?Q?BLufTNP7moR0ABtsGBYwI2x3nU5CHOkApLD8O8AlLFdhn57SVYSCMjk/KEP6?=
 =?us-ascii?Q?XezFYj0H9dp0RDM5wmkqOi5c+vkwmyMMKcV9mJOmpA2DgpfKmygDTnWzyqx/?=
 =?us-ascii?Q?q5ACEdH/ijL5n2hs0rmyIyikT/w09t+SqNWKH4WR3maWvB8L2HxkRxtDArzG?=
 =?us-ascii?Q?tKeAOCEHJ5ngOGMihr1d4QpJ8uQA8KSXSDxOLAeZ25qPuGqEZLbUqENdzinA?=
 =?us-ascii?Q?ZXA1h7gjF05cZ8r2wy4YRDrLK3nxhcGikFxI5u+uXwb9w6NiBvTTAaLGT+pg?=
 =?us-ascii?Q?uk1/PF1suOvpuinkULDGU5eTxEjvMuAjA5tetSIG/PG87ePqOG8gfd8sIPPg?=
 =?us-ascii?Q?POH/7VF/g7FNcfs5npxTW5T6ErUwkmwNH/pLhtXqY/LEZ8ObsDDFPOWnIyEo?=
 =?us-ascii?Q?ZYZMD+Yts2IIgjjaL4SdiI9N0KvGCIs9M1gqNBLahBH2m9VUbtTuL46jfAHx?=
 =?us-ascii?Q?aTUVusi3Lu+2biMhoMPm2XWZPw15Gvkzc5x1j2PUPtKxhWCBD9LeHwaH0uxK?=
 =?us-ascii?Q?gGl4prCZkHXAJCpBLTkI6DXc9gz5EDe+E0Ak/VC9wiXWdWO2s/Sfg9KnlhGb?=
 =?us-ascii?Q?RHnxjBwX9bk1+oac7KqEKoP72Xy3cmpl2QkgZfTKgIaw/HLqYJrCdh7DAuVV?=
 =?us-ascii?Q?nurudDFeKgYzTcxbbQYT9eoVH3AjyKyrxmuZ9KOSsJ0+Vf14vJ7guqhhsLJ6?=
 =?us-ascii?Q?/6GkiPtaoSSp7K9JnS9PsU01LtfRPYecfg5QAEMvcG2OdhMygu5P1UVOsVAA?=
 =?us-ascii?Q?cevVNUjaVS+z0KLBO1eq7r0R5p6zvyrsSw3zrMBlu+wKxt4JRj0xtU3ocUju?=
 =?us-ascii?Q?L2VTqO8c19ghtT8zZvb9ETOPpjs5J94jl+Aa8z8hN/T5ExlbtBYLNpIjCPNG?=
 =?us-ascii?Q?X+68lmcXo7/MW5o=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(10070799003)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?++/YlAUgeegwEd3bf/ZbA8BFDW++VjlkCFiu2dwcO9BXpTk81yAarUUOvozX?=
 =?us-ascii?Q?rcF1dttDYnX90n9NviphgnbyHQavGpzsvhC4vMKxZpiJ/WRd++8FWzbeFOTL?=
 =?us-ascii?Q?vP6uJgPZpdqcRkkHFmL72s70dp+YYj5RB2DpJzYC2Rj2CLb/t6qk0k/lCufz?=
 =?us-ascii?Q?Rk0FE63JxTZj3VHIAVmrwWbdOBPnrDx+G0Qg0TJ2o5azr+VjQOUpvXrVOP2f?=
 =?us-ascii?Q?wyKlFXETmQzgyt8IUEd0anNyvF678cXWaf9OfQu8FdaMQo9C0MkTzgqBc6Ua?=
 =?us-ascii?Q?atbeF00vs7ObJvfmWBHDNsQscVOKQQnVIdV1jisqRAHetUcvzHoUi6DwDmaC?=
 =?us-ascii?Q?z41EkvNgWCRgWc3bYyjx13u1GG91EZrzpsGEIGWLK87kE5JvdX8o3EXiddxm?=
 =?us-ascii?Q?b857QbVovjbDzm2fL0QHv834v1mzUFnLh+BAc6ociuqEPOZSMrW3rv+eoVt4?=
 =?us-ascii?Q?vAOtOgA9l2FzqzRB1lJv5q96WkxgmyJkvjfFKJXeAhXLrmv4OAry9yQfuPu3?=
 =?us-ascii?Q?aQb3McZVe9MZwA6hE6Hpj87kS3HzIFyXziY3/QkPeduVI9mN4XT+0FZo1qGV?=
 =?us-ascii?Q?L2bZkY5dsfHSeLVE2ubLwXVsOxgNEqOcRN7Bmc+mKbMbcI4leqLZxTSnx/OY?=
 =?us-ascii?Q?sMnnwEzvW03Fn2IFSh4TppeD/d1zOwQf22Rmab7zBtuhqHFTL7Rukv+Uvfqt?=
 =?us-ascii?Q?d8s6820ZMtJagg3Lk+FkHcivmpudxpeiydym5Zt3BqSODuqYWCyfnfO7CvX0?=
 =?us-ascii?Q?RQjp7tdecVT7wxb0dBCxxMTxD8R4raPXQT6XZx6NZnvPExUjDmXcpVOdDt6v?=
 =?us-ascii?Q?Z+rBzkzCJ4tkwerAntd6On9REec+mpfn1/SR8bIWOr/duKHFEJIYEq2J7jo4?=
 =?us-ascii?Q?zb59NOIm5HMTnfhvoYAVSPUoxwzxAYGsjeEnNnsVceLWGXgQuvwQpxQhVWBz?=
 =?us-ascii?Q?QvC4cUafGlQJjcJZmgOX5RFnX63095s6xzs1pRVCEalibv+R+fwqCN9zRIFi?=
 =?us-ascii?Q?mpq7SELUH9s2QYt1e/yeLaxfG5cMZFJ9SK6owZz9kpJcH6buwcT/XTN+EbKV?=
 =?us-ascii?Q?H49nRSWEhddNWrI+4xnoCGk6QtC7QG539J/VVVQlpPPp+QsZWxq9e9MoYvlx?=
 =?us-ascii?Q?GfeOtl00BnNR3dLI7hgx2RJWeFTFO3qntZeLMpgSuqdKORcSlN/fk+dCqHxH?=
 =?us-ascii?Q?7qtQ+jJo5CoKOvcygAP0PcWCPU07KgMGO3F0MW5FuBVUCsRiaqe5au2TLa24?=
 =?us-ascii?Q?IAqoGyl5NChCmjbC01KFBillwAu/XiUCm4MifEnfoIt+cHQBNoJma9nk3geM?=
 =?us-ascii?Q?YHDFsJ+gFUrFBb7GWPw/zeXKHRhHixB0KmNUd58IX3Q645Z946JVTqdnzz4m?=
 =?us-ascii?Q?rHuzmGUvvbKJtO/lkuISHEiV2SSTqsXZdhBpo/NLXHlKwJMqtlEuBHVgFLw6?=
 =?us-ascii?Q?oMY2YlEwuFt/repvWMHsbBfJCoZslOiQFOtnSA8eh/FbAPVNQII1K2PV9k8+?=
 =?us-ascii?Q?c/4ksnmgcDs3068LUDWJafuUN6aY4OfjNvtv4mjpgb8P6G7Ed1BLa6EHlW/J?=
 =?us-ascii?Q?2Vsk0x4yIf9Xk6zLs4sd4FQQ02CA5JTzss7dQNTnLstpE9Ml9h+0MX+Pgfx0?=
 =?us-ascii?Q?RScWWb8b/1QB8XzRf+SCY5mx/xkWpEgH93ucHfzl8Fsp?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b418cc6-f370-4a1f-8bf1-08ddafbb7394
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2025 05:29:38.8710 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t8fD2cQuLOA0YMM5Ft/Hg9jv3N8qOM0XYXsd0totbGrFSsORxsxSZd/9nO69cjnS01uQwyRfcdD8l2HaSpifQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4646
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
> From: Kandpal, Suraj <suraj.kandpal@intel.com>
> Sent: Monday, April 14, 2025 9:47 AM
> To: nouveau@lists.freedesktop.org; dri-devel@lists.freedesktop.org; intel=
-
> xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org
> Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Murthy, Arun R
> <arun.r.murthy@intel.com>; Kandpal, Suraj <suraj.kandpal@intel.com>
> Subject: [PATCH 11/13] drm/i915/backlight: Use drm helper to initialize e=
dp
> backlight
>=20
> Now that drm_edp_backlight init has been to be able to setup brightness
Can you reframe this?

> manipulation via luminance we can just use that.
>=20
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  .../drm/i915/display/intel_dp_aux_backlight.c | 100 +++++++++---------
>  1 file changed, 49 insertions(+), 51 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> index be740fb72ebc..2eff9b545390 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> @@ -585,9 +585,36 @@ static int intel_dp_aux_vesa_setup_backlight(struct
> intel_connector *connector,
>  	u8 current_mode;
>  	int ret;
>=20
> -	if (panel->backlight.edp.vesa.luminance_control_support) {
> +	ret =3D drm_edp_backlight_init(&intel_dp->aux, &panel-
> >backlight.edp.vesa.info,
> +				     luminance_range, panel-
> >vbt.backlight.pwm_freq_hz,
> +				     intel_dp->edp_dpcd, &current_level,
> &current_mode, true);
> +	if (ret < 0)
> +		return ret;
> +
> +	drm_dbg_kms(display->drm,
> +		    "[CONNECTOR:%d:%s] AUX VESA backlight enable is
> controlled through %s\n",
> +		    connector->base.base.id, connector->base.name,
> +		    dpcd_vs_pwm_str(panel-
> >backlight.edp.vesa.info.aux_enable));
> +	drm_dbg_kms(display->drm,
> +		    "[CONNECTOR:%d:%s] AUX VESA backlight level is controlled
> through %s\n",
> +		    connector->base.base.id, connector->base.name,
> +		    dpcd_vs_pwm_str(panel->backlight.edp.vesa.info.aux_set));
> +
Is two separate debug prints required to convey that backlight is enabled a=
nd the level is set with he same parameters?

> +	if (!panel->backlight.edp.vesa.info.luminance_set ||
> +	    !panel->backlight.edp.vesa.info.aux_set ||
> +	    !panel->backlight.edp.vesa.info.aux_enable) {
> +		ret =3D panel->backlight.pwm_funcs->setup(connector, pipe);
If pwm is used then none of the above conditions will be true so instead ca=
n check for the assignment of the function pointer if (pwm_funcs->setup)
In backlight struct enabled and pwm_enabled doesn't make much sense, maybe =
one element to convey the mode make it easier. This can be taken out of thi=
s series.

> +		if (ret < 0) {
> +			drm_err(display->drm,
> +				"[CONNECTOR:%d:%s] Failed to setup PWM
> backlight controls for eDP backlight: %d\n",
> +				connector->base.base.id, connector-
> >base.name, ret);
> +			return ret;
> +		}
> +	}
> +
> +	if (panel->backlight.edp.vesa.info.luminance_set) {
>  		if (luminance_range->max_luminance) {
> -			panel->backlight.max =3D luminance_range-
> >max_luminance;
> +			panel->backlight.max =3D panel-
> >backlight.edp.vesa.info.max;
>  			panel->backlight.min =3D luminance_range-
> >min_luminance;
>  		} else {
>  			panel->backlight.max =3D 512;
> @@ -596,57 +623,28 @@ static int intel_dp_aux_vesa_setup_backlight(struct
> intel_connector *connector,
>  		panel->backlight.level =3D
> intel_dp_aux_vesa_get_backlight(connector, 0);
>  		panel->backlight.enabled =3D panel->backlight.level !=3D 0;
>  		drm_dbg_kms(display->drm,
> -			    "[CONNECTOR:%d:%s] AUX VESA Nits backlight level
> is controlled through DPCD\n",
> -			    connector->base.base.id, connector->base.name);
> -	} else {
> -		ret =3D drm_edp_backlight_init(&intel_dp->aux, &panel-
> >backlight.edp.vesa.info,
> -					     luminance_range, panel-
> >vbt.backlight.pwm_freq_hz,
> -					     intel_dp->edp_dpcd,
> &current_level, &current_mode,
> -					     false);
> -		if (ret < 0)
> -			return ret;
> -
> -		drm_dbg_kms(display->drm,
> -			    "[CONNECTOR:%d:%s] AUX VESA backlight enable is
> controlled through %s\n",
> -			    connector->base.base.id, connector->base.name,
> -			    dpcd_vs_pwm_str(panel-
> >backlight.edp.vesa.info.aux_enable));
> -		drm_dbg_kms(display->drm,
> -			    "[CONNECTOR:%d:%s] AUX VESA backlight level is
> controlled through %s\n",
> -			    connector->base.base.id, connector->base.name,
> -			    dpcd_vs_pwm_str(panel-
> >backlight.edp.vesa.info.aux_set));
> -
> -		if (!panel->backlight.edp.vesa.info.aux_set ||
> -		    !panel->backlight.edp.vesa.info.aux_enable) {
> -			ret =3D panel->backlight.pwm_funcs->setup(connector,
> pipe);
> -			if (ret < 0) {
> -				drm_err(display->drm,
> -					"[CONNECTOR:%d:%s] Failed to setup
> PWM backlight controls for eDP backlight: %d\n",
> -					connector->base.base.id, connector-
> >base.name, ret);
> -				return ret;
> -			}
> +		    "[CONNECTOR:%d:%s] AUX VESA Nits backlight level is
> controlled through DPCD\n",
> +		    connector->base.base.id, connector->base.name);
> +	} else if (panel->backlight.edp.vesa.info.aux_set) {
> +		panel->backlight.max =3D panel->backlight.edp.vesa.info.max;
> +		panel->backlight.min =3D 0;
> +		if (current_mode =3D=3D
> DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD) {
> +			panel->backlight.level =3D current_level;
> +			panel->backlight.enabled =3D panel->backlight.level !=3D 0;
> +		} else {
> +			panel->backlight.level =3D panel->backlight.max;
> +			panel->backlight.enabled =3D false;
>  		}
> -
> -		if (panel->backlight.edp.vesa.info.aux_set) {
> -			panel->backlight.max =3D panel-
> >backlight.edp.vesa.info.max;
> -			panel->backlight.min =3D 0;
> -			if (current_mode =3D=3D
> DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD) {
> -				panel->backlight.level =3D current_level;
> -				panel->backlight.enabled =3D panel-
> >backlight.level !=3D 0;
> -			} else {
> -				panel->backlight.level =3D panel->backlight.max;
> -				panel->backlight.enabled =3D false;
> -			}
> +	} else {
> +		panel->backlight.max =3D panel->backlight.pwm_level_max;
> +		panel->backlight.min =3D panel->backlight.pwm_level_min;
> +		if (current_mode =3D=3D
> DP_EDP_BACKLIGHT_CONTROL_MODE_PWM) {
> +			panel->backlight.level =3D
> +				panel->backlight.pwm_funcs->get(connector,
> pipe);
> +			panel->backlight.enabled =3D panel-
> >backlight.pwm_enabled;
>  		} else {
> -			panel->backlight.max =3D panel-
> >backlight.pwm_level_max;
> -			panel->backlight.min =3D panel-
> >backlight.pwm_level_min;
> -			if (current_mode =3D=3D
> DP_EDP_BACKLIGHT_CONTROL_MODE_PWM) {
> -				panel->backlight.level =3D
> -					panel->backlight.pwm_funcs-
> >get(connector, pipe);
> -				panel->backlight.enabled =3D panel-
> >backlight.pwm_enabled;
> -			} else {
> -				panel->backlight.level =3D panel->backlight.max;
> -				panel->backlight.enabled =3D false;
> -			}
> +			panel->backlight.level =3D panel->backlight.max;
> +			panel->backlight.enabled =3D false;
Change is simple, adding a new condition for luminance and moving edp_backl=
ight_init out of the if condition so that it will be initialized for all th=
e modes and then initializing backlight level and max based on the mode. Bu=
t the change looks complex.

Thanks and Regards,
Arun R Murthy
-------------------
>  		}
>  	}
>=20
> --
> 2.34.1

