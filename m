Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7B19EB12E
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 13:49:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E16A710E8B7;
	Tue, 10 Dec 2024 12:49:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n5LGY2pa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7096910E8B7;
 Tue, 10 Dec 2024 12:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733834940; x=1765370940;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=n2hFTxe1XXJYnIEwhuzyL1Mc/Y9z6Fj9PUkWfQNVN0w=;
 b=n5LGY2paZk6UqXH3kMi9KlDqUsZXUu28i/RiIb3U3nP3suboWdGCo9jN
 4GUSsuUa/+cAH/6ffjikEipx01KkaG3xQFWfZei1Jx+8jzv5l0ceR+mx3
 8WKxthJEG4ao/sx/xZMjaScuhf/hF8rzRbZtkd0QPIh5zq3uj7WnKXIx9
 tdt+a7uJP7MvHpiLVw7DW6XSNanfPfovoC2YABxIBcKRoiV4lIv82OrS8
 2tx7DbXlCj5KWNphPq3ZmdellD+tAmvTuaGoU+odGoQPEw02UtJiC/NLr
 WT+1KUjrpdQrvy2Y9cn9trN8n4sue7pvxDvwbHT8iBHA2wZDsNWOxObMx g==;
X-CSE-ConnectionGUID: 5v45T8n/R3SzCX5Fei6YJA==
X-CSE-MsgGUID: B/WZvXeDRGqrXXli0Yj+iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45573913"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="45573913"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 04:48:59 -0800
X-CSE-ConnectionGUID: pUgfE4c2S/O3fR06Xupsug==
X-CSE-MsgGUID: JFXgp7qMRuqWvH0O0oq+mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="132787712"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Dec 2024 04:48:59 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Dec 2024 04:48:57 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Dec 2024 04:48:57 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Dec 2024 04:48:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SK0pBzlL2tDc4XhBEIqa7WB9E9NXJ2VpWWpkbS+cRZjSZzr59mOcBpDSgI4zNxrLGARZWXAw44LEarAGiLEROPVDtO/m0Mnj7oRi/Ey4ZJTkIoWsgDhGAwnoOTfY2ye8INHOJ/bSGFae4k5Q4JD0xLT5zXDw5R9Y30oGxm8sHMwrk+oiZ3CU7hrRXsa4ZeRIvPB/Vwg0o5gshIMf1bc2OL+AS4s8OiINOmqPuZ2/hC+/G4TTl3ry1b2jDOUGzj4BLkWL5msYTK0eZIIGSwTLv1T+F5IPyyY3t2EUC2Bu2rxJ8G9WY/OBZIzAXgcdx23MwpnP/SHppOwB2dEz53766g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LltlfyeUIOhWUcKpiUM0maTQl4Hv71or/xoyRD4tktw=;
 b=ksemgiEo2PE1AVW4Xhzvl05jfD0BtPhy4qLZvtzVdCqeGlZyywmoP1IZ2zHNbMDUVxYcoHDAVJ5uV1hH/xmuJpvUn7YaX+KvOw3wnEbau1FXGZmRIN/C2ANPSbsHccoQ0PiR520i/SoIBVJOZzPohH8kLuVmQTeJfLXvxFVodLEBdlWpg48H1JT6iy26pdRevzZwLCX5oXDJN+G5jSLU78ObiEdhf1c84D+zSYBIa42CpyjOPFw6q5DXyMAv3oBCR2xyTwr8kxkVWvhOb5POrZ5T+So8bn7JaejKriPaSYSGA5+gpwWmlsJ87MWBG8UEQxQ/w9aaSirwBswTAYQfSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by PH7PR11MB6721.namprd11.prod.outlook.com (2603:10b6:510:1ad::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Tue, 10 Dec
 2024 12:48:55 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527%3]) with mapi id 15.20.8207.020; Tue, 10 Dec 2024
 12:48:55 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "Murthy, Arun R" <arun.r.murthy@intel.com>
Subject: RE: [PATCHv3 07/10] drm/i915/display: Handle drm-crtc histogram
 property updates
Thread-Topic: [PATCHv3 07/10] drm/i915/display: Handle drm-crtc histogram
 property updates
Thread-Index: AQHbSlhfR5yNWzUkgUCPILcIkj1dBbLfbs4g
Date: Tue, 10 Dec 2024 12:48:55 +0000
Message-ID: <SN7PR11MB6750E2E43C91627CD9B933F9E33D2@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20241209162504.2146697-1-arun.r.murthy@intel.com>
 <20241209162504.2146697-8-arun.r.murthy@intel.com>
In-Reply-To: <20241209162504.2146697-8-arun.r.murthy@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|PH7PR11MB6721:EE_
x-ms-office365-filtering-correlation-id: af35ba84-6d82-4ac5-98be-08dd191901cd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?n9QR4OH+E0Gx7GiyxdXaYVF8zDrVpLDgMc1FrFScgRj3mTE4zWwrRhvA3wJZ?=
 =?us-ascii?Q?Lhlc+sv742sAEWNmpT771D5/aWZBKpjDck8S0/u/uMjlQWfkkaUPYuGXTfJS?=
 =?us-ascii?Q?rfqlQLRS0MAOkIUjVecWLV50okiTtZW73jw2EYKGeR2y6blh1/O5WVdUh17B?=
 =?us-ascii?Q?UuOXuYctfTFtdKvHC4511oLdcsjgz9ST5bwKNogT3xZscp69NhUUf1FH8pKf?=
 =?us-ascii?Q?77Rrr3+MsuUW7jz6/jEMsepBgKFPsUoiHGnKAdg3BKMpLKs7YqZfNMh0jGNJ?=
 =?us-ascii?Q?ymyMk2o16dmH5pn6B3cvOZukE5flvx9PfOKq4HrYs+k1mlZImBfRJIW0AaQ9?=
 =?us-ascii?Q?NjuwsADRqeRcJuYu54o8punFjT6eHH2b0+jHZLJthF9R1jPStA4uOdCTqmkS?=
 =?us-ascii?Q?c2G2t+C9nJmsT3plSNTqGCbXz4QvS0LifRZc1op9afIzD0/S3ZwRVer/kL1j?=
 =?us-ascii?Q?4Ocn+J0vMGluAeGazZr6SifWwjWmAJXjdx+tdZQnBNDtv4p+CnYmjC3xq7vj?=
 =?us-ascii?Q?vja8GBBRpE7aahJ3P9kQYG8zUFxLB5eML7x+E4W8YVttuJP/HC+qAiy8tz+c?=
 =?us-ascii?Q?bZLhi8+hrdE/jO3dbsqih2FAwtEoHz6f/La86j57kpDmo0CdBsydjZs0sLcn?=
 =?us-ascii?Q?aV06lqYkUurzZAbTa4HsLU+V9H8L1kNkzp2j7e/B6pI0X5QXQg/5UOL2iOO5?=
 =?us-ascii?Q?sxXOPC2BOHjO0M3qL1e8HzU9bGgfNFp19BiNTorG0AEAUZcDtu7vKWHqMle0?=
 =?us-ascii?Q?i8vc4ZO6K03LdR0D2SFK4jpXBGTZA5rfmcqi+b/qyYjDWiaxo1/bMMvlyDD2?=
 =?us-ascii?Q?sYvuhSI0b2Y12QEpRuPThGXEX+GA/Uew9zFGLiyVFAwdrQYyquWdUT7b7K/R?=
 =?us-ascii?Q?3qZLxYY0wkVKNeItGajGhTF22KbvP18scuYCRRoWXat8hqLHg/aHn3jGqCZE?=
 =?us-ascii?Q?gP+pYataWR26hYZ8TARyBboUGxD1y9LJkXwWuEyRQMxH6dV2h2YNChj4ElLm?=
 =?us-ascii?Q?agDUKe2afeyRtbuY1OVFEqYb4q69sFLdzT0eBf0KPdgiNXRicEdbqXbEN0kG?=
 =?us-ascii?Q?SIC/RT5rnFke8lA13WC96W3jdDvLXmnL7VSLH8mppwbRLEHw6jY2D15J71Ir?=
 =?us-ascii?Q?tgujs6G9kLy06ecRZgne1sQBZCIrSvIcXMe3RmmmeSD4+ObcVkOLilAGwvJf?=
 =?us-ascii?Q?hee9GOYHWnZWUr8zke0c+9zFPMXsTIkpVuVW+a758eSoaFwdvGGmgXGMtMkA?=
 =?us-ascii?Q?J3mlDOsjFR8kgDqA6wT48YLsLMvaxlpow8AAIUjFEeSWI9ZBLz7tKaQSBnuu?=
 =?us-ascii?Q?zaWFSY9V1qy6m28ndUh7fl50ikJU5C6Z0S0utME+hbsBMQz7rEUKV3YvtXWO?=
 =?us-ascii?Q?usIqWIyblMpERQLCNiwB1ju4NG9ny+ln2Je/fSeVAweLtl4uRg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?7drlK0Va7imWLv9XcqHpXhaSlJl+dBKNGPyG6tIjbfCL8U8mVFNlBcjnBWtk?=
 =?us-ascii?Q?RMc2EZNWXtPXUDFezGpyJnFBcw2N0grUInbkDc/0CcoSYAaeVi1vrD932hkj?=
 =?us-ascii?Q?KgzKGEegz42rviw4XENO0AJ3xPB7OncLCSews1a0NP2TdoS56Kx4tTtY8apB?=
 =?us-ascii?Q?HKtCpeKWd0/WQlZgS1Yz5J6sq+OWPIxHgi2+61cKRKrzAiehciUqAB8BL8Jp?=
 =?us-ascii?Q?r775ZeuWoCIgmM597kQFideydaDwjIwjBvqrcbiVGeaT+JaNiG9vgRJK59pq?=
 =?us-ascii?Q?JiWK5x9vkEUOjWN/65jrJs6ywESccvjgHcDjCpVXGC+25Drg21w5yY5ZrP2d?=
 =?us-ascii?Q?ZT2huZm1AurYTHGjwbE4Gm2GVjdVOvMXDkGvAMZTVMQn7HzmzAWHzzcEFlpZ?=
 =?us-ascii?Q?IeJ2wK/fWIaByvCNXug4R1cZ7hsXlfr223wQ4JsVV1UQwKO/EU+Pp4ApwXfI?=
 =?us-ascii?Q?SLF3fDoNpHHnJXe8CAA/HeUUJKdIqMxmjIn3uTfJ17eurF4/I0BEtfjJLYHr?=
 =?us-ascii?Q?99FptRcjsIL+Dchr/DaD2OG7jEU+rY3W1g8HrzfV9A2Vj8kWTiZamYEGH0X/?=
 =?us-ascii?Q?NUKfERnysEuBuyS3WgucnUpqdh6UHDfm7gWyqzYfbbxpBWWGzpa9vOLnjiaF?=
 =?us-ascii?Q?FYjTu3BQJ562DB238bL7Ng+J3nk2X3uKvwwNR14n3UsViAkL4TxSGob8SXrj?=
 =?us-ascii?Q?fmvyk0vctcbsuQNCeiy2wLF/U+CXWxx5x8v9nM3K6gmC8KiItU8MbByJbbCq?=
 =?us-ascii?Q?OLlUl3RUe1JZG1ts3eA+CiaO7APfFsp8AlVvnrh72/2DtdKinqT/JJJbg1VD?=
 =?us-ascii?Q?bs7uZcj7fZJqL/myH3OxgJsDYppKWo4XXeEDlZiua9JCvb3gfA/GzyRzPwSI?=
 =?us-ascii?Q?M49f8NohUQygMf4oDPZWph7nO7U2nrp3o14tPxCfKIM+gT1cBpNrJGoLBPaB?=
 =?us-ascii?Q?MTRzXTjnMqaL0rxW6652k4HSElaqo+PnMTAve35La9y6bJ6EieHeFQpxMNLk?=
 =?us-ascii?Q?+8wJAIcG06ozUH3iYDUDjmKZ+GHPNuFoOCn4DQTQB2n1y1ht+LQP9LyXc7EG?=
 =?us-ascii?Q?Xc/pxi3gxfagn6gMGkIPggfzGUz1oIuw8q60h46P9jwxHVLyHKAKQ9U7x6x1?=
 =?us-ascii?Q?/adUTvEljOay6C1S6/FNJ4KVVN6kNFxdmy3PE883yYhrQS/ewfj+j6wOeKhV?=
 =?us-ascii?Q?Ns3clfI1PFp/3m5IxuVL4OUiv0yhurnJ3aqQ13VH3S7fBZp0eu1eycIA9ro8?=
 =?us-ascii?Q?GxWR8GIz81YCsSCAvHvG0iM8JREf3DvHvs0NEafnoTFC/27j54OYyIY0i8kf?=
 =?us-ascii?Q?ZvODpNbzBNRtZhfXXG/h08gmPchjMAoYYga9hxYnv/nZkgXVQhcBiYIY4Pd1?=
 =?us-ascii?Q?KvuYdMW1uGFVIPFck18G14oOzzcDb1wAR+Vbce033sd0MtC753gBRLrhOo3B?=
 =?us-ascii?Q?how/88jkHTQiTot1Bx1vOY4s8Ssh5oJ5a25Th5iV8Oou3ruCzX+exptKWXxs?=
 =?us-ascii?Q?9EM8nZD2xPUccU8Astg+ciWzgmWhGM/reg7KY8t3NYTUgSMstm22f1JKKXsT?=
 =?us-ascii?Q?uJny10BU91Ouqi9y6VgFpxckJOajFNBmJXyjGc5o?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af35ba84-6d82-4ac5-98be-08dd191901cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2024 12:48:55.1387 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fWtN64HnNhtSTKcpdL5kngZyTPT+lc8zAydmYp+lHo0aFY61yVgn41rZag/fQrzx9kyw0T1CVSt1qHdiBh6w9Q==
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
> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
> Arun R Murthy
> Sent: Monday, December 9, 2024 9:55 PM
> To: intel-xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; dri-
> devel@lists.freedesktop.org
> Cc: Murthy, Arun R <arun.r.murthy@intel.com>
> Subject: [PATCHv3 07/10] drm/i915/display: Handle drm-crtc histogram
> property updates
>=20
> Check for any updates on drm_crtc property histogram_enable and
> histogram_iet_updated and call/act accordingly to update histogram or
> update the image enhancement LUT data API defined in i915 histogram.
>=20

LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_atomic.c     |  1 +
>  drivers/gpu/drm/i915/display/intel_crtc.c       |  7 +++++++
>  drivers/gpu/drm/i915/display/intel_display.c    | 17 +++++++++++++++++
>  .../gpu/drm/i915/display/intel_display_types.h  |  2 ++
>  4 files changed, 27 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_atomic.c
> b/drivers/gpu/drm/i915/display/intel_atomic.c
> index 03dc54c802d3..dff130b3565a 100644
> --- a/drivers/gpu/drm/i915/display/intel_atomic.c
> +++ b/drivers/gpu/drm/i915/display/intel_atomic.c
> @@ -278,6 +278,7 @@ intel_crtc_duplicate_state(struct drm_crtc *crtc)
>  	crtc_state->dsb_color_vblank =3D NULL;
>  	crtc_state->dsb_commit =3D NULL;
>  	crtc_state->use_dsb =3D false;
> +	crtc_state->histogram_updated =3D false;
>=20
>  	return &crtc_state->uapi;
>  }
> diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c
> b/drivers/gpu/drm/i915/display/intel_crtc.c
> index a2c528d707f4..0c8741ca9a71 100644
> --- a/drivers/gpu/drm/i915/display/intel_crtc.c
> +++ b/drivers/gpu/drm/i915/display/intel_crtc.c
> @@ -27,6 +27,7 @@
>  #include "intel_drrs.h"
>  #include "intel_dsi.h"
>  #include "intel_fifo_underrun.h"
> +#include "intel_histogram.h"
>  #include "intel_pipe_crc.h"
>  #include "intel_psr.h"
>  #include "intel_sprite.h"
> @@ -210,6 +211,7 @@ static struct intel_crtc *intel_crtc_alloc(void)  sta=
tic
> void intel_crtc_free(struct intel_crtc *crtc)  {
>  	intel_crtc_destroy_state(&crtc->base, crtc->base.state);
> +	intel_histogram_finish(crtc);
>  	kfree(crtc);
>  }
>=20
> @@ -380,10 +382,15 @@ int intel_crtc_init(struct drm_i915_private
> *dev_priv, enum pipe pipe)
>=20
> 	BIT(DRM_SCALING_FILTER_DEFAULT) |
>=20
> 	BIT(DRM_SCALING_FILTER_NEAREST_NEIGHBOR));
>=20
> +	if (drm_crtc_create_histogram_property(&crtc->base))
> +		drm_err(&dev_priv->drm, "Failed to initialize histogram
> +properties\n");
> +
>  	intel_color_crtc_init(crtc);
>  	intel_drrs_crtc_init(crtc);
>  	intel_crtc_crc_init(crtc);
>=20
> +	intel_histogram_init(crtc);
> +
>  	cpu_latency_qos_add_request(&crtc->vblank_pm_qos,
> PM_QOS_DEFAULT_VALUE);
>=20
>  	drm_WARN_ON(&dev_priv->drm, drm_crtc_index(&crtc->base) !=3D
> crtc->pipe); diff --git a/drivers/gpu/drm/i915/display/intel_display.c
> b/drivers/gpu/drm/i915/display/intel_display.c
> index 35c8904ecf44..fb393e5a4c84 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -93,6 +93,7 @@
>  #include "intel_fifo_underrun.h"
>  #include "intel_frontbuffer.h"
>  #include "intel_hdmi.h"
> +#include "intel_histogram.h"
>  #include "intel_hotplug.h"
>  #include "intel_link_bw.h"
>  #include "intel_lvds.h"
> @@ -4612,6 +4613,12 @@ static int intel_crtc_atomic_check(struct
> intel_atomic_state *state,
>  	if (ret)
>  		return ret;
>=20
> +	if (crtc_state->histogram_updated) {
> +		ret =3D intel_histogram_atomic_check(crtc);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	return 0;
>  }
>=20
> @@ -6832,6 +6839,10 @@ int intel_atomic_check(struct drm_device *dev,
>  		if (new_crtc_state->uapi.scaling_filter !=3D
>  		    old_crtc_state->uapi.scaling_filter)
>  			new_crtc_state->uapi.mode_changed =3D true;
> +
> +		if (new_crtc_state->uapi.histogram_enable |=3D
> +		    old_crtc_state->uapi.histogram_enable)
> +			new_crtc_state->histogram_updated =3D true;
>  	}
>=20
>  	intel_vrr_check_modeset(state);
> @@ -7900,6 +7911,12 @@ static void intel_atomic_commit_tail(struct
> intel_atomic_state *state)
>  		 */
>  		old_crtc_state->dsb_color_vblank =3D
> fetch_and_zero(&new_crtc_state->dsb_color_vblank);
>  		old_crtc_state->dsb_commit =3D
> fetch_and_zero(&new_crtc_state->dsb_commit);
> +
> +		if (new_crtc_state->histogram_updated)
> +			intel_histogram_update(crtc, crtc->base.state-
> >histogram_enable);
> +		if (new_crtc_state->uapi.histogram_iet_updated)
> +			intel_histogram_set_iet_lut(crtc,
> +						    new_crtc_state-
> >uapi.histogram_iet);
>  	}
>=20
>  	/* Underruns don't always raise interrupts, so check manually */ diff -
> -git a/drivers/gpu/drm/i915/display/intel_display_types.h
> b/drivers/gpu/drm/i915/display/intel_display_types.h
> index 0f50081b9957..15f4bd3ccc62 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -1317,6 +1317,8 @@ struct intel_crtc_state {
>=20
>  	/* LOBF flag */
>  	bool has_lobf;
> +
> +	bool histogram_updated;
>  };
>=20
>  enum intel_pipe_crc_source {
> --
> 2.25.1

