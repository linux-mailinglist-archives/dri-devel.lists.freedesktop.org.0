Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBF5CA84BC
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 17:01:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79C8310EB68;
	Fri,  5 Dec 2025 16:01:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IZAQbfYh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7CC810EB65
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 16:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764950515; x=1796486515;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=62ZYfD5pBFbFF1fDas9PJrERLSvf7Li59tKxsL/l+h4=;
 b=IZAQbfYhNfvkZMtcZhNFbhdJn/jc8IlTlxM2bn//lX0DliDxhnICvuEM
 qtWJmajTvTkBDjOs94jjV2A6i9Y65egFiP0/0uBq5IV3Xl8IONYjrqNSR
 5IC5j0CHBIHKg424pjMvEjfEjmKGtS2j9kq4TyqrRlStRfvyKVz0GwCIb
 lgRYi5DioOj9z7pNyYBg8qLnrq8KK3YUnPbG/WvBdrgQC8Xwy+/bhljqo
 BmKOBsw7huwnoP5oo3qtSzoGJ/YA+ciAtQDO4TWRBNPXkfkVc1fPReWaL
 lzFRcEiSrvd/0RBSDx90yY2ADb8i4SwahCp9ZQiCRB3GpICcB6J7BDd6M w==;
X-CSE-ConnectionGUID: U3Rgy2IIRWKsJWpqVHFNFA==
X-CSE-MsgGUID: YPOQuxteTF6DuyKDOky67w==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="77604820"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="77604820"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 08:01:54 -0800
X-CSE-ConnectionGUID: WftYQ1NpRiiPSRjc1eV5ng==
X-CSE-MsgGUID: cIo3LX5iSFyIEBlU2Nwk2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="218673903"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 08:01:53 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 08:01:53 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 5 Dec 2025 08:01:53 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.20) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 08:01:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uEik8D0HqCfyUb658MQhRrl73fY/COeALe9LsO/Uicp+4uwqPh66VGUDD2h7T0Ub5P0OxkHLUYHlrC6KfKxKjUjbj9t8o6xLWNZZ53hhHqbqJOGu/W5jfBNnkFnCfn4SzJ79oqbd++2nG1VzyYnZoOAqt5EvHiU6jmLrz31WfHgrbEALTgkJEdO4WNWL1okLVIbc02yeArKiSlK0eNpiNm6FikSuAmOi+H2WI3KhdcyQncMoANO8W/RngVOyf7SS6zoaIFyuh1uk7PugY8DDJNyhsrhDotBaHupekt8szRgW+c6QiLxzc8O/w59QVSu4STlZ8zkcxLbHH/8GprFK7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=62ZYfD5pBFbFF1fDas9PJrERLSvf7Li59tKxsL/l+h4=;
 b=eiR45ZTjlEdzewIUw7Wbvj3TLhkoAmnt3qHWX6bNUXOfI1nBCuDq4FAwfdNsmUkxe0UIlxMk3HOJz9CNmZgdEdaQwxR5oyb1nEAyud4jyjIiCO5cPrfNGhYN+ySA9KCRwaYyKMK1o+2Bt0ts8VQ3b3F6TqKgUgOC61TaMzXOE3ICprWFJlYqpj6taBPPhntD4PJh0TMjU1NEJ1YtSlHAvJWtBjEgTvL97P6qmky/cfEqxCd0sEosnu1ahStyb7c43iUexnqha7wm46dBD1yrAR0pZ0VbtOwW4o3wmSNhlzgPqEpvw/IrkltyX6EE9aLKrR8UCuYqzOCANX8pWkuoTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by LV3PR11MB8532.namprd11.prod.outlook.com (2603:10b6:408:1ae::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Fri, 5 Dec
 2025 16:01:50 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83%2]) with mapi id 15.20.9388.011; Fri, 5 Dec 2025
 16:01:49 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "Auld, Matthew" <matthew.auld@intel.com>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, "simona.vetter@ffwll.ch"
 <simona.vetter@ffwll.ch>
Subject: RE: [PATCH 1/2] dma-buf: improve sg_table debugging hack v3
Thread-Topic: [PATCH 1/2] dma-buf: improve sg_table debugging hack v3
Thread-Index: AQHcZef8cMFbsvg/aE2xRC96RvXeprUTM9Kg
Date: Fri, 5 Dec 2025 16:01:49 +0000
Message-ID: <IA1PR11MB64181483C8F0AF277B2A874AC1A7A@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20251205130604.1582-1-christian.koenig@amd.com>
In-Reply-To: <20251205130604.1582-1-christian.koenig@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|LV3PR11MB8532:EE_
x-ms-office365-filtering-correlation-id: e589c849-d633-451e-21c1-08de34179989
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?TlJKS2w0cVZXOWplK1RqZWFsaXJEaVV5VGJ2bzlzckpTYjZFUEVrZi9ZVi9K?=
 =?utf-8?B?V3pUOFBUOFZQbktiUDJJcVNVTUd5Qm9NakpjeDZ1aHlQWFBOenJOR2h4clht?=
 =?utf-8?B?VkxxMXMxdnBlVnA3SDhNYytxYklNQkpTenR2cUh5MStPbllwa0RxTUY3ZzFk?=
 =?utf-8?B?YWtqcCtUOGx5OW1YNklqWmx5dlFuZml3NkhzV1NVRCtnNEFhdkY0alBXUkFT?=
 =?utf-8?B?bjE4QjMyanNqTHYxNDhmNzJqUk5aUVBFYjc5dUlaL29rNmFSY01qdktGeTRn?=
 =?utf-8?B?SWd1Q3MrdGVHWXNXaTdDZmRyVzdVZXNvcEFjR1MrOHpmRjNmTGZzeWdvQzhn?=
 =?utf-8?B?RFhxUnk1bkNlS1AvVlFpaWhDU2RaQWZrblEzVUN3WVJYN2xwQjA1YzZIeGRR?=
 =?utf-8?B?YU4reDcxUVZObW5QbUVBdENRT1ltRm1RbG96b0R5MkY0Nld1K0VhU0NodW1h?=
 =?utf-8?B?dlVLM1FaQjlmRUxYcyt5TTJzb01tOGE3N29Oallyd2V1WDdZU281d3ZrZ0RI?=
 =?utf-8?B?bVlSRDNJR2RvMmYxWUxPeGNHZDlkaHJuTHR4b3RXL3liME5GZGtZa0lOelND?=
 =?utf-8?B?WU1SQmlhNFErOCtxVCs3U1BFcFppNkJXVlFNVnB0VDVHb0VrdXE4N2kvbjI2?=
 =?utf-8?B?WEdselQxR2hPWkxObjErNlJsdTBFWlNWRlMzMG4yYjRJdU9jcWRaMHFIL3hI?=
 =?utf-8?B?WmhzZUI0Um1weVN2YThPWmZxUmpRMUdmN2pZMEpNWE1SWEJRdXJ2RnVLenNS?=
 =?utf-8?B?VUVzVDhvaTlsOUxXWGlhUTZYQnovUzc0bDlWZjAwRGxONnppVW9uTXcyRFhZ?=
 =?utf-8?B?TTVsS1ZkUXhyUm9lSjZoRldtQVdQNkFDY05jNDluTTVGVWRMV3NJWi9hSzJ4?=
 =?utf-8?B?Mkg4b2JJL1dud05VWjBMdHpMcnFLU2NMdUxHYXRzOEJOL2llOE5tRWx6S3dC?=
 =?utf-8?B?UnJuaDFiUUwwY01CT2d0Q00zK2FaZm5DTXFTSHlTY0tFdGNiQmNwTGN4RVpj?=
 =?utf-8?B?R0M4WXVYUkNrR0xqSUsrQWo1WkVHdHo0bzdGSHYxWGFrN0xvNVFwb3kraGp2?=
 =?utf-8?B?eXZEYjlFNEh4R083Ris1UkRWcElYMGJjYm5STzJ1RXNPVDFqemtLZnFTZFhm?=
 =?utf-8?B?THFYQzYzZ3l0Wm5OemRQZm9RYW5WTnZuL3B6RFpSdU5oYW9rcldaenprM1dU?=
 =?utf-8?B?R3hkYVplNk4ycjlyalpFbmpmckpPS2IxV2JUdzdvdTQrR3VEK04raVlreVlu?=
 =?utf-8?B?T1VyeU5DQkFxTEFVVzQxeWM1MWtydTRpeVNkVWFKYVB2bEtKTlhpOFg5U04v?=
 =?utf-8?B?eDd6ZERQNDhrd1Q3aUsxWHhSdS8vNHMxZWpXWUF1SUJub1BsQUwrSXR1RkZk?=
 =?utf-8?B?d3Fwek5nclZjWWx2bGtJQnppSGlFTE9PL2xadTNMdllrRU9VVGNrcmJ5RFBs?=
 =?utf-8?B?TmhBV0g2R2pRT1h4TEVBTng4YjE2Y1RoM2ZZUUsvYUtIc1hGb25kYUZ2a0Uv?=
 =?utf-8?B?VXdyYk03M003RjY1a3gyWGVmK0VTRmxpNmtmLzNkdy9jZTlsU1pEa3c4UTJ1?=
 =?utf-8?B?eGFYM2RqbTB5aVVsUHN0a1JvaVhFQnFtcWg1N2sxektkNXdwT0NKVFVKS2ln?=
 =?utf-8?B?SmhmMnVPUC9INlB0c2JLM1BtWGRDSndEQ1ZKaXROM2lqU29Za2xSZ3RtWm01?=
 =?utf-8?B?bXllNEZ6OTQrWjIvT0wzSEpybWViWFc2UlRhWXJ1VmdZRkVOUktuUVFwMXow?=
 =?utf-8?B?bXpGYk9DYlYvQWdmaU5KOHFmRnQ1NFdOTjF3MWh5a2QwclNzL205Yy9CVkZS?=
 =?utf-8?B?WVVuRUxqUjBYNEhTSk40ekNaWm50T3V4bjk0dGl1UlcvS3hlUTNSekk1NDZO?=
 =?utf-8?B?ZXhyWGVQVW50dFluRCt6UDR3bkdIbW4yVEhQOHpaOW9PSzVLZnNxd0EwMFFL?=
 =?utf-8?B?NkZmaDhWVUordW50dFV1dFRCRWhQQkFIa004RmpEQUxoWDBuUzJ4NldjZnhD?=
 =?utf-8?B?UVFUanZkcHhmSnk0TmgwWnFUZGg0RmJiSlI2WkFtV0JzSmcrdmlXZzhLRkxO?=
 =?utf-8?Q?CuVh3p?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6418.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MkxQczNNdW5TWkh3a3BnczBSRjQzNVl3NWJFZkl5dUhFT2lWS3ZLYkwvN01o?=
 =?utf-8?B?ZWZJK283UlRhU0EzQUlzdkRZNlVtMG4zdFJaTUY1Z1FLaUJwZWtmMGwzd1Fw?=
 =?utf-8?B?Q2RuQmptZXZvSkcyYjlFVGRBeVB5L1o3eWYyK2xzSnozOWpsTXRVRFJxOE9Z?=
 =?utf-8?B?U2xDdzZyU1F6Y3NHTkhnOTZaRFN2QVhYckFlUzFmdzhFS0ZCL0FKOUpWWTRE?=
 =?utf-8?B?NEJwYnl0a2hNMFV6UTU5REJxRDBRclhCWTc5TndrRDBuaWdsMEMyQ251b1gy?=
 =?utf-8?B?TW5xNEVuY1RMcW9KZUFReHNqbHFvUlpwOCsxYXNUYTBoTkhtbEphQ1YrQW91?=
 =?utf-8?B?Qk1FN3lOSFRRcERBTU1nZXF6M3RBYXhlSnhTcFdZdU1xWmZ0cGxSUVlyUWdF?=
 =?utf-8?B?RlVnaVUzdkJZbHZBeDFsR2phbStKekZJZUF0TUZLMWhaT21nT1BFcUpHK2R6?=
 =?utf-8?B?WllSWW80YWw4Mm5WYXFSN2pQTlRGdVBSeEJQS1VDZFROcFhtbEhuT1JnNVlC?=
 =?utf-8?B?Um0yUnRTMUlXVC9hNjNSNDh0eGVXREFzKzBYc3dtTkRjL0JKeFNJM0JsSEhq?=
 =?utf-8?B?LzhBMWVFWUZZcTA2dWU1STdOejBCZUEzdnJaaldPRmFaMzRpSEh4N0pCaG51?=
 =?utf-8?B?Q29YdzVGVTViOVA5UWphdzdUYVVlT01pQmdWdm1zaUlGWW5UVnNURUtmOUd3?=
 =?utf-8?B?eWNlUTg3eDJCeFZVTFQ5eW5wYS8vbWwxbkZoK1VnQk1ocktqbnd2dWlTaW9h?=
 =?utf-8?B?bjNoaFdmblBSR2tjbDBneFhmcExQT2dFNHNpMVN6djM3aU55KzFuK3MxWkR3?=
 =?utf-8?B?OGc2U0FLR0NqaEpIOUsvendZbG1rNXl4Y0tHY2xGMHBIVUE2SlhNUXJWVGZz?=
 =?utf-8?B?TmF0M1hITWJYRWFvR3FHNXBWL08zbms5bHRJVkIvdlV0b2JyR3NPQkNwWTVP?=
 =?utf-8?B?Z1YvdEF1T2ZMUk1LZHlhTGJQRkZFNUliMnJvVHpTS2VrNG5FZmt2dU5mR25t?=
 =?utf-8?B?U09YMSszYndHSzlXdDFGeHlNK1pSV0djVTMrK2JGc0RLNHdVNDNyNGpaaUtD?=
 =?utf-8?B?enBQVU9LRnNUNDNBQUd3YkZrOFZqMHNUOFlhaDNSb3dTZ2F2M1dQbHMvNUtX?=
 =?utf-8?B?bC8rTFhRZTJrd2RVOTR3bG8xY3hTN2tTdGRQaWhXWVhOd05aRDNlM29xUHEw?=
 =?utf-8?B?TnZPaldKMlBvdnFZNnNvTmdNZ3VvOUc0dktGVzdvclpBUDNoMVlGWmlTL2E3?=
 =?utf-8?B?dnVlR1grK2pSMW5vcUpLY0xIMzNvclg4dEU1MFUvTTFKMndCMEVTek9iYnVO?=
 =?utf-8?B?UWd2OWhMeEJpMEtGaWptU2prelBxNVdWWmJ4aVdlalZ4QUlHUU1aQ0RBdTZC?=
 =?utf-8?B?alczSXhOZ1pxTzdjUGllRmQ5KzhzSFkxWDV2TTkzVk1FNDJKczFGWldZbXlU?=
 =?utf-8?B?cDZHNlFkL2xSYVduTmRacnZzbUsvTHhhWjhSNWRpVmtiMVdBQXk4ZkRsWjF6?=
 =?utf-8?B?QjJCcVUyU0h6eTNjdlJEbHBrNndMd0F5TGUrTnFoTWFtdFZFUjQyWnUrZ1FM?=
 =?utf-8?B?VzRtZ1VBRTg5MW9SY2MyZXJSYkpYQitiSkRnWHJoa0s1TENidEM0bW5FZGlx?=
 =?utf-8?B?NEFQVUltY1hrYWRBaVl3RmhRbWVJRlRKMUVHVi9kM1RjZ3NxTXVLT0dva2dI?=
 =?utf-8?B?a0JuM3d0c3IrM3NjQjJRMUVmMUhQZCtmZktnRUp6RDN6R3VWZTlFVGNpV2J5?=
 =?utf-8?B?cVlHbFFrZGJveWJibndIaTVEYnA3ZGlmWWdNaHIrV0hVck05QzVSNFhQbGdn?=
 =?utf-8?B?SGtsTmFzSUg2Vll3WXlIcWR4elBuM1krckVKeW9LdXV3ellYUmFUbDVkT2ky?=
 =?utf-8?B?SGNEdG44REdMbjdoZHcvcWx2UWJHQWZJOXdaNnRCd0s5Wk5HclZEaTRHYjkz?=
 =?utf-8?B?VWNiM2pVckRFME1TZTduK00wMXEvc1ZhZFJwOVhSY3RLakhIWmkyOVR1bUdG?=
 =?utf-8?B?aVRtRDNkV1V4ZmkyYmlwc1pKRlZxZTJpTngwMGtFZVMzUENMMkxXN1FyUXRI?=
 =?utf-8?B?TEtFYmUyTDllS2V3N2cwVHRGeWdXaXN5MklTellGdG10ei9jM09sRzg2Qm9K?=
 =?utf-8?Q?HfNTPpY3gQQJta9x7YQMKGbDc?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e589c849-d633-451e-21c1-08de34179989
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2025 16:01:49.7446 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H44BndTviHWc0OBuvilHmLWF3jeu3hLFgm/qCo2oG+vfxKuWNkcDRuXQB6f0ty4+BKJRUB/zxC9PasrWnHVNgNLwhY+sgK/vx09PD0GR/mc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8532
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

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogZHJpLWRldmVsIDxkcmktZGV2ZWwt
Ym91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZg0KPkNocmlzdGlhbiBL
w7ZuaWcNCj5TZW50OiBGcmlkYXksIERlY2VtYmVyIDUsIDIwMjUgODowNiBBTQ0KPlRvOiBBdWxk
LCBNYXR0aGV3IDxtYXR0aGV3LmF1bGRAaW50ZWwuY29tPjsgbGludXgtbWVkaWFAdmdlci5rZXJu
ZWwub3JnOw0KPmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGxpbmFyby1tbS1zaWdA
bGlzdHMubGluYXJvLm9yZzsNCj5zaW1vbmEudmV0dGVyQGZmd2xsLmNoOyBSdWhsLCBNaWNoYWVs
IEogPG1pY2hhZWwuai5ydWhsQGludGVsLmNvbT4NCj5TdWJqZWN0OiBbUEFUQ0ggMS8yXSBkbWEt
YnVmOiBpbXByb3ZlIHNnX3RhYmxlIGRlYnVnZ2luZyBoYWNrIHYzDQo+DQo+VGhpcyBkZWJ1Z2dp
bmcgaGFjayBpcyBpbXBvcnRhbnQgdG8gZW5mb3JjZSB0aGUgcnVsZSB0aGF0IGltcG9ydGVycw0K
PnNob3VsZCAqbmV2ZXIqIHRvdWNoIHRoZSB1bmRlcmx5aW5nIHN0cnVjdCBwYWdlIG9mIHRoZSBl
eHBvcnRlci4NCj4NCj5JbnN0ZWFkIG9mIGp1c3QgbWFuZ2xpbmcgdGhlIHBhZ2UgbGluayBjcmVh
dGUgYSBjb3B5IG9mIHRoZSBzZ190YWJsZQ0KPmJ1dCBvbmx5IGNvcHkgb3ZlciB0aGUgRE1BIGFk
ZHJlc3NlcyBhbmQgbm90IHRoZSBwYWdlcy4NCj4NCj5UaGlzIHdpbGwgY2F1c2UgYSBOVUxMIHBv
aW50ZXIgZGUtcmVmZXJlbmNlIGlmIHRoZSBpbXBvcnRlciB0cmllcyB0bw0KPnRvdWNoIHRoZSBz
dHJ1Y3QgcGFnZS4gU3RpbGwgcXVpdGUgYSBoYWNrIGJ1dCB0aGlzIGF0IGxlYXN0IGFsbG93cyB0
aGUNCj5leHBvcnRlciB0byBwcm9wZXJseSBrZWVwcyBpdCdzIHNnX3RhYmxlIGludGFjdCB3aGls
ZSBhbGxvd2luZyB0aGUNCj5ETUEtYnVmIG1haW50YWluZXIgdG8gZmluZCBhbmQgZml4IG1pc2Jl
aGF2aW5nIGltcG9ydGVycyBhbmQgZmluYWxseQ0KPnN3aXRjaCBvdmVyIHRvIHVzaW5nIGEgZGlm
ZmVyZW50IGRhdGEgc3RydWN0dXJlIGluIHRoZSBmdXR1cmUuDQo+DQo+djI6IGltcHJvdmUgdGhl
IGhhY2sgZnVydGhlciBieSB1c2luZyBhIHdyYXBwZXIgc3RydWN0dXJlIGFuZCBleHBsYWluaW5n
DQo+dGhlIGJhY2tncm91bmQgYSBiaXQgbW9yZSBpbiB0aGUgY29tbWl0IG1lc3NhZ2UuDQo+djM6
IGZpeCBzb21lIHdoaXRlc3BhY2UgaXNzdWVzLCB1c2Ugc2dfYXNzaWduX3BhZ2UoKS4NCj4NCj5T
aWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+
DQo+UmV2aWV3ZWQtYnk6IE1pY2hhZWwgSi4gUnVobCA8bWljaGFlbC5qLnJ1aGxAaW50ZWwuY29t
PiAodjEpDQo+LS0tDQo+IGRyaXZlcnMvZG1hLWJ1Zi9kbWEtYnVmLmMgfCA3NCArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrLS0tLS0NCj4tLS0NCj4gMSBmaWxlIGNoYW5nZWQsIDYwIGlu
c2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQ0KPg0KPmRpZmYgLS1naXQgYS9kcml2ZXJzL2Rt
YS1idWYvZG1hLWJ1Zi5jIGIvZHJpdmVycy9kbWEtYnVmL2RtYS1idWYuYw0KPmluZGV4IDIzMDVi
YjJjYzFmMS4uOTQ0ZjQxMDNiNWNjIDEwMDY0NA0KPi0tLSBhL2RyaXZlcnMvZG1hLWJ1Zi9kbWEt
YnVmLmMNCj4rKysgYi9kcml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jDQo+QEAgLTM1LDYgKzM1LDEy
IEBADQo+DQo+ICNpbmNsdWRlICJkbWEtYnVmLXN5c2ZzLXN0YXRzLmgiDQo+DQo+Ky8qIFdyYXBw
ZXIgdG8gaGlkZSB0aGUgc2dfdGFibGUgcGFnZSBsaW5rIGZyb20gdGhlIGltcG9ydGVyICovDQo+
K3N0cnVjdCBkbWFfYnVmX3NnX3RhYmxlX3dyYXBwZXIgew0KPisJc3RydWN0IHNnX3RhYmxlICpv
cmlnaW5hbDsNCj4rCXN0cnVjdCBzZ190YWJsZSB3cmFwcGVyOw0KPit9Ow0KPisNCj4gc3RhdGlj
IGlubGluZSBpbnQgaXNfZG1hX2J1Zl9maWxlKHN0cnVjdCBmaWxlICopOw0KPg0KPiBzdGF0aWMg
REVGSU5FX01VVEVYKGRtYWJ1Zl9saXN0X211dGV4KTsNCj5AQCAtODI4LDIxICs4MzQsNTkgQEAg
dm9pZCBkbWFfYnVmX3B1dChzdHJ1Y3QgZG1hX2J1ZiAqZG1hYnVmKQ0KPiB9DQo+IEVYUE9SVF9T
WU1CT0xfTlNfR1BMKGRtYV9idWZfcHV0LCAiRE1BX0JVRiIpOw0KPg0KPi1zdGF0aWMgdm9pZCBt
YW5nbGVfc2dfdGFibGUoc3RydWN0IHNnX3RhYmxlICpzZ190YWJsZSkNCj4rc3RhdGljIGludCBk
bWFfYnVmX21hbmdsZV9zZ190YWJsZShzdHJ1Y3Qgc2dfdGFibGUgKipzZ190YWJsZSkNCg0KeW91
IGFyZSBub3QgcmVhbGx5IG1hbmdsaW5nIHRoaXMgYW55bW9yZS4uLg0KDQpkbWFfYnVmX2Nsb25l
X3NnX3RhYmxlKCkNCmRtYV9idWZfdW5jbG9uZV9zZ190YWJsZSgpDQoNCm1heWJlPw0KDQoNCj4g
ew0KPi0jaWZkZWYgQ09ORklHX0RNQUJVRl9ERUJVRw0KPi0JaW50IGk7DQo+LQlzdHJ1Y3Qgc2Nh
dHRlcmxpc3QgKnNnOw0KPi0NCj4tCS8qIFRvIGNhdGNoIGFidXNlIG9mIHRoZSB1bmRlcmx5aW5n
IHN0cnVjdCBwYWdlIGJ5IGltcG9ydGVycyBtaXgNCj4tCSAqIHVwIHRoZSBiaXRzLCBidXQgdGFr
ZSBjYXJlIHRvIHByZXNlcnZlIHRoZSBsb3cgU0dfIGJpdHMgdG8NCj4tCSAqIG5vdCBjb3JydXB0
IHRoZSBzZ3QuIFRoZSBtaXhpbmcgaXMgdW5kb25lIG9uIHVubWFwDQo+LQkgKiBiZWZvcmUgcGFz
c2luZyB0aGUgc2d0IGJhY2sgdG8gdGhlIGV4cG9ydGVyLg0KPisJc3RydWN0IHNjYXR0ZXJsaXN0
ICp0b19zZywgKmZyb21fc2c7DQo+KwlzdHJ1Y3Qgc2dfdGFibGUgKmZyb20gPSAqc2dfdGFibGU7
DQo+KwlzdHJ1Y3QgZG1hX2J1Zl9zZ190YWJsZV93cmFwcGVyICp0bzsNCj4rCWludCBpLCByZXQ7
DQo+Kw0KPisJaWYgKCFJU19FTkFCTEVEKENPTkZJR19ETUFCVUZfREVCVUcpKQ0KPisJCXJldHVy
biAwOw0KPisNCj4rCS8qDQo+KwkgKiBUbyBjYXRjaCBhYnVzZSBvZiB0aGUgdW5kZXJseWluZyBz
dHJ1Y3QgcGFnZSBieSBpbXBvcnRlcnMgY29weSB0aGUNCj4rCSAqIHNnX3RhYmxlIHdpdGhvdXQg
Y29weWluZyB0aGUgcGFnZV9saW5rIGFuZCBnaXZlIG9ubHkgdGhlIGNvcHkgYmFjaw0KPnRvDQo+
KwkgKiB0aGUgaW1wb3J0ZXIuDQo+IAkgKi8NCj4tCWZvcl9lYWNoX3NndGFibGVfc2coc2dfdGFi
bGUsIHNnLCBpKQ0KPi0JCXNnLT5wYWdlX2xpbmsgXj0gfjB4ZmZVTDsNCj4tI2VuZGlmDQo+Kwl0
byA9IGt6YWxsb2Moc2l6ZW9mKCp0byksIEdGUF9LRVJORUwpOw0KPisJaWYgKCF0bykNCj4rCQly
ZXR1cm4gLUVOT01FTTsNCj4rDQo+KwlyZXQgPSBzZ19hbGxvY190YWJsZSgmdG8tPndyYXBwZXIs
IGZyb20tPm5lbnRzLCBHRlBfS0VSTkVMKTsNCj4rCWlmIChyZXQpDQo+KwkJZ290byBmcmVlX3Rv
Ow0KPisNCj4rCXRvX3NnID0gdG8tPndyYXBwZXIuc2dsOw0KPisJZm9yX2VhY2hfc2d0YWJsZV9k
bWFfc2coZnJvbSwgZnJvbV9zZywgaSkgew0KPisJCXRvX3NnLT5vZmZzZXQgPSAwOw0KPisJCXRv
X3NnLT5sZW5ndGggPSAwOw0KPisJCXNnX2Fzc2lnbl9wYWdlKHRvX3NnLCBOVUxMKTsNCg0Kc2df
c2V0X3BhZ2UodG9fc2csIE5VTEwsIDAsIDApOyA/DQoNCkp1c3QgdGhvdWdodHMuLi4gVGhpcyBs
b29rcyByZWFzb25hYmxlIHRvIG1lLg0KDQpXaXRoIG9yIHdpdGhvdXQgdGhlc2UgY2hhbmdlczoN
Cg0KUmV2aWV3ZWQtYnk6IE1pY2hhZWwgSi4gUnVobCA8bWljaGFlbC5qLnJ1aGxAaW50ZWwuY29t
Pg0KDQpNDQoNCj4rCQlzZ19kbWFfYWRkcmVzcyh0b19zZykgPSBzZ19kbWFfYWRkcmVzcyhmcm9t
X3NnKTsNCj4rCQlzZ19kbWFfbGVuKHRvX3NnKSA9IHNnX2RtYV9sZW4oZnJvbV9zZyk7DQo+KwkJ
dG9fc2cgPSBzZ19uZXh0KHRvX3NnKTsNCj4rCX0NCj4NCj4rCXRvLT5vcmlnaW5hbCA9IGZyb207
DQo+Kwkqc2dfdGFibGUgPSAmdG8tPndyYXBwZXI7DQo+KwlyZXR1cm4gMDsNCj4rDQo+K2ZyZWVf
dG86DQo+KwlrZnJlZSh0byk7DQo+KwlyZXR1cm4gcmV0Ow0KPit9DQo+Kw0KPitzdGF0aWMgdm9p
ZCBkbWFfYnVmX2RlbWFuZ2xlX3NnX3RhYmxlKHN0cnVjdCBzZ190YWJsZSAqKnNnX3RhYmxlKQ0K
Pit7DQo+KwlzdHJ1Y3QgZG1hX2J1Zl9zZ190YWJsZV93cmFwcGVyICpjb3B5Ow0KPisNCj4rCWlm
ICghSVNfRU5BQkxFRChDT05GSUdfRE1BQlVGX0RFQlVHKSkNCj4rCQlyZXR1cm47DQo+Kw0KPisJ
Y29weSA9IGNvbnRhaW5lcl9vZigqc2dfdGFibGUsIHR5cGVvZigqY29weSksIHdyYXBwZXIpOw0K
PisJKnNnX3RhYmxlID0gY29weS0+b3JpZ2luYWw7DQo+KwlzZ19mcmVlX3RhYmxlKCZjb3B5LT53
cmFwcGVyKTsNCj4rCWtmcmVlKGNvcHkpOw0KPiB9DQo+DQo+IHN0YXRpYyBpbmxpbmUgYm9vbA0K
PkBAIC0xMTM5LDcgKzExODMsOSBAQCBzdHJ1Y3Qgc2dfdGFibGUgKmRtYV9idWZfbWFwX2F0dGFj
aG1lbnQoc3RydWN0DQo+ZG1hX2J1Zl9hdHRhY2htZW50ICphdHRhY2gsDQo+IAkJaWYgKHJldCA8
IDApDQo+IAkJCWdvdG8gZXJyb3JfdW5tYXA7DQo+IAl9DQo+LQltYW5nbGVfc2dfdGFibGUoc2df
dGFibGUpOw0KPisJcmV0ID0gZG1hX2J1Zl9tYW5nbGVfc2dfdGFibGUoJnNnX3RhYmxlKTsNCj4r
CWlmIChyZXQpDQo+KwkJZ290byBlcnJvcl91bm1hcDsNCj4NCj4gCWlmIChJU19FTkFCTEVEKENP
TkZJR19ETUFfQVBJX0RFQlVHKSkgew0KPiAJCXN0cnVjdCBzY2F0dGVybGlzdCAqc2c7DQo+QEAg
LTEyMjAsNyArMTI2Niw3IEBAIHZvaWQgZG1hX2J1Zl91bm1hcF9hdHRhY2htZW50KHN0cnVjdA0K
PmRtYV9idWZfYXR0YWNobWVudCAqYXR0YWNoLA0KPg0KPiAJZG1hX3Jlc3ZfYXNzZXJ0X2hlbGQo
YXR0YWNoLT5kbWFidWYtPnJlc3YpOw0KPg0KPi0JbWFuZ2xlX3NnX3RhYmxlKHNnX3RhYmxlKTsN
Cj4rCWRtYV9idWZfZGVtYW5nbGVfc2dfdGFibGUoJnNnX3RhYmxlKTsNCj4gCWF0dGFjaC0+ZG1h
YnVmLT5vcHMtPnVubWFwX2RtYV9idWYoYXR0YWNoLCBzZ190YWJsZSwgZGlyZWN0aW9uKTsNCj4N
Cj4gCWlmIChkbWFfYnVmX3Bpbl9vbl9tYXAoYXR0YWNoKSkNCj4tLQ0KPjIuNDMuMA0KDQo=
