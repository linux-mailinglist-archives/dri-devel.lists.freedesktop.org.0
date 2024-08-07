Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE1294A94C
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 16:03:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9D3F10E52E;
	Wed,  7 Aug 2024 14:03:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wms3qKcd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C543610E100;
 Wed,  7 Aug 2024 14:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723039403; x=1754575403;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=B5L/MlxNaB+ZZ5ptarqLxs9e0rNb8YUp4NWwSS38P9o=;
 b=Wms3qKcdK3nylm0qEFID5bG3Tv+56zdMEIADpguFLuOwWxdfdG9wB+pQ
 w6DVDyZrRMkcV0VpOuwqDOVY8kYT0UY4k/sBdAax96oe8oZdkAL7aqbCU
 qBNReHNq6/ke4Frc+W5MV8c1XThUJbpyNPy4kQ5gmYaQlaW39at2J5YN0
 /ily5IU9Uevw0VzabXmyHQkAGxRDpgmFAMZrhEM0RF7/zcW/mV4m3OwZx
 4FYqwUPJDDaT1GnHPgFouX6gBVwxwuey8FU//Q+Ft62y0EatPziS4GEV1
 EVhsph1mMd8eEaI2PTK0sEdwsj2mwLX7j0fc85I89PcBpXXL9rRl+gyn9 Q==;
X-CSE-ConnectionGUID: 0G6I6w5PSYGzvE9Fv1u/2Q==
X-CSE-MsgGUID: bXk5ORm7RK6H8BxsItO8+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="32497588"
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; d="scan'208";a="32497588"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 07:03:22 -0700
X-CSE-ConnectionGUID: mVLm1iq/SbOKXH/Gw5EVWw==
X-CSE-MsgGUID: wigxOjPNRhiSpDcOtCKoyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; d="scan'208";a="87527650"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Aug 2024 07:03:22 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 07:03:21 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 07:03:21 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 7 Aug 2024 07:03:21 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 7 Aug 2024 07:03:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BE9D+hovJ3sew7+TD40Ux7QThiTu1ALRDTXscBNCCIYNb+GXoRTt8vb+idTisiWSlNEm1irxqanXacNS2olj92TqYt5+3EQf9oXcTcRXfwYDYhN9cd5ZJPWamGhkaZUeeMY2EWsjhf8oWTomJk4/JaafR5E/ntFveu0FKF0u7fqJOXy+HQoxdJzIR9rGxei3dJZmYaRquU2fhITxUC3Y16yi490RGpjmjWMFVSsO1Bnf0HPvHqEqacsT7q6xgwtsuKnnO22v1z+xwjWbyB8jIqI1LAzUzEsn4TEN+GQE6gBzKT7om6wPtoOUBDZKGi8AE/YWMxq/kamytSGuwr9UZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UnZ0/zdl5YbtKKAS60EdDarv/w/rK7Sui3jHuCLuCjw=;
 b=FF9RMZZNIkcO5wkBQlcjqrW5Ofz8O/+Eh1SLcgZ1ESomto3ADn2MotOKnuKLtodx+toj/Qy6Xrsxch67KgeRMs0pLksFM0LtNqivVQ9Qq/U4+pS43LdiEPVtS2kBaULCOErkbKSwAGrdPmSZfgadXP8e/vShjdnOrUM4wdj0S3hIzkK0XIs9IFjXqktlnwiPHGz9RlsBvzAZANF94qbocFdJl9mIEaU728YdgkSlkPupc/CSziIdX2bmRJuO3fYufSf32N0uJh3RIV9I2kvdYYS/f4jqsgyQK4kWNxLBmW5Jbk8Hq/g+Qf/yYERWu9FEShY/c51i8JqUFYKltx6KhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CY5PR11MB6368.namprd11.prod.outlook.com (2603:10b6:930:38::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Wed, 7 Aug
 2024 14:03:17 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.7828.023; Wed, 7 Aug 2024
 14:03:17 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>, intel-gfx
 <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>
CC: "Niemiec, Krzysztof" <krzysztof.niemiec@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] drm/i915/gem: Improve pfn calculation readability in
 vm_fault_gtt()
Thread-Topic: [PATCH] drm/i915/gem: Improve pfn calculation readability in
 vm_fault_gtt()
Thread-Index: AQHa6LcJjuvKArcA5k60Bp1MFtQh37Ib0zWA
Date: Wed, 7 Aug 2024 14:03:17 +0000
Message-ID: <CH0PR11MB5444A31E20E25BCC1E36AD70E5B82@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240807104553.481763-1-andi.shyti@linux.intel.com>
In-Reply-To: <20240807104553.481763-1-andi.shyti@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CY5PR11MB6368:EE_
x-ms-office365-filtering-correlation-id: f3d769c9-f265-4764-1fac-08dcb6e9b010
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?iWWrfKqcUiMoxghzeWkRCBmNK++s7L50YNMJfZYP/fdPVJEojl11KtqFX85W?=
 =?us-ascii?Q?xZ+0BNo+5Jeq2O7nitnaMkD8R4bcizliBD3FTUyKiakJWGqcCRmVCKiDGnAn?=
 =?us-ascii?Q?LGD1J416vZisYAwPpFVbjCHQ5Zp6Fp2aZZTLtmzJyMs4DG5cLj0TcEUsbfUr?=
 =?us-ascii?Q?x5K8b3D/3mxSq/FSRNeqfLo3em/BCmaK0o/PH5d2zZy88juOA9DgDM6LM+W+?=
 =?us-ascii?Q?gnaCkP2CFQnU3fF97Gl/VZj1iV8RKhLqPyD3shA6MvsNfFS94XFx7OrlFJfD?=
 =?us-ascii?Q?uAxCiovLO5rzMjDzuACQw5iC0vvgi2QH2X/F5Jy8QnBbw8NbNm7H1HZzrl8l?=
 =?us-ascii?Q?NMKWi3pufLAXgpGGXBLOHIuRLJOEmzfnrzjjII3ZFNDbGJ5Md5HrcjQYeuan?=
 =?us-ascii?Q?DKNIkfv61fzjcDCTRY4s7DMK25c59kvVaGB2hL7ExtjsioiQbNMiFdBDU6Lw?=
 =?us-ascii?Q?Km3g11SN2hep2KgDzGQNFuJ4plzauNSLXmQ4f7bDxRdhzXiii8hrPdBECXWh?=
 =?us-ascii?Q?kW6O7qBkxK3bBsEMO0bEO0iRksQxqGOG7B2WrWU2LdxgwSqZiJB2Vk5EMZtC?=
 =?us-ascii?Q?6JxMfcJQvNoB1/ZhwW7dMF9lh1w0pVHwIHi0IoHmIf6enPWK2qlWpnQgZfDp?=
 =?us-ascii?Q?gVhcE9ymtQbgMh5ztktcmtFp0bgCCC3MqxAraSKuOvs8BoMiKPb7/mFXAvv7?=
 =?us-ascii?Q?j4rgOKZzf0oTJgjHRceorBIGjG2TRYdfbKNRG6TWorHp+L4wwUsRzWAbkgK/?=
 =?us-ascii?Q?h5WVWOTXpWzotUqcyP41ZopxxyWSaqXIBoXr3EN+oxI8tmLZ6421wMfuxYyU?=
 =?us-ascii?Q?7fyZjDI9EiRKVgdiypewYx3w+C9otlHsb5WbwviCDpaZAXSGIhNWsPDzByd2?=
 =?us-ascii?Q?/wakoo7iaXwratJr0JCEsMA7TmGp8a5vYsq+oeNY6zGMdJZ6PcyhSEIuLYxS?=
 =?us-ascii?Q?yPt+hflrQLDNszB+FO2xgLlfFSskLUl/tiY7GrPLi4SLlGp9K2uAwns2lkbj?=
 =?us-ascii?Q?KJpA8bqPVE0uAa2q8t7H+1z1EnNe7tplBCYQPAXjctSETLISIy2QTpFt7Yuu?=
 =?us-ascii?Q?JccSzJM7xSO/cblY11ygPhfxGQe3nM4fun/O8N7Re94ZxnBQqBoF1qoE6JsV?=
 =?us-ascii?Q?ynUGmxhlAOli8nfnXBvcbnCS/GrX9VG8N+aia4slzOsek/N/NyW/Zp59pl4h?=
 =?us-ascii?Q?8y1HOguBOgR7+SUpTunHvnzir2o6TYHRN3hLKcmvXs/syLJIxMyKF5wS5XJT?=
 =?us-ascii?Q?4Yas/7/yLkpzdYccDvlEKMJtayNEJsVCOfcOHQmBKRJoTvNBpMVjcznv4Kr1?=
 =?us-ascii?Q?4YKTc5+rleKlVZoyZdtCxU/nWqdsXJ64v6o6N3dnZ/XBKmHJie+w+SPKdN7s?=
 =?us-ascii?Q?LVO3qXxOL2rQEwFQA/V8Tm5iYtbPDyMJAbHSYY3lZqVgOa6KqQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9dugtqCa5eSnXzdybwPuAg0kaxumsfoAHiT/u2DVVxf3H5RofmcROpoNRDzq?=
 =?us-ascii?Q?lk27jiKg25Ka+GhgSh29ScYr8K2AYw/8uOTolUOS8JfVGAfpVo5zMW9vnE1r?=
 =?us-ascii?Q?pDk7OPHeLAqyhN/rrCBQcEjD6Bsrz0j7er/x2FTtIW65kJQjTlyp3ez7uKtz?=
 =?us-ascii?Q?ZIk3juv2MQf5IMavuZY574MnSA9FrwdB8/mt8YNrUxasi224/Rk24m5V6WDD?=
 =?us-ascii?Q?vDoysj91/mDuX3EbqQIqy8REpuBggbwEy1SEne6ll9VhSqlrhjlTPVFq2/b6?=
 =?us-ascii?Q?xZzSurYDz3EUmrjVgVkPq11dFzkw1Jixud2OD0KfPOWuZzxT0PMEO7WlKs8V?=
 =?us-ascii?Q?lyxm9uw6kFtzu2XwpvfViON2hLGfi0NHvpfs+gaKI8P3UuCyYzQLS3+rcKy/?=
 =?us-ascii?Q?0iVjWQC+QcGBnnBtjio7qtH1n+y0QTr5GNROGuLrSUS2HXb1qpP00pW8fxNf?=
 =?us-ascii?Q?nT02FrUqZ9pZW1ctSd22eV/nXBwDCF4tc/RBc8y+uKaUNrOfOFSsdRSyeOOp?=
 =?us-ascii?Q?9Qn/2EdlM8OIMTX9qCVXRqpyITa69etho8PsytwTswV+NWUs6Wmy4ZHIWc7e?=
 =?us-ascii?Q?lgC+5rTXrNCpWTU/sEt1ulBqr3N/7AaR7/cewg4075QmRchJufvq/dlWq9XI?=
 =?us-ascii?Q?HrNQFcSkPS3x99t327U+VXCXaF5Ct3N/qHfccTkcEnC7TEvaIexmdvO5RZze?=
 =?us-ascii?Q?VMVkLS2o9+c1qGA1y/emgiQeFXghXjZZaer4SAJglw+WNmxUH+kN11TBmM3E?=
 =?us-ascii?Q?rSPm3U41RMsvM5SiQv1dILqqfr1v/Xf9+gxrWKsICzF8rY0y4pOQ20C8w5bk?=
 =?us-ascii?Q?cBpoo3glDaV/FmJjsvcfIRTt9d47Ix7AHwPzA+e7oRXHRYoY51FgEppm8xfj?=
 =?us-ascii?Q?sPcOkDGwB7I1EXikEgSKLC8a8T4ZWIVhpb6LE8UxZG6X2Lbt4zwNSbM81hbu?=
 =?us-ascii?Q?oIFjr1XSjmez4K+cwk+q3CSsKk9O2cjCYfD2OvAJ5GI5zo6LI+8yKwM6AIv0?=
 =?us-ascii?Q?Yj46aXApMqPuKizC00aeOiQZBfZ7J5Uy9fL7I0QEO/dFoJU0W3JVMBtGiKbj?=
 =?us-ascii?Q?hdlHRtaUCtNp887/kdEKionCqDPQkDiTCsb5VsVxNE81bP7FtzkACbV4d5lK?=
 =?us-ascii?Q?e5vhv6wHCBvvO9d8s8JQ+dFOxtPkqWbLnwp8yJxnYj0p83aK5vI9TWKtw0tJ?=
 =?us-ascii?Q?NKU41lqLsvZCbizHm2L5ChdEJadtTMd5kpZy8nI4OAdsuFoqDOkEezQM+ncB?=
 =?us-ascii?Q?X41PqnfTzIHj6kamBGco6nASIxuZPvhZbm/GJgJRJJSwxUaSivVmeDJU1vfk?=
 =?us-ascii?Q?V43Oo0Zd+GUmLiKNqQoeMH6vmuG6IxJg4YG7tYtTwwyJfZ16Tnnm3Db6Hj9x?=
 =?us-ascii?Q?6n91deEnu6YoWcpdX38XvVkiFKD9cW0KudVX/wLf204OlPPPzqRmpbm1y4rB?=
 =?us-ascii?Q?/nCyTGA8H5T1iYXGuvvIaUiD984p1eGGbNRK82kdzoonyY6YhVndw2RW7hCC?=
 =?us-ascii?Q?8uuU+Yuy3MJneuFQ8F0gd6qBKDIKQfsBa4XtykFNNMuLjxQAIfHtLSrdWukc?=
 =?us-ascii?Q?Rmj31iyAXEeppGfx4x4cmBZ1gkwH2TjhXCQpl5C6?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3d769c9-f265-4764-1fac-08dcb6e9b010
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2024 14:03:17.6678 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8BV/C3ZvZ2bKhVXpol8YB3w+emglPA4GB0XVuVQ6e51OSsAJtjTjwxa9T6LxJYe3Ek/+kaAGIkbYpFTOOSeHvPnmby+J0Z0QICCPMZyzqy4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6368
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

-----Original Message-----
From: Andi Shyti <andi.shyti@linux.intel.com>=20
Sent: Wednesday, August 7, 2024 3:46 AM
To: intel-gfx <intel-gfx@lists.freedesktop.org>; dri-devel <dri-devel@lists=
.freedesktop.org>
Cc: Niemiec, Krzysztof <krzysztof.niemiec@intel.com>; Andi Shyti <andi.shyt=
i@linux.intel.com>; Cavitt, Jonathan <jonathan.cavitt@intel.com>
Subject: [PATCH] drm/i915/gem: Improve pfn calculation readability in vm_fa=
ult_gtt()
>=20
> By moving the pfn calculation to the set_address_limits()
> function we improve code readability. This way,
> set_address_limits() is responsible for calculating all memory
> mapping paramenters: "start", "end" and "pfn".
>=20
> This suggestion from Jonathan was made during the review of
> commit 8bdd9ef7e9b1 ("drm/i915/gem: Fix Virtual Memory mapping
> boundaries calculation"), which I liked, but it got lost on the
> way.
>=20
> Suggested-by: Jonathan Cavitt <Jonathan.cavitt@intel.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/i915/gem/i915_gem_mman.c | 20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i=
915/gem/i915_gem_mman.c
> index cac6d4184506..e9b2424156f0 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> @@ -293,8 +293,10 @@ static vm_fault_t vm_fault_cpu(struct vm_fault *vmf)
>  static void set_address_limits(struct vm_area_struct *area,
>  			       struct i915_vma *vma,
>  			       unsigned long obj_offset,
> +			       resource_size_t gmadr_start,
>  			       unsigned long *start_vaddr,
> -			       unsigned long *end_vaddr)
> +			       unsigned long *end_vaddr,
> +			       unsigned long *pfn)
>  {
>  	unsigned long vm_start, vm_end, vma_size; /* user's memory parameters *=
/
>  	long start, end; /* memory boundaries */
> @@ -323,6 +325,10 @@ static void set_address_limits(struct vm_area_struct=
 *area,
>  	/* Let's move back into the "<< PAGE_SHIFT" domain */
>  	*start_vaddr =3D (unsigned long)start << PAGE_SHIFT;
>  	*end_vaddr =3D (unsigned long)end << PAGE_SHIFT;
> +
> +	*pfn =3D (gmadr_start + i915_ggtt_offset(vma)) >> PAGE_SHIFT;
> +	*pfn +=3D (*start_vaddr - area->vm_start) >> PAGE_SHIFT;
> +	*pfn +=3D obj_offset - vma->gtt_view.partial.offset;
>  }
> =20
>  static vm_fault_t vm_fault_gtt(struct vm_fault *vmf)
> @@ -441,11 +447,13 @@ static vm_fault_t vm_fault_gtt(struct vm_fault *vmf=
)
>  	if (ret)
>  		goto err_unpin;
> =20
> -	set_address_limits(area, vma, obj_offset, &start, &end);
> -
> -	pfn =3D (ggtt->gmadr.start + i915_ggtt_offset(vma)) >> PAGE_SHIFT;
> -	pfn +=3D (start - area->vm_start) >> PAGE_SHIFT;
> -	pfn +=3D obj_offset - vma->gtt_view.partial.offset;
> +	/*
> +	 * Dump all the necessary parameters in this function to perform the
> +	 * arithmetic calculation for the virtual address start and end and
> +	 * the PFN (Page Frame Number).
> +	 */
> +	set_address_limits(area, vma, obj_offset, ggtt->gmadr.start,
> +			   &start, &end, &pfn);
> =20
>  	/* Finally, remap it using the new GTT offset */
>  	ret =3D remap_io_mapping(area, start, pfn, end - start, &ggtt->iomap);
> --=20
> 2.45.2
>=20
>=20
