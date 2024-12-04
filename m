Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B60A19E32D2
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 06:00:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE14410E027;
	Wed,  4 Dec 2024 05:00:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UWiUEewc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5361410E027;
 Wed,  4 Dec 2024 05:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733288456; x=1764824456;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=78l6WLYZvLrT0YE6o/yBU9GYA1n9WmwbDXF0/TxGoZk=;
 b=UWiUEewc8XXPa/0QNKZP6Z30E097XHRDlJ/y18g2FEZTFHWkKp1VEoWm
 Mzz+gArqOXpufl2OPUq7Dq9/n8M4BYMSgkGJsAgn4TbJAYHstHoFX1gmc
 mehQ/PFXcbq+8cTJhvJ8xVsOs/+i8sd1KrQVGU+HX1v+5yp+4AdIrK/C5
 sYWeAHMPJgRhK734tPfX5Ddj8YkST82iE4JpKuec2ZyFgCFRvXWhLy8wS
 M0VMw/KzRBRbpFcb1rKMtK7mLuKIBoyiYUQ/xYn81hUJbyFNmlU5dTvBX
 vfIeacWjCGTZeNoRZdD4HJUhmex8+wpLS75FCawIM2vNQ135qOUx3oRw4 A==;
X-CSE-ConnectionGUID: YsJKXC8jR8eV2sqvcMBdmg==
X-CSE-MsgGUID: w+IN/ciwTJG3RqbGQ5qwKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="50955001"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="50955001"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 21:00:56 -0800
X-CSE-ConnectionGUID: za7ygVaBSFalQMzcACC7gw==
X-CSE-MsgGUID: SLhFG3N2T4CfxKwmupsA7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="98732599"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Dec 2024 21:00:56 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Dec 2024 21:00:55 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 3 Dec 2024 21:00:55 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 3 Dec 2024 21:00:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aqEtjlPGQqx09cojhuC1nuuwQ8On7ltLEchzzcG9kx5me5Q6tBIh0FuG6CSQvnEdaroI++QEVJWLFURMCVcCgfibeP0A1F17mVx7znt4ip3GckLhx49txhM3DILng4hqwNZJQ9YVcQ9QcNjKc3Ee7vJTROtZpN3KMEPFXq+cq4kiF0hX95mdeYdkCv2/37N32fM2zU52dQmERRkg/yAn2RABjh4eLo0bJEC+Zx4IceuzEHVlJtthxpsPBpTErDVtFTYF4gWphvoDwG8WaCKg7kMjZnrEg/fhuxJ+OpHHbXdw+UFynGaXBDkTds3DXb8D0JOTJQTP7iHbM7GqyPMG+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=20xUhgmcHAQWtv9vRNmhMFeTvkYBjTQ5J8GZR+xWCoU=;
 b=XP6lnFHM63w5Ulg+rrBuQM9haCRjFcKRZlICbiNi/r60h1t+bSfPEHL4iOiZywgTvlU7+J2/m2sE3sVM0of85GCcDJFZUnC8VRKJMgJcBiZdJeFxSP+GnoQaDcQf6Yn63BVsXCYlkLj6Pu+n1X+X30Zo78YDTf1EzJOJJtV6IlqZMdOgk4gkNAxbDUN5Tiji8zhvpY/dSeweQ0NyvIFaoeb0XGxmAo0fha3iQV6qSLYJB9i8ZKatqFwUxrqVnGZu+7FmTN3R6WGdBFdQku8OOwRn3s5NH2i0L8Oxf9LNpiaDs/x28/gjbbj5I90qwdxkIw5IR6tJQJ5nGFggTL6V1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by MW4PR11MB6668.namprd11.prod.outlook.com (2603:10b6:303:1e9::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.20; Wed, 4 Dec
 2024 05:00:52 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527%3]) with mapi id 15.20.8207.017; Wed, 4 Dec 2024
 05:00:52 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "Murthy, Arun R" <arun.r.murthy@intel.com>
Subject: RE: [PATCH 01/10] drm/crtc: Add histogram properties
Thread-Topic: [PATCH 01/10] drm/crtc: Add histogram properties
Thread-Index: AQHbRUlV8Iu7io2U3kq869We0YWk+rLViCcg
Date: Wed, 4 Dec 2024 05:00:52 +0000
Message-ID: <SN7PR11MB67503D6C96D73594434C5AA6E3372@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20241203055520.1704661-1-arun.r.murthy@intel.com>
 <20241203055520.1704661-2-arun.r.murthy@intel.com>
In-Reply-To: <20241203055520.1704661-2-arun.r.murthy@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|MW4PR11MB6668:EE_
x-ms-office365-filtering-correlation-id: 90042509-65e1-4b20-053e-08dd1420a091
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?B25QStUjZnspBwLcJjgCc5cg2sh3irSEzQRKTyAgzQQgIQVaiEMMatLNNUPG?=
 =?us-ascii?Q?EIqfVCb4jL0AmH422QIsk1DMUEmLwj+xx1tWx3WLTPKrOENVznXWsZ3m3ODa?=
 =?us-ascii?Q?JBl2S+3HudBEVmvVj6eW+0zcQfuqOOz9WqD5rg/pkLn2d7O/RO3KFer/8Jji?=
 =?us-ascii?Q?UVSx5T9naxgGRTgDJLZ2luxyweHDCSPc0VfkBjhFcgrA5h8SnLr1WZHZEX6B?=
 =?us-ascii?Q?RaU5y7jABWkIo/cxV516/wqDfemecznK5ylhseYw1CZYQrXpVi566CK9OwNE?=
 =?us-ascii?Q?6otExMIeeG2xXB07mxtnskaKE+Gb2RsBl8tTI29NGpKg5hpGRmnSUi5hzChF?=
 =?us-ascii?Q?Sz29H0sxRW+WhmTL2Za/XmgTSJN7Mp/4NSsQpUfkuawevJK3bYSOWO6zcQrH?=
 =?us-ascii?Q?X90C2/THPu0b4P6G8aSAlobsCxDZ+OeFA5PiitgTylgR3O0R8ARMgqZDrK8C?=
 =?us-ascii?Q?zhdC1UMO7JI4UgZKCBVhq9PVrr4wxkA+degCW/7Snc9r+c32GM+/P7OPx0GY?=
 =?us-ascii?Q?kQ7RRqMthoxy9JuKCchVUharsyfUy8gTGFT05v7nLFiAHIgzJnD2+wegqTie?=
 =?us-ascii?Q?p8NWgNuEVuAlphCTUy5Zf3+nycbgdkPtO8mOHNas4uIZyFwCgikBZWNNeUE1?=
 =?us-ascii?Q?zQCdrLZYrD86rfeNezxxIvkmudd1TSguW+KFWD9jBrKtK0tD1iOXq87haksg?=
 =?us-ascii?Q?Kl76XdZeG5+Y5ceb/CWnd6+JackRZonymRiUFWp57e2yf1nvO0oVrjNs33FV?=
 =?us-ascii?Q?Fu0XlTC40Vj8NxYuf/lQT4USlb6HVppAEyfUKVFm6G4dB5z88jpRZ+XLhRFI?=
 =?us-ascii?Q?MPrEf+qRj2Jvci1Wre1emSHJtgUqzKwanT6VG0qS/Mr3o6czsVZBZipskcL1?=
 =?us-ascii?Q?GMiMH42lp5eNNkqqWYf4iM3uNuLz3iyYQeZGMmwL9HehhAdrtCuNCNWdXVJ0?=
 =?us-ascii?Q?DjGMHnMy6WhKepbzFjw/R52NvxahXxW1SrWi+0sBfRHJ2D/ebXYuAAcL0aqc?=
 =?us-ascii?Q?QJZa9STzqPsv1lq90oB+CwvRcNeGlW1+uV+iEgNQzoBU+GrQJjktJDmWigx8?=
 =?us-ascii?Q?CzyM+WZdux5ytxEFvjcSWUtxyageD0e+JqyI/Odd4XcY4bY7cG0EraMktzQe?=
 =?us-ascii?Q?kqRRC8sNoIalR9x11/RVHl5i5wPOT05e2dVBmncwcw+vbTm8IBr0JYa8QgxD?=
 =?us-ascii?Q?PtIakxpO83arcKCKHQr9T1shGsiz/sEyK/cdfW8/wupNE2vqc/Q56cb6yfSJ?=
 =?us-ascii?Q?4l/rrqgLmlqygrZOkpEdYvwzq7iH4GAoeFKTZuJgr8822g8IYuhJcjT7rC7L?=
 =?us-ascii?Q?PyDgQH6Mz2wBM3Zwl32WEpUi2dAI74ZjgYSz/nRdKuHnvzfH+6BSig7tTngH?=
 =?us-ascii?Q?Dat7h8RZaPuJ+jL7ALh9gquWNop2IFoE6pkwxtHMxPKMvyT0EQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?fKk+laWY3nE1QiL6w3LYNTfAVuehSK7B0vXJ012jF3ZnYar7fLmAEDvftC2U?=
 =?us-ascii?Q?d/8BnPcezLzkKk6lpywoZcCOql/L3Hw8FzEkfATIbUTdFMZZh3I7SxJIPT/r?=
 =?us-ascii?Q?YxS7GBQkLNpBrKNpGZPSWrusGSN8Xb3GcBk8cMCnDokVkXEnmmE6J2apZ4AD?=
 =?us-ascii?Q?r3nLWn9G3C+ZxN9y1ep6bf7o5xku8U3QqjNen8H5gJb7gvA/Xyr3IhZ4YGhv?=
 =?us-ascii?Q?G3jczm8KdGuiXbJnz3m/k9QIMGv52QQcNb2TSpb5MvpSStHpP6LMTo89mcC2?=
 =?us-ascii?Q?JuT8o+mCHXuou8w/LJRQQZAi/q3i5auPbyeSYpLIhvNpv/4LJ+Gvrg3PnwAX?=
 =?us-ascii?Q?Wd3vB9BUNqfPjuPG/ZTTpwBZefouU3XFtkVfeBjUPmuVBSjXOrTX7kwZS05F?=
 =?us-ascii?Q?W5gjY7GRr4R/mZ9SamygKQf9PnMX876Kll3BGsx1JEQS5eNi/Dux4u+6TpSH?=
 =?us-ascii?Q?mUJlsSdD92OKUGO659RDyUvZRxjASWnnMjd95ubZSiXdY+T8kv2oMhGY4R/P?=
 =?us-ascii?Q?BflpoZBxlAjvD67eWpTdcRAWoMXFQMkVlyXDZmo1PN5VxyDjm5dT1CNHrBMj?=
 =?us-ascii?Q?iVJybI9cQzUrSyVYZYHdghAYG/AMEzMR+IBfs5cm8I5H9VGGZQLJJ3n/Y+LA?=
 =?us-ascii?Q?1GNr2mkGagGqZ3NMnBb9hmWKrwQlT2VJPXXEuIisL0nTrjvDoDUKMpXfsAcY?=
 =?us-ascii?Q?iN228NnCCziGjrK+D7wE6Vo2Vwm4NiE5ybmDslGNwO7h13+JhWtbZRt6b+N9?=
 =?us-ascii?Q?if5PQYb1hjwZ9pkvG6agw1xKMGmGfUWS1QznH3ZyXBvPDpfeZCJoWmG6W2zZ?=
 =?us-ascii?Q?9DHerLMpDey6PFLsTW3UvqEF5Y+qGs6RRwt8L4fQMGVTmA//kSJ3Vqe+RWLn?=
 =?us-ascii?Q?ohcTQgvh8OV9ZLR75mawMvGaPc8taFOAr8P7HnG1dgqV8VyOqNInv1LYYVRI?=
 =?us-ascii?Q?WqM9ZqQ03nju+Xu/PvB/h7LYDPpdl82eaxm5t9EEOgKU2dROIJcyjXveJk3k?=
 =?us-ascii?Q?zgMD88o1eq5LdU2e9E9/nxKgL+XwmDGvv8VqxJrfktc7p/yKW5TeMOh4322O?=
 =?us-ascii?Q?U8MwoA9ZzJygzx1/vJeDJddegIWpPFm+P1GozdtuQV9EArq3c1wpMzvsWPVH?=
 =?us-ascii?Q?doG50nK0X2Oy29k30cFsLKLJ79WNhXiZY/2slYx9rxPIzXdIQ8MZUPkYsI5z?=
 =?us-ascii?Q?L/IGbQFhAYLb1770H274rOsmKXfYEvPMp7JuvbxNj9022/kqgHkaR2G4bbzL?=
 =?us-ascii?Q?NH3x1rniOxbQd6g6mvt3L7SyrjpHuU+pwSIX352V2m6XNbXvnW13Kph08GA2?=
 =?us-ascii?Q?RICZA2DrJ45Ha0L+ZU+ii8oJNckW7vaLyi8qf0xNuLkeMraqelZdess45gZn?=
 =?us-ascii?Q?qcdDggVskcC9spVGmEdc/UaELmyUk3QHA88hqi7TASZzWCx0XF6pPh5l5KLB?=
 =?us-ascii?Q?zH4ixd2x3gJOseK1S8cuuv/owhMMBUd0wKIuLnH0AT0tXokPlT1qrEEioG/h?=
 =?us-ascii?Q?n+/0ummbIwiW/62D/A26udVZDvckrQLI/alSuKF6gXk7f+rhZQpruii3ZcGJ?=
 =?us-ascii?Q?eVoKJEi9mtQhOYiyMqG8+i9aVeYL+hsj7c80DlOn?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90042509-65e1-4b20-053e-08dd1420a091
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2024 05:00:52.1627 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wxvzX7DMbW7kgF5Kki6WBInCz3Ul/pvXDGF8xQoeqtSy10LF+crNcttU/QHLhNLb6EWimlMB97ZsRZu6KAFk1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6668
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
> Sent: Tuesday, December 3, 2024 11:25 AM
> To: intel-xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; dri-
> devel@lists.freedesktop.org
> Cc: Murthy, Arun R <arun.r.murthy@intel.com>
> Subject: [PATCH 01/10] drm/crtc: Add histogram properties
>=20
> Add variables for histogram drm_property, its corrsponding crtc_state
> variables and define the structure pointed by the blob property.
>=20
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> ---
>  include/drm/drm_crtc.h      | 48 +++++++++++++++++++++++++++++++++++++
>  include/uapi/drm/drm_mode.h | 11 +++++++++
>  2 files changed, 59 insertions(+)
>=20
> diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h index
> 8b48a1974da3..3984cfa00cbf 100644
> --- a/include/drm/drm_crtc.h
> +++ b/include/drm/drm_crtc.h
> @@ -274,6 +274,38 @@ struct drm_crtc_state {
>  	 */
>  	struct drm_property_blob *gamma_lut;
>=20
> +	/**
> +	 * @histogram_enable:
> +	 *
> +	 * This will be set if histogram is enabled for the CRTC.
> +	 */

Shouldn't it be "will be set if histogram needs to be enabled"

Regards,
Suraj Kandpal

> +	bool histogram_enable;
> +
> +	/**
> +	 * @histogram_data:
> +	 *
> +	 * This will hold the pointer to the struct drm_histogram.
> +	 * The element data in drm_histogram will hold the pointer to the
> +	 * histogram data generated by the hardware.
> +	 */
> +	struct drm_property_blob *histogram_data;
> +
> +	/**
> +	 * @histogram_-iet:
> +	 *
> +	 * This will hold the pointer to the struct drm_histogram.
> +	 * The element data in drm_histogram will hold the pointer to the
> +	 * histogram image enhancement generated by the algorithm that is
> to
> +	 * be fed back to the hardware.
> +	 */
> +	struct drm_property_blob *histogram_iet;
> +	/**
> +	 * @histogram_iet_updates:
> +	 *
> +	 * Convey that the image enhanced data has been updated by the
> user
> +	 */
> +	bool histogram_iet_updated;
> +
>  	/**
>  	 * @target_vblank:
>  	 *
> @@ -1088,6 +1120,22 @@ struct drm_crtc {
>  	 */
>  	struct drm_property *scaling_filter_property;
>=20
> +	/**
> +	 * @histogram_enable_property: Optional CRTC property for enabling
> or
> +	 * disabling global histogram.
> +	 */
> +	struct drm_property *histogram_enable_property;
> +	/**
> +	 * @histogram_data_proeprty: Optional CRTC property for getting the
> +	 * histogram blob data.
> +	 */
> +	struct drm_property *histogram_data_property;
> +	/**
> +	 * @histogram_iet_proeprty: Optional CRTC property for writing the
> +	 * image enhanced blob data
> +	 */
> +	struct drm_property *histogram_iet_property;
> +
>  	/**
>  	 * @state:
>  	 *
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index c082810c08a8..da4396f57ed1 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -1355,6 +1355,17 @@ struct drm_mode_closefb {
>  	__u32 pad;
>  };
>=20
> +/**
> + * struct drm_histogram
> + * data_ptr: pointer to the array fo u32 data. This data can be
> +histogram
> + * raw data or image enhanced data
> + * nr_elements: number of elements pointed by the data @data_ptr  */
> +struct drm_histogram {
> +	__u64 data_ptr;
> +	__u32 nr_elements;
> +};
> +
>  #if defined(__cplusplus)
>  }
>  #endif
> --
> 2.25.1

