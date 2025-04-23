Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49092A97D0D
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 04:52:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D44110E644;
	Wed, 23 Apr 2025 02:52:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iav4Z4Sf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B1AE10E643;
 Wed, 23 Apr 2025 02:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745376754; x=1776912754;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=f+7iRhHrWU5mKurMcfvn7x3SdI2NAjJ6e++mzO/sKjk=;
 b=iav4Z4SfRFjPSc3IkMOc5mWgA5pi+9jHMmb3ksfY2pyy0KwLxV4bkjyy
 fi1LHIMsx5NJ9ub2ExnO40EZ6e3Yb2xrMeq9R1bKqCa2CF1SMKxhBiHN3
 q0kKoLNzGSTPQCmb2nHxNfdlH67xFEkTuhe9xYmb+edrDlJcomZNIQfj6
 YekEtxlyfRgq1Nn6yNb66peZ7D7BXRSojS43HKT1B9wiA5u4PPPeuG4Zw
 2mqOyEeKOkWlBgG8SihR/N10BxsxJ4Pr6wlWteWfY3loHzc5U3bTmayg3
 TdGfebC+txUaP5Zo0CxFzdQz49CuKQbx46SmUDGdPfRO1Z7zadI8JMplN w==;
X-CSE-ConnectionGUID: Vu+DskeBRvW2xTGzpsfZxA==
X-CSE-MsgGUID: aitFiY+YRCSeHIFxINqHng==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="47135114"
X-IronPort-AV: E=Sophos;i="6.15,232,1739865600"; d="scan'208";a="47135114"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 19:52:32 -0700
X-CSE-ConnectionGUID: KeDirtTFSd6s7QV5k0/Ukw==
X-CSE-MsgGUID: CBYBG2XsRD+vUeww7jF/0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,232,1739865600"; d="scan'208";a="132113713"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 19:52:32 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 22 Apr 2025 19:52:31 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 22 Apr 2025 19:52:31 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 22 Apr 2025 19:52:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mzh5e4GjfZf+poKw4m8MJtzix+cL5kfQO0ereLbPsEGnzyNXWQVXRLnlCgtmbyW6unVCkZ0jfZOPRKMjboTaUsdyI+n96wZybXqHt2DWlH38ol27rpmYrZBY+qnApZR2GJdH2d0DzGc2sYI1SlVP/eIrYF3Hd2G+IP4ufvmMwwWK/g2HtZ59VqboCMPuyLv7htFvn2ukUeEDgMX8ChK5xWr05fi8G1kxAUd9S+Gu+8D6Ev6cspAXPfaq0RHbYdJh6Hcnml+EjCtueNzmVuVj3ott9FSaFYqyaGemvSoaidkhfWJI4HY7QdcNzRIZJ4bogTew1B58mlK7Z14wZuq+dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EqN0FFlD25u6tp2vIH7+c5/7gODkgk/uFn3uQnjesKk=;
 b=qyswHK1VUWxcxnbNdlWS79Akt1pG2/YkCB3UKanmZwBQf8ud/6LR43CEogDlmsNByZz5PN4rr8PY+RaqxYQoLyM+r77SmfstHVvKiCKhwb7AFY4xESpfNH4NWDXxTA0hLkb/EqEUWMUHMIDOAvXzf/AC6zjWZIlHE0LxUli1IfXxyRrs4QVPYNKBh3rJi4jZt5+xCkPooNJntFHHBOJipNdbWQ4IlxGW6dx6vhTqPFpfKVcizjviFXHRl6sSIW+UhmLFwPnVu9xEOhomLhS/Eyng93xSwYjutOdJrlq94XQY11AWaXfrQ0LmxMj9nv6C7dBq7e0XThGfswQwONrMZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by MW6PR11MB8368.namprd11.prod.outlook.com (2603:10b6:303:246::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Wed, 23 Apr
 2025 02:52:11 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%7]) with mapi id 15.20.8678.021; Wed, 23 Apr 2025
 02:52:10 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Gupta, saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "joonas.lahtinen@linux.intel.com"
 <joonas.lahtinen@linux.intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Zhang, Jianxun" <jianxun.zhang@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Mrozek, Michal"
 <michal.mrozek@intel.com>, "Jadav, Raag" <raag.jadav@intel.com>, "Harrison,
 John C" <john.c.harrison@intel.com>, "Briano, Ivan" <ivan.briano@intel.com>,
 "Auld, Matthew" <matthew.auld@intel.com>
Subject: RE: [PATCH v20 1/5] drm/xe/xe_gt_pagefault: Disallow writes to
 read-only VMAs
Thread-Topic: [PATCH v20 1/5] drm/xe/xe_gt_pagefault: Disallow writes to
 read-only VMAs
Thread-Index: AQHbsvy31QfJNDEHAUi6b1ED5DVKrbOwjriA
Date: Wed, 23 Apr 2025 02:52:10 +0000
Message-ID: <DM4PR11MB5456EF5765DC1CB7C43C76DDEABA2@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20250421203353.64900-1-jonathan.cavitt@intel.com>
 <20250421203353.64900-2-jonathan.cavitt@intel.com>
In-Reply-To: <20250421203353.64900-2-jonathan.cavitt@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|MW6PR11MB8368:EE_
x-ms-office365-filtering-correlation-id: 15d55e27-5cfb-4e08-eac3-08dd8211d824
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|376014|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?my5rZwkjfpKzBliKDDgt0Eiuv9kUiqZGhLHgNiWPtp1oNr8Yqo9j74cUcdU7?=
 =?us-ascii?Q?lTavaa+esCo/PN4DE33HjYV5m7JXOhXZyyq3su/SToSN2APEsJ1lIBmpoRdS?=
 =?us-ascii?Q?FhKVJvjLLZIJN5f3EOhH1tZvqi2+Xh3k93jx+jo0kD4G6RuyqaOIdgbSJ0yD?=
 =?us-ascii?Q?4TLGCbGgU8kh8t15eVkEi43WCxvLI3ZJv783iKeqNLq1g6xdnpxtYH8oCUMz?=
 =?us-ascii?Q?npKpVZLkggrQhDTg6vJ0KbRm0Rqwa+Yg45Ugxye15+GyfwmWQt7BQkVkfIIV?=
 =?us-ascii?Q?82UUuuAFJWxF3epDxTRKzYWiFnrULHbAkqP3kTzmRL2WatsfvXuC7yAsAddd?=
 =?us-ascii?Q?O1tKkI7JU/fIgbNxs30lzEWN6M/xOX1kb2IPfqBqV1ILPSPu1Xqjz6MqOK0R?=
 =?us-ascii?Q?X7vWqfg8WpyXq/lPNYUkqOPbjk35jgdYbNJu/59Qz1XpRJzXE9JmnI1v+2O4?=
 =?us-ascii?Q?n2Z4hnA/nmZySrFD2cllJ2bFAYtf7MMoqUk4IuAEJ4JoHPOU3wmqgqskAxf3?=
 =?us-ascii?Q?ztm9zSqPPTfV+W+8UEFgQNmiOdbiXg1/q5lclPEgiAyHgit98ffUQ4NC7C+6?=
 =?us-ascii?Q?Rn6cC2hz41gEpyz2Q6oHV0+KHz4o8Z8r/azB7p8jxRDuLGNXkG2TDu3jzZPh?=
 =?us-ascii?Q?x/kn2DyogNHIB//Jy1BDU6gUVQvSGI+yoE6FLFLI0ZX4xHfuB2VG0mA7eUaq?=
 =?us-ascii?Q?tKOvwNeVXPhWB2syJJ1RgtFr1eAQ/MeJSkYNCMcDG3nD0N8LXuTmbJtgMz8I?=
 =?us-ascii?Q?lAm2E4TvdL6FgztHLSFgjq5ERPU3nM/S41XJxpIxZjV3zs1g7xlOcXRNlJt0?=
 =?us-ascii?Q?yoEwADK7jnRGiIxCNvZj14Hmj3gttffeprcM01curyV9ydHhzW5N7EPlq7/P?=
 =?us-ascii?Q?sUHD9GR4vy/CYioK9vILYMZYpeEIXxw9q0mwVMhWNSyzSh3PdbYyileD8a1b?=
 =?us-ascii?Q?5NiEA7pOZedulO4jYeQFxALsyhfd5HPZCAurodx1BfDkmrD9g26Ocy/ucBlp?=
 =?us-ascii?Q?JmH3qv5F1hmUQglvj+aUm1IC3yGrSCL4Czn9wyBgqjm8um55WNKJ0+8/fWEn?=
 =?us-ascii?Q?nDwPZvZ/rBTf5s07isL1uflgvWB4QISozzUdxHnRG0ajnjIidFRQ9xM18tf8?=
 =?us-ascii?Q?T+jsSvGN4zjBjO3xDbypHddn8x/6KqOX74dWLXJhsiKiB0cdqbFvkwMqG8Qs?=
 =?us-ascii?Q?PE7z5qsrEJ/HlU8TBv7uEoqe+uzr5fn1wbiH1XeOyJ9Ylwt4l9GCgHzv5zcJ?=
 =?us-ascii?Q?m/dg26hT+HLmQAaiYFGUnHR0X1mjtTDAASjNEfV/gl2yfMhAjNGXB4KDj8G+?=
 =?us-ascii?Q?5h2o51gt7e1pSwD6xtvp4VxXDstieBgza46q2JojM19N5aWfygkBoDEtdNHm?=
 =?us-ascii?Q?D459O1PZnHiav1V+9+XVMWiXiRqPV7B9R6+NhvsBHK0NalRUBN7bTV95LeGt?=
 =?us-ascii?Q?65i58dSuuVdeR2zMOOeOfQu/Mo4mxTy0f2VOtfbaViA73G1Sy3uPNA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?U1eAwhNeTzbCafXjjRQ3JcCpKfzD2R3wy51NRLPxWgHcCsHGbls08o2bSS6h?=
 =?us-ascii?Q?ibvkFzbXO6UrvKQzxx+Mhf+HBJO9fCBi615V5rm6BrMDWB4f9GKugF32tt8X?=
 =?us-ascii?Q?L1UsJUeg7lMDxh1wnj3+MYnwMGNcSk/nD9NXFOVyWt6lKOnrvJxLVcmvIYiu?=
 =?us-ascii?Q?iwyOnqk/nHBoi399RONrSI6OK4U6OsRccNZI/5TZ+QF0mT+uZxLFmJiv3Kfa?=
 =?us-ascii?Q?v5Ppl8l9qgBtoJ+DSByOIc8xVpzRkbibh1GvBSBu3srAAwDOGm51c8k3b57J?=
 =?us-ascii?Q?Q31jzpuLJz3vjDt9sjaJWBsboxDDQFkb/GQNXczN5TfEMH1wriMmG7bqyodU?=
 =?us-ascii?Q?cSmTGV7cO6Gd1bwrIfagmMc0TDOiep7Lv4/BxaHK1+EkHqlrTrSwUIaZNU4v?=
 =?us-ascii?Q?u+H1lWJJTFNZBN1d1QqILW+tvU7epB81JXgXT8AQB7v7/NqcQ7WrelVNIGbR?=
 =?us-ascii?Q?H6kwah+dTmJw4Zy7gxpC/SBTaZS89H8ZFGewVNlQ2OIslZmcjrpNVEzZ6X9d?=
 =?us-ascii?Q?qH9f2iUllNJiuN5WIkNPrrB1IrZQ9iQe+BVq8H8r8/rdxrRpHyJEDRfbDBL5?=
 =?us-ascii?Q?6NLpMWfWfkowHwcPDFaYQ7rjM1H/JrQMBJ3UN76C1G4QbpP4tMwpn71ypbdP?=
 =?us-ascii?Q?k785zG/VYBv59TkJfM8KF2SSZN63pK9x4xNaVVLu7uVEE5WPxU4ssh7XJCn1?=
 =?us-ascii?Q?kfBCfe1te/FoZpWhh0aD1hcQRpMkbfcK4IuwqKxpxht5EhQz7wpxy3prSDU+?=
 =?us-ascii?Q?Zck5fo6ki4Srs52pgUnGEG4eJQIKCPy8NpHTq4vh2BKaBZNGFqNh8dBttDkK?=
 =?us-ascii?Q?OsdBhL5tpjIdzv0Z403hs73XveaViNQKQ4m8nnoz6L4rdhS5YEgn5g4W8k5K?=
 =?us-ascii?Q?I+ua7HuGhQsIdrpc07+xx3NiymR+5kWhSOHH9o9rz1TCNwIsINLSt8l04bKj?=
 =?us-ascii?Q?Llt1WjoJxcGfZtvOB79jt5KtP39wNL+2KFMTTnUZlrV2BwtHNGJLbtKe47+l?=
 =?us-ascii?Q?Ccx/gRmcxobaBUwQ8ECejmc+OZPGta7drREieefoB+7aBb3U7DBobtkUvjyw?=
 =?us-ascii?Q?SyedhWMjKk650ywvqpurd5LutpUrY8/fWsMfda1WxdP7+GmSQTlfFBGo4Lcu?=
 =?us-ascii?Q?Y/+qC5BVluV1QwnKegeUIXHpZGUr1XtOthGs97ttKBSuEgkEavCKRJ+MnDLu?=
 =?us-ascii?Q?pluuD1P2PHp1aRW/lYN0bA7PC84uPvoNQ5JPmcxreR7qiRuJa7U+EFbps2sV?=
 =?us-ascii?Q?Z9Z7DrtzIumpPRtfUdFeQTZ+dpQUFjPpWBfACmAS4AXPtEkDoQuRkDKrQITh?=
 =?us-ascii?Q?JvbHXQi46p/HqXG8UvaeZRd3PMz7IMNETfNeX0gGx/msrEAlEPUeXNCxKImZ?=
 =?us-ascii?Q?7GODJkCpB30VjlkUvT3dlPbEBOVqi9BkaKTeII4SM3/qD+suVd0Spt9+CvBE?=
 =?us-ascii?Q?L199XQpDhouqucxypWFVNTUESzMcVNJrK8eWaaLamVrHxKo9DA9INSI6otKh?=
 =?us-ascii?Q?sSsrCA6Npoh6Jo+fg+N+fRYq16QpuBGMWrDD6tSw7LkvIkwvCam5Q44oRsSY?=
 =?us-ascii?Q?qGDagjqcI2WMGtqzsKmNYFA+PavW9/rYN8p+XK5APaPmI25OjYuQTPJeqw2t?=
 =?us-ascii?Q?8irbIuxrskmHs14fksTGrX2bZN6ixrQ1fm6+jhOZ8guW?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15d55e27-5cfb-4e08-eac3-08dd8211d824
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2025 02:52:10.8427 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NHVg0JALj+DF/9bZd7Gp/NWNRz/xwS+7RBMTgfyZO6Hmu081u4Knf4mXjMyI7s680KCoPlk/4Yipab+dR0HiPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8368
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

On Mon, April 21, 2025 1:34 PM Cavitt, Jonathan wrote:
> The page fault handler should reject write/atomic access to read only VMA=
s.
> Add code to handle this in handle_pagefault after the VMA lookup.
>=20
> Fixes: 3d420e9fa848 ("drm/xe: Rework GPU page fault handling")
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_pagefault.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index 10622ca471a2..d4e3b7eb165a 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -237,6 +237,11 @@ static int handle_pagefault(struct xe_gt *gt, struct
> pagefault *pf)
>  		goto unlock_vm;
>  	}
>=20
> +	if (xe_vma_read_only(vma) && pf->access_type !=3D
> ACCESS_TYPE_READ) {
> +		err =3D -EPERM;
> +		goto unlock_vm;
> +	}
> +=20

LGTM.
Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>

>  	atomic =3D access_is_atomic(pf->access_type);
>=20
>  	if (xe_vma_is_cpu_addr_mirror(vma))
> --
> 2.43.0

