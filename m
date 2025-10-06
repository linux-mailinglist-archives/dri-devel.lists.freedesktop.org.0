Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 701BBBBEFBB
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 20:36:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33E4410E321;
	Mon,  6 Oct 2025 18:36:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JcbcAk9W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63CDE10E321
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Oct 2025 18:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759775763; x=1791311763;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AGWk2VvvkDPbZX2dtqjaMSHlqFmAM/97VRKaISBDRZ4=;
 b=JcbcAk9WY8GxhHyudRQREImjxDs/eojEGNHexJViZC62DV30il0GBh+k
 aHm1a/+DaIEHJv7a38AQvmQK3o8kSbJVgBuur1834obuguOUti5RFfCwl
 ApgY7nMsfIwdtjG2alSai8t2JYUpB8ySwwzsVJhGSRcI4TxUv9eg/P6Gs
 I7JlZCOAmxF5Z0QvhNCfM2IeeueKByGk8UKFwRy+1qDjwmOh+JI3omvhE
 klUj+t6Zs3pKXjRZamo1NLPLSa/AQh6cwyBWx8b2otNrAHfWHOwT5PaXE
 6lVZayvptDxLDo7kGoaUsh4FMahr+xoiJOG4MjHYSIKaDeFbjZD0+JqJR g==;
X-CSE-ConnectionGUID: f6I5UOOoRh+JCtjyLvJAqA==
X-CSE-MsgGUID: W8rk4GQWRku0GqW/g/Pkwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="61997608"
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="61997608"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 11:36:03 -0700
X-CSE-ConnectionGUID: AF3HU9sXTAqj9yDpIfRaQg==
X-CSE-MsgGUID: sEiTSnpqTjKL6KZ2iwPpPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="180384124"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 11:36:02 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 11:36:02 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 6 Oct 2025 11:36:02 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.12) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 11:36:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UTjVOuMlbYQe2h4Mr07agUHvzJ6kqiwdJGoR7ms6PKYF1JVBHcUrWAY2dWX8r1pcX0RytoFq6RezoCdKd1S2Tw+OIir6xEj6InkreUXf55VE8dOr2nop5dNHF9tO38xFiDgUTsUo/okvGZzHqPntKnD6epK7QgozR5L/txRIO+LY5MLTeoje/Ay3O/hEB4ayCj8EVFjjmcDgGJImtKHhVOLi7FJZ3iU0ePJ2wTOUGZU5e+vZh1eFl52J2TgxIGHaWnJBJSOzm/PmnD3nt1Nzm2woCVrlfMmimEF0V74qxTKowFTLwrCOBT/qq24C0uKBrxCs58VDeGUCn1RZ8yYHWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AGWk2VvvkDPbZX2dtqjaMSHlqFmAM/97VRKaISBDRZ4=;
 b=LORKm3Gx4s38GJkVxLCt0mY4oDrskwWI1nqVdqTV0UHMpliDgcv9uNaxJJfyurTwwDDLhPidnr59G0p5iwCl7Zo68tVtQ+UNj/JZ2ko1B3DRMp8E71g5RzsTTJoBqHxBiDO2rDQLmMr0WJyvR9J+f0pxeBd5KYd9RFycPhF71V+VL99JScPkIYH7vds+uITEf0UqRBhJma5giomsktwCV/w/PYqHDMLx/0Ae2WBeHzrQM+isz9vCY4sbkFSTwvF5A40ShQFLMUH4skyNUcfzXIms+p2TZkHgNxPSLOZcpDIoZunsFOxtjbx2W1299KQLy1SBcn7sTTj9CninCKiO4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5112.namprd11.prod.outlook.com (2603:10b6:510:3b::18)
 by SA1PR11MB5780.namprd11.prod.outlook.com (2603:10b6:806:233::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.16; Mon, 6 Oct
 2025 18:35:53 +0000
Received: from PH0PR11MB5112.namprd11.prod.outlook.com
 ([fe80::b6b7:41ec:7dc8:773]) by PH0PR11MB5112.namprd11.prod.outlook.com
 ([fe80::b6b7:41ec:7dc8:773%6]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 18:35:53 +0000
From: "Kim, Dongwon" <dongwon.kim@intel.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "nirmoyd@nvidia.com" <nirmoyd@nvidia.com>
Subject: RE: [PATCH v5 2/3] drm/virtio: Add support for saving and restoring
 virtio_gpu_objects
Thread-Topic: [PATCH v5 2/3] drm/virtio: Add support for saving and restoring
 virtio_gpu_objects
Thread-Index: AQHcNHWvB6idhqOgWU+kU1kBCRCfnbSwoivwgAAU/QCAAAVTMIAEdXYAgAA/3bA=
Date: Mon, 6 Oct 2025 18:35:53 +0000
Message-ID: <PH0PR11MB511295459D829356E4416957FAE3A@PH0PR11MB5112.namprd11.prod.outlook.com>
References: <20251003053402.732218-1-dongwon.kim@intel.com>
 <20251003053402.732218-3-dongwon.kim@intel.com>
 <059d3074-dc1f-47cf-9bdd-ca582e150511@collabora.com>
 <PH0PR11MB51125B8A88CBFAE48E7BDC62FAE4A@PH0PR11MB5112.namprd11.prod.outlook.com>
 <ef77d1e3-adea-4120-a23f-b2925ca23b38@collabora.com>
 <PH0PR11MB5112BF73084A79F3F0E785F6FAE4A@PH0PR11MB5112.namprd11.prod.outlook.com>
 <0fef25c6-c423-4d00-bbca-1744c2305afb@collabora.com>
In-Reply-To: <0fef25c6-c423-4d00-bbca-1744c2305afb@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5112:EE_|SA1PR11MB5780:EE_
x-ms-office365-filtering-correlation-id: a5e182d1-ec45-4cf4-ddcc-08de05072e70
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?L0RzcjlEL3g5cm1jOEQya3RCZFpUR1JRSnFFUWNNNFlyeG9Cb2I3U0tqSURk?=
 =?utf-8?B?eFdDQUhpTlJYcGtzOVVEZ2NyWS9FWDV1SUFrdFFlaVBtaUJEMkx6c3k4MGNH?=
 =?utf-8?B?SWdyR0pzUzNRTk44U2N6Yzk1U1RJNmlPdVVJVSticTZUbDhlOTM1TWoxcFZS?=
 =?utf-8?B?Q2VraElXbU9uUDNJbFRkLzhaOVdLWU8xb3c4aW1LN3k5dnBsdEZQMWRkaTBz?=
 =?utf-8?B?R3hxcTBFS1BPUGwxNnpZbGY5TGZ6N1F4VEhBMHk5NW5wMURaNS9JL0Y0anpk?=
 =?utf-8?B?ZGdETGovSnVCeVJsVTFHOTVyZjlseFZuUFk3V3NHbFFpaHQ1R2dyQ0lxcWM4?=
 =?utf-8?B?UE1LNHo2bHlPREtub0RKbVFibnEvRjAxaTlHOVJDOGdzQnlaMTg1a3ljeE9B?=
 =?utf-8?B?S2I0TU5VRTZ4Zm9HNmZtNi8rdldHbmJ5cUtsL2pVU0J5bXU0YUZKZ2ZqcFBL?=
 =?utf-8?B?MTBleVpZK1M4YU1jU2pXakdFNUJSY3lEQkxoNElTRlJBK2tDM2swNlRvTmhL?=
 =?utf-8?B?NHJLU1RxQms3WjZwemNkbUhuZWg4VmI4ZGFWaWtYUXZucWl0ajMyOFV3YXZO?=
 =?utf-8?B?LzNQdVpYeEJYZU5XK2FBeUVvUUJRNjJhQUpGdkFlZUtCL1FhZzRnRktQMUhl?=
 =?utf-8?B?dnV1QmlqLy9kMElPTHRvK1phM3VDd1JydytKczdJdG9RQVFBOUY4OHNYRnRO?=
 =?utf-8?B?ZkZJeE8zYnE0MGF3Rkk0cGJ1bmwzRkRGL1B4UVRZV240WUxRbk9zTHd2WCtH?=
 =?utf-8?B?RGdjcTFmMkU5SWRQcUdqRG54SHRWblE0UklsUUg4d2N2OGlUMnluWUdOV0VT?=
 =?utf-8?B?Y2trRkwzL28yQWZyNVBiaDdrTnVRblFKK091cTIxZk1MQzFvUXdrclc3VGdF?=
 =?utf-8?B?VlpLTUo0eU42MUZ0d2o2ejZDZm04MWVZY1Q1YzJNWm02cHh4TmMzUXpEWGla?=
 =?utf-8?B?RHNmdWJaMUNQbE4wQTNvNFpvQmJENUZVTUFlZ2hOdWgxK2wxWXVsTVBBajc1?=
 =?utf-8?B?NldaV1YzVFQ2c0ZaYlNORlpTRUhxMlE4N2k0UFkrMkJGMFlCV3ZON05rZklw?=
 =?utf-8?B?WGhHOUpsbksxTjJkcGtDTVlVa1daMHp6enVKSjlKcCtjcEgrWVl4cjA4cU1v?=
 =?utf-8?B?M1pyVldKRitMWmlyaGFnQTlucXRQekU2RW9WakpVRXVVaUZaaFR1YngyUCtw?=
 =?utf-8?B?M3pKYWdqbTNlaERxTkVHR0E3ZmV3ZGdkWmpnWVQzM1UyalZiczdjZTFDbStN?=
 =?utf-8?B?b3hqdVhBTWk2L1Z0UXVGRjk1SG9DdUgwK2hZcnBoMElzNWhkdVkwN0VpZFBr?=
 =?utf-8?B?cFJQS1ZQQ29odHBsSmxMZ0RLSGxmNWNucUJGSDVUeThodVN1dkJra1lTL1Nh?=
 =?utf-8?B?aTRjS0h1SkdCQW9aVDJkQ0lqeDdTZWZmc0RNR2w4TmdrWktwR2ZEZHJyQWVY?=
 =?utf-8?B?RWdWRHFWVmtPQ0k1M2ZycjJ6QlBBRC9GWkkycTJPK1lvd3FXVzJxTFJZa1M4?=
 =?utf-8?B?T2tpZXVpSVljYUJacjlEZ3lMWm5DR2JvNm1LOVJSRFBxYXA5Zm51M1c3MzhO?=
 =?utf-8?B?RE1VK2hMV1ZBV0QyQWViZ3ZPZ1hzOGlBc1Z0UGxsWWV5ZytkenEvUWVuSDl2?=
 =?utf-8?B?Y0lEZ3l3TnRsNUpmUHBaYmxvRUxLUzAyejRaOVBxYWlBSkQ5bng5V0pkUTUv?=
 =?utf-8?B?Y2RjQUlBbWIzRGJpdWN0L2tkenRiTFgrelM4WFRkZFVXUVNuQnlQQXpJbXpo?=
 =?utf-8?B?Q25SdzQ2VWtKMGYzWmdFR3ZOaWpiNmppcmRqc25yR3M1eC92bXN1c0VvaVRF?=
 =?utf-8?B?cWRsQWttVUJVLytud0xxTkxobEoveFkyOENHTXc0cXNseU1pVmpuWXVUcGl1?=
 =?utf-8?B?eWMxNzVsS1BwYks3bC9vdURsLzcwTmZhRXVWT2ZGSURXQ0hRTmVyL21MaDZo?=
 =?utf-8?B?YTNXUVRLbGVPMTdJNWdDTk54eFkzbCtvbTcwTmlpa1NrYk15VVNBNlZYN0pJ?=
 =?utf-8?B?aGNaM09BVnpsUXRnaHhwUUFlWE0zSDdPeTcwcVNLek1iMFpYT1ZtK1EwM0pI?=
 =?utf-8?Q?wKfHSu?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5112.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NEgyUXV6Y3ZBbXFYVHlneE9YZFBYcmlFcWk0aEI5RDAzbjR2MGRWRlNlWE9C?=
 =?utf-8?B?T1VRRmtkUlNTODlMTm43NklKcUpaSnhOWUljVXE3VjJBYXdZalZ3c2dxL3BY?=
 =?utf-8?B?ZlJ4TGF4d3U3SEwrdkF3ang1RXY5VzlGMVIyWUpYQjdaNDZCMEdkMXpYZ2Ex?=
 =?utf-8?B?L2NEeGZ1ZTdKcFZNRzlZT2Nyem0wUG5OU1oyMzhIZFJNbHZXUEd3MXRpQkdi?=
 =?utf-8?B?WXRVeTNsVVJ2d3FHSXlnYkZ3NFRMVGUyQUJSZ3N0S2tCWWc1RnFJYy9IUVJT?=
 =?utf-8?B?SlIvSG9wY21kRWlLSS9DQjNZLzBZY2pYcmxvNFhhbFE4Y1ZLSUxYd2RxZ0xv?=
 =?utf-8?B?cnN5cGZIVDV5UUhQVlV0YlExMDZEdVBOcE91SzhxYTJvODZKQnloMTRqaDBv?=
 =?utf-8?B?ZkhHT1B2aGdrNXJpd3lEemZaY25xQjdmQUw0Uko5eXFBQy8yb3RWdHlHREY5?=
 =?utf-8?B?c1NyRGZjOVQrVnFIZjRVQnM0RjBIZzZHVVdrWW50Z0ZpRi9mMDQ3ZTFDUU00?=
 =?utf-8?B?eGJDWHZZbW5RZ0FMRncxclhiT2NyRERwbVRZeDVCZ01NVmU0TGF4UGpSNDVD?=
 =?utf-8?B?NUlVamlSWG95Ym1EUkk3dXk4U0YzWks1ZWtyd3hlZHJhSFlsVHZXUVpNUjRq?=
 =?utf-8?B?UEFPVHBELzVkNGpLM2k0VEhvWXp0QWJmR2lUNzJjZHNPOWZ3blZzZlltNEc3?=
 =?utf-8?B?QmJXVnBtV2ZvSjQwQ25YeWpKcnUxc2NPV09iOVVJQ0N0YW1rNW94OGlZeHU2?=
 =?utf-8?B?aHpUM1RORzV6YWVla2FEdTY3WDFyeTZJTFhrWmZjN250bEpSVjZOKzZaamVC?=
 =?utf-8?B?a25tZW8vMjNta2NabVZNaVFiZjI2Wm9wcU00SG1sYXhjRyt6aTF2QW96bmpM?=
 =?utf-8?B?NTNVdU9Ja3g0Y1pCZ29XWWRSdVdvUDRMNTdYZ0dhN09PNWc0YURyby9YdVpE?=
 =?utf-8?B?KytCMFArWGRuc2RtbUNYMTVRSEtUU3hZU3lnbE9sTEtvU2kyUHJ6QkI2MC9X?=
 =?utf-8?B?YVFiTzRqNVh0ZXVxT0VmUmZWZThXOTJ6eTdLdDJqVStyMlVHQlFHV3VXK1BW?=
 =?utf-8?B?dHl0REdoTTZXeUMwbTlpb2VDZ2FWM052ek01aXdZamxpVFJYeDMxM0QyTENq?=
 =?utf-8?B?THZtOW85WENPMm5mOHZKeVh3NTdDUlpwSzFlTElSKzZSby9iRHFRcXdPeVN5?=
 =?utf-8?B?Z2t3Tyt5bitTNGE1ZlZQcVI0TXFNd0FPLzI1UHlnby8zazRnTjJlczIxNWdX?=
 =?utf-8?B?WTRleHI0VTE3TlRLa2o3ZHI4RHhBSzVrOW1oNzg2RE9LM1V4SnovTmJKa2po?=
 =?utf-8?B?Yjl4YlRsZjU2TEw5UUhQaDhGSTlUTXNZNGFCOGVpdXhKUXAreS9GcEZTaDc0?=
 =?utf-8?B?S0c5Ykt6cG9Land3ZG1aOVpaM0Zya2svdGdTa1lXRVFQWGlLRW1FVnFGQXRt?=
 =?utf-8?B?MGFkMTFYRllPNisrWlloRXlkdU0rQWEyeEI0OTlnTk9EUUV0RFRPZ1hCaklW?=
 =?utf-8?B?N1dKWTYxZkY5cU0xTk8zUmgySXFPbXdkU1RqY3pCREpkN3p2V25YNW5NTmM0?=
 =?utf-8?B?Y1hhbWZOVUpVUWdQZ2ZRNllZbWtmUTdyb2VmVVZ2Y2tHL0NueVFsdmM5WklC?=
 =?utf-8?B?aFBJd1Rua09rRlg4S1JUaE1aaHp0Qlg5VXBQSXptVXJXTDFybzBpUDNhdG5a?=
 =?utf-8?B?ZHNRWDhRS2plK1RyeXplaHllTHVLTGtrRzZHTW5jV2l5YXJqMkd4TGd3N1Jr?=
 =?utf-8?B?MnRQQ29aSTIycHpvK2tVN1hJQUIvUThuV1haVERXNldwVzRVOGM5Si9Xd1Yr?=
 =?utf-8?B?TzJpRlM4UlFHK1hhK0NWdy9LeDNzVWg2QUNkRFZZWEVvVFdac2Y1dEFMTFQx?=
 =?utf-8?B?Zk1OSlhBNW5VeXNNc0ZLSDh2enBjeEFRSFdlSDl2dUpFdUl3MmxnWlJSVzlT?=
 =?utf-8?B?SEZuTjU1a05Bc0ZLcDFsdERwMkMwQ29BYklGTzg5dG1MQThkbkd6UCszSmR5?=
 =?utf-8?B?ZGU0M29VNlJpZEsra0I3M0ZadVhhR3Fxcyt5dXhwZUlod3czWGI3eEtSUHF3?=
 =?utf-8?B?OHhQS1pvTHh5UXJQN25HSkl4enBXYUlBN1BNUzV4UStBNU0rdCtqSVg1SUJQ?=
 =?utf-8?Q?IbmR/UqoVPgPs7EU0jGFmayLz?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5112.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5e182d1-ec45-4cf4-ddcc-08de05072e70
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2025 18:35:53.5110 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RZSA5HpEZwqQOn4JjnWZwgKMBY2YYpNdshBwE3iNBW9HVb2gwV3HjS187AqrSHqBRAKha129qeEoCI8Gf+XWTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5780
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

SGkgRG1pdHJ5LA0KDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjUgMi8zXSBkcm0vdmlydGlvOiBB
ZGQgc3VwcG9ydCBmb3Igc2F2aW5nIGFuZCByZXN0b3JpbmcNCj4gdmlydGlvX2dwdV9vYmplY3Rz
DQo+IA0KPiBPbiAxMC8zLzI1IDIxOjU5LCBLaW0sIERvbmd3b24gd3JvdGU6DQo+ID4gSGkgRG1p
dHJ5LA0KPiA+DQo+ID4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjUgMi8zXSBkcm0vdmlydGlvOiBB
ZGQgc3VwcG9ydCBmb3Igc2F2aW5nIGFuZA0KPiA+PiByZXN0b3JpbmcgdmlydGlvX2dwdV9vYmpl
Y3RzDQo+ID4+DQo+ID4+IE9uIDEwLzMvMjUgMjA6MDEsIEtpbSwgRG9uZ3dvbiB3cm90ZToNCj4g
Pj4+IEhpIERtaXRyeSwNCj4gPj4+DQo+ID4+Pj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NSAyLzNd
IGRybS92aXJ0aW86IEFkZCBzdXBwb3J0IGZvciBzYXZpbmcgYW5kDQo+ID4+Pj4gcmVzdG9yaW5n
IHZpcnRpb19ncHVfb2JqZWN0cw0KPiA+Pj4+DQo+ID4+Pj4gT24gMTAvMy8yNSAwODozNCwgZG9u
Z3dvbi5raW1AaW50ZWwuY29tIHdyb3RlOg0KPiA+Pj4+PiAraW50IHZpcnRpb19ncHVfb2JqZWN0
X3Jlc3RvcmVfYWxsKHN0cnVjdCB2aXJ0aW9fZ3B1X2RldmljZSAqdmdkZXYpIHsNCj4gPj4+Pj4g
KwlzdHJ1Y3QgdmlydGlvX2dwdV9vYmplY3QgKmJvLCAqdG1wOw0KPiA+Pj4+PiArCXN0cnVjdCB2
aXJ0aW9fZ3B1X21lbV9lbnRyeSAqZW50czsNCj4gPj4+Pj4gKwl1bnNpZ25lZCBpbnQgbmVudHM7
DQo+ID4+Pj4+ICsJaW50IHJldCA9IDA7DQo+ID4+Pj4+ICsNCj4gPj4+Pj4gKwlzcGluX2xvY2so
JnZnZGV2LT5vYmpfcmVzdG9yZV9sb2NrKTsNCj4gPj4+Pj4gKwlsaXN0X2Zvcl9lYWNoX2VudHJ5
X3NhZmUoYm8sIHRtcCwgJnZnZGV2LT5vYmpfcmVzdG9yZV9saXN0LCBsaXN0KSB7DQo+ID4+Pj4+
ICsJCXJldCA9IHZpcnRpb19ncHVfb2JqZWN0X3NobWVtX2luaXQodmdkZXYsIGJvLCAmZW50cywg
Jm5lbnRzKTsNCj4gPj4+Pj4gKwkJaWYgKHJldCkNCj4gPj4+Pj4gKwkJCWJyZWFrOw0KPiA+Pj4+
PiArDQo+ID4+Pj4+ICsJCWlmIChiby0+cGFyYW1zLmJsb2IpIHsNCj4gPj4+Pj4gKwkJCXZpcnRp
b19ncHVfY21kX3Jlc291cmNlX2NyZWF0ZV9ibG9iKHZnZGV2LCBibywgJmJvLQ0KPiA+Pj4+PiBw
YXJhbXMsDQo+ID4+Pj4+ICsJCQkJCQkJICAgIGVudHMsIG5lbnRzKTsNCj4gPj4+Pj4gKwkJfSBl
bHNlIGlmIChiby0+cGFyYW1zLnZpcmdsKSB7DQo+ID4+Pj4+ICsJCQl2aXJ0aW9fZ3B1X2NtZF9y
ZXNvdXJjZV9jcmVhdGVfM2QodmdkZXYsIGJvLCAmYm8tDQo+ID4+Pj4+IHBhcmFtcywNCj4gPj4+
Pj4gKwkJCQkJCQkgIE5VTEwsIE5VTEwpOw0KPiA+Pj4+PiArDQo+ID4+Pj4+ICsJCQlpZiAoYm8t
PmF0dGFjaGVkKSB7DQo+ID4+Pj4+ICsJCQkJYm8tPmF0dGFjaGVkID0gZmFsc2U7DQo+ID4+Pj4+
ICsJCQkJdmlydGlvX2dwdV9vYmplY3RfYXR0YWNoKHZnZGV2LCBibywgZW50cywNCj4gPj4+PiBu
ZW50cyk7DQo+ID4+Pj4+ICsJCQl9DQo+ID4+Pj4+ICsJCX0gZWxzZSB7DQo+ID4+Pj4NCj4gPj4+
PiBObyBuZWVkIHRvIHJlc3RvcmUgYmxvYiBhbmQgM2QgcmVzb3VyY2VzIHRoYXQgd2UgZG9uJ3Qg
c3VwcG9ydA0KPiA+Pj4+IHJlc3RvcmUgb2YgYW5kIHRoYXQgd29uJ3QgYmUgaW4gdGhlIG9ial9y
ZXN0b3JlX2xpc3Qgc2luY2Ugb25seQ0KPiA+Pj4+IHNobWVtIG9ianMgYXJlIGFkZGVkIHRvIHRo
ZSBsaXN0Lg0KPiA+Pj4+DQo+ID4+Pg0KPiA+Pj4gV2UgYXJlIHZlcnkgaW50ZXJlc3RlZCBpbiBy
ZXN0b3JhdGlvbiBvZiBibG9iIGFzIHdlbGwuIEl0IGlzDQo+ID4+PiBhY3R1YWxseSB0aGUgcHJp
bWFyeSB0eXBlIG9mIHJlc291cmNlIHdlIHdhbnQgdG8gcmVjb3ZlciBiZWNhdXNlDQo+ID4+PiB0
aG9zZSBhcmUgdXNlZCBhcyBndWVzdCBmcmFtZSBidWZmZXIgd2UgcmVuZGVyIGluIFFFTVUuICBD
YW4geW91DQo+ID4+PiB0ZWxsIG1lIHdoeSBpdCBzaG91bGQgYmUgZXhjbHVkZWQ/IFdvdWxkIGl0
IGJlIGJlY2F1c2Ugb2YgYW1iaWd1aXR5DQo+ID4+PiBvZiB0aGUgbG9jYXRpb24gb2YNCj4gPj4g
YmFja2luZyBwYWdlcyBmb3IgaXQgKGUuZy4gVlJBTSk/DQo+ID4+Pg0KPiA+Pj4gQW5kIDNEIGlz
IG5vdCBvdXIgcHJpbWFyeSBpbnRlcmVzdCBzbyBJIGRvbid0IGhhdmUgYW55IGlzc3VlDQo+ID4+
PiBleGNsdWRpbmcgaXQgYnV0IGl0IHdvdWxkIGJlIGdyZWF0IGlmIHlvdSBjYW4gZXhwbGFpbiB0
aGUgcmVhc29uIGZvciBpdCBhcyB3ZWxsLg0KPiA+Pj4NCj4gPj4+IFRoYW5rcyENCj4gPj4NCj4g
Pj4gR29vZCBwb2ludCwgb25seSBob3N0IGJsb2JzIHNob3VsZCBiZSBleGNsdWRlZC4gV2UgY2Fu
J3QgcmVzdG9yZSBWUkFNDQo+ID4+IG9uIHJlc3VtZSBhcyBob3N0bWVtIGlzIGxvc3Qgb24gaG9z
dCBzaWRlIGFmdGVyIGVudGVyaW5nIFM0Lg0KPiA+Pg0KPiA+PiBBY3R1YWxseSwgbm93IEkgZG9u
J3Qgc2VlIHdoZXJlIGltcG9ydGVkIGRtYWJ1ZiBndWVzdCBibG9iIGFkZGVkIHRvDQo+ID4+IHRo
ZSByZXN0b3JlX2xpc3QgaW4gdmlydGdwdV9kbWFfYnVmX2luaXRfb2JqKCkuIFBsZWFzZSBtYWtl
IHN1cmUNCj4gPj4gcmVzdG9yaW5nIGd1ZXN0IGJsb2JzIHRlc3RlZCBwcm9wZXJseS4NCj4gPg0K
PiA+IFJpZ2h0LCB5b3UgZ290IHNvbWUgY3JpdGljYWwgcG9pbnQgdGhlcmUuLiBJIGZvcmdvdCBh
Ym91dCB0aGlzIG9iamVjdCB3aXRoDQo+IGltcG9ydGVkIGRtYWJ1Zi4NCj4gPiBXZSB3aWxsIGhh
dmUgdG8gc3RvcmUgdGhlIGNhc2UgdmlydGlvX2dwdV9vYmplY3RzIGJhY2tlZCBieSBpbXBvcnRl
ZA0KPiA+IGRtYWJ1ZiBhcyB3ZWxsIGluIGNhc2UgdGhlIGJhY2tpbmcgc3RvcmFnZSBpcyBzdGls
bCB2YWxpZC4gQnkgdGhlIHdheSwNCj4gPiBzbyBmYXIgd2UgYXJlIG5vdCB1c2luZyBpbXBvcnRl
ZCBidWZmZXIgYXMgYSBndWVzdCBmcmFtZWJ1ZmZlci4gQWxsDQo+ID4gc2Nhbm91dHMgYXJlIG9y
aWdpbmF0ZWQgZnJvbSB2aXJ0aW9fZ3B1IGl0c2VsZiwgd2hpY2ggd291bGQgYmUgdGhlIHJlYXNv
biBpdA0KPiBoYXMgd29ya2VkIHNvIGZhci4NCj4gPg0KPiA+IEFueWhvdywgbm8gbWF0dGVyIHdo
ZXRoZXIgaXQncyBpbXBvcnRlZCBvciBjcmVhdGVkIGJ5IHZpcnRpby1ncHUNCj4gPiBkcml2ZXIs
IEkgZ3Vlc3Mgc3RvcmluZyBvbmx5IGJsb2JzIHdpdGggYm8tPmF0dGFjaGVkPXRydWUgd291bGQg
YmUNCj4gPiBlbm91Z2ggYXNzdW1pbmcgaG9zdCBibG9iIGRvZXNuJ3QgaGF2ZSBhbnkgYmFja2lu
ZyBwYWdlcy4gV2hhdCBkbyB5b3UNCj4gdGhpbms/DQo+ID4gKEkgd2lsbCBhbHNvIG1vZGlmeSB0
aGUgY29kZSB0byBzdG9yZSBvYmplY3RzIGJhY2tlZCBieSBpbXBvcnRlZCBkbWFidWYuKQ0KPiAN
Cj4gVGhlIGJvLT5hdHRhY2hlZCBvbmx5IG1lYW5zIHdoZXRoZXIgcGFnZXMgYXJlIGF0dGFjaGVk
IHRvIHNobWVtIEJPIG9uDQo+IGhvc3QgYXQgdGhlIG1vbWVudC4NCj4gDQo+IFRoZSB3aG9sZSBz
dGF0ZSBzaG91bGQgYmUgcmVzdG9yZWQgb24gcmVzdW1lIC0gYWxsIHNobWVtIEJPcyByZS1jcmVh
dGVkIGFuZA0KPiBwYWdlcyBhdHRhY2hlZCB0byB0aGVtIHdoZW4gYm8tPmF0dGFjaGVkPXRydWUu
DQoNCkdvdCBpdC4gQnkgdGhlIHdheSwgcmVnYXJkaW5nIGV4Y2x1c2lvbiBvZiBob3N0IGJsb2Is
IEkgZ3Vlc3MgeW91IG1lYW50IG9ubHkgYmxvYnMgd2l0aA0KIiFndWVzdF9ibG9iICYmIGhvc3Qz
ZF9ibG9iIi4gSWYgdGhhdCBpcyB0aGUgY2FzZSwgaXQgaXMgYXV0b21hdGljYWxseSBleGNsdWRl
ZCBhcyANCnZpcnRpb19ncHVfb2JqZWN0X2NyZWF0ZSBpcyBub3QgZXZlbiBjYWxsZWQuIE9yIGRp
ZCB5b3UgYWxzbyBtZWFuIGJsb2JzIHdpdGggYm90aCANCmZsYWdzIC0gaG9zdDNkX2Jsb2IgYW5k
IGd1ZXN0X2Jsb2Igc2V0IHNob3VsZCBhbHNvIGJlIGV4Y2x1ZGVkPw0KDQo+IA0KPiAtLQ0KPiBC
ZXN0IHJlZ2FyZHMsDQo+IERtaXRyeQ0K
