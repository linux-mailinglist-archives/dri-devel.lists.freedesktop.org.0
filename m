Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D8EC86885
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 19:16:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6DF010E429;
	Tue, 25 Nov 2025 18:16:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="hDgdFG84";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010010.outbound.protection.outlook.com [52.101.201.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3154110E429;
 Tue, 25 Nov 2025 18:16:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IXQtY3K14uMUrU+LtUXg2/9kfY+iFaeSvKsb0oYtymYKrQS1fJ5bBAg2rhSJg1coaDIIp2/Phy1A00sRdWo/LbiOor6IZcFWZxbtXd1+A8QzdwP2otiiquLT6TPKCe0fGe62e6dyJT40lowfsop3GEtv6qmT/GNoQ+Evfxl1dW7o0u0E0xCZIxuMHEwMSSvyi/+Rj4C+ArSijSPuTZ+hobgspnwXK3BnLOh7Fsr3O2jVu8xSOFdEf8LyB03tikCnoORh3cfjUogZszS/eyz2utK+PMB68CLXMPhy2ZFfa2KD/YlMDTGTIQz81qlPP95XEUR/VeQmfPheM5Z+bZtpBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OFnBOp22YWawNgKHBks0BS0gJ2+V4XWmm1shhP/HLLg=;
 b=Wc+4joM3Hmb8A35kZHi3L85d87Hk/y7viuaVhzme2yfh/FnsGgef9aO7AJRYUW29kabeMtdp4WWThNWKxTXQ2/QO1Ld5dCPVChVNslw2X3ePvOeqYmONib8V0ydGi9eGrxMc8wp70uVm0xsymGC5ZB/NDD8j5bwU34anj/8Ld7ToBpCyT7WUdIVoInYvh3Y0aRdMUma6LZqHqis5scwgpucGSh0piBLYyJSQ55YaMtiytdHuIZrFiOa4WgHGZB0KIsY6eYakfM5RBMqOtmvVCTsLAw/dkCLOzcEe1/v5jSUtM+iby7HHCoGXPyPUZqlApPl0Adpxv/SCkB+sH1u+EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OFnBOp22YWawNgKHBks0BS0gJ2+V4XWmm1shhP/HLLg=;
 b=hDgdFG84GsdCuj9opj0J2iz9ZwnVr59AlAGrjtA+G28g6tC5PjyBgOsD6utFqDlXKDi/adMVuUhZA1wZFg2AtuRg3Nb3IC2cdH+nOnaKqbxxX6EeKz1y7XNeWZvidPqNfSsexrw4PgrVrxM/dUZJ9GBSakHnmn9z+bQeLaWIFESKxPHXbToFlNPeLQ9PoDMbLTE601iYJmZqX67zmmuhQZHZf81OLNpGq4IIzlNY8i43aUcAcLobxA+6bDZIa0LPDjGbPzNqRXDpnKHLYob/uQukUe3vxsE5+WiH/TTw5t+SsStrSUqWemXwRQmQgYfaboL7X9uP7YWQsC5b7HJcbw==
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CY8PR12MB8338.namprd12.prod.outlook.com (2603:10b6:930:7b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Tue, 25 Nov
 2025 18:16:30 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 18:16:30 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "dakr@kernel.org" <dakr@kernel.org>, "airlied@gmail.com" <airlied@gmail.com>, 
 Alistair Popple <apopple@nvidia.com>, "ojeda@kernel.org" <ojeda@kernel.org>,
 "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>, "boqun.feng@gmail.com"
 <boqun.feng@gmail.com>, "gary@garyguo.net" <gary@garyguo.net>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>, "lossin@kernel.org"
 <lossin@kernel.org>, "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "aliceryhl@google.com" <aliceryhl@google.com>, "tmgross@umich.edu"
 <tmgross@umich.edu>, "simona@ffwll.ch" <simona@ffwll.ch>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, John Hubbard <jhubbard@nvidia.com>, Timur Tabi
 <ttabi@nvidia.com>, "joel@joelfernandes.org" <joel@joelfernandes.org>,
 "elle@weathered-steel.dev" <elle@weathered-steel.dev>,
 "daniel.almeida@collabora.com" <daniel.almeida@collabora.com>, Andrea Righi
 <arighi@nvidia.com>, "phasta@kernel.org" <phasta@kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Nouveau
 <nouveau-bounces@lists.freedesktop.org>, Alexandre Courbot
 <acourbot@nvidia.com>
Subject: Re: [PATCH v2 1/3] rust: helpers: Add list helpers for C linked list
 operations
Thread-Topic: [PATCH v2 1/3] rust: helpers: Add list helpers for C linked list
 operations
Thread-Index: AQHcUy58YAKhaa3SYEu72qT54gYYALUDj+0AgAA481c=
Date: Tue, 25 Nov 2025 18:16:29 +0000
Message-ID: <095D38BD-A8AA-4BC3-8C24-9454964EB8F8@nvidia.com>
References: <20251111171315.2196103-1-joelagnelf@nvidia.com>
 <DEHV08MPF9CH.1GZAWEGC4AVF3@nvidia.com>
In-Reply-To: <DEHV08MPF9CH.1GZAWEGC4AVF3@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8059:EE_|CY8PR12MB8338:EE_
x-ms-office365-filtering-correlation-id: 43444a0d-7a60-456d-e6b5-08de2c4ec18a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?WjlFcFp5WHoyZkRoWm1VdklQQzF3NHJNeHRneDJDM1pqVmJDK3BDdkdKSUVl?=
 =?utf-8?B?VlNjdEMwcjRYcU5yTVJ2UFdSS0VTZVJvS0NBelZVYmppTkZaN2FPaDg1dXpB?=
 =?utf-8?B?N3NocmI4QXdaWXlMQmZYUjc3Yk9TMWxPV3pIME9IbTltQXFZcTRFdlhRNnNt?=
 =?utf-8?B?NGp3YmdGN011Y1pmRG9mTW5nV3c2bTRzNlVyRjRVbmNyZStnaTFOVUcyaFpw?=
 =?utf-8?B?Nm5SM3E5K0pQeWQ2M0ZGY0tmLzVKbXV1aHpycnhhN1Fxa01nY1V5a2w1S1dG?=
 =?utf-8?B?akR4UXFRMitCVlNvR05zVTJRd2Vpb2pGRU1xcFc0MzNYZ3k3Skl1VFFnSVpQ?=
 =?utf-8?B?SDVNV01BYm9VZUJxR0ZmUWFoaXNyRVUyNDVTUGs1S2hZY1FpRUMxNE9sNEhq?=
 =?utf-8?B?R3phZWtwMEZPa2FLTCtIWEc4RWptQzcwMElrOTVxUmZVZFBaYUw4YlFYM2sv?=
 =?utf-8?B?b1p3dmxUd0VmTG9hT1BvK3dwU2NkOUw3MUJ3eDFxNXRQWXd0azdheE14TXJD?=
 =?utf-8?B?RGFPb1VBajNTcGYxS0ZkenA1VnZiL0pFR3hQaXNpZzU4ckhxT1Q3NHZxMHlz?=
 =?utf-8?B?RENGa2crdjBWcVRCM3hrTld5b3AzdGg0aU8yVWdheUFPc3hQUmxxdnBLaGhQ?=
 =?utf-8?B?OWxpdXg2TFhIQndoTU12bWdMZ3doMUF2ZEJoZDZRTGhpRmsxNytXOEN1ZTZ0?=
 =?utf-8?B?NmJaa3drMklUaC9naStWVzI2eGgxY2oydzdTVFZRN0dRNlBDL3hSTVFWUHlG?=
 =?utf-8?B?Um81c2p6UlVmNWk4cTlqL1JBalV2ZGxrV1NPd3FDUWN3T2haTTJ4djBYQTl0?=
 =?utf-8?B?TjRQRnVaekN6Sis5Zit4V1Eyck1pVHcyZy9lak9jSlphN2tqQWM3a2VFM0Uv?=
 =?utf-8?B?QjZPREsxOHZvb20yQ3ZrTjFDeHQxTERQVjIvUDZZWkFBNDN1VEFnSlVhOGxB?=
 =?utf-8?B?WENnTEswUDh3SW5ML2hUS2daM0llZzBWMUJZaDBVUDN3MkFyd2VSWEtxdzk5?=
 =?utf-8?B?VHRCK243aHdDK0k5VDZGMURQL2lQZ1pIZTV3QlhmeEFaMGx2QXIxSTFZR0c0?=
 =?utf-8?B?SWoxSzdZUEZUZk9LbkhNWkpCMCtNNVc4aWpiWDFtaWVCMTFrUEtTYXJka0xu?=
 =?utf-8?B?dHJwMHFQK1plVVgxRnRSZUc1a2dGbEdReC9pMUpKQkx3NDFhTzBrRlVIa3Zo?=
 =?utf-8?B?YUVGWk5BVEJKUHZIeEtLU3ZEajU0alNIbGRMMURnQ3R4VnZIMGRlSHorWW1F?=
 =?utf-8?B?V3FVeWV6ZGVZSkpVRTI5MHByeXgyRC9IblJ0YllCOFV0bzFzWGNKcHhWMDli?=
 =?utf-8?B?OHRLOXhIamlWV016TG9QcmowWUJQRGRrSEF6UnNNQnc0Q3p6T3JBZlhwZWNr?=
 =?utf-8?B?UE1UNlNUMjc5OTVLSHdTOGxabzdvM2NGY3Mxd2ZIMXRidGx5bmladnkrcmdx?=
 =?utf-8?B?SEk4cGJZVUQ5YVdXQWkxU3g2eGpJdUZEN09WZ2c1b3pLREpYdHFUaEEwMVJ6?=
 =?utf-8?B?Q2NlY0E0QUw0cWFoYXVLVS9CT0d4dXFYUFBtMlV0aStyV2IxeFNLdmZsVW1a?=
 =?utf-8?B?Q056YjRSRTk5YUZlK1U4UktwWW81U2lQK0RTU2RmSk53TVVpVmxSZTBRaktP?=
 =?utf-8?B?TktxbCtDRWtBQmMyQ1p3WTBOdzlDdTlqeWlJWW9taG92ZlIzdktUVzQ4L1dl?=
 =?utf-8?B?UnF5b2JUdWNLZ0E3NXZNNWpyNnNyd2xWWFluL3k1bW5pYjVRWU4vZTYrQkQ5?=
 =?utf-8?B?Y2lhNHNqdmUrUStnUDBXaDN3MnZ6YTA1Uk42UEFlbFVhQmNWU0c4eW93S01K?=
 =?utf-8?B?MGszWkNZSHduWVNlMjZ1bnB3WjVFT3RwK081Z1N6NlZWVElFWWsyV2Zmc01j?=
 =?utf-8?B?aVNNUmNSTG1SM244aXFQSTVraiszVkVKM1pJaU9Ia2R1Sm1leU9MZTdZZCtm?=
 =?utf-8?B?ZUthazk1M2g5WFNIV3loTkZ3WHY1Y1RTMzUwT05CKzJUMTZWcWtWWGVMWjUr?=
 =?utf-8?B?RHpFb21heDdXSnlEMkt4NGhVcGZSRWUzNnRzbVB6VkZ6OE9BZ3NjeGlsN2Qr?=
 =?utf-8?Q?a/P3bj?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b0ZQS1pNaml5Z1FSTjNxaWFyRmFZWC85bWJ6R21manhQa3o2c21KczJ4SzBI?=
 =?utf-8?B?MUthTitCNUJLTmc0a0gwRk1wVS81UHJDZEdqYldNL1hPUTl3RGNmbnoxRlY2?=
 =?utf-8?B?a1g2bnBzMnBMTjZKenAwZjBQWnJGMUgzdldqUDMvVGQ3NE1HTHlIenZVZXRY?=
 =?utf-8?B?M0JMSkRTN0M0WEpaSlo5Ynk0ZVZhNkVyaUxnTitMWGwxMmduTFI4SkgrV3FB?=
 =?utf-8?B?aktGTWwxSTArdE5MRWN6TTFyYXBvNU5UdjREMjVUejZzSXl4bXFwUVZtc29l?=
 =?utf-8?B?TnoycEI2ZDc3eWV3dmtlQjhFcEM5dEtFK0FaUCtFbG5qaUE5ZUVBRGdtbWp5?=
 =?utf-8?B?eVJGbWVFUklJRXNLUzg4VDNSbmF6YU5WMDNPc1lEUHNhT1NZSkVma2grODUz?=
 =?utf-8?B?T2kwL0RoTjRnSThVR3YwVGpCWWl6RDQyQy9lUFJIWnFNRS92V1YvS2dxcjhq?=
 =?utf-8?B?QUprTWpKSDVtUjNUQklTRk00V3NRTGlwUXpzNXFENjZrYnoyUXk1TnVGSlYw?=
 =?utf-8?B?L0FPZ3F5WC8rZUpDZ1dUMEdQZ2tIZEhLMFVrTHpsdkoxS0twWlNaUDRtUjRh?=
 =?utf-8?B?MEtJNEJpb2VWV2orSjZzKzlIL2FuWUVEQmRrYzZJeUlJVFRrTThiUjFDWko5?=
 =?utf-8?B?aVY5NGRDK2hIMXZHZ0ErSkhVZEMzaHNRMVFuT05jWnRoWU9YaTdVdVI2YlpC?=
 =?utf-8?B?ckxFS0JDc0xsczQ4OWFhRkkvTG9LemNQUG5hWG82eVFUT2FXLy8ybzVsbGlR?=
 =?utf-8?B?b0lqVmRXdGlKZ1cyeFBQa3lCaGxGUG5KNFFwM0g0QlBhei94ekF2SVVnSTVN?=
 =?utf-8?B?WUVMYk5yaHVwUzJ4SlJ6Tkowd3JUUTRKa0U2a0ZmQUFWckpDRGN1eG1CNlFV?=
 =?utf-8?B?eWN1ejRCMDR0RlF1VEluenhLUXZIejdjNGpUZ1NpeUJmT2pWeFNiSDkrYmk1?=
 =?utf-8?B?K0V1UWlQS3RITGZ4dFVtamU2ZWhrMURUenZkT3orRUVmUHBIeExwdFJYRTA1?=
 =?utf-8?B?VmdVVDZCTUJ3enpsaFZUM2wvRTlLRXFZS1VOUXVnU2F4MWl1ZjM3d2g4QjQ2?=
 =?utf-8?B?ZEIvaGhJMzNFRjJURHo2Y2c5b1RpQ3JTTzNhNDJUblNIV3UreTdaM0l4d1Fr?=
 =?utf-8?B?VUJUMWJaYUlHWW1uaWRuNjN5d2V2a0tjUFJobTY3QktPdUhEV2RRZ3JmMWxS?=
 =?utf-8?B?NWhZWVhhN1gzTXhyZzd4V2tmNHpVYTd3ejVNQTZOZTBQVjlDRmZiTVFZRjhK?=
 =?utf-8?B?OC9RMDZDYmo2OWZycklxeDFCbDVweHEwbGNXNGY0WWhvU2lSMkF5T01oL2pQ?=
 =?utf-8?B?dnE2Zlo0ZVZCRUVIRHhOdFM3ODNiNFkvUmNaY1BWdXpRL0pWbVZpaWlvUmpl?=
 =?utf-8?B?MkJKdUtEQlUvdDlsMzNmaEtqSFJ4Z1ZRWXZXMExOb1U4YVQwL2VkTGk3Zzdm?=
 =?utf-8?B?VDgwbmdaeXZ5c0lBNGxyMFlhcUxlZTZ3WE93YTJ4M3FIS0FKQ0tnb1RCQW1V?=
 =?utf-8?B?bWc5WVFrU0FpN01yRFUzNE9WTDZVQ0l5OVNLaklCMzhmMXZBaTNJaWtlck9P?=
 =?utf-8?B?ZHY2VlpwUVdaZS90UFd6enFvRFNTcm5yVEllNXM0UVU0SGNBTDI5bURubGJr?=
 =?utf-8?B?T2ZZc1VaYkZRWC9VTmRSQW42RktlNmJQcGl4NUhVNlBXZGhRa3NtSTQ0dUNW?=
 =?utf-8?B?d2ZzcDFITEtaV3FSVy9heHI1NnJSaDg5WHRLTGpWd20zbVdJdEw5NlVTRVhV?=
 =?utf-8?B?M3VxckN6cWJYemVwY2RERUVoak4wMFF4MDRuZ0lvdzdmb3hhbWRHSmVsdGln?=
 =?utf-8?B?a3M4RHJoUmlIaFdMUEQxaHBlYU5nM0RlbFpkTEFqWENpd0J2aVQ0a0tGVmVo?=
 =?utf-8?B?dVZvTjRkanJBWmVhZWg4ZmY1b1AzYVdiV1pNcTFhbGI1Q3dWZ1A3S3ZVdjFM?=
 =?utf-8?B?VnJhcVBJbHNwNDBhUytCY0dRcVdMRit4WGM0Y3dwdWN3VkpJSEh5OExpcmlK?=
 =?utf-8?B?ajdzZkMvaE5LRlhIOS9RRUg3c1QyODA5YlByeVFMZEY2djl3MXlmVWI0UTlV?=
 =?utf-8?B?eUkvWkVBNDVVelM0R0RMd3F0SVhocjFOSmxxYmFHWFJuRENPUjJveDdmLzVt?=
 =?utf-8?Q?bQRz3xs2I/cmzl9EWISMbdOtD?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43444a0d-7a60-456d-e6b5-08de2c4ec18a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2025 18:16:29.6590 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gK/6lm3CVWYv08gmrD9oij43sC2414AM1xTMHls+0T4QOCBlG3lXjvubMGBDIjOGkPopOFY944tadHGRqr3tbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8338
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

DQoNCj4gT24gTm92IDI1LCAyMDI1LCBhdCA5OjUy4oCvQU0sIEFsZXhhbmRyZSBDb3VyYm90IDxh
Y291cmJvdEBudmlkaWEuY29tPiB3cm90ZToNCj4gDQo+IO+7v09uIFdlZCBOb3YgMTIsIDIwMjUg
YXQgMjoxMyBBTSBKU1QsIEpvZWwgRmVybmFuZGVzIHdyb3RlOg0KPj4gQWRkIFJ1c3QgaGVscGVy
IGZ1bmN0aW9ucyBmb3IgY29tbW9uIEMgbGlua2VkIGxpc3Qgb3BlcmF0aW9ucw0KPj4gdGhhdCBh
cmUgaW1wbGVtZW50ZWQgYXMgbWFjcm9zIG9yIGlubGluZSBmdW5jdGlvbnMgYW5kIHRodXMgbm90
DQo+PiBkaXJlY3RseSBhY2Nlc3NpYmxlIGZyb20gUnVzdC4NCj4+IA0KPj4gU2lnbmVkLW9mZi1i
eTogSm9lbCBGZXJuYW5kZXMgPGpvZWxhZ25lbGZAbnZpZGlhLmNvbT4NCj4+IC0tLQ0KPj4gcnVz
dC9oZWxwZXJzL2hlbHBlcnMuYyB8ICAxICsNCj4+IHJ1c3QvaGVscGVycy9saXN0LmMgICAgfCAz
MiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPj4gMiBmaWxlcyBjaGFuZ2VkLCAz
MyBpbnNlcnRpb25zKCspDQo+PiBjcmVhdGUgbW9kZSAxMDA2NDQgcnVzdC9oZWxwZXJzL2xpc3Qu
Yw0KPj4gDQo+PiBkaWZmIC0tZ2l0IGEvcnVzdC9oZWxwZXJzL2hlbHBlcnMuYyBiL3J1c3QvaGVs
cGVycy9oZWxwZXJzLmMNCj4+IGluZGV4IDc5YzcyNzYyYWQ5Yy4uNjM0ZmEyMzg2YmJiIDEwMDY0
NA0KPj4gLS0tIGEvcnVzdC9oZWxwZXJzL2hlbHBlcnMuYw0KPj4gKysrIGIvcnVzdC9oZWxwZXJz
L2hlbHBlcnMuYw0KPj4gQEAgLTMyLDYgKzMyLDcgQEANCj4+ICNpbmNsdWRlICJpby5jIg0KPj4g
I2luY2x1ZGUgImp1bXBfbGFiZWwuYyINCj4+ICNpbmNsdWRlICJrdW5pdC5jIg0KPj4gKyNpbmNs
dWRlICJsaXN0LmMiDQo+PiAjaW5jbHVkZSAibWFwbGVfdHJlZS5jIg0KPj4gI2luY2x1ZGUgIm1t
LmMiDQo+PiAjaW5jbHVkZSAibXV0ZXguYyINCj4+IGRpZmYgLS1naXQgYS9ydXN0L2hlbHBlcnMv
bGlzdC5jIGIvcnVzdC9oZWxwZXJzL2xpc3QuYw0KPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4+
IGluZGV4IDAwMDAwMDAwMDAwMC4uZmVhMmExODYyMWRhDQo+PiAtLS0gL2Rldi9udWxsDQo+PiAr
KysgYi9ydXN0L2hlbHBlcnMvbGlzdC5jDQo+PiBAQCAtMCwwICsxLDMyIEBADQo+PiArLy8gU1BE
WC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjANCj4+ICsNCj4+ICsvKg0KPj4gKyAqIEhlbHBl
cnMgZm9yIEMgQ2lyY3VsYXIgZG91Ymx5IGxpbmtlZCBsaXN0IGltcGxlbWVudGF0aW9uLg0KPj4g
KyAqLw0KPj4gKw0KPj4gKyNpbmNsdWRlIDxsaW51eC9saXN0Lmg+DQo+PiArDQo+PiArYm9vbCBy
dXN0X2hlbHBlcl9saXN0X2VtcHR5KGNvbnN0IHN0cnVjdCBsaXN0X2hlYWQgKmhlYWQpDQo+PiAr
ew0KPj4gKyAgICByZXR1cm4gbGlzdF9lbXB0eShoZWFkKTsNCj4+ICt9DQo+PiArDQo+PiArdm9p
ZCBydXN0X2hlbHBlcl9saXN0X2RlbChzdHJ1Y3QgbGlzdF9oZWFkICplbnRyeSkNCj4+ICt7DQo+
PiArICAgIGxpc3RfZGVsKGVudHJ5KTsNCj4+ICt9DQo+PiArDQo+PiArdm9pZCBydXN0X2hlbHBl
cl9JTklUX0xJU1RfSEVBRChzdHJ1Y3QgbGlzdF9oZWFkICpsaXN0KQ0KPj4gK3sNCj4+ICsgICAg
SU5JVF9MSVNUX0hFQUQobGlzdCk7DQo+PiArfQ0KPj4gKw0KPj4gK3ZvaWQgcnVzdF9oZWxwZXJf
bGlzdF9hZGQoc3RydWN0IGxpc3RfaGVhZCAqbmV3LCBzdHJ1Y3QgbGlzdF9oZWFkICpoZWFkKQ0K
Pj4gK3sNCj4+ICsgICAgbGlzdF9hZGQobmV3LCBoZWFkKTsNCj4+ICt9DQo+PiArDQo+PiArdm9p
ZCBydXN0X2hlbHBlcl9saXN0X2FkZF90YWlsKHN0cnVjdCBsaXN0X2hlYWQgKm5ldywgc3RydWN0
IGxpc3RfaGVhZCAqaGVhZCkNCj4+ICt7DQo+PiArICAgIGxpc3RfYWRkX3RhaWwobmV3LCBoZWFk
KTsNCj4+ICt9DQo+IA0KPiBKdXN0IG5vdGljZWQsIGJ1dCBvZiB0aGVzZSBoZWxwZXJzIG9ubHkg
YElOSVRfTElTVF9IRUFEYCBhbmQNCj4gYGxpc3RfYWRkX3RhaWxgIHNlZW0gdG8gYmUgdXNlZCAo
aW4gZG9jY29tbWVudHMpLg0KDQpDb3JyZWN0LCBidXQgaXQgbWFrZXMgc2Vuc2UgdG8gYWRkIHRo
ZSBtb3N0IG9idmlvdXMvY29tbW9uIG9uZXMgKGFsc28gdG8gbWFrZSBpdCBjbGVhciB0aGF0IHVz
aW5nIHRoZXNlIGFyZSBzdXBwb3J0ZWQpLg0KDQpUaGFua3MuIA0KDQo=
