Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0449D5AF7
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 09:19:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0423C10EAEF;
	Fri, 22 Nov 2024 08:19:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JUrGwHQe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C02910EAED;
 Fri, 22 Nov 2024 08:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732263560; x=1763799560;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4Q4PnWJ/gIflmVsvKBrOrGwfO1E+sqo2eIqiQ89ys0w=;
 b=JUrGwHQeIRaV6goIObt9GgQfblS670mdAt7YcSFu+1CpvkkeloprrEZm
 pGj1EL7o3GFnuo9E1Zbj41FoVFNPQO3RxUio0LeUXbDXeAdbDaPV4bLHS
 bC5mNh3WRVXmSRjKxmARtgnpmD01abOuM9yY6HDOZDYEpNrS4DKU8y9ag
 5wechicEXnCnoaOWZX5sEy3pyDYnBODjF+d1OV6lv9uX8s+wjOx0c29em
 UQ6qUK3pXQuVXNfqszRA09cNBXKlvstGl9NyZHWLigAeDnWKW10AEUH2o
 OtKxnKwQsmRTLzy4trK5XjhS0oxJOzYzWajcTRSXOBLGArDtX85F7thQI g==;
X-CSE-ConnectionGUID: WgDx7iEqQH+V4tcoWbMcfA==
X-CSE-MsgGUID: B4GT+/c4TgKrpVnfuqf7hQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="42922558"
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; d="scan'208";a="42922558"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2024 00:19:19 -0800
X-CSE-ConnectionGUID: zJyKRnfCRn6ReBPSrQXjDA==
X-CSE-MsgGUID: tfQqjYxiTiWfAJtsau3zJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; d="scan'208";a="94953207"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Nov 2024 00:19:19 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 22 Nov 2024 00:19:18 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 22 Nov 2024 00:19:18 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 22 Nov 2024 00:19:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NM2p655I/A55SYv6Ypp9cK7e7BOJgCgNnHLpw6nXH8gy7sFy/QZiiPOsOC2K9LQuDYw1ccrnshSl3aBiqEfCBwKy92ne43ZjiFRu4TPJYGVb88wbftdufztmp9zUhn56qUQxSEt9j0UsvNUvUCNpTpm9WSkEVrXbqWlx9ln6RYjMd8kz7JihR7V2WQHYwB0CrJNVEpk1HYYSTkFdj26ajUnCPM3rUD5m7VYqRqe4edEXEWGX+K1f/35GQAC0xcFPV1pjfkunzGYJD7g1qKFwrK4JpZ0Wt8l3AfIsf2XruBCSyO9qXDcoh9ACW+6EGQG840T0WiSXmlcwKfWh9v8HnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Q4PnWJ/gIflmVsvKBrOrGwfO1E+sqo2eIqiQ89ys0w=;
 b=n/yoXsWmP5wJV3MD3jVLta3e4076wVmbmXe9Tl1SUQaKbK0WreAxVh606fAVTMIr9OV8wdme9cFz/Mf28DpRs3gE2DboI6cxjDAPKr3m0jA8sDluPEjJU2xL87okIh5iOve+BKiaL2bHw+SjN4Jj4Sq09t8scHEPkxd3LFzZvvqE45Ovd+FikGMu3kUjIurNL0imd9yYvFtv4HpWXMcpPl+jmpZCivCmPZOWgmrmsgTeRnB726UbXZj0UQ1iHKwJy33r/CXaRE19q8jWA5cxoNp2KXwGzmOPGlX7QcFuN/PE1abqse0qk02O69dOhQ2hIQYqm28x/SfjOPcuNz1PrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by CY5PR11MB6390.namprd11.prod.outlook.com (2603:10b6:930:39::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.15; Fri, 22 Nov
 2024 08:19:16 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%4]) with mapi id 15.20.8093.027; Fri, 22 Nov 2024
 08:19:16 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCHv6 5/8] drm/i915/histogram: Add crtc properties for global
 histogram
Thread-Topic: [PATCHv6 5/8] drm/i915/histogram: Add crtc properties for global
 histogram
Thread-Index: AQHbPBHyjJ9QkG83RUayJ5zlEgjYXrLCXeuAgABWSxCAAD86AIAAArSA
Date: Fri, 22 Nov 2024 08:19:16 +0000
Message-ID: <IA0PR11MB73079C28423B2DF134784310BA232@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20241121122603.736267-1-arun.r.murthy@intel.com>
 <20241121122603.736267-6-arun.r.murthy@intel.com>
 <thqbnbw2yiqbfya7bh2izzf5qwr6fkir5m5luqkrhqj6vnltad@w2562fgo75g5>
 <IA0PR11MB730794BF402FC82BA5FEC1D4BA232@IA0PR11MB7307.namprd11.prod.outlook.com>
 <CAA8EJppXwCaYH9dNjTq7B0M5XF7p7VECHZH3=Fq-7fUuf7T++w@mail.gmail.com>
In-Reply-To: <CAA8EJppXwCaYH9dNjTq7B0M5XF7p7VECHZH3=Fq-7fUuf7T++w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|CY5PR11MB6390:EE_
x-ms-office365-filtering-correlation-id: 6524d83b-b717-4934-7b1c-08dd0ace5b10
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|10070799003|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?dGcrL0JZQVpNcDJxUlp1RlY4bm5sRk14U1FOVE9tb250R1NJbmtFL2djSUpv?=
 =?utf-8?B?OHdLOHduR2JyRHJUWmF5aFBWYkIxZWFzNWI3QkxxaW8vODVYZlM0VElsQm1k?=
 =?utf-8?B?YzRFaDFiRnA3Um9Dd2MxMExETGtvcWpmcXhyRkNrQVVXeXVtdDFTOHd3VDRz?=
 =?utf-8?B?KzRTY2pibGU3NWY4YzJHTXl6TjJGa1ROeTA4azJVRUxkN1grenRFWThoZGpi?=
 =?utf-8?B?WUMzc3dldUtjNTJ2SkhBZnladG5TVitBRGhyZmNWOUw2WEFRaWhJL0x4U1l5?=
 =?utf-8?B?cm5HZDBHYkdETC9MclBaaTNUOEVRcVhIQXRxQnZBdFJtdllUdjdTRnIvZnZr?=
 =?utf-8?B?MmYrMCtPaFZ4Z3p0a1RwSzFtQzZEeFluRFFBZy9FdE0wWFhkWTVFcVlESlVO?=
 =?utf-8?B?Y3ZBK3dUaGdyTE93V2hnVTlWbm51K05pYnNHWDA1d3J2cGFtdXM1VEdWcTZC?=
 =?utf-8?B?WmNROTkvMXpWRmFvaXlMTHlzNmx3bkNZaE54S2x2UVgzejVxN0c2VU9uRGpH?=
 =?utf-8?B?MWZOL25hUUlVV05GWUZ2dzdkY05neW80TU1DU2gvalIzNmlqUGx3OXI1Y1hw?=
 =?utf-8?B?MnQ2enlsVytsaUE0eFVtZkQzdnZ4V3RIYUhzeTZzenBBeE5KQVV1N1QxNDJV?=
 =?utf-8?B?V216YVRGOGNPSFdiTWx1RnkwV2xtNGY3d1czRGNZMk52QkhuMnJmbVE3bXN2?=
 =?utf-8?B?U2toS2tQcmN5bDF5eis2SjdtaGxFeVVvK04xNWF3a25tLzV5NXJpb3Z5UmYx?=
 =?utf-8?B?eVZ0Y1QydkdlUHVMelBYMDNDQktaRmNaYnhDbzYvY25IK0VHNVBKNVdKK0xr?=
 =?utf-8?B?Um40Q1FKc2lHNHVLUDZJbEZOcS9KVmdxb0haVUdBcEF5RThNSzR5L3VWZStn?=
 =?utf-8?B?ZWJPOWgydEs5dGNFUmRzY3BuaDZoNjlOQnVrSkRnOXcvcUxmNzhnUmducVdE?=
 =?utf-8?B?V3BBMFZNNkx2alVOcGExc1JuSm9QRHpZM1dQQ0kxZm9SU3JQN0tud084SDlJ?=
 =?utf-8?B?SDJtSzlSRG9Pd0ZaWGVJSVZDY3RWM1RYOTBJaCtNUkNIQ0RIajY3Rlhmc1Qv?=
 =?utf-8?B?S1FsVUxKRlFTY1RzS0cxb1NuandCdVB1eFlxMnZVNHhkNEpEbGxnMmpYZGFK?=
 =?utf-8?B?QTB2Wk9nS0dEOEFYYThXZENOcjhaak45b1JkZDg2aWhmTWV0bURFZkRjcFI4?=
 =?utf-8?B?ai9Tb0ZiRnNkWnFCdVNPSlludDV4Tys2dkdQR3kwb3dwWnppRnF0cGVSdnhl?=
 =?utf-8?B?ODh5MWE2SEpjbm5SRHdSQ2pSb2x6bnVPQkdiRUZwSDlBclBDZ0xYVkhBTWI4?=
 =?utf-8?B?WWtNNjZCLzA1RlYyZnFpUnhkNW5vSVd2UDE5cmVObWpSZ2tOMVRCTS84bEZh?=
 =?utf-8?B?QTd1dEtpOFA0VExIZGRnN3dJbnpwNDQ3VXF5c1pacVlob2I0aUlvQVNDcVpa?=
 =?utf-8?B?b0NHUDcyYzZTaVZQZDhLdzNlWjQxZktJa1hvOW1kMGlqQ2M0bWd4dEw1Y2lC?=
 =?utf-8?B?eGdBTFZBTXRpRUFyeWFPbURBdEFHOFIwZC85eTd0TDdpd05uVVhISm9icHF1?=
 =?utf-8?B?UFE1Q0hiSzk2dW1WYWNqblRxNGpDRHBFQ3hlU1I0TVZ3OVhpSDE1bFR6VUwx?=
 =?utf-8?B?MDVBaFZIS3JGRUd0dFpSZHZzNjgrSkIzcVdOdGR6d1YzaFVCWkE4UGUxYmFH?=
 =?utf-8?B?WWFVcXZOSm1KRllnT0h1b2hDb25oZG1GS0xERTJkUWRrT0ZZR3NUZXl5Ykwx?=
 =?utf-8?B?ckZiVWhkdE9abUxDZGk4YWRjeTBZYjYvbnhMNEVvbm5wRW04K21NYjV0Zi9E?=
 =?utf-8?Q?IPDNaW4QnNeumUVdCY6qg6RkEod4UHzz07vo4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(10070799003)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cXdDb0YvNTNTdGdzQ1lmQVdVYmJPWjUvVVhQSE1ERlNkbkdJUFl3cjZPcXB4?=
 =?utf-8?B?WFVmUG55VHBhc2NFUkdtZDFVNHdvSmJuKzVodHNkM0I4SnVmNDVLU1lmTm5I?=
 =?utf-8?B?UHVrV0ZScVovWWxaS1pWU0VWVXpMTjBvSmJKQzhMSk80TGVPYkpJZEhNVlND?=
 =?utf-8?B?MnR3T2l0c1JaeEs1UTVUano4cnZaS0tydC9vRXlMcFBMYVNyb0FLRFp3OVM0?=
 =?utf-8?B?bENsZTVUNjJ1b0FQMUxrMHFmK0Q4bjYxTmZHYVpySHJqaFJJMVg1Y2lEekh3?=
 =?utf-8?B?NGpUSUM0WVJNc3hVUWx1b1pYTVVaQzNRVjgvUUlwSTFrL25ZZWt2YzZqaHR2?=
 =?utf-8?B?R05YVW0wOXB4bHltK2RHYVpkN3p6STdub0FDMzA2OHhpZFUyV25QK1RCbFg5?=
 =?utf-8?B?SWFWTlVyaTByVXlnREJ6SzI3U2haQ0QzdHpXdXUzcDArdWxCQVlrMTBBWldT?=
 =?utf-8?B?ZWtsVDFhaFU3aVVNWHUxakFaY1BtekZaZitsd0M1VG9iUlFsaTR4QmtMUTll?=
 =?utf-8?B?OGZOVWFqaDBVNnc3NFRwOW1kdHVUWjdYNDBGRHN0aXd3OEc1UG5JSWZoaXI2?=
 =?utf-8?B?eVpVaUtveVErRE52MzZSVVIyZHpYOGpYalFwY1h6OXR4R3YxQkJESFA3NjFm?=
 =?utf-8?B?Z1lIQ01HR0tPcWpsTERPcVFFUkpjSk50MzM4MS9WOGVEMGZzVXZuNXRFcm1q?=
 =?utf-8?B?Nkd2OTZya2FEbDkyUWk2TVBoV0tUY0NXWnZoQ0kyWGp6Q3F2aEJiOFo3YWkx?=
 =?utf-8?B?Ujd5TGxzZGJ2aE0vRkxLVU1KM3pFSlZlVFkxeUhDZmhHMURYU3lLbEtVbTdF?=
 =?utf-8?B?VkMxbjdqZjVRZ2ZIY3c0UnJUamRVSThmajJPc1BBc0F0M256MVV1SUYrK2VZ?=
 =?utf-8?B?NjUvVy9ya2plSG45V3F5cnNFVWlEdy9uMHFLVXNOVzBJcGNVUzllemU1Z3Rz?=
 =?utf-8?B?aEcxdllLTTh3dVRKTis3UmZWZjRnVTQ5OU9kYzEzSUs2WDg0d291OFlMVmNT?=
 =?utf-8?B?UVN1VmhhdHpEa0tjY0JEbXRxUTBQSUVaVjEzNXVHTndxODY5UE9Kcm1YNnhq?=
 =?utf-8?B?Rk9Qb0hPOEsvMTh1MHhON3ByVjFsZWtCZi90dkhmSnlzUVJCQWpZbXZFT0cz?=
 =?utf-8?B?by83NklNcC9OanJTUWgxczZGb3hRZnhVUkh1bmo2b0JUVVlueE5qaHZCVXpm?=
 =?utf-8?B?TmJ0YXVoam1mdUMwSCtNVkVldGxzdVpJbW9OR0p1alJ0L1FRcVFhbXkydGgv?=
 =?utf-8?B?dEhITTJaN2tWTFhnclpwSkFLdWF3SDhwZ0czaERJUmtITUg4K0JCK2NuVnU5?=
 =?utf-8?B?NkdCa2htSWROdXNiR2N0Vm1meERkNUZaSE1uVzJ3alU3c3pyR3VDQ1JPUEZ5?=
 =?utf-8?B?VDJjLzNoSVNyemUxbzN2VWVHTmV3clUzNnNEM1BtMEZXVDRwdUdCVkpsL2tl?=
 =?utf-8?B?MGNEL2s4SGpqSFlxUEZYSzE4RG9rZjc4UWxQWnJibFdiSnp0MUFvLzhZNXdH?=
 =?utf-8?B?MWFoaHpGNXJRMmZXUU8vdGVOdjJwZmN3RTgrbnR6bS9tOGFGQ0pwSnhVcDdW?=
 =?utf-8?B?bHpLMjVYNVZVQ0V4OWFsdFY4TlE5L09HRTQ4TWtwOERZNm1KdGovR05QamFh?=
 =?utf-8?B?Ky9KMHZVY01GWWZnNlllbkJHYnpnZzVMdFZxak9FRVFNY3hkWHc2U0lyZEhS?=
 =?utf-8?B?MkU3RnJwSUdGK0hFWkZwUDZOS0ZkN2JWT3cwdW5jTnkvRndoME5uQ3NtSElL?=
 =?utf-8?B?cFlYUS9ITkRwNGtNZVRkK20ra1JnR0NwWE9ES2hxbmQ3S2tHQ2ZLNExDNjZ0?=
 =?utf-8?B?ZHoyUVBsUUdQRWpWdDBGQU14YzhLT0ttc290Um85bkdUYUd2Y05NZ2FEOXlj?=
 =?utf-8?B?NERSaFZIQk02eEJoN2UydCtLa05ZTi80N1NReFM0V1Brd2VEQ2xFVHdnV3Jw?=
 =?utf-8?B?TmIzYzJLUXZYWEZPQ2FCY2VwUFkvaVM2b0tRcDZqSXFSMkx6OTlhaWFmOGR2?=
 =?utf-8?B?a0lwOGFvWGRQYlE0ZjFwUnpBbE52aVBkejQ3bEovYlRkb0c1dmdOaXRBbnNQ?=
 =?utf-8?B?UEhONVNTQXlLN1VhN2hFQ3h5NHI5R2hEVVlHOWpXU2M1aGpUd0p5QUU4Mk84?=
 =?utf-8?B?eCtlMFFzTjNPUXdEUXJxa0RQVjQ4emxzcUVjaU0yT3JmaVhXd2diRDU5ODJ3?=
 =?utf-8?Q?bcSO4yRDEvXlSzz5Zn2L1RA/tq7CbK5saDKqb3wQR+t8?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6524d83b-b717-4934-7b1c-08dd0ace5b10
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2024 08:19:16.3511 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9UBynjgbR+aRr4nCx0Xa3+mjZsBV5aPT8d0YttAudW1BQqryax4Qj0UEBLWIBdWZpvVCJNyqQ3rQjfbaXPAYWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6390
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

PiA+ID4gT24gVGh1LCBOb3YgMjEsIDIwMjQgYXQgMDU6NTY6MDBQTSArMDUzMCwgQXJ1biBSIE11
cnRoeSB3cm90ZToNCj4gPiA+ID4gQ1JUQyBwcm9wZXJ0aWVzIGhhdmUgYmVlbiBhZGRlZCBmb3Ig
ZW5hYmxlL2Rpc2FibGUgaGlzdG9ncmFtLA0KPiA+ID4gPiByZWFkaW5nIHRoZSBoaXN0b2dyYW0g
ZGF0YSBhbmQgd3JpdGluZyB0aGUgSUVUIGRhdGEuDQo+ID4gPiA+ICJISVNUT0dSQU1fRU4iIGlz
IHRoZSBjcnRjIHByb3BlcnR5IHRvIGVuYWJsZS9kaXNhYmxlIHRoZSBnbG9iYWwNCj4gPiA+ID4g
aGlzdG9ncmFtIGFuZCB0YWtlcyBhIHZhbHVlIDAvMSBhY2NvcmRpbmdseS4NCj4gPiA+ID4gIkhp
c3RvZ3JhbSIgaXMgYSBjcnRjIHByb3BlcnR5IHRvIHJlYWQgdGhlIGJpbmFyeSBoaXN0b2dyYW0g
ZGF0YS4NCj4gPiA+ID4gIkdsb2JhbCBJRVQiIGlzIGEgY3J0YyBwcm9wZXJ0eSB0byB3cml0ZSB0
aGUgSUVUIGJpbmFyeSBMVVQgZGF0YS4NCj4gPiA+ID4NCj4gPiA+ID4gdjI6IFJlYWQgdGhlIGhp
c3RvZ3JhbSBibG9iIGRhdGEgYmVmb3JlIHNlbmRpbmcgdWV2ZW50IChKYW5pKQ0KPiA+ID4gPiB2
MzogdXNlIGRybV9wcm9wZXJ0eV9yZXBsYWNlX2Jsb2JfZnJvbV9pZCAoVmFuZGl0YSkNCj4gPiA+
ID4gICAgIEFkZCBzdWJzdHJ1Y3QgZm9yIGhpc3RvZ3JhbSBpbiBpbnRlbF9jcnRjX3N0YXRlIChK
YW5pKQ0KPiA+ID4gPiB2NDogIFJlYmFzZWQgYWZ0ZXIgYWRkcmVzc2luZyBjb21tZW50cyBvbiBw
YXRjaCAxDQo+ID4gPiA+IHY1OiBoaXN0b2dyYW0gY2hlY2sgd2l0aCBvbGQvbmV3IGNydGNfc3Rh
dGUgKFN1cmFqKQ0KPiA+ID4gPiB2NjogUmViYXNlDQo+ID4gPiA+DQo+ID4gPiA+IFNpZ25lZC1v
ZmYtYnk6IEFydW4gUiBNdXJ0aHkgPGFydW4uci5tdXJ0aHlAaW50ZWwuY29tPg0KPiA+ID4gPiAt
LS0NCj4gPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYXRvbWljLmMg
ICB8ICAgNSArDQo+ID4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Ny
dGMuYyAgICAgfCAxNjYgKysrKysrKysrKysrKysrKystDQo+ID4gPiA+ICBkcml2ZXJzL2dwdS9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX2NydGMuaCAgICAgfCAgIDUgKw0KPiA+ID4gPiAgZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5LmMgIHwgIDE2ICsrDQo+ID4gPiA+
ICAuLi4vZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X3R5cGVzLmggICAgfCAgMTMgKysN
Cj4gPiA+ID4gIC4uLi9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9oaXN0b2dyYW0uYyAgICB8
ICAgNiArDQo+ID4gPiA+ICA2IGZpbGVzIGNoYW5nZWQsIDIxMCBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pDQo+ID4gPg0KPiA+ID4gUGxlYXNlIHByb3ZpZGUgdGhlIGRvY3VtZW50YXRpb24g
Zm9yIHRoZXNlIHByb3BlcnRpZXM6IGJpbmFyeQ0KPiA+ID4gZm9ybWF0LCBldGMuIEFsc28sIGlk
ZWFsbHkgc3VjaCBhIHByb3BlcnRpZXMgc2hvdWxkIGJlIGRlZmluZWQgaW4gYQ0KPiA+ID4gdmVu
ZG9yLW5ldXRyYWwgd2F5LCBzbyB0aGF0IG90aGVyIGRyaXZlcnMgYWxzbyBjYW4gaW1wbGVtZW50
IHN1cHBvcnQgZm9yDQo+IHNpbWlsYXIgZnVuY3Rpb25hbGl0eS4NCj4gPiA+DQo+ID4gSSBhc3N1
bWVkIHRoYXQgdGhlcmUgYXJlIG5vIG90aGVyIHVzZXJzIG9mIHRoaXMgaGlzdG9ncmFtLiBIZW5j
ZSBoYWQgaXQNCj4gaW50ZXJuYWwgdG8gaTkxNSBkcml2ZXIuDQo+ID4gV2lsbCBtb3ZlIHRoZXNl
IHByb3BlcnRpZXMgdG8gZHJtLWNydGMsIG1ha2luZyBpdCB1c2VhYmxlIGJ5IG90aGVyIHVzZXJz
IGFzDQo+IHdlbGwuDQo+IA0KPiBUaGVyZSBhcmUgbm8gdXNlcnMgZm9yIHRoZSBJbnRlbCBoaXN0
b2dyYW0gZm9ybWF0LiBIb3dldmVyIG90aGVyIHZlbmRvcnMgY2FuDQo+IHByb3ZpZGUgc2ltaWxh
ciBmdW5jdGlvbmFsaXR5IHRvIGVuaGFuY2UgdmlzdWFsIHF1YWxpdHkgZGVwZW5kaW5nIG9uIHRo
ZSBpbWFnZQ0KPiBjb250ZW50cyBhbmQgYW1iaWVudCBsaWdodC4gUGxlYXNlIGRlZmluZSB0aGUg
cHJvcGVydGllcyBpbiBhIGdlbmVyaWMgd2F5LA0KPiBsZXR0aW5nIG90aGVyIHZlbmRvcnMgYmUg
YWJsZSB0byBpbXBsZW1lbnQgc2ltaWxhciBmdW5jdGlvbmFsaXR5Lg0KPiANClN1cmUhDQoNClRo
YW5rcyBhbmQgUmVnYXJkcywNCkFydW4gUiBNdXJ0aHkNCi0tLS0tLS0tLS0tLS0tLS0tLS0tDQo=
