Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B87A167D4
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2025 09:03:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D215B10E340;
	Mon, 20 Jan 2025 08:02:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mZJRhMmP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9712010E365
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 08:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737360178; x=1768896178;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BkWTBGLba5O4q0RkAFQ/lhA6xG72ZDJ3mRi0Jh0qCgY=;
 b=mZJRhMmP5kNJfvgAsoHKXYWup1K+zNz7PPC+pgKOVEzTO4H/dUJawuRq
 oS1qYn11Y2MXhNBCaG1dd8NNVWNdGIgaEjRjpkJ6pxgdWiUVukGeHAGDj
 muinaGDewNhCygNoribRYJhtJMdtZy6TB+uGWLtcxYJXFf4ivbXddmBR2
 4Vt1WLdS+DSdlZXjnxNOzCAnSg15gs3kquGLwGnskx3Mt3+1zQWt30B4X
 aRkhVcEkU+Y5vkJ4JCGSvrfB3eBBSemY4vDGQsVwpvlVOlwwh2usf0dN5
 4KEKFt5cGiMTpDVTFWPSrDoIVdfVStgcrrcFOqlFgp8BcLWWqTWCisbmv w==;
X-CSE-ConnectionGUID: 5ZFgMiBZT0qenaSOGebiuA==
X-CSE-MsgGUID: ALufRAXATu6GvrNNwL4cqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="41654932"
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; d="scan'208";a="41654932"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2025 00:02:57 -0800
X-CSE-ConnectionGUID: KEZumTmeRvmZ3eGHTUHWDw==
X-CSE-MsgGUID: 32AkF404TdKaoIs1XHkJUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="106251236"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Jan 2025 00:02:57 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 20 Jan 2025 00:02:56 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 20 Jan 2025 00:02:56 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 20 Jan 2025 00:02:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CMOgLBCFaPrRFvoF3vBenvxhJ7ZL5JBIdVhKVVkaNqkARS2HIDR1JzEcKbUbnBAvuPow7Ug33mMqn7qyJ/k7hM4P9BCDQ5UqNcFmHgPTB+3/fSCPvreWWo31hVZCHoeBmXb9zqZT9yEdaJMD4fXPDU0SlpHly7++WXBSxZuRDcklIhCy5t5dhaQoi/3ZZq0VzH6aqgLIog9OfMS2bvt9VIMAXOSLawKdbI+hgeKtcGDAg2odj6dNCZN6MDyEcuzNIC8zINz7zV3czjDPzluLvmMVDYEDb2Rxe/QUqhMi3Licdi4HfNRP+v927eC9DX8EsOxK5TtnQNsziwKFrHFi5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BkWTBGLba5O4q0RkAFQ/lhA6xG72ZDJ3mRi0Jh0qCgY=;
 b=vAN1ROWFhkri/ddkQRPgbWQ/YThdwjidiilcDsrHbZmqtXUK3U+wddOp/tb+F1egp8D/1XLywJDRls4R2op+K2Pc8zFJRq0NkgTh0R4igtJHvb1FtFXYYmgByKCyZggdqllCvbXo3QOZtfC2urrf0NTQBcq0q8lw4nFoNby2nwf2tMAYopnhHWjlEQ1HMTQyH1I/bP7mPDl65nVWI/6ox5Td7hrmL5DsdyOJ6AdINi+hpmr5WCaB9Asz6YD5HuSnWrxpoMvqC8gEbe7Piso8USHOEp0LXboHm7+VjTXHATBxi8IRFApPL7xqoLCm68hvXHV+0iBpR6pIyxE6WbGwVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by MN2PR11MB4695.namprd11.prod.outlook.com (2603:10b6:208:260::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Mon, 20 Jan
 2025 08:02:53 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%4]) with mapi id 15.20.8356.017; Mon, 20 Jan 2025
 08:02:53 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: David Hildenbrand <david@redhat.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>
CC: "syzbot+a504cb5bae4fe117ba94@syzkaller.appspotmail.com"
 <syzbot+a504cb5bae4fe117ba94@syzkaller.appspotmail.com>, Steve Sistare
 <steven.sistare@oracle.com>, Muchun Song <muchun.song@linux.dev>, "Andrew
 Morton" <akpm@linux-foundation.org>
Subject: RE: [PATCH v2 1/2] mm/memfd: reserve hugetlb folios before allocation
Thread-Topic: [PATCH v2 1/2] mm/memfd: reserve hugetlb folios before allocation
Thread-Index: AQHbZl+3lfkNkaG2WE6j0iGvFEUcbrMbNDKAgABhVfA=
Date: Mon, 20 Jan 2025 08:02:53 +0000
Message-ID: <IA0PR11MB7185CDA0B252819A61E20E8BF8E72@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20250114080927.2616684-1-vivek.kasireddy@intel.com>
 <20250114080927.2616684-2-vivek.kasireddy@intel.com>
 <6bdab899-3307-4a78-9352-b565ffae5ba8@redhat.com>
In-Reply-To: <6bdab899-3307-4a78-9352-b565ffae5ba8@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|MN2PR11MB4695:EE_
x-ms-office365-filtering-correlation-id: ca27c5b8-474f-485a-31f7-08dd3928d77d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?V3ducDhXTUlXUldiMWVQU3BYQ3I5eXJWeHdsQWhvQVUvNnpkQmoybTRGSEky?=
 =?utf-8?B?MlFENTVFQzlOSkxVbXk0MkxJTHRDUWNqYzVndnZhTUpnWDRTS2lMRjFveWVO?=
 =?utf-8?B?K3FwNGFraGJobmJnUXpTbWowOHowNWJvTU9SeEszbm1QVjU1dXdIU1V0WEpW?=
 =?utf-8?B?aVZLRU9GbXl6aXk4NzNrZmU3VTRxK2tneGl6OEpUK0paejA5ZUVFSVJmcTdC?=
 =?utf-8?B?RlVjQVRuTVNjdFV6SkVzTmtrSVBvT3k0dFVWTXZEd2NaZUVQUUZuMWt4elAw?=
 =?utf-8?B?TkhTeU95Z240Q2ZmbUUxT25NNWw0V08xWW0zejArQ0IyVHp2R3d2a1pkT0lp?=
 =?utf-8?B?NzdJRUlUeFVmb1pneCtwQVZvcTFORjJMYm40RDNlTEJSbXgwcXVXS2w3SzRw?=
 =?utf-8?B?YU9UZklVdlVvdFFDRUJyTHUxeEJUUVlySXcwdWtaZE5IajhvZlJid2FhU2J6?=
 =?utf-8?B?RXd4WDZTajd5K0I5MzJIOHZPY1dHRERMdlFsaGpmQXM4RVh5RExYS1kzRFJW?=
 =?utf-8?B?SlUrU1MrdERoT1RyMTUxVXZCeDRVaWRUSTFvalRSWG82Z1B4OHYvVHpybVY5?=
 =?utf-8?B?QU1Ld3A4MFVuTEtvK2xHR2xCcDNzWXEyTkFyb0pLZGJiMUsxTkxVZDkxUjBq?=
 =?utf-8?B?ODVRL3BoYXFIaEhOUUUwMUFlZGRLYjI0VWJ6ZG9INW1YR2wxV2c2U1pjMWFa?=
 =?utf-8?B?cEI5TmFCaEJrRnBxU3VZdlZabGppbkdXMkt0c2hSQkh5SEJHYTNuQWNCR2lw?=
 =?utf-8?B?aDF3NC8zdlBRdzAvcmZraHBYbnFCdXY0WEJadzl3QUNmMmJqVUM4U3RRZmdO?=
 =?utf-8?B?MXVQaklXZ2gvSDBZVERMcUg5ODk2YVNyWnBGS2lHdHBIM3VZSWZwSXpXRlk5?=
 =?utf-8?B?NEhHb0FOaS9yWjVmL2llL1VyTXdORFpVVEVxS20raEZEYmFHdk9XNzZIeWR0?=
 =?utf-8?B?cGxyNDN0cHA0S3J6M2drWEk5K1BxcFJxM3kyQzBWbjRkQ09jdlZVZkRoQlMv?=
 =?utf-8?B?ZE1pZUZyY2pCWXlEQ0RNWWpSeWdTZGEzTmZNNytIT2cvQzdHdnNHL29Ua2hz?=
 =?utf-8?B?bExCSm1ROTh3UjFBY0pRY256K1BNUGNIRk5IUkxFUTFDZGYwZDhQU1FSNkJo?=
 =?utf-8?B?cUdhOUFpWmxvVTZXS0JNeHJxTmNXVGZyZE5YdGVDVWFNWU1PeHF5elVzdVF0?=
 =?utf-8?B?bEg5U3RGVTBlYkcwaEUvb3VxSW1URG5EcVptV2liVEo0UlRFQnI0bXdxU1Fj?=
 =?utf-8?B?dndveVNoTS9DYXdsQnVJS3p1SXdZWUNlUGJVa3I2dkYvTjR6T1hsYkx3VHVX?=
 =?utf-8?B?LzBta1VqdWVUQ2xyMWRzc2lDZCs4cUprVGFIYldKVzFSWW1OS0ZTaEFINmJo?=
 =?utf-8?B?MU0zcklndXZ6ckg4VGhVTUpHcTQzeFgwOVlFTWxxTlV0NEJua2g3c3VkWEcy?=
 =?utf-8?B?UkZKUlFvb1ZndWJodE1ISkxVMVMxYlZraSs1Y3AwZG4yYWNvM2ZnZy9nVHIw?=
 =?utf-8?B?a3JFcGlJaE5kSCsrcElTdU5uL1lIS0hOZFo0QnpuKzlJa25PMk9qTTJjdmhY?=
 =?utf-8?B?NEJnQndZQU5pRDlLeC9pM0tGcXlla3dHRlRpZmNLSGNBb1hxd09LczRXVjZD?=
 =?utf-8?B?UmdzbWtUQVVtM2Jtem1McGwvK2xyNzMrMmV0RWRxNDdYZ3Y4YzJvcDA2TldP?=
 =?utf-8?B?ZS81M0t5UndQeFZMK294bmlnVHMxUWhFSEt4MEJhaGl4N1ZobVFnSURzZzVR?=
 =?utf-8?B?MHAzZHBXYk9KVVZjT2grUzNnK016dW1LUEYzTHhNc21aK2lNT3kzMDMxOVU4?=
 =?utf-8?B?eW4ra05aWHFPT1VoUlRFUGlpMnIwOWZFeEdXVXFDOW15ZTFibWJwQzFUbkVV?=
 =?utf-8?B?T3U5Z3dEUlR2S1JTRGhHWEVJd3JDYVB5RzhNdFYxcnVoMnR4VDVTRmdGckJu?=
 =?utf-8?Q?A/zVdVIXeqndihxExRk7wPKGIoAxAORV?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eHNLWW44eU1ZYXIwTnJYYWZnaU1aN0Jsa3pGRWNrVWFKTTRudVNZcG9rUTZC?=
 =?utf-8?B?SllnNytYUG9CZDV1QlBDTjl4VjdtOGtKSWErU0dxdXBnc1FpUEJiVm1TK0hS?=
 =?utf-8?B?MmFxTkh3ektKQUNwZjIyY3VUZWY1NTJ1cXdzTGpMdHp3Vm1ndktQY0xzS29X?=
 =?utf-8?B?WDBDUzlwWWRCbGJEaDRjYnYrTlB4MDFBRHcrbCtFKys2dUt3NnUxZmhxaWZ4?=
 =?utf-8?B?V3RLRURMTlpaY0tnMXZwd0pUZERLeTg3Y09EbFAraEcveVJzeTRPZDVBS0RZ?=
 =?utf-8?B?bXRLWXdWeE5qV0cxVk44R2M2dzI1M0FsRlVCcUdCdVhYQnhQTEtSdnB0K085?=
 =?utf-8?B?bktPT1prdVhZaTIrRzVxRFQyN1JxMnQ5UENTa0d2NWsvR0dLMVVGakhNNVE4?=
 =?utf-8?B?Q1ZtaXBEYzNRU1dUM29FMVNYdnh6Wkt2QjVSemN5R2VxUGZJY2NWMlcrL2Vo?=
 =?utf-8?B?TU54RlVnV3BpMnh0eWVlU0JBdUNjOXZ6Y00ycmh4ME8vemtuU0ZZdUl2OU1D?=
 =?utf-8?B?dEkrU3kxQ01TUUhqd0g0UlJ2UDljTUJndUNvQVkvTWd2UmNtK2p0N2tOZHBZ?=
 =?utf-8?B?RkdFTmdSK2tKckFaYUZrQnh1TWorWEJIOTBBQmduWmY4amhlS1BRaUFWZnJD?=
 =?utf-8?B?d1FXYlNEUENLei9LaCs2ckJTWHdLT0kxRFpsQ0ZQMmx5bi9WNjd4akIvbWc4?=
 =?utf-8?B?Z1REb0JjbUFFRG5PUS93VU1pNHN4NlR4cWoyTWIwVnNjbGhmZzJFUXAyY1pB?=
 =?utf-8?B?ZnY0cXJPWERGZWFlM1dCTXQ1SXlpK1lkbkJxRzJxL290VjYvWWNGODRjQXJ6?=
 =?utf-8?B?b2NpWGw5OE9aUDBkdzk3SjJHMlFYNndOTDE3RDJPcFZSQUgyN3g3K2t4SUdJ?=
 =?utf-8?B?Y2JSbHk4b0VhRFVtdmVOWVhVZFUyenlJY0xMSk9XZHh6a2FRcFRmR09GQUFX?=
 =?utf-8?B?Zjk5a0M0Qzc2NmlIZEVOcjVlVUVyOEhVbGZWRVl4cDZ5Mis5RU5ERkk0TWpC?=
 =?utf-8?B?Nlp0M2lyMXg0bWpKTWhiZ2RVdlA5Y0Vrby9mRE1uSDVsRWtDeW9nbFZSVDdv?=
 =?utf-8?B?OWRDUGVaci92R3pXQnQ3Um5DZHVybkpwdm1CVE9jRWhjcnA3STVpQ2k1R1Vo?=
 =?utf-8?B?YmQ0L2wwSFZ5WnN0ZFl1L08xaENCUU54ajl1aGNUcFQrd3VkeCtaREpoeFl1?=
 =?utf-8?B?R2llTEhTdDhIc3BRK083OHlTaG12akhlMzhlWEhIT0dHUHBRRngyNllOOFM2?=
 =?utf-8?B?VFVkS2RPcWpPWUVHM3JvdTdPcStGVUJueXhrTVFTR01abnJuNXpzakVwQ1Q0?=
 =?utf-8?B?RlhxVVpOTzQyci9SR1BsRzdTUnI1bnhLZ0dvc3Y0YVVwUzBFWmVlbmd3VWZr?=
 =?utf-8?B?dnh0aGl6ZTA5MlBsWnB4VXhCR0dZcGpFVUkvZjJjWk5wK1BhTStPeW9pYStQ?=
 =?utf-8?B?aUN5N01MM1h4YUt3bzFzQkN0MFZpeC9wWTlBSFdUYU5SNmtnNENrenZyU1d0?=
 =?utf-8?B?TjBkZEJ2WVV6L082cnBuV2I0VzdZYTBhbUZTa3lXQWhrNVJUaFBvSkI3b2Uv?=
 =?utf-8?B?dU56OTNxeFR5OGJ4NWpvbzhIZk4wemYxT21YTHBvaFVUU3loV1RTdk9RcEMz?=
 =?utf-8?B?QXRra2lDTzdZaXJaUU1ZM2JLL0QwY0NSeFBFMXRLVlhSaWJNVURhOVhNZFFk?=
 =?utf-8?B?VnVOUlFhYmdsbU5rblhMYlNuOFZCNlN5Ukl4VHBhaitpYmdhWGt0QTBNK2d5?=
 =?utf-8?B?VEs5ampTcjVtTS9qclQ3MFRDODhENnROcnpTUTlmVjVZRlhXOTlhQ2hkS1ov?=
 =?utf-8?B?MUp3UTU2RXk4YjUvQ2Z0MExsQlpLbDdJNkdzMkxsTm0rRzlmVGdrR2EzS1cv?=
 =?utf-8?B?a2xxZlczQVd0OWRsSjN0Ky93VXQxY2xoRXk1TnBBZ0plUGVSVm44a2hSdGgw?=
 =?utf-8?B?MGhadnM4T1BPaWJyTjkvbGkxVFZBNDN0Mm5nTG1WaEFrUVVZOFhOSlB2K3ZI?=
 =?utf-8?B?Y2JoK3c0clRjN1p1RVBHZDFQMGRBUmt1Nm9RSVRoZTJPVVc5eCt2dEwxa1JY?=
 =?utf-8?B?K0V2T3dibmxIZlJidWFWZHBlQTZ6eFp3b1FhTXptSkg3MUxwYkY2S0Nrd2NW?=
 =?utf-8?Q?qnzhJpOVB2peEeA3UruJJBTuY?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca27c5b8-474f-485a-31f7-08dd3928d77d
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2025 08:02:53.2686 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DoUbzOpg8WWxDKKOR3UKzsfEBX3ZIYM7BsEXZHbhdouGzbb3VKVyV8hs1oUoa/jEH8DlidwvXJUyLreRhlpP1rMlIo+M+Xgb/1eyyHfV7zs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4695
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

SGkgRGF2aWQsDQoNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAxLzJdIG1tL21lbWZkOiByZXNl
cnZlIGh1Z2V0bGIgZm9saW9zIGJlZm9yZQ0KPiBhbGxvY2F0aW9uDQo+IA0KPiBPbiAxNC4wMS4y
NSAwOTowOCwgVml2ZWsgS2FzaXJlZGR5IHdyb3RlOg0KPiA+IFRoZXJlIGFyZSBjYXNlcyB3aGVu
IHdlIHRyeSB0byBwaW4gYSBmb2xpbyBidXQgZGlzY292ZXIgdGhhdCBpdCBoYXMNCj4gPiBub3Qg
YmVlbiBmYXVsdGVkLWluLiBTbywgd2UgdHJ5IHRvIGFsbG9jYXRlIGl0IGluIG1lbWZkX2FsbG9j
X2ZvbGlvKCkNCj4gPiBidXQgdGhlcmUgaXMgYSBjaGFuY2UgdGhhdCB3ZSBtaWdodCBlbmNvdW50
ZXIgYSBjcmFzaC9mYWlsdXJlDQo+ID4gKFZNX0JVR19PTighaC0+cmVzdl9odWdlX3BhZ2VzKSkg
aWYgdGhlcmUgYXJlIG5vIGFjdGl2ZSByZXNlcnZhdGlvbnMNCj4gPiBhdCB0aGF0IGluc3RhbnQu
IFRoaXMgaXNzdWUgd2FzIHJlcG9ydGVkIGJ5IHN5emJvdDoNCj4gPg0KPiA+IGtlcm5lbCBCVUcg
YXQgbW0vaHVnZXRsYi5jOjI0MDMhDQo+ID4gT29wczogaW52YWxpZCBvcGNvZGU6IDAwMDAgWyMx
XSBQUkVFTVBUIFNNUCBLQVNBTiBOT1BUSQ0KPiA+IENQVTogMCBVSUQ6IDAgUElEOiA1MzE1IENv
bW06IHN5ei4wLjAgTm90IHRhaW50ZWQNCj4gPiA2LjEzLjAtcmM1LXN5emthbGxlci0wMDE2MS1n
NjM2NzZlZWZiN2EwICMwDQo+ID4gSGFyZHdhcmUgbmFtZTogUUVNVSBTdGFuZGFyZCBQQyAoUTM1
ICsgSUNIOSwgMjAwOSksIEJJT1MNCj4gPiAxLjE2LjMtZGViaWFuLTEuMTYuMy0yfmJwbzEyKzEg
MDQvMDEvMjAxNA0KPiA+IFJJUDogMDAxMDphbGxvY19odWdldGxiX2ZvbGlvX3Jlc2VydmUrMHhi
Yy8weGMwIG1tL2h1Z2V0bGIuYzoyNDAzDQo+ID4gQ29kZTogMWYgZWIgMDUgZTggNTYgMTggYTAg
ZmYgNDggYzcgYzcgNDAgNTYgNjEgOGUgZTggYmEgMjEgY2MgMDkgNGMgODkNCj4gPiBmMCA1YiA0
MSA1YyA0MSA1ZSA0MSA1ZiA1ZCBjMyBjYyBjYyBjYyBjYyBlOCAzNSAxOCBhMCBmZiA5MCA8MGY+
IDBiIDY2DQo+ID4gOTAgOTAgOTAgOTAgOTAgOTAgOTAgOTAgOTAgOTAgOTAgOTAgOTAgOTAgOTAg
OTAgOTAgZjMgMGYNCj4gPiBSU1A6IDAwMTg6ZmZmZmM5MDAwZDNkNzdmOCBFRkxBR1M6IDAwMDEw
MDg3DQo+ID4gUkFYOiBmZmZmZmZmZjgxZmY2YmViIFJCWDogMDAwMDAwMDAwMDAwMDAwMCBSQ1g6
IDAwMDAwMDAwMDAxMDAwMDANCj4gPiBSRFg6IGZmZmZjOTAwMGU1MWEwMDAgUlNJOiAwMDAwMDAw
MDAwMDAwM2VjIFJESTogMDAwMDAwMDAwMDAwMDNlZA0KPiA+IFJCUDogMWZmZmZmZmZmMzQ4MTBk
OSBSMDg6IGZmZmZmZmZmODFmZjZiYTMgUjA5OiAxZmZmZmQ0MDAwMDkzMDA1DQo+ID4gUjEwOiBk
ZmZmZmMwMDAwMDAwMDAwIFIxMTogZmZmZmY5NDAwMDA5MzAwNiBSMTI6IGRmZmZmYzAwMDAwMDAw
MDANCj4gPiBSMTM6IGRmZmZmYzAwMDAwMDAwMDAgUjE0OiBmZmZmZWEwMDAwNDk4MDAwIFIxNTog
ZmZmZmZmZmY5YTQwODZjOA0KPiA+IEZTOiAgMDAwMDdmNzdhYzEyZTZjMCgwMDAwKSBHUzpmZmZm
ODg4MDFmYzAwMDAwKDAwMDApDQo+ID4ga25sR1M6MDAwMDAwMDAwMDAwMDAwMA0KPiA+IENTOiAg
MDAxMCBEUzogMDAwMCBFUzogMDAwMCBDUjA6IDAwMDAwMDAwODAwNTAwMzMNCj4gPiBDUjI6IDAw
MDA3Zjc3YWI1NGIxNzAgQ1IzOiAwMDAwMDAwMDQwYjcwMDAwIENSNDogMDAwMDAwMDAwMDM1MmVm
MA0KPiA+IERSMDogMDAwMDAwMDAwMDAwMDAwMCBEUjE6IDAwMDAwMDAwMDAwMDAwMDAgRFIyOiAw
MDAwMDAwMDAwMDAwMDAwDQo+ID4gRFIzOiAwMDAwMDAwMDAwMDAwMDAwIERSNjogMDAwMDAwMDBm
ZmZlMGZmMCBEUjc6IDAwMDAwMDAwMDAwMDA0MDANCj4gPiBDYWxsIFRyYWNlOg0KPiA+ICAgPFRB
U0s+DQo+ID4gICBtZW1mZF9hbGxvY19mb2xpbysweDFiZC8weDM3MCBtbS9tZW1mZC5jOjg4DQo+
ID4gICBtZW1mZF9waW5fZm9saW9zKzB4ZjEwLzB4MTU3MCBtbS9ndXAuYzozNzUwDQo+ID4gICB1
ZG1hYnVmX3Bpbl9mb2xpb3MgZHJpdmVycy9kbWEtYnVmL3VkbWFidWYuYzozNDYgW2lubGluZV0N
Cj4gPiAgIHVkbWFidWZfY3JlYXRlKzB4NzBlLzB4MTBjMCBkcml2ZXJzL2RtYS1idWYvdWRtYWJ1
Zi5jOjQ0Mw0KPiA+ICAgdWRtYWJ1Zl9pb2N0bF9jcmVhdGUgZHJpdmVycy9kbWEtYnVmL3VkbWFi
dWYuYzo0OTUgW2lubGluZV0NCj4gPiAgIHVkbWFidWZfaW9jdGwrMHgzMDEvMHg0ZTAgZHJpdmVy
cy9kbWEtYnVmL3VkbWFidWYuYzo1MjYNCj4gPiAgIHZmc19pb2N0bCBmcy9pb2N0bC5jOjUxIFtp
bmxpbmVdDQo+ID4gICBfX2RvX3N5c19pb2N0bCBmcy9pb2N0bC5jOjkwNiBbaW5saW5lXQ0KPiA+
ICAgX19zZV9zeXNfaW9jdGwrMHhmNS8weDE3MCBmcy9pb2N0bC5jOjg5Mg0KPiA+ICAgZG9fc3lz
Y2FsbF94NjQgYXJjaC94ODYvZW50cnkvY29tbW9uLmM6NTIgW2lubGluZV0NCj4gPiAgIGRvX3N5
c2NhbGxfNjQrMHhmMy8weDIzMCBhcmNoL3g4Ni9lbnRyeS9jb21tb24uYzo4Mw0KPiA+ICAgZW50
cnlfU1lTQ0FMTF82NF9hZnRlcl9od2ZyYW1lKzB4NzcvMHg3Zg0KPiA+DQo+ID4gVGhlcmVmb3Jl
LCB0byBhdm9pZCB0aGlzIHNpdHVhdGlvbiBhbmQgZml4IHRoaXMgaXNzdWUsIHdlIGp1c3QgbmVl
ZA0KPiA+IHRvIG1ha2UgYSByZXNlcnZhdGlvbiAoYnkgY2FsbGluZyBodWdldGxiX3Jlc2VydmVf
cGFnZXMoKSkgYmVmb3JlDQo+ID4gd2UgdHJ5IHRvIGFsbG9jYXRlIHRoZSBmb2xpby4gVGhpcyB3
aWxsIGVuc3VyZSB0aGF0IHdlIGFyZSBwcm9wZXJseQ0KPiA+IGRvaW5nIHJlZ2lvbi9zdWJwb29s
IGFjY291bnRpbmcgYXNzb2NpYXRlZCB3aXRoIG91ciBhbGxvY2F0aW9uLg0KPiA+DQo+ID4gV2hp
bGUgYXQgaXQsIG1vdmUgc3VicG9vbF9pbm9kZSgpIGludG8gaHVnZXRsYiBoZWFkZXIgYW5kIGFs
c28NCj4gPiByZXBsYWNlIHRoZSBWTV9CVUdfT04oKSB3aXRoIFdBUk5fT05fT05DRSgpIGFzIHRo
ZXJlIGlzIG5vIG5lZWQgdG8NCj4gPiBjcmFzaCB0aGUgc3lzdGVtIGluIHRoaXMgc2NlbmFyaW8g
YW5kIGluc3RlYWQgd2UgY291bGQganVzdCB3YXJuDQo+ID4gYW5kIGZhaWwgdGhlIGFsbG9jYXRp
b24uDQo+ID4NCj4gPiBGaXhlczogMjZhOGVhODA5MjljICgibW0vaHVnZXRsYjogZml4IG1lbWZk
X3Bpbl9mb2xpb3MgcmVzdl9odWdlX3BhZ2VzDQo+IGxlYWsiKQ0KPiA+IFJlcG9ydGVkLWJ5OiBz
eXpib3QrYTUwNGNiNWJhZTRmZTExN2JhOTRAc3l6a2FsbGVyLmFwcHNwb3RtYWlsLmNvbQ0KPiA+
IFNpZ25lZC1vZmYtYnk6IFZpdmVrIEthc2lyZWRkeSA8dml2ZWsua2FzaXJlZGR5QGludGVsLmNv
bT4NCj4gPiBDYzogU3RldmUgU2lzdGFyZSA8c3RldmVuLnNpc3RhcmVAb3JhY2xlLmNvbT4NCj4g
PiBDYzogTXVjaHVuIFNvbmcgPG11Y2h1bi5zb25nQGxpbnV4LmRldj4NCj4gPiBDYzogRGF2aWQg
SGlsZGVuYnJhbmQgPGRhdmlkQHJlZGhhdC5jb20+DQo+ID4gQ2M6IEFuZHJldyBNb3J0b24gPGFr
cG1AbGludXgtZm91bmRhdGlvbi5vcmc+DQo+ID4gLS0tDQo+ID4gICBpbmNsdWRlL2xpbnV4L2h1
Z2V0bGIuaCB8ICA1ICsrKysrDQo+ID4gICBtbS9odWdldGxiLmMgICAgICAgICAgICB8IDE0ICsr
KysrKy0tLS0tLS0tDQo+ID4gICBtbS9tZW1mZC5jICAgICAgICAgICAgICB8IDE0ICsrKysrKysr
KysrLS0tDQo+ID4gICAzIGZpbGVzIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKyksIDExIGRlbGV0
aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvaHVnZXRsYi5oIGIv
aW5jbHVkZS9saW51eC9odWdldGxiLmgNCj4gPiBpbmRleCBhZTRmZTg2MTViYjYuLjM4YzU4MDU0
ODU2NCAxMDA2NDQNCj4gPiAtLS0gYS9pbmNsdWRlL2xpbnV4L2h1Z2V0bGIuaA0KPiA+ICsrKyBi
L2luY2x1ZGUvbGludXgvaHVnZXRsYi5oDQo+ID4gQEAgLTcxMiw2ICs3MTIsMTEgQEAgZXh0ZXJu
IHVuc2lnbmVkIGludCBkZWZhdWx0X2hzdGF0ZV9pZHg7DQo+ID4NCj4gPiAgICNkZWZpbmUgZGVm
YXVsdF9oc3RhdGUgKGhzdGF0ZXNbZGVmYXVsdF9oc3RhdGVfaWR4XSkNCj4gPg0KPiA+ICtzdGF0
aWMgaW5saW5lIHN0cnVjdCBodWdlcGFnZV9zdWJwb29sICpzdWJwb29sX2lub2RlKHN0cnVjdCBp
bm9kZQ0KPiAqaW5vZGUpDQo+ID4gK3sNCj4gPiArCXJldHVybiBIVUdFVExCRlNfU0IoaW5vZGUt
Pmlfc2IpLT5zcG9vbDsNCj4gPiArfQ0KPiA+ICsNCj4gPiAgIHN0YXRpYyBpbmxpbmUgc3RydWN0
IGh1Z2VwYWdlX3N1YnBvb2wgKmh1Z2V0bGJfZm9saW9fc3VicG9vbChzdHJ1Y3QgZm9saW8NCj4g
KmZvbGlvKQ0KPiA+ICAgew0KPiA+ICAgCXJldHVybiBmb2xpby0+X2h1Z2V0bGJfc3VicG9vbDsN
Cj4gPiBkaWZmIC0tZ2l0IGEvbW0vaHVnZXRsYi5jIGIvbW0vaHVnZXRsYi5jDQo+ID4gaW5kZXgg
YzQ5ODg3NGE3MTcwLi5lZjk0OGY1NmI4NjQgMTAwNjQ0DQo+ID4gLS0tIGEvbW0vaHVnZXRsYi5j
DQo+ID4gKysrIGIvbW0vaHVnZXRsYi5jDQo+ID4gQEAgLTI1MSwxMSArMjUxLDYgQEAgc3RhdGlj
IGxvbmcgaHVnZXBhZ2Vfc3VicG9vbF9wdXRfcGFnZXMoc3RydWN0DQo+IGh1Z2VwYWdlX3N1YnBv
b2wgKnNwb29sLA0KPiA+ICAgCXJldHVybiByZXQ7DQo+ID4gICB9DQo+ID4NCj4gPiAtc3RhdGlj
IGlubGluZSBzdHJ1Y3QgaHVnZXBhZ2Vfc3VicG9vbCAqc3VicG9vbF9pbm9kZShzdHJ1Y3QgaW5v
ZGUNCj4gKmlub2RlKQ0KPiA+IC17DQo+ID4gLQlyZXR1cm4gSFVHRVRMQkZTX1NCKGlub2RlLT5p
X3NiKS0+c3Bvb2w7DQo+ID4gLX0NCj4gPiAtDQo+ID4gICBzdGF0aWMgaW5saW5lIHN0cnVjdCBo
dWdlcGFnZV9zdWJwb29sICpzdWJwb29sX3ZtYShzdHJ1Y3QNCj4gdm1fYXJlYV9zdHJ1Y3QgKnZt
YSkNCj4gPiAgIHsNCj4gPiAgIAlyZXR1cm4gc3VicG9vbF9pbm9kZShmaWxlX2lub2RlKHZtYS0+
dm1fZmlsZSkpOw0KPiA+IEBAIC0yMzk3LDEyICsyMzkyLDE1IEBAIHN0cnVjdCBmb2xpbyAqYWxs
b2NfaHVnZXRsYl9mb2xpb19yZXNlcnZlKHN0cnVjdA0KPiBoc3RhdGUgKmgsIGludCBwcmVmZXJy
ZWRfbmlkLA0KPiA+ICAgCXN0cnVjdCBmb2xpbyAqZm9saW87DQo+ID4NCj4gPiAgIAlzcGluX2xv
Y2tfaXJxKCZodWdldGxiX2xvY2spOw0KPiA+ICsJaWYgKFdBUk5fT05fT05DRSghaC0+cmVzdl9o
dWdlX3BhZ2VzKSkgew0KPiA+ICsJCXNwaW5fdW5sb2NrX2lycSgmaHVnZXRsYl9sb2NrKTsNCj4g
PiArCQlyZXR1cm4gTlVMTDsNCj4gPiArCX0NCj4gPiArDQo+ID4gICAJZm9saW8gPSBkZXF1ZXVl
X2h1Z2V0bGJfZm9saW9fbm9kZW1hc2soaCwgZ2ZwX21hc2ssDQo+IHByZWZlcnJlZF9uaWQsDQo+
ID4gICAJCQkJCSAgICAgICBubWFzayk7DQo+ID4gLQlpZiAoZm9saW8pIHsNCj4gPiAtCQlWTV9C
VUdfT04oIWgtPnJlc3ZfaHVnZV9wYWdlcyk7DQo+ID4gKwlpZiAoZm9saW8pDQo+ID4gICAJCWgt
PnJlc3ZfaHVnZV9wYWdlcy0tOw0KPiA+IC0JfQ0KPiA+DQo+ID4gICAJc3Bpbl91bmxvY2tfaXJx
KCZodWdldGxiX2xvY2spOw0KPiA+ICAgCXJldHVybiBmb2xpbzsNCj4gPiBkaWZmIC0tZ2l0IGEv
bW0vbWVtZmQuYyBiL21tL21lbWZkLmMNCj4gPiBpbmRleCAzNWEzNzBkNzVjOWEuLjBkMTI4YzQ0
ZmI3OCAxMDA2NDQNCj4gPiAtLS0gYS9tbS9tZW1mZC5jDQo+ID4gKysrIGIvbW0vbWVtZmQuYw0K
PiA+IEBAIC03MCw3ICs3MCw3IEBAIHN0cnVjdCBmb2xpbyAqbWVtZmRfYWxsb2NfZm9saW8oc3Ry
dWN0IGZpbGUgKm1lbWZkLA0KPiBwZ29mZl90IGlkeCkNCj4gPiAgICNpZmRlZiBDT05GSUdfSFVH
RVRMQl9QQUdFDQo+ID4gICAJc3RydWN0IGZvbGlvICpmb2xpbzsNCj4gPiAgIAlnZnBfdCBnZnBf
bWFzazsNCj4gPiAtCWludCBlcnI7DQo+ID4gKwlpbnQgZXJyID0gLUVOT01FTTsNCj4gPg0KPiA+
ICAgCWlmIChpc19maWxlX2h1Z2VwYWdlcyhtZW1mZCkpIHsNCj4gPiAgIAkJLyoNCj4gPiBAQCAt
NzksMTIgKzc5LDE2IEBAIHN0cnVjdCBmb2xpbyAqbWVtZmRfYWxsb2NfZm9saW8oc3RydWN0IGZp
bGUgKm1lbWZkLA0KPiBwZ29mZl90IGlkeCkNCj4gPiAgIAkJICogYWxsb2MgZnJvbS4gQWxzbywg
dGhlIGZvbGlvIHdpbGwgYmUgcGlubmVkIGZvciBhbiBpbmRlZmluaXRlDQo+ID4gICAJCSAqIGFt
b3VudCBvZiB0aW1lLCBzbyBpdCBpcyBub3QgZXhwZWN0ZWQgdG8gYmUgbWlncmF0ZWQgYXdheS4N
Cj4gPiAgIAkJICovDQo+ID4gKwkJc3RydWN0IGlub2RlICppbm9kZSA9IGZpbGVfaW5vZGUobWVt
ZmQpOw0KPiA+ICAgCQlzdHJ1Y3QgaHN0YXRlICpoID0gaHN0YXRlX2ZpbGUobWVtZmQpOw0KPiA+
DQo+ID4gICAJCWdmcF9tYXNrID0gaHRsYl9hbGxvY19tYXNrKGgpOw0KPiA+ICAgCQlnZnBfbWFz
ayAmPSB+KF9fR0ZQX0hJR0hNRU0gfCBfX0dGUF9NT1ZBQkxFKTsNCj4gPiAgIAkJaWR4ID4+PSBo
dWdlX3BhZ2Vfb3JkZXIoaCk7DQo+ID4NCj4gPiArCQlpZiAoIWh1Z2V0bGJfcmVzZXJ2ZV9wYWdl
cyhpbm9kZSwgaWR4LCBpZHggKyAxLCBOVUxMLCAwKSkNCj4gPiArCQkJcmV0dXJuIEVSUl9QVFIo
ZXJyKTsNCj4gPiArDQo+ID4gICAJCWZvbGlvID0gYWxsb2NfaHVnZXRsYl9mb2xpb19yZXNlcnZl
KGgsDQo+ID4gICAJCQkJCQkgICAgbnVtYV9ub2RlX2lkKCksDQo+ID4gICAJCQkJCQkgICAgTlVM
TCwNCj4gPiBAQCAtOTUsMTIgKzk5LDE2IEBAIHN0cnVjdCBmb2xpbyAqbWVtZmRfYWxsb2NfZm9s
aW8oc3RydWN0IGZpbGUgKm1lbWZkLA0KPiBwZ29mZl90IGlkeCkNCj4gPiAgIAkJCQkJCQlpZHgp
Ow0KPiA+ICAgCQkJaWYgKGVycikgew0KPiA+ICAgCQkJCWZvbGlvX3B1dChmb2xpbyk7DQo+ID4g
LQkJCQlyZXR1cm4gRVJSX1BUUihlcnIpOw0KPiA+ICsJCQkJZ290byBlcnI7DQo+ID4gICAJCQl9
DQo+ID4gKw0KPiA+ICsJCQlodWdldGxiX3NldF9mb2xpb19zdWJwb29sKGZvbGlvLA0KPiBzdWJw
b29sX2lub2RlKGlub2RlKSk7DQo+ID4gICAJCQlmb2xpb191bmxvY2soZm9saW8pOw0KPiA+ICAg
CQkJcmV0dXJuIGZvbGlvOw0KPiA+ICAgCQl9DQo+ID4gLQkJcmV0dXJuIEVSUl9QVFIoLUVOT01F
TSk7DQo+ID4gK2VycjoNCj4gPiArCQlodWdldGxiX3VucmVzZXJ2ZV9wYWdlcyhpbm9kZSwgaWR4
LCBpZHggKyAxLCAwKTsNCj4gDQo+IEhtbW0sIHNob3VsZG4ndCB3ZSBtYXliZSBvbmx5IHVuLXJl
c2VydmUgaWYgd2Ugd2VyZSByZXNwb25zaWJsZSBmb3IgdGhlDQo+IHJlc2VydmF0aW9uIGFib3Zl
Pw0KR29vZCBjYXRjaCEgWWVzLCBJIGFncmVlIHRoYXQgdW4tcmVzZXJ2aW5nLCBvbmx5IGlmIHdl
IHdlcmUgcmVzcG9uc2libGUgZm9yDQp0aGUgcmVzZXJ2YXRpb24gaXMgdGhlIHJpZ2h0IHRoaW5n
IHRvIGRvIGluIHRoaXMgY2FzZS4NCg0KPiANCj4gSWYgaXQncyBhbHJlYWR5IHJlc2VydmVkIGJl
Zm9yZSB0aGlzIGNhbGwsIHdlIHNob3VsZCBwcm9iYWJseSBsZWF2ZSBpdA0KPiBhcyBpcz8NClll
YWgsIHRoYXQgbWFrZXMgc2Vuc2UuIEhvd2V2ZXIsIHRoZXJlIGlzIGN1cnJlbnRseSBubyB3YXkg
dG8ga25vdyBpZiBhIHJhbmdlIGhhcw0KYWxyZWFkeSBiZWVuIHJlc2VydmVkIG9yIG5vdC4gT25l
IG9wdGlvbiBJIGNhbiB0aGluayBvZiBpcyB0byBoYXZlIGh1Z2V0bGJfcmVzZXJ2ZV9wYWdlcygp
DQpwcm92aWRlIHJldHVybiBpbmZvIChucl9yZXNlcnZlZD8pIGFib3V0IGhvdyBtYW55IHBhZ2Vz
IHdlcmUgc3VjY2Vzc2Z1bGx5IHJlc2VydmVkLg0KVGhpcyB3YXkgd2UgY2FuIGtub3cgaWYgd2Ug
d2VyZSB0aGUgb25lcyByZXNwb25zaWJsZSBmb3IgdGhlIHJlc2VydmF0aW9uLg0KDQo+IA0KPiBP
ciBtYXliZSB3ZSBuZXZlciB3YW50IHRvIHVuLXJlc2VydmUgYXQgYWxsIGhlcmU/DQpUaGF0IGFs
c28gc2VlbXMgdG8gYmUgYW4gb3B0aW9uLiBBRkFJQ1MsIHVuLXJlc2VydmluZyBvbmx5IGFwcGVh
cnMgdG8gaGFwcGVuIGFzDQpwYXJ0IG9mIHRydW5jYXRlL2hvbGUgcHVuY2gvaW5vZGUgZXZpY3Rp
b24gYW5kIG5vdCBpZiBodWdldGxiX2ZhdWx0KCkgZmFpbHMuIFVubGVzcw0KSSBhbSBvdmVybG9v
a2luZyBzb21ldGhpbmcsIG5vdCBjYWxsaW5nIGh1Z2V0bGJfdW5yZXNlcnZlX3BhZ2VzKCkgaWYg
YWxsb2NhdGlvbg0KZmFpbHMgc2VlbXMgdG8gYmUgT0suDQoNClRoYW5rcywNClZpdmVrDQoNCj4g
DQo+IC0tDQo+IENoZWVycywNCj4gDQo+IERhdmlkIC8gZGhpbGRlbmINCg0K
