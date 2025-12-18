Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4C3CCDD1A
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 23:34:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E88410E477;
	Thu, 18 Dec 2025 22:33:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="QlwdjyjB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010056.outbound.protection.outlook.com [52.101.85.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29FE110E477;
 Thu, 18 Dec 2025 22:33:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=giNrzXyLIPzK2C7cqC4dYBxWX1kw6oeN8cj/BAAgAfbEYCAKOmkkrx8cOdxnSVQJ3xgrYNWr5AdHKpq+YdqVWGjVpKEWTC9AZj1s5HBeeZ46wRDA9njHL3R2buOzgP/kAvYtmsoD1hf4uKyf1Vrz741nm+hfwqLQB6c/lUp/UBlXeLBT/2w99Y98Ps67u+I86my5I0S0UNR6YVa8wEgS0gNja/k2vdYmAN2J66GVvgivpGpNgtI+wOPcfmKNDrJKPBtE2iZfSmohhCnRl4CnwVBs3JnFVoJrk/IaKTnkNWUL4NYBB0OXcIt4J1vwloSwpqLuLbMDQ5GQ1EMN7aA8BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9HT60pXaXBzhuSnAVNW5DGA59mAQgQwuloaLv6txFSM=;
 b=nkS6DNP3ZgKDEbVWPwe0WqaXyYXNFuY3LqRVmnyynJavGVmXNM2RzAly5Fq49oDWRUO0GMk5uJBhXWWa/7fj2IDzNJ8Lvxhz5o9o4kepUplFEpWi1FfnJ7hH3Coba2NBEy+1WTbdVb693cRK9maKdxxvuxT94lYXRkbI+YwkNi5EPWfGa3P6KKTFwOkqFFVwvlth/j2wPRn6QbQmKRTiYyR1cshuVQ6ktfpE2vmkw/tQ9xQnt0dM+XL5ESVSSzfWd4e/cncSoJALLbGK6mbUbqJIa9dwZi9bhMhWwltPGEaLitrm7YgKVd7vp/0jrur7egVOpW9TXErZi+GGxD/Srg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9HT60pXaXBzhuSnAVNW5DGA59mAQgQwuloaLv6txFSM=;
 b=QlwdjyjBSqtgZ2u/QmHlBTsGO3Mk5zI8iA+6uyF0csxZr8evB02P3KiSNZU06iy/AWHvYup+DHEE2qCwjUEOqmojZRtqjpM+5hKvgY+jdHAOZ8qVGenKdYnSdKNOq0/FpHGmrsuq7hXtijv8aceNn4DxFnjArOA1Wd/Ee1Jvu3OB/N42PlncNLlRYOnAQH6zUC2pxFtJhGp4stcP6KdyKKSzhmwz8wKGJSgeNlsxOVYCT7xaJsExrFJ3XP0kBE/eVYd5dryC8WlCi8FF1c1dHxgYat8b1jpLj6Yar/1BqHGtl+aDEu39CZflW3kWssKjkBX0Ddue4MgMoA9aRuay1w==
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com (2603:10b6:a03:4c8::10)
 by DM4PR12MB6207.namprd12.prod.outlook.com (2603:10b6:8:a6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Thu, 18 Dec
 2025 22:33:52 +0000
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50]) by SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50%4]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 22:33:52 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>, Joel Fernandes
 <joelagnelf@nvidia.com>
CC: "dakr@kernel.org" <dakr@kernel.org>, "lossin@kernel.org"
 <lossin@kernel.org>, "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>, "ojeda@kernel.org"
 <ojeda@kernel.org>, "simona@ffwll.ch" <simona@ffwll.ch>, "tmgross@umich.edu"
 <tmgross@umich.edu>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, 
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>, Eliot Courtney
 <ecourtney@nvidia.com>, "aliceryhl@google.com" <aliceryhl@google.com>,
 "kwilczynski@kernel.org" <kwilczynski@kernel.org>, "bhelgaas@google.com"
 <bhelgaas@google.com>, "gary@garyguo.net" <gary@garyguo.net>, Alistair Popple
 <apopple@nvidia.com>
Subject: Re: [PATCH 6/7] gpu: nova-core: send UNLOADING_GUEST_DRIVER GSP
 command GSP upon unloading
Thread-Topic: [PATCH 6/7] gpu: nova-core: send UNLOADING_GUEST_DRIVER GSP
 command GSP upon unloading
Thread-Index: AQHcbkrHgnYQZUlgYEmrrqFJzoQGx7UkZ8AAgAL/6ICAAJiHAA==
Date: Thu, 18 Dec 2025 22:33:52 +0000
Message-ID: <1369611d0014a4e5b630462d66790939b0f564c0.camel@nvidia.com>
References: <20251216-nova-unload-v1-0-6a5d823be19d@nvidia.com>
 <20251216-nova-unload-v1-6-6a5d823be19d@nvidia.com>
 <C890CCBB-76C0-4E70-A7B8-846E34DABECE@nvidia.com>
 <DF1DLWE9OOR6.2P43ATQYNAU3A@nvidia.com>
In-Reply-To: <DF1DLWE9OOR6.2P43ATQYNAU3A@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR12MB7943:EE_|DM4PR12MB6207:EE_
x-ms-office365-filtering-correlation-id: 62bc6ab4-badc-4623-0fab-08de3e8585b3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?V29LdHJWY1N0WkJFRUwrWXVnTWZoRnRTSGxVZmRtcy9Oc05odithS2VTVUlt?=
 =?utf-8?B?NUNzT0FteVpJRFJmQUtoOTBlQTcyVmZWNGV4RWkrWWxGQnRTc0VHY1kwbG0r?=
 =?utf-8?B?dHZmYlJ5NEN6Y3JISEQ4cDFrR3JnQVZseWdiK2dqWEliTUIwTEpCOXowY1RS?=
 =?utf-8?B?d1Z6QXVUUW9vVEtveStramtxclJaWHhYbFgyaklGRGRUNDRPbU8raytTdHJY?=
 =?utf-8?B?V0h0MjFZUFpMMWtkNzFmeDY4c0JmV2dkVHAvRC9hakEyUmp1b1VlNHZTTE5R?=
 =?utf-8?B?enhMdWJZQUJlRkRBTFBnZ3N4MC9kaGQvRm5GZ2FsWTVycDlPcS9Ld1MrNHJG?=
 =?utf-8?B?VXZncnBoZFowdDBPTTdmRDlJVVVZVC9DdGRBcmM0WFlISnRZa1kwYWRra2RE?=
 =?utf-8?B?SytCcVNEdnliKzc5THh6ei9Yck5aRXF2aW85T3RqYVRsc3daQzZWbHlWeS9C?=
 =?utf-8?B?c0ovcTZzREJyK2o4OEVwQnJVd0RXRzlSUFc2S3VQcTd1SUJNc0Y5WGV0elJQ?=
 =?utf-8?B?Yjd2VlFoY1NCUDJPZVpnWTRrekRHa2dsdzFJVjFvWjA5VTBsV0VUUWE2ZDN0?=
 =?utf-8?B?ek5QMnRZTGlTeWRqV3NDTTBYbS91a2hubHN1ZXdFNk5CT2x4R1hrSm1MODkx?=
 =?utf-8?B?dzJtMnRJK3hyTFVGYTA4ZkczS2NyRHY1U2k2WHMvNEFZQzM4QmJONXNpTU5z?=
 =?utf-8?B?OUJmQ2xERHJraVQzVTJVYlV5RTVONFpCZlZHbXFzeHZVSUdQbGRWUWlkRnVJ?=
 =?utf-8?B?TmQxbmZRSTdzZElmVk14Z2JFQlNNa1g1R0tISEhEWGN6WDdENnVLb2xpZUZE?=
 =?utf-8?B?UStxd01qT1g1NjBJRnJSYmpOTWlVMHJCRUkwVHFqNmtyc2NEL1p4d2JucU5a?=
 =?utf-8?B?eG5hRmVGd3N1MDltcDFOVmxtd25ySkxZSWZudlN5bGhLbVQ4ODVoRXFKV2oz?=
 =?utf-8?B?UWRXMU9QM2hxaDljUEdwUmY0TzFVU1pEL05sUzB4bWhuSkVpNUoweHNNRTVr?=
 =?utf-8?B?V1VWVWNqRGNCQi9SbGJNZ1VrbnpwK01teVdjMzBOSUF5WEhGVHlBbkJ5cUdP?=
 =?utf-8?B?MitrS1NSRjZYZEFsdUZPQmdwbzhyMXJTZDFmcU1CVnY4SlgxR0dnekhndzNq?=
 =?utf-8?B?eHJtUHNwSlByYVg3ZGFxc1ZsbE90ZVdGdlRwTlFzaGpyRWRHQ3ZKNjRaSW5R?=
 =?utf-8?B?SmJsbUs3NTYvZWxEVHdsa2xGeTlzNTVBRW9xMVlUVFhTV2FRSW91dkxKNmho?=
 =?utf-8?B?c0NWY1JUdUwwQlRQNE9hTVdxcHNRMXIxUkdkb0tqNjU3ZVl4dFBHZ2h0UWdn?=
 =?utf-8?B?dnVZZXV4UmlKY2NYT1JVR3I0dFIyMmJoWEc1ZEkvSFBoaDBoRFFzcmQ4LzhR?=
 =?utf-8?B?MVBKV2d0a0NFaG9lM0Q0cEFqaXhoYzIvMmd0NU5zQTBhSmlDb2dPaUJGVFJC?=
 =?utf-8?B?NjdQSWVUTmwzcUJWVnc3ZkV5Zk5kVEIvZ1dKNkJiY0Z2WkNhS2UwUDUrelNv?=
 =?utf-8?B?SFp3ZE5PU3FCcHBjRVRJcWVQNG1uUWVGTDdmTzBnVWJrUG91TVhZRVUzZmZq?=
 =?utf-8?B?OFU2QkV2QUtVMGpvUFpWckxTYXk2ZXhTYVNHdzRNdmVZU1YxZ0FOYno4NHc0?=
 =?utf-8?B?eTZvVkFuRnZEOGloNElKRTBqTTJFUWlKMHNoN2hGZXdYMmx0aWdqK3dWdjFS?=
 =?utf-8?B?U1FFQkYvMkVQMWRzZWxSVkhxc3VpbVhjakJwS21EQ1YyYi9hdmFMdHh4WVNz?=
 =?utf-8?B?SG94aGVxNjRGb3FUM3hvc3E2SnRDWUVaenBzc1RkUGNnT29oVitiUkFPaHdn?=
 =?utf-8?B?MFBIWnJQUmxnemtHd0w0K2ExRXZhTHd5N0dLT2x4SE9KZjlsTTFST3JBMG5a?=
 =?utf-8?B?WitIVjlDVVBRTzVYUUR3aU92Nkh3eW5nRWFiRlRLYmlYdkVtcnp0dEtDS041?=
 =?utf-8?B?OFAxL08xZFdNUUZCS2xXdS9UT0MwLyt3MHlXOWVxSzR4RGM2aUtwSHhzWXRm?=
 =?utf-8?B?aW5CNHhvaGhDNmxhaDgwd3BVMzhFb0tIcnZGWHAwYlRjbndRVHhBWm5RSWZI?=
 =?utf-8?Q?/mv3Xn?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR12MB7943.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RjI4Rm1tNEdCTXRmUHJ5L1h2aWl5b0llSFVJVklDd3lJeDdVR2J4M2VkZmFE?=
 =?utf-8?B?QVJuNDZTNkRCUldVS0tXVkVObjRMMWdVaTRJemN6V1RXM0pTOGVjV2xVd0M4?=
 =?utf-8?B?N3d2S2ltS0I5S0JmdGVsOGxjK1hsME5NSkc3N0htSEZsZVpuazlIYUxNK0JU?=
 =?utf-8?B?MlJaVHJXcGZYTDE2OWNWVmlRcWFhTkdPM01ydlNsTVg3aU8xUnIrRjVCeGJh?=
 =?utf-8?B?RGUrbU1WaTZyMjBWU21OMXBPN2VycXlTWmh3cUVFNEg4OVplaGkvVE5HK1Ir?=
 =?utf-8?B?MVArTlArV1V3RG5JZ3UrN25GNFU5eXc2R3o1cmw4Y0h2QjhRekwzQU1Ta245?=
 =?utf-8?B?YTVraCtrWFhnT0Z3NDRQOVNTNS9WeTZhMFQ4TDUxWS82bko5aU80MG9pQTg1?=
 =?utf-8?B?RG1aNGN2NkxSUzlEcWI5SnMrbVRNdXdnc3NVSGMwRWFRQUlZeTFJWG84dysr?=
 =?utf-8?B?MXdTSGoxNi9VNUZJcWlsMDkvSUJNRW5VSmU0MjNxRkpkSHBaVFM4WEtabnp4?=
 =?utf-8?B?dWZJRDJnZjdyWno0ai9yN0Q3WmFwM2EyaEpKSUhhUXN0NFpnTStuTENQTU9Z?=
 =?utf-8?B?ZEk4d2xTSmlFekV6ZHNkay9aZEdibTZKbFlmUlgvdnJKQWU1QzZ0cWlvbVBn?=
 =?utf-8?B?aEJZUVJIdjdpZW9DMDU3MG4zRzVTeTF3M1hHODdHZml5OXl6NjdnUWRBZXdn?=
 =?utf-8?B?WkZ0RTU5b2pETGQ4YkRYN3lFaVlqQnlONnJFK3huM0JQOHBxb2VjNG9NTGtW?=
 =?utf-8?B?T010VG1WM0JGa2tycVM2b1o2dXp3SnE4RGhRWHpIWXdwZ2laT3J0OGpsYkcx?=
 =?utf-8?B?bDlPdWxheTlwWTVlckh0N1h3WFljV1FnSS9UY2pyVEV4Z0djK1JLVkpxYjFx?=
 =?utf-8?B?M05TMFFMV3Y2NWpKV3JPdmFZOW5IYjE3NHhaN2MvVTlTVXNsYmJnOTA0K3ov?=
 =?utf-8?B?bDY4UFZnTFk1WjdwY1BqSFZ4VVI5aDNVMlZKR1dvc3BnaTZhV3QwWTl0U2RW?=
 =?utf-8?B?QlEzdFErb2VRWmM1TW15K0dNTDJsUktzNUd2ejJJcDkzSWxESXE5U0xmUzBG?=
 =?utf-8?B?NzNnZ043bTdWVFdIU0M4NzVuMzJoMm0zcmlURHBLdUtDcGZFNFhHK3QxSHRm?=
 =?utf-8?B?dlhjajBUZjFxdENZeGFreUJQaWFYRFJHYk55dEwwSmtOMjVlQTRKQ2tyN3Rr?=
 =?utf-8?B?RkRIQUQ1dWxtaFJxWHdmQmZZOHBzTEVXc3hqYkFMYVZaM1Q0b090aXpaWm5r?=
 =?utf-8?B?N20zSHhXbzgyNDliWjk3eEx5MUlHMUsrVkdYTVNUNmJzbE5tQ3VoQVZmdVp0?=
 =?utf-8?B?MnFmeGMvaXBuVmxBdkVCbkVtbHU1dDlFa1NleVVrTGRuSHNZaDdsaEVJLytH?=
 =?utf-8?B?R25TRXdxc2IwWHU1cTBwKzNxOHF0c3hVT3RVRGs1Zno1bURwL21wM2QxbzRK?=
 =?utf-8?B?THdJRUtVVXQ1emNYV2xHVFB3MHhMNUEyT1QrV2gydzlFbXZIMU1VUnJGZlox?=
 =?utf-8?B?VE5vRHZmYWZZYUx4RkxzbGZuVlVWSFp1bzZCN3ZmNy91YS8yWVBoN0xwdklV?=
 =?utf-8?B?eG43UkZ1ekJxMjhkRWNDNmh1OHFwQ0FKQXJyc3hwdUE0REQ5UjY0ZG9lSWxG?=
 =?utf-8?B?OVYrcGpuR0R4QWg3WmFZdi9OTUx1R3VraW1iNnZRdFoyZmxGRUp6dHVSTlF0?=
 =?utf-8?B?aW1nOTV5UEZqTk9MbHI1UCtsWGwzeWlTVmIvWjhTdHVsZlZRZXNpMTVJZnNm?=
 =?utf-8?B?dStCVGYzR3Y0eWVsQkZ2dCtlS3l1QUREV01pbnl1d3oxdzVXbjVXcnBpQlZD?=
 =?utf-8?B?eS9sL0lvanl5NmNDV1JLc2NUUDhsbVBNa0hTbUV2T1lINHM2ZEdBOXNKUEk5?=
 =?utf-8?B?NlB1WEMyZzh6SmlwaVlramRtV01BVWt1ZnRLL1pzVnlnTVZaTmpFem9WZ1J1?=
 =?utf-8?B?TW9CVWxUSjkwNHI1M2hhLzVyYnl6MXZPY09CUHhuWjc3TW1KRVEzdVN5VnpH?=
 =?utf-8?B?V3YvaUd6alZnMUJhZFM0SmJ6ZVpyQUFtNmQ5NldQUUJMaFlQTGxOTzlDLzlM?=
 =?utf-8?B?TDRpMG1MU3RubW1IOC9aS3VEMTRKNnJXMzBkcC9rWUVwYUNzT0hIVjFPYmdy?=
 =?utf-8?Q?rLfw96/YL3v20igO//3M/2kLk?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2B2EAE2E0E7A1D49BFDDE65D3619B486@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB7943.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62bc6ab4-badc-4623-0fab-08de3e8585b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2025 22:33:52.7577 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w9Dyc/emPCtvHJqf7fMJQzxntiJjLvax6S2JQTpvSiS10Xq2k4PxZqSTYz9T+0xclYJ5/whRWsYkbHMq4+NqDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6207
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

T24gVGh1LCAyMDI1LTEyLTE4IGF0IDIyOjI3ICswOTAwLCBBbGV4YW5kcmUgQ291cmJvdCB3cm90
ZToNCj4gPiA+ICvCoMKgwqAgbG9vcCB7DQo+ID4gPiArwqDCoMKgwqDCoMKgwqAgbWF0Y2ggY21k
cS5yZWNlaXZlX21zZzo6PFVubG9hZGluZ0d1ZXN0RHJpdmVyUmVwbHk+KERlbHRhOjpmcm9tX3Nl
Y3MoNSkpIHsNCj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIE9rKHJlc3ApID0+IHJldHVy
biBPayhyZXNwKSwNCj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEVycihFUkFOR0UpID0+
IGNvbnRpbnVlLA0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgRXJyKGUpID0+IHJldHVy
biBFcnIoZSksDQo+ID4gPiArwqDCoMKgwqDCoMKgwqAgfQ0KPiA+IA0KPiA+IFRoaXMgb3V0ZXIg
bG9vcCBjYW4gZ28gb24gaW5maW5pdGVseSwgbGV0cyBib3VuZCBpdD8NCj4gPiANCj4gPiBFaXRo
ZXIgb3V0ZXIgdGltZW91dCBvciBib3VuZGVkIG51bWJlciBvZiB0cmllcy4gQm91bmRlZCB0cmll
cyBiZXR0ZXIgc2luY2UgaXQgaGFzIGlubmVyDQo+ID4gdGltZW91dC4NCj4gDQo+IFllcy4gQW5k
IHdoYXQgd2UgcmVhbGx5IHdhbnQgaXMgYSBtb3JlIGdlbmVyaWMgd2F5IHRvIGRvIHRoaXMsIGJl
Y2F1c2UNCj4gdGhpcyBwYXR0ZXJuIG9jY3VycyB3aXRoIHNldmVyYWwgY29tbWFuZHMgc28gZmFy
IChhbmQgbW9yZSB0byBjb21lKS4NCg0KSXNuJ3QgdGhlIHJlYWwgcHJvYmxlbSB0aGF0IHdlIGFy
ZSBwb2xsaW5nIGZvciBhIHNwZWNpZmljIG1lc3NhZ2UsIHdoZW4gYWxsIG1lc3NhZ2Ugc2hvdWxk
IGJlDQpoYW5kbGVkIGFzeW5jaHJvbm91c2x5IGFzIGV2ZW50cywgbGlrZSBOb3V2ZWF1IGRvZXM/
DQoNCiAgICAgICAgICBFcnIoRVJBTkdFKSA9PiBjb250aW51ZSwNCg0KVGhpcyBlZmZlY3RpdmVs
eSB0aHJvd3Mgb3V0IGFsbCBvdGhlciBtZXNzYWdlcywgaW5jbHVkaW5nIGVycm9ycyBhbmQgYW55
dGhpbmcgZWxzZSBpbXBvcnRhbnQuDQoNCg==
