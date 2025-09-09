Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C03B4A5BF
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 10:44:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC04E10E65F;
	Tue,  9 Sep 2025 08:44:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K0/Hy5Kb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94EA910E65F;
 Tue,  9 Sep 2025 08:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757407491; x=1788943491;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+kbKdOwHKXTWdWSmZQNPmpTB0T7c52w2xyo/zgsh5jI=;
 b=K0/Hy5Kbtq0sjN5vClw6D1FAAHCFNhHcgWAEhXy8YSWWwdza7NiiRcZ6
 gmBcZ3jw5ngADTemb2nHqEKHyv1GjB1iNxwnd/PBcPZftfx4KqxBrj6UU
 jRGicFpLw9IrzsZUacPCqKV6HkcsyTMRubkut6m39+4YwckqvhtLoDmlV
 c8LXDm44iS8jNM3iPD8RS5EGc1yJP1cYZ4IN/cj8nZAxksx8pVnexXKYh
 lG4ZD0wXbf7WVQEUYV6eMGnOVtbsKjMaV4O6MejHqYYFUbLXilUgXFOYj
 szp6bSsWPiSW8yQyvVChT7C0U7T6FnRZfPhZOyLHWHLNlHKri26r+JQOF Q==;
X-CSE-ConnectionGUID: U1TiNvHzTUGxnyZ2twAm4A==
X-CSE-MsgGUID: dlLGZ3gfSW6RtefnV4trqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="59829560"
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; d="scan'208";a="59829560"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 01:44:51 -0700
X-CSE-ConnectionGUID: Yc9UWhCfTvqGhOs6KhPClA==
X-CSE-MsgGUID: NrDWQ/dkQiq7TFo/lcb+/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; d="scan'208";a="172947618"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 01:44:51 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 01:44:49 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 9 Sep 2025 01:44:49 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.40) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 01:44:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GNlbQiuFARi4uxZ4H4XwNbWx/yxelk6EuqB4X7PKTV8LFD2tEmntve4z/yZ7nuEw+wdmc76C3Udkf7iUepsnRnvasIwhRJlcEKYWIbrhXK0uWl14qA6qdy8plZyCUWxG2BUeoFyIGFht20wJl3s5GyuZx0rhB2iL9DBMCaJsSjEygYPqIlf0NzmpxYAsv/YLh/EF64X/mSde/ifEGlr5N4IpC6EfGXYQ14RUoBxMu0MIpCF2LHk5UmOVf50XrrFhkKfSAAz1uDbFQFM9YFoacqvRwT7e4WlRGAtzQROGpd80kRu3yUfrWBHQViEQ7x9MeW4xgQFlc8dlOJYrKecMsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+kbKdOwHKXTWdWSmZQNPmpTB0T7c52w2xyo/zgsh5jI=;
 b=mEq22cez/S00flMQa9jrE7nnjieYicBWHSQZNyEdbCFncz6Q6eb/v9jh8lUkv+qrb6gLoA/OBcG2FNyHnLaNuqkt1YpNs8y5Dtjsc/EcO5HMOZsmPORZjZVUTs5TPBsXVPlWGDRABR4xwQENTnh2tr8MqkeFOIvJnXiMVUECSbA+REzSETgbAcMqmIBwr8zjw/gb73D9goUFZkj4orSMAOoSdvMwJIa0mTC+cBrmmUeGpBUg5y9QuXKGFBPB6hqfyDJwQAJ36rJ+WKerRq+pdOdHuO7gr978y7DOtDXrfSdX/6Y4aDpIU0NUVSRR6Yw3C+QdMy7C13W/FVisvP5Sfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6467.namprd11.prod.outlook.com (2603:10b6:208:3a5::18)
 by IA1PR11MB6420.namprd11.prod.outlook.com (2603:10b6:208:3a8::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 08:44:45 +0000
Received: from IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::af0a:68bb:7bbf:5a45]) by IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::af0a:68bb:7bbf:5a45%3]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 08:44:45 +0000
From: "Garg, Nemesa" <nemesa.garg@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "Shankar, Uma" <uma.shankar@intel.com>
Subject: RE: [PATCH 00/10]  Introduce drm sharpness property
Thread-Topic: [PATCH 00/10]  Introduce drm sharpness property
Thread-Index: AQHcB35nLPZSU1L//EqLO8dXBFujU7SKs4kAgAAH9oCAAAC6kA==
Date: Tue, 9 Sep 2025 08:44:45 +0000
Message-ID: <IA1PR11MB64676630A70DC34A74C9D7DDE30FA@IA1PR11MB6467.namprd11.prod.outlook.com>
References: <20250807092841.3169436-1-nemesa.garg@intel.com>
 <fd486047085f57eaa516bd18d8266dcc4c591264@intel.com>
 <4276f7899b3c9d10ab9638fc8d7653edf4f359bd@intel.com>
In-Reply-To: <4276f7899b3c9d10ab9638fc8d7653edf4f359bd@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6467:EE_|IA1PR11MB6420:EE_
x-ms-office365-filtering-correlation-id: 2e4bdf8d-e08d-41be-d800-08ddef7d2089
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?tQv9yrZcRk8LTh9n17NZ1RmT9Vyw2MY6nhJaUn+aalyJat+78d4ZMtaIPh3l?=
 =?us-ascii?Q?rtMFEgBxTjG5H4RioCbuwE9YGE5hL9RlDjEnm/ibLuy1yQGw0LJM8+P4K1BW?=
 =?us-ascii?Q?s5Dh+nLTOz/Ygqv+7e43opA62mLhj1Llg27XLdUr5235CtKfqBjlVttUFbJm?=
 =?us-ascii?Q?LZ52JMoe8bpLa4ncyqpcz9WqUQU1Vn0GjnsfNE8uAispPOibt+T/2W7QMFeS?=
 =?us-ascii?Q?iAKPG+CnfUDZD/hdQ0iLyslGoBTsc8ez8Ap56gfXMrFSThpdPUEA1u2pHxxj?=
 =?us-ascii?Q?O7++JviFO885aS3jyLKu1/q/i2FH8acFe7nPZiJsYx+ey9XcKWrecAvnC+K+?=
 =?us-ascii?Q?uB+BgD4vS+Uw+qRJkG5caQt/H/dYHGmk1vUOHyXiNOAw04HtbvYX6yfgW4DG?=
 =?us-ascii?Q?a0WRCGtVJittIPPTqlpzeg2HGRu8mdbO9RVlxvegTvMM3CdALLzPuLMXcgt9?=
 =?us-ascii?Q?SQGaJuOZpJiFRPWxa5khH9dXXcBgXvGF7HxmlGha9RCE9HkxWRHGIrqkoPZT?=
 =?us-ascii?Q?7+cw7CVTK9CHdbyXXdp+w7+qQoiOTzML4FSgG0SOoUPMof1+84wFAs/tt3al?=
 =?us-ascii?Q?lKoc1JU4h8KwnAr4saG2znrwIY8K883MVWFzEC0Y0XQ5V8Ybr6jyoz7Lvwwg?=
 =?us-ascii?Q?GLo2t9Gq6udrSZPMNGyf87gjDtuoA+1r2GJG9HYyo+Ye3vh9MUS/+VkbQCbC?=
 =?us-ascii?Q?Frqtt5U8M6rcCfKFJX3/HIoiMJ47BvQQMS5qTVgthTindjmdZz/dy9XHL48+?=
 =?us-ascii?Q?o91Z9ev4HFA35hc4iLUtaCefbdSFSvJQ7rAwPs+utgWd81GaPMTTsGfyVKdg?=
 =?us-ascii?Q?aKFW9nrx32JWgIhaXNK4Gh5woMHrTSMMzjYm1aonFJ/W0y97is5HrbiEcTaH?=
 =?us-ascii?Q?RYcCO223UB54H7rRfbePenOs2lX3GmEJtnLsLehakRtGsTwNkG2o9GyaJhbj?=
 =?us-ascii?Q?AvJnspiSAeGrQ1oatcZ24Kg9y5UdZwO3AWExRXoYiutmSC28RiMr1hikNjXH?=
 =?us-ascii?Q?cD2x5jm9kJL0E6yBrPda3pXMxpOjTnwJ1e2Z/iklJjhO50nnggzD1bnLcSJR?=
 =?us-ascii?Q?Usp/5HWiT8qUJGvV57ug8uYM/zUeLOMYwFPP2Vn48LOYlEL1l7LMFEk+ZipS?=
 =?us-ascii?Q?FTnWaWLOjzCzDEAdHDblIY4itUuPz69jrhOzgcS0MMjZQEeSkm+VP/UZSaJj?=
 =?us-ascii?Q?0HHULqyQ4XvBmdn8IHZbysw8Kl/XLUYlxxj3nRqaVGC5wq2JACE74M+XIIeu?=
 =?us-ascii?Q?Qhic7dI/xHHtJV+dehJm4E1lGlzPMVtiXvr7kf3x06jNNHMZC8KDcWTIkioj?=
 =?us-ascii?Q?EC/vlWCfbl4PWGNwkkjEJcA8wO4Xtk+w/7widn5ODktmyHOO7tEy6o+ROE8W?=
 =?us-ascii?Q?m95nP0Um2S7M8zPCqg3JLq6ZmNqUdkRCURDGPNLeG99n7uplPj3EL0DPe5Ha?=
 =?us-ascii?Q?YILr6VO9EmY35+harVw4jz/UW0pXWOT8?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6467.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2fgpaXD4x5UlkP4yPNE6wkU4nCK+rbglcD+s49dPb/ac8Th8j3Og6zqJcRtq?=
 =?us-ascii?Q?oUCoc+s6v3OitUS7vKVgxQw4rxOAYHzxbQtk17tfdiLEd54PZpBqs7mL77YJ?=
 =?us-ascii?Q?auqQnMN9SaHq+NXdj5X3YE89QXXp1LlGPXj9qmlCQzuA/152qlGoavlWmV9+?=
 =?us-ascii?Q?LKxwI2pwde48cYINUhoZSCr2m7c9SAdAtFyJSGC9rfhAU/1oRLiVKjXme7A9?=
 =?us-ascii?Q?S32+VzO1S/iOS6ctSSpfvcZ6RyU01SSlBgdVygo45w6Obcyt02le9JrtdrDB?=
 =?us-ascii?Q?mAf/N3f8mxc5j7Czzj5EC1RWMLZmyIcHj5R9cquJciG1Akqj13NbDCI4wklm?=
 =?us-ascii?Q?tTfPGo/8zdcxatgWzpnBXmZnSMPXOx/JtIfjVSPjLqwLmWtjakNhFoiduQhJ?=
 =?us-ascii?Q?L/RZleA+ujo+gwmh3CTd/2+jV4c9hx5pjb9BL+RRV+JMciaShXE5nDloZ1Cm?=
 =?us-ascii?Q?TMMkljqRV3QfrBmmA1pLme7Nb6zhHQDjxILvRaE4MXt+rzyDWs0gXoW5SwE3?=
 =?us-ascii?Q?s3oestSPAZw8WiKe91qkC+BCabzJ1vJyHiWyijufzBO5OkUUYMB1JPuj4jG0?=
 =?us-ascii?Q?P33g7sl5jf6LMuqjH0OHJyjjYcm4pDxLSaDu4Z7w8M9wrYHn1qpxxxSZ4GLZ?=
 =?us-ascii?Q?EpXWWPndOf48geiyk8v6G6MWJ/H/GPihy7iFgmudXYDwM74nvgBXLz7XLYpA?=
 =?us-ascii?Q?YXJGvVlUmeUbeINLC8lKbs1TLZun2ic6+B3r7shVuwD3aiWDuzI5HfqIr1om?=
 =?us-ascii?Q?LdB91vamHD+qANxb/zh0pCEqG2gmBpwFsrcLVrXpQ9x9G1wfGixkJ1xJj4NA?=
 =?us-ascii?Q?7v3QnZMQDwtofbGf34Ba/TiTKQeuUMfKHTRGPG9lyJTV6ivbrIgIZYB0e4Oc?=
 =?us-ascii?Q?ReKTJk+zl+8Wn7ot/Wlbx20G9AaeplyDe2fjilAEDkR+0NXQvVtk23TLYtnm?=
 =?us-ascii?Q?XPRP/CNcYims0TO9j5JJepn21Kr/aP+cZefchmuzGb3jC4Bi0yWLXnNsE+S6?=
 =?us-ascii?Q?WaAN5wqdTtp9Pp1yTPPuxYEo4R5DmrhGa/MvuSEdWtH+vfxE0otjSNp2gu5W?=
 =?us-ascii?Q?6pp8I9sZ+FED8OcdeOvclmpJuAMnTgLXRoXOreqdqogw+2STsJB0WrgW+m21?=
 =?us-ascii?Q?8vZl2WlIj75JaZ7aYlAj9ipeymvgK6nxjfbR3B4O7kI2nNGxoEaEcwKnkM/g?=
 =?us-ascii?Q?B46giDBUPQuX+ShCHpiNsQh+g9bLGCJZX8BffsKSUy6qY0xKAYKhto18iMXw?=
 =?us-ascii?Q?WRnHOJ18ZgHmmOq0qm+870uIXHlmAbM6AeSt2h2zhkcHTqeaqL3g2shzHp4o?=
 =?us-ascii?Q?PPX8Ws4EBld67uhakPrS0ulOCcMxMH2n70vPjCrKy1kLDJgmGVTmM5zm0P+D?=
 =?us-ascii?Q?XLMOzYn6QJMkgS/AADDNUsLOmicbZqMp3Cmk4QZmvtl16nUCAZm7uRdMDnfw?=
 =?us-ascii?Q?u9giyNIDOQkCKerG9vaW/wkwQmHVLS99p5hFqjyop+jD8aWwI6X9Ydwu3iJc?=
 =?us-ascii?Q?MIb36qwAQvnMqfK7QhgGSB4kulQpkGGWDUE+s5NlZoMxuq/V6bRuYwPFVLrT?=
 =?us-ascii?Q?jpPKhiKDbnhcmUWwN+t/bidtABSaiuWArRKilrJj?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6467.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e4bdf8d-e08d-41be-d800-08ddef7d2089
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2025 08:44:45.1849 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8hkdHrH80o5mck/QKFyIRR/c76SQ5xfNz3tNIqt/pOezSTNCVvAj6lnA7bIxCuRkHUZeal9Rxp+snWFzqj2Kiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6420
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



> -----Original Message-----
> From: Jani Nikula <jani.nikula@linux.intel.com>
> Sent: Tuesday, September 9, 2025 2:09 PM
> To: Garg, Nemesa <nemesa.garg@intel.com>; intel-gfx@lists.freedesktop.org=
;
> intel-xe@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> Cc: Shankar, Uma <uma.shankar@intel.com>
> Subject: Re: [PATCH 00/10] Introduce drm sharpness property
>=20
> On Tue, 09 Sep 2025, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> > On Thu, 07 Aug 2025, Nemesa Garg <nemesa.garg@intel.com> wrote:
> >> Middleware MR link: https://gitlab.gnome.org/GNOME/mutter/-
> /merge_requests/3665
> >> IGT patchwork link: https://patchwork.freedesktop.org/series/130218/
> >>
> >> Continuing discussions from:
> https://patchwork.freedesktop.org/series/129888/
> >>
> >> Got ack from kwin maintainer on the UAPI patch.
> >
> > The Mutter part seems stuck, though.
>=20
> Also, do you have the link to reviewed and ready kwin enabling?
>=20
https://invent.kde.org/plasma/kwin/-/merge_requests/7689
This is the KWIN MR which stands approved, waiting for kernel merge.

Regards,
Nemesa

> BR,
> Jani.
>=20
>=20
> --
> Jani Nikula, Intel
