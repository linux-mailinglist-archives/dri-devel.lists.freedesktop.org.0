Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDDA9D260F
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 13:42:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8587B10E632;
	Tue, 19 Nov 2024 12:42:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KcUnUMxZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F8BF10E27B;
 Tue, 19 Nov 2024 12:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732020144; x=1763556144;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WC4uAv/KAwNVTltg9bRhUsECVhEEVkOAARosFvFw4Tc=;
 b=KcUnUMxZhJ346YmaicosHYJjWPKyaXLt/flX6VcW9hyfLDAlUP26Quak
 gEAjokmXDWCwUrg8xeG2WRI5oB87e01ZFTmyIHwoYPxWCB0oCVjWLQfG0
 Hd3IJDTZ3jWNz3Vj76qokByu6xWbVid5Q7adB7Jk05FVH1iX7HrnSzZNo
 axEP5ih9WmMD2bpZ9Cev4zI+/6WTyIW+bNDN+VRVxQnJ2c6sNaPg9MZOq
 NaVm4ti0Jpt9cgu6MdqhbgBWQkCUH/uOXLjGGNF1P1m7STR4BhmhlzgIM
 zAuvJxV6VKSolbtpyOrfh6Chq4k/dM25kVNlPNxbzaAmeDymMTz2kva6Z A==;
X-CSE-ConnectionGUID: UlIYqsfzQcS9NiKixY2RlA==
X-CSE-MsgGUID: cnxymihITjufSIyYpGZYCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="31950087"
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="31950087"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 04:42:24 -0800
X-CSE-ConnectionGUID: sruq/UoESOmStx1PrrTAfQ==
X-CSE-MsgGUID: j/REw2EfSbmKi+AgM85U8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="93998109"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Nov 2024 04:42:23 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 19 Nov 2024 04:42:23 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 19 Nov 2024 04:42:23 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 19 Nov 2024 04:42:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S2G7c4ATuOdX4I6asuL9e/AkqhMCb9k5DTiepPNmQejO+xsOC+sI3RjfRTYEh+A+xYAHFxf8xgynxYsW/Ldl3Y2LNSaMQvbsz84hHy+AJ4M2dxKG0DqFFLbGz4YQEOjWDbp8fBUyK+PUEXBHtGXCPlDkJekX3M+KWjq+02Jb0F/OVFj25QJZLBB+EMGEZUBhj8JbU2Ceq8HB9nvJHluC2ogeGR0eNvNxVLpzaQwFpYz36mbj5NMXC9n/7jzNcRjChurgNqasdLl2CJqTrrFWMNQhmXtx1tACz3fT7G+t2kJTDguqkE1Dgr2bAxXBOZHR2BnNXgwIinabh14DPX3fhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WC4uAv/KAwNVTltg9bRhUsECVhEEVkOAARosFvFw4Tc=;
 b=RF+Xipup/x9GwTb94WmG9X2571/segp1J3gIpazmtQrxm9n4CI4fVNy0zojuwgBR7EvBwD/q/Hd+jaGCtnGzUqAYjouWO3uDDCs3+AWTXDebHFffsOw4gRMbLN+MBjgtbdZra4yEpRMt344GLU7t1RiBAnXKHDpXf3aF2eLHyC5Rnpr8aaCIxXbXW17fm24LdsjNoYeo/Py968HreQbWbqBgpjBn4x9AOBbqdtNCg60cDHVxTK92VMnOhfPovJsDSLck8If3vHqqhtWqkNuTgQN4rZhyqnWkgQY1AoOc/G66uTk6dsCsX44fkyEQvDzL/z1ofNBO/JAH6XzcSKrtTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5275.namprd11.prod.outlook.com (2603:10b6:408:134::24)
 by DM4PR11MB6017.namprd11.prod.outlook.com (2603:10b6:8:5c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Tue, 19 Nov
 2024 12:42:20 +0000
Received: from BN9PR11MB5275.namprd11.prod.outlook.com
 ([fe80::d113:e69e:54bf:3fea]) by BN9PR11MB5275.namprd11.prod.outlook.com
 ([fe80::d113:e69e:54bf:3fea%5]) with mapi id 15.20.8158.023; Tue, 19 Nov 2024
 12:42:20 +0000
From: "Mrozek, Michal" <michal.mrozek@intel.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, "Brost,
 Matthew" <matthew.brost@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Graunke, Kenneth W" <kenneth.w.graunke@intel.com>, "Landwerlin, Lionel G"
 <lionel.g.landwerlin@intel.com>, "Souza, Jose" <jose.souza@intel.com>,
 "simona.vetter@ffwll.ch" <simona.vetter@ffwll.ch>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>,
 "boris.brezillon@collabora.com" <boris.brezillon@collabora.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "mihail.atanassov@arm.com"
 <mihail.atanassov@arm.com>, "steven.price@arm.com" <steven.price@arm.com>,
 "shashank.sharma@amd.com" <shashank.sharma@amd.com>
Subject: RE: [RFC PATCH 13/29] drm/xe/mmap: Add mmap support for PCI memory
 barrier
Thread-Topic: [RFC PATCH 13/29] drm/xe/mmap: Add mmap support for PCI memory
 barrier
Thread-Index: AQHbOno/yH/DkNH7+kuVQSAdcv8IMLK+ivHg
Date: Tue, 19 Nov 2024 12:42:20 +0000
Message-ID: <BN9PR11MB5275E8A957135B22E8256570E7202@BN9PR11MB5275.namprd11.prod.outlook.com>
References: <20241118233757.2374041-1-matthew.brost@intel.com>
 <20241118233757.2374041-14-matthew.brost@intel.com>
 <ec16da8d-6e1b-4774-93d6-594bc30e2b78@amd.com>
 <173201744524.36213.9384132621937199725@jlahtine-mobl.ger.corp.intel.com>
In-Reply-To: <173201744524.36213.9384132621937199725@jlahtine-mobl.ger.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5275:EE_|DM4PR11MB6017:EE_
x-ms-office365-filtering-correlation-id: acf2c5f9-fae5-4677-42f1-08dd08979bf2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?TGhFS3hNUVo3djRmdFdCQys0aGlJYnpzNzNTVTVQOGp6VUhvbG12YXcvNHJj?=
 =?utf-8?B?VE8yaVJzTjNBQjVGSmVKTnYvcmg4U2szZy9jRmlzc3pFblUyNTBLeHJMWE5m?=
 =?utf-8?B?NjNFNE9XbnNIVTBMU1dpUENKTmFwUTJJRDl3aGpQT3BIdHJiZHh1QzJUMVkz?=
 =?utf-8?B?V1lZa2xYbytrcUVaWEFpOXNvL1JrTkxXZEhlYnBpclEwZkViU1hqM3R1Z2N0?=
 =?utf-8?B?NkNTd05DYkRSNkhsQUg4RzBlMC9QZWd4Q2VoWWtvOHNZY1ROd0NzNFBGSk8r?=
 =?utf-8?B?ME5SMFZkbk16enVMakJFeEVLNDNSQmplZ1ZtbTZNYWU3MzdrcTk1Y3FOaUgv?=
 =?utf-8?B?R1YzcTlPWkc4NVdpS1NGUzhVbnkvSVd2UHUrQzBNMHBWZmI3RmVNSDhTbE55?=
 =?utf-8?B?Rm9yRG83RU9TdiszQk5ZSktheFhiZzlqenV5NmdlckdhWlRUblBrQU1DZXYv?=
 =?utf-8?B?QmN2UjAvVjNtRjRhM2hvdytwT2JQR05uOGY4dEErcXZaM2NVcXFIMWtuMVpi?=
 =?utf-8?B?SW04b0o5UmozNyt2OUZBVnIrVGRYeHFOcVU3bDI1VjNmSTMyd3FUQ1JBUmNV?=
 =?utf-8?B?ZkR5NERwcDUxZkhQT1RZaTBIVzl6Y1N1QTFXdlFpWjh3eUJPNHhYRS9NK3k2?=
 =?utf-8?B?VFEycVNhY0Q0dHVLT24xWkZ5WG05RzBMa1p0Qmw3M2FQZmZOTCtLd3F6MFR6?=
 =?utf-8?B?Ky9RTVo1R2xwdGRwdzVZN29tSGllcWdnV3haRlJaNHgwUUJvcnNINndQU3RY?=
 =?utf-8?B?NzBqb1Nwa05RMVc3aGZiU2hCVWFSUjVBU3FSVGI1TE90SjdaNk5hNkZVWFVm?=
 =?utf-8?B?K25TZjZZTEVLN2JTWVUzeWNmMzJsUjlYbXY1dXoyck9MdkVIY21XZTlsVlNP?=
 =?utf-8?B?anFjYU41bUpsUm9iVnNOVVpZbjFySkVYdkt1WXFKZmg3NmRrMFAwZ2phbW1z?=
 =?utf-8?B?OHZnMCtmVzY0S3E5ZmN0K0NwWnBBUFZaR3hTUFZscHMvQlpIdjlZcTM2K3hX?=
 =?utf-8?B?bDJIQ3hpRS8yODV5ZUFlYW5Xc201N0hIMTZmNnhBUHU5dno0WFk5dUMrZEJB?=
 =?utf-8?B?c1NWOUNLNlRROGppN09kZnk4TGgzYldZSmJlTDFsUnJZTnM5Z3V6U2hvRkpi?=
 =?utf-8?B?M1o3cVhJVHJ5K0diQkdSdlZlMFlCNkxIVEVhc0JFRFFmcWJwcFhmemRDNGZn?=
 =?utf-8?B?SHVhVXVoR1lWVnZoY2JCUDVIa0I3YnY3dWRzcktFWldRdnhZY0VYaEVlMUxl?=
 =?utf-8?B?emlyVk8vUFQ3eW9TMjhXZXllbTZucWlEZC9hdkZNWVZaQ0t6ZDhBbXFwSWd5?=
 =?utf-8?B?UVc1V0xBMDRRU2hpaWxqVkZpTVo4bi9KN285bzQzWCtSNWt2Y2JBVGpSTGVE?=
 =?utf-8?B?QVA2cThrNm0xRVNJckdZU2xWRVhTQ2hjalBXbVpUK3pkZzNLN3BoK3g5cnB0?=
 =?utf-8?B?V3l3NFNQems2YWhrRUJZRkdFSitRR1Z0V1ErR2kzWFdRTWZOWWlaNm1RWlI0?=
 =?utf-8?B?bGFoTTVmNEVtczlFWkVGMmZFMERNRWFNWFEwd0FlR1NONTZXTTRzVnByVEZE?=
 =?utf-8?B?NmY4ZkFVS24wc01SZlZFTzFYZUxEVGU0dWQxQ0doUEJPK21FUkZtekFsM2ND?=
 =?utf-8?B?UDBBVWNVWnBOYkhaa25HVnE2Q0lhV0htalNFMCtod0szcWRUTUtUNDlQTnh0?=
 =?utf-8?B?aWRUSVgyZXplNlRPZy95cW5YTlRSU3hLdi96eFdsUUpDRlFmSkt4SVNyeW82?=
 =?utf-8?Q?3MFp81OZ2uxKFqc2lhWiNs0i/g57H0RLz9SQeNn?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5275.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eU5XOTl3eEdNTW9yOGo2S0QwaVo5QUorSWtvejZPa0pBU2U4cVpJK1o5TWRv?=
 =?utf-8?B?dkZ4MDg3V1hCMmRMT0pHRHZSTXpWRVV4YXVZR2M5bkxJMXV2R2FaRlpoQ2Rr?=
 =?utf-8?B?VkZjOHo4S1dDR3liTDFwVE1YR1IvbThGQ1g3R0JQblhWVnY3dWVPbVZ1K1FJ?=
 =?utf-8?B?ZFRsOExFeFEzUzFwN0ZBdWIzQ3dLQ3pIb3dUaHJXY1Z3MDFIK2lXc3c3RERj?=
 =?utf-8?B?cno3SU9peDltb29pMXdmeEkxQ1huaU1MMnZpWXRpak9ON1RwSjF5TFBaLzVM?=
 =?utf-8?B?ZUVLRkY3dS9WYWtvVTNLd3NML0VBUXRxZWcyQWs4WjV0OTBJWG1lQUxZak9y?=
 =?utf-8?B?Q2pnUmZlTzF4ZXZvaW9JSFFmM29KUHJLbUl1MzNwVVpkaGNiY0xGRm5pZDIw?=
 =?utf-8?B?SDZYRUloOVJQUzlEalE3UjdSL1pXdWFSSWJ0aDhPSW10a2xOeTBSbzAzQ2dU?=
 =?utf-8?B?dlJrMG94VlNmY25selo2dVQzQnZ2TVBKRSt2Zkg1SlJhTmp3VmNYMXorK2Fx?=
 =?utf-8?B?eEhIaWVHNDlrZXJRNlFDQytoRk81WHAzSmtUeXQ2U1NrTTdTL0QxaXBaalUx?=
 =?utf-8?B?eEMxZjVxSW9Id1NGWGxaZFhUZEdPV1c2bHA2eGFBbS9mR2VHSklvekZnRWln?=
 =?utf-8?B?L3U5VXdva29wS3cxdkdVVWNGMHZ5UGkzbnRmdkhuWVVKTEZSWTd6SEhKazFW?=
 =?utf-8?B?TnN0RjNrRTZ1RXNWMDg4ck9BWUxmYUZmMWlkNjhKM3g5bStQVTlYRmg3K3pa?=
 =?utf-8?B?MjNOYXRLTnV2c2VmQ3FaelFScVRjYmg5ejZUaXU5R25vYmVIc0kvUDJmM2hR?=
 =?utf-8?B?U0NabGxOTXN1SGwvUGNRdzdpd3RkTjRjSGpVQlMvWnAzdWhpV2hPbytMMXM3?=
 =?utf-8?B?cTgwOHZ0aXM2ZklaYUh6VGp1cVNtdWdlQllIK3F0RERrVGFmZHoyM0NLVUlH?=
 =?utf-8?B?eEdMejNQQUJTd0RHNmtNOWFEV2NmUVhkZGRiTzZjYjRobkl3OXBydGZ5UTBP?=
 =?utf-8?B?a3BvenJCY2k1TFhXT1lQZ2NEZW5RZXZUaUZVSGIvb01EVFhZSWFMTU9JNWV1?=
 =?utf-8?B?SDFQMnp6bFJGSE5rUERlS055bXN1WnVkeGFoY2RzOC9RbUJjYUY4R0VpRTVx?=
 =?utf-8?B?WEZLM0JYc3NOMDR5VFBPNDQ0SllhdnZyaEtIZ1I4VFByQWc4VWhyWWErakJC?=
 =?utf-8?B?dDRabWZCTE80VjVZOTc4cFhSVXNPV0RlNHh0WW15ZGQwZDdkRHJ1UjVRcGsz?=
 =?utf-8?B?VnFjRUd0SWtxay9qM0FLaDlySXhjMnBreERxeU94SzdPUXNmSmV1Vk5MN0NX?=
 =?utf-8?B?RjF3VWZiWFd1MC9nQm9NSDUzaDZvNXQxbm0vYUlDN240MGdPRzhoT1Q5QTVx?=
 =?utf-8?B?SHNZeEh1L0tkTUZXNlRMdmZZRTN2ZXF3RWV5MzNaRDZwMUxtVXRjOTBpbHh5?=
 =?utf-8?B?QytmdW0wTzE4VUJTK0Voc21WQldob3lxQ2VnWjlHTnBzcUsrL2Z4M0JFNlh2?=
 =?utf-8?B?cnJxUUIxV2JrMEttbHpzWTdHT2tLdFlwWThFbGN4eHRkWlR2VURvbHhzbTZr?=
 =?utf-8?B?cUx3eXAwaGlkNDFXVmk5SlJId1dObWdNWitJTGJjZGdUOHpITWRsZklZcy9O?=
 =?utf-8?B?VzRub2ZEMzhKVnJpMzBkTHJydDFwKzY3aTdzQ2FNdXV5R0l5WFh1ZSt2Q1hZ?=
 =?utf-8?B?dVZoeWxTVFRKK0hGLys3U0Y1WkJuaTJocURWVCt1ZlZZdlBTYlc0L0RYUkk0?=
 =?utf-8?B?ay9OMktKOHBMcFJCTE1pdFZyc2wxcjNFempaY0NDZTE4R0tUNmJNSWNBRDA2?=
 =?utf-8?B?VSs1MnhkRmMxeXFrUlRiRzE0dlF3M2hHSG5hUkF4UEp2d1FuUTFoWmVoZWhH?=
 =?utf-8?B?dzVNWllqRWZwb1UxT3BWaG9DSlBJSXFFMXg0WnllaXBTbEhCOVVIZTk3OVNv?=
 =?utf-8?B?VXQzSGY4bk5vdGF1aUxTa25NYW11NDRCNUhvNmZEeGU4M21xbjNHMnBNTjdK?=
 =?utf-8?B?dG00QzhqeTlmbVUvUmZDYWRoMmVsL09RdXlNL0Q4M1RLODFrOXF5dnMrODI2?=
 =?utf-8?B?VGVvME1sQVlEei9jVDVRVmNjaFlEWEE1WXhydlpUbDNhakQ5akxnd1JTcVJ6?=
 =?utf-8?Q?Nr1KwLbIy1PndAxigV4hWqy7/?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5275.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acf2c5f9-fae5-4677-42f1-08dd08979bf2
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2024 12:42:20.5781 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: suJdphC6TItJdIDP8gx/GAz6O/x9oZmQXBZ5uS6sPfM52vaGVg+Ws23orxMsTcq2sKxTmx3NlCloNE2w2sPm/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6017
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

IkFkZGluZyBNaWNoYWwgZnJvbSB0aGUgY29tcHV0ZSB1c2Vyc3BhY2UgdGVhbSBmb3Igc2hhcmlu
ZyByZWZlcmVuY2VzIHRvIHRoZSBjb2RlLg0KDQpRdW90aW5nIENocmlzdGlhbiBLw7ZuaWcgKDIw
MjQtMTEtMTkgMTI6MDA6NDQpDQo+IEFtIDE5LjExLjI0IHVtIDAwOjM3IHNjaHJpZWIgTWF0dGhl
dyBCcm9zdDoNCj4gPiBGcm9tOiBUZWphcyBVcGFkaHlheSA8dGVqYXMudXBhZGh5YXlAaW50ZWwu
Y29tPg0KPiA+DQo+ID4gSW4gb3JkZXIgdG8gYXZvaWQgaGF2aW5nIHVzZXJzcGFjZSB0byB1c2Ug
TUlfTUVNX0ZFTkNFLCB3ZSBhcmUgDQo+ID4gYWRkaW5nIGEgbWVjaGFuaXNtIGZvciB1c2Vyc3Bh
Y2UgdG8gZ2VuZXJhdGUgYSBQQ0kgbWVtb3J5IGJhcnJpZXIgDQo+ID4gd2l0aCBsb3cgb3Zlcmhl
YWQgKGF2b2lkaW5nIElPQ1RMIGNhbGwgYXMgd2VsbCBhcyB3cml0aW5nIHRvIFZSQU0gDQo+ID4g
d2lsbCBhZGRzIHNvbWUgb3ZlcmhlYWQpLg0KPiA+DQo+ID4gVGhpcyBpcyBpbXBsZW1lbnRlZCBi
eSBtZW1vcnktbWFwcGluZyBhIHBhZ2UgYXMgdW5jYWNoZWQgdGhhdCBpcyANCj4gPiBiYWNrZWQg
YnkgTU1JTyBvbiB0aGUgZEdQVSBhbmQgdGh1cyBhbGxvd2luZyB1c2Vyc3BhY2UgdG8gZG8gbWVt
b3J5IA0KPiA+IHdyaXRlIHRvIHRoZSBwYWdlIHdpdGhvdXQgaW52b2tpbmcgYW4gSU9DVEwuDQo+
ID4gV2UgYXJlIHNlbGVjdGluZyB0aGUgTU1JTyBzbyB0aGF0IGl0IGlzIG5vdCBhY2Nlc3NpYmxl
IGZyb20gdGhlIFBDSSANCj4gPiBidXMgc28gdGhhdCB0aGUgTU1JTyB3cml0ZXMgdGhlbXNlbHZl
cyBhcmUgaWdub3JlZCwgYnV0IHRoZSBQQ0kgDQo+ID4gbWVtb3J5IGJhcnJpZXIgd2lsbCBzdGls
bCB0YWtlIGFjdGlvbiBhcyB0aGUgTU1JTyBmaWx0ZXJpbmcgd2lsbCANCj4gPiBoYXBwZW4gYWZ0
ZXIgdGhlIG1lbW9yeSBiYXJyaWVyIGVmZmVjdC4NCj4gPg0KPiA+IFdoZW4gd2UgZGV0ZWN0IHNw
ZWNpYWwgZGVmaW5lZCBvZmZzZXQgaW4gbW1hcCgpLCBXZSBhcmUgbWFwcGluZyA0SyANCj4gPiBw
YWdlIHdoaWNoIGNvbnRhaW5zIHRoZSBsYXN0IG9mIHBhZ2Ugb2YgZG9vcmJlbGwgTU1JTyByYW5n
ZSB0byANCj4gPiB1c2Vyc3BhY2UgZm9yIHNhbWUgcHVycG9zZS4NCj4gDQo+IFdlbGwgdGhhdCBp
cyBxdWl0ZSBhIGhhY2ssIGJ1dCBkb24ndCB5b3Ugc3RpbGwgbmVlZCBhIG1lbW9yeSBiYXJyaWVy
IA0KPiBpbnN0cnVjdGlvbj8gRS5nLiBtX2ZlbmNlPw0KDQpJIGd1ZXNzIHlvdSByZWZlciBvbiB0
aGUgdXNlcnNwYWNlIHVzYWdlIGRpcmVjdGlvbnM/IFllYWgsIHRoZSB1c2Vyc3BhY2UgZGVmaW5p
dGVseSBoYXMgdG8gbWFrZSBzdXJlIHRoYXQgdGhlIHdyaXRlIGFjdHVhbGx5IHByb3BhZ2F0ZWQg
dG8gdGhlIFBDSSBidXMgYmVmb3JlIHRoZXkgY2FuIGFzc3VtZSB0aGUgc2VyaWFsaXphdGlvbiB0
byBoYXBwZW4gb24gdGhlIEdQVS4gSSB0aGluayB0aGUgdXNlcnNwYWNlIGZvbGtzIHNob3VsZCBi
ZSBhYmxlIHRvIGV4cGxhaW4gaG93IGV4YWN0bHkgdGhlIG9yY2hlc3RyYXRlIHRoYXQuIE1pY2hh
bCwgY2FuIHlvdSBvciBzb21lYm9keSBlbHNlIHNoYXJlIHRoZSByZXNwZWN0aXZlIGxpbmVzIG9m
IGNvZGUgaW4gdGhlIHVzZXJzcGFjZSBkcml2ZXI/DQoNCkF0IHRoaXMgdGltZSwgdGhlIHVzZXJz
cGFjZSBvbmx5IGVuYWJsZXMgdGhpcyBvbiBYODYsIGJ1dCBjb3VsZCBhbHNvIHN1cHBvcnQgb3Ro
ZXIgbW9yZSBleG90aWMgcGxhdGZvcm1zIHZpYSBsaWJwY2lhY2Nlc3MuDQoNCj4gQW5kIHdoeSBk
b24ndCB5b3UgZXhwb3NlIHRoZSByZWFsIGRvb3JiZWxsIGluc3RlYWQgb2YgdGhlIGxhc3QgDQo+
ICh1bnVzZWQ/KSBwYWdlIG9mIHRoZSBNTUlPIHJlZ2lvbj8NCg0KRG9vcmJlbGxzIGFyZSBhIGNv
bXBsZXRlIHJlZCBoZXJyaW5nIGhlcmUuIA0KDQpDaG9zZW4gcGFnZSBqdXN0IGhhcHBlbnMgdG8g
YmUgYSBmdWxsIDRLIE1NSU8gcGFnZSB3aGVyZSBhbnkgd3JpdGVzIGNvbWluZyBvdmVyIFBDSSBi
dXMgZ2V0IGRyb3BwZWQgKGFuZCByZWFkcyByZXR1cm4gemVybykgYnkgdGhlIEdQVS4gU3VjaCBk
dW1teSAoZnJvbSBDUFUgcG9pbnQgb2YgdmlldykgNEsgTU1JTyBwYWdlIGFsbG93cyBkb2luZyBh
IENQVSB3cml0ZSB0aGF0IGdlbmVyYXRlcyBhIFBDSSBidXMgdHJhbnNhY3Rpb24sIHdoZXJlIHRo
ZSB0cmFuc2FjdGlvbiBpdHNlbGYgaXMgZXNzZW50aWFsbHkgYSBOT1AuIEJ1dCBhcyB0aGUgdHJh
bnNhY3Rpb24gZmFsbHMgaW50byB0aGUgTU1JTyBhZGRyZXNzIHJhbmdlLCBpdCB3aWxsIHRyaWdn
ZXIgYSBzZXJpYWxpemF0aW9uIG9mIHRoZSBpbmNvbWluZyB0cmFmZmljIGluIHRoZSBHUFUgc2lk
ZSwgYmVmb3JlIGJlaW5nIGlnbm9yZWQuDQoNClJlZ2FyZHMsIEpvb25hcw0KIg0KDQpIZXJlIGlz
IGFwcHJvcHJpYXRlIHBhdGg6DQpodHRwczovL2dpdGh1Yi5jb20vaW50ZWwvY29tcHV0ZS1ydW50
aW1lL2Jsb2IvZjU4OTQwODg0ODEyODQzNGU0MTBiNmI0YzJhOTEwN2ZmNzhhNzRlOS9zaGFyZWQv
c291cmNlL2RpcmVjdF9zdWJtaXNzaW9uL2RpcmVjdF9zdWJtaXNzaW9uX2h3LmlubCNMNDM3DQoN
CmZsb3cgaXMgYXMgZm9sbG93czoNCjEuIGRvIHVwZGF0ZXMgdG8gc2hhcmVkIG1lbW9yeSBiZXR3
ZWVuIENQVS9HUFUgdXNpbmcgV0MgbWVtb3J5IG1hcHBpbmcgDQoyLiBlbWl0IHNmZW5jZSBpbnN0
cnVjdGlvbiB0byBtYWtlIHN1cmUgdGhlcmUgaXMgbm8gcmVvcmRlcmluZyBvbiB0aGUgQ1BVIHNp
ZGUNCjMuIGVtaXQgcGNpQmFycmllciB3cml0ZSAodGhpcyBwYXRjaCkgLCB0aGlzIGVuc3VyZXMg
dGhhdCBhbGwgZWFybGllciB0cmFuc2FjdGlvbnMgYXJlIHByb3Blcmx5IG9yZGVyZWQgZnJvbSB0
aGUgR1BVIHNpZGUNCg0KU28gUENJIG1lbW9yeSBiYXJyaWVyIGlzIHN1Ym1pdHRlZCBhZnRlciBz
ZmVuY2UgaW5zdHJ1Y3Rpb24gYW5kIHRoYXQgbWFrZXMgc3VyZSB0aGF0IGFsbCBlYXJsaWVyIHRy
YW5zYWN0aW9ucyBhcmUgcHJvcGVybHkgb3JkZXJlZC4NCg0KTWljaGFsDQoNCg0K
