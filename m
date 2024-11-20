Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DB59D3690
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2024 10:13:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A503B10E3B8;
	Wed, 20 Nov 2024 09:13:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BB+2wiKD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F3F110E3B1;
 Wed, 20 Nov 2024 09:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732094008; x=1763630008;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dyKMiwcIq6jdqEyMFz1Kj0tE0DE+RcVicgJEiUfCNhk=;
 b=BB+2wiKDT1mWpp7612VmxKT0vxe6aqXQQzsqDm2DusLLnL9bIcJPjajk
 /nQhofX3AVAmPesA8Xd4b5g6uER5P4xyHXfkqKY7PIuwirdnOBD4DsL8k
 N1MMrtXCfcmrzQPWhPYUkOixvnl2pZpuln5NL59kiXyH1PQZ7q3VOvRVm
 yFICxUk0gRGp+/fZgizRyPfl053/4vX3SvUwa4mNBlt1Kkx45RLBgyA35
 MoMKF8nCsBR/YtNeUFYAVF8wZBvNmg3vSeOJKgrjk2UlxLWUfyimDRTCT
 LwtXruDWdoMdMQ4QmkPaW0qA4PQuujpT0nseZPHp0dDyhBHNM6D9NyBtD A==;
X-CSE-ConnectionGUID: iHaJvJpFQcSA/IHRrwJ/2g==
X-CSE-MsgGUID: EbAndJ3YQy6vkN5wmxsx9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="32073428"
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; d="scan'208";a="32073428"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 01:13:27 -0800
X-CSE-ConnectionGUID: lwvptScaQLqKgSF6hsVLlw==
X-CSE-MsgGUID: LpaPexf2TQqjc/u6FrMxWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; d="scan'208";a="94786083"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Nov 2024 01:13:28 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 20 Nov 2024 01:13:27 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 20 Nov 2024 01:13:27 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.49) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 20 Nov 2024 01:13:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QljsF9QnKRVKlT3X89m2paZh3fCxPC+hXXgrcckoQAWLEQhqfaLLNuLbAc6NxlOGcUvPRF4YovRJvOvkJcfk6cXEq2D14XsKwL2YvI1b1vc9eE5YwvSfzf+0P6Z2UQGXxVKLfmnDISI8rD/EnS5yRhCUfLnBTp3XYvV22n6oPHHP5ghSfbrIna8kqkSIMhXdR3kLirQ0KLQrhKlYb5szE6pNLeyDwVD+djurYLDdJiuV0T8w2ohZvm8gV9/o2nTSIEcFqY+f33TrrqtEgmKZQYPE5XUYVLBsk7hzS4cEoazH6YlW846xdKQIodkF7MpM41pnDq1rI20xDWSwetP+Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c7XjwNMo2nRoWBWPM5rc7VGtLzvXKMqF1wbO66YGnFY=;
 b=RBQ91T/7jtzPCEq6tyOSJHB3UFo7OkD/QQq63hkdCr9mMC/dbxffzEJ02BiBN3yB0Fxzm4rw/cJxcfkslH6y0E1bO7sna09YpmtF4UA2XdU+P9Ec2LvwQy+OMnrXCzPfdDA8S9Q3JvgpUzekrl1JaTjelz6o2xXrh0eBwH3i8rsyDHMrr+0LZwuBavsCRVkxVLz68jBeIeo6I7DaFIeUSVL3Zf/szSEwYkLkirfsifddrJVe001KoAJ6se0IiUdC2mGoMQNdzBVinBZIbROLv7mwm5cADLoaBxewJF21bRzjqj7YbO6DoJwBoJalfZOpEsX/aDodHDHKKoj1H8VbwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by DS0PR11MB7904.namprd11.prod.outlook.com (2603:10b6:8:f8::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8158.23; Wed, 20 Nov 2024 09:13:24 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527%3]) with mapi id 15.20.8158.021; Wed, 20 Nov 2024
 09:13:24 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "Murthy, Arun R" <arun.r.murthy@intel.com>
Subject: RE: [PATCH 8/8] drm/i915/histogram: Enable pipe dithering
Thread-Topic: [PATCH 8/8] drm/i915/histogram: Enable pipe dithering
Thread-Index: AQHbOnGPmIWsCSdhGk+IZfrptSza37K/455w
Date: Wed, 20 Nov 2024 09:13:24 +0000
Message-ID: <SN7PR11MB6750C5F2230C61D4F35273FBE3212@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20241119104521.575377-1-arun.r.murthy@intel.com>
 <20241119104521.575377-9-arun.r.murthy@intel.com>
In-Reply-To: <20241119104521.575377-9-arun.r.murthy@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|DS0PR11MB7904:EE_
x-ms-office365-filtering-correlation-id: b5a93876-c5be-4951-0d75-08dd09439668
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?7HbwFclScFuJQBFC6txNge7o4LNB6Z99xs7lNmiMO91D7dMFEaQ6Dv+cdWDZ?=
 =?us-ascii?Q?gqQfy0aU0sqXF1tm9S3NkT2Xo967HqQ75w/pZe0n6ZOTQSGAJcuyFfbYUBld?=
 =?us-ascii?Q?pZqvbellLhCsWHiDIF8OCXsMjcSbf+bAjEYPaZRpxHBHcNDb2CumAPZOuXfB?=
 =?us-ascii?Q?bcatNMVXBA3294r8oVVvaWPqyt/6IdCPiNrX897OHTEdKaI1SyaQs54ok4kp?=
 =?us-ascii?Q?Tbw4IQ3gBZPrOKbQnilq+wTMus52qOpLNSXDYAsDVvNBQ8Bh0L6o9sCZNOZV?=
 =?us-ascii?Q?VngABwrmaLga3uUWenJt9F+VD5AuoAySyp9ixQAk3jaQ4sovKiG0ZKpL1vwo?=
 =?us-ascii?Q?dMky+bd8X/KZjmlAaYXwBm0q+AL+rnMehapkjn7Ri6pBI/lG4pS9Wxe7sunf?=
 =?us-ascii?Q?WeK3Ob8NAU+OBo3Ljy8nuFW8G/Sk2P/KXLiWlw5C6fSAZvAO7KZDiFVgYFQM?=
 =?us-ascii?Q?5tay6Q/D9UZq1OiHt+OUgxFNWUF4wvPDUWmPlpXx1p7Co4aZODqGsR2DZ/rk?=
 =?us-ascii?Q?9bzyxGHPZmvnPskrBax5kF34wG/XmXkD3on/6I9g7USEUW9SOpoFrBAc/m3P?=
 =?us-ascii?Q?/97s1g/94BGNKb4joZrOvbuOskVY+fosPDKAMc6fpYnEQGlHfTErRu4LlWeI?=
 =?us-ascii?Q?o5KFXFbv7kM9I5MuKzwQKKCx9GL907rHsxEg3DW8/orwDxKiLUsnqmEmpfdv?=
 =?us-ascii?Q?xxQbQ1xlFH8xUVYdMHQYOPqsdYwkiotINLu7S/AUg+8OYOnnvZSGX/QgN2Kz?=
 =?us-ascii?Q?HaiNsmLNpN4+Y4rVgM8AfSbHZY6VEiGYx/KLb7081L5/lbOvmHbSHFKN6j16?=
 =?us-ascii?Q?dNjkBHL6MCf6GCNrVjwUdO9QvW2hbQ2hUpiyEw+rW/NahpThDQRqNHF11ge6?=
 =?us-ascii?Q?tEdUARMImwKBfYWDPhelVKMABN8gTmaBfUarM9v31k5QqpUxGfRwfSAqSVr8?=
 =?us-ascii?Q?zqvYm+EhN/lmQZiRnDdAEZB47xBup9AcVS9m1eJrKPM3Z9eIhL3ExkEcXJa9?=
 =?us-ascii?Q?tzBq9oUWfKvuH7iNF1lbYozZU00DcMM0e7dVJ9eq+wWov514H0rOPRs5Hbh6?=
 =?us-ascii?Q?CJgcPP1FwU+6NEBTbOGuSKG5PUFM5v4y6hbuLmiVVPjUgBI2r4MTROgfr1PU?=
 =?us-ascii?Q?NYKxFiqL/4/jkpQDO2eMCZ3VoHb7Ut9nSnvRLKSmfqj2RdJQ0cbBdXbhbam/?=
 =?us-ascii?Q?wqJuNKhRKPZHFfjWOEMBVxHv19Fe1ZEe1kS9aEm0b8In2gLEmekKSWPh/ORX?=
 =?us-ascii?Q?GLfj/m8Y+nhVMgKNGjiSdnF2bMflHJA1k7pukUDw9byoMRCW1Fdq7urZeOmr?=
 =?us-ascii?Q?rHQgDThOTC8gc/tWM0HhNX+sUVgEuWz4TzlcNFzVRF5J2wq43+9RHFjMC221?=
 =?us-ascii?Q?gMzzEu0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?tMt9J6ceNm/9pr7GUomTkPyWB/5if0XNjPfQ6xOOfca1m9F0WPa8vN/2sSkH?=
 =?us-ascii?Q?00F27YEOSn4taEPEd8oksq1TQomp9j2l1coR0Y2nFUkiAYm62x871JYaJ+d/?=
 =?us-ascii?Q?9DMoWlFQ8KMQmy6901tZHTLB7fPpz2FNTxOnsgWW/l547/S9MOQtcpWR5MXY?=
 =?us-ascii?Q?SnAC8pGyDO2iZCkMTAA7+7nNAdvupw98uE8sR2y0Z4EYGO8QTWL3ir3kqcd0?=
 =?us-ascii?Q?BMUtn47TFftbsXHNDHVyL38pYzf9ws65X6XaqLrq3bVc72BCUnitMgo28iO4?=
 =?us-ascii?Q?MWAV0uegA/RzaXOCqS6hMYLrt53c8eP+68s3mW+rH+xZZqpY4Lw2MxxJqDpn?=
 =?us-ascii?Q?5mdAOh/fXyuxLbfNvAGU96ydkd6E7bIxL8zK0dedp8RaoaVyeD52UGiCZgrH?=
 =?us-ascii?Q?9fzPvi6/oo4kxgDCydIecMvY9Rb90VYTrETrUoykrYVrTCT+HXQ2r4mO/PQT?=
 =?us-ascii?Q?eddd6PD/XXgQpD04v/cbAu8X+PUpARLD8OZLwDML96gpCME5d02XpZ69hmuk?=
 =?us-ascii?Q?XbK0o0iuV4JA3mSDklyjB0pi9M8tQBtaDpnG0tfYY9utUyg3Qwdr7hs10yPc?=
 =?us-ascii?Q?pC4f9hzjvbB2zhzTaitJ5z/BZaghjuw+RbWxv3NKRwl9obbkpv3qtUVLMF8F?=
 =?us-ascii?Q?0/QYXzG8bPZ+gKZJwNUpN0dSzPembOKOMvdkoPj8FNz9ELay+zBWcgpljb2Y?=
 =?us-ascii?Q?06Ojv1Gbi7zkfXz8D/fsAaYkVBSrMnSd0kDBVerPSUQHgdW6kSWo181ORgMN?=
 =?us-ascii?Q?fQbivoTGnYVC9ewz1FDx11XXNMjLQtHf+2QbYgiM9ZRK74aTFH/SoCM/UBJU?=
 =?us-ascii?Q?MXGUVEmxFPaOAgV+4oriTIkA/E3v5Aol0/VIDPbv7lhzYT0djmXHgyxSetq7?=
 =?us-ascii?Q?JtddWOFzVXB/hk/AZjpBQzxUmjVdqS4FzE5xPNSZdLEKCJs73IB+2zXeyM4G?=
 =?us-ascii?Q?M6g5ma289+eTSRHGg37nDP3v/2XIhFh0EFhi1bfb1sUnalanVqA2y9VboVK/?=
 =?us-ascii?Q?MFhElQ2yE0Kc9tzXPldARIPP7LzHvWh0t4y2MLgXBp4DKDcEgDUPnLGEYkdv?=
 =?us-ascii?Q?UYtjQTMQYMI3rECuSdoTDj4LB157TzeWmuSzjd3Pk84UaTcJTf6XpPwjwL5v?=
 =?us-ascii?Q?ogXCHFZUS83/U0x5ITWiYdm5y6tPGHqTq6QJkMDxMtNtoq9aY1DmDALnB6A4?=
 =?us-ascii?Q?0iShIITok1L2Cnno9zZfn4FT1YUOzUMAqoQFX5RNpcPa1zdtNnUnEssjFain?=
 =?us-ascii?Q?hTerID1BX1OrkL2a0en8EmAzq0bGeq2hDZfKI6z9mqgHC3vvTICaQpUV3I2o?=
 =?us-ascii?Q?JVrvwjB270b65U2qUqfnxVt8TdBRGPeQWRsPQkIauhcQpKBsbCLuWIczo+OH?=
 =?us-ascii?Q?EUb2slarKyxpd53pkJ89tP/YGu9oZ2BMtK6XOozOkfLAx2p1IYWYlBis4dKb?=
 =?us-ascii?Q?v+CDYXHRi1FARclw8Nhg920fXgG53ao/PmjAuJejffsoUVPHo5dwjyGy+tVl?=
 =?us-ascii?Q?RDr8d6Hh2hvfBG9/NRt8LwWMvpfF92MD+Jv0d4h5QcetJRt9WhfiPY9qQiAW?=
 =?us-ascii?Q?jtHKhVx7gwXhvYeDEQBUff5mcUxtfLezSZLNbVAh?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5a93876-c5be-4951-0d75-08dd09439668
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2024 09:13:24.6919 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IQr8zWMHUMxES6CbJ9GOZ/rRCMx/jkaxATsMP4Sc9Efh8GmEoomZddQkCBb5p+ce1Lm4hdt7LPQ2ww5ibIQsqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7904
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
> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Ar=
un
> R Murthy
> Sent: Tuesday, November 19, 2024 4:15 PM
> To: intel-xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; dri-
> devel@lists.freedesktop.org
> Cc: Murthy, Arun R <arun.r.murthy@intel.com>
> Subject: [PATCH 8/8] drm/i915/histogram: Enable pipe dithering
>=20
> Enable pipe dithering while enabling histogram to overcome some atrifacts
> seen on the screen.

Where does it say this. I don't see it in the bspec.
Is this from testing that this was concluded in that case we perhaps need t=
o make sure
that the bspec captures this

Regards,
Suraj Kandpal

>=20
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_histogram.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_histogram.c
> b/drivers/gpu/drm/i915/display/intel_histogram.c
> index beaad9256e01..d3c63da7e491 100644
> --- a/drivers/gpu/drm/i915/display/intel_histogram.c
> +++ b/drivers/gpu/drm/i915/display/intel_histogram.c
> @@ -29,6 +29,13 @@ struct intel_histogram {
>  	u32 bin_data[HISTOGRAM_BIN_COUNT];
>  };
>=20
> +static void intel_histogram_enable_dithering(struct intel_display *displ=
ay,
> +					     enum pipe pipe)
> +{
> +	intel_de_rmw(display, PIPE_MISC(pipe), PIPE_MISC_DITHER_ENABLE,
> +		     PIPE_MISC_DITHER_ENABLE);
> +}
> +
>  static void set_bin_index_0(struct intel_display *display, enum pipe pip=
e)  {
>  	if (DISPLAY_VER(display) >=3D 20)
> @@ -205,6 +212,9 @@ static int intel_histogram_enable(struct intel_crtc
> *intel_crtc)
>  	if (histogram->enable)
>  		return 0;
>=20
> +	/* Pipe Dithering should be enabled with histogram */
> +	intel_histogram_enable_dithering(display, pipe);
> +
>  	if (DISPLAY_VER(display) >=3D 20)
>  		intel_de_rmw(display, DPST_CTL(pipe),
>  			     DPST_CTL_IE_HIST_EN |
> --
> 2.25.1

