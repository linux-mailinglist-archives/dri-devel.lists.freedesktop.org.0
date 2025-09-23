Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2C3B943FB
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 06:46:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 707CB10E09B;
	Tue, 23 Sep 2025 04:46:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="L7uPiRgx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010052.outbound.protection.outlook.com [52.101.46.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2FAA10E09B;
 Tue, 23 Sep 2025 04:46:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TY53HR5/Km+K53kPdG5Rcvz6vA0e5LdHQOy57ZGAgrfhgcnGt6EDBLD/YcILnXti8Gvu8TtxPjJQkgZPfOk4oJpkPuPujkM80wEXX2AERp10rBDc8XMW9TlRJpqpofRhdnNHLEVle+dhZrDf4lvXcsNOBbdm+zuIZ4VsCwIyFl65t77plaQ+ia/qIadt19JESMZ6o1wS4CNkSnHfmL6Xpibq+XUG0RoANv1PbxmHqkLChyERQdTINTucv03ZkZOHJbB41r/eqUo3AsIQBffNf8sV8WQRDrP2Y9phq3sFkoZbBhp9d7nDHKNODpXP7o3tDoVYlqP5CKn8vqDSbUPgKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+cAPtMvB8QatBBlY1y5trhjNhpie9Oq74salSN6gPxE=;
 b=PTjYF+3/BG9wwyEApB38yEbsnP9nOdjyqM2rrLSCw7B5ZSeFsePblu6Z4tHUpGQl7mM38jtiOTLpPzm5jvdjWCanbJ3kzft6hXErKDjZu706F4ua8RKvjb05V//n4EEyuKiKX6nf8TBAXqefR8gvD1OoFgoDGHIuoNpzll8Llaj70T+04L7huS/UbcndVySh1MXcm/Htvtz2b90TiRiKhlvGYaERU4ZF3pmRN+SKP6JddRfQOKvP5knmj81h23hMBvO7HV/GwISZ2gCkBH4x+P2TW0li1nTUCr4BW49SnyUNHpnCPekkp42OpkJKugC0rCjWKEypoxHuT8DORwo3Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+cAPtMvB8QatBBlY1y5trhjNhpie9Oq74salSN6gPxE=;
 b=L7uPiRgxmyPhXhiUxNZNk/1C2k+7dLgRYVmnfDzexd5EtCgrVYfGHetnStz26J6/UXuGyfDHTGr4rPcwUIJJdfuMigZGMj+gPrrF8+V58IF8AqH4ujHTXAPpat8xzIMoMGslP4QGY4n9SMvo/iIgsrJ3ho/dGHBi2lCyLM2pdhf4w/68qdACxoDjOUDhcdarHclFyjbBylvfU1FikJqS/7J9XhQaxFGTUVGPFpiWViF6lV5SkSK9o5zh5htcwbhrIrKwKb+K3Ik6IU84dgzlq5f9JSNPLj+DtG3wRDoiEYOwXN+ySrBUsHDVOjlsIma0lCHAZ9T/qQnpzME3uRYjsA==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by BN7PPF62A0C9A68.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6d2) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Tue, 23 Sep
 2025 04:46:50 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::d620:1806:4b87:6056]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::d620:1806:4b87:6056%3]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 04:46:50 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: Alistair Popple <apopple@nvidia.com>
CC: "gary@garyguo.net" <gary@garyguo.net>, "lossin@kernel.org"
 <lossin@kernel.org>, "ojeda@kernel.org" <ojeda@kernel.org>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>, "a.hindborg@kernel.org"
 <a.hindborg@kernel.org>, "simona@ffwll.ch" <simona@ffwll.ch>,
 "tmgross@umich.edu" <tmgross@umich.edu>, "mripard@kernel.org"
 <mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, John
 Hubbard <jhubbard@nvidia.com>, "bjorn3_gh@protonmail.com"
 <bjorn3_gh@protonmail.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "aliceryhl@google.com" <aliceryhl@google.com>, Joel Fernandes
 <joelagnelf@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>, Alexandre
 Courbot <acourbot@nvidia.com>
Subject: Re: [PATCH v2 07/10] gpu: nova-core: gsp: Create RM registry and
 sysinfo commands
Thread-Topic: [PATCH v2 07/10] gpu: nova-core: gsp: Create RM registry and
 sysinfo commands
Thread-Index: AQHcK7RsIIrl+YrTDEmIrany5za9zrSfkdEAgACfKQCAAAHCgA==
Date: Tue, 23 Sep 2025 04:46:50 +0000
Message-ID: <2457a5dee69c9ea1e1ebc6b87bc7673fa1a3d826.camel@nvidia.com>
References: <20250922113026.3083103-1-apopple@nvidia.com>
 <20250922113026.3083103-8-apopple@nvidia.com>
 <d87bff0c64fb2a549920354c8b09f764e145a492.camel@nvidia.com>
 <xlcggztkxvt3wx46ldusrnkened3u4rutdw577drzoxaakfp43@u6o6hevrfey4>
In-Reply-To: <xlcggztkxvt3wx46ldusrnkened3u4rutdw577drzoxaakfp43@u6o6hevrfey4>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.0-1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|BN7PPF62A0C9A68:EE_
x-ms-office365-filtering-correlation-id: f5372ce1-3c57-4289-b65b-08ddfa5c35f0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?Rmp5MUV2UGVBNE5QZzBvT3dmdjM3bUplVG04cVZZS29PTTBmdDBWQWdmOHha?=
 =?utf-8?B?ZXdNSVhaQXNFR3FFUEo0cjNjZEl2S25WaE5zWkRQRmJJUFhhU3l4dDBla1I4?=
 =?utf-8?B?V3JBdXZGelY5SHhZVTV4ell2bDNZSW1hbHhRMktoUEUrZS85SnhydWVXS1do?=
 =?utf-8?B?L1M4eklrTHJjeVFBMUJJRWp5SUZCbG4vRjI0UGNxQlRmRy9KUFBmcGV4TlFm?=
 =?utf-8?B?MjFxRmpnZERHUzZLQXN0aDlONXZvaG9tVGdMMlFIVThkWkdNRWVkbVU4Zkdr?=
 =?utf-8?B?cmFmYUx2TndYaGMwUDBYWE1ydEdTLytQeFhPdGUxb1JBNU9Xd3p4UThOSks3?=
 =?utf-8?B?M1FDdnhlSHk4dmFqRXkrVzZwRDhjL0J1ZUFTQ25BUnE5UlJQY2pxNXBnL2tx?=
 =?utf-8?B?dm9YbnVFcUJlVDh0MTVvU2VSMkRNWlJqNTdDRkRUM2hITXdIdXRxN0VwMmxM?=
 =?utf-8?B?SndxdHdITktlVFVqeG5QUDlMUEFpTklRVHR0bU5xZDR6N09HL0g0eWlMY1cy?=
 =?utf-8?B?THd4Qm1aUUJYSzBqVkhsRUNKNit0dHhiSy9OUG81V3V5bjVlYWtuUy9rQUlZ?=
 =?utf-8?B?dzVWTWdpNXg1ME5iVFlLbEdiWjVjczZxZWxOcnFNM0xDOXFXa2dYcXRvWFQ2?=
 =?utf-8?B?U1E0aW9DY2dwM0gvV0s2TEY2dDF0alJtTU5mTlZTdHF5RXlTK1lFb1JkRkJY?=
 =?utf-8?B?N3hMODRoRjZNR2kvaTcrSkEyYURSZzZhV3M4ZHM0TW5DaXhwSGdVTEE2Snli?=
 =?utf-8?B?U3lFZzlwbUxIVWE4WnFtMFFtdlJkU200NjlKQ3B5cEE4NW1zcUE3bm1HaytD?=
 =?utf-8?B?MXJ2Yk44b0QxaEdBb2htZ3I1OGNFZWZPK0VJWjI3UVFTdkUyVzVJcDdsa3ZB?=
 =?utf-8?B?VVd4enRCZnFzSTVGNERSbmZLdGFxTGlpWG1xOVRBajE4aHpOcitHTFBuVFN5?=
 =?utf-8?B?aTNuOWNPdzJCTFo4NHdEcEpPa1hUbUJ1U2ExRUtvWCsrYkd4Z2F0bUhJNDlB?=
 =?utf-8?B?dnB2QmF5QXdCQVR3VXZMaFJTRDcvVnFhcDVzWEl5aTlEem1Ed1c1OTM3WWUv?=
 =?utf-8?B?TnNzdnJCRHdLZU9rQlRQSHpLd2pWU3pTVkU2TE0zV0dlSWlpQ0JQUUZseEl2?=
 =?utf-8?B?RnlIem1IbnJmWXcvdW5HV0JBV0hsc2J6b3k4WFJYdzRNRjhCeTlXdGRlRVZn?=
 =?utf-8?B?SWVwbENJWDNCc21yKzgrRFR6eWpGVUpqZzZVWndVOUZ0bWZ5dDZtV2lJREhl?=
 =?utf-8?B?S1dseU1Xay9oZkxsbU0vTGJCTkxnZ2g3QzhPei9McGJpQnBlakFLSUE4SVdW?=
 =?utf-8?B?RGwzUG8xSHp2VUhjVHNleVR5WlBsbFBWaDdlamQwejlDbUhzcU0xQXJwcVhO?=
 =?utf-8?B?bVBjdVdPN3VjeW1lQW9sQnA2NG9oZ002SjM0OUM5NHplQ1Q4MnNHUnhvUHcy?=
 =?utf-8?B?SFBaNjlMZ0NTYUkrN1Bza0hOdnpmTDJXUFNLWEVmZitNemExbU1ucVFYRWk1?=
 =?utf-8?B?SHJKZW56TUNKdm1ZUXc2OFJyT0lwOGJpMEVEMkJmdzg0bW1SUW56SzFiOUtr?=
 =?utf-8?B?OWl1NnJ5U1FnN2ZsL2NDbzNGeFFXRUQxUWhpSE15d2lWSVhDWUtnL3NqRi9D?=
 =?utf-8?B?K1o0ZW1BVFNVRndLbXIzaEEyS0syUkVDenk1M0JaOG9nUWtZUDYzL0FhMzZy?=
 =?utf-8?B?SWlEbXgrL0ErWXo4Y2dqZmJ5dFMxNEJiNDMvb0VYTFhjZVM1Q2xYZEhYaW93?=
 =?utf-8?B?dUllendsN0p1WHlqQ2NqM2Y0TWQ1OE1yYXFMeXNHZXIxeUI2V3p3R2JXOUxn?=
 =?utf-8?B?L0NGT085MkxCbG1raHZBUDU1cnJwcGJoOGloK3ZRVkhtVFlvVnU1QmYxQjhj?=
 =?utf-8?B?YWh3VjljTWJPU3hrY2JEL0lweFUwT2Z2RWVYVUEvRUlpeFpyUXVvWFpUdFZC?=
 =?utf-8?B?a0xxdVVSU1dTb2hKakpGN2x1c1dlRVo0S2VNL20wc2Z5Uzh6OW4zMU82T2I4?=
 =?utf-8?Q?WIm2iZ4ozpMmZW8WdPlP5PkB9d6/Bo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N2RnQmIyYXBhL3JXVWJYZ0J4ZTBKRUtZblo1dVRIVEdWK2R4UHVhNG1YVzhj?=
 =?utf-8?B?MDY2eFd3OHJCOFp6dzIrZmY0NU1yYWZGbExWaUZTY1RVZVBaYzhFUFVEZi9i?=
 =?utf-8?B?NVFmK1ZGbjF1Z3lHOGFwT3M1T3hkQVpRclQ2UW1XeCs4RE81R0RBbXBOOWlu?=
 =?utf-8?B?L3lFaDhjT0NXL0ZpNlYvdXhja1h1ZzJhVnZtUk1KeWRIc2hMcG9MTmJoQmRO?=
 =?utf-8?B?TWpYTHIrU0R0bmJuTXl3K1RuUFkvVTROcWsyVWFkTTNPd0M4cCtZUUlTUFMr?=
 =?utf-8?B?cFZJK0xsQXVZWUFiTmlmTS94MWdCdDc3aVl1Nm9zM0kvMTk2b1hMNklUY2Fq?=
 =?utf-8?B?SUhwS3ZRQzcwZktLQi9uaVNqejJ5am9qZC8xTVBiMHBuMjBLRWk2UDRyOFhR?=
 =?utf-8?B?Ri9TM3A3VTZ0Rm1odGFRWFc1WkVrcTFYMU81ZE1Pa3h6Z2JpMU94QitCdmJy?=
 =?utf-8?B?NlQ3M0VmVmxiNS9nYW9DbUVtNVhBeXEzb3gvSFJxVjFEaFhvNDE3MU5mZlRU?=
 =?utf-8?B?YW1nUVFMZWlIV2ROZlI1dnYvcGJQYkJsMVdGdlNyYWFXcHpsaVdxd01mNFFO?=
 =?utf-8?B?TENydThXenpIcWg0NUFGUkRERzZlUU0zN1Q5enQ1Z0RTZldtNE0vblBCOVdY?=
 =?utf-8?B?ZEhpWEV1ZjNxWVVCK3JsVzhkTFdQaWxKanFPTmpIMXcrTEtjSmJsYnZ0V1RH?=
 =?utf-8?B?SGU3Z2Q1c2pKai9QVEtCaml0MHRlWGxjMjh2V011dTlFaUF1YlpLZk4vdjRE?=
 =?utf-8?B?MkVBSmhuanRKcnd3TUFicUUrTVpNSElkd2IwdkUrM0J2UTh0UG1LamNlV3Js?=
 =?utf-8?B?S1lBSFIzUGt1cSt3ZWpNZzBrSkdZejdUN1N4Z3kvMExLUnowd2V2QjVuK0U5?=
 =?utf-8?B?QnNXSndTWEpjZEh0bnNNbE9pSlBVT0V6eG9TNllicHN0K05EWWtMYUlJU1dO?=
 =?utf-8?B?N3FNcUNvT3U1MFJuU1FxdTgyMkY0b1BGTzFXYkdiYkxZYU4wWkd4ejdJblRx?=
 =?utf-8?B?RWIvaXFYSVZvaml2dTZjelJDdnAzTlg2UzhpcHRMY1puVG52VU1PRjBiWXZ4?=
 =?utf-8?B?ZzE5cXNhdVNYY21KZXFNdTRMVThpUVVRYzlXTUZCSlREaTlCTitHdUpraEtn?=
 =?utf-8?B?Q0k1Vm02YmQySTQvYkNlbWJCRnZ2MmpRNmhnd0NaaFQ2VURraW01b1MwblZq?=
 =?utf-8?B?WWIySUVIUThNNUhHck5zOFUrMDlMVVljVzZabW9UdG1Cb1dKRFErVklxMmRT?=
 =?utf-8?B?dTdJNklPSUE0UTU2Qkl3S01jY0xjR2J6TmdjZHFEdjZ0QlpKcWQ0emJYdkha?=
 =?utf-8?B?RVJwVU96TVQ5cXlKTlpFY3g3ZWR6cUZxWnRxaFlCMUN2T1Bqc280SnpOM1lP?=
 =?utf-8?B?MzdIdmpwY3lsajNMSCtISCtCU1Bya1ZUZllXREpmcTlEM3pmcXAwcnNVTXl0?=
 =?utf-8?B?MzZoS1hNRWNYNG16OTVpdm1xb1phbmRrY2QxeHFINk5qazlpM25MRmtEcUVo?=
 =?utf-8?B?eHhVVXdFaXZyYWtpcXpaU2hSc0VaUVpyTDlEZXhFSGFZRW01TjVXT3BwVTBy?=
 =?utf-8?B?cDZ6QXFFUmdwVWk3b3c3UjFXdW03UEFrZFlXNE1McUFVZzN4czBrcm1nWVI5?=
 =?utf-8?B?Q3RTOWwwMXRrWUNCUU5TeGV2U0w5empHcHVYWi9zSWhGMVgxNnJZcG1DVUFs?=
 =?utf-8?B?MytRaXJPeDJlNHJoaUo2NE93cnlsZ0p5cG1NUWdmTitGTHVuTTFITWJpWHlE?=
 =?utf-8?B?aWFxdS84WktWd3ZTdXpIMVF5S3VrbXdyNGhUOUEzK0w3TWRHbjZrcE1uMGtM?=
 =?utf-8?B?b1RTZ3ppdzhGZmEyb0JLYnU5ZzhKbjJaUlY5SGtxMTk1UHhjeDlkTnhwMFdm?=
 =?utf-8?B?TjBOelkxdk9LNUNlYUVyMlBDL3VzUnpTTVhJaytSYTZWVmtMMnBVZWpvSnZz?=
 =?utf-8?B?dFJGWTRWdjF4RTNjd0pjb0JyaTB6N010SWZjNStidFNjYmZjR3c5NGNydEZG?=
 =?utf-8?B?eTZtRXpjSmQ4TjNpUExVQ2J6ZlNnOGVYV3VBL1VMUmdlR0xGZlU1YXNJK250?=
 =?utf-8?B?OW9iRlpyZ3RXeVVrS04wV3RVMXl5WDczMkFUUXRpb1Qvc011VzRiK3ZQUTA4?=
 =?utf-8?Q?C0IMJM1IrmxRJeWypeU5phIjS?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BC39AC75FD0C534BA11EB509D334E681@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5372ce1-3c57-4289-b65b-08ddfa5c35f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2025 04:46:50.5296 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5kBt39DEoCCU91q9G8qhxbxqY2loKu4Ol041HClxs+7Uk/dmlkxYDYaJZn+GQaAeiCL556Dciyxiy8kNbgQ/aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF62A0C9A68
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

T24gVHVlLCAyMDI1LTA5LTIzIGF0IDE0OjQwICsxMDAwLCBBbGlzdGFpciBQb3BwbGUgd3JvdGU6
DQo+ID4gUHJvYmFibHkgc2hvdWxkIGFkZCBhIGNvbW1lbnQgc2F5aW5nIHRoYXQgYWx0aG91Z2gg
R1NQLVJNIHRlY2huaWNhbGx5IHN1cHBvcnRzIHN0cmluZ3MgYXMNCj4gPiB2YWx1ZXMsIHdlDQo+
ID4gZG9uJ3QgaW50ZW5kIHRvIHVzZSB0aGF0IGZlYXR1cmUuwqAgWW91IGp1c3QgaGF2ZSBSRUdJ
U1RSWV9UQUJMRV9FTlRSWV9UWVBFX0RXT1JEIGRlZmluZWQNCj4gPiB3aXRob3V0IGFueQ0KPiA+
IGV4cGxhbmF0aW9uIHRoYXQgdGhlcmUgYXJlIG90aGVyIGVudHJ5IHR5cGVzLsKgIA0KPiANCj4g
SSB0aGluayBhdCBzb21lIHBvaW50IHdlIHdpbGwgd2FudCB0byBleHRlbmQgdGhpcyB0byBzdXBw
b3J0IHNldHRpbmcgYXJiaXRyYXJ5IHJlZ2lzdHJ5DQo+IHZhbHVlcy4NCg0KWWVzLCBJIGFkZGVk
IHRoYXQgZmVhdHVyZSB0byBOb3V2ZWF1LCBzbyBJIHdhcyBwbGFubmluZyBvbiBhZGRpbmcgaXQg
dG8gTm92YSBpZiBzb21lb25lIGVsc2UNCmRpZG4ndCBnZXQgYXJvdW5kIHRvIGl0Lg0K
