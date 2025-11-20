Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0BBC76382
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 21:43:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8494F10E06D;
	Thu, 20 Nov 2025 20:43:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pj2Xvo/5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8913B10E06D;
 Thu, 20 Nov 2025 20:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763671384; x=1795207384;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rbAcZgi6ZOqX0fpNYLC6rwKCFGLPH2UzDSoHe0Tq8ms=;
 b=Pj2Xvo/5+Sl/H/E3bi4umzP2X8KUPzgSouQgoVJN0ziqB6CsvAs39BgC
 wAiKIDZ2L1jqPU+UEKpOVt17sqUNpE4qVN9nWgoQOFHsShDKBQzb89X0M
 /9U1XPE+U2xVWRijyWTKjXyyYXYcWjLHyOTCC7lKWO6z+oeiv5ixgRBe+
 Hfz5zGWT+PiITtR0LC0B98pDgFprLtvDRJSsVtB24/LQnDBE72K/L7o5o
 Mc4L6Ofc1hwAAPXrQZGRhgN0H2Z7fAknrq8LUKn0KtC3pzmpV4W7xbaEh
 Nd4hedEmh4IfbB46Ru141pG6l8IgU6QPNdL25geu7bPZwUl84Odrac98A A==;
X-CSE-ConnectionGUID: obMnGg0MTLmRYq0xidPaPg==
X-CSE-MsgGUID: ExFNMf/JTUuFXmQj4bxWdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65794882"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="65794882"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 12:43:04 -0800
X-CSE-ConnectionGUID: dYpTvB5gQU6WROTHp1q+Cg==
X-CSE-MsgGUID: LMYbasC3Q+md2BH7rMDkAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="191293019"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 12:43:04 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 12:43:03 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 20 Nov 2025 12:43:03 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.20) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 12:43:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EVWqK/2ABDb/2GRMi4yCm9xsIFr5FIMvZruaiEdqaSWC69a1KDKx96AaBFiVvmCyWObCUbbZ8HbxS/KHS3eXfpVy7Gb/4FHyU7ITgqH8iQKxR4ksLjQ9tEeCwmAq/WK/KhjNoMx6g0llSJZIvf9Yor2OTvbBUmLfhwDSAtHJDD9JS/v2kQkbAChlKLY+usm0sUQAKhAZQ7OlzlNC3TqN/CGqthYmOaC8/KbBXIwDd6fZf+9mYGrPXlZ7d200K/BvhYzdSDg9xo8fY0mM95MPAdDVHU7HjjMTanLyGNVVuJT8pmOwbdQEnTR3bJrr/q2cpXqAHliPq/N5ttg7tUYveQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cJTeYLEejcX2+OO373d8FQSdORxI61vykiVpRCQoDtk=;
 b=CnnTYn/PqGXUibjslu44V6UbYdn1ehhn+rYAYm/GIemkEMMmzqaMKq1qvSLWsGRmLD6VAF6ypGPhjGdLjrM1lMM5bS93FSoKvCHOJt0o+GvRQutDyqjwq7wCCevc3rUyAlwUpSSQkz7eTD8VjJJecy6rVwRuNPo97SxIuwXNem9X+9zqMRMkh6bu8fxftrdjQdZStG14ASKcuu8YIIHuogKravqU7GStKiRvsJw8oS4PkT26D9HGwr3EuZwNSJcsSxB7dNejjyl5sGz9qQiKi4VImuuAlhEceqU93cm4iNx8X3YBKHbKMXtQ4txBvwGet8B7SXo3Hj1eoKBjjsTX/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Thu, 20 Nov
 2025 20:42:57 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e%5]) with mapi id 15.20.9343.011; Thu, 20 Nov 2025
 20:42:57 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Gupta, 
 saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex" <alex.zuo@intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>, "Zhang,
 Jianxun" <jianxun.zhang@intel.com>, "Lin, Shuicheng"
 <shuicheng.lin@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>, "Mrozek, Michal" <michal.mrozek@intel.com>,
 "Jadav, Raag" <raag.jadav@intel.com>, "Briano, Ivan" <ivan.briano@intel.com>, 
 "Auld, Matthew" <matthew.auld@intel.com>, "Hirschfeld, Dafna"
 <dafna.hirschfeld@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v26 1/4] drm/xe/xe_pagefault: Disallow writes to read-only
 VMAs
Thread-Topic: [PATCH v26 1/4] drm/xe/xe_pagefault: Disallow writes to
 read-only VMAs
Thread-Index: AQHcWY40qg0yA28TA02V3rzkTq73ZbT71AgAgAA0+QA=
Date: Thu, 20 Nov 2025 20:42:57 +0000
Message-ID: <CH0PR11MB54445BE0DC9C6590C68A5A2DE5D4A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20251119195322.86585-6-jonathan.cavitt@intel.com>
 <20251119195322.86585-7-jonathan.cavitt@intel.com>
 <aR9QjgvKcmKPhB3u@lstrano-desk.jf.intel.com>
In-Reply-To: <aR9QjgvKcmKPhB3u@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|IA1PR11MB7198:EE_
x-ms-office365-filtering-correlation-id: d41fea4b-5261-4b63-d5a9-08de28756376
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?+Zfe0TQsjIKMG5bQq4B7+lHu8GlG/CsK0Kv31NhBJBYU86JLBIAn13TkWXBp?=
 =?us-ascii?Q?0uD+ffEHW0UaItrXmJdN7i3e6AVM0Z9Kxmmoal7kpJxJ4mbStG86Q4TIp6f4?=
 =?us-ascii?Q?0C2JiGHHp+HjfXRSNKN/6HG6MipXz4dOEMcaFEaiIslTsDFhEre6tTJ6CAwy?=
 =?us-ascii?Q?Vgpo9AlX5NBbJFFYsg8j16ccNH+p/N7gRQ13RPwK9trkwBEBoLiNRDHHOb7S?=
 =?us-ascii?Q?icWBhn3Jr25w2tz0aZkSqnC9HwOIL5JNGOoTETCzG3oXKoqQgdxseHN7sLb9?=
 =?us-ascii?Q?L/arzUcVt5pp3sCfNh3OXZcVjATeVljvKIFzOSEfuCx4FOiozCMk952ooB/I?=
 =?us-ascii?Q?7pAp5UoRd/b4hFu+nWt5O1SGdcDCVoNhHhZgYEw6CIL5xDYxK5s8OEwUOKIa?=
 =?us-ascii?Q?oDvlsSnvsB9Vd95HILZy4FMNbbtTFWvp2oKRdnT2gXhMhY0bQ4S2fWMB+h4p?=
 =?us-ascii?Q?/osfA1h1vRToMBEhcTE4qVhfpnLmcLraXGbUtaZxJE8H7pv2t7FzDr/Iup3h?=
 =?us-ascii?Q?5BObCMEwG7sNsKFVqyYSCMexZ8wsHo3kyaS5+wcQlR4pfm8ucVBQPZJ/5B9C?=
 =?us-ascii?Q?HDOqeW1UnZcD9jaX1ylViV5jdNv88ePVB1ERkwxEYfZJMexFUycKe228KOPt?=
 =?us-ascii?Q?GxJ8EjiFXpdRvUjVSbXRi2lVvg0+X85m51EKhIRulN/A+C85mnDzQyU4WorT?=
 =?us-ascii?Q?Ua+FaBHqHgeGLid0Adm9txnb5RMnDqglVNN7RM/42WKWW+LNCKYAm6Co9Q8r?=
 =?us-ascii?Q?0HxCCqmeXFBVdAALR+subkHwLzt9Nqw9NotnTQBOXB7dMrQ5BNY2sl2eD+Xw?=
 =?us-ascii?Q?rJJGkgL44QsEJ7f0iBjk0ZFxknFlTDpMCttE5Vup3i7FRNzkidrcFrAn3iQr?=
 =?us-ascii?Q?74WGwfGFmAUEGMq+GUsQJMUaj0mik8SofF6PD9s6eORc0RloNNL+M6U/f+KL?=
 =?us-ascii?Q?BKCh3i78bwuy5VFMkIqsiNs5At/eUrzRpZn6SWNpmewgSiRjni4c3h6z7zUC?=
 =?us-ascii?Q?bdy/bMZJaJmsWNDu5u9vz+4F7EdcCMIEhre2vGaqG5i9j+JgX0wlKVd+3Vwp?=
 =?us-ascii?Q?k0/KZvJEMklAPTHc8L3SWbvfXiT11lBq7khwX4U6GAMWodpxfyCk0mBb5PjT?=
 =?us-ascii?Q?8a/SzMqwZVhicokVfhD5lqgTo8G/xqZL23d2htpGriX3xnkBNcawbFYtF3YR?=
 =?us-ascii?Q?d3oQaDL5Y4wa5yGfEEZgYkBZ/tkYkYjj92nVCS9bKowMkRU0Zc0duA5TvFC7?=
 =?us-ascii?Q?IdkvKu0YWvMVV0x7u6Aqhwqd0shJ4cj0kSOh7FvQQm+EA8Pc/0InYpydhuSq?=
 =?us-ascii?Q?aqck/61pMa+Z2aJazWdMWvDPr4rErQz7SVDFGH1zsiMtSmDPkT2nDvMhxQTC?=
 =?us-ascii?Q?qKBNCyQqjoRNn5Pr2IkPmqaqjFVocWENExzV6BL1sgi6SMwo5d6Ks0rT75cY?=
 =?us-ascii?Q?KzDp2fdvLy/934w4Eccw2Gsp2Oznq70lwgQo8ZoVhGRv2FKD/xGbRQgGmKzR?=
 =?us-ascii?Q?931Kic7Jnf3Vrp0plIVJ23+KdZ4G5iGwPBU4?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9gzVuXVqJrvSAKb6u/4kfC1y+2msn+3rLeIfBjqZ/xExaY5yG+I3g4hizi92?=
 =?us-ascii?Q?KKYvoKfUid4dFidTjQaa4m2CrTMrtsQL4k5i3t0o70p0AbleCDMW8kDNaBYP?=
 =?us-ascii?Q?CyU1N/PPsHRx8SWGPdQ58mtzDBzh4E0BfKqi347h4AxOaF+Za6pRaW1+1c4T?=
 =?us-ascii?Q?3wTrs6ku28gy05Ofbqi3fbRnD6gYlu9EOrVD0Pc9dBCM/OxCZimlCke18m2k?=
 =?us-ascii?Q?e4K2ia6X0kSrQ0zewADBQHi9CUKM+av4QgaiVN69+eE8kJCN+sHFA4NtLTLc?=
 =?us-ascii?Q?8baRalbIz2pv/F/TTNZzYKgdAcOR+2E6kfZWjfEQ5T6hkjC4C2KJZ7dQ4gHH?=
 =?us-ascii?Q?tRFAZ8K+oAsYXirsfcgE7CeRMysN8ZdJUdnv0XadyyyZK4PKh+/6d1ZBVVUt?=
 =?us-ascii?Q?QDY+r6NHYioC4bA5HfyT0VG2A7qO7EqO58XzMpLnRmAIa3eG+umg7rSxNoWq?=
 =?us-ascii?Q?sFFGWHnla7fEI22Ncs6ze31Y+m+zfxStOzr1ghvJVkxbajO59eqdK22rDF16?=
 =?us-ascii?Q?2v06du0I7fWkB4vOPeiaJcSYwL1FLEjGaouSe9Yl4xrK8nKzHuUOzD9TjL+C?=
 =?us-ascii?Q?0GEO0nsHMDdmSyfCcBtlEVUy6lC7+W6ITebGgcioryGRQyOZ7KJmBWu0k6aB?=
 =?us-ascii?Q?0NWOHSlVuyeHmG1pRgN/jv1V3WYzapqouVMpsUqiXPhyRoNq7AozHe82TyYh?=
 =?us-ascii?Q?JJP5aYxBxVPH4g8Us/1BIy+yg8VI5Z4u2iM+8hK8B4hch03/4CMnPILJyR0v?=
 =?us-ascii?Q?WTZG04qvV8Y5ABXOhx5zbkG3v/HokWXQQCC/ep/EZWt3D3gKhmBiSxqIwfEN?=
 =?us-ascii?Q?x7+qW9YzsSAeRA2hnvIPn+GTXEdcvEnq6TsFtFfce+u58ACueC/XVZLXUCoL?=
 =?us-ascii?Q?4kRF0Dvr+8fijLfbCRXNG0qUbjQH4LM2+JKSX4wUot1Hsw1ie4n81TWmvzCu?=
 =?us-ascii?Q?ZxpPG0v8krJVFl7q/7Ht/yHpDUOC1vxEqbtU0I5cD3vr68JbBNhX/7bOWu4i?=
 =?us-ascii?Q?k98imVm/z3m26kpEAnOcBnxq1CZDtD/oodlKzA9FXF/RSkrQJGnCy+ch+xg2?=
 =?us-ascii?Q?vDWR1D7ddATyYvSJQS7duxxcUBC9xwSXKTft22vPfkedH/69wb7Rn7TNy4H0?=
 =?us-ascii?Q?C0OSsTJPKhRhdbm5NjfrRLLXrcTIiwS4BFHvZM2c39GYOHLmuXNHn2itDVNZ?=
 =?us-ascii?Q?nAc7rIhT61Tqp0ih5nQo0+TQmCdyWr7yxxWuiHEldlRu/kOYsCPjW9wjPwL2?=
 =?us-ascii?Q?jQF+2XA8eJaMYYMgr4jaqim4Eb4PfCGElD6G1PR7RZr7/WIwCZ9bKgx0nVP8?=
 =?us-ascii?Q?VoElWOLi2wdp0nVd+jKg/EiyrL5OzmOe1Zimn5GtCVFlw5YEZJnqGtUwzh5M?=
 =?us-ascii?Q?xhkfxX+4mgBrvwpKyb3puqcq6BoVyU/rfZTQK0RPHN4UwvJ7h9O39bR+B2r2?=
 =?us-ascii?Q?etOJ7tgduz34JGHVHDMJ0QrpvzHteJHf+cM6EIofBlQrdzNBdY1il930/kFL?=
 =?us-ascii?Q?Q5e6ji8zxoibNFXqYiR4D9sCng39kjg/RfqgUUmrSzztY00dn/NJspVnVeu+?=
 =?us-ascii?Q?q6+BVb7DF81ip3NWOXwh5/eV14EcnLmNDWhl6Eta?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d41fea4b-5261-4b63-d5a9-08de28756376
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2025 20:42:57.7945 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Bbt69/nQ0IP4rJL8DAKOCn7ly1TKffJfJNLWRg21e4P4PUKbLXhjnFVCECZ9MnsBmbv7qqOlIIoOo4awG+ZBB1LG7mHCxMd3PxS7I+UhrvM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7198
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
From: Brost, Matthew <matthew.brost@intel.com>=20
Sent: Thursday, November 20, 2025 9:32 AM
To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org; Gupta, saurabhg <saurabhg.gupta@intel.c=
om>; Zuo, Alex <alex.zuo@intel.com>; joonas.lahtinen@linux.intel.com; Zhang=
, Jianxun <jianxun.zhang@intel.com>; Lin, Shuicheng <shuicheng.lin@intel.co=
m>; dri-devel@lists.freedesktop.org; Wajdeczko, Michal <Michal.Wajdeczko@in=
tel.com>; Mrozek, Michal <michal.mrozek@intel.com>; Jadav, Raag <raag.jadav=
@intel.com>; john.c.harrison@intel.com; Briano, Ivan <ivan.briano@intel.com=
>; Auld, Matthew <matthew.auld@intel.com>; Hirschfeld, Dafna <dafna.hirschf=
eld@intel.com>
Subject: Re: [PATCH v26 1/4] drm/xe/xe_pagefault: Disallow writes to read-o=
nly VMAs
>=20
> On Wed, Nov 19, 2025 at 07:53:24PM +0000, Jonathan Cavitt wrote:
> > The page fault handler should reject write/atomic access to read only
> > VMAs.  Add code to handle this in xe_pagefault_service after the VMA
> > lookup.
> >=20
> > Fixes: fb544b844508 ("drm/xe: Implement xe_pagefault_queue_work")
> > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > Suggested-by: Matthew Brost <matthew.brost@intel.com>
> > Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_pagefault.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_=
pagefault.c
> > index fe3e40145012..836c39010f02 100644
> > --- a/drivers/gpu/drm/xe/xe_pagefault.c
> > +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> > @@ -188,6 +188,11 @@ static int xe_pagefault_service(struct xe_pagefaul=
t *pf)
> >  		goto unlock_vm;
> >  	}
> > =20
> > +	if (xe_vma_read_only(vma) && pf->consumer.access_type !=3D XE_PAGEFAU=
LT_ACCESS_TYPE_READ) {
>=20
> Nit: Prefer 80 characters per line if possible and doesn't made the code
> super ugly. That really is a personal preference but all code I author
> (this file) tries to do this, so prefer to keep that way.
>=20
> Either way:
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>

Thank you for your review!  Applying the requested NIT should be simple eno=
ugh,
though I plan on waiting for more revision notes on the rest of the series =
before applying
this change.  Thank you for your patience.
-Jonathan Cavitt

>=20
> > +		err =3D -EPERM;
> > +		goto unlock_vm;
> > +	}
> > +
> >  	atomic =3D xe_pagefault_access_is_atomic(pf->consumer.access_type);
> > =20
> >  	if (xe_vma_is_cpu_addr_mirror(vma))
> > --=20
> > 2.43.0
> >=20
>=20
