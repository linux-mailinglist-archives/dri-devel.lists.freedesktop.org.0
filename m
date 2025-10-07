Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA17BC2F63
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 01:38:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2F3F10E71B;
	Tue,  7 Oct 2025 23:38:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="pZQ1LYoM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012001.outbound.protection.outlook.com [52.101.48.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47AB310E719;
 Tue,  7 Oct 2025 23:38:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CTol0/SzxmhRffGtN8Px3kjXB+o5tEeAsuzyoelGxlMSS+YKAgjpLYOjYWYLSFX+tCTCU8kZNqAg6Yol/4jZtgBaKOhn3nT5umcQJJPTlbjBA3WcHuO7o9HtJ6320TXXQlv9kz0eD+BR2QJwENwoeSF7MZx6K4yKEamGkDto6RxL+tMpiBpRkwKpds3C5WYG08IXvDL9aLevNDXPCuoPlq7z9YldmyMUvIh1XXPhjdmbFUrMXh1NONLa5nR5jIhpClMAp3e4C6SOmAiJ+U1fRf7HVGs5PPMDnWlPS8UjqxNC/qe1sf4hAkKwyPSoo60FmtAOszwVVKAMWs7E1Kx54Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uB8Ab9OsZn6IWKyFQcS4xQShUIA7hcF12yqfMG1OnZI=;
 b=YwmcwyB/fMCXXFX3abg/YmqXEIpTXphBllCt8vGpSzFEWRs2mVhm62/uITyEl7uhb5NVy9VMu/Af1AoOAorPsPut+ZO7Q8L1v//yc2MS2VR1Zdiul1n3FKNdq1MYo6WDnNHauzLhC0kXeAHeiViAF7w4GxGHlWELbE2CAOHqwCSpdRWgTSc4hK4jiUnWE6lQCQVmiEYPPM3DJ6FZjmIkwM1MHk38UTZ0/RVZqTeqqIm+J5Lpv6V9FfKqKpxynQYYtz3vc/wM8xn9DNBPtQhtWu6ijk41+Wu60lOsB+9Z6u40TuT3t4Kolfo8obqnCU4mNf1fwc4uGq+ToiF2UcyH0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uB8Ab9OsZn6IWKyFQcS4xQShUIA7hcF12yqfMG1OnZI=;
 b=pZQ1LYoMm3DIfJP+fRCTzdnZk9EuH5tai9UWgedvF80xIsbWPoLYiJlMBn/gb/jEyYmRXvfedwQnWopDJ1trrHUz2h0HXDI21Us6nE6JXhKcHX9JbIYwMVDvi4T+fe9Zo21ZRMNfOfkClggOkeXiycZmnRZ0PlYz6LVMGq1DYOhO3bocKA7sZyk1b+b9buLrgdJVOkvawVgFUGSeJapn86TaJ3v+VxRuWxmKtwDln02clZBTlIprpjX4PLjsOiowm/q6FekTslnEQrsvxZOKx/fV7YYiUNN+NKgIo+YYM3TVlgdfCE7Krisrx8if0NUFyn2S688Q4TysnUOeXg1asA==
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by IA1PR12MB8078.namprd12.prod.outlook.com (2603:10b6:208:3f1::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.18; Tue, 7 Oct
 2025 23:37:49 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 23:37:49 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
CC: Alexandre Courbot <acourbot@nvidia.com>, Yury Norov
 <yury.norov@gmail.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, Alistair Popple <apopple@nvidia.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun
 Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>, Benno Lossin
 <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, John Hubbard <jhubbard@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, "joel@joelfernandes.org"
 <joel@joelfernandes.org>, Elle Rhumsaa <elle@weathered-steel.dev>, Daniel
 Almeida <daniel.almeida@collabora.com>, Andrea Righi <arighi@nvidia.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v6 0/5] Introduce bitfield and move register macro to
 rust/kernel/
Thread-Topic: [PATCH v6 0/5] Introduce bitfield and move register macro to
 rust/kernel/
Thread-Index: AQHcN+Nkn3jvchAnRUaj+gejulVlyQ==
Date: Tue, 7 Oct 2025 23:37:49 +0000
Message-ID: <695CCDCE-A205-4557-AA15-6F102B8CCF0C@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8059:EE_|IA1PR12MB8078:EE_
x-ms-office365-filtering-correlation-id: 364cf33d-c291-4922-153a-08de05fa86c0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?cWRVSDlBUFQzVnd5TUFKRTVzaEFCRnNoNXhaL0pnM2hxV2krTHJPb2tRUlZr?=
 =?utf-8?B?a2UvY0lEZGpYK1IrUWZHN2NCQm0zU2NSL3BmK0drV0JGVnF3VVo4UEYxQ1Vx?=
 =?utf-8?B?bGsyT3ExVy8vNm1POUpXcUw1OWJCOER4Ulpja3VzUldlVHZKUytud2FEcHdU?=
 =?utf-8?B?YjVSRjBWTTdyK0huWUd1SGpTRWFScW5yVkcwZnVwWFZLUjVUTzlZY2JhVWc5?=
 =?utf-8?B?UEdCcS9aM3hPYVhLaTNFV1FwUjlEWEwwNCs4a1RlUk5OUWtPNjNZZGhpblFz?=
 =?utf-8?B?blNQVFdwQjAxUDVxcDF2UDF1Zldlc0xISkdlYmN6TkJ6YjhQYmpEZ1JYT1ZZ?=
 =?utf-8?B?ZnpUb0JTZDNzRlMyYXFocXZpWXRhSG1mWUttMldENk94cVRsZDJOWDB3SkJu?=
 =?utf-8?B?aFlSUE1mY3BaM1Y1anpma0pYYnVPSVB3ak9SYmFmWGRwWkFVR3lEamgrdllY?=
 =?utf-8?B?ZnJ4RWh0Ri9rZzNTb2ZYUzRWM1ZtcUxkMjFNQXhQWHp3UFhIK1ZrSmNIUXVj?=
 =?utf-8?B?aXZYeUxnSDZ0dTJYTlk2YWRidFFhUTZnSThYNEYrZzVCTWhMSmhKazVSVXRV?=
 =?utf-8?B?T1ZDQnR1VldTSDIydGozVTZBSFlqNENVRGVXak9IVE1hQ1ZGUm03R1FleHQ2?=
 =?utf-8?B?TUpSNHBXcGRaSUVveWdQa2llWE9wdGJxUllsckpuMmNKR1ZvYnNPdzVqMmpS?=
 =?utf-8?B?TW84S2dzeHZjMDJlZ3FhbktLOGxUR0crbjRXSERLMnVSbTJSVHFBcHpLMlNZ?=
 =?utf-8?B?bnJ0YWllOTlFdVFqUzVUY1FsZGJXWHdrcWxURGp0cE5TWERtdDd6dmtaS3Rj?=
 =?utf-8?B?M3h6ZmVEZ2ova2IxcVg5anN3SENLRllUN0FyeXcyOTg5a0lPV0VvRFJQNDVw?=
 =?utf-8?B?eXQ0Q2trMkw0TlVueFIrTldzZEpBNG9JRW5zTld3K0dzNngyMlhkWVRWTEps?=
 =?utf-8?B?YitNemVtbFlibEM2RStvU2hPTUdjcnVFdkZDWG9DcmJ3dExNZ3E1NVZmVjFj?=
 =?utf-8?B?WGM3N0Y3Z1hSYjg3a1NlVXduckpqMVpaeVJ1bGV3dGFRL3JYcE5Ya3Y0VHhS?=
 =?utf-8?B?L3BvQWU3Y0RwbStnemhmcWpiSnNlcklyekVBU1NGYlRoa3U1MVhrdCszalhu?=
 =?utf-8?B?VzN5bW9uSVdYZ0ViWVY5S2VuQ2h0R28zZmdxOFpxeGpEWFhUZ1kyK1o3aDVT?=
 =?utf-8?B?aXdoU2F4UGtXUjIxSDE1RlZJNitnQnVyeEtlSDJSM0h0RTBrS3lKSklQQVVG?=
 =?utf-8?B?WUcwSStLU05kVkRDRXhqOVBEL3VKb0xjTUIvSlRNbGo3bXNyRzZKWFZuVWdB?=
 =?utf-8?B?OVQzRE40VEVuU0dIcVZNclBUMlVJVXhqVVIzR3JuQnNLcFY3dm9yaXRCTlVo?=
 =?utf-8?B?N0Q4Q09NYWFESEVsK0lHa1Z2VCtXcFhIakpocEZqN2c4UVFDZkhqWFJiL1V4?=
 =?utf-8?B?VWpmNmRIZXdMWDVveC9yVm9sL2dMK256K1RuTk9NMnE0REZCVmhXT01WaUpi?=
 =?utf-8?B?ZlpFUnBINUVtVWZwdmFBV0QvL3Y2bGdUUXNTY3d0a1hEUHlOeEg4MnFxWE9x?=
 =?utf-8?B?MTc3d3VNZkxSL0VJUTV3bEo2ZkNMdEtjQ0tneXZTNlVIc1NpMURkU3VmNmFN?=
 =?utf-8?B?bTNmeUNaL3RnRjVONGMzcEtJZUZISjRlK1FSYS96WE9zQlFHcWxra3R6bW5T?=
 =?utf-8?B?Y0wxQTB3ZVcwREtmcEtMWVlxV213VHpTQjdpNXF3Y2UzMjROYkM5MEd5VjRM?=
 =?utf-8?B?YlVjdlpkZCtPL2x2ZlRpWGtZTGtuV0ZwR0h3NVlhOXV2dHFoQmJsbmM3TXRh?=
 =?utf-8?B?b2dZQXNYVkgzY3p2WkZxeDBJREdjUGNCN2J2OFlKdWVqU0NCQkR1djJhc2lq?=
 =?utf-8?B?ME1MTnVWWHBaUW1yc284c0FKMEgwTjlyOVdaVEl0M1UyNndVZFNxVjQvZmdp?=
 =?utf-8?B?czZxZjBMSkxHZ2ZENGV5eFVML3pZWlpnQzFvU0NwZUdqcmxVc2t2U3RvNThk?=
 =?utf-8?B?MHgvdlhJMkRrTWdnZzRpQ2NxY2djOGJMVCtuL3E0R1A1a3FuZXNWNTZjSnRU?=
 =?utf-8?Q?7QDbLy?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z3AyVzZRbW5tZ0Z6WHZ1S05VKzloNEwwalVWTm9heWtZWXBhdzJBZEJ0THpu?=
 =?utf-8?B?RTI2dHRrSWpzZzFFeFkwaVJldGh4LzI2U21HNDdVcmpCdWZrQ2Z2WGptbzl5?=
 =?utf-8?B?K0dVSkhkMWtmeE5QajF3NVUxa01BSWFFb1Y4L3ZFUzc5MlJDSkZnRHJRSlFD?=
 =?utf-8?B?VEZuWHZGS3c1RTZHUEFKWTBkZlZnbGE2aGFiY21RN2N6WHU2cHA4WDZXd0RN?=
 =?utf-8?B?TlFVU05Ibjl0Rll0QmhLa3hGQUJnMzlsNnVzRytoMGtnT1pRMUpkWVFEa3VG?=
 =?utf-8?B?MXpjYjBhSWFqd3hlRmxEek1maVpwajA1dldJdVI3MzE3d08zdUtPK1ZkSVZ5?=
 =?utf-8?B?MGFaclZxb1dSbkFuTml4RzRCaWp6UWN4T1lxQWhSajJ6MHNtSnVKZGw5Ykxi?=
 =?utf-8?B?M0hXYjlTS2docDF6SVQ0b0tzbGRiVmUxYXJTOXRUaEJIdlNzbGcwZkRwYmY3?=
 =?utf-8?B?TUxqZ1p5ekJXblB6RlRIc3ZUTE1mSFlWazB4UGFjTDRtMktKVGhSTXlyeG9p?=
 =?utf-8?B?cDllUXBuMjZvNlNGTjRhdmZkazFQOURiM3ljZmlhQ3F6MHlSRVRUb0t6V0E4?=
 =?utf-8?B?Smhwemt0dHZHV05OSlF3NnBFcWlZMHZ6OWpMbE1KaEFrV2U4ejVtMlFHWWV4?=
 =?utf-8?B?cjJUYktBYVFEdWpSK00zSVRlL09pV3lyeDdoZDhoWHBrVHVaQ2dpaHVIOWxF?=
 =?utf-8?B?Q3ZSK0dGaU9sWEI5REh1b0UrU3lRL253dVRLYWRiNXc5VmEzaEJPYWE0RXJ1?=
 =?utf-8?B?ZVlUVnNYaWN6T2ZVeTN2SlArTDBZRzlKekFQZW5HNU9zSzk2U00rVDM4K0ZQ?=
 =?utf-8?B?UU1aWnlURXJRdTNoZG5KVUQzTHBwQ0Z2ajhHTEtIRmplcUYrbUtyQ2JVL1Ev?=
 =?utf-8?B?VURSYTYwZjZlenRna0RMOEZmMVZZcW5tRGI4azRoUDlIZmxscHZsdEJrNGdr?=
 =?utf-8?B?SU9kRWRFelNXanZyTWZhQTcybTd0eGdhYTJvMlMzRGF0ellrc2w2TzJQcS9j?=
 =?utf-8?B?ZEo1bmpYT2g3bDYrbzZTc0VEMXV1UnpQVzFuRlBMU1hwTTNCNk1qdEpUNmFK?=
 =?utf-8?B?OEVxUWIwcHJwa0lUSjRPSkxJOWVXZ0xxSit6WjBiMzBiaUthcFc0aldsYVk0?=
 =?utf-8?B?VmxlZjlUNVBjZlFodnY1M1IrMFI3bW94MFhkUzBIY2l0UklQTEVTcHI2bUIv?=
 =?utf-8?B?YzZRamNTQW1aTlk5VUNTdStRQ1dVQ2hVMEtYQ0pIWmE3MHlHZ3R4czF3eHFj?=
 =?utf-8?B?N3VwVytWTlNSUlFtQlF6VkZma1V0MVdoc01TKzByQVhFNG11akdlb3NWUzc4?=
 =?utf-8?B?aFB4MUdaa3NCNEtrYmo1ZWlXYXMwVXFVb0JCM1N5MXR4VjNESHB3QUZUZUtk?=
 =?utf-8?B?eVgrMmZJL2poTXdmbWRRTisvQ2xqNEg2UTNJQWlnYjFBZXRmUlZkcXdCQ0gr?=
 =?utf-8?B?Tk1IZ1dycjV6Y3hzemdMR1Rha2xEei82Z01wS1NZblBHU1duK2ZsdU00R2U4?=
 =?utf-8?B?NVlRQm10c1dmYWVsam9IdGRFdVFmdGlCTjJ1djA4bllZZHZZNXBFeE1mOWhl?=
 =?utf-8?B?cWpuM3lLVmVaS1VJVHZjTERZank4QXJ6MjAzNGxPKzZ1b3owL25wUFFJOWhj?=
 =?utf-8?B?cGlwWFlheW56UVVZekNlVVhHUS80dkVxaGc3Z0pMVlFzamRjaFJXQnE2T2Jo?=
 =?utf-8?B?eWRGOFJFd2tabHdHejlpWGVHKzg3NXk4cWpOV2ZpeFZZRUdvRVZGd0lrVXdK?=
 =?utf-8?B?ZVIxUTMwclVMMSt2M05iUXd4QWt4eldhUXFGeU1sUG1iRlRzTGg5RHcydVNo?=
 =?utf-8?B?ZnJTWHp4RlVtaGdEcWJLbDBJZ2lKMW1xcVVybmZrUnNlczROaWtBdDBHVWZn?=
 =?utf-8?B?ZS9Sa1d0NTZTa3RlM1hjOXpaTHBtdk1FMFErUFFJS2RCb1YwcGpkMG9tTXFu?=
 =?utf-8?B?Y051NlZmZW9GSFhxbXplRXJkekpkRnQwVGJHUnRZNWpibittUDREaWliYlpV?=
 =?utf-8?B?Yjg4a3h2Q0dmYlRNNDBkdktMbEVDTko1cTRVajlUNkZjTHpUUWUvRTNLVzJL?=
 =?utf-8?B?NEFTanhKZHo2KzdteEt3a25wNENYVHhGQ1cwUEZEM0RHQTlRMGpUbzZQZ2tr?=
 =?utf-8?Q?n7qgwISyBPUQtf4BPCKjuJpao?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <86AD4C19581E464998F3157D7B075714@NVIDIA.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 364cf33d-c291-4922-153a-08de05fa86c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2025 23:37:49.3692 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TKxLOFf/CILVNnrk/gHyxl30qCKV/mRo5c9lDmNMI73hqZ9DNumq5uSg5+RuiLYuRd7L44SrLVsZQMcOZh0a8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8078
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

DQoNCg0KPiBPbiBPY3QgNywgMjAyNSwgYXQgNjowOeKAr1BNLCBEYW5pbG8gS3J1bW1yaWNoIDxk
YWtyQGtlcm5lbC5vcmc+IHdyb3RlOg0KPiDvu79PbiBUdWUgT2N0IDcsIDIwMjUgYXQgMTE6MDgg
UE0gQ0VTVCwgSm9lbCBGZXJuYW5kZXMgd3JvdGU6DQo+PiBEYW5pbG8sIFl1cmksIE1pZ3VlbCwg
Sm9obiwgYWxsLA0KPj4gDQo+PiBPbiAxMC83LzIwMjUgOToxNiBBTSwgRGFuaWxvIEtydW1tcmlj
aCB3cm90ZToNCj4+PiBPbiBUdWUgT2N0IDcsIDIwMjUgYXQgMTI6MzYgUE0gQ0VTVCwgQWxleGFu
ZHJlIENvdXJib3Qgd3JvdGU6DQo+Pj4+IEJlY2F1c2UgbGV0dGluZyBpdCBmdWxseSBtYXR1cmUg
d2l0aGluIG5vdmEtY29yZSBhbHNvIGhhcyB0aGUgZHJhd2JhY2sNCj4+Pj4gdGhhdCB3ZSBtaWdo
dCBtaXNzIHRoZSBwZXJzcGVjdGl2ZSBvZiBvdGhlciBwb3RlbnRpYWwgdXNlcnMsIHdoaWNoIG1h
eQ0KPj4+PiBtYWtlIHVzIGRyYXcgb3Vyc2VsdmVzIGludG8gYSBjb3JuZXIgdGhhdCB3aWxsIG1h
a2UgdGhlIG1hY3JvIGxlc3MNCj4+Pj4gdXNlZnVsIGdlbmVyYWxseSBzcGVha2luZy4gV2UgYXJl
IGF0IGEgc3RhZ2Ugd2hlcmUgd2UgY2FuIHN0aWxsIG1ha2UNCj4+Pj4gZGVzaWduIGNoYW5nZXMg
aWYgbmVlZGVkLCBidXQgd2UgbmVlZCB0byBoZWFyIGZyb20gb3RoZXIgdXNlcnMsIGFuZA0KPj4+
PiB0aGVzZSB3b24ndCBjb21lIGFzIGxvbmcgYXMgdGhlIG1hY3JvIGlzIGluIG5vdmEtY29yZS4N
Cj4+PiBUaGVyZSBhcmUgdHdvIGRpZmZlcmVudCB0aGluZ3MgaGVyZSB0aGF0IGFyZSBnZXR0aW5n
IG1peGVkIHVwIGEgYml0Lg0KPj4+ICAoMSkgTW92aW5nIHRoZSByZWdpc3RlciEoKSBjb2RlIG91
dCBvZiBub3ZhLWNvcmUgdG8gbWFrZSBpdCBhY2Nlc3NpYmxlIGZvcg0KPj4+ICAgICAgb3RoZXIg
ZHJpdmVycy4NCj4+PiAgKDIpIEdlbmVyYWxpemUgdGhlIGJpdGZpZWxkIGltcGxlbWVudGF0aW9u
IHRoYXQgc28gZmFyIGlzIGJha2VkIGludG8gdGhlDQo+Pj4gICAgICByZWdpc3RlciEoKSBjb2Rl
Lg0KPj4+IEJvdGggb2YgdGhvc2UgbWFrZSBzZW5zZSwgYnV0IHRoZXkgZG9uJ3QgaGF2ZSB0byBo
YXBwZW4gYXQgdGhlIHNhbWUgdGltZQ0KPj4+IG5lY2Vzc2FyaWx5Lg0KPj4+IE5vdywgSSdtIG5v
dCBzYXlpbmcgdGhhdCB3ZSBuZWNlc3NhcmlseSBoYXZlIHRvIGNoYW5nZSB0aGUgYXBwcm9hY2gg
aGVyZS4gVGhlDQo+Pj4gY3VycmVudCBtZXJnZSB3aW5kb3cgaXNuJ3QgZXZlbiBjbG9zZWQsIHNv
IHdlIGhhdmUgcGxlbnRseSBvZiB0aW1lIGxlZnQsIGkuZS4NCj4+PiB0aGVyZSdzIG5vIHJ1c2gg
d2l0aCB3aXRoIHBhdGNoIHNlcmllcy4NCj4+PiBIb3dldmVyLCBpZiBpdCBoZWxwcywgSSdtIHBl
cmZlY3RseSBmaW5lIHRvIHRha2UgdGhlIHJlZ2lzdGVyISgpIGltcGxlbWVudGF0aW9uDQo+Pj4g
aW50byB0aGUgSS9PIGVudHJ5IGluIGEgZmlyc3Qgc3RlcCBhbmQgaW4gYSBzZWNvbmQgc3RlcCBn
ZW5lcmFsaXplIHRoZSBiaXRmaWVsZA0KPj4+IGltcGxlbWVudGF0aW9uIGFuZCBtb3ZlIGl0IG91
dCBvZiB0aGUgcmVnaXN0ZXIhKCkgY29kZS4NCj4+PiBBZ2FpbiwgdGhlcmUncyBubyBydXNoIGFz
IGZhciBhcyBJJ20gY29uY2VybmVkLCB5ZXQgdGhlIGxhdHRlciBhcHByb2FjaCBtaWdodA0KPj4+
IGFkZCBhIGJpdCBtb3JlIHN0cnVjdHVyZSBhbmQgaGVuY2UgcnVuIGEgYml0IHNtb290aGVyLg0K
Pj4gDQo+PiBJbiBteSB2aWV3IGl0IGlzIGJldHRlciB0byBtb3ZlIGJvdGggYml0ZmllbGQgYW5k
IHJlZ2lzdGVyIG1hY3JvcyB0b2dldGhlcg0KPj4gYmVjYXVzZSBpZiB3ZSBvbmx5IG1vdmVkIHJl
Z2lzdGVyLCBpdCBtZWFucyB3ZSB3b3VsZCBoYXZlIG5vIGJpdGZpZWxkIHN1cHBvcnQNCj4+IGZv
ciB0aGUgcGFnZSB0YWJsZSAvIG1tIHVzZSBjYXNlIEkganVzdCBwb3N0ZWQgYSBwYXRjaCBmb3Ig
KHdoaWNoIGlzIHdoeSBJDQo+PiBzdGFydGVkIGxvb2tpbmcgaW50byBCaXRmaWVsZCBzdXBwb3J0
IGluaXRpYWxseSkgdW5sZXNzIHdlIGNyZWF0ZSBhIGNvcHkgb2YganVzdA0KPj4gdGhlIGJpdGZp
ZWxkIGNvZGUgd2l0aGluIG5vdmEgd2hpY2ggd2UgZGVmaW5pdGVseSBzaG91bGRuJ3QgSSB0aGlu
ay4gU28gSSB0aGluaw0KPj4gaXQgaXMgYmVzdCB0byBtb3ZlIGJvdGguDQo+IA0KPiBBZ2Fpbiwg
ZmluZSBmb3IgbWUgZWl0aGVyIHdheSwgYnV0IEkgd2FudGVkIHRvIG9wZW4gdGhlIHBvc3NpYmls
aXR5Lg0KPiANCj4gVHlwaWNhbGx5LCB0aGluZ3MgcnVuIG1vcmUgc21vb3RobHkgd2hlbiBmb2N1
c2luZyBvbiBvbmUgdGhpbmcgYXQgYSB0aW1lLg0KPiBFc3BlY2lhbGx5IHdoZW4gb25lIHRoaW5n
IGlzIGRvbmUgdG8gdW5ibG9jayBzb21ldGhpbmcgZWxzZSwgd2hpbGUgdGhlIG90aGVyDQo+IHRo
aW5ncyBuZWVkcyBzb21lIG1vcmUgZGlzY3Vzc2lvbiBhbmQgbWlnaHQgcmVxdWlyZSBhIG1vcmUg
c2xvdy1wYWNlZCBhcHByb2FjaC4pDQo+IA0KPiAoU2xpZ2h0bHkgb2ZmLXRvcGljOiBSZWdhcmRp
bmcgdGhlIGJpdGZpZWxkcyBmb3IgcGFnZSB0YWJsZSBtYW5hZ2VtZW50OiBBcmUgd2UNCj4gc3Vy
ZSB0aGF0IHdlIGNhbiB1c2UgcmF3IGJpdGZpZWxkcyBmb3IgdGhpcz8gSS5lLiB3aWxsIHdlIGFs
d2F5cyBiZSBhYmxlIHRvDQo+IGNvbmZpZ3VyZSB0aGUgR1BVIHRvIG1hdGNoIENQVSBlbmRpYW5u
ZXNzPykNCg0KVGhlIE52aWRpYSBHUFUgYXJjaGl0ZWN0dXJlIGlzIGxpdHRsZS1lbmRpYW4gKGlu
Y2x1ZGluZyBNTVUgc3RydWN0dXJlcyBpbiBWUkFNKS4NCkFsbCB0aGUgQ1BVIGFyY2hpdGVjdHVy
ZXMgb3VyIGRyaXZlcnMgc3VwcG9ydCBhcmUgZXhwZWN0ZWQgdG8gYmUgbGl0dGxlLWVuZGlhbi4N
Cg0KPj4gRm9yIHRoZSBJTyAocmVnaXN0ZXIgbWFjcm8pIGNoYW5nZSwgSSBjYW4gYWRkIGFkZCBh
biBlbnRyeSB0byB0aGUgZXhpc3RpbmcgSU8NCj4+IHJlY29yZC4NCj4gDQo+IEkgZG9uJ3QgdGhp
bmsgYW55IGNoYW5nZXMgYXJlIG5lZWRlZCwgaXQgc2hvdWxkIGJlIGNvdmVyZWQgYnkganVzdCBt
b3ZpbmcgaXQgdG8NCj4gcnVzdC9rZXJuZWwvaW8vcmVnaXN0ZXIucnMuDQoNCk9rLCB0aGFua3Mu
DQoNCi0gSm9lbA0KDQoNCj4gDQo+IFRoYW5rcywNCj4gRGFuaWxvDQo=
