Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5F3CC1BAF
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 10:21:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E44410E6EF;
	Tue, 16 Dec 2025 09:21:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="h9XOS5H0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012071.outbound.protection.outlook.com [52.101.43.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9025C10E6EF;
 Tue, 16 Dec 2025 09:21:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CvG5IS4r/UQbQPycUPHCNAJsVXU9eAM1e5Y7P3aT6/XP8FycrUVKt88j0Eb1ybE7Rd31KgQqJ4L8GAxcxGx86tTTXXF88w+aA0jSnaLZWlp45ydsJta3a0b87Z5aQS4x0lpZ4TeXLR5ibBzYTrlsoyWm8rCLY86UE9D3UYA6IHw64JxoxBeU3azrdWkW5fKL44iS7ZR0vgwuwmOyznzNwgwug6t+THIP4KYKSxcp/XzmZFKzpHPl9WLuoA3Qd7tI8mw3daY2eChnQND5+vIp8JFLKksBVQM29+lxt+b7kttPKNN7+ZiehsUP5s1Z/gBgupMd2Rw7tJZHLqmPwxUxDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=54kmxnLWDfV5wi+6Mh/CERPrEYV3H4USBrpi8jzOilE=;
 b=POrfW0NSrLn+AZAkjqmCAlOimV+yNN6PrpQjnbue+e62weqYEPrAMS0M2Ien+jZu5JqFznxuHivSPA8RHuvuWaZ9Dg+gDrRELc0wuThT2Wx6SWfGW0hE/vOW6FOmC/mw7pIKR6c6bVpVqTzM4uXxsgmk7k1+JXlXgVzpctVS1oDlWtYLKm+tISh7xGgC5u9iphoQznhsVbIfqJQ+7OIn/EsD43iHLfF1duh+N6v6pgXRvHH0pY96Vsb5ZCQgWcGYNr1MbjeaHZaXBBpvU5WqRPccy2vaIt+si5kgtSfEuukBnd5uOAl3Sp2GVRylBI/kmybZ8g6jgETHzEXGeo6s1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=54kmxnLWDfV5wi+6Mh/CERPrEYV3H4USBrpi8jzOilE=;
 b=h9XOS5H0F5F7Ibw/+YursPFkIGYCFRm2U6vVEfG0Ps/jOxs/xyG9CL/R1ESh+aNDshCA+/nTm1peNhffaqoWusS7pLbToWHp+vYcyxw9inya76fHd+8Tl+We4EmNcJ7nBDsd/OU/S6RiZJIBtoK9dkv5G2EwUppOpixYYbTzyjPS3s3I7mqDhMDLK1+J7uLqgILlHExJQ2huxwFPtE7YFjbkVmG/EbHvT3tIy62MEQ0pYyNVDFThtY4anRniPTulFX2KAbk37ImYnDzB1AMmboY1muSUR53L2NOGl1x9TWvFfhPfGtEfSBYFAPKiH/ijrSFDLBa8nU3Z8qaldcv1cw==
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SN7PR12MB6909.namprd12.prod.outlook.com (2603:10b6:806:263::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Tue, 16 Dec
 2025 09:21:13 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 09:21:13 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
CC: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Miguel
 Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?B?QmrDtnJuIFJveSBCYXJvbg==?= <bjorn3_gh@protonmail.com>, Benno Lossin
 <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross
 <tmgross@umich.edu>, John Hubbard <jhubbard@nvidia.com>, Alistair Popple
 <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Edwin Peer
 <epeer@nvidia.com>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>, Lyude Paul <lyude@redhat.com>, Alexandre
 Courbot <acourbot@nvidia.com>
Subject: Re: [PATCH v3 2/4] gpu: nova-core: gsp: fix length of received
 messages
Thread-Topic: [PATCH v3 2/4] gpu: nova-core: gsp: fix length of received
 messages
Thread-Index: AQHcbje+O3G9s7UpF026rlAFwp7NULUj/jY7
Date: Tue, 16 Dec 2025 09:21:13 +0000
Message-ID: <63086256-CAD9-43AE-87CA-9569E6F392B1@nvidia.com>
References: <20251216-nova-fixes-v3-0-c7469a71f7c4@nvidia.com>
 <20251216-nova-fixes-v3-2-c7469a71f7c4@nvidia.com>
In-Reply-To: <20251216-nova-fixes-v3-2-c7469a71f7c4@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8059:EE_|SN7PR12MB6909:EE_
x-ms-office365-filtering-correlation-id: b5f25869-bed9-42ee-ded5-08de3c847562
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?T1dSYlpmclhURFlNdUs5VGEzNmtvYnlQdC9LcEdieDE4RVJFRFk3MXlHUG1p?=
 =?utf-8?B?aHA3bmhCdmRmTGsvWU80dW1NazhZOEpHaFdSWFZ3bkd1VVQ0dC9tUHBER1dX?=
 =?utf-8?B?RU5iNEFGMGc0YUF0cDBCTmpzbzVEL3gyQzNoNHZnS1VvOWVoOVBxcU56eHE1?=
 =?utf-8?B?K0NBdlo4VUI4WThpYmJKdTd4TVNMK3pIY1ZFS3Q1Y1ZWUWFQbVpnM1RsRmtQ?=
 =?utf-8?B?SEUveW4rWFFldjByWTVpdjFSRThJVnZlZDkzUHZlN2IzRURoZUxLbUdQNDAv?=
 =?utf-8?B?Y1BKSURSODFXQ3hNdzB6SllQaElRQlJlZjIvMVdtbDMyNWNvWDhGV2xkdFhI?=
 =?utf-8?B?MmFMUUpqNWRXdnpGeXVJOHVVeDQ1eHVJemRKR0tZV2FyRDdBWW4ybWs2WHJZ?=
 =?utf-8?B?V0c3QjI1a01oSW9ENFNBNU1xYjY3bkQ5Q25URVRMYzA3b1Jqc2IyVUl3SGFC?=
 =?utf-8?B?aUhINmNaRUV1VjJMTjl2S2xGMHpIRTYvMk1WSWU5c1NVdmphWWpVV3BvVXVy?=
 =?utf-8?B?WHVEYkgxSy9EVzNUa0VrK0p5Y2hrYlp6eHdkWnNZNzEyRnk5QzBOUHhDbWZj?=
 =?utf-8?B?OVQ2bG5ZTXRGVGtHU2w5eGJVOGpkOW94K2pEZEpLNGtCTjlhaDFZU2liRWZy?=
 =?utf-8?B?ZFpvUXhITFFkNTFjOWNOQXE0R1dKbWgybjBRcG9zUFlRSSs2eUpnbzk0SGhq?=
 =?utf-8?B?dXNwWHVpeHRKWGxCbnovZTE2cWRFQWJIc0hTdTJwZU1yVEtsZEZsUVE0ZDdi?=
 =?utf-8?B?em85K0JXL21JbXkrZmVlczVKYzJLOW1iazNKMjRxRG40RStEUTNLemRiVnlx?=
 =?utf-8?B?N08xWnpYWWZZSks2bE5VUUZIUjdXQWZYVFdYWW5RZlkrODFXTjhjSVcvWDRG?=
 =?utf-8?B?R09hclB3WDg2T3RnSlF1RHFYMHNldElSc0x6NkxBMzJVUm93R3VYcWovT1Rs?=
 =?utf-8?B?Nk43cDkxRDhxRENkSW55eFl3akNDVWpLUUhaa2NuQ0Qxb0NuM01yaUZmQko2?=
 =?utf-8?B?VzVNNzFBdzZHQVNtUjhyYmFoQXJSR3o1V0tBa3AxVndlenFyUFZSNm16U2RL?=
 =?utf-8?B?ZytXdmNhUTVXNzdISGZ1Y3llWGJWYU1GUU5iSndPWWVXVW4rVUFidHF2eEtl?=
 =?utf-8?B?YnhZa3RNMXdFeFNSZ2JyMTFydXRYN0ZrcGg0Uk1oRjI1MTZkL3pESmRsK3dZ?=
 =?utf-8?B?N1pJWGx0d0RzY2R3UG4rSXVaZWJvMkJTNW5yMVlBY2d4ZURrY2Y5ZXZiUkpi?=
 =?utf-8?B?ZE9PNGUvU3ZwQWdSK041c1JoUStpREd4MDMva0ZyLzFMS05LK1dwNkdvOE1t?=
 =?utf-8?B?THE2T3E4dmgyaytPbFhFQ08yc21mOWdaUXFlbU5LTjlOT3JiOVdnbWY1aERN?=
 =?utf-8?B?eE40andrZ0w0bUtUZGdENHJ1aFZtSm44T1paYVdYeTg4aXUzVkhqaUYwKzQ4?=
 =?utf-8?B?K2JqMEVsMkNEWGUzTjZ5NzEzOEFlOFJMRFFjdDhJOUJMM28xTng0UXZnMGZZ?=
 =?utf-8?B?ZkhSRW5EU2pMU1A2akFQcWMydXo4bWZFWXVIUm5YYVlFUzV2em9xYTZURm42?=
 =?utf-8?B?alg5T1VyRkVEM25XRGk1YW1pT205TFJvaFg5MWJxVGxJTnFUdVZiNG5yS1lu?=
 =?utf-8?B?a1BMTlVrR2pVd1JBRUJKMkc0RnFSYzZoSGxPSFRua1Budy9BVnhsQWVyY3Er?=
 =?utf-8?B?cEVnOXJ2NXo2NE52bXlsY0FkaGJrcUY4SWFUei9FSVJHVnNlenZNSGVRbjNW?=
 =?utf-8?B?SzFBRStRVDZYdGZsLzJkMlhDUFVNZmVnNmpJaC9XNVpsSUZEVG9tSGVYSjZZ?=
 =?utf-8?B?aXlEZ0tBNHBieWdiYnFGTElQOGczYzkvelNvMDNoNEdjOEFlYksrZzdWcWM5?=
 =?utf-8?B?OHNqVXZjTit4czVqTjN5UTlPbnEvV1hPSmVEZVNKbHE1WmhiU0lPRWlLK1lV?=
 =?utf-8?B?cFM5ODV6cDVpTWhxU0svQklTZ212Tk1EcWw4Y3JsQUpkc3IzZDBVWklvYXRW?=
 =?utf-8?B?L1BSWHRoUC9mSVBobVdMekx1c3NBcm05L2gzNUVSRWpFRXh6SzBEcmx5dXRp?=
 =?utf-8?Q?AkSjC7?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d3BIdGVDTS9vbmZSVnVYb3JDNi80RTl4bnJnWW9wQUUrL3BhYUV0S0xNVDNZ?=
 =?utf-8?B?ZDVnZExDbFV1WjZqNVhXM3YvTVBESG4rNkJjZGJZMUVyeG1pL3huajUwS2o3?=
 =?utf-8?B?VmZlRTZkbVQzb2pnQmw1djMzU1NMVXdIVDloVlhQeWZ0MFJXNzBzbU1JNnpG?=
 =?utf-8?B?UlZuR2UzczFCVDl6aU95cjBRZ3FjWFNpOTltZ3lmUDFjMWpacDFqbVBNalVI?=
 =?utf-8?B?a2JMWW1tNE9CWmw0MHBLa09KbS9BeTRHK0hnK0xCL0xoTlY2SmFSb0dkQk16?=
 =?utf-8?B?RmtycUNIUkJEcERyc0xSVFVXdTZra3dQWE5GU3dHaXhPeU1RdjR5RFgzYVc5?=
 =?utf-8?B?czZENVZvOStRT2ZPYXA3QzV6VUh3SjBIMUR0ckpZd1pob1dLMUFoMWRWcEpv?=
 =?utf-8?B?emZGbEljbEViTVE1ZXZodGdod01CYldHOVhqV3RMN2ZaY0h0MjFmTkNwK0Fq?=
 =?utf-8?B?cGU0NXVsdzl3anprYmNTZGR1bGJaWVFFMEUxeHJaM3VhQmpzVEZkWkdEN2RU?=
 =?utf-8?B?RWJSQVlzUlJ2Lzh3UnpzYUJoQTVZOHo1cEtURS92ZGJrQ0Z2Snl5cGMwaGlB?=
 =?utf-8?B?QmFsYll1QVlweWxvMmlCVEwrZkROM3htMm5rMzNVbVpFQVRVMWJiWmVmeC9r?=
 =?utf-8?B?ZURXT0ZhVTZkNVhRakdCY1NjUjVNenVNanRDVkRGNW9HSThqNVpkbHZsZW5u?=
 =?utf-8?B?VjNETHhiNGc4UkViWHMrRUpad0cvY1VMZ1RTNlY1SitDcTZVbVNmbEtWR1V5?=
 =?utf-8?B?VlhBR2JGZWU1eXpnNndTdkk5TUhidU92ZmRuaTkxQjVxTFFtS1lNT2swNTRi?=
 =?utf-8?B?QW1BOThNdnJTZGxCeHJaYUpDbEpZS0V4eGw2NmZhWUV4THd6RTZEUWFlKzJi?=
 =?utf-8?B?MWVLRDZkYUI4eDhOMHpTRFdQUk9KT0JNWUVBL3ptczVVZEI3eDhFd1RKcEcy?=
 =?utf-8?B?d3NSY2p4VngzSStvdTFQOUJrWHV3dkhrckFoUU44UGdmWjFsdzJROGxrMjM3?=
 =?utf-8?B?VFVGdk1PNjdKK2hvaXdGTllrcGY1d1JsOW56aWkva0QzYTVJVHJ3SFlGZmpB?=
 =?utf-8?B?MlBFQ3poTng0T0ZETi90eStrZHl5ZGZwNWd0RTB5ZkE5c0Vja3I3NWY5UytU?=
 =?utf-8?B?ZUprVzAzZmJQODZVVFBYVnZTQTc5dG9JSXlVSHBRbUlsY0R2UkZZazYxdDlC?=
 =?utf-8?B?RVhISkVBQW5Cd1dGTFdhMzd1VG9lY3BmREhMaFZZVnIyYlNlMVVrblFjN2Rz?=
 =?utf-8?B?Rk1NOTBqcGs4azl6Ym5tZy8zODFSWHkxcXRKc2hUZ3lXTHg3VmdUNkdnaUdQ?=
 =?utf-8?B?Q3ZKYUtzNnFISE9RWVBGeXNHNGRiQ0RGNjlJZVdCLzFldm9FazVXY2pFZnRp?=
 =?utf-8?B?MEJCbXFwRTc2WitDRUxzTzlXaC9RZnh1Wmd3MGtTSnZtWnluRkpFOEozelZk?=
 =?utf-8?B?TjNxREV6TGNZNnZFaUFCUVNvT1I3cS96VG1RVXVFUkJRb0R1dE1uS3l3bGhC?=
 =?utf-8?B?eHRPcVloM2h5Q0wwcXdRL2NqQ1p0S1lreEcxMjRieGlNN3dDME5IVDRFQ2ZT?=
 =?utf-8?B?dWNJemxSajRlUFB4ZGZrWUhXSVVxazJjNUJrNFU1ejBvRjRWLzlQQU9ZOVEv?=
 =?utf-8?B?dVJObEhvU1pCVU1WcHNSNVhvcERoelFyV1BLZGhlRlQ1bnV3SWdoNnVlTjJ1?=
 =?utf-8?B?M1dqVVVWaWR1NTd1cmdHSXR0WStJWkE4WXJzSWxaVXplWnRPbW4vSThRQ01a?=
 =?utf-8?B?UTI0aWE3TWxrcDdZNmJieHl3bk9vSFBZeEZmRis0WWo1ZmdmVUh2UTJtM3hQ?=
 =?utf-8?B?aUdnc1ZKN0crVG03R0UyVzFZcGFMNUxvWFlKRUlIK2d0MEJHelFOVlVwVDNy?=
 =?utf-8?B?bFNhTnVIQUdxd3FCMnR4OWJwMlRDZWc0RmJPR25RMmZyZklVWWJpQVN1Q3Zu?=
 =?utf-8?B?YXNZN3pseXVoUk0xL0pkQ3dRZ0h4RmVIYmhhTXg2ZTdlcEE3RUVHQVVwdGQ3?=
 =?utf-8?B?TmxMd0VBd3lPWm9rVmRJdk1tVHJ6Q3VYc1c4NWxwR08vVnJXNGdYejdVQjB2?=
 =?utf-8?B?bDJSdk1naHVJRkhuSHFicTYxTmVBeWJkT1h6eGQ0cW4wUU1EWkVJeDhtR0dh?=
 =?utf-8?Q?UMHsrvMnr7HtdRple1ydWVRFi?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5f25869-bed9-42ee-ded5-08de3c847562
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2025 09:21:13.5849 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Qk5S5gFLvE58lpnD6O+w/NzFH3EYeF2Duue2UFxl/kO9NHszPFxWBgT5zi/iTDS7EBzl41xOOOt2Wdpa10DM1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6909
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

SGkgQWxleCwNCg0KPiBPbiBEZWMgMTUsIDIwMjUsIGF0IDk6NTfigK9QTSwgQWxleGFuZHJlIENv
dXJib3QgPGFjb3VyYm90QG52aWRpYS5jb20+IHdyb3RlOg0KPiANCj4g77u/VGhlIHNpemUgb2Yg
bWVzc2FnZXMnIHBheWxvYWQgaXMgbWlzY2FsY3VsYXRlZCwgbGVhZGluZyB0byBleHRyYSBkYXRh
DQo+IHBhc3NlZCB0byB0aGUgbWVzc2FnZSBoYW5kbGVyLiBXaGlsZSB0aGlzIGlzIG5vdCBhIHBy
b2JsZW0gd2l0aCBvdXINCj4gY3VycmVudCBzZXQgb2YgY29tbWFuZHMsIG90aGVycyB3aXRoIGEg
dmFyaWFibGUtbGVuZ3RoIHBheWxvYWQgbWF5DQo+IG1pc2JlaGF2ZS4gRml4IHRoaXMgYnkgaW50
cm9kdWNpbmcgYSBtZXRob2QgcmV0dXJuaW5nIHRoZSBwYXlsb2FkIHNpemUNCj4gYW5kIHVzaW5n
IGl0Lg0KPiANCj4gRml4ZXM6IDc1ZjZiMWRlODEzMyAoImdwdTogbm92YS1jb3JlOiBnc3A6IEFk
ZCBHU1AgY29tbWFuZCBxdWV1ZSBiaW5kaW5ncyBhbmQgaGFuZGxpbmciKQ0KPiBSZXZpZXdlZC1i
eTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogQWxleGFu
ZHJlIENvdXJib3QgPGFjb3VyYm90QG52aWRpYS5jb20+DQo+IC0tLQ0KPiBkcml2ZXJzL2dwdS9u
b3ZhLWNvcmUvZ3NwL2NtZHEucnMgfCAxMCArKysrKystLS0tDQo+IGRyaXZlcnMvZ3B1L25vdmEt
Y29yZS9nc3AvZncucnMgICB8IDEzICsrKysrKysrKy0tLS0NCj4gMiBmaWxlcyBjaGFuZ2VkLCAx
NSBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L25vdmEtY29yZS9nc3AvY21kcS5ycyBiL2RyaXZlcnMvZ3B1L25vdmEtY29yZS9nc3Av
Y21kcS5ycw0KPiBpbmRleCA2Zjk0NmQxNDg2OGEuLjc5ODVhMGIzZjc2OSAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy9ncHUvbm92YS1jb3JlL2dzcC9jbWRxLnJzDQo+ICsrKyBiL2RyaXZlcnMvZ3B1
L25vdmEtY29yZS9nc3AvY21kcS5ycw0KPiBAQCAtNTg4LDIxICs1ODgsMjMgQEAgZm4gd2FpdF9m
b3JfbXNnKCZzZWxmLCB0aW1lb3V0OiBEZWx0YSkgLT4gUmVzdWx0PEdzcE1lc3NhZ2U8J18+PiB7
DQo+ICAgICAgICAgICAgIGhlYWRlci5sZW5ndGgoKSwNCj4gICAgICAgICApOw0KPiANCj4gKyAg
ICAgICAgbGV0IHBheWxvYWRfbGVuZ3RoID0gaGVhZGVyLnBheWxvYWRfbGVuZ3RoKCk7DQo+ICsN
Cj4gICAgICAgICAvLyBDaGVjayB0aGF0IHRoZSBkcml2ZXIgcmVhZCBhcmVhIGlzIGxhcmdlIGVu
b3VnaCBmb3IgdGhlIG1lc3NhZ2UuDQo+IC0gICAgICAgIGlmIHNsaWNlXzEubGVuKCkgKyBzbGlj
ZV8yLmxlbigpIDwgaGVhZGVyLmxlbmd0aCgpIHsNCj4gKyAgICAgICAgaWYgc2xpY2VfMS5sZW4o
KSArIHNsaWNlXzIubGVuKCkgPCBwYXlsb2FkX2xlbmd0aCB7DQo+ICAgICAgICAgICAgIHJldHVy
biBFcnIoRUlPKTsNCj4gICAgICAgICB9DQo+IA0KPiAgICAgICAgIC8vIEN1dCB0aGUgbWVzc2Fn
ZSBzbGljZXMgZG93biB0byB0aGUgYWN0dWFsIGxlbmd0aCBvZiB0aGUgbWVzc2FnZS4NCj4gLSAg
ICAgICAgbGV0IChzbGljZV8xLCBzbGljZV8yKSA9IGlmIHNsaWNlXzEubGVuKCkgPiBoZWFkZXIu
bGVuZ3RoKCkgew0KPiArICAgICAgICBsZXQgKHNsaWNlXzEsIHNsaWNlXzIpID0gaWYgc2xpY2Vf
MS5sZW4oKSA+IHBheWxvYWRfbGVuZ3RoIHsNCj4gICAgICAgICAgICAgLy8gUEFOSUM6IHdlIGNo
ZWNrZWQgYWJvdmUgdGhhdCBgc2xpY2VfMWAgaXMgYXQgbGVhc3QgYXMgbG9uZyBhcyBgbXNnX2hl
YWRlci5sZW5ndGgoKWAuDQo+IC0gICAgICAgICAgICAoc2xpY2VfMS5zcGxpdF9hdChoZWFkZXIu
bGVuZ3RoKCkpLjAsICZzbGljZV8yWzAuLjBdKQ0KPiArICAgICAgICAgICAgKHNsaWNlXzEuc3Bs
aXRfYXQocGF5bG9hZF9sZW5ndGgpLjAsICZzbGljZV8yWzAuLjBdKQ0KPiAgICAgICAgIH0gZWxz
ZSB7DQo+ICAgICAgICAgICAgICgNCj4gICAgICAgICAgICAgICAgIHNsaWNlXzEsDQo+ICAgICAg
ICAgICAgICAgICAvLyBQQU5JQzogd2UgY2hlY2tlZCBhYm92ZSB0aGF0IGBzbGljZV8xLmxlbigp
ICsgc2xpY2VfMi5sZW4oKWAgaXMgYXQgbGVhc3QgYXMNCj4gICAgICAgICAgICAgICAgIC8vIGxh
cmdlIGFzIGBtc2dfaGVhZGVyLmxlbmd0aCgpYC4NCj4gLSAgICAgICAgICAgICAgICBzbGljZV8y
LnNwbGl0X2F0KGhlYWRlci5sZW5ndGgoKSAtIHNsaWNlXzEubGVuKCkpLjAsDQo+ICsgICAgICAg
ICAgICAgICAgc2xpY2VfMi5zcGxpdF9hdChwYXlsb2FkX2xlbmd0aCAtIHNsaWNlXzEubGVuKCkp
LjAsDQoNClRoZSBwYW5pYyBjb21tZW50cyBhbHNvIG5lZWQgdXBkYXRpbmc/DQoNCk90aGVyIHRo
YW4gdGhlIG5pdCwNCg0KUmV2aWV3ZWQtYnk6IEpvZWwgRmVybmFuZGVzIDxqb2VsYWduZWxmQG52
aWRpYS5jb20+DQoNCnRoYW5rcywNCg0KIC0gSm9lbA0KDQoNCg0KPiAgICAgICAgICAgICApDQo+
ICAgICAgICAgfTsNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9ub3ZhLWNvcmUvZ3Nw
L2Z3LnJzIGIvZHJpdmVycy9ncHUvbm92YS1jb3JlL2dzcC9mdy5ycw0KPiBpbmRleCBhYmZmZDZi
ZWVjNjUuLjdiOGU3MTBiMzNlNyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvbm92YS1jb3Jl
L2dzcC9mdy5ycw0KPiArKysgYi9kcml2ZXJzL2dwdS9ub3ZhLWNvcmUvZ3NwL2Z3LnJzDQo+IEBA
IC04NTMsMTEgKzg1MywxNiBAQCBwdWIoY3JhdGUpIGZuIHNldF9jaGVja3N1bSgmbXV0IHNlbGYs
IGNoZWNrc3VtOiB1MzIpIHsNCj4gICAgICAgICBzZWxmLmlubmVyLmNoZWNrU3VtID0gY2hlY2tz
dW07DQo+ICAgICB9DQo+IA0KPiAtICAgIC8vLyBSZXR1cm5zIHRoZSB0b3RhbCBsZW5ndGggb2Yg
dGhlIG1lc3NhZ2UuDQo+ICsgICAgLy8vIFJldHVybnMgdGhlIGxlbmd0aCBvZiB0aGUgbWVzc2Fn
ZSdzIHBheWxvYWQuDQo+ICsgICAgcHViKGNyYXRlKSBmbiBwYXlsb2FkX2xlbmd0aCgmc2VsZikg
LT4gdXNpemUgew0KPiArICAgICAgICAvLyBgcnBjLmxlbmd0aGAgaW5jbHVkZXMgdGhlIGxlbmd0
aCBvZiB0aGUgUlBDIG1lc3NhZ2UgaGVhZGVyLg0KPiArICAgICAgICBudW06OnUzMl9hc191c2l6
ZShzZWxmLmlubmVyLnJwYy5sZW5ndGgpDQo+ICsgICAgICAgICAgICAuc2F0dXJhdGluZ19zdWIo
c2l6ZV9vZjo6PGJpbmRpbmdzOjpycGNfbWVzc2FnZV9oZWFkZXJfdj4oKSkNCj4gKyAgICB9DQo+
ICsNCj4gKyAgICAvLy8gUmV0dXJucyB0aGUgdG90YWwgbGVuZ3RoIG9mIHRoZSBtZXNzYWdlLCBt
ZXNzYWdlIGFuZCBSUEMgaGVhZGVycyBpbmNsdWRlZC4NCj4gICAgIHB1YihjcmF0ZSkgZm4gbGVu
Z3RoKCZzZWxmKSAtPiB1c2l6ZSB7DQo+IC0gICAgICAgIC8vIGBycGMubGVuZ3RoYCBpbmNsdWRl
cyB0aGUgbGVuZ3RoIG9mIHRoZSBHc3BScGNIZWFkZXIgYnV0IG5vdCB0aGUgbWVzc2FnZSBoZWFk
ZXIuDQo+IC0gICAgICAgIHNpemVfb2Y6OjxTZWxmPigpIC0gc2l6ZV9vZjo6PGJpbmRpbmdzOjpy
cGNfbWVzc2FnZV9oZWFkZXJfdj4oKQ0KPiAtICAgICAgICAgICAgKyBudW06OnUzMl9hc191c2l6
ZShzZWxmLmlubmVyLnJwYy5sZW5ndGgpDQo+ICsgICAgICAgIHNpemVfb2Y6OjxTZWxmPigpICsg
c2VsZi5wYXlsb2FkX2xlbmd0aCgpDQo+ICAgICB9DQo+IA0KPiAgICAgLy8gUmV0dXJucyB0aGUg
c2VxdWVuY2UgbnVtYmVyIG9mIHRoZSBtZXNzYWdlLg0KPiANCj4gLS0NCj4gMi41Mi4wDQo+IA0K
