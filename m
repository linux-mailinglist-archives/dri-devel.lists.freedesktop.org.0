Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4014BD1761D
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 09:51:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6874810E479;
	Tue, 13 Jan 2026 08:51:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="msmrIFvS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2C6E10E475;
 Tue, 13 Jan 2026 08:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768294279; x=1799830279;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GIiH1jnOhOpoHjngF9gja9Tt31SyiixzFf5TxV7Cue8=;
 b=msmrIFvSFP+N6MpgmrwbdMfLyNlnT/GL6TtGJdH8vfL3sgq+JS1p5dla
 D25VU/QO3nhVBToIGQq50upqi7R9jQvz9ZF8a89BYiJQhIUk6chtAYcjk
 Quz/lxmhlzeX3SRLhlmE2/BdYz+53mzUiWFXsCKeuQIUrNwGthgk8toRd
 7MSkJR65z0IjXx+BVV9vwMcl27ugSye2z4AeMDAp3m8A+oNuKDmjfU03L
 lpSbMjK7oI9NOi0LCrhY49n8D5FqI/uXTuJM84d2rOqrbpGSMf1nssVAb
 9y2fcAgQdzoodjpkEexnBtZote5SHJx0w0J52kqUAI+Kn5A1k6uFR9yZz Q==;
X-CSE-ConnectionGUID: SNiJxJaLRROwmxZMAKEooA==
X-CSE-MsgGUID: +iUHa5FcTqW+az4JVYlurw==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69734343"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="69734343"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 00:51:18 -0800
X-CSE-ConnectionGUID: sz2+T8chS/awc3eRX/TWMg==
X-CSE-MsgGUID: J5qSBpDDTO6UFhlka6/jmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="204226728"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 00:51:18 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 00:51:17 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 13 Jan 2026 00:51:17 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.26) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 00:51:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SMG7pmu00IHsfzs5I+2w4ML6M9t5bXqpdVRcwjGDXhO20y4p+TFf12ZtgtCMe/cNbwoo7aof7Ub7ZpKBGhncs5KFE7Tj/aOmfGjUlf4x2BfaPZ8mW0puxNJCF3gWqOOD2zi67bXq5q4g/qLxk/pX95TxK7+RuBrVMcvY46At7Afjojf0aT86Ab+k3PydgnP8U447YKQG6x5Yo8rDWiG9OxlfAwUxl5Ew3GjSzYglSauHyJxIMpgBKe2eVUEv52FcIjUg0uu2qfagKKBgXww+5QlXt8Aab8zyPDDrSSfL8yEX6ENnfZ/thPd/p5sTi9v3lDEjM7wGAz0n4k37FM+RBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GIiH1jnOhOpoHjngF9gja9Tt31SyiixzFf5TxV7Cue8=;
 b=WdKAatlQzphX7IyLY9DyOoRiAc+8iE/SA4xNTuQCufQzLhOAZ6z1+K3DLk7pqrX6GUhk2oOapYMwRHPrPdgeW+MIMZZuBxpiYmNCvmFugErq463UUMwMFBpphQoplWl4DCTUP0rFxdvtRo9FOT8+YlRlHHRlifN6VrEgnwddJZ4jYElYdzJiZCmH/8fxoqx486C3OLaVxL/mo2jDUceAAr5Zoa0FiA9gixYaQ0kzWa25gLZ7J1LlFAawHdxNSdvhFNsqntZKspG+Cfwua+S9jb3oMinM5aiYNLC1zIM+dRCFhKNW4G4k/DJOo73JILn9VXMvjKuVipNCaUlyU5FeZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV3PR11MB8768.namprd11.prod.outlook.com (2603:10b6:408:211::19)
 by CH3PR11MB8342.namprd11.prod.outlook.com (2603:10b6:610:167::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 08:51:15 +0000
Received: from LV3PR11MB8768.namprd11.prod.outlook.com
 ([fe80::154a:b33e:71c0:2308]) by LV3PR11MB8768.namprd11.prod.outlook.com
 ([fe80::154a:b33e:71c0:2308%6]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 08:51:15 +0000
From: "Kumar, Kaushlendra" <kaushlendra.kumar@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "joonas.lahtinen@linux.intel.com"
 <joonas.lahtinen@linux.intel.com>, "tursulin@ursulin.net"
 <tursulin@ursulin.net>, "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>
CC: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH] drm/i915/bios: Use get_unaligned_* for VBT block size
Thread-Topic: [PATCH] drm/i915/bios: Use get_unaligned_* for VBT block size
Thread-Index: AQHchGjDnt+Oek37DEODcvae/yj0HrVPypXw
Date: Tue, 13 Jan 2026 08:51:15 +0000
Message-ID: <LV3PR11MB8768CCEC44F65999ABC8DA82F58EA@LV3PR11MB8768.namprd11.prod.outlook.com>
References: <20260113031210.330128-1-kaushlendra.kumar@intel.com>
 <a15f6e8a6ab43f2dbaa2b33c606ee001f6ed38cd@intel.com>
In-Reply-To: <a15f6e8a6ab43f2dbaa2b33c606ee001f6ed38cd@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR11MB8768:EE_|CH3PR11MB8342:EE_
x-ms-office365-filtering-correlation-id: 564bbf32-20dd-478e-2ab7-08de5280e917
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?LHxPfAA2Qii33/N1yfBgbodQQXQry+xqBhZNUysmRqBBWwdHbGpcar4d3tpP?=
 =?us-ascii?Q?6ZeST2bOZO0Ph+lVjI/IAJF2cWWkBKc/PgLUIjvls5akTVadku0StyuoQSxB?=
 =?us-ascii?Q?ae/4yQ/N8Rqn1/aorKxUl+RCSYHNCgh1j1HVWQXmDiAz69jrxGGeJr2uSZyj?=
 =?us-ascii?Q?EkhD76UE3jV004srM9DUm/aZw4x1Jat0C2OeKFjrMzFqM+OL0VQIP9ZC77gg?=
 =?us-ascii?Q?kl95Dbd8KtEE9nx3D45cdVGzk5Q1BWC3Tz6doYv8goCUZATixgey8KXoT4mB?=
 =?us-ascii?Q?WQJDckP6E2RsQlEs6Yr+jXvCh27pEKrjyLwztZlTuNPyapC/PpMVLDZGlgaL?=
 =?us-ascii?Q?0osYiZ2LJ16SLVG3SMId0CPIibhYbxjaGR6tSECNUBLxnTuia4fGrWaDMhry?=
 =?us-ascii?Q?ixwH2bnoyP8Uj59Nlv4FIXGD4shOOLyid3Iz2+9Qdi1QAAqsAXJJsNoWciQm?=
 =?us-ascii?Q?DDArCT9r4Vll+fkJ2s5MWk8rAi2ZPwh4ou4gRkNc8nRpQSMcSjZgxFUxAEaP?=
 =?us-ascii?Q?ni8qJ1K/+ulkQqb97tjaWTFmjBDXPOZcuvlGf9oD2pckQ/E4Cbql60SovYiE?=
 =?us-ascii?Q?Q/zCezmBnIKQYA+1ectEqrBLrMIZMtXbUl47iyNUzHit9n/gVH6rm467S1dz?=
 =?us-ascii?Q?vv8tMxfp6YB+DHN0HL5Cfzc0GlGEZ7alQd+8EWNvcEi6R7sp6sX4Ygqw06OR?=
 =?us-ascii?Q?6dQ6nKi83WXEuMrzUgATVm22euDnMzB0akdNMdSvmydNaeQeBID1MtMXB5Dn?=
 =?us-ascii?Q?f/9iWUv0fWZQeLjH/9ws99rkjukpxhddMKrJ2GG9TrKygSsnakPrnO8144vT?=
 =?us-ascii?Q?aVqoGTnfX/zl8DxlQWADqkFcQnkS0reGY5B1uSs1spaUOeap8i2vC9AMdbmx?=
 =?us-ascii?Q?cbxAyHIfmkyTCA6p7lpQUtTXZzkc0gYBxHm22WTQA6TF4fbyjpDGiVGAd6JZ?=
 =?us-ascii?Q?I1n5E+zPGFJgWyVH/fmhT3V3A86G+0aqG3BVARxFAWN7WXeRIlSBedCywbLI?=
 =?us-ascii?Q?Tam5LbtWqhtYmGtKHaabp42pWNEyh/N8AHl7uPjfKhXExFvGCasP95syUSoR?=
 =?us-ascii?Q?rT/mWsX7pXfZc9bB1h5rknV0cMUqV5R1sCIKi9AGEH+0zxFyRkDD3vEKXSBJ?=
 =?us-ascii?Q?AHi6FjW6R3rqNvYJsIMQvI6/gyuGZ4+nog+euWnq/oFD6MPC8fCy8R2/LJZa?=
 =?us-ascii?Q?iyd+1t6ZM6+j0SK2Vy+71gpczMrgDdZzBk8kUzyhX3XZ0Vbbfib0bweF3GLy?=
 =?us-ascii?Q?8BW2DscL5Z1PEz9pIr/nyA2P16O9qwJwUf6IGlezVItMVPOImNHtJUqO5+mI?=
 =?us-ascii?Q?lJFuPiUdJHAo8K+Kn0rkxjbqeBM/nbLWZToVD85IxjcuozhtJZY+evijerBY?=
 =?us-ascii?Q?zPQqxM2XONyTllNnh/80tkGQkYhOayBdJVRFf17kRUnGuLxnvCgcwhiHAtfw?=
 =?us-ascii?Q?5gSIY1/Fw/JddRRv6PNQVn4hfD6IF7wQBxFlaT+Pgpjz2NaDKG55moU5T/HH?=
 =?us-ascii?Q?a1ZkQNI9RMn43oFNT6Fi9mVx8A9l77agsSia?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8768.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?OLbO67MHIS7CL3VWjvXhkaNfahXdbSJDfabzvYj6hQ0l5GMd3vn837jfmIE6?=
 =?us-ascii?Q?Zt3xgy0w/q4PXwszyHRNft8aFomVAjIqCjQTBcuCEW01JT/wO0GhjHxBFM1I?=
 =?us-ascii?Q?FtjOo5OvDCYIu8PghqCCxsGp4cdCaRjF1totxtBE7ET1s0Bi4TbaKCqcGemb?=
 =?us-ascii?Q?T4pwtE0J7RsJceLcx5berR05VkFYmkJd0Hwv2yEEHw/oaMzUfZY6BiSDoz3h?=
 =?us-ascii?Q?Er69JcoiQz/TW/CDVquti5uSRcvEuiG4qlHVjhbPvEDd4O2WQN/wNXERkSf5?=
 =?us-ascii?Q?CjQxqGo+nnLqxxgkRL8U4WxusEPtpzm0oYUhFiQR2aAoSIELsxIp/Upz5viL?=
 =?us-ascii?Q?Lq0KLB7kYN7o26DY/5jDnFT06+Ji7N4/gC5LGALlCuxa0P66Bc5LoPs04OBN?=
 =?us-ascii?Q?6ExZ+izTOqnllq/kNHWE+ur3CyTVtNP2QYwIAITiab+lHiLNadxZdETTQ84r?=
 =?us-ascii?Q?q0yY6OwpLjfdpEgoPaw0T4l6nbroa49iu24eCH47qJjFpmA+FY18djMtpvAR?=
 =?us-ascii?Q?anXwxsoTwYn19N0wvye2mrEHBmQpJipsSi7AR7aSW653nq5b6b6N33SCnP3P?=
 =?us-ascii?Q?YJfDoAKmj+gycKdaI0HvMEYUuicrekP3AUdsnVims2TrLLJ9VgbUnhpbaz67?=
 =?us-ascii?Q?JwSb+QZ3n/Afco6vC/zejT6OKn2ZlbEFFP0iBsoPklwFSGhgDgHlmiAxxAof?=
 =?us-ascii?Q?aYqhL23daGTvXHDay+/VhIKSfea+nsCZugWQP70ecUvGemMTjLnqPZ6Il3te?=
 =?us-ascii?Q?EQ3VenmNR6k4GkqJe4a0IGdGoBorN1veO4ls8CFGtSBlFbggUAyJYkwh1hea?=
 =?us-ascii?Q?XvkwQrLSvv2m/GM+tjiAbjuYNlgDkYH5Tn8dIzGzKVUBy/smnHPKSsfecUTB?=
 =?us-ascii?Q?UdjimJM8+D/1S7YHr93x04971YZtBiXltENl2sUDrZwvbloxrEpIs7fJEIA4?=
 =?us-ascii?Q?n4Q2MBXtR38ndR5VB+zt/neY3Ag2egz0cAkuEnIiblnhWuC6+MZ8GBZHwLgj?=
 =?us-ascii?Q?mVqC06Nge/zF8MOtYchQ6wj3FaH98XQueXe/gnrsv4JmV2la8dPO1yBDv/jR?=
 =?us-ascii?Q?fc17f+n+oXrunqJdzj/wNUnNM5sQxxDlRBycXEwUYC3qkA55Z0Dinv5dJLRr?=
 =?us-ascii?Q?L14oIp8Yei+UJkAiExt9+9J1rDP2MjOKORksOzMrdinOSuzZ/G6oB02w3Mio?=
 =?us-ascii?Q?bEj+Wk4UNCncOz4yHYZZXPreJre3G8Csx3HWZDyE5l14AhoFcPIceJSlGzva?=
 =?us-ascii?Q?jDEAvabbRAdk3TdB+pbCb5RsCZIyL+xOpz7dQe4fpeKEwavpWHo9SWr0tKba?=
 =?us-ascii?Q?2WR/GekWoB5pd3NNEOJrpm16AxRSn8NzVrVp+IjQ2ZPu1M5a9UJei3nHY+7m?=
 =?us-ascii?Q?nTagIo+ENKkDyRWZStErSHKZUvLHnfKLwi9ZPAvanOyqTvuWFpGy5goVD0gJ?=
 =?us-ascii?Q?gKHuzHxtH2LayT+WThyz/vgCC+1imZHTmOcNgq0yDB0rkfiNjia/VgIIPlry?=
 =?us-ascii?Q?hsT94bakZa8eKbXqIBHPuJSjUEBj026z6Ke5XZuWW/2fA9iXPjnM8cVjq6v6?=
 =?us-ascii?Q?JC8rfqRqcabi3109pDTHN3FB81k7xLY+gbYTJisUbHICXMBBHDUyQA8esTTG?=
 =?us-ascii?Q?oB9PHFcfGiR064QTCqTe/QODGh/ZxmmH2/nPGjMvltVx99NrI3R1bPp6z7cR?=
 =?us-ascii?Q?A/Bf8zRGoCzJKG2HbhpP9p5KZFthb42vJqQ5VTYNwUbKXOdMDR4IuqEZdsns?=
 =?us-ascii?Q?DQJcGzVqAg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8768.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 564bbf32-20dd-478e-2ab7-08de5280e917
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2026 08:51:15.2502 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UgYHH341AuLQLuL12dZ1wjKjxJAbDhmpWfTdaUEYccqqFxombDu+RvGyttCTUdhGnn2neqnICLgOpmaay24v5uTSIJzr001gULfWLe5d0rI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8342
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

On Tue, 13 Jan 2026, Jani Nikula wrote:

> Please put the include next to other linux/ includes, sorted.
>=20
> There's a handful of other places in the file that could use the same=20
> treatment.

Hi Jani,

Thanks for the review. I'll fix the include ordering and update other=20
instances in the file for v2.

Thanks,
Kaushlendra
