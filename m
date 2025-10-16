Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F6FBE546C
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 21:47:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B84610E356;
	Thu, 16 Oct 2025 19:47:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="qVm6zOWB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011053.outbound.protection.outlook.com [52.101.62.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0839010E039;
 Thu, 16 Oct 2025 19:47:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B11cgh4rUhoFB9R8eMkCtol5JQTfkhqKl0sqmL6DCjHcQudwnWx0tfmJEOFAdMnOjNFAxMtPdRi10okg63sgcpMynj9/Zdwqx+1UAifxvd0Q19FmkziB4KTjOD+A7fk7TCJty2FFLIcpQC/tHA9pKw2dybW4WFfsHC1vkiQvrihCexermS6qqjKRb6ZQ1ZFtI1oqCs0DVe4lE3bpCakEeKakKb+Y9murdhkdCXzWMIv2i0L9TjZI3p8ZEYq4yyil/2i0iQHZC7cfrJ+eJ5C/19QwVRdyrKMB3H3N9DMMd7sYjIC+prqs0OM0K7D6GOBRlfhyRFUJ1TUUBSY67o9g3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=412TMkUZursVn4Q54hJteRlfS61mAoWXF2ImAFH36bU=;
 b=Xp09WAOkH277SNGIE405OpfimkNG4kL1G2SetW0dOB6csLDgr7pl44u5b11utTQYyOONhlCFjqQ9IZldpXz1zJtl0Ognb97n/jPP3lU0N9NTh1Ux2HiE5sk7ARtGTMoWdaE/fKnkno3df+UxgiqIYglF1Zy1zoLjM8MB2ViNhaTnllo5r1nAziCfCQtURmZ3ZjSSZL3QQAzrtXb8YilCmC4eTA/D3cszmKC+zCpysXbiX4kJGSU1478rIZBOAK1NfrG59SCbPMXa0T5xSdvkSS9UbhsaLKARYvQOUWWHNUZDogb30Jhfq0KgjAA2YYyT6Rg7+7CbzpYKYTwxZiRwnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=412TMkUZursVn4Q54hJteRlfS61mAoWXF2ImAFH36bU=;
 b=qVm6zOWB0FjiR2cIW4NrZjS80Cma6hL6emdWY0TOPizHY5rvUUk//cnYjQwO/0ndQJ4c+NGPgd/TVRfOeg8gVFJQzzqQ9EQw0dLyBy3q6Oscwm3mmyW2GCV++VnU3uJACu8Vkw4j0O+P5eChn2e8vvByBf+TBU0ZShN1brE4iu3GZt/NP9p3bayrHv02yfLyaTmhs9G6XeDS8ZWIO/0WP6cCK34R7f0t3B5FUpb9RZGKNq7sr/FjDWXRIIwmBlvgTKlQJNpbbH5n6X6KfBhdPy7+kdbTPzIOmNVS6pwc+RYFDxujV3HpQQsCQTItpsQbBXJk3+UX+EpdvHjzIuGEyQ==
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SJ0PR12MB7474.namprd12.prod.outlook.com (2603:10b6:a03:48d::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Thu, 16 Oct
 2025 19:47:22 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9228.010; Thu, 16 Oct 2025
 19:47:21 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: John Hubbard <jhubbard@nvidia.com>
CC: Yury Norov <yury.norov@gmail.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "dakr@kernel.org" <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, Alistair Popple
 <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor
 <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
 <gary@garyguo.net>, "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Timur Tabi
 <ttabi@nvidia.com>, "joel@joelfernandes.org" <joel@joelfernandes.org>, Elle
 Rhumsaa <elle@weathered-steel.dev>, Daniel Almeida
 <daniel.almeida@collabora.com>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, Edwin Peer <epeer@nvidia.com>
Subject: Re: [PATCH v7.1 2/4] gpu: nova-core: bitfield: Move bitfield-specific
 code from register! into new macro
Thread-Topic: [PATCH v7.1 2/4] gpu: nova-core: bitfield: Move
 bitfield-specific code from register! into new macro
Thread-Index: AQHcPq9uIRJQMHT54kuQZ2/PdZxOLbTFDN2AgAAb/SCAAAOrgIAAAXvU
Date: Thu, 16 Oct 2025 19:47:21 +0000
Message-ID: <FEAD8998-7D22-47A7-B852-26D70D991C93@nvidia.com>
References: <20251016151323.1201196-1-joelagnelf@nvidia.com>
 <20251016151323.1201196-3-joelagnelf@nvidia.com> <aPEv_UO4vViOcOvN@yury>
 <2CF462DB-D2C8-473F-9D70-522E6AFEDCE4@nvidia.com>
 <a693a561-f0f6-479f-a878-6726c7ca5d88@nvidia.com>
In-Reply-To: <a693a561-f0f6-479f-a878-6726c7ca5d88@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8059:EE_|SJ0PR12MB7474:EE_
x-ms-office365-filtering-correlation-id: 78887805-cf51-4306-56e7-08de0cecd24b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?THd4VTlCVHVyamEzVVQyWXNDeU5oQWNjdDFmVHVBV1FZVW44bTBWZmU0UTU2?=
 =?utf-8?B?ZENSVlpRK1l1eFJUTkRIN3hpbTEzNGFLN0JLTHhlay9XWVRYTW5HN2lqbUMv?=
 =?utf-8?B?WEtrV2lBUDIxcDVHYUp1WGxSaElPUzY1dll2QU9HdHYxRGxYaldKQjRCVGhi?=
 =?utf-8?B?RlNSUnN4TWhzZWtuL1Z5QWN6alAyUU8yeGxPWC83NksxTHVkZUxZZmxUWDZL?=
 =?utf-8?B?alpad2JveVY1ZHMyUlNkNW5UcVp6YndpNEtJcjVVdHBxcGlJN1dqUlNxQ3E4?=
 =?utf-8?B?dGNqQUF0U3ljM2tIanAwTWw2SEdpbnBzTGVKcUJvU0Z4WmM0RVRJSkRyNFc2?=
 =?utf-8?B?Rkgyd3FXcXpFVC9TVGE0WlRzQ1dxN2RzQ2IxUGU5K1BhU3l0T1c3SmpaVy85?=
 =?utf-8?B?SngrM1pvV0RhSmVFZEJFTmswQkh6RzM2cjVJTFozR2FZYTYzOFNlN2IwWVdG?=
 =?utf-8?B?VFJ6ZE9VUVNVVlZ3RWQ3cnBDN1ZwVTdmVytsY0xpUFJrMStsVkpqUURLdHNz?=
 =?utf-8?B?Nk9sZEViTVJTQnRKVlRNNXNUSG03RlFEeEdJTU5SR3VWYmw5NjNUdXhJbW5o?=
 =?utf-8?B?VUNmaVhEempDMml5UVRiYW0zMkEwVGx4RVdjbE9QekhGRVJtVTFIc0p6S3Ur?=
 =?utf-8?B?ek1mR3pZTkJUY1pDQWErcVZrWS9Reklrc1JxdnAydmNwaVRWVk5nZkQ4czZ4?=
 =?utf-8?B?NlRncUhzTm5xMEx4Y1lMZlFuSUJlTFNTcW5KRCs1T3pVdTRQVnBVbEtkcjZo?=
 =?utf-8?B?YVcxakRLRWxvL3RXSHB2dmJNWDFGRlFIOHAzY2lQSWpoajBoOEJmUmpFOFU0?=
 =?utf-8?B?Nml2N1dtVE1BT2JodngvcEUyejVOQmpzVSswYmFjb1pEQUl4cThFdm9UQ3Ny?=
 =?utf-8?B?cTVNQ3ZuRW1DV3lyZGgvNzg5d3FJdUt6UjFnVFRibTJ1Yi9VcFcvS0RCbDds?=
 =?utf-8?B?UHlEWksrNjRTRDVIbUZGcjlBL2kvUnViRkpXM2V6aHVzaWFnZkVnOUZIQjl0?=
 =?utf-8?B?RGpHRHUrVTIvTW9xd2hsZkNOc0dzVHNmb3ZneGFYRUFsVmRxdnhvRVdXcW9Y?=
 =?utf-8?B?U3JsZmJ3akh2bElYbExHSVNSTE83UVBYNVh4U0d2b09jVXQ3SC8vSVZwQkR2?=
 =?utf-8?B?RnYrdUE1WFM1ZXJNK1dnSUN3RXk0akR2MFlHelgwRXVod3YxM1VNeEJtWnFn?=
 =?utf-8?B?NXF1VUtiWWh3RlZIb3BaSWQ5TDhsWWZSNk5lWkVBZlJJR29YQkNkcEJxMDU3?=
 =?utf-8?B?aFJ4dTJXdkVJWGpINWd2SHVubFV1WTJSVm9ITHZZajdsTnp2dkpOaURsS0o1?=
 =?utf-8?B?UWUxS1h6RW51UnVRR0F3NU5kci9UM1FvM3NRNkJRQUtOdWV3ZG1idE9kMDVQ?=
 =?utf-8?B?RWtKMzBkOTFhN3NHN2xmcU1rbjVvQVk2ejNKWERmNmtiMlpxSTVzQitSK2N4?=
 =?utf-8?B?aDJ0KzJMZk5BU3J5djc3Y0w2Zk93RG9HbVVVME0yL0dUZjJuaGFBd0FKNzZt?=
 =?utf-8?B?SWo2ZVo5dEJVbkp0RVYxVW5vZkVMYnNLU3VMTTYyWUxsRnY3WmthakZXUVJO?=
 =?utf-8?B?L01kZ04yMjF2Y3R3blNwTE1KSnVmYURsT1hDMEFyVGkwNUJlRExNdmVmcEtK?=
 =?utf-8?B?b1F6bXJXb3JCUnU5UUFRS3llbjN3TDIvcG9IUUQ3VmZ3QzF2VndVMlVtR1I1?=
 =?utf-8?B?WnZWRHJCRk83RnJnR0p4d29CZENJTWdBcGZ0U3JvUUNxb3RuV3d1eVVqNith?=
 =?utf-8?B?ZHJWNURPSk5jcGJ5VnZHOHB0T0lPbEZCTFE5QUtXT01iV3U3azRuVTA4WWh1?=
 =?utf-8?B?QVFhL1lKcUZHT0ZUaUdkS3JFc0lldDBKN1V6eC8zVFBuSnJac0tmYVBrNnU4?=
 =?utf-8?B?dFFqdVF5MGpmNUJHNmY1T29rRWx4dFFVMWJaL3FxQ0lKcE55ZXQyUVpjNzM1?=
 =?utf-8?B?SVg2MC9zUzZwT3hIZG9CUU00V0c4OUxBNnR1V0JXMUZnRHNxaUdaTWhCano2?=
 =?utf-8?B?d0dpdTlHTUNYR0lKeFkwVmE5NVI3QVNtZFlqanZVMWtHWjBhc2FQeVg3T2VZ?=
 =?utf-8?Q?ohDquR?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SEMyMDBKMWpyUm10cmZuZGlCYXp5dGRIRTFuczllT3YrdUQ4aXV0SFh0UWlZ?=
 =?utf-8?B?dUI0UG04OFBBNzc2SGtIZDJTYkI3TnZJdjVDa0ZIeThuS01LSElOTlpHKzhH?=
 =?utf-8?B?MkhnM2NpbUdOR1FlQlN1Y2xGQkZIdEN5QlBvc3QwNHllbTZldGJyellZajgv?=
 =?utf-8?B?UCsrdlczcHhBYUVCM3lLK3FYTlo0bG5aNURkaHR6R2hYLzdiOFV6UzVkbDVi?=
 =?utf-8?B?b0NmZTZqRTdNMHJnRXZ3TGo3WWV1WjN3OXR3RXBPZ0c3RjVJUGRHWXhQTXJv?=
 =?utf-8?B?bDhrSzB2bE4vR3YzNDI2dHhIaDlYWEt1TUxxRjZ6emIwTGhhTGVkc0lXTUo3?=
 =?utf-8?B?UVR4TFNma0h4R0FoQy9SQmtXbUp1Qlp4ZStOQzRCMk82STc1Y0dMdXhSbUVn?=
 =?utf-8?B?bEloVG5MY2lrd2x6WWZrQ2lhR09HeFJ0REJOaFRkOHBZdjVwWnhyakJ0Qm81?=
 =?utf-8?B?Smw3Ym9LL09oVEc1RWtjODBmN1RVVkRZdmptbVgvVUZSVVozbXJta0tObzBq?=
 =?utf-8?B?WXVwYkVGOVhLNUx4WWlnRE1xbEZ0b24yd1VwS1k3Y1JsVk5adFlDMUd5eS9N?=
 =?utf-8?B?aE8wdlFQVXZxayttRE5hcFRabituU2kxWXk0VkY5ZUJvTzk1VGcyYzZkNS82?=
 =?utf-8?B?LythUUQ2R09MSWQ2WVRybHdOeFIxaGprN2MySGtwbks1N3hZb2Q3a1d3L2pV?=
 =?utf-8?B?M2piZHNDNWgrbVpFUmIwQ1VIUnNNNjBLWlhpbHJyZ1prYnorclZwNk4xcWRa?=
 =?utf-8?B?QTkvTUJDbFpERWZzQk5QendsaFgzUzJTdUJITTJtenlldDdRMDFGcGxxSHBn?=
 =?utf-8?B?WGZXRGNBb21aUzhIMER4K2sxcHpBdHhaQVl2c1U2TTJpbWNGdXBHeE1OMGZU?=
 =?utf-8?B?RFgrc2NMRGlFbEV4b1AvN2VwdjdFalJ5OE1JN1JyZHhWMW9KUDYrWloxS0pY?=
 =?utf-8?B?dkNvblh1V2VNNzJWQmF5dUZrYzd4WTNZQ0lrRXdLcjdZaHRvRG9Jc1VFbDdp?=
 =?utf-8?B?SmZHODJ1ckJZUEVvaXF2K00wK2V4VzlZUm00TEc1TFFLNTZpR20wQkoyOVdK?=
 =?utf-8?B?SEpKY3czT2JTcUkraDNURTFwNTdYcnN3dVdRT21mcHBYQlhTTVJyc3lxMTBN?=
 =?utf-8?B?aWlsdTE0dTBja25uenpoRCtYcHRzZUowVzBJNVA1SUNKYlliazVsQzc1cjFV?=
 =?utf-8?B?eS9sbGlMTjRjK093WTJNblVIemFBTDNBSEd6MU1iWFFKRndDMEhuUVN3TVBo?=
 =?utf-8?B?OUl0VXhuTWI3NkJPOXh0di8xSEptMi9aSW5Dcit3OUpuMU1pSERYZzE2anBD?=
 =?utf-8?B?V3BwbVJTY2lNNTkzTmJYS3R0ZkpTRXUrOW4wWmU0NW9rbmxheUUrTk4zWkp5?=
 =?utf-8?B?K3dqWDJFM2tFMHBUK0d4UldmTldCRC9memlBUDVtZ1VEaEI1dEEwdzhSUW9r?=
 =?utf-8?B?TklBVXkvZWMxYWdXN2VjYVlwT04zaTk4dU96T1pzQkFSMUVpSDVWNS9rWWYv?=
 =?utf-8?B?WWlsNStSamR0aDhGWVVUL3kzMUorQVhrOGEycEhuYytPR1F3L29ZRUtFOE1t?=
 =?utf-8?B?Yjc3N0V6d09KR3pYUmR1Qy9iMVhWZGlqOG5JSDdjQkVaRis2cC9WaW5BdytY?=
 =?utf-8?B?cUlTT01PZEZ0UUxLcnI1ZHg5NUV0Z3pLZEw1b0xpM3RPZjdUMVJYNGVPVm5i?=
 =?utf-8?B?dUVlQldrMUEwMlVSYTAraUVndGJhM1JCTGx0TzYrdUgzWVFBZWFrbHhrYXlj?=
 =?utf-8?B?aUY3bVVxRXNzbXNwWWVVYWd4ZEJGU1VNTlZwWnNoVkhBNHpuV0pWc004QUNi?=
 =?utf-8?B?TzZHNWhRaDJFb0JvSmdkRWt0MHorWmdTVjhkNUwwbXJacFcySEtTRzRUbk94?=
 =?utf-8?B?SmNENzIzUEw1NGhYS1VITkdTcVhGTHY0WHpFK1FNMERENXFHblRKbE95cmRw?=
 =?utf-8?B?b0VJMEZtdm14UmVLVTFlMWwxWGZCaVJIUCtKVloxUEtSQTNuU2pYMUdDSGZr?=
 =?utf-8?B?dkduYW1YVzVyUk5QckNGQnFtTkdTQWFsOWE4NEFlVUVMLzBJU0d6NGNrZm91?=
 =?utf-8?B?N0pBcE5kZjMxR1ZqSElESnBKQkV0RUFjcGpjVU4xYlBDQkQvRitzeG5SNFZk?=
 =?utf-8?Q?DBeAR+tXGPeqEl5WhT4Ka2gN+?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78887805-cf51-4306-56e7-08de0cecd24b
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2025 19:47:21.2880 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8e1ZotHAQc4XGCbf+8peDT0IsIaTAKlM0BjgCowJpuQSYuu4HMD5oq0dI+Rqaowc3QUZcCZFq+OnP8vfjfhHqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7474
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

DQoNCj4gT24gT2N0IDE2LCAyMDI1LCBhdCAzOjQy4oCvUE0sIEpvaG4gSHViYmFyZCA8amh1YmJh
cmRAbnZpZGlhLmNvbT4gd3JvdGU6DQo+IA0KPiBJbiB0aGlzIGNhc2UsIG1vc3Qgb3IgZXZlbiBh
bGwgb2YgdGhlc2UgY2FuIHN0YXkgdW5kZXIgMTAwIGxpbmVzLCBJIHN1c3BlY3QuDQoNClN1cmUs
IDEwMCBsaW5lIGxpbWl0IHNvdW5kcyByZWFzb25hYmxlLiBJdCB3YXMgbm90IGNsZWFyIHdoYXQg
bGltaXQgWXVyeQ0Kd2FzIHJlZmVycmluZyB0byAoZXgsIDgwIGxpbmVzKS4NCg0KSSB3aWxsIHJl
dmlzZSBpdC4gIFRoYW5rcywNCg0KIC0gSm9lbA0KDQoNCj4gDQo+PiB3aHkgaXQgaXMgYSBjaGVj
a3BhdGNoIHdhcm5pbmcgbm90IGFuIGVycm9yLiBXZSBoYXZlIHRvIGxvb2sgaXQgY2FzZSBieSBj
YXNlLg0KPj4gDQo+IA0KPiANCj4gdGhhbmtzLA0KPiAtLQ0KPiBKb2huIEh1YmJhcmQNCj4gDQo=
