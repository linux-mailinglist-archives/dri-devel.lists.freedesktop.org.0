Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A48A5A542
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 21:47:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0007810E2B9;
	Mon, 10 Mar 2025 20:47:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="R2LcvvmL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2065.outbound.protection.outlook.com [40.107.244.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D56CC10E0DD;
 Mon, 10 Mar 2025 20:46:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YvPln2rj4uwkb77/hL0C1xExJ+tGOYkoBe9z3tAhKSx8n4b5BC7o9hmrwT8rhM5zqu3MJtO9dWunWp3FlrhOhXTGt0EXQc1n7KxL7iTxvhzPu++35G45d6/V4kCktkojBTcUpyPoEBeZuoZhh9+AXpFfA0aVuI/63AF8msRdxMAKxRB3kg04N+Q4z7TW6nK0NJXVSk1xCIO68tWxqX60dZmhN6dUF4Ut/qGCDVkm9rQ5Sv0DzALGDh+NK3XvWjOYnHNgvVVCGjwUZVL4MFHQ+nlh+KECuzcZHoUqt0VKQOxwryAMB+xlzTPO18r10iWKhyyr9BhjsCJ1sVBP14DN2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XdrijJD753GCwDPX9147OiQx2Xa+YMexc2UdWbBkbLk=;
 b=OwJlYRn/yppSnmLCG4Rv8Qr9AzEOhAjxuiTNWqVDDdCnt+B5yCSSGMfEdWHLFEWTVFSk5OeTERWO/ukAWW20lDsQqzebjiOxy9rARJfnzfeaQhGvDspqru7xcEPRvZNkTahjiOmCHPx1i5C7wgPDZMrELxQnBlcEyW7fEHL0ltzAURyMSCKP34JQOdv4Po2c1PEHqEZelYpDHXOUZM4Zg51kW1mTH3Wo8Y/oPuQOP9gaCtnrbHuMaNjvqq8m09X0HGXt1KRivvqvld1cpcHyaARK34thQl09U0i3243UVpTFKsfm4WIYdwAb39bRI+jhnECSTx80IKqgg9I2XjsNSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XdrijJD753GCwDPX9147OiQx2Xa+YMexc2UdWbBkbLk=;
 b=R2LcvvmLQo2VeqP8HMGANStgujTun+U8gAxj7WB+Rw9LDK0WxV7NZm2uBIZA+uMMQGUIell8xWBQvFHaXlspr1rrigTwLsmykLavGd5eeG/bzQnvUHCZVT9+VuKdx7TXowAVR8CbA2KVjXRI78CLpdHQIRn5vmBt+gLw+RGO3JfshoVL6apFmSccnAdW8makX4QDdxfYE71BkVmQbVE6oAbPIpgSBjH9U23I3vij4KXSotO598C/veHZ7W+F14qo2379G1brGyQCwvgBLOTxDpQuAAutPmDYto6cvpq1LL6I53lY6WLaMH5crfIPqPC+i5s38uHGHJbrqgVwKTvcfA==
Received: from IA1PR12MB6531.namprd12.prod.outlook.com (2603:10b6:208:3a4::7)
 by DS0PR12MB7607.namprd12.prod.outlook.com (2603:10b6:8:13f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.22; Mon, 10 Mar
 2025 20:46:43 +0000
Received: from IA1PR12MB6531.namprd12.prod.outlook.com
 ([fe80::782a:dd11:178:2784]) by IA1PR12MB6531.namprd12.prod.outlook.com
 ([fe80::782a:dd11:178:2784%6]) with mapi id 15.20.8511.026; Mon, 10 Mar 2025
 20:46:43 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "tmgross@umich.edu" <tmgross@umich.edu>, "bjorn3_gh@protonmail.com"
 <bjorn3_gh@protonmail.com>, "benno.lossin@proton.me"
 <benno.lossin@proton.me>, John Hubbard <jhubbard@nvidia.com>,
 "gary@garyguo.net" <gary@garyguo.net>, "a.hindborg@kernel.org"
 <a.hindborg@kernel.org>, "simona@ffwll.ch" <simona@ffwll.ch>,
 "airlied@gmail.com" <airlied@gmail.com>, "boqun.feng@gmail.com"
 <boqun.feng@gmail.com>, "dakr@kernel.org" <dakr@kernel.org>,
 "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>, "aliceryhl@google.com"
 <aliceryhl@google.com>, Ben Skeggs <bskeggs@nvidia.com>, Alexandre Courbot
 <acourbot@nvidia.com>, "ojeda@kernel.org" <ojeda@kernel.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH RFC v2 1/5] rust: add useful ops for u64
Thread-Topic: [PATCH RFC v2 1/5] rust: add useful ops for u64
Thread-Index: AQHbjQ0N2418v441CUG2W2IEFToPobNs4PWA
Date: Mon, 10 Mar 2025 20:46:43 +0000
Message-ID: <ab9b34381f6d5889e978bef352b923455b475ae6.camel@nvidia.com>
References: <20250304-nova_timer-v2-0-8fb13f3f8cff@nvidia.com>
 <20250304-nova_timer-v2-1-8fb13f3f8cff@nvidia.com>
In-Reply-To: <20250304-nova_timer-v2-1-8fb13f3f8cff@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR12MB6531:EE_|DS0PR12MB7607:EE_
x-ms-office365-filtering-correlation-id: 2106d639-fd64-4b2e-4da6-08dd6014aab7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|921020|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?ZEFxRTFkSGRTUmRMQml0YTJhakZxNE9sZGNZTS9WOGdOSzJKWlVBMG5EdVN3?=
 =?utf-8?B?dGJmcGpiU0ppYWF1cjhyZjAwRG9aZTN2dmZOeXZ3ZkFmcHVDMkJneUl2ejlv?=
 =?utf-8?B?eXErMXljdlZGbTNKbklqQUh6dkp1Z1B1QWRCdXVMNjNEV1FFcjBNWjExS2xX?=
 =?utf-8?B?OUx0UEZieXY2QkZOWmlGQ05pMU01Ky9SbXFMY0dyWDBUUEQ4YU1wUXVJaTEv?=
 =?utf-8?B?VUxHbURad0ovR3VJSHBDR01FQis0NDcvYnZJdW9xMjN1U2d0T3EvNTkxa29O?=
 =?utf-8?B?UFZpM0NWMEoxL2xyRkVzU1d3SzV3VVV1WUxVS1cvVkJOUFVseHB5YzNrTExH?=
 =?utf-8?B?NXBPZnMxMVFQc0ZwODFzbDBOTy9ad21QVDlVYW1ROEZvdnZKd3FDdWFQYS8v?=
 =?utf-8?B?V3BnemEwR25zMnJoSWxBWnc5SVlTYWZMMFdJUU16WWlZK0phMDRvNkhxU0hL?=
 =?utf-8?B?eW5GV0lsaE0xd1ZTSGM1V2FYWlJhQ2NMS1Q0aFBQeWdDc1l5WHNqU1ZtWmFH?=
 =?utf-8?B?Skw1cjRqYlU0aTlWbmY5Z0ZKbFBGQXM3OUx0UVlBTitsYndVZTR1eUZXK05z?=
 =?utf-8?B?NFlSdEpSTU5XY0ZVY01TTGxiSmxUODdmUzh3UDFhcWtXYXdoS2lsdnIvdEw2?=
 =?utf-8?B?Qy81T3NJYW56SWdQK2VzZWZsTnR3eHVDUEVacDlSMStSWXF2NEFsWHdEMmsy?=
 =?utf-8?B?QTh4UzZqZlMzNGVrT1FoYm51TlpHei9NZFJITjk2amNUZDFseTIyNVlvNUU1?=
 =?utf-8?B?cER6ZFFjTm96c1pKNjhKZXVzYlIrb0YxS09VNXIyNGJCY3BRWi91OHlDVFJa?=
 =?utf-8?B?WFZNdDZybm9LeHROOTlMd2k3L0J6b0ZLODhiZng3QzFZcTdsayt1ZXR4bExF?=
 =?utf-8?B?Z0pBRmxLMmlpS3hkelJxT09meUdXMzYwb3dPbTl0Q21NeFIvWXhQanlCaDF4?=
 =?utf-8?B?ekY5emFtQWZqY3U2ZUxOQnRuOGUzY2NsdzR1ajI5WEJGeVJYemlVK29xbDg5?=
 =?utf-8?B?ekZacGNRWFNOeFBDdHNDOG1KK3JOdXdJanJsaEY2enhWUmR4SW5QZlUxNzd2?=
 =?utf-8?B?TS9nSllnMlZzZ2xKdTVvY1VaMGtTVUo3Z3FOSVVzUDFHQk4wdUxuTU1OVXBJ?=
 =?utf-8?B?cDFrMFNPbWdBQ3lYN01JdmRobHp2L2pLMkM4YXRlTXdDR3Vrb1JkYUlDWHhZ?=
 =?utf-8?B?Ky9EUUdxZ1ZhWkZjaDhyNmVoZ3Z3QTlWcGZkWXlvMzJrOE1PSkJvQ2VwVEVx?=
 =?utf-8?B?VC8yUkxZTlBUcmFDMjhCamc2YjFDcWkza29sTm1pTVRXWGNhdG5lNFRmNGtv?=
 =?utf-8?B?RDBLcmgzOGtqNGl2YUJTNXNrOVMyTHA3c2ZUWFg0SVJZb2lYUzBRcG1Eank3?=
 =?utf-8?B?UVI5SHM5Rlp2TmlSLzlJQjlOd1FXaWNnUGx3Q243dWFXYkV3Z01NeDNtOHdE?=
 =?utf-8?B?b21XKzN5eTBHdmZFVUlOMXdMWlg0bm5NRVB2cVlyNnBFTXh4UjVkMGFZc2o1?=
 =?utf-8?B?Y2E4bjVSbm5ROUMvYy9QbXhMR2VHcktiZnJjbVd4M2ZVUGpzcTlVd203Sk1V?=
 =?utf-8?B?ck0vMlhnV2pDakludjYzcGM5dFY1TFJCZjdrZHRJcW9RY0dVS3gyZlJrdkVP?=
 =?utf-8?B?YzZYL2tNWEM3MmZZbHczd25VNmFoMVRZUS9hRjJyUHloRHFMZnhCaXRPcGlE?=
 =?utf-8?B?YytIeDd1NmlkRmdLSjEzcU5vcVJXSWxlNTkrbmRNVE42NnpqU0FTaGRVTkVj?=
 =?utf-8?B?eGQ0cHd6azZoZ1VpMm9wdUo5d1UycTJEZzVkRHAwRHBDWC9XWkE2NXJOM3o1?=
 =?utf-8?B?bSttemJYc2ZmYWxrUWV2QWhjeDlLY0d0SDRNRDBmVzRqWVNwZkt0aGdNWEp0?=
 =?utf-8?B?TGhZMmpuUlhTYTg5N21KejdzMG5CTWVac3EzWC9aYTBCWTN1aEJ6c1UvZ2ZT?=
 =?utf-8?B?WlpTdlNQZlkrZ2FPQWlBRDlLNnlnTlNOMWNTbEk1MHQzVktVcmp1UlRNMWRN?=
 =?utf-8?B?K3NkSjFyMXFBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB6531.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eExoQ1lEaklMNTNKMzVSemFSMWJZWG81b2JPSkw3UlgwQ0xkTW5MbFFXNVVM?=
 =?utf-8?B?NThNY1FrK01pUkJuaEZLcldNQlhsMG9ldTJubFp6cmczUUdPaGlFdVhEV1Fm?=
 =?utf-8?B?WERGMEZucjE1enR4MFpRSU9KelB2N0w1bTYxQXpTVTdqa2dzRDkvQmo3YmdN?=
 =?utf-8?B?UC9lTWJ2MHFSUGg1VVQ4d3huRnovVW1pMnJhRWZ4ZFpDbmFGdERJMDhZdWEy?=
 =?utf-8?B?Sm52VzBrandGMUVGcHowdTRDMjRLSlNmdHpZVHQwOE9EMGpKWGdPZGM4d2ZD?=
 =?utf-8?B?eStwMVVFeVcxYjBWQXhocVdZVGZmdVAwYjQxdzBHaXVxOGY3MTVrOVBWTXc2?=
 =?utf-8?B?c3ZIUmIweVBBQ0E5eGlBL1BUZVNrSEp4RG5Lei9oeDVEWU9zMXNKRmIvRUoz?=
 =?utf-8?B?SzkxWGlHWS9KL2JYU2h6aTNuVmFPeFNwMG8rZEg4SmxoUUhrRm9xTFhUVFkv?=
 =?utf-8?B?YldYd3VlM1JIczA5bFd3VWdOU0JpVGVKWFBsbkRhaU52STdKNGMvUVM2WDgr?=
 =?utf-8?B?V0tSYjBic2oxcmFranFlTVlBN0RPWFFWYnpBM2R5bk9MYmwwZ1pSS1pqUks0?=
 =?utf-8?B?OGZ3YjRYTEdwcEFTZ3RjdjFNckZMRmdXVHJOM0IrRE9JY3RJRC9vL1NqeVdx?=
 =?utf-8?B?QS8wZk9GWVN2dG1UMGt3RWdqYW50Q2R4anpNOTZFWmlndTF3RjU0TXQzbWJi?=
 =?utf-8?B?M09iWlgyVE9TbXJ0aTNIRnVmQnpqaXBwblQ3bFRaOGpSTWZ1M3hrZElWczRo?=
 =?utf-8?B?MnhQK3pLYVFTY2lUWCt6TndROUkrcjFsU1NTSWI1Qy95bWkrNVgzU1V1NWto?=
 =?utf-8?B?RTZ0TlA5VUZQMXlvVng4aGZMSXRDUFZReHU2UjUrWFpZWm1XNmZQTVpTVEZz?=
 =?utf-8?B?SjMreW84RS8rVkVHSWNPTlBlWnpOWE1hcmM3dGlndGpSMmFsUmYzc2FKTUZJ?=
 =?utf-8?B?SmR5cVJrMm9TL0V1TENlVlh2ODJhQkl5a3p5STBuTU1jZGxaUEcra0VSL1NS?=
 =?utf-8?B?eXpKbzFtbWxCbTRhR3UxWUF1VzNkYkk2cjNKSDB4Z0dIT3NMMnlXRTNVcXVp?=
 =?utf-8?B?dXM0ZHVZMk9wOHVuMDl6OEV4cUhVZ1cyMkJ2ZCtEUDlnWkRaQnl1cE93WXNu?=
 =?utf-8?B?RDRnejZJYnd3Z0ZsVXFaTXJoVCtKcjVqMkVvWXdxdE9OL3BNd1FOTWxma2ZF?=
 =?utf-8?B?TjNBYXlkYm9ITW1qZjUrRk5tRnNLd1dHRlVtM2FMSjM1UTNVTzhMNnB5ZVJt?=
 =?utf-8?B?RTdQL2tsTzZIWFdia2VjbDNjZWM1OUVKNmtyb1V5U0d6ZnJJSi8yRVZmVXNX?=
 =?utf-8?B?aW1MTUNnNXFEZzA3RGwzMXZGTjBoRFMxaFFjQ2Z3L3grTW5TVmhpSkVHU0FI?=
 =?utf-8?B?NTZ0NDRNbm1vWHY3eXBuNk1KUVJhQzVxVWR5NDdNemp0MUtPNmZSaEZ3TWVl?=
 =?utf-8?B?aStCenVUalJONGFCK3RLQnpkdFJJczJ4ZjFzUUFMbXg3dzhyd3g0Vklua0pH?=
 =?utf-8?B?cHZhM2dBTGh3WUZ2SkhrWXNTcjJLMWFER0h3VmM1bzhUYS9lVmFUaGJKR0lH?=
 =?utf-8?B?SEdPMjNueXpaMUdKZW1kRWFUV3RLMEpGOU1hdHU4U2VyYWZ2NlYzUENGaHp3?=
 =?utf-8?B?dldjSjdFQWZ0ZDYvL25KUERWaGZ6WUdTM2ZwcE15WHFyOWs3UlpQL2RQd3Bz?=
 =?utf-8?B?UWU5YVpkcDh6UUk3MCtXOS9wMjA5NS9Id3lWWlVoS1daanJTWnNmRFoveWJz?=
 =?utf-8?B?SHdzMFhZd3ZNc0pwMXBmWnZNdTdQRGVxM3NIT3ArNmJsU21ybGl4T0ZQOW00?=
 =?utf-8?B?T3V4WW9hTUl1dXJPNVlKVElXN08vT2RMalBVZUdzNUFkMXhmeTFRRUZuSVMy?=
 =?utf-8?B?cW4zU0JjSjhOVTNuU1g3N0R3ejdUL2U4RTR0TmN3b0RsdEdYS2FuYXhFQ0hB?=
 =?utf-8?B?ZnM2OWcyWXJIVk9XVVBzeEVoRCs2Ry82QUxZSnFoYTN5NVpVTTFFdWVocUJT?=
 =?utf-8?B?RkxseERtVTkraW4rUEdleWVWNmM5Zm5UM2d3T0dkUGhRQ0UyNUNpYUE5OG1h?=
 =?utf-8?B?bTBBRXNyNTFRemZtZThmb0hVQ2RqaitabHR2NUdacSs5VzlKN1RoMXhBYXNQ?=
 =?utf-8?Q?sZkWDebK6UW7cgryB+hK3Vqc+?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E718EB86B2F38941AC950DB660BB8504@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6531.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2106d639-fd64-4b2e-4da6-08dd6014aab7
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2025 20:46:43.6131 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0Dr8Ap7jYUX8qs3bs8xzeToWbGXNmIUcPtGh2HFHEmVNryLoR2dgz3GhD56Z3iDSbKfACy0bFY87/vS1w8DTqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7607
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

T24gVHVlLCAyMDI1LTAzLTA0IGF0IDIyOjUzICswOTAwLCBBbGV4YW5kcmUgQ291cmJvdCB3cm90
ZToNCj4gKy8vLyBVc2VmdWwgb3BlcmF0aW9ucyBmb3IgYHU2NGAuDQo+ICtwdWIgdHJhaXQgVTY0
RXh0IHsNCj4gK8KgwqDCoCAvLy8gQnVpbGQgYSBgdTY0YCBieSBjb21iaW5pbmcgaXRzIGBoaWdo
YCBhbmQgYGxvd2AgcGFydHMuDQo+ICvCoMKgwqAgLy8vDQo+ICvCoMKgwqAgLy8vIGBgYA0KPiAr
wqDCoMKgIC8vLyB1c2Uga2VybmVsOjpudW06OlU2NEV4dDsNCj4gK8KgwqDCoCAvLy8gYXNzZXJ0
X2VxISh1NjQ6OmZyb21fdTMycygweDAxMjM0NTY3LCAweDg5YWJjZGVmKSwNCj4gMHgwMTIzNDU2
N184OWFiY2RlZik7DQo+ICvCoMKgwqAgLy8vIGBgYA0KPiArwqDCoMKgIGZuIGZyb21fdTMycyho
aWdoOiB1MzIsIGxvdzogdTMyKSAtPiBTZWxmOw0KPiArDQo+ICvCoMKgwqAgZm4gdXBwZXJfMzJf
Yml0cyhzZWxmKSAtPiB1MzI7DQo+ICvCoMKgwqAgZm4gbG93ZXJfMzJfYml0cyhzZWxmKSAtPiB1
MzI7DQo+ICt9DQoNClRoaXMgZ2VuZXJhdGVzIGEgZmV3IHdhcm5pbmdzIHdoZW4gSSBidWlsZCBp
dDoNCg0KICBSVVNUQyBMIHJ1c3Qva2VybmVsLm8NCndhcm5pbmc6IG1pc3NpbmcgZG9jdW1lbnRh
dGlvbiBmb3IgYSBtZXRob2QNCiAgLS0+IHJ1c3Qva2VybmVsL251bS5yczoxNTo1DQogICB8DQox
NSB8ICAgICBmbiB1cHBlcl8zMl9iaXRzKHNlbGYpIC0+IHUzMjsNCiAgIHwgICAgIF5eXl5eXl5e
Xl5eXl5eXl5eXl5eXl5eXl5eXl5eXg0KICAgfA0KICAgPSBub3RlOiByZXF1ZXN0ZWQgb24gdGhl
IGNvbW1hbmQgbGluZSB3aXRoIGAtVyBtaXNzaW5nLWRvY3NgDQoNCndhcm5pbmc6IG1pc3Npbmcg
ZG9jdW1lbnRhdGlvbiBmb3IgYSBtZXRob2QNCiAgLS0+IHJ1c3Qva2VybmVsL251bS5yczoxNjo1
DQogICB8DQoxNiB8ICAgICBmbiBsb3dlcl8zMl9iaXRzKHNlbGYpIC0+IHUzMjsNCiAgIHwgICAg
IF5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXg0KDQp3YXJuaW5nOiBtaXNzaW5nIGRvY3Vt
ZW50YXRpb24gZm9yIGEgZnVuY3Rpb24NCiAgLS0+IHJ1c3Qva2VybmVsL251bS5yczozMzoxDQog
ICB8DQozMyB8IHB1YiBjb25zdCBmbiB1cHBlcl8zMl9iaXRzKHY6IHU2NCkgLT4gdTMyIHsNCiAg
IHwgXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl4NCg0Kd2FybmluZzog
bWlzc2luZyBkb2N1bWVudGF0aW9uIGZvciBhIGZ1bmN0aW9uDQogIC0tPiBydXN0L2tlcm5lbC9u
dW0ucnM6Mzc6MQ0KICAgfA0KMzcgfCBwdWIgY29uc3QgZm4gbG93ZXJfMzJfYml0cyh2OiB1NjQp
IC0+IHUzMiB7DQogICB8IF5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5e
DQoNCndhcm5pbmc6IG1pc3NpbmcgZG9jdW1lbnRhdGlvbiBmb3IgYSBmdW5jdGlvbg0KICAtLT4g
cnVzdC9rZXJuZWwvbnVtLnJzOjQxOjENCiAgIHwNCjQxIHwgcHViIGNvbnN0IGZuIHUzMnNfdG9f
dTY0KGhpZ2g6IHUzMiwgbG93OiB1MzIpIC0+IHU2NCB7DQogICB8IF5eXl5eXl5eXl5eXl5eXl5e
Xl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl4NCg0Kd2FybmluZzogNSB3YXJuaW5n
cyBlbWl0dGVkDQoNCg==
