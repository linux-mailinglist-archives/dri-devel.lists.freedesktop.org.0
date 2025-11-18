Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01998C67BAD
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 07:29:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C911410E0D3;
	Tue, 18 Nov 2025 06:29:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aC1RybX9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD53210E0D3;
 Tue, 18 Nov 2025 06:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763447374; x=1794983374;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ju6CQTRr5oDhTIfbLlJ+oTk7erB4VuQN3/HkSYAxgWg=;
 b=aC1RybX9P8O1MiPCBHFlC5F6kBEuGzshmw3kS7UhzfYdVE3VolJxK9hu
 ux0C/PEek3KqPvXjBOgYTr/IzLwfmL/FFF07K2zLSUHYaP506MpQL/aMS
 hO7xIOQuhsfu2aHPnb6pVO9ddR7Uiw56Q/FkwhRM+zhXoPOi9GYQecsLB
 Q87s32Xfc/g9CcipYfPommsE1GI4grmjydK90E8paV1/J//Mm1sNyqpJ3
 U8Nc00bNFdfe/yKJOEJYlvvDUP8WgkTYIaKvGcD7emoDyEUeK1UAP8qD/
 c+lnXKTAur9Ype98eKeRVSC2Qd0Y8qyVkNd9iodK1u2JJkxT899Y2gqEJ Q==;
X-CSE-ConnectionGUID: 6G9h3/viQQ2yxJBTUnlYiA==
X-CSE-MsgGUID: mj37LQ/BTNOqDOPJ/DIgYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="83085666"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="83085666"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 22:29:33 -0800
X-CSE-ConnectionGUID: SPA3iLZ2Qwicvt7X3g6jkw==
X-CSE-MsgGUID: hQd/mwijQ8WdiVBIM4wBTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="190466814"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 22:29:33 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 22:29:32 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 17 Nov 2025 22:29:32 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.18) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 22:29:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jFWJoC76cl/vxOkOGSLsgfeO9BOznpFtCz5QxHQzejgCxJVyMyI6fRtTEwwQ/YVMyr76DuQaUmfEhMMiIhx90nGLpFrGLqE+HO+TV3vxi3Z99auDArnyx0QHwMgdGhxGPwDajHnoIpNyqbbFYUxhztBhyXI1JrH4LUp0SApE9AkCN+TqlxqeIsqlFuP8qgmkOC+HPhRGpMYDGfOD5lJqWqcF2LBl8aPsEpeHijy6XvnYzK7Gk+SaUHyIIRv1bYUCMq2gtFe5UGiFdKkUPS7f9H0iijWewBekaQhyn8RlVcpSIVam2HMCj68TG2PfJMhh+fdctS1QKBk42fLa0Th/Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RsixAtGnMA8iM0tIoGE+wLkdbtemwrEosCqGDGiTNr0=;
 b=qHa+6GIwNyh+lTWLJyeGGCvwdDnRJ8SPDV6dkilbMtdOYvsdhN/QQuJbfovWIbN5X0lmIWrhRFwlEMlCt5O1Kwt16A3KOxlkngPAGKqtXr0O4cR1CTaTWxf41tCjxQp5oD3lrDzrHhPgkzL+xMglPEdtKVdpUYsVGq/Z/M6S8bWqzK/QnS5QyM4sGSYhR0ylrl/BSOfQjAegvBCEld++E6I7HsM51kG04rKrbHzXiTH379mFwqLykrxyh2kouHqi2YZeFnrSFQnN+jaKYhhQVkkZZ/oRMK/QI8tzhNsgmMIuC6IgxGsyJguGGzZ7HWn60mGzVWy/u2aujHtP0D3K2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by PH7PR11MB6054.namprd11.prod.outlook.com
 (2603:10b6:510:1d2::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Tue, 18 Nov
 2025 06:29:30 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc%6]) with mapi id 15.20.9343.009; Tue, 18 Nov 2025
 06:29:30 +0000
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
 "alex.hung@amd.com" <alex.hung@amd.com>, "Nikula, Jani"
 <jani.nikula@intel.com>, "Shankar, Uma" <uma.shankar@intel.com>
Subject: RE: [v6 07/16] drm/i915/color: Preserve sign bit when int_bits is Zero
Thread-Topic: [v6 07/16] drm/i915/color: Preserve sign bit when int_bits is
 Zero
Thread-Index: AQHcTk7yqPj79FMz8UKvFOQ/AP4q37T4DKgw
Date: Tue, 18 Nov 2025 06:29:30 +0000
Message-ID: <DM3PPF208195D8DE2F1BDD1D5CD418218C7E3D6A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20251105123413.2671075-1-uma.shankar@intel.com>
 <20251105123413.2671075-8-uma.shankar@intel.com>
In-Reply-To: <20251105123413.2671075-8-uma.shankar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|PH7PR11MB6054:EE_
x-ms-office365-filtering-correlation-id: e4c45c25-8b30-4875-4fe8-08de266bd471
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?0zoDSSgHG5szv3TbMPgELgX4Q3mkd0hmYZwdcHRgkCiNv4ffBz96uhFBC3Fm?=
 =?us-ascii?Q?XnR045HVUQwen5MA4QaZ4IKPmTWEYMvG9v1URdcUfGVXvP0yFux7jhkku/Xz?=
 =?us-ascii?Q?HH/neTBDmYs7E2rtGSkZAKVxSvPdk6GCSXCf+0AHXhZqyoZCwd4qtnGaNQm7?=
 =?us-ascii?Q?lTYxs6c0DIY9m7Ttbk28JEnryeC1HnN318AswnR/h1dmkRhJ3hcQ51O5LOYt?=
 =?us-ascii?Q?sD8c+OnwiFePoQpaRV8++Y4RPSH3XijP/sWYi6yuWW0bEEFDeeReUWJUecbN?=
 =?us-ascii?Q?7DlaqCk4lnTVy8O/AbUGRfps3zCF8Y2yNcuIIfCRbXoMlCx2GMupRyGAHbY9?=
 =?us-ascii?Q?9r+85HGXcJfzNp0bN+UmX4AfimXvHbT+q+b809D2f21SASV8I5VT9JhyuX2Z?=
 =?us-ascii?Q?ZI776m/6SJtYLKZOdmYd8aEK53R7OTmlK/FWPCLDbUB7v+UVpXy7rUweqRCT?=
 =?us-ascii?Q?6SBzpeWtYveNXXdPLT6TjlStItvV3F5pS3bkPeSTJnL60C5Fp2UBKMOe4G9i?=
 =?us-ascii?Q?VjKDjUqiFYHBS7BTP6B2SfgulmGndYk0lIQ1gKg8gJ40BbkP3p7McEf3FX72?=
 =?us-ascii?Q?3zMlDrd1ZTkRSo5brNQReEQgk0SnDg/lYgObSg3EDzg38bs9cOAcoX8xII/8?=
 =?us-ascii?Q?HY2+3jvAizjIUa/Un5RD4/5XdwmA5JnIygpANsLpK0/SJvqFArpEZwUadfNQ?=
 =?us-ascii?Q?HevSnB50U+uaOHJD8VvUHFJdhGNPbfOQpsZ7uK7JhGlHdPKKq+sYbw1DbF5V?=
 =?us-ascii?Q?570oGrPTiXA1XXCIJqIKtpslbvWCCMiO+HuUj4lhOtz7QslS87AEKIeWMLES?=
 =?us-ascii?Q?xLgfNqVb9k5i872ZXsTtLosBgOBZj81KTSkDBmoRt4KzCX8HDTVxmaNjXhn0?=
 =?us-ascii?Q?u1tbAVna9NuaP/VGwSnzls9cd9VkpFyyMBIla61DrfxLLHo34n5GEyn3fKqg?=
 =?us-ascii?Q?MB5DBCEDaObgYiXN2FJ6esCKZ5ZvplfoOJPSf6x87Vpcnaem/kmh7eLyfs4a?=
 =?us-ascii?Q?MH30iTIThAzaluMpOggXqK46Gfpf/qRezhVPTQbSNHc8AI0OWHI5Wx0xKaGG?=
 =?us-ascii?Q?C7bniHlpyCO9t+46ICuhrCxJVMaZOEPwDD9j9nrEvDQ6Qnrxwca3YPXzYxQd?=
 =?us-ascii?Q?LfZTmSUM1e95ZcjQyHCJVMMe8CwmhQeNH9TAPtvuLFnhu7nJzuChCz1RvpoS?=
 =?us-ascii?Q?OicE6pebFNpMF1fhf/pKfNt9+GLQr78PkEcA3AQ9GjUbGyDwuAnNT9/61/Fs?=
 =?us-ascii?Q?bnK4Ku+LOWVpdrw+wUFhhZj2ZWUN0cC7FFTZct/PhwgAfs6EpO2/yBxyi0fN?=
 =?us-ascii?Q?831Rvh9zvD2HZRomPXwmB4F9tn74ivekHYRWp7+G54phVfcqIUVS34phRY2D?=
 =?us-ascii?Q?H6NUZzzV/t3TucVdUXL6gsMcSanUogmg6J28w5kKaxCd93hcp5HstTd3hjY7?=
 =?us-ascii?Q?OO9MP6Zmly11uUkJ1a+WHIypYeA7HG0oeL69s0jhP7ggf/GaVO9mq3l6LAML?=
 =?us-ascii?Q?1dPxpK77NUdutjKCDA5O1ppRHRhO79MDSgLE?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?7g7zV8+8TyY2OhCx7xN+VRzcr/Vf481ryJv65Q3Sibu5uFtndTp9OsrrL0pV?=
 =?us-ascii?Q?WobxOkrQNO6Yo9jfXPpsYzdHP6XIZ2wR/RLoXpiGjOdKx9IVi58Hw/f/Fuv9?=
 =?us-ascii?Q?6S+aufiz+TPFEyB6BcyHfxJuTQaC6v5y9IWKtjZDFRROkQ9ivD55JDi9NLhD?=
 =?us-ascii?Q?IzIj3z9NJZZTVH6fwDjG3Y2uvwCGy4vRSYGJXsAosbWLY4MbXvfDuwFQ0Oab?=
 =?us-ascii?Q?SnC4w+w/pRkz0+0HS6MQa8nHEca9vcKGGhwAGkEUGM8/6l6B1fWURWceT9Ny?=
 =?us-ascii?Q?rWHoYmMXWKwbWwJguhXA43Sm65lr+nowBlA2FXN9rI+2V2Mi1Xumolm6dzDe?=
 =?us-ascii?Q?mR7qjqDYBiqbQB56NRh1g+2MbRA0h/PptWDFhEkOCUPvMVFwQPk597AyNLCJ?=
 =?us-ascii?Q?c/x48iDdgD3sqVua17ufp8AHklYl+HhcTXf4YoaW5jTXTNMeZ5ykjOT/JSXe?=
 =?us-ascii?Q?8yL+XImZeuszHQHN4vrrH0PVsGiTMm/ounyjKujhGjrETshBY7MrPbcLaMu6?=
 =?us-ascii?Q?mZFGT0cQKdkiGBTNQOH/rLTuYvK07Rle8zmLoZhX3yQ27cOb0eQgqKY3rZlT?=
 =?us-ascii?Q?MtZ8JVitIVQ346/lg2UHfKvw7N061myP3p3nGnZO/3EkITj4OeChemwvc+TR?=
 =?us-ascii?Q?skfHmhRTVX7urfJD9putEj2q3j33bceyJMsw4QJBDdkZ6cFFo+/8S9A0O3VM?=
 =?us-ascii?Q?WZul6B2dQuF4MNAPrQ86u0sQoIdvzyHR43SBClGV6ASczY6P4GC/4FewQDtw?=
 =?us-ascii?Q?TacOhnj8V5pOR7LIkwE/85jNFIM5YpQzfZy+H4b+COCdnl+hI75EcFJhXtX4?=
 =?us-ascii?Q?JYZ2EgMk0yt672uREYVgDpb11OvL9JAbSmKYwE+R8oLiE2bjRr2vir/XENNO?=
 =?us-ascii?Q?0DjAcsxE/5Dq59+5GXm6S5780SK2P3McmwenbZgAPTQj9x43BhkB7PZHJbCv?=
 =?us-ascii?Q?LZ929NroXR0SlKAbu7ImnHrDhTJrPBAVFgKsW9s0MIUSWrxehybRvM1yAQ/V?=
 =?us-ascii?Q?pvmh+dwHG880y4Xd2rfBsgIhCLJ6O3q/rhhyD43OFegGi1k2W3bTV9VmXkEF?=
 =?us-ascii?Q?ORN5mQwk1ua9rl/cuM5FRUKslJ3KlOlnbLM5/KB6HRbOqTOs6dOAo0ChRuCJ?=
 =?us-ascii?Q?lHl4IemAepS/cmV+kRVCvS4zHOW2jNlUIPZP7AsYKX5P+eGUgf2wf0+s1ggU?=
 =?us-ascii?Q?oWOMIB9z4bf/3vbSv+Pmcwj9L9/k0cL8xG9rLgz6tarLr4lSJ5PcfHAq8RRg?=
 =?us-ascii?Q?7P9YJA22UyI0gl9zsMBMK3ktjPh2dWlMd061kFJjW/LG8sQ8DHhB67WwvT4u?=
 =?us-ascii?Q?+eg01A6Xjayv28588vO0vkyj8HeLzIbJrFGEl6+z+nRArWYykJUhEulubyXd?=
 =?us-ascii?Q?kvBM1UNco1V9cs5Yodb1yYLyfKndbzVZ3tTgoAMa2sF0CwY5G/aSGSLdf76R?=
 =?us-ascii?Q?TqA8SjjpUReamYV2YNUJnPt3/Wi33mMNk4EB8XV7F9Rs042sk3zi/9hyagm1?=
 =?us-ascii?Q?MMYh0eOXSoYYTqXixfhtXuYrS+v99hyed1ECMfKjeMya1PNuN7SlT12GVFbX?=
 =?us-ascii?Q?P7TWtVrxQ/kFw/oKg7yDMfez5ykR0FmJG96ICsrz?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4c45c25-8b30-4875-4fe8-08de266bd471
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2025 06:29:30.0468 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WjbjvqoHABdax7OcNTz24+sJPNJhVeTSwrxjNZ4Z6TnPgdXav/KctNFX9WaDKUFbSamv13Ivy05eqZthGpYfQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6054
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

> Subject: [v6 07/16] drm/i915/color: Preserve sign bit when int_bits is Ze=
ro
>=20
> From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>=20
> When int_bits =3D=3D 0, we lose the sign bit when we do the range check a=
nd
> apply the mask.
>=20
> Fix this by ensuring a minimum of one integer bit, which guarantees space=
 for
> the sign bit in fully fractional representations (e.g. S0.12)
>=20
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>

LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_color.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_color.c
> b/drivers/gpu/drm/i915/display/intel_color.c
> index a45d348c9851..aef25cb63457 100644
> --- a/drivers/gpu/drm/i915/display/intel_color.c
> +++ b/drivers/gpu/drm/i915/display/intel_color.c
> @@ -613,6 +613,8 @@ static u16 ctm_to_twos_complement(u64 coeff, int
> int_bits, int frac_bits)
>  	if (CTM_COEFF_NEGATIVE(coeff))
>  		c =3D -c;
>=20
> +	int_bits =3D max(int_bits, 1);
> +
>  	c =3D clamp(c, -(s64)BIT(int_bits + frac_bits - 1),
>  		  (s64)(BIT(int_bits + frac_bits - 1) - 1));
>=20
> --
> 2.50.1

