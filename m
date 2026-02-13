Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHa4HKntjmk5GAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 10:23:53 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2319B134695
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 10:23:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABD7C10E7DE;
	Fri, 13 Feb 2026 09:23:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GukNiNjZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15FDB10E7D4;
 Fri, 13 Feb 2026 09:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770974628; x=1802510628;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xv58/0a2lN4+LFG1iSwuzxXlbXIJiZxXzMMIRRGdNVQ=;
 b=GukNiNjZszccwICWIRfvuD/BVYGqp7joKVKYcdsCOwwmQHdr5qM3wWcu
 FArGWMoZ+rAVcS5rTl8DuTNDxBCofBRBvbA8XxDZZfaurq19noxMQX0Hr
 ytifTTE6/0pkg4rpmR9b81n5+MFOb8VcfFZI9WWn8QXMT3EItkntM1ijO
 9Y3SHPZvjTigiejbvGinenyMJufWekJXdhYYbZFQ2vEG9nXAMpStjooux
 HT5ztXSo2sTyeuld+0y3bzxFUePOdEpguesWp7nuv5sCSVPuyhARTKac2
 5lTTsHbYKWywufXgTTKagVpQzboZQuDEfr8kVhULYZDC9hSXTtscjWtyD g==;
X-CSE-ConnectionGUID: zvqLgtPAQ5uPp1RJGs/zTQ==
X-CSE-MsgGUID: R3ohZixGRNOVI9sxRfAzLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="74756759"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="74756759"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 01:23:48 -0800
X-CSE-ConnectionGUID: TyZk5EHwTa6Lggp0OKenxA==
X-CSE-MsgGUID: 3QQBvBo/RIO50ieZpZyCuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="212036902"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 01:23:47 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 13 Feb 2026 01:23:46 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 13 Feb 2026 01:23:46 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.24) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 13 Feb 2026 01:23:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O0e9y2zxn3fg89bCi8Vk0MkWVsD9cu0yh6+ZdVgK5P7fegbYmYLzKufy8Ja4JaBufA/4BC3pA8TXHmjNM9wumowV749BjoWtCcrf9qToyfneN6D7O3D8TIQB/9+LNVR1FYHpgTl4bwHY6PBjDauKe/SE79LkwATPFQrAmE0Opp0at//WiS1orAfkMUVXlotjW4RPA68V1NeBvPsyMA+tF62Ry7bLseVvmy5hQPeoxChe60f4A45BiBXFiw9UZabIJizk74n5/ROIC4Qc0Pd5MRDDEd9bDrd8TBuFk/VyV3wOSCylWW5aQrl4QrWUcCa9J40YAkEpnIIj0PcQrMQH8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xv58/0a2lN4+LFG1iSwuzxXlbXIJiZxXzMMIRRGdNVQ=;
 b=ZqQPNQ12l9bvLPeKt15Z0eC1ty8yucYi6A/GGtsZ9HxIwPEiQv3P3RAAoGnFDQPSroA2ZnJJeOQeP7NW3oh+OAkVUENNGLVAHQRpaQ2aQzrJC3y5QziM4gdIYCIuaysAkM0cS4u82XYMwLDIeShC0q3qyJZvGDtw9b9xtqTnbzveHDWJGwq0ckO7CgGEPnZVDbMS0+sOxzlUOAtDQUUopZoYZFR7NwcnsciPN7dYJRoCTXlbY1Su8V3mqRVmFo8qU5qMvFFzlIn1OC90D8DIG/ZYoyH5bgtpgHV+INVm0M0gQ4w6ratOQl9gLBPACWzdRJT/jIUvhIah/A4wWmbI8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by PH0PR11MB4776.namprd11.prod.outlook.com
 (2603:10b6:510:30::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.12; Fri, 13 Feb
 2026 09:23:44 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::a3d9:7cb3:f6e8:1035]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::a3d9:7cb3:f6e8:1035%5]) with mapi id 15.20.9611.012; Fri, 13 Feb 2026
 09:23:43 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 "xaver.hugl@kde.org" <xaver.hugl@kde.org>, "harry.wentland@amd.com"
 <harry.wentland@amd.com>, "Shankar, Uma" <uma.shankar@intel.com>,
 "louis.chauvet@bootlin.com" <louis.chauvet@bootlin.com>, "Kumar, Naveen1"
 <naveen1.kumar@intel.com>, "Yella, Ramya Krishna"
 <ramya.krishna.yella@intel.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Murthy,
 Arun R" <arun.r.murthy@intel.com>
Subject: RE: [PATCH v9 5/7] drm/atomic: Return user readable error in
 atomic_ioctl
Thread-Topic: [PATCH v9 5/7] drm/atomic: Return user readable error in
 atomic_ioctl
Thread-Index: AQHcmmyF/wh7TPXY4k+bl1HdMVXKKrWAX11A
Date: Fri, 13 Feb 2026 09:23:43 +0000
Message-ID: <DM3PPF208195D8DA23C85CF5B0645AABDD4E361A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260210-atomic-v9-0-525c88fd2402@intel.com>
 <20260210-atomic-v9-5-525c88fd2402@intel.com>
In-Reply-To: <20260210-atomic-v9-5-525c88fd2402@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|PH0PR11MB4776:EE_
x-ms-office365-filtering-correlation-id: ada24864-2fa9-48fe-aaf2-08de6ae19557
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|921020|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?bFVCMk9HOHNvK2hxdDhwZ2dzY09HcmhyNUd3ZTdjSnZtTkdoTS96dXF3TmhW?=
 =?utf-8?B?Mk1OditiSElpNWN4WlI3NGpYM0UzanRjRkJDZHJ2VW1tKy9Eb1ltZlZZaThL?=
 =?utf-8?B?YU9Zc21hQ05tRWV2bEFwaDJDK0ExcXR2eERPREZEU1F3ZnpaZnYvNE1qekFC?=
 =?utf-8?B?Zis5OWNmTEdDSkZ6OWUvNlBxTlVhT0RKN1U3SG1iSlJ0SUdBNDZvRWJaR2Er?=
 =?utf-8?B?ZGNsVnNZdmp5d2RlQlFHOE1oNXVYV1lXc1JRaXRjM283TjF2UElsaGU2SVlM?=
 =?utf-8?B?Wm9LQ0FjWEpQM2xGdHdVNE5yTTVTUkZzTzlvM3BvekJFUDZrclRGRGRMV3Iz?=
 =?utf-8?B?NEZlQ29RRUdkUTZBZFFNbUh3QTZXUnYxS3ZuUFNYV0o3bUdCNzEwZUV5M3BS?=
 =?utf-8?B?cWJMSTJGZzYyL0Z6WjNldE9DK3VtNlhEVitxYTJwakQxQzV4c0hSQTEyV0tX?=
 =?utf-8?B?Vlg4UnZvc1g4OXFIS2ZVY0dkTVQxSjZIbW9lR25jMkRkTHhpejBDSlZ3V2lz?=
 =?utf-8?B?OGpYMUJrYUgrTEhsZFQ0SXIzQ05LZnBwNWZBNW1wUVUyNDd4RHlibEtjNFBz?=
 =?utf-8?B?c2F2Y21UNlZZUStBSCt6N2QwVkFBaFdvOVZQSHlycjJ4YlgzdFJDVmpMdk1k?=
 =?utf-8?B?aEp3dHI3SWMxVDA4elFxOHJPeThTZ2haQitxcW81Qk51TzQzNTQyWnhmUEE3?=
 =?utf-8?B?MW5VdGdEV201bkZmNSszb1lNekZTTkJJUkUzMXhjbjdheTVEdXdGVGxjTnZs?=
 =?utf-8?B?QkJvNDhZNWtwMFFQQ1JJZ21talY2K0pqVndlT2ZFMWthS2RSMjFKTjhMaERX?=
 =?utf-8?B?amcyNGhua2lHRXNPemlIZk9HQ3lBMURPTEdjRGlqMzd2VjlRV2g1OEtXbnNI?=
 =?utf-8?B?Y3pubjdnYk9USitUd01oakcwNnp4WjZCQ3NGUG91SnA1UytlMUFRQXRra21j?=
 =?utf-8?B?UzJwc1ZrRS9Nc1U3bkFaVUg4dmdmT3JlTUNjbS8ybE82YjY3dFJVa2pPYjly?=
 =?utf-8?B?OWVvLzBnTzF5dER4SXBQMHl1dGNPTjNwZ29BK1VEbEtrSG1JRmNEV2l1dWM0?=
 =?utf-8?B?dmpJSXdyNUlKMEl6ekhqRjhYcUhiT0ZXcG5CZ1dzUFN1SFJBaUJwYzU4UUhP?=
 =?utf-8?B?SENJYnJnYWd1K2JWUzkxTFBscGR3WS9ZTUREQ0xzcmQ5ZFNlZ3hkMDd2Wlhw?=
 =?utf-8?B?UTBhNEFRdHVEYXJNY1NmTDNyb212T2UvdTFUdy9Dd05lc1dkZU55R3h0R1Vu?=
 =?utf-8?B?S3U0NnhZNkRTZmZPK0FOYkxJZ0tvQTI3QStMUzl2Uzkxd1NTOXUvTFh4UDFK?=
 =?utf-8?B?RFoyRk0zSmRXOXVaSENrOW5ObWVZUTc3eERkVnV0Z0xnaXVvMVNQV3lzMW5X?=
 =?utf-8?B?UWZzY0V1by9XNS9ZbzU5YUFxV1pKWHNJYUl3a2txRmtZZjhWdnVWWlByQ3Ux?=
 =?utf-8?B?Vi9XeXI4aTdRZFBvc3JJMjVyOXo2RkpwaVFIeTBLSTAxeURSc2FmZVZJMm1X?=
 =?utf-8?B?WGRWV0VsNlZjenl4YmV6WkRvS3hCWHl5bFNReWdoQTZ5VUp3UzQ0RXhseFh3?=
 =?utf-8?B?Uld2c2RaUENvVHhTNDUzcmoyWDZzWWVjOUM0YXA5NGluQU4wMFZGWFlLcXBR?=
 =?utf-8?B?cG9Ud3JXVTI1OWlNcHkxbXpwcXhMTW1NcFJMRjhJOWV4Q09NcW1uSmNGK3RR?=
 =?utf-8?B?MEpreWFmdG00cFIwN0tUbGdkZjlHN3BOZ3NsSUxhQXdxYSsyU3pqZXV5Rngx?=
 =?utf-8?B?MDI3emhiR2k2VmhTVU1ncGhCUXdtMkhOcms1ajB0TDVValdiVHhVbkUxL0Zx?=
 =?utf-8?B?Y3ZVOUpOS0xiSUNrblZyV1c0OFBYNS9UNWlzTm1WYm5hejVENkRsVjJRemhZ?=
 =?utf-8?B?QW1FUVE1NTRlSS9aYi9sOUorTFF4L1lvenZrbDIyUWJnSFkwUXRIdUllQkZ4?=
 =?utf-8?B?dFltL2g2bG5vekxjYWhSanM3dFphVStrcTY3bWY1d1hZa25YSXBUQWV3cmlU?=
 =?utf-8?B?bUhkSHhsMER2TDRzN0FPekVFZy9wSnVOZFJQcytuK1BqNnVreStHdTM3enpl?=
 =?utf-8?B?eDBERzQwR2dUNXExUVRYeFh3a0lHN1ZDV2pUZldBUGtPZHZhQ1c4bUxNbUFP?=
 =?utf-8?B?SDU1M3V4UjhmVVcyMVkwemUvMTRYRVpCSG0zYjNVMXhBeVhaZGpXenhrZVRt?=
 =?utf-8?Q?yb4a+3Vj6IYkN5SzRaiO92GIFVkpz9gHqGkjndDUxKYc?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ekdWY3NRcEdsU0dDRjVOaVl1MytKSFdyQXlqcm9RVG1EOWhyR1dwQ1F2TUJP?=
 =?utf-8?B?dXhuZEZ1SXcyNFd3cTJ3MmdjOU5HOHV1YkxqMEZINk9rRFVkSi9SOUc3c2VS?=
 =?utf-8?B?QnJZV28rTC81OHltZGhyZmtkZXhpVG5NWE1RQmxWZ0hRQVVzSlcwbGxTL3Z2?=
 =?utf-8?B?enJTRit6RFo0d2xtSU1uZlVuQm1WcU9ZcElQTUt0SE0wQk8zREJvaElGbWtt?=
 =?utf-8?B?dTArKzJDWEg4WlVPK2xEcHVhQU1IeGtPRnpFNDZpdFlnU21DeUZSc3ovVkhn?=
 =?utf-8?B?T1JQRnM5YzFtVzNwalFhOVRuMEt3T3NkUkNNYkJ2OUU3Snh6a2RwWTlOR2JT?=
 =?utf-8?B?NVNmRmVrdDFUYnMzdmkxUUQzcnFTdUxhZ0Zia3RjT1dGT0EyQnNsclVoREpF?=
 =?utf-8?B?d29xYi9kai8yZm0rRk1rZTRoZnowZUtvb2JaOGVXeldHMDZCZmozaVR1Zkc2?=
 =?utf-8?B?WTVLcHlMcCtSTkQvQm9WdzFlN1kwQXVoM05BUkFTZ2JNUStLR0o1QXd3UGZR?=
 =?utf-8?B?emg0dngwOVg2S2tmbnI1WE8wRDFDeEJObWZYTDdER1dtZkp6MGdNdC8zMFBs?=
 =?utf-8?B?RUJNTXRlM2Y3RXpXaW54SVRnbkRkUWVRR2UxM2o3WDJKT1pFRHRjVVpaY0lK?=
 =?utf-8?B?L1hEZHdTcVp1Vkp5WStibElXaEtFQTBMNkw0Q29EZG02czZsdlhHbkFNdksw?=
 =?utf-8?B?cGJmWXFScnlmYXJpT3NrSGo5c1k1OHZ2U0V4alVGREl0b3FsMUNYSDZML0VH?=
 =?utf-8?B?TmpnRTEwcDE2aktNSWl5MTBveGxDOUYwT0xrS3BWOUl2VjFSVHROSkdmN0xX?=
 =?utf-8?B?TVlNSWhhSVB3N3JhZmxvQlZqa29udWVmRlM4UHJ4UW5BZlBGK1hqSkxCZkdI?=
 =?utf-8?B?RW8zYnpQaXliNmR4MVRNdnFMVGwwMTI0UmF3Tm1tUHNVZlFmVTBBNk9MN1d3?=
 =?utf-8?B?RXI5STNZdDN0VkZUVEhuSlFSWjJrcTZGUlhlUHNGVHlFSWdZQ0d0MHYvUnFT?=
 =?utf-8?B?VlZ6UnFhbzVheFY1bjhzQzQ5c1ViS3VmanJaRFZVTEI2RzlLMk5qMUFjeXVD?=
 =?utf-8?B?UG9pamRkZGRjaE9qb25YMjdmTjhBZmlTSEJ1aXQvRHNvVEFPeDNTNWorMzN1?=
 =?utf-8?B?MXRmMWpFTXlyOGdrWnNvTjFNOGxPRm1XVTdLdHRPRHQ0a3ZjSEsyYW8rQUE4?=
 =?utf-8?B?ODNkamt1d0RRb0RtNXRvcVowanZVVGZyK2Nwd20yWWtFQ2hYNnJVNFdSSDA2?=
 =?utf-8?B?Zng5SktmMVlNbkJrU0VmWUVSYzZBS1lOL00rT3NQR1JKbVU3SmJIQUpidkV5?=
 =?utf-8?B?RVZXK2p5R21jWnNWNE9RTURkazBYd052RUNOWWpmYjkvMi9jZXNaTHhjaXpW?=
 =?utf-8?B?dlhVNEgvYk5yalZDTjRrcDZPYzYvRjBFdEFBNG85RlA1dTNycVRqYVNFYzBv?=
 =?utf-8?B?aENiTno4SEs2Wkdid1NUVXRSVzVLWmtFZFUvdnFIWmNGZDZ0Z3lOOWo2NG85?=
 =?utf-8?B?alNqTktLOGNDMTdSeTVjQmZIWEdrTGpNNVUrblJUZk9yeWRIQnQwOUwxZkZZ?=
 =?utf-8?B?MXg1NEwwMVB6ZVdza1NMQ3hJdFllcjQyWTk3ekt3bzQzMklYQ2hXdGlRdTB2?=
 =?utf-8?B?NFJQZDRIYlFJNzlSWENtYTNUc2lRbXNqMFh1aUJnOEZaM1BoQy9jRkVqUHY5?=
 =?utf-8?B?LzNVYmJOa2VNN2FWZzRNRUtYQU54SjVqNGRTc3JKMFdIV3h3QVQ1RVZtdmlr?=
 =?utf-8?B?Y2swazVGMUNzZmdabTluU3kvMjRRZ2lzK2dWcHlMNmx2Q2p0RFRCV09FenZU?=
 =?utf-8?B?OEw5S3dvQ2hDbUd6VTM2cUxpK21pM1dHbWd4aDhMK25SSmdjN0FJTnBQaWNo?=
 =?utf-8?B?eWhSRmhHUnI3WnoyRUhwNVJZNEcxZ3hpMlQ5aWNVeFBqSkd0NkxHQXJmWEZi?=
 =?utf-8?B?STlnSkJ4WjJ6aTl1cTRGc1k1T0F6TEtzT3pTVFRucVRsNGhJZ3FOOFBsemw0?=
 =?utf-8?B?MWN2LytxNHpCNnZ0OHh0NG5Ic3IwcEhXbnRvTnJEYnJFQmljR0pYTDB4Uk1U?=
 =?utf-8?B?cmNhd25QQXRNTEhVZHNLYlhyYkZlQzZ2citPZXdqa01xNTNrTlFPTHJXdGRo?=
 =?utf-8?B?ZjRjTXBMMjBmZkdvR0F6cm5jV05VT2FvbDNZSGQwVFhoWWRjZzdQSVVNR2xQ?=
 =?utf-8?B?T1RvYks2NmFTUlRqaGlQUE1kenRTYXJscjRYWElTVERtNlJJNUpBUDFycFp5?=
 =?utf-8?B?aVVoc1d5bWZTR3IrWk5rNjJjZUNhWGQxN1ROUkpwYmxXejhvR1JPSUg3VTdY?=
 =?utf-8?B?OG1hc0s5R0ltL21UUGM2SE1MNHNoTzlNcWM2bURFRk9FY2V0eldXUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ada24864-2fa9-48fe-aaf2-08de6ae19557
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2026 09:23:43.8885 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ek7AtvVszD8sOmx4VOPO+17chYOyBKlc66axYjhPlZR/hLrhlgqICYoHNR3sAx5UGlRWxAT0LPxkTUOj3T1B4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4776
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.21 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[DM3PPF208195D8D.namprd11.prod.outlook.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:email,intel.com:dkim];
	FREEMAIL_TO(0.00)[intel.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,ursulin.net,kde.org,amd.com,bootlin.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[suraj.kandpal@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 2319B134695
X-Rspamd-Action: no action

PiBTdWJqZWN0OiBbUEFUQ0ggdjkgNS83XSBkcm0vYXRvbWljOiBSZXR1cm4gdXNlciByZWFkYWJs
ZSBlcnJvciBpbiBhdG9taWNfaW9jdGwNCj4gDQo+IEFkZCB1c2VyIHJlYWRhYmxlIGVycm9yIGNv
ZGVzIGZvciBmYWlsdXJlIGNhc2VzIGluIGRybV9hdG9taWNfaW9jdGwoKSBzbyB0aGF0DQo+IHVz
ZXIgY2FuIGRlY29kZSB0aGUgZXJyb3IgY29kZSBhbmQgdGFrZSBjb3JyZWN0aXZlIG1lYXN1cmVt
ZW50cy4NCj4gDQo+IHY4OiBSZXBsYWNlZCBEUk1fTU9ERV9BVE9NSUNfQVNZTkNfTk9UX1NVUFBf
UExBTkUsDQo+ICAgICBEUk1fTU9ERV9BVE9NSUNfQVNZTkNfTU9ESUZJRVJfTk9UX1NVUFAgd2l0
aA0KPiBJTlZBTElEX0FQSV9VU0FHRQ0KPiAgICAgKFhhdmVyKQ0KPiB2OTogTW92ZSBmcmVlIGF0
b21pY19zdGF0ZSBvbiBlcnJvciB0byBwYXRjaCAzIChTdXJhaikNCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IEFydW4gUiBNdXJ0aHkgPGFydW4uci5tdXJ0aHlAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGRy
aXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX3VhcGkuYyB8IDU4ICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrLS0NCj4gLS0tLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA0NCBpbnNlcnRpb25z
KCspLCAxNCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2F0b21pY191YXBpLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY191YXBpLmMN
Cj4gaW5kZXgNCj4gYmNkMTJiNmVhYzRmNDk3ZDJlZGI4NTgxZDlmYjBmZDU0Y2JlZjgyNy4uZjBj
M2YwODBmNWQ2NmM3MzNkZmJmYTIzZjM4YQ0KPiAyMjEzMjE5M2FkZWMgMTAwNjQ0DQo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX3VhcGkuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vZHJtX2F0b21pY191YXBpLmMNCj4gQEAgLTExOTYsNiArMTE5NiwxMSBAQCBpbnQgZHJtX2F0
b21pY19zZXRfcHJvcGVydHkoc3RydWN0DQo+IGRybV9hdG9taWNfc3RhdGUgKnN0YXRlLA0KPiAg
CQkJcmV0ID0gZHJtX2F0b21pY19jb25uZWN0b3JfZ2V0X3Byb3BlcnR5KGNvbm5lY3RvciwNCj4g
Y29ubmVjdG9yX3N0YXRlLA0KPiAgCQkJCQkJCQlwcm9wLA0KPiAmb2xkX3ZhbCk7DQo+ICAJCQly
ZXQgPSBkcm1fYXRvbWljX2NoZWNrX3Byb3BfY2hhbmdlcyhyZXQsIG9sZF92YWwsDQo+IHByb3Bf
dmFsdWUsIHByb3ApOw0KPiArCQkJaWYgKHJldCkgew0KPiArCQkJCWRybV9tb2RlX2F0b21pY19h
ZGRfZXJyb3JfbXNnKCZzdGF0ZS0NCj4gPmVycm9yX2NvZGUsDQo+ICsNCj4gRFJNX01PREVfQVRP
TUlDX0FTWU5DX1BST1BfQ0hBTkdFRCwNCj4gKwkJCQkJCQkgICAgICAicHJvcGVydHkgY2hhbmdl
DQo+IG5vdCBhbGxvd2VkIGluIGFzeW5jIGZsaXAiKTsNCj4gKwkJCX0NCj4gIAkJCWJyZWFrOw0K
PiAgCQl9DQo+IA0KPiBAQCAtMTIxOCw2ICsxMjIzLDExIEBAIGludCBkcm1fYXRvbWljX3NldF9w
cm9wZXJ0eShzdHJ1Y3QNCj4gZHJtX2F0b21pY19zdGF0ZSAqc3RhdGUsDQo+ICAJCQlyZXQgPSBk
cm1fYXRvbWljX2NydGNfZ2V0X3Byb3BlcnR5KGNydGMsIGNydGNfc3RhdGUsDQo+ICAJCQkJCQkJ
ICAgcHJvcCwgJm9sZF92YWwpOw0KPiAgCQkJcmV0ID0gZHJtX2F0b21pY19jaGVja19wcm9wX2No
YW5nZXMocmV0LCBvbGRfdmFsLA0KPiBwcm9wX3ZhbHVlLCBwcm9wKTsNCj4gKwkJCWlmIChyZXQp
IHsNCj4gKwkJCQlkcm1fbW9kZV9hdG9taWNfYWRkX2Vycm9yX21zZygmc3RhdGUtDQo+ID5lcnJv
cl9jb2RlLA0KPiArDQo+IERSTV9NT0RFX0FUT01JQ19BU1lOQ19QUk9QX0NIQU5HRUQsDQo+ICsJ
CQkJCQkJICAgICAgInByb3BlcnR5IGNoYW5nZQ0KPiBub3QgYWxsb3dlZCBpbiBhc3luYyBmbGlw
Iik7DQo+ICsJCQl9DQo+ICAJCQlicmVhazsNCj4gIAkJfQ0KPiANCj4gQEAgLTEyNTYsOSArMTI2
NiwxMCBAQCBpbnQgZHJtX2F0b21pY19zZXRfcHJvcGVydHkoc3RydWN0DQo+IGRybV9hdG9taWNf
c3RhdGUgKnN0YXRlLA0KPiAgCQkJCQlyZXQgPSBwbGFuZV9mdW5jcy0NCj4gPmF0b21pY19hc3lu
Y19jaGVjayhwbGFuZSwgc3RhdGUsIHRydWUpOw0KPiANCj4gIAkJCQlpZiAocmV0KSB7DQo+IC0J
CQkJCWRybV9kYmdfYXRvbWljKHByb3AtPmRldiwNCj4gLQkJCQkJCSAgICAgICAiW1BMQU5FOiVk
OiVzXSBkb2VzIG5vdA0KPiBzdXBwb3J0IGFzeW5jIGZsaXBzXG4iLA0KPiAtCQkJCQkJICAgICAg
IG9iai0+aWQsIHBsYW5lLT5uYW1lKTsNCj4gKw0KPiAJZHJtX21vZGVfYXRvbWljX2FkZF9lcnJv
cl9tc2coJnN0YXRlLT5lcnJvcl9jb2RlLA0KPiArDQo+IERSTV9NT0RFX0FUT01JQ19JTlZBTElE
X0FQSV9VU0FHRSwNCj4gKw0KPiAiW1BMQU5FOiVkOiVzXSBkb2VzIG5vdCBzdXBwb3J0IGFzeW5j
IGZsaXAiLA0KPiArCQkJCQkJCQkgICAgICBvYmotPmlkLA0KPiBwbGFuZS0+bmFtZSk7DQo+ICAJ
CQkJCWJyZWFrOw0KPiAgCQkJCX0NCj4gIAkJCX0NCj4gQEAgLTE1NjgsNiArMTU3OSw3IEBAIGlu
dCBkcm1fbW9kZV9hdG9taWNfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwNCj4gIAlzdHJ1
Y3QgZHJtX2F0b21pY19zdGF0ZSAqc3RhdGU7DQo+ICAJc3RydWN0IGRybV9tb2Rlc2V0X2FjcXVp
cmVfY3R4IGN0eDsNCj4gIAlzdHJ1Y3QgZHJtX291dF9mZW5jZV9zdGF0ZSAqZmVuY2Vfc3RhdGU7
DQo+ICsJc3RydWN0IGRybV9tb2RlX2F0b21pY19lcnJfY29kZSBfX3VzZXIgKmVycm9yX2NvZGVf
cHRyOw0KPiAgCWludCByZXQgPSAwOw0KPiAgCXVuc2lnbmVkIGludCBpLCBqLCBudW1fZmVuY2Vz
ID0gMDsNCj4gIAlib29sIGFzeW5jX2ZsaXAgPSBmYWxzZTsNCj4gQEAgLTE1NzYsNiArMTU4OCwx
NCBAQCBpbnQgZHJtX21vZGVfYXRvbWljX2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlDQo+ICpkZXYs
DQo+ICAJaWYgKCFkcm1fY29yZV9jaGVja19mZWF0dXJlKGRldiwgRFJJVkVSX0FUT01JQykpDQo+
ICAJCXJldHVybiAtRU9QTk9UU1VQUDsNCj4gDQo+ICsJaWYgKCFhcmctPnJlc2VydmVkKQ0KPiAr
CQlkcm1fZGJnX2F0b21pYyhkZXYsDQo+ICsJCQkgICAgICAgIm1lbW9yeSBub3QgYWxsb2NhdGVk
IGZvciBkcm1fYXRvbWljIGVycm9yDQo+IHJlcG9ydGluZ1xuIik7DQo+ICsJZWxzZQ0KPiArCQkv
KiBVcGRhdGUgdGhlIGVycm9yIGNvZGUgaWYgYW55IGVycm9yIHRvIGFsbG93IHVzZXIgaGFuZGxp
bmcgaXQNCj4gKi8NCj4gKwkJZXJyb3JfY29kZV9wdHIgPSAoc3RydWN0IGRybV9tb2RlX2F0b21p
Y19lcnJfY29kZSBfX3VzZXINCj4gKikNCj4gKwkJCQkgKHVuc2lnbmVkIGxvbmcpYXJnLT5yZXNl
cnZlZDsNCj4gKw0KPiAgCXN0YXRlID0gZHJtX2F0b21pY19zdGF0ZV9hbGxvYyhkZXYpOw0KPiAg
CWlmICghc3RhdGUpDQo+ICAJCXJldHVybiAtRU5PTUVNOw0KPiBAQCAtMTU4NCwxMSArMTYwNCwx
NiBAQCBpbnQgZHJtX21vZGVfYXRvbWljX2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlDQo+ICpkZXYs
DQo+ICAJc3RhdGUtPmFjcXVpcmVfY3R4ID0gJmN0eDsNCj4gIAlzdGF0ZS0+YWxsb3dfbW9kZXNl
dCA9ICEhKGFyZy0+ZmxhZ3MgJg0KPiBEUk1fTU9ERV9BVE9NSUNfQUxMT1dfTU9ERVNFVCk7DQo+
IA0KPiArCW1lbXNldCgmc3RhdGUtPmVycm9yX2NvZGUsIDAsIHNpemVvZigqZXJyb3JfY29kZV9w
dHIpKTsNCj4gKw0KPiAgCS8qIGRpc2FsbG93IGZvciB1c2Vyc3BhY2UgdGhhdCBoYXMgbm90IGVu
YWJsZWQgYXRvbWljIGNhcCAoZXZlbg0KPiAgCSAqIHRob3VnaCB0aGlzIG1heSBiZSBhIGJpdCBv
dmVya2lsbCwgc2luY2UgbGVnYWN5IHVzZXJzcGFjZQ0KPiAgCSAqIHdvdWxkbid0IGtub3cgaG93
IHRvIGNhbGwgdGhpcyBpb2N0bCkNCj4gIAkgKi8NCj4gIAlpZiAoIWZpbGVfcHJpdi0+YXRvbWlj
KSB7DQo+ICsJCWRybV9tb2RlX2F0b21pY19hZGRfZXJyb3JfbXNnKCZzdGF0ZS0+ZXJyb3JfY29k
ZSwNCj4gKw0KPiBEUk1fTU9ERV9BVE9NSUNfSU5WQUxJRF9BUElfVVNBR0UsDQo+ICsJCQkJCSAg
ICAgICJkcm0gYXRvbWljIGNhcGFiaWxpdHkgbm90DQo+IGVuYWJsZWQiKTsNCj4gIAkJZHJtX2Ri
Z19hdG9taWMoZGV2LA0KPiAgCQkJICAgICAgICJjb21taXQgZmFpbGVkOiBhdG9taWMgY2FwIG5v
dCBlbmFibGVkXG4iKTsNCj4gIAkJcmV0ID0gLUVJTlZBTDsNCj4gQEAgLTE1OTYsMjEgKzE2MjEs
MTggQEAgaW50IGRybV9tb2RlX2F0b21pY19pb2N0bChzdHJ1Y3QgZHJtX2RldmljZQ0KPiAqZGV2
LA0KPiAgCX0NCj4gDQo+ICAJaWYgKGFyZy0+ZmxhZ3MgJiB+RFJNX01PREVfQVRPTUlDX0ZMQUdT
KSB7DQo+IC0JCWRybV9kYmdfYXRvbWljKGRldiwgImNvbW1pdCBmYWlsZWQ6IGludmFsaWQgZmxh
Z1xuIik7DQo+IC0JCXJldCA9IC1FSU5WQUw7DQo+IC0JCWdvdG8gb3V0Ow0KPiAtCX0NCj4gLQ0K
PiAtCWlmIChhcmctPnJlc2VydmVkKSB7DQo+IC0JCWRybV9kYmdfYXRvbWljKGRldiwgImNvbW1p
dCBmYWlsZWQ6IHJlc2VydmVkIGZpZWxkIHNldFxuIik7DQo+ICsJCWRybV9tb2RlX2F0b21pY19h
ZGRfZXJyb3JfbXNnKCZzdGF0ZS0+ZXJyb3JfY29kZSwNCj4gKw0KPiBEUk1fTU9ERV9BVE9NSUNf
SU5WQUxJRF9BUElfVVNBR0UsDQo+ICsJCQkJCSAgICAgICJpbnZhbGlkIGZsYWciKTsNCj4gIAkJ
cmV0ID0gLUVJTlZBTDsNCj4gIAkJZ290byBvdXQ7DQo+ICAJfQ0KPiANCj4gIAlpZiAoYXJnLT5m
bGFncyAmIERSTV9NT0RFX1BBR0VfRkxJUF9BU1lOQykgew0KPiAgCQlpZiAoIWRldi0+bW9kZV9j
b25maWcuYXN5bmNfcGFnZV9mbGlwKSB7DQo+IC0JCQlkcm1fZGJnX2F0b21pYyhkZXYsDQo+IC0J
CQkJICAgICAgICJjb21taXQgZmFpbGVkOg0KPiBEUk1fTU9ERV9QQUdFX0ZMSVBfQVNZTkMgbm90
IHN1cHBvcnRlZFxuIik7DQo+ICsJCQlkcm1fbW9kZV9hdG9taWNfYWRkX2Vycm9yX21zZygmc3Rh
dGUtDQo+ID5lcnJvcl9jb2RlLA0KPiArDQo+IERSTV9NT0RFX0FUT01JQ19JTlZBTElEX0FQSV9V
U0FHRSwNCj4gKw0KPiAiRFJNX01PREVfUEFHRV9GTElQX0FTWU5DIG5vdCBzdXBwb3J0ZWQgd2l0
aCBBVE9NSUMNCj4gK2lvY3RsIik7DQo+ICAJCQlyZXQgPSAtRUlOVkFMOw0KPiAgCQkJZ290byBv
dXQ7DQo+ICAJCX0NCj4gQEAgLTE2MjEsOCArMTY0Myw5IEBAIGludCBkcm1fbW9kZV9hdG9taWNf
aW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwNCj4gIAkvKiBjYW4ndCB0ZXN0IGFuZCBleHBl
Y3QgYW4gZXZlbnQgYXQgdGhlIHNhbWUgdGltZS4gKi8NCj4gIAlpZiAoKGFyZy0+ZmxhZ3MgJiBE
Uk1fTU9ERV9BVE9NSUNfVEVTVF9PTkxZKSAmJg0KPiAgCQkJKGFyZy0+ZmxhZ3MgJiBEUk1fTU9E
RV9QQUdFX0ZMSVBfRVZFTlQpKSB7DQo+IC0JCWRybV9kYmdfYXRvbWljKGRldiwNCj4gLQkJCSAg
ICAgICAiY29tbWl0IGZhaWxlZDogcGFnZS1mbGlwIGV2ZW50IHJlcXVlc3RlZCB3aXRoDQo+IHRl
c3Qtb25seSBjb21taXRcbiIpOw0KPiArCQlkcm1fbW9kZV9hdG9taWNfYWRkX2Vycm9yX21zZygm
c3RhdGUtPmVycm9yX2NvZGUsDQo+ICsNCj4gRFJNX01PREVfQVRPTUlDX0lOVkFMSURfQVBJX1VT
QUdFLA0KPiArCQkJCQkgICAgICAicGFnZS1mbGlwIGV2ZW50IHJlcXVlc3RlZCB3aXRoDQo+IHRl
c3Qtb25seSBjb21taXQiKTsNCj4gIAkJcmV0ID0gLUVJTlZBTDsNCj4gIAkJZ290byBvdXQ7DQo+
ICAJfQ0KPiBAQCAtMTcyNSw2ICsxNzQ4LDEzIEBAIGludCBkcm1fbW9kZV9hdG9taWNfaW9jdGwo
c3RydWN0IGRybV9kZXZpY2UNCj4gKmRldiwNCj4gIAl9DQo+IA0KPiAgb3V0Og0KPiArCS8qIFVw
ZGF0ZSB0aGUgZXJyb3IgY29kZSBpZiBhbnkgZXJyb3IgdG8gYWxsb3cgdXNlciBoYW5kbGluZyBp
dCAqLw0KPiArCWlmIChyZXQgPCAwICYmIGFyZy0+cmVzZXJ2ZWQpIHsNCj4gKwkJaWYgKGNvcHlf
dG9fdXNlcihlcnJvcl9jb2RlX3B0ciwgJnN0YXRlLT5lcnJvcl9jb2RlLA0KPiArCQkJCSBzaXpl
b2Yoc3RhdGUtPmVycm9yX2NvZGUpKSkNCg0KQ29ybmVyIGNhc2Ugd2hhdCBpZiB5b3UgZW5kIHVw
IGhlcmUgcmlnaHQgYWZ0ZXIgYWxsb2NhdGluZyBhIHN0YXRlIGFuZCBjb21lIGhlcmUgYmVjYXVz
ZSBvZiBvbmUgb2YgdGhlIGNvbmRpdGlvbnMNCldoaWNoIHdlcmUgcHJldmlvdXNseSBjaGVja2Vk
IGJlZm9yZSBzdGF0ZSBhbGxvY2F0aW9uLiBBbmQgdGhlbiB0aGlzIGNvcHkgdG8gdXNlciBmYWls
cy4NClRoZW4gd2UgcmV0dXJuIHdpdGhvdXQgZnJlZWluZyB0aGUgc3RhdGUsIGZlbmNlcyBldGMu
IFNob3VsZCB0aGlzIGJlIGRvbmUgaW4gYSBjbGVhbmVyIHdheS4NCg0KUmVnYXJkcywNClN1cmFq
IEthbmRwYWwNCg0KPiArCQkJcmV0dXJuIC1FRkFVTFQ7DQo+ICsJfQ0KPiArDQo+ICAJaWYgKG51
bV9mZW5jZXMpDQo+ICAJCWNvbXBsZXRlX3NpZ25hbGluZyhkZXYsIHN0YXRlLCBmZW5jZV9zdGF0
ZSwgbnVtX2ZlbmNlcywgIXJldCk7DQo+IA0KPiANCj4gLS0NCj4gMi4yNS4xDQoNCg==
