Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03EBCB43A38
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 13:32:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19E3A10EA0A;
	Thu,  4 Sep 2025 11:32:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="gl/YziUh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2064.outbound.protection.outlook.com [40.107.93.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39B5910EA09;
 Thu,  4 Sep 2025 11:32:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bk6DNm8k7ezKmPovkCiixWdkJEJtWAHUPYDQRnL4EUut2AbJ341wys+0tqYZfTYhhY6PG1f2CmErKVvPCK6kLqNWFhO8fsFQFOYo80bNXHlgC4UppjUtRYD5n38CI3AlYcVtz7gUFow5ESw6qrgdYi82DpkO07/Ik2L8zOBV3KCyqXH1+T7QEY+/gZ4H8sBYPtm4gXFOi3cjSqbGhBVlGbmU5s26m0ZUATnBxMg966oYES1+d/A/rl6QFzXvYSQuCLd3C1mbtsBWyY5TWXW0eioBbZ3W2pGdFudDmkZndv8ZD52D9AOJG4NTpSf7D7K1Zq06syVqHcsSauA1Y6fwFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HkT54nzPRct1jS+GcC1bWFbh8T5aaDNcB+yg8qcCkDI=;
 b=VW986UlEAg8pWYcEch0D1ZilYK9dNeKsp/qJj9PWifzHMHYM9HtkrfZO+YphMw1wZgs1B+MLeI+KJF9cRKnzZM9s0/SdfAzEu7RIWkFgBqCFNczUIt9mlnjfXQBBkSjyGi/2C99UQd8tjWBgqp1fYojy9Rg3QquJmE+rcRjlE1hcTCbcc2XSEGljEcr89OjDqjEwjd3MMxBbjwQMv4VYhLv7uY7CtXyA5n6jVlK5qYIQSMIRKyj1wJhi2PkNFeGKXZmECh+JunZsLIesb1WPFxJalzwaHbW1K2nvkpGxc77kUvQ1VI3flZTXnV0WrbYbIAlxX91Iv8/SYk4LyMdUCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HkT54nzPRct1jS+GcC1bWFbh8T5aaDNcB+yg8qcCkDI=;
 b=gl/YziUhlp0yLNxuBnxmV4r6PIkCtDsfAicYJtkEuk/LOQCRdtGfRVHSDcfK27Zs9z2PqLd822io0ZD3FjTRUEZ1E/2YjJygVZgEnRiury6TqecO2wHYc630dYcBJXL9odalM5G3v7Aq/Qj5hG1RXgoxr3f5EH+6oZUZ7iGGXNdCpjF4DasKnHWbKpj1zr6QQFXAABVwZ6M9N7+IFteoxx9gloJck1KB2xuP7tIsCsxVP/eo9MSLSbbd4kT8lMNZq3VW5uJdibbENMmHMHrpFCXnZTaOZeHlZAgyZkcMEz9xlQT6Tsy8vzc+Bnasifm+M7pMF8JRgczHntGHTkTOHA==
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by PH7PR12MB7795.namprd12.prod.outlook.com (2603:10b6:510:278::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Thu, 4 Sep
 2025 11:32:28 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.9073.021; Thu, 4 Sep 2025
 11:32:28 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Danilo
 Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor
 <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
 <gary@garyguo.net>, =?utf-8?B?QmrDtnJuIFJveSBCYXJvbg==?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor
 Gross <tmgross@umich.edu>, John Hubbard <jhubbard@nvidia.com>, Alistair
 Popple <apopple@nvidia.com>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 1/2] nova-core: Add a library for bitfields in Rust structs
Thread-Topic: [PATCH 1/2] nova-core: Add a library for bitfields in Rust
 structs
Thread-Index: AQHcFP9mydaUsviYL0KPJ5QjT1cfF7RzNsSAgA5qTACAAMmaAIAAiof5
Date: Thu, 4 Sep 2025 11:32:28 +0000
Message-ID: <B7EF7192-9228-4B9E-B029-3E51E6765016@nvidia.com>
References: <20250824135954.2243774-1-joelagnelf@nvidia.com>
 <DCBGLCQVD1RF.6V5UT0NQ4GLB@nvidia.com>
 <444ebd64-7a90-46a6-b885-2c114aa59284@nvidia.com>
 <DCJOUO214EXC.32MFBN80VJW3K@nvidia.com>
In-Reply-To: <DCJOUO214EXC.32MFBN80VJW3K@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8059:EE_|PH7PR12MB7795:EE_
x-ms-office365-filtering-correlation-id: 6b16ca5d-6763-43a2-38b4-08ddeba6bac7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?UElLNHJOckdockhVUVJ6ZlBoTUZTcDhRRUNkUW80ei84dlhZdGtlTld1Nm9S?=
 =?utf-8?B?MnUyaFNDMEVLMzBmYlptVGRoSmYwNnNSajB0VnNjSXRKR1pQdkQ4NG9aQ01W?=
 =?utf-8?B?MjZycVFBYW0zb3c0MVBCT2hHTFRaVEZxRlFxM1lpdVhZV1pUei9vbGRNcXZG?=
 =?utf-8?B?RkpiQ1ZlVnBJaVEwMW9Tcy9sSzRNU1ZwS290WEpPdEJIQ3lvcnlKaytJdlYy?=
 =?utf-8?B?amR5VWl5aytGUTNkWXVEQ1ZINXZSTjljLzl6Y25UWjc0aE5palhUSlBHcEtU?=
 =?utf-8?B?T3EwMnZXWVd2czRRSVJ3dzI0eTdkMTVTYW0zcU50L09VRE5TaXR6aStuVzcx?=
 =?utf-8?B?cE1KV29aWFN3dmZmSVBVTWhmWEh3dVI2d1BtZXpZVFMwRHY0YWx1YTNKOFAv?=
 =?utf-8?B?NlZtTkRDcGZYZFUvVnltVWpYYk1LRHVjalZ5azRIWUlER1BBWTZJVVdNanRW?=
 =?utf-8?B?MkQxZ25RZC9FcDVVaWlOaVN3VjRlOFFRd3JWV2VxbUJzL2NXYkxocHlXVjU1?=
 =?utf-8?B?WFM3QW1oNG9IaFFOYnYyRTJGaE9rN1VLQWs0aXdsbWY2cHZ0dStNK0szcktl?=
 =?utf-8?B?U0Z3ZzgrbGNNa3FuaGhTL1A0Q0EyZndIZk9GSEdDRHlEUUNuL3JUV0dVRHRC?=
 =?utf-8?B?aE9OT051b2hrVkJFdGZnVjNTRjdNYnNhM2RxWkxYeHlBN3loK2FZbHMwWk9y?=
 =?utf-8?B?Q0szWXk3Ri9kMituY0pPS0VPRUhORkQ4UU4rRnFIcitvOGtaeERUalI4WmpS?=
 =?utf-8?B?clVFU3VpZVc0TFRTS1hUdWVlWDM3aWlncU1CMG1naUdhWktXOXo2SkxIZE1j?=
 =?utf-8?B?ZHpBRTROL1dhUG9EeUJLcjdodXlpbUhIZmQ5TGZJaVBpTUcrb25xZE0weWFW?=
 =?utf-8?B?bWIzZ01JeUw3cVBRa0xyUG9rRUsrWmcxcmFOQytEZUZRMUpCWTJXN2thNVdm?=
 =?utf-8?B?TERUTzJ6MS9UN0NQMHlDNkJHQ2svbzB1OXRwVEd5ZWhQVUhuOThaaWxPNGtI?=
 =?utf-8?B?RmJ1N3ZiOGNISEhIelhKdFhhdG5WZ3J5Q0tSak11RXllelQ1UXFoUnNpd3JO?=
 =?utf-8?B?ZE5sTHFLV3pvaklrd2lOZDNuWlVZMmpBV0xqMHNpQUx3NE9WQmgzSHVFZEsv?=
 =?utf-8?B?SWd4SWQrQUtVS2ZYUlVpNW9kSW93d1k2dW9mQ2Z2dTlRak5XRTBnaXE1WFpq?=
 =?utf-8?B?dTdOUHVhdUJXZlNaM1p6Z3hDRm5Zanc3Mk1TWThiSXVpR3BPdlFwdGJMenl1?=
 =?utf-8?B?am9IOUFtV082RiswTnk1QS9kbDNsaW80VFIwWkduSk0wSzhKWTYybStHSnRT?=
 =?utf-8?B?WWlia2JMd1hTNHdzQWFXZ3d5YnZkK1FSSW5VMEdOdFRHZWhCZkh5bEN4Wlpr?=
 =?utf-8?B?UmR4OCtSdldmemFDTUZPLzhlZlAzdXZJaUNSZ2xGcUJOanpsNjI3NjdNRGhG?=
 =?utf-8?B?djV1K1JscmhhOTgxZVo0NGhKYUpUY2laaW0rWFpmcU5pU3Y0aHUybWdqTmNK?=
 =?utf-8?B?amVja0ZFMjRXWVhxbDJuem1HbjB2bW9GRzJPUkYwaEpVeTkyOWNydjNMS05a?=
 =?utf-8?B?ZE9aN0crVlBLb0l3MldMUmRKM1hjNjJCaVNTK21aSGFKYXczMzFoTTFQVjRs?=
 =?utf-8?B?ZlhJT2RnU21uT2VIdHNoWFpFbGxvMWtRbnBiQ1BqSVRySktidUhkZjZvSUhW?=
 =?utf-8?B?bVpIL0FPUFBlOVpTSkUyQ0tKRHFva2o1OU1hcE80VWc0MGp2QXBkWFAwbWcx?=
 =?utf-8?B?cGNMWi9halZjUXBtUVZsMnQvSk5INWtIU003SnpDSFVDQVZEMnNlSGhHcFVa?=
 =?utf-8?B?YmdqcitsaHBmY2V2MUJFTFpqNzhVVzd0M1ZNMTg2QUJodktVTU1SNjRaN2x4?=
 =?utf-8?B?c2EvdUVEay9Sc0QwcVlTYXdxSm5PUzhlVW0ySndETEhQblRQblhla1RPZjh1?=
 =?utf-8?B?WUV4NnZWbmNmcU5GK0NEaEJMZVlJVFY4S1k5NFUxUktVZUZrVWNJNlhNdHhs?=
 =?utf-8?B?SURzTXllUGJnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UjBZeElYdy84aXJhc0V4bklHNFVYTWdESVlTL1pyRmQ5SHFub2p5OUQwdXFa?=
 =?utf-8?B?Rmp4UU5KWDFDMjAwYUtob3V2MFNPYzN3ZlF6M0tpVmk3VWdycW1UdVZTM3Fv?=
 =?utf-8?B?VkhRTU5FNHRiSlRjTGtkcWhQN1Znc3YvNlBzcmVTK0VpUVVIdG85SmdaYXh5?=
 =?utf-8?B?VDlIY1NrVXdZcUZ6QjhZWGtDcGdFdGwrazFIb1l1Mk9aRkZHbEU0M2NxMmsr?=
 =?utf-8?B?TzFSVGdTU01JaWliRFlYTnNDelVSS1F0K2hQRGxNSWFPZGRYZjloelBMM1o4?=
 =?utf-8?B?T0Qzdm5VeHNUVkVRK3haaFBoTXp3SlRqa2l0OHhTL2p0OXhGbmZUeGtGL3hC?=
 =?utf-8?B?U1ZPZmswRUJOeUozKzdtUUdmN1Y2RTR0QW1qUlBLTzM0SmtZMWtsVE1oY2xX?=
 =?utf-8?B?NnE2ZVU4L1UrSERjT2dSbVh1K0dmQy82UzBkYnRXWjVQeXIyenRyNXlBYXlY?=
 =?utf-8?B?U3l3UENrUTMxaVVraXQ0YWhrZ2FRaG11L29rZCtESmdZTFVsWUJPTHpiaExx?=
 =?utf-8?B?ekZPcUdKZFJad0xUVFFoNTd4VDFtZWp0YVp4dnlzOEcwQis2U1VtLzNlRWdq?=
 =?utf-8?B?OVprSlhaNnBTZkljd0ZTK2hvd2NiMlVSZFhNRWdXWXdieUN0dWlOMFZUMG9Z?=
 =?utf-8?B?amJzeXRLVEFhY2R6Vjd4MmR0SmdkUUNFZ3BqYmxVT2dtTU1LWkVTcEM4T2N0?=
 =?utf-8?B?QzJaemdMZDVyR2ZPN3N0K2tyYWxxdkZRZXpwYk4zSjNNUEZ4NFQ2Q0k2Q1lm?=
 =?utf-8?B?MExpaVdHN3ZUM1V0RHFzN25TM1RJWmQ3RHlTR0F2M2pjck1zTVNKMlJvcm95?=
 =?utf-8?B?QjhudUpGcW9PQWZ2RlBjQWxOeEZGbUdpcHFhc3JYTURGREs3N2VtTXZlWmxo?=
 =?utf-8?B?ajJhRlVCWmNxUWI2d1hubUoxVnlXTXAyZDZoZi9oK3dEUkRjMGladEp2ZVNE?=
 =?utf-8?B?OGo2c1V0WnRWWVY0SW44ZUwvejFDQU56WUNTSkVFNzFBZG9Da1ZMVm5tYWYw?=
 =?utf-8?B?QTN1bEFZMkFEcElXaTEzem1XR2w2b3BIc0pRUFBiam44Q3hYbzZXbHJBNTVq?=
 =?utf-8?B?d1VENmtGVnRpS1ZKU216YWZVSHBRV1VFa25pY3d5S213SUVDM08vT2xDSjRP?=
 =?utf-8?B?RG4yWHRBK1E1MEg1bzZaeE5UZnJ5clR0T09hYS9jR1NleEVhbFp3K1gxZEFG?=
 =?utf-8?B?L2lrMVdqQ0I2UVV0QXdBWUlHbzhxLzdzWkxqaEUwUFUyOXE4RzVFM0Z1QWEy?=
 =?utf-8?B?Z1kzMUNGN2toZzJETXc0bmppUXhhYk9ROHVsQ2MvUWtFbU9xaksyRkI5Kzg1?=
 =?utf-8?B?RFBQdStoKzg1QmllZ2F2bDRsNkdsZkVSZzhxSXNTUThXejJRNDZPV2VsM2JJ?=
 =?utf-8?B?eE9rT1pFbE91RHp0T1l4UFpTOTVCaktMd0J2aU9DYVJwdGJvTHRLaEw1bFZj?=
 =?utf-8?B?MXdmdzVQaTcvOEVGalJ4MnFPWnBtVm5zekwzWklSUTVxejY1QmhYRWVPR0cr?=
 =?utf-8?B?MEZXZCtDK29ka0lwREJlaVVmTTBiQkFJWm5wcm5CMm5yaVVFY3A5Si9xNmNT?=
 =?utf-8?B?dkxLY2ppUmtpNU5OdDRDR3QrZTRCQUVWem5DZ3cybmV5N05WVlpTOWZkaG5I?=
 =?utf-8?B?OUlCR2VtbDF3VENNa1g4T0EydUJyeUlQTzNqbEFmZnFRbWxCZnNIbnJCTEpD?=
 =?utf-8?B?T3hFSXMwbmZiNW9lZ1dIS2xWNTFKamMvdzFrd1RldzVyU0x0b3RyWnhCZmlp?=
 =?utf-8?B?MHZRbGhCVlZKWWhEM2Mva1J0czQ4Smk1U3JLamR3K0I4dSsxVnJHaFlrb01I?=
 =?utf-8?B?VW5aM05nVWd3bzBQdlQyVGpTWTNFaTNDdWo3QjJndmk1V0hmWWNIYVpFTXQ1?=
 =?utf-8?B?K3l5c3RSdjB4NzhYME5BNmJWaFRHYmViSEgwbWh2U09SRWc4Zk85YWMrcVJE?=
 =?utf-8?B?Q1Z1Y3JydCt3TkpVN084UEZIYThUK1RhL09ZdHRWZHppQXd3bkpsY1BSQm5M?=
 =?utf-8?B?WVJEZVBiZmQ1MHZuSDRnMW9Md1RWQTFXNDZybkI5aVN3czJsM2lHa2EvSXov?=
 =?utf-8?B?UmwvdTFsZ1Q3YTRnazIrRkN1UGVQWjAyVmJwQ09CRUk5OEpzbWpEWnVMd0Yv?=
 =?utf-8?Q?L91StADTFqj8pURw0KGP6uQSG?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b16ca5d-6763-43a2-38b4-08ddeba6bac7
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2025 11:32:28.6683 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xIpgkc0aghzf0gE07y3OSBntz/MZa0+g6retHeGbuetfLy143Qgrq5eBQ0ilLfPwguDAAqcaza0HZzG5kGnnRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7795
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

DQoNCj4gT24gU2VwIDMsIDIwMjUsIGF0IDExOjE24oCvUE0sIEFsZXhhbmRyZSBDb3VyYm90IDxh
Y291cmJvdEBudmlkaWEuY29tPiB3cm90ZToNCj4gDQo+IO+7v09uIFRodSBTZXAgNCwgMjAyNSBh
dCAxMjoxNSBBTSBKU1QsIEpvZWwgRmVybmFuZGVzIHdyb3RlOg0KPiA8c25pcD4NCj4+Pj4gK3Vz
ZSBrZXJuZWw6OnByZWx1ZGU6Oio7DQo+Pj4+ICsNCj4+Pj4gKy8vLyBNYWNybyBmb3IgZGVmaW5p
bmcgYml0ZmllbGQtcGFja2VkIHN0cnVjdHVyZXMgaW4gUnVzdC4NCj4+Pj4gKy8vLyBUaGUgc2l6
ZSBvZiB0aGUgdW5kZXJseWluZyBzdG9yYWdlIHR5cGUgaXMgc3BlY2lmaWVkIHdpdGggI1tyZXBy
KFRZUEUpXS4NCj4+Pj4gKy8vLw0KPj4+PiArLy8vICMgRXhhbXBsZSAoanVzdCBmb3IgaWxsdXN0
cmF0aW9uKQ0KPj4+PiArLy8vIGBgYHJ1c3QNCj4+Pj4gKy8vLyBiaXRzdHJ1Y3QhIHsNCj4+Pj4g
Ky8vLyAgICAgI1tyZXByKHU2NCldDQo+Pj4+ICsvLy8gICAgIHB1YiBzdHJ1Y3QgUGFnZVRhYmxl
RW50cnkgew0KPj4+PiArLy8vICAgICAgICAgMDowICAgICAgIHByZXNlbnQgICAgIGFzIGJvb2ws
DQo+Pj4+ICsvLy8gICAgICAgICAxOjEgICAgICAgd3JpdGFibGUgICAgYXMgYm9vbCwNCj4+Pj4g
Ky8vLyAgICAgICAgIDExOjkgICAgICBhdmFpbGFibGUgICBhcyB1OCwNCj4+Pj4gKy8vLyAgICAg
ICAgIDUxOjEyICAgICBwZm4gICAgICAgICBhcyB1NjQsDQo+Pj4+ICsvLy8gICAgICAgICA2Mjo1
MiAgICAgYXZhaWxhYmxlMiAgYXMgdTE2LA0KPj4+PiArLy8vICAgICAgICAgNjM6NjMgICAgIG54
ICAgICAgICAgIGFzIGJvb2wsDQo+Pj4gDQo+Pj4gQSBub3RlIG9uIHN5bnRheDogZm9yIG5vdmEt
Y29yZSwgd2UgbWF5IHdhbnQgdG8gdXNlIHRoZSBgSDpMYCBub3RhdGlvbiwNCj4+PiBhcyB0aGlz
IGlzIHdoYXQgT3BlblJNIHVzZXMsIGJ1dCBpbiB0aGUgbGFyZ2VyIGtlcm5lbCB3ZSBtaWdodCB3
YW50IHRvDQo+Pj4gdXNlIGluY2x1c2l2ZSByYW5nZXMgKGBMLi49SGApIGFzIGl0IHdpbGwgbG9v
ayBtb3JlIG5hdHVyYWwgaW4gUnVzdA0KPj4+IGNvZGUgKGFuZCBpcyB0aGUgbm90YXRpb24gdGhl
IGBiaXRzYCBtb2R1bGUgYWxyZWFkeSB1c2VzKS4NCj4+IA0KPj4gUGVyaGFwcyBmdXR1cmUgYWRk
LW9uIGVuaGFuY2VtZW50IHRvIGhhdmUgYm90aCBzeW50YXg/IEknZCBsaWtlIHRvIGluaXRpYWxs
eQ0KPj4ga2VlcCBIOkwgYW5kIHN0YWJpbGl6ZSB0aGUgY29kZSBmaXJzdCwgd2hhdCBkbyB5b3Ug
dGhpbms/DQo+IA0KPiBMZXQncyBoYXZlIHRoZSBkaXNjdXNzaW9uIHdpdGggdGhlIG90aGVyIHN0
YWtlaG9sZGVycyAoRGFuaWVsPykuIEkgdGhpbmsNCj4gaW4gTm92YSB3ZSB3YW50IHRvIGtlZXAg
dGhlIGBIOkxgIHN5bnRheCwgYXMgaXQgbWF0Y2hlcyB3aGF0IHRoZSBPcGVuUk0NCj4gaGVhZGVy
cyBkbyAoc28gTm92YSB3b3VsZCBoYXZlIGl0cyBvd24gYHJlZ2lzdGVyYCBtYWNybyB0aGF0IGNh
bGxzIGludG8NCj4gdGhlIGNvbW1vbiBvbmUsIHR3ZWFraW5nIHRoaW5ncyBhcyBpdCBuZWVkcyku
IEJ1dCBpbiB0aGUga2VybmVsIGNyYXRlIHdlDQo+IHNob3VsZCB1c2Ugc29tZXRoaW5nIGludHVp
dGl2ZSBmb3IgZXZlcnlvbmUuDQoNCkkgZG8gbm90IHRoaW5rIHdlIHNob3VsZCBoYXZlIGEgbm92
YSBvbmx5IHJlZ2lzdGVyIG1hY3JvIHVzaW5nIGFuIGV4dGVybmFsDQpyZWdpc3RlciBtYWNyby4g
V2Ugc2hvdWxkIGhhdmUganVzdCBvbmUgb3V0c2lkZS1ub3ZhIG1hY3JvLCBhbmQgY2FuDQpzdXBw
b3J0IGJvdGggc3ludGF4ZXMgd2l0aCBpdCBpZiBuZWVkZWQuDQoNClRob3VnaCwgdG8gYmUgaG9u
ZXN0LCBJIGFtIHRoaW5raW5nIG9ubHkgc3VwcG9ydGluZyBIOkwgaXMgbW9yZSB0aGFuDQplbm91
Z2ggaW5pdGlhbGx5IGFuZCBvdGhlcnMgb24gdGhlIHRocmVhZCBhcmUgYWxzbyBPayB3aXRoIGl0
Lg0KV2UgY2FuIGFsd2F5cyBhZGQgc3VwcG9ydCBmb3IgdGhlIGFsdGVybmF0ZSBzeW50YXggYXMg
d2VsbCBpZiBuZWVkZWQsIGluIHRoZSBmdXR1cmUuDQoNClRoYW5rcy4NCg0K
