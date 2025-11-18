Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B68DC68D7A
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 11:31:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28A1110E153;
	Tue, 18 Nov 2025 10:31:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R9CaCsPo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E91B10E120;
 Tue, 18 Nov 2025 10:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763461893; x=1794997893;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gMwVqtvIgbklpYNK96o9M8NmN/FgZXAvNqc/YFT+vzo=;
 b=R9CaCsPooskYWRY6G/KMJEoH3EiAjLqEsZgGRorA/vZfVP4zp5YqkaoQ
 kTWeH9jZn9f/1BjYvgTgRUwvhQev+Ou5m7r0g4LfZM2yKIu2eziWKhd8D
 BRK11JPD+RzHyYj8MjKlhwcBrFebinZ/7iLsgi8zdXVe+qWWROBti5UfS
 O4765Wc+EvojDcyVPkZWa4N9GwlWxMq6K2EMfCY+SIML5cdCZqplRHv6o
 Te9AVHHyHFWRQ1HwqEeU3gzyaYaGPUYvhAEvTxJaGWe/PKhja0AzgmErf
 ozcb0oc44OxxtcQoitQE2x1NoKzzNhYwVef/pskqWN/jTnKuO2d6h6J65 A==;
X-CSE-ConnectionGUID: hDq3Te0ES0GUVK3T3803Hg==
X-CSE-MsgGUID: NWwQ9bnYRpSahl1XkXSFoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="65521551"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="65521551"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 02:31:33 -0800
X-CSE-ConnectionGUID: 30sM5EJdSJWW00RBdMgIWw==
X-CSE-MsgGUID: sFlZ79yPRCaHYpp0YOh+fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="190519324"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 02:31:33 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 02:31:32 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 18 Nov 2025 02:31:32 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.67) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 02:31:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MSB03DqHx8wrO3e4sDDFB4hDIgTJUUTAXoND2zSz6PTG5zhqYILkAB/HN6DdsZfPCfDtarbFd4zYLJ+gcdJ++5thW9zFANgKfe9OHSBR09BnwcFjJgDQU60SFgQgj2Dvw+fk7ryvkKvUdmADZXjAaF86xWD7NGD1UyIRGRcL/2pK896nQX0HU35EcUPpladgIhccP8JJ8Ocj25+eQ7L+yXNBlSGg4Eevh/NQ3mjzi9kXKkDLwyVaV2nZNkzr2dQhyOle0a8ijhBCfv9OrCo1EmpkBF0hpPWkFZcxIWas37t5BDVsz1t1j0fP+d5U43Q8AqROZdMb5IQz2oZs/QbL3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gMwVqtvIgbklpYNK96o9M8NmN/FgZXAvNqc/YFT+vzo=;
 b=IPwLq7MODyNDK8pSs0viruDpQ6nM09cecaJDKZfkhrMgq1VZ5gglpGYq9jbaMf6x8jEIumo/IYti6EVC1rLVy8nv5EtOXJZwSebRlm8czkw6z/FwYFa8KcpKIOm0cpYRHQ6GTocijp5i0Jw73oSaWlI6pt8RcsRyKiS7VvD3lHohijevp7POe8MCpEYiy8c3qeK151zTX8w4bSSCDrXKuLoPgF8hT8SkLIrSNpa8jCv2aaA/Ke6B9xZzL6e/Vfer9AdwLWjDi8lNAtGEkgDe7mFfZ7a2CTIEit0ugF5BjafPi/o3KE7/qrSzLlwV4izJQkM5ryqtt5z0vO3yTt9DGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8049.namprd11.prod.outlook.com (2603:10b6:8:116::6) by
 MN2PR11MB4680.namprd11.prod.outlook.com (2603:10b6:208:26d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.23; Tue, 18 Nov
 2025 10:31:24 +0000
Received: from DS0PR11MB8049.namprd11.prod.outlook.com
 ([fe80::d84a:3532:5337:1f7c]) by DS0PR11MB8049.namprd11.prod.outlook.com
 ([fe80::d84a:3532:5337:1f7c%3]) with mapi id 15.20.9320.018; Tue, 18 Nov 2025
 10:31:24 +0000
From: "Manna, Animesh" <animesh.manna@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "Kandpal, Suraj" <suraj.kandpal@intel.com>, "Hogander, Jouni"
 <jouni.hogander@intel.com>
Subject: RE: [PATCH v4 02/10] drm/i915/alpm: alpm_init() for DP2.1
Thread-Topic: [PATCH v4 02/10] drm/i915/alpm: alpm_init() for DP2.1
Thread-Index: AQHcVJka32rrmjpqqkKoSMUF+ycUC7T3BImAgAE6ZIA=
Date: Tue, 18 Nov 2025 10:31:24 +0000
Message-ID: <DS0PR11MB80498D83C22B8B0F77FD1411F9D6A@DS0PR11MB8049.namprd11.prod.outlook.com>
References: <20251113120119.1437955-1-animesh.manna@intel.com>
 <20251113120119.1437955-3-animesh.manna@intel.com>
 <4577de7373cb6bf2954d8d599168f408c87730c7@intel.com>
In-Reply-To: <4577de7373cb6bf2954d8d599168f408c87730c7@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8049:EE_|MN2PR11MB4680:EE_
x-ms-office365-filtering-correlation-id: 8b1ab269-4cd4-4d29-7511-08de268d9fbf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?VERPVVhTditDMUNvMk1LaTBKTjZxSGJEMm9FVjhzVnF5V3NlbWZtWEY0SkJO?=
 =?utf-8?B?Uk9STWhvZjdTTnNBd2M3VHFGeEVmT0NRTnZvMk1ySklBYVlGTEVDQUV4cllw?=
 =?utf-8?B?TEowMnFhRXVwUHRBYUVwVEM5TUFLcHJENXdlUEFOeWluRDd4bzdoS2IzVzhE?=
 =?utf-8?B?ZTN1SzlVcklFL3htTEJXTDBlSVpIc3dKdkpLR2kzdXc5c3hkN1loVUJ6dDU0?=
 =?utf-8?B?aVc5UGM1c0ZWbVpIUkJma1FMY0loMGwvcXl1ZnFXL2NlZFIxQWltSzgwQjN0?=
 =?utf-8?B?YkxFQ280SElqaStkK3F0NkQxQUJUTDl0ODZaWDY4N3Qvb0dYWkVqclhhN3RB?=
 =?utf-8?B?Y1J5YkdKaVZjMTgrTEpuRVFtYldpTTVMZFpsSU9pa2V3OGtnNmtoaHBLYjFl?=
 =?utf-8?B?TjRCbWR4NHV2bFpROEZ5T3FpZVRzZ1VTNWxsRTZveWpKYXErczJtdDhmNHdV?=
 =?utf-8?B?czRmbkMwc2pDOWNhUHdTV0VsNW96Zkg3QzdjTERPbmFHcis2TXVMRmpra0dR?=
 =?utf-8?B?ZFdHU2VJdWRWaUtTa003YUl3V3gySmJWeU4zeGhjY2tFY0l4UnlDV0paRXdu?=
 =?utf-8?B?SjBmVXpsMC90UjNkdFRMbThRSEEybW5JZlJsWHpRbGRjeDRKL1ZzWkxpcnNw?=
 =?utf-8?B?MXdaZWdpU2R2elBjblVoa3NMRGpHanIybUFBWTVIZjg5blhJZW83aGZKZUdr?=
 =?utf-8?B?bzJyWlk0NEZGWjEyNmNnb2dYY0w0aTk5Ry9ETHpiQ0tFSU1kYkpjL1dzUDdp?=
 =?utf-8?B?WlE3MHozbEZYV250YlB0aTBobHVjR2dKVTliM1VIa0dMbERDc3VnTWVBNXNC?=
 =?utf-8?B?ZlY0UWZxdDJyaHpBdDZXdS85SmltZEZEUEJZTUNNQUFzN2hRZHFCdk9kY3g1?=
 =?utf-8?B?WDJHbUFYTmRMYjhaZ2l4d2FBYUU0eTJla3kwTWNzejZIZGhkR2FnazBrbWp1?=
 =?utf-8?B?Njl1ZGNoQWpTK1FoQlBoKzN0NWdBS0NwSmJ6Y0l1VzRUeS9HSVJFdUt1WDZV?=
 =?utf-8?B?dHNwaS9QZEl2ZVZDOU5hcW45dHhQWXNBcHo3dU4rOUpvZlVWdXFyUGtRWTVO?=
 =?utf-8?B?dFYycmJKbzVlWitwdjRxS25iT1Rqby9rcnYzSG84Z00xc3dvU2dCRjBuNnd1?=
 =?utf-8?B?aEs3Z1pSY3dXN0VjdlBnWHdzR0F6MUhyVmFaNG9UazRHb2dKeWJlUngyUmhh?=
 =?utf-8?B?eUFrV3g1TzNVKzZHYndOSklXOUN2Z1ZMdTRkWDVNbE1IcFNOM2loVnJRZm1S?=
 =?utf-8?B?VWdRZnNmZ04rcVFZYS9xcWsvNFNTdlpTUUJ5cE9kT1dIWE9hQkhvb0lFMEd0?=
 =?utf-8?B?eC9uRU5DbytzaGdjYmRvRDNGNFNhRm81SEl1L3RxVlJSYzA2R1gyaFVsMU9K?=
 =?utf-8?B?cHJVYVZlMUxrbDdHK0plSWowdC9VL2l0ZkowakI3eHhDcURlYXpySXpySjNp?=
 =?utf-8?B?SnpYeUJKY2x3ZldxN2tPazZ0YS9yblIyYlpnMUpMNEc0Q3Y3MnRraWlDVW55?=
 =?utf-8?B?aWRKaGx1TkptbitXSUNCN01HQTVMaVBORk5DU0FsVXBCNE51ZDBoOGpmYldq?=
 =?utf-8?B?R0JrMHJnUU9lbDF1MEN3bk5peHVDbStiQ0lwOUJrRDJYUjhjNW4vTlBMK1RW?=
 =?utf-8?B?RFVQNDZXZEhPWVVENnYyUC9HUXZwa2NGMEFCWHRyTHU4YWI0ekpLT1Z3WE92?=
 =?utf-8?B?SDk3eDNIdlRTYlcrRUEycU54aU40MHVVSVVySU1zTDFjQTU3UXFuYTlnREdP?=
 =?utf-8?B?L0FXZ0F6S1FJL0hWcmU0b1NkaE4xOFJCc1hIdHZ3akJSYi9JNjNWYTlBTEJi?=
 =?utf-8?B?aUJ5UUFvSjZ5WXZZbUdBNE1ML2l3b2hWcGg4aStKSU0vT1Zhd0hSUGFQZU0r?=
 =?utf-8?B?TzMvcTl3TXFXWUs5eG5DNWtaQngyakRDUUVmS0NXRmRFZUZqVENtRjFsZzFp?=
 =?utf-8?B?NXIrV0tQdUNva0o3TGpqeHV5eFpxakRZdnU4aHJhamg0T2k4bnNCTTBwdlor?=
 =?utf-8?B?a1BRYnpnL05ZU0ovS2tMbmZ2Z0lNdW8wdnBtSTNtVmw0K0ZZMlN0b3pDSXd4?=
 =?utf-8?Q?qxFLwj?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8049.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bS9GeXRXQmFGckYvQkZtQ2dkby9hQ3JZNzYreUtsQzRNaFNBL29XSUg1YU0w?=
 =?utf-8?B?cmNreVhRcFQvSzYva2UveCtmcFpadWFFbVJzTVRSaHc4SzEwL3J1WWNjZ0Fz?=
 =?utf-8?B?Z3IwZG81UFU0VjRGdXNWOHVpYkhhZHErWWlyMVdPMEJFOHpFU09CNk8zblVk?=
 =?utf-8?B?Y3VYd2lJVkpkOGFTem9GVnlkL2gvMUlDSkJhcmUvNjdQK3g2SloxbTRCN2lR?=
 =?utf-8?B?c1JTSkpKdjRvcXhHMERpVGVmbFFHRjlMZjRhOExMaTdvYjJsWE5jSklOdE0r?=
 =?utf-8?B?bGRoOWFKSko2dlJ3NkdNdDYyRE8zR094OGRFekxYbkFIVWdiTW5tWWQ3VTgx?=
 =?utf-8?B?UXlqM2U5WEdqOC9HQmV2NE9hejR6bzJ1emdPaDkraUdnL2ZJWXZVSHM4Ymlk?=
 =?utf-8?B?bXROSVJKNzIvUi82blg2NU5MTHlSaVpGVGZJY0kvSWpUbVpoKzZjU1NscUZw?=
 =?utf-8?B?SiswUFpwMVpRd05OdDE2djFFVkYvaFpNZ3hKQmwybjVxcG9xRGs0SDFGZnJB?=
 =?utf-8?B?MHVwcXEvRS9RU3pUaXFQc1k4NlZ6M3lLdysvQlVXUTVTdktFNmU0NzV1YWZO?=
 =?utf-8?B?cE1penBQeHJrdXB1VEhsc3NmMXlNdElBY0l1bGJ4amFjVDVBaHErQThsKzlC?=
 =?utf-8?B?dWpyeDV5MGM5UklrVG9ZZVZXQ0VlVHFRY3Y1VHRGTlU1djUvQ0Q3dFJkYzNI?=
 =?utf-8?B?ak5hWFZCak5XNytzQWVLaHZIVkJ3QVAzaUZ4cUhlWVFLRmoyUFg2U1MyNnpT?=
 =?utf-8?B?VE0zazdHVTVCeHZLLzRrYXppdVdlVndhUFBmNk9Kc3JYSTVzaXFQblZLaWtU?=
 =?utf-8?B?OWRkam1SOXk0bDNRREh4LzNpQnY0NTFKODlDejRQYlVvVXYxRlcxUEZLdU9M?=
 =?utf-8?B?UE52ZzhiRFhVNk1LbGxXK3lOSG02R0xGck5JQ0dXUGl2NzdkaTFtcFoyMmFx?=
 =?utf-8?B?dmpzSnhIeEs3SmQ4L3dlblJQaFRoQUxiZ2Q3ODg2TldpbEdtQ3VkdC9Vc3F0?=
 =?utf-8?B?bXh5dVdVMVJuNEVOa1NSd2xkUXNqREhJS2doQUljVnNmeC9UTGdsUU9IS1pE?=
 =?utf-8?B?UWUxRE1ScFFCMGpidW1lV3NSZGdNZkwrdWxrNkZsTGZnMmhOK2hjWlRFQ3lN?=
 =?utf-8?B?eTUwUElmQjIvcFFKU2dqNUFuQ0J3Z3o1WUJEYTBYeW1RSTVIcklFSUV3TTQ4?=
 =?utf-8?B?c1crbWx6NjAvNTQyYkpkaTFPbXdvMThUMnh1VHdjM3hHdkRiaDVGdEp4eS92?=
 =?utf-8?B?aDBUdTRlWmV0M0lNVCtUa3FBVHdFbTZHY0x0ZTc5SlRUTW55VHNQM3RjdVZz?=
 =?utf-8?B?eFRXVEFmSm5aRUFUZWZEOGNhYm4zU0hpdm9YVEdYeGdnRitIdXRGcDBzbmVl?=
 =?utf-8?B?cy9BTCtpK1lYNGxaenpvMm9PN3QySVp2TzFyR2c2NGhXUFQxbThBVmdYZUg1?=
 =?utf-8?B?Y21YSVNBaitHSzdHZDF5MjZla3FISU85T3VNNVllYS9FRmEvY3JTdy9nbjdx?=
 =?utf-8?B?ZGdPYm5FdzduZTNPUDcxWWtJOXZuWCtjaHkrWG9IWGpnS1pKbGo4ZVN0SVFm?=
 =?utf-8?B?bk1id0dlT1RyTTkrMkhoVHhtdkU3SjZZRzNEVHVLNWZXbDFnNjFnUmJoeXV0?=
 =?utf-8?B?eVVvUmtTM3JQVzJQbWJpd1c3bEh2WmJwT3BubkhaOWFOckJSb0pQYUIvOWR2?=
 =?utf-8?B?b005Wlp4NVpadE5kUXlFQjdOU0JwMXRLN3lHK0ZWUEtqcXpld3B0WHNLOHV6?=
 =?utf-8?B?cXBJc1hsNU1ZR1IvVkpDZFg1cWlBTmt3QWRHTndraVpST2NveFd2WjR5dThD?=
 =?utf-8?B?a1IvWlNaOFpwZHdjeWhidFV1YldwdmhxM2VwWHZSaFlsVG1IejgrR2RIbGFB?=
 =?utf-8?B?elpRS1hoQzlyc1NSWVNqZThGK2ljS0YxcEJNZUVrejNMdUlMZzVjYXpqcVpa?=
 =?utf-8?B?WldKdTUzdzltc0xuTVhvcEtNaHBGT1dUWkl4bVJycHNPNTBpT3R5TmdWY3RK?=
 =?utf-8?B?TkFiQU9hMk5tZ0p2blY5ZnpZSGx4VTBxdmdOdlcvZUFlSTFyUTIvTW9SL0w4?=
 =?utf-8?B?ZjRnbTVQUVRtZUdvci8zSTZjRzhrdGhsK2orcXQyR3Q0bGErQjJhd040c3NI?=
 =?utf-8?Q?0EpZdC6MnqbhvMYEx13PL8INc?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8049.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b1ab269-4cd4-4d29-7511-08de268d9fbf
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2025 10:31:24.4979 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1e3g+2y2B0s/ESvD/fZsxHdXM3taVpU7e6r4O8P1Ec+rrj4dOgVOm8PEvF2IY0uN/dSohfjZpvFBOsv3n/lT2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4680
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTmlrdWxhLCBKYW5pIDxq
YW5pLm5pa3VsYUBpbnRlbC5jb20+DQo+IFNlbnQ6IE1vbmRheSwgTm92ZW1iZXIgMTcsIDIwMjUg
ODo1OSBQTQ0KPiBUbzogTWFubmEsIEFuaW1lc2ggPGFuaW1lc2gubWFubmFAaW50ZWwuY29tPjsg
aW50ZWwtDQo+IGdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGludGVsLXhlQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZzsgZHJpLQ0KPiBkZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IEth
bmRwYWwsIFN1cmFqIDxzdXJhai5rYW5kcGFsQGludGVsLmNvbT47IE1hbm5hLCBBbmltZXNoDQo+
IDxhbmltZXNoLm1hbm5hQGludGVsLmNvbT47IEhvZ2FuZGVyLCBKb3VuaQ0KPiA8am91bmkuaG9n
YW5kZXJAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY0IDAyLzEwXSBkcm0vaTkx
NS9hbHBtOiBhbHBtX2luaXQoKSBmb3IgRFAyLjENCj4gDQo+IE9uIFRodSwgMTMgTm92IDIwMjUs
IEFuaW1lc2ggTWFubmEgPGFuaW1lc2gubWFubmFAaW50ZWwuY29tPiB3cm90ZToNCj4gPiBJbml0
aWFsaXplIEFMUE0gZm9yIERQMi4xIGFuZCBzZXBhcmF0ZSBvdXQgQUxQTSBtdXRleC1pbml0IGZy
b20NCj4gPiBhbHBtLWluaXQuDQo+IA0KPiBJIHRob3VnaHQgSSBzYWlkIHlvdSdyZSBnb2luZyB0
byBuZWVkIG11bHRpcGxlIGluaXQgZnVuY3Rpb25zLiBEb24ndCBtb3ZlIHRoZQ0KPiBhbHBtIG11
dGV4IGluaXQgYXdheSBmcm9tIGFscG0gY29kZS4gSXQgbmVlZHMgdG8gc3RheSBpbiBhbHBtIGNv
ZGUuDQoNCk9ubHkgZm9yIG11dGV4LWluaXQgZG8geW91IHdhbnQgbWUgdG8gYWRkIGEgc2VwYXJh
dGUgZnVuY3Rpb24/DQoNCj4gDQo+IEFuZCBub3cgdGhlIHdob2xlIHBhdGNoIGFuZCBzdWJqZWN0
IGFuZCBjb21taXQgbWVzc2FnZSB0YWxrIG9mDQo+IGNvbXBsZXRlbHkgZGlmZmVyZW50IHRoaW5n
cy4NCg0KRWFybGllciBhbHBtIGlzIGluaXRpYWxpemVkIGZvciBFRFAgb25seSwgbm93IGl0cyBl
eHRlbmRlZCBmb3IgRFAyLjEgaW4gdGhpcyBwYXRjaC4NCkVhcmxpZXIgbXV0ZXggaW5pdCBpcyBw
YXJ0IG9mIGFscG0taW5pdC4gTm93IGFmdGVyIGZlZWRiYWNrIEkgYWxzbyBmZWx0IGl0IGNhbiBi
ZSBzZXBhcmF0ZSBvdXQgYmVjYXVzZSByZWFkaW5nIGRwY2QgYWx3YXlzIG5vdCBwb3NzaWJsZSBp
ZiB0aGUgZGlzcGxheSBpcyBkaXNjb25uZWN0ZWQgZm9yIGRwLWNvbm5lY3RvciBidXQgbXV0ZXgt
aW5pdCBjYW4gYmUgZG9uZS4NClNvIG1lbnRpb25lZCBhcyBzZXBhcmF0ZSBvdXQgQUxQTSBtdXRl
eC1pbml0IGZyb20gYWxwbS1pbml0KCkuDQoNCj4gDQo+IFBsZWFzZSByZWFkIHRoZSByZXZpZXcg
Y29tbWVudHMsIGFuZCBhc2sgcXVlc3Rpb25zIGlmIHRoZXkgY29tbWVudHMgYXJlDQo+IG5vdCBj
bGVhci4NCg0KQ3VycmVudGx5IEkgYW0gbGl0dGxlIGNvbmZ1c2VkLCBuZWVkIGNoYW5nZSBpbiBj
b2RlIG9yIGNvbW1pdCBkZXNjcmlwdGlvbi4gRnJvbSBoZXJlIG9ud2FyZHMgaWYgeW91IGNhbiBw
b2ludCBvdXQgc29tZSBzcGVjaWZpYyBjaGFuZ2Ugd2lsbCBtb2RpZnkgYWNjb3JkaW5nbHkgaW4g
bmV4dCB2ZXJzaW9uLg0KDQpSZWdhcmRzLA0KQW5pbWVzaCANCg0KPiANCj4gQlIsDQo+IEphbmku
DQo+IA0KPiANCj4gPg0KPiA+IHYyOiBTZXBhcmF0ZSBvdXQgbXV0ZXgtaW5pdC4gW0phbmldDQo+
ID4gdjM6IFJlZmFjdG9yIGZ1cnRoZXIgdG8gYXZvaWQgRElTUExBWV9WRVIgY2hlY2sgaW4gbXVs
dGlwbGUgcGxhY2VzLg0KPiA+IFtKYW5pXQ0KPiA+IFY0OiBDb3NtZXRpYyBjaGFuZ2VzLiBbU3Vy
YWpdDQo+ID4NCj4gPiBDYzogSm91bmkgSMO2Z2FuZGVyIDxqb3VuaS5ob2dhbmRlckBpbnRlbC5j
b20+DQo+ID4gUmV2aWV3ZWQtYnk6IFN1cmFqIEthbmRwYWwgPHN1cmFqLmthbmRwYWxAaW50ZWwu
Y29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEFuaW1lc2ggTWFubmEgPGFuaW1lc2gubWFubmFAaW50
ZWwuY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVs
X2FscG0uYyB8IDE2ICsrKysrKysrKysrKysrLS0NCj4gPiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX2FscG0uaCB8ICAzICsrLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX2RwLmMgICB8ICA4ICsrKysrKystDQo+ID4gIDMgZmlsZXMgY2hhbmdlZCwg
MjMgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2FscG0uYw0KPiA+IGIvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hbHBtLmMNCj4gPiBpbmRleCA2MzcyZjUzM2Y2NWIu
LjE0YWNkNjcxN2U1OSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNw
bGF5L2ludGVsX2FscG0uYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkv
aW50ZWxfYWxwbS5jDQo+ID4gQEAgLTQxLDcgKzQxLDIwIEBAIGJvb2wgaW50ZWxfYWxwbV9pc19h
bHBtX2F1eF9sZXNzKHN0cnVjdCBpbnRlbF9kcA0KPiAqaW50ZWxfZHAsDQo+ID4gIAkJKGNydGNf
c3RhdGUtPmhhc19sb2JmICYmDQo+ID4gaW50ZWxfYWxwbV9hdXhfbGVzc193YWtlX3N1cHBvcnRl
ZChpbnRlbF9kcCkpOw0KPiA+ICB9DQo+ID4NCj4gPiAtdm9pZCBpbnRlbF9hbHBtX2luaXQoc3Ry
dWN0IGludGVsX2RwICppbnRlbF9kcCkNCj4gPiArYm9vbCBpbnRlbF9hbHBtX3NvdXJjZV9zdXBw
b3J0ZWQoc3RydWN0IGludGVsX2Nvbm5lY3RvciAqY29ubmVjdG9yKSB7DQo+ID4gKwlzdHJ1Y3Qg
aW50ZWxfZGlzcGxheSAqZGlzcGxheSA9IHRvX2ludGVsX2Rpc3BsYXkoY29ubmVjdG9yKTsNCj4g
PiArDQo+ID4gKwlpZiAoISgoY29ubmVjdG9yLT5iYXNlLmNvbm5lY3Rvcl90eXBlID09DQo+IERS
TV9NT0RFX0NPTk5FQ1RPUl9EaXNwbGF5UG9ydCAmJg0KPiA+ICsJICAgICAgIERJU1BMQVlfVkVS
KGRpc3BsYXkpID49IDM1KSB8fA0KPiA+ICsJICAgIChjb25uZWN0b3ItPmJhc2UuY29ubmVjdG9y
X3R5cGUgPT0NCj4gRFJNX01PREVfQ09OTkVDVE9SX2VEUCAmJg0KPiA+ICsJICAgICBESVNQTEFZ
X1ZFUihkaXNwbGF5KSA+PSAyMCkpKQ0KPiA+ICsJCXJldHVybiBmYWxzZTsNCj4gPiArDQo+ID4g
KwlyZXR1cm4gdHJ1ZTsNCj4gPiArfQ0KPiA+ICsNCj4gPiArdm9pZCBpbnRlbF9hbHBtX2dldF9z
aW5rX2NhcGFiaWxpdHkoc3RydWN0IGludGVsX2RwICppbnRlbF9kcCkNCj4gPiAgew0KPiA+ICAJ
dTggZHBjZDsNCj4gPg0KPiA+IEBAIC00OSw3ICs2Miw2IEBAIHZvaWQgaW50ZWxfYWxwbV9pbml0
KHN0cnVjdCBpbnRlbF9kcCAqaW50ZWxfZHApDQo+ID4gIAkJcmV0dXJuOw0KPiA+DQo+ID4gIAlp
bnRlbF9kcC0+YWxwbV9kcGNkID0gZHBjZDsNCj4gPiAtCW11dGV4X2luaXQoJmludGVsX2RwLT5h
bHBtLmxvY2spOw0KPiA+ICB9DQo+ID4NCj4gPiAgc3RhdGljIGludCBnZXRfc2lsZW5jZV9wZXJp
b2Rfc3ltYm9scyhjb25zdCBzdHJ1Y3QgaW50ZWxfY3J0Y19zdGF0ZQ0KPiA+ICpjcnRjX3N0YXRl
KSBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hbHBtLmgN
Cj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYWxwbS5oDQo+ID4gaW5k
ZXggNTM1OTliNDY0ZGVhLi5iY2MzNTRhNDZhMWQgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hbHBtLmgNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX2FscG0uaA0KPiA+IEBAIC0xNSw3ICsxNSw4IEBAIHN0cnVj
dCBpbnRlbF9jb25uZWN0b3I7ICBzdHJ1Y3QgaW50ZWxfYXRvbWljX3N0YXRlOw0KPiA+IHN0cnVj
dCBpbnRlbF9jcnRjOw0KPiA+DQo+ID4gLXZvaWQgaW50ZWxfYWxwbV9pbml0KHN0cnVjdCBpbnRl
bF9kcCAqaW50ZWxfZHApOw0KPiA+ICtib29sIGludGVsX2FscG1fc291cmNlX3N1cHBvcnRlZChz
dHJ1Y3QgaW50ZWxfY29ubmVjdG9yICpjb25uZWN0b3IpOw0KPiA+ICt2b2lkIGludGVsX2FscG1f
Z2V0X3NpbmtfY2FwYWJpbGl0eShzdHJ1Y3QgaW50ZWxfZHAgKmludGVsX2RwKTsNCj4gPiAgYm9v
bCBpbnRlbF9hbHBtX2NvbXB1dGVfcGFyYW1zKHN0cnVjdCBpbnRlbF9kcCAqaW50ZWxfZHAsDQo+
ID4gIAkJCSAgICAgICBzdHJ1Y3QgaW50ZWxfY3J0Y19zdGF0ZSAqY3J0Y19zdGF0ZSk7ICB2b2lk
DQo+ID4gaW50ZWxfYWxwbV9sb2JmX2NvbXB1dGVfY29uZmlnKHN0cnVjdCBpbnRlbF9kcCAqaW50
ZWxfZHAsIGRpZmYgLS1naXQNCj4gPiBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfZHAuYw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5jDQo+
ID4gaW5kZXggMGVjODJmY2JjZjQ4Li44MWRkNWJmN2UzYzUgMTAwNjQ0DQo+ID4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5jDQo+ID4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5jDQo+ID4gQEAgLTYwNzQsNiArNjA3NCw5IEBA
IGludGVsX2RwX2RldGVjdChzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcg0KPiAqX2Nvbm5lY3RvciwNCj4g
PiAgCWlmIChyZXQgPT0gMSkNCj4gPiAgCQljb25uZWN0b3ItPmJhc2UuZXBvY2hfY291bnRlcisr
Ow0KPiA+DQo+ID4gKwlpZiAoaW50ZWxfYWxwbV9zb3VyY2Vfc3VwcG9ydGVkKGNvbm5lY3Rvcikp
DQo+ID4gKwkJaW50ZWxfYWxwbV9nZXRfc2lua19jYXBhYmlsaXR5KGludGVsX2RwKTsNCj4gPiAr
DQo+ID4gIAlpZiAoIWludGVsX2RwX2lzX2VkcChpbnRlbF9kcCkpDQo+ID4gIAkJaW50ZWxfcHNy
X2luaXRfZHBjZChpbnRlbF9kcCk7DQo+ID4NCj4gPiBAQCAtNjcxNiw3ICs2NzE5LDcgQEAgc3Rh
dGljIGJvb2wgaW50ZWxfZWRwX2luaXRfY29ubmVjdG9yKHN0cnVjdA0KPiBpbnRlbF9kcCAqaW50
ZWxfZHAsDQo+ID4gIAkgKi8NCj4gPiAgCWludGVsX2hwZF9lbmFibGVfZGV0ZWN0aW9uKGVuY29k
ZXIpOw0KPiA+DQo+ID4gLQlpbnRlbF9hbHBtX2luaXQoaW50ZWxfZHApOw0KPiA+ICsJaW50ZWxf
YWxwbV9nZXRfc2lua19jYXBhYmlsaXR5KGludGVsX2RwKTsNCj4gPg0KPiA+ICAJLyogQ2FjaGUg
RFBDRCBhbmQgRURJRCBmb3IgZWRwLiAqLw0KPiA+ICAJaGFzX2RwY2QgPSBpbnRlbF9lZHBfaW5p
dF9kcGNkKGludGVsX2RwLCBjb25uZWN0b3IpOyBAQCAtNjkzMiw2DQo+ID4gKzY5MzUsOSBAQCBp
bnRlbF9kcF9pbml0X2Nvbm5lY3RvcihzdHJ1Y3QgaW50ZWxfZGlnaXRhbF9wb3J0DQo+ID4gKmRp
Z19wb3J0LA0KPiA+DQo+ID4gIAlpbnRlbF9wc3JfaW5pdChpbnRlbF9kcCk7DQo+ID4NCj4gPiAr
CWlmIChpbnRlbF9hbHBtX3NvdXJjZV9zdXBwb3J0ZWQoY29ubmVjdG9yKSkNCj4gPiArCQltdXRl
eF9pbml0KCZpbnRlbF9kcC0+YWxwbS5sb2NrKTsNCj4gPiArDQo+ID4gIAlyZXR1cm4gdHJ1ZTsN
Cj4gPg0KPiA+ICBmYWlsOg0KPiANCj4gLS0NCj4gSmFuaSBOaWt1bGEsIEludGVsDQo=
