Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4329E6C50
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 11:33:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3FC810F0A6;
	Fri,  6 Dec 2024 10:33:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jwdkEw2I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1B3710F0A5;
 Fri,  6 Dec 2024 10:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733481222; x=1765017222;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qI4HE5pmUruIvE4puZnSIWTWlqQiDIvJsB1au8ekndw=;
 b=jwdkEw2IqPRmdaym5hwyiNuP7Vdxu1MUqdbTABllGmtbnKBhlM0ZJ98X
 x8br3tfTHW6sug2Deh/hLpalD3DARe4wVd9HqO2TN0CnvIeF6QcjotoRr
 OvORILMePoy8hRG4ZwTGiZ4sE+onlEjC5jAPGODF73cn6xFRccjG0FGmW
 BwRagzA5hrEXyCaSjfl4sYdfnP5gPQBtmxeCQNkCyIy2yIYss0Oxiv6Cw
 pnBBFJPpBIud5OFdbzKTGHd3Hw4POiwof2t8Pdzv4LJAgiEo6J8tQtAwQ
 RgS8EqNON8F8JTouaL7OzAJ+3bvVnfd5TUmrW5kCZp7euH2fY6r8BNIwG A==;
X-CSE-ConnectionGUID: 0GGBSCv/QKOqmle2u/TfYQ==
X-CSE-MsgGUID: qceaKB76Rt+b0hFrT7ni+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="45205978"
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; d="scan'208";a="45205978"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2024 02:33:42 -0800
X-CSE-ConnectionGUID: sfxAdfguTPKxkF8LXaeiXg==
X-CSE-MsgGUID: Hg9JaUotToCK7VIuDBT6Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="99411009"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Dec 2024 02:33:41 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Dec 2024 02:33:40 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 6 Dec 2024 02:33:40 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 6 Dec 2024 02:33:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xPJV3rIjTuQ91JqC28JgG+N6HhondUe+FICiOMpEF8goHCFYWwnL63pm86CT1uZQGjAHPNZeP+GNtxTqBBiQFe44YjGx9lSTFVN5SjbcdIoOxEVArJytpnGLZDXk67RU0d1nnkNxf0nTiWuCNgjVHEXiuQgUzW4eETlRntOuya1UEOfsBqo+EmwIzMXnNTlJzL1ZigDyGvs5V89t4lHfkXZNW8YHKM5b9e7T1qpQ4BTiCVzIC7jQNg3h8iGsKe6JnSDssbwMfbZuACy2NvcP5H4djHPQabtJnCyOUScwmbi2ec6ffLzYVLWs0+QYwF72SjaRrNMGaKP0IOpjTeMYQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=06x95Il6YjtEtXMnBJNVEif6PhCGxh2kprjj6gF4h9o=;
 b=iaPlnJngSvZHR6dvyY5XKmbaZ6GjlHdkCj0ZLVdZqe+6aogRKo4TGwCVh+tc1AeXp8vN4lb4YqsDaKSjJ2fr8yNe7wpnDScJvq4CqZlQ9mnDtVVo41lSXEcEU7ozTOleix8Fu5sYmEhugYOhESpN0lrXLTzPaG3e7nMLdARAmFfP26bnvpZbbZjhMZvrHrOhv5PaxhqOcxPScSi+z8kBYpEBnmcmLkPG67+CpuWvDqhGkYET4w/pUswgMkrSd53nWydQvQDms0eNMmIcECP8VLLaruSvmH/6RxwXH48OZD+rMxXgXWBYH2MuTDoo2GZ4CEc2d2DjVNVGtGmhiw1+AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by PH7PR11MB5796.namprd11.prod.outlook.com (2603:10b6:510:13b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Fri, 6 Dec
 2024 10:33:38 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%4]) with mapi id 15.20.8093.027; Fri, 6 Dec 2024
 10:33:38 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCHv2 01/10] drm/crtc: Add histogram properties
Thread-Topic: [PATCHv2 01/10] drm/crtc: Add histogram properties
Thread-Index: AQHbRi5j+Y4IG5jE+0yUaPGdRX/PhrLV+CQAgAFQi/CAAEJHgIAATPcQgAA2eYCAAPkLoA==
Date: Fri, 6 Dec 2024 10:33:38 +0000
Message-ID: <IA0PR11MB73079CFC62FE11A90C386CE6BA312@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20241204091456.1785858-1-arun.r.murthy@intel.com>
 <s3gkb36ga2pxmxocrhcjp5pcgbewx4x3joiyrpld3th4r4fvyi@rkpgbu4ekst3>
 <IA0PR11MB7307F22883ACF3AD873C3697BA302@IA0PR11MB7307.namprd11.prod.outlook.com>
 <CAA8EJpp4HjyEL9XSLzXr6tG7+8M2FmZO1S2WrLXmP64J_aKs-w@mail.gmail.com>
 <DM4PR11MB7302BD8409DEC33EF2F1B0BFBA302@DM4PR11MB7302.namprd11.prod.outlook.com>
 <fev637ue37cbc5bstvqqvstserp75khqewpof3pc4loshnpghl@vp33ww6i6rdn>
In-Reply-To: <fev637ue37cbc5bstvqqvstserp75khqewpof3pc4loshnpghl@vp33ww6i6rdn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|PH7PR11MB5796:EE_
x-ms-office365-filtering-correlation-id: ae3c6f84-2033-449a-49ba-08dd15e1724c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|10070799003|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?N10Re13ezFGt3myxgBeNwgpEyArhh51HGI6T0DLSAoYItzCDUNYBhqBHj/nh?=
 =?us-ascii?Q?wb7X+z9hsZ7ALt2/M4T8K0KKi2xblt5uWr1lQh0g4zPuG7BjlogQvDJNQxde?=
 =?us-ascii?Q?63aRAWgGJScTRGU5TSwuPaeIpOwXZgtnEePBRL3vIwBsR9Ps13TM8TGg2ldt?=
 =?us-ascii?Q?a65sUTVrJ3BqG4apN/erc7LNZCmw9hWMvX+WUL62CBV0deHtyFTxHc6KjyEl?=
 =?us-ascii?Q?xkJA58zGJeIBPaD5L53mx5COCFo0udiJoAgVuzwXKrfoVwIfM6/q2Ah46lGc?=
 =?us-ascii?Q?z3VT5TIKAYfEueTn7mFk8TohjU+e1FtNlwEBVlvFLAD823XmORZ/V/9zzFSq?=
 =?us-ascii?Q?K7XQNiBKhjKirPu5YFwVLL57NdQSEaO+aRBbjcfADO2dCRk7nyo5v0Ak/rj9?=
 =?us-ascii?Q?kHbis4Pn7jMQFaGMrrMDXTiOPVfRkaVcTRiM49ZjQbc+m/NJofwNjCKGDrY2?=
 =?us-ascii?Q?JlUtWvT87uVquqFiTwM7lLLkXQ28uAP1G2/5aj0jXLA7NGaXhfXMOzDLsxkc?=
 =?us-ascii?Q?d4AQkAa8uERP2hqTqnIZqm46al3Cq9QLBIWjETR2oG01mv4hDoldPLfllagq?=
 =?us-ascii?Q?OJ7J3RMjKN01nGe1n6sy7nt/d0Bm++NVzRx3sT+Z4sGzkT88VbbKJnkGiXl7?=
 =?us-ascii?Q?IdP2uoU+9G0eDASdIUdlgSKTigM0N9vVfLcif09wrGh0S6xHgJT8kXGjYDrc?=
 =?us-ascii?Q?sVFHssKbmprd8UQjRVxh3i5mWmAL7h68fZtuE3cJNZkktHVFufUWY4K0Lu8x?=
 =?us-ascii?Q?YViaVIO582gtoyxgbaxEau2KkGK5cv6pK2SKcDxg+tc58PHICKr08v0tevOO?=
 =?us-ascii?Q?SX+5zksNp6lk1fZwFtLMUrsESDZW+/cZi6k/cFcHKD9XKgmONLHBePUi9V9L?=
 =?us-ascii?Q?z86RXBGdz9M0UFCcozYkjR5ER4XrgEiQRGRB8Fr7uAai3/KZBecD/a6iMR8H?=
 =?us-ascii?Q?UdcdCB/U9lEnd5zB8l2yCUXz+JLNytYEVQVdgR/JSICg/gPPCIGiu6we65Md?=
 =?us-ascii?Q?cLW9canDaQnkLwpEC/s+uWnCpdSwgcuDLPiPLB3bi7Rjh8riEa912x6IgvX5?=
 =?us-ascii?Q?N2eVDtpRsPtKxRgao8U8j8YzlS2R8s2TPZHFJn8IJ6b9AODwBx5bb2IFdA+k?=
 =?us-ascii?Q?ap490fZj0KuK68cwyuYzR7/twocxC1DJ1d2PSiEqcYky2epTJ/az4i35bdPO?=
 =?us-ascii?Q?WRpc8aNTF2aSZmFa9ZB94r7GyZHAkOE4zE3lTw1uMAkFtpPdUDs18679tFD2?=
 =?us-ascii?Q?fqCz7LeplN5qUGG8kVW94brLMkLSgmFNb/5mlTpTqZX45MyCkYVyAluqKoHR?=
 =?us-ascii?Q?RABRXQi2iiWzTTuPThrIhNyzy5K65HsZH5dZ932DqhR+okTSq2shCMhgsyiK?=
 =?us-ascii?Q?e83kpMY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(10070799003)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?J2nuAJbV9vPsQKP1mE8eGAtLDwekLb77rEQC6ZZ9BkJtzwT7Wlz/ifzzbJHZ?=
 =?us-ascii?Q?y5BE0dp0AScrPkrcJBL1tn7iyke7f0PdKVVM/0E/nSsoeMPCtAAHWvyBmEv3?=
 =?us-ascii?Q?x10X/Csktf7PT8xBidZBeEfTbvMV0aRNOwPbkjBgGyG9n9gnZy7jbSNMAdZA?=
 =?us-ascii?Q?4JIruybJJuTgYv/8CvOrbK7DBfPtvnzTJG9qQDdR5BO48q8k24oAt5k4cIP/?=
 =?us-ascii?Q?o0KRxrZioQ96W/AEUYlWFSoRt2H3W86LT+mZreVUpyPG/deA970tkemW+oNH?=
 =?us-ascii?Q?5eTfUPYWkwuK5xxCsa495fGBbcTJ55ZufPFtbIN/oEVTrpmKBW6HU6K8xJpq?=
 =?us-ascii?Q?mB36KxCf1DeXF55rdlvcZ2UdSKaCpdpZ7u5P1kil28bOWEOKsAl3arcdg8ru?=
 =?us-ascii?Q?4AfCZrApaK0M1O8gzuq/4FtKpAu3mb4UZo+MzshXhBt6s/SHBQ9Q15ZvjrrP?=
 =?us-ascii?Q?jQ4utBAK21VPnlpNPnv8aeLQ4Hrd6oXS+6E0nQH7Q+GDhT+nfYCcjZLtBAfB?=
 =?us-ascii?Q?VJU5p5qmaE17ivhOIeocnFPXCJ3bmiBBBGhac+MIhsKCIFewQqrxs2BHy/LC?=
 =?us-ascii?Q?BOHONyujTPwQNnWLSDEM3PIJhC4CM/+0SK9R+5uScNFczUWUK4nWidhNKKnT?=
 =?us-ascii?Q?ttk32LudN4KwZ8J3eC878F53DMZhAQ2xIGRyrdyH02n9r+BqtbavEg44IJlG?=
 =?us-ascii?Q?EtDDF9PCH4OtI3z5w9Yc/hGAC1wUw0o7HregvFuHE61fVHKkwMqDC3rNqdAP?=
 =?us-ascii?Q?xMq3wuXPWbSZHnJ4ftrqpnWhV1+PSsX+y2VRKDX3upLixuho56z4KvHou6tj?=
 =?us-ascii?Q?6Sp+sKVqi6FZATH6ow/g079b2Ojz9liMWlbEbgZI2LYQ5dq9CCb5WUc3DMkq?=
 =?us-ascii?Q?ypt014Ai53YEpXcn9aht542tbuW1VeYD1ugoDxtZ1GnRG2RYXWGnCTa8YWt+?=
 =?us-ascii?Q?J910/HMVQXb7lIk5In14bolf0d5Bx8BC53NBeJ/X0GN0/f6TtfAwk2FuAOIL?=
 =?us-ascii?Q?J6RDJg/Gdu7LB7L8fXa6SMxneCenEjqvqCkXGLGMMC9TUTkVhIVsp1oyFTrD?=
 =?us-ascii?Q?222X5zpskrc0FW4MW2FuzVSNosV4W5baSj7PqO5862UWfT31StUi7LPRc2zk?=
 =?us-ascii?Q?9H4yrDaLKqUATJNpPvHb3taD4VKwErKo611TolbcBCz1aFykQ2Rs8svkYCln?=
 =?us-ascii?Q?GSxITj3laRBkKeYQvgJ8Mq0WHou+j7eQKbsByAV1Q3dzgwu8glza4x0gIwkw?=
 =?us-ascii?Q?zwj7sOacjE+nCvvS+4E04biskCN6PQCtY4bAfNVoVjI7IgbfZPC2NL1naELE?=
 =?us-ascii?Q?6+L0VLYCUN7y6iiFH8AUC7GHTIVslzLT1wNHoIBkHJ0pT+yknVe3LzllkqeZ?=
 =?us-ascii?Q?OK5Klb5UMNY55kH6ye2QyyvEN2Zy5CwM7yQGlvvLQu+BEr3O1Qzzx22xXB3l?=
 =?us-ascii?Q?iEMyio8gWdHNVLwbdVJ70GNpdk1i68tPMPHtQa7ENHI14V1P6EAV2Pq5zZ18?=
 =?us-ascii?Q?6DOeAVoZyfrv91Qk1iwj1J3TzFf8CgEGcEx9PYMfwy7rFIp0xE/B+d8rRmRC?=
 =?us-ascii?Q?4LTTKYoScV5BdLkMSXSdg7isjcbVSc29dng5xf5XdM4u1tPL5QPJcUCRvWsX?=
 =?us-ascii?Q?ZYm8W/RFNqC8bLwefkXszyvwkGT6m22c2XlvLG9ozAiH?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae3c6f84-2033-449a-49ba-08dd15e1724c
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2024 10:33:38.5471 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lL930fXZUGt9uIsshQWEcueND3PG04z7ypNxzFzZIm6hH0pZWP1fCbuFSj1RFbC8u5ldMmeMLR/5CpuFnocEzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5796
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

> On Thu, Dec 05, 2024 at 04:29:55PM +0000, Murthy, Arun R wrote:
> > > > > -----Original Message-----
> > > > > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > Sent: Wednesday, December 4, 2024 5:17 PM
> > > > > To: Murthy, Arun R <arun.r.murthy@intel.com>
> > > > > Cc: intel-xe@lists.freedesktop.org;
> > > > > intel-gfx@lists.freedesktop.org;
> > > > > dri- devel@lists.freedesktop.org
> > > > > Subject: Re: [PATCHv2 01/10] drm/crtc: Add histogram properties
> > > > >
> > > > > On Wed, Dec 04, 2024 at 02:44:56PM +0530, Arun R Murthy wrote:
> > > > > > Add variables for histogram drm_property, its corrsponding
> > > > > > crtc_state variables and define the structure pointed by the bl=
ob
> property.
> > > > > > struct drm_histogram defined in include/uapi/drm/drm_mode.h
> > > > > > The blob data pointer will be the address of the struct drm_his=
togram.
> > > > > > The struct drm_histogram will be used for both reading the
> > > > > > histogram and writing the image enhanced data.
> > > > > > struct drm_histogram {
> > > > > >     u64 data_ptr;
> > > > > >     u32 nr_elements;
> > > > > > }
> > > > > > The element data_ptr holds the address of the histogram
> > > > > > statistics data and 'nr_elements' represents the number of
> > > > > > elements pointed by the pointer held in data_ptr.
> > > > > > The same element data_ptr in teh struct drm_histogram when
> > > > > > writing the image enahnced data from user to KMD holds the
> > > > > > address to pixel
> > > factor.
> > > > > >
> > > > > > v2: Added blob description in commit message (Dmitry)
> > > > >
> > > > > No, it is not a proper description. What is the actual data
> > > > > format inside the blob? If I were to implement drm_histogram supp=
ort
> for e.g.
> > > > > VKMS, what kind of data should the driver generate? What is the
> > > > > format of the response data from the userspace app? The ABI
> > > > > description should allow an independent but completely
> > > > > compatible implementation to be written from scratch.
> > > > >
> > > > The histogram is generated by the hardware.
> > > > Histogram represents integer which is the pixel count and when it
> > > > comes to the IET(Image Enhancement) to be written back to hardware
> > > > its again an integer, pixel factor.
> > > > Is this the information that you expected to be added or something =
else?
> > >
> > > You are defining the interface between the kernel and userspace. The
> > > interface should be defined in a way that allows us (developers) to
> > > understand the data, make a decision whether it fits a generic
> > > namespace (which means that other drivers must be able to implement
> > > the same interface), it fits namespace specific to i915 / Xe (then
> > > we will have platform-specific properties for the feature that might
> > > be implemented by other platforms) or it doesn't fit anything at all.
> > >
> > Sure will add the above information in the commit message and also in t=
he
> kernel doc.
> > If there are no other review comments, then I will push the next versio=
n of
> patch implementing your comments.
> >
> > > So the documentation must contain the specification of the binary
> > > data inside the blobs. An IGT, modetest or some other compositor
> > > must be able to parse the data and generate (some) response without u=
sing
> your library.
> > >
> > IGT patch can be located at
> https://patchwork.freedesktop.org/series/135789/ This include test with a=
nd
> without library.
> > The corresponding compositor changes can be located at
> > https://gitlab.gnome.org/GNOME/mutter/-
> /merge_requests/3873/diffs?comm
> > it_id=3D270808ca7c8be48513553d95b4a47541f5d40206
>=20
> I know. But that's not a replacement for the documentation. Can I impleme=
nt
> an alternative implementation without using your library?
>=20
Yes, exposure of the properties is being done in this series and also suppo=
rt
from hardware is being done. The library/algorithm is open and the
community is free to add their own and make use of the histogram and the
image enhancement feature posted in this series.

Thanks and Regards,
Arun R Murthy
-------------------
