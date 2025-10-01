Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E76ACBAF0E6
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 05:11:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7837B10E641;
	Wed,  1 Oct 2025 03:11:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mdMgFgAL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF82E10E641
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 03:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759288295; x=1790824295;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=D/4GHX2mYWmptae1Ht1f2l/VH7Lhoih39RVUSzHD4bI=;
 b=mdMgFgALELNvSxbosZSTDTS/yAqmiFA2lDquw3KT8b3aUR0uAjUS9HMg
 RZapdSLtMav+1G+iN7YXhjdlgChmJpSMgZMLLPCV9OHLH+LqRHorX6YOX
 qFHcjYXT8Yyc2237TKtz4O90/KLwiB8a+y5YiDGeiZvFiyB7HpKfFn3rY
 crqRpSBC9NADcPSibehP2+lfgspnhL61ROsaR773ssdAg/C1EskQrz4aZ
 0xxgaUaWT/xU7leuLYY+r9sV2f9c6QQUli1GAvLM2m1a+MKmFVixF+VbD
 7Gxv2algOOMOgceA2bsqlCinrJfANJ4xQeA9+Tz3vCZ0nIPjEvOOjtg/a g==;
X-CSE-ConnectionGUID: WvGbWzoCSZuZqYQ+noz0Gw==
X-CSE-MsgGUID: +3wY1l1GQUSGSlVoumaNsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="61264785"
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; d="scan'208";a="61264785"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 20:11:35 -0700
X-CSE-ConnectionGUID: 7ElstKERTtuqkuPzD0qmOA==
X-CSE-MsgGUID: QJrOcHNfQuaURR5WMUeD3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; d="scan'208";a="182704608"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 20:11:34 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 20:11:33 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 30 Sep 2025 20:11:33 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.19) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 20:11:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hszbJl2GHAhAShRyY/ZfZ6wmzPTe3DxgaZ9dUAeL2yy/P7Zu4QyRo0g0T929aPxQXEjef+2rO7U+CHM1vXuaNBlZ0yJcW4N+HXQgH+RK9ee9rXBy5IjWovusB+uriWwIOAIfPSPYgvwEY3m3kXEgL7oUvZeoK+29C6XZG6smfiljCpKoKQec4kB/OgEq12XQhkkAHcbr7i1aiNu5kMS56BUmIJhnoV0YguVyALc082PBhMGuduyptpzVclYlRr4e7fmTcCD79WAEAI6VilPqF5ZvAB2hWw/+CCyyhF4la2vc9huQe8gAQqjgMnLZ2yXmMhUSBhCCia7qXOPRpF4jqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D/4GHX2mYWmptae1Ht1f2l/VH7Lhoih39RVUSzHD4bI=;
 b=oueFGGE9tO2F2xBCH2zyYXQoW8B4bkqkbBs0SuNBJ6i0ApmA3QiHQPBhZg8sioK2wrlV1WDGbWR/tO0NqA4osbmYTQtsFhUaOvQhDuax43n1aiw0C16KKeKLsBJOkkvr3rG2wZxNGrxBdchpWbaHw1IFm0rSW16PKNNvy77GJy4AwxGOpte4pCPZJ8Imr9QntsfKvMqoz5waPQAw9MUJTC2hh2aOuXTva4+lWftzBMcvs082mcLw5tHikajcyyQhI8deJwP0RQOnxjCrK5kCqa2Qxg1i6LWEGJXLQdNWhLiOe4dQ1O49abetCu2NFAq8A1NLm3kLitFA8xf8DqxszA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5112.namprd11.prod.outlook.com (2603:10b6:510:3b::18)
 by SA3PR11MB7625.namprd11.prod.outlook.com (2603:10b6:806:305::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Wed, 1 Oct
 2025 03:11:31 +0000
Received: from PH0PR11MB5112.namprd11.prod.outlook.com
 ([fe80::b6b7:41ec:7dc8:773]) by PH0PR11MB5112.namprd11.prod.outlook.com
 ([fe80::b6b7:41ec:7dc8:773%6]) with mapi id 15.20.9160.017; Wed, 1 Oct 2025
 03:11:31 +0000
From: "Kim, Dongwon" <dongwon.kim@intel.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v4 0/3] Virtio-GPU S4 support
Thread-Topic: [PATCH v4 0/3] Virtio-GPU S4 support
Thread-Index: AQHcMn+MpD5udzZ8L0uecF3EK7yF0LSsmlpggAACk+A=
Date: Wed, 1 Oct 2025 03:11:31 +0000
Message-ID: <PH0PR11MB51124DBAAC54C2AFAA94B5E4FAE6A@PH0PR11MB5112.namprd11.prod.outlook.com>
References: <20250924194755.1265531-1-dongwon.kim@intel.com>
 <2bbe0b9a-b0bb-4dbc-901e-1162791eb437@collabora.com>
 <PH0PR11MB51120592EE7474A289D98970FAE6A@PH0PR11MB5112.namprd11.prod.outlook.com>
In-Reply-To: <PH0PR11MB51120592EE7474A289D98970FAE6A@PH0PR11MB5112.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5112:EE_|SA3PR11MB7625:EE_
x-ms-office365-filtering-correlation-id: 7025e926-a707-4fb3-8f25-08de0098384a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?eWZJc3U2TllISlRQYzMwaVNaS1Vrbng3NnIvZ2lFYmdVYWN0MHpjbGV1NEV0?=
 =?utf-8?B?MC9GZXlFSGMzaGVmTzU2eFFKZ1pXekRrQkZjckJ0VnFSZnAvbTFRdTE0OXJt?=
 =?utf-8?B?YlFyU2lsN2tnOXlXclRJcU94M3VEcnNBMjFtSXVJeHpsc0J3Z2RzMm5rVjhI?=
 =?utf-8?B?NzdxcnFxeGdJbWhrQ3hORXVkZkNnTms5aFE1b2ZvY25MUXVPRlpPRGlwZGVH?=
 =?utf-8?B?WEZxU085L201VW1udjh6eS9uRzdLazhkVm91aVZFZTRETFZoNDI0dVhoY1Bv?=
 =?utf-8?B?dGJGMStxRDQ0NWtSa25ZTTFDM3l3UlNENWp0dWliQ041Qnk1ZnRKSkZQZEhG?=
 =?utf-8?B?aXlHdlJQdVdXczJBcmcrZjBhN3dqWGpxdmpUclhWS1hMenI5OUg5NE9lWnBw?=
 =?utf-8?B?RkhXZUkvblE3YUxiQWNoOTUrUlc1SHN5SzNkY3R5WU5naVhVWmwvN2VGMnc1?=
 =?utf-8?B?TklRSldxYW1DOERBRTYzdlU4UzdFU0VPMGpxOW9mRkRRUlVwcE9qMjZLZ0Fy?=
 =?utf-8?B?ZXNHTVA5OHNSMmNCcUxEVFZBMVRrV3Y4K050S09WZFZtQTlocGhpam5iSEZk?=
 =?utf-8?B?aDE5YWVVd3oxYWhxUHZnMHNzdFMwTGc2RCtjN1hKWmRZUGNpd1Z0a2h1YmFw?=
 =?utf-8?B?TStHZlJWVHZHSEdLeWU5dlFtMldYdlBNaXVpSFFNdmtINXh5dDFlcFZtQmZ2?=
 =?utf-8?B?dmtKL3ZTNGNWSkx0Q2dBQllCNDNYYXNFck9PbGI5STI0MjBGdnUwQmxuRmFh?=
 =?utf-8?B?RU1obWJYZXpFOWZWMGJaNWR5NHVkQVRiV1RxZGpBbkFoZkNtZkRpVXB5L3Vw?=
 =?utf-8?B?QVY0b1JBMUthU2J5OWJvaDhraGQ4Q0tYelRtTUVCWC9lc1NXQmljMWVhbjFO?=
 =?utf-8?B?UHNxRGxMNG1XcnZsMnkvbXNveFFPQ0JRL2FrSmYvSHdRWG9YUGh6SFdTWjZi?=
 =?utf-8?B?ZkR0N2gxMjFIQ3I3ajZuNndqMlpSZ2xKVDgrOTQ4RzY5STBrbzVXbFVBUURo?=
 =?utf-8?B?YVoxU0YwRk0rMmIxc0FVWmxiRmNaVVhncGtza21VKzl4OFk5MWpvRzBNNGdT?=
 =?utf-8?B?MnM4ZjAzNWJIeFpLY211RU10Y0xCZDdYdWJjQjFGcUNoNG84UVF5OEp1ZE93?=
 =?utf-8?B?TlNBL1IrSHZUV1hZUVNMVWlROWhvUytaem5Cdi8wNDZNc01NQnNJMlU4aHdr?=
 =?utf-8?B?SFJJY3JDV1dsWlA5N3l4N0dTSEE0Q2Q5MHlNbEw1YmE3VWtXSWlLeDBId2Nz?=
 =?utf-8?B?UW8vUlFLeDJCSDFIMDhKVG9WTjJWVUVtSXZFUUFZRlR2SnNNYjlIb1c2NUZl?=
 =?utf-8?B?K3lZcW0wcjg5SmJwSUlVMThRMEkxc1NjVnVPbTJ1WEZwd3NZWWszYlZ5dmh1?=
 =?utf-8?B?dmJLSExVUXNPV3pOMzY1b1c3R0NJbjR1MDBHWlVVMHVRUE9uc1hDd21CZmI5?=
 =?utf-8?B?K1F0U3FyOEwzUkdBZDNGc3ZHc2VoTFByc2xYRHJRd3ljcmdIWEdodWtrMzVO?=
 =?utf-8?B?V0s3Qkc0SFdZOTBFTnJHOW9SOUVJajdvUXVZNlY3a1NEQzBmWTBvRVlJUDlJ?=
 =?utf-8?B?TDRxMlBmNGY0aGNIUURDOEtLdkpqeUFoMEtUa0E4R3I3VGtFN2RjQWVlQkhk?=
 =?utf-8?B?Vm9jakxTc0RqejVMR3lvSUVJNTZtVXhFeCtmOXUxMmpFZHYzTjN6VGJIU25H?=
 =?utf-8?B?RU9KSTdySDNGVWtYSm05QVBUNkt1Y2o3SFdLMFp3d0VuUXkxWHdOcjZiT2RM?=
 =?utf-8?B?RFdacjBKZGpaYWJXcUxobTVJRHNBc3huWFdOV3NSbGJLUTBsejhkNnNhUm5v?=
 =?utf-8?B?OE95bDJIZlV4SjBNaVJFZnA5K1k0Ui8xZDY4R1QwVWlwRnpMTlAxTWtBem5v?=
 =?utf-8?B?MGVma0ZHTnVlWDJGeGZoZk5RU1R6TU9ZN1Y5WmI0ZmZuejE2NVdPVkFOV2Rn?=
 =?utf-8?B?S2ptZ2RuMHNCeVJNcGJ5R2M0U0ZmUXgxcGdhWGFpaFVCVHYzbmI4UzBmV3dJ?=
 =?utf-8?B?cDNwSTlVL0tjYnoreG52Qlk1ZWtOTHZYRWt0K1VralZiSms4WjJ6L2ljOHJP?=
 =?utf-8?Q?TvW1w7?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5112.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b01tSDNMazdzRTZ5RElNZGtMT1IvU2Z2Nm5ZWFpNZEkvVGl5ZWJ3NVhIdEhB?=
 =?utf-8?B?eWNLMDlUMC9ZT0JlYWFqSGplemJxc29IWVBvWWprdDJBYWE4eDRmWXdaUEZS?=
 =?utf-8?B?Q0U2WWw5eVBvVkovM0d1M3hVK3BFVkFPWnkwNjFxM1cwb3FkTjV3OUYzdW5Y?=
 =?utf-8?B?dU1ORHNzTGt4MTJkVkJwWmdSV0U0Tk54aVZFN0M2S05Idy9HcEtwNE96S21W?=
 =?utf-8?B?U0hLelg0MGRFSUpNQ2JzVS9nd29IVUdUZ0plN280QmRLUVlzTzE1ams2Q3dY?=
 =?utf-8?B?YTVSU0ZUbW95TFVQME5SbGthODRSb3VtSHVCQUp2SkRBWUVZNmxPM29CZWtS?=
 =?utf-8?B?SndITTZYRFM3U3ZPYjdJd2dpZG5kZ0ladktQU2Y4MTNkWnRrTnNad0dBM0JD?=
 =?utf-8?B?S2dOTkRjQ281ZE16aGw5QWZLYXlsS1VZSmVxSFg3UzRWUGI4QVJNM1k3MURK?=
 =?utf-8?B?WVVyOWNtaUE0bCt3c3prVGliaC94Vnk4RERYRE9LUmpZNi9tYjRseEo2SGFj?=
 =?utf-8?B?MWNjTFlnOHp3UFFNRUxCVXFPZ1l6azVNVGRlZ0pDMXd5WUhjSjB3YVRUeXpH?=
 =?utf-8?B?QlEyaXFCU0tzMW9GeWxiRDZKMFZiSko5RkxoQUdKSDRBNFduSlRYMVd1N1Bp?=
 =?utf-8?B?Zit2dGdDUGMxWmpwcHdxVERVakpzS2FTYkdPRjZid3R1bVh5SEVQMldVRFha?=
 =?utf-8?B?cS9WeFBTWnNqTVA1UEdneWNoTHY0UUdTNS9FREUzbldNSFdoMTVnNUNtajdR?=
 =?utf-8?B?ck1TUEEwTTBwZTVoNWtDaWVZczZHWWNkODEvYjBoQWxqakw5ZDJlS29MRFNz?=
 =?utf-8?B?YThpbTFkNXlqb29lNjl4emI1S3JDYTRHeDVteTE5R05MU0lmdWlydml2T0dt?=
 =?utf-8?B?R1VXN1BlclU0MXhKNlV4U3ZQSkJWMUl5WHRHVS85SWRKdTkyaW9MSlZNQ29Q?=
 =?utf-8?B?MEJrZm4rNng5eXpOZ1JZV3EzclFUQWw4Smc0Rlkra1dWcm9kV1R0RjgvVnBn?=
 =?utf-8?B?VHdDV2U3Wkh0OHNYaXVtYytLb2o5ZEo2UVZaQ0wraDFwejUrakRaR3loRHgx?=
 =?utf-8?B?bzZUa3p3N2dWVGwrUUVZMmV1Uy8vaUxnaFc3UmJHOFFiUjJsUmJ6dFpyaGxK?=
 =?utf-8?B?cmF6M1lHNUVxVFQ0N3pYRFhIQlF2QlJ1cUxtaUhNZ2IrekRORDFVMGZXSTds?=
 =?utf-8?B?eVRxSVRmaXF3Vng2Rjl1bFVqWDM5USsvTVZnL0I4WUNMdm01Y21IaW83c3JD?=
 =?utf-8?B?MnVhWEdFbnBPVmdjMW1Zd1RkUFB0T3h1ZEdrTnR6cTVpUDNmdi9CWCtkV3NH?=
 =?utf-8?B?SUJGMXI3K0E0KzVDZkNuSGNSZmZZVUVtQ3FsL08xZ2YwcHhrdlMwRm16Wko1?=
 =?utf-8?B?OGk1aUp2enZlVHJVdDRodzAxVmM2ZmJZUjRES3B1ZEtTVXhHZS9QU2UzeEpq?=
 =?utf-8?B?akU3WkNZNGs4a1B1cGlvak1lOENlcXpnZjVJbjl2RjI3eTBzYVJDdXUrUmtQ?=
 =?utf-8?B?SFk5OXNoeWd1V2ZRbDM3QmhHM3VYQTJmTXgxLzkzQ2xPblptVHZzNHdwWmJm?=
 =?utf-8?B?WDY4aXJJWFQvbnU2KzlIYjFGUDVEQ2xNajlpbzYvajB1ZXdpUEVTbHZqZjFj?=
 =?utf-8?B?VjlHcVFPdFNYN1RGWEg5MWl0QzNDVFYwTjczWWNpZDQxSS8rNGx6c2JjR1Zl?=
 =?utf-8?B?bnExMTQxTGdWZkVEdWJEZXRPblg5THViYVlCeXRrczhTQWhncSsveFV6eEc3?=
 =?utf-8?B?VnVzMFlYeXZHcmFTUmdKWkcyS2Vsc25jMUVPUkhFWkY4OEQ2Mm1HeEFRT1ZE?=
 =?utf-8?B?YkR1L3hCaTc0bkZEN21QYWdvWm94V1RoTXBsMTVvQmQ2emhoT29KMWNEbTRV?=
 =?utf-8?B?YTF3a1ZzY1loWG92MW5nMGpLWGpsTFV6TmI2cFRJamtHTmtOcFhQTlM1RkQ3?=
 =?utf-8?B?Tlp5Z2YvQ3VPZmtwY3QxNk9JRC9LRFlZOC9DZGxEWWJDMjVZR1hwaTlVQW04?=
 =?utf-8?B?aE95L0pxVzZmL3g3MTJmMmtpR1RVTHBnMjNOUjdGcEVBVDErVUxoeGczTnd3?=
 =?utf-8?B?SkVXR3gySXVoMUVHNnBlb3BhTC9PemFDbXp6eStWRFRXZzIwTDl6TmJnbEI2?=
 =?utf-8?Q?f3jfXIciIuQdgM0ROIv3jko2M?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5112.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7025e926-a707-4fb3-8f25-08de0098384a
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2025 03:11:31.2595 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RV7jpSwHmcCfHApVzChvMplO6TSyQDwLT/SvTO8bSO6Dj4EYHqvQRGQQj7T+jEfN5bkrvoutxRIJRY0j0A5sVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7625
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

RG1pdHJ5LA0KDQpJIGhhZCBhbiBhc3N1bXB0aW9uIHRoYXQgeW91IGFyZSB1c2luZyAtbWFjaGlu
ZSBxMzUgYWxyZWFkeSBidXQNCklmIG5vdCwgeW91IHdpbGwgbmVlZCB0aGlzIHRvbyBmb3IgZW5h
YmxpbmcgUENJRSBidXMuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
S2ltLCBEb25nd29uDQo+IFNlbnQ6IFR1ZXNkYXksIFNlcHRlbWJlciAzMCwgMjAyNSA4OjA5IFBN
DQo+IFRvOiAnRG1pdHJ5IE9zaXBlbmtvJyA8ZG1pdHJ5Lm9zaXBlbmtvQGNvbGxhYm9yYS5jb20+
OyBkcmktDQo+IGRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBTdWJqZWN0OiBSRTogW1BB
VENIIHY0IDAvM10gVmlydGlvLUdQVSBTNCBzdXBwb3J0DQo+IA0KPiBIaSBEbWl0cnksDQo+IA0K
PiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjQgMC8zXSBWaXJ0aW8tR1BVIFM0IHN1cHBvcnQNCj4g
Pg0KPiA+IE9uIDkvMjQvMjUgMjI6NDcsIGRvbmd3b24ua2ltQGludGVsLmNvbSB3cm90ZToNCj4g
PiA+IEZyb206IERvbmd3b24gS2ltIDxkb25nd29uLmtpbUBpbnRlbC5jb20+DQo+ID4gPg0KPiA+
ID4gVGhpcyBwYXRjaCBzZXJpZXMgaW50cm9kdWNlcyBzdXBwb3J0IGZvciBoYW5kbGluZyBoaWJl
cm5hdGlvbiAoUzQpDQo+ID4gPiBpbiB0aGUgdmlydGlvLWdwdSBkcml2ZXIgYnkgaW1wbGVtZW50
aW5nIC5mcmVlemUgYW5kIC5yZXN0b3JlIGhvb2tzLA0KPiA+ID4gYWxvbmcgd2l0aCBhIFBNIG5v
dGlmaWVyIHRvIHJlc3RvcmUgR1BVIHJlc291cmNlcyB1cG9uIHJlc3VtZS4NCj4gPiA+DQo+ID4g
PiBQYXRjaCAxIGFkZHMgdmlydGdwdV9mcmVlemUgYW5kIHZpcnRncHVfcmVzdG9yZSBmdW5jdGlv
bnMsIHdoaWNoDQo+ID4gPiBtYW5hZ2UgdmlydGlvIHF1ZXVlIHRlYXJkb3duIGJlZm9yZSBzdXNw
ZW5kL2hpYmVybmF0aW9uIGFuZA0KPiA+ID4gcmVpbml0aWFsaXphdGlvbiBkdXJpbmcgcmVzdW1l
Lg0KPiA+ID4NCj4gPiA+IFBhdGNoIDIgaW1wbGVtZW50cyBhIG1lY2hhbmlzbSB0byB0cmFjayBh
bmQgcmVzdG9yZQ0KPiA+ID4gdmlydGlvX2dwdV9vYmplY3QgaW5zdGFuY2VzLCBhZGRyZXNzaW5n
IHRoZSBpc3N1ZSB3aGVyZSBRRU1VDQo+ID4gPiBkaXNjYXJkcyByZXNvdXJjZXMgZHVyaW5nIHZp
cnRpby1ncHUtcmVzZXQgdHJpZ2dlcmVkIGJ5IGhpYmVybmF0aW9uLg0KPiA+ID4NCj4gPiA+IFBh
dGNoIDMgYWRkcyBhIFBNIG5vdGlmaWVyIHRoYXQgdHJpZ2dlcnMgcmVzdWJtaXNzaW9uIG9mIEdQ
VSBvYmplY3RzDQo+ID4gPiB0byBRRU1VIHdoZW4gdGhlIGd1ZXN0IHJlc3VtZXMgZnJvbSBoaWJl
cm5hdGlvbi4NCj4gPiA+DQo+ID4gPiBUaGVzZSBjaGFuZ2VzIGVuc3VyZSB0aGF0IHRoZSB2aXJ0
aW8tZ3B1IGRyaXZlciBjYW4gcmVsaWFibHkgcmVzdG9yZQ0KPiA+ID4gdmlydGlvLWdwdSByZXNv
dXJjZXMgYWZ0ZXIgaGliZXJuYXRpb24sIHByZXZlbnRpbmcgcmVzb3VyY2UgbG9zcw0KPiA+ID4g
dGhhdCBsZWFkcyB0byBzeXN0ZW0ncyBpbnN0YWJpbGl0eS4NCj4gPiA+DQo+ID4gPiB2MjogMTBt
cyBzbGVlcCBpcyBhZGRlZCBpbiB2aXJ0Z3B1X2ZyZWV6ZSB0byBhdm9pZCB0aGUgc2l0dWF0aW9u
DQo+ID4gPiAgICAgdGhlIGRyaXZlciBpcyBsb2NrZWQgdXAgZHVyaW5nIHJlc3VtcHRpb24uDQo+
ID4gPg0KPiA+ID4gdjM6IFBsYWluIDEwbXMgZGVsYXkgKHYyKSBpcyByZXBsYWNlZCB3aXRoIHdh
aXQgY2FsbHMgd2hpY2ggd2FpdCB1bnRpbA0KPiA+ID4gICAgIHRoZSB2aXJ0aW8gcXVldWUgaXMg
ZW1wdHkuDQo+ID4gPiAgICAgKERtaXRyeSBPc2lwZW5rbykNCj4gPiA+DQo+ID4gPiB2NDogTmV3
IHZlcnNpb24gb2YgcGF0Y2hzZXQgb25seSBjb3ZlcnMgUzQgY2FzZSBiZWNhdXNlIGxvc3Mgb2Yg
cmVzb3VyY2VzDQo+ID4gPiAgICAgaW4gUzMgY2FzZSBjYW4gYmUgYXZvaWRlZCBieSBza2lwcGlu
ZyB2aXJ0aW8tZ3B1LXJlc2V0IGluIFFFTVUNCj4gPiA+ICAgICAoaHcvZGlzcGxheS92aXJ0aW8t
Z3B1LmMpLiBGb3IgdGhpcywgdmlydGlvLWdwdS1wY2kgZGV2aWNlIHNob3VsZCBiZQ0KPiA+ID4g
ICAgIGF0dGFjaGVkIHRvIFBDSUUgYnVzIEFORCBhIFBDSUUgb3B0aW9uLCAneC1wY2llLXBtLW5v
LXNvZnQtcmVzZXQnDQo+IG5lZWRzDQo+ID4gPiAgICAgdG8gYmUgZW5hYmxlZCB3aGVuIGxhdW5j
aGluZyBRRU1VDQo+ID4gPiAgICAgKGUuZy4gLWRldmljZQ0KPiA+ID4gdmlydGlvLWdwdS1wY2ks
YnVzPXBvcnQseC1wY2llLXBtLW5vLXNvZnQtcmVzZXQ9dHJ1ZSkNCj4gPiA+DQo+ID4gPiBEb25n
d29uIEtpbSAoMyk6DQo+ID4gPiAgIGRybS92aXJ0aW86IEZyZWV6ZSBhbmQgcmVzdG9yZSBob29r
cyB0byBzdXBwb3J0IHN1c3BlbmQgYW5kIHJlc3VtZQ0KPiA+ID4gICBkcm0vdmlydGlvOiBBZGQg
c3VwcG9ydCBmb3Igc2F2aW5nIGFuZCByZXN0b3JpbmcgdmlydGlvX2dwdV9vYmplY3RzDQo+ID4g
PiAgIGRybS92aXJ0aW86IFJlc3RvcmUgVmlydC1HUFUgcmVzIG9uIGhpYmVybmF0aW9uIHJlc3Vt
ZSB2aWEgUE0NCj4gPiA+IG5vdGlmaWVyDQo+ID4gPg0KPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS92
aXJ0aW8vdmlydGdwdV9kcnYuYyAgICB8IDYwICsrKysrKysrKysrKysrKysrKysrLQ0KPiA+ID4g
IGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9kcnYuaCAgICB8IDEzICsrKysrDQo+ID4g
PiAgZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2ttcy5jICAgIHwgNDkgKysrKysrKysr
KysrKystLS0NCj4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfb2JqZWN0LmMg
fCA3MQ0KPiA+ID4gKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiA+ID4gIDQgZmlsZXMgY2hh
bmdlZCwgMTg2IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pDQo+ID4gPg0KPiA+DQo+ID4g
SGksDQo+ID4NCj4gPiBIaWJlcm5hdGlvbiB3b3JrcyB3ZWxsIGZvciBtZSB3aXRoIHY0LCBnb2lu
ZyB0byBhcHBseSBwYXRjaGVzIHNvb24uDQo+ID4NCj4gPiBSZSBgeC1wY2llLXBtLW5vLXNvZnQt
cmVzZXQ9dHJ1ZWAsIGFwcGFyZW50bHkgaXQncyBub3QgZW5vdWdoIHRvIGhhdmUgaXQgZm9yDQo+
IFMzLg0KPiA+IEknbSBzdGlsbCBzZWVpbmcgdmlydGlvLWdwdSBiZWluZyByZXNldCB3aXRoIFMz
IGFuZCB0aGlzIHJlc2V0IGNvbWVzDQo+ID4gZnJvbSBhIGd1ZXN0IGtlcm5lbCB3cml0aW5nIFBD
SSByZWcsIHJlc2V0dGluZyBQQ0kgZGV2aWNlIG9uIGtlcm5lbA0KPiA+IHJlc3VtZS4gV2lsbCBs
b29rIGZ1cnRoZXIgaW50byBpdC4NCj4gDQo+IFtLaW0sIERvbmd3b25dIFRoYXQgb3B0aW9uIG9u
bHkgd29ya3Mgd2hlbiB5b3Ugc2V0IHVwIHZpcnRpby1ncHUgYXMgYSBQQ0lFDQo+IGRldmljZS4N
Cj4gSSBhbSB3b25kZXJpbmcgaWYgeW91IHNldCB1cCB5b3VyIFBDSUUgYnVzLiBUaGlzIGFyZSBw
YXJhbXMgSSBhZGRlZCBmb3IgaXQuDQo+IC1kZXZpY2UgcGNpZS1yb290LXBvcnQsaWQ9cm9vdF9w
b3J0MSxidXM9cGNpZS4wIFwgLWRldmljZSB2aXJ0aW8tDQo+IHZnYSxidXM9cm9vdF9wb3J0MSx4
LXBjaWUtcG0tbm8tc29mdC1yZXNldD10cnVlIFwNCj4gDQo+ID4NCj4gPiAtLQ0KPiA+IEJlc3Qg
cmVnYXJkcywNCj4gPiBEbWl0cnkNCg==
