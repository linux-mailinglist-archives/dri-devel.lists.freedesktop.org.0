Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C63B391974A
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 21:13:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AD9F10E04D;
	Wed, 26 Jun 2024 19:13:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MkdpOfNL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DD3F10E04D
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 19:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719429205; x=1750965205;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Di3R90eyzYmHgMTjgN9TBvKcJn4WrhYsAcRWw4OambI=;
 b=MkdpOfNLoGsIigaqQzaK4Nq4aRIi7wC752h0cDU80BPw4QEZdXTecShS
 yAbnXgE5O2P8omRzbAw9Xm3y9gRO65XgGoAShNTiKEktrQyPEHH3zORDv
 CG8/Sp0xn6sKxBa0BUTZxdiZj3/G4kfpZB/7BKaDPTHcdScrwsIMR8icV
 mwWPbpmonmyAPK9sdySMoCp8tb7P0nkg8FqG0SKlYwu9fO60N1qiRoxPD
 dYgU3OOH5dHwN9DYDbUVFC1igMQv/xXlDEgJw6wWBNHCKkfh4DgWYJqGR
 jviE06Pr5DLCboq+nJofLK3m7iyMlqQf9ARf23+QcefmXkQ9DC/jJm4Ot A==;
X-CSE-ConnectionGUID: GFemDeKzTnyQ3DfINFq7SA==
X-CSE-MsgGUID: VITTPLAkQgqeVUj2CGpfdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="20346091"
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; d="scan'208";a="20346091"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 12:13:24 -0700
X-CSE-ConnectionGUID: Ocdu7sHQS1eUFojIOD0MXQ==
X-CSE-MsgGUID: KiNgMzLPRQWMwJyAF0bn4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; d="scan'208";a="44169863"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jun 2024 12:13:24 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 26 Jun 2024 12:13:23 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 26 Jun 2024 12:13:23 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 26 Jun 2024 12:13:23 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 26 Jun 2024 12:13:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mfeh4YVwl2F7OUdpjq25t0apSXdeechAV2mNRwYT7Va3Pil0O1nfiKW/e0ZAdW8vMphPXmttlduoHABVfoxnj0nCj520i6R786LzOiUHbjjZvD0qy3RGSKcF1YFVPSYmPSGiuYF2w3jSDMkD30PdEUjDedbP5mZ0rbZpcOZ6sKwCkfRVWPBTJJ9LL6vmpVBCYgCi0y7B3fSWIrqYE3+uhQJdTkxxdOHCD7LVmA3oImifocmzGONPTPRebmEX55WXJ4T+mj1o5NAZ6dQlO6h8a25Mab6pkwKa8Fo/m9vg3c9HtSup4TUQfCPMlNFSGo3UjeqJL1JGFx9wOpGdZQbD2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DeBiWp/QfF9P8uAq8cL62KaaOpyEtlybwJPRWrXNvHQ=;
 b=EHywKEvR4hB/4Z8dS7KqYljxX90sxGn6ETwNgK4dd1Od94bYRgcFNmw4rRSLkPA+hyrIRv2hQzT/Arpywrd/oerM4hgces3ofEzm/ewoS9WV0eO/KQH8HaTXzNkxIEDs0HkfIRE9L0QtO+K7WtCzOsohJRop6R0XhbwTz97MrtFp/CxC2eh+x0//yCsk3Kg/hpkxFHA24DXy+Z0NOhLIkvmYt8ysJhIQdAyTfU5O1s4s/eOUlAYHuHsm9yXe1hJK1MWMNXIlreD/jXrmUr6E60gXIeFkUq5+Dj2vFho17sGTWwc4P7jOg36djKVRNEJDc4ZmLZq4o7F3xcyuUB1ERA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by SJ0PR11MB5866.namprd11.prod.outlook.com (2603:10b6:a03:429::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Wed, 26 Jun
 2024 19:13:19 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%6]) with mapi id 15.20.7698.020; Wed, 26 Jun 2024
 19:13:18 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>
CC: David Hildenbrand <david@redhat.com>, Matthew Wilcox
 <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>, Oscar Salvador
 <osalvador@suse.de>, Daniel Vetter <daniel.vetter@ffwll.ch>, Hugh Dickins
 <hughd@google.com>, Peter Xu <peterx@redhat.com>, Jason Gunthorpe
 <jgg@nvidia.com>, Gerd Hoffmann <kraxel@redhat.com>, "Kim, Dongwon"
 <dongwon.kim@intel.com>, "Chang, Junxiao" <junxiao.chang@intel.com>
Subject: RE: [PATCH v16 0/9] mm/gup: Introduce memfd_pin_folios() for pinning
 memfd folios
Thread-Topic: [PATCH v16 0/9] mm/gup: Introduce memfd_pin_folios() for pinning
 memfd folios
Thread-Index: AQHaxgTn4zwcVtvAd06eGmMKAyaRErHaWW6g
Date: Wed, 26 Jun 2024 19:13:18 +0000
Message-ID: <IA0PR11MB7185DCF0AFEFF61F9BCB065AF8D62@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20240624063952.1572359-1-vivek.kasireddy@intel.com>
In-Reply-To: <20240624063952.1572359-1-vivek.kasireddy@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|SJ0PR11MB5866:EE_
x-ms-office365-filtering-correlation-id: 9d45de20-c139-40c2-a4a4-08dc9614096e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230038|1800799022|366014|7416012|376012|38070700016; 
x-microsoft-antispam-message-info: =?us-ascii?Q?O34M0eHfxJZfQNLWoqKyKPlZnOR4H+sS93W2qpguMt8z5NCx/36IZjPbGu9f?=
 =?us-ascii?Q?6ZFHmu/eHF5gjP15TGqYhjKKw2QyrBWvt3T87AuxCrQkyYf/6n7UauF7GhCZ?=
 =?us-ascii?Q?33Z9+gQxfb1j2QK6bI2829Vea9E9SHVwC+c8xofG2k3/lN4Jl/L5ep/jVq7n?=
 =?us-ascii?Q?GfUzOpx7dDQPwfqPXxRPrco9ZITRcoOCzsdjMMyq2KKl4eKVSBDWvznFxsyv?=
 =?us-ascii?Q?+Emu02otUX8xILDWELmpGqdKPmooQ3XkLQ5hE9/xJqv+RWao/LEBdTkpgs6L?=
 =?us-ascii?Q?mVFelMmsSaKSV3wE3QzQexIGQqMdpxhMfkKID/tflrYw4VKtABsvmmxiRpoy?=
 =?us-ascii?Q?HBSqYCVeJ7X3JDNriPbE8bZkTR1zGiR3bEpLlEI+R5nvprJGKfRo83zfBxOa?=
 =?us-ascii?Q?tIVQJwq7tn3UZzOkIkgZj2vAbbDiwTpbPiQm3jNYZL7bbFWtd3NgmJtDnSvz?=
 =?us-ascii?Q?36TRRXNl2v5pjj1vfRplQ5reTEcPtvOSd6V5djNKsqr76frjdFd/eKE3zSNX?=
 =?us-ascii?Q?IcPb3CspdUVHbl7C0wiat4C+l0dRhgEK+qBkX8NIBjZr95QFoD5jrKBwnIJm?=
 =?us-ascii?Q?rZhRg28GoZl7HVB/8mAW2VzVLqVTKHKBYiz6kmJv8HuKHm6xRjdoi3QULu42?=
 =?us-ascii?Q?gc7G9mDR5kdeO/0uF2yD3aVxB0GuT40tE2nvrZ7H4FSyo1SZZiBYbbJ+k5WO?=
 =?us-ascii?Q?SPFuXMjlI62BhWBSn9ozvxzbeihoWVtKCrE/4n0EbJ3R5nxBfz0TP79ZzcIk?=
 =?us-ascii?Q?qFICUUg97u7IJyH0N/BFArgWx/EzHs9Q53jUP/VxsZ0CukkTevrI7PQwT5Ob?=
 =?us-ascii?Q?5nPUYfGkyi+grvlGhrJFYZhhGoID/nv5y+RzM2e5qe6Zl/RkXSRVT8qfcsX8?=
 =?us-ascii?Q?hO49uDUYDSBqpjXoww7ffpEfZicxxhtnjJfsF+7OdPV0zBeSx6PMGeSnWjGY?=
 =?us-ascii?Q?oVGsRBMKfU0VyQGwJGTQWggyh8MRJIikSX3yZDZLl+Skd0g17mKJxKp5XstK?=
 =?us-ascii?Q?NSd7BNCXf6RmFQs4W26bHPNL96m1bsVKwHpERmLeYcjfJ3UkZujstcsm5sNR?=
 =?us-ascii?Q?sbOxxgXicOy7f32ar77lZNOqQOhKKv2J44lDnBIoUGH90oqo72ECfd9q21Tb?=
 =?us-ascii?Q?M/JmTcTUyikYfgrmyN1+NJAyCzr2RCHWA3rnTLFiUIjhkbINy82Z94rKgdIc?=
 =?us-ascii?Q?v9fFM1IOzS1id17eWJtLJR9rX4E1IkjHvKg6O3RHoSaQumN7ipJbjsATkhvU?=
 =?us-ascii?Q?xP2913aYuzWrJFdDr74H18vbeTiEblWP6rrp8wqgrtd2hsIO88ze/ue2Lm55?=
 =?us-ascii?Q?XvPtETxuj2/7IwPuAxVoz5WngyLk7LWKnYxkpjELls0xDMUJhVHchYkuFes6?=
 =?us-ascii?Q?lKBue/U=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230038)(1800799022)(366014)(7416012)(376012)(38070700016); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?B+Afcu2FA6WQwsXSG+oCaaPcxDUvNDgBPUnxZl2Df3C1ghCd1tN/HEf1i3ou?=
 =?us-ascii?Q?G1WhdGZaGQsRuRxRwp0NDKG0lKH5XteD4Umr161USvbKWjMr77aOy9E4KKK0?=
 =?us-ascii?Q?sHH2t4z7x7Xljzvw7ysH5PQ+Nspa2DhFwmaAfGkzkcqpiKHV02cm5FhdBrKR?=
 =?us-ascii?Q?rBOUx6oN8I7Tz8bkNb2KI+yWUgVadQ/JTs/KjKhCENNVktdTz/QgiZAbVO6x?=
 =?us-ascii?Q?DPch4WWGMIz4oBSeNdaWrv/+T/XmYaev2iS53VIX40drtZQ/5T2SOrCMajjB?=
 =?us-ascii?Q?ukrUg1dhvH0xcaxGBR2GVZ6GlUK8nERKtoBBwW/wkUGqIg7o9IDVUBvcp2Yb?=
 =?us-ascii?Q?Thz3zj9N0870WfizW9uX88Oo2Ru2f+f238rghdOeHIKGDPGYvmq3Ajddwnc3?=
 =?us-ascii?Q?8WcXn5c+lPOOQE8YKRkjTytLHLkWcX3+Mfs+NoU34hbb1aIEcZfpLxt3ZrXR?=
 =?us-ascii?Q?haDH8wpVsMP3hvf/GVM58q5mcITvkLxlye9sGq02mDvdxrkbGnVabXvrPO6X?=
 =?us-ascii?Q?Ls0/d32JqZuRWtB14zqeD7AmBp6iytVjrL1Rp9dMMzMK+kE3Ieiz8VMFigY3?=
 =?us-ascii?Q?S1C1TIWLnYPqBk7brfmmhl2h1U5SJv8hH/aWjkt3ZwkW3JV8xTs/6a10QDi7?=
 =?us-ascii?Q?IWO2sxKryiwcJ/bB0DX32AU+4gVsmQTjCWSD00Crv19CsMAvZyvWIqk0Kb/m?=
 =?us-ascii?Q?emxI/tmh8R0byFUXkVo3JzwEOmWpmjobo853mVBN0ZiIDr91pCYSDOJHTx6a?=
 =?us-ascii?Q?4VefRqhrctuIjXQ8R8eIkp4t6ZHxyISr820aeHiFO+5qILyqgljCNEppvMAf?=
 =?us-ascii?Q?TMnZcSCTwV6LLIeUWMwFerpKf9908AuDII7R98OyYH/CHDafKxvguDExSEgY?=
 =?us-ascii?Q?sbV0nYfFRjOmB7QVZ3hLs2cRHoIu+4Tn6YgvhFfrajMMXq5K5cFX+Ife6SyQ?=
 =?us-ascii?Q?Mp7PwjAgzNmLLhPUu6PFZFltlcopILb8MQ2AdTVJ9v0TI8vFT79G5N0AzRUE?=
 =?us-ascii?Q?fh9XC+MHPxOLa2K44/ifCJ88Y9iiAg5PYIkC35TnJr+cSUnoaYPY338nqzh/?=
 =?us-ascii?Q?YZlA9FyE3ZxhBS/bZyGNMw6/72io0Mjun4bsYzE+x+r6yAXZ0dWfFCOsiJ/N?=
 =?us-ascii?Q?enl0rPLIrl0EevrT1avASQgn1jMTf2TQvpKhrLUujbtGgvKnuBx9ilqe5Am6?=
 =?us-ascii?Q?rnQ+cVXumIx2knxltbVMrF0I5tURCRr2i0AhLG2edBJv2h5UAjTXB9feuDy9?=
 =?us-ascii?Q?J+maiQT849TEsZjRvahZpOkJyiauOLqMW4ENPr+RGPl2ET22VcRpP5mPkYbJ?=
 =?us-ascii?Q?jCVwxspW6NSs3WblKm//lbpS1V5YLCHO3nPcrdw5ZdRppyoYBt8ZY1z3A9Fd?=
 =?us-ascii?Q?kRKVkcZufi8fCnHdVNjs/4+N5Vf4ct8XAvd5gwnKuDDKL9dVERgvHC8eVtZ8?=
 =?us-ascii?Q?YsOcCus5Hu0idHGRUr7/gavDtmJ2P4lR7JHX5dlhZOyLWjJmfhwXwSDlDTG9?=
 =?us-ascii?Q?C3IERrOZARcu8C2Os1FJYRSeEnVuKmKFGwkPOtb16f2wRmCfKG+dRUpAZaPh?=
 =?us-ascii?Q?FWCvrBOGVdxNCt0FeMouIPTcNW0GedDhNydsb1JJ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d45de20-c139-40c2-a4a4-08dc9614096e
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2024 19:13:18.1196 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nzRXxvZcDKFryCnY0cXqElvGEuAzYhwZ04M+voJidLjverxEf5Rr6Y1Vj6+rex/XQzh+LwslEe3Z3CyNK0K0AzHzeR2bioDvaSV7pCH/xMQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5866
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

Hi Andrew,

> Subject: [PATCH v16 0/9] mm/gup: Introduce memfd_pin_folios() for pinning
> memfd folios
>=20
> Currently, some drivers (e.g, Udmabuf) that want to longterm-pin
> the pages/folios associated with a memfd, do so by simply taking a
> reference on them. This is not desirable because the pages/folios
> may reside in Movable zone or CMA block.
>=20
> Therefore, having drivers use memfd_pin_folios() API ensures that
> the folios are appropriately pinned via FOLL_PIN for longterm DMA.
>=20
> This patchset also introduces a few helpers and converts the Udmabuf
> driver to use folios and memfd_pin_folios() API to longterm-pin
> the folios for DMA. Two new Udmabuf selftests are also included to
> test the driver and the new API.
>=20
> ---
>=20
> Patchset overview:
>=20
> Patch 1-2:    GUP helpers to migrate and unpin one or more folios
> Patch 3:      Introduce memfd_pin_folios() API
> Patch 4-6:    Udmabuf driver bug fixes for Qemu + hugetlb=3Don, blob=3Dtr=
ue case
> Patch 7-9:    Convert Udmabuf to use memfd_pin_folios() and add selftests
>=20
> This series is tested using the following methods:
> - Run the subtests added in the last patch
> - Run Qemu (master) with the following options and a few additional
>   patches to Spice:
>   qemu-system-x86_64 -m 4096m....
>   -device virtio-gpu-pci,max_outputs=3D1,blob=3Dtrue,xres=3D1920,yres=3D1=
080
>   -spice port=3D3001,gl=3Don,disable-ticketing=3Don,preferred-
> codec=3Dgstreamer:h264
>   -object memory-backend-memfd,hugetlb=3Don,id=3Dmem1,size=3D4096M
>   -machine memory-backend=3Dmem1
> - Run source ./run_vmtests.sh -t gup_test -a to check GUP regressions
>=20
> Changelog:
>=20
> v15 -> v16:
> - Instead of passing GFP_USER while allocating a hugetlb folio, use
>   htlb_alloc_mask(h) & ~(__GFP_HIGHMEM | __GFP_MOVABLE) as gfp mask
>   to discourage new users from passing GFP_xxx flags. Also add comments
>   to explain this situation (Oscar)
> - Replace NUMA_NO_NODE with numa_node_id() while allocating the htlb
>   folio to discourage new users from passing NUMA_NO_NODE
>=20
> v14 -> v15:
> - Add an error check start < 0 in memfd_pin_folios()
> - Return an error in udmabuf driver if memfd_pin_folios() returns 0
>   These two checks fix the following issue identified by syzbot:
>   https://syzkaller.appspot.com/bug?extid=3D40c7dad27267f61839d4
> - Set memfd =3D NULL before dmabuf export to ensure that memfd is
>   not closed twice. This fixes the following syzbot issue:
>   https://syzkaller.appspot.com/bug?extid=3Db2cfdac9ae5278d4b621
The issues identified by syzbot have been fixed in v15 and the concern
raised by Oscar is addressed in v16. I think this patch series can now be
merged into mm-unstable for further testing.

Thanks,
Vivek

>=20
> v13 -> v14:
> - Drop the redundant comments before
> check_and_migrate_movable_pages()
>   and refer to check_and_migrate_movable_folios() comments (David)
> - Use appropriate ksft_* functions for printing and KSFT_* codes for
>   exit() in udmabuf selftest (Shuah)
> - Add Mike Kravetz's suggested-by tag in udmabuf selftest patch (Shuah)
> - Collect Ack and Rb tags from David
>=20
> v12 -> v13: (suggestions from David)
> - Drop the sanity checks in unpin_folio()/unpin_folios() due to
>   unavailability of per folio anon-exclusive flag
> - Export unpin_folio()/unpin_folios() using EXPORT_SYMBOL_GPL
>   instead of EXPORT_SYMBOL
> - Have check_and_migrate_movable_pages() just call
>   check_and_migrate_movable_folios() instead of calling other helpers
> - Slightly improve the comments and commit messages
>=20
> v11 -> v12:
> - Rebased and tested on mm-unstable
>=20
> v10 -> v11:
> - Remove the version string from the patch subject (Andrew)
> - Move the changelog from the patches into the cover letter
> - Rearrange the patchset to have GUP patches at the beginning
>=20
> v9 -> v10:
> - Introduce and use unpin_folio(), unpin_folios() and
>   check_and_migrate_movable_folios() helpers
> - Use a list to track the folios that need to be unpinned in udmabuf
>=20
> v8 -> v9: (suggestions from Matthew)
> - Drop the extern while declaring memfd_alloc_folio()
> - Fix memfd_alloc_folio() declaration to have it return struct folio *
>   instead of struct page * when CONFIG_MEMFD_CREATE is not defined
> - Use folio_pfn() on the folio instead of page_to_pfn() on head page
>   in udmabuf
> - Don't split the arguments to shmem_read_folio() on multiple lines
>   in udmabuf
>=20
> v7 -> v8: (suggestions from David)
> - Have caller pass [start, end], max_folios instead of start, nr_pages
> - Replace offsets array with just offset into the first page
> - Add comments explaning the need for next_idx
> - Pin (and return) the folio (via FOLL_PIN) only once
>=20
> v6 -> v7:
> - Rename this API to memfd_pin_folios() and make it return folios
>   and offsets instead of pages (David)
> - Don't continue processing the folios in the batch returned by
>   filemap_get_folios_contig() if they do not have correct next_idx
> - Add the R-b tag from Christoph
>=20
> v5 -> v6: (suggestions from Christoph)
> - Rename this API to memfd_pin_user_pages() to make it clear that it
>   is intended for memfds
> - Move the memfd page allocation helper from gup.c to memfd.c
> - Fix indentation errors in memfd_pin_user_pages()
> - For contiguous ranges of folios, use a helper such as
>   filemap_get_folios_contig() to lookup the page cache in batches
> - Split the processing of hugetlb or shmem pages into helpers to
>   simplify the code in udmabuf_create()
>=20
> v4 -> v5: (suggestions from David)
> - For hugetlb case, ensure that we only obtain head pages from the
>   mapping by using __filemap_get_folio() instead of find_get_page_flags()
> - Handle -EEXIST when two or more potential users try to simultaneously
>   add a huge page to the mapping by forcing them to retry on failure
>=20
> v3 -> v4:
> - Remove the local variable "page" and instead use 3 return statements
>   in alloc_file_page() (David)
> - Add the R-b tag from David
>=20
> v2 -> v3: (suggestions from David)
> - Enclose the huge page allocation code with #ifdef CONFIG_HUGETLB_PAGE
>   (Build error reported by kernel test robot <lkp@intel.com>)
> - Don't forget memalloc_pin_restore() on non-migration related errors
> - Improve the readability of the cleanup code associated with
>   non-migration related errors
> - Augment the comments by describing FOLL_LONGTERM like behavior
> - Include the R-b tag from Jason
>=20
> v1 -> v2:
> - Drop gup_flags and improve comments and commit message (David)
> - Allocate a page if we cannot find in page cache for the hugetlbfs
>   case as well (David)
> - Don't unpin pages if there is a migration related failure (David)
> - Drop the unnecessary nr_pages <=3D 0 check (Jason)
> - Have the caller of the API pass in file * instead of fd (Jason)
>=20
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Matthew Wilcox (Oracle) <willy@infradead.org>
> Cc: Christoph Hellwig <hch@infradead.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Oscar Salvador <osalvador@suse.de>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Hugh Dickins <hughd@google.com>
> Cc: Peter Xu <peterx@redhat.com>
> Cc: Jason Gunthorpe <jgg@nvidia.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Dongwon Kim <dongwon.kim@intel.com>
> Cc: Junxiao Chang <junxiao.chang@intel.com>
>=20
> Arnd Bergmann (1):
>   udmabuf: add CONFIG_MMU dependency
>=20
> Vivek Kasireddy (8):
>   mm/gup: Introduce unpin_folio/unpin_folios helpers
>   mm/gup: Introduce check_and_migrate_movable_folios()
>   mm/gup: Introduce memfd_pin_folios() for pinning memfd folios
>   udmabuf: Use vmf_insert_pfn and VM_PFNMAP for handling mmap
>   udmabuf: Add back support for mapping hugetlb pages
>   udmabuf: Convert udmabuf driver to use folios
>   udmabuf: Pin the pages using memfd_pin_folios() API
>   selftests/udmabuf: Add tests to verify data after page migration
>=20
>  drivers/dma-buf/Kconfig                       |   1 +
>  drivers/dma-buf/udmabuf.c                     | 232 +++++++++----
>  include/linux/memfd.h                         |   5 +
>  include/linux/mm.h                            |   5 +
>  mm/gup.c                                      | 308 +++++++++++++++---
>  mm/memfd.c                                    |  45 +++
>  .../selftests/drivers/dma-buf/udmabuf.c       | 214 ++++++++++--
>  7 files changed, 673 insertions(+), 137 deletions(-)
>=20
> --
> 2.45.1

