Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A694AAD60A
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 08:27:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BF7510E138;
	Wed,  7 May 2025 06:27:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Hvw2wmHc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2070.outbound.protection.outlook.com [40.107.223.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A5ED10E138
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 06:27:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dmt+4XIy0Vcu9ip3lxumRZ/cR3LB7uRzCqWLRvPHfgiEwpM88tMfdbX2Z40uxNzNHVvI2pN5mTf3reFAhaqpe/+wJKd6aOavw17gB9iABv8CG+APjJ8ZKponKOR6vgpF5BydyQ1O9I4kE5ENJ50xlU6E2btgZVTrLlvKoUTLhEYyhVMvYMcc726hAGJZMY+DDkVZaopJwPLRmtvyZK6ZbJ1IPBTNzQhPGPgmBhQpGrVuP9nmM5hkYYJa/tYP62NWUNa8MDXm+jrKSKjxUhzEvfoCaPXT7K1wiLyupEg+w9CjdnkOS5X0b5RX8W7mZlKMYoMe+7KR/PQ9OEti4OGRMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sd7w4410HJ/ElOCqAji3FNGJEQ92rpogWH9GHHnz0qQ=;
 b=HuXuazGGPwW4FpkE2zPp6cl/CW31BJMA3jOegEWUXtbOUCWSm6VOY8mcMr4DglGcLH/maF6G9OTs3Ua1U7B+u7uAy26c0cKDC8njPKiMNklkdLyVnurQYzQzFddAr9faDHW77S+f7Jb2F8qMtV8mMLJyvGy1zVn8XJj/GWLMGTcIVEhhnbJowvfpXn3ch3OxB8+0vXIjXsBLZ4rja3OsbDGqaPBYWP2xlUlvzVsxZWILcxAiuiaAcO6513oDY1Hm0RkaytZUCSK5lX9yVjkq34zt+kClmgsoEiuRJoVN3CU83rWU2z8aD/tXw6pGWPuNuMoLpolKe7FgK611NBEy3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sd7w4410HJ/ElOCqAji3FNGJEQ92rpogWH9GHHnz0qQ=;
 b=Hvw2wmHcf98eQJGSsEuiLfq9kZGwvCs1k49bIohOr7y85T855TU4Qyz0leiLrAcxYRvPETFbZHSRg4e3dDbjah61FRfiS90z5KldASsN81k1tMjYEsZ/oUBnFCyhybLUHuDC1J5rMSVVKfe+TYJVk6wf0E64pX0ws+vQK9aK4OE=
Received: from BL1PR12MB5753.namprd12.prod.outlook.com (2603:10b6:208:390::15)
 by SJ0PR12MB6758.namprd12.prod.outlook.com (2603:10b6:a03:44a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 7 May
 2025 06:27:45 +0000
Received: from BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e]) by BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e%3]) with mapi id 15.20.8699.022; Wed, 7 May 2025
 06:27:44 +0000
From: "Khatri, Sunil" <Sunil.Khatri@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Danilo
 Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>
CC: "Deucher, Alexander" <Alexander.Deucher@amd.com>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>, "Pelloux-Prayer, Pierre-Eric"
 <Pierre-eric.Pelloux-prayer@amd.com>
Subject: RE: [PATCH v2] drm/sched: fix the warning in drm_sched_job_done
Thread-Topic: [PATCH v2] drm/sched: fix the warning in drm_sched_job_done
Thread-Index: AQHbr4Ls3jXu3P7ra0KQS5BSPMc+sbO6QxxQgAAL5ICADIOFIA==
Date: Wed, 7 May 2025 06:27:44 +0000
Message-ID: <BL1PR12MB575348104DD79E9FE8FE7D629388A@BL1PR12MB5753.namprd12.prod.outlook.com>
References: <20250417102430.2828552-1-sunil.khatri@amd.com>
 <BL1PR12MB57534AEE3F7D3352F68B2A4493802@BL1PR12MB5753.namprd12.prod.outlook.com>
 <32cf322c-b23f-4127-b1f7-5cbe8894a007@amd.com>
In-Reply-To: <32cf322c-b23f-4127-b1f7-5cbe8894a007@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=6542b77d-495a-4761-9ac1-00ec8bac092d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-05-07T06:25:05Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10, 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5753:EE_|SJ0PR12MB6758:EE_
x-ms-office365-filtering-correlation-id: 348cc29a-774d-457b-c27f-08dd8d304719
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?YzU3NlVyVzlKSWtORWhma1dwUk5UNGh3dDJJWXdjbzNQZ014SlA5YldNRzFm?=
 =?utf-8?B?anNQOGdiMXpXSVZmeEVzNFVuWlJZQUIwdUg1VnhvbVBCZXdZSVJsOVFGSUdI?=
 =?utf-8?B?MnhZcEpZL28rMnBBdXFFbk03NGQ5L1RxcHZ2MFJpaWNNdTJKNElRbzhqQ3Nt?=
 =?utf-8?B?U1pja2hCMW9VMnFzU2V6QUIzVUZkQ2NFVUNjaUljY1B5b0ZTRmNLbndwWFEr?=
 =?utf-8?B?OG5SclUvNllUNmRueDZJYVNhcUdSY2pYKy9BaVF1Tmc0NTMwdnVDekJkdUlR?=
 =?utf-8?B?SDBlZDNDQlplMnpPYnQvblVLbWlpN09VN1NvQjg4NFNkMVZuQ0F6VmV2QzZS?=
 =?utf-8?B?UGtNZkZJc1BDU2JUL1hwUDdycFZQMU5JcStZL0I4OS9wS0hTRXJTMk9VVkYx?=
 =?utf-8?B?M1lpenhIbUFrRVpLZHlieDgwMXU4VlNOSVlJTkVjUWRvanY3anh0a1I4SGtH?=
 =?utf-8?B?alEyM1hTVGZMcnFEM0xEZGtSOUtzTGxaV2pQbG5xeTdqbEZESDRTNFRwU2ZP?=
 =?utf-8?B?YkovVUJiY3pjSzFJWDVyVTV0OFR1bzd6N0ZYMkliVEQ3U3RmL0QrQytFY1dQ?=
 =?utf-8?B?SGlIMTZrZGJqbklVOERhbTZRSW9udEl0ZkJUcTVWK1VXcmRrek5PS1VIWkp1?=
 =?utf-8?B?alN6ZHMza2ZXSnZIaGsxa2Z3c05hc29ZeDNzUGdZWEU5aFBZQVBHZk1oeFZq?=
 =?utf-8?B?d2RrZkpzdXk5THNQanNXUWxYbnY1ZkZ1ZVFsT2hxVndkTXhucHF4R3FGZER2?=
 =?utf-8?B?WFNaQVZjSFUvc1FISkxoTzNTZXZYSUlmUW10MzV5MFlkVXpYc250TGZQWlVn?=
 =?utf-8?B?RVBNRGJsVWlNbFdBMWlhMjdQMThjZ3lseFV3RDNzdUdMbjRJa3ozZlU1SE1S?=
 =?utf-8?B?SmduUEtIRzNMUnB6MitiVndvMU04SkhzR1J0ckEzbWJTcXp6L3FjdGhiT0Nj?=
 =?utf-8?B?S2t3TkhZaVdkSWE2cE8xUzdDR3hFNVB2c2JUVU1ZRWtGZTFqZmVaWlJVOGg0?=
 =?utf-8?B?Qk85L3NwTHdmdlorV2VQdlBvTXVNWm9MQXY0cEQxSkFaaVFWc2V0a3I1RFhx?=
 =?utf-8?B?UXBOTkFIc2Njd1Q2cjFxaGU1TkkyUnJmLzZPWW9TQ3ZwTkV6Z2NIN0NxZVpO?=
 =?utf-8?B?NTNtenNqZzlEQmJUSHJmZ2dzTkcwY2NhcjcyYmZrV0E5WkNlRlpNNW9yQTBW?=
 =?utf-8?B?bzdVUTQ1V3NDQ052c0pZTW1ObWNJT3VtRHZBZm05amx6VFZET1duOGZzOFV1?=
 =?utf-8?B?Q0RtSDRNS0Z4WldsbU9HZHFVMDRDakphTCtrRkRTakJOQnlHZ2pDYnB0Vk1O?=
 =?utf-8?B?blFGdytSYndtd1dSc3ZNU3crMW9iczJCd0Y1amgyT0xab0RMK2VPZkpXK3Y5?=
 =?utf-8?B?a1d5a2JZZWx1SWkwWUdTM3BVWVd1YzFQVCttNUQrV2VVN3lSRWpuVmVvdHF1?=
 =?utf-8?B?Zkp1Ni8zbVQvUkc2Ym5xbGplV1ZWQVE5ditLMkNxcFVpdWZUVzFJcmF4YlNy?=
 =?utf-8?B?UGNTU1VyclI0bDVycnU1djVTN0tXUEVnMEZTVExtUFVxTU1TZ20vMnB2Q0NN?=
 =?utf-8?B?eU1YNjFaSWJPVFN2QktrbmxoNkl0bWtNUEg3Q1dRUjNRSlhzUTdVNkJTc3BV?=
 =?utf-8?B?S2ZHRTFmZkJkUHhRaGQ0QUl3N1ljUzZJTlVYMHNCNTZ1VU1pTVdKU3Zkb3NC?=
 =?utf-8?B?SlVjUEEvOFYwcnhMVzN1WHJ4SlBpbjhLM2FveU9mVTdsQ0ZVa3F4UnRoOGVF?=
 =?utf-8?B?WnZMS0d5SmdxZUp1MXdOMHpTR3VmRFRFVUt4dEZUM0ZNdTJXRzlJRVc5Y1Fm?=
 =?utf-8?B?UFJCL3hmeVdKbVpCYW9zeDRnL04rU1YyMmdIUzh1V2c2WXQ3NkVzbEJRdXZs?=
 =?utf-8?B?L0w4TW55ZDZVdVdXbFhYRFYzWVhpTHJ1cTU5Tk5qanJVcW9MR1c2K0trTmJE?=
 =?utf-8?B?ZkorT2E0S2xtekxEZjRlNVU0cy9zeGRmWVpWYTZCZzMxUzh5bWpyOS9DREIv?=
 =?utf-8?Q?ll77dIp4jh1c/y5ibIutWrFPeLcuUg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5753.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y0RRRTZYS1crM3BsSEVhSDFGaUV0RUgvdUdUK2xqN2RUUmVSUjEzQkQ1cVVB?=
 =?utf-8?B?cmdEZzZDVWJnd0s4eDJzdlJiSHE4djB5V3NzbEc5SWk0NGc1UkJieE9VK2JX?=
 =?utf-8?B?blhwWUdzam1PODYyNXhaN1lXVlEyc3gyMzMzUW5jcXZRZEYwak1GVGJVTHhp?=
 =?utf-8?B?VnV2UUJDOERyVXNGVDJQemgyYmxtNFZiMEFseWNaMzA0eXRkclYvcFpSU1ZD?=
 =?utf-8?B?UUg5R2VCQVhUSVU0bmpuaHVkd3VnZWFGTGhQQi9hVUY1dXgzZlJBdGZwMXkw?=
 =?utf-8?B?NFpxeHg5bUlkaDlCM3dZWVRabkxTVmpOaHZXUnJ4WC9jY24yN216aTYxLzJa?=
 =?utf-8?B?S3JrS0I2TGtmcWUzenFHSEpPdDhWZEN1N0R2V25XL0dqQzFmL1FwV0pONVF3?=
 =?utf-8?B?Yzh6Y3pXRVRybkpZYXhxZ0pBeDhVVGpzYVNkY0ZzM1VCMVowNXhBN1lqb3ky?=
 =?utf-8?B?TnVDRFNxTEs1Zm4xZVdqalpnd0ZXVG85MGUwSy9XdWxQNGFibTNMWS9QMjlx?=
 =?utf-8?B?SXF4MHdBSHZFdklRbW41V0xYV0RJT3MvT2pQU0ZadW0yaWNuaEZTTE1JNGo5?=
 =?utf-8?B?WEVsTDhBYzI4cXJsMVRDSkhtdEp1Rk8zSnZtVCtxakJ4eG1lQ2JzY2xFZW14?=
 =?utf-8?B?Wk9IVldoTTZObjczS0hTVm8wbC94L2dSNDExT2dkSVNkVEIrWVlxbjJ6UEFy?=
 =?utf-8?B?N1dlRk1hb0FPbkdXNDN5SVdId081LzVwRWp6VFkxU2IzRGxQaFVTU0ZtamJW?=
 =?utf-8?B?bGIxcmZQZ2xDVFY5NmoxWjdsOUplSUltd0ZHYlVKcUs4Z25yTVRUM05JSStj?=
 =?utf-8?B?Nmp2YzhTc1JITWtveGxkdEs3aDVSazVYL1hCWCt2RVg3QXVWTGF3NGRsYTYw?=
 =?utf-8?B?aFNPTjRHQUNBMkZOS1FIZ0RHL2IxTS9PbU55YjFKTFFOYUFvT251ZmZkNUFE?=
 =?utf-8?B?RFA4dS8xVjdQQjRhQXlha2RKTmhIOTV4TSsxNkptWmw0T21hNWVOekh1SzZT?=
 =?utf-8?B?UmRiOWZ2d2w4MmZ1bVFrbXR4U0tOVUg0MjBoVXZNNmtpdHk4SzVXRlovbnNL?=
 =?utf-8?B?TksrdzFLbGRZMGx0YUJ1SW45OExhR0hnSXNLUWlzR2JiN0JIeVo4VjdPTjhD?=
 =?utf-8?B?dk91cExxaXNVR2N1SnJzWjBIQ1F1M3NjMGs3ZHltVnlKNmNOQzdQd1hxSHZM?=
 =?utf-8?B?Q2JUYlN5T04rM2h2YlJWd1RvUTNHeWJBeEpvUzVlOFEzNXVNWlRCZndabkxL?=
 =?utf-8?B?UlIvYzRYRDZOUHFST2VSZVY0STNXREwzWHl6RFFWUnRLTkl5VHduVVc3RjIy?=
 =?utf-8?B?SGVQNldIN3lPK215bmlqMlJVL09jckgrSkRWZlZneWZ1em54SnlVOWhzMlVv?=
 =?utf-8?B?aGhBM24vS002b0dMY2JZMUxXam1xVGxhU3NPaDdWNVJNTjhBZldadnBqMHBr?=
 =?utf-8?B?OEF6Z1ZqbGkxOGxabWpCdTZJVngxQUo5WnJENjVKaDRTRnNIOExwbnI1Znpx?=
 =?utf-8?B?MEM4NEZRMW9reDJHSk5MdTVLNHFpSnFDVVI2amt2Y0RBT0IwQ2JoREYydWYr?=
 =?utf-8?B?U3hpV2tIUFBuelZWdnJmNzByaHV3dVIrWnRjYm9lN2xmK0hiYk54cjNrWk9R?=
 =?utf-8?B?VzZFWWVuZU9nZ1N2cVVuT0xscG5ET1l2SGIzZmU2NnZDeitEQmI4MjQ2NlAz?=
 =?utf-8?B?Z3E3UWpkNUl1eWdrM0xiN0gzN1hyQWZidjZ0MnY1NDNveU9TaHRrRWVOdTNh?=
 =?utf-8?B?amgxYnlPeGdMS0p3Ymk1TmU0RElNOFJHdUJJQndvQ0tsbjhhOHFBSVVWdWZR?=
 =?utf-8?B?WTJiT3NMTGJkanNGUDVKaU9oUUtQV0lKbmM1dU1UeTdmVnh3VlQxYUZuaDM4?=
 =?utf-8?B?SXJXeXRINnhSNS9xUDZFNTh5WHBWU1pIZ1YxWXUvaks0aUZOWEdBRHVFRy9X?=
 =?utf-8?B?bTBTVjlKSFQ4K2dyMU9ya292SVdzYTZyRFpRY0ZYSEU5dU1MQmFPd1JuaGZE?=
 =?utf-8?B?THl2M1pjVmNOaVMyc3lZdFF2R0JpQ2VwU1d3TWJ6VWFrNzJIOVlBcXR2V3Y5?=
 =?utf-8?B?bEJwUkJtUW0zSEdDSUF4TERySXJxbDhVcVN0WG91Vy9TWTQ2Z05VU3pER0d6?=
 =?utf-8?Q?oDno=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5753.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 348cc29a-774d-457b-c27f-08dd8d304719
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2025 06:27:44.6889 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Igcop076lrIrWA78BMIo1JV45Q4j+X/Md1ziWSM4tnuYk1C0ly/cUTwMy0Q0FOykpnIK+s+vuQqVxf5C1y8l+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6758
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

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KUGluZyA/DQoNCk5vdCBwaWNrZWQgeWV0IHdoaWxlIHBhdGNoZXMgcmFpc2VkIGJlZm9yZSB0
aGlzIGFyZSBtZXJnZWQuDQoNClJlZ2FyZHMNClN1bmlsIEtoYXRyaQ0KDQotLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KRnJvbTogS29lbmlnLCBDaHJpc3RpYW4gPENocmlzdGlhbi5Lb2VuaWdA
YW1kLmNvbT4NClNlbnQ6IFR1ZXNkYXksIEFwcmlsIDI5LCAyMDI1IDEyOjQ5IFBNDQpUbzogS2hh
dHJpLCBTdW5pbCA8U3VuaWwuS2hhdHJpQGFtZC5jb20+OyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnOyBEYW5pbG8gS3J1bW1yaWNoIDxkYWtyQGtlcm5lbC5vcmc+OyBQaGlsaXBwIFN0
YW5uZXIgPHBoYXN0YUBrZXJuZWwub3JnPg0KQ2M6IERldWNoZXIsIEFsZXhhbmRlciA8QWxleGFu
ZGVyLkRldWNoZXJAYW1kLmNvbT47IFR2cnRrbyBVcnN1bGluIDx0dnJ0a28udXJzdWxpbkBpZ2Fs
aWEuY29tPjsgUGVsbG91eC1QcmF5ZXIsIFBpZXJyZS1FcmljIDxQaWVycmUtZXJpYy5QZWxsb3V4
LXByYXllckBhbWQuY29tPg0KU3ViamVjdDogUmU6IFtQQVRDSCB2Ml0gZHJtL3NjaGVkOiBmaXgg
dGhlIHdhcm5pbmcgaW4gZHJtX3NjaGVkX2pvYl9kb25lDQoNCkFkZGluZyBEYW5pbG8gYW5kIFBo
aWxpcHAuDQoNCkNocmlzdGlhbi4NCg0KT24gNC8yOS8yNSAwODozNiwgS2hhdHJpLCBTdW5pbCB3
cm90ZToNCj4gW0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRp
b24gT25seV0NCj4NCj4gUGluZyA/DQo+DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+
IEZyb206IFN1bmlsIEtoYXRyaSA8c3VuaWwua2hhdHJpQGFtZC5jb20+DQo+IFNlbnQ6IFRodXJz
ZGF5LCBBcHJpbCAxNywgMjAyNSAzOjU1IFBNDQo+IFRvOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnOyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogRGV1Y2hlciwg
QWxleGFuZGVyIDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPjsgS29lbmlnLCBDaHJpc3RpYW4g
PENocmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT47IFR2cnRrbyBVcnN1bGluIDx0dnJ0a28udXJzdWxp
bkBpZ2FsaWEuY29tPjsgUGVsbG91eC1QcmF5ZXIsIFBpZXJyZS1FcmljIDxQaWVycmUtZXJpYy5Q
ZWxsb3V4LXByYXllckBhbWQuY29tPjsgS2hhdHJpLCBTdW5pbCA8U3VuaWwuS2hhdHJpQGFtZC5j
b20+DQo+IFN1YmplY3Q6IFtQQVRDSCB2Ml0gZHJtL3NjaGVkOiBmaXggdGhlIHdhcm5pbmcgaW4g
ZHJtX3NjaGVkX2pvYl9kb25lDQo+DQo+IEZpeCB0aGUgYmVsb3cgd2FybmluZy4NCj4gc2NoZWR1
bGVyL3NjaGVkX21haW4uYzozOTc6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBzdHJ1
Y3QgbWVtYmVyICdyZXN1bHQnIG5vdCBkZXNjcmliZWQgaW4gJ2RybV9zY2hlZF9qb2JfZG9uZScN
Cj4NCj4gUmV2aWV3ZWQtYnk6IFR2cnRrbyBVcnN1bGluIDx0dnJ0a28udXJzdWxpbkBpZ2FsaWEu
Y29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBTdW5pbCBLaGF0cmkgPHN1bmlsLmtoYXRyaUBhbWQuY29t
Pg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jIHwgMSAr
DQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4NCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jIGIvZHJpdmVycy9ncHUvZHJtL3Nj
aGVkdWxlci9zY2hlZF9tYWluLmMNCj4gaW5kZXggYmZlYTYwOGE3MTA2Li41Y2QyOWU5MmIxMzMg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jDQo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jDQo+IEBAIC0zOTAs
NiArMzkwLDcgQEAgc3RhdGljIHZvaWQgZHJtX3NjaGVkX3J1bl9mcmVlX3F1ZXVlKHN0cnVjdCBk
cm1fZ3B1X3NjaGVkdWxlciAqc2NoZWQpDQo+ICAvKioNCj4gICAqIGRybV9zY2hlZF9qb2JfZG9u
ZSAtIGNvbXBsZXRlIGEgam9iDQo+ICAgKiBAc19qb2I6IHBvaW50ZXIgdG8gdGhlIGpvYiB3aGlj
aCBpcyBkb25lDQo+ICsgKiBAcmVzdWx0OiBlcnJvciBjb2RlIGZvciBkbWEgZmVuY2UgZm9yIHNj
aGVkdWxlcg0KPiAgICoNCj4gICAqIEZpbmlzaCB0aGUgam9iJ3MgZmVuY2UgYW5kIHdha2UgdXAg
dGhlIHdvcmtlciB0aHJlYWQuDQo+ICAgKi8NCj4gLS0NCj4gMi4zNC4xDQo+DQoNCg==
