Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8985A9F6A9E
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 16:59:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5204E10EBFC;
	Wed, 18 Dec 2024 15:59:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZWLfbNW2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60B0D10E0E9;
 Wed, 18 Dec 2024 15:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734537564; x=1766073564;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xuqtzwsu1vdMwn3EmGfIYYwXT2/+CHNJuY1m/SCL3AY=;
 b=ZWLfbNW23tWIzPYBu7uAiyP3NtHJwD0Pj0lJ2Xz/GbU98JT5JbEb2uiE
 eO0dqfbLp7k9/wM0aj1rzXRrQRuWhCpPvTGicpQ/+nLaHS6/UqqIZvJfc
 HK2EPoqYpcZK9sVbZSazTQos5lqivTBiy4nkycs0m/pQZtaMR3dj/B+dZ
 R2EzxLx1TN02VlbLb9n0taaaGCU4bvHhwq6gkpzGRfRYi+5YnOoDxM3d7
 Jf48LDrmp4sWSDEgHuQ7vMj8CoNbzUsQg+x0daxA53fSg7rNV4jXJ78v3
 ijSSWAxpfKZcVqwtRGR5d30bNqDoZemF3LNM/23DJo/MTPyq86iKhCwJR g==;
X-CSE-ConnectionGUID: LsPdrCL0SSyyIqJzE6BhWA==
X-CSE-MsgGUID: N6jGaA3ZQrmCZ025XZbw+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="37860214"
X-IronPort-AV: E=Sophos;i="6.12,245,1728975600"; d="scan'208";a="37860214"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 07:59:24 -0800
X-CSE-ConnectionGUID: 3E7QcLEbQSuQyPy1nse0Xg==
X-CSE-MsgGUID: 9pnvBEdqRg6TbjKxAk+qvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="135234014"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Dec 2024 07:59:24 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 18 Dec 2024 07:59:23 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 18 Dec 2024 07:59:23 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 18 Dec 2024 07:59:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r4jf7h0XPcu8nfuQFASJKeZtPri7FI1AWl6d2FlGz7sXfYN/Y3GvIFRSpYPDgVVwlCoDfKfC2UKxnXhQYDKre9PM9GqrZDdRbN7pEtcddL4yI8Nh6Yl5t+KYHn1SO/j7xjkSR+Ne9+vUKcBF3odHV/vlSbkLDKqbpT20LWYAPXjaFO8TBzUI5RWJXWsHt2c/TT/W9bFxQ6gSIEdI2PLISZubS/LIsjJDxgiIDa6LenAqoGNPpjAGW4SnEcYDe5ov0TMVsOrPx5pYQN9ctYqUwM4r/ELp7dA74YyT90V+9gpMPqShBH1eyjh5ZmnC2s6eYg7E2VpFlRW0ezaI5pcDmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xuqtzwsu1vdMwn3EmGfIYYwXT2/+CHNJuY1m/SCL3AY=;
 b=OCZo7UIdd79jFiLUg4JrnHTeby8w1r6W2FXSswRyC74gx9xkZjSm2M2HYlHbXm3/2naL63igXvrkJ4LFEkmNTkYkHI+qCbcLzU7aSO4ZtMwchtoxAHs+n2Hq8g4mVwx4kKfUEAhtUaL2dSjD5+X5sZnQfgOyhDuHqPETEOOf12MoHOI6zv+FSLKCdcOkwEEHduUz6PkalgWgR4AlZS33Zc4UkHGklpWqnfe/w2ygEL+aOaT9kzxBoR8/Mq7Os4VD02jJI3oRQa2ndtCG41DnOz51BprYIrTvqtrBUZtdOTfj/YAhgY//+XQ5te9RZCMNe0yHEnruFeogHF9JsCoACA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by PH8PR11MB6950.namprd11.prod.outlook.com (2603:10b6:510:226::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Wed, 18 Dec
 2024 15:58:36 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%4]) with mapi id 15.20.8251.015; Wed, 18 Dec 2024
 15:58:36 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: "Poosa, Karthik" <karthik.poosa@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, Miquel Raynal <miquel.raynal@bootlin.com>
CC: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 "Weil, Oren jer" <oren.jer.weil@intel.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3 06/10] mtd: intel-dg: wake card on operations
Thread-Topic: [PATCH v3 06/10] mtd: intel-dg: wake card on operations
Thread-Index: AQHbOo1AUWIZth7q1kuLhA0cCsqn17LrNrOAgABrRYCAACSGoIAAjmVQ
Date: Wed, 18 Dec 2024 15:58:35 +0000
Message-ID: <CY5PR11MB6366CBE2D1AA392AD3F745F7ED052@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20241119140112.790720-1-alexander.usyskin@intel.com>
 <20241119140112.790720-7-alexander.usyskin@intel.com>
 <Z2H_7Xry3R2fWpMZ@intel.com> <24725a85-47c2-49c3-b2ae-443279b2bd13@intel.com>
 <CY5PR11MB63663382E44A258B0BAEF1BAED052@CY5PR11MB6366.namprd11.prod.outlook.com>
In-Reply-To: <CY5PR11MB63663382E44A258B0BAEF1BAED052@CY5PR11MB6366.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|PH8PR11MB6950:EE_
x-ms-office365-filtering-correlation-id: f9a012c1-5e78-46fb-87d9-08dd1f7cd4a3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?dkViQUxKWGpZeldXQm5HYSt3R01Ud05FMkc3eHlDa3pzc0RTWFRQaWl1QjZT?=
 =?utf-8?B?ODFLKzA0ZW1yc21xemgwNnVhQWpxWW8xWFBPUmVvVk5mM1RoL2lrRkdVZjkv?=
 =?utf-8?B?bm1jOE51VWgyellxRjdydEFxaXBLSEJkS054SDFkaTJCTENQR01zQUs0Q0h3?=
 =?utf-8?B?dUFNZHFxdHlXcTlLVU9neFV6RXVwMy9TMnJxd296UGtpWFNqeDJWV3E2RXNN?=
 =?utf-8?B?STZuNTl0dWpFK3FNMmp4blkvS3RiYXZLWjZyU1FlbXRKeXgrN2F5VERaQ2M4?=
 =?utf-8?B?UVVoU2x5N09xeWJGRjlTUXhLL2IwUHpwaHAydG5COXBiWmF5N09vWHpYT0ZR?=
 =?utf-8?B?YVFxU21SR0p4b2VraXI5dmJwMll2cmxCZjdBNHJUaDRXenRrNHB1VFRUa0tL?=
 =?utf-8?B?SVB0ZWRPRWdFR29BNEpmK2FJem9oSzZEK1AweW1BTVZxNEZaV3hUbVk0SnV4?=
 =?utf-8?B?S2J1RUswWmM4NnZDY1kwcmZaUDVMSUJ2bCtqcEdiL1FkVEVQaC91bmc1S0po?=
 =?utf-8?B?Vm90UlRrN2xVOUQ2VGtsd2xueU5BWUVza2tjeHorN3c2U29SdmJndTF1VjZ1?=
 =?utf-8?B?OHZXUyt6S3EzNVNiTU44VkZ2NTU3WWVPS09GRGFoSTQ0cVd0QVh3ckxUdHpT?=
 =?utf-8?B?QVVvanZjY2pkeGVWZWl5UE15VVg3cTNiSFp6bEFDWVJDSFFUMkIwSENXT1RY?=
 =?utf-8?B?S29QRUg2NEh2eUxEZ0tMUWgxdjR1eEFwNEZSRlhlcWtlRXdyYWJheVRiUmlu?=
 =?utf-8?B?U1YweGhWTU1Zb1Rzelg5UXF6RjA0UTBoRGxlb1VEMlliYkt5Q0wzeHhhZUVh?=
 =?utf-8?B?WGs3UWtDekQxRmQ5QXgvYlg1eCtTamJzRHdKWFRmc3lJRWZVU3VxckJxbURl?=
 =?utf-8?B?K3JrWDljRWx2aTJRYnNXaFNqQzZtamJxMS9BVHc1NU95aFZTRmltVlZkaVFh?=
 =?utf-8?B?OTc1UjBSYW00djZlK1NzWmRHTjZWTGhlREY3R3VMc291SmZyT1VzQmFTOXZn?=
 =?utf-8?B?elZRQWFVaytVNUFRbFQxbEMzMEdHUE0ybTd2ZGVNZThDVE85d3VUZENJdkQv?=
 =?utf-8?B?WjFuOXRkTHdWUnNFNEMvQlFiS1ZHZ0h2UFNsTFNiQWk1L0VNNE1oWTdGendG?=
 =?utf-8?B?QmZyTWthaVA1aWM2dXRVNi9uVTV3S21jRTlHaXVhODI0bmFtZFZhZHZ6eWlm?=
 =?utf-8?B?cXQ0K1J4VzdqRDNKeFVCa2xrVWRYNlN2Z00wRURRTmhGSGxNdXhxMEFXbU41?=
 =?utf-8?B?TXVzUjVTZk5kVm5zZUNFZ2JHL3QrMndEVndRWVlhdUNHSzhERDdNYTJQOCtC?=
 =?utf-8?B?cEZPMHA2eE9CN2JwRVkxbC9uMTZHWXQ3MDB0VlNhK1NOWnE1YUgzZ29FbzZ4?=
 =?utf-8?B?V3ljNXJpeXVieWMrRWQzOXliTlNNSmhmOTh5RWRjYlhiM25LZ1k1RExsMnRV?=
 =?utf-8?B?bmxoaGdlZ0xYaWgydExRK211dmgrTUxib2NFVWNvUjhMY2JQcExjQmxsU1hE?=
 =?utf-8?B?dSs4aGFtbXZrcXF0Uk84VWdDY3BFVmZVQXpNQW1PTHNYcmYvU2J2YVpDN3Np?=
 =?utf-8?B?djFKenc1YW5Zb1VWT2kvNXhITHFyZmFocHBYb1g0dzRQOTBqUkJoRHhxbEp0?=
 =?utf-8?B?RCs1UjNlK0lGSWloT3NQUzFjeEVEejdrUlp4bzg4c0tPYnptaGZveHdaVW5h?=
 =?utf-8?B?aU43a2U1SUNBOFdNenhQbVJCdHlseWhCWTJSNkNmdjFFb2NxbFIrTFpnSE1x?=
 =?utf-8?B?VjhVR3hPVEt4RkRJRE9MeHc2S1pqVjBHbWFvWmJiTnNFOWtaYzg3dEZGaTJp?=
 =?utf-8?B?eFpITjRML3dxanlseTFBU3RNK0VrWnlrNEg3RGZUQWNmZWJPUmJ0VjNZamwz?=
 =?utf-8?B?bjdYTE5wU2psdFZNUW5jQUFRQytTZTBkSTlIczBGY2ZsWjRhRCtLaStnT1Vm?=
 =?utf-8?Q?uM6YGWOH6ACPm3xH9XjU45Sl2Cm4mYJ8?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6366.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QXhLeURTTi93eG9jQjVBRjBiaWVFNnBsdkxIaVh4VkE1NFVJYVJmY1NGWTRl?=
 =?utf-8?B?RHdGYWxReVB3cEpySG5CNHJjNHNjNmpnZlkzYW5ZbGRxUUMzM2k4U0VNcS9H?=
 =?utf-8?B?ZG9XZWhybjEvRENrYytRdW40aC9RWFBHR09rQlpHRVlTR1FKMWVDRFNoSGdS?=
 =?utf-8?B?Z25rbkE2d1JYd0prbkZnWW9zZmNWQ0tGd2JBUDRRMTc4OUNBdks1Z0dGVjVB?=
 =?utf-8?B?cW9nY3liSVY4UGQ5bVN5czBSYzh4Mnl6SGJwYm9abWZ5bW1CQVA3TFVPeGsr?=
 =?utf-8?B?cjNraHZuQWg0K3FaNDhiRWx2eU1ZTldWM1JndHNRS0Z0SmI3QURYZ0Rmekxm?=
 =?utf-8?B?dTR2ODRpem52VU1QVEVOTHh5WTc1ZUZsVWdlMjRYb0FQM2U2V0Zac29PU29T?=
 =?utf-8?B?Zi9vOThNZS85cC9SN3pyK3Z5djhsUFdJNEltUC81eVp4RG5JOUJzVlRURngr?=
 =?utf-8?B?c3RtcnF2cFJ4cHQxZ09EYTVCU2RvMjRrd0RrM1dmRWRlWFJvQkxqTm1Lc1dx?=
 =?utf-8?B?c043T05lRS9BL0xWd1pQODR1YVBRSDcvSU5yc0VNSU54dWZDUjZ0ck9SblJl?=
 =?utf-8?B?eC9DYkl1bHlSeTdsUUVBTzIxOGdlWHNEU2wyOFZDZlJUV1QrdHM0b3J2bk9K?=
 =?utf-8?B?akxFSnBHcDFlSmN1TWgxdko2SllHM0dOK3NHRm8yaDVJemFXYVFLSkFkSWZV?=
 =?utf-8?B?RUxTMlkxVy9TR2M5OVZvM0hYOXdSQ3lSK0ZvMWJ4amo0UCs4SU5TU2VrYVdZ?=
 =?utf-8?B?VGtRWU9ZMnE4Q1RMV01PUkVxeUp6bk5DOXlqWFViYk5Oc1pic3B5Z0JHVEs3?=
 =?utf-8?B?akE2QlZGeTVlTExyWm1PNGZSMWc0ckF0anJheEZxdy9FYXZRc3I0QVZmS2p6?=
 =?utf-8?B?ZElEQVJzZStuUzFtYkF2T0YvUDJseFVyd0plSnh2UWNlQU1UN0FuT0x3bVVO?=
 =?utf-8?B?TUp6cWRrMHpOTjg5TUVrVlZpWE9QSDZQWWpaQ2hFdTE0dnl4TkNHeDNCS3Iz?=
 =?utf-8?B?WGF1blFMVmRheG81d0F3WDErYTFzWVdINkcyMVY0ZHdidUhobGlZN2dDSWV4?=
 =?utf-8?B?MS8rdEZBaWx4Z0w2R0lLa0VDcm1nY2t1QjJoU0dpcm9iaTNKMDZSZmtMeTRz?=
 =?utf-8?B?VHJQZkhEU2pNVG9OM2QwRGZFVmFqZzRMRlVHTXhIbVdBcXpmMFE3aEdYWkJr?=
 =?utf-8?B?T0VDWGMzZGhUeU1ZTktzdStxUng3UFluTWk0M20wRjZJQk5weExiY1JMOVdL?=
 =?utf-8?B?UFhVSEVmcFByNVFkRTY1V0hMbldxbW84ZGNqb3ZRYlUra21jMk5rU2d1UWho?=
 =?utf-8?B?VzVjdlQ4RWViS0tTdUxOSStYV3hyMUhxOVlVTlJmNVhxZGtTc1VzdGxYZUkv?=
 =?utf-8?B?YUtuZ2pNanNNdFpYa0lNOWFiblhKT3hyYmgvUzVFUDR6RzVlVzRrNkEvZ3Q5?=
 =?utf-8?B?cDI0bjRPYzNCYWljK0VFSWRjRktHMXpTRGNNazltbXZJR1V0VEdsQ01vYVkx?=
 =?utf-8?B?K1BIZ0lqRWVsenVNbmZxYjdJTy9wejFWMzkxZzFLbDl4UVJHRnhEdmJnalBm?=
 =?utf-8?B?SldDN3oxeUYxMDcwQzV0SGpFWVlieWxhTVRlMFQrR3VxSUQ0UmtWVmwrYUNy?=
 =?utf-8?B?K0g4RDE2aTFyRC9tZlBSNlQwckFsWmk0TlBaeDFYSHJsVmFRV2FVeW0rN1ZS?=
 =?utf-8?B?UngzVCtLS0Rmb3g4ZHRnS0k3OE5lS29hTGg4TEtzNFpQdW90eERZNTFFdnZD?=
 =?utf-8?B?ZHJ5TlZxd1dpUFptQWxOQSswVWgwMmRBV2toRWRrdlplSjFEeUVrd05NTlpM?=
 =?utf-8?B?M1Z1OVQ4dWRReFhRdnZJTmhrWk9lY0pRRXNidFM3aTdSajNhUjRBUFFVMFNM?=
 =?utf-8?B?cWx0UGJPeGQ3MUVDbWNJT2lRN2tYaHBUbVR3SlR5dWhIb2FNUTlXb3ZtU0dq?=
 =?utf-8?B?S2pwNmVTakRZcXVjZUhWKzNXeTgwbnMzWm1BdlFnZm0reittQXBNTkxZZU9I?=
 =?utf-8?B?Q3htOXFud3poTlVHUll6b2tPMi9zTjNaQWFpS1NEZTk2emVBQi9acXZOQXBa?=
 =?utf-8?B?cnVhLzQzWVZxNUpzMW5oTzBQb3F6UUtOd1NheDBRYW1ZK0JqSTdxUWF1T0N2?=
 =?utf-8?Q?ysp9aY/DYGxynU5xH5kVwv0nE?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9a012c1-5e78-46fb-87d9-08dd1f7cd4a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2024 15:58:36.0290 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5h9M+WJLogXHr2PRt/dIEZ5/BsLmyvMN6TUF75ObfxWTP5gLf8FXe8ppfsKz1OJpXJD4bCabHHeYzTtmCSMydJwmcf9C3STbddO8vYxdZLU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6950
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

PiA+ID4+IEBAIC00NzQsMjAgKzQ3OCwyOCBAQCBzdGF0aWMgaW50IGludGVsX2RnX210ZF9lcmFz
ZShzdHJ1Y3QgbXRkX2luZm8NCj4gPiAqbXRkLCBzdHJ1Y3QgZXJhc2VfaW5mbyAqaW5mbykNCj4g
PiA+PiAgIAl0b3RhbF9sZW4gPSBpbmZvLT5sZW47DQo+ID4gPj4gICAJYWRkciA9IGluZm8tPmFk
ZHI7DQo+ID4gPj4NCj4gPiA+PiArCXJldCA9IHBtX3J1bnRpbWVfcmVzdW1lX2FuZF9nZXQobXRk
LT5kZXYucGFyZW50KTsNCj4gPiA+IG9uIHRoaXMsIEkgcmVhbGx5IGRvbid0IGJlbGlldmUgdGhp
cyBpcyByaWdodCBhbmQgd2Ugc2hvdWxkIHVzZQ0KPiA+ID4gdGhlIHBhcmVudCBjaGlsZCByZWxh
dGlvbiBzaGlwIGluIG91ciBmYXZvciBhbmQgb25seSBoYXZlIHRoZSBtdGQNCj4gPiA+IGRldmlj
ZSB0byBoYW5kbGUgdGhlaXIgb3duIHJ1bnRpbWUgcG0uLi4NCj4gPiBJIGNvbmN1ciB3aXRoIFJv
ZHJpZ28uIElmIHRoZSBwYXJlbnQtY2hpbGQgcmVsYXRpb25zaGlwIGlzIHByZXNlcnZlZCwNCj4g
PiB0aGUgcGFyZW50IHdpbGwgcmVzdW1lIGJlZm9yZSB0aGUgY2hpbGQsIGVsaW1pbmF0aW5nIHRo
ZSBuZWVkIHRvDQo+ID4gZXhwbGljaXRseSB3YWtlIHRoZSBwYXJlbnQuDQo+ID4gUGxlYXNlIHJl
ZmVyIHRvIGh0dHBzOi8vZG9jcy5rZXJuZWwub3JnL2RyaXZlci1hcGkvcG0vZGV2aWNlcy5odG1s
DQo+ID4NCj4gPiBUaGUgb3JkZXJpbmcgb2YgdGhlIGRldmljZSBoaWVyYXJjaHkgaXMgZGVmaW5l
ZCBieSB0aGUgb3JkZXIgaW4gd2hpY2gNCj4gPiBkZXZpY2VzIGdldCByZWdpc3RlcmVkOg0KPiA+
ICJhIGNoaWxkIGNhbiBuZXZlciBiZSByZWdpc3RlcmVkLCBwcm9iZWQgb3INCj4gPiByZXN1bWVk
IGJlZm9yZSBpdHMgcGFyZW50OyAiDQo+ID4gYW5kIGNhbuKAmXQgYmUgcmVtb3ZlZCBvciBzdXNw
ZW5kZWQgYWZ0ZXIgdGhhdCBwYXJlbnQuDQo+ID4gPg0KPiANCj4gSWYgc28sIEkgaGF2ZSB0byBh
ZGQgcGF0Y2ggZm9yIG10ZCBzdWJzeXN0ZW0gdG8gYWx3YXlzIGhhdmUgZGV2aWNlIGZvciBtYXN0
ZXINCj4gaW5pdGlhbGl6ZWQgcmVnYXJkbGVzcyBvZiBrZXJuZWwgZmxhZy4NCj4gT25seSB0byBp
bml0aWFsaXplIHN0cnVjdCBkZXZpY2UsIG5vdCB0byBjcmVhdGUgZnVsbCBtdGQgbm9kZS4NCj4g
DQo+IE1pcXVlbCAtIGFyZSB5b3UgYWdyZWUgdG8gdGhpcz8NCg0KSSd2ZSBsb29rZWQgZGVlcGx5
IGluIHRoZSBtdGQgY29kZSBhbmQgdGhlcmUgaXMgc29tZSBpbnRlcmVzdGluZyBkaXNjcmVwYW5j
eToNCi0gdGhlIG10ZCBwYXJ0aXRpb24gY3JlYXRlcyBkZXZpY2UgYW5kIHB1dHMgcGFyZW50IG9m
IHBhcmVudCBpbiBpdHMgcGFyZW50IHBvaW50ZXIgaWYgbWFzdGVyIGRvZXMgbm90IGV4aXN0DQot
IHRoZSBjYWxsYmFja3MsIGxpa2UgX3dyaXRlL19yZWFkL19lcmFzZSByZWNlaXZlIG1hc3RlciBv
YmplY3QgcG9pbnRlcg0KVGh1cywgd2UgY2FuJ3QgdXNlIGdvb2QgcGFydGl0aW9uIGRldmljZSBm
b3IgcG93ZXIgbWFuYWdlbWVudC4uLg0KDQpNYXliZSByZXdyaXRlIHRoZXNlIGNhbGxiYWNrcyB0
byByZWNlaXZlIGFjdHVhbCBwYXJ0aXRpb24gKGh1Z2UgY2hhbmdlIGFsbCBvdmVyKT8NCg0KPiAN
Cj4gLSAtDQo+IFRoYW5rcywNCj4gU2FzaGENCj4gDQoNCg==
