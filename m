Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 581D5AB5D13
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 21:23:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A758910E199;
	Tue, 13 May 2025 19:23:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aogSBbPW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E42D110E199
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 19:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747164227; x=1778700227;
 h=from:to:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=UVdc5OhW3yuMR2qQbh8mz/oBqD2qcTgDQH85l/Km/F8=;
 b=aogSBbPW/Xvzv9NdgxXIp+XRhDG1qukrEXu7WNAHDwYQaljsc/L6spC0
 sxaHC8b3f+3OyhW9uThfTPj3x0K3mBTw7I6Si4coRah0imM+iqF3Cehpl
 /e246FPaewYi0BnAF2TEkhfmKTmFk0xxdscG2+PJNub4h3E9pQs2h9aCd
 7nUpwfcL5UElZmSf0lIldKlGw5IRcwVqGYYkJIMyAlRpuB/NudILHvIhQ
 UbUl4Zu7aVjjoZsTO/3hG7L977z/Twnqu15ja4dSY1Fhaobvzb731Mh7r
 Xq3mBdTZk0w9oD50pnnTz68IzGzJKa7wtg4KWYaD7Om6iiuOpdPma6bYT w==;
X-CSE-ConnectionGUID: op0ec83sQOSw4mr6CxYuXA==
X-CSE-MsgGUID: pwwPAQq7SHWAgKicf1AAZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="48284605"
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; d="scan'208";a="48284605"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 12:23:40 -0700
X-CSE-ConnectionGUID: US6OBIdiRSq2+HpZmtPtBQ==
X-CSE-MsgGUID: d/iRwEcmT6yweN+hJA3mAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; d="scan'208";a="142903748"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 12:23:40 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 13 May 2025 12:23:39 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 13 May 2025 12:23:39 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 13 May 2025 12:23:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OBeVpd/YVSAue45joCnV2vjzi0yVNJjz/U39M6LT52+HmgUmnhQaieqnYptcPO2vwSJoSN/wgTG9JUiDi+gdZ29tnczoXHuGNw7WhROF1Ji4RqdXdDB9QNbkYhJiPpN7lgcG90XC28T9okgQ/9yJKXNbRfS4jx8NoZU0KA0TLaAAxmeeTgZ88mFqr3Dqc/jv25WZiydYhC8WL8EEtbCDE0L9E4Ol+EdWNynih8d1BE6WjxBgWpjf+8losSMgi3ZbQd08RYUnDHgly7s/R1jgMsm0tIhbFJ5RU3G6fjiu22e3bj8D9xnhc8IMsQxp9i/5DhLb8JLzyYgGH0QdSl5gtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UVdc5OhW3yuMR2qQbh8mz/oBqD2qcTgDQH85l/Km/F8=;
 b=cOqduSByyHsdH8DbDr4QIXpGCjAl3yuclqsN5TqcDtxL3Qp5o4QzabTqxHlP78KU2m6XQhbvD8gW1nQMcRG+aDBs0tyvqhlWT+4R8z0RNyQ6KM57a7fGO2hAitF+u5pFvhCwNAnxyQda38ixQVxaqtFk3ABkaIw90+7TXfxzZZefDeVleN6C4DbbrPMKo3TMqF02A+UyA/ICXUeZd5BxY9vRg2sVOvOhul+65uzopo+end8vglKQYexfPd//VBMXPKQTymjy2TReWHNHc4Yd81Qca1tR4r250M+L+mUnmhK0AmhC76ZwrqVv0xLIfAqFG27OHhqz5ZCiqz29B/AZRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH8PR11MB6879.namprd11.prod.outlook.com (2603:10b6:510:229::22)
 by SJ2PR11MB8451.namprd11.prod.outlook.com (2603:10b6:a03:56e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Tue, 13 May
 2025 19:23:35 +0000
Received: from PH8PR11MB6879.namprd11.prod.outlook.com
 ([fe80::bd3d:59f2:9d29:346]) by PH8PR11MB6879.namprd11.prod.outlook.com
 ([fe80::bd3d:59f2:9d29:346%7]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 19:23:35 +0000
From: "Kim, Dongwon" <dongwon.kim@intel.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, Akihiko Odaki
 <akihiko.odaki@daynix.com>
Subject: RE: [RFC PATCH 0/2] Virtio-GPU suspend and resume
Thread-Topic: [RFC PATCH 0/2] Virtio-GPU suspend and resume
Thread-Index: AQHbveDGUI4ch9Wax0+wshHtMZeSmrPEbDcggAAE0YCAAV1kQIALLozg
Date: Tue, 13 May 2025 19:23:35 +0000
Message-ID: <PH8PR11MB68792B11430CF12E9B7A525CFA96A@PH8PR11MB6879.namprd11.prod.outlook.com>
References: <20250418232949.1032604-1-dongwon.kim@intel.com>
 <7f334c99-fe86-4e53-86d6-e8473c76ff3e@collabora.com>
 <PH8PR11MB6879A6238EAD527704B8C994FA8E2@PH8PR11MB6879.namprd11.prod.outlook.com>
 <28584e91-6320-431d-afae-9f10e1eca86d@collabora.com> 
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB6879:EE_|SJ2PR11MB8451:EE_
x-ms-office365-filtering-correlation-id: 029393e9-fe7c-4275-2380-08dd9253a81c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?MWVFZUJQZFcvaVNYY2lNQmptSUlJRS9VTk1PaG1vTG10NE1tL1RZdCtZdlFp?=
 =?utf-8?B?VDNXVGxlTnRIcXlJak4xUVVNMW5YMDZCOVh6QTRic3R3ZGlDQ1FLb1dHMEdx?=
 =?utf-8?B?aXBsYjFzRlZNY2pBK1NVQmkyR1hSZC9nQjk4aTZ2VWNvOWVPdDRHZG9TUjJl?=
 =?utf-8?B?d1M3ZXR0K3B0V0NtWDAwT3E4eHBmbm5iaFRacnZNcWkyTGZSWkxLSEs1UjRU?=
 =?utf-8?B?b0NzVWtFZU0yT0NIS29RaDRmOXdOZU1LVW9HTlBQTUZlOEVHazBNL0dLZWha?=
 =?utf-8?B?ZmdVMmMrMEFyb0c3WXMxaHVvTW5EeTRPQlBiaEZoOTFRMlFMdkJlZ2dKcmlK?=
 =?utf-8?B?L2dYdU5ZTmYxcjIvdEZOeGQxN0Q2UE5aL2lubkhCNGtKUm11OFJ1Mk5YN3dl?=
 =?utf-8?B?QXN4ZWw2K2NTV2VEOWJqTklEQ1pjQkVlZERlZHZiY2sxNXVuS0N6cTJpM3hQ?=
 =?utf-8?B?YVlFWnBINldnZzNwVlN0NVY5bElpQjVFRGZpK2FCaDg1K0pSc3BBSzNGNlBw?=
 =?utf-8?B?Y29LanJxVmRpaThqR0d5SGdNLys0L2Y1dDNXZytwS1V0N3cxZzdwRjQrK0g2?=
 =?utf-8?B?UTV4NzZKV1R3bHZEeUhIYzBhZU5lM0F1YXJpUkhEckxuTkQxdFNlY09vd1NO?=
 =?utf-8?B?MUgrMnFUWWJ3OGJuU0ZBdDgvSk5STk9oUUNra0lXWEN2aFJ5K3FubXNwOGRz?=
 =?utf-8?B?Qk5RUXdmRU5lTnRuU0ZWNXgwUGhEdDkzdloxSnZLVHNTWWxYRzhTbUc3VFNO?=
 =?utf-8?B?N3lkQWVqM1FHYm9GTENtdzBxNnExVk54TGJUQituOE9FWlhzbDNWWmJoa2VT?=
 =?utf-8?B?cVBSZDRHengrRjN3UlVwQTFOb0xPM0tlUGNITFp0UWI2OUcxVHdvenFrV2cv?=
 =?utf-8?B?em9TWE84N2NBaGJLMDhmVTM4MW5QMTN1QVJBQVBERXJaTjd2UWZoNC9ZWW9E?=
 =?utf-8?B?RG15L1ovdWRqVWVJTEluaHIzUkFxVk1uck9rclJpb2V1K2pzNUp5QkJZL25a?=
 =?utf-8?B?V2lvbGVkcG9jM21ybWU0L09mMjA1dGdJOFl2K09CT0NPNWdZVmdITEF0eGJV?=
 =?utf-8?B?UlNKclpQQXJVdlByTG00VHVtSUxtckRhdDlBL0pRNHozR004VmNDSXBtOFRP?=
 =?utf-8?B?eVFNM0JKMlcvMmZVakhZYUlkWGJ0M3BvaTFJeklYam9nSkU3VitweS9HVmJa?=
 =?utf-8?B?SlprRFQ2RCtUVTJJQnNSa0F6cG1kRjFuMjd6aE9DWS9IQ0FacGVORUlKeE01?=
 =?utf-8?B?T09MTEYvOUNjYklSOHlPTWtkTVVySmlLL2lzY2d5dHNLL2pKTlFieFNDL0pL?=
 =?utf-8?B?b3pOWldjdlZKSS9sZk1tU1V1SGlBeEd2bXFQUGtKSUVxUmNWSjVkZE1KbUNE?=
 =?utf-8?B?dXVOQ1FVUTlnTWNHaU8rL0MzWDMwNlYxd0VkbVluNjlBY1V3QWRkWnlPb2J0?=
 =?utf-8?B?TFJTUGJaK2ZnNHF4cnBxUzUyVkFSYjd0MUZ2UXByYy9TakdROWVtSVdUYnNK?=
 =?utf-8?B?MlIvbDBoSGllbTd6K2kwMzd6Z0I0S1o2VjNXTWJtdUQzNGFIa2hCZ3VtbDcy?=
 =?utf-8?B?akJ2ZHNsOWJvRHdjVWJKTndKWFMyMEJWbXRRTlpwazFDNUFKSnFtTURlQUVp?=
 =?utf-8?B?WVhmdU91YVp0eHEvSGg1VmZBRTdYTnNXKzlKU2gxRkVTcmcxbXdtb3liNW1J?=
 =?utf-8?B?SUd3czBaRjRlWGVXb2NkMDBwMzdDUGdySitIUnM1b0Jkb1ZublJzUWpxWjJL?=
 =?utf-8?B?OWFpZTErK0dLalhhaC81Sk9JQThyK2hHWnR4ZGtWMEJYSC9IcUdhL2UvNE85?=
 =?utf-8?B?UmpEb3RSWGlGUDdycUtJRXdlNjhrbXZzaFJwRnNLc01uUlZ3Zi8xbVhacE8v?=
 =?utf-8?B?RWRlbkdlQjN1QVY5NDJlZkRBcy9OOGlyRHNOaXpXbnZxS1poNXhHQm83WUdk?=
 =?utf-8?B?SVU4dFpoZ0RueTBzM1RFWXVIcEV4QStTTmlhQmdORjFKNUQrTHhMRUdCWnND?=
 =?utf-8?Q?zMO6xlt/8E61AGFoaSTEQC+7viF8WI=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6879.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bkZEcURIQ2lRb045T25tVzJ6YTdOakxQOEN6UUVUWVZHam9MNkFmTjNra2Nm?=
 =?utf-8?B?cE9Tb1h5SXVhMUJSeU9aZXBvVk5uK1VMQ09ZWDJ2T3VzS0xZNVFkY1RvMWh3?=
 =?utf-8?B?WEFoU3d5MnZFU2xHMmwzcVpTTWRRVUh0Z3hHM0NTZ2UvVlpIT3pmd0ZvUk5O?=
 =?utf-8?B?ZUE3QVo5NjUwblM2eGpnWS82VHVuOXdpZ0JLYktwQmtaTWRzcGVhTzZ0WU1n?=
 =?utf-8?B?TGlVbnluRFFjam93bzRGak92ZkRyNGgvNWo0dnhrZGt2L0ZyMFJEdk85N3Uy?=
 =?utf-8?B?MXo3a2d0ekIzTjRtVnUyYk1iWndaM21oeVY3aUdLN3lZTjVSVWpMeERDZkhW?=
 =?utf-8?B?dlU5d0dFbDV1NzVrZG40eko2TmpGb0gvcFFMUVJ2RjB5OTNxRmY3ejcyZU1n?=
 =?utf-8?B?eFlzRkplYlJ1SHM0ZHZabFYvVURsbkZsU1NPVEM4WEp3U3VJVUpJK2Z4S0M2?=
 =?utf-8?B?OGYrNW9hSUQwRDU4RVBxRlFlbG5zdytmSXVvamo0TWVzN1ZLT3JENHowVHNG?=
 =?utf-8?B?cGJTb2lvcG1tSGRQM2ZmL3B5OERONDlYM1dabUV3eG5JaFFQajRVaEZkUGtp?=
 =?utf-8?B?aXdySFJMblBSMXlEYWVlUjNCZ0F6TGVnM3JuTDBkTkh4S0VMc0kybm5vZm1l?=
 =?utf-8?B?dHUvNXNuc2dQMkZzNWhGNWVWQUNZZGZqdUcxK0l6WklzK3lDVUxtMVZBejVl?=
 =?utf-8?B?ZzMyUWxQZVZRZzhzWUxmL1UwOW1RQzQ4U0xtSFloT0dBellHSnovcVVCMUtT?=
 =?utf-8?B?dk9kQlJTWEhaUGxTSUR5S3VQTWJKQTB6cjE5TXYxYXlIS0tFdWJYMWhZZDhG?=
 =?utf-8?B?MHg5VCtkTHZaaHFHMVlQZHAxUW5jS1lCbnRUWTJUQ0FZWVdNZXBLNkdNTmRp?=
 =?utf-8?B?aWZPbnlrYitSL1R0ZUpGU1Aray9ubTVzKzZQcGt0MmpZc0xxOUgreFk2dHM1?=
 =?utf-8?B?Vm0ySXdIVHYzdUF5Rkd3U0k5SFZIZVBhUWJrNUFpdXI1RUdVekE0enJOdEVr?=
 =?utf-8?B?U09TMTYrcDBkK1NuN3NXa0FDRFY0R1QvMFZIeWRyNEJZbE9zUEVNT1o2a1Er?=
 =?utf-8?B?bXRrU3B2cG9BaHM4bWltOUlMTmRnQXJPdW9TellZUmVlcVdvZFB5VnhKQXBR?=
 =?utf-8?B?QzVpY1JwRHRRYVVVazRtdHVPbk1QSWMzN0RNNENmTS9TaXQ1dWJwbHEycnkz?=
 =?utf-8?B?cjV5TStzRXZwUUltcUtPRFMyTjBFWlYwc0FLLyt4ZC9ST3NTaHdIRnMzSjJj?=
 =?utf-8?B?NXZuanB1T2dTRGllUmdNaXRnclB6aHlSNkllUWQzRjVsTndFYnJJZ1N3amt3?=
 =?utf-8?B?bHJUMmRtUTBWQjFpQnFNR2Y1Z3c2aDZ0VGtRbit0R1F5WGZLUi9STG9oMURE?=
 =?utf-8?B?Z2pVWXRKTzhURlRXSXVMOTRyUGsyRy9kcVFJUUFGVHhGd214b2RLaTViNm15?=
 =?utf-8?B?U05FSG43aDJOZENRNDNzaDcxV1d0Tjk3UnVDNWNxR2NmeUFSbEVYZ01RcGgx?=
 =?utf-8?B?MEVTRWdtaTlVRXRVWElxZlhMNFJ1VFNoT3hldXBhYzU1SGRqVExRT0NBaDV1?=
 =?utf-8?B?VFYyd1dpcDdqaUdaM3IvYlJFOFBHTElvWVBScGZOYlZhVWt0aUFIbDR2YS9r?=
 =?utf-8?B?ekNEcUh0NHZZdGxtZVlCVTJQU1AzTHFVVGNqWWRRcm1qUXkyM2dGUGI4TWds?=
 =?utf-8?B?L3FyYTBkRmFzUVlqclNBZTByTGNiNmhZd0RNeWhlZDFHcHRZSmwzbW4rTEdj?=
 =?utf-8?B?cmtpaS9lN0RxT09PL0puSVZNUjg3V3YrZzljU3F5TCsxZStSWFR0aW9vVitv?=
 =?utf-8?B?NU4wYjNGaFM3bHZLdXR0Q1RUV3BVQUl6aTZabDhIaEt4a2RDd2lzWDYrNDhK?=
 =?utf-8?B?ODhqUXBvMWJocGJ1dURXclFhTkI2ZnVTclZDSTIzUTNaWUx1QXRONnVyYVBi?=
 =?utf-8?B?ajNMOURyT0hsWnBiL25EWUFQMWVRUXp6TlZIMCtxSjRieHZNWXcrYW5lYzJ4?=
 =?utf-8?B?K2tOR0VYZ1ZUVkYxb0IzblpBUHN5YjhOcUhuVVdGNVNSUm5QaDAyTm45Qkpn?=
 =?utf-8?B?K2VjWHVMTStnTE1mMW81RFhMN3BBSmpwSWVRTWZxemJjU21VYnlJN3lUMFd5?=
 =?utf-8?Q?v04VzE+3rR97GR4hDgWk+v6iO?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6879.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 029393e9-fe7c-4275-2380-08dd9253a81c
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2025 19:23:35.6414 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rf1IzdFpcVKI9jqMuk4ReL1MqQSJiNPrU/acovGOJMGshinsQnyWukA6cXwhlFiM1RYS1FU1XenQRe1ifkb2Qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8451
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

SGkgRG1pdHJ5LA0KDQpDYW4geW91IHNoYXJlIHNvbWUgZGV0YWlscyBhYm91dCB5b3VyIHRlc3Qg
c2V0dXA/DQpIb3cgZG8gSSByZXBsaWNhdGUgdGhlIHByb2JsZW0geW91IHNhdz8gQW5kIGlzICJz
dXNwZW5kIGFuZCByZXN1bWUiIHdvcmtpbmcgYnkgZGVmYXVsdCBpbiB5b3VyIGNhc2U/DQoNClRo
YW5rcywNCkRXDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2ltLCBE
b25nd29uDQo+IFNlbnQ6IFR1ZXNkYXksIE1heSA2LCAyMDI1IDk6NDcgQU0NCj4gVG86IERtaXRy
eSBPc2lwZW5rbyA8ZG1pdHJ5Lm9zaXBlbmtvQGNvbGxhYm9yYS5jb20+OyBkcmktDQo+IGRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8u
b3JnPjsgQWtpaGlrbw0KPiBPZGFraSA8YWtpaGlrby5vZGFraUBkYXluaXguY29tPg0KPiBTdWJq
ZWN0OiBSRTogW1JGQyBQQVRDSCAwLzJdIFZpcnRpby1HUFUgc3VzcGVuZCBhbmQgcmVzdW1lDQo+
IA0KPiBIaSBEbWl0cnksDQo+IA0KPiA+IFN1YmplY3Q6IFJlOiBbUkZDIFBBVENIIDAvMl0gVmly
dGlvLUdQVSBzdXNwZW5kIGFuZCByZXN1bWUNCj4gPg0KPiA+IE9uIDUvNS8yNSAyMjozOCwgS2lt
LCBEb25nd29uIHdyb3RlOg0KPiA+ID4+IEkgdHJpZWQgdG8gYXBwbHkgeW91ciBrZXJuZWwgcGF0
Y2hlcyBhbmQgdGhlbiBzdXNwZW5kL3Jlc3VtZSBndWVzdA0KPiA+ID4+IGtlcm5lbCwgaXQgZG9l
c24ndCB3b3JrOg0KPiA+ID4+DQo+ID4gPj4gdmlydGlvX2dwdV90cmFuc2Zlcl90b19ob3N0XzJk
OiBubyBiYWNraW5nIHN0b3JhZ2UgMg0KPiA+ID4+IFsgICAyMi45MDk0NTRdIFtkcm06dmlydGlv
X2dwdV9kZXF1ZXVlX2N0cmxfZnVuY10gRVJST1IgcmVzcG9uc2UNCj4gPiA+PiAweDEyMDAgKGNv
bW1hbmQgMHgxMDUpDQo+ID4gPj4gdmlydGlvX2dwdV90cmFuc2Zlcl90b19ob3N0XzJkOiBubyBi
YWNraW5nIHN0b3JhZ2UgMg0KPiA+ID4+IFsgICAyMy4xNjkxMzhdIFtkcm06dmlydGlvX2dwdV9k
ZXF1ZXVlX2N0cmxfZnVuY10gRVJST1IgcmVzcG9uc2UNCj4gPiA+PiAweDEyMDAgKGNvbW1hbmQg
MHgxMDUpDQo+ID4gPiBbS2ltLCBEb25nd29uXSBJIHdpbGwgY2hlY2sgeW91ciBmYWlsaW5nIGNh
c2UgbW9yZSBjbG9zZWx5LiBBcyB5b3UNCj4gPiA+IGtub3csIHdlIHVzZSB2aXJ0aW8tZ3B1IGRl
dmljZSBvbmx5IGZvciBkaXNwbGF5IGRldmljZSwgd2hpY2ggbWVhbnMNCj4gPiA+IEkgdGVzdGVk
IHRoaXMgaW4gdGhhdCBzcGVjaWZpYyBlbnZpcm9ubWVudCBhbHRob3VnaCBJIHRob3VnaHQgaXQg
aXMNCj4gPiA+IGdlbmVyaWMNCj4gPiBlbm91Z2guLi4NCj4gPg0KPiA+IEkgdXNlZCB2aXJ0aW8t
Z3B1IHdoZW4gZ290IHRoZXNlIGVycm9ycy4NCj4gDQo+IFtLaW0sIERvbmd3b25dIEhtbSBJIHRo
b3VnaHQgSSB3b3VsZCBiZSBhYmxlIHRvIHJlcGxpY2F0ZSB5b3VyIHByb2JsZW0gaWYgSQ0KPiBy
ZW1vdmUgYmxvYiBndWVzdCBmcmFtZWJ1ZmZlciBidXQgSSBjYW4ndC4gSW4gdGhlIGNvZGUgY2hh
bmdlcywgd2UgYXJlDQo+IGF0dGFjaGluZyB0aGUgYmFja2luZyBzdG9yYWdlIGZvciB0aGUgcmVz
b3VyY2UgZHVyaW5nIHJlY292ZXJ5IHByb2Nlc3MuDQo+IA0KPiArCQl9IGVsc2Ugew0KPiArCQkJ
dmlydGlvX2dwdV9jbWRfY3JlYXRlX3Jlc291cmNlKHZnZGV2LCBjdXJyLT5ibywNCj4gJmN1cnIt
PnBhcmFtcywNCj4gKwkJCQkJCSAgICAgICBOVUxMLCBOVUxMKTsNCj4gKwkJCXZpcnRpb19ncHVf
b2JqZWN0X2F0dGFjaCh2Z2RldiwgY3Vyci0+Ym8sIGVudHMsIG5lbnRzKTsNCj4gKwkJfQ0KPiAN
Cj4gSSBkbyBub3QgdW5kZXJzdGFuZCB3aHkgaXQgc2F5cyBpdCBjYW4ndCBmaW5kIGl0LiBEaWQg
eW91IGdldCBhbnkgZXJyb3Igd2hpbGUNCj4gZG9pbmcgVmlydGlvX2dwdV9vYmplY3RfYXR0YWNo
Pw0KPiANCj4gV2hhdCBsaW51eCBkaXN0cmlidXRpb24gZG8geW91IHVzZSBmb3IgdGhlIGd1ZXN0
Pw0KPiBBcmUgeW91IHVzaW5nIHZpcmdsIGRyaXZlciBvciBzdyByYXN0ZXJpemVyPw0KPiANCj4g
Pg0KPiA+IC0tDQo+ID4gQmVzdCByZWdhcmRzLA0KPiA+IERtaXRyeQ0KPiBbS2ltLCBEb25nd29u
XSAgVGhhbmtzIQ0K
