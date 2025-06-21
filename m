Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8DFAE26F0
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jun 2025 04:03:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7CE810E259;
	Sat, 21 Jun 2025 02:03:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GmphRhAe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5489F10E259
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jun 2025 02:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750471382; x=1782007382;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fnF0N5xgMkI5r3mG8hRSoKTd5H/wPXH0/JUYHtjxWo0=;
 b=GmphRhAenI7cr2Vx1DegKvBp/nZ1GhVtaOj4nLzXholA1igL6ri8dW3k
 oTenaaEfqBXXZPGzPFJHADhDBIRA8kGIQVwKjzv9c4SqiyICSnBXuk43a
 9DIhvTcrNVCR6b2vXRiynJs5n9rQ+/7JmTRaC36a8XF9P6v2TCuqredty
 0tHlxFLRdbelLxbbFLqCpMkYp3lUbChX7OJcbw8IcARLdTxjfaGmZsF78
 UHCN7rySWZVIythqYQ3fDj2pkqZkUWEiQw2FJ8JQo9Pqo0zmBEF3NiuDw
 Kk+QK1Klj2cHOOiZo0d1oGYH0F9ll704UJHjXbl0T6RXahDYRR6KjOUcd Q==;
X-CSE-ConnectionGUID: xcGxjNJ4SsKjRD9H4VfWLA==
X-CSE-MsgGUID: Ng/fFeK8QDac9+l/H/RjYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="63011869"
X-IronPort-AV: E=Sophos;i="6.16,253,1744095600"; d="scan'208";a="63011869"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2025 19:02:57 -0700
X-CSE-ConnectionGUID: huGKI5sjTz66OVij+ztvvA==
X-CSE-MsgGUID: 6ctEZh9WSZWaTSXjlfLZcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,253,1744095600"; d="scan'208";a="181939564"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2025 19:02:56 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 20 Jun 2025 19:02:55 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 20 Jun 2025 19:02:55 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.67) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 20 Jun 2025 19:02:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nrw0b+bxPmGCzlaabwyXwz6/GMX+NssiqOVpQrikU8/fclHFL1FBdvDtUnSEAZEG7tyUxRn4+WJQA2RFJ8sucqiqOWEGpJbqgOgCWPXfubUe0pbZi/P9gbhrWCAyN9mBN6UrrNH/GpHTBqR3kfniMN85KnwvVLtnxQcdEPm9qtsBq6tx+zvmezoIPo2gvbpyaweb3Ny+jb+oaTcsNnazGySbzidrRu8MtKKp+ny+cVsjikhuahhgN2mgd4rJvahmhdYxWdEnqqOo16QmukCOPl5dZJaH3uHB5ZwXKJ18RHqCb/mD8w2xdXea9FY++4Ztjuo5yS+hYzNlnDSgp+rK6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hzsgwJdv3yIO+Y/x2rZcm0d0YlrWUtpMYRgFFaT03d8=;
 b=ZFU4Fg2G5g7Ws0Mp9H90neNbAuC7mdatAevUzPUK++TDA6QyzV0BzO5h6k9f49Dl/p177bt0vd9o+26teMp24PdR/0ibKqtVBGbgEMjoSoFe8H87Qw8nuWiWDXnkOP2X/DDxQSgsUp4OTFbt/yyMZVjm4Jgm/gBlQ9RRVlRbG/wISzqIHCdEAFeXjm0ScFpYE5pdNWnQdbiu8tSQyGjHJfB0qkw3yl/SsgIh2wgWE9zOvvz1d8tZ8+6FS4HSQWGR/U8i0R6xAKIb0X0wl+qlJBZcICNtpMFrSrmVXbLkWoiLshmj5nCXvV6bleYIdouDUSi9HzpVnjaF3NXODjTIBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by SJ2PR11MB8372.namprd11.prod.outlook.com (2603:10b6:a03:539::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.26; Sat, 21 Jun
 2025 02:02:51 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%3]) with mapi id 15.20.8857.020; Sat, 21 Jun 2025
 02:02:51 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Oscar Salvador <osalvador@suse.de>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "syzbot+a504cb5bae4fe117ba94@syzkaller.appspotmail.com"
 <syzbot+a504cb5bae4fe117ba94@syzkaller.appspotmail.com>, Steve Sistare
 <steven.sistare@oracle.com>, Muchun Song <muchun.song@linux.dev>, "David
 Hildenbrand" <david@redhat.com>, Andrew Morton <akpm@linux-foundation.org>
Subject: RE: [PATCH] mm/hugetlb: Don't crash when allocating a folio if there
 are no resv
Thread-Topic: [PATCH] mm/hugetlb: Don't crash when allocating a folio if there
 are no resv
Thread-Index: AQHb4BJSsw569givP0yLQ5888kYOd7QKguwAgAHFwlA=
Date: Sat, 21 Jun 2025 02:02:50 +0000
Message-ID: <IA0PR11MB7185B8EF42CB910E4043194FF87FA@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20250618052840.1036164-1-vivek.kasireddy@intel.com>
 <aFQWWFGSKMpdk5k4@localhost.localdomain>
In-Reply-To: <aFQWWFGSKMpdk5k4@localhost.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|SJ2PR11MB8372:EE_
x-ms-office365-filtering-correlation-id: 5ebc0ec1-8db6-4ec0-8db0-08ddb067ba51
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?pk5iybkQbpcPEDlLmdEtnyBxDhNOUAPxhxaWfHtcDUZXWKR+q+yCko3DWpEo?=
 =?us-ascii?Q?EoSL53+GiLaAVJSXY0OSN4oaaXoVoV/aqcUCMqP5XL9Wzwi0pAUkkBdEutJ/?=
 =?us-ascii?Q?4tCFGLKPqUiqydce2No5/SsWwNH8msqmoKt/6dTlOTfGts0J2nXRKxONBUI2?=
 =?us-ascii?Q?zBEnwgPb7GXS0a8oZm0tI40080nI7mjyWUJR0SSBLGTXcaU4rmw4wfVfuwMb?=
 =?us-ascii?Q?z1B9h4rPF9qUToiz/WBduCv+egi0SO1qD+LhDTqSyRCAGVs2oVWIqD1eOh7Z?=
 =?us-ascii?Q?1U16bpTghFdUEr6X+jOZHb6MMmzgK5IoVR20MMARYcZqJtYl3DnppMkUQmPZ?=
 =?us-ascii?Q?AOeXaka3NzwSXD9Ya7Ez6UI1726o36dP3dzYk8snVFKobM5npv6QNaLxYTJM?=
 =?us-ascii?Q?f7uqaDzw5Zj8reee9bqr0tUn5by3sKa1fzOoGtaI+d80tGgfiXtWcOs5fJ4E?=
 =?us-ascii?Q?WS1RWLP3662ncb4fZFnvxe9129cFMAVu9AaD2hOqYeSkpliKA4Tr7N/ukRZG?=
 =?us-ascii?Q?jPLQoyzb+53g/IRXg8+IbK8bn6aSZ3Ps5BIzrjuU3FRefReIzeO7Y34w9qI6?=
 =?us-ascii?Q?IXhNQlmel8/wunxaySM88ow5GI0P9aq3DSxLRixpCJKLJyyhwALFF6JXxnnA?=
 =?us-ascii?Q?JaHY7UAZRFuVbioBr408ZMgWXK4f9cu/BN74Iory6tW2YOcG94glZa1M00GA?=
 =?us-ascii?Q?dArUk0d8hk+eTQqmvs12B7rTzO5kL41P3eT3kh+rd43akAquSQ5JXOdZDHKS?=
 =?us-ascii?Q?wjUdYENj57ZBLWf59TAiMgry0XgJiwwc+NMT1Y3Jb457mmgPnkmaECSfHU1q?=
 =?us-ascii?Q?zfH7PjvupDOAX/ntjuFkeT78eKpIJTHphFefcwTQEObETLGp6GsdgH6+VI5K?=
 =?us-ascii?Q?aEE7Tgcdb16lpTMYnUuDlwrHx86GvNf/F/3oGqEHs0p6BeX1+3FdBm5bhjzG?=
 =?us-ascii?Q?YRKl1TZOCguxDy3SQBQQo0/df/0Lm7RBnGOlNCm56C6H1G6v/8kcBUiZagmo?=
 =?us-ascii?Q?hqT+QQz8mbgM6173MaOngZnED0ZFvrQ7MEwhCWToXhM5Wl1KfNVtLvh8WEtp?=
 =?us-ascii?Q?Yx1l+GLxv18vPZstuJ+9/U9oeAps0own31ObEFmgjYLZNDwWQtImkXnpzOt+?=
 =?us-ascii?Q?7t2YXly1YbjctdIrFp/y8Ai+2wqyaXYRw0GTxRoe9fuRo4wKyuZ5y/LLexkZ?=
 =?us-ascii?Q?MtXeCr5/ueyI/Mt80dyHlZxdPAsKyoLLMBR/kmCX9/WpLCpb8ijAA4Ss5uyo?=
 =?us-ascii?Q?XkAtdSIZgEjK/FVOyXztNe+aUMfmpB74kU5plK/ILKHNcPj9zPh+NuQ5vF2L?=
 =?us-ascii?Q?jun/aLV7MWOV3cBOLqdewJdya7JabhXsXORlDkiOaFaipr2u/uKmYNbSQAyZ?=
 =?us-ascii?Q?/2NOHnCIIUftDdWwxv0Ru9ESon0kBZyZjgVEvteIOFJKnEJYI8SpS3mHPSi3?=
 =?us-ascii?Q?aOFLoeP2eWo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Ac1LWkKZr6Ngig5V0FjjCrlO9k8vCwIVRA3AshbramgWSOdLZ8laGfyZ5B2I?=
 =?us-ascii?Q?M0XGzbXWj0EkNhqeLiGCTbEdqR800qcWaWzhQlVQ1fBWQwBifICQj2lnKczy?=
 =?us-ascii?Q?2PmwNBRVFWTxldc4P4DSA/dac+A/ZviMsNLKIJ7Iqcj/6BSOvqnx2MqUQLzz?=
 =?us-ascii?Q?mknNxWZ2xNvjJededAPCU5+T/5rd7RywN724kO88hYaozXS0ElNq80OLvv4i?=
 =?us-ascii?Q?gVztyicS2rbF/VdCG+lx1Ptyh/TmyIVBMyWWkmFYMEvmeju/Ktilw38JiaRg?=
 =?us-ascii?Q?r97lU6Sng2wJ3Jy2gaiBVOUTvETp0Ju/EdtPtRkplhEucnYiTzulAHTmY990?=
 =?us-ascii?Q?sohVyy/UqDrfD26cTnZph9DZs8B2PxtSPrIjJG7JB3fTgVtrWyf6vJEXX/YL?=
 =?us-ascii?Q?AYzDk03OB82auWDU0jcbvMdJT5oyFLRhgOu3XIKhxn7+leeUUS43VTqPEF1K?=
 =?us-ascii?Q?UvvlrLUm6FNXlFRY32FuS446SoIEwtraszg0Q8C/5y6N7quTFM0CWU1CnfSK?=
 =?us-ascii?Q?vqrnM7diLFgZP1TOKnBwbAjUxawxy+IyiZeTm3fzIPjfsTKxqQqDWNLMYxHQ?=
 =?us-ascii?Q?skVHpuhD3Bi9OHI0pSg9t5fqz6GAYiqHiHDFizk4V61dtOwTO79U2gtqFr7q?=
 =?us-ascii?Q?41FhYDUF4NcP9ZFzHmqT1uduxuOpP8SsKNWkTBevr6GCfMcn46C2xmm9FzKT?=
 =?us-ascii?Q?kNXJbdXcF/pliaAIGy3fBF9DlPFhh/sKf9azMXJjBNgRtXwP7tjLKf/5tCbV?=
 =?us-ascii?Q?MIhpoE5of2gIiIT2FIvurNL7InPrfFJ668cTLtgplmNWBGpMAfrzpnAg6ZJP?=
 =?us-ascii?Q?7POx53GEi2N/lqrf3Hw/xRJXKPMtlwmqPpB2OgnEe8vypicQSEEx/fUYG8pl?=
 =?us-ascii?Q?e4gF/R8kJJ/qajTEXLQe5ncQV7PQl0JectTdEtR+N7JY4hRKSgI+fzKk1RAK?=
 =?us-ascii?Q?IB9jCP6U1DZaOSDfxzcRRfY0rzYDE0bbbam9T/O7Y3K8+O5/a2Qr39alb6F6?=
 =?us-ascii?Q?TesqCra2rG1Dq+MHU4nZZ1jryjPIdSUAiHyEkNsOLZslWRtVj5i+IS0rD/hF?=
 =?us-ascii?Q?/GiziWdhnikFRijOq8NzLeT51Lgul1y0T2MbxPCxUaYsPLeh7EDJJ3dDgsPr?=
 =?us-ascii?Q?y36YKZxUuf6hJ4h6fuBSO4t3dDlrJKezqd3r+RCgSS1BKl5IMWM3mR9LgqkZ?=
 =?us-ascii?Q?x/oBAgdReAd50qh50L+6ANTj4IKG7q7qeR/bUlwYar+pq6VheMOvqdc80kE3?=
 =?us-ascii?Q?N2TATHugx/RgoNr4i+gBxNCHiVftT8nFFa7cQ1ZoDKoZTjGE7rccb4qcSsfe?=
 =?us-ascii?Q?aC0qd+FRFCvC8s2aYNVDqiGN3KlPxRqAF6JZhVEfbOH7VZvgHTUp78N4CxtN?=
 =?us-ascii?Q?J9Knyif2P573KlVvY0CgEBgvyKEy4mWqKIuAueAAZPGP6/+Iv1iOiNiFnZui?=
 =?us-ascii?Q?FzZGJgo5vXM5eHuP3FTmt0veh8hniEiyTPXb8ei3qgtsv2NFbrtKBlQuO5Vz?=
 =?us-ascii?Q?PGA2Bw/QFjFpkROb1NBULEmC+TsQKLRsdwT99NGjp/+ZvJJadi9151uv9DQ8?=
 =?us-ascii?Q?WL4VstY0pRivVZVdFwUlUBuXCVD0Z5CKe/QgjJyv?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ebc0ec1-8db6-4ec0-8db0-08ddb067ba51
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2025 02:02:50.9934 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BldGjxqpTzs2PxUtG8NsbfkbNQPeyUpZo3P2wjufsDM6gtp8cTRmuq/HM5WxHlY2Wx8f410lLalWb/uxkVJ4sv+bfG1XYf7p4NsRpIDYSB4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8372
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

> Subject: Re: [PATCH] mm/hugetlb: Don't crash when allocating a folio if t=
here
> are no resv
>=20
> On Tue, Jun 17, 2025 at 10:28:40PM -0700, Vivek Kasireddy wrote:
> > There are cases when we try to pin a folio but discover that it has
> > not been faulted-in. So, we try to allocate it in memfd_alloc_folio()
> > but there is a chance that we might encounter a fatal crash/failure
> > (VM_BUG_ON(!h->resv_huge_pages) in alloc_hugetlb_folio_reserve()) if
> > there are no active reservations at that instant. This issue was
> > reported by syzbot:
> >
> > kernel BUG at mm/hugetlb.c:2403!
> > Oops: invalid opcode: 0000 [#1] PREEMPT SMP KASAN NOPTI
> > CPU: 0 UID: 0 PID: 5315 Comm: syz.0.0 Not tainted
> > 6.13.0-rc5-syzkaller-00161-g63676eefb7a0 #0
> > Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS
> > 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
> > RIP: 0010:alloc_hugetlb_folio_reserve+0xbc/0xc0 mm/hugetlb.c:2403
> > Code: 1f eb 05 e8 56 18 a0 ff 48 c7 c7 40 56 61 8e e8 ba 21 cc 09 4c 89
> > f0 5b 41 5c 41 5e 41 5f 5d c3 cc cc cc cc e8 35 18 a0 ff 90 <0f> 0b 66
> > 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f
> > RSP: 0018:ffffc9000d3d77f8 EFLAGS: 00010087
> > RAX: ffffffff81ff6beb RBX: 0000000000000000 RCX: 0000000000100000
> > RDX: ffffc9000e51a000 RSI: 00000000000003ec RDI: 00000000000003ed
> > RBP: 1ffffffff34810d9 R08: ffffffff81ff6ba3 R09: 1ffffd4000093005
> > R10: dffffc0000000000 R11: fffff94000093006 R12: dffffc0000000000
> > R13: dffffc0000000000 R14: ffffea0000498000 R15: ffffffff9a4086c8
> > FS:  00007f77ac12e6c0(0000) GS:ffff88801fc00000(0000)
> > knlGS:0000000000000000
> > CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > CR2: 00007f77ab54b170 CR3: 0000000040b70000 CR4: 0000000000352ef0
> > DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> > DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> > Call Trace:
> >  <TASK>
> >  memfd_alloc_folio+0x1bd/0x370 mm/memfd.c:88
> >  memfd_pin_folios+0xf10/0x1570 mm/gup.c:3750
> >  udmabuf_pin_folios drivers/dma-buf/udmabuf.c:346 [inline]
> >  udmabuf_create+0x70e/0x10c0 drivers/dma-buf/udmabuf.c:443
> >  udmabuf_ioctl_create drivers/dma-buf/udmabuf.c:495 [inline]
> >  udmabuf_ioctl+0x301/0x4e0 drivers/dma-buf/udmabuf.c:526
> >  vfs_ioctl fs/ioctl.c:51 [inline]
> >  __do_sys_ioctl fs/ioctl.c:906 [inline]
> >  __se_sys_ioctl+0xf5/0x170 fs/ioctl.c:892
> >  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
> >  do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
> >  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> >
> > Therefore, prevent the above crash by replacing the VM_BUG_ON()
> > with WARN_ON_ONCE() as there is no need to crash the system in
> > this situation and instead we could just warn and fail the
> > allocation.
> >
> > Fixes: 26a8ea80929c ("mm/hugetlb: fix memfd_pin_folios resv_huge_pages
> leak")
> > Reported-by: syzbot+a504cb5bae4fe117ba94@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=3Da504cb5bae4fe117ba94
> > Cc: Steve Sistare <steven.sistare@oracle.com>
> > Cc: Muchun Song <muchun.song@linux.dev>
> > Cc: David Hildenbrand <david@redhat.com>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
>=20
> Who is supossed to reserve these hugepages?
> hugetlb_reserve_pages() is only called at mmap/file setup, and you mentio=
n
> that
> you try to allocate the folios even before mmap, so who's in charge of
> making those reservations for you?
In this specific case, I would say the caller (memfd_alloc_folio()) should =
be the
one making the reservation before it tries to allocate the folio. And, the =
other
series you commented on is trying to do just that.

However, as mentioned in the other thread (replying to Andrew and Anshuman)=
,
this is a very uncommon use-case as hugetlbfs_file_mmap() is not called fir=
st.
So, this patch is only trying to prevent the crash but the actual underlyin=
g problem
(no reservation) is addressed in the other series.

Thanks,
Vivek

>=20
>=20
>=20
> --
> Oscar Salvador
> SUSE Labs
