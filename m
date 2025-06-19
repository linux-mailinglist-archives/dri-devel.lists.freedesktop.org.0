Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E955ADFCF5
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 07:31:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EF8510E1F9;
	Thu, 19 Jun 2025 05:31:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WEVZBWjg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1B3610E1F9
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jun 2025 05:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750311078; x=1781847078;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kxJ3SLQeGj2iSyaTHx0jG1RFhkjDcoTq1h5iWFhL2u4=;
 b=WEVZBWjgIj0OQFg0Fk70Gf29nCtG/F/XXuy9HiU4sW15z5DyltL1vRDP
 StRZ/sg+WCpTXtEOy4SjFMTEFwZfW841xaC2RH0C+7CzcnswS9mp4NbN7
 9QVdHWeVYAw0JqEYU4vXl6ccJlBpKkvvEBXULBoHzjXf59ABqBB6VL+eA
 rerdNtPKb8s8aVIL9YKZqCXYZcig7ZWB4OhSYrxu1U3OWlfxY2D3WFMUf
 DAGbBWWB16Zb8SWR5P+t9WkFKrk+ox52dnFPypuk37dqENhIyMDDtTUUF
 P9HKAgZcaEhNvIXeV2+VgHuDTwSKlPknr1WmbFOuN24wSrsy0AgL3VsPY g==;
X-CSE-ConnectionGUID: vE00jMfzSoe2zW4sEAShFw==
X-CSE-MsgGUID: UVC4JheBQ9GxMeuUZBuIeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52635911"
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; d="scan'208";a="52635911"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 22:31:18 -0700
X-CSE-ConnectionGUID: RA6U9kmsQCSM9G6jL/NifA==
X-CSE-MsgGUID: J4Xmck0QRCipvFX/knKPBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; d="scan'208";a="150067943"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 22:31:10 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 18 Jun 2025 22:31:09 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 18 Jun 2025 22:31:09 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.67)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 18 Jun 2025 22:31:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a6zsvIoOoucfPGeVVqgVvOvIODdiBsKWLhkqvvYN6HtnXLq1Mc6fIw2meBFpE6wl/DuZvZdd4Qk+J7Iad6jksPfOpI7HMwM7g8TvZZRYvREFcHc8IWlj0W7gjw5ekEVBUrNLK1Q0nVJOMlH+X7lgTM50l187mlWsm7QqUOO6NOCPi67oJYjGs7S1c4mO9hQbgJKBeR9ewEYN/PayXThKlssRSzgRc7MWKzN7yT0Scl4GW+paB2TXWJn67ktIhOsJGVYD2nVNo2nC+Bo4l9wk9pIL3wl6DFww1/qNsqSLJP1/D2CXAUQx+umgKX7RfV4iMXXq8rysv5z2kBOe8Y4cWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k44cs322EmW+WeNMjbDDRNdxJZxe7jC72v4+cyeMwiI=;
 b=MIIBSuoYayIkuf71WMHqENWSeyjjpNZsZiweYnaqDWtaQeel2NCOmOuxl0p+f0Szkv5THULIRQQIpOHSqIXTbFiPqol/G07Pr+VQOE1a2Eo4jHeSA49TLUUZwaOprSj+YoKaQAhmtDju01VjPFlcQH11PVKSRWVm3TUHf2Hb0reiJcNsAwRTX9LcNr/Jsn7/N7Z1CBEEcJyIA1+civ1sX/UMVhdRS4BcoJRBvViMowgjJxh+7ufvuWle+P1qC3gnnkNn8MGxLzIHLy0NXQcRyem3SXJFbPv10VFZHHW2dq9WmKcYvmWNN3tVcLCa3ZWDDGf1bZhFDJQ7r3WAAfuvfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by SJ0PR11MB6717.namprd11.prod.outlook.com (2603:10b6:a03:44f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Thu, 19 Jun
 2025 05:30:52 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%3]) with mapi id 15.20.8857.020; Thu, 19 Jun 2025
 05:30:52 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>, Anshuman Khandual
 <anshuman.khandual@arm.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "syzbot+a504cb5bae4fe117ba94@syzkaller.appspotmail.com"
 <syzbot+a504cb5bae4fe117ba94@syzkaller.appspotmail.com>, Steve Sistare
 <steven.sistare@oracle.com>, Muchun Song <muchun.song@linux.dev>, "David
 Hildenbrand" <david@redhat.com>, Oscar Salvador <osalvador@suse.de>
Subject: RE: [PATCH] mm/hugetlb: Don't crash when allocating a folio if there
 are no resv
Thread-Topic: [PATCH] mm/hugetlb: Don't crash when allocating a folio if there
 are no resv
Thread-Index: AQHb4BJSsw569givP0yLQ5888kYOd7QIeNSAgAEiAgCAACD6UA==
Date: Thu, 19 Jun 2025 05:30:52 +0000
Message-ID: <IA0PR11MB71859403C79419049C075E44F87DA@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20250618052840.1036164-1-vivek.kasireddy@intel.com>
 <99b9f7c8-62e0-4500-b4f1-0efdb73bf502@arm.com>
 <20250618170248.89ff5c3d3fe23233424fd4da@linux-foundation.org>
In-Reply-To: <20250618170248.89ff5c3d3fe23233424fd4da@linux-foundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|SJ0PR11MB6717:EE_
x-ms-office365-filtering-correlation-id: 56c53578-73e9-4cbf-03dd-08ddaef274f8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?j80Yjuqfaq4fQqEWUZCqgh3aMbB6z+/YYFl3spcWRed/tsAYpwT/xJy7HNum?=
 =?us-ascii?Q?J9AzJA356bruM3c7oRIlsCrBR3HCdN1MYI4uPpkxSBW3LTWBMrftQdRxIt5J?=
 =?us-ascii?Q?UWuHyrdwP8OwmE048YiDR8uJWB2JA1cwi6osJDeVWYnF8ovtVJWV67IbKxOj?=
 =?us-ascii?Q?R0uLskSXJ44hFQt5GyehQRrU378SFa0iwpnXS2j/dDs1/0FZIteV4GaMlNyw?=
 =?us-ascii?Q?ahcAjRNuhXskYY/Er9J6lOfYBgX+Y5MYeO6DSRwJP/fghUSRRedkT5XCDUqp?=
 =?us-ascii?Q?MhetI+LEGXXaN+Z602cH/Pb3zFnHcwD4R0mBtG9M1p6B4sbob/ztzT2JJy4E?=
 =?us-ascii?Q?4sA2uEBMqevolMQLDblJMN2GFIxP7los4UxdJMQrvufiODvVQsfhL/474VBf?=
 =?us-ascii?Q?ZA6OKC8QZYfeTq7xZpkVDq7ObP7MgxcSdzLFSNph2EzRNym7FYcyPMThpuDR?=
 =?us-ascii?Q?OmhAugEewAuIV8j7fT506s0OXfiAkZ8WSPsnYHU2UVyiih4e1lP8jlhnS4sk?=
 =?us-ascii?Q?LCvWBQYLXn/2exNlxAH1f0dzhCB17tFxqw7fFVT7zUxeOHgIjX7674orTRUg?=
 =?us-ascii?Q?jizcoy4h1CdeYMxKEAJLhUpfb8hcxKaAtKSKYBM2bXPXDxSm1eF74mIdrt3W?=
 =?us-ascii?Q?/w+/J74rA3EPOPC5Q63wmwWDCGoDoPMVBSR82aRxmAwOUBYbDE+QDLfphjjG?=
 =?us-ascii?Q?luPLQR0Eg0Db/GNkpZRejL0SRqneigv74wrpFTquCL+GJKaWCOUddZag/p6p?=
 =?us-ascii?Q?SOIwBG70ps9DCaXhFSWL3GAKy80cWtl7z4KoGL5Pnwa1zjGSik21TK4b1N88?=
 =?us-ascii?Q?xV1+QPqbBNpmjjSgmoEbR/iLSzEMUd4LDaytJQGMfKQRYKJL3r5DOPInqfQy?=
 =?us-ascii?Q?TvNQrQcUi0FsPb1ObZUZzWgOu4uxMw1zDY+9giP2kPNJ4ip/lGUgc8KD8wkN?=
 =?us-ascii?Q?ARq1zN+xNSaudGunfgBksdyiJpC63tlAeHKSGhEwuB7i+R+Sbh5ZOu3xVZPW?=
 =?us-ascii?Q?1gEUmITF+rKxyoZHiMier7/7JOKeYq7E7QjtLcg8iBIYP+lCbw5TbdHUua5V?=
 =?us-ascii?Q?DVyS83M9tApnMcUAJKotDtomLc0KE8DIIrnk7pwafL/3VNKmSVJWuRquQzbL?=
 =?us-ascii?Q?e5ne9C7sFOrMWpY+CloVCZijNbl92GYKUUiqracSX5B39jJeyBpgriy1a/fx?=
 =?us-ascii?Q?KXEKZjWsx74tHvCSbtIQb60F/LwKstOn6K3Mc4i87MINq2msBunmuKR6ENFt?=
 =?us-ascii?Q?OkRUGMncPpolBS8COty9wr7WizyVWVrNsb2ThDz8Yk+xCRwtvaFtsZQ8zQt5?=
 =?us-ascii?Q?18ZdEDdq9Bgbz0Bjsey5Bq3uwnYUfkvuAooFEzMOud4NJNRh5CHzDM9UP9Bp?=
 =?us-ascii?Q?2zGbbMzwuB3V0uqSNAF53zUYgfwIYPwtFG24LphOl3qMEi24QVG9vX4klrtT?=
 =?us-ascii?Q?4Td0g8wRyIRpOjf0ZcTqKfdRPbICdPLy?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8arAD9kQcI1nHRldJeW+TY8kfjdR6VNOc0P73zIto4wwi5zHi37xbMH1HtGG?=
 =?us-ascii?Q?/jsjg5mmIAun/eNpusmFajTfw5XzUsfiObsJDW4gkEwIBm3IUkX3duYusysq?=
 =?us-ascii?Q?/wuP93mZZjaZf5L0NPqL940lBK+96VsRfFpasYNd6S6SrRrXbJSWIOmw++uP?=
 =?us-ascii?Q?ZbGtWi3a8+yGhF3Zs0DGRzYY2IQOT8z199FBPx/gpueFqa8pd9BnjIC4UfGZ?=
 =?us-ascii?Q?rsb5DvQtfQe1oEIdq7w/ck3ZTrNh7GnD5qziZjXJgWOi6lKM+NhW6whXY9zk?=
 =?us-ascii?Q?1MInXo+srEvWSXUFq0jJIVsfvAlsjHSUQ3IIvLXLAHOn2jGghy/uBVohGi8n?=
 =?us-ascii?Q?QkaENwLH4zh85jJQ+ddEZCJ10XntIlW72WZsC/btF1s/NyLRPPYJQqivAnh1?=
 =?us-ascii?Q?NY2wb+P8bvwslaupWspeaiCQfLqcIIAWspclsjPf/fWeFK07xU+5RoSa9Cjq?=
 =?us-ascii?Q?dmH3jpx0QAiScV+Y5Ou3rC2zxlFiM8ZFFDNaRGtyEbSQ98fvEDXLeaEN8lXY?=
 =?us-ascii?Q?IjfIi1+4Gt3u8ltOySr1WK8QrmTJvp5zIRuoOlkQRn8EVTLisOQhYSW9MYx2?=
 =?us-ascii?Q?4zfV6QjGq0Nei4wz5bsupezU9XdCnwVMPA6MN3OwFf59YHJ6AJGB82rZ3ZvJ?=
 =?us-ascii?Q?+DWn4NRNG8j1yU5SVfDul/zirmrfk6XXIzWa+5A0FTJzLm6pxXQyJp2KNFeK?=
 =?us-ascii?Q?P8eit9stJ1sM2KHfgPuhNhb7P1HIyu45imV8SAmeZQuvuOdlM1E+JySsGDfQ?=
 =?us-ascii?Q?KJqlvEYURg663VsxhtASLc8HEWNCxyoH+jZqByBO6NkIgfzS1ipdFvDVGxvG?=
 =?us-ascii?Q?2/ABllRSpHg/hnO9bpMnuAuaFmZDR/0abXuRUY5fVvCVaOOUS9izxbhwQWXd?=
 =?us-ascii?Q?Tx8dpHya0OXU8fbfcpDdDssfxPGAzkX/oDl9ZjrrO2IpNXX13n22eIWTaqdA?=
 =?us-ascii?Q?tJZaUiqOFikgtmoU4GKnGK2SVJ+4GA+B4JH1VZc/2q3D0zroo5OAXrmQpY8/?=
 =?us-ascii?Q?AFDoaKPcNpqci7YJ8fWY3NnCXClCSDEKY4rFk/QOlHe7oP3ABOfU3c2V56QB?=
 =?us-ascii?Q?kqxKXSj1Gqi/fBGii5PbEz1ZbbNOqspbyekBSajaIfQJrI+jKWs1NAFdxuyv?=
 =?us-ascii?Q?7NT4XCT8BmHA6J8p5PQJAChDqGVFPnPwHukLxXpbAPBPo2zQ8h/FLrhqgA8z?=
 =?us-ascii?Q?DshGipJg9nEDaiLt2QTEuVbPN6ffIXnP5YlMSxoHGLFEUVork7jnQ+jFGVHW?=
 =?us-ascii?Q?FW+E463y+8mHompBZZPKFisgyjBvB9cJ+IgNDlkvHU4ENO7X9GHdrrH441Tu?=
 =?us-ascii?Q?sQC00/YxBYRgpqp+sbaleZDypgSPr9gOTVf/uTF5tgfjXSorLfxr88K8Dx8k?=
 =?us-ascii?Q?/Q64ZWUnjz2l6+eDQGjGrO2HARqVC/MBn2LfadE2GzEvVVHo7u20buDbm5AM?=
 =?us-ascii?Q?CTTEo0Xii39NUKWJ4e34oDqep4GfUHdZlY5Cspb/y0BWsaRGbFlYo3aZ4bF4?=
 =?us-ascii?Q?YAlz3qUYhQkgpLPziFPYd/s57wYcgCN0fcE6//io0/uUpMj8Zx2QQqokYUV2?=
 =?us-ascii?Q?ihfDH0do1DrWoXhJzSFnUbhDppQEBEaGRTVVpX3k?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56c53578-73e9-4cbf-03dd-08ddaef274f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2025 05:30:52.3725 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8OJ+uve/07Gmv5WQzTNDcbb62rSfK47yo+ciZCeirAnsxbJl2P1ZJE4AGTsB51nTaugfXYhE9Yhj1zJp7HJYqQfW3qz+8VOosGN18bt+Da0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6717
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

Hi Andrew, Anshuman,

> Subject: Re: [PATCH] mm/hugetlb: Don't crash when allocating a folio if t=
here
> are no resv
>=20
> On Wed, 18 Jun 2025 12:14:49 +0530 Anshuman Khandual
> <anshuman.khandual@arm.com> wrote:
>=20
> > > Therefore, prevent the above crash by replacing the VM_BUG_ON()
> > > with WARN_ON_ONCE() as there is no need to crash the system in
> > > this situation and instead we could just warn and fail the
> > > allocation.
> >
> > Why there are no reserved huge pages in such situations and also how
> > likely this might happen ? Is it recoverable ?
As described in the commit message above, the specific situation where this
happens is when we try to pin memfd folios before they are faulted-in.
Although, this is a valid thing to do, it is not the regular or the common
use-case. Let me explain this further with the following scenarios:
1) hugetlbfs_file_mmap()
    memfd_alloc_folio()
    hugetlb_fault()

2) memfd_alloc_folio()
    hugetlbfs_file_mmap()
    hugetlb_fault()

3) hugetlbfs_file_mmap()
    hugetlb_fault()
        alloc_hugetlb_folio()

3) is the most common use-case where first a memfd is allocated followed
by mmap(), user writes/updates and then the relevant folios are pinned
(memfd_pin_folios()). The BUG this patch is fixing occurs in 2) because we
try to pin the folios before hugetlbfs_file_mmap() is called. So, in this
situation we try to allocate the folios before pinning them but since we di=
d
not make any reservations, resv_huge_pages would be 0, leading to this issu=
e.

>=20
> I'm suspecting we don't know.
>=20
> > >
> > > Fixes: 26a8ea80929c ("mm/hugetlb: fix memfd_pin_folios
> resv_huge_pages leak")
>=20
> How was this arrived at?  This is merely the patch which added the assert=
ion.
Right, 26a8ea80929c is indeed the commit that introduced code that led to t=
his
BUG/crash. Would this not qualify for Fixes?

>=20
> > > Reported-by: syzbot+a504cb5bae4fe117ba94@syzkaller.appspotmail.com
> > > Closes: https://syzkaller.appspot.com/bug?extid=3Da504cb5bae4fe117ba9=
4
>=20
> I can't find any mailing report/discussion of this.  The Closes: takes
> us to the syskaller report which is a bit of a dead end.
My understanding is that the Closes tag can be associated with a URL for
a public bugtracker like Syzkaller. Would the following be a better Closes =
link:
https://lore.kernel.org/all/677928b5.050a0220.3b53b0.004d.GAE@google.com/T/

>=20
> I agree with the patch - converting a BUG into a WARN+recover is a good
> thing but as far as I can tell, we don't know what's causing this
> situation.
>=20
> syskaller has a C reproducer, if anyone is feeling brave.
The udmabuf selftest added in patch #3 of the other series can also reprodu=
ce=20
this issue and is a lot simpler.

Thanks,
Vivek

