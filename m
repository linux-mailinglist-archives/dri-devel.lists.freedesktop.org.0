Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 876A0ABEB62
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 07:42:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E266710E5FA;
	Wed, 21 May 2025 05:42:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KKFFbxgv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ECF910E10A;
 Wed, 21 May 2025 05:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747806141; x=1779342141;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=KGOhaDKw+CYssN2s65TY4Rwu9YuUyAAjJr8IhF7uSws=;
 b=KKFFbxgvIrLKBDoAgBuiqKDVVIzGs4sheEFq7lw6lujLmDP3i2cU7ya/
 M3sXya8YuNmF2MGm6lz6e3gY1+JW173dCvEocgEkNRrhFkFl5mnZm9bqu
 MVpRLuss6joLnwTbjnxBQeq3As/eMV3gWXDleSHHKts2IBsJPoSfMDunG
 ZgOKdQ5UinXhUXWR6lxx9EitS4RgU0bc/4eWAjThWsFUxH3YxOpV0vfc8
 uBEohI+wSAVroveJe1Qev6pY50FdJL7jrm7QE9qWOy7xB5BYt8a7TDxv2
 N1JezleMcVUsfYxilNpeQe/lwir9l514jcK6EvUkrc3E4Z51V98u49WaQ g==;
X-CSE-ConnectionGUID: 1f51kTqeRDWBVNl+oU5bpA==
X-CSE-MsgGUID: mpP/XhIkQxOO6nJ1tCsY1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="49641294"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="49641294"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 22:42:18 -0700
X-CSE-ConnectionGUID: hFDf+QI/SU2zGQwuAamFyg==
X-CSE-MsgGUID: rkEr8MDNQs2Eqq3pqGtXyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="144896118"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 22:42:19 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 20 May 2025 22:42:17 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 20 May 2025 22:42:17 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 20 May 2025 22:42:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g0AFqW4FvOXSaJcMDVn3iJghhYZ1oGGq6vy8/lugZ2xWVTd3hS+bWsOT0GTQyRj0V6p48NU8ENbdaWh5T9cmHUCb01p22f2PU97Ne1m7vQFZMmjceJxnKTauxx3d4AdA7AwJz7j1iZRvNVvQ06YaYjnaqMOnnjqXOPHezRV2MgJWMx04s+zxtYFLGFuI4qpasp4GM9yRN5i38m1hMREc4yg0yUC1/SilCavItzEOGFGaVhW3YWKXtU5q3cuzjmU7JIbT1mkpdN5EoqwWFLdFtPkKwH6h8EXE1IJUTTrYgaJgpsRKNV3R4eNP1KY+agaD+ObTf/FO7O+Q6asYwa8DVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KGOhaDKw+CYssN2s65TY4Rwu9YuUyAAjJr8IhF7uSws=;
 b=Qgx+XqYk2TV4Xjrm8RlxJCd9Ava31bsPom+v4Z0rgejZ1uMjYwsos5iAZd8Uzi/WorTE/DIr2yclV84+5gHqe3NvI3um4yKxYB1dw8aVQ8ZnKX3yhWqgg9fKrbuGvxuXsKru6MG7f+cfbbog/CsG0sZ2huMmWmbMRUj93UBTeYlVyRLDF1d+f9XXNwh9zz4Q3IeNZbb0Y/sdBh0R3hrWPd/RTpscSNjCj5Vd/9J+YECmI71lp6euiMpjJoXWSHkJZ5d9jRI2u5ncDA+86XaPsv6g6utpT5lX7rsRwAsvHEUXVYs48XyFoobj3aonmd/kyVSu3wYwfZcPlDHXDiOb4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 PH8PR11MB6707.namprd11.prod.outlook.com (2603:10b6:510:1c6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 05:42:15 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2%4]) with mapi id 15.20.8722.027; Wed, 21 May 2025
 05:42:15 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v2 10/12] drm/i915/display: Add function to configure LFPS
 sending
Thread-Topic: [PATCH v2 10/12] drm/i915/display: Add function to configure
 LFPS sending
Thread-Index: AQHbyafMcbkKVJs9sEetb2BUpP2y7rPchz6AgAALpoA=
Date: Wed, 21 May 2025 05:42:14 +0000
Message-ID: <1aa7c03b41652c588d0bc097ee28733845c949da.camel@intel.com>
References: <20250520165326.1631330-1-jouni.hogander@intel.com>
 <20250520165326.1631330-11-jouni.hogander@intel.com>
 <2f7fe9a5-9ef5-4bb8-8028-1e8557f883d2@intel.com>
In-Reply-To: <2f7fe9a5-9ef5-4bb8-8028-1e8557f883d2@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|PH8PR11MB6707:EE_
x-ms-office365-filtering-correlation-id: 5f29b75c-dc4d-4847-457d-08dd982a3dd4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|376014|1800799024|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?TG0rUWJsd3NoVVNtNDZHN1lFc1ZPU1lHeklkYW1yUWVicXNmVTlMbnQvUnRr?=
 =?utf-8?B?Q21aL1ZWUmIycjJrZjhIbXV0R2hSYXAvSFY1b3Z2d1I2YlFGb09ORUN1d3dl?=
 =?utf-8?B?SmRiYVZLUmx6S0xJU2Nua0xOemdNbHplWnJuN052eUo3NmZOYlJSd3M3VFlD?=
 =?utf-8?B?Zm9LbUlrQWNDSjRCWjBDQ2tzRlRTUEhGbDJOeDc3SFpTM3lmN3hFdDE4TkNM?=
 =?utf-8?B?VDNYOTZ3OHFnZFRDTW16SjQ2WUFVeDNPMUdwODZlQ24rNVNlSEFxR0xnSmcr?=
 =?utf-8?B?Ty9ZYWh0S1RsamllVy9WUnZqT1pxeU1MWWt0VlhQbk94bkZoRmdjS2krd1h1?=
 =?utf-8?B?djlmei9hbmpqT21ZRTdRejZ5S3BmazN2T0dxTldUTE1lS3BqVEcyU3Y1Y3Bu?=
 =?utf-8?B?RmdHeUVxQ3NsdDlTRzRnWExsYXhUdENFTVQ1Q1BxTWZySFB5NlFJOTlaSnFo?=
 =?utf-8?B?NXp4Qk56S0ZpTzE2OGZ6V2V5ajFmMTRBZ3pHRkNIY2prcVFqS1YxcHJmYkZl?=
 =?utf-8?B?cEFiTjRhTkg5SWplYmpWRmFFVDY0R0JUYVBrYzdGMWwybHlkQXV4VTBTeWRp?=
 =?utf-8?B?a281QkJFNzJ5cU0zTmFsdUpqeU5jVUdoK014K2RQaTN0ajRWT1lEbUF5Y0M5?=
 =?utf-8?B?czlHTmdXemZmMFlIdkNJVG5VVmxNRW8yQS9wNWRZWUJYdm5FejI4RHdMQndt?=
 =?utf-8?B?YUNsQUZ3ZFFpNEhPSTBHeFRCTmFsNmlkOURmVlB4UHFiR1JTUUQ2UGRTdFhj?=
 =?utf-8?B?cytNbXdRbDRLRlhiL1JwUWd3enhTa0cwUVJSSnNydjNJZmpUU3FWWHpSRWZx?=
 =?utf-8?B?b0R4Y09oMGM0UXdRbHhmY0huZ2hSYk1MeXRDQXdLREJ4bTBHWW14RnFyOEFs?=
 =?utf-8?B?dTY3aDJVUzh3ZWc0NzdTaXhjdUdiZ0JMN0NuMjFnb1VGbUxHZWFOV2syV0t3?=
 =?utf-8?B?L2ptUkhjRXRETGhMTHZyOFR0Q1hUZnZFSmF4YnFXQy9BbnhtYnJLbHZyalNG?=
 =?utf-8?B?N04rbXlMZkN4Umhkdm1icCtydUNDcVNod3RqUUxRNXpMekFKbE5xLzd6eGE0?=
 =?utf-8?B?MnVQUmRnNFVkd0RkRWk4Sm1nNnlTbXUvQzJOMHRzTDNnK1M4eEd1TDQ5b2VL?=
 =?utf-8?B?SFRGOTZYRFlBd0hraTNDazBxQ1V3dENBZlIzcGExMHRXb0EvYW9xRm11QytN?=
 =?utf-8?B?bDhDYWd1a0xXd3RteDhmOGc4MXR1NHF3Z01KUUVITjdOeGFEN0JUQnlOK0dj?=
 =?utf-8?B?SjNqdTliMVJ3bjlYZUxJSDNjVk9kNThCYTgvd2ZuUFZMNCtJMlEvTEN6cEJy?=
 =?utf-8?B?YWFVN3J6NlVFTUdZYkpGS2xUV3I5Y2xnK2lSNUhWVVJrYjBadlowR3N1cFlX?=
 =?utf-8?B?cS85M3dKN0RkM0pXYkUvYjgrOVZsNE9MWnNuNXBSTUVNdCsrdGJMWnNEY0py?=
 =?utf-8?B?QkwvaXVvSjQzV3VMaGhiRjdTc1hlcERGaFBXdHJLRmZyR25rc3J5VHBGNklW?=
 =?utf-8?B?a0ZQRmNBbkMxZ0RRVEMrMWQwc3BlZ0lZSklXeDNrNk91dk1RUkZ4ZUZacTFJ?=
 =?utf-8?B?U1g1Z1FJUjdRZ0NQTWh6NUFyRDMxc1ZaaitkaWhOTmM2UWhUSGp4d1hSNHRV?=
 =?utf-8?B?RU9kVFVsYVlKajdkdkU0QmhuMnVwOTlqOTVMa1haQU1HN091MlNjK1diZTZi?=
 =?utf-8?B?d3VoVlpjT1M5Qkc4T0tnNTBaSVlsTDV5T09KZkZoeGFPL0dDOURPTzJsb1B4?=
 =?utf-8?B?Rm85cWdSSEg4b0ZHVzI3U1hYcnEwdEVTMVd6UEMrbFJvZFdBcUUwK1BzNUpZ?=
 =?utf-8?B?TXFlYnZUeGdMMW9SK0o1am9jbTFXWEZKWnlndVhjTXpQSUtxWnYvMGhVdlNs?=
 =?utf-8?B?V3pHL3ExVHlyM3oyRGt1aHExUThsT1dFMm9mbUZidmxEOWYzOVBaNjBPV0VE?=
 =?utf-8?B?d0FXbFZLdGwwaGNNSkdHZXNiV210WmZFZnd3ZnV1b3dhOUg4aVNBTjMwdmZ5?=
 =?utf-8?B?Njlmb2EvOHlRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(1800799024)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T04wYnVyc0N6cDR5MDRFcTVJS2dzcVdyY2lDSGs5QmduWVcxc2Jrd1cwbFFq?=
 =?utf-8?B?NFlLSWRGZlFjZ240VUJvZDVNVVg2VjJMVGdMRmxlYVhncGdIY2RYUlpJNzBE?=
 =?utf-8?B?N1Q2RDFuYlZwTlkza2dGN29RdDI0US9yL0JJZ093OEI3VEFmeTB0STdsczVQ?=
 =?utf-8?B?a3NZb1VlOTZpM2pBZzJoU2h2aWN4b2E5OEJrNFhaQklJZzZRaDRpUHdwalRx?=
 =?utf-8?B?b2gzRE1HdmFlV1VHa2U1TEZqbVVkZHRzeldSZVY0SXY5Q3pNNWlMT0tPSzYw?=
 =?utf-8?B?UWR6V1VGWFdFTVFuZ3BIcEplcGJjSC9hS0QrdUhqZkVoL0tZcDByZFRCK1dn?=
 =?utf-8?B?NURIZElWN2ZaUlpleXArcXR3OFFYTDFxczlIblBncGRSN0RZRzVFTnBDQ3gz?=
 =?utf-8?B?OENUYXZKZVhuRkd0NmNGaFo0U3NqSG9RQkJsb2RGMmRqRDhxVzR1MDZQdk85?=
 =?utf-8?B?dGlNR1dwRUV5dkQzTXVqRHlDd1dLdTFGaHk5ZlpzYlpyNllmTmdVQUhkbVpa?=
 =?utf-8?B?WldnSWRvWCtxaEFHdXlCcUQ0TjVyamcxOWorQlBTUElKOEt6dUlvcmM2RU1I?=
 =?utf-8?B?WkxNaE9BQVZCVVpJU3phZU1pQ2hkS01PT2JIdkExbnIwam92aFVWb291WEh4?=
 =?utf-8?B?bHJzMWlyMWZCVm5aYStBWUNaNmp0cmJiclBCQkh6TmJhVmhURktieWFEWTlV?=
 =?utf-8?B?K2pOYXVUWjM3TFFyYUhEM3M0NTRzTllTQUhMczkxUFh5NFpvN1htcmtoSTdz?=
 =?utf-8?B?TjRSN2pJcnNjQXIzSktDcWZ3a09xRzlQMG1VN2pOck5JdlFvZDJQRkdvQ1Ra?=
 =?utf-8?B?bUsxNFE4MzYzUE8xdSt6UTNSVE5pNWtnaXMwUmJlMkdnVGthNkx4RVpnczQ3?=
 =?utf-8?B?SEdsOXFERS8xYU5UbVRXdVZBRkczZmdORGJGcU1RZFNZeVI0MmVLdFJod1gv?=
 =?utf-8?B?b3QwdUNwZ3BpQUZrUmdxVEgwcVQ3b3U5Z2p1L2hhL0JJRjRMMVdxNW8vRmhn?=
 =?utf-8?B?SG9WOEh5ejlxQ25RK2phK1dDc2haN01ZT2V4dW1uQ2F6eTBldEZ2ZWt4dWt0?=
 =?utf-8?B?OXJnLzY5ZUFOalpFL1Mxb3NKb09OQW9tb0pYa2NUb3lxMG9yckV5MUNJR0NG?=
 =?utf-8?B?R1M1VExQSWx0Y1BxWHJvWEMwMUd0aFBvNE1EbjM4U1J4eHIxVnlFLzN6VVl5?=
 =?utf-8?B?UmkxWDlnd2xGQ2hsZG5lc1hUemJCOXUvNThwK0VMSStzRzRGZm9ES2xXV0ht?=
 =?utf-8?B?K2FMaThZUkdFYUh2REU2TndSclRPOGRydS9OWEQ2MG9BVXg0allXNG8yaHEx?=
 =?utf-8?B?TFMyYUtaV0ZMOURNT09ab2x0aWN2OWdnN2V3WHUrZFpBVkt4U0dCcHlSSnd1?=
 =?utf-8?B?SlhrQ2gyUWFvZXFlY3dYQzVaZlRoRXk1VDlKZnR5RlB1S3ZUS0NxalA1M3By?=
 =?utf-8?B?NThyTVlTbU00ZDN6LzBlVnZnUUg3MVo0ajFvdkovMnFxaUZSanZDZldIekFS?=
 =?utf-8?B?VCtCYWFQci9kMHQyblNVd2NPc3RUczBtSmo4ZCs2YnQ1Y0NPT2Z6R29GT1lC?=
 =?utf-8?B?VHNQb2gvNC9JTVhkTTBTczB6aHVlZ1FoeC9SckVhTmsydjN4VVdLS0ZFalFl?=
 =?utf-8?B?TzBMcXhTZEhVdVpXb1NhNzlwRTlaU2VtUEhYN01sSWV6RGZQYlVkVTJpRWF3?=
 =?utf-8?B?ZnpleU1BU3NGS1pETzVDTUhRZXF0azNzcmpya1R4OHB1RXVwWnBySFVpRVdN?=
 =?utf-8?B?ZmpLcTBmbW9TVGQxNHIwS2JZSTR3SENLRWhyZFpEODJPcWE5VTVaekJuM0JI?=
 =?utf-8?B?OW5DaFB5K1plc3lwZ1lzL1plclRPaWZyYzJ3M2RtblBSZnRTc1dHZW9ReVdJ?=
 =?utf-8?B?QUlsMzQwNThQTk5KR25zNVU5NHg4OUpQZHhVMGtGOFN1bVVpTEMxanBSNk9J?=
 =?utf-8?B?MXFmeFZWd01vMDdyS3lDbWVpcEsxSHhqNWdBeVNIVmE0MmZGZ0JqQ1o1bEFz?=
 =?utf-8?B?V3RzRGIwVFNPRWxJb3pKS1Qrd0hVeHgvZklEZlhoYk8wYVN3aU0wOTFCZ0Jz?=
 =?utf-8?B?RklhUjFNZzNXVVRwbStTOWVmT2NXcmZGczJHWnhkb3lQZE1qQXFlTmd5RWpE?=
 =?utf-8?B?eXlZUmZ4Uzk5ZTFFdFJkL0dHa3ZjQit1TkFaRWU0RVpIaXRNcHRkdklTTGVS?=
 =?utf-8?B?YlV5cjkzVUIvRVBtSTdjeWxqcDhBRk1QdmlBMkswRU1zZXpCNTlYMzBva2ov?=
 =?utf-8?B?Tk9adHNCbzYreXFrN1d4Y1IzRXpnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F1F42488AAE1D541872432629BE82E34@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f29b75c-dc4d-4847-457d-08dd982a3dd4
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2025 05:42:14.9795 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UEHrrbesXMaq0J2rBycZGRIXrdo6dm3BgqzDHb0LdvIlrjIKBgi2EW5v/YGCEgMT/3P+ZVfhAqmcbcP6rSRUFwQ5DOPljklodQJ6ZNRqZws=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6707
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

T24gV2VkLCAyMDI1LTA1LTIxIGF0IDEwOjMwICswNTMwLCBOYXV0aXlhbCwgQW5raXQgSyB3cm90
ZToNCj4gDQo+IE9uIDUvMjAvMjAyNSAxMDoyMyBQTSwgSm91bmkgSMO2Z2FuZGVyIHdyb3RlOg0K
PiA+IEFkZCBmdW5jdGlvbiB0byBjb25maWdyZSBMRlBTIHNlbmRpbmcgZm9yIFBhbmVsIFJlcGxh
eSBhY2NvcmRpbmcgdG8NCj4gPiBsaW5rDQo+ID4gdHJhaW5pbmcgc2VxdWVuY2UgaW4gSEFTIGRv
Y3VtZW50Lg0KPiA+IA0KPiA+IFRoaXMgYXNzdW1lcyB3ZSBhcmUgdXNpbmcgQVVYIExlc3MgYWx3
YXlzIGlmIGl0J3Mgc3VwcG9ydGVkIGJ5IHRoZQ0KPiA+IHNpbmsgYW5kDQo+ID4gdGhlIHNvdXJj
ZS4NCj4gPiANCj4gPiB2MjoNCj4gPiDCoMKgIC0gZHJvcCBIQVMgcmVmZXJlbmNlDQo+ID4gwqDC
oCAtIHJlcGxheSBrZXJuZWxkb2MgY29tbWVudCB3aXRoIGEgZ2VuZXJpYyBjb21tZW50DQo+ID4g
wqDCoCAtIGNoZWNrIGRpc3BsYXkgdmVyc2lvbiBpbiBpbnRlbF9sbmxfbWFjX3RyYW5zbWl0X2xm
cHMNCj4gPiANCj4gPiBCc3BlYzogNjg4NDkNCj4gPiBTaWduZWQtb2ZmLWJ5OiBKb3VuaSBIw7Zn
YW5kZXIgPGpvdW5pLmhvZ2FuZGVyQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiDCoCBkcml2ZXJz
L2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2N4MF9waHkuYyB8IDMxDQo+ID4gKysrKysrKysr
KysrKysrKysrKysNCj4gPiDCoCBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2N4
MF9waHkuaCB8wqAgMiArKw0KPiA+IMKgIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfZGRpLmPCoMKgwqDCoCB8wqAgOCArKysrLQ0KPiA+IMKgIDMgZmlsZXMgY2hhbmdlZCwgNDAg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2N4MF9waHkuYw0KPiA+IGIvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9jeDBfcGh5LmMNCj4gPiBpbmRleCA5MTExOGQxMTVm
ZDMuLjc1Y2FjY2I2NTUxMyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX2N4MF9waHkuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfY3gwX3BoeS5jDQo+ID4gQEAgLTMyMjUsNiArMzIyNSwzNyBAQCB2b2lkIGlu
dGVsX210bF9wbGxfZW5hYmxlKHN0cnVjdA0KPiA+IGludGVsX2VuY29kZXIgKmVuY29kZXIsDQo+
ID4gwqDCoAkJaW50ZWxfY3gwcGxsX2VuYWJsZShlbmNvZGVyLCBjcnRjX3N0YXRlKTsNCj4gPiDC
oCB9DQo+ID4gwqAgDQo+ID4gKy8qDQo+ID4gKyAqIEFjY29yZGluZyB0byBIQVMgd2UgbmVlZCB0
byBlbmFibGUgTUFDIFRyYW5zbWl0dGluZyBMRlBTIGluIHRoZQ0KPiA+ICJQSFkgQ29tbW9uDQo+
ID4gKyAqIENvbnRyb2wgMCIgUElQRSByZWdpc3RlciBpbiBjYXNlIG9mIEFVWCBMZXNzIEFMUE0g
aXMgZ29pbmcgdG8NCj4gPiBiZSB1c2VkLiBUaGlzDQo+ID4gKyAqIGZ1bmN0aW9uIGlzIGRvaW5n
IHRoYXQgYW5kIGlzIGNhbGxlZCBieSBsaW5rIHJldHJhaW4gc2VxdWVuY2UuDQo+ID4gKyAqLw0K
PiA+ICt2b2lkIGludGVsX2xubF9tYWNfdHJhbnNtaXRfbGZwcyhzdHJ1Y3QgaW50ZWxfZW5jb2Rl
ciAqZW5jb2RlciwNCj4gPiArCQkJCSBjb25zdCBzdHJ1Y3QgaW50ZWxfY3J0Y19zdGF0ZQ0KPiA+
ICpjcnRjX3N0YXRlKQ0KPiA+ICt7DQo+ID4gKwlzdHJ1Y3QgaW50ZWxfZGlzcGxheSAqZGlzcGxh
eSA9IHRvX2ludGVsX2Rpc3BsYXkoZW5jb2Rlcik7DQo+ID4gKwl1OCBvd25lZF9sYW5lX21hc2sg
PQ0KPiA+IGludGVsX2N4MF9nZXRfb3duZWRfbGFuZV9tYXNrKGVuY29kZXIpOw0KPiA+ICsJYm9v
bCBlbmFibGUgPQ0KPiA+IGludGVsX2FscG1faXNfYWxwbV9hdXhfbGVzcyhlbmNfdG9faW50ZWxf
ZHAoZW5jb2RlciksDQo+ID4gKwkJCQkJCcKgIGNydGNfc3RhdGUpOw0KPiA+ICsJaW50IGk7DQo+
ID4gKw0KPiA+ICsJaWYgKERJU1BMQVlfVkVSKGRpc3BsYXkpIDwgMjApDQo+ID4gKwkJcmV0dXJu
Ow0KPiA+ICsNCj4gPiArCWZvciAoaSA9IDA7IGkgPCA0OyBpKyspIHsNCj4gPiArCQlpbnQgdHgg
PSBpICUgMiArIDE7DQo+ID4gKwkJdTggbGFuZV9tYXNrID0gaSA8IDIgPyBJTlRFTF9DWDBfTEFO
RTAgOg0KPiA+IElOVEVMX0NYMF9MQU5FMTsNCj4gPiArDQo+ID4gKwkJaWYgKCEob3duZWRfbGFu
ZV9tYXNrICYgbGFuZV9tYXNrKSkNCj4gPiArCQkJY29udGludWU7DQo+IA0KPiBQZXJoYXBzIGEg
bWFjcm8gZm9yIHRoZSBsb29wIHBhdHRlcm4gd291bGQgbWFrZSBzZW5zZSwgYXMgdGhpcyBpcw0K
PiB1c2VkIA0KPiBmb3Igb3RoZXIgQ1gwIHJlZ2lzdGVyLg0KPiANCj4gUmVnYXJkbGVzcyBvZiB0
aGUgYWJvdmUsIHBhdGNoIGxvb2tzIGdvb2QgdG8gbWUuDQoNCkkgd2FzIHN1cHBvc2VkIHRvIGNo
ZWNrIHdpdGggeW91IGlmIGl0J3Mgb2sgbGVhdmUgdGhhdCBvdXQgZnJvbSBteQ0KcGF0Y2ggc2V0
LiBUaGFuayB5b3UgZm9yIHRoZSByZXZpZXcuDQoNCkJSLA0KDQpKb3VuaSBIw7ZnYW5kZXINCg0K
PiANCj4gUmV2aWV3ZWQtYnk6IEFua2l0IE5hdXRpeWFsIDxhbmtpdC5rLm5hdXRpeWFsQGludGVs
LmNvbT4NCj4gDQo+IA0KPiA+ICsNCj4gPiArCQlpbnRlbF9jeDBfcm13KGVuY29kZXIsIGxhbmVf
bWFzaywNCj4gPiBQSFlfQ01OMV9DT05UUk9MKHR4LCAwKSwNCj4gPiArCQkJwqDCoMKgwqDCoCBD
T05UUk9MMF9NQUNfVFJBTlNNSVRfTEZQUywNCj4gPiArCQkJwqDCoMKgwqDCoCBlbmFibGUgPyBD
T05UUk9MMF9NQUNfVFJBTlNNSVRfTEZQUw0KPiA+IDogMCwNCj4gPiArCQkJwqDCoMKgwqDCoCBN
Ql9XUklURV9DT01NSVRURUQpOw0KPiA+ICsJfQ0KPiA+ICt9DQo+ID4gKw0KPiA+IMKgIHN0YXRp
YyB1OCBjeDBfcG93ZXJfY29udHJvbF9kaXNhYmxlX3ZhbChzdHJ1Y3QgaW50ZWxfZW5jb2Rlcg0K
PiA+ICplbmNvZGVyKQ0KPiA+IMKgIHsNCj4gPiDCoMKgCXN0cnVjdCBpbnRlbF9kaXNwbGF5ICpk
aXNwbGF5ID0gdG9faW50ZWxfZGlzcGxheShlbmNvZGVyKTsNCj4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9jeDBfcGh5LmgNCj4gPiBiL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfY3gwX3BoeS5oDQo+ID4gaW5kZXggYThmODExY2E1
ZTdiLi5jNWE3YjUyOTk1NWIgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9jeDBfcGh5LmgNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX2N4MF9waHkuaA0KPiA+IEBAIC00Myw1ICs0Myw3IEBAIHZvaWQgaW50ZWxf
Y3gwX3BoeV9zZXRfc2lnbmFsX2xldmVscyhzdHJ1Y3QNCj4gPiBpbnRlbF9lbmNvZGVyICplbmNv
ZGVyLA0KPiA+IMKgwqAJCQkJwqDCoMKgwqAgY29uc3Qgc3RydWN0IGludGVsX2NydGNfc3RhdGUN
Cj4gPiAqY3J0Y19zdGF0ZSk7DQo+ID4gwqAgaW50IGludGVsX210bF90YnRfY2FsY19wb3J0X2Ns
b2NrKHN0cnVjdCBpbnRlbF9lbmNvZGVyICplbmNvZGVyKTsNCj4gPiDCoCB2b2lkIGludGVsX2N4
MF9wbGxfcG93ZXJfc2F2ZV93YShzdHJ1Y3QgaW50ZWxfZGlzcGxheSAqZGlzcGxheSk7DQo+ID4g
K3ZvaWQgaW50ZWxfbG5sX21hY190cmFuc21pdF9sZnBzKHN0cnVjdCBpbnRlbF9lbmNvZGVyICpl
bmNvZGVyLA0KPiA+ICsJCQkJIGNvbnN0IHN0cnVjdCBpbnRlbF9jcnRjX3N0YXRlDQo+ID4gKmNy
dGNfc3RhdGUpOw0KPiA+IMKgIA0KPiA+IMKgICNlbmRpZiAvKiBfX0lOVEVMX0NYMF9QSFlfSF9f
ICovDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
ZGRpLmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGRpLmMNCj4g
PiBpbmRleCA2NWFiMDEyYzNlYWUuLjcwZGU5OWNjNGVhZCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RkaS5jDQo+ID4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kZGkuYw0KPiA+IEBAIC0zNzQ1LDEwICszNzQ1LDE2
IEBAIHN0YXRpYyB2b2lkDQo+ID4gbXRsX2RkaV9wcmVwYXJlX2xpbmtfcmV0cmFpbihzdHJ1Y3Qg
aW50ZWxfZHAgKmludGVsX2RwLA0KPiA+IMKgwqAJaW50ZWxfZHAtPkRQIHw9IERESV9CVUZfQ1RM
X0VOQUJMRTsNCj4gPiDCoCANCj4gPiDCoMKgCS8qDQo+ID4gLQkgKiA2LmsgSWYgQVVYLUxlc3Mg
QUxQTSBpcyBnb2luZyB0byBiZSBlbmFibGVkDQo+ID4gKwkgKiA2LmsgSWYgQVVYLUxlc3MgQUxQ
TSBpcyBnb2luZyB0byBiZSBlbmFibGVkOg0KPiA+IMKgwqAJICrCoMKgwqDCoCBpLiBDb25maWd1
cmUgUE9SVF9BTFBNX0NUTCBhbmQgUE9SVF9BTFBNX0xGUFNfQ1RMDQo+ID4gaGVyZQ0KPiA+IMKg
wqAJICovDQo+ID4gwqDCoAlpbnRlbF9hbHBtX3BvcnRfY29uZmlndXJlKGludGVsX2RwLCBjcnRj
X3N0YXRlKTsNCj4gPiArDQo+ID4gKwkvKg0KPiA+ICsJICrCoMKgwqDCoCBpaS4gRW5hYmxlIE1B
QyBUcmFuc21pdHMgTEZQUyBpbiB0aGUgIlBIWSBDb21tb24NCj4gPiBDb250cm9sIDAiIFBJUEUN
Cj4gPiArCSAqwqDCoMKgwqDCoMKgwqDCoCByZWdpc3Rlcg0KPiA+ICsJICovDQo+ID4gKwlpbnRl
bF9sbmxfbWFjX3RyYW5zbWl0X2xmcHMoZW5jb2RlciwgY3J0Y19zdGF0ZSk7DQo+ID4gwqAgfQ0K
PiA+IMKgIA0KPiA+IMKgIHN0YXRpYyB2b2lkIGludGVsX2RkaV9wcmVwYXJlX2xpbmtfcmV0cmFp
bihzdHJ1Y3QgaW50ZWxfZHANCj4gPiAqaW50ZWxfZHAsDQoNCg==
