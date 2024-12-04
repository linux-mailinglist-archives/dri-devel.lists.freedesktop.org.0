Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F219E3632
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 10:09:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D896410E02F;
	Wed,  4 Dec 2024 09:09:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S1UFeK4V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 649EC10E02F
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 09:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733303343; x=1764839343;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=a/b6DDhqwX4e1mV6AFO8v76dAyOfPCmD3FwpvwyXpy0=;
 b=S1UFeK4VFOStP16gDpJUd8S/2nLWCbIeLBy4NB2BCjnwP5Z38lqq1d2Z
 W+Gw6zqwcNetS51VbWQmSOQaskaP8i4QO08MJr7ducJCaiM7GVQB+gngS
 yoMNfq740kFf32x3lelC7WrZmWsRUpYquryPVRVumLDkTQJ19KIj4ADdP
 YEVr2IPFeu5jpSTIjtDU9U2WtWgGWpF0R31TogxUetnCXTJVcQecIEUqw
 3hAuHJ6RrUE2CfQk6DdO1lPrKY9tAoIvYtK7s1Ywln4IvoVgjnUfNug2y
 lOdoPkKHgefqrOczkaCivl+zJE6pTObd9UTBNdWN6Yt3et455zrJDGXyo A==;
X-CSE-ConnectionGUID: Bh9YzOnbTUec5R5fFK92Gw==
X-CSE-MsgGUID: 73GvhcSJRU+UXF5oCcvcjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="32900596"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="32900596"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 01:09:03 -0800
X-CSE-ConnectionGUID: PFg9jUqATPWq22mNEBMYGg==
X-CSE-MsgGUID: L28BRzMOT/iG1PhqGXoIXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="124636205"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Dec 2024 01:09:02 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 4 Dec 2024 01:09:02 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 4 Dec 2024 01:09:02 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 4 Dec 2024 01:09:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MJfOsm8YCMeqpYrF6WwTamLT8pbq203tAr0jczALqdtBdEZ3LbdJ0HQi+xd7pdeYYm7r/+4MGW4MXjtS1GSZKQqJY/RWaZRLEVnBo1+0t8e5/yM+fj+kveGrqZTwR2MurThlZfE/V1Fw+mxj7lQdLKQiA1iwAvgVY+4LhUsLPFEGGq8OvWxsYUuYQfdYxscOGwWmNC4DvlThB4M6xcilxRVEd/phYmLhKErTnlgWNmKUznmvPYUaMQC5Asfe8p7HP9y+SXWOEQcl+Xx8nOOLzWqPYHIaeuV6QKFhrg28iXPQ97D9uAyA+IvTPeq/67KFW1WsiRMhu4t3y0Q0wwHMlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a/b6DDhqwX4e1mV6AFO8v76dAyOfPCmD3FwpvwyXpy0=;
 b=vkHv5rb50orJvM8/Qq8nZcwHj7xWHKpePIC3xgO/Y23qNFjYQVaEHm+dFR0hXFOEt5IJOcEP5dHnD1cYx8Ux1NoX9bhpMCrN+Kfx7wmGx29kxQcT5dJT+b8P8FSihADrVJVg4d4Ge0kE4DFRUkx+6zUiO8YpK2u+5shmaFBCM8KOTmZ4H/5Udkb11b48HZiHKExvRdMMbrLZS2NH955nRO1EzlnICS0CHvJjX78watsmsRqFuZ1zbmIt++jmWEQIRO7Is7vB8r5PUlLL4gDSN1NvyBQBYSCfGEAoZPvAsA6a3yhGaei0KGZltO98gd26xs4duHhmpFshLdjDe8HJ8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by IA1PR11MB7727.namprd11.prod.outlook.com (2603:10b6:208:3f1::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Wed, 4 Dec
 2024 09:08:59 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%3]) with mapi id 15.20.8207.017; Wed, 4 Dec 2024
 09:08:59 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Jann Horn <jannh@google.com>, Gerd Hoffmann <kraxel@redhat.com>, "Sumit
 Semwal" <sumit.semwal@linaro.org>, =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?=
 <christian.koenig@amd.com>, Simona Vetter <simona.vetter@ffwll.ch>, "John
 Stultz" <john.stultz@linaro.org>, Andrew Morton <akpm@linux-foundation.org>,
 "Joel Fernandes (Google)" <joel@joelfernandes.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Julian Orth
 <ju.orth@gmail.com>, "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: RE: [PATCH 1/3] udmabuf: fix racy memfd sealing check
Thread-Topic: [PATCH 1/3] udmabuf: fix racy memfd sealing check
Thread-Index: AQHbRaiV1TXhG/LIhUqfGel8T+2LFLLVxadw
Date: Wed, 4 Dec 2024 09:08:59 +0000
Message-ID: <IA0PR11MB7185EFC7E59546204A617DE9F8372@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20241203-udmabuf-fixes-v1-0-f99281c345aa@google.com>
 <20241203-udmabuf-fixes-v1-1-f99281c345aa@google.com>
In-Reply-To: <20241203-udmabuf-fixes-v1-1-f99281c345aa@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|IA1PR11MB7727:EE_
x-ms-office365-filtering-correlation-id: 81fa2bb6-cc42-48e9-fc77-08dd144349d8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?d1dtaGlwS2FqMU5NYll3VFZ1QmRBalJEYmRLVEl3a3VrQU5odFJvL3doT1R1?=
 =?utf-8?B?R0JBVzFPZktKMXdEL3crdngwS3N6WTBUMWY4ZytmQVE0NFhQQmdMODBhaUVm?=
 =?utf-8?B?dXBqUWNrUVZaOS9DYW1BcDJVWUpqQStaRWcvS2c1bkppdHpEMjF6UnNyN0FB?=
 =?utf-8?B?RmNwVXE1dWdlWnlLSG9WWVpsYnU4ZjJxVm5hQ0V0cVlVZjIrMzgyNWxtc3Ix?=
 =?utf-8?B?RU90aXhYRGlPV1B6QXd3SEZVNHEwbHdwYkl6WmI3dzVhOTZtOHgyRDBEbVYy?=
 =?utf-8?B?enlIVEU1dWJTcUZFRlBZc1ZVb0I5UFJuTHlZc0JXWEM1Z2NTNG1DajdiRDBT?=
 =?utf-8?B?dUxFUXVjcEJyejdHaDN3VUduTGd1eE01SnowVzRKVU9kNVpnT0hGMzBsYXV1?=
 =?utf-8?B?eGgwRzBjU3hQZEc2Mkk1YlFZQnNRWms0QWpyOFlWLzhXUFU4cnNmUTV3RURT?=
 =?utf-8?B?V1VWb2RjM2NvNzNGM0lzYVJWR2lZZHRoSU1GeHN3SWY1U2pRUDNEWkVna2p1?=
 =?utf-8?B?MGZmNml6TmN5UnhhZGlMSU1rTk1IaTZneTd0ejFZdDVLQUppZkVqUDd0TmM4?=
 =?utf-8?B?b3g5VW55blNPaDFPQ2lhWTBIRUgyTG9qTDArRUcra3JBUTdkWTFiQmRZMExD?=
 =?utf-8?B?dFJ5MlZ4VG9YbHVmUkFrc282cU13clFNSEJhRWJ5N2VGUDFHamVUZEZ0Wkdp?=
 =?utf-8?B?TDZJYnQ2SmRIcnB3VkZlVFBFT3MrY05yT08wQ3F3WXN0b0tIdGZkSG9YMjRh?=
 =?utf-8?B?N05tdC9RNXZYYjdBV1Blek1IbjY4aktYb1hMRy9oTFlDNUZ1bG1RNE9MWXNt?=
 =?utf-8?B?L1hZSXViNldIRHVJRnk0Y29la2tPMEpUWE01TnNlQU9pTnpzaXk5enU5UnFO?=
 =?utf-8?B?VE85eTBxdGczS2F5SGdscStDemlseU5MdENZVDFDdGdUL2Zoa3VFWmxzZFhs?=
 =?utf-8?B?cDlJTDVjNWtQUmx3YkN5Wnp2STh6WEQ4YWNoTzBmQzFOSDF6Q2RoVzV6amU2?=
 =?utf-8?B?RGVTSlUvaFFQamFkUGNaSFdKamNGZ2RveUx1Z0lXeElGTDNBbEdDYkJNbmhW?=
 =?utf-8?B?Q0tHQkxpL3FzQnBhblhXeFFleHBVeElaOUxtM2RTNkdDS080OVVHU1ZkdE1U?=
 =?utf-8?B?dkxSUkpoU2VSNDd0Sm5FT1hQL3J6c2F6OXJDbkxVd0FXVkFFTjhGMk52QmpC?=
 =?utf-8?B?cUY4Q1Rtd2x3OXJSa3FjYXVCZEJ0RGk3RzFKeFdTR0RwdDhNWWVZbUVMbWxG?=
 =?utf-8?B?ajY1dVNrcUovY0Rtck4reXN1SG5GWEJhbWlyR2VGSXBROERMVGlOY05BaXFQ?=
 =?utf-8?B?OTlTd1RmV2NROWwwUExadkdEWUFiMjF0VWhHVzBxYkRKak9BNXBjYjBYR3RN?=
 =?utf-8?B?QXhiTFpxTEZIKzhZd0l6K3VlSzNONzU5bHFMWWJyLzkzVUQrY0l6SEhtNTdW?=
 =?utf-8?B?S2ZWOW9EN3gwUUVMTTdzejNqM1J3MzhWVGwxb2ZuWHJUU245bXNMSjdZOTVn?=
 =?utf-8?B?QTZUSFo2dVR2NFB6Smt2SG1zeVhOZXBzVEUxYWFmM2I1d3huWUprOHE2ZnJv?=
 =?utf-8?B?YXlNekNJY04zeWczQnNZVFFZWlgxSXRpZ21VcTlNSkN6TUtSaTRPcXMvV1Bv?=
 =?utf-8?B?UytrdGJGUjhEU211dWg0TE8xQXd3eDlrczBBekJrY0hXckFvaS9vaUFtdExJ?=
 =?utf-8?B?YUtIV1Z2bjJiMGlHZ00reWxrY2ovZEo4VHNBaWVYL3hjZ0QzMlExaWsrZHMz?=
 =?utf-8?B?enNOaUhqVWlabjhGcWxiNW91RXlKSUt6S1FRcC9raGp6c25KcHBpRjlZWHI0?=
 =?utf-8?B?UEVic0h2NzVwNTZWaUtTd3dwV3pBTW45SGN3aFI1TmxWNVJjbEFvTUpRU1M4?=
 =?utf-8?B?Rkk5YSsvZ2MwTCtzd1ZSUDAwbk5pa2EzSTBhVUFZM2pzbVNEQm9YdllQMk1a?=
 =?utf-8?Q?2jHx/RxxSqc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dGZ4OFNTRnRhUW5uL2I0b0NTai96UVJIZXJwbk11aE9aV050Tml6SUluY0gx?=
 =?utf-8?B?bm1yUGg5QUM2cXU2ajZQcjVQSUFmVUs2YTRVMS8xbE96c29COFJpQjNIelNl?=
 =?utf-8?B?dGVwcktVOFVvSUZaZmE2UW9KZUtDWTBoQVY0NnNlc1NyVXNxQy9Ebm5lcVJL?=
 =?utf-8?B?QjVmdXBaV005MmV2Zkl1d29lbUVFUk9OYUdkMnNEUnM3dndSZnBLYVlmUXFu?=
 =?utf-8?B?bjBxQkVGUmZuenNIczQwS0hJNnFaSDBUMkQ1cHNCdXNZSEpNUXIzRlVmZTNO?=
 =?utf-8?B?QTlERzN2cEFJUmJYbzdIR0ZpdDRObFMwa05xNExGbG9uN3QwbU1JM1JKZ1pm?=
 =?utf-8?B?Z0J5VnNBaFQwM0lFQytqQ1NXcWV3a1JFbm5UbDJ3MjQ1UlR5TXZkaXBNMEVx?=
 =?utf-8?B?YW5kaUNraXh5cVk1MEM0RStYcnlSRlN0aEhtRkVTRXdZdXI0L2cyTmx2UjdG?=
 =?utf-8?B?cXVzbTNWWW50c2ZydCt0dFZKWUVMZ05OclQxV1czQkJkb1Rsa2xvVy91dGI0?=
 =?utf-8?B?bUMrRHN3V3kzeEtnL1YxeW1JRDBxa2szVml5RytFV0cveFZJS3lscVFqSlR0?=
 =?utf-8?B?eHk2U0NxbUdvU3ZWN0QybHFxUmdFclV4Q05Rb3NYL3BRZVJvZm5Pdy91MGxV?=
 =?utf-8?B?YXpzRnU1TmF2OXU1dFk0TW9lQUJqU3RjdXJYY2VkeTRCZmpQc1kxRDd2WXFa?=
 =?utf-8?B?bnpGNTcwdkl2WjYxSW91MjJKcVM4WmJiWHI0ZDVRWVRXZ2g5alROK1BSQXBy?=
 =?utf-8?B?Yno5REZpS2ZXZWVqbklxbE9RS0RYbkNaWFR4NzlGaWVwWnY5WmtNRVY5V3Nn?=
 =?utf-8?B?RVNBQ1JRMU0wWloxRkFJLy80VU4rbDFRcWptdmEzSHF5Rks3NlZaS2pMQXE3?=
 =?utf-8?B?V0tMOVM0ZmZyWFNlWHlmcVNnTklCQ1EvYWlYQ2Q0YWJFbE10bWlWYmh6eG91?=
 =?utf-8?B?ZGV5ck84YzV0eE4zOVoxQjk4WE1mSWFLYi9Pd3IzN1ZQVldjRUdhcSt6aDZ2?=
 =?utf-8?B?R1M3YldBNXc0TGhCVkl1RG04NkRTaHlXSkdvM0xwVG9OckcxeVd1Si84bVN3?=
 =?utf-8?B?NzRYN1VkUUNQOUNWWWdBQjM4YU1CMGV2Q3hXNTF5WjdBcjFZL2hjaXB1T2h2?=
 =?utf-8?B?aHh4RXJFS1VxL3AxdXhmSjVrM0E1blV5NEJzMkVLTDFXTlBpdTJLV01EVzlr?=
 =?utf-8?B?clhBYnBQL1orNFgrVnRYaTgwVWlTMmJIK1crMDlrSVZvRkdQbFNBRlFqV0tq?=
 =?utf-8?B?eldSVFBCNXdoaWdyTlFjaVJKazZKUEpRTHBxOXlONi80ZElmOXZQY0VNTGUz?=
 =?utf-8?B?V0x1SWhLakd4cDFaVHhLVGk5WEcwdTh0OVNSTitRWTB5cXlmazhDczREMnFs?=
 =?utf-8?B?MUJ2c1lHWG90ME9GUFBOWDR6WmlLbDhKSER4ZlcrKzVhOFlMb0FBaysxd2Nm?=
 =?utf-8?B?YjVtNXQ2cmpiZkZiYlFOVWVTVytWTVIzRTVPTWdtdm84anNOTVdibFd4eW9S?=
 =?utf-8?B?b05HT04vU0Y3U1Q0VEd3Z2FzS010R29OOHo5SkEwTGJLejZEYTNVajFZV1Y1?=
 =?utf-8?B?b1FUdytBUUpvSTk1YWtZRFBtVVhSTHJkWHdPUkJDY3ZvSEdvS2tWY21Fek82?=
 =?utf-8?B?WmcySmhBUW9TTlpocGJIdS81d1BQU3RWYmFucXFYTzZyTmJjNGxEOGcwY2NI?=
 =?utf-8?B?cUoxd1d3UDV0eWNBd3J4K2ZZeFdjcjJySng1SkwzYlowK254RE81a2VlTUVD?=
 =?utf-8?B?WWh1MERCZSttRFpJZlViS1RwUldzbHZqT0F6Y0dmQUpyWEhZMTVPSVVMR2dD?=
 =?utf-8?B?NGdiTlpJaFNKekNiL0VENFBWUkowRVZrY0pKWDlkVWQzb1FqOVRuVUdBeFVC?=
 =?utf-8?B?SCtFLzlYN3FoSVoya0UwMWFRWjNJOHVVTHVZaGxCSmhVa1lnQkIrWElVNWNv?=
 =?utf-8?B?MHY0WldKN2lKTmVrMUtaR3lLVWRRZDUwZFN6V2Z1bXlXL1hqYW4zNzQvZkcx?=
 =?utf-8?B?MVVIVDU3Qmx2TXZKTXZLSHdpcEgvS2NpMG0rVEJuTHlLY0ZTU3lqKzg2dWs3?=
 =?utf-8?B?MldrYWllZ3hjd3h2RkRPbVlwRnNaeEhBY0RoZFVWVlVLc0VMdS9yV1ZhRk5q?=
 =?utf-8?Q?2hQee4/TQeOfdQ7H2jpwA+VJ3?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81fa2bb6-cc42-48e9-fc77-08dd144349d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2024 09:08:59.0733 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0Jikds7vHnREhFp8JfntjFHk17ECMOvkVtlQ9+qS8HT+v1zBDaikD+2d/7CXJeuuAwLB3UEJ1ao7lrY61DtCLhnqsl++wg+8/hXixOXDgSg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7727
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

SGkgSmFubiwNCg0KPiBTdWJqZWN0OiBbUEFUQ0ggMS8zXSB1ZG1hYnVmOiBmaXggcmFjeSBtZW1m
ZCBzZWFsaW5nIGNoZWNrDQo+IA0KPiBUaGUgY3VycmVudCBjaGVja19tZW1mZF9zZWFscygpIGlz
IHJhY3k6IFNpbmNlIHdlIGZpcnN0IGRvDQo+IGNoZWNrX21lbWZkX3NlYWxzKCkgYW5kIHRoZW4g
dWRtYWJ1Zl9waW5fZm9saW9zKCkgd2l0aG91dCBob2xkaW5nIGFueQ0KPiByZWxldmFudCBsb2Nr
IGFjcm9zcyBib3RoLCBGX1NFQUxfV1JJVEUgY2FuIGJlIHNldCBpbiBiZXR3ZWVuLg0KPiBUaGlz
IGlzIHByb2JsZW1hdGljIGJlY2F1c2Ugd2UgY2FuIGVuZCB1cCBob2xkaW5nIHBpbnMgdG8gcGFn
ZXMgaW4gYQ0KPiB3cml0ZS1zZWFsZWQgbWVtZmQuDQo+IA0KPiBGaXggaXQgdXNpbmcgdGhlIGlu
b2RlIGxvY2ssIHRoYXQncyBwcm9iYWJseSB0aGUgZWFzaWVzdCB3YXkuDQo+IEluIHRoZSBmdXR1
cmUsIHdlIG1pZ2h0IHdhbnQgdG8gY29uc2lkZXIgbW92aW5nIHRoaXMgbG9naWMgaW50byBtZW1m
ZCwNCj4gZXNwZWNpYWxseSBpZiBhbnlvbmUgZWxzZSB3YW50cyB0byB1c2UgbWVtZmRfcGluX2Zv
bGlvcygpLg0KPiANCj4gUmVwb3J0ZWQtYnk6IEp1bGlhbiBPcnRoIDxqdS5vcnRoQGdtYWlsLmNv
bT4NCj4gQ2xvc2VzOiBodHRwczovL2J1Z3ppbGxhLmtlcm5lbC5vcmcvc2hvd19idWcuY2dpP2lk
PTIxOTEwNg0KPiBDbG9zZXM6DQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvQ0FHNDhlejB3
OEhyRkVadEprZm1rVktGRGhFNWFQN256PW9icmltZVRnDQo+IHBEK1N0a1Y5d0BtYWlsLmdtYWls
LmNvbQ0KPiBGaXhlczogZmJiMGRlNzk1MDc4ICgiQWRkIHVkbWFidWYgbWlzYyBkZXZpY2UiKQ0K
PiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZw0KPiBTaWduZWQtb2ZmLWJ5OiBKYW5uIEhvcm4g
PGphbm5oQGdvb2dsZS5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9kbWEtYnVmL3VkbWFidWYuYyB8
IDkgKysrKystLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA0IGRlbGV0
aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hLWJ1Zi91ZG1hYnVmLmMgYi9k
cml2ZXJzL2RtYS1idWYvdWRtYWJ1Zi5jDQo+IGluZGV4DQo+IDhjZTFmMDc0YzJkMzJhMGE5ZjU5
ZmY3MTg0MzU5ZTM3ZDU2NTQ4YzYuLjY2MmI5YTI2ZTA2NjY4YmY1OWFiMzZkMA0KPiA3YzA2NDhj
N2IwMmVlNWFlIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2RtYS1idWYvdWRtYWJ1Zi5jDQo+ICsr
KyBiL2RyaXZlcnMvZG1hLWJ1Zi91ZG1hYnVmLmMNCj4gQEAgLTQzNiwxNCArNDM2LDE1IEBAIHN0
YXRpYyBsb25nIHVkbWFidWZfY3JlYXRlKHN0cnVjdCBtaXNjZGV2aWNlDQo+ICpkZXZpY2UsDQo+
ICAJCQlnb3RvIGVycjsNCj4gIAkJfQ0KPiANCj4gKwkJaW5vZGVfbG9ja19zaGFyZWQobWVtZmQt
PmZfaW5vZGUpOw0KSSB0aGluayBoYXZpbmcgaW5vZGVfbG9ja19zaGFyZWQoZmlsZV9pbm9kZSht
ZW1mZCkpIGxvb2tzIGEgYml0IG1vcmUgY2xlYW5lci4NCkFsc28sIHdvdWxkbid0IGl0IGJlIG1v
cmUgYXBwcm9wcmlhdGUgaGVyZSB0byB0YWtlIHRoZSB3cml0ZXIncyBsb2NrIGluc3RlYWQNCm9m
IHRoZSByZWFkZXIncyBsb2NrIGdpdmVuIHdoYXQgd2UgYXJlIGRvaW5nIChwaW5uaW5nKSBpbiB1
ZG1hYnVmX2NyZWF0ZSgpPw0KDQpUaGFua3MsDQpWaXZlaw0KDQo+ICAJCXJldCA9IGNoZWNrX21l
bWZkX3NlYWxzKG1lbWZkKTsNCj4gLQkJaWYgKHJldCA8IDApIHsNCj4gLQkJCWZwdXQobWVtZmQp
Ow0KPiAtCQkJZ290byBlcnI7DQo+IC0JCX0NCj4gKwkJaWYgKHJldCkNCj4gKwkJCWdvdG8gb3V0
X3VubG9jazsNCj4gDQo+ICAJCXJldCA9IHVkbWFidWZfcGluX2ZvbGlvcyh1YnVmLCBtZW1mZCwg
bGlzdFtpXS5vZmZzZXQsDQo+ICAJCQkJCSBsaXN0W2ldLnNpemUsIGZvbGlvcyk7DQo+ICtvdXRf
dW5sb2NrOg0KPiArCQlpbm9kZV91bmxvY2tfc2hhcmVkKG1lbWZkLT5mX2lub2RlKTsNCj4gIAkJ
ZnB1dChtZW1mZCk7DQo+ICAJCWlmIChyZXQpDQo+ICAJCQlnb3RvIGVycjsNCj4gDQo+IC0tDQo+
IDIuNDcuMC4zMzguZzYwY2NhMTU4MTktZ29vZw0KDQo=
