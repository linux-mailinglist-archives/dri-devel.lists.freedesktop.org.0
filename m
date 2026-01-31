Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QMFgKkdhfmn0XwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jan 2026 21:08:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC43C3D71
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jan 2026 21:08:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C37DB10E3B2;
	Sat, 31 Jan 2026 20:08:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZLtobGKs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012037.outbound.protection.outlook.com
 [40.107.200.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A520E10E245;
 Sat, 31 Jan 2026 20:08:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nfFl2rdh2+EQ6uh7cFjwplaghXAaFNEPkEQkJbTpQf/sSkS9xIMObEz/3v7LuUGx1WF5Bii3GF/763EsdjR5kwI4hvuxgs+PgU+akz4a6PLs60mhgrPF5/e6FR5X1A+23HVaTfa8r3r8sp3gE1LLuFnC0UX/fAn63ovd2RLcNMcDfz3cyEae83Y0sky+V4TH11xHnutTMZWWgHirw0huUG03EcWV95yw9qUKQNFtH0g/NTlIV5kqrdmQTrXnQZK50IJpnSPusVNkCLlJ+EfEXsK/GTvOhicupgvgKfmpzaxSm9USSaUKFzADJHw4j6xKP3qnUgCaUUdoEu0uzZx5ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N/zLziUHhJJa73wU5kBka7ioNYG4BFXfJBCPilXug8Y=;
 b=CILkL6KeR/y6nHCOMdVXOUadjZz8atkU8EKjnvrEFeS+QbqLa3XQLfm6Vbr3uKM3bHaSdA7aFI2HiuVhQKctsMw7+oxAPYZyEEoXLT/NB5mYWDJli8Oejl5BoFvwRGK2lriy+0gdQMKbz6f7eMGgEREOMxP6SIZfTo127du1AvN+K/iRJZHyEO3nW3z1jgntmjlnlS/ubpzGL/p2jda3DHF4NStRk8LqWbay3IA1Ffy5YAXAhGVy0ZO7dMa6JdLfO+kRafAN7hAcAI9b2TTg7Zn/tC0z065hS5F4AEIMI+7qs3KnZIePCV0UqBANyE5F0O8lUQvwS1wfI713gnwvpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N/zLziUHhJJa73wU5kBka7ioNYG4BFXfJBCPilXug8Y=;
 b=ZLtobGKsiX02TTBsQq+TlRJPHlMwRGeG4PPE9+daWsmeN1JaLch1+VXDGBsgArcr1t72YIzN5gjOHMly0pVasbEiuz3gjxuyFGo5OK1YL9rRhdnV+rYck99GxiaQXb2tIC6dIByEAVRd8ExJpbMAFASyU+ExImyccQtUUB42uE4PceMEv2E1mLe7JJDlmwsuguiqzxMrbmnxipHocculRTDx1jK4tYGjzhRPpENTFSDcoSDxeOLuA90Ux5Auj1+Nr7kUt2Qq3dGPMaXw0XO5XuK9maHyIFDS1yxoZ9akzDTbedn/UZJIzUTJBSvSZNx55JOKcqAhglL3XbqFv7eTmw==
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 DS7PR12MB6007.namprd12.prod.outlook.com (2603:10b6:8:7e::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.11; Sat, 31 Jan 2026 20:08:26 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9564.007; Sat, 31 Jan 2026
 20:08:26 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: John Hubbard <jhubbard@nvidia.com>
CC: Dave Airlie <airlied@gmail.com>, Danilo Krummrich <dakr@kernel.org>, Zhi
 Wang <zhiw@nvidia.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Vivi Rodrigo <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Rui Huang <ray.huang@amd.com>, Matthew
 Auld <matthew.auld@intel.com>, Matthew Brost <matthew.brost@intel.com>, Lucas
 De Marchi <lucas.demarchi@intel.com>, Thomas Hellstrom
 <thomas.hellstrom@linux.intel.com>, Helge Deller <deller@gmx.de>, Alice Ryhl
 <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor
 <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
 <gary@garyguo.net>, Bjorn Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin
 <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross
 <tmgross@umich.edu>, Alistair Popple <apopple@nvidia.com>, Timur Tabi
 <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, Alexandre Courbot
 <acourbot@nvidia.com>, Andrea Righi <arighi@nvidia.com>, Andy Ritger
 <ARitger@nvidia.com>, Alexey Ivanov <alexeyi@nvidia.com>, Balbir Singh
 <balbirs@nvidia.com>, Philipp Stanner <phasta@kernel.org>, Elle Rhumsaa
 <elle@weathered-steel.dev>, Daniel Almeida <daniel.almeida@collabora.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>
Subject: Re: [PATCH RFC v6 05/26] nova-core: mm: Add support to use PRAMIN
 windows to write to VRAM
Thread-Topic: [PATCH RFC v6 05/26] nova-core: mm: Add support to use PRAMIN
 windows to write to VRAM
Thread-Index: AQHcik11qyGZbBwvz0WzOgfFZFFt+bVcRXGAgACjSACAAezQAIAIsj4AgAJhzICAAAyjgIAADTCAgAAbz4CAASb1AIAAYOAAgAAFsQCAARliGQ==
Date: Sat, 31 Jan 2026 20:08:26 +0000
Message-ID: <DC2A2E67-78ED-43FE-8AEA-B17737B3B0EB@nvidia.com>
References: <97af2d85-a905-44d4-951f-e56a40f4312e@nvidia.com>
 <20260130015901.GA301119@joelbox2>
 <c064fbdc-9202-437d-80ff-6134d2a33778@nvidia.com>
 <70d88203-2fe1-4bde-b254-51e8107744eb@nvidia.com>
 <CAPM=9twm1x9rH==uoGQLYa8b4feQMz=Ne14WPuhCPy9_H1u5Tw@mail.gmail.com>
 <cea5ddbf-8a6f-409e-bd15-b838a1dd0f65@nvidia.com>
In-Reply-To: <cea5ddbf-8a6f-409e-bd15-b838a1dd0f65@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR12MB6486:EE_|DS7PR12MB6007:EE_
x-ms-office365-filtering-correlation-id: 196930a3-8808-4ff0-5229-08de61047eac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?eHBXK3RzaWxFMWRWTnR5RXFGVjU3ZFUvZlFZWlJKM29vKzBnRmsxdnF1b3Br?=
 =?utf-8?B?MCtHY0d4RXZFZjZnc2NCaVRSZmhPTHpnVzlXdU8zZnlabkZHc3ovZThUbFlk?=
 =?utf-8?B?dEhTTCt0NWVsUGxIdWJjSS9jOFZiVHBzN0pJcnFkbG9wODFxQmhJRW9PbGpt?=
 =?utf-8?B?aWhOOWRwZ0ttQmdZTHVSS2ZuNGJyUzNDS2JxS3RHTzVmV1VIR0tHNHNBTFlU?=
 =?utf-8?B?SkpCcncvalI4bDRacHExVlp1SU1JU1E1WmFjcWg3cUNySjUrVTRDSkcrYkFC?=
 =?utf-8?B?YmlwTElUSjBoQXBrbHgvUjlBUTNwcHZyWUZxOG9oeUtNTCtiUHl5aEZuNGFL?=
 =?utf-8?B?R2hIOVBYdTNsWEk3NHdhZDdLVVFkU0IzRitHV1NvZW5ITGE4c0NldVcrVVUw?=
 =?utf-8?B?eU02Tnc1M21QdjlVSytSNWFSNDlxNHY4V3NhajdqTXFlcERmMUlyczlka0Vp?=
 =?utf-8?B?RWxxbGw1STJEMVdld0xZSityS28rTGtrd3V4UDZHWmpEcEpwcGNwbm90M3kw?=
 =?utf-8?B?eHdBNlprQWJiWUxscnNSSUg4OHAvV2R3R1p4bXkrbVFST29GQjBTcEFYdkNm?=
 =?utf-8?B?aHhjUm9EcXk1SHMxejVVSkI1RUlDZ09ZQytwbThTb2tLbHY3Ly84eFMyMUMv?=
 =?utf-8?B?NUp0Sk5tUDdWUUJpYjd2c0ViQUlzZXlBcTJOWWJXaFVzcVphSmY3em05eHls?=
 =?utf-8?B?UzZaN09hMkFWa2pUYnF3OFR2ZkR5eUVOckkydTlSSGJhc3pLTktYSVJaUlN3?=
 =?utf-8?B?eTRwdHN3ZnY0aEVTY0hKRDd3NkpoMFdmVCtWb2lpaVN5ay9QYlVuZTcwWTA2?=
 =?utf-8?B?ejF3M0F0UmVqNFk4T3JZMCtjT3JJb2IrMVFpdTlzMndZS3kyNS84U2w0NitR?=
 =?utf-8?B?TFdHajdVdU9MRk9UK29FZFdRU3hEemtpbGlLLzlYS1FKN21LM2RoQ2g1aWVD?=
 =?utf-8?B?QkF1WmR4K2pkVmFHZzE5emVLRWJZSFVSKy93YUFCbVFpT3dhRHBzdm9ON3pN?=
 =?utf-8?B?ZGtlL1N3OVpEL1hWbnk1bXltNVhKd0w1M1Jrc1FOWXNvY3BLY1RJS1BoMElX?=
 =?utf-8?B?em02Q2tZQ0Y0dnRUWWtaTVhMNlBGL3N4K29jVjUvVW12TE1vQjNGSFh0Vld2?=
 =?utf-8?B?MjFRMFYzRmkyc2Q3b0o3eGgrM0gvTHF0b2NmSUV1eHo3UFZ6cWlDVTl4YXpn?=
 =?utf-8?B?NG55T01ad1Q5Y0IwcjI2M0pSazFBb0UwUEVMZ0dQeUZDTnUxb21PS0tsTXNB?=
 =?utf-8?B?NEZYVDVOME1IREZ0RXRsV0dJZ2lESlY2VFMySzAyblhvNjRqWWJiN2x2cnc1?=
 =?utf-8?B?UVAyOFk5S0dUTVNwdjR6SC85aGJ0alFldDdFSkluWVltbkN2SjVzblJMSzI0?=
 =?utf-8?B?WnF2cjh3YnllM2xhL2NYcXpESGhKbDJmR0VBcHlXR0RVVllIM2ticGJwazZw?=
 =?utf-8?B?T0R5elZzTzhXTXJkeW9UKytBSkZPT1dQZzl4NnNrbHpEU0dybXdlNHloaFlk?=
 =?utf-8?B?TlJFeitFL1JnRlRkTndPNXl0aXF4dEgraWxBcFp3alExL3ZkbmJoRnpMZUFs?=
 =?utf-8?B?OFZpUGZpNUpZUWJZOTVxMmE4MmJqQW1ZL2xVZTh5ZGE2THpFQnZkMU5sNSts?=
 =?utf-8?B?eVAybzg3L0ppdEY2TWdBN09pNEhKOGJZNUM2ZDA3QmJ3Rlg2OXQxSEl2MHlC?=
 =?utf-8?B?dUhFU0NUb0x0UmhtK2JXVjlSVlg1L1E1VjZTdXRpaXR2OFllbTErZ0xRUWdq?=
 =?utf-8?B?OU94Z3hKMWJ2b3A4S0NjWlBlaHIwRE5kV0FKbDB3bzVGYkVFWDFNY2RBazV6?=
 =?utf-8?B?aUVhbGZUMUdYRTBwTGNhUDZ6cGY5ZHg5Z0dUdXZaR0swZHluM1ppK05hMDNr?=
 =?utf-8?B?TFcvNTdKNFRhZmFBTjhKbW1xaThOV2p6MWFsLy9hSE5DcHJpajFLa29BUmwy?=
 =?utf-8?B?NWgxcUlqWGpueDBZZndkNG1RVDBQNENQUjJOUkE4UDNBRWlzVTd4T0hPdGtJ?=
 =?utf-8?B?OCtRL2QzWlpOU1dOZGR6K3NybHpTZ0QvYTVTMzQraGtyR0F3NTJZdjFEZ0F0?=
 =?utf-8?B?aHFqb0FCcExQbmJiZHljb0k5akUxbVp5MzZrZ0dCTUZYbHFieUVRdlYxTDdS?=
 =?utf-8?B?RGxPQjU3Tkt6cUtHMmF2OVBIU2JCcHlCbjk0c2dQd08wQkdJZjFKcmloazh2?=
 =?utf-8?Q?AtPNzipyEarfv+vPd4UPWYA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cDZKRXRrY2lNRCtXTHdYQ2M0cUh1NkpDQVg5MkFMT2hyMFJOaURZU2I5NXpi?=
 =?utf-8?B?UDZDQlEzQ0FQV1BIQ0ZINUo1ckZyOVRLK1lJc0p5TWhQRUJ6cDlaeWd6eHc3?=
 =?utf-8?B?eU5Vcno0MUgwUzAyOHhEWHl5dmRVcllxNGdXRXJDSCtkT2ZXRGpEM3NIOHMy?=
 =?utf-8?B?L1p5dGFPWmk1SHpaVjNLSWlvSGJ6OUxUNjJGK3pjNFo3QlNTb2V1aThYRFJY?=
 =?utf-8?B?RzdPcGtQZ3pLV202WG03bVMwY1RKcFkzWlc5dWZKMmpXRG92bWt0bCtDNXdT?=
 =?utf-8?B?d2I5eE14amFuZG1jRW9rUWU5L0xoL3NneHFLOTFtenlsNkpFNVpNQzcwL3FT?=
 =?utf-8?B?bDBGVWlKaGczL1pvb3k0Ykg1QW0veVgwMFNZUTFMRW1lQ0pYS09GWmJjWTVQ?=
 =?utf-8?B?NFJpU3JIZmZNMzdXSXQ1TzlrN0pqaEdHSTBXVzlHcWY1SDNnd09PMjN3ems2?=
 =?utf-8?B?dTBlQXdVV1BVSnlsUnNQNzBrTy9TUW9LODRyaXR2NXd6bk1ncm1VYndzNnRH?=
 =?utf-8?B?ODI2WEVkdDdrMnhPUnZnVW5HTDJPSUEvVWxUQk9ObXBsV3gvekQ4WDJZU1Bw?=
 =?utf-8?B?RlJqMUlQS3IrZUs1ZU5CWEx2ZEFTWFQzOFhlYW9CdlBUcEZZdzJJTCsxdFVR?=
 =?utf-8?B?WGFHRXRxZTV0Qm9YZi9aTGZ1TzZZRWIyN1hFZjJ3VzlVd3NOOW9hVXhoYzg3?=
 =?utf-8?B?dlFucFlTVmdQNnZFalBqeDlHTm1tcEVqc3lPbzNLT0lFN0xZRnVrb0UyRXkr?=
 =?utf-8?B?S2NuQmZ3ZDIzR1lKbTJhQUxzNWNLb3hSUWw4MFZiSXU4MEx4a0lhWVN6SXZh?=
 =?utf-8?B?eTFTelFEcEZLVmo3bVExOTlwWGhwSlJPV3FoYTJEeUdBVmVzazNwRXUxYUp2?=
 =?utf-8?B?enVBL3Bpd0MvZlFQMUx0OFBoTGdHaDg4bS82QzYyQlAyMldCTGovVlFqQytU?=
 =?utf-8?B?Z3JNVldHT3pIOU12V3g4dnp4Y1JEaE9tZHhUbTUybmMvODJudGF5KzZya1Vp?=
 =?utf-8?B?R0tOUDBmQkt6VmREYU00ZUROZGJ0R3UvMzJMbjUwdGF0WkZncThnZXN4ZDJ2?=
 =?utf-8?B?VmNpdmI2N29Qc25DaG41bSs3dTJ4WGI2Sjc5RW9WM0poZDRFT0dXQUZneUcz?=
 =?utf-8?B?TTkreCtvU0o5ZlhMZjBRVHBTRFdYa2pZNTB4bVdLdFpEU05mZlZ3UVcvOUFR?=
 =?utf-8?B?ckZ1SUZJdW5HUUNzT3lObXQ2MHh0a2E0bTJEb3IzV0RMMU05K2lxT0s1Ykpl?=
 =?utf-8?B?MEtuM1lyNGZnNmx1RHlKMlBDWUx5M3BJWHVYblFXdU9paVBhZnNZZzhpd01Z?=
 =?utf-8?B?Yko5UmEyVjNGc1VsR083SnhPL2xyMEpUUWVSK0J3Nit6a2Y3UFVFbmFTbWZN?=
 =?utf-8?B?dFNWcWNhekZJSGQ4R0k0cCtmdDlqUjRjNCtBMGJFUFI3ajFnNXlLNkhMaGE0?=
 =?utf-8?B?b3k5Q0RNcERkUlpNbUppbkZmM3VQcWY5THQxaGxvcks3NVZzKzVXb2FJS3pw?=
 =?utf-8?B?Mmw5KzgveFBRT01zOUJCcEd2VlZlWXg5dTgyTGVtbFJiTUIvanQ2TXBwREMv?=
 =?utf-8?B?RlozTmZxWnU5d2FrQ0x4Y2R2ME04MWRrOFVKUVVBeFQzbmtudzJyRE5hdmhj?=
 =?utf-8?B?Y2pQV2FoWHFKTzRvWEkxdjNGZ0w2RzR3TG1VcjMvblpndzZtUEY5azlYem1t?=
 =?utf-8?B?bmxFTjh0MlVJTlN0VVRBcTZEZC9JZmM0MUtPOG1HeXZRRVpmaFh6QUdsQVF6?=
 =?utf-8?B?cHBuZGU0dTU2R3k1bkJvNkNOZzczb0NCdVpZL3VPRFlabnlsMFZhTXNBUVor?=
 =?utf-8?B?Tkw5bzdSNXIrL3UwYm92aXVtc1pHc1M0ajV6djhTTkZsVVZ0eENaSTNoTlpp?=
 =?utf-8?B?Tkw3bU93OHROTm9HUlZ4NzRmckNkQ3UrcXFnbmZkVmFvenVNZURGZjJKeUNw?=
 =?utf-8?B?Y214dGU4a2h6RE5sQ1krc0ppekNrQnNOcjFVS2o0SWErT0dpbVJBVGl5dWlw?=
 =?utf-8?B?c051Qm8yZTFKM0tPcFZ5aEIvQnNHMS9kRGQvc2FXb1dPSkYxNEhqU3VQRFlq?=
 =?utf-8?B?M01JWlRxbGFFbTRvajRqYkQ2b2lCUXJWZnRyVUx2d1NHMUN3Z0tKVmtJdndx?=
 =?utf-8?B?MlFoR2tMU2N3Rmp1NytFaDJPd3Y4MjZ3MkNLWjlpOTIvdldsNWZCZ1F4VUEz?=
 =?utf-8?B?VFpiaHNMMUN1Rm1Kbk51TkwrVXVJOHM0WnBHNjRMQytjYyswVERrcVU2ekV5?=
 =?utf-8?B?c3FlNy9pZE9qTjNiZkZDbW9BY1hhQ0VNbkhPUVVtOXN1RGwvdm8vSG9Pa1gx?=
 =?utf-8?B?VGtvYk9xbk9EK2VNYXU5MWU4R3FIeWY5YmZ3S2pyMGxseVJFWkF6UT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 196930a3-8808-4ff0-5229-08de61047eac
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2026 20:08:26.5749 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3ALg7giQenJ8evUDjZIKhp+KwfhF05hWotdwmYt9Rjfdhpxm/4eavcNYjehmaOZ+Bx9veflqGzt0X7643doYjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6007
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,nvidia.com,vger.kernel.org,linux.intel.com,suse.de,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,garyguo.net,protonmail.com,umich.edu,weathered-steel.dev,collabora.com,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_GT_50(0.00)[50];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 5AC43C3D71
X-Rspamd-Action: no action

DQoNCj4gT24gSmFuIDMwLCAyMDI2LCBhdCAxMDoyMeKAr1BNLCBKb2huIEh1YmJhcmQgPGpodWJi
YXJkQG52aWRpYS5jb20+IHdyb3RlOg0KPiANCj4g77u/T24gMS8zMC8yNiA3OjAwIFBNLCBEYXZl
IEFpcmxpZSB3cm90ZToNCj4+PiBPbiBTYXQsIDMxIEphbiAyMDI2IGF0IDA3OjE0LCBKb2VsIEZl
cm5hbmRlcyA8am9lbGFnbmVsZkBudmlkaWEuY29tPiB3cm90ZToNCj4+PiBPbiAxLzI5LzIwMjYg
MTA6MzggUE0sIEpvaG4gSHViYmFyZCB3cm90ZToNCj4+Pj4gT24gMS8yOS8yNiA1OjU5IFBNLCBK
b2VsIEZlcm5hbmRlcyB3cm90ZToNCj4+Pj4+IE9uIDEvMjkvMjYgODoxMiBQTSwgSm9obiBIdWJi
YXJkIHdyb3RlOg0KPj4+Pj4+PiBPbiAxLzI5LzI2IDQ6MjYgUE0sIEpvZWwgRmVybmFuZGVzIHdy
b3RlOg0KPj4+Pj4+Pj4gWy4uLl0NCj4+PiBXaWxsIHdvcmsgb24gdGhlc2UgaXNzdWVzIGZvciB0
aGUgdjcuIFRoYW5rcywNCj4+IA0KPj4gVGhlIHdheSB0aGlzIHdvcmtzIG9uIG5vdXZlYXUgYXQg
bGVhc3QgKGFuZCBJIGhhdmVuJ3QgeWV0IHJlYWQgdGhlDQo+PiBub3ZhIGNvZGUgaW4gZGVwdGgp
Lg0KPj4gDQo+PiBJcyB3ZSBoYXZlIDQgc3RhZ2VzIG9mIHZtbSBwYWdlIHRhYmxlIG1nbXQuDQo+
PiANCj4+IHJlZiAtIGxvY2tlZCB3aXRoIGEgcmVmIGxvY2sgLSBjYW4gYWxsb2NhdGUvZnJlZSBt
ZW1vcnkgLSBqdXN0IG1ha2VzDQo+PiBzdXJlIHRoZSBwYWdlIHRhYmxlcyBleGlzdCBhbmQgYXJl
IHJlZmVyZW5jZSBjb3VudGVkDQo+PiBtYXAgLSBsb2NrZWQgd2l0aCBhIG1hcCBsb2NrIC0gY2Fu
bm90IGFsbG9jYXRlIG1lbW9yeSAtIGZpbGwgaW4gdGhlDQo+PiBQVEVzIGluIHRoZSBwYWdlIHRh
YmxlDQo+PiB1bm1hcCAtIGxvY2tlZCB3aXRoIGEgbWFwIGxvY2sgLSBjYW5ub3QgYWxsb2NhdGUg
bWVtb3J5IC0gcmVtb3Zlcw0KPj4gZW50cmllcyBpbiBQVEVzDQo+PiB1bnJlZiAtIGxvY2tlZCB3
aXRoIGEgcmVmIGxvY2sgLSBjYW4gYWxsb2NhdGUvZnJlZSBtZW1vcnkgLSBqdXN0IGRyb3BzDQo+
PiByZWZlcmVuY2VzIGFuZCBmcmVlcyAobm90IHN1cmUgaWYgaXQgZXZlciBtZXJnZXMpLg0KPj4g
DQo+PiBTbyBtYXBzIGFuZCB1bm1hcHMgY2FuIGJlIGluIGZlbmNlIHNpZ25hbGxpbmcgcGF0aHMs
IGJ1dCB1bnJlZnMgYXJlDQo+PiBkb25lIGluIGZyZWUgam9iIGZyb20gYSB3b3JrcXVldWUuDQo+
PiANCj4gDQo+IE5pY2UhIFRoYW5rcyBEYXZlDQoNCkluZGVlZCwgdGhhbmtzIERhdmUgYW5kIEpv
aG4uDQoNCg0KPiAsIEkgZ3Vlc3MgdGhpcyBpcyBvbmUgdGltZSB3ZSByZWFsbHkgc2hvdWxkIGhh
dmUNCj4gdGFrZW4gYSBwZWVrIGF0IG5vdXZlYXUgZm9yIGluc3BpcmF0aW9uIGFmdGVyIGFsbC4g
OikNCg0KSSBoYXZlIGFjdHVhbGx5IGJlZW4gcmVmZXJyaW5nIHRvIE5vdXZlYXUsIE9wZW5STSBh
bmQgYWxzbyB0aGUgY29yZSBrZXJuZWwgbW0gY29kZSBmb3IgbXkgcmVzZWFyY2ggaW4gdGhpcyBh
cmVhLiBUaGVzZSBhbGwgaGF2ZSBiZWVuIGEgZ3JlYXQgcmVmZXJlbmNlIGluIHRoaXMgcmVzcGVj
dCA6KS4gVGhhbmtzLA0KDQpKb2VsIEZlcm5hbmRlcw0KDQoNCj4gDQo+IHRoYW5rcywNCj4gLS0N
Cj4gSm9obiBIdWJiYXJkDQo+IA0K
