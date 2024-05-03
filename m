Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2A58BAF2A
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 16:43:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1911A10ECC4;
	Fri,  3 May 2024 14:43:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E78oLsNX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9180510EC45;
 Fri,  3 May 2024 14:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714747407; x=1746283407;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7CWrHTeZ3wvxNIKbbTPHiPwLuiXKocgCTEZtZwZBmV0=;
 b=E78oLsNXuhcq0x+zYHBhg9lFQJFh3kf+bnuDvSAksyipu6Ey/+zgl2f9
 Mgl0QT30bO4y2JrbtxpJs4q7Fe+gxRHbZxrmqY4RPWbEEbMV3cvSkiWG5
 J4GAnF8xQmmU1c58veMcg6fvvv7D7XkFnvWaksEiTPlBdGcE3ZGql82Kz
 nUTG2FY/cl5EueDx7iJpvy4Gq0XBIjWzeJ5F1tdpVK2u9KTTTVgv3Sc3/
 u4ybjOp4DAmQFonrpsDPk/JgcaGgK0Rm132TDsfQgMyWN0x3TUffoXsnP
 n2qXFG795AqT1dhV9b9qJ+vzh00KCHtbqCUI9fAKiKQDZhoOJHpm4WP+5 A==;
X-CSE-ConnectionGUID: WbB8voYiSjGYEqVf27/AAg==
X-CSE-MsgGUID: yBp9gsJ1TP+92AdtZifoVw==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="14373289"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="14373289"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 07:43:23 -0700
X-CSE-ConnectionGUID: KBPGYVFoS+WEtsENZ05I8Q==
X-CSE-MsgGUID: 8nrLAKwESkGBAw1Hom3qbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="27344443"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 May 2024 07:43:23 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 3 May 2024 07:43:22 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 3 May 2024 07:43:22 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 3 May 2024 07:43:22 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 3 May 2024 07:43:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e5vUlKPASoMUOVCZt2zoqCFl2swOEjg6sTI4JCMWqqyqXeUglr8QXd/eup1fAsiV8sbp3sPBaYfMm1R/X8S+eg31BxhLig48WUEUmgN4Le0V/5JNQHmeij92xx2OZVxHgGC6coTrB+6UIQcSO3MtFwBSrale9n4uGsgrnFBP01kErzh1Vj/okRCO90ai/5Hek6FPq/lO7lLq0/HfU5MfkUIWhpIV5atTZJHqsFiv8lSdvUrOuyZNCBE1jXKyUoqaDc8/sWZGbkrz41tKaYOYSeUcp21BhSAeagZ24saqqVMcvO19JlHDAq7RFYfiI90asBarm4ES+NcE2HM5jufASA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OpmIjM7CeZkAaJ10CSzFBkHe23BwfilTc7sgosWm+hM=;
 b=P/Sibibp0QSYzsogxrid8ZQA/2pQNM77Llprp8YkOdiItVjmxtuPoP0PfIpWs3kugNJyU599vDDyoKkzFkUKus1LRZXK2tGGIa0Zhaj1od/WvK4w/OgJP9BQKwr8lpdUqRt1NQE70w3IjTx0Sz4qeWGCVjUnzwGHpiwMWX0SgqcHqYFPhtKg6x8hji8CzqApewyxs7gpA3DNM8w8JY8qmHOxP8OIQdJtN1Cv3s6funX6CFuAluenEOsffTgwAqoblglDb7vFO7CS+nktkXZTaNw+3PTZc05u6EQAzdTJcU+pcQx0ww7LpBHw7FDkTt35iOxsbNIHu65o+9mPwXNVCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by DM6PR11MB4596.namprd11.prod.outlook.com (2603:10b6:5:2a6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.30; Fri, 3 May
 2024 14:43:19 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7519.021; Fri, 3 May 2024
 14:43:19 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: =?iso-8859-1?Q?Thomas_Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Brost, Matthew" <matthew.brost@intel.com>, 
 "Welty, Brian" <brian.welty@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "Bommu, Krishnaiah"
 <krishnaiah.bommu@intel.com>, "Vishwanathapura, Niranjana"
 <niranjana.vishwanathapura@intel.com>, Leon Romanovsky <leon@kernel.org>
Subject: RE: [PATCH 06/23] drm/xe/svm: Introduce a helper to build sg table
 from hmm range
Thread-Topic: [PATCH 06/23] drm/xe/svm: Introduce a helper to build sg table
 from hmm range
Thread-Index: AQHaSZDNP3fdwvIgF0K88ldd8EilIrFZUEuAgAAW4fCAALG4gIAAI09QgAA3bwCABhSRIIAAKiwAgAGpRnCAFa1zAIAAF6WggAClagCAAiZXgIAAIx+AgAAvHwCAAB2VgIAELjoAgAIqYwCAABiGAIAAVwWAgAIXDYCAABKpAIAAPDQAgAAlzoCAAEh/EIABMkcAgAAGVhA=
Date: Fri, 3 May 2024 14:43:19 +0000
Message-ID: <SA1PR11MB699156AB3B2603DF1762BEA7921F2@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240426163519.GZ941030@nvidia.com>
 <f938dc8f7309ae833e02ccdbc72134df0607dfa4.camel@linux.intel.com>
 <20240430173002.GV941030@nvidia.com> <ZjE_LJ7AFFQk0Eep@phenom.ffwll.local>
 <20240501000915.GY941030@nvidia.com> <ZjNJASw0JdXS6dTa@phenom.ffwll.local>
 <93fca752517f0120baa770992fd0f9160b0c14d1.camel@linux.intel.com>
 <20240502124632.GB3341011@nvidia.com>
 <0b700baf6fc3d41b4adf6301b1b4dbc4ff7078fa.camel@linux.intel.com>
 <SA1PR11MB6991945628597BCD9D111ECD92182@SA1PR11MB6991.namprd11.prod.outlook.com>
 <20240503133732.GD3341011@nvidia.com>
In-Reply-To: <20240503133732.GD3341011@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|DM6PR11MB4596:EE_
x-ms-office365-filtering-correlation-id: 35630589-a8f7-4776-b632-08dc6b7f6029
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?BztcFs00r117TFhsq5za8nR9qEVa1mG2AklixholRO8UHUXa2fxbs32EHo?=
 =?iso-8859-1?Q?zLL6Vmuk/gugQr7D/n5faRYB9bnqd1ijf80UBa3y+LhYexMO7ZVoWXK5Ap?=
 =?iso-8859-1?Q?v957bEbZUTog+udaZO9F903nn8vaKCkigtCJAmNIuECvUYX/jAuPM8z5Cv?=
 =?iso-8859-1?Q?iR+wT1R4WGOxbMXo8gP6QKWRtlfDxt9Zf45fsTlGpWDdC0ndSbsr7Cz38m?=
 =?iso-8859-1?Q?9SiqQLDx9iYCA+GOPNJ9cVcgmiJTedby794mCgyfnipBqzaoZ2xBqFi7Pi?=
 =?iso-8859-1?Q?0h5S5nhOMut04RR0L2yhLND182eViLhO9pswuZl1xP3vmvkOxRsVdtt+ev?=
 =?iso-8859-1?Q?dVz1W6sX+LULzQ5d6Fv3YUsO4i+bsQiVZ5NX65WO7kcXU4R49WfhygXykI?=
 =?iso-8859-1?Q?7zyqzlAcLS6cSSXRaDfx+xaukOHhOFi8kx+J0AROvAK/ijDJPf7Adf20ta?=
 =?iso-8859-1?Q?KC1YUm8H/NA0JbVlbvDDrHTIDMnAVwH8pujYMxyFxtZWIiilNc6VE9abjQ?=
 =?iso-8859-1?Q?3xkdA0zV7IpUCIyVDlCCMzdIFCmy+JmpPKQJZIZswBbQV2pUSGhkRHwqXG?=
 =?iso-8859-1?Q?jBGyulfpw9MCg/VjuoAP/eCCFtMjnivgkREktwAOlKVelQVOuV/bMAOruf?=
 =?iso-8859-1?Q?TxUx9n8EBflYHbymAS7+loZZET6HwG4roRFMupFHRVO6MJdmNIzNWU9R0Q?=
 =?iso-8859-1?Q?AQFQJQWlrFU8pH72HF5SvJ6yxLxOdcqMFaatrpWabvUBGGoGTuAxUpR7KC?=
 =?iso-8859-1?Q?pyGulGf7e/o5V9d/4EvzMcKj3ml5UIf4qv3+cQywE9cPf66j4PQLRPH3TZ?=
 =?iso-8859-1?Q?AqGtkyBY4gVUScezvXltKcyQkjXtL5FboVd4EDsceMC9YRIfK1WARslJ9h?=
 =?iso-8859-1?Q?2qcEeWvt7047f95N0bF+CNx2QnKMufMH3cgnAMoNWLBYA6/xM2WlJ2vNn7?=
 =?iso-8859-1?Q?DbrK4726aDfgD8DHH/XBzpynQEP0dfEUbndTMNUcp+1AdBi05exK2EjdAG?=
 =?iso-8859-1?Q?h09pNU1K8DYfgumgfQKY6kOtBf4YB70OyNLa3xUu9DEc58TdN7Xh8NlpI7?=
 =?iso-8859-1?Q?9KFZT0IuDfU3KeZnACsT/YP3MTTn7iR+pWx+n8gAGRE/qxZ6Su6YxT+nRF?=
 =?iso-8859-1?Q?W6w/ur3tKAMU7UsW7FmwTnAlWa+FDnAcwthR6JZ8Rq5J97CeJ5A3s1oDFb?=
 =?iso-8859-1?Q?Zfhwf74PvXhhgOQ375Lg4bBvNlaV/Thzy+5eslUrQkhR8JzDdBPPBq2HjK?=
 =?iso-8859-1?Q?T2cVFrCfSbtkYfwhjJ+4An1PVwx84QmRk75RHDJyC7xUvEj3+Ic+mAzj36?=
 =?iso-8859-1?Q?6TSzDqpyXCzwkj0sfxeEVvnLPCiUGIf7XZE+r0Q4pUWjyk7B0qRRgAcP87?=
 =?iso-8859-1?Q?32eTk6qSmQHNcRmf0k9nMUK96Upf7AYw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?IP9PpCBs+EtRnJqT5irpDiDkxMchG6mJipVK5YC7/KsCEeQrWAdkQY5tXr?=
 =?iso-8859-1?Q?EZ8/FmSDjeLVPfqHRG4PXGihvk54Y2phB4L6Y+jYhLlERvP50HgYvg2A97?=
 =?iso-8859-1?Q?qlbi+OpnCnWukt6PMztmGrXfZJ3u8c4d8Ah6rF4wj9IbBYBG+yNgURziLA?=
 =?iso-8859-1?Q?uOPdNpZXu/6wIWNH0CQkX0zNhfsvb1n8cj0cFGlkmzsVd7Ws45aK8mcEMx?=
 =?iso-8859-1?Q?Cf5mdkcxZYWK9uWwh+0ZoQ3Kbn0tlaV2FEQNFKpNjtw2f9yrPcqfJdzL0I?=
 =?iso-8859-1?Q?WWB/jX9BBcAXDHOU85/KV1EVDdZIH4y/rWxRYjgbKh6F2uTdRyZVmr/ik8?=
 =?iso-8859-1?Q?2sjzfscB6U3EizaBAvbPnWFjYhVfJPjODBLOplhNL/1bNqyJ2ZLipPZQns?=
 =?iso-8859-1?Q?0IPPsOqPlk1bP+ts1ONtsuTOFw+s4OR9MfB53///voC1kohbzCaCVmQmuv?=
 =?iso-8859-1?Q?HD6SB70U6OuliFmYznu3U0ecKa4MZJGzj4lW7DK2IX0mz+a/9RwIhmDF29?=
 =?iso-8859-1?Q?+A0gNaMvnwDDt//12yQvPlrQYJzN8mksDurN2BgFuvWto02mkHuI/xWeTb?=
 =?iso-8859-1?Q?4dupvGhfLWvQpIZmD0JRc0XJCdoQopGncEtP+xP+5VxO/K1sT8cZJqDu3+?=
 =?iso-8859-1?Q?4KbTD/YJfnRHtYdpsJRyXexqIl4aqhnPxzeqbci1R6d1BX7edlbbqg4KQv?=
 =?iso-8859-1?Q?dXeESb8lHr4SyrDezQMp8LHMqo+Q9rT2TlFZImuUwUAW5zH5jfUlL+topF?=
 =?iso-8859-1?Q?RKVXRLVh8ygJ6SBp8zpRvgvBp7nb8eJunx/wr9NYS0u7yjZBmadnHaSKCa?=
 =?iso-8859-1?Q?9/sefsSGNM6EN2Tb0e2pnxdtF731ShAlscmv+M3CIz21XUqVdiGn0chBDV?=
 =?iso-8859-1?Q?BQrLU5q8J+xaFHLZ00sGiTGZYOtsS7qhlfkOKu558areJH4KhRzZ2IE18H?=
 =?iso-8859-1?Q?jt+jrfrNSY1LJD8v1MQooAyD8EHtEVrVwcehwdnb0QxKGrqDxVw4WAm9M3?=
 =?iso-8859-1?Q?TDp5SHdoHmPOwpfjc5zxFNpyguYS5nI0D120RZxDk/JBskP+2DN4c/9Nyz?=
 =?iso-8859-1?Q?mf62r3hdHHe+ZwOfjDbGPmnUfCwl9P8yHB9YrOrLBB2tMTTVXJv826JFeZ?=
 =?iso-8859-1?Q?MiU9Lg390Gp6pCwO8rnsbuGlN0MX6ZpCrvVLuIMmIGqqmMfkoY77eMiUJ2?=
 =?iso-8859-1?Q?HJJchSlOiS0rgmCiFqhXtNn5EgLxb2YmfpZFr8X2AasrKoyzPORkWUDG03?=
 =?iso-8859-1?Q?DV5EiO+CmWbW7I/BWjScpUxHDJAccglLPWNgMdvPqgJAC+nOpE2Kn7G/ju?=
 =?iso-8859-1?Q?5VFhVBv+pY+R+i9qvVMeZE0RETu36go/HLECErPQn71Jsw7zybpjeebHhX?=
 =?iso-8859-1?Q?nyNP0neE+yl66o/1Pfepq0ucveAB9ZW2GPlOp6SThakqvcFuEyg1Ss3KaP?=
 =?iso-8859-1?Q?BibOgIHXqIBntEOR8YID3n2VZEa0ZB9B0Kfgiq4soezxOtvIpzQOW2xOzP?=
 =?iso-8859-1?Q?FbJJ1DoG96RhmB0duBmq2tMyQNnO9ihK0RiMV1Jwr1Ci+gPpKt1Ga4SIty?=
 =?iso-8859-1?Q?IMl4dOEnllEgXRbxVHElImSlRA/A+ZV30C+QkICiHVcfiPXCQ13X1HyzpW?=
 =?iso-8859-1?Q?GBjUTKWIlm64U=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35630589-a8f7-4776-b632-08dc6b7f6029
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2024 14:43:19.7945 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L6kba7nForZUJv73dBjl2j46LIfSiWtcSP/8UONH/nKpns0mtwz0p6LHqgE25rdubyl84Ibx6y3/PvdmOtamCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4596
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
> From: Jason Gunthorpe <jgg@nvidia.com>
> Sent: Friday, May 3, 2024 9:38 AM
> To: Zeng, Oak <oak.zeng@intel.com>
> Cc: Thomas Hellstr=F6m <thomas.hellstrom@linux.intel.com>; Daniel Vetter
> <daniel@ffwll.ch>; dri-devel@lists.freedesktop.org; intel-
> xe@lists.freedesktop.org; Brost, Matthew <matthew.brost@intel.com>;
> Welty, Brian <brian.welty@intel.com>; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>; Bommu, Krishnaiah
> <krishnaiah.bommu@intel.com>; Vishwanathapura, Niranjana
> <niranjana.vishwanathapura@intel.com>; Leon Romanovsky
> <leon@kernel.org>
> Subject: Re: [PATCH 06/23] drm/xe/svm: Introduce a helper to build sg tab=
le
> from hmm range
>=20
> On Thu, May 02, 2024 at 07:25:50PM +0000, Zeng, Oak wrote:
> > Hi Jason,
> >
> > I tried to understand how you supposed us to use hmm range fault... it
> seems you want us to call hmm range fault two times on each gpu page faul=
t:
>=20
> > 1.
> > Call Hmm_range_fault first time, pfn of the fault address is set with
> HMM_PFN_REQ_FAULT
> > Other pfns in the PREFAULT_SIZE range will be set as 0
> > Hmm_range fault returns:
> > 	Pfn with 0 flag or HMM_PFN_VALID flag, means a valid pfn
> > 	Pfn with HMM_PFN_ERROR flag, means invalid pfn
> >
> > 2.
> > Then call hmm_range_fault a second time
> > Setting the hmm_range start/end only to cover valid pfns
> > With all valid pfns, set the REQ_FAULT flag
>=20
> Why would you do this? The first already did the faults you needed and
> returned all the easy pfns that don't require faulting.

But we have use case where we want to fault-in pages other than the page wh=
ich contains the GPU fault address, e.g., user malloc'ed or mmap'ed 8MiB bu=
ffer, and no CPU touching of this buffer before GPU access it. Let's say GP=
U access caused a GPU page fault a 2MiB place. The first hmm-range-fault wo=
uld only fault-in the page at 2MiB place, because in the first call we only=
 set REQ_FAULT to the pfn at 2MiB place.=20

In such case, we would go over all the pfns returned from the first hmm-ran=
ge-fault to learn which pfn is a faultable page but not fault-in yet (pfn f=
lag =3D=3D  0), which pfns is not possible to fault-in in the future (pfn f=
lag =3D=3D HMM_PFN_ERROR), then call hmm-range-fault again by setting REQ_F=
AULT to all faultable pages.

>=20
> > Basically use hmm_range_fault to figure out the valid address range
> > in the first round; then really fault (e.g., trigger cpu fault to
> > allocate system pages) in the second call the hmm range fault.
>=20
> You don't fault on prefetch. Prefetch is about mirroring already
> populated pages, it should not be causing new faults.

Maybe there is different wording here. We have this scenario we call it pre=
fetch, or whatever you call it:

GPU page fault at an address A, we want to map an address range (e.g., 2MiB=
, or whatever size depending on setting) around address A to GPU page table=
. The range around A could have no backing pages when GPU page fault happen=
s. We want to populate the 2MiB range. We can call it prefetch because most=
 of pages in this range is not accessed by GPU yet, but we expect GPU to ac=
cess it soon.

You mentioned "already populated pages". Who populated those pages then? Is=
 it a CPU access populated them? If CPU access those pages first, it is tru=
e pages can be already populated. But it is also a valid use case where GPU=
 access address before CPU so there is no "already populated pages" on GPU =
page fault. Please let us know what is the picture in your head. We seem pi=
cture it completely differently.



>=20
> > Do I understand it correctly?
>=20
> No
>=20
> > This is strange to me. We should already know the valid address
> > range before we call hmm range fault, because the migration codes
> > need to look up cpu vma anyway. what is the point of the first
> > hmm_range fault?
>=20
> I don't really understand why the GPU driver would drive migration off
> of faulting. It doesn't make alot of sense, especially if you are
> prefetching CPU pages into the GPU and thus won't get faults for them.
>=20

Migration on GPU fault is definitely what we want to do. Not like RDMA case=
, GPU has its own device memory. The size of the device memory is comparabl=
e to the size of CPU system memory, sometimes bigger. We leverage significa=
ntly on device memory for performance purpose. This is why HMM introduce th=
e MEMORY_DEVICE_PRIVATE memory type.

On GPU page fault, driver decides whether we need to migrate pages to devic=
e memory depending on a lot of factors, such as user hints, atomic correctn=
ess requirement ect. We could migrate, or we could leave pages in CPU syste=
m memory, all tuned for performance.=20


> If your plan is to leave the GPU page tables unpopulated and then
> migrate on every fault to try to achieve some kind of locality then
> you'd want to drive the hmm prefetch on the migration window (so you
> don't populate unmigrated pages) and hope for the best.


Exactly what did. We decide the migration window by:=20

1) look up the CPU VMA which contains the GPU fault address
2) decide a migration window per migration granularity (e.g., 2MiB) setting=
s, inside the CPU VMA. If CPU VMA is smaller than the migration granular, m=
igration window is the whole CPU vma range; otherwise, partially of the VMA=
 range is migrated.

We then prefetch the migration window. If migration happened, it is true al=
l pages are already populated. But there is use cases where migration is sk=
ipped and we want fault-in through hmm-range-fault, see explanation above.=
=20

>=20
> However, the migration stuff should really not be in the driver
> either. That should be core DRM logic to manage that. It is so
> convoluted and full of policy that all the drivers should be working
> in the same way.

Completely agreed. Moving migration infrastructures to DRM is part of our p=
lan. We want to first prove of concept with xekmd driver, then move helpers=
, infrastructures to DRM. Driver should be as easy as implementation a few =
callback functions for device specific page table programming and device mi=
gration, and calling some DRM common functions during gpu page fault.
=20

>=20
> The GPU fault handler should indicate to some core DRM function that a
> GPU memory access occured and get back a prefetch window to pass into
> hmm_range_fault. The driver will mirror what the core code tells it.

No objections to this approach.

Oak

>=20
> Jason
