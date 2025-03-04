Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96753A4D48A
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 08:16:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4DBF10E516;
	Tue,  4 Mar 2025 07:16:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dfjSVX/J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D92310E521
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 07:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741072595; x=1772608595;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Y0arPTj26u6ZeqZpTheuzS1+yzdNICwZKl+U7FZpc6Q=;
 b=dfjSVX/JhrDebibO5pTLjILgbjdOVilaV4i+UNUaYsVc1A4ZABakD+Q6
 qQHaxxpKwtUz3X/W4uNyAOZOkHQGnq/7U6JMSRMAPMym85d4erR7Cce/t
 lWmcM3D1z2zy81KXae6OabNL7xem5yRDZ9WzOFUsgwvW/85xBhRfXvIag
 9Cu9bcXGI+V+finsajCxSrzXWu9/oJaqT70koBj2Dkeg9sFC1RgM+IMUN
 4y1WzXFTtZeKgv/rzH4q2KudyRAKrj5GyLnDVTxuroov9n777p9Zpa909
 P46KJ4//QM68LZSsqMj1huC7F/qSpwqZezauK5MuZK2CG/lOJ3v0kQImO w==;
X-CSE-ConnectionGUID: v/TK9DUaQVOgeQccAvrSbA==
X-CSE-MsgGUID: PP41UcRiQ9u7lY6CFQkTeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="59388120"
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; d="scan'208";a="59388120"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 23:16:34 -0800
X-CSE-ConnectionGUID: 8wxUJ7/WT/OjKTELEgszuA==
X-CSE-MsgGUID: OFrdW5lGTaa5T3ywayaabw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="155469948"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 23:16:34 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 3 Mar 2025 23:16:33 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 3 Mar 2025 23:16:33 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 3 Mar 2025 23:16:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x+m/f47MYrJZBV3fcEvWjVK0UsiIrmU0Dzs6UGR2vMI9fIJI6F35v/0JU8alGsGltZkOC1TimL98k/oxdb3kHddaGGQkjRELytCp5TF9LNORorvrFm2VtOIn24ftcbqFOwJLw/3D/PgpuqdvLFaHtsssVYUhaU9Y4GwchMzKwA3ycgzeiAMSxUS2XvxBYOGP0WkI4K1gFngjz2RaNA2J/EmjnX8tM8WgWIBwhnDUN1a4JHCE7hcmnNmwQjmh5BJGsYd++C29pkcl0w3ypaFMf0Qpz6ce0sQaRVa5KoTz6P78+DdQU/umouc1CII3jqB9/H9QFXbT3VxigrFSS5ydrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y0arPTj26u6ZeqZpTheuzS1+yzdNICwZKl+U7FZpc6Q=;
 b=iCBPjUTAP4Qky06uwt7H1vOfOUfNUlShq09Q0KK3uuH2NmNA4PzHAQIa10Rixj8xSZfdSzBoBA2BL/r25avuCqinIbi/WMC+2JS8hS1njxltcMERPtE+fkIx3khCU+EJcHZm3xIfaOFWFelAIN7ptyDvphbu0/7b+FWA61xnYw2jzj7UMxlnpIjK8BjHx/NxFT+XMXMHFr0SD73IpW09lQmD7Ec8pV7YEfhCkEjNCSyBIDgnj4aAGRv02ATBBpzLsMyGUu3x9JjY1Kp6D3hpMqDMoPS5VlZ0jqI0sMt2lotMNdcbfNf5w/ytt38S88g9hHpq/cPiXTLuETKsKZGz1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by SA1PR11MB8490.namprd11.prod.outlook.com (2603:10b6:806:3a7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Tue, 4 Mar
 2025 07:15:57 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%3]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 07:15:57 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: Wei Lin Guay <wguay@meta.com>, "alex.williamson@redhat.com"
 <alex.williamson@redhat.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "kvm@vger.kernel.org"
 <kvm@vger.kernel.org>, "linux-rdma@vger.kernel.org"
 <linux-rdma@vger.kernel.org>, Dag Moxnes <dagmoxnes@meta.com>,
 "kbusch@kernel.org" <kbusch@kernel.org>, Nicolaas Viljoen
 <nviljoen@meta.com>, Oded Gabbay <ogabbay@kernel.org>,
 =?iso-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>, Simona Vetter
 <simona.vetter@ffwll.ch>, Leon Romanovsky <leon@kernel.org>, Maor Gottlieb
 <maorg@nvidia.com>
Subject: RE: [PATCH 0/4] cover-letter: Allow MMIO regions to be exported
 through dmabuf
Thread-Topic: [PATCH 0/4] cover-letter: Allow MMIO regions to be exported
 through dmabuf
Thread-Index: AQHbT6PDX5zn/QnJaEWuVZ9mA55H2rLpHa5AgAE+6QCAANdewIBqbbOAgAOOrCCAANfMAIAIVaTQ
Date: Tue, 4 Mar 2025 07:15:57 +0000
Message-ID: <IA0PR11MB718558BD92092A47C2F3C27EF8C82@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20241216095920.237117-1-wguay@fb.com>
 <IA0PR11MB7185FDD56CFDD0A2B8D21468F83B2@IA0PR11MB7185.namprd11.prod.outlook.com>
 <924671F4-E8B5-4007-BE5D-29ED58B95F46@meta.com>
 <IA0PR11MB71858B2E59D3A9F58CEE83DCF8052@IA0PR11MB7185.namprd11.prod.outlook.com>
 <61DF4F0E-D947-436B-9160-A40079DB9085@meta.com>
 <IA0PR11MB7185E7DBB9E959A2F40D4170F8C22@IA0PR11MB7185.namprd11.prod.outlook.com>
 <20250226133822.GA28425@nvidia.com>
In-Reply-To: <20250226133822.GA28425@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|SA1PR11MB8490:EE_
x-ms-office365-filtering-correlation-id: 8bf93d6f-6b33-44b3-fde0-08dd5aec68cc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?KOhRyJyiBt1B41p0FEHTiqelu0kdav4TtSzBduJdjVXbcWSFVztRnjADia?=
 =?iso-8859-1?Q?35rUM0l0t447AckdesIv9EkhYBl46EwYn/3uc+Z0fFCzT5mtwbWj8NXOyc?=
 =?iso-8859-1?Q?f0GeQqBYnNcbQI8Ku4tOR+00VRM0IFmpsPuTdiprcZ7dNfvn3uCRUmEn4Y?=
 =?iso-8859-1?Q?aQQ9shLVt5FYYF6PADuHONsjKH7+U1947TQ+Q8l/a0GxCysxkK9Via8NzH?=
 =?iso-8859-1?Q?InsmyZ3zh4CHmkZYbsbJGYgta/tHrygXzRYFLoZsW8TP8gWzn2kid5jJZi?=
 =?iso-8859-1?Q?AEwSMR944EZIZt94K85qrgpnoYs/DtuA5CT03+CCAIviWc73UMvkM9eZij?=
 =?iso-8859-1?Q?CsfhXReeSlKJO4qUu/DWYkgsIlwVFNXSjNUPxYMQVHPgvOBYV2CIbfPgoo?=
 =?iso-8859-1?Q?vVr8Fm074vMm/SR31g0ZvraOm2NM8D6eieUSJC6imNpK0cR5XxdFSkho9R?=
 =?iso-8859-1?Q?xINJOk1AitGaJh+1c+IwKq38OyiCaMTPKpJviNuPvoxtfdsyi3GKB8ypKg?=
 =?iso-8859-1?Q?HGL2hfL0aszk0vH7Avfb55zBDyznvtP8WqWOdzKoQOdP2aDzKsa4wHMZvD?=
 =?iso-8859-1?Q?pgAhrVXc/X5pG494PvlXQ8tH2BUfJPQmaEHIiSFwTYe5Rkhc6TRWBauJzB?=
 =?iso-8859-1?Q?38uxkn+6X0ZXqiNRPWmIGBLTxJvfBw8skiUuRtW2cf0As1h0IjwJJj2wnQ?=
 =?iso-8859-1?Q?KSap9nlHlyzfUAySuN8UA2xlLCdl+Ha8vEqbH4aVakqfvrbzzzvIGWi8YU?=
 =?iso-8859-1?Q?ZYPVYTTSE0iYKvIgtMC/ztruHuDA0X9pzlE/+psymhf5ncjdUDRrteI1O2?=
 =?iso-8859-1?Q?nm0exk9FWG4ZgCI6bCfvSlkmczENLgEP+aA3/w+swU4EiwyTGCalk/k8j2?=
 =?iso-8859-1?Q?M+Em18BQGmIVigE6/kGIb1FBXByNCsxPGRrfhlTf1gBc+16Z2aa5v7Ac80?=
 =?iso-8859-1?Q?gIBgl9iJGzfPdaK3sstU49ZWCueQST+Br29ZBqeQ3cCeYaYxBxARoEJGwk?=
 =?iso-8859-1?Q?eW+gz3laoKaOC2LheIEXXjE/NbEMHayeDDGFhBLxhmUiqKikbGX4RG9FzN?=
 =?iso-8859-1?Q?8aVgKbII6KwFNfDktBs6JiMbfhw35tO9ItHtwnXU6urlgqYSj6XpehG+83?=
 =?iso-8859-1?Q?whd4DxiqvWYW9SQPXn0TeCtIx+HWOXMeCXcXO5DgsyzyXN2lfLWXf6YGL5?=
 =?iso-8859-1?Q?zWNJmiG3KCBnWVdDrF//Avvr7jayfslIDPv4ikK8Se3Z0U5TvHDzCw2s2h?=
 =?iso-8859-1?Q?QwNG9Ioi1L8YIRCo8O18xP33duUNPnPr1t91FIyKX01n5B5Xblyu74wzu0?=
 =?iso-8859-1?Q?pXHP6QfQ4XtMJz0bRipInzLDmKwxjJqkUL5kundp3vuWRannMcDRhNJ8mQ?=
 =?iso-8859-1?Q?QI178PnJjixIVcsRGwKQxsAFgyx3+38Unn69KPZDdbNWcUZ/wZluVAhOZ2?=
 =?iso-8859-1?Q?6kHivZExbSOSGY/XLC5ffpSI7R1Kh9JNEnIRW3aqbnhHxR+tPo8FXr5nW7?=
 =?iso-8859-1?Q?rNMGu8z6Ye53JRDLFrUgDd?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?QkCdf1SN3ZBlie3gk/1yPItjQreq2vCkeP35myKzA35ASqR2AE75ksLKoP?=
 =?iso-8859-1?Q?nxEl0PlqNM9V6ZVR9UHFhKvrG0sO0FReg+e3qPJek0vDq3S1KwT3xeXIHJ?=
 =?iso-8859-1?Q?al+s9MW1hZWcG7aUZYMK1HbX+37ZFNWtx8sj3r1hMMxrd0A3H3INkT9rtE?=
 =?iso-8859-1?Q?ynYSjfbQxFcr+zszL9/LfHH9U93Y1jo1KWJzT/uquW2xu3rqmnHV1mQnGw?=
 =?iso-8859-1?Q?5RIKo9CV8VoJZJ31082oUzyOw7rCVsxa/bSZBYYg8d7RynB9sDddd+e+xl?=
 =?iso-8859-1?Q?z1wQIs3R3uykgfgsl3XIUr0vjJmd0BYlLA8vcIRzcru2vOYiupD6ZW0eQu?=
 =?iso-8859-1?Q?xjS/WAOhdJTV5nWjWrzr12nVWMgAM8DjgCQyJXUPpc+MIux76C7S7supnt?=
 =?iso-8859-1?Q?ci6RmoRjf86C5mRKCrykiyf8WVMtHafRWSrX0QVdTb5wo0t1G6UuKsAksr?=
 =?iso-8859-1?Q?hGC2ApC8nm/ZVjn4n/GILtQBg8Php1TjvxacUGlXyQIp3Ko0pgpngfTK8p?=
 =?iso-8859-1?Q?e41QdszSiq5bLZ+jtjqzkNQL92x0f+T9kFGkzOj3jwX/92hHIetMYF4dOE?=
 =?iso-8859-1?Q?kIxquBL+Ry08eUeGfZN3k55pCziz1hIML+fO29VRez4ToNpG2tCjhjzBLV?=
 =?iso-8859-1?Q?R1Lyb6G+eNb1V/L08tGjYV1bbcP0PKrkRNHZbxIvPpVBUf9hY6kmngBekV?=
 =?iso-8859-1?Q?APqKRc2uA7hcyzhcvLw618+T++rEt9+toSJrZyQsuwaqutflRD6PzCHvGz?=
 =?iso-8859-1?Q?Rer/ZgYYf2lCY9mXr+modbhCFd28xQkvwKQtjs9hRa5Eo//qKfvEF+pLQi?=
 =?iso-8859-1?Q?z/EReNvIcZ5141ucv3+/plFfs3B6W42mDr+H+xWj8wf5mNh5g62cL3CzWG?=
 =?iso-8859-1?Q?8SGZy8B0iNzSHwUFdutuOICsY81VQQjgMtmwF2KEzdiWNa7q8VfMStrXsd?=
 =?iso-8859-1?Q?4l2zDt2idS90HhpOQc5L15YRpPvZ+QDdkwXrvY7d0+qU8YQrLS8CPZUUPY?=
 =?iso-8859-1?Q?QwXrkwqbcMzFG2fBvCgwNtA650ZyDACP/Y1iiriz/Ty6I3aZyME+oczIUH?=
 =?iso-8859-1?Q?XBN5Rd5WTnZsVAQi17aXblVDIzVKpxeCk1hmpzxLUzseMOwY4uw8tMgM4P?=
 =?iso-8859-1?Q?c0BKJ7r+RCdxphIiM0FVHcVc7ojJZyVQsi+pF4psNtKMEilLVnVFN6IMB+?=
 =?iso-8859-1?Q?X/gQnrnSVgFbgYdfnFC/FKS2KiT3PELLjiprhfChJAQlrgaYFDopy8nqFy?=
 =?iso-8859-1?Q?8FkTuEcIIcrPyODcT9qjikpbiOF+ikrzbEM4EfKiDhDuzWfwBg+FnsaApQ?=
 =?iso-8859-1?Q?L4/2kyAr7yUJAk6fo23GMWO3s2oSoGAG3DMeJd47/vnGUb5aj6QSNa4Pcm?=
 =?iso-8859-1?Q?DifIrF7lqbYexnHlaSM3JxMeZPxxfc1emZgDiUpzjHz9v2MfEg26xwgZDi?=
 =?iso-8859-1?Q?VC52EJoG+txgMH61tPl35Oc+OjEwKuA8WTSYQc9nNcSaCNpClCk0oBQ/Ap?=
 =?iso-8859-1?Q?LqzQ77M3BA8BGt9wNqkdg9IgM2QGfzlYb2hxMHYeVjW47PW2Lxk0v50TUD?=
 =?iso-8859-1?Q?jTEB54Sw8QjlsS62uEcYPDk0Mpqfk6mMJ8AVAERpKVk8kpGf/47p2zcybI?=
 =?iso-8859-1?Q?RT4OQV5rnr1OX8hUX54bXmYeZVtDdxmz1w?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bf93d6f-6b33-44b3-fde0-08dd5aec68cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2025 07:15:57.2938 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g6ynqs3xgIF5G6PA7sIXpynS6aQpmnkJvey0Dj45OfFxrwsK/3JDW6BTj57krlIpURz9kJUwnhTYOna7vHeKMLx9sOBwERPtawc991E3XEU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8490
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

Hi Jason,

> Subject: Re: [PATCH 0/4] cover-letter: Allow MMIO regions to be exported
> through dmabuf
>=20
> On Wed, Feb 26, 2025 at 07:55:07AM +0000, Kasireddy, Vivek wrote:
>=20
> > > Is there any update or ETA for the v3? Are there any ways we can help=
?
>=20
> > I believe Leon's series is very close to getting merged. Once it
> > lands, this series can be revived.
>=20
> The recent drama has made what happens next unclear.
>=20
> I would like it if interested parties could contribute reviews to
> Leon's v7 series to help it along.
>=20
> We may want to start considering pushing ahead with this patch series
> and using the usual hack of abusing the scatterlist in the mean time.
Yeah, given that this series is gaining more adoption (in newer use-cases)
and since Leon's series would likely take more time (and iterations) to get
merged, I agree that it makes sense to continue using the scatterlist for n=
ow
with this series.

Although, Simona has implicitly Ack'd this series, an explicit Ack would be
needed from them or Christian for the dmabuf parts. I'll post a v3 soon
(sometime this week) and we can take it from there.

Thanks,
Vivek

>=20
> Thanks,
> Jason
