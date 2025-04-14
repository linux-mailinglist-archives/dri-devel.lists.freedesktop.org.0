Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AAABA876AC
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 06:16:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E93BF10E471;
	Mon, 14 Apr 2025 04:16:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E/US4XO/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5547E10E46B;
 Mon, 14 Apr 2025 04:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744604194; x=1776140194;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TIAvfnBUUr7H0EKEqZIp/KomCSfEz6dDB2p+5GB1zBE=;
 b=E/US4XO/RNgndb+CMSfQuqODRBu8m4jPVRyD1bjkp0rW/7sHrU2srWyM
 Lqb/qHL6cqbsBM1kQFeprxgUa5UFpxpGmLE6ttXZj3H009iwERh2evHa7
 2xyUJbXi8hH/iSGf3lwmiBpNaM/2xNzwmncrr3PTIH+J5tP0wQXci2LNz
 wWO/lJAWsFdfJle+a/F53EEMYa73cguhr9TJqxYV+W6OfpAmQwBMBr8WZ
 Z0wNLHzYImULhzfFYgpdGkSeIZtavn9Fo55y/5aT/0HtnwUEVtm2AErea
 qW422Dp7R+PYAjhSewgQ1hC18Oj2AK78GR8LWrLVls6ht6C3sZfS+1lh9 A==;
X-CSE-ConnectionGUID: //HeQXZZSSGsF9+Fx0iDhQ==
X-CSE-MsgGUID: 3Xsh3aG2R6mNuqN15zK7gg==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="45767890"
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; d="scan'208";a="45767890"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2025 21:16:33 -0700
X-CSE-ConnectionGUID: CU73WwFyQFWejgS+Z6mJJg==
X-CSE-MsgGUID: 0RhhSKYcS6SsBzbJH/i8mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; d="scan'208";a="134680475"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2025 21:16:33 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 13 Apr 2025 21:16:32 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 13 Apr 2025 21:16:32 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 13 Apr 2025 21:16:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E43WmvaPDy8QlwUDCnomi8+MrMNx7Z+sTOumo7KfIhh6iiAlLDovmLV4xkjXOFnvlKURUDLnhBAOpkyc2+nwbe71igzBGCQe8RAYd09nX9cbPPVpl0fVBSsxGkC0yv7KH7I9brtwW9pSpfK/ocDezg4hYBKek4o/l7C8kk0h4JP8XfBhGX5DHgWh8WZO2uka6KBC5edEU+mjPsqS2pHnTe4rcFqQAp3/VpO/XFs/Ex0T9n6X/a3ToGxccDYq8UgyZQNNUo/9hX+AO7ndelJA5Jyg1J/YBT3c5NFdyNPQu2ie8vmG4tO22LwxFvVaRaf9v4vLhSj54mmVz9odkP+cqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JG7MtbbUwxHlfmYPgkio88xQu7IKvZ3Q4vDDpmti8V0=;
 b=nqWMqlKFhXhYaSAeYh+Rt+GuxXu78ZVX1Ln9tX2uB0Flrcign+jRe7Hp4k58+RiBR2rt1fyeObrMqZBQPTt9C8jkcrYRghNA75mfuFYChj0qAsEKZaFi1itDD8360LdWrvNow7+8CDkqnRVUX5z5bdmrax/D/g6hHnXYTvTEGKdw8jgxepJi2VlhGhpBvDTr20r+zN6l15Syv2Ws6yYx3foU8B/fPB2D1iCEVcLbEKKXkor9u3+8ZAjyFNI1KolBHQ6+rX+ZrV1qYj4IFazvx70rFH+druG/uQnHADfT2C4Gz5g8CcKxUkedo3xPoGOm2ppGbNrSLxB5qzI7nGbh6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by MW4PR11MB6958.namprd11.prod.outlook.com (2603:10b6:303:229::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Mon, 14 Apr
 2025 04:16:29 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527%4]) with mapi id 15.20.8606.033; Mon, 14 Apr 2025
 04:16:29 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>
Subject: RE: [PATCH 07/13] drm/dp: Change argument type for
 drm_edp_backlight_set_level
Thread-Topic: [PATCH 07/13] drm/dp: Change argument type for
 drm_edp_backlight_set_level
Thread-Index: AQHbqppO8O3d+gEClUWbDwvcbYCJwbOeRq2AgARL2aA=
Date: Mon, 14 Apr 2025 04:16:29 +0000
Message-ID: <SN7PR11MB67505ADDA85EC7B16287F435E3B32@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20250411042909.2626807-1-suraj.kandpal@intel.com>
 <20250411042909.2626807-8-suraj.kandpal@intel.com> <87zfgnt22g.fsf@intel.com>
In-Reply-To: <87zfgnt22g.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|MW4PR11MB6958:EE_
x-ms-office365-filtering-correlation-id: ebe125e9-eb44-41dd-ee0a-08dd7b0b219d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?C5g4ITjQaplNXchpqRWGnCd+kRwT/D7Xq8n/yPLPwpxBqeu1DZk4SytAWEz0?=
 =?us-ascii?Q?zRHxVhYql8y5le02jn2fwniEYr2DNuuzIQhuhUWcXqnU0DmIEtkgH+RwhbVL?=
 =?us-ascii?Q?j56hqq7JTSOBYFqaB85a/LkW8bU+YLU0lL/LhbUNplXRm+cKX6COVHZz6bIh?=
 =?us-ascii?Q?1Tqi2KKNY9uDbZWoiAh2PUTHGscnpSN9oKZDpIH1f9uozk3QOBXlmq/sS8mp?=
 =?us-ascii?Q?Oq7HaOSDEd+ZPz2OoPp0Z9iz/aXqfBbuVevYyoR757gx8lHh3FDm4fg6rA79?=
 =?us-ascii?Q?ypfVNHQ7lKJM4XFdesnd8ZmueIaAEskgnV3Np1flSCYyqecD0NqEOBHte73M?=
 =?us-ascii?Q?nt4cM3dxlYu2q3pE+cQ8tyV0J4xXbQederiL2594nVBnlAbqofI3p2yfDhcA?=
 =?us-ascii?Q?rJdM1cb6OZFVYR7HOfpsOTuZ29KTMlf50xi6lsi3FlbDnG0YsGYki37VbK3D?=
 =?us-ascii?Q?JjauwydP6xOgkJqJIYu8uQVVTp+oeH8K3DGYgAZ59BSnUHAXh/2oDmbSFKR9?=
 =?us-ascii?Q?RcdcJEwLDXNEwspfpdfQXvGZhxDtCjbBZnfwskL64TWx7JuXItjSfiE68p/f?=
 =?us-ascii?Q?BPanH8VroV0G7muGiH4KsnoqIV4tQKFtjINzgcpOaqLVZuWP4U/7sthMRlJj?=
 =?us-ascii?Q?KT85iXDKhdpan70A5nS6f1GCgMVQ8Hwt/7dGjJETEFWkJ3sBTwmNmZ5W5Tm2?=
 =?us-ascii?Q?gKwUBSBMzX76Kx+KKnMvbn+tw9ljrRNM6LhEwniqrVqbGwgxhbDNkwy37lRz?=
 =?us-ascii?Q?KzcRF4rKSG1qZ0xFNQV8fSCLWhkxogIpGq7l1ZGBz5i1wcklC458jSmzlaBK?=
 =?us-ascii?Q?QcwhsC94Zt6vR5xnoUEjNpeMPxTkpb+VZXqwEkVMx0NHmtvMaxAnUqM9b6X9?=
 =?us-ascii?Q?9xkmsxr1LlpcGXHNZURSSUC8pkug2slgmn+0mp/MyahFQ86neX5d1uZlU9ox?=
 =?us-ascii?Q?wANWsWZdylCLJBfz3GkWeCJ0Lc0sjT4VlhRzgpxkmtYlPWv5fRBy8NFDEbsh?=
 =?us-ascii?Q?irXlpXybGApgHHWnlzhMwNR1DDmi5u5+JlhODHTelptDQNCAyQDukk/Lfb9a?=
 =?us-ascii?Q?XE/yEJIn/WSCJ01cIEX/9Gl7dohOD3kASc9oE1eGySnbLxrnKSjbJ6IH0ZJK?=
 =?us-ascii?Q?xCpSZSGATa53Ls4GNaUgPdqrbNshp8Sr1FPLZ6HexDNQzH/X5e5FukF7wyQy?=
 =?us-ascii?Q?gfMMglMrCKz8KAZYMpKlR3KJ2wLnGOAvhsvW9mkGupMmaUfc56Zon5cKlGQp?=
 =?us-ascii?Q?DhVZ1UthmRYd5z2GyqQdGnMJJPHFgNUY5wettHYTMfye2OzeKH5uBi+S1TKT?=
 =?us-ascii?Q?mGpt/+6VfCRlIrM8GSEmd3MQvDF5IRcphR7eN+Q2OMK5XEj1ZLaf6eCqQT3R?=
 =?us-ascii?Q?zbd/JMHRjHW3VtCnF7DyTd6zVndgqOsSpEjrtSqV7XiFDZ9nHzg3C9AKbsxD?=
 =?us-ascii?Q?P4vgIxFpylZmaAsCTj94wK1W0UlXV9XcpBanoFmFXbj7FSRmjtidBA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?EWlZjAHiwvpQoQ2siAefLRRPZ4X+CAf+30XBImoczw2tbLvi+TtnOtpLVu18?=
 =?us-ascii?Q?tdD38HgJyLOzTXju70Nw6DtuSJBy2jPBEl6pgQs4H2UCtAMlGTMGKmy40bjG?=
 =?us-ascii?Q?zZFRMLbI10bFc/xkysS3QY+EBN3Mva139FC17+YDA2DIGDUxwwXHLRVLaCJr?=
 =?us-ascii?Q?vu+5j5lvvmWYWzbOKlXWi2mwjIaJGCpzolYlPc+NstnLy3z6EFzetF1F5KnE?=
 =?us-ascii?Q?LEfuamsq9twiQGyP+0tWlX7kqu/ue0ma+9jzx6KDyzpIgyfFm5Ad/ZZI/3Aw?=
 =?us-ascii?Q?NBdYIzZhS9DX9SDDACsm0DyFK1xM2y2i7jIDNOPJuWhAtxWDFd/uPUCLFOvo?=
 =?us-ascii?Q?DYQq2wiZC9OzAkBkjhx76PTAyA2KLd5Nxxhd84ctPVyzfcD5tBkHlf+X/YMX?=
 =?us-ascii?Q?v/auWINAIqvbYQ7NWJsmbgNhbjjYSBI8pilntCC+fDTtrUbnvRJT8Qs73r+J?=
 =?us-ascii?Q?lX4eIZ5gbUEBqweJldZ8wFZUKwr9P+AFlg+B1OFGc706NAFARGN33riCRds+?=
 =?us-ascii?Q?iXxK4pGjAwK5cW4sZHre4g+nAi90oFCtKqQXxXezZrXdMNLFt1By/oBO9PJI?=
 =?us-ascii?Q?Wzf+rb2NointvoxYxWQOSNqXZZ1vdDrkeNXYSJYAGrpLlgMMBpjs1vSKzrnw?=
 =?us-ascii?Q?1gbHnoP1NAgbh2g8AEwoLQf3VippDFjfGXBSVp8pqZx8BUp15hUs8KBTozdr?=
 =?us-ascii?Q?ky4BFBHTP8h2UDBgcykbeZm8JTPSDkLZMkCJsxdOsXrlRhcbFM7h7/3YndEm?=
 =?us-ascii?Q?TFBczcaPxCU3b7SAnPwOXdmB6GP4a8ySq0mzuzfPe3XOadAIbr092i4DxI9R?=
 =?us-ascii?Q?6Qsa+cttq4+ePXl7WMhbFGf1wduq4D3cT0RrPgteLP/zb7FoNue9CL9B6cCx?=
 =?us-ascii?Q?d8yBz5sAOPBh+ihRd0mNeH8ydJL9WwFX+1On+BqsxbqFJqllSzQetJnurnjW?=
 =?us-ascii?Q?+pn/9xAATz0rT0TQeAOTjO6oWv1+aH1GAGfGNERiyhHxeYIi/9KS43ruqxDs?=
 =?us-ascii?Q?OcCuVm+D+nUb/30jul10+MbFE8g0ZxG59k8NcBwA00N1+5L477vU1BHFpHeK?=
 =?us-ascii?Q?68WGI6HZ+BeGIZWM/6yDNrdln8BKPg3gZiw7ndCDlOhp+pzjm6T3+g0Yv1EA?=
 =?us-ascii?Q?2tC/uMOXU98V0TxrVIJgQgTOBjDpdHYyM+1QH+J0OxqkWmeYtIXx0flS/ctu?=
 =?us-ascii?Q?pF3lepsmNmvP8TpzXCiKtTdcFyyCF6T2XkEYZ5kIEJZtr0Z+UOu2TERA3Fn2?=
 =?us-ascii?Q?oF0VmO+cQUbfRIXLLN7AhwdtBUvqrWGEYjurPXNB27aNzukw8bXEwT17IYpK?=
 =?us-ascii?Q?0/lrgIbfib1XgBgedTAZTZISoUoBBtXBJRRoWdVkEYBvgsOiGN61dBxHGfZ9?=
 =?us-ascii?Q?P+kdHLS01v9AkwA0DN2981GVfHaRxybzvBEI4jL/KRc3AdcUdy8Dzaf4AdP8?=
 =?us-ascii?Q?VGFvXnvnfyey73vUu8xClrBeISVb5U66Gq2X5Ad3UJ682bZ7Ul6BGjeSmEFP?=
 =?us-ascii?Q?JuPScPeDC+aGoqwdtMCodEn13FAM9m9Z9wBg2az5URQIX0xdXPZBlgkdnKpT?=
 =?us-ascii?Q?F21EuQuROAu2OS2DKFNWyh81hXL8PJq2dhHFiSHZ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebe125e9-eb44-41dd-ee0a-08dd7b0b219d
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2025 04:16:29.5243 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6ia99A/aiGsf5kjPp9RZbsRIzcMQ2e7F8vsE1tYMugp9BspT6bu30VdxNlJMZjBwUonPipYY8Uaq44iwftPSVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6958
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
> From: Jani Nikula <jani.nikula@linux.intel.com>
> Sent: Friday, April 11, 2025 4:09 PM
> To: Kandpal, Suraj <suraj.kandpal@intel.com>; nouveau@lists.freedesktop.o=
rg;
> dri-devel@lists.freedesktop.org; intel-xe@lists.freedesktop.org; intel-
> gfx@lists.freedesktop.org
> Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Murthy, Arun R
> <arun.r.murthy@intel.com>; Kandpal, Suraj <suraj.kandpal@intel.com>
> Subject: Re: [PATCH 07/13] drm/dp: Change argument type for
> drm_edp_backlight_set_level
>=20
> On Fri, 11 Apr 2025, Suraj Kandpal <suraj.kandpal@intel.com> wrote:
> > Use u32 for level variable as one may need to pass value for
> > DP_EDP_PANEL_TARGET_LUMINANCE_VALUE.
> >
> > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > ---
> >  drivers/gpu/drm/display/drm_dp_helper.c | 6 +++---
> >  include/drm/display/drm_dp_helper.h     | 2 +-
> >  2 files changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/display/drm_dp_helper.c
> > b/drivers/gpu/drm/display/drm_dp_helper.c
> > index bb1242a1bf6b..895ed4a22fc3 100644
> > --- a/drivers/gpu/drm/display/drm_dp_helper.c
> > +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> > @@ -3933,7 +3933,7 @@
> EXPORT_SYMBOL(drm_dp_pcon_convert_rgb_to_ycbcr);
> >   * Returns: %0 on success, negative error code on failure
> >   */
> >  int drm_edp_backlight_set_level(struct drm_dp_aux *aux, const struct
> drm_edp_backlight_info *bl,
> > -				u16 level)
> > +				u32 level)
> >  {
> >  	int ret;
> >  	u8 buf[2] =3D { 0 };
> > @@ -4047,7 +4047,7 @@ int drm_edp_backlight_enable(struct drm_dp_aux
> *aux, const struct drm_edp_backli
> >  		return ret < 0 ? ret : -EIO;
> >  	}
> >
> > -	ret =3D drm_edp_backlight_set_level(aux, bl, level);
> > +	ret =3D drm_edp_backlight_set_level(aux, bl, (u32)level);
>=20
> What difference do you think the cast makes?

You are right this is not needed the var should be automatically be promote=
d will fix this here
And in another patch where I have done the same mistake.

Regards,
Suraj Kandpal

>=20
> >  	if (ret < 0)
> >  		return ret;
> >  	ret =3D drm_edp_backlight_set_enable(aux, bl, true); @@ -4327,7
> > +4327,7 @@ static int dp_aux_backlight_update_status(struct
> backlight_device *bd)
> >  			bl->enabled =3D true;
> >  			return 0;
> >  		}
> > -		ret =3D drm_edp_backlight_set_level(bl->aux, &bl->info,
> brightness);
> > +		ret =3D drm_edp_backlight_set_level(bl->aux, &bl->info,
> > +(u32)brightness);
>=20
> Ditto.
>=20
> >  	} else {
> >  		if (bl->enabled) {
> >  			drm_edp_backlight_disable(bl->aux, &bl->info); diff --
> git
> > a/include/drm/display/drm_dp_helper.h
> > b/include/drm/display/drm_dp_helper.h
> > index 62be80417ded..6bce0176efd3 100644
> > --- a/include/drm/display/drm_dp_helper.h
> > +++ b/include/drm/display/drm_dp_helper.h
> > @@ -853,7 +853,7 @@ drm_edp_backlight_init(struct drm_dp_aux *aux,
> struct drm_edp_backlight_info *bl
> >  		       u16 driver_pwm_freq_hz, const u8
> edp_dpcd[EDP_DISPLAY_CTL_CAP_SIZE],
> >  		       u32 *current_level, u8 *current_mode, bool
> need_luminance);
> > int drm_edp_backlight_set_level(struct drm_dp_aux *aux, const struct
> drm_edp_backlight_info *bl,
> > -				u16 level);
> > +				u32 level);
> >  int drm_edp_backlight_enable(struct drm_dp_aux *aux, const struct
> drm_edp_backlight_info *bl,
> >  			     u16 level);
> >  int drm_edp_backlight_disable(struct drm_dp_aux *aux, const struct
> > drm_edp_backlight_info *bl);
>=20
> --
> Jani Nikula, Intel
