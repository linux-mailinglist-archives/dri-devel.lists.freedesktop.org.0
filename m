Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A31F394DA3C
	for <lists+dri-devel@lfdr.de>; Sat, 10 Aug 2024 04:52:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E78310E050;
	Sat, 10 Aug 2024 02:52:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J4mVwyJi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9010B10E050
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Aug 2024 02:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723258348; x=1754794348;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bNv1TD87V5Lcby4Nh264fstPxVDxkVPUJaCGYbOc8Y0=;
 b=J4mVwyJixUiRiaSR2pknejdNXmMFIZUic4w4QYZ1PS/aqUnJIcVvUi4s
 Vw6t6su38wFNORixGpoTGsUR7GY4FxJC5/2Te24SU/zt1v51zMNoBRXpf
 K8Li1BGlntiw9573FM5exWlcVgF8pC2jeSU+CWv6YPBHJCFc2v7Bkk02A
 SKfW+jiGAiVH5+hJ50HBPM4YeD05qlGhNNrzr8C3dLsk7cA+RT6jBzPD3
 gEhce804kvbmD3m/BZzYJh/gIABtv793jJ3aOL1xcWih9NBW1jbZsd/+8
 DAL1DjU9uHUkBdiFPuYJ6LNMd6ehTB5JDFhhIJOgEWYjf/r2DjDZ7hTKe Q==;
X-CSE-ConnectionGUID: 6wsDI3N6Q6KR3+goeHyxkw==
X-CSE-MsgGUID: w751dfJtR0qLUR5WdyGEdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="21253713"
X-IronPort-AV: E=Sophos;i="6.09,278,1716274800"; d="scan'208";a="21253713"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 19:52:27 -0700
X-CSE-ConnectionGUID: AxcmT74TR+aVaNcyNuJ6Tw==
X-CSE-MsgGUID: M35MOSKfQyi6iqRbJlMfUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,278,1716274800"; d="scan'208";a="88387927"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Aug 2024 19:52:27 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 9 Aug 2024 19:52:26 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 9 Aug 2024 19:52:26 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 9 Aug 2024 19:52:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RW+ScuEoDRgEzX8UaL63g8PGfPvKdNYMzTmNyrkfAipx/aSMvx4awzRUcBNay7BngCho+Nxfbts8KibbVEu+z9036qvkA8hcScf9SjI9C6PWW5ljEce+ROZQzGenBYMVZw381FSYuEzO7A0WI3G+OOytAiBvFQiLJENnXV3fYDYRLge1wX1WsiPscSJSsphV+YYZkIfInqBPBAP+PGIaAEEsdyTdJHzkTgsJAGFC9iLROTdN1yxy953bzIi6il8MQ/yfyXD/kisxoQKVeRHO7dJ9LvBlk5TgNr+n4o+SVKtjxnGbhsJkp9mL54KCfXDakZXRE8B0zX3hk7EpotWZnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/2+1Q3jdA0RgO0Yrlu+p9VQ+vr78WU/ivj5hHZRYD4Y=;
 b=IvOMmYNn2xWveIp+WPBmNu9Izasw/QdlGTf41jfUwwA7OF/BMlUMxDHlIgHp2nv1M3iwTDrj00YPE4mTyOsncRF5TO4rmGqvnpFeK9NdDZpAijiPcbUfO1tkB0CMYiJFwnmWtPy0dKG+iw1ERWXPjT61oXd4cU1KMOwQu7EGg9vzjceRo2h4QXyiH8u2YXKPXuJWZ1Avfie7bsCsvNOlYFJ68P8qQrab/N199w31N+4sCiN08mkNiCUWbPlFVInCL4b+NUxl16lv2kHt5EVsjfKurucwfhJDIGFrucMEe6qFMzQm9SkVYpyP9g8vN26OijYvhMY5pKj0X8K8xiowAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by PH0PR11MB7447.namprd11.prod.outlook.com (2603:10b6:510:28b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.31; Sat, 10 Aug
 2024 02:52:23 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%3]) with mapi id 15.20.7828.023; Sat, 10 Aug 2024
 02:52:23 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Huan Yang <link@vivo.com>, Gerd Hoffmann <kraxel@redhat.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, =?iso-8859-1?Q?Christian_K=F6nig?=
 <christian.koenig@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
CC: "opensource.kernel@vivo.com" <opensource.kernel@vivo.com>
Subject: RE: [PATCH v2 4/4] udmabuf: remove folio unpin list
Thread-Topic: [PATCH v2 4/4] udmabuf: remove folio unpin list
Thread-Index: AQHa5udGaTCYZnNxL0+aEZr4pYOeeLIeHMAw
Date: Sat, 10 Aug 2024 02:52:22 +0000
Message-ID: <IA0PR11MB7185115BF4B741E9229D0E68F8BB2@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20240805032550.3912454-1-link@vivo.com>
 <20240805032550.3912454-5-link@vivo.com>
In-Reply-To: <20240805032550.3912454-5-link@vivo.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|PH0PR11MB7447:EE_
x-ms-office365-filtering-correlation-id: 6cd7c5a5-aee8-48ee-6969-08dcb8e775a6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?ZAL8cVTCrNzC5SboGT8udKjki46hRidsyuOjxgwenSuJUtMMWNLnskVryV?=
 =?iso-8859-1?Q?X4ST/XTrPXshsZz5L4Ji5bMWgYu5YZ0jS7Mh6MJENb1YbQHEAC8YoyYMmS?=
 =?iso-8859-1?Q?ST7qlMlvE3lwM6YKmo1hV/qvFakAuTXE8ru0aZ8dnPbrjJX+z0opJJSKLi?=
 =?iso-8859-1?Q?GBsCVYsQBgcKHYmwaGmiME5/khEu87/MxFgICFHC41n851QY9AqSz9eKA0?=
 =?iso-8859-1?Q?ZnkdFkmpz3nnCXAsM6gLo2tRCtqSMZKb91sPTha18fi7qirKfEKohYPjTf?=
 =?iso-8859-1?Q?mPVgi1l02ccz4hlmYzS8Ay/jfbDJ6tpVvB8ze3IkN5BjnqGRJSvW5ONTIY?=
 =?iso-8859-1?Q?dAPHt6kiNEEterxZ2yrt96Rsta6HD/aCYpyQNRpNehJLP4E5+NcVqurMoV?=
 =?iso-8859-1?Q?ygCpRWZWS/1rb/bfoGYQ91uYy/1fqjDXvjqFeGnAdm9ToMyOgtt0UN72HS?=
 =?iso-8859-1?Q?zBgSVlbphmpVMasHvlAFuMlBFM6UfPVjLxivd4W/3mm9+DX54MOTz3pbQJ?=
 =?iso-8859-1?Q?y4cm3eW4iOI7KoRoc2eqRSo9877mZs3KN3iFqLdyDPKwJ47x3P7VjYpeBV?=
 =?iso-8859-1?Q?2DE4bXPdRAVh9dhuWvvmgSJdbRvIfavb6tJZJW8bTFek4J6Q2XbFWOlw7m?=
 =?iso-8859-1?Q?cgVedZyiYP87qoC3nBbb56ddFCrOXiuWueI7ThXVfDer3nGl818n/OAfIY?=
 =?iso-8859-1?Q?a11lMvfoqnB6ON8BwA2+7IGdyJ1OUnGTJg/yJtZ8eETlyQ6n+gomEC6wYy?=
 =?iso-8859-1?Q?EFQoD4nUsCLasoOZw68JF3L31BD++LuIAmvisoh7WAh68DfR0LJh8SI/eN?=
 =?iso-8859-1?Q?s94Qa8yp4SeSP5IL9XWGQAe8/ZUvoTqjUgE8jSg9hcG18GuEhrWUkWpyvD?=
 =?iso-8859-1?Q?ITXEb8j/D54EFppeBXmNUBUo1lPw9WKHfxu0Wm4PwVkjxllU/tKyPlAIJq?=
 =?iso-8859-1?Q?R+GC7GmqwcAxSupUq/dBbT23H3756HYHNWb6rDS+JlsKm/Kj6UEfQkd+zj?=
 =?iso-8859-1?Q?z8ISqjoxyBbpBD/3QJBHzmFxJeVVe/xI/WDEZu0wANups2M3YUAk0Btdne?=
 =?iso-8859-1?Q?MRiGvQdBB2EDFtYf584ozfzhfYLy44WNLGZiI6/T+SVsGyxlelP9iST7eK?=
 =?iso-8859-1?Q?+qPLNUzI4HcUEUD4aYc6hhfz7jDtoKbwwS4WzSWpOKSHK2JYUFQhJRZ2xj?=
 =?iso-8859-1?Q?kkMdrG6bjYvlSsN17CcDJgQsUHogBGNi3okpz0/SDMQprgZ9ukfNaI/Gpv?=
 =?iso-8859-1?Q?qO5ftzavgvGEKZNFxT7+1S4hGbm/MgWd5uIOv9KjG2RlM6K70I2KB95NQU?=
 =?iso-8859-1?Q?5wOIyl5gDzwAmn9MF2pZZCjceH+lRdQDXw7Dc851vbrCyf3N4KeByfRhkY?=
 =?iso-8859-1?Q?1YnMmFYw/Xmi5tJ3eFa5DB1Xt+Yz1sNzBpAEGyfKqh3b5ngksfCNrbKDX4?=
 =?iso-8859-1?Q?nywNwhhANnZaraaAggANaPZpnDgVxVyGmZmgHw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?24xcR2iN2Y3x8SaaZJjm1meh2uHr94AXM3908GU/dDEdPcKVPvqzP+UCst?=
 =?iso-8859-1?Q?gkZ0IxzSw23xO6YwVrVBXbRnJz8Dgfh9PI0/8SIodZLZubDquZh7J06FmS?=
 =?iso-8859-1?Q?C3obvODFb3SO48Mch4Q15dZTq7piFdXxXKHzaSgUoinm3riwMzBJuv2Pg9?=
 =?iso-8859-1?Q?KfSgkJJd+e9yYznJoepV+cTyiY5o0ZM44fut9ppRm/CehLs+SF1mn5AvZ8?=
 =?iso-8859-1?Q?oN3OnMvoQzphLuVz5FfFnCVgH7kOr1rbHvqpk3HnaB4hLOhdbfMd06zzeJ?=
 =?iso-8859-1?Q?1B+ZjwQTjbLM/trJswbTNdexthexozgoU9d3r5rJLNzeBXYs+ayKvfmicC?=
 =?iso-8859-1?Q?9ywaL8m2BPGbp7FsReCJHJrU6+cJdBF+o0ZN+BBPiNVG+Q7Q9nudacN8N4?=
 =?iso-8859-1?Q?oMLbmWF6KJOL+Ojd0SNvKAQr0/yNFP7CWP2pgFWIO/AFDZaPuuqZPtRlpa?=
 =?iso-8859-1?Q?ywnAKrApPkZY8ItcTSo29J7qF4P7vnzT4FqVJuXSsmurWxzFpWT1mf6bKL?=
 =?iso-8859-1?Q?0LupBV1nFudQ6kdVJ2ciHJQnjbC1wQVGsPMTJO6KWMf0S5DCN3kpe/jPqE?=
 =?iso-8859-1?Q?XkQ9KF+HjX8j5qBwmCSTjgnNey4E4pJfpwLE0CZQtbW7FNZEDoQ2IyAXvE?=
 =?iso-8859-1?Q?12mx2dKuRrMoWo9iRM9Ltz6VV9L2vC3VYOLq4aNk2ji+QIe7T3rN9aEmnS?=
 =?iso-8859-1?Q?ppwFdHF3qtRQXhabGJwh47s2WqQyfQypazcJguLUovvmil2qxfRMF7I2oA?=
 =?iso-8859-1?Q?zg8+u0yO70yAsqHJ4FeeuIsook9GRejmVSAvgiv9rDnQLxe+mhGdZU0Ftm?=
 =?iso-8859-1?Q?0Q/cdQjfKoQ145+KVjxRGKpu1aSVic0/JWEGR8J8rHU0lqkH5jecwDQDGV?=
 =?iso-8859-1?Q?+IlYAiZ3fZ2hCGxYhwP526a9pro5qRh+rs17K732cXYDrlKYQC1JGv4BCz?=
 =?iso-8859-1?Q?Kc4wtMgzUWvDfxTmTbT7NDSbjgtbdYOxNnYtcbKIYk+m8AfhiSub2bY3LC?=
 =?iso-8859-1?Q?1zVjGZQ4RnbwgeXMl08+wsCMcU0s2J4CPnY/VPEA+StDJwOiZ4Pvfi0XS/?=
 =?iso-8859-1?Q?RnitxrAYBbxwThZ8B2P8ICkW2PRq5GTbNLatEX42Bm7qoKknCYwogFq+65?=
 =?iso-8859-1?Q?3TdIl9I7Tp2Vvb8BEXjYh/lei7mVSwLMxI2eDHM6N+R1lAXmq3Q2tSEzJ0?=
 =?iso-8859-1?Q?RdybByyr3eIcrWU9aW6eJ4AgpYFj3H8dhBynbj0OP3ehFBn2flnb/3yFlz?=
 =?iso-8859-1?Q?nH7q3q+11H3SeC27ZRhpfQOp68VMYp5gknl8y5ue5IXACLyZXZG1ORE7WO?=
 =?iso-8859-1?Q?fAHhzKQiyzmiS3gZDydYCtWJtELbwQmslP8xEjWL+T05u1m0vzrz9IX8Pl?=
 =?iso-8859-1?Q?ydknAuSN4z+a9p++D8VICn+8ECnYKrIkgv5t8259L9t0JmIIdbuzjP++4/?=
 =?iso-8859-1?Q?pgIJogXp3+xp0En2HbcrxWY1grY1YCRbwGRbbbSzxv3tHlBkjfce0G3r3a?=
 =?iso-8859-1?Q?uxNy5ULSzw/7x0qC4g8Lh9+D4MnOAmpEs7jzb+Kz4KX7B2tf/EbNb+LvD4?=
 =?iso-8859-1?Q?xv+Hws+uhKzf7TLPy5wCeeFyuL1vQJZhiM9PlJJuWGALp2mRcpBWjYdpVi?=
 =?iso-8859-1?Q?5K+ETVYw+LR6TFKacrH7bcp8f9U9KxTN+c?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cd7c5a5-aee8-48ee-6969-08dcb8e775a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2024 02:52:23.0104 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bhC+hzPgWnJ1mEEI5aOLJLyKnXuEAFQ42voZjpOwUHScve/en77tjPnpKYHRhKf2bE88gnoSDBuhzohNyEL32I1+O9FYw4C4jqdscgeMqhg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7447
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

>=20
> Currently, udmabuf handles folio by creating an unpin list to record
> each folio obtained from the list and unpinning them when released. To
> maintain this approach, many data structures have been established.
>=20
> However, maintaining this type of data structure requires a significant
> amount of memory and traversing the list is a substantial overhead,
Have you tried to quantify this overhead?

> which is not friendly to the CPU cache, TLB, and so on.
>=20
> Therefore, this patch removes the relationship between the folio and its
> offset in the linear address mapping.
>=20
> As an alternative, udmabuf both maintain the folio array and page array,
> folio array use to unpin, and the page array is used as before to handle
> the requirements for the page.
Using pages is a step backwards, given the trend towards embracing folios.
Moreover, the feedback from the former hugetlb maintainer (Mike Kravetz)
was to not use subpages (or tail pages) of a hugetlb folio directly in udma=
buf
driver as it would cause problems, particularly when hugetlb vmemmap
optimization (HVO) is enabled. AFAIU, if HVO is enabled by default, a tail =
page's
struct page pointer may not be available (as it may very well be freed to
save memory). Given all of this, it made sense to convert the udmabuf drive=
r
to only use the head pages of a folio along with the offsets of tail pages.

>=20
> So, udmabuf's folios only save the folio struct, foliocount point
> the size of array. pages save page in folios, number offset given by
> create list, pagecount point the size of array.
>=20
> Even if we restore the pages structure, its memory usage should be
> smaller than the combined memory usage of offsets(8 bytes in 64bit
> machine)
> and udmabuf_folio structures(24 bytes in 64bit machine).
>=20
> By doing this, we can accept the overhead of the udmabuf_folio structure
> and the performance loss of traversing the list during unpinning.
Does your use-case involve frequent pinning/unpinning operations? Note
that this would be considered "shortterm" pin, which is different from the
the way the folios are currently pinned in udmabuf driver, which is conside=
red
"longterm" pin.

However, one optimization I can think of, for memfds backed by shmem, is
to not use unpin_list completely. This way you can probably avoid creating
udmabuf_folio objects and having to traverse the list. But this would requi=
re
differentiating udmabufs backed by shmem vs hugetlb folios, which is not
great in my opinion and may not work if THP is enabled.

Thanks,
Vivek

>=20
> Signed-off-by: Huan Yang <link@vivo.com>
> ---
>  drivers/dma-buf/udmabuf.c | 167 ++++++++++++++------------------------
>  1 file changed, 61 insertions(+), 106 deletions(-)
>=20
> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> index 9737f063b6b3..442ed99d8b33 100644
> --- a/drivers/dma-buf/udmabuf.c
> +++ b/drivers/dma-buf/udmabuf.c
> @@ -25,17 +25,24 @@ module_param(size_limit_mb, int, 0644);
>  MODULE_PARM_DESC(size_limit_mb, "Max size of a dmabuf, in megabytes.
> Default is 64.");
>=20
>  struct udmabuf {
> +	/**
> +	 * Each page used by udmabuf in the folio. When obtaining a page
> from a
> +	 * folio, it does not necessarily begin from the head page. This is
> +	 * determined by the offset of the memfd when udmabuf created.
> +	 */
>  	pgoff_t pagecount;
> +	struct page **pages;
> +
> +	/**
> +	 * Each folio in memfd, when a udmabuf is created, it is pinned to
> +	 * ensure that the folio is not moved or reclaimed.
> +	 * folio array used to unpin all when releasing.
> +	 */
> +	pgoff_t foliocount;
>  	struct folio **folios;
> +
>  	struct sg_table *sg;
>  	struct miscdevice *device;
> -	pgoff_t *offsets;
> -	struct list_head unpin_list;
> -};
> -
> -struct udmabuf_folio {
> -	struct folio *folio;
> -	struct list_head list;
>  };
>=20
>  static int mmap_udmabuf(struct dma_buf *buf, struct vm_area_struct
> *vma)
> @@ -51,9 +58,7 @@ static int mmap_udmabuf(struct dma_buf *buf, struct
> vm_area_struct *vma)
>=20
>  	for (pgoff =3D vma->vm_pgoff, end =3D vma->vm_end, addr =3D vma-
> >vm_start;
>  	     addr < end; pgoff++, addr +=3D PAGE_SIZE) {
> -		struct page *page =3D
> -			folio_page(ubuf->folios[pgoff],
> -				   ubuf->offsets[pgoff] >> PAGE_SHIFT);
> +		struct page *page =3D ubuf->pages[pgoff];
>=20
>  		ret =3D remap_pfn_range(vma, addr, page_to_pfn(page),
> PAGE_SIZE,
>  				      vma->vm_page_prot);
> @@ -67,22 +72,11 @@ static int mmap_udmabuf(struct dma_buf *buf,
> struct vm_area_struct *vma)
>  static int vmap_udmabuf(struct dma_buf *buf, struct iosys_map *map)
>  {
>  	struct udmabuf *ubuf =3D buf->priv;
> -	struct page **pages;
>  	void *vaddr;
> -	pgoff_t pg;
>=20
>  	dma_resv_assert_held(buf->resv);
>=20
> -	pages =3D kvmalloc_array(ubuf->pagecount, sizeof(*pages),
> GFP_KERNEL);
> -	if (!pages)
> -		return -ENOMEM;
> -
> -	for (pg =3D 0; pg < ubuf->pagecount; pg++)
> -		pages[pg] =3D folio_page(ubuf->folios[pg],
> -				       ubuf->offsets[pg] >> PAGE_SHIFT);
> -
> -	vaddr =3D vm_map_ram(pages, ubuf->pagecount, -1);
> -	kvfree(pages);
> +	vaddr =3D vm_map_ram(ubuf->pages, ubuf->pagecount, -1);
>  	if (!vaddr)
>  		return -EINVAL;
>=20
> @@ -104,30 +98,25 @@ static struct sg_table *get_sg_table(struct device
> *dev, struct dma_buf *buf,
>  {
>  	struct udmabuf *ubuf =3D buf->priv;
>  	struct sg_table *sg;
> -	struct scatterlist *sgl;
> -	unsigned int i =3D 0;
>  	int ret;
>=20
>  	sg =3D kzalloc(sizeof(*sg), GFP_KERNEL);
>  	if (!sg)
>  		return ERR_PTR(-ENOMEM);
>=20
> -	ret =3D sg_alloc_table(sg, ubuf->pagecount, GFP_KERNEL);
> +	ret =3D sg_alloc_table_from_pages(sg, ubuf->pages, ubuf->pagecount,
> +					0, ubuf->pagecount << PAGE_SHIFT,
> +					GFP_KERNEL);
>  	if (ret < 0)
> -		goto err_alloc;
> -
> -	for_each_sg(sg->sgl, sgl, ubuf->pagecount, i)
> -		sg_set_folio(sgl, ubuf->folios[i], PAGE_SIZE,
> -			     ubuf->offsets[i]);
> +		goto err;
>=20
>  	ret =3D dma_map_sgtable(dev, sg, direction, 0);
>  	if (ret < 0)
> -		goto err_map;
> +		goto err;
>  	return sg;
>=20
> -err_map:
> +err:
>  	sg_free_table(sg);
> -err_alloc:
>  	kfree(sg);
>  	return ERR_PTR(ret);
>  }
> @@ -153,34 +142,6 @@ static void unmap_udmabuf(struct
> dma_buf_attachment *at,
>  	return put_sg_table(at->dev, sg, direction);
>  }
>=20
> -static void unpin_all_folios(struct list_head *unpin_list)
> -{
> -	struct udmabuf_folio *ubuf_folio;
> -
> -	while (!list_empty(unpin_list)) {
> -		ubuf_folio =3D list_first_entry(unpin_list,
> -					      struct udmabuf_folio, list);
> -		unpin_folio(ubuf_folio->folio);
> -
> -		list_del(&ubuf_folio->list);
> -		kfree(ubuf_folio);
> -	}
> -}
> -
> -static int add_to_unpin_list(struct list_head *unpin_list,
> -			     struct folio *folio)
> -{
> -	struct udmabuf_folio *ubuf_folio;
> -
> -	ubuf_folio =3D kzalloc(sizeof(*ubuf_folio), GFP_KERNEL);
> -	if (!ubuf_folio)
> -		return -ENOMEM;
> -
> -	ubuf_folio->folio =3D folio;
> -	list_add_tail(&ubuf_folio->list, unpin_list);
> -	return 0;
> -}
> -
>  static void release_udmabuf(struct dma_buf *buf)
>  {
>  	struct udmabuf *ubuf =3D buf->priv;
> @@ -189,9 +150,9 @@ static void release_udmabuf(struct dma_buf *buf)
>  	if (ubuf->sg)
>  		put_sg_table(dev, ubuf->sg, DMA_BIDIRECTIONAL);
>=20
> -	unpin_all_folios(&ubuf->unpin_list);
> -	kvfree(ubuf->offsets);
> +	unpin_folios(ubuf->folios, ubuf->foliocount);
>  	kvfree(ubuf->folios);
> +	kvfree(ubuf->pages);
>  	kfree(ubuf);
>  }
>=20
> @@ -289,19 +250,18 @@ static long udmabuf_create(struct miscdevice
> *device,
>  			   struct udmabuf_create_list *head,
>  			   struct udmabuf_create_item *list)
>  {
> -	pgoff_t pgoff, pgcnt, pglimit, pgbuf =3D 0;
> -	long nr_folios, ret =3D -EINVAL;
> +	pgoff_t pgoff, pgcnt, pglimit, nr_pages;
> +	long nr_folios =3D 0, ret =3D -EINVAL;
>  	struct file *memfd =3D NULL;
>  	struct folio **folios;
>  	struct udmabuf *ubuf;
> -	u32 i, j, k, flags;
> +	u32 i, flags;
>  	loff_t end;
>=20
>  	ubuf =3D kzalloc(sizeof(*ubuf), GFP_KERNEL);
>  	if (!ubuf)
>  		return -ENOMEM;
>=20
> -	INIT_LIST_HEAD(&ubuf->unpin_list);
>  	pglimit =3D (size_limit_mb * 1024 * 1024) >> PAGE_SHIFT;
>  	for (i =3D 0; i < head->count; i++) {
>  		if (!IS_ALIGNED(list[i].offset, PAGE_SIZE))
> @@ -322,64 +282,58 @@ static long udmabuf_create(struct miscdevice
> *device,
>  		ret =3D -ENOMEM;
>  		goto err;
>  	}
> -	ubuf->offsets =3D
> -		kvcalloc(ubuf->pagecount, sizeof(*ubuf->offsets),
> GFP_KERNEL);
> -	if (!ubuf->offsets) {
> +	folios =3D ubuf->folios;
> +
> +	ubuf->pages =3D kvmalloc_array(ubuf->pagecount, sizeof(*ubuf-
> >pages),
> +				     GFP_KERNEL);
> +	if (!ubuf->pages) {
>  		ret =3D -ENOMEM;
>  		goto err;
>  	}
>=20
> -	pgbuf =3D 0;
> -	for (i =3D 0; i < head->count; i++) {
> +	for (i =3D 0, nr_pages =3D 0; i < head->count; i++) {
> +		u32 j, pg;
> +
>  		memfd =3D fget(list[i].memfd);
>  		ret =3D check_memfd_seals(memfd);
>  		if (ret < 0)
>  			goto err;
>=20
>  		pgcnt =3D list[i].size >> PAGE_SHIFT;
> -		folios =3D kvmalloc_array(pgcnt, sizeof(*folios), GFP_KERNEL);
> -		if (!folios) {
> -			ret =3D -ENOMEM;
> -			goto err;
> -		}
>=20
>  		end =3D list[i].offset + (pgcnt << PAGE_SHIFT) - 1;
> -		ret =3D memfd_pin_folios(memfd, list[i].offset, end,
> -				       folios, pgcnt, &pgoff);
> +		ret =3D memfd_pin_folios(memfd, list[i].offset, end, folios,
> +				       pgcnt, &pgoff);
>  		if (ret <=3D 0) {
> -			kvfree(folios);
> -			if (!ret)
> -				ret =3D -EINVAL;
> +			ret =3D ret ?: -EINVAL;
>  			goto err;
>  		}
>=20
> -		nr_folios =3D ret;
> -		pgoff >>=3D PAGE_SHIFT;
> -		for (j =3D 0, k =3D 0; j < pgcnt; j++) {
> -			ubuf->folios[pgbuf] =3D folios[k];
> -			ubuf->offsets[pgbuf] =3D pgoff << PAGE_SHIFT;
> -
> -			if (j =3D=3D 0 || ubuf->folios[pgbuf-1] !=3D folios[k]) {
> -				ret =3D add_to_unpin_list(&ubuf->unpin_list,
> -							folios[k]);
> -				if (ret < 0) {
> -					kfree(folios);
> -					goto err;
> -				}
> -			}
> -
> -			pgbuf++;
> -			if (++pgoff =3D=3D folio_nr_pages(folios[k])) {
> -				pgoff =3D 0;
> -				if (++k =3D=3D nr_folios)
> -					break;
> +		/**
> +		 * Iter the pinned folios and record them for later unpin
> +		 * when releasing.
> +		 * memfd may start from any offset, so we need check it
> +		 * carefully at first.
> +		 */
> +		for (j =3D 0, pgoff >>=3D PAGE_SHIFT, pg =3D 0; j < ret;
> +		     ++j, pgoff =3D 0) {
> +			pgoff_t k;
> +			struct folio *folio =3D folios[j];
> +
> +			for (k =3D pgoff; k < folio_nr_pages(folio); ++k) {
> +				ubuf->pages[nr_pages++] =3D folio_page(folio,
> k);
> +
> +				if (++pg >=3D pgcnt)
> +					goto end;
>  			}
>  		}
> -
> -		kvfree(folios);
> +end:
> +		folios +=3D ret;
> +		nr_folios +=3D ret;
>  		fput(memfd);
>  		memfd =3D NULL;
>  	}
> +	ubuf->foliocount =3D nr_folios;
>=20
>  	flags =3D head->flags & UDMABUF_FLAGS_CLOEXEC ? O_CLOEXEC : 0;
>  	ret =3D export_udmabuf(ubuf, device, flags);
> @@ -391,8 +345,9 @@ static long udmabuf_create(struct miscdevice
> *device,
>  err:
>  	if (memfd)
>  		fput(memfd);
> -	unpin_all_folios(&ubuf->unpin_list);
> -	kvfree(ubuf->offsets);
> +	if (nr_folios)
> +		unpin_folios(ubuf->folios, nr_folios);
> +	kvfree(ubuf->pages);
>  	kvfree(ubuf->folios);
>  	kfree(ubuf);
>  	return ret;
> --
> 2.45.2

