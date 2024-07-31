Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A22A9438FD
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 00:31:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5947710E2AD;
	Wed, 31 Jul 2024 22:31:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CYEteV7M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8414B10E2AD;
 Wed, 31 Jul 2024 22:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722465068; x=1754001068;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PnszGiLh8ophyhWmh6H2tQEGEnLNe99bFBwkSCFSCvQ=;
 b=CYEteV7MfbyS0yix3wvMgYLwTwq4fDJDBrMMRAoq/AUx/8KsR43Lb5hf
 PCD4XVfB5w7ACQuSVoscDUZJ7YusU+cETc2Js4jB5+oANiWE9HpC5Laeu
 Lf+pJ76oejk0Dva7hrarPH2ZAXuzRKSMkqkgyWYQSSm4HyJmpIfUSA7Ij
 yJ6EkiFC1yjUssdJIyiLYjHmNIzDg7IeUSH4rVf2DtMf5OhZkYYbRa7UW
 JWe5CmwaTVN3J8fNYQ//uQyT5dm2JV9SB556P/7i9rUj3r5w7OeW+gxT4
 UgezogzhUJaNY0fQ32QPJvIvy+GMX/1R2NqbRvEtHJ5HW/+qqYd2AZRQf g==;
X-CSE-ConnectionGUID: RrNNOwAlTZWQ+sXwK3GpPQ==
X-CSE-MsgGUID: slUT6XlAQIuz27ODe8Ey/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="37850425"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="37850425"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 15:31:06 -0700
X-CSE-ConnectionGUID: WJcRpW/+ROyQbBypTzgszw==
X-CSE-MsgGUID: zfIM/6f7Rqmvvi5OOUTW4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="85439827"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jul 2024 15:31:05 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 31 Jul 2024 15:31:04 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 31 Jul 2024 15:31:03 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 31 Jul 2024 15:31:03 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.49) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 31 Jul 2024 15:31:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lv/y5Z586dmIWrmjct+6/qJ8eQUp0Y6Qvxqa+tNIhU+oJjGp3wA/aLEpYX2ZjBZbvTr9AfNSQ4uUSNX9qTGeplsFUtLW2U7j54WqN84opIwhbMGlPcoircxO/Sp4gI++Okqtc0FTooaBhFWuCLwAl8tFp0cwZ15StLbOVc28O8W/uu5e2ldVzNUzBguZE6n50DaeOA5h7DjsBpVjIYuzrSwCzTUTeNRE+jItY06i++tiVKIBNu4Og7Snl8NdHrCIh5Uejz48iBVLVDNVBoTL3KPRRZl3jNKOWgxO6Oaa2xwTt40i/7e9mAoevhRq/T9vxUrhnkjh8kMKIFwrsFqc0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7BZ/7GnQafJz4DsyBgSbToLaxJxK0L+vZqH6beI4xvs=;
 b=WugPLRFoHlxXDJVzgi0sR54vCbc2HgKp0Afx39QUOwa6sd2K1G0OcA1gR4JpzsSre/fwMz0fBNJmLS1Bx9t4CnAtqMn+OaPBnoyFR919JlFoWDyaoY3Hq5rgPPLpofIw7E9DWiKK3FHfFPDIAZDRINxCpvNTlY+RpkgEY7NxOTrmb7HEozyDel9reATJzgA3KDWGyNjARwX6RieHiXU3ii/XhgvIXkwCfhSotI8ZNjMs8QP7fr1lb2mKVc3dsx3pWDMphFqK/xRSzme0q+dRcLcPnwR4F6O7UUHigOmaW/b52Uth4mDr9Cke2tWJoXu1P2MkxL/UuwaoM+SXqZt+Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DS7PR11MB6128.namprd11.prod.outlook.com (2603:10b6:8:9c::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7807.29; Wed, 31 Jul 2024 22:31:01 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.7828.021; Wed, 31 Jul 2024
 22:31:01 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v4 3/3] drm/xe: Faster devcoredump
Thread-Topic: [PATCH v4 3/3] drm/xe: Faster devcoredump
Thread-Index: AQHa45EhrRr+t6/cKkK7aaQGfsNwFrIRaZlw
Date: Wed, 31 Jul 2024 22:31:01 +0000
Message-ID: <CH0PR11MB5444691DD3B93D99108A22C9E5B12@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240731213221.2523989-1-matthew.brost@intel.com>
 <20240731213221.2523989-4-matthew.brost@intel.com>
In-Reply-To: <20240731213221.2523989-4-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DS7PR11MB6128:EE_
x-ms-office365-filtering-correlation-id: 9ef95d86-75c2-45ba-4b8c-08dcb1b074c2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?GXi7MlPv6LU0HAL4F3XvKrmxH+256LwI1ZBKsB2uKbrYn6b013oSbRsP+jk0?=
 =?us-ascii?Q?MHaPMBDK/Ne9cTbQMkmmi73v+iO9o0x2EBXLrrjpWqNjVmor7fqzEKbCEYo4?=
 =?us-ascii?Q?6xeAenEkHIN1CLMbwplW2k/xqhBpeg+/k9Q7liws7ETYSLvV9NJS1WMpMw9c?=
 =?us-ascii?Q?Q8rauV5J8p4g0LVWGtXSwYWJ5Oj/c//v1Cg072RaYj3m6+QfmTiHtq+m7Fia?=
 =?us-ascii?Q?SlfLFQLSO8vnx2aBucjcpooU6IbsahqkWUF3WFErOX/1JkOUYcHqpzLQfMxM?=
 =?us-ascii?Q?o2JD7vNIanIvBAjiP17bBlAhyQ/ylvrnqbxtitS80hNXKRbl1cMMgQGUn3cl?=
 =?us-ascii?Q?4smmpL+IaV5eZ4Hl0nY4jNLn86VfyrAvxmydP+S9l0bmuAUpJd1/ppLkRNC+?=
 =?us-ascii?Q?SLIh5UAEgkwUsgeQP7fMR5VHqvcYdnTUtHcwb0iN4cXv3Q3xRNQW6b4Iatc9?=
 =?us-ascii?Q?BIpA0KzpEV0Yl9ntG/iHty1ZYDr0Lx+X2+Kstq9PI3qgRoYUGa+Ux1ZH2Q7x?=
 =?us-ascii?Q?BrWC3v394RdqKWpY0wRHfNqSde5g6ckgghMHZrqsQulHNK5YnMFWojtCpasb?=
 =?us-ascii?Q?GmOfXNWIivR86qCu2l9m9sR8FQOEJXRHGucFz7Ml1APFwyft5mz2KhxHhj0E?=
 =?us-ascii?Q?PRHBXvYLCTayrr9u+U7qRVx8ecL+jASQiupIio89JQ2f8XO88yu2GN3HBN1t?=
 =?us-ascii?Q?kwzB9syoz4aADhwQKrRpsd8kpbTXzwzDg/K3CXQaneq5a3X07HgdbCeVyUuV?=
 =?us-ascii?Q?klVj9v0NoEoqnzVfgrkpmB+5+I4Te+Yz3NH4Fqv12shKlcrF/zLYANASQr3h?=
 =?us-ascii?Q?7aN1EtMhE/PIRDPVGqAt+tXlwiT1277C6N1ydUsSiKQlif6CLRizTYD5BdXF?=
 =?us-ascii?Q?GgDVtDonHPU0mUY4sy5AzBE3e1KhskwsRfpV1HOX6ZEQMySaqnPnRdRVtSo5?=
 =?us-ascii?Q?t+24AiX0E8cF8ZDGkjDx9eL1eOT81QMYNosvbVHc4rhCeD0x0Cn8Cn6vPiqQ?=
 =?us-ascii?Q?sUQ1Kkck0qqI1H2g9uXRNTc3T9EOi5QjNwVelXLzont1xJn+sv21QP9gZihE?=
 =?us-ascii?Q?ytIkOppOz56PBfn5zA30rpBgzjnlBH6ULSRNeHBrHwMOWIUtNA6eqXexssvk?=
 =?us-ascii?Q?0ZC8rRbmg+DSCuu8gIFqbyCdiz6SKd4gRTBnOBCjrgyvlYRmrcrKi5wo6Meq?=
 =?us-ascii?Q?bhKYEJRI20EZSQNf92euWySR6dKKZMfKi76koTnTBhGcIUZt6c2g0XFQuP/+?=
 =?us-ascii?Q?DqWqSvO9QVeP+YYaI3hGVXuAx7mm53OGQyw/x4bE5flDynq9JGm9fmKVSaN6?=
 =?us-ascii?Q?r6LO50pH/NYP3zjy0rdr079rAF/k2aJB2gilXbuSUuUuXQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hOF6WHiEnwYT+t8Ec3vKcf6QXjvx15fXgpwsOLK8mucSwuWVvRWB0qRv65J8?=
 =?us-ascii?Q?XPIZ5iUPvyve8moixiBsiGemUFWyDb7FtmG8CoXUhobxpfL2mopBqT0kDvJh?=
 =?us-ascii?Q?UfnhbYkhcJ+iYOIhLSPvtzqG4W+Jba9YLU/r/0fE7GVBGifWCI+eJrdh5MoI?=
 =?us-ascii?Q?dafALgD/4C+jlo2uJgIMyxS7xwg9vVoBhikAGB+8Aun4adAtZQG23wdpfqs8?=
 =?us-ascii?Q?FyQn9X+OkUGn7c3X53J4BfRERj0wkBNZrIzI49XvKcGJ/itaWy6NynoFZmDE?=
 =?us-ascii?Q?92+eB2M+HhN5/+X1r8/AToKPamWAtHmHy9gVW08TgrPUjq/NRMiczBOL4mWM?=
 =?us-ascii?Q?jzoU2+oyruN1OxEgXmq6r/vtYia46LFDjnAraznjP4fJXLnRlnEneH8SgRab?=
 =?us-ascii?Q?P8iARw70ZBxO7vOvA9cCDrkSrHlagimciSxtXtNKyb4eQlFSLOocwBtyd5oN?=
 =?us-ascii?Q?pN6j08sO8Kdbf/7V8luKK60R9tHRnMR2X5t9z52CR4dq9o4CT6HUg/lg+0+P?=
 =?us-ascii?Q?wFQtyjd1hlkEdolKR5z8taZEZVFqx+alVtcjsSzSkhzodJ6NjVj3TYx6Kl71?=
 =?us-ascii?Q?f/YRt3wTVrkBO4rVUdhQlHcgUIqdNwPrbErAv2emzFV/et1YhloWjRai8tiq?=
 =?us-ascii?Q?A7m82yA5zNCQzVpSWWQJTu7RaCyyIw2G63WZ28ZVMbbueBVmOa0n2nh9OGsz?=
 =?us-ascii?Q?iQS35gBUvNtss7pXgabaez69aMu87cv2faeS2ZCtKSDgsDPPKzk+9xE5MKO1?=
 =?us-ascii?Q?D2+liU4LnJxQYdno/SNrg/Xh1Kn7pMxE0876QsZSAIfTumEgjjQeq+rvN16Z?=
 =?us-ascii?Q?HqP7RGkMGrTvW63uWvuB9pkxhkphuh1B07PjwGzAKZtylKgV6b0HpCrgz1XV?=
 =?us-ascii?Q?pX8sEwMjsr04oNOI+eEgvoA1zmTTy+MwctTg9b+vHoMQLrnqnEWF+PpRn1s8?=
 =?us-ascii?Q?phakqs/L+rGCfk8g50ZuJfiu6aSNHpWjdqNsG0K4mgM+fi47m1uyL54uXg6Z?=
 =?us-ascii?Q?YYm59ES2V0Oiq4cUi/o8ZRTy9K92zygAfv04ZBUCsPkmdQ0qWkfi8oju9PXU?=
 =?us-ascii?Q?5wPFyTZ2whJceRfN4kmd8pch231bOFbb5yeMKgE/8p/Dt+Ah9lf6BBFO95LZ?=
 =?us-ascii?Q?4sdiE4cLaLvmXysEmXVV8LDFBqSzndtwlkYnMdZ0u2ZQ9WjOBoFx1tcOLozS?=
 =?us-ascii?Q?CxHoC2p/lt71CH9dsgnn5MUn6e0wec/r2wsiw8eYt1IO5f/34T5rdtX6fcUx?=
 =?us-ascii?Q?KWUxzhzf0ppP62FB5RK6ZuMLLYaCyk+USv5PlFqXcsPovJCTb9zCn2BlYG7q?=
 =?us-ascii?Q?oeR+/KRRqCyueOTgmavhYooMfFpx4z9kfRobJaFIYYaL2dXsRMIkNP5rNHJJ?=
 =?us-ascii?Q?4r836u6CP69sK+vhFWjH81qNrUkVxNSj0kHzJ2TUKBcDyvPlbQsGjDb1Aa6p?=
 =?us-ascii?Q?YtrxKSbT8zcQ4YgvqwfB7FGt0uYMjq1zsJPkHdFxOwdr6hG1PrbTJNlEev4H?=
 =?us-ascii?Q?9bql5llVmeDsl/Ws4uZ2+Y+3SF5MnVHIV9p2HMKI4YQchyltfcWwwohJ+pa/?=
 =?us-ascii?Q?TbDhq9bnoHfrOS732yG7emTadxlhvlS2hY0L1cDV?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ef95d86-75c2-45ba-4b8c-08dcb1b074c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2024 22:31:01.0790 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9nzIjm1Ck9TbQL393/uEnSro1tMKjvXn2u7EfX6adktapN3fEEI4eygN33TRF/BhW+n6ARMBpRLxIiAR83OuW33bdRfdfpgnDDyXmjbrlMw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6128
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matthe=
w Brost
Sent: Wednesday, July 31, 2024 2:32 PM
To: intel-xe@lists.freedesktop.org; dri-devel@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com; Vivi, Rodrigo <rodrigo.vivi@intel.co=
m>
Subject: [PATCH v4 3/3] drm/xe: Faster devcoredump
>=20
> The current algorithm to read out devcoredump is O(N*N) where N is the
> size of coredump due to usage of the drm_coredump_printer in
> xe_devcoredump_read. Switch to a O(N) algorithm which prints the
> devcoredump into a readable format in snapshot work and update
> xe_devcoredump_read to memcpy from the readable format directly.
>=20
> v2:
>  - Fix double free on devcoredump removal (Testing)
>  - Set read_data_size after snap work flush
>  - Adjust remaining in iterator upon realloc (Testing)
>  - Set read_data upon realloc (Testing)
> v3:
>  - Kernel doc
>=20
> Reported-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2408
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_devcoredump.c       | 112 ++++++++++++++++------
>  drivers/gpu/drm/xe/xe_devcoredump_types.h |   4 +
>  2 files changed, 85 insertions(+), 31 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_=
devcoredump.c
> index d8d8ca2c19d3..b802a35c22f2 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -66,22 +66,9 @@ static struct xe_guc *exec_queue_to_guc(struct xe_exec=
_queue *q)
>  	return &q->gt->uc.guc;
>  }
> =20
> -static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
> -{
> -	struct xe_devcoredump_snapshot *ss =3D container_of(work, typeof(*ss), =
work);
> -
> -	/* keep going if fw fails as we still want to save the memory and SW da=
ta */
> -	if (xe_force_wake_get(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL))
> -		xe_gt_info(ss->gt, "failed to get forcewake for coredump capture\n");
> -	xe_vm_snapshot_capture_delayed(ss->vm);
> -	xe_guc_exec_queue_snapshot_capture_delayed(ss->ge);
> -	xe_force_wake_put(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL);
> -}
> -
> -static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
> -				   size_t count, void *data, size_t datalen)
> +static ssize_t __xe_devcoredump_read(char *buffer, size_t count,
> +				     struct xe_devcoredump *coredump)
>  {
> -	struct xe_devcoredump *coredump =3D data;
>  	struct xe_device *xe;
>  	struct xe_devcoredump_snapshot *ss;
>  	struct drm_printer p;
> @@ -89,18 +76,12 @@ static ssize_t xe_devcoredump_read(char *buffer, loff=
_t offset,
>  	struct timespec64 ts;
>  	int i;
> =20
> -	if (!coredump)
> -		return -ENODEV;
> -
>  	xe =3D coredump_to_xe(coredump);
>  	ss =3D &coredump->snapshot;
> =20
> -	/* Ensure delayed work is captured before continuing */
> -	flush_work(&ss->work);
> -
>  	iter.data =3D buffer;
>  	iter.offset =3D 0;
> -	iter.start =3D offset;
> +	iter.start =3D 0;
>  	iter.remain =3D count;
> =20
>  	p =3D drm_coredump_printer(&iter);
> @@ -131,13 +112,86 @@ static ssize_t xe_devcoredump_read(char *buffer, lo=
ff_t offset,
>  	drm_printf(&p, "\n**** VM state ****\n");
>  	xe_vm_snapshot_print(coredump->snapshot.vm, &p);
> =20
> -	return count - iter.remain;
> +	return iter.offset;
> +}
> +
> +static void xe_devcoredump_snapshot_free(struct xe_devcoredump_snapshot =
*ss)
> +{
> +	int i;
> +
> +	xe_guc_ct_snapshot_free(ss->ct);
> +	ss->ct =3D NULL;
> +
> +	xe_guc_exec_queue_snapshot_free(ss->ge);
> +	ss->ge =3D NULL;
> +
> +	xe_sched_job_snapshot_free(ss->job);
> +	ss->job =3D NULL;
> +
> +	for (i =3D 0; i < XE_NUM_HW_ENGINES; i++)
> +		if (ss->hwe[i]) {
> +			xe_hw_engine_snapshot_free(ss->hwe[i]);
> +			ss->hwe[i] =3D NULL;
> +		}
> +
> +	xe_vm_snapshot_free(ss->vm);
> +	ss->vm =3D NULL;
> +}
> +
> +static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
> +{
> +	struct xe_devcoredump_snapshot *ss =3D container_of(work, typeof(*ss), =
work);
> +	struct xe_devcoredump *coredump =3D container_of(ss, typeof(*coredump),=
 snapshot);
> +
> +	/* keep going if fw fails as we still want to save the memory and SW da=
ta */
> +	if (xe_force_wake_get(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL))
> +		xe_gt_info(ss->gt, "failed to get forcewake for coredump capture\n");
> +	xe_vm_snapshot_capture_delayed(ss->vm);
> +	xe_guc_exec_queue_snapshot_capture_delayed(ss->ge);
> +	xe_force_wake_put(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL);
> +
> +	/* Calculate devcoredump size */
> +	ss->read_data_size =3D __xe_devcoredump_read(NULL, INT_MAX, coredump);
> +
> +	ss->read_data =3D kvmalloc(ss->read_data_size, GFP_USER);
> +	if (!ss->read_data)
> +		return;
> +
> +	__xe_devcoredump_read(ss->read_data, ss->read_data_size, coredump);
> +	xe_devcoredump_snapshot_free(ss);
> +}
> +
> +static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
> +				   size_t count, void *data, size_t datalen)
> +{
> +	struct xe_devcoredump *coredump =3D data;
> +	struct xe_devcoredump_snapshot *ss;
> +	ssize_t byte_copied;
> +
> +	if (!coredump)
> +		return -ENODEV;
> +
> +	ss =3D &coredump->snapshot;
> +
> +	/* Ensure delayed work is captured before continuing */
> +	flush_work(&ss->work);
> +
> +	if (!ss->read_data)
> +		return -ENODEV;
> +
> +	if (offset >=3D ss->read_data_size)
> +		return 0;
> +
> +	byte_copied =3D count < ss->read_data_size - offset ? count :
> +		ss->read_data_size - offset;
> +	memcpy(buffer, ss->read_data + offset, byte_copied);
> +
> +	return byte_copied;
>  }
> =20
>  static void xe_devcoredump_free(void *data)
>  {
>  	struct xe_devcoredump *coredump =3D data;
> -	int i;
> =20
>  	/* Our device is gone. Nothing to do... */
>  	if (!data || !coredump_to_xe(coredump))
> @@ -145,13 +199,8 @@ static void xe_devcoredump_free(void *data)
> =20
>  	cancel_work_sync(&coredump->snapshot.work);
> =20
> -	xe_guc_ct_snapshot_free(coredump->snapshot.ct);
> -	xe_guc_exec_queue_snapshot_free(coredump->snapshot.ge);
> -	xe_sched_job_snapshot_free(coredump->snapshot.job);
> -	for (i =3D 0; i < XE_NUM_HW_ENGINES; i++)
> -		if (coredump->snapshot.hwe[i])
> -			xe_hw_engine_snapshot_free(coredump->snapshot.hwe[i]);
> -	xe_vm_snapshot_free(coredump->snapshot.vm);
> +	xe_devcoredump_snapshot_free(&coredump->snapshot);
> +	kvfree(coredump->snapshot.read_data);
> =20
>  	/* To prevent stale data on next snapshot, clear everything */
>  	memset(&coredump->snapshot, 0, sizeof(coredump->snapshot));
> @@ -260,4 +309,5 @@ int xe_devcoredump_init(struct xe_device *xe)
>  {
>  	return devm_add_action_or_reset(xe->drm.dev, xe_driver_devcoredump_fini=
, &xe->drm);
>  }
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/=
xe/xe_devcoredump_types.h
> index 923cdf72a816..0298037edae4 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
> +++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> @@ -46,6 +46,10 @@ struct xe_devcoredump_snapshot {
>  	struct xe_sched_job_snapshot *job;
>  	/** @vm: Snapshot of VM state */
>  	struct xe_vm_snapshot *vm;
> +	/** @read_data_size: size of read data */
> +	ssize_t read_data_size;
> +	/** @read_data: Read data */
> +	void *read_data;

Perhaps the data size and read data can be stapled together under the same
struct?

struct {
	ssize_t size;
	void *data;
} read_data;

It's not that big of a deal if this is untouched, just something to conside=
r.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

>  };
> =20
>  /**
> --=20
> 2.34.1
>=20
>=20
