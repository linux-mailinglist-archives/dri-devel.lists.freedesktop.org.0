Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 252AC977465
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 00:38:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1734410EC67;
	Thu, 12 Sep 2024 22:38:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TkuwOm5H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A64810EC67
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 22:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726180681; x=1757716681;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=c9psQTJDE2EsewFVvfsD4DEqwFZITk++0DlOrlvWo6Q=;
 b=TkuwOm5HJbiyab+yJCvFKK04mxwU/x8bRrOP0P5kvyYWaoYHqn6MeBlA
 vWvKUUfVNygIU2V2D8UEM/qLS39veb80ix7aP3sKb1KcaYuejXvyIBjWZ
 ZYZ0yb2a+05wqbu9Ms30cUpKsXw8pQsqPEnZgcGKDT5NRzXeOmhQcDSq4
 MzLbDQCuFE8nfbVS9NYHKcl3dInN7hYt+OSeDK/2IHvDDfok1Uq6V4WQh
 nwpFnuC28Jc2NgxZhuKr5dcRP8JUvacPCdIf3ba8S4ysTfcpGC+6UL1Qy
 ypu5XUm5IdZmn+nb4fGtxH6L3n+Pe8y0sDIkOtbo84nMLkNq7alwDqOqs A==;
X-CSE-ConnectionGUID: PQnuuCiTS9OHz8+CuLfP7w==
X-CSE-MsgGUID: hdTp2AcJTzugsE4YbbeqdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="35735556"
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; d="scan'208";a="35735556"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 15:38:01 -0700
X-CSE-ConnectionGUID: Qwpmh/gpR5SRzIFxXFlDxw==
X-CSE-MsgGUID: FoWxiWhrS+q22QnVnyHNEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; d="scan'208";a="67830887"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Sep 2024 15:38:01 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 12 Sep 2024 15:38:00 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 12 Sep 2024 15:38:00 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 12 Sep 2024 15:38:00 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 12 Sep 2024 15:37:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YX7xb8hoduJPbFewPe851/WibewbSll/gTofRkGPqKlhE2oJqOG+DWwZ6PwiNwxzc3ojxBayGfV6hSUew3WdqB/69f6KwKbvKux+LvAmHOAOMLOkR6YJu857TSuA6IS5yNSauR3bu9aI0ZgjgN1e39dEJ58YmTm9Sec05BVb6LOfYs7RS7UDAWXbBDi3uiASSLHKtIlTECxaudJVoB2XmdAmh6e9u0eqOvQcbDzLK7vnHE0oLYhcb9Eyd+z22mwzxA1EYr8D995lsmyp7lT7A99ZHM2AfL/kuEaoUPawfr0eMOAOIGhBRnk7G8RQCQJYXvefAsviLdyXBYXEQ5udLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AeuzD5HhOIWhm3FUaUKQ3+99+AyPxaUQq0hXATI4fC8=;
 b=cYmf4DlHWI0q+p39rn5JBouKvHDV6BJIdfedZgFH4+1qxg+Jrv4dFbTiwNJRSpmzJzrBbuF0tNxOTIjYrbpFbuxs0phKDbtVZkwdoFGeltnWOMpqb7pkXAtT5kLE7TLxKq7VGBT6rkCRfQYNux/QiHl0hLX85RaghhO0eMyAlSkg2mPC9kb7kcxBGH+KUEMm0W4zUYcvzPhGPt34WoLdT6p+xWCxnOMHp7HtOkTAdNm49VPsW82Dv+ydNEEwmzm5yz41c/rlY+VJIiPB0cSbzCM/nwrexCu5sfjFdCvaLqewTeZVtLmQxdtWbL1CajYQIqE+2YqLMLZsbDtHsHkabA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by IA1PR11MB7918.namprd11.prod.outlook.com (2603:10b6:208:3ff::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.18; Thu, 12 Sep
 2024 22:37:57 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%5]) with mapi id 15.20.7962.018; Thu, 12 Sep 2024
 22:37:57 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Huan Yang <link@vivo.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?iso-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>, Gerd Hoffmann
 <kraxel@redhat.com>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
CC: "opensource.kernel@vivo.com" <opensource.kernel@vivo.com>
Subject: RE: [PATCH v6 3/7] udmabuf: fix vmap_udmabuf error page set
Thread-Topic: [PATCH v6 3/7] udmabuf: fix vmap_udmabuf error page set
Thread-Index: AQHbAplee3nk8zqQjUKaa9ugztfxwrJTHoQw
Date: Thu, 12 Sep 2024 22:37:57 +0000
Message-ID: <IA0PR11MB718549B45FCA4C85C1C99CA4F8642@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20240909091851.1165742-1-link@vivo.com>
 <20240909091851.1165742-4-link@vivo.com>
In-Reply-To: <20240909091851.1165742-4-link@vivo.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|IA1PR11MB7918:EE_
x-ms-office365-filtering-correlation-id: 8950983b-4454-4ceb-e12d-08dcd37b8c7c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?lnet7iD4XIwslsjriWA7s90UoMNQLLHd8tpBRhBShEj6kvS+KbkmKUbPiT?=
 =?iso-8859-1?Q?1NAm4HMir77qNWOJkGkCsvYIXxAUukoJoTFEeSQP+0fnGpl/BTvWGJYeSM?=
 =?iso-8859-1?Q?ezm9iVbHx718U92Utpi+P2RtIpHRgPoJD0HHmf9a6nzy+Lj1Ryjcewjuc0?=
 =?iso-8859-1?Q?/S9jQxmV7tVq+vBW0O7G2+o4VqJMrQ2H7HqWNGQf8Pxcj0FOi8IIvE4Spg?=
 =?iso-8859-1?Q?k4VmbceWhYtr8wZQoioMWPUUEl0TNPkOa8GHe5XyLQjbB9B7AV2gj1JdtU?=
 =?iso-8859-1?Q?yYfLxtxQpCjVOiEoyQ1ymQZbVqPjGhvFdafaQdqCtyCWl5UaEmOSjiGeCI?=
 =?iso-8859-1?Q?76U/0N+R2g0YGeQtZx7c4cqJsI7m0X34H3VEfXvHZIvyBPuqeBYHFLsb8B?=
 =?iso-8859-1?Q?OrZho8GhEy0UGtqwHNLsYBkxPTO5x7zblvFBzWQgekN61DdFQT/zKbMwhs?=
 =?iso-8859-1?Q?G+GTGgtcXu0J1yy4w8dSs282+cOde+bUYeb4eCYwDLK34CZQ9x7kmfbasP?=
 =?iso-8859-1?Q?KtDi7Pd8xMpj5B6izydZ30dj5dDOTILrpsSB8ZU7HjFwuPOEJiOvluWyfC?=
 =?iso-8859-1?Q?A5EJcZBAvwzf1IUE2Te2v25Dlb7LVkxejsFbl4r0X/uxuB+uM0Voou3hGo?=
 =?iso-8859-1?Q?x5m2owPv2Ye14OgI+mf9A/w0rErKeVDcyY+S/x9NUYqY0MIxU+aSkbPiHk?=
 =?iso-8859-1?Q?hh6poSRy1KM6riYPfOEjW6ypmHGznuOSRCAP7gu6hWJSeysNIFO1E/YXAf?=
 =?iso-8859-1?Q?8mTaZfA99gz75fe3ZO/swT9CBPs/5EirVakdaXBAXd9zlE9a34Jdz+Om0s?=
 =?iso-8859-1?Q?zSVSIHcfnxgwMWIXJIvTl403OynvmmupIGM108t1fyKutchBO7N+tes6tr?=
 =?iso-8859-1?Q?Mzmmtb3njajgR7ujS1VVp/uEnk7mw6UOrN5io25cKn2YMfgbzXItsRKhwu?=
 =?iso-8859-1?Q?k7lcnAht2LqbVNmOte2YJ1qPtO8y6Tnp89iH2A/zHE8IOzDyXWZy26/QWE?=
 =?iso-8859-1?Q?axUWXOVzXsjA42dNF0frf9TejnWyHU5lYutxx3jpYFG7NpgTRVUoVdJxde?=
 =?iso-8859-1?Q?waQblZKE8GXB110HjQuTTuJdZB7Chv0mYkKnkgRCBRgCttqq+sVJ8chJYy?=
 =?iso-8859-1?Q?eAnFGaq0IQvoJXu8qVXJWpRrBOu9qP9v1HF23jV+oI7Z2f3fiRi/3eueaY?=
 =?iso-8859-1?Q?/jgV0rTMGPK7QpcAAhaPqSBiMWFJeJDg5AA6ZFDDL3UYMd048mBYZgDMB/?=
 =?iso-8859-1?Q?YCuAqgorXhUOmksvfW/4ATtC6yCc+IMIiqXW+YWxlPtJzoqRiZDDLm1TgV?=
 =?iso-8859-1?Q?F5qSl37jgW7ClYtzSyKhv2FQP8BNMnep2tFvmv4pkWZAlYKgq8lE+Un0eP?=
 =?iso-8859-1?Q?u58BZnRQWP4hWJ8sbsQgk9FqSD0fYcui0uooUHYxpGfsk9x83XcJbt/j/e?=
 =?iso-8859-1?Q?L5NN1KY+2UiQefxrvCCGCANwPoK/Q9pP0SnhVQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?hX/py47XCm9IBdea95lE43LnqAHwLzp2HEn7jD62/vpSbUyL4rGc4oF3Y0?=
 =?iso-8859-1?Q?am33yJR30ulEIshBegjS1ZjjyohOFgv/7s6ccUGunouFPEkNCY9iDcRYJK?=
 =?iso-8859-1?Q?/IozjXYHGvSPYonmswNnFy07oNXugjpeUp4k7hvaQ1I9+bnlRhf2Yysdme?=
 =?iso-8859-1?Q?BtdZ3RPjjjQDjB6K0efxb4/kvy9mja+azrIBcwLBW5oOxkr50hGTEblXJY?=
 =?iso-8859-1?Q?UnELj6MQg2T3mjq3mq9RhMnxLB5F9aFYsliLzMFf8aCtoUX1O4RT1s01Ci?=
 =?iso-8859-1?Q?RSWTXp/MIEEBDiZe7+ceuWOGKC5soXw/z/X4sWqB7Vzaf6RY0bT2oLYuY5?=
 =?iso-8859-1?Q?jv2O9tMICmQyZuFXql1h6XYZ0uGkKl5tVW0xsHDYZ64pGfWo4d5UThU7ry?=
 =?iso-8859-1?Q?39yUNnqVy2m0qDqeTFFvPqVTotUPj57eIIa9xir0NtLlWLpQuxR4HcoMUU?=
 =?iso-8859-1?Q?ZR8CyTnGT04U/gz6MnTmar2VaWllG/qxAIKTj1jrj5OcWCHcaTUEEOCyQk?=
 =?iso-8859-1?Q?97wlU43nF8oxGOYzh2CUjj0pcc5S57wgLuc4vmoQ3/0O/0HXWZytu4rv0C?=
 =?iso-8859-1?Q?xCpPhbZfVqHLQbqgUeChaZVYxZtNW0rqmJAaj7Pdbjf/DZJZ1H2PH0TXda?=
 =?iso-8859-1?Q?BMh8lZd0K5/N8vdR40TKc04uNsDTUm8egAyBGZpxlVdwJnfrN9pzeZNwkx?=
 =?iso-8859-1?Q?vtRxaQZ0t4xg9+OwD9LSY3IFtcbcu3keEgliAtvey5l37NKSIM/uwi28hO?=
 =?iso-8859-1?Q?gFwvHJRjESICCfCYq/pIqXJWRpMW/Jyb5b58K56hyRqF3QB1R+lMpWJa60?=
 =?iso-8859-1?Q?/TSGlmoTuED3sl08lyzRb+WST5B4E90ZeXA0G7WHbP9PzaE/FxNKuK0K2k?=
 =?iso-8859-1?Q?eLIyJvniCWJPCyEOi8JjLTKexv1UqDNI9/peYUQGxeobarekXkjoJK1c2r?=
 =?iso-8859-1?Q?hUw+ZnCOjUBUb49gWTdOa6zR83xbF8uaLsekX9fnV/ztb2VkAOsY+pe1Hm?=
 =?iso-8859-1?Q?S9OZD4kiXMOtT0KMH2JTRm3TWzbZQo2rNNeHAiAnERUp5xaLCT6kszutrI?=
 =?iso-8859-1?Q?fS0Sn+Z9t+KQVTpSJQk5AeHnHWALnk1oSGciGAtFSjRaPSTb7VKS3AcR6A?=
 =?iso-8859-1?Q?3TBpPRY0UYhD3QOm9/NfQ5xKuN9TFXmyXMKTVxvnkfb1BNqMFiCDVSHvWA?=
 =?iso-8859-1?Q?SWFLlSL4/14NhlgfWvDK15AHFHw0SnZFSl8eLRn8m3IPn5tzXKNr+QtLWt?=
 =?iso-8859-1?Q?ZWeWl06BBnxUlLVEAWkigIVtPyd0mnxZxwjvsh72UCiCFMeq/3+ZNG3df7?=
 =?iso-8859-1?Q?Ai/9ttJCmOhfgxD7D5GzH42uKeJkfOijPAWQo2IduBFAPsqg8PMvJ22Lj4?=
 =?iso-8859-1?Q?lGdjcCRvnTfbFWrDFSAwg6WUwKJTAxh8ch5YKmbb6+pSRr5gU50V1Aeqc0?=
 =?iso-8859-1?Q?uHCWrhWXkqnQ6kYgNJjDW1FvLFkOwkgO0hVS0Rofn8KxV2O7OV4e69ta63?=
 =?iso-8859-1?Q?QbmK8yovaSHkjGw/CmbvFa3Wi5UvLdedEjjuRuMxtWndjZJ9JGd80DOfqf?=
 =?iso-8859-1?Q?6eWn4M9B0+oGuBkblUcVFcqhJveqC+IQ3VPmU9yh0zyBCWrgoTqUUqGg8M?=
 =?iso-8859-1?Q?L1EssWjGR1RZRkS3Fuq87TVVJW4/etn419?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8950983b-4454-4ceb-e12d-08dcd37b8c7c
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2024 22:37:57.1177 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LHt6Pcd+9WeC4zqd6m1a7INVZJAYEuQFcP+8AtybmggNuKILHgB3GTB3D6fbPAs5T12FJSlVGdzV76SxooXqiRktxnQNsXoYKxem12L5ttk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7918
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

Hi Huan,

> Subject: [PATCH v6 3/7] udmabuf: fix vmap_udmabuf error page set
>=20
> Currently vmap_udmabuf set page's array by each folio.
> But, ubuf->folios is only contain's the folio's head page.
>=20
> That mean we repeatedly mapped the folio head page to the vmalloc area.
>=20
> Due to udmabuf can use hugetlb, if HVO enabled, tail page may not exist,
> so, we can't use page array to map, instead, use pfn array.
>=20
> By this, we removed page usage in udmabuf totally.
>=20
I think this would probably need a Fixes tag:
Fixes: 5e72b2b41a21 ("udmabuf: convert udmabuf driver to use folios")

Thanks,
Vivek

> Suggested-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> Signed-off-by: Huan Yang <link@vivo.com>
> Acked-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> ---
>  drivers/dma-buf/Kconfig   |  1 +
>  drivers/dma-buf/udmabuf.c | 22 +++++++++++++++-------
>  2 files changed, 16 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
> index b46eb8a552d7..fee04fdb0822 100644
> --- a/drivers/dma-buf/Kconfig
> +++ b/drivers/dma-buf/Kconfig
> @@ -36,6 +36,7 @@ config UDMABUF
>  	depends on DMA_SHARED_BUFFER
>  	depends on MEMFD_CREATE || COMPILE_TEST
>  	depends on MMU
> +	select VMAP_PFN
>  	help
>  	  A driver to let userspace turn memfd regions into dma-bufs.
>  	  Qemu can use this to create host dmabufs for guest framebuffers.
> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> index ba9dbc7caf71..aa182a9dcdfa 100644
> --- a/drivers/dma-buf/udmabuf.c
> +++ b/drivers/dma-buf/udmabuf.c
> @@ -103,21 +103,29 @@ static int mmap_udmabuf(struct dma_buf *buf,
> struct vm_area_struct *vma)
>  static int vmap_udmabuf(struct dma_buf *buf, struct iosys_map *map)
>  {
>  	struct udmabuf *ubuf =3D buf->priv;
> -	struct page **pages;
> +	unsigned long *pfns;
>  	void *vaddr;
>  	pgoff_t pg;
>=20
>  	dma_resv_assert_held(buf->resv);
>=20
> -	pages =3D kvmalloc_array(ubuf->pagecount, sizeof(*pages),
> GFP_KERNEL);
> -	if (!pages)
> +	/**
> +	 * HVO may free tail pages, so just use pfn to map each folio
> +	 * into vmalloc area.
> +	 */
> +	pfns =3D kvmalloc_array(ubuf->pagecount, sizeof(*pfns), GFP_KERNEL);
> +	if (!pfns)
>  		return -ENOMEM;
>=20
> -	for (pg =3D 0; pg < ubuf->pagecount; pg++)
> -		pages[pg] =3D &ubuf->folios[pg]->page;
> +	for (pg =3D 0; pg < ubuf->pagecount; pg++) {
> +		unsigned long pfn =3D folio_pfn(ubuf->folios[pg]);
>=20
> -	vaddr =3D vm_map_ram(pages, ubuf->pagecount, -1);
> -	kvfree(pages);
> +		pfn +=3D ubuf->offsets[pg] >> PAGE_SHIFT;
> +		pfns[pg] =3D pfn;
> +	}
> +
> +	vaddr =3D vmap_pfn(pfns, ubuf->pagecount, PAGE_KERNEL);
> +	kvfree(pfns);
>  	if (!vaddr)
>  		return -EINVAL;
>=20
> --
> 2.45.2

