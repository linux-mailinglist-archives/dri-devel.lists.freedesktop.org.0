Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B83D9EB11E
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 13:46:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE3F310E3AB;
	Tue, 10 Dec 2024 12:46:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iJrr4W+9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27CCF10E076;
 Tue, 10 Dec 2024 12:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733834782; x=1765370782;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VH8eTI48TL1mbIFHjrMyfXkBTc+f+1uNdQwrjNesIkw=;
 b=iJrr4W+9FqRfL2BqeArg/AUux8ogqbCqxayJi1GtDVEoE2JN0Ygo91rz
 T+R31d9gofPLZEmJIN0yGI8sfjAAW/ih/pZ+M4djyCW4HehCqJKbj1fUB
 DqQMgsFLy3jJ0vq4+6W+U98R3/2p12dzUoKVoe+zMIfGM7PPwnfIcd4Oh
 ukoOowYVP/snWO/P1GM0BuZfwPofeiPo2XeH/y/FRzABKiTnliakJS0NQ
 Ys4Stm0GU2Xpbz7Oxzb8j88DPhEPzstpO57/vb/17sbkqQlvSves+Ktd8
 xLF4HANZCnxgCmM7iKpd181Vy4iX+MN1WL+uVSmIlxs2YQGtHRYwgPzkz g==;
X-CSE-ConnectionGUID: 0Y2b/nBRRHCDl/pAuxdKpA==
X-CSE-MsgGUID: TyNiXlgsRx+ebFZYNITT6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="34293106"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="34293106"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 04:46:21 -0800
X-CSE-ConnectionGUID: gr9Hz3+RTJm2AQUiKQk8Lw==
X-CSE-MsgGUID: zMmyLQmpRCmKKqweiMQriQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="95741861"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Dec 2024 04:46:04 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Dec 2024 04:46:02 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Dec 2024 04:46:02 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Dec 2024 04:46:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HP589VX+6npieAcpMRqbpPfeBiXxY4/3SQ0G8lKXLohw1vJkz68gH+B/Yc7RL3qL+BsbCj0g/rOWjS+DbuCG3S3UBlIv2kSmMC2BmQ+N3waMI8x0XPVlx9g0W0aYMzwJUZJJWUF+E6wjG+Kaams8skXvpI8e60AeNFhg1E5B1Zc3FiWi2UQQs3QTrYYAtpcjtQ1veggl9nf4FOiWT0WoWZeCHJtOs4ZP4ZeSGcmqv/j5vR4cgMY1+kZQMm13iTWlAQ69BPvxst/3iobl9HbdKYTV3aZvVAFOhBH3I99Amc1QsyntRww5Og9sV0JXWxylfs+xPDRz6tcRtn/SA1Ak1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EyJp8EYDkGotvmxeEFVOO3NEiEXGDnG0k6oURYgkrrQ=;
 b=PRrn3l54bAZuj4LA1++K41prCqiFQOq9qJAB9i2Zoe12yECQt24yr1qpb43a/eePgG4DXDTe5a8Snx8LQAlzsEJDPi4f/4lP6Kg7ZRLHDN6QtyhUwJYHwk/E+l4WKuiT8HsF1vbYsGs2JjoTQuQ9ZEnnSH/QHhDzhQX4uUNs1n57IVSAzspex5PShWx9Mmz+xfYEAaTyGqh86oIqFN03L7y9pi8HpB0lArBXEf96GIRht+PKeG8Q2j/mcsXJVlIT5/a0VTKcZsptEeg2xYXQH9+gLjmQbbJ7uH5Niiu641w3fWvVVrMUilkQ/ZUrUiRxuPJm7fglIZdT6OTEi6JehA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by PH7PR11MB6721.namprd11.prod.outlook.com (2603:10b6:510:1ad::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Tue, 10 Dec
 2024 12:46:00 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527%3]) with mapi id 15.20.8207.020; Tue, 10 Dec 2024
 12:45:59 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "Murthy, Arun R" <arun.r.murthy@intel.com>
Subject: RE: [PATCHv2 10/10] drm/i915/histogram: Enable pipe dithering
Thread-Topic: [PATCHv2 10/10] drm/i915/histogram: Enable pipe dithering
Thread-Index: AQHbSlhgsQglWkrO/kWEo+s3aSvDKrLfba6g
Date: Tue, 10 Dec 2024 12:45:59 +0000
Message-ID: <SN7PR11MB675041E89C48DEFD2614D02DE33D2@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20241209162504.2146697-1-arun.r.murthy@intel.com>
 <20241209162504.2146697-11-arun.r.murthy@intel.com>
In-Reply-To: <20241209162504.2146697-11-arun.r.murthy@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|PH7PR11MB6721:EE_
x-ms-office365-filtering-correlation-id: 2e25d5bc-186e-4012-c2e0-08dd1918993d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?lIYG/wrtorfLltERhRw00gsW9atO+Bwh70JD90u64EsArh0BjtS1yT2pbl2V?=
 =?us-ascii?Q?XjZmc5OzBGGftQqwupGT4MGd+rm1e9+c2CYPILUFDAzLjJR1BAAoq0nKXAm0?=
 =?us-ascii?Q?mgdKdVHZe6lCAhTRaG6m+XEDFev85LQK2yKStn5jO1+eAiJARuL1XSd3YqoL?=
 =?us-ascii?Q?uApsYBr3JfkYqFETxoqWaqNLHhhlghqFwAsk7FBh/FTEj3VxGus9cTVXtGNW?=
 =?us-ascii?Q?D6mOwwGCWzMjoHBdV9qfRa7Vvt+aN6FarDc8MusvGc6NM8FZfya5Y51zmvoZ?=
 =?us-ascii?Q?KAzYLPJFUb7qc30ZP4e/IGw6V1zQ4cONcYTSo3kW9vCL7pgnfBGzZtgbG15a?=
 =?us-ascii?Q?tR5xmbU/1SKhGrAY12DDOQDev5w01TUnd+38ak97v1YUSQPWMT5UhLTr1haC?=
 =?us-ascii?Q?9gPdLmGl4ALN+kJInEsA9uF6MB2vhSxEYT+jAEnMoYJy14sCBqvJhjOsWS9w?=
 =?us-ascii?Q?UDNsN7J4S1VtvCNXE8yvJDJvH+M7DMTuynTk4MPSl0VHkXY7s8TFBzW5/9fQ?=
 =?us-ascii?Q?5igcrUXcTvZkAQUNANLTLLLopZLhNWUpzv9tW9b4hKv10i23UWbPmPfzAoNO?=
 =?us-ascii?Q?Dl+iNX3bo4Ebt0YKYFYP5W+Bni+JnRDJxX1b+sx+OsyyrxmE42AD1AkmaIgu?=
 =?us-ascii?Q?oDH2jCgQX1VpqTswKk/R6vA37Wp92uujuWEeNVxn6GYLDgrmlx7hGSyEyT9d?=
 =?us-ascii?Q?HVmlqb537fEcF+wSnlhuvzOx3XaUDLm/qOBd/xi2NZZ/pqjg2twVmQ1J6oNY?=
 =?us-ascii?Q?XvwdtXytFv9RE6VRJsSJEn5gaQClKluVezoWJcEyb4n8cRvXfEcTOMGp0Hkl?=
 =?us-ascii?Q?a4i1Hh2Idk93YkPL91onUAGOzb5h0jzVdeSSCTx+mfQvAuh4Yh2yiUutt3iW?=
 =?us-ascii?Q?t4lQ8EkxYJ48nJPAFilCbRPwpx4FLQMGJkCvnL2x0TBUKqND8BerpX4lceVf?=
 =?us-ascii?Q?GebsD7GrF25Ad7MsKkyqM7MNEE6yUXaBzDS78+ki9K4pGP79jVCwzY7F5UWM?=
 =?us-ascii?Q?1FL46QMiB2AJREarVDMp9O6xCkAVZc1xJGJu49h32rgtX285VemazXTSlPbF?=
 =?us-ascii?Q?UEW3LH3lG4k5z9+73HkjcyVGd0qU8HOg82LBeGP1O8+EwswnQUKgg0PB2srC?=
 =?us-ascii?Q?Quz6x3c0gf8vOWUG4saDPMx4/vT8V/i6EcpZsUB490xlnjhYsQl3i7ifpBvQ?=
 =?us-ascii?Q?DA/PxULXsgS/XbAzesKXMGkaVgPIfm60mBCEkDPTY/lPqFg13xxWhcVw6hWf?=
 =?us-ascii?Q?DZM+i++hHscwFZLmm6ZPDVDhK1OcqHBR1DU1VF6RJzFr+JEROBNiaBi+BywD?=
 =?us-ascii?Q?82ohDBoMK4dNjZeby0anj23GhXfaApUhm1TF6JfngZWLyvc/DnRY6zPGM8V4?=
 =?us-ascii?Q?AIhE93yR094Mfd1FTOKYTZHf7gtlUbthmSp9kG1ffeiBsNZQyA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?UdKY3TSSrSVGuRonUIWmy+Z4Ni3W/l7sHpOXVrisqcO1iHagXxlcATnHGPR6?=
 =?us-ascii?Q?QPMbx4tqF9Nx147G5QVlNLL3sW1/omwKlTf2Bf40cv35FltTR7XJDq3sxuZ1?=
 =?us-ascii?Q?mOsRO3wb4Fnd5cFaxXm+Gm3dNnxNny7EyiQPECcIi3oUoSEIdk9WcB3X2lAb?=
 =?us-ascii?Q?W4CjQPAnBrXcoVu2UbHXJyQzuK0xjWNt4XR98uwPud2Fz++mOtM214vOJBBm?=
 =?us-ascii?Q?0fh8eQyuOe1XgNFELDf/PTw88viA+QG5NX8B0i4dm5B55kOrHiQ3DQL1FVtv?=
 =?us-ascii?Q?ThBApC8A8dDPHhqyECOoSIHPgbqPg0v2LZ7Ze3FIpP2TwCR6s0HLRFIju2rc?=
 =?us-ascii?Q?TPDPqzcYnGTOS6gNYg9uJN7/IjO83UnDIzigmnrhHyG+MXiEmnttrb2F384l?=
 =?us-ascii?Q?v+NRjGJQuwGXWNYz51om4TjcJn0JwPkFALVGC9b5prB360o+tCKDZ7gb6QyY?=
 =?us-ascii?Q?OfT0ssiCgZoObX3+h9JBRF8aJ6Jp6Da7adm7r2agWzR2oM/FipGa82vGj7X6?=
 =?us-ascii?Q?kQ1Dy59Uxzo8Uw2irK+QSJSDiO1y4tjZYwuImSCz3Vn9k5mHO0cJg5GoSdbw?=
 =?us-ascii?Q?imyjUmx56gS+QYPKSqYlwIM34dn1uFs61XPMMpXS8DSbNNwlXkLDZveGyywc?=
 =?us-ascii?Q?p5ReNDa9rpLFsmAdJeNwwVlObgZ4J3QCueKTluMDNIGvyY9GAD+vpf108reK?=
 =?us-ascii?Q?3VpDPrrjNUDOBMtBgOIDdYo1Se58Nm7O9C0VqewxsbfQjo3RCQkbi4HKAd5O?=
 =?us-ascii?Q?4iLFzavkBOfcfZe6GQxBmI0trQgemL98hMlzz+388tS83z4MJIiKic+uHnsN?=
 =?us-ascii?Q?c626/U7iLgz/N3sU301PnmUrzlwSUTKTQkz7zIcARXlSLdf4y9l/r5HZ19RV?=
 =?us-ascii?Q?1hBv56rcsphKAnGBEtdK4vI3aa+jrhzEhUYbxsdQmsc581atHAMhWzhtUPbp?=
 =?us-ascii?Q?L7MJBV90StPdQS91tnUbJO9YFnG2fIFHbCpDDSpiBJUEBZ+H7kqc9cdzQStT?=
 =?us-ascii?Q?0kIFjAqll2scWicfWqAkjGVfpLcy+XcTFoLtAqQrY+5P8Ggfuk6FoiSFSHsV?=
 =?us-ascii?Q?q03OLpHBUbBLsNrCgZ1c/wtc7xmGh6thRbOO3w6u6gBCNI6+K6NWsGu7dsHi?=
 =?us-ascii?Q?sCssQ3LinWIkjCdMlGVXLsDfCIgylVIb7xWqfbzSc0fweh9/ibqToET+G0rZ?=
 =?us-ascii?Q?ci9FNHQ6Xv8JHVsDs8sogwdct6lvufGtT873pr36nTEY0Nz5+sHRl/MukFbV?=
 =?us-ascii?Q?UXp3rPf9IWIX4aA+FhL1UEiBIgedQl/CoFKQ8qwZj9rqeZJRblGjJSOvg88y?=
 =?us-ascii?Q?mUwfO2hJUIqRE5CrF4lcVJO2A1sCjCf0HYBkYZ4hKguHuYtc1tWMKvR7FxmR?=
 =?us-ascii?Q?key7iWmplTgoa1lXbhn9ONjaUuo8cia06ZlJ1rvL/Zx+D8EXDGuPZHFWtSsj?=
 =?us-ascii?Q?4KlZPPDhiVQC+XdeBcE0aQwjqyGo316mx1Uqb0hi/gIwt6khP2kRBw6J9NSL?=
 =?us-ascii?Q?DIflwz80yiXjwdbNWzok8E1FWWIqJo0/XqTyudEh8quzLZN+U7sgkUCLXezY?=
 =?us-ascii?Q?VThC4Cw6Jvgju7HYexn/jH2UVyPchYFUGyZ8sv/Y?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e25d5bc-186e-4012-c2e0-08dd1918993d
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2024 12:45:59.7159 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vxuQT7AGNnng+mvsH0CWy1ye6GeNGKf1Xt9SzcO6QgI0reJey1flt2iXStcfPxGA5bisnBx4+QE5HRD7a3ju5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6721
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Arun=
 R
> Murthy
> Sent: Monday, December 9, 2024 9:55 PM
> To: intel-xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; dri-
> devel@lists.freedesktop.org
> Cc: Murthy, Arun R <arun.r.murthy@intel.com>
> Subject: [PATCHv2 10/10] drm/i915/histogram: Enable pipe dithering
>=20
> Enable pipe dithering while enabling histogram to overcome some atrifacts
> seen on the screen.

The commit message here should add color processing in histogram creates co=
lor banding and dithering helps avoid that.

Other LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

>=20
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_histogram.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_histogram.c
> b/drivers/gpu/drm/i915/display/intel_histogram.c
> index d503d0f0a5ee..545376ae365b 100644
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
> @@ -207,6 +214,9 @@ static int intel_histogram_enable(struct intel_crtc
> *intel_crtc)
>  	if (histogram->enable)
>  		return 0;
>=20
> +	/* Pipe Dithering should be enabled with histogram */
> +	intel_histogram_enable_dithering(display, pipe);
> +
>  	 /* enable histogram, clear DPST_BIN reg and select TC function */
>  	if (DISPLAY_VER(display) >=3D 20)
>  		intel_de_rmw(display, DPST_CTL(pipe),
> --
> 2.25.1

