Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23EC3BCB97C
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 06:07:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50B6810E031;
	Fri, 10 Oct 2025 04:07:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NT/wDO0U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2F4710E031
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Oct 2025 04:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760069252; x=1791605252;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9UOQ2bgtb4nTn+PDssYYssbCtBF/67xXcdceUcLASLw=;
 b=NT/wDO0Uzz/hr6GGpZ0fKqxV9NUKbqy8fjlzMv1zIu4jzVeh0mIZe6ze
 Zi4ShUC1Xixaw8360xf/Jh5YNQQNkP7i5oEQn56nibrvI/Kd1QPGG8ys1
 IgQDcPyQuqt10DqBUB7kmTBgfjHcw3VAr9lsLBRr0ZkTRmoafCgDkuvDk
 jSGJIE3OxAEbGqVGANh+4TACLfeh16QC9O+ZBzjoVsxwGsR1dVK5E1AAZ
 tw3MvuQ1Ao7vwW16UoKoJrVLFPNk6GEkxxh3vhXtk11mzfTr57vvAwuGC
 cOYNS01zYyXBasB2lCG64s2urlbHIxr35LN+F8t0TO4l6odRr3cudp4PB w==;
X-CSE-ConnectionGUID: K0lt+PItQ+ynF5JHEI3G/A==
X-CSE-MsgGUID: kKIdDslmTqSroO2j5qLoTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="65938242"
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; d="scan'208";a="65938242"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 21:07:31 -0700
X-CSE-ConnectionGUID: anPN8f9xQlOekA0iiGdhFw==
X-CSE-MsgGUID: zM8t394SQN2WLxF1dcgdYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; d="scan'208";a="185133091"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 21:07:31 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 21:07:30 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 9 Oct 2025 21:07:30 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.46) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 21:07:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A0kJJ3WjCBzqJxbA84q+LZmarTRUUv6CpKqGfNBywAF3/UyaehvaW51VDc8ea865RO9Ya87GXzI4V+ierHwohNcTwYGr4Z0fHGG4k47Z1hHgw7kZece2SE/JRapZI38oyBDMSGJTJk4RaNh6OoBnclS6oJ2itDX2ta74HqaJOotTvsHMxtVpYTw3szwvInfUxrmGF/4+LOhhj2zKuhLst81/YwOM/me9qfK1Z2cOPmScQwb1Qk3/9su687P+Dbnn7Wh9XxHe7YF/PrQSC+fMVAapPQ20ElBUj/N0Bd71KB7UZWih5xFRZLZIGxAcZi7vJVe51eRXT1MwHjsfRlq0jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9UOQ2bgtb4nTn+PDssYYssbCtBF/67xXcdceUcLASLw=;
 b=yQSvIH1ZL1UWhuEBfcyO0KoBZOORK7iFEht3q9/BG2fdwi4UYfBSoZcL4/eXsylk5j1BGq1PYhd36oH9hfKfOvvas5E+JeT/X2ZQDewzNlny57R7LCN+AHjs/thfPPKIwwEF29Zzb0nkx7e5+mbtrJSgAXaOgtElkfUaw2AOcdXg76nzUpqWkCJI80jW2vnup8a+zuK73B0764AUucP/3USVZiM/DeZDIsLQ2FP+F+BszCmkX5HiJqno8NPrQ1j86I02wVGdg2GOOkUTugPoPaEo0qg4y2NGJz1EozGD1hZN/xI+Uz9xDgg/5n0UPf11ce9ujS0++BLZdiLzIn1i/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by SA3PR11MB7434.namprd11.prod.outlook.com (2603:10b6:806:306::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 04:07:22 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%4]) with mapi id 15.20.9203.007; Fri, 10 Oct 2025
 04:07:22 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, "airlied@redhat.com" <airlied@redhat.com>,
 "kraxel@redhat.com" <kraxel@redhat.com>, "gurchetansingh@chromium.org"
 <gurchetansingh@chromium.org>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>
CC: "virtualization@lists.linux.dev" <virtualization@lists.linux.dev>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH] drm/virtgpu: Use vblank timer
Thread-Topic: [PATCH] drm/virtgpu: Use vblank timer
Thread-Index: AQHcOFTh4O7Et3uiykydidDxo4mQL7S4trEQgACgZQCAAMxRUA==
Date: Fri, 10 Oct 2025 04:07:22 +0000
Message-ID: <IA0PR11MB71857FBEBAD5404D13752092F8EFA@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20251008130701.246988-1-tzimmermann@suse.de>
 <IA0PR11MB7185D91EB0CD01FD63D21AA7F8EEA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <9aa83493-e036-4a89-825c-3ed95ab5ae30@collabora.com>
In-Reply-To: <9aa83493-e036-4a89-825c-3ed95ab5ae30@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|SA3PR11MB7434:EE_
x-ms-office365-filtering-correlation-id: 02f53133-38d9-4660-422b-08de07b28358
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?2vU2OeM6GJflMKqVotvTsi5bIfgslpORe0SMn5OcWa1ozhatzkvYZwdWZLsO?=
 =?us-ascii?Q?QScr7RCZSXNay9uH13Kq/bEgt6SiyVrP4+ebUGMX1jZyHY++5R8JAPgOJqOK?=
 =?us-ascii?Q?lzXkdSwaTfbAya9xZ8BHJagA7Yn8wOQgQHqLkSFNHp/ijd6+25pb/CbrRYjN?=
 =?us-ascii?Q?seKurjsThmm8kPyxNLO/o0dOyPwd64K9CLLpIhYpVyMhYnX+HkGWc5ayiFoZ?=
 =?us-ascii?Q?Ik81V+PEd1cc9gMjWt76eURGSLbtZdIpTmcScnYVWegwzcIKqOpEZcoV1Lfu?=
 =?us-ascii?Q?zi9Kai+bAFLqREook42KC4Ge/UTWIHUzqewvYe0ARlwJOgUBS+Xzz447Y8oj?=
 =?us-ascii?Q?esnIt3178+8hmSbY7M0S5cfTrOkx2G1GE3XVCqzDTUbKijt+lpau4C/A6dCY?=
 =?us-ascii?Q?LXKuqDYKSyHEDn2gl2C/amWAU6YIRlNxPrd3Cy234JNHONTmNfVQsC3wkhFT?=
 =?us-ascii?Q?IJ1UR8F7rD4xBHZhAFotxNtgXE+N6BmW9i7tMD+DjL33ggj+3PhXb7aJeK9e?=
 =?us-ascii?Q?wg6L00Cnxb5wMp5MlsJyoQabVsQBXuOQLje3RsJRYZ+WOjK52YwcLXwselEJ?=
 =?us-ascii?Q?Ha0ORh44Cmrda0Iym9daTBH2y78dYS83CgeuMwbZoMXexfPnnN6ru7qwwgnt?=
 =?us-ascii?Q?2ABLLvkBFUJybF6C+ium5Jg3mqipNN1fSzTuYXwvdci2Xo+vXJMOfx2Qw0Pn?=
 =?us-ascii?Q?W/Pwt1ghyntQNMtG0QdqRJ59+0YCVGikIF9S49IDnKYSLsB7TBt5xhjJBqrP?=
 =?us-ascii?Q?dF+USxYh9dCh3XEu0f+GsUK9ymYZ55eGI+vIaq8Zr4o+Ehd23scxIEcB3M9f?=
 =?us-ascii?Q?wVLais6EjK8FCgNR98C5l1zOtP8ECOR67EwoIPVWVegpTu24z6RSQcmVecJa?=
 =?us-ascii?Q?57H4CmD6lLA1OBqQRwy5Rkl56tIQ1pC3nZiKACM3kTvjM0l6jZrEfKDrod8q?=
 =?us-ascii?Q?XRhm9TJ9Nso24jNk1YE7G0TSs8eRBiSlcTQ6qLii1Pas/hBbm3npVlpd/p2p?=
 =?us-ascii?Q?/jKcYX1+LkVwh6KoU9ek0rx5i0ZUfj9tLFWKlf5xDeiSEtsE6rPvhheGgik0?=
 =?us-ascii?Q?T6n5X8HOOlUmcdZXPiIqv4OX6YZSamdZK7kF6TekQ3due2Lk2hYnHdEh78IA?=
 =?us-ascii?Q?O4D2Mb/vYQLpRFNcOSnm5NushmTNwiA4mTGMaegqvR/uawlXNm0JqV/kPOjZ?=
 =?us-ascii?Q?1i4kTARO+w7gxpgYRmqEEE1uECtjcHr1Pq9Bgk5zjIUHuOLmTIc+swfLbtPP?=
 =?us-ascii?Q?joYz8zTKQAsji4AN1I5wKvx7OKhLnkYZY+Ypj2BtEVVrbOpVP40CH5e0qza9?=
 =?us-ascii?Q?rkXNHKKXohkLrInRDwC8VkzAA/YGhT/UJXHtfISsVnSf/tU4zkgQxquGj6LQ?=
 =?us-ascii?Q?CS8uCZjSf2+qvLUty3M2ko9Y7iWj+9r4qSw8Eq5wFroUSaPXHg2JwEsfwhal?=
 =?us-ascii?Q?iIFXCmP7Qoa+TX+Gw1ddA0y7hd68/tq/VUspcoXr4VTgVvEnLHC43L63CZMH?=
 =?us-ascii?Q?yVjgSh1UtNoKd6RsJdaYaRmB72sVECFrYzew?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?X9E3GNgdgnoEPdbnLTHDInOpzcDJw35z7SPKdOLD9wrMkLIRT5INF9al3nhA?=
 =?us-ascii?Q?IAn1vVv2UDIsRs9hN7Aeo8adBpJs/0/4RV8qbU2+fcBROzH38xhx6aI4pewW?=
 =?us-ascii?Q?XwL2t7tmEvZeMsQUgONJ1BtUhVOHTwBKO8z4lslCctRF582M+YZv2WPeiNBh?=
 =?us-ascii?Q?L29Q2cv+ZyQ4vdjyKw7DM7ueMK+Samjk9pqILIxmnbRnWhZ4UajnGPlez9O1?=
 =?us-ascii?Q?cbt5z8iV4QeL5UrKy1ACT+WA1bv7gHl68Kn/p+D9zoIvEzOJk6IaD1y1VTCt?=
 =?us-ascii?Q?5DRuMu8oTwZs9XBzGbr7+/KD96MVNvUOB/s8fgOwI1fz7N+TDT6I5cduHMkk?=
 =?us-ascii?Q?n+1f0UuJDA6Vyl5/7zxBxyYq7m3PDPEis8BdW0j7/3bB6PudyUU2BUdHR6Ga?=
 =?us-ascii?Q?WJs99pKblLf/ABNQGGC+fgu3qq+BUxaSqRkC5AfdYrD/K7rWfros2LqHcxZK?=
 =?us-ascii?Q?pFg56MY77WIJOOY5XwXkerCQ3C3XcHvOKnwJ2DTOb1x9r8oHWUXY+gDtvpgl?=
 =?us-ascii?Q?UEhEEL796VS564uE5A5Oy/QN6ZzIaa+yEkACQEq71mLDqn9wWE7AjyyIi9Zr?=
 =?us-ascii?Q?nAip5T+GLMN+Xfgx/OPRla33ye/+nFqrgzsNW02MzqqT/JrXGKA1NQ5yl0Yx?=
 =?us-ascii?Q?wkRgn9JXBMdgNRVyAPVmxBBS1FB7dwNqo17UCQU5KL4uWB+aHmRWZa5ADaqx?=
 =?us-ascii?Q?almgK9Fut/ZlP6WFNDtg+EYRp3DpG+bz/kR+tl++UI+rb/xcR1oMna7gsRKD?=
 =?us-ascii?Q?Yp0yRUm5EAX5QJYnmQWtxVJteAEDARsnDX9KLGVeXEVHETNC1l3Jf4+1eUvc?=
 =?us-ascii?Q?c4QZ6IIQaxyGLETcmFUVhMmes4wje2A/SNVvAYvhrQtfMxoqrHm9kc5ZA60Z?=
 =?us-ascii?Q?qaRxVNPF11gDNWCIkno0W3IW83+7bda9e9wDSeayw7N69HU+eJYeB8pziCTr?=
 =?us-ascii?Q?hpgkbzV0pk4tUdG9gvGzybrV288ukn161TmNvfdZNtnVbcppbm+sFnsiPRmh?=
 =?us-ascii?Q?nlazgMrJM9dGHi8LaZTpy+8vXPDG4DsYduWLL71RCsOXetCkh1DiHozMlo6j?=
 =?us-ascii?Q?MtgQ0DKUtgWYhMOQYamiKcpwdlyLYZVQ/G2/p3tCD0DuPJu+P2oiuiOadX2R?=
 =?us-ascii?Q?26IaWJFVPuja7fQKplyt6NDNSz4/sWhLD3NHuRtQjRID4c0CiEzpuLzcNmQo?=
 =?us-ascii?Q?LuQzN8qO9onHAPcvwRfQIkvD/4F6KOri4VAa9vU5RNWqlIfjUR0sLaPI1buh?=
 =?us-ascii?Q?BZo8hJui19cHXIxBlv0VmIMNel+/32fGZrJskZ3m37NLUype3m8MZgwB2vr9?=
 =?us-ascii?Q?I1jZj0hxuWhfJvLswqyhslDcVV5y+QdkuyachJa+/BXoGBX36ve8lxhZXOTQ?=
 =?us-ascii?Q?HfBP6pClzioyL5PKrqfgScLQgmt4GKYj/+bbj13PGxPbojoVCBCFc13HvPp/?=
 =?us-ascii?Q?b+dacyJllXdUsGeUjd1zpMiH898hgn+SFxn/i2HqDuI2vyp9HBChmSOCMtin?=
 =?us-ascii?Q?UI/SaMGgDgppw3a0qUHA0ALoVA/TciVVJebTyEBNGzze9ijUITeOGDz/P+Z+?=
 =?us-ascii?Q?3HjpWPXd/BFmVf0tsrKZ5t9/L0o+L5Syvc5hK0Z7?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02f53133-38d9-4660-422b-08de07b28358
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2025 04:07:22.2205 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0WUARTy9Q/TecJbUufeRuI57e3V/IItUc+3aD643gxTvCb5e8brV7S22KVPxR1S6eyhivG5x1YiPVc9bxvJQGcAR+BtzoLGHKotzqXwZcEs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7434
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

Hi Dmitry,

> Subject: Re: [PATCH] drm/virtgpu: Use vblank timer
>=20
> On 10/9/25 06:23, Kasireddy, Vivek wrote:
> > Hi Thomas,
> >
> >> Subject: [PATCH] drm/virtgpu: Use vblank timer
> >>
> >> Use a vblank timer to simulate the vblank interrupt. The DRM vblank
> >> helpers provide an implementation on top of Linux' hrtimer. Virtgpu
> >> enables and disables the timer as part of the CRTC. The atomic_flush
> >> callback sets up the event. Like vblank interrupts, the vblank timer
> >> fires at the rate of the display refresh.
> >>
> >> Most userspace limits its page flip rate according to the DRM vblank
> >> event. Virtgpu's virtual hardware does not provide vblank interrupts, =
so
> >> DRM sends each event ASAP. With the fast access times of virtual displ=
ay
> >> memory, the event rate is much higher than the display mode's refresh
> >> rate; creating the next page flip almost immediately. This leads to
> >> excessive CPU overhead from even small display updates, such as moving
> >> the mouse pointer.
> >>
> >> This problem affects virtgpu and all other virtual displays. See [1] f=
or
> >> a discussion in the context of hypervdrm.
> > When running Virtio-gpu with some of the UIs (gtk, spice, etc) in Qemu,
> the
> > Guest display updates are synchronized with a timer (or repaint callbac=
k
> in
> > the case of Gtk) the UI layer provides particularly when blob=3Dtrue. I=
n other
> > words, the Guest's atomic commit does not complete until the Host
> signals
> > (via a fence) that the update (or flush) is done.
> >
> > This is because when blob=3Dtrue, the Guest's FB is accessed by the Hos=
t
> without
> > making any copies. So, to avoid tearing, the Guest needs to be prevente=
d
> from
> > accessing its FB until the Host is done. Therefore, I think for virtio-=
gpu, the
> virtual
> > vblank timer can only be helpful when blob=3Dfalse as this is the only =
case
> where
> > Guest's display updates are unbounded (and Host makes a copy of the
> Guest's FB).
> >
> > I am not sure how this would affect virgl use-cases but Dmitry can help
> explain if
> > the vblank timer would be useful there or not.
>=20
> The vblank timer should only limit framerate of virtio-gpu, I don't
> expect it will cause new problems. Do you see tearing using this patch?
AFAICS, having a vblank timer when blob=3Dtrue would be redundant and
will interfere with the synchronization mechanism because the Guest
compositor would start a new repaint cycle without knowing if it OK to
reuse the FB it had submitted previously. I have not yet tested this patch
but I strongly believe it will cause tearing issues particularly when blob=
=3Dtrue.=20

>=20
> Vblank timer makes a big performance improvement for virtio-gpu KMS,
> especially for a native context on QEMU. No tearing spotted with it.
This means that the only remaining case to be tested is blob=3Dtrue and
virgl=3Dfalse. I'll try to test it soon and let you know.

Thanks,
Vivek

>=20
> --
> Best regards,
> Dmitry

