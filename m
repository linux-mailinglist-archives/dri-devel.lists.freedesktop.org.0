Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9158EB044A0
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 17:49:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 265C710E4DF;
	Mon, 14 Jul 2025 15:49:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="y0K2VibT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2084.outbound.protection.outlook.com [40.107.244.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5571D10E4F9;
 Mon, 14 Jul 2025 15:49:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H5tN2ZF2fN0HXXIvj0jy5s0rIq0TLBxiPb/y13GTRch00fNAYHdthI+CyA4XCIi9OYQW9MpA4pvQ4BxMowrwxFrsP2X1Yj1N0+oLTU73IsmbmoINw654Bnqit1nUcbHSh1ncOuoo7SjY3EaCDhznVAGdB9lB/qUmcKGcl+Wrr4QgR697hma/KfgHQ8dX2hJD9w2gQFx8ijlSSPKTyG8JgVtebRi0eHHqCT13GeBhd9zY1Kffr/IBHEuy1EzN5MFZVpu+6TK1HH6ZBP7Q5UNp7APLelIsTNqZm6jjvGWmaMI5lRmaxj3AmKHFPPogBBsSsCRFJADSNWl0SAME/+K4Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wnmw41cXhOuGPYJU9IDAxSw1/mjWF0VWRb7vJl6YxbQ=;
 b=UuTNjR9/rf8f0mozAybJDsMz8OsaPyJvUt9wGDouo79i6DfC+5L/3r2h+VrIKY44aGV4d9egg8KB85fUqJOWZFVFhITD/kgSEY80QamXxPlDWaM7PSW1RQvYBOdJi6TX27IOMjZIrWen30PXUcAQYWApi71l1yJHtJ6XviXR67glEeqKMl7bGVeJCAvm2roLlF1Vu/Qa/jAtDY58ETHATKhlBtjtmZi79smTVz0mcciN0/0LrRCvKRGtrogf/d2+HyuyMshYcD89zr4qncpt7k1IdO7261Wn0nqpf5SwxisvIPU1I+0ScxiczAt2KSpVTQzeE8a+WmB2lHk0YncNuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wnmw41cXhOuGPYJU9IDAxSw1/mjWF0VWRb7vJl6YxbQ=;
 b=y0K2VibTz6J2k6yHTC3Ei7+PshYuQPaNRw/JBDJL7C2UUggMzP7+VygRtOfR9oUiZJ0ifhaJ4LagvhBs7m0P7vBkSua8qUOFgeZh9uc/5FcXY/8k9l6XvPC9YDk8KE6Kc9nUt15jlMplM7Ms/LcqsWqWpMEW3J9B1kETPh8rjv0=
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SJ1PR12MB6171.namprd12.prod.outlook.com (2603:10b6:a03:45a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.33; Mon, 14 Jul
 2025 15:49:28 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%3]) with mapi id 15.20.8901.033; Mon, 14 Jul 2025
 15:49:28 +0000
From: "Limonciello, Mario" <Mario.Limonciello@amd.com>
To: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>, "Deucher, 
 Alexander" <Alexander.Deucher@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, Dave Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, "Lazar, Lijo" <Lijo.Lazar@amd.com>, "Zhang, GuoQing (Sam)"
 <GuoQing.Zhang@amd.com>
CC: "Olsak, Marek" <Marek.Olsak@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/amdgpu: fix link error for !PM_SLEEP
Thread-Topic: [PATCH] drm/amdgpu: fix link error for !PM_SLEEP
Thread-Index: AQHb9Jeh7iYLBsEnJ0q+oYD5dzOV5rQxt1KIgAANQQA=
Date: Mon, 14 Jul 2025 15:49:28 +0000
Message-ID: <8ed29f44-9f64-4b8a-a5f2-c8ee374df40d@amd.com>
References: <20250714081635.4071570-1-arnd@kernel.org>
 <db654178-a6d7-416c-bab6-b494a7c118ce@amd.com>
 <724b4600-d983-434a-acf6-68cd87b04636@app.fastmail.com>
In-Reply-To: <724b4600-d983-434a-acf6-68cd87b04636@app.fastmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB6101:EE_|SJ1PR12MB6171:EE_
x-ms-office365-filtering-correlation-id: cb3c2910-ac3c-46f8-e58a-08ddc2ee0414
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|921020|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?ekNINmxmMDdLbkU4RnRRN2ZHUlBXSmJoM3RxWDhwaUhWK1FEeHVkNlRhYVRY?=
 =?utf-8?B?dUN6aHFKemdvTnlNVEl2VzhvdmprbC9yU3h4NTAzYUwzVmZtaG5kSEhJVUZ0?=
 =?utf-8?B?OXp4SUxWM1lHVXpnQUdaZkM0dW9IU3VtWHg3YmJISklTSDFleDd5SHQvWC8y?=
 =?utf-8?B?Mkk5Y0xhY05FbTA2UjNFUm5FTzBOR0pHY3Avc2VKS0FtZlNyR2VGSi96b3hE?=
 =?utf-8?B?Rk5DWEhUNVRjVi9UaGYyQ2d5d2Z5U1VGV21BNU4yTGdlZWVHamNGeG9oSUZi?=
 =?utf-8?B?OHR3VTdxUXdHNkk0TFFzVERyeW55U2N4a21DaDJZWG1uL1FRNW0vQm95SENN?=
 =?utf-8?B?eW5mbkcwdXVOWDcvMnRGQ0tkMEZyaDJTN1l5T3JKQWs0Zkg1ekZkdDJpdVFo?=
 =?utf-8?B?YVFqd0VNVC81YWlCNGFUSTgwdXlJREw3T09XMUNSeUw0WDNpYjVzUVRwQkZB?=
 =?utf-8?B?SUJzYmxOOFI3aGZUaVNjc0p2bmtrelA2L2NhcGxqOFNTN0tMVEE2biszcEls?=
 =?utf-8?B?ek9mcEhzSGtjMmVscHBOSERIQlFxaW9MeXhySmUzL2VXQmllNU9pYmpKSVpv?=
 =?utf-8?B?ZFZuNXNONGFMZ2FNZHhrS21Za01nQnQxckZrV2kxSlNnZ0pnanRvZFh1WnUx?=
 =?utf-8?B?RU9JS2JvMUtuVFRQZ2VEc0hYZlVqOTQ1ak9ha0d4b0EvMGpsc1kvZnAvUGVV?=
 =?utf-8?B?bW0xYWJEOW53eElock1hU1FnOGszRzNKb01OSld1UW44T0cwVkZZM0dITnFk?=
 =?utf-8?B?STlWZmhlT2U5ODlWb0wvZ2lVWEpkYmV6aUxNWVlENHBwbFM2TEpYbGdsY2pG?=
 =?utf-8?B?bTlHSjh4eDJaS3lCV09HRWRHRThwN21vLzc2cHArdmdxM20zc2tqWUhTUnJ6?=
 =?utf-8?B?S040Zy9GNjFreENQUnFBbzB3YUUvVDM4TTZETUtub2ZPUmhKNS9mZHNOMnR6?=
 =?utf-8?B?ZXJsaEVqNnBJeW5QVnB6NzhFNDZJQzZwc05SWG1hUjBpbFBZOGFia1QydHI1?=
 =?utf-8?B?NG5zeXJiZ2NkMjljOHdqYkUrWFBrUzJLVHgxbzhpSEdPRUgzZnp5aFMrMm5Q?=
 =?utf-8?B?YmJUditPR1REU2JMSW03a1ZxRUR0WUlJYkRKai9lalFiVEpNT1JUNUEwMlhO?=
 =?utf-8?B?bCtyUG5oM3EzYStuY1J3cE9TYnl6RVNERUJDNE9qdEc1cVNuaExadGUreE5y?=
 =?utf-8?B?UGpOOVl4NDVXZHR6bitBYlVVbDJZNlNZallDVjhjU29xWWJJNTZQcDQyVjZZ?=
 =?utf-8?B?L1R6c1FzQ1I3OFpxbUFFcVpWTEMvKzRaTGpQdk5BS0xDaHh2VTA3NUVRU1ZK?=
 =?utf-8?B?TTdHZWZBRkZmNDk4TnNPTFZ3bm5wdXFIcXJKejVmandGRk1DOUxveGVLYWtI?=
 =?utf-8?B?TExyZXlnWk9JS2NYYzVualU3ZXJEcURiVnFCQ0NMSVlGL3dQRkNuWkJSQWVt?=
 =?utf-8?B?L001eTZGWXpxOU1lSHlOK1RZUFZQVWRTeVFCNXBTRzM4eVE1c2V4R3BybStQ?=
 =?utf-8?B?SUVRMUdrOHBTUkN0aXZvaCtpZVJMNjVvZE9oSm50bXhmMnpsSmh6NHAxMGtn?=
 =?utf-8?B?VTZIQ0pMVStWQWVKdGxqZ2RKcWpqZUJCK0xEN1hFUzMrZVRwaWhRVk02dmRz?=
 =?utf-8?B?SlNUZ2ZwNmdWMHM1VUxDVXpIbkJGWlpqb0FOUFlqT1ptS24ybnVzUXNQYys4?=
 =?utf-8?B?Qm0zZmhwRGtzTmdrRzdxQkJUOVFNQ25iMlVESjV5bFZNeDRaMVY1VzdPWkxl?=
 =?utf-8?B?M1VYaFgwb0VHU0hkSkRVZjZsU1RpM0wyejluTWxKbXdLQTBwTUVGbDB3THk2?=
 =?utf-8?B?WXN5RzVNcjZoWi82RlZtRlY4anVMNFJWNXRTTThMNDVOOFdLSjZDM2l0dDVl?=
 =?utf-8?B?ZGdLRUw0K2pYWFA0WVFvOWtJMmZPd0tJTG5TNmxQWlNFZzl1RGtTNGVIdmZj?=
 =?utf-8?B?ZkgzcGptNFRBNVgra2h5MkFVRnNMVzM3YUdoZjlZMUpqUUN2ak5oeCtQSm55?=
 =?utf-8?Q?JNHbeHdMDTsNIc6SBhvFKzIKITTIfk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(921020)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eW1tblpWZ1p0ZS9TNGRKdElKM3dBdUgrcThiT3FScW11dHZtRUxpSU1udDhI?=
 =?utf-8?B?bWEyTE1acnZSWVNVd1lFS1NuQ3BLekJBZ0tMS2Z0WnZyM0RXSFR3c0o3TU9h?=
 =?utf-8?B?Y2tFT2tOZGNHWjVENGtTNXZGVWlLNSsxLy9taVBROWF2Y1ZPYnVhd1ErM3JP?=
 =?utf-8?B?U0g5bFdCM1lNM1VWZ3F6cWFraGdNNEZxek4ybjB4djc1NGYycEJyQ1lKMnFE?=
 =?utf-8?B?RllhVHZwWGpGYTE5aWdzM0IwTDNtY2J2T0JaUDRRc1FjR04yOXcyR0Nma0FI?=
 =?utf-8?B?bUVWcDdjMnhYTE9KcDFmdm93TGgxbkJZWjVsUGIyM3k5NHlTTVhkcjJZd3Ux?=
 =?utf-8?B?OTBRZ1hzRHVqTVQxN0VndDZCYWRUN1l1UFlna0JjcStqWTBaTjY4WStlVm9k?=
 =?utf-8?B?NzB0TmRHNTN2YVh2dm5tL0VzM1N6ZUx6U1BPRUlZTUc4YWFRSGRFZkM5SWNZ?=
 =?utf-8?B?aC9DUGZDcHhrSlViaVp5NzFtQnFtNm1iaUQ0ZmI3VFlXdDlYamdXZW5iY0VL?=
 =?utf-8?B?UkMyNWVhMGcreFZrc0tFM2NlTEdMcFprMzh2VHhwRi9IS2pwWTBSZlJTR2ZE?=
 =?utf-8?B?TXRvRG1uNHA1alBTdVBLaThrZEVramFkSjVOMzV2Sk8zeDNsRy9BRTlhS3Bq?=
 =?utf-8?B?RG9DZkRHSTV0dnUrdloyR3RIYnA2aGZrY1ZIb21BZjIwbmRnVHJObU55UHMy?=
 =?utf-8?B?UlkvNmtUbWIwWmE3NEFlQUtXSjg0Wko2QytaWnpiR1k2MmNEWnRFS1JScm9s?=
 =?utf-8?B?WHRERVhWT3NKd09YNGIyWHc0TWtZOThwdHBXS3VRK3JDRUM0WW13REN6RHBT?=
 =?utf-8?B?Q0JtWDZ6RHpWZzZva3FnOTd2NXpBbk42dS9yMkF1VmtZR0xyY042VHVaMFh2?=
 =?utf-8?B?N1J5RjBPOC9TVUVRMVJqTERCV2k3RHpPd0RhTXg5NmdjbFozc0VHUGUrWDhv?=
 =?utf-8?B?RnRNYWNqaSszVHlQb0x1UjU2T2Z5S08rQzZoU3RYNnkvdHh2cUVNMUY0MkRC?=
 =?utf-8?B?eE5LbmxzWWdZVnlaTW5VWmd0dUNSaTVCQmdaRndEbGN1Wm5wSnJSekhicmIy?=
 =?utf-8?B?N0pOTWlNcHVwbFNXcHdzdUx3VjNKcHFiT0NmV3hMTmp6NStSMlZUSURFTlRE?=
 =?utf-8?B?L2hYVFczMWl3eExlVXFzcnZiY0Z0ZUdEcXJWeDhDbzBEZXRBRURUUXdKZ095?=
 =?utf-8?B?OTcrNmg2aWQybjdZODF1SWRXUGd1NjFmZHNlWGpwY2VjdFlBME14UkhSais0?=
 =?utf-8?B?UStQWVVDb1llbXdIeFEvUEx2RlJOVlZWWWhaQVJLMXdrRjBqL0dodlM1dDFy?=
 =?utf-8?B?VUFxZ09mbVFVQlcrTWJSeVplT1kzRTNNM3E4a0ZVUW4xdXhWNEFoK3Qwb083?=
 =?utf-8?B?dm4yamR1WEtCNHFEaVFhODhpLzU2TERjUUh0YlFzVk91UHUwNjJiUkhXRHJZ?=
 =?utf-8?B?U0lTS3BFaC91UHZiZG5XN0xQUFNKbitPY1h0R3Y3Mzh4VkNjWFc3Wm96NDQv?=
 =?utf-8?B?ME5VQ3lBRWRQMlhwWjI5UFBBSmN4V3RZVVdkc0RyVFNBcVVta0ladjQ3MTUw?=
 =?utf-8?B?dGpmYlRoNVphTHRlVWZMNVJNWkNmNGdjQmlyMGxLK0thTWVmRzFYWmJzTks2?=
 =?utf-8?B?amF6dHlTZ3RVVzR5cUcyVmhVTW55NlA3SW9UUHpaRFZnRUR6bTRXbEtwRThD?=
 =?utf-8?B?ZVFydDJOTEZjWjFuZ3p0enBWZW1OaTZqbk9lcVplNU03eVFnZWsrWmF5Y3k2?=
 =?utf-8?B?S1VRSktWMlQ1RjQ5WnJyUUxTcG1LWVpvNkdJMFc2Nm9yVU1ZeEx1Q2lCVUZU?=
 =?utf-8?B?U21LdzBtaDdIcHdZUmNmK00xM01ldExlSmxIbWZsSmtzZnhhY3ljMkwzT1hr?=
 =?utf-8?B?VGhQSlBCUytKZHdWazdpMTVURC9JVzlYc2gxdXBLL2tmSUU1OG1jNnk0VjNn?=
 =?utf-8?B?Z1hwM2Y2MTQ4eFMzbSs4aWhrT2tNbmVEbGkybTg0b0pmNUVlWmtId3R4bCtl?=
 =?utf-8?B?WUd3ZWFpUit4T0Q5VE13UUx5b3k3cGorOElKTnhhbVBhVUcwMUQ3TEVORG93?=
 =?utf-8?B?Y3l4NnFmYWkzbVBqdHVneDdjUk1OWkVrYllPbk1NRklYZmVNb3R0NVNNbmhz?=
 =?utf-8?Q?DZNM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8AD56D67DA67B743B59116BC62F80B25@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb3c2910-ac3c-46f8-e58a-08ddc2ee0414
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2025 15:49:28.2605 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ct9ufir2bO2hEB+CEH5mGWGbTwqEzbj7Xv2G068AziDo284iytk6Q2xkPM/CMZSd+N9SWAz6wXsQQdCSw/FTQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6171
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

T24gNy8xNC8yNSAxMDowMSBBTSwgQXJuZCBCZXJnbWFubiB3cm90ZToNCj4gT24gTW9uLCBKdWwg
MTQsIDIwMjUsIGF0IDE2OjU5LCBMaW1vbmNpZWxsbywgTWFyaW8gd3JvdGU6DQo+PiBPbiA3LzE0
LzI1IDM6MTYgQU0sIEFybmQgQmVyZ21hbm4gd3JvdGU6DQo+Pj4gRnJvbTogQXJuZCBCZXJnbWFu
biA8YXJuZEBhcm5kYi5kZT4NCj4+Pg0KPj4+IFdoZW4gcG93ZXIgbWFuYWdlbWVudCBpcyBub3Qg
ZW5hYmxlZCBpbiB0aGUga2VybmVsIGJ1aWxkLCB0aGUgbmV3bHkNCj4+PiBhZGRlZCBoaWJlcm5h
dGlvbiBjaGFuZ2VzIGNhdXNlIGEgbGluayBmYWlsdXJlOg0KPj4+DQo+Pj4gYXJtLWxpbnV4LWdu
dWVhYmktbGQ6IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYubzogaW4gZnVu
Y3Rpb24gYGFtZGdwdV9wbW9wc190aGF3JzoNCj4+PiBhbWRncHVfZHJ2LmM6KC50ZXh0KzB4MTUx
NCk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYHBtX2hpYmVybmF0ZV9pc19yZWNvdmVyaW5nJw0K
Pj4+DQo+Pj4gTWFrZSB0aGUgcG93ZXIgbWFuYWdlbWVudCBjb2RlIGluIHRoaXMgZHJpdmVyIGNv
bmRpdGlvbmFsIG9uDQo+Pj4gQ09ORklHX1BNIGFuZCBDT05GSUdfUE1fU0xFRVANCj4+Pg0KPj4+
IEZpeGVzOiA1MzA2OTRmNTRkZDUgKCJkcm0vYW1kZ3B1OiBkbyBub3QgcmVzdW1lIGRldmljZSBp
biB0aGF3IGZvciBub3JtYWwgaGliZXJuYXRpb24iKQ0KPj4+IFNpZ25lZC1vZmYtYnk6IEFybmQg
QmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+DQo+Pg0KPj4gV2UncmUgZ29pbmcgdG8gZml4IGl0IHVz
aW5nIHRoaXMgc3R1YiBpbnN0ZWFkLg0KPj4NCj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xp
bnV4LXBtLzIwMjUwNzEyMjMzNzE1LjgyMTQyNC0xLXN1cGVybTFAa2VybmVsLm9yZy8NCj4+DQo+
PiBJdCdzIGluIGRybS1taXNjLW5leHQgYXMgb2YgdGhpcyB3ZWVrZW5kIGFuZCBpdCBzaG91bGQg
c2hvdyB1cCBpbg0KPj4gbGludXgtbmV4dCBpbiB0aGUgbmV4dCBkYXkgb3IgdHdvLg0KPiANCj4g
VGhhdCBwYXRjaCBtYWtlcyBzZW5zZSBhcyB3ZWxsLCBidXQgSSB0aGluayBtaW5lIGlzIHVzZWZ1
bCBhcyBhbg0KPiBpbXByb3ZlbWVudCBldmVuIGlmIGl0IGRvZXNuJ3QgYWRkcmVzcyBhIGxpbmsg
ZmFpbHVyZSBidXQgb25seQ0KPiByZWR1Y2VzIHRoZSBvYmplY3Qgc2l6ZSBieSByZWR1Y2luZyB0
aGUgYW1vdW50IG9mIGRlYWQgY29kZS4NCj4gDQo+ICAgICAgICBBcm5kDQoNClRoYW5rcyBmb3Ig
cG9pbnRpbmcgaXQgb3V0LiAgWW91J3JlIHJpZ2h0LiAgSSdsbCBnZXQgaXQgcGlja2VkIHVwLg0K
DQpSZXZpZXdlZC1ieTogTWFyaW8gTGltb25jaWVsbG8gPG1hcmlvLmxpbW9uY2llbGxvQGFtZC5j
b20+DQo=
