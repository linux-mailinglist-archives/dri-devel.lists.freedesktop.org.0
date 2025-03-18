Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C57A66D59
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 09:06:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9472410E44B;
	Tue, 18 Mar 2025 08:05:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TY94X0vm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1221C10E29E;
 Tue, 18 Mar 2025 08:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742285156; x=1773821156;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+UVcV3xAHhGCFnjBX225f6XFuckXEj6yFcSglgA8V/Y=;
 b=TY94X0vml0vkmloeUsE1uWZPmcsFYUSBeitYkObJQ54hGCVLhQrQRa9y
 b1NOrVEgPOmAXLjgDz72a+Wq9fXMYRdu51Zxp0hVK1OJoA7LYShLuktaR
 ZAAGhAGKotxAuE4cMfbgPKYPGbfkbbUamHQey9ez5fW46wsMxiw21gFhD
 6KAEqNcXLFL7DMRghMqA35HbF5Eu72xWICbMiMW2emGCke9JNlsCJcJY9
 2SmR7xGNgJY89PhjhMingVCojaLN3lTIOWYnwMoCBjXD9ulOoCKon06RN
 N326Gf/a++JGBCUyB8xWXjkvU4acL0r702TNKUW8+faSb0bJ3P2kv5NYd Q==;
X-CSE-ConnectionGUID: 04N793HUR/W3TZSehLsiug==
X-CSE-MsgGUID: WB0HYHCdT2ehS/YXpk53Kg==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="43293666"
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; d="scan'208";a="43293666"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2025 01:05:55 -0700
X-CSE-ConnectionGUID: Lfi0MTn0T9K932CciCee5A==
X-CSE-MsgGUID: xWroANUlQMatNn630YpXZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; d="scan'208";a="127218949"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2025 01:05:54 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 18 Mar 2025 01:05:55 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 18 Mar 2025 01:05:55 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 18 Mar 2025 01:05:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A4DVzHlNsUxpYUsPwPpYf90mhKcFUmtHT4qkFlr7OIeoyZJWoZDVVGFoLW7xM7PShAsxc9w/Hk2g2PNLyraqYilytUsba5yDYELhMNF5LgXQ9hpyy8ZNuFb8l+/a8iuDHI7JLRXNRLzmOgDh1NmY5d81LsLmVLwI+W0kjozBk5H2L7kn7Czpw1aw/JXW8GXNpk7u+RCxckXdQPoz2VGQtETqj9Zkz6wCvTf8YqD/ZYdgdSrrHFxqL9TACSwQPWJQvIs/1qysxIH3TFP7QfiSzAv6soWXQIc9BQcW2Y9GckQm9AQA/+LacA9t1Np1JiOgZlK8pXl7JH68hnWj53lwJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+UVcV3xAHhGCFnjBX225f6XFuckXEj6yFcSglgA8V/Y=;
 b=KNvy5GeFTudyFFvaJ/J01hiWzOUB7oSBVQIYg+41ko9Y6J63IGchvlCXNYrXCJ1eamhAD7oYA6cFDt+n0mr7KRH5UAXeS5dc6BNL11iYVGBhURQfxIMQRZP5hTrVyRt72pZakjABBz93K4E+DHp0L/fLIH4lVYPWX1GtAR4srg3zCB117eFCHWNkWqrbIJlRMOrqZj/dMMIoAT5XayzS2KdTzsQan4ABLCec4J2SW0J99vqyohG/xfYl8Jbj4eD7X6rKl2I3eQyPH4YXghRLgBe1MznCPGWCar2AVPOSl9Y206WThToLavKnGf6IHxstNFcdypp78sSWJjbreO8SLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by PH7PR11MB8527.namprd11.prod.outlook.com (2603:10b6:510:2ff::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Tue, 18 Mar
 2025 08:05:38 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.8534.031; Tue, 18 Mar 2025
 08:05:37 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Kumar, Naveen1" <naveen1.kumar@intel.com>
Subject: RE: [PATCH v8 1/3] drm/plane: Add new plane property IN_FORMATS_ASYNC
Thread-Topic: [PATCH v8 1/3] drm/plane: Add new plane property IN_FORMATS_ASYNC
Thread-Index: AQHbk1In8A+UiOMcokWcLjRErnYkHrN3RWcwgAFFqYCAAAXnYA==
Date: Tue, 18 Mar 2025 08:05:37 +0000
Message-ID: <SJ1PR11MB61291D2BB1BC3290C02E50FAB9DE2@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20250312-asyn-v8-0-0c4cbe5a066d@intel.com>
 <20250312-asyn-v8-1-0c4cbe5a066d@intel.com>
 <SJ1PR11MB61290E6675948DAD0634166FB9DF2@SJ1PR11MB6129.namprd11.prod.outlook.com>
 <IA0PR11MB73071AB13EFB8D67C94FD2A4BADE2@IA0PR11MB7307.namprd11.prod.outlook.com>
In-Reply-To: <IA0PR11MB73071AB13EFB8D67C94FD2A4BADE2@IA0PR11MB7307.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|PH7PR11MB8527:EE_
x-ms-office365-filtering-correlation-id: 8fb37fd9-c796-41ff-8d89-08dd65f3ab1f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?clVsNVZsV2JZVDZKRjFRZXg1TS8vT3hCdlF5Q21aSGROUHViZHZHN2FBR25Y?=
 =?utf-8?B?bmJoUkpRdENwRE9KQ21kVS9xdGhrT0dyRzVuVWxKL3VyQUFPZitlR04zVkJn?=
 =?utf-8?B?NlFSRk9kR2V0ZVJLSHJ5ZTNXamhFQUN0UXZ1ZjY3NFB5QUF6WXlqYUZITEN6?=
 =?utf-8?B?azg0Q2tmbUZKZTdOOWZ6TERHOHJ3eWVaMzdCZkU2V2ZvSWRySFFmL0V0Uldl?=
 =?utf-8?B?TVZ5UFE3L3JVOEZZM0duNXdNaHBpQXZzcTd2bEtMSVBxenplYzFEV2Z5dmZa?=
 =?utf-8?B?VFpCdWM4blJGNTJwTk9VazFVaWJTTDBFY0RwUk1rQXlwMGdZR29HOGJwUmFj?=
 =?utf-8?B?b2FOa040K1h2bkdTZkxNOVhwNlpnOFBDVnhMMDJudC9lRW9LZnFQWDBLcXlB?=
 =?utf-8?B?N3g4N3hKZHE1bG14MENwcEUwWklwU1pJTUFzRG42ck5QYkhBWWUySmFsYkNF?=
 =?utf-8?B?cnlUZGhkVVpaN2VKbGY0OUZhZ1RIQm9FT3dzRythVnJHQXY5Umc1dTBEVU0r?=
 =?utf-8?B?NGIySGtHbURHU1NEL2l1Vk0wZ3N6Tm14UFp2ZHY5dVVnekdnOUlEak95WUtH?=
 =?utf-8?B?c2pOZHN2RU5FNm9nc0dLNHpaVzdUOHhLaEtPMGhibHNMa3R2b3N2VVdwSHdP?=
 =?utf-8?B?VUpwYWs2SHFkTTVodFlWSnZRT1JTd2FtNUc1TURSR2YyVGRvLzJ2b1BTV3JW?=
 =?utf-8?B?Nmd5cjNKYWJOODBtM2dZT0ZCeDJ5dm9wSktSTEoyWk9YMkNETEdWVE9ZSmhz?=
 =?utf-8?B?SDZFN2pOK0RsSmplRnN0QW1SWEt3d3ZWSnE4M3EzanF3L0h6SFNkYzZ4dVBL?=
 =?utf-8?B?c1F3djdTUGMxN0tGb0EwalREVmw3NStCMFJFSGdwUUFZUkg4amtQb2V1cXdZ?=
 =?utf-8?B?TkM0Vnd3aDlFT3FCeE05MFk0ckpPTEl5MHRSM29zdUpZL1NBSFZTaWdLdGpE?=
 =?utf-8?B?K0dvYllEVGpFMzg0Y20rd3lxSTg5T1NkSnlsblJaUzY0anJJR2QrQitFL0RP?=
 =?utf-8?B?VUtYV3JNN2JmZ0NZN2hEMGZ3b1NWdHpBSUNGOVE0ZW5KT3pSU2FTam1YYWF3?=
 =?utf-8?B?OXNpc3cxK0JzVmcwU0pKZDRoMU5hZlh4c1V3TGJ3NTRFTjVHL1ZxK3g4K0VV?=
 =?utf-8?B?WllaMzNaSVE2MmtZUkVWUlFGcG5lSFFmc1dlNThQWTlYdFlLaGkrSGgxUHNh?=
 =?utf-8?B?aHVWOFJkcmxiU3JXdTJJOGl1bHVhMzgvbDdLeXZUN3RUYy9kWFB1NkdyV1h0?=
 =?utf-8?B?clBBb3cwRmFZUGM5bElDZDYzYldqenlQYTJxNGI3Vjc0TVhINzZjbWhJZERu?=
 =?utf-8?B?UWU1blY1WWJkK0llWGFheEhUQWkyTkt2d1gveFcwRHUwTlRSZmlOZ01kYTFO?=
 =?utf-8?B?TlBPRW5MQnNJczQrU2d2ZmFncUtJRzRLd2pFNDVkbEtqSG95YmRkRERzaTA5?=
 =?utf-8?B?aFZwamc2Y3FadHpOOGtBeGh2T3BuWnpTWTh3K0tZYWxrczR4WFp4SWh4ZGxq?=
 =?utf-8?B?aUxhZVVBL3ZTYmlIUDQ3VWFSR2lIbFBYZ2Z3UjFKN3hqTVJiQWp1eUdteDQ5?=
 =?utf-8?B?Y3FDQ3BhTXAyT1FOSmdkK1IzMmZPRHUxUHVLSlI3ODNGNWZBakwrb2ROcjNG?=
 =?utf-8?B?Sk16YjdkWG9LcWFIZVI3RW0wamZTVDFFM2t4Z0phU0ptcFBXTUswV2lIUU9q?=
 =?utf-8?B?STY5cHpIV0pSSXA0OWJJSjFIRXB5NUIzUUVHVUhlQlBnOHRSc3JJTXN2SFdy?=
 =?utf-8?B?cXJSR1ZEdEszdlRpWU8rd2tZZkRHK0VGcVFNNWxhZmZHbDFqYmpqenVaK1Vr?=
 =?utf-8?B?RUdpTTY4YmVFenQzanFZVnRNS3pwWlF0MnFlcFBja09ObFFjaytTSUM1SGlW?=
 =?utf-8?B?Uy90U2NlSDd1ZXNwN3IwR09aakgvajVZTzlWWkJDclpUcXc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?alEwSVJocTh2QkJ5YWtjMVlMYU5CSWQwbVNxUC9NdXpQVEVocHNuNTlsU2tj?=
 =?utf-8?B?Z2tBUTZ2ZDNOZnVtM3J6cXE5b29CdEYxK0wrS3NaZ3ErYkMya2dIank4R3Fo?=
 =?utf-8?B?UkVrdTR1ZWZLVFhTZ000RTRkbE9VM2ZtaGdwN3FObGxobjl0OHd1SEdyQm1i?=
 =?utf-8?B?SGVQK0l6dVpIS2JzMUxpeGJaQW9rY0prdmFFd1B1aGtIcGQrUWV3NWFjWWtx?=
 =?utf-8?B?SUk3RDNGZm0yVDBQNEo2SXpHaFdQOVovME1FMXNFOVM4Nk9YK0l5bCtwVWhx?=
 =?utf-8?B?OXVwaktRNXZ4K2pGSzRwZGdqRUhDUUdoc014N2ZoMlNEMHpQZ1BSdzZrVzIv?=
 =?utf-8?B?ZHM5UWtTRi8zQ05VOHVMMWZ3bzJpcER1cWEzcmNYR3NiWDc5cnlieUxMV0p4?=
 =?utf-8?B?Unk5MWRjakZmT0I0bHI0dFFGYlNsdFViNDArc25Lb1g5MG1jSFVaOTJ2eDVi?=
 =?utf-8?B?bHFoZEIrb01zZ1hTYlE4QS8zaHNnQ2xHZ0ZxUkZYNnhtSTh6WG0vNHo1dFR3?=
 =?utf-8?B?ZlluSDlxUDJDNXViMC9mbXQrakVuOUVlUndHYmZndU1RWEMxd1kraVRCMEh0?=
 =?utf-8?B?cTZTbERlRSszUzZRWnIvdmtGb0J2c281NEl2VzVZL3FCdldFSllZK3Q2cDdP?=
 =?utf-8?B?U2FZUkNKa0REcTRkZlBnV3JRa2tMRTRicHFMeXkrYmV3MEFuNmFCRE1sTVk1?=
 =?utf-8?B?ZnF3NHg4YU5BakdqdG9YOHdJK1RIRm9WMWJCQzNtZ280NUJRSXAvbjRTN3E3?=
 =?utf-8?B?Z2M5Q3h3QmMwNG1sS3htZ3QzNElTSW0zU244cHBLSTJXSU1sdkdvY3RndVBG?=
 =?utf-8?B?R3Y3c21IYjVVVThDS2E1Rk11R1FRbjl0dnU5SDFvdUtobDBLdDVkSlE4VHVP?=
 =?utf-8?B?dDJYSXdsdkVpdVRyR2NhN1NTckRLUHBrd28yMVFKSkduSjhHSEIwM0JiVUI0?=
 =?utf-8?B?WW43d1JyeDVnRVlGbHY0TDV0UCtoQ3JOQVp0b2RxTThOMHNiQVBoT2F6MHVV?=
 =?utf-8?B?RjU4SEFSRFk5MVdwd3FQR3A1aXFsUzZMWFBjUXpsM3dNb0FxN01VOVk1QVRm?=
 =?utf-8?B?T0RxTmVkV1oxamxzZmxRNEFJa0dDZWtOZ1lRTFM4MXFCS2ZtWVRNK1hIRk5Z?=
 =?utf-8?B?Zlp2U3BXbFB1NXRHc2JyWmFoWE9raGhENitSeHB2MnZJeTRWYkhuckxUT1NC?=
 =?utf-8?B?V0plTUxTQUZ4VVZqdjZGeVJqZ2RRZEdwY1krNVoxWUs1c0xtV3o3c3ZhYXVS?=
 =?utf-8?B?T0FxTUtGUlZwK25ZbEgwR0Q4ekpuWWlncTdhMDEyNDVNeHJKWnRDc1kvL3lT?=
 =?utf-8?B?QWpHajRjMGRYK3laNnduYncxZkoyT25ra2dWak9vMlVML0IyOUlRMldoZUNp?=
 =?utf-8?B?K0lkSjJIOTJzTWNUVU52WEwvcEdxT2toT1pVc2lzZFp6ME82OWRub1BhbGIw?=
 =?utf-8?B?RmRqWVIyN1h2WXZaWkV4QStQT3BpejFWVTladzhhT21xeXpLM2RCbVFOVWwz?=
 =?utf-8?B?emN1ZnNpT1UzTWo3Mzlyb25keU9VZzMxa2JsQmpqeElESjQ4RHBBaWJ2TFlk?=
 =?utf-8?B?VFNiRElmd1lLUW5xcHNoQmtGYlZ1blVmc05Dc01nU3NKeldVSVhWNHlobTQx?=
 =?utf-8?B?M1pVcHZLcmxkSzBkTHNaaGhtREhpVkx6YURuaTMyeGJCQXFGZWtiR3dYczg2?=
 =?utf-8?B?cEhqQTBpczdyRFg4Y2hYM00vTTNCaGJaZ0V4NEh5RTVtOW1tZENMZ0Q3Tzhx?=
 =?utf-8?B?Nkxjc3N2MStOaVprSlB5WUlkejhSb3RURnZrUlZwOXRJMC9KelY3ajVEZnR4?=
 =?utf-8?B?QitlMFU1Q0RLZG1Ua1QyT01mMlU1SnB6dTZkalVWenBHOGJDMEtpMzQ0WVo0?=
 =?utf-8?B?QXFiNFJCdVhqSCtPUW5nWUtyVk9Ka0dmOVZwU2N6dzNNckdBSU93VDZnbmFw?=
 =?utf-8?B?M3JDRm5rQWJOVG12OVhMMmFUQTlydEdPd0V0UkdGSThlbkd5MHk2N2lqYldK?=
 =?utf-8?B?UnFWWloweDFEOWlqeTZ4VzgxcVdRSGt6Y3N3SHdHMGpodmhTNS9ubGJOa3VP?=
 =?utf-8?B?clpYYXV1L2djYUx4Q0xyZ3FVQUtGd3phNVZYYWN5anp5MHZ2VTc4MlpoR2lx?=
 =?utf-8?B?cE81K2RhdHVGZkM1bzRVQjBZSTM3QkpZU2hYK04vcnJLeW1NRnc4SjVGNSs1?=
 =?utf-8?B?T3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fb37fd9-c796-41ff-8d89-08dd65f3ab1f
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2025 08:05:37.8863 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lM7jDpIOAharDp5+PVHho0R17GeBlWaOZbGmmXCe5eYKX/I6S7aIA6n1DhGjk5oW5Venv+AITulo5hQwV1Rhr7pbUW+P/AY3Bn16J/Dt7ps=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8527
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTXVydGh5LCBBcnVuIFIg
PGFydW4uci5tdXJ0aHlAaW50ZWwuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBNYXJjaCAxOCwgMjAy
NSAxOjA5IFBNDQo+IFRvOiBCb3JhaCwgQ2hhaXRhbnlhIEt1bWFyIDxjaGFpdGFueWEua3VtYXIu
Ym9yYWhAaW50ZWwuY29tPjsgZHJpLQ0KPiBkZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGlu
dGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGludGVsLQ0KPiB4ZUBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcNCj4gQ2M6IEt1bWFyLCBOYXZlZW4xIDxuYXZlZW4xLmt1bWFyQGludGVsLmNvbT4N
Cj4gU3ViamVjdDogUkU6IFtQQVRDSCB2OCAxLzNdIGRybS9wbGFuZTogQWRkIG5ldyBwbGFuZSBw
cm9wZXJ0eQ0KPiBJTl9GT1JNQVRTX0FTWU5DDQo+IA0KPiA+ID4gIAlibG9iID0gZHJtX3Byb3Bl
cnR5X2NyZWF0ZV9ibG9iKGRldiwgYmxvYl9zaXplLCBOVUxMKTsNCj4gPiA+ICAJaWYgKElTX0VS
UihibG9iKSkNCj4gPiA+IC0JCXJldHVybiAtMTsNCj4gPiA+ICsJCXJldHVybiBFUlJfUFRSKC0x
KTsNCj4gPg0KPiA+IFdlcmUgd2Ugc2VlaW5nIGFueSB3YXJuaW5ncyBiZWNhdXNlIG9mIHRoaXM/
DQo+ID4gSWYgYXQgYWxsIG5lZWRlZCwgaXQgc2hvdWxkIGJlIHBhcnQgb2YgdGhlIHNlY29uZCBw
YXRjaCBbMV0NCj4gPg0KPiA+IFJlZ2FyZHMNCj4gPg0KPiA+IENoYWl0YW55YQ0KPiA+DQo+ID4g
WzFdDQo+IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC82NDI3MTMvP3Nl
cmllcz0xNDA5MzUmcmV2PTgNCj4gPg0KPiBObyB3YXJuaW5nIGFzIHN1Y2gsIGFzIHBhcnQgb2Yg
cmV2aWV3IGZvdW5kIHRoaXMuDQo+IFN1cmUgd2lsbCBtb3ZlIGl0IHRvIHNlY29uZCBwYXRjaC4N
Cj4gDQoNCldpdGggdGhpcyBtb3ZlZCB0byB0aGUgc2Vjb25kIHBhdGNoLg0KDQpSZXZpZXdlZC1i
eTogQ2hhaXRhbnlhIEt1bWFyIEJvcmFoIDxjaGFpdGFueWEua3VtYXIuYm9yYWhAaW50ZWwuY29t
Pg0KDQo+IFRoYW5rcyBhbmQgUmVnYXJkcywNCj4gQXJ1biBSIE11cnRoeQ0KPiAtLS0tLS0tLS0t
LS0tLS0tLS0tDQo=
