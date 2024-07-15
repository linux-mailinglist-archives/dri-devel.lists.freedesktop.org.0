Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A6093181A
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 18:08:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BEDA10E25E;
	Mon, 15 Jul 2024 16:08:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DqYrjfRl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E84810E42A
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 16:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721059684; x=1752595684;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=kbG15/9ewmc+qp7BMBqWaZv34s08/z9LA3djhn19hVI=;
 b=DqYrjfRlXEQqqLnJLZg8d0n4JrduCprlaPwaMRCm2YRs0GztH2i++YY7
 tZcABGgiIohqBqqH5KYiDDpBGGkYFXcD2YCeiIl4bb4etjas6M++9/jgG
 AJRMEWE+XNTUQUhvBSQtCWLF98GARIfN2pFh8P0Md5AvCf9Jw4Oj8RUKx
 ZEIes6cB/3S8o8wgUmhHNgnYbNumh5LdnXLG0OIpDRD2kDsJk5ThYb1vX
 p5E1uxR/hUILEn4h16EwLSo+350iejovszJCutTnggkNVd3HAPmrLDvg2
 IWxuDYsgtGBbbfC/Ggurr8VNaOHTEVDutib25oAYfcqKjryfuXjf/IABp A==;
X-CSE-ConnectionGUID: oFwc0qcBTJ2GZ3Jfq/REbw==
X-CSE-MsgGUID: 7C+2mvQDTJCytwJQWwPKxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="29053748"
X-IronPort-AV: E=Sophos;i="6.09,210,1716274800"; d="scan'208";a="29053748"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2024 09:08:03 -0700
X-CSE-ConnectionGUID: 9Faw9Ri0Rj+hAwVtZtBCQw==
X-CSE-MsgGUID: TPdQpPjzT1uow/lltBBTjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,210,1716274800"; d="scan'208";a="49617102"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Jul 2024 09:08:03 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 15 Jul 2024 09:08:02 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 15 Jul 2024 09:08:02 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 15 Jul 2024 09:08:02 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 15 Jul 2024 09:08:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DO5yg14oCIrPgKxdYsgqigQcOXkUOHNgx4h4R5q0A5BxWMlI5+MAFsDqVUaGfSR2pWO9Gz5ddAhXX+pDP/jxIKJt59tCHBfeG1/sm1VBxzMdcDwouNUe2od5FEtz3lkNhv88y3Ts+hZTfy+IG5T0b/RTmyfTZBzky7WDzBjnhV0iyvz6AxWPv5eVPlWVu0pGXmG/ODFjxtwkZikedellrJEQPnGzNy6qzI3wayIOazRA2qWzeMX1ckEKCbGI87PzdVzuET/JXxfT11fVhyex3FJ1iN2m+53kHJLCKErt0lFKViL/KN9Ni0s9p8Pl/yi7fH1xqf+YPFDc5deFBn4Mzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eu0M8tT4SuI3TgjU/qwtg1rfx/JWZv+TCJbLpeC20Pw=;
 b=Z4lzzETwKdiMfdJKrT+QfZVCgyxJrA4AsMQfwI5E+Lv8sRSlSrwZi2IaZdS0l5UlHS0dO3o3ru7/8abVTH+fyGOUS31Vq/FYtdBmefZnrIE1RkAMUVlgGV0ARVN92eM0Zsk97BjHWEeHrZWq7Pio+tfDf4OsLZPhsYzRm9e91y4SLtCHnmzu1AFiMQurFYS7XEwomxztIL+iY1WYh/AXbOKQ/rQ7f80D3Pz5uLJ6W+DLXsMobzW3Y+//ln14zDRC69jkyW5fJKnwlFck/bT6bIO5O74R2Dq8hpiiodgfuKYStUr1PImRMmkuqvAkhiqOBZGHlmzmZY/Bpwom5UELPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by DS7PR11MB6080.namprd11.prod.outlook.com (2603:10b6:8:84::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.28; Mon, 15 Jul 2024 16:07:58 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83%4]) with mapi id 15.20.7762.025; Mon, 15 Jul 2024
 16:07:58 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: Dave Airlie <airlied@gmail.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH] drm/test: fix the gem shmem test to map the sg table.
Thread-Topic: [PATCH] drm/test: fix the gem shmem test to map the sg table.
Thread-Index: AQHa1pIcWxzPMC9o0U6MGDw/I2fIYrH38XEA
Date: Mon, 15 Jul 2024 16:07:57 +0000
Message-ID: <IA1PR11MB6418165B122159BCF7E37CBFC1A12@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20240715083551.777807-1-airlied@gmail.com>
In-Reply-To: <20240715083551.777807-1-airlied@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|DS7PR11MB6080:EE_
x-ms-office365-filtering-correlation-id: 37efc42f-6b4a-4e82-b982-08dca4e84b24
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?ImMTALjNGBXpmZfdo18keOuOATlFe1lPC3ky/CBZW1JM8IPp1af7sVPD6pye?=
 =?us-ascii?Q?2xKgTCdniFOTs/uwtbDHzGtXXTmVGJ6ElUR4BxQVtWVXKtjCzP0/hTak57lY?=
 =?us-ascii?Q?eUQL13BZgL7JdGNdgEFzcvYV3UHd3B5Z7ZPSFZtZ8mlGTrH5xubNnmiBtKHm?=
 =?us-ascii?Q?m9cLZemytuNGD3ARahzPUj5+zMOuvWbtYAXEWIbKMsZ5NQ0ABYWhlTdBN8DQ?=
 =?us-ascii?Q?G6eZlbT1mxvkhHmLh7uKart+VP1Tnn0hlKILRVZevWkIP3oAb4Ult4K+2GR+?=
 =?us-ascii?Q?3g7nu3Ga80Qgo+ch+icVvMsF8HNREvoww2scVWW2UPnYvuBg7Yy9VdLm8lP7?=
 =?us-ascii?Q?srFwb8CSV0nM8LByT7hnug6q+bgEgZvlXgYjUgAPu3GZBpvy9Fq6m+P2XgCG?=
 =?us-ascii?Q?FU+JdNvPIN0Hq95yoGZCWv7VDUCl4fWAjrEn+CnuEGKGwVnmsjFOMtG9G2A6?=
 =?us-ascii?Q?RjR9HtAgjZ5ttdH4s4C04qcdH+pZfYy5rB7E3ydzgiWDSyu2CWWdIS6ryo6M?=
 =?us-ascii?Q?LOreC+T2JO/UIQGJlOKunzS6Jdut8TQo0FiirPWBr2ixuwCaCcQ1ayFIMPFd?=
 =?us-ascii?Q?MT/L0yh7N7AIL/ZamBufpKC6Til1k0C1p98ZCdtEErEk3HPk/oBMiUrAgMQ+?=
 =?us-ascii?Q?Tx9oa6ygIidT0R4yFkMslHZlcnfo5gF8QRUgaKGddSUqhp5hk7VpBTjot99g?=
 =?us-ascii?Q?DmYWrvbXyVLxEP0kKss9Lv2lRGKmtku0sYZrdNAMrmWvKoFH7sjWcj/UyNxe?=
 =?us-ascii?Q?kdpSsQztR8VSh6MISP1b4W3uezGgbOZz5X2XPiIwyOEsYjhfV7iLtDFwv33T?=
 =?us-ascii?Q?k9taYlWXn9rVMK1mgpeAS9xb3+Kea+Mk3VDm0NsdW55zlvtceuvJODhL6YuS?=
 =?us-ascii?Q?4Hn277F3W+1Daz66ZUCh3Z73ZUGgzOqgpQIyjRB2xg4u/1xaYiiUUDdEj+Kb?=
 =?us-ascii?Q?FwX/PfPuxDGdk4oVXMreneldhG1z5YdSnxJV3IrBAFx735tTkYx1zvyVrf0Y?=
 =?us-ascii?Q?PzzNOOl5ERqpbJFr4RB0k2hlyT2VVmcXQTKZIfoMtGuoXmBen3uY8UolPI+5?=
 =?us-ascii?Q?y0J+o/+Jhjm4aqCnOJPCEYOfRf8jdRoVxHdek9+UDpoVrXrgyGuGUzCy7M2y?=
 =?us-ascii?Q?q7ALHcRPk80DPhF/1ZotuvdzBQwVbSaokEtKaSEK4g6c4KJVaVw0OrzoTFeI?=
 =?us-ascii?Q?4gKXwF92wh9hBpRWly5/EOXDS/QkcYCYdBtr1c775rJReYJCdxVQ6P2EEHGC?=
 =?us-ascii?Q?+eHggtXAaKRazZ0qKWaNIFzUNqZQOrQibpy2L1bLoZgfuW5nTe7UZidOJhGv?=
 =?us-ascii?Q?FjUyMuT0RR/c5SPAUrZpM1l9j/HMPuVZtz2yPMmn0LcEk3/P64mP4XnWgpHt?=
 =?us-ascii?Q?mK1u83Q7bEF67oc6yte4/qOySkp5KlLe+jxxuyCxEREuKHXTCA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6418.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DynvMB/doHnLIFCcHcWehSrOxpkGoelxLUVX0Jdf5g+0pva3J9izXxj2puaL?=
 =?us-ascii?Q?Mf9euRaPkC8gZQBuVmsXd6mmMPkn7a6xyS0vHv3mLYSK0I2m1oGlpvIMCHaY?=
 =?us-ascii?Q?KqjvzXvynCjcCZbdzWml60nQm54PL+9rmex6q7CYBwfpE+MeTgne3fZBzTzU?=
 =?us-ascii?Q?8W75fzok4+cHjiS+7KGI+V+xEqLruF8HCTJYw0oZAJ1Ejzz9UYA9YFuZmvWY?=
 =?us-ascii?Q?IlIS9Ih9q0d0RSLzBRoR5Haa6ONIDI68s8T7VRAXuwkJLcGgfQH3y9UBmcq4?=
 =?us-ascii?Q?jdq4PBVF2X5u1S5piDjdjxAU7cXhgfesNsx6XP0PjVseukFAXgAqBz3OmUyx?=
 =?us-ascii?Q?WC/hP2Y3O7arfAb8q0CmxeY9q+lGVSmYWnooZtpp/7cjeZbYUGdyW9pbKDGh?=
 =?us-ascii?Q?hqlB+95xPGV4lwvEO8PQf7ZzPpg92BCAxxQ+VS9Iaykr/iGM5r2ckLwDo2Bu?=
 =?us-ascii?Q?HJapQJ50ufgbkGa/7Fig4xeOJcOVIc5djsxNH6Udux4JWLKH3EfR6nQeWt0c?=
 =?us-ascii?Q?56+LydiqzQP3ufClLN3JRc1tkp+J/06RSKhbsuqhKoDD4qSrQHMRq4sRomsO?=
 =?us-ascii?Q?zUDcLVIrNCYX1t7r6F9lsBgxnqeFcFKcPx8aOQ8opltVmHUwFSi2ATTBdUHu?=
 =?us-ascii?Q?z9L+XQEfyOVQsaTppDuUpofuvwWYFNj2yHxHib21wz2i0YPfvA0zITWBGH6r?=
 =?us-ascii?Q?5ci+K3NRyj4uv9F0iTFoJjFAYYNhwTOp1Bf72Gk6I0fSTr0yh292GhaciD0m?=
 =?us-ascii?Q?mg693rZxa/jQuC4Sjx7l90kycg2bZTdMIiKOhS5qNSbVpj4eNHs6a3iWe9Wy?=
 =?us-ascii?Q?5LOqFOZTz6E/1J7gaV/Q22/PCer1erxpTsmsKu8Jd+68bxc3HI1QZOKmbSp4?=
 =?us-ascii?Q?bJQCT1yL7KBeu9QrBFyrcOKJduCOClZwthuQCyQO+SuCsmHEkeprDVozZMLK?=
 =?us-ascii?Q?rVSRLxrg5SIoACYbPtZsbH0IbGyW7vZTpwmcp46N/L6R7TuL5VpYWq3IqML4?=
 =?us-ascii?Q?1ryOK9gfb9Pu/RWc6y638ZCSh5Qx2KOHtAUVlypiR4fyTt0+FDbEGfijLxiz?=
 =?us-ascii?Q?vD4VZdzKGC7Dm+B4K07dC/GTTs6JIK3dFuV1QpeM9AugrawR65NgzDyGHfOC?=
 =?us-ascii?Q?GbGMXRFBsb0PGQgZnBBk/kA6oYVSr6gUrgluUZmmEOUUv3D3CCBlhWd+wCsy?=
 =?us-ascii?Q?4FXmgUs4HG0RWTqg2Q70KT5vHSR5nJccqVFOa0HzTlEF9fbQ+vMLgM4UuAkQ?=
 =?us-ascii?Q?dWECwHGX637lUSKEl7kyJSLldaiccS+9v0U3LTg6C/C5T41bo7GonDPBTCoU?=
 =?us-ascii?Q?gUKMEWL9mlTiDsewLfAZ6FHROAZOR2OJotub5Tk/vu9XFrU1Vk/LvQu7rmXC?=
 =?us-ascii?Q?1rn8b9lQdmMEij2BUxnOxGNEs6J3bLk/q+aijL0f1m3IF1Nx51jAsZBkBuSz?=
 =?us-ascii?Q?BzZzo5O8DmhyjsF+yT++ETqv0rQfMr1AP6ckxxumvUsmDqsXNgNPDaCm+GoD?=
 =?us-ascii?Q?vg/iC+14gP+nQDzC0O3PAMFDy09XMsOpzy16cVf+O4/lCax75e7qYNJNOFbv?=
 =?us-ascii?Q?tPtImmMw1Jv6vK9dWUtd8LelPc64qMthy8CO1AQp?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37efc42f-6b4a-4e82-b982-08dca4e84b24
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2024 16:07:57.9756 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: emIYHxAkYnOM31heZkcpLCyUOu2rtuX+Y0cpRvv5/Cg+vn/1TwE+IbiWwUqz+NeuTpI9LJK1dIyesSgM6Ff1qpJ66kLs66zYapQ5ilvud/Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6080
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

>-----Original Message-----
>From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Dav=
e
>Airlie
>Sent: Monday, July 15, 2024 4:36 AM
>To: dri-devel@lists.freedesktop.org
>Subject: [PATCH] drm/test: fix the gem shmem test to map the sg table.
>
>From: Dave Airlie <airlied@redhat.com>
>
>The test here creates an sg table, but never maps it, when
>we get to drm_gem_shmem_free, the helper tries to unmap and this
>causes warnings on some platforms and debug kernels.

This looks pretty straightforward...

However, should drm_gem_shmem_free() really give an error if the mapping
didn't happen?

I.e. just because you have an sgt pointer, should you also have a mapping?

If the errors are really just noise (form the specific platforms), and this=
 patch is covering
for that, then:

Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>

Thanks,

Mike

>This also sets a 64-bit dma mask, as I see an swiotlb warning if I
>stick with the default 32-bit one.
>
>Fixes: 93032ae634d4 ("drm/test: add a test suite for GEM objects backed by
>shmem")
>Cc: stable@vger.kernel.org
>Signed-off-by: Dave Airlie <airlied@redhat.com>
>---
> drivers/gpu/drm/tests/drm_gem_shmem_test.c | 11 +++++++++++
> 1 file changed, 11 insertions(+)
>
>diff --git a/drivers/gpu/drm/tests/drm_gem_shmem_test.c
>b/drivers/gpu/drm/tests/drm_gem_shmem_test.c
>index 91202e40cde9..eb3a7a84be90 100644
>--- a/drivers/gpu/drm/tests/drm_gem_shmem_test.c
>+++ b/drivers/gpu/drm/tests/drm_gem_shmem_test.c
>@@ -102,6 +102,17 @@ static void
>drm_gem_shmem_test_obj_create_private(struct kunit *test)
>
> 	sg_init_one(sgt->sgl, buf, TEST_SIZE);
>
>+	/*
>+	 * Set the DMA mask to 64-bits and map the sgtables
>+	 * otherwise drm_gem_shmem_free will cause a warning
>+	 * on debug kernels.
>+	 * */
>+	ret =3D dma_set_mask(drm_dev->dev, DMA_BIT_MASK(64));
>+	KUNIT_ASSERT_EQ(test, ret, 0);
>+
>+	ret =3D dma_map_sgtable(drm_dev->dev, sgt, DMA_BIDIRECTIONAL, 0);
>+	KUNIT_ASSERT_EQ(test, ret, 0);
>+
> 	/* Init a mock DMA-BUF */
> 	buf_mock.size =3D TEST_SIZE;
> 	attach_mock.dmabuf =3D &buf_mock;
>--
>2.45.0

