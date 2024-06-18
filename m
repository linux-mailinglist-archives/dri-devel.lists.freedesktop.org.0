Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3EA190C3FE
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 08:49:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8AFF10E23D;
	Tue, 18 Jun 2024 06:49:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DEB/6BJg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A7A410E23D
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 06:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718693388; x=1750229388;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lpqFARRVqSwmUUI1Sbv/cir9XolFL9MoD0Tel70qN9U=;
 b=DEB/6BJgYaG48hSonIWnzG/aqRj8E2/nIGa5VdtCrp8eHtI7VywCJfQW
 1+h9Kms0JvcWD411LlvOwSSgKVgaZu2eXtVQ4KHTLP9IhL8eX7mU7vRVb
 R/ytB9wS9HKBgVPBef3L4Owpwt+hXo1SIBbzZXrcnyQw27ewWx/zA2a1X
 +JeaxvXr1vhPZyJWD2PRQynUOIWbfRpjKIPpGzPvmmOmMJtPyFjS7ERYO
 NOpR8Hr8uYv6Nb7NJ+AIfwvgjZmkAnPqrcgDgJhAqSaP04bUfodiJm02A
 PHeuRt9rcyk4XzjdlWbxnkHmscBvqblo+TJq+LLblwbo+wzcqiC8sl69I w==;
X-CSE-ConnectionGUID: FpLQkwCaRYOdCQtqySnZxw==
X-CSE-MsgGUID: fJpZidoZT8ecbo1omc5TAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="26962632"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="26962632"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 23:49:47 -0700
X-CSE-ConnectionGUID: ISUB+On7SWWc5/hbHoHX/A==
X-CSE-MsgGUID: 20eK4vllQEawF0IlWrZiQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="46566435"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jun 2024 23:49:47 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 17 Jun 2024 23:49:46 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 17 Jun 2024 23:49:46 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 17 Jun 2024 23:49:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b0WJp/CYv5c1Mzc00x9GbEMRlDp3kxrNXUdqOUPXNyqQ5gYicLuXUzc6kjMWW32TYBBhpZh4Zk1OJIMFLSTeEU4z4u2ydcofCDCbFYq58v7DXHqrJb85IoRUo3cV250pJppv7bxeCF8bDMJogPN9hsxGdHPjUlROKRYWtl6iFIhxi/4Ad3mBFnO4uTVM65MOUOCkF/1QiLGkcCx7pPisDGHxgiN+62fs36DaFv0Lh5TCKCrJMam8tKLQVj1oAtHxOlTTes9e3g/Lsgx2iWFU/9AMtmmD0NQ/zoy3smIDXfNmt4kH5k7BNGk8R/9dkIahXhKctiUXUXC/CRAtsVMZWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qv9nwBVRy4r71adP1zXDiC1iCKOG5mxCKzObbofbmH4=;
 b=X+zsPTgtq6TEctFudKtA8ZX+R/jvYTjMOuCGsy8UPQl41HvhYdF0iQ2gOyLBZSeQKJ8njRyyhlfjAJX5Bb6nk/8ydsO4op679HL6uFTslVpMZBrM5Cpi00NyMVC73YPi93ZXWAfcD6FrazKR7yx4CbFp36pn+PjS8cHETonaEadiTeSdA5YG4OBnLL2wVoUBuxG5SbyhOl/u2yPPMW/6HFn8tpwX5UGL7jsDn69TO/g+9fIY0ULsD1RRWmweZDy7XW2ayk+dCzmPMbbKj9KQmtahgHGDeZtedJFlWBQDYmwsL14qzQRqYNL6Kd6QQO3SxGxKKh7VgKmsNT3j8eJn4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by SA2PR11MB5036.namprd11.prod.outlook.com (2603:10b6:806:114::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Tue, 18 Jun
 2024 06:49:44 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%6]) with mapi id 15.20.7677.024; Tue, 18 Jun 2024
 06:49:44 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Oscar Salvador <osalvador@suse.de>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, David Hildenbrand
 <david@redhat.com>, Matthew Wilcox <willy@infradead.org>, Christoph Hellwig
 <hch@infradead.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, Hugh Dickins
 <hughd@google.com>, Peter Xu <peterx@redhat.com>, Gerd Hoffmann
 <kraxel@redhat.com>, "Kim, Dongwon" <dongwon.kim@intel.com>, "Chang, Junxiao"
 <junxiao.chang@intel.com>, Jason Gunthorpe <jgg@nvidia.com>, "Christoph
 Hellwig" <hch@lst.de>, Dave Airlie <airlied@redhat.com>
Subject: RE: [PATCH v15 3/9] mm/gup: Introduce memfd_pin_folios() for pinning
 memfd folios
Thread-Topic: [PATCH v15 3/9] mm/gup: Introduce memfd_pin_folios() for pinning
 memfd folios
Thread-Index: AQHavd72pqueI/j1rkmXtYUaouo4RrHGslKAgAWU04A=
Date: Tue, 18 Jun 2024 06:49:44 +0000
Message-ID: <IA0PR11MB71855F843839DD7D3BFB5DE6F8CE2@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20240613214741.1029446-1-vivek.kasireddy@intel.com>
 <20240613214741.1029446-4-vivek.kasireddy@intel.com>
 <ZmvNLSUgUgFETR0M@localhost.localdomain>
In-Reply-To: <ZmvNLSUgUgFETR0M@localhost.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|SA2PR11MB5036:EE_
x-ms-office365-filtering-correlation-id: bcdb1bfb-a199-41f4-3a50-08dc8f62d668
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230037|7416011|376011|1800799021|366013|38070700015; 
x-microsoft-antispam-message-info: =?us-ascii?Q?DZVzoztsIARdJIH6hO5WuU/5Y6FlTHco0/UYo44P6k9QmXymMIFh3UxiiI2+?=
 =?us-ascii?Q?qs98A7PCsnoCdIokITOiGDHxml4DHpjHVSKi9bmElTqWhIgj/V6xz9gcM+Vz?=
 =?us-ascii?Q?npGEGua1H1HsTDlnnWyX2P6o78cZxhlqMNybmbp1GtWThfZ8m2PATClW9rBG?=
 =?us-ascii?Q?TtQj2tDUq6Lyv27o5MG5tavUpr4Jv6NzG1QvhLYrE7zF1tbcOjbGVepehdTJ?=
 =?us-ascii?Q?fLwAJ+bP/d3k9odNkdcr+eucu3qgScPmG7VrsPo/rZlhb6nf/DUtrmncPbLC?=
 =?us-ascii?Q?ihlyUB8ECqJVDJImBGZmGQWjXmBqRzsfnE+FyKRgJ7Kt/cjFU0klYQxIeVz8?=
 =?us-ascii?Q?OCvFc5k/Zl+RJjaJhWdgbjRLkYmEgdJpxB0QvjB06pHZKB4KT1jZH6lsjmb+?=
 =?us-ascii?Q?XeYWQiXoikBM6eq26BJKPGfUzpu/ANPvx1OztKjNukWsmlsAnz0ydiXweWRE?=
 =?us-ascii?Q?zDRd1SshOTpKwGbNkWjFOeJ0NWOvvkFAzdwUO8kSeIaX55JDOB2ztL8gfxvy?=
 =?us-ascii?Q?M8hUjJN/1x+GtfPI9725GyVfqFzlp3P44aMLi11SxGm5dlABcJDqrhvE+n06?=
 =?us-ascii?Q?wKcDjZFKUAQI1wii3ItK58lQmSd2a1NceSkFX7PoaRDSaUJ/6bDjYsD3aIup?=
 =?us-ascii?Q?NZgPoe1fc3WUIEHh89cuR47f8I6TPqvjyMI81CfWalLm/k2KdVqZ/kRWI8c+?=
 =?us-ascii?Q?nYY2XDOUWb+i4NdQxzYZP0kapj/MooC8cIl35MohMtw0PajfiJ3JudkFFYKE?=
 =?us-ascii?Q?CYmZOfRhFGrwRA9GhqDdMjHQscaSpX+bH0DoRBW0YksAyp5j1j7GNUvWACJq?=
 =?us-ascii?Q?uobT4OcbvF0PoTIwlJUF8fqFlDlxYzgQLSy+TZNLidgZ/xad7evN34W1e9t1?=
 =?us-ascii?Q?STyFzRwHjXdx/5lOdGN++l7scHb1C/vtus6Lpn3tQEAEQtnQDdZZHI2EBLwS?=
 =?us-ascii?Q?9gpfR/TfWZIA9cLattf8N1W+h3ehKJIbUz9kqSqZfRsu/s/74rCY/pN++4q6?=
 =?us-ascii?Q?GiROu4VIRIwi1K5pGii1xW4ahDFnfY0VSgVi9HuZ/+9qcjJWUobymQY2bapp?=
 =?us-ascii?Q?7kugdPCcFKEIrNWshN5yALFKnt1mceyvoL7Ydb2t2smnVqzDyj7uisGZ3T44?=
 =?us-ascii?Q?+QVGNEaO5hKA3ETWmlAHJQYZwST01zcK1q7NzHzmisrAFOsV+LOQZ/OWquaM?=
 =?us-ascii?Q?cZMxOpWKfQZ5PI4sjPN8+SvGNB61twasGRoPpvat8WVCsC5xfWWjzTUHITCh?=
 =?us-ascii?Q?0NB7hS+fIrdLkJmi6QnFd8ajrS5Xy+eVOh3HBgUpbUWg+6fSyk8WEtD/2wyu?=
 =?us-ascii?Q?t2ygqYRf6bj3urLE1YNFnTSS23/G3/3/clAXVmlyba942b+ZHhxvFRJ+Oe4F?=
 =?us-ascii?Q?M0kHn6w=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(7416011)(376011)(1800799021)(366013)(38070700015); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?D4KAD5QB9wu0pcETUkPHn9aDiqyFPDXWUkqO64nWWEjiefLHb8ggIvgsCO0d?=
 =?us-ascii?Q?UfiKcwqmB1MEHqFQvpd2uF1THvIS2MoyZ+GPIqdxnwZBHE3fFaKGd+WGqF15?=
 =?us-ascii?Q?ZizOmKQsBE5IgYWCsfp3054thAvP+11CJGXasKdJRxg05roe52P8nC9bmQAp?=
 =?us-ascii?Q?UYv3XsZjNmnBeD88ttja83VVaEXoNGnNERJNY8Jx8n7ub5DPGc21uhtwf6bH?=
 =?us-ascii?Q?Zdcc/m1mTiFX1VwLn648ijaBCKz7p1V4eoUK1PQvfmHDBjVlDq/vXGuGIYkK?=
 =?us-ascii?Q?LPwcrLatBqmka9M5L46opQbeMvEXDJslUBK4V7fpt8BiGEhxLh4gsE2fVhlX?=
 =?us-ascii?Q?Ls+o29RWRV76TrX4v09zKC7Zuf9uDP2h5zQ0q23HFYby6te6IiKhfeV4VYRw?=
 =?us-ascii?Q?5M+ctFV/sV1UlVGxVA5zgcRz2Knl7Ciy2mmbCjl3V5SVm6cOaQD848eCmcYt?=
 =?us-ascii?Q?L0PQlX/SPHuU8S8+7B47A9uGOU1blFs8hy3M/if9Own97cghfeVdbLpCiVkb?=
 =?us-ascii?Q?eAchcjmLXHSGP6FbtZa/mTQ+fYWz7DTV2irlqyfHkNNyIvG6/arOw2ZNa/hn?=
 =?us-ascii?Q?aK/SSEEd3/3kdnIU16E2UYT5IC1GBbymxyxjBDgKGTwqUc3ulirvc7ugM3sA?=
 =?us-ascii?Q?aCoMhk9GlVBU0SwlMocAKl/vKkqBNNT1iYPSzoPwYznZbHKZ4oO5zpmEegms?=
 =?us-ascii?Q?eoRA51ZJSP0QHpsXgGXE6m0Ij6SwFZKpu1cn1egjIYYVtAuiumRtAY0k/WUH?=
 =?us-ascii?Q?1RqP48WXPHj5XygdGBBzXCAx29OBWKaZ0byZ6iutx5RVhpLruKxXPQ/DpYo3?=
 =?us-ascii?Q?BM4Mqg+GQRrpofyl63gUu3ruleJwOv5ixncK+1s1mZVnK315Js+jVYkqO6xf?=
 =?us-ascii?Q?xZkgqDVIdNX9bHJHEJ/pxZ7Ph7wyyElfqCVwwdesKDFFDEhBZbToR3MYkJoJ?=
 =?us-ascii?Q?vWsDbq5dvOacVbq+L31R/miXLr97/65nJ2jcueU7oLJ/mDvUd6F/IUK3Jvbk?=
 =?us-ascii?Q?nmOhUAYYu3CNQUyYH4dtVNtxNOxTmwyZpeq/cjvOk9WQ43EZvvy9cIWCfAg/?=
 =?us-ascii?Q?lW1psUAh3rlB0+fBNZTbTPnhbxOfgzk1tEwPiAbrmaUL9C4tddRYsW5UCBOk?=
 =?us-ascii?Q?vwLDiNTu2RIGoqLpaTRffe7ERcuIc2RCsfyAQ84zbcDjUrqHeLhNCF0vjzKk?=
 =?us-ascii?Q?rtIKnYH3W2uiEaBaeiYLQ9zngx4Ts702WwRbRTgFpBvn5iROdJDyR0pD9puM?=
 =?us-ascii?Q?cG+ShpBjA9+Bp3wl5akEIHwqbYPUyd3qHVmZlaHufbYy0EzjJuffgSa+2u2H?=
 =?us-ascii?Q?PeFF9+Gk+UtY8IkWXgjLYmels9xyDIde3iyv6U5pwOE1k9dvD6dyFg6ab55G?=
 =?us-ascii?Q?8VTDed1DpiwNVzjaVbV6PE+DWtnMXXKhdFJaNXvVa3h+pWY1JELI+BpunLO7?=
 =?us-ascii?Q?ZyOEd6iHbF+E/QQ2dF4iAl6eOMkUjLOyXc9dZZs9/OiROSKoaV/4+jWvuG2G?=
 =?us-ascii?Q?m0AnVv8HFfy9bsGH1Uc6YVduDmLpJxyaUuIPUDvw5Rg7BnTT1qIBWy54k6YA?=
 =?us-ascii?Q?QXF0jSWgW126gZ9bNgmK1QD2MI5oAdqW7tvUiNHK?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcdb1bfb-a199-41f4-3a50-08dc8f62d668
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2024 06:49:44.6373 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cFw70oplDIf7uS3EWOv5dYXJQjj5SJlW6hhLoyzbepEwcQRzF926ILHeXEpmofiBI1MVPlG7qOnesgXhESfqOlLB3Nbu+zpACyACy9GvrSk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5036
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

Hi Oscar,

>=20
> On Thu, Jun 13, 2024 at 02:42:05PM -0700, Vivek Kasireddy wrote:
> > For drivers that would like to longterm-pin the folios associated
> > with a memfd, the memfd_pin_folios() API provides an option to
> > not only pin the folios via FOLL_PIN but also to check and migrate
> > them if they reside in movable zone or CMA block. This API
> > currently works with memfds but it should work with any files
> > that belong to either shmemfs or hugetlbfs. Files belonging to
> > other filesystems are rejected for now.
> >
> > The folios need to be located first before pinning them via FOLL_PIN.
> > If they are found in the page cache, they can be immediately pinned.
> > Otherwise, they need to be allocated using the filesystem specific
> > APIs and then pinned.
> >
> > Cc: David Hildenbrand <david@redhat.com>
> > Cc: Matthew Wilcox (Oracle) <willy@infradead.org>
> > Cc: Christoph Hellwig <hch@infradead.org>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: Hugh Dickins <hughd@google.com>
> > Cc: Peter Xu <peterx@redhat.com>
> > Cc: Gerd Hoffmann <kraxel@redhat.com>
> > Cc: Dongwon Kim <dongwon.kim@intel.com>
> > Cc: Junxiao Chang <junxiao.chang@intel.com>
> > Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> > Reviewed-by: Jason Gunthorpe <jgg@nvidia.com> (v2)
> > Reviewed-by: David Hildenbrand <david@redhat.com> (v3)
> > Reviewed-by: Christoph Hellwig <hch@lst.de> (v6)
> > Acked-by: Dave Airlie <airlied@redhat.com>
> > Acked-by: Gerd Hoffmann <kraxel@redhat.com>
> > Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> > ---
> ...
> > +struct folio *memfd_alloc_folio(struct file *memfd, pgoff_t idx)
> > +{
> > +#ifdef CONFIG_HUGETLB_PAGE
> > +	struct folio *folio;
> > +	int err;
> > +
> > +	if (is_file_hugepages(memfd)) {
> > +		folio =3D alloc_hugetlb_folio_nodemask(hstate_file(memfd),
> > +						     NUMA_NO_NODE,
> > +						     NULL,
> > +						     GFP_USER,
> > +						     false);
>=20
> I dislike the direct use of GFP_USER there, because it opens the door for=
 new
> users to start passing their own GFP_ flags directly into hugetlb code, w=
hich
> is not optimal, and something I would really like to prevent.
>=20
> Hugetlb pages, until now, they have been mapped only to userspace and
> only used
> in there, and they can or cannot be migrated based on its size, and that =
is
> why
> we have 'htlb_alloc_mask'.
>=20
> Now, you need something special because 1) these pages might need to be
> accessible by
> some DMA driver, so you have HIGHMEM contraints and 2) cannot be
> migrated away.
> Ok, but I see this as an exception, and it should really be called out
> here.
>=20
>  gfp_t =3D htlb_alloc_mask;
>=20
>  /*
>   * These pages will be accessible by a DMA driver, so we have zone memor=
y
>   * constraints where we can alloc from.
>   * Also, these pages will be pinned for an undefinied amount of time, so=
 do
>   * not expect them to be able to be migrated away.
>   */
>  gfp &=3D  ~(__GFP_HIGHMEM | __GFP_MOVABLE)
>=20
> So it is clear what is going on here.
Sounds good; will send a v16 with your suggestions included.

Thanks,
Vivek

>=20
> --
> Oscar Salvador
> SUSE Labs
