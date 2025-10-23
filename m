Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E75AEBFF58B
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 08:29:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3779F10E891;
	Thu, 23 Oct 2025 06:29:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YTQg1u29";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EC6210E88F;
 Thu, 23 Oct 2025 06:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761200944; x=1792736944;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1lwVGvYf47wlJXrC+3AIY+ONsArFjM9Z5siiikDKP7k=;
 b=YTQg1u290JJyNBPvixrfJNS7cYx4oxxNPc3hJUnvXg6HZ0CoHCrX2VPm
 VVty7ouv2dBWH7+DbnpW8J5eKvcVhYMt8wP2RI4NSMT7p+N0h0TBZ6XfQ
 7gAqMMP6bzyRhMYkp56ruKsfLqLWcA7GXaky6Zumy82Dump+ITkrnW9GS
 YbPEHkfcZvo2izimqhhePiMb/Pj2UCz45/y+NmUlTiUGV0UYAgWKARvVL
 P9I+NnQEKc5GyXYu5GRdL4B9a/TTDe4FXBjOQui671EP6hD9DDhigLo70
 z8QpwLAILXgUVrzC8h3FAgcTWKn+xsZUtmnpi27YpMHpIoaR/JWg2gAZp g==;
X-CSE-ConnectionGUID: E4lU8DIVQievFV/3TuAp9w==
X-CSE-MsgGUID: AfVEYqCFTOyh+SY7KOU1Lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67226401"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; d="scan'208";a="67226401"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 23:29:04 -0700
X-CSE-ConnectionGUID: dsx4vuykQLyHwKyx4SgQ0w==
X-CSE-MsgGUID: 8Nq+aQEMQqSx3i93WJilKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; d="scan'208";a="215001893"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 23:29:04 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 23:29:03 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 22 Oct 2025 23:29:03 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.1) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 23:29:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W/O22951KgHwAHyngzBYC/q2LSV7tuvXeDPMjAlr8IYnHZ5E2M/wEGwwMnlmG47XPJvRvTogUjxDmE1ZX0uMJ/ByEEA+LC42YF/oMn7Eo1DzJ7pd0JfH/U/QZnCElbksxnF/MtM9RcTU5ob0fjjkbMR0d0KiVQyClDOQ8e4pBBTHsMg/FGyuI0Xo0Rkm2N8D/7+TNPJufz7FbAlcJFNT3uOR8X9fzzjALMbVm9DObW4m3LIhhK5oCVpw5xFCmJL9V88+nccodL6+GC0ybDp5OaML5fn5SzV7B5KyHDKfyVJBIGAlTsuXFrBOU9UmLw5pOKPsUjQd4+zR4baJ9Eex5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GkPN3wPNFt4rBkWvg1wlDCt4MQ8JxXBF1AOD2tsK1AQ=;
 b=bYqUtKAeD+i/VdeFbBT2tmFBf5/NKYCjqxOUgnRa1nyR/clqZ0vFa6aK8CbB7j3s3nVcIdx2zpdAsEpO1WTc1Dq9EiRcVV6w/Ct2eL2F7hC61lDiFE2hTyP3uRG/AVl2tllGwSGH68OKHmHm3NG+NMWrdn/azZn+SWx8F0HBPfG7+p+drkiv8n8VwRoFK3O/kT7ohcHnSJdXJFMSUYWdsV6ddY1Ty/WJrzpowIIiYQZfI7aOuP+1RXD8rDWJp93SbLDTwr+e6l78mS9kGlSmZFX0+w8nZlLagU22KmJkDrmG6SsDYFPfoLpd/i/K+9pzo4RHTJtbrGXAvb2TuOC9ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by MN2PR11MB4709.namprd11.prod.outlook.com
 (2603:10b6:208:267::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Thu, 23 Oct
 2025 06:28:56 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc%4]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 06:28:56 +0000
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
Subject: RE: [v5 20/24] drm/i915/color: Program Pre-CSC registers
Thread-Topic: [v5 20/24] drm/i915/color: Program Pre-CSC registers
Thread-Index: AQHb6zD8o61TKcRKFUu2glE+bfRawbTP9ehQ
Date: Thu, 23 Oct 2025 06:28:56 +0000
Message-ID: <DM3PPF208195D8D2E06D5B5CC7BD5DFCC87E3F0A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20250702091936.3004854-1-uma.shankar@intel.com>
 <20250702091936.3004854-21-uma.shankar@intel.com>
In-Reply-To: <20250702091936.3004854-21-uma.shankar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|MN2PR11MB4709:EE_
x-ms-office365-filtering-correlation-id: f1248460-40b2-46a5-bb0e-08de11fd7193
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?KFNHByUVZQcNywpQKJAHhHoyui7YMKvoraWMWdXe4tN6ClhTC2TMEBTR9BBF?=
 =?us-ascii?Q?OvUt8IqUAayWm/0Pof9gxP1RbiMMHpTH+t/Um0vfztbiVCBDEOIThv2PfnlF?=
 =?us-ascii?Q?l8G9W783k3qrQqkAvmRx1Z0n4ItKHdjTs/btPUd2q37uIV77xNpdihUZNMU/?=
 =?us-ascii?Q?IQekubJU0iBJBccambBnGdtMA89aV9VOwYmOlgzwoe3W27YHzf9A6ZbgcjuB?=
 =?us-ascii?Q?qRTbitHfFXyNfUaxEMNckEpiZ7UwHMAkd1VnSys1Z3OLhZ4pSssmlR3z/yW2?=
 =?us-ascii?Q?ZN/wSxxKGUbm0F2HZsYYAtsLSgh2o+bjrnpy+nQL15Yb+Htpf/JubW98dKTO?=
 =?us-ascii?Q?S6FmL6R5mLTFRENoVAhestC490784EMYLoIxUjAQqBpf5dh0Yfdiu+vSro8T?=
 =?us-ascii?Q?ZP9J9UioiVlZxA0D5NzmxsTw96IO5gLT7CADZxrRI7F+1plsNFDbfP8nRFWh?=
 =?us-ascii?Q?Z///kGm6XBNDIysRrUzCuBUBN2rVvaqWQAzYeo7QvEFqwQtD5SDKxk+5Y6ZG?=
 =?us-ascii?Q?8zMVEWYM0W8tc7mvyZZubo+b37r52qNcDZ4/JotIIT2rW3++D9LkCkI48Ns9?=
 =?us-ascii?Q?apW/cV0hf3fFaeNFitN1AxW5idr9u5ctjahfOXwdTca6ACytZvJCg7IvC3eT?=
 =?us-ascii?Q?xS+/dH8gxqIV+AWbWDJe6WBr0BC/eBsKcGOZT+WcIOTmqJYH+zA8/6XWBnS4?=
 =?us-ascii?Q?0ntTvSlgr1EghTPqhJJwbA5jfpCcxcyFALkTgoH+vtWzW38SfKhsE2H4mGZ3?=
 =?us-ascii?Q?yv7OoGnrFTSehUbIvupo7tNWYt94AoPIJFXG6jXewo8vqTLIq0qGh8bt+HKM?=
 =?us-ascii?Q?Bsbpi7ayk6b1BEwZVPcjr1IhB8EwimTQ0F5EMHowRHsM8zHK1z6vg15QXtZB?=
 =?us-ascii?Q?OPY/4D4rATtpDP3+7ZadHmrT5n72dmgP+2Xcda9CSkPQVVU4gdZizAiUEGZb?=
 =?us-ascii?Q?GhlzLq1LI/wba5IU7bZ8RCiiPMPGTUDjKWTIhJ9ktNhiztdSh5I5xVbiI50d?=
 =?us-ascii?Q?vDacnPCmMAA0zf9d2ZvkLLA64V8zuPcFOVtjQ4Nl4CgEri0DBuVUint/GtXq?=
 =?us-ascii?Q?sW2CDOsrfkTsrWOeedn2i6ZO3Nk2yCBrP9aGeTUMo4PuIngneSB5SYEZx0/u?=
 =?us-ascii?Q?fyVFv5OebMFGds5qYOaKRjHB2T2tgmL3F/K+VdQSuX39Ds78876SfO2w3ReF?=
 =?us-ascii?Q?D+7e0x2pd6j6sfAPVBthwkXH6sHJuoTJBdXXyFObQgTOXRuLPCnII0dy1cQK?=
 =?us-ascii?Q?bFGbsfoBotEFAA8EiRuG/emDWLobnKylbRv9yr+3HUEbbW3gi/vNbefomuN0?=
 =?us-ascii?Q?TR5MsS6B1F9U37gE/1H6q4TAHcG+CeMAzGFZWm1kSK2OGqlNOqzDpxtE6JLM?=
 =?us-ascii?Q?6wulRrkgg7zJUvQKUiDtac/OQCEUNbdtjTiBogerYq62S4gyGyC9SRepl8ne?=
 =?us-ascii?Q?pyx7UUnQC6/iY5kSYd9xm8OWtMrJVphxvzDb3SXEq7qn8VAVA3ZBNd6uClFA?=
 =?us-ascii?Q?3hPr0+7SKRZFntPLzFatr0EQyfn+E3kQy40z?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Q59SoUfhlpeqlE2ffkCXj/0/zg7eiq0HWJ7SDrzaEKKnjjDvhctanvKJa4Pt?=
 =?us-ascii?Q?MlUIQiG7U23PlbwpVbD0mKnlLcvXTEtr6YF0ZgII2jL8nczRgg+9bH9ouWfq?=
 =?us-ascii?Q?iRZFOonLNHtC0Pcc4oEESTHc53mZ5BocZHukp5YMgIm/pq4kALh+qGjo7ROJ?=
 =?us-ascii?Q?/KvFV5nii/f5VGM3p3hc2uzBA4H1WaVFGj7p07VoLCG45hoMQQ1yRvK6IBki?=
 =?us-ascii?Q?gM0j/Zws7bZW2Rzhjc0FlqxOKz4plVstMfU5+7JsjHiuI1kETcr9Wbzu7z59?=
 =?us-ascii?Q?GNUkkkHBiW4XLgH5TSxpdm29qmt3vIY5f7POs/FKZ/Iq5ZcFQLU76U2stCMA?=
 =?us-ascii?Q?Ml6AAXmdNhGCpUQRzweYFvG6GK7tCY8wbpSXPV76Qv5iHh2QoezelxSj8qQv?=
 =?us-ascii?Q?qad0b851rW/uUWmxIDg4ps5l/zeyFMFeRPCWwU0cgZuGU2IK8laPjFjyZDDt?=
 =?us-ascii?Q?503UlK51qrHhE+KCKMFCt1sWeo9q7m5V7aG1+e+3NSxJ7wus7gEl6YnaRb2n?=
 =?us-ascii?Q?uiK0PgFWkm1WoeN/hwiHj5+aQ82YsA4MzdRthc8P3MCYBHSzRxgCMF8v/s8l?=
 =?us-ascii?Q?a2E0rGHiNg7bJgG82bp2AI4/HLx6+88bId4mDMXICPBJjecrsA/3Hw/P5VNQ?=
 =?us-ascii?Q?mE/rzCFIgtoghTJk1+rY13X1M7CuUtTx6v6qrqQeVBj2Ch+wyfNBZXw0imC9?=
 =?us-ascii?Q?5Cbl08QE/m+FSP5TyQk/Vst1eaqzOL6RfVKQUWqN0bkugrbYa71w2qV08F5O?=
 =?us-ascii?Q?8FFD7RcgaPH3v2ujMX3AjQbfRrKttX5u7Jhlm7NnJ06zrpWuS0LNL06yW1wp?=
 =?us-ascii?Q?De91EjA/UBxcjH7C3Zo7KSbPVeTtLJ2ocHMC68WWUMqJ9P3MHoT0HjvrxaF4?=
 =?us-ascii?Q?qxZE9f3CVgHJ9cf5ML4LRPlqDmn1rUJ92hHcsKN1yZr9X33IIyDDzCshIdR7?=
 =?us-ascii?Q?kr3EmCWvjPU5AjmcdGUQ/jICnglpvrcSCg5vpnlWqryf/G3Z3+Dy1Uc0ks8n?=
 =?us-ascii?Q?TbPR9LHCmdM+3wcx3x3/YAP3GYynRu+4fELy2Uk9K7WZMkZplqlgC8iV1Scw?=
 =?us-ascii?Q?s7sY0dI1g9qXlq2+BcAzwOizVEtBNN7ccDsc39TpwBc0epMEBznEWX3cbq7o?=
 =?us-ascii?Q?2gMi74h4qiYBwIYnqbxf0dcstKNaAjBZDhazyDYN6ywO30komEvr1R7pxoWB?=
 =?us-ascii?Q?/BF88RwgWUQCY74nM0QCllBW/vcptqCBF1CzFuKVulyaIpFzdT7EaUMO6pbH?=
 =?us-ascii?Q?rp/MME8PSQDbE1xLlHDXPsOWJu/JXApBG7KqIivLbrlfALvsXpzNevrZz+Li?=
 =?us-ascii?Q?67Fq5ZqL7YSu5AkHsLZ6fw2SdENaNKlefE+CzHIqmP4RV7Yo60tpvD6A8nan?=
 =?us-ascii?Q?+Ip7rzhMBbNNvU4jFSLjAkh0+4BiHVATLs46eUtk7MnHZ2TN9TetQ2BVHMDe?=
 =?us-ascii?Q?WAUvNumIMsv9pz1BTbZDIZFl4qw9vb+RiqqtDyVQqn5UaR/hAPdqv1qqYYX6?=
 =?us-ascii?Q?SAhcIc9VY1Y1t5YzlH7Pl2LtFWQKEllGtdH9gjVW9U2FDzbFFTMtojBmfp3s?=
 =?us-ascii?Q?0Ov846x8vjG4lQQYDoYBqLMMz28dTag+c461OdM3?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1248460-40b2-46a5-bb0e-08de11fd7193
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2025 06:28:56.2597 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Et3h8+OZ9bvxb8t0f9i7yWWTA26WqMKYE6nh5y7ew8DT1xxlg4qwZLB8j1w+trLnO2qKkjoqTYL0pS4UWcN3RA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4709
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

> Subject: [v5 20/24] drm/i915/color: Program Pre-CSC registers
>=20
> From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>=20
> Add callback for programming Pre-CSC LUT for TGL and beyond

Do you mean ADL and beyond.
Also "Add callback to program ....."

Regards,
Suraj Kandpal

>=20
> v2: Add DSB support
> v3: Add support for single segment 1D LUT color op
>=20
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_color.c | 104 +++++++++++++++++++++
>  1 file changed, 104 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_color.c
> b/drivers/gpu/drm/i915/display/intel_color.c
> index c7378af8fbdf..75981fe232bf 100644
> --- a/drivers/gpu/drm/i915/display/intel_color.c
> +++ b/drivers/gpu/drm/i915/display/intel_color.c
> @@ -3945,6 +3945,109 @@ xelpd_load_plane_csc_matrix(struct intel_dsb
> *dsb,
>  			   ctm_to_twos_complement(input[11], 0, 12));  }
>=20
> +static void
> +xelpd_program_plane_pre_csc_lut(struct intel_dsb *dsb,
> +				const struct intel_plane_state *plane_state) {
> +	struct intel_display *display =3D to_intel_display(plane_state);
> +	const struct drm_plane_state *state =3D &plane_state->uapi;
> +	enum pipe pipe =3D to_intel_plane(state->plane)->pipe;
> +	enum plane_id plane =3D to_intel_plane(state->plane)->id;
> +	const struct drm_color_lut_32 *pre_csc_lut =3D plane_state-
> >hw.degamma_lut->data;
> +	u32 i, lut_size;
> +	bool is_single_seg =3D drm_color_lut_32_size(plane_state-
> >hw.degamma_lut) =3D=3D 128 ?
> +			     true : false;
> +
> +	if (icl_is_hdr_plane(display, plane)) {
> +		lut_size =3D 128;
> +
> +		intel_de_write_dsb(display, dsb,
> +				   PLANE_PRE_CSC_GAMC_INDEX_ENH(pipe,
> plane, 0),
> +				   PLANE_PAL_PREC_AUTO_INCREMENT);
> +
> +		if (pre_csc_lut) {
> +			for (i =3D 0; i < lut_size; i++) {
> +				u32 lut_val =3D is_single_seg ?
> +
> drm_color_lut_32_extract(pre_csc_lut[i].green, 24) :
> +					  (pre_csc_lut[i].green & 0xffffff);
> +
> +				intel_de_write_dsb(display, dsb,
> +
> PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0),
> +						   lut_val);
> +			}
> +
> +			/* Program the max register to clamp values > 1.0. */
> +			/* ToDo: Restrict to 0x7ffffff*/
> +			do {
> +				intel_de_write_dsb(display, dsb,
> +
> PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0),
> +						   is_single_seg ? (1 << 24) :
> +						   pre_csc_lut[i].green);
> +			} while (i++ > 130);
> +		} else {
> +			for (i =3D 0; i < lut_size; i++) {
> +				u32 v =3D (i * ((1 << 24) - 1)) / (lut_size - 1);
> +
> +				intel_de_write_dsb(display, dsb,
> +
> PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0), v);
> +			}
> +
> +			do {
> +				intel_de_write_dsb(display, dsb,
> +
> PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0),
> +						   1 << 24);
> +			} while (i++ < 130);
> +		}
> +
> +		intel_de_write_dsb(display, dsb,
> PLANE_PRE_CSC_GAMC_INDEX_ENH(pipe, plane, 0), 0);
> +	} else {
> +		lut_size =3D 32;
> +
> +		/*
> +		 * First 3 planes are HDR, so reduce by 3 to get to the right
> +		 * SDR plane offset
> +		 */
> +		plane =3D plane - 3;
> +
> +		intel_de_write_dsb(display, dsb,
> PLANE_PRE_CSC_GAMC_INDEX(pipe, plane, 0),
> +				   PLANE_PAL_PREC_AUTO_INCREMENT);
> +
> +		if (pre_csc_lut) {
> +			for (i =3D 0; i < lut_size; i++)
> +				intel_de_write_dsb(display, dsb,
> +
> PLANE_PRE_CSC_GAMC_DATA(pipe, plane, 0),
> +						   pre_csc_lut[i].green);
> +			/* Program the max register to clamp values > 1.0. */
> +			while (i < 35)
> +				intel_de_write_dsb(display, dsb,
> +
> PLANE_PRE_CSC_GAMC_DATA(pipe, plane, 0),
> +						   pre_csc_lut[i++].green);
> +		} else {
> +			for (i =3D 0; i < lut_size; i++) {
> +				u32 v =3D (i * ((1 << 16) - 1)) / (lut_size - 1);
> +
> +				intel_de_write_dsb(display, dsb,
> +
> PLANE_PRE_CSC_GAMC_DATA(pipe, plane, 0), v);
> +			}
> +
> +			do {
> +				intel_de_write_dsb(display, dsb,
> +
> PLANE_PRE_CSC_GAMC_DATA(pipe, plane, 0),
> +						   1 << 16);
> +			} while (i++ < 34);
> +		}
> +
> +		intel_de_write_dsb(display, dsb,
> PLANE_PRE_CSC_GAMC_INDEX(pipe, plane, 0), 0);
> +	}
> +}
> +
> +static void
> +xelpd_plane_load_luts(struct intel_dsb *dsb, const struct
> +intel_plane_state *plane_state) {
> +	if (plane_state->hw.degamma_lut)
> +		xelpd_program_plane_pre_csc_lut(dsb, plane_state); }
> +
>  static const struct intel_color_funcs chv_color_funcs =3D {
>  	.color_check =3D chv_color_check,
>  	.color_commit_arm =3D i9xx_color_commit_arm, @@ -4004,6 +4107,7
> @@ static const struct intel_color_funcs xelpd_color_funcs =3D {
>  	.read_csc =3D icl_read_csc,
>  	.get_config =3D skl_get_config,
>  	.load_plane_csc_matrix =3D xelpd_load_plane_csc_matrix,
> +	.load_plane_luts =3D xelpd_plane_load_luts,
>  };
>=20
>  static const struct intel_color_funcs icl_color_funcs =3D {
> --
> 2.42.0

