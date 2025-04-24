Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A30CEA9AB1B
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 12:54:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C1F310E7C3;
	Thu, 24 Apr 2025 10:54:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HyW1iRMU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0743410E308;
 Thu, 24 Apr 2025 10:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745492064; x=1777028064;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/dEL40tu2zaAvtnsEmperg6Fj9kV08hffGHaL9puc90=;
 b=HyW1iRMUiWobbM2wU5tjvgDrsuqSp5oi+BgXh5586uY/5lDPXdCGxyKc
 WbWuMsbO0SWOojcEYCOQwnKHVMHwrJpTk8pZTGYNUA44CuUaBBRV+dgfD
 DKVikFA425Yw7f/ftVTO0MUVlL4vEDrUfvDY7/GuoLMvVLlYjvTJ9MAnJ
 z8ilUeLtq1o5haZgqxWv8GPfCLGgDczmT1yfxuNuThzN7R/1R8Ivu7A22
 kv9cfSkTWzZFF1re6Y1+QBCklZ9GtRP5trncSsWLgRMFP8s9X+Lg0UDwa
 47e9yCa2aJic1neOg1jMwUVnqVyoiQRbjOV885HswGSw2u9SNW0DgNjzz g==;
X-CSE-ConnectionGUID: AG/Rd7UNT3msurA/2uUgtg==
X-CSE-MsgGUID: rvV+diggRNSJ7JGgTyXqEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="47245930"
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; d="scan'208";a="47245930"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 03:54:22 -0700
X-CSE-ConnectionGUID: iJR2S9j2T+yCudLleRffvg==
X-CSE-MsgGUID: cQIBCLXZQSCYOZaiQCLXMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; d="scan'208";a="169798429"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 03:54:22 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 24 Apr 2025 03:54:21 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 24 Apr 2025 03:54:21 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 24 Apr 2025 03:54:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Te4xTRNSUmv3rZu4C3zrp35BKnvxX3GpkimN7nIcz+VcFqIfc9NFTFBh49P7xG1c/41mjGuBmi+bzlEn3NTpnoEjAYIc6MaKrAwUAT4DtfPd7zCbnHYxaHgwcBTVJ9Fwz1jNSkUp7Z+vmbXrbQKsHdyywNe9iPT0ebDt6DZPb8/i83LG8v4jtLgUJf4Ev0HhB0vgvqOAY4ZLWjI3X6KZrfk0QnVbZtl6gQfFih2lvh9DiBThMQJTFsxvI5lmmJNAHaoNPwkiGiJ3wa7v2w6sZkf58pujCkY9/cu+f4zGpRKrXBrqg3AnFdN15BwO2w4d3j10d9gU95kWM6q0GHZzSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mZwrkZAxf9Ttm4BAK+D3RmSNovgSAZ/OQeKC5Jss5vk=;
 b=GRPUKhDJHC4i0Ats3soWysgwFAxctOkl4M+dLaEGVQKbSGKnbxPHZJzem/MaAWa3E5DWKnttBzbfIwImYrfVWuFY/a/BHX0u23lKK6FX4Pln900NPedSrJ8i4o+9slfKlWUVwxcV8T6xi0S56k7mFZ7V8fC7qGGmdJoR5wphMMRBiS/tYS5ihSljzmP3dsJZLaAqLys0pFlTxMOjLI0+x4GBXnNuQ3aqCo9iW/RkW5Wkiv7S+YL99OpaDaMnFghi1AgOgH++ECmblv7ibTx3/j3fjqY0PBRLr4hzMHk/3XrIFVuutvymfkmgvLtyITZgCcqrt/4jqcOsTKipG0GXKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5370.namprd11.prod.outlook.com (2603:10b6:408:11b::8)
 by SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.26; Thu, 24 Apr
 2025 10:53:31 +0000
Received: from BN9PR11MB5370.namprd11.prod.outlook.com
 ([fe80::67f5:67cf:798d:5f73]) by BN9PR11MB5370.namprd11.prod.outlook.com
 ([fe80::67f5:67cf:798d:5f73%7]) with mapi id 15.20.8678.025; Thu, 24 Apr 2025
 10:53:31 +0000
From: "Chang, Junxiao" <junxiao.chang@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>
CC: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Clark Williams
 <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-rt-devel@lists.linux.dev" <linux-rt-devel@lists.linux.dev>
Subject: RE: [PATCH] drm/i915/gsc: mei interrupt top half should be in irq
 disabled context
Thread-Topic: [PATCH] drm/i915/gsc: mei interrupt top half should be in irq
 disabled context
Thread-Index: AQHbtOX5/tm6pw6iJ0SmX6VaRYGvKbOyZ6GAgAAEKoCAADXgcA==
Date: Thu, 24 Apr 2025 10:53:31 +0000
Message-ID: <BN9PR11MB537042DD2F672D85765565FAEC852@BN9PR11MB5370.namprd11.prod.outlook.com>
References: <20250424065609.624457-1-junxiao.chang@intel.com>
 <20250424071553.yT9-dWWM@linutronix.de> <87zfg6yq1k.fsf@intel.com>
In-Reply-To: <87zfg6yq1k.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5370:EE_|SJ5PPF7DCFBC32A:EE_
x-ms-office365-filtering-correlation-id: 749ecf03-8162-4fe4-7047-08dd831e40ae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?67YN9NO8u4MXzUJWx1SVyQ11j1nJjEZ49VEtYWeBUPo7Yi8G+mnhJ/a4wNaf?=
 =?us-ascii?Q?Yj61WEZpkr6QyWT//I0y9OhQdf99eAVHizrTmUqOclwnlM/WfxXXzqgZk/Ji?=
 =?us-ascii?Q?aSUICM18+FX6BFUpQ7Vl5KZNJuywFrZOKMVyI184Oc0NORIi/71PLbXx8q0F?=
 =?us-ascii?Q?DL7k0rnAVR+m//8dnb7X4O4hukBiZIWPN0QthkLHFH6ev46CY0mEyJsrA+Vw?=
 =?us-ascii?Q?M1OUKKxvJLVqHdDzQ87z0d5vZX4BEfEZrgkmAbxBuIWJgHhckjwFFUOw51dy?=
 =?us-ascii?Q?FcmKHQA8YhN2zIU4U6fBr0p6LJDyGek4tQcTkrBeV2GcCfqD4pAmK2YCGXzp?=
 =?us-ascii?Q?htXzU9tuQIXB7sHh9AyfPMGV0nusItId4A+hu+VrrEZNHWeazy/ZqHel+vmW?=
 =?us-ascii?Q?FodY/wbSvThIjfMihmWw3tlCrKN3uWXw3qy37jMBtJjZRTmrnt51adq8gpSs?=
 =?us-ascii?Q?Z0KoSzBXgxQmV/9aBxXUOZ0IjFtS3opIYWeL8CjzIGE8ApkmhbOHgREqfLjl?=
 =?us-ascii?Q?NgS9XdD/ymDz+eutp92J5uHY0cMY/rJRpod3pw/qW1oLWjtgpIZkU6/D441d?=
 =?us-ascii?Q?8KVziP51zk4EbTnR3vzBlCPi3YFQmtttwRi81131Ftu/i3PapzOwirZeYhF3?=
 =?us-ascii?Q?Pp1n3Wo9fRJudrxjr79YKWctWmjbobPultFw2Dtfl05Q7sEHAfZPj9rRB+4X?=
 =?us-ascii?Q?J1TUfOEXRj7Ss94cu4IKhcjxPmHlHB/pZ/Qjk67f3CN2CRYpFimtCnZSv3Od?=
 =?us-ascii?Q?vMaqeRQy7N7ihxH+InFP9FP954anyW31bqDpPaxD4dw62Wsj/ttKrAamNiza?=
 =?us-ascii?Q?relI+xaKaTue38mMmMA6SVWfQ9OWCjei4CphVuRaom5LTEPCuiJ+Nd09y1za?=
 =?us-ascii?Q?85E9EcVQRVuf6PPBNnT8BXdU7Ij+I2HUUAik63CX6RyT6baHJy5Ljc/rEQ9+?=
 =?us-ascii?Q?C/95Igm8zT8oS+W0qm9ybJ7OG0iu8XuTCZOtRbGgDtnQxBmDz1UYNlINbg0a?=
 =?us-ascii?Q?hpChR/7YhIeVs8AZlNw4iaJJca7yNYOhy/3e6v8zo4uuX8l/lXxdbi76v1qP?=
 =?us-ascii?Q?v5QQjJgA4UZni+l3c8EYFWuepiLy+XhNvZfKrTg/n+VT6gGUADqF1PDYqgr2?=
 =?us-ascii?Q?+BtC+pYYgTR62dpHoAK7VneukCM5Y/MxPTX2+VokNVhOwHLQ/0Z6F8RZTp0S?=
 =?us-ascii?Q?8oJFV+mmjaY9Q+2hhABLS4UHvTIz3lEccuMcgcmljwrU48g31BmL9EjOUAwS?=
 =?us-ascii?Q?3MhLEpBK/IwvxpZFk2DU12mj3UtQyyRfMW2a1+QBHfwSA+I7vRnEZ4HWStr1?=
 =?us-ascii?Q?phtknMdFhC5XgPWMrLzUKF4OFdGKn817OtioDJsqEDt5qObjd9+nndNTdoEF?=
 =?us-ascii?Q?Qa3gwVtn+SbN/pgTYVYXkp+Y06N7kjIXeDd04zleX0SfLA6D4g2p/3KIUbAe?=
 =?us-ascii?Q?WGYXAj7lPM5zLLtMqDWPLyEsV3/7sLqxxx6rHAia0L9oO2ulfjsVqA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5370.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?O+nmAl64JuRq26PrpV2HN867nfp4yLDgzDnKQJVDfJM0RDeRjUNW8W15RE+w?=
 =?us-ascii?Q?R6gBwLw/1CVpaelQlyZ8eViNqgtaX2u3M8cN0RLUXpfnhytTL/GIKUbnElzT?=
 =?us-ascii?Q?K5GyBmra1C0WTa5OCahfcfyNegbTPOWdHYJmoOGutrsiz0SZnX6wqxfGfNjo?=
 =?us-ascii?Q?rhzKyfZPPsIqC34ydIdUUHliMetyyTnjY6QkKNA0ZXHEDryYE2tIqXg8c9tL?=
 =?us-ascii?Q?y/VnQzi5JKajU5zf/++pliTgKTQI1QLnFY3/9fe+AjsXlbgMlbUKV4CY0OyX?=
 =?us-ascii?Q?JBqVxeGrUlV5GtB1NyAZCvlo+R0wIduCz3Zl47pEmPD5roiHGQ1vOrrNCTXO?=
 =?us-ascii?Q?mem8auYKcXLlkZEoQ2+t7YdY1EMb9dz3VrVvrTwD8/H8ryACDkelUnIKaoap?=
 =?us-ascii?Q?1QIk7a+BnWexA5Zvb9TLpvD6id1wd2i85MiyDBgqIHSfYpzXRJxyw9dBfX7J?=
 =?us-ascii?Q?Zx2+cxm59KhJrT+HgDENYTrY/LtE/+h7pQYFsVzqUnk0W3emAaQL1HJw3u68?=
 =?us-ascii?Q?mPywtefz3tAa/As69KnX5fJvvYcxCwd5Lh4gTTxehwsZ+9+j2fY09CT901JL?=
 =?us-ascii?Q?iJMOfc+6iSybLosowRuoXYdAF+m/FFSN/axZ/dC7OqiCHOd2+o7sAwFfzC1u?=
 =?us-ascii?Q?Keb8WvJcBJ9VAjkyEwyzSQX6SgPZTGgMXdKATbR+ZEjmcAHWv4j7kBvwmaiF?=
 =?us-ascii?Q?mJ9CQGjgMl/IxenTDDpU6LCDotbCMiIWPcssG/Y9/lco8rmeyu4IsPgSgMdz?=
 =?us-ascii?Q?BEo/67ntLQM3FZLQUCNV3oJeGpdvafhp02FLfA0nKqZlzC/mT8Xs/1u5ff0e?=
 =?us-ascii?Q?1sLmZlb7S5nvnRiRhUG2fy2Ow3xIe2WSLrLm+4OXUWO0EZN10tgHr5CXDber?=
 =?us-ascii?Q?Ti+yJF+yneOA3PqYq3TdN2KfJRWEkttfQF1UTheCMYzYVqcq6mReAn/QTBmd?=
 =?us-ascii?Q?d9C6lGDfzk0xHinjiHmHfFSmaUvnr9cRLS4f2aCihwz2EuqqMrXxk5TB7Kg/?=
 =?us-ascii?Q?SP1vBIY3S84ia8gMFm5u/V2Uuo3pQztI3QxmwIgrQsy8Xvk1/ydHSH05ygM6?=
 =?us-ascii?Q?4JnQHPoIlWh2PSonAcHRB3S2XYqc6LwTbGx3jslL8Wcq1ZnMaLcI0B6c0hZO?=
 =?us-ascii?Q?F7aLqj5aQ/Vx9RFtlBHOx9ud2O4pJlMos3e3XXm+xwM+BJypu8FXfNReoqbG?=
 =?us-ascii?Q?3eXimhZgS7V0qJXo0376kiIxREkIcBBy5VZiR8wW/5XzYpQ8ynZEkoPl8lmu?=
 =?us-ascii?Q?AYgc+XYR30VgmYvgKaraSkbsjydkDCNZf5jFN8ECXCNTQEVH801RyREPRFJL?=
 =?us-ascii?Q?WcgpMwkFizcvW02EGiVj4w6Zdg5E5+1Eve5g8diNiTT2jlZkF9uvGBZK78Zc?=
 =?us-ascii?Q?qEKYTijNRC+w5zvbYr3g5xlEzUT5PRx1IDHh/V1oqDHEXt2VVVxskwUJ4C/E?=
 =?us-ascii?Q?aijpg44UCi87yMjBGBSgbwXTjv2fbIdKsdPlwO405MMmdBBnZdBcgYS/8s/w?=
 =?us-ascii?Q?+ZtWWllq8XucoZ4s8fiXDUTRf22Ntirq0iCbIpEJecLcu8DihCj7WvOzy3N0?=
 =?us-ascii?Q?If7qIENzGBA9/tLKUyz+H4OquPC8zfDBW+qi1dyx?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 749ecf03-8162-4fe4-7047-08dd831e40ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2025 10:53:31.3734 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /hf1aeFybpsXvrhoYB2mMuLxyiUY7sCGCN4oLmHpDQMFvYLWgDiwNhtq1Ki0eggGyWrzfU/37tvdN4kPNro4IA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF7DCFBC32A
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

On Thu, 24 Apr 2025, Jani Nikula <jani.nikula@linux.intel.com> wrote:
>On Thu, 24 Apr 2025, Sebastian Andrzej Siewior <bigeasy@linutronix.de>
>wrote:
>> On 2025-04-24 14:56:08 [+0800], Junxiao Chang wrote:
>>> MEI GSC interrupt comes from i915. It has top half and bottom half.
>>> Top half is called from i915 interrupt handler. It should be in irq
>>> disabled context.
>>>
>>> With RT kernel, by default i915 IRQ handler is in threaded IRQ. MEI
>>> GSC top half might be in threaded IRQ context. In this case, local
>>> IRQ should be disabled for MEI GSC interrupt top half.
>>>
>>> This change fixes A380/A770 GPU boot hang issue with RT kernel.
>>
>> This should have a Fixes when generic_handle_irq() was introduced.

If PREEMPT_RT is disabled, original driver works fine. I prefer to not
add "Fixes:"?

>>
>>> Signed-off-by: Junxiao Chang <junxiao.chang@intel.com>
>>> ---
>>>  drivers/gpu/drm/i915/gt/intel_gsc.c | 14 ++++++++++++++
>>>  1 file changed, 14 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_gsc.c
>>> b/drivers/gpu/drm/i915/gt/intel_gsc.c
>>> index 1e925c75fb080..9c72117263f78 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_gsc.c
>>> +++ b/drivers/gpu/drm/i915/gt/intel_gsc.c
>>> @@ -270,6 +270,9 @@ static void gsc_init_one(struct drm_i915_private
>>> *i915, struct intel_gsc *gsc,  static void gsc_irq_handler(struct
>>> intel_gt *gt, unsigned int intf_id)  {
>>>  	int ret;
>>> +#ifdef CONFIG_PREEMPT_RT
>>> +	int irq_disabled_flag;
>>> +#endif
>>>
>>>  	if (intf_id >=3D INTEL_GSC_NUM_INTERFACES) {
>>>  		gt_warn_once(gt, "GSC irq: intf_id %d is out of range", intf_id);
>>> @@ -284,7 +287,18 @@ static void gsc_irq_handler(struct intel_gt *gt,
>unsigned int intf_id)
>>>  	if (gt->gsc.intf[intf_id].irq < 0)
>>>  		return;
>>>
>>> +#ifdef CONFIG_PREEMPT_RT
>>> +	/* mei interrupt top half should run in irq disabled context */
>>> +	irq_disabled_flag =3D irqs_disabled();
>>> +	if (!irq_disabled_flag)
>>> +		local_irq_disable();
>>> +#endif
>>>  	ret =3D generic_handle_irq(gt->gsc.intf[intf_id].irq);
>>
>> What about generic_handle_irq_safe() instead the whole ifdef show?
>
>Anything without the ifdefs would be welcome.

Sebastain's suggestion looks very good. I just tried it, it works well with
both RT and non RT, it doesn't need ifdefs. I will do more testing.

>BR,
>Jani.
>
>>
>>> +#ifdef CONFIG_PREEMPT_RT
>>> +	if (!irq_disabled_flag)
>>> +		local_irq_enable();
>>> +#endif
>>> +
>>>  	if (ret)
>>>  		gt_err_ratelimited(gt, "error handling GSC irq: %d\n", ret);  }
>>
>> Sebastian
>
>--
>Jani Nikula, Intel
Thanks!
Junxiao
