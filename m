Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A8FA575E6
	for <lists+dri-devel@lfdr.de>; Sat,  8 Mar 2025 00:19:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17D1010E347;
	Fri,  7 Mar 2025 23:19:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="js2iQZVN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21DC710E347;
 Fri,  7 Mar 2025 23:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741389574; x=1772925574;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cslA70W5Cs6H2zpqqKlxLADafCyz1/AoQnaAl89jWBQ=;
 b=js2iQZVNp6vhFVHWBkiKC481V32fqRtiTjtP6Bt35aKfsRi3bfEIsggF
 gxEYKBepYp9fsyUJUlRPPZTJKcZIylzEdqcukgH+N9LD5VgBGT130lHOD
 skFsEKuH7+450QV/lnEK2nGyoSZoJgrYbufHAwUgYDSf94Wt8FoK8gI4s
 j7ZIfpceDAANqaj9vpQ4YCul5UBSoesyAUmjpikVYdFP8u9x6tVxeOoRz
 rQXArHLJQCI+qPeH6hm5L+g3q5L48xfKk/tVMCfSlWb8Fn7kvp0ZWQI7s
 J5Qq5e2vv6u9nWDeJAvYiyRPDAQPIq7PtMv2gcGdttXl3Z+7yiVbTwzOf A==;
X-CSE-ConnectionGUID: 5CW5FL1bRVGgN3beFD7RRQ==
X-CSE-MsgGUID: wQtBSoV3TVyikzX1Ceyx/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11366"; a="42365386"
X-IronPort-AV: E=Sophos;i="6.14,230,1736841600"; d="scan'208";a="42365386"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 15:19:33 -0800
X-CSE-ConnectionGUID: +iqLKrMMQSeU7TZtrZz1jA==
X-CSE-MsgGUID: TGUlDI51SgSwZ/VReJzzBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,230,1736841600"; d="scan'208";a="124045454"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 15:19:33 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 7 Mar 2025 15:19:32 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 7 Mar 2025 15:19:32 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 7 Mar 2025 15:19:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aXFr5Wzas+yn4PMJh1lGZ1ARu/GjFVYav6V5naqc2igCJpy0wTOgDTlXFyWKdEdn7R2yfC1wfSds/Ouh22IxdYyniBSfqXGh7GBkaUaTAexOVfVyJuEpM9c3VxgLlZJX375smWZ5AGgUGzufrOa6xHR3EnBwdGsT4TZa8iUO7UPKwbXAvf+D7vdkhSv61Sn/VureyllbGMJ8k1k0qi16xBhSgmjZj1Oy37E6t7PZfO9LA4jRkPY+Cb5ZFb/iHTVsaYcwgH4WrGk9yxY55PDxFH6FG0k7S+8s88uNTfZvW3LsUDtzwqZr8NgycNzUbi0wY13iI/4+tel1WiNpryAMSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p56Ul2H0GYhvL7Rh0DzG8RAg/8QbM7iRlOOcFvxSECU=;
 b=XyQyyetWsBwm3vOgote3SPDR4xBmw8EO2eFl+QkYbqQPuLVYkCGZrtZdX4419F+ao9kmjqidcGfsSOTUIq87K6IEDAASoy7pigG0Y0h23DB8qOcGSeK4ONGYa1iGU2Ae/1Dz70H7HL2/8lhjtXHvOL4vxZeeikryYt1guMTO/ydk2Mv4RoXl5EXRLZnfIq8Ojn7JtCzbYmXD/CeUNHIz86GMuFdHpUsLzgOGk9A036I8/zpncFYwrawFRObbyNu86cGFFYFe7CMzEXsIAXYsJJzANGM2REWY1Xn1c0GiXsahMdtDRKl6jMIHCs/ztZFkF1ZSrY+J0rssvSTN03RkZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5447.namprd11.prod.outlook.com (2603:10b6:208:315::17)
 by IA1PR11MB7271.namprd11.prod.outlook.com (2603:10b6:208:429::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Fri, 7 Mar
 2025 23:19:29 +0000
Received: from BL1PR11MB5447.namprd11.prod.outlook.com
 ([fe80::ad51:b35d:1aca:726e]) by BL1PR11MB5447.namprd11.prod.outlook.com
 ([fe80::ad51:b35d:1aca:726e%6]) with mapi id 15.20.8511.019; Fri, 7 Mar 2025
 23:19:29 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Gupta, saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "joonas.lahtinen@linux.intel.com"
 <joonas.lahtinen@linux.intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Zhang, Jianxun" <jianxun.zhang@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v6 3/6] drm/xe/xe_vm: Add per VM pagefault info
Thread-Topic: [PATCH v6 3/6] drm/xe/xe_vm: Add per VM pagefault info
Thread-Index: AQHbj7IUXgXysooWpkSQt3vZNUaUM7NoS/Zw
Date: Fri, 7 Mar 2025 23:19:29 +0000
Message-ID: <BL1PR11MB544756D8D14B44BB51BFFDDEEAD52@BL1PR11MB5447.namprd11.prod.outlook.com>
References: <20250307224125.111430-1-jonathan.cavitt@intel.com>
 <20250307224125.111430-4-jonathan.cavitt@intel.com>
In-Reply-To: <20250307224125.111430-4-jonathan.cavitt@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5447:EE_|IA1PR11MB7271:EE_
x-ms-office365-filtering-correlation-id: 62f8bec6-384e-40a5-1b82-08dd5dce82e1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?Id2nG+ashDzkl14OrhH7Mcr9d/1fsHS6/KpOkvvd7zXCj+Ew9xwkOM3blk3Z?=
 =?us-ascii?Q?FlCVG1D+GLejhpWJS6eNHgTzKXgalEKvRo5vingtUJNNgKsA0ztyex4hZtMt?=
 =?us-ascii?Q?toIoFtaujt7iiOKuQiIS3UyNNt63EQuckmNduD8ZWT1Wp/NjQPBjTjykZYoF?=
 =?us-ascii?Q?7XmVYylf42v7Ks4B3jUcVEOFofYangIg3FNfHfNMP0mdpBsfa33d1415bt6Z?=
 =?us-ascii?Q?M0b1AZ25235s7XliquqmW7ElgCDEa8LdCgTeyoU6tLwFgG1Doy02tnRa/DVV?=
 =?us-ascii?Q?+u5nmghAPv/ioLNerKREtRfta61zlmqDpRsxjIjCYdohg3OIWEZiHKroV2ru?=
 =?us-ascii?Q?S79XS7/TYPgfjlVJrO8PtUY1RUXHn8VwNUX1Pw19nNJatsnVnCNxf+R5kAXq?=
 =?us-ascii?Q?QH/MXoj2UNGrZec/iKiF3nNhx7KwSROpBheRRCc33d61cempg9/7Sibrv0jU?=
 =?us-ascii?Q?VMciwP2zC0OFGN88w6zQlpS6eWcRDMusv13i2GcDoA6vXpKU03pLj8xNh21p?=
 =?us-ascii?Q?1O2WVBQko9BZODz4Tyv3q3mUF5Yqzw+qDBaIQkyKytP8ydgf8zYuFiXbVCiG?=
 =?us-ascii?Q?IKbBE9B1+9bUhXMlo+AdOcK4wvFplBF9E/CxueTMLUGycauoe4aQqqKJFSXa?=
 =?us-ascii?Q?320WZeGzSXhkFz0bvuLaiYIOhRhRYxPlz4sYFLln1XjTAEuDmS+/l1ZbDm24?=
 =?us-ascii?Q?V/sIxIS98ekpMtKrruoBD4NC9nQqSCPDZcYdFgx/1zjYl1NAevsIbTxGR6WO?=
 =?us-ascii?Q?uGOVzaUrWqMWx2shL+GIeH8QrvcqTfC9bpL4mXHF3l/XeQGiHlNrhrDE9mRu?=
 =?us-ascii?Q?q3U7Rk6QC7QE+ygLSnfloeB7FOy/7+Fyfrx+WaEY0ULD7Kmkjqw/bc3pin9t?=
 =?us-ascii?Q?byG/hSoUq6FS1p6DSt/1ro7i7iG4WthxVCmwc6OwmMyBUpTmYWyiFRYMl1ll?=
 =?us-ascii?Q?Olr/tyFcMaCct+7CkJEEill0iBCZSX6wr2Y2UtLDm8cE2Bal5LpDZcMpAyF+?=
 =?us-ascii?Q?4PK49t7MDYr5JZ2w8fTXa5Ns56U7JL/FZXOMO65YmzvAXiTzHOxZoIz1QAu9?=
 =?us-ascii?Q?EfyEtJhos75TBHEbzH8Xo40qY8V3sUQLe0Rnokk+UczoQ0qmGf+xzXHILTvF?=
 =?us-ascii?Q?Aa3WjmkJUt2ctm7SgobXKspXDjC32HhQ2R3e3t94Mmm8Bp/CAP8PDzpiV6Vk?=
 =?us-ascii?Q?LtbtUhXuFM6pyf+eRu4inzbcTRk8Sl/vOubjOfPx3xU6PkJ5iJ7uEr+7Alry?=
 =?us-ascii?Q?bc1rYcsHScw7VdoiGfHKeqQjBFslNn+QmlwCfCKnnaxpPF98ltDFKd4flh48?=
 =?us-ascii?Q?Lbe1OimkDaj1TiC7q2WHw7lfMO9dKpLWYBPOR4xnbRCmnLSWcN+PuIIl0b9w?=
 =?us-ascii?Q?AwzCN1ugRMFLTMK3cq3vxZm1KOphFdmqGLOCsCj+rxtBoJnckv1hgi/aHI4x?=
 =?us-ascii?Q?5+wgZmRLFLjqSo3MHLPle9N7Ofc5F5w6?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5447.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?lDwSkGVVGIsj/nhSYt2Ume59O0mS5jaqMCCuFSx0HDsfnxM5Z6PAPYu5A7Uj?=
 =?us-ascii?Q?Hv6hYYZ/3MIjp48SlJAOhs+3x6ihzMhTHEdg7/BrbYCoo9JHoq3+n4sMWp+9?=
 =?us-ascii?Q?fpUixgT4vO13o2AGla7WPljcn9BmtMeV9hbWo7oNqjbyH+ukjzSFOw7Zmg+Q?=
 =?us-ascii?Q?yD7om88Q43KC5rnbZnHPpBa8VVD7y6dFPPj/3rQEy9ZiU4tmgVj3j1w+br1c?=
 =?us-ascii?Q?ua/tKmUGWwQoTGZiDx1Rb0M+nkrPj36U3tBUVCFOQikdZE6YXFFSSgTwXEH7?=
 =?us-ascii?Q?2PTi1WS3Mf/2PNohyxGtjnArAmHuuy1wgZZ1Lnx6TXwfdhxl4TdHX4lb+3BA?=
 =?us-ascii?Q?3hGca/ovVs1OJTkfwresOEm5mQZ3rkTpq+ctuH68mR68fp2wVJsdnujHeFsA?=
 =?us-ascii?Q?d2O2RVOQVRkNcb+PTR2nwtonk4mOjCPquYlpBUJGIGHjpaY/XYJO1Yuwp0T7?=
 =?us-ascii?Q?3ZroS5DcBnMr6Fd+0MqQ+H5nleLJuGcV3tMPLtLBLYzgRDNV4NDXJ42Bd7az?=
 =?us-ascii?Q?xbJpHpTYN8Su9sRvTiOXWkM4GCT2MywQLL5YR9o+5/97JgFnxJAzwel8IDqp?=
 =?us-ascii?Q?zVjZfx5cPzbNQ7V9GUwtIQNemTxpV/L3yOpmVrFplVnUXs38bN4XDvM/z/D9?=
 =?us-ascii?Q?qe+jCdBlG3YVnav7Fgld6v8pOeQeqKxiT5/V0jTyjkc3kLPQiqGMzlZP/DTJ?=
 =?us-ascii?Q?SxYxIDpv/p7KjpnLBPdMihCzVh3UBp5TO7+UaZfOLm4mGsXwOnbbjyu68og2?=
 =?us-ascii?Q?vTnYiY8oiFyam2KNAOM2XxsmoquwZKs3HyjZR4TS/ZW+WqwcHpyqeMuukxLe?=
 =?us-ascii?Q?W3Ppg4zzjhp2cWSqKS+zBeTgWL58+7Ds7dniDrPIrzJlsJaIcab1ceErv1Tv?=
 =?us-ascii?Q?xMYOpQHnRpgVEHvtOcQbDBhekiOukBGaImiAsjxNfeXT8PwWi45ETiQiV2Q8?=
 =?us-ascii?Q?6lLt7rd4k3cKB5SYaFzndzzJoGhywVCjD1PpCkh+T8SD2sFk+XWl/YQ89LrL?=
 =?us-ascii?Q?8jl4A+1LJPKTNbrmSTU4QlqYZnBAMwSvYVUn8M1hLT9ZP0GzRWYODy7eeYgo?=
 =?us-ascii?Q?xcHYilEPrG1aHRaz3AP+/Le8qWRjC9VCFBPLxDSUNK4yRJV02Qabfwsjya64?=
 =?us-ascii?Q?ZNFrVsU7kvPPidkDgkMrMp2cSBbb2BubklnQD58osxFfoujRpsjlGiZPBah1?=
 =?us-ascii?Q?Q+jP9xnwBXSMo6mg1Rf4qy+trcLKwLkbMg30bbn6sn+4mW8l0+In2vVPqGuH?=
 =?us-ascii?Q?qWf4+t4L0vdrIqz+qqmRPpDBrz4EvVi5WuV9iT/mQEFe9GUNv2JfvOF6jB6j?=
 =?us-ascii?Q?PK2YaLQkoizJnOCgChaG9Fd7Qiq05mtR51Hix2lD8K4yI6z5lJjzypfIUAaj?=
 =?us-ascii?Q?eCQL2rzdciJKcZw1Jt9RQYeX1C3/kEDll6Qy6dMc8q4LTqjgp2C9RbNYkZC8?=
 =?us-ascii?Q?SEMwCVlbHplRDDcanUL4qGQm7QBD0sXP362/4hNIu74rcaSQN2gaLnnG99Aw?=
 =?us-ascii?Q?jY1Xw9fCidodAybnTfRykfm4d6Q1NsbqbAZgA2McC9T2T2atYg3vOE8xn2bO?=
 =?us-ascii?Q?W4V6/rEESXe32SiHod9QwMMqDYAOsvCZHY2VC87D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5447.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62f8bec6-384e-40a5-1b82-08dd5dce82e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2025 23:19:29.6354 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KGj93Rr7hrbI+KArOVZvc+rg/lWx+IWQq5COJu/0/83poNlTNYvuL9RTahU6Qn07IbQVCaWV/fjQxRlXW/CkJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7271
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

On Fri, Mar 7, 2025 2:41 PM Cavitt, Jonathan wrote
> Add additional information to each VM so they can report up to the first
> 50 seen pagefaults.  Only failed pagefaults are saved this way, as succes=
sful
> pagefaults should recover and not need to be reported to userspace.
>=20
> v2:
> - Free vm after use (Shuicheng)
> - Compress pf copy logic (Shuicheng)
> - Update fault_unsuccessful before storing (Shuicheng)
> - Fix old struct name in comments (Shuicheng)
> - Keep first 50 pagefaults instead of last 50 (Jianxun)
>=20
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> CC: Shuicheng Lin <shuicheng.lin@intel.com>
> CC: Zhang Jianxun <jianxun.zhang@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_pagefault.c | 17 +++++++++++
>  drivers/gpu/drm/xe/xe_vm.c           | 42 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_vm.h           |  6 ++++
>  drivers/gpu/drm/xe/xe_vm_types.h     | 20 +++++++++++++
>  4 files changed, 85 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index c8a9058aa09f..964ca1efb698 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -343,6 +343,22 @@ int xe_guc_pagefault_handler(struct xe_guc *guc,
> u32 *msg, u32 len)
>  	return full ? -ENOSPC : 0;
>  }
>=20
> +static void save_pagefault_to_vm(struct xe_device *xe, struct
> +xe_pagefault *pf) {
> +	struct xe_vm *vm;
> +	struct xe_pagefault *store;
> +
> +	vm =3D asid_to_vm(xe, pf->asid);
> +	if (IS_ERR(vm))
> +		return;
> +
> +	spin_lock(&vm->pfs.lock);
> +	store =3D kmemdup(pf, sizeof(*pf), GFP_KERNEL);

I still prefer we could have NULL check for the store pointer.

Shuicheng

> +	xe_vm_add_pf_entry(vm, store);
> +	spin_unlock(&vm->pfs.lock);
> +	xe_vm_put(vm);
> +}
> +
>  #define USM_QUEUE_MAX_RUNTIME_MS	20
>=20
>  static void pf_queue_work_func(struct work_struct *w) @@ -362,6 +378,7
> @@ static void pf_queue_work_func(struct work_struct *w)
>  		if (unlikely(ret)) {
>  			print_pagefault(xe, &pf);
>  			pf.fault_unsuccessful =3D 1;
> +			save_pagefault_to_vm(xe, &pf);
>  			drm_dbg(&xe->drm, "Fault response:
> Unsuccessful %d\n", ret);
>  		}
>=20
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c inde=
x
> 22a26aff3a6e..eada3ecc2364 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -778,6 +778,43 @@ int xe_vm_userptr_check_repin(struct xe_vm *vm)
>  		list_empty_careful(&vm->userptr.invalidated)) ? 0 : -
> EAGAIN;  }
>=20
> +void xe_vm_add_pf_entry(struct xe_vm *vm, struct xe_pagefault *pf) {
> +	struct xe_vm_pf_entry *e =3D NULL;
> +
> +	e =3D kzalloc(sizeof(*e), GFP_KERNEL);
> +	xe_assert(vm->xe, e);
> +

The 2nd input parameter pf is missed to be assigned to e.

Shuicheng

> +	spin_lock(&vm->pfs.lock);
> +
> +	/**
> +	 * Limit the number of pfs in the pf list to prevent memory overuse.
> +	 */
> +	if (vm->pfs.len >=3D MAX_PFS) {
> +		kfree(e);
> +		spin_unlock(&vm->pfs.lock);
> +		return;
> +	}
> +
> +	list_add_tail(&e->list, &vm->pfs.list);
> +	vm->pfs.len++;
> +	spin_unlock(&vm->pfs.lock);
> +}
> +
> +void xe_vm_remove_pf_entries(struct xe_vm *vm) {
> +	struct xe_vm_pf_entry *e, *tmp;
> +
> +	spin_lock(&vm->pfs.lock);
> +	list_for_each_entry_safe(e, tmp, &vm->pfs.list, list) {
> +		list_del(&e->list);
> +		kfree(e->pf);
> +		kfree(e);
> +	}
> +	vm->pfs.len =3D 0;
> +	spin_unlock(&vm->pfs.lock);
> +}
> +
>  static int xe_vma_ops_alloc(struct xe_vma_ops *vops, bool array_of_binds=
)  {
>  	int i;
> @@ -1660,6 +1697,9 @@ struct xe_vm *xe_vm_create(struct xe_device *xe,
> u32 flags)
>  	init_rwsem(&vm->userptr.notifier_lock);
>  	spin_lock_init(&vm->userptr.invalidated_lock);
>=20
> +	INIT_LIST_HEAD(&vm->pfs.list);
> +	spin_lock_init(&vm->pfs.lock);
> +
>  	ttm_lru_bulk_move_init(&vm->lru_bulk_move);
>=20
>  	INIT_WORK(&vm->destroy_work, vm_destroy_work_func); @@ -
> 1930,6 +1970,8 @@ void xe_vm_close_and_put(struct xe_vm *vm)
>  	}
>  	up_write(&xe->usm.lock);
>=20
> +	xe_vm_remove_pf_entries(vm);
> +
>  	for_each_tile(tile, xe, id)
>  		xe_range_fence_tree_fini(&vm->rftree[id]);
>=20
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h inde=
x
> 0ef811fc2bde..fe068e4448a6 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -12,6 +12,8 @@
>  #include "xe_map.h"
>  #include "xe_vm_types.h"
>=20
> +#define MAX_PFS	50
> +
>  struct drm_device;
>  struct drm_printer;
>  struct drm_file;
> @@ -257,6 +259,10 @@ int xe_vma_userptr_pin_pages(struct
> xe_userptr_vma *uvma);
>=20
>  int xe_vma_userptr_check_repin(struct xe_userptr_vma *uvma);
>=20
> +void xe_vm_add_pf_entry(struct xe_vm *vm, struct xe_pagefault *pf);
> +
> +void xe_vm_remove_pf_entries(struct xe_vm *vm);
> +
>  bool xe_vm_validate_should_retry(struct drm_exec *exec, int err, ktime_t
> *end);
>=20
>  int xe_vm_lock_vma(struct drm_exec *exec, struct xe_vma *vma); diff --gi=
t
> a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 84fa41b9fa20..3a2329f54fb1 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -19,6 +19,7 @@
>  #include "xe_range_fence.h"
>=20
>  struct xe_bo;
> +struct xe_pagefault;
>  struct xe_svm_range;
>  struct xe_sync_entry;
>  struct xe_user_fence;
> @@ -142,6 +143,13 @@ struct xe_userptr_vma {
>=20
>  struct xe_device;
>=20
> +struct xe_vm_pf_entry {
> +	/** @pf: observed pagefault */
> +	struct xe_pagefault *pf;
> +	/** @list: link into @xe_vm.pfs.list */
> +	struct list_head list;
> +};
> +
>  struct xe_vm {
>  	/** @gpuvm: base GPUVM used to track VMAs */
>  	struct drm_gpuvm gpuvm;
> @@ -305,6 +313,18 @@ struct xe_vm {
>  		bool capture_once;
>  	} error_capture;
>=20
> +	/**
> +	 * @pfs: List of all pagefaults associated with this VM
> +	 */
> +	struct {
> +		/** @lock: lock protecting @pfs.list */
> +		spinlock_t lock;
> +		/** @list: list of xe_exec_queue_ban_entry entries */
> +		struct list_head list;
> +		/** @len: length of @pfs.list */
> +		unsigned int len;
> +	} pfs;
> +
>  	/**
>  	 * @tlb_flush_seqno: Required TLB flush seqno for the next exec.
>  	 * protected by the vm resv.
> --
> 2.43.0

