Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A11AAFB9B
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 15:38:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D99F10E926;
	Thu,  8 May 2025 13:38:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ey9lxYtQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C2D810E91B;
 Thu,  8 May 2025 13:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746711528; x=1778247528;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=J3OMp9vUfw2msJ4t83dYWlXlACXSM9WvpuXXRBJHhts=;
 b=Ey9lxYtQw8CwGHL6wey+dQc+JIeb9+MHLSbzuXOoSQvVAjFMJ1ykQEhd
 L/0txIF5izEgZrk8/KqqdH8FlNFbXK8RvcImHAef8mim/ltcnuzsgRCUj
 lIMZt0RZe+rpyx9GDZJCnZOFWpKCmiB7cKzgzL8/aO2HeHoAT0UGuI07Y
 LIO+aDC3Y9IJ1DZ7+OXs0AV5LCT3eEnxvQYjDpM/4vZhzZw5qR1id/PWw
 4sJFm9q1Lon7hF3luyg8bna04UGnWL1+jFaQBPD0MXY4CQkqeE2H44sSN
 GRkFolfd/yLuGK/43QVBMQRfUXUyfueRXNC23qtZByvRZIKlq4TyIylVe w==;
X-CSE-ConnectionGUID: xT0eoTv+QIuG8u2lUzHNUQ==
X-CSE-MsgGUID: m2qymAlaQomiXTLZC7YTCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="47599391"
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; d="scan'208";a="47599391"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 06:38:47 -0700
X-CSE-ConnectionGUID: d6X40byCTBiplfS31us/Hw==
X-CSE-MsgGUID: zc6I5gpJQyasHTSXa3GA2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; d="scan'208";a="140334334"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 06:38:41 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 8 May 2025 06:38:41 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 8 May 2025 06:38:41 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 8 May 2025 06:38:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cnld7Mdb3KqwTWH1B+gogFurDIrvRKO+ZgZPZbaVc7/yY9SZtwtm+iq7IeAigLMkCb2BByfolUM/t0M1ZeDH7RbbC8e+q1qPaDI6cndeK2WPqysDGO/ULaZQk7dhqZZHaAHR/wAgsCX8MQu7l87olksn7jWffvtDu8ioKREsH/VIrqX50ClZIE4q3UKZiIkKk+tZb+k1pQ7n2DLDsrdJ0SiJfiog17VluR0j17zgtQVuGFzh3uYKI4Fy3iSmzcXKf8RToFcnaNyvg123k8mrkIxcMY3DH9riIkIBhhR70dwI4ZJLjnzN6tmGqFgwSLzLRltSV30FNsYbbIqA2e/9gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J3OMp9vUfw2msJ4t83dYWlXlACXSM9WvpuXXRBJHhts=;
 b=mPSgFTtye+c0HkcPEmljW3z1350kjNdJGvk8+WL/ECtrZ+0hEA+zOCZXh5F1ecgqWrVYzi5DRhA6TivJO/R+grp5vM8tig70RItjbGWPizbPVBbxyGh+rmJebABb7uv9S1hfqxHt1ZoTiPKr3qpyJ1Qw6/OZnvbMMRBG7yDwjO8o7kAWX4aOeDHL4x/jpX4fNLyMRxlJfCfavj9PlGe3Dxkn3h/1YwGInsfwsAsPZQqRysB0GHIuZVny4alih3421kS/B8IMKp2vc+BQcNtoHkpWDMFtMZndMt3d4EnVqeB6mgjNbueyeNSMjm7mLdnlK6DDyHvHF8jWnzY6qA30vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by DS7PR11MB6198.namprd11.prod.outlook.com (2603:10b6:8:9a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Thu, 8 May
 2025 13:38:19 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%3]) with mapi id 15.20.8699.026; Thu, 8 May 2025
 13:38:19 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: Alex Deucher <alexdeucher@gmail.com>, "Borah, Chaitanya Kumar"
 <chaitanya.kumar.borah@intel.com>, "Wentland, Harry"
 <Harry.Wentland@amd.com>, "Leo (Sunpeng) Li" <Sunpeng.Li@amd.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, "Syrjala, Ville" <ville.syrjala@intel.com>,
 =?utf-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, "Kumar,
 Naveen1" <naveen1.kumar@intel.com>
Subject: RE: [PATCH RESEND v13 0/5] Expose modifiers/formats supported by
 async flips
Thread-Topic: [PATCH RESEND v13 0/5] Expose modifiers/formats supported by
 async flips
Thread-Index: AQHbp4IVAfdekzvXUk2zj/MggHpl1LOl4G8AgAuXRQCAF3WfgA==
Date: Thu, 8 May 2025 13:38:19 +0000
Message-ID: <IA0PR11MB7307ED8EBF70B88CE33A1AB6BA8BA@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20250407-asyn-v13-0-b93ef83076c5@intel.com>
 <SJ1PR11MB6129BDF34CF14847EEE77168B9BD2@SJ1PR11MB6129.namprd11.prod.outlook.com>
 <CADnq5_P3_usd9RDdLfjshz-o+nzkVSBrHmrqRUQThtX4X3jP9g@mail.gmail.com>
In-Reply-To: <CADnq5_P3_usd9RDdLfjshz-o+nzkVSBrHmrqRUQThtX4X3jP9g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|DS7PR11MB6198:EE_
x-ms-office365-filtering-correlation-id: 99689d33-2918-42bf-dc3b-08dd8e359855
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|13003099007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?cWZrcTB1eUhsbFhzbG1xNlZXMVhsUEc0NCtyT0NLUGN2YjE1LzZ3WlVyamdL?=
 =?utf-8?B?S0dtclBWR2VDd1RGaVhQNjkwN1ZkZTNYMk9STHl1WnVwK050NE1zdkZ2d0ZI?=
 =?utf-8?B?N1Jza3ZIOVFUMU0vR0JXZThFdUZMVmxkSWkyYTRkbmdGN2pzTFBRZFlzUmxU?=
 =?utf-8?B?cFphYUJGMTF4a2hrV0pyaDYxem9PYjZKeXZlM2YxU051VFJVbXAxUnZUSkpR?=
 =?utf-8?B?L3cyK0g1WERjZjFGNnBKSXord2pZY2hFdzdVRzlsR2pPdTNsMW5wT1czdzN2?=
 =?utf-8?B?a3B3VUJJMDB3RzNIeStrWmZKZEVGT0EzUGRwbVdmQmRiZFpkYy9CejdlbTll?=
 =?utf-8?B?czBYMEpjRVhQUHNjb3R1QU0zR2dWRkVsQyt3b0kzR001TnJhdmd1Rm5temVE?=
 =?utf-8?B?MDBPSHB0Y1IwVkRBNHlBVlhhRDExVWdhVEZVYUxQcTlYa09FUDZmUjE3WkJP?=
 =?utf-8?B?Z3JTN1BRSFBjdlI2QnJkOWQwcE41QWw4R0ppQVVqd3ltTVdQQThPZC9Gdk8z?=
 =?utf-8?B?bVVhOGFUZit4RWMrZWk3NVltaWNxcHEwV205cVhUc3prenlNSGlIOXdTaDJH?=
 =?utf-8?B?aU9YWWh2UXpvR3NveStLcE5XbVZHMFExQTFvN2J3SGd4VUZqWWVpckRMNVU2?=
 =?utf-8?B?WEQrY3F3VmkzU0x4Uisvb0UrUWdyQWVrQU9Lck5tc2JkTm45S3d4dVZybnVi?=
 =?utf-8?B?UUJaRHo4Qnh3OVBkWGthc0FaWUw2U080UTdYd1JRYWhjdnhwQlgvcE9RbzVS?=
 =?utf-8?B?dFpObk1tRmo3L2NLMEJodFpsckU2KzBFTFQzYlFLRldhdVowYm45QTdudHdt?=
 =?utf-8?B?NDkrNXRSdmFocEVPVCtCV01QVEVNL2FWUEp3TGp0WTJpcnZTRzlMYWtYUGQz?=
 =?utf-8?B?MlJvelRLN1hDMlNtRFB4YUFwRFBhdTU2cWt0VVQwaW1KaWlrY1BEcVFleWw2?=
 =?utf-8?B?QmlvMmw0N0VJazJwbVZQcjI1L3BlS01LQU92eGJldmZQUTFXZFNaeGRZb0xk?=
 =?utf-8?B?dStMc0k2SzdkYytWZit1THU5T1p6S0VtQ3dHUWVLZXdaU2VyZXFBSGNOb3lU?=
 =?utf-8?B?TlVQc0Jpcll5TGN2VFltZEVmY1VzZFhBbGZiQ0NKa0tDVjhLaUM4Z2Vuc3ZZ?=
 =?utf-8?B?d085OGI5ZkN1YThnSTNHdFZ5VSttMXB6RUdYekNYYXNzWnhiL3Z5OEc4Q2Q1?=
 =?utf-8?B?N2Jjb0pDTk5RYWpkOWo4UFBQejhmU0czUFdsVDFSKzlUc1dSWklvSWorUW41?=
 =?utf-8?B?ZVh3cU9WMDcrQkZ1K2tKTmJKVGNWNVNzUzR1OGY3cnAxRTF0dDVLSHZ4cklF?=
 =?utf-8?B?dURqMExrelMwd2RQRnh4MVJ5RWtBb2w2bFVWU201UU9KbDdtVjVieTJsMjVL?=
 =?utf-8?B?TlBGbWJqQnhvbFY2eStNVUdCWFFhZFFJNlBkemUrUzJKMmUxOWltZ09oeG43?=
 =?utf-8?B?bG9paHkzYnBtVWhlTnVTMndaUkFnTFQvRXVIRGs0dlljdnZQNG9kZVpWaVR3?=
 =?utf-8?B?UEw1d1JxTStFUndhdGNSdUVWMmZUQTdxL2FvZXJFUGI3WCs5blV5TkoxVzZk?=
 =?utf-8?B?SDNkRkhOeG5qbjJpUC9tMzVmN0I2aHFQd3FNVE93S0psYjJ5MkZZdjlXRXJ3?=
 =?utf-8?B?RElOZ0ZPOUN2ZmI0MEtGeHI5eFE4ZDFaTkxWRGJmTWNvRU51WStrajQ3Mk1y?=
 =?utf-8?B?ZERTeDlMZGEvVTR6MkoyMVhxeWFDR2paa2t0ektsRWVHcERIcTZWWlUyeUVj?=
 =?utf-8?B?MGNxeURyRUJsQ3U5am9KZFh4RTBhOGZlT2pKR1hGR3VyY08zQ2J4Tm8wRkZm?=
 =?utf-8?B?YjFwRjlyVlhWSys5M29pMWsvbkE3T0FoWGM3akRUL3JDVlV2azZ2c3lOTlQ3?=
 =?utf-8?B?cWlkK2E1MkJ1QkI2Q1pMZ1VGOFlQcjl4bjNicVVSU3JTbEgvblM0MDFxVUVl?=
 =?utf-8?Q?mGJ3XSgBZlU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(13003099007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UWU3NmRiQ3lSb2pCRFRlRHpocnRIKzB1YlppRXRtdnZjMjJWUnI3TjBuaE5T?=
 =?utf-8?B?QW5uT05rZXdMS0hFekUybkNLelhnM2xPbU9GVVhnc2ttc04yTmtsSE5aTzAz?=
 =?utf-8?B?WlM0T1B3MWhSTHp1T0o5RGR2cjY5TndmY0VWMmRiQVU0a1dYd3JKNURobEti?=
 =?utf-8?B?OXNhOG9ZUTNvNmRFcmwxUjUweVc1cGpxSnNnZnQ1c25GZHVGa2J3cGdJRlhq?=
 =?utf-8?B?ejlNaEhjUjc5V0pCU3ErdWo0MzN6ZGJXY29SQVZSeThqTEFnQTJCTitnVkpL?=
 =?utf-8?B?bHhlS0s5VEMySXlOSTRpZHBMYWNhYXloSTBSTkFtRHJweG0xQ3RBSGxxNXA1?=
 =?utf-8?B?ME9yVXVVNHJ0cEEycEV2Wm01VTNjSkVLR3ZyTlNYb1paZnhPSUVuN2hud3d6?=
 =?utf-8?B?ZXhvdnpnVEhVZXJvU2NVZmRjVkRIR1c3SUhDTTlaeThLKzlMTHZBc2ZxWWJJ?=
 =?utf-8?B?a1h0VmNoY3VkZjVaaGdNd3pJZ0w3UGV3MjI5LzdoL1haN01BVklMYm1SZS94?=
 =?utf-8?B?TU9XSWFnczQ5bzhqZGkvenJJcTZ2R1RqSDFkSjgrTFppd2lUZXNFL2R4MGdS?=
 =?utf-8?B?dHVXRzdhSFdjUDdDZUUvNHNxVXBURkhyVDNOcjAvVUlBRjFWTHhKRmZSN0Rz?=
 =?utf-8?B?UkViRFl1VmdwOHJpcTdOMkRWbUZIR0FyWTFQdzlGcHJOTWJwYzQxZzFrM2pk?=
 =?utf-8?B?K3ROZHp0MkhzQmtSdXBRUG1tellvb3czSGhrR2tLa0JPa3ZWUkJoWnNXMGRV?=
 =?utf-8?B?c2U5R085ZHcxYUxVcUxwWE12eGV0OFdyZFdtbG1YMUR6Ulc3WVBycGxRN2l0?=
 =?utf-8?B?R0xrbVhrT0dVRExmeGtkckxyU3diUHdQa0h4MlBGaExNSjBxTWJZQ3dzZTl4?=
 =?utf-8?B?TkxaZmVVUUUxTTZhWm5iVGJHMmNZVXBSa1FYQXhKR0RydXF1T0dlSmxCbytL?=
 =?utf-8?B?Y0NjVzJzcFhZZTJ5ZjRGZ1pBN2FOZVJaVVJISlZJcGY0N2dGamN0Y1JRWlhK?=
 =?utf-8?B?enFhc09xOGIzU1MxUVhHM3p2Wk1Nd0dVZUpUWUdRa2xrVExBNTRPWGRFdGtG?=
 =?utf-8?B?ZG5KTWdSNXYrUlJHTVpkMWhDYlhVNTEwblRtUkJCVnRvcjBLdjhCZjRmY1Ny?=
 =?utf-8?B?aDFYSXUwN3IvdnBlMytYVkFmRGJZS28zUVY2VUhEWTkra2REZERuOEFhaVRq?=
 =?utf-8?B?UnhrTGFrRTduRzJJL3BEMVJWd210eC9yd0FCcWlkQzdxakYrQVgxZVArR3Yw?=
 =?utf-8?B?QjNQZjQzajJnWjhmTlNCVUloby9TN0RPdlN0dS9VRHFRYlZ1QThDYk1OcTNG?=
 =?utf-8?B?ejlyemdUN2VXQnhBZnBVRkM2UG5UU2VUV0wzblorc1EvRFNwM04yWStHTExT?=
 =?utf-8?B?RWdnVUhmbkFuSldFZmY5M1pqZmFVdXcrRmdrV2tZUWlaRkMzTUlHdWtkK3gr?=
 =?utf-8?B?TVhrYzY4QzBmSjVJaXlaakc3MXA2NGlLY0xEdFFDVE54Y1VvYndyZERVdnZT?=
 =?utf-8?B?Qmdqa0h3NW5KZUVjVE02SjExUkx0TDFsSUtsVkN5dU5IM2YwbGJjYk5SUFJC?=
 =?utf-8?B?ZVhLeWJrVzNnbWJMUjZOZEwzVTVpTko1MHBpMGlqRkU5SjNKWVd6UUpHV0F1?=
 =?utf-8?B?YmE5OVdlY3M5MWdNVnBMTDVFK3B4WjZrUkJ6YldFUHE1OGUvVFZDZjUxSzZ5?=
 =?utf-8?B?M0I0NnUyUjEwMDlBYjRWVGtRd2NVMWxrTDFNbHI0MFRXQWNDN3Rha0YrVzkv?=
 =?utf-8?B?RDBVVlg5ZUZ5d3E5cEdPV2xiVFA4QkJNa2VYczlHeG8rMTFCOC9zVkNBbTZN?=
 =?utf-8?B?RVg4WHU4S1NWZXNJaVBjY1dISXhiSkI0Z1gvQjVyQ3VIVENmVElNTEM1ZGVy?=
 =?utf-8?B?eEdCVDJwUml5dUlvZ1h0RWFQUEVnWUFTN0tmT0RUdktwaHYydjdRM0Rvdkxi?=
 =?utf-8?B?MDVnM0FwWXZUaUdJbTZJeENESDVGcDN5MVJ1UVRXS05VOEpEREFzcnp5QVhU?=
 =?utf-8?B?bGpiS0N4OGc3N3J3anhkOTBJREkvTGhJd0VtSW1pVkFKdTcraVJTWDl5MlR5?=
 =?utf-8?B?T0M0Nyt3UGlJUXM3amtxV1RPaVc0UGsvKzBBWXhJeVZjV1hPdE5GS0xJT1ky?=
 =?utf-8?Q?diLCmxw+BdTIQ4wdNL1JT45AS?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99689d33-2918-42bf-dc3b-08dd8e359855
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2025 13:38:19.6406 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X8pzY5+aPAx8gL1C2FxXNnlCIqrgv2dJdhRGbamhpCWOuYKJ+vufqzR1jZahmmFBg0Jj2Br9aTYY5JJQqp0nag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6198
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbGV4IERldWNoZXIgPGFsZXhk
ZXVjaGVyQGdtYWlsLmNvbT4NCj4gU2VudDogV2VkbmVzZGF5LCBBcHJpbCAyMywgMjAyNSA4OjUx
IFBNDQo+IFRvOiBCb3JhaCwgQ2hhaXRhbnlhIEt1bWFyIDxjaGFpdGFueWEua3VtYXIuYm9yYWhA
aW50ZWwuY29tPjsgV2VudGxhbmQsDQo+IEhhcnJ5IDxIYXJyeS5XZW50bGFuZEBhbWQuY29tPjsg
TGVvIChTdW5wZW5nKSBMaSA8U3VucGVuZy5MaUBhbWQuY29tPg0KPiBDYzogTXVydGh5LCBBcnVu
IFIgPGFydW4uci5tdXJ0aHlAaW50ZWwuY29tPjsgZHJpLQ0KPiBkZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmc7IGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGludGVsLQ0KPiB4ZUBs
aXN0cy5mcmVlZGVza3RvcC5vcmc7IGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb207IEphbmkgTmlr
dWxhDQo+IDxqYW5pLm5pa3VsYUBsaW51eC5pbnRlbC5jb20+OyBTeXJqYWxhLCBWaWxsZSA8dmls
bGUuc3lyamFsYUBpbnRlbC5jb20+OyBWaWxsZQ0KPiBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFA
bGludXguaW50ZWwuY29tPjsgS3VtYXIsIE5hdmVlbjENCj4gPG5hdmVlbjEua3VtYXJAaW50ZWwu
Y29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIFJFU0VORCB2MTMgMC81XSBFeHBvc2UgbW9kaWZp
ZXJzL2Zvcm1hdHMgc3VwcG9ydGVkIGJ5DQo+IGFzeW5jIGZsaXBzDQo+IA0KPiArIEhhcnJ5IGFu
ZCBMZW8NCj4gDQo+IE9uIFdlZCwgQXByIDE2LCAyMDI1IGF0IDI6MzPigK9BTSBCb3JhaCwgQ2hh
aXRhbnlhIEt1bWFyDQo+IDxjaGFpdGFueWEua3VtYXIuYm9yYWhAaW50ZWwuY29tPiB3cm90ZToN
Cj4gPg0KPiA+IEhlbGxvIEFsZXhhbmRlciwNCj4gPg0KPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCj4gPiA+IEZyb206IE11cnRoeSwgQXJ1biBSIDxhcnVuLnIubXVydGh5QGludGVs
LmNvbT4NCj4gPiA+IFNlbnQ6IE1vbmRheSwgQXByaWwgNywgMjAyNSAxMToxNCBBTQ0KPiA+ID4g
VG86IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7DQo+ID4gPiBpbnRlbC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnOyBpbnRlbC0geGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+ID4g
PiBDYzogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGxpbnV4LmludGVsLmNvbT47IEJvcmFoLCBD
aGFpdGFueWENCj4gPiA+IEt1bWFyIDxjaGFpdGFueWEua3VtYXIuYm9yYWhAaW50ZWwuY29tPjsg
U3lyamFsYSwgVmlsbGUNCj4gPiA+IDx2aWxsZS5zeXJqYWxhQGludGVsLmNvbT47IE11cnRoeSwg
QXJ1biBSIDxhcnVuLnIubXVydGh5QGludGVsLmNvbT47DQo+ID4gPiBWaWxsZSBTeXJqw6Rsw6Qg
PHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPjsgS3VtYXIsIE5hdmVlbjENCj4gPiA+IDxu
YXZlZW4xLmt1bWFyQGludGVsLmNvbT4NCj4gPiA+IFN1YmplY3Q6IFtQQVRDSCBSRVNFTkQgdjEz
IDAvNV0gRXhwb3NlIG1vZGlmaWVycy9mb3JtYXRzIHN1cHBvcnRlZA0KPiA+ID4gYnkgYXN5bmMg
ZmxpcHMNCj4gPiA+DQo+ID4gPiBBbGwgb2YgdGhlIGZvcm1hdHMvbW9kaWZpZXJzIHN1cHBvcnRl
ZCBieSB0aGUgcGxhbmUgZHVyaW5nDQo+ID4gPiBzeW5jaHJvbm91cyBmbGlwcyBhcmUgbm9yIHN1
cHBvcnRlZCBieSBhc3luY2hyb25vdXMgZmxpcHMuIFRoZQ0KPiA+ID4gZm9ybWF0cy9tb2RpZmll
cnMgZXhwb3NlZCB0byB1c2VyIGJ5IElOX0ZPUk1BVFMgZXhwb3NlcyBhbGwNCj4gPiA+IGZvcm1h
dHMvbW9kaWZpZXJzIHN1cHBvcnRlZCBieSBwbGFuZSBhbmQgdGhpcyBsaXN0IHZhcmllcyBmb3Ig
YXN5bmMNCj4gPiA+IGZsaXBzLiBJZiB0aGUgYXN5bmMgZmxpcCBzdXBwb3J0ZWQgZm9ybWF0cy9t
b2RpZmllcnMgYXJlIGV4cG9zZWQgdG8NCj4gPiA+IHRoZSB1c2VyLCB1c2VyIGJhc2VkIG9uIHRo
aXMgbGlzdCBjYW4gdGFrZSBkZWNpc2lvbiB0byBwcm9jZWVkIG9yIG5vdCBhbmQNCj4gYXZvaWQg
ZmxpcCBmYWlsdXJlcyBkdXJpbmcgYXN5bmMgZmxpcHMuDQo+ID4gPiBEaXNjdXNzaW9uIGFyb3Vu
ZCB0aGlzIGNhbiBiZSBsb2NhdGVkIEANCj4gPiA+IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9w
Lm9yZy9tZXNhL21lc2EvLQ0KPiA+ID4gL21lcmdlX3JlcXVlc3RzLzI5NjE4I25vdGVfMjQ4NzEy
Mw0KPiA+ID4gTXV0dGVyIGltcGxlbWVudGF0aW9uIGZvciBJTl9GT1JNQVJUU19BU1lOQyB1bmRl
ciByZXZpZXcgQA0KPiA+ID4gaHR0cHM6Ly9naXRsYWIuZ25vbWUub3JnL0dOT01FL211dHRlci8t
L21lcmdlX3JlcXVlc3RzLzQwNjMNCj4gPiA+IFhvcmcvbW9kZXNldHRpbmcgcGF0Y2gNCj4gPiA+
IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy94b3JnL3hzZXJ2ZXIvLS9tZXJnZV9yZXF1
ZXN0cy8xODE2DQo+ID4gPg0KPiA+DQo+ID4gV2UgaGF2ZSBhZGRlZCBhIG5ldyBkcm0gcGxhbmUg
cHJvcGVydHkgdG8gZXhwb3NlIHRoZSBmb3JtYXQgbW9kaWZpZXIgcGFpcnMNCj4gc3VwcG9ydGVk
IGJ5IGEgcGxhbmUgZm9yIGFzeW5jIGZsaXAuDQo+ID4gQ2FuIHlvdSBwbGVhc2UgbGV0IHVzIGtu
b3cgaWYgdGhpcyBpbXBsZW1lbnRhdGlvbiBsb29rcyBnb29kIHRvIHlvdT8gSWYgc28sDQo+IGtp
bmRseSBwcm92aWRlIGFuIEFjay4NCj4gPg0KPiA+IElHVCBpbXBsZW1lbnRhdGlvbjogaHR0cHM6
Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy8xNDY4NTMvDQo+IA0KPiBTZWVtcyBy
ZWFzb25hYmxlIHRvIG1lLCBidXQgSSdtIG5vdCBhcyBpbnZvbHZlZCBpbiB0aGUgZGlzcGxheSBz
aWRlIGFueW1vcmUuDQo+IEknZCBkZWZlciB0byBIYXJyeSBhbmQgTGVvLiAgQFdlbnRsYW5kLCBI
YXJyeSwgQExlbw0KPiAoU3VucGVuZykgTGkgY2FuIHlvdSB0YWtlIGEgbG9vaz8NCj4gDQpJZiBu
byBvdGhlciBjb21tZW50cyBvbiB0aGlzLCBjYW4gd2UgZ28gYWhlYWQgd2l0aCB0aGUgbWVyZ2Ug
Z2l2ZW4gdGhhdCB3ZSBoYXZlIEFDSyBmcm9tIHRoZSBmb2xsb3dpbmcgdXNlciBzcGFjZSBpbXBs
ZW1lbnRhdGlvbiBhbHNvLg0KTXV0dGVyIGltcGxlbWVudGF0aW9uDQpodHRwczovL2dpdGxhYi5n
bm9tZS5vcmcvR05PTUUvbXV0dGVyLy0vbWVyZ2VfcmVxdWVzdHMvNDA2Mw0KWG9yZyBJbXBsZW1l
bnRhdGlvbg0KaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL3hvcmcveHNlcnZlci8tL21l
cmdlX3JlcXVlc3RzLzE4MTYNCktERSBLd2luIEltcGxlbWVudGF0aW9uOg0KaHR0cHM6Ly9pbnZl
bnQua2RlLm9yZy9wbGFzbWEva3dpbi8tL21lcmdlX3JlcXVlc3RzLzcyNzcNCklHVCBpbXBsZW1l
bnRhdGlvbjoNCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTQ2ODUz
Lw0KDQpUaGFua3MgYW5kIFJlZ2FyZHMsDQpBcnVuIFIgTXVydGh5DQotLS0tLS0tLS0tLS0tLS0t
LS0tLQ0K
