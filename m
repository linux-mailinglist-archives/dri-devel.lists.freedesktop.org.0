Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD5AC133DC
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 08:07:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7404B10E595;
	Tue, 28 Oct 2025 07:07:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D7U2I1ey";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9334D10E595;
 Tue, 28 Oct 2025 07:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761635245; x=1793171245;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zrI6ILcAqMQ7uCWogxk+NXRjcD3d/zQOGlsxnoSlC6E=;
 b=D7U2I1eybJVzL7lkDlm+ylt+ACogiKdFPoFqBIF7acqpy/c+cUJgseyS
 Itg8kQHh/x8vzWXEIolEIYqDgv4AnjAY3TlGWe5s7GqNm++jVSatP7DtW
 RbUsIIWzuUKthoLxaj+y88H5gYEXUe+GlFq9dLZYXUTvzxs1ezXRo+QuH
 YxuRrADEHh3tlHzFg3SB3mJ935O62CD/Av2e1+VyDBx4rQh9ZiVh57QpM
 yFtqSEyoVWRy6WruF3Wz8Cuj9iE+b5GHk9r8PeEzNs6xWXlkgUKfAVUk0
 jCYoM3JekIRRa4N/25dJN8uJZHIrNkw1+03gKUHhegtQdDBLqIhLkYVaE g==;
X-CSE-ConnectionGUID: ycJWzLjhRxWVPx1FaGD7vQ==
X-CSE-MsgGUID: MIdHJlD/S8KsQS7Rx7OwuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74847068"
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; d="scan'208";a="74847068"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 00:07:24 -0700
X-CSE-ConnectionGUID: KE9S/g1EREmHIvHC/owwnw==
X-CSE-MsgGUID: 9+hwRSmsQ/SMMU69x9Ipig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; d="scan'208";a="222476084"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 00:07:23 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 00:07:22 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 28 Oct 2025 00:07:22 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.35)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 00:07:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F7xDqmpm+RUATr58TM0tZ9C7HSFZXmgnatSDkQbhBSIiW18F3H35naqEGJ0BOvRlfDWJYEd6fXjtxgl3fK/eHjUPDhdably204ApkIgz80fWxZkerTxl09Hc96iH4YYbDbqA7W97BuBL2l6lbIZsSwz0VrpYmxd6wJuaJBkg24gXWJEdeoeHR/Srz7dzPlPbjOlG4hDb7UbSRnyapdPoidAmjNn3rstOJHI/4b40DHTzgUFqiGmZAxTbTsYctwjdCG4psBSuGhU+Qy6aS6Xga8enwZJ8cwEcSHWxQHaw/Wx5Ac2s4NwnX7TtcdbOmKRYWSMn8uZPRisG3E+J+nCzYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cJNCq4m8eFmtKBl1Asse/Gio8lyt2hjYeasr15qf2lg=;
 b=eSJqGKtjmkeBFBOehAWJ500HNfn8SlbFcBgOnrSFuDXLwzjZipEwhxGfpopK7dkxbh0rDxNrIBxsnxSuqpok2628SRQOy8qeIGFmTH80VAUiNnZiqO7qSNSltg3lem2mv/aDG4GBUBcd9gtslzYmlzR/DUsiRWy/fk1xtAxdJs4O31fw6EHmi1Y7lTZmr1jwN2Jx8KUtHk3S/QL312amOLq/fctSecv01ztHpbk08nlAQuJ6O0egwBTiLR66PbOCLR39vxl68SkJ60/NuqvScRrZYJCQoDtbaxdq3liV/4hPtAKYcVv/qAWgLnWezL/MWZyqcc/6iLm/ZCAGzydrvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by LV8PR11MB8699.namprd11.prod.outlook.com (2603:10b6:408:1ff::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 07:07:19 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1%5]) with mapi id 15.20.9253.018; Tue, 28 Oct 2025
 07:07:18 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: liulongfang <liulongfang@huawei.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, David Airlie <airlied@gmail.com>, 
 Alex Williamson <alex.williamson@redhat.com>, Ankit Agrawal
 <ankita@nvidia.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Brett
 Creeley <brett.creeley@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, Eric Auger <eric.auger@redhat.com>, "Eric
 Farman" <farman@linux.ibm.com>, "Cabiddu, Giovanni"
 <giovanni.cabiddu@intel.com>, Vasily Gorbik <gor@linux.ibm.com>, "Heiko
 Carstens" <hca@linux.ibm.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, "kvm@vger.kernel.org"
 <kvm@vger.kernel.org>, Kirti Wankhede <kwankhede@nvidia.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, Matthew Rosato
 <mjrosato@linux.ibm.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>, "Nipun
 Gupta" <nipun.gupta@amd.com>, Peter Oberparleiter <oberpar@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Pranjal Shrivastava <praan@google.com>,
 qat-linux <qat-linux@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Simona Vetter <simona@ffwll.ch>, Shameer Kolothum <skolothumtho@nvidia.com>,
 Mostafa Saleh <smostafa@google.com>, Sven Schnelle <svens@linux.ibm.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, "virtualization@lists.linux.dev"
 <virtualization@lists.linux.dev>, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Yishai Hadas <yishaih@nvidia.com>, Zhenyu Wang <zhenyuw.linux@gmail.com>, Zhi
 Wang <zhi.wang.linux@gmail.com>
CC: "patches@lists.linux.dev" <patches@lists.linux.dev>
Subject: RE: [PATCH 02/22] vfio/hisi: Convert to the get_region_info op
Thread-Topic: [PATCH 02/22] vfio/hisi: Convert to the get_region_info op
Thread-Index: AQHcRHIxRETGqyMGz0OVIJd24pCao7TW0xCAgABWU+A=
Date: Tue, 28 Oct 2025 07:07:18 +0000
Message-ID: <BN9PR11MB527675F3D3DB9519527ECA8E8CFDA@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <2-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
 <bdb90638-3439-be4e-8722-6e8f9564b7b4@huawei.com>
In-Reply-To: <bdb90638-3439-be4e-8722-6e8f9564b7b4@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|LV8PR11MB8699:EE_
x-ms-office365-filtering-correlation-id: 647fe7cf-d782-4a35-f536-08de15f0a21b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|921020|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?XdMUyu6PAhXfA+o7J7bOOXDptKSZZKepcVGQql/nLoCCD7yI8Ez+qticJXqf?=
 =?us-ascii?Q?8mU7JSZfVxK997QxlXuruilrogRM0mCOeLKmJ7tahmtAaohMg1F5iD/rjI83?=
 =?us-ascii?Q?g6KRvrwvSI3QCjwWvo52ux8Do5f4HO9hnAMR+j2KOP/WOsYNpYpmbsR5BVlQ?=
 =?us-ascii?Q?jsOaL2y9r+VgWLe2+XMc93G9hA2XJIFSfeAsSchFAtmxeuZ/Up/kOj3rMRpa?=
 =?us-ascii?Q?NF3zKnJIoVdnOzk8JXBpcxLGyREI+iNIpdOEcHwvQ/R/pTc3HZ801xOTNYFm?=
 =?us-ascii?Q?5VFjkKeVSN8dWgmefPDYvW2AuHTGXSL2dfbeAzRdqSRJBvZirVfSJUFXZNrM?=
 =?us-ascii?Q?aAhrRVR870xoyUB3iZFSy0qV8VgtcvEl/nNq5qUZSu3dJsZUnmWA3dspW1To?=
 =?us-ascii?Q?nfY0IE5fadaiL8EvT/hzBC17SKVOTYKcNLjbqdRaLuyBMFZWv8IQFEtePVdO?=
 =?us-ascii?Q?QmWPFtBoy5rEdTlYjM78E4apMJ9jgPowZKu+BTDWPSFRUUea+trELk1kA+2o?=
 =?us-ascii?Q?mUSGg746AyeGPoffmqGVD/bCz4TATqWmooIi8i6U/9E05IGzIfHXzOGC7kjf?=
 =?us-ascii?Q?yRlDY6etkZpkYjnxBW7Gt/iXyDW6wU0JTaaDz51xT65Z8mxAmBwtoe93Mig2?=
 =?us-ascii?Q?4ebCfQtMWK+49u15wOqdlc1T9LaapXlPJXpcv3/QcpYt6hEf6Vx6rMvEF0Rn?=
 =?us-ascii?Q?7zg3Wodnh1iVaXiuLIiu/p7pMji7k8794lZxncanVr2MZ2R1059z0lhqwb4n?=
 =?us-ascii?Q?rEOgJgdqt/4xQn0kzPk1guElwA7d8/+59+b25OWbvThF3ClahJs+Q9rTqlGx?=
 =?us-ascii?Q?7mnWePEQ+JWNb2bhDQL3ceeLM3fvz4vzHDUxbQgx6/XanpwJOvznszy/bZhy?=
 =?us-ascii?Q?V1IbnNqt249jMW3F2tkF//Uk+lR2uZltfcbAluIGoEdF8WAoiXveGfR5MCzt?=
 =?us-ascii?Q?GwoOQJDhHhT6xGpRY2X8w7mJAGsgzwIaJWm5qifioQrngYzHsi0JGLzKwpeP?=
 =?us-ascii?Q?ThI2QCcsC3PZeyVzVmsFPeWj+PZRwY9MH5u1ykGBDGSaR+ShznE17fHa8BHs?=
 =?us-ascii?Q?yyDISDE0ONt0JMOoGz+mx8d1ck0RMRrBYckKyTKn05KBXWenzdQZfrNL/8X9?=
 =?us-ascii?Q?PMyjRnL7GfvTYBMR/5dVOpRMoghdR0bn9GE5DzOXjT32knjL7lkM4Uw5rUm8?=
 =?us-ascii?Q?M/wy2tSS46frau3G9f4BxuPqP7UPwtudi7DvtZ8vutNTeJEFI06YIITlSSB/?=
 =?us-ascii?Q?56Z+hmofRNzZjUb3GWv5zbXu1TFmMmlZQ9ucWwTk/+lBPVcyYCMm8S9QYPt7?=
 =?us-ascii?Q?ecwt4BZgPLmf+7Ml8RDuhGgDCEGTquWk1BMn913WfOBScrq6Yc3L+rtTOXZt?=
 =?us-ascii?Q?+u4Gxi1UJ9BXOynrbHiJFDI3QS0QL5CWVW6rUN4ePXV560fFMYvWkNMeiuXV?=
 =?us-ascii?Q?FSHCN++Xc+cCqJ7iPp04+rHMzOB80jWcHEJktHmTEUKqpH90MuYY4buOm9k2?=
 =?us-ascii?Q?kK6mDtywaAtOtkaDirT6GYRLzeaDjtqrwRloUosKCtdKw3Vn6usPYqGXuw?=
 =?us-ascii?Q?=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hHK5fcpTvyNNd0vgIOEtO3pY1Yq5/8PxUTsrvXHCjjl8zPxqC2xehpvcdSd9?=
 =?us-ascii?Q?V6OB7CVD5JC8yuKV/2NuBG1Vvl59IhztC7izq23I1VDKX/stvH8hGePqdpyP?=
 =?us-ascii?Q?kRcV9qRoaDtx67zNiZymETAeu1VQM49sHakw+CSzx6EcOBel//UbdYLVcWPG?=
 =?us-ascii?Q?7xN5xuZW6UaJxtz7B5vxsqz8HvIstFSlgu+A2HK41FRDfLr4trsSMRn5idbO?=
 =?us-ascii?Q?M6jjFvWSr+JdawASOErtmkmJm5guKS6MKHJ8UqYjigXyLhLNNhBIGU5t96Fa?=
 =?us-ascii?Q?nHmmJfardM2rFXI+3K/9fTofgMl1znFWr8TtMakUQhs4aTWfq9Gg26S6Qtuy?=
 =?us-ascii?Q?PGRz1xvblbK9Z0+5i6Qobx+RZH+G6siaJ2bK5dovk9YsJiRAS2112vV+bgBM?=
 =?us-ascii?Q?MgTn68utGXWYwWpKPKea3zGHxCEghnhNERY56aCVx4VWvYld957DimG7PAlC?=
 =?us-ascii?Q?LX7fbKM4yLcitTp1GlVxjG0BiYKJaoIr0m8oYJcZdCkRLjqhYjzEC35AT2jh?=
 =?us-ascii?Q?dZA8xMXmF/ErtZrFnd9vBqSjzXPaTmKfm6nnQ5eYhoFV1nIFjG5DrnIkm0Vt?=
 =?us-ascii?Q?MsyBAJwLkY3ulNv7tixQfPqOj83v3aUK3+v++qeMIAl01vVuoNeFO27QKP0H?=
 =?us-ascii?Q?WDCkHAuVy0DaCEv6zvF/bTqlV3+1P4s+Ko0LPU0GswdwBCqWZvQqAqb81RdW?=
 =?us-ascii?Q?FgtkPYrZdZrOYGuVDmJHwAnOQ5DM4oSkMOJ0GN/1q5N+JLHcjIEug/FKLQLF?=
 =?us-ascii?Q?RLqWgrNFh+J8ldZlZQY7OI4T7Qmp0/XX/YwmNU64k+Q8lyzmbVSzM8jmPK7Z?=
 =?us-ascii?Q?BIIK5n+cGVHr1tUB3+V55GwGEp/o94SzaCbaFJ1ePvS9iEc+QIn7M6EvCoMR?=
 =?us-ascii?Q?Cd3F29BUxzgpWFtB6SobxmR34C9n+IDkvejxgoZ3GqspC3bqeUrlnpL5ubJD?=
 =?us-ascii?Q?XvltiWpwCOocdfyH6wkQc3rus/prA8S3Dz6TqlqWirDwdC+qbeSM+Y1R3Kva?=
 =?us-ascii?Q?n3SoDpgnHIguie4kthtJh5bOsVHfT6Pqjylct3djWOQeGgzWmODiH6jYKUwG?=
 =?us-ascii?Q?e/1/RQ60FzcvgaSjiCzJGvzxNCxZT6tIXkj+nLJ7JoHUzF4ST7/e/hWJkf5f?=
 =?us-ascii?Q?RYbbIA+HPiXFaKWbQkMkwIXZropMDrOhNOJj5EQzOE8BmHIADZEzow7byh6V?=
 =?us-ascii?Q?mYid8cE6XPw2rwV/RaOcTpmNyBHKqBwANGVXsMet8pS2H+Kq2h5WuWCeS14Q?=
 =?us-ascii?Q?9O4FWgIYOXaPfBL4IPv9z/L4WrHrNY+RbR9Ll9QP8WerbXX/1wrZzmbkV80C?=
 =?us-ascii?Q?Te2LTXudk6yjfxxB5qLfLu5L8upukW2FiEGOWS4moInr05tvgbEvD3P+MFKZ?=
 =?us-ascii?Q?ldPfefMlPGW8iktuiXRInzlLJ21m6DAj25+Fu7M1bxIIaj+mrs/a7CHMlh16?=
 =?us-ascii?Q?mpe2GmsON9WeNPGeTPgGI9r55jZrc4GJdlEq1SoqEs3nYn6btI6c+c6S9cQM?=
 =?us-ascii?Q?+iTYbY/Cdrfjf4Q48d029MkfjyFtbgDA+Oge70sQDlsiZzaKr1izwAJMbxMQ?=
 =?us-ascii?Q?Bty93QwScmz3nm2V6ClrrYPlLZtzq4iCNY3aPpoP?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 647fe7cf-d782-4a35-f536-08de15f0a21b
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2025 07:07:18.8978 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tIjAPMFSMkDNmsXcX4F4S3v4gv2+pBW+/hh+FU8Ah1RIDBMxTLZSgbYnsBGGXoUaIJGZXI+eKhpvf7/6VsAGPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8699
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

> From: liulongfang <liulongfang@huawei.com>
> Sent: Tuesday, October 28, 2025 9:56 AM
>=20
> On 2025/10/24 7:09, Jason Gunthorpe wrote:
> > +	if (info.argsz < minsz)
> > +		return -EINVAL;
> >
> > -		if (info.index =3D=3D VFIO_PCI_BAR2_REGION_INDEX) {
> > -			info.offset =3D VFIO_PCI_INDEX_TO_OFFSET(info.index);
> > +	if (info.index !=3D VFIO_PCI_BAR2_REGION_INDEX)
> > +		return vfio_pci_ioctl_get_region_info(core_vdev, arg);
>=20
> Looking at your first patch from my driver implementation code, the
> vfio_pci_ioctl_get_region_info
> function doesn't need to modify the first parameter; it can directly use =
vdev.
>=20

it is used by some drivers directly as callback in struct vfio_device_ops,
so the 1st parameter needs to be struct vfio_device.
