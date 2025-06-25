Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1407CAE860C
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 16:18:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A68E10E733;
	Wed, 25 Jun 2025 14:18:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b1XiD33g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC65410E733
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 14:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750861128; x=1782397128;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=i/2ojVNBFwdOUxo8gHEHx2cXwkpmwS6hGbwt0upfrbs=;
 b=b1XiD33goTERX4DShEeBTMDCTnAz30hzNLm6FOnIBsPTHA4A+KHbUh/f
 QmEmK6jPFnzW4VnF8GX5O87n+0Lc3Mhf7fCrM1L06v/3Vs/Qpn17n/K58
 JerGl9Cj9dEOUMJ/HahJKY02pQYQCUFV2DlygEFtkwYiEKV6VUzbQK28j
 EKrf4ZjIBUtHYBysjD9YJq9a7jbmIrDoivemw/h1h673C/qC41Wqlau0V
 lo5X6Y8fg9O5fx4gnT2/u3jOlpWWBAat+arhQFwutIXq779vR45utWfK4
 RykzNToHCS02mjyU3zGqFeOgJDe13Wil37n8G0dBSk0X7LGXmaN8uDcwn Q==;
X-CSE-ConnectionGUID: TcroV2WEQfCObtDXZr1t3A==
X-CSE-MsgGUID: 6dOj4rzJQ6S91xAKAKUlRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="56936784"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; d="scan'208";a="56936784"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 07:18:48 -0700
X-CSE-ConnectionGUID: 8ZeExeQmR7a6ISg483R1Cg==
X-CSE-MsgGUID: wxQYeKNgQ/GG6ZXh4oHXKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; d="scan'208";a="183126609"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 07:18:47 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 07:18:46 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 25 Jun 2025 07:18:46 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.46)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 07:18:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XdiCFxrnJ0fEPV2dZt0UpKwDkYKOM0BE2QDteEh3pWMPRadi55woUAokx1kJNpU7dDlpfRPuFfZS9fVlfcySIwFezuesCzuPagCVriAD0HiFi/ckhXESzhIkAjoUcTuItuo/v2Yq6A3xO2u3/yFAgb8RkswgFz1/evef3r4sERp8+vXL9AkeOXWIjjxdDUiICQ4pbcwNI7cItSox5ziiV+ctv84HvwtNy3Ayb5rGnT+rL0QvwUCf4yh5S/DpMmGOf+Ml7jruQPcqypvrbmkODDm85niwWiNQ8li/MJHAsfr3GdyRd/9dEtXrlZq6cLbhRep5rWOgczvTNQlBwDKLuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6urC+rFAYeK/gS6iSqQNNLb91p/HxhldOH52A5Bp9/Q=;
 b=F8F2Y0OHaLc38pPQHpnyUa811QB5POLKZ4U6hUBW9XyLO7Vu7GVA1f2s7HKKX4GdJUCig3uo7a/r6SCBlzFlFKl/Nkgmif7B8h3+DKTDUz9eWWoj3Y5zGYaFALko3rwnjl52Y+UUzONI3v8W6dAg2e8P1hIe7nzGScJ80u7XAyUltX8MkIk8K6Gc8Igtq3MxaxWVJC3ygrW8AaLH/nguqVn6ilN3oYcxhwkc8KhvhMgomYG6CkvwN/RpF3qfb0bg2yG0BiD2jHUTn80U8xLwF6/5wrn9Mpy7voTgBXrYkpA1AwOZWA2wO3m+qWWc780nes33yPIvXPa4ZR8AOk5gdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by DS4PPF07B018B9F.namprd11.prod.outlook.com (2603:10b6:f:fc02::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Wed, 25 Jun
 2025 14:18:28 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%3]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 14:18:28 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
CC: Anshuman Khandual <anshuman.khandual@arm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "syzbot+a504cb5bae4fe117ba94@syzkaller.appspotmail.com"
 <syzbot+a504cb5bae4fe117ba94@syzkaller.appspotmail.com>, Steve Sistare
 <steven.sistare@oracle.com>, Muchun Song <muchun.song@linux.dev>, "David
 Hildenbrand" <david@redhat.com>, Oscar Salvador <osalvador@suse.de>
Subject: RE: [PATCH] mm/hugetlb: Don't crash when allocating a folio if there
 are no resv
Thread-Topic: [PATCH] mm/hugetlb: Don't crash when allocating a folio if there
 are no resv
Thread-Index: AQHb4BJSsw569givP0yLQ5888kYOd7QIeNSAgAEiAgCAACD6UIAHsyEAgAFgpsA=
Date: Wed, 25 Jun 2025 14:18:28 +0000
Message-ID: <IA0PR11MB718542BC4FF75C1891803372F87BA@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20250618052840.1036164-1-vivek.kasireddy@intel.com>
 <99b9f7c8-62e0-4500-b4f1-0efdb73bf502@arm.com>
 <20250618170248.89ff5c3d3fe23233424fd4da@linux-foundation.org>
 <IA0PR11MB71859403C79419049C075E44F87DA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <20250623163546.ddb768e0833f7a19af259a43@linux-foundation.org>
In-Reply-To: <20250623163546.ddb768e0833f7a19af259a43@linux-foundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|DS4PPF07B018B9F:EE_
x-ms-office365-filtering-correlation-id: 54f5657d-4baf-4600-55da-08ddb3f327f7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?5u62oHdBB78eep/UYaDfXlSUHMpTVPwpENoZytCeUaFS2VG8rsE2q2606Q4z?=
 =?us-ascii?Q?WwyWBXCzot6PQ1HLiw5twYqK7WDMyH0M9HvGzVd8tX4y+lO3K/gf7C4V1Pso?=
 =?us-ascii?Q?mPkKZyfS32J4GiwfyBvfFD1Le9AsCi+t4YIeg27pYD3qfVI6LF1HF31bUN7j?=
 =?us-ascii?Q?yBPhcVa9jrm1/9+UhvZi42xjSSgeB0BvEh7NBdDayWgTEcafNRJyyQP30Fx7?=
 =?us-ascii?Q?4VJlDAAHt7zvho+AI2HOF2nLASWWB8jZ7+axWQj+QOVZrvX0dLvEhyH3kOhY?=
 =?us-ascii?Q?Y7CkI+jrIY4p+jphl6CZpCp3qwn4S1seLttcR/ZLxZ/9ltlFtJOtr3WSwMdD?=
 =?us-ascii?Q?/rE5b0h3FR9Unc6tueAp094qnCjX+dMUMJW4ojHdreZMGUE3llnwgnneYAIE?=
 =?us-ascii?Q?J7CqpVOw6oT7Kga/rq4pOMomYfYVlDEevLEUgpCSNl2V4+/wlRIvI/4TXmen?=
 =?us-ascii?Q?j1vsQlftJXccXa/tIQ/f/iPFKlawHvwv65eDaYpbttohJ9xMg2Jofu6CusJy?=
 =?us-ascii?Q?ipeMX8zgoU+IUPpYTSdDSKk7HbJFpWQ9/B0BHAySiRt4VmCIOQ3hfLCs5qvZ?=
 =?us-ascii?Q?VfehrUI6wLo+dpyzmIkmKilgKt+qTH1lomMfApfQgfrsVJDML9MDQujfqP4H?=
 =?us-ascii?Q?Ek3GVpSuKny/Fhtj9ROtVvroCIOhRUd+Fu+yQyw3b1XJk+JUwtS0SO+BnPL7?=
 =?us-ascii?Q?81Btd8sVshXzRLcmWwcBfjr77NOd1WSj7R4qqcw1Xzfup4lYdWCMEhMNYysv?=
 =?us-ascii?Q?2odcYni+5ARkF/f4pjSq5jMnhuReeemkfV84ZMe4DzCNSP7wmbVHEb6+QNCT?=
 =?us-ascii?Q?ACRrSBoOgFYCm2MLXSK+r4nvlti8jetDRKhdQGorTH9khm7X/k0147AnNa+N?=
 =?us-ascii?Q?qDKod67gGOFTn2oP9tQIjnzEtVoH0o54w8XddWOOg/Rl1b1/bPvD9pLlP4zi?=
 =?us-ascii?Q?zcThpCM1XMH9bvOwsZeU5sWkxMpSdhElGNC7x7wCsz5EVV0j7KS7IPdRqIDH?=
 =?us-ascii?Q?25fhxInT3YQFSnuaDCCxkQsiZBl8jw5RYaj6Q4k95ZcTSo6m5csLL3aH7Zun?=
 =?us-ascii?Q?TzAt+V6SAD66u7vtE18m2yQBbgR4vEJx2ZzRDoee7n7yP2/PPFiUcYi8gmJv?=
 =?us-ascii?Q?Mid63CYKtfK52R08l53idfb1eds2NYjJWXl9EATYTD6hOKVMRPWbapaveqmE?=
 =?us-ascii?Q?sOkmvnphO6BtJyJ8VZsEV/Mhp8krH4JcV6qLb3iDNwnezGx61sKiAa4a3Bzw?=
 =?us-ascii?Q?FWzEriHutwg2mS0v3ogjrgxyX51F2Xy7x2ywZo4uD+7ujj7XSZrA4f4JSMJM?=
 =?us-ascii?Q?y71TxwryRxGpvjYnIxSxM+vMlrNw4vER9J04XuIcsmkUR9eY/z3n0j53+KQW?=
 =?us-ascii?Q?935glUgzAArHFDF4psQucTndHM4YrOi+zSpw5P+HQI+0Te3WX8mSeK42N3kd?=
 =?us-ascii?Q?019jSLbyIP4rtj5OtSk51GeGIvDrH/5CJirsilYbxJ2GrT2Gh25Hmg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?T86GjMPSeCG0ekuSomeqXZIrzk92cgOrUX8iosnHIY/HKGznEegeivw6KhP3?=
 =?us-ascii?Q?qhjaX9DRl88qp9TTPrynL5SYw9SxNubgj4luIumrm24LVHh4BXgZ+5s6e/sB?=
 =?us-ascii?Q?hjFJduAhfBCTNGTm+USiMlW3xQ1DHxzyEq8TLWI6m48tlw+rqQi1fnZGmlv8?=
 =?us-ascii?Q?y2NJ+iLFRGHbBIoK0gyIBN0qTVUgqvyvqqeho6qxJUno6lJwyK8IslrBFTPp?=
 =?us-ascii?Q?olOlC4n92xcIHL1rTOrlfLGVKTdohhh9ltVRt6DGfe7N2FaLy7+OOqEQPi8t?=
 =?us-ascii?Q?Fj+YC4BDzfvMifCGyrKbYYtcJpur5qTT2ZgKU5ptDFBlXed3CJU9mpIn+RVl?=
 =?us-ascii?Q?pYvNDRsTRFLDfUotVXUBN1jGt/ky4wowWh1kKw73SgTpN7qxIuDxdLmul8Yo?=
 =?us-ascii?Q?IS5sAWKh+YcYaPvNR7gHsrDKoWmVwhUgnSB8FZ1lCAzcsAvl/fXit88sPhzr?=
 =?us-ascii?Q?7yJeXCi/3MHd/4FAKdcFq7HSMTt8SVRC4Fahtw1noUSCNxK51KuW0Xopp3IO?=
 =?us-ascii?Q?Nu+tJw/LUzMUt7qV5QdLO2tLuwKfjslmjXFeJjxeDvfIurR2zyl6I9wj/XOG?=
 =?us-ascii?Q?w9KcTSBSTHkpE4n6P/EYMS8OYOLpC1QTSlokfRjwkdHYXQRHaCi9+kl6u5rQ?=
 =?us-ascii?Q?CT2tcIbF//P4zJ2spqnsWmQTe4pMmE5ywXx39Mu7V65VBHqWORNtWdFZ+ih9?=
 =?us-ascii?Q?KpDHHBMjEP/VchhLaLortydYu1J236RLyod+19Ya/l1wnqNClYHzMqoBu2fU?=
 =?us-ascii?Q?lHAjKkK0GT/kWVxXuOp/2KJ5RCJfVlcsGiG/tAdtpKgZ3TX8aIGq3muTHbUX?=
 =?us-ascii?Q?ccNFt42Ql8+WYuvBItZoqBhB3sMvYjLPenAutRN98WyFbUPFtCpAep9s+Ewa?=
 =?us-ascii?Q?rR6cUkDUGLnDM62hgnmNgAnJYE/BnSNuFFpnAC2YpPlUsr5mVf1HcHhkwYHT?=
 =?us-ascii?Q?ouH19I7e/V6IbrdiRv8pIwgejn2+MEHB7R3xM0ufXHHf6dRxRpdKUOOqGgfh?=
 =?us-ascii?Q?G2J803mt3d6sRL3ek0y4tXJLJw069d3U6xBw4LiFLj7m9pwLEAvkfuWDxXEw?=
 =?us-ascii?Q?1GTYM+4iHvT6GjahaHzxY4KI7BsMYRG+XsDkKtJr0vIVKoCzErAsJYK5Hc5Z?=
 =?us-ascii?Q?7iO2XaqdhzZ9ZsHvRFW5+IeuP67U6yf9XezoN6aTou8+/GUtSFzO5qZntT8i?=
 =?us-ascii?Q?9b0TPODRjxlcYzAP1joRFRB2wWjQRa8ECYt3uZxV+r7MLa926JfFMiLErR9Z?=
 =?us-ascii?Q?vA54B3I1z7TYQ16tYByPV2oRfinDqG7nO/lLfFqA/ppbI0/kUpopH9E3Z25y?=
 =?us-ascii?Q?zO8hl8pW5vx5mOHCIblV7IXP8prOGsil8hHwN903fZePQLSwZ5ihHhnSMzuF?=
 =?us-ascii?Q?5skmItdChhNibN7m+9cEFNlrUd+bBRNyOF9BYZR904V5AYkihsNz//Z2ZStY?=
 =?us-ascii?Q?9AXzeAqhQ0moiveSmV3wfy1Dro6/kHN417ftyTpNrrqLbupvJCE8gjwcPV1h?=
 =?us-ascii?Q?lTmuOu20PgRWGn0FLuLcakCkrK0IHeXyBzcdPyJ35m9NljQ6ZsBuWkc6Wvd8?=
 =?us-ascii?Q?vJ0WCDOR6Mwv5RAPpImOOo7zg43CDL1VXmX58oKP?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54f5657d-4baf-4600-55da-08ddb3f327f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2025 14:18:28.5066 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b49OYnvlCAq4wfpefjqgVNGOFns8nopQFXDNsPPgUc7SgWerSEupe78rHcoUjF2ZwnAlaaWtiORr5cs2yhCiaYlyM6yIcwKTVvVxrr/PNik=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF07B018B9F
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

> Subject: Re: [PATCH] mm/hugetlb: Don't crash when allocating a folio if
> there are no resv
>=20
> On Thu, 19 Jun 2025 05:30:52 +0000 "Kasireddy, Vivek"
> <vivek.kasireddy@intel.com> wrote:
>=20
> > Hi Andrew, Anshuman,
> >
> > > Subject: Re: [PATCH] mm/hugetlb: Don't crash when allocating a folio =
if
> there
> > > are no resv
> > >
> > > On Wed, 18 Jun 2025 12:14:49 +0530 Anshuman Khandual
> > > <anshuman.khandual@arm.com> wrote:
> > >
> > > > > Therefore, prevent the above crash by replacing the VM_BUG_ON()
> > > > > with WARN_ON_ONCE() as there is no need to crash the system in
> > > > > this situation and instead we could just warn and fail the
> > > > > allocation.
> > > >
> > > > Why there are no reserved huge pages in such situations and also ho=
w
> > > > likely this might happen ? Is it recoverable ?
> > As described in the commit message above, the specific situation where
> this
> > happens is when we try to pin memfd folios before they are faulted-in.
> > Although, this is a valid thing to do, it is not the regular or the com=
mon
> > use-case. Let me explain this further with the following scenarios:
> > 1) hugetlbfs_file_mmap()
> >     memfd_alloc_folio()
> >     hugetlb_fault()
> >
> > 2) memfd_alloc_folio()
> >     hugetlbfs_file_mmap()
> >     hugetlb_fault()
> >
> > 3) hugetlbfs_file_mmap()
> >     hugetlb_fault()
> >         alloc_hugetlb_folio()
> >
> > 3) is the most common use-case where first a memfd is allocated followe=
d
> > by mmap(), user writes/updates and then the relevant folios are pinned
> > (memfd_pin_folios()). The BUG this patch is fixing occurs in 2) because=
 we
> > try to pin the folios before hugetlbfs_file_mmap() is called. So, in th=
is
> > situation we try to allocate the folios before pinning them but since w=
e
> did
> > not make any reservations, resv_huge_pages would be 0, leading to this
> issue.
>=20
> Cool, thanks, I'll paste that into the changelog ;)
>=20
> So if this code path is rare but expected and normal, should we be
> emitting this warning at all?
I think it would be OK to drop the warning. Otherwise, Syzbot would continu=
e
to flag this issue.

Thanks,
Vivek

>=20
> > > I can't find any mailing report/discussion of this.  The Closes: take=
s
> > > us to the syskaller report which is a bit of a dead end.
> > My understanding is that the Closes tag can be associated with a URL fo=
r
> > a public bugtracker like Syzkaller. Would the following be a better Clo=
ses
> link:
> >
> https://lore.kernel.org/all/677928b5.050a0220.3b53b0.004d.GAE@google.co
> m/T/
>=20
> I'll add that - the more the merrier.
>=20
> > >
> > > I agree with the patch - converting a BUG into a WARN+recover is a go=
od
> > > thing but as far as I can tell, we don't know what's causing this
> > > situation.
> > >
> > > syskaller has a C reproducer, if anyone is feeling brave.
> > The udmabuf selftest added in patch #3 of the other series can also
> reproduce
> > this issue and is a lot simpler.
> >
> > Thanks,
> > Vivek
