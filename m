Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IHt2NKGmi2lPXwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 22:44:01 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 671AF11F7D7
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 22:44:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E2B810E10E;
	Tue, 10 Feb 2026 21:43:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="OubcMJ2T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010033.outbound.protection.outlook.com
 [52.101.193.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9C1810E097;
 Tue, 10 Feb 2026 21:43:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wBNyU3N9GARuhxuaQYwf/Xy/MVEY2CWeJgYvtOILxd+GRNUobx/RvWCefOVhObHM/4Xwa5fj2ZVoBmfDm5QZVf7VfRQopCWR9NjUWEZONN6HqlGF/vQ111sjS0UYmDf+2/e07Qhf8NKPX9bsSkhyTVTgV9aBre5wSqGjHn5Hi4+NUbQlc/z3pBJ2Xms+Lj+YAqqZFtndwaerFwz7hKF9ZnNg2Y6pbg5k+mzb7KyPn18mGKvW+oytIMbn4JMXEANVjO7c3JW2PvwVS6VS0mWeZjv7HT0I2xHX8ztoKANcYc7IljoxQPPfJy4GYar+ePnfYB+o4w88bCIzUOBHpuQJ7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0VFqmKGtuawPCu1pQarV0b0eixzTS4r9CmbdgMgXeJM=;
 b=ej3ymkWqmVnGJjtpa0vs3kC2lK+zw7EAfpQXjg9tKBjOXB9tREBqZ6/B8huOVoNBZ+Nbt9my2zqXjhba3Fz9bH6LBKWienoAiTnwD4fdJ0Or3OZPOVwOVVEkCXbNHn3itWqVK+jwnJssKlRatNAQWxaFubx20UdLuDyObN2MTgR6ABPWr63DrvI83CriOxFjI6mbxuQxYH/6kNR/jrUd4Y+lpcRlnnMkZvf9ywL7xIsFDD0bibqmdrdmo3llzgy7759t5i7pRqNCtwKKsv78+jA/9RsD2wYVc5fNz3yxx8PS+5h738U2+1g4rq9k+QzdcN2SMahiqY/ndH5JBtjPCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0VFqmKGtuawPCu1pQarV0b0eixzTS4r9CmbdgMgXeJM=;
 b=OubcMJ2TDTDcn3i+Jlf/cXtmi0Jpec+b9ESH+3tU4ufsAX/OrcxcITW3m/09oslNlxgdTs72wuOnP90XrmhqTJqxRW4zk0H08MGxj0V112LG0owF8tHRXVOEX9G+UDy/63MXO9SPuUv1FCpA5JlxTYU4LfjDlmHU3mQfzxh8xdu5TZgGRzSt4D9aTa8IrLNYEjXtvD5M+QkoLlsgpl4ZCFXr29a7mrkZszkQSkSvuDGMr4p50nD1dhZBmTFsetJapsaY5KE0Gv38rcfs9l+rg8FGoAFnKRJLZOzaUnLKhmN3QK1WlSNf0LsDP8i8+6nxd7nTMf9tJWI2csDJ93FLSQ==
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 CH3PR12MB7548.namprd12.prod.outlook.com (2603:10b6:610:144::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 21:43:45 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 21:43:45 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jonathan Corbet
 <corbet@lwn.net>, Alex Deucher <alexander.deucher@amd.com>,
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Vivi Rodrigo <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Rui Huang <ray.huang@amd.com>, Matthew
 Auld <matthew.auld@intel.com>, Matthew Brost <matthew.brost@intel.com>, Lucas
 De Marchi <lucas.demarchi@intel.com>, =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?=
 <thomas.hellstrom@linux.intel.com>, Helge Deller <deller@gmx.de>, Alice Ryhl
 <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor
 <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
 <gary@garyguo.net>, =?utf-8?B?QmrDtnJuIFJveSBCYXJvbg==?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, John
 Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, Timur
 Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, Alexandre Courbot
 <acourbot@nvidia.com>, Andrea Righi <arighi@nvidia.com>, Andy Ritger
 <ARitger@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, Balbir Singh
 <balbirs@nvidia.com>, Philipp Stanner <phasta@kernel.org>, Elle Rhumsaa
 <elle@weathered-steel.dev>, Daniel Almeida <daniel.almeida@collabora.com>,
 "joel@joelfernandes.org" <joel@joelfernandes.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>
Subject: Re: [PATCH -next v8 2/3] rust: gpu: Add GPU buddy allocator bindings
Thread-Topic: [PATCH -next v8 2/3] rust: gpu: Add GPU buddy allocator bindings
Thread-Index: AQHcmg0OcaJILsylL0ub/WSFHjFym7V71BGAgACKC4CAABEHAIAACWxU
Date: Tue, 10 Feb 2026 21:43:44 +0000
Message-ID: <8DA337FC-2395-472A-9264-C6F656A1263D@nvidia.com>
References: <20260209214246.2783990-1-joelagnelf@nvidia.com>
 <20260209214246.2783990-3-joelagnelf@nvidia.com>
 <DGB9G697GSWO.3VBFGU5MKFPMR@kernel.org> <1770754015.1979311.8126@nvidia.com>
 <DGBL94I0E5UB.4LNH3JODOKPV@kernel.org>
In-Reply-To: <DGBL94I0E5UB.4LNH3JODOKPV@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR12MB6486:EE_|CH3PR12MB7548:EE_
x-ms-office365-filtering-correlation-id: 5084143b-1917-4d25-72ea-08de68ed7739
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?VlVGRlJDN3pGMVA4UGp1MVhUNzZjdE5hb1J6emZyRDc5RTBYMElNSzlmVlpu?=
 =?utf-8?B?bHNXejVCSkczaFI1cElIVHZ0QUIzQ3FTMHpGa0ZFNE8vYjlVbm9WeVluVE1y?=
 =?utf-8?B?TDk0dTN1RXBkTjhwaHNpbXZTdUxuSnJtc1FmN1VsMVlXbmkwblR3ZUFtU0FP?=
 =?utf-8?B?R3JvbWFkTTdIQjNsZjhjeDRMSjVIeExNaDhhTDNScllVTWkzTTBnTUpYb0Ju?=
 =?utf-8?B?RGNmRGVOaWllZDJkcGNFSGJnU2txMEkyVE5GbDJYaWZsbEVnSDNINTM2eHo5?=
 =?utf-8?B?V3ZkWlN0YWlEUk1oRUdIeUxqckR2c0RReEJzMTRJQnJZTjl6SWxlUEZNTVo3?=
 =?utf-8?B?dk9rTlI3ZFZ2dkhJa29xQk5RemNBLzFEQzFiTG9ZOWY5dWdXR1NvSWxjaW1L?=
 =?utf-8?B?SG50S0hwMXJBSzg1bnVYcXFCR0lrM1JVK1RoU2w1Q2kydE5LT1ViRmowSkpi?=
 =?utf-8?B?Mmo2UVRPdHRJcGgzQVVoRURKOTkwT25Zb0dpS1NaY3pTZmk3ME1VbUc1YjJZ?=
 =?utf-8?B?MExJNEszdk5IOUF1TUY3UmtLSU81VlQ0d3FNd2xLSk9Pbkx6cmdybG5EL0lI?=
 =?utf-8?B?SXZoWXVObTJaVWNhSFZseHhHRnp2ZEVTR09HOUF0blorRk1QeXBaYm9Xd290?=
 =?utf-8?B?TXd3OHJZODNGSEY2M2p6R3MxY29zdG05ejgxYU0vbDliQlJWVm1oYU1wTzVx?=
 =?utf-8?B?Y3NJbWtublZOZTVGbDNpWUhsMGxUb0NJRmFCcW5XMEp2Q2hnN2YzWHZCTWg0?=
 =?utf-8?B?SUZjODdKVHd4eEtZNVN3U21IY1BsL0pXYmlobzRmc1N2LzJac2VsQzNWQ0xZ?=
 =?utf-8?B?VHJyajBxdFMvTVZnaWtxajljM2RHdnZScVdwVHJsc0ZRcks2bkFhL1V1VUdm?=
 =?utf-8?B?R2RXRWVoV3JWY1o0Mm9nY29rakg5MCtYR240ZGdwVFJISW0zdVFpY1htanRu?=
 =?utf-8?B?SHBNb2lVdVdMbWJTQktiWGxpN21ocTQyQ2dSRUloeWk5bEtKbkd4ZDZZNWxw?=
 =?utf-8?B?d21IcVcxU2l6VzJCLzk4K3JNQXcvOFJQOVMrbXUvS0lSbi9SK2ZHTUNGRUxo?=
 =?utf-8?B?RGJwa0lxeUhVY0t5MmJWVTFCQ0o3VXpxc2dlQzRtcERnNVpIQkFIQWpuMXFS?=
 =?utf-8?B?eS9rVUtLbDhIM1hCako4Z0VLSUJTR05UZ0xFTzJ0UmhxRFQ3dDE5VnVwSnlH?=
 =?utf-8?B?clQ3dmZqREwrMTR4V2ZUVmZLTkt2R01OK0RkWkNRYmN5QzdmTlA4VTM5Umo5?=
 =?utf-8?B?cytuYitjRXJENzdnUk1xOURGaUpzVlFKN2p5ejRreFVWdDlGWDJIV0FpYTR5?=
 =?utf-8?B?NXpFU2NzeEd3VlpjVnB1ZGVNamIvdEpxMVZKVkR5c2Q5VTlIQU9tZWxZNUR4?=
 =?utf-8?B?WmhaOWdNVHNiUElTUkFQbzRKZnk1UXdkQTdzSHA4MWxoZmZ6dkRETjRDYVFG?=
 =?utf-8?B?TXRrdHBpRGJ5TFFRcThMWS9SSVZ4N1BpQm5SN3lsRXhnOUl0ZzA5L1YwWXJX?=
 =?utf-8?B?dmFJckdhdTlKWWVWR2lxTzl2N1JYMUZVeEpIbXBxdUZjVFlOUTUvNWJ0NUJh?=
 =?utf-8?B?bDh3cVRUOGY0Qjd2Q1dYQlMrVWFnK1J5MHFWWHBkcHlGR1hXZk1ZdVJvNTEx?=
 =?utf-8?B?LzhQeHVST2lIZzZCVGZseXlwQlZFbEtZekpVNXlhMU4rRmtLaGUrR21aMkxN?=
 =?utf-8?B?M1FmbGphUmx0RS9KNkRnT0FPa3V5MUFJcXhpK2lPSmtVMGl6b29MSHFyUnZl?=
 =?utf-8?B?T1E4b0xOd3FaSU1YSE9LdWtXeXppUGdsOCtwWWdobVZvZVh4SnEwN3N0ZjVG?=
 =?utf-8?B?TnhsZGpKd29wbVBVRmEyR0l3SUVnWlVBWmdqNGE4SFFjUk1uVUFPcDNaYkFk?=
 =?utf-8?B?VHdDNXBlMjFWNVRYTllpN2U0YjZMWUNieUFWeldaUXZSSFZteXlkdWxrTC90?=
 =?utf-8?B?WVNUVUdML21KTDJDNzJHMGlkU3E2dzNJdW9EZnRwSWd4dTBoZllqcjI2SGMr?=
 =?utf-8?B?MVJZSXpQY3VWKzU4TFdMYXU1UEcxSFpJVW5Md1l0M09zK29SSU1DckZpdEtx?=
 =?utf-8?B?YmYvRHhtbjZYR2dveXpBN01Uck1XWktPZzJqa3lqaDhFc2dadVhkSUF3WVU1?=
 =?utf-8?B?RlBTUGw4QlZxK2tTZ3dzbXVZakIzYkd0WFl2OEJ1eTIzWlQ2dkE0ZFJwaUs3?=
 =?utf-8?Q?F7m4c+rqN7FMrlEeH2Pkt7I=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SWcrcW1qRU1NZ1dhd2ttSmN4Y3g5MlV6WkVWY1luVERVMzZYVkdOOXV3anow?=
 =?utf-8?B?V2ZyaXhBeDV5Q1RQTVJGb3M0b25GMXhpZXpkMktHK09hNzEzN3FRQ3pXNjFT?=
 =?utf-8?B?TCtsVHltZHYwaDh0SFp6eXJ0OE1mLzg1dU1zbk5wbXJmMG5VVHc4T3QvSDMz?=
 =?utf-8?B?bVNjWkVFaE05N2ZyNzJjVCtQVEFSMG5FT3NWRjJoSDk1VE1SY2E3RTAzOHFL?=
 =?utf-8?B?Z1NGaU5CcHdaaXNOUm1PSnAzSXVrNm13VXdaRjBWc0ptWG5zelBUMFFpdnhj?=
 =?utf-8?B?NVR2YWJuYUFmS2ZnVXJCY2M0Rk1wQm9Lc2VwcitTeUx3dWxzM2hBc2w3bmpv?=
 =?utf-8?B?R2ExSTVudHJySFVDYnRUcGFnKzdiaEh4ZDdwR3BOdjhETFlxSVZVNFhvQnVy?=
 =?utf-8?B?UnQzRWFGRnlXbmNIY3RoRlRkcCtDeUxLZXhHeVFKVUEwejdrdytvWStZUmU1?=
 =?utf-8?B?Q25sVVMxdm16enVCRHArc0g5bWJQS0ErM3MyUFZHM05raEtzVDBKRVR1SUIx?=
 =?utf-8?B?QUhUQXVCV1VrZ2ViUFpiUDVjY2ErRkxLZWpFUEJ6S3J4SmVGd1ZSN3Y0K21F?=
 =?utf-8?B?MktsUWJjUVRZYW9vVjVRSzlMKzFiYmZuckRzK3NjWkdBWVJhS3BmSExBczJJ?=
 =?utf-8?B?dE8rdWFySWtTVVM3RjlON1JncVBZV1pmenJFT1BXS3l0a0tJR29BNVZ0aW5L?=
 =?utf-8?B?ZGljaEpVaDBTN0Vrek5QQmhzdEVQUXJ6cWw1SmVCVU52dlJlY0VpN2lVdGpy?=
 =?utf-8?B?azdnZ0xJMGNEU2JUbGsxRDMrcXBGYWVOdE1xNnJRS1M3OWRSd1haZVVLSEtk?=
 =?utf-8?B?V3F1RW1rckttc2h1NEYyYTBFU0k2OElSMy81d2hVTFVXMjNOTkJUNUthdEFY?=
 =?utf-8?B?ZTVkQmI4bFdzUDFDMVlmMjdzZ1BwcVVWbW00QmZxK1VBRUdMUUFBdm41OWpp?=
 =?utf-8?B?amJlUzM4bThQOUxsUDUwTVU2K3lzZzNFZ0x5cWlmOW5FdUZHRy91QllBdG5X?=
 =?utf-8?B?S0NTNkpkWTZRTWNkK1A4eVUzOXFRNFRoeEE5SzhaT0JRY0N4VWFDU0Rmbmd5?=
 =?utf-8?B?eGdhLzhMY1ZlcjVlbnI1VHk0bStQbjBtaUljS3Qxamhqb3J3L1FpWURqRkg1?=
 =?utf-8?B?Mkd4WVNpVlJmSGE1ZXB3MmNVdGJWNndmZHk4Z05OL3RjT3paUEJ6VXhpUVho?=
 =?utf-8?B?MytsRVBJSW1pQkhqSXkvdTBQRk9LZnZBakhIL0hSZlg2d3lEUDhPblN6UWVC?=
 =?utf-8?B?dG9jL1NTeVFtNzhJQytDY3NPY1BaWU90dk5LR3QwZzdCczZYT0dOa2ZkZ0ZJ?=
 =?utf-8?B?ZFc1VkFzZ212QVRuMjY1YmE3UjVmTTFhMjFlZkxZN3dheFNSbm91VWVVdnRv?=
 =?utf-8?B?UTdLN0tHYVRvQ3hrYjZHTHVzdEZGaFU1UElSVnIweG9kL0pqR1dTWTlGY0Jy?=
 =?utf-8?B?SnFjcEJsYlZhT21obVdLL0JNcytybnROQjlsUEcyd0psdkgyNUYwbmJxN3Nm?=
 =?utf-8?B?SnVvMnpTU2hmd0xkeEJJS2lxYStVVGc3MVY1OWU0QXp5OHlUaVRndUY4WEti?=
 =?utf-8?B?VGFQZGdPanphK0NuVy9jVFNFa1dlQUo0TUtDT3ZWTEM1U052bzViMjNQbzVZ?=
 =?utf-8?B?RkZjYi9qVTF4U2pzYkFJakoxMTZ2dncxbGRXNGRtYWtOQ0dKV3FXV244RTdi?=
 =?utf-8?B?MDQvOWJ0Q21sQXBIVlcxa3h3WnZ1V1VJZk1zRnM2elBmQUZ3NDdJUUVBcUt4?=
 =?utf-8?B?N04wMU5DVDM4T1Ric0pSQmNvNS9JL3M2VWEwMU9RS1p2UGlhNDF0UWRMRE1K?=
 =?utf-8?B?WGJERTdFaTVtaVpvOWg4RGt2TG1UY1pDcTVtc2NrZHpQRUxpTjBMTFVBUGV2?=
 =?utf-8?B?anJhelZzMEZLZkFCKzJFWitXZEF4VnZ3Y1dmK1k5enE1a0ZpNHFySVVSclNX?=
 =?utf-8?B?ZFo2aEhrTnB3U1QxQ3dYdTZWRTRPYk80NU85T3VWb3JNaUpmK2QzNVRTQUhQ?=
 =?utf-8?B?cWkzRW1MR2NjckVUL2RqT1I2aVUwN0FtbW5Sazl0SnZUS3k0dWEyd01JdFUv?=
 =?utf-8?B?a2x1NFJIZXFyaTR4YTNFVGphVW5lamFLNjBuT1d0Z0FSYUhJaXR2S3lIYnpn?=
 =?utf-8?B?ZDFKS1hzY0xnb3c4U2FtbndJU01jTlgyUzJrMFIwY0Y5N3VMSFRBSFpZd0VM?=
 =?utf-8?B?MVFMRnFva1RWOHFUbnF3VTNPcEgwMU5sRGMrZENoWjc1cldubUdJZXFtVkda?=
 =?utf-8?B?RnRFVWRZVy91eUZiNEpjdG9VQ2J4cjFaNkZaTnFYdEE3N2FQRFN5eHdCOCt4?=
 =?utf-8?B?OVJtOHBTai9EZHR6TllJU2lCUjRkUzErcGJLMUlVTmxEY29UUzV6QT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5084143b-1917-4d25-72ea-08de68ed7739
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2026 21:43:44.9737 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KB+QNkVfgkZIYXumShOQTqNA9SKYGyi0Umg0fO01N+Cxz7TWEqdJnnMZhuxQ5zwdEx/VfeoBEmH4HzPzl95LxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7548
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_GT_50(0.00)[50];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,garyguo.net,protonmail.com,umich.edu,nvidia.com,weathered-steel.dev,collabora.com,joelfernandes.org,lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 671AF11F7D7
X-Rspamd-Action: no action

QWdyZWVkIHdpdGggYWxsIHRoZXNlIGNvbW1lbnRzLCB3aWxsIHJldmlzZSBhY2NvcmRpbmdseS4N
Cg0KVGhhbmtzLg0KDQo+IE9uIEZlYiAxMCwgMjAyNiwgYXQgNDoxMOKAr1BNLCBEYW5pbG8gS3J1
bW1yaWNoIDxkYWtyQGtlcm5lbC5vcmc+IHdyb3RlOg0KPiANCj4g77u/T24gVHVlIEZlYiAxMCwg
MjAyNiBhdCA5OjA5IFBNIENFVCwgSm9lbCBGZXJuYW5kZXMgd3JvdGU6DQo+Pj4+ICtpbXBsIEdw
dUJ1ZGR5SW5uZXIgew0KPj4+PiArICAgIC8vLyBDcmVhdGUgYSBwaW4taW5pdGlhbGl6ZXIgZm9y
IHRoZSBidWRkeSBhbGxvY2F0b3IuDQo+Pj4+ICsgICAgZm4gbmV3KHBhcmFtczogJkdwdUJ1ZGR5
UGFyYW1zKSAtPiBpbXBsIFBpbkluaXQ8U2VsZiwgRXJyb3I+IHsNCj4+PiANCj4+PiBJIHRoaW5r
IHdlIGNhbiBqdXN0IHBhc3MgdGhlbSBieSB2YWx1ZSwgdGhleSBzaG91bGRuJ3QgYmUgbmVlZGVk
IGFueW1vcmUgYWZ0ZXINCj4+PiB0aGUgR3B1QnVkZHkgaW5zdGFuY2UgaGFzIGJlZW4gY29uc3Ry
dWN0ZWQuDQo+PiANCj4+IERhdmUgQWlybGllIHNwZWNpZmljYWxseSByZXZpZXdlZCB0aGlzIGlu
IFJGQyB2NiBhbmQgcmVjb21tZW5kZWQgcGFzc2luZyBieQ0KPj4gcmVmZXJlbmNlIHJhdGhlciB0
aGFuIGJ5IHZhbHVlIFsyXToNCj4+IA0KPj4gICJtYXliZSB3ZSBzaG91bGQgcGFzcyB0aGVtIGFz
IG5vbi1tdXRhYmxlIHJlZmVyZW5jZXMsIGJ1dCBJIGRvbid0IHRoaW5rDQo+PiAgIHRoZXJlIGlz
IGFueSBwb2ludCBpbiBwYXNzaW5nIHRoZW0gYnkgdmFsdWUgZXZlci4iDQo+PiANCj4+IFRoZSBw
YXJhbXMgYXJlIGFsc28gcmV1c2VkIGluIHByYWN0aWNlIC0tIHRoZSBkb2MgZXhhbXBsZXMgc2hv
dyB0aGUgc2FtZQ0KPj4gYEdwdUJ1ZGR5UGFyYW1zYCBiZWluZyB1c2VkIHJlcGVhdGVkbHkuIFJl
ZmVyZW5jZXMNCj4+IGF2b2lkIHVubmVjZXNzYXJ5IGNvcGllcyBmb3IgdGhpcyByZXVzZSBwYXR0
ZXJuLg0KPiANCj4gV2VsbCwgdGhhdCdzIGZvciBHcHVCdWRkeUFsbG9jUGFyYW1zLCB0aG9zZSBh
cmUgaW5kZWVkIHJldXNlZCBhbmQgc2hvdWxkbid0IGJlDQo+IGNvcGllZCBhbGwgdGhlIHRpbWUu
DQo+IA0KPiBCdXQgbXkgY29tbWVudCB3YXMgYWJvdXQgR3B1QnVkZHlQYXJhbXMsIEkgZG9uJ3Qg
c2VlIGEgcmVhc29uIHRob3NlIGFyZSByZXVzZWQNCj4gKG5laXRoZXIgYXJlIHRoZXkgaW4gdGhl
IGV4YW1wbGUpLCBzbyBpdCBtYWtlcyBtb3JlIHNlbnNlIHRvIHBhc3MgdGhlbSBieSB2YWx1ZSwN
Cj4gc3VjaCB0aGF0IHRoZXkgYXJlIGNvbnN1bWVkLiAoSS5lLiAgSSdtIG5vdCBhc2tpbmcgZm9y
IGFkZGluZyBDb3B5L0Nsb25lLikNCj4gDQo+PiANCj4+IFsyXSBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9hbGwvQ0FQTT05dHlMX0NxMytxV2M0QTQxcDdlcW5ORExTMUFQVUVlVWJhUXlKNDZZRGtp
cFZ3QG1haWwuZ21haWwuY29tLw0KPj4gDQo+Pj4+ICsgICAgcHViIGZuIG5ldyhwYXJhbXM6ICZH
cHVCdWRkeVBhcmFtcykgLT4gUmVzdWx0PFNlbGY+IHsNCj4+PiANCj4+PiBTYW1lIGhlcmUsIHdl
IHNob3VsZCBiZSBhYmxlIHRvIHRha2UgdGhpcyBieSB2YWx1ZS4NCj4+IA0KPj4gU2FtZSByZWFz
b25pbmcgYXMgYWJvdmUuDQo+PiANCj4+Pj4gKyAgICBwdWIgZm4gYWxsb2NfYmxvY2tzKCZzZWxm
LCBwYXJhbXM6ICZHcHVCdWRkeUFsbG9jUGFyYW1zKSAtPiBSZXN1bHQ8QXJjPEFsbG9jYXRlZEJs
b2Nrcz4+IHsNCj4+PiANCj4+PiBXaHkgZG8gd2UgZm9yY2UgYSByZWZlcmVuY2UgY291bnQgaGVy
ZT8gSSB0aGluayB3ZSBzaG91bGQganVzdCByZXR1cm4NCj4+PiBpbXBsIFBpbkluaXQ8QWxsb2Nh
dGVkQmxvY2tzLCBFcnJvcj4gYW5kIGxldCB0aGUgZHJpdmVyIGRlY2lkZSB3aGVyZSB0bw0KPj4+
IGluaXRpYWxpemUgdGhlIG9iamVjdCwgbm8/DQo+Pj4gDQo+Pj4gSS5lLiB3aGF0IGlmIHRoZSBk
cml2ZXIgd2FudHMgdG8gc3RvcmUgYWRkaXRpb25hbCBkYXRhIGluIGEgZHJpdmVyIHByaXZhdGUN
Cj4+PiBzdHJ1Y3R1cmU/IFRoZW4gd2UnZCBuZWVkIHR3byBhbGxvY2F0aW9ucyBvdGhlcndpc2Ug
YW5kIGFub3RoZXIgcmVmZXJlbmNlIGNvdW50DQo+Pj4gaW4gdGhlIHdvcnN0IGNhc2UuDQo+PiAN
Cj4+IEdvb2QgcG9pbnQuIFRoZSByZWFzb24gSSBoYWQgYEFyY2Agd2FzIHRvIGFudGljaXBhdGUg
cG90ZW50aWFsIHNoYXJlZCBvd25lcnNoaXANCj4+IHVzZSBjYXNlcywgYnV0IGF0IHRoZSBtb21l
bnQgdGhlcmUgaXMgbm8gc3VjaCB1c2UgY2FzZQ0KPj4gaW4gbm92YS1jb3JlIC0tIGVhY2ggYEFs
bG9jYXRlZEJsb2Nrc2AgaGFzIGEgc2luZ2xlIG93bmVyLg0KPiANCj4gU3VyZSwgYnV0IGRyaXZl
cnMgY2FuIGFsd2F5cyBwYXNzIGFuIGltcGwgUGluSW5pdCB0byBBcmM6OnBpbl9pbml0KCkgdGhl
bXNlbHZlcy4NCj4gDQo+PiBJJ2xsIGNoYW5nZSB0aGlzIHRvIHJldHVybiBgaW1wbCBQaW5Jbml0
PEFsbG9jYXRlZEJsb2NrcywgRXJyb3I+YCBpbiB0aGUgbmV4dA0KPj4gdmVyc2lvbi4gSWYgYSBz
aGFyZWQgb3duZXJzaGlwIHVzZSBjYXNlIGFyaXNlcyBsYXRlciwgd2UNCj4+IGNhbiBhbHdheXMg
YWRkIGFuIGBBcmNgLXJldHVybmluZyBjb252ZW5pZW5jZSB3cmFwcGVyLg0KPiANCj4gSSBkb24n
dCB0aGluayB3ZSBzaG91bGQsIGRvbid0IGdpdmUgZHJpdmVycyBhIHJlYXNvbiB0byBnbyBmb3Ig
bW9yZSBhbGxvY2F0aW9ucw0KPiB0aGV5IGFjdHVhbGx5IG5lZWQgZm9yIGNvbnZpbmllbmNlLg0K
