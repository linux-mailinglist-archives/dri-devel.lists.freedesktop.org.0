Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2878797DAF1
	for <lists+dri-devel@lfdr.de>; Sat, 21 Sep 2024 02:05:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4111B10E87D;
	Sat, 21 Sep 2024 00:04:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mBkcOKuu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD9D010E87D
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Sep 2024 00:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726877097; x=1758413097;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kp7cZFlrQ709sHYOpXCsh802Zun/UjmUyA3yvs2/tyU=;
 b=mBkcOKuuusrUOvEiuOH59HVPAltJfvKxyiEJmj58v1e0VkMGuJdLOMgw
 g21r2l6m9Sxcr0V8WsH67GZtdknPq/opcWgATcc2aRGAW/qEUtuZzXrlx
 571+JgYWlsgUjM0T6libRVGiKr1+sS6Z0IwvWjnEV1kznehajtcJt9NJb
 Rk1SdY5kda6DZc+iG+Z/WUFOcuqBNwj9vkPGoqhW1/O9q0uc0OxOBRdIQ
 +6NqnP6yCdzHp0WuETiuDfG7ljAUkgpcpHtBNyYFvWRATkZ50etxHpb+G
 O0ApsIdS0cQ1ATgVjX1GVY+5mN07utzgGQG6+l9f0cArMhQkrFa6KSt08 g==;
X-CSE-ConnectionGUID: +rgRaSc+Q8KjmyhM6XThwA==
X-CSE-MsgGUID: tIj01h2ATeutekGw7AbZow==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="28796740"
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; d="scan'208";a="28796740"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 17:04:56 -0700
X-CSE-ConnectionGUID: RbzZEVDPRiGw9Wu4TyzMkA==
X-CSE-MsgGUID: yeRVirzFToWQzteL/pHhsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; d="scan'208";a="70352313"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2024 17:04:56 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 20 Sep 2024 17:04:55 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 20 Sep 2024 17:04:55 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 20 Sep 2024 17:04:53 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 20 Sep 2024 17:04:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wm/bGLTPImq4FwVa3qiKnVe8binXBKy+mF/N820aoz5b72Rzr7/2ry4wZY+uwlVXSZ+fAag6KCTTxydCDz2vFlmXS60IroXXpD53N2U4GBM0SF3WdU0xEXrIWMYCiQyldasSht99UCYUyROKSYx905kO5WAMkqjC7KTwWMlSn1OhmfdJAUfXimQxge1uA0fHKU3Tit5P4lcogef7tJucauKbHqpjd/zhTOv6CMmoqdvlnyVrlIuNZe++IRYdh8qWNknHREiAWtYIW1qweX3oVEaQW8ARZYFMqqG88EKSWplM+nwta3mLU+12O5XYIVVEd1dtGPsAUNKCG6fBRZRbLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kp7cZFlrQ709sHYOpXCsh802Zun/UjmUyA3yvs2/tyU=;
 b=hZ6T+aNpQF2Vno5Ye9w52xRtVQ+NDh3xV4wuaK9cNXEbTyVfIJnut0x7bWDDhvB2jXxHAbFCEs5QB74gCXsazQY0+IXLmYeQKjq/rv9GXBAdxt6UOP2T5VrPTh5A6vl+8cvIn5OXxtK4jdAXRNTpJTq9Znw5Vk3a6F1cjNmGiRzolPBHhDdm2f1Gbx9cZdin0PMRMamWhvuH0VpJPj4ks+qDAO/nZLec1v7+town0Zmc7p4/veX3ajc2EQOlMnWSGzDOvBRDFWAK0mtHJIHjgYvm9yBfE1xBB+vM+j850iLu6p25H33FWECq8fig63qn08H+F9DWobgFFe7ffiP8CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by SJ0PR11MB6814.namprd11.prod.outlook.com (2603:10b6:a03:483::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.23; Sat, 21 Sep
 2024 00:04:50 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%5]) with mapi id 15.20.7982.022; Sat, 21 Sep 2024
 00:04:50 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Huan Yang <link@vivo.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, "Gerd
 Hoffmann" <kraxel@redhat.com>, Dave Airlie <airlied@redhat.com>, "Andrew
 Morton" <akpm@linux-foundation.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
CC: "opensource.kernel@vivo.com" <opensource.kernel@vivo.com>
Subject: RE: [PATCH v7 0/7] udmabuf bug fix and some improvements
Thread-Topic: [PATCH v7 0/7] udmabuf bug fix and some improvements
Thread-Index: AQHbCXXnxK5LlvPkQkyt5M+BXt27zbJhSLFQ
Date: Sat, 21 Sep 2024 00:04:50 +0000
Message-ID: <IA0PR11MB7185E6C790F112FE898921CBF86D2@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20240918025238.2957823-1-link@vivo.com>
In-Reply-To: <20240918025238.2957823-1-link@vivo.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|SJ0PR11MB6814:EE_
x-ms-office365-filtering-correlation-id: 232fa441-2f06-48b7-66a4-08dcd9d102fe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|921020|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?cmpDSEYveE93OFd3UEJTaW0xcFVURFU2WE9aekcvcmptV0Jha0ozQmFEV0ts?=
 =?utf-8?B?U2NzWktLUmU3ZXRXWVFIcnNjV080VXR5VHQ4WVJ5SkFYNldacGllczduTWpT?=
 =?utf-8?B?M0prWFlUZ0VlWjFkTmhYWWJuNWJmR1VOaStDTnZlY2ZjOU0zemhGNFJidXd3?=
 =?utf-8?B?ZmlLbUx0N2hPWUg3OC9kM0tyS05vcWkrYnRDN3ozNDBvNW50RTlLUHZUNVAy?=
 =?utf-8?B?eHdKYzVzTmpQbzZtWnp3eEFUeWQyMGFwMkl1cGg4eXl0dVZsTkhyYnNxRFNU?=
 =?utf-8?B?SmZUSWxIQmJKSjZ2dXZDSFFIN01SRVZIRzhFTEsyU2tyWGJRSnFMd1NBQktP?=
 =?utf-8?B?Qnh0cG1ianZ2ekhza2kvQll4end3QkFhZldyVS9zZFlJSHd1TmlqQjZDd1Bz?=
 =?utf-8?B?SFVSbUFDTTZyR1hNY2NtNEpueTVveC9IYnlRT1I5NTF3WUlDRStEMmpGSi9j?=
 =?utf-8?B?RU9NeGlhZVpGTXlQUUs5OUVSSTY3OHdiRGdMYzBnYWkybVNLazYvc1JIWitQ?=
 =?utf-8?B?MFdvRWFVTVBvVGRRakhGNTRpcXN3Ylc4VmlFVTRHeUhoL1g1YitpbStDTmZ5?=
 =?utf-8?B?RnRleXgrSlQzMUxLWmJadTV6aGtpdTJQUEhrMTB4N3NGUE5Ub2lxSGFzdkNX?=
 =?utf-8?B?M0ptQ2pWSFZzbHBBaHQva3FqOTMxOGs5V3ZjNmR0T3QyaUd5djI3Y0dWcjQ1?=
 =?utf-8?B?Q1Bsak83bmJoSnd2TC9TaXgySkcySWxqOHgwTDh2Y2s1d3RVYVY5SzJxTWVM?=
 =?utf-8?B?RU9tUEtmY3M4RXU2bUJjbkFUUGR0SG9xSk91WUtRcWlnSnFpWCtBWnhOR1ho?=
 =?utf-8?B?ZFJuUER6ZTVxR3F2SCtwTkYwS2prR2hkTy95NDRHV1FXVVdvNFhtQ3UxQVJK?=
 =?utf-8?B?Q1U3YnlBOTRYeFcvQnlYYVY2REVaNUFPNklzR1cwTXhTT0ljZmFkenFNUUJJ?=
 =?utf-8?B?dnl3bCtXa3ZGNnNjL2hHdDc5YTZQd01LUnZPS0RGM1NYbm5BeDRNSUkyT2N4?=
 =?utf-8?B?R2MvdGZKMHI3NXBIcGVXNlVjQ3RTckg4VG9ySC9OaXFrN1VRVnlMVEE5clVQ?=
 =?utf-8?B?UTAyeU1NQzRHUGtvcVhOTi9wY0JYdE5yU2RaN2ZWR2xLdkNITTV1NHZyWjNI?=
 =?utf-8?B?WXFiM2xLdCtGTmVuWEFwVW1zZ3lqSzlJQ3BFeWdaMUtFYy9tTkNBa1FlS29P?=
 =?utf-8?B?aDNWajBXeldMTXdXTWF0YVlNT3IyZlpKcDhhRlFQTzJqOTJ4M0xvdkt3VXhv?=
 =?utf-8?B?QTRGS28wY2NHYnIyMEJHdVFHcndsTVF2b2ROc2Q1b3YwRng5MGZ6RFdONEs2?=
 =?utf-8?B?M3BrR0IxL212Y3FRZm9ZbjdEQnJuRklTYVo0VGdmK2hLUXpxVWlTemNFRmta?=
 =?utf-8?B?YTYyOTNWVTVESDh1YnNHSFE0azd6enpCT2xZRUw2VXgwYkhLSDF2cE01bVFz?=
 =?utf-8?B?aHpQWm9rcENRK3VZSnZsZ0lJUEJUOUYvUTQwcnBJcGI2cll0OVlDOElQUGxL?=
 =?utf-8?B?Tzc5bFRWNmRkRWI1MitZTjYwWnE0bTlYWEJLN2NJMmtTckFSNU8vTC9wY1B4?=
 =?utf-8?B?ZWdoT1M5SkoxOTNLdUExNmw0eVdiVzQ2Z3I4L0JrdVJTSTJTMDB2eVBMTEVv?=
 =?utf-8?B?cVg3Z1lsZ1UvQWtseDM5cGhIMUM1VGJadlBqeHFQSGFnVGRHQ3p6N3FPQXJ2?=
 =?utf-8?B?cHBzT25YcWxtZG40YVJKOG1iekJZMjk4ZjR4bHdhQnBsV3ptU0ZwSGlwcGh4?=
 =?utf-8?B?WnZTYWZlS2RRSzRKU0NyVDZzSTZzQVFIUU5JSzM3UFlkQnhGYlBid3ZJbXZq?=
 =?utf-8?Q?OzwD/1Rizm1JnDQzIOO5udUZ7VNJa0wbdbaDs=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?djVzNGJFQmFtQWk0YU8zOE9JTXI3dWtsTUhmSnlxT0o2Y3FRTXBTUi9NWUNT?=
 =?utf-8?B?dXFaYVcydFRXRGJVUG1OaXRoR08vd21aYmM5Q1ZLdERxT2ZQQnh4enkxWk9J?=
 =?utf-8?B?QVVLT2JPTHIybVZ4ZGVWeU5VQmhGSVpVMXdaMENRTkcyLzNZUFNYWjFnRGdQ?=
 =?utf-8?B?YS8rN0VoYnhtYzRLNmtJTWtoU2xGT0s3SVJuK3VlalZqVjU3Q3AveS90N2Jt?=
 =?utf-8?B?b3ZFcTFIekk2NXRPSlE2TUUyUHFZRENjc1M3bXdGN0R2RGZFZlcyN3NySGZa?=
 =?utf-8?B?ZmpzN3diU3NYYzZldHg2M0tJcGdHcWhoMnZWSTlkb3FyRXJ1WUJCWlhmZU1o?=
 =?utf-8?B?K0pNeW9QQkVTbWtKZWFWNEo2ZjZsbGlRazgwMm5UbExzVzBtUFBDbzg0Ykg3?=
 =?utf-8?B?eGIrSEJiRThRWEtyVTVua1B4N2lUYU5rb0NOam1Gc2Z1bFZqcHp1UTBuWUkz?=
 =?utf-8?B?Qi9rdGdZSjRyS2RJN1JkOHVZWi85SWkyOFZiWFdoeSthZjVBbjRMdXBtUlhZ?=
 =?utf-8?B?cytEMUNTSG5Ba1lxc1pSOVQzcGFOd0h2blpJc3VXZkIwQkp3a0cyUTMxUHZm?=
 =?utf-8?B?MUlWdno5YVB4ZExXcTRkUlgrVlJsZGJiQk1SZytkTnBEQitmdTlLTjliemFj?=
 =?utf-8?B?RFdYcGxvQytpTm9VOENXTE5xb3NEdGdobXpCL0JnN0tXb21uRjZzWTBrd3U2?=
 =?utf-8?B?M2lQL2FFY0NWTzc4WDBYZkJhTGhGa2xLQXg5VjZEaEZxc0JyOVVvV1I2d0pK?=
 =?utf-8?B?UDZXczU5UThVTktoVnZOQWpDYVRFeWQ0cjZIWG5DUUtlRnl2SlNZd0FxdXdR?=
 =?utf-8?B?aFhobGRMQUJOeTkrdzllQXB4ODZ2SGJvbnNRRFZzVVpaMTliZ2k2K3BlZ0hl?=
 =?utf-8?B?a3dBMWFqQnlGUFhLYTQ5U05RNmE5NTlwTG55b3dnMzhqYWtrTEM2Z1ZoUmdo?=
 =?utf-8?B?d3F0Um9OYW54TldkdzZGZmJ4eWI4YVBwdjEzQ3NzeU5xa0daNVFDNk9vV0tU?=
 =?utf-8?B?UEZPT1ByaGlkZ2VzenYxZW05c1FkUW5mZFVTRzR2Z1V5Z0FrU2UwTktudm9q?=
 =?utf-8?B?WTRhRVd2QUtJbi9QenE0NnhMR1RpS2VvajdLM0puRUVYWmtXeWJ3UW01VFU2?=
 =?utf-8?B?Z3lySUUreDFlRzc0TllSUXNSd3V2cnFBdEZ0Ry9RSTNiSzh5OVFPaWREby9L?=
 =?utf-8?B?a1BHYnNGb0laSjgrUi9ZVGdGZDlxMm91Z1hqRU04K2NBTUlITSs0UW5Vdlhq?=
 =?utf-8?B?Wmp1TmIxN0h5cUtoMEJDUWZJR2FIMXVxdDNtTDFtcFdxdGV0T21ReUJuTStn?=
 =?utf-8?B?S1UyT2VhZ0M4K1JESFJpd09RT3ZIRU9kRHQ3WEh1VE0vTnlYSDVmR1FUekJF?=
 =?utf-8?B?SzRabHVzMFVkeEo2amQvMU44YU5sWTk2MWZ1MnR6VmtTb3BObU9PSzNXaWhK?=
 =?utf-8?B?SkF6aGphRzdiUEVLUUgxNEx3VlJKVDlKNDRxVVBzYmp3NU1MSWQ0ZC9xRTNW?=
 =?utf-8?B?aHlvaXI3bEFycm5LTWVSdCs0aWcxMnc2Q0pCWVRlNEY4MlZUMXR6ZWFjN1Ba?=
 =?utf-8?B?V2dxUjdOQ0VoeGxxc0U4Y0EvV1JzY1E4bmhXWkwwN3JnODhHWmN0TW92K0ZR?=
 =?utf-8?B?dFFULzBKSWpvUzgyVzZORldiWHh1TlYxV2F0SUxidEl0N0loZjY3ZHR1T2o0?=
 =?utf-8?B?K0pYd2xXZytkYldHeHpKRDZXNWZJV3ZidWZGZzlva3BsRTJPcVYyS3o4RFA3?=
 =?utf-8?B?Nm00ZWRWMUdSNm91dHF1YkdIUTZLbFZZRXB6UTA4b1J1azFnMFRJbDRDQXRE?=
 =?utf-8?B?Qks3cjNOOU9SS1MxNmpMejZIbnJNZ2h0WHQ3di8xKzM3eCtxUmVtMnFSTFQw?=
 =?utf-8?B?YVIveitYQnVzRkVJM0RjR2lLaVBRWExEUmJiL2dTTGkrZGptd214R2VKSDdG?=
 =?utf-8?B?YnJOMWlXbGV4RWJneGl5ZE53L2RYT3BqY0JJcHJzZytXMFpjMk9pTFUvUjN1?=
 =?utf-8?B?QVhFeCtIY2N4NWgrNFdDampIS2Q1OTFVQ1NjOXIydFZXVmYxWFlkTjFiNWpB?=
 =?utf-8?B?dENTSHMxUDdhVHhRS011ZVBGYUxlZHh6V1lod0lDSzh5eU9CdG03ZmlxNjd6?=
 =?utf-8?Q?KYLMQWnUlfUkYUr8Vyo2ZTGJP?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 232fa441-2f06-48b7-66a4-08dcd9d102fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2024 00:04:50.0986 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MU27p/oYqgeryOCf5MPNIeBpovy3gdhA8roYZACYEpstNdBhmpFn9So3F+DKBlT4U5ILFaWYLGl2q/sHTH/1G4w6XZeVMDUu0uHXxhJ192c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6814
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

SGkgSHVhbiwNCg0KPiBTdWJqZWN0OiBbUEFUQ0ggdjcgMC83XSB1ZG1hYnVmIGJ1ZyBmaXggYW5k
IHNvbWUgaW1wcm92ZW1lbnRzDQo+IA0KPiBUaGlzIHBhdGNoc2V0IGF0dGVtcHRzIHRvIGZpeCBz
b21lIGVycm9ycyBpbiB1ZG1hYnVmIGFuZCByZW1vdmUgdGhlDQo+IHVwaW5fbGlzdCBzdHJ1Y3R1
cmUsIGFsc28gdHJ5IGNsZWFuIHVwIGNvZGUuDQo+IA0KPiBCeSB0aGlzIHBhdGNoc2V0LCB1ZG1h
YnVmIHJlbW92ZSBwYWdlIHN0cnVjdCByZWxheSwgb25seSB1c2UNCj4gcGZuIGFuZCBmb2xpb3Mu
DQo+IA0KPiBTb21lIG9mIHRoaXMgZml4IGp1c3QgZ2F0aGVyIHRoZSBwYXRjaGVzIHdoaWNoIEkg
dXBsb2FkIGJlZm9yZS4NCj4gDQo+IEFueSBwYXRjaCBoYXMgcGFzc2VkIHRoZSB1ZG1hYnVmIHNl
bGYtdGVzdCBzdWl0ZSdzIHRlc3RzLg0KPiBTdWdnZXN0ZWQgYnkgS2FzaXJlZGR5LCBWaXZlayA8
dml2ZWsua2FzaXJlZGR5QGludGVsLmNvbT4NCj4gUGF0Y2g2IG1vZGlmaWVkIHRoZSB1bnBpbiBm
dW5jdGlvbiwgdGhlcmVmb3JlIHJ1bm5pbmcgdGhlIHVkbWFidWYNCj4gc2VsZi10ZXN0IHByb2dy
YW0gaW4gYSBsb29wIGRpZCBub3QgcmV2ZWFsIGFueSBtZW1vcnkgbGVha3MuDQo+IA0KPiBOb3Rp
Y2U6IFRlc3QgaXRlbSA2IG1heWJlIHJlcXVpcmVzIHJ1bm5pbmcgdGhlIGNvbW1hbmQ6DQo+ICAg
ZWNobyAxMDI0ID4gL3N5cy9rZXJuZWwvbW0vaHVnZXBhZ2VzL2h1Z2VwYWdlcy0yMDQ4a0IvbnJf
aHVnZXBhZ2VzIA0KDQpUaGFuayB5b3UgZm9yIHRoZSBwYXRjaGVzLiBTZXJpZXMgYXBwbGllZCB0
byBkcm0tbWlzYy1uZXh0Lg0KDQpUaGFua3MsDQpWaXZlaw0KDQo+IENoYW5nZWxvZw0KPiA9PT0N
Cj4gICB2NiAtID4gdjc6DQo+ICAgICBBIGxpdHRsZSBjaGFuZ2UsIHVwZGF0ZSBzb21lIGNvbW1p
dCBtZXNzYWdlLg0KPiAgICAgUGF0Y2gzOiBhZGQgZml4ZXMgdGFnLg0KPiAgICAgUGF0Y2g0OiB1
cGRhdGUgYWNrIHRhZywgcmVtb3ZlIHRoZSByZWR1bmRhbnQgaWYgKCFtZW1mZCkgY2hlY2sgZnJv
bQ0KPiAgICAgICAgICAgICBjaGVja19tZW1mZF9zZWFscygpLiB1cGRhdGUgY29tbWl0IG1lc3Nh
Z2UuDQo+ICAgICBQYXRjaDY6IHVwZGF0ZSBjb21taXQgbWVzc2FnZSB0byBkZXNjcmliZSBob3cg
dW5waW4gYXJyYXkgd29ya2VkLg0KPiAgICAgUGF0Y2g3OiB1cGRhdGUgY29tbWl0IG1lc3NhZ2Ug
dG8gZGVzY3JpYmUgd2h5IG5lZWQgcmV1c2UgdGhlIGZvbGlvcw0KPiAgICAgICAgICAgICBhcnJh
eS4NCj4gICB2NSAtPiB2NjoNCj4gICAgIFBhdGNoMSB1c2UgVml2ZWsncyBjb21tZW50cyh0aGFu
ayB5b3UpLCBmaXggY29kZSBzdHlsZSwgdXBkYXRlIGFjay10YWcuDQo+ICAgICBQYXRjaDIsIDMg
bm8gY2hhbmdlLg0KPiAgICAgUGF0Y2g0IGZpeCBtZW1mZCBtaXNzIGZwdXQsIHVzZSBWaXZlaydz
IGNvbW1lbnRzKHRoYW5rIHlvdSksDQo+ICAgICAgICAgICAgZml4IGNvZGUgc3R5bGUsIHVwZGF0
ZSBzdWdnZXN0ZWQtYnkuDQo+ICAgICBQYXRjaDUgdXBkYXRlIGFjay10YWcsIGZpeCBlcnJvciB3
b3JkIGluIGNvbW1pdCBtZXNzYWdlLg0KPiAgICAgUGF0Y2g2IHVwZGF0ZSBhY2stdGFnLCB1c2Ug
eG1hcyBzdHlsZS4NCj4gICAgIFBhdGNoNyB1cGRhdGUgYWNrLXRhZywgcmVtb3ZlIHVudXNlZCBy
ZXQgdmFyaWFibGUuDQo+IA0KPiAtLS0NCj4gICB2NCAtPiB2NToNCj4gICAgIFBhdGNoMSBkb2Mg
d2h5IHByZS1mYXVsdCBmYWlsZWQgbm90IHJlcG9ydCBlcnJvci4NCj4gICAgIFBhdGNoMiBubyBj
aGFuZ2UNCj4gICAgIFBhdGNoMyB1cGRhdGUgYWNrIHRhZyBtYXJrZWQgaW4gdjQNCj4gICAgIFBh
dGNoNCBzcGxpdCBzb21lIGNoYW5nZSBpbnRvIHBhdGNoNSBhbmQgcGF0Y2g3LCB0aGlzIG9ubHkg
Y29udGFpbnMNCj4gICAgICAgICAgICB1ZG1hYnVmIHBpbiBmb2xpbydzIGZ1bmN0aW9uDQo+ICAg
ICBQYXRjaDUgYWRkIGhlbHBlciBpbml0L2RlaW5pIHRvIGNsZWFuIHVkbWFidWYgc3RydWN0IGlu
aXRpYWxpemVkDQo+ICAgICBQYXRjaDYgcmVtb3ZlIHVubmVjZXNzYXJ5IGNvZGUNCj4gICAgIFBh
dGNoNyByZW1vdmUgcmV1c2UgZm9saW8gcmVtb3ZlIHY0IHBhdGNoNA0KPiANCj4gLS0tDQo+ICAg
djMgLT4gdjQ6DQo+ICAgICBQYXRjaDEgZmlsbCB2bWEgYXJlYSB3aXRoIHBmbiBvbmx5IHdoZW4g
dHJ1ZSBhY2Nlc3MuDQo+ICAgICBQYXRjaDIgbm8gY2hhbmdlDQo+ICAgICBQYXRjaDMgc2VsZWN0
IFZNQVBfUEZODQo+ICAgICBQYXRjaDQgdXNlIGZ1bmN0aW9uIHBpbiBlYWNoIGl0ZW0uDQo+ICAg
ICBQYXRjaDUgdXNlIHBpbm5lZCBmb2xpbyBhcnJheSBpbnN0ZWFkIHVkbWFidWZfZm9saW8gc3Ry
dWN0Lg0KPiANCj4gLS0tDQo+ICAgdjIgLT4gdjM6DQo+ICAgICBQYXRjaDEsIGF2b2lkIHVzZSBw
YWdlLCBpbnN0ZWFkLCB1c2UgcGZuLCBhbmQgdXNlIHZtZl9pbnNlcnRfcGZuIG1hcA0KPiAgICAg
c3VnZ2VzdGVkLWJ5IEthc2lyZWRkeSwgVml2ZWsgPHZpdmVrLmthc2lyZWRkeUBpbnRlbC5jb20+
DQo+IA0KPiAgICAgUGF0Y2gyLCB1cGRhdGUgYWNrZWQtYnkgS2FzaXJlZGR5LCBWaXZlayA8dml2
ZWsua2FzaXJlZGR5QGludGVsLmNvbT4NCj4gICAgIEFuZCBrZWVwIHRoZSBrdmNhbGxvYyBvbiB0
aGUgc2FtZSBsaW5lLg0KPiANCj4gICAgIFBhdGNoMywgYXZvaWQgdXNlIHBhZ2UsIGluc3RlYWQs
IHVzZSBwZm4sIHRoZW4gdXNlIHZtYXBfcGZuIG1hcA0KPiANCj4gICAgIFBhdGNoNCwgc3BsaXQg
djIgcGF0Y2g0LCBzaW5nbGUgdXBkYXRlIGNvZGVzdHlsZSB0byBrZWVwIHJldmlldw0KPiAgICAg
ZWFzeS4NCj4gDQo+ICAgICBQYXRjaDUsIGFub3RoZXIgd2F5IHRvIHJlbW92ZSB1ZG1hYnVmX2Zv
bGlvDQo+IA0KPiAtLS0NCj4gICB2MSAtPiB2MjoNCj4gICAgIFBhdGNoMSwgMyBSZWN0aWZ5IHRo
ZSBpbXByb3BlciB1c2Ugb2YgdGhlIHNnIHRhYmxlLg0KPiAgICAgc3VnZ2VzdGVkLWJ5IENocmlz
dGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCj4gDQo+ICAgICBQYXRjaDIg
YWRkIGFja2VkLWJ5IENocmlzdGlhbiBL77+9bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+
IHdoaWNoDQo+ICAgICBtYXJrZWQgaW4gdjENCj4gDQo+ICAgICBQYXRjaDQNCj4gICAgIE1vZGlm
eSB0aGUgZGF0YSBzdHJ1Y3R1cmUgdG8gcmVzdG9yZSB0aGUgdXNlIG9mIHBhZ2VzIGFuZA0KPiAg
ICAgY29ycmVjdCB0aGUgbWlzdW5kZXJzdGFuZGluZyBvZiBsb29wIGNvbmRpdGlvbnMgc3VjaCBh
cyAicGdjbnQiLg0KPiAgICAgbWFrZSBzdXJlIHBhc3Mgc2VsZiB0ZXN0Lg0KPiANCj4gICAgIHJl
bW92ZSB2MSdzIHBhdGNoNA0KPiB2Ng0KPiAgIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8y
MDI0MDkwOTA5MTg1MS4xMTY1NzQyLTEtbGlua0B2aXZvLmNvbS8NCj4gdjUNCj4gICBodHRwczov
L2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNDA5MDMwODM4MTguMzA3MTc1OS0xLWxpbmtAdml2by5j
b20vDQo+IHY0DQo+ICAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjQwODIyMDg0MzQy
LjE1NzQ5MTQtMS1saW5rQHZpdm8uY29tLw0KPiB2Mw0KPiAgIGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2FsbC8yMDI0MDgxMzA5MDUxOC4zMjUyNDY5LTEtbGlua0B2aXZvLmNvbS8NCj4gdjINCj4g
ICBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNDA4MDUwMzI1NTAuMzkxMjQ1NC0xLWxp
bmtAdml2by5jb20vDQo+IHYxDQo+ICAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjQw
ODAxMTA0NTEyLjQwNTY4NjAtMS1saW5rQHZpdm8uY29tLw0KPiANCj4gSHVhbiBZYW5nICg3KToN
Cj4gICB1ZG1hYnVmOiBwcmUtZmF1bHQgd2hlbiBmaXJzdCBwYWdlIGZhdWx0DQo+ICAgdWRtYWJ1
ZjogY2hhbmdlIGZvbGlvcyBhcnJheSBmcm9tIGttYWxsb2MgdG8ga3ZtYWxsb2MNCj4gICB1ZG1h
YnVmOiBmaXggdm1hcF91ZG1hYnVmIGVycm9yIHBhZ2Ugc2V0DQo+ICAgdWRtYWJ1ZjogdWRtYWJ1
Zl9jcmVhdGUgcGluIGZvbGlvIGNvZGVzdHlsZSBjbGVhbnVwDQo+ICAgdWRtYWJ1ZjogaW50cm9k
dWNlIHVkbWFidWYgaW5pdCBhbmQgZGVpbml0IGhlbHBlcg0KPiAgIHVkbWFidWY6IHJlbW92ZSB1
ZG1hYnVmX2ZvbGlvDQo+ICAgdWRtYWJ1ZjogcmV1c2UgZm9saW8gYXJyYXkgd2hlbiBwaW4gZm9s
aW9zDQo+IA0KPiAgZHJpdmVycy9kbWEtYnVmL0tjb25maWcgICB8ICAgMSArDQo+ICBkcml2ZXJz
L2RtYS1idWYvdWRtYWJ1Zi5jIHwgMjc1ICsrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0t
LS0tLS0tDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDE2OSBpbnNlcnRpb25zKCspLCAxMDcgZGVsZXRp
b25zKC0pDQo+IA0KPiANCj4gYmFzZS1jb21taXQ6IDU3Zjk2MmI5NTZmMWQxMTZjZDY0ZDVjNDA2
Nzc2YzQ5NzVkZTU0OWQNCj4gLS0NCj4gMi40NS4yDQoNCg==
