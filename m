Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA50ACFC6E
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 08:14:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61B5110E130;
	Fri,  6 Jun 2025 06:14:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UkeKRCW/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 098AC10E130
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jun 2025 06:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749190471; x=1780726471;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=F61Lk358XW/UkLJJxafosFTjPeHYUoFZotUNByDu7sY=;
 b=UkeKRCW/QrifMvC69kdU8xEQ+kQ9qMto2SzcTR8/3Hg/oBlG+/lBOYGL
 GtaTUjkqEcQr3/rhssvitzdmY2CElVdC1aZ+HIzQbJZ3pvzja3Co/l3SO
 oO8MOQPdgUV4Kt3qBwZPrkPikmDe6xYuzzFJUUkaaM/m/pcE9J3lvci5l
 NyOK/o9JjJlhV5kQ0GEeNr1GUiYGWo3uM55YZb6h8V2LOPNkNdK/gnNc+
 V4njJde5YpqE7NKs2OYItzQ7xTfDm1QaV7lV20EYfBcN+oYSlMrM+uDiO
 mmcZZpjczO5b6Oso4ZxW17QxuKLHzrZ7rlLCuJTuD7GrLhTVCoVmy/25z A==;
X-CSE-ConnectionGUID: 6FTbtO1NTqaCUtvS8dwfLQ==
X-CSE-MsgGUID: Xto1sh7ZT2GHPiYa8xuB6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="50442094"
X-IronPort-AV: E=Sophos;i="6.16,214,1744095600"; d="scan'208";a="50442094"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 23:14:30 -0700
X-CSE-ConnectionGUID: I/29D2RkTNC/rwDkGcp6YQ==
X-CSE-MsgGUID: 7ym1vqf7RaSf7XtkSG30gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,214,1744095600"; d="scan'208";a="176593899"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 23:14:29 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 5 Jun 2025 23:14:28 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 5 Jun 2025 23:14:28 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.88)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 5 Jun 2025 23:14:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=te2MpEe2udivC3h2naHmW4W6ayWBLYYwUoyJR2jFjFhM5vqI26e+sfCKrBHNLeQHkny4WJAdGSZZH6sy5GfljzmsgjIWqy21ofkx9icbz6j1cXqZFGH64qbI3J275ykiGSMb3OSH84jVUZYDp2wTZZA+5mFdvzquwHcyHiG5uE6yL3whl+TX5m5GXQI1lCOeVQaK04TgJEA+4sKxM1BSGbUPg+vhALZgm2toE+wLVb/SJizu4s8GlW0cWy+GmxlwxUvHpQJEr18kQZpfN3yDzZCq+6G58hk4Q4CDUO5a1IuhVj4G6h3kGE3KBJxLBOprkq12RxJNHHd6C6JE9OOzng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FFrD7x+g+sTKrU8SS91mweC2jhQO6aL/8A8C+BsoKsc=;
 b=ULwLkZwC2EHQDkRN/wfZpXZw3jwdIvjFq02ljmPSZRIqEtC5laP0/m8XWUCbQd8CMPCCFNwXok1o7CmEnZY+RoTbP1BLahK7DGmi3Dfsnsv3Ia8EjeNs6yCaFXpl7Nm4Tpiml4M4h6HysXVHMNqZ9ZCUZZui0tderlbwE3GlcO5xxeoX5hQrWXbMttkjpvWva5zQZYqnwuiTpgIKfAKHsoFz4ier/qqMxrF6egqs1IyfBELPkxsHXmNGB3CCMXvtLbuf2Tm3ZMX3UbS9WrTfiJXBuRlrmu9fRt2XOAyDE45LzZd0bxFQ2RcQzFiJvTd2O6U/LK95xsd5jdpSym/Rfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by CO1PR11MB4980.namprd11.prod.outlook.com (2603:10b6:303:98::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Fri, 6 Jun
 2025 06:14:06 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%4]) with mapi id 15.20.8792.034; Fri, 6 Jun 2025
 06:14:06 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Steve Sistare
 <steven.sistare@oracle.com>, Muchun Song <muchun.song@linux.dev>, "David
 Hildenbrand" <david@redhat.com>
Subject: RE: [PATCH v3 1/3] mm/hugetlb: Make hugetlb_reserve_pages() return nr
 of entries updated
Thread-Topic: [PATCH v3 1/3] mm/hugetlb: Make hugetlb_reserve_pages() return
 nr of entries updated
Thread-Index: AQHbyhCB85ggCz+4Lk6TetDGBu1SWbPzvqWAgAFQFOA=
Date: Fri, 6 Jun 2025 06:14:06 +0000
Message-ID: <IA0PR11MB7185D6156828CB310CDBEB41F86EA@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20250521052119.1105530-1-vivek.kasireddy@intel.com>
 <20250521052119.1105530-2-vivek.kasireddy@intel.com>
 <20250604163543.62d543d7ecce5afb835aae98@linux-foundation.org>
In-Reply-To: <20250604163543.62d543d7ecce5afb835aae98@linux-foundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|CO1PR11MB4980:EE_
x-ms-office365-filtering-correlation-id: 18203a7f-91a4-411e-3941-08dda4c15799
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?qBxfoFaAMz0klePuO00Ldeg/lAdWIPoD93qsjq6HJJtig07X1Z4F19n5oZe4?=
 =?us-ascii?Q?TMqtednJGtka9StwVsaTrFnmhCEZTRscmecdEeoMSEDrtAYSZafdTMl+wkSg?=
 =?us-ascii?Q?99XoIblTjCfL4WB+j6ltdB4YQRstUzsl9hUtHGQZiUY1QUBstHRfAKKZDrC+?=
 =?us-ascii?Q?XbGVSRU863sGtNxSJ/XEFyU1LhKtJzoARGVb7EPmyDKgSPFaW2iZoG7o8MlQ?=
 =?us-ascii?Q?g7vqbmVmI5D+VKOzAM308W28ui/8G3WwxHJ5Lj2urtkI0MfjMUyGE5xv55rg?=
 =?us-ascii?Q?tcZnVpMf/8Jg8Pq8d0dg/N8qNE6Hh7aGnuS4IgUSs8TQZXtbMDqcUSUVKw6R?=
 =?us-ascii?Q?Sqo7YlzhkEjkHNMqEI68E9hnLgMkMyy9rECUIPrD2t377/k7S6B96jCGL9zC?=
 =?us-ascii?Q?5G04rdkjAlBleqyV5ZJCGOD9R9/NrkDekIiMbmVB+0yYM2CXcnrEpuKqT4wX?=
 =?us-ascii?Q?HjM2Be0UwKWuqgjmfCay+orMAM8ApR21LrYLbi+yMy23yhPq3xGM66jKqiOh?=
 =?us-ascii?Q?H9CYIpGcnP9kdclT5O6b88ScIFEetSuZ+v0vTKY6/M61WYkPzXvAClHiQA1j?=
 =?us-ascii?Q?hfyV9zraRNQiz1T03h80MfwyFiGncFshhGZ9ZSsISVDjuqeKgifj87RURQD5?=
 =?us-ascii?Q?3znk0wJrxN+/Aos20n9EAvaXIges+w72WwGbeIg71Ftn58AilNAgSCTWHVue?=
 =?us-ascii?Q?Gq+ITUcbDxSpvsRc6ViSro4vVwO2VhuBVss/cVfCBLUp0997HIyLf1zDlTZs?=
 =?us-ascii?Q?JKOY4MedgsfwaOwpPCwNaboxreIbDwLmhlegima7Is8ucL1oJC9LkTX9HLzU?=
 =?us-ascii?Q?kt/EvH75k3otwOy2QuJUhIBdQkDj0hKjbmene6P4bg4JCd+IGwIsVqb+n8Si?=
 =?us-ascii?Q?lFlfo7jCQLR+4r/Jg7QjNPta+B59Yegsxjkm5TbBwxtovulF1OHb5xjvbzz4?=
 =?us-ascii?Q?lXBhuy/4Vs1Gd3usgsBPjWhNm46EiaogmFohm81PcZrjZtaFunO+TqO2bAJr?=
 =?us-ascii?Q?B+t9eXf1W2tavqFX+y2GIaE5azLHsAN29vq5ZGhRIJ/Fmo97vsToS6006Pp4?=
 =?us-ascii?Q?WqebK8ySu6jILBmabM1bt/7/wt2iOg6UyU4bDT7oy6V6bwTNAwbxtz9MUOA/?=
 =?us-ascii?Q?EjkRVAVwOrlbTj3a41Uzz0+TInuMI7+LmH0yix45gyudPx8StlyhBJhl4EHJ?=
 =?us-ascii?Q?EJx1rRjn75x8s5vvNjdcTmJiE7rOnzwSG2T9wk2ArDVObHqPTqgKb/q5czQ8?=
 =?us-ascii?Q?28pLgyLoKLA45hpEs0F2rH/mq2XvAfnzVw/6p5ACl1eo+ZAx0UPcG+b4+erE?=
 =?us-ascii?Q?p+ntS8IzISSJMr6VEgW0C1DeIA5xd5nIj6I4SyMqT3ajBNLKHPFDWtnWuS2H?=
 =?us-ascii?Q?E7QPc1Ev0XJ39Rxu4A0sKzkpGC9dGYDKO4uM8WY1nbjTPHhLteBay/7ieqh5?=
 =?us-ascii?Q?z00VlapabI1OF1kPQaQh6wH9M0uNygvlGN9uV1JTOpDEWHqrQNXxFw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?AWGKrA4Q1FKReTLipG3KfqayGCSt/XwUseroNfpaRzuWC18x8xIesn1kMXSx?=
 =?us-ascii?Q?UDvjNXX5HILx8C7J5wP3sBYfJZa6JuS1cNmr0sMJ1QFqwl0Lq5BTzpfsyPoJ?=
 =?us-ascii?Q?QSsoXpjgoQw84aAe9iAM7Z7/5yT9GAuwQvHm4FAPHD99af5ymyEikvYvO9n1?=
 =?us-ascii?Q?WQ1RWR/zlP2wcsHKAP3uQZhIvhqi/ukVkv5TffX/3jXHNPo+d6xbDiULN/bF?=
 =?us-ascii?Q?F2heB7qKuZp/rcaMQJkCndmuqJta00d5RymaKuEOzvaQWpOlO9Qu51m6pbod?=
 =?us-ascii?Q?pTSJPyzW5uDKWPwC9rc7zSUsPPzZ+xQMOScptNKCsVeyhix2/whSDYK/xsQU?=
 =?us-ascii?Q?22zN7AUQ/d1HYtS/oo9mXoqoSYMTrH0/cm2hVuPdWmK7ED5v3mxwFh1LQ/H/?=
 =?us-ascii?Q?ZkDSQYZwNGdpA5xTB0QycWJHZfOAFhaLfX0Su+vd0rgLfg5hBFSCrXDiO5EN?=
 =?us-ascii?Q?KJhv1MWm/ONlAxdDdVYY4u4i+lj1fRR3CiwbzJs+IDiqO8umHsnYwvfVnspD?=
 =?us-ascii?Q?hXX6z4CKnvpLdkCpjFhJCuKhyQ/pjLCnsjM5gSv78oKld5Y1fftIMcFCHXYO?=
 =?us-ascii?Q?v0m8L8VGwrC6ZZTcahxyso5vp3W0AF02KZQEgxNAhq4YZMrErXicjidqIxFB?=
 =?us-ascii?Q?LKQ9jcNzUuqaGMbqS9meDSp/ReHAwfxkCNlYoYLrjEywmzQQeX/RIEddg5X8?=
 =?us-ascii?Q?nEvVTCt6+BBaTUk4KfjwJvBlBIOB94Shj7xKScza/Jmba4MOC8KxMPIE3bi7?=
 =?us-ascii?Q?HOnHp1k9EBv1/sIDp5R6+9i1cZ76CC9NCT5AJLYNqKDK1aLqgukX7R+K8N0v?=
 =?us-ascii?Q?fRbA7375shLaw1wRiOIoogir0hJ0b2icqeuLjvSwL3zrfPHMNoHbzGRG85bW?=
 =?us-ascii?Q?0RV3ET4jZ+2zSpLAWmIfzaG0H2HzhEXlo7hlkCpHLBylUerc8lG6CxnvuJPe?=
 =?us-ascii?Q?KBMUl44t8Vla0YsC9fKrcBSG6rGCjKf7sOk5NWErWoK1f8qq7Pdbq2f3+XU3?=
 =?us-ascii?Q?Cxm+Jo0EDN8XkEWM3U58W4nnLOaUjbL1MojGdxccjnwe6ris9Q0iNgs0Nlo2?=
 =?us-ascii?Q?vVLsqN9xbtfep3uQUIHYudUGfEyhyptj/KfwvYONc25uDAMdf8dPROS+/F9v?=
 =?us-ascii?Q?OFV4nHWy6cXALy/eZe3dkb5gBK7mkwIN0TvqJO4OxT6qKtXJ9EJSw8xehEWH?=
 =?us-ascii?Q?r9FOajFFfF/tsl+bjpq04v1NhKk1Hxt67vZnbdtqOnnsvAJZdO37vQUjIgbB?=
 =?us-ascii?Q?h/bFkqxtM9IgiOBKSv6KG4V/r3tsaQLnY6Z15/P12FsGR8Kse46DvB3UEgxd?=
 =?us-ascii?Q?S61Gd5wrOuGZ3ZyEwLtS73fvcv1/sBVPELd5/I6jRvUKImTCsWtP0PC8ZsJi?=
 =?us-ascii?Q?wX4b6YUNa1+1JPuzNoNa42OvUg5UVglb1gA8dVUUwVoIWUX76B5AUA9ULubb?=
 =?us-ascii?Q?q/gVdDBr3XoOe52FXqrzoMpfS0eNX84U2Y5Y1oX8bsXpeUs2uvH6S7rAOGk6?=
 =?us-ascii?Q?u0FYB3eIZ/+2AMGCleqSB7dnZ+Jg9SB65rJcwHP+Zh9Zxm+YB7d/tGtgLG7S?=
 =?us-ascii?Q?4edtTxGgrLlSXysQiMhTYzFuN4hzEUQndy1r1QBk?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18203a7f-91a4-411e-3941-08dda4c15799
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2025 06:14:06.1511 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gYxT2uCLfQpVKsgZDXtlwnZVvFmZKGNNpzkpul9R2RsRe0tcFIzNJvFfCBjPNy7MpnQhe7/qrfqpq2dzbZjjyJvYT+TkKBMNwyVV1aBE6fg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4980
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

> Subject: Re: [PATCH v3 1/3] mm/hugetlb: Make hugetlb_reserve_pages()
> return nr of entries updated
>=20
> On Tue, 20 May 2025 22:19:35 -0700 Vivek Kasireddy
> <vivek.kasireddy@intel.com> wrote:
>=20
> > Currently, hugetlb_reserve_pages() returns a bool to indicate whether
> > the reservation map update for the range [from, to] was successful or
> > not. This is not sufficient for the case where the caller needs to
> > determine how many entries were updated for the range.
> >
> > Therefore, have hugetlb_reserve_pages() return the number of entries
> > updated in the reservation map associated with the range [from, to].
> > Also, update the callers of hugetlb_reserve_pages() to handle the new
> > return value.
>=20
> Everyone has forgotten, so please refresh, retest and resend after
> -rc1?
Sure, will do.

>=20
> Also, patch [2/3] addresses a BUG which was introduced into 6.12.
> Presumably we want to backport the fix into -stable?  If so, it's
> better to present this as a standalone patch, including the cc:stable
> tag.  This is because I'd be looking to fast-track the fix into the
> 6.16-rcX cycle whereas less urgent things would be routed into
> 6.17-rc1.
Unless I merge patches #1 and #2, I don't think I can come up with a
standalone fix to address the BUG. So, I don't mind having this short
series deferred until 6.17-rc1.

>=20
> Also, [2/3] has
>=20
> 	Reported-by:
> syzbot+a504cb5bae4fe117ba94@syzkaller.appspotmail.com
>=20
> which is kind of annoying if one wishes to see the syzbot report.  OK,
> it takes takes 30 seconds of googling, but adding a Closes: link is
> nice.
Ok, no problem, I'll add the Closes link in the next version.

Thanks,
Vivek


