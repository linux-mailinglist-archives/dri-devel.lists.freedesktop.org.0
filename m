Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 466D6B8C4B5
	for <lists+dri-devel@lfdr.de>; Sat, 20 Sep 2025 11:33:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFD8D10E29E;
	Sat, 20 Sep 2025 09:33:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="M7KrN5nS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011033.outbound.protection.outlook.com [40.107.208.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37ECB10E29E;
 Sat, 20 Sep 2025 09:33:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gsR74W6NlId8MGLnKHhbU0uVVVOb3CVTNXxkeounS+DkaYCe2UY8SGq5Gs5tLSq2y+uLcgUerTJ/ojMU5p3hvtDK4oY5+0rqFSJrrlZNmyUx6LulxwDCvfNEAF+52a2EAqy2c5MWuQJl6z1UDmk8SoUVzVkDs6oiOtKJDZcuRMedW0N1DJ3HndMPm50gp4GyYBtlQStvVV1wER3fM92b9nldPHTlKHiIT/XiuKbXRtWiB3DdN8v/CL3z321QxWVRQ8soWreiLYSsWXxuc5HFmHvYmuzrfwlO5tLWNkhX7JkaB6BalArImvDaSGfaZU9kefv3coP5Q3VX520PzMlvrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=grL1Iebdb8RlpUy9fwREuJG+Uuep1I+wVqR/s76v75I=;
 b=JivwN7Dj3EomnXRz9eAUKpFP98HnPdUaxSLxstUz3CZ2Wom+ROAcofp4nKMASPmD+qwsAVGqbtZUCV5Ohrr06r9KrlYrb7rMyUaHiivahiolcldT70GsZgrz2nYD0h9ZxfVmkumZwblVsLiburZ/r9GI/QVlgSX1woR5qqexY+aTwtIm47D1Lb609IE0NbnZxOAB6v+AxCIRusZx2hLpA0Alt0nBUABE5IRR5MgaXv9caaX/ETUplqGL2PvPNIZ6wXS6ZZTHDsbqCzWYSkEQzoQYpVkrOFST/SnmsJRCJ+cI26G92kH+Zmuy8rsRJA+GQUa/A75ZgD67OkvjLD2UDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=grL1Iebdb8RlpUy9fwREuJG+Uuep1I+wVqR/s76v75I=;
 b=M7KrN5nSx27lM+f+i0gx3ORaJ+d/bqmlqSxbo7sXDxXQoquBhxbuup/pn6R1WK3AG4+iZmVc8CLDZm6OMF/ovPDIYlsImbDKZhVKus5ZtZdHhz0Rj3stb5skyu8Bpqthn49PbuNRHcqDutJ+rzAHhnHpPe7jSJAYO9JKhrKa7k3BHrbgkDxVRYq/oDZ+G3igqMjfAOk3DlUqA9cvy1Ug1Cue3fGIZNQO1olO6TudxvyO/4XF9CaNrzq0LtNFEbi8jLjTfC+D2veZHAnc0/+Flb4/+4HhC3jWTAEK7BexIwdpkeyvhLTGZDloZHgrpTgT4tZIN/Up/MRxmkN3HZ0VRw==
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by BY5PR12MB4033.namprd12.prod.outlook.com (2603:10b6:a03:213::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.16; Sat, 20 Sep
 2025 09:33:47 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.9137.012; Sat, 20 Sep 2025
 09:33:47 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: John Hubbard <jhubbard@nvidia.com>
CC: Yury Norov <yury.norov@gmail.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
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
 <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v3 5/5] rust: Add KUNIT tests for bitfield
Thread-Topic: [PATCH v3 5/5] rust: Add KUNIT tests for bitfield
Thread-Index: AQHcIc+ileobuQ+ns0yxNtFPRm9kSLSLu8IAgAFQU4CAACw+AIAIZS8AgAWs2wCAAAPFAIAAkZLT
Date: Sat, 20 Sep 2025 09:33:46 +0000
Message-ID: <CC11C4AC-A37C-4BB7-820B-7AC257D719D2@nvidia.com>
References: <20250909212039.227221-1-joelagnelf@nvidia.com>
 <20250909212039.227221-6-joelagnelf@nvidia.com> <aMDq2ln1ivFol_Db@yury>
 <bbd6c5f8-8ad2-4dac-a3a4-b08de52f187b@nvidia.com> <aMIqGBoNaJ7rUrYQ@yury>
 <20250916095918.GA1647262@joelbox2> <20250920003916.GA2009525@joelbox2>
 <569b2f95-fa8d-4bd0-9e90-512b677435fe@nvidia.com>
In-Reply-To: <569b2f95-fa8d-4bd0-9e90-512b677435fe@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8059:EE_|BY5PR12MB4033:EE_
x-ms-office365-filtering-correlation-id: d2c4ea2a-d5a5-4a4d-60ec-08ddf828cc71
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?ZG5jNEsycHFQd3dEaXdPc3BoNDZPQUJXdzh3UEM4THU2QnBiVEhYR29McWg1?=
 =?utf-8?B?a2d1VFVYQVl2QXZrQUJBZDRYQ0RTTVVwZytONlBMdGZUb1o0dnZyMmFFSjM0?=
 =?utf-8?B?ZVhTcWpLNXZLZ0FYeXlJZ1B0TkZEV3YvUUVmY0V6a3Jlb0NVbnBVL3J1bktq?=
 =?utf-8?B?YmlkMDE0clBYb2NhalZ2WEszVWl3M3ptOHFhWHlzbExUdXpTclo4N2g2MHRW?=
 =?utf-8?B?THhRWU5PRlo1ZlFEK1h6Y3ZwaitwSGxiUWhZZzkva1I1N2ZWa2ZTVzFNa2RU?=
 =?utf-8?B?b1YxU0daTEJ4bUt0bE80bjVpMnpSSGhZUkYyN3lXc1RXbERudmczNHR1SCsv?=
 =?utf-8?B?d1ZFWFUrNFVLeTBvVSt5d2dPSFhiZ0d3MkZWbk9rMnBRZXVxNHJRN3RpUVgw?=
 =?utf-8?B?Yk1hOVBkZUwzalkyeUMrTDgySHpTdWVqd3VtdVZReWE4Ynp2TkxJTXVXUzBl?=
 =?utf-8?B?Tm84MWgwNVFTaTBWbFV5ZkdVNm9iQWFYZis3VExzWFlMYjArWDVXRnU1ZUVN?=
 =?utf-8?B?YkRGbk1EeGRKU2hud3VnZ0pwK2x6SThkSVZLSWUrMUVEdy9sdnY2Nmp2b3Bt?=
 =?utf-8?B?Y01rZHVLTXR6Qm5WMmpUVnc3MVUwN28rVDZWdFBERmQrN1pwdEptcFVpdUZy?=
 =?utf-8?B?aVpwMzFHcmhuOXJiREljV0R5cXFiV0pxdmVYeVFyMWhEeVBXQStXd0xqV0NH?=
 =?utf-8?B?Ritta016ZkxDZVhIMFRnSlNRQ0ZBM1hYVWJlZUZCajV6cE5qa0xqN0xQdnVi?=
 =?utf-8?B?bUpjaC9CU09KRUFjVjZOSi9iRGtEbzByU2pGYjBPWHIxN3RCbjl4eW5melln?=
 =?utf-8?B?TDA0eEx1dzU4OXpyc0o0aThuY3paMlFabWF4eGYzMGRhTUlLRmN2RTJDbW1p?=
 =?utf-8?B?eHluQnlEWjI0b05oVGJjY2x3OXBRUFRFZGIzRFhiWkpBVytwemZaeXYyRW01?=
 =?utf-8?B?VVI3TEpTS3N6UkNLSTJJTEc4RjgrYXI5VElzdmk4Q1lqMEltRGRLdWhFUVln?=
 =?utf-8?B?QkRQdWJGSnJJM0dTdURacGFTdFA5cTVqdEVvREJhV2VQbkZaQUlVU3l3Nm5j?=
 =?utf-8?B?amROb2Y4Z1cxMDZ5TzNFbWpHTUlyOVdzRjRxQ3JvNEkzQWhLUFVMNGVwc1R1?=
 =?utf-8?B?aFIwVjRnMlhQU3l5TXpiWG1NOVhBTjA1RHZpVnFZL08xRHhFbXBzVGd4UTdY?=
 =?utf-8?B?THY5K2tsZEd2VjI4YXBTb012ZDV2UnpRcDMwSjBMMGw3dFNrQUFzRVlmNzhJ?=
 =?utf-8?B?RS9oMnI5VVJ4eVNaejFBaGJHWHBveDlWRTZTd0dYU3NDMEE0c051YWZQb05m?=
 =?utf-8?B?Rkp4UTJXMUJ0dFB4Tmkrc2xOTWZFdUtTbUlUU2Y0NDRScFphT1M0Tlo2ckdl?=
 =?utf-8?B?djc4QXRUMlhqbDFsWUVwL3UxSGE1Q3dNRjRWeGpiSzdvVHhGMzhMU2VMcDNq?=
 =?utf-8?B?NHB0cGFzMWFUQ0xTMFZDMjFmUVpFSW1SWWdJcGZOdnRqOEhKUWd5RUpJdlFP?=
 =?utf-8?B?cklHbEpBWENsMHY1NnN1cGIvRmllMExmSXpVNWM2dTBNb2srM01rOU1EQ0Ur?=
 =?utf-8?B?NTJDaFdidnEyaHF5ZzBONTNRZFBjY0NGdVRENmpGeTFLbkpHaFhncWN0bkJ4?=
 =?utf-8?B?Sm5jSDZwRFVETjZKbGhMU3ZyMnFxSU11QWFlOVJLQTJsUlRzc29MMXFJcndp?=
 =?utf-8?B?NldmeVFQUVM1SDNtVjZnMVdvOUVXc1NHVjhQNmE0aW1nKzlyMVNaVHAzbVhN?=
 =?utf-8?B?bHZoVTIwNFpXNzBuODQ2TTRHSmcyeWNPNktVVjZmL05nZjB1Wnd5TEZtTjNO?=
 =?utf-8?B?MmFJY0ZPeE5GZnRIelgycEd0N3JrVk9qWW02M0Zrb2w2Mjlzc0MyeEdJRUpu?=
 =?utf-8?B?Ym4rbTBoODVEQk81VnZwd0IyeU1Jekk3STNVUG02ZUsvRElYY0dseTJxaER6?=
 =?utf-8?B?bHE1cEd0c1A4amJrbHBUcFoyOHZSM2J1TzNjMXNlb1NleEVoM3AxVXVzMXVH?=
 =?utf-8?B?S29iUjdjMDlBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dTJ5elZSRENtaVd2NzgwRVluQlpZUlp4QmRpM3VCTlpmSmZ2M0o1SExwaFRY?=
 =?utf-8?B?K0pSNGlqR0FqbjlIVVl0ZGlFZHhqbFdZc1B5L3VucllnWG9yeVEzZzdFczM3?=
 =?utf-8?B?bmJkZUo0UmJRVFQ0Rjg4cmZ3OW94SlBaU2hTeEcyN3ZzMVBkWHNSVjJoRUxs?=
 =?utf-8?B?VHJockJma3FOa1M4b3gxTlJkdWdFVFVNVURhcHRpWmRwVHU0Y200VzVJSWZP?=
 =?utf-8?B?cm81aEhXYjEzcFljRWs3Q09kMk5DQVl6cDhIY01KT0FqVzNhUVZKMGZvalZK?=
 =?utf-8?B?UTI1aUdXOXRybExnR0w3UTdJL1RRMVpFL0gyZGFrTWQzV2hoSVM0MEk5WjBr?=
 =?utf-8?B?Nk1xNE5zVW1ISEpGS2pKd3RrRWQ2bFNQSDkxWWRKMmErZmNOb0MyZjdSWTBU?=
 =?utf-8?B?WjFPM01TdE0zQnBzWWVFZkUrMnBsQlRWMUxCQlN4V2hxdXQwSDlMOVJjQnA1?=
 =?utf-8?B?R2ExczVXUEhRMHkzUnd2QXBZRHhhYnMyS0dLSVNsVlZLYXlwZExnNGRkekF4?=
 =?utf-8?B?cmlqcXNmbkdOcHh2OHlGNEsrNUlETXUyQVJSVkRjSERsbCtvNERwUWs1ODZw?=
 =?utf-8?B?RXVtOEpqa3ZxK3hPZ1dHYnNyR2p0NUFtUndBeUNsRFZhditjKzVXRWU5WWNG?=
 =?utf-8?B?cWJNY0xhbnR0MGV2OVEvdjZocDA0eGUyeVNDZFJjWUE4ZGNUVTNiY3hhQkU2?=
 =?utf-8?B?NFRWNm5lc3pxZmVDQThMTmhhblY3Nk8zQU5IODc0b09OcU04S1c5Q2hjL1dX?=
 =?utf-8?B?bWxEV2Q5ejM2VVRKcmhQZlIwR1JnazBYRU9uOGpkb2VndjlMNDVEK1MzNys4?=
 =?utf-8?B?WTI1eThOU1JDK0h1M3hpbDJQdXhpWFEyalRTd3B4OE5Fd3RPME1VQWIyS3VF?=
 =?utf-8?B?ZEtaNnpoSHJ1MlE5d0RicVFLZ3p6cjNabVdRbTE5eWt0eFJOR0NwTGVla0lJ?=
 =?utf-8?B?MFhZS2M4MU9peFpobGdDdXJFeG9tWHZsOElZOTJJTmo1YURkWlNON3RCdjZv?=
 =?utf-8?B?bmFHSVJGK2JvTGdJTzZkbEdNVEtabWlLWllzUGFvdU5LNlZoT09DMFNTSHZt?=
 =?utf-8?B?a21Lc0RPV0hYd0kvd3BLUmFuL3NBY0hZOFlxeHpPeFViRDlUOVEzL3lXblNl?=
 =?utf-8?B?NzM0azdNUW9nTDFGUm8xdk9jcHJFUFpNM2xiQjFIZkEyb3UwR1FQS2d2c001?=
 =?utf-8?B?SlNKcDJOYkFnL08rT1BZRjFSTGJYN0ZyVkU3ekRMbXU4dHdaNDlaV1VGNlVm?=
 =?utf-8?B?Wk00a0Vzd3h5R2FqVmJFVGxDWmV6Y1RxNy9RMjFlWDRSSjFiOW9TUXl6VXlY?=
 =?utf-8?B?MWJVODN0RkFmMWZ4elJaK1kvL2lJRFB4aFNXcVMvQlhHZWlzMjc5YXNkV2RJ?=
 =?utf-8?B?U2pUOGtBR1BuQWhXYjJlVGVPQXNHb2lMTnI4S0RTQ2xPZnBiM0ZwUjhCMmhP?=
 =?utf-8?B?Y01JamtXalhNMGc3YTY2TStsbERFTjVaM2p4Rk05SEluOURqSjhXZ0ptVEZQ?=
 =?utf-8?B?dDV2aTF2VGVqaE1kUDEwSFlSc2FhL1lTWjB3ZzhNQ05tZGdYM0hkL0ZsaDRo?=
 =?utf-8?B?dzJ2MnIzaThrRE9aOGRodDNWL1ZRdzFISGFBWmJRbFRTeEdTZ2U3djY3U3FU?=
 =?utf-8?B?ZHhGVFN2Z3FGRVd2QmJ0akxSR2VpbTVRQk1zYjRQT3h3V2d3QmlwOGkxUDd2?=
 =?utf-8?B?VFFNSzMrRmdoR1VtZEZWbjBFQVBveTJwRnVHeUlURE1BRmtoRnd0dUlBUHp2?=
 =?utf-8?B?b0c0QXVNOExac0RsVkI4TEhYOU5NTzFwWlhvdzI0UzJUWjE0eWFjQXpqVE9t?=
 =?utf-8?B?b1VubmtGVUVNdmdDck5yRTQ2bERVRy9LaWlmRStNSnVHUlpwek5ic1R5SkNw?=
 =?utf-8?B?OWNwbEVFTzg1ZWowWnhkbkpLcDBVQTJMRlo4cXdFVms1dUgyTHAvYkV5dkxl?=
 =?utf-8?B?UXM5YmNQZTFLOUFZdGJ4RU1KNXpnSElZdVNZL0N6Vis4Y0pEanB1dDFDRzZ0?=
 =?utf-8?B?MU9kaEV6REZBUHBFaXdjb0J6SThxWGFZY1VydHNtSkw4MlV2bmJMbUE2VDhP?=
 =?utf-8?B?bTd3WXFxRERaQnJZUXJhelZ4RGtyU2ttQUxPRndLRHYvRDZRNUg1R1N3TGRT?=
 =?utf-8?Q?PuiEI/MzgJye7JhyxgxmKVZMo?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2c4ea2a-d5a5-4a4d-60ec-08ddf828cc71
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2025 09:33:46.8415 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AtR+gq6Z5nIoQEUVyqXOk1BBlIhkRC/ZDZib9cw3QdcEyrTAh1itOWF7kcLt+mhaLGj70JmBgUU+XOj+lcotjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4033
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

SGVsbG8sIEpvaG4sDQoNCj4gT24gU2VwIDIwLCAyMDI1LCBhdCAyOjUy4oCvQU0sIEpvaG4gSHVi
YmFyZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4gd3JvdGU6DQo+IA0KPiDvu79PbiA5LzE5LzI1IDU6
MzkgUE0sIEpvZWwgRmVybmFuZGVzIHdyb3RlOg0KPj4gT24gVHVlLCBTZXAgMTYsIDIwMjUgYXQg
MDU6NTk6MThBTSAtMDQwMCwgSm9lbCBGZXJuYW5kZXMgd3JvdGU6DQo+PiBbLi4uXQ0KPj4+Pj4g
SW4gQyBhbHNvIHRoaXMgaXMgdmFsaWQuIElmIHlvdSBwYXNzZWQgYSBoaWdoZXIgdmFsdWUgdGhh
biB3aGF0IHRoZQ0KPj4+Pj4gYml0ZmllbGQgY2FuIGhvbGQsIHRoZSBjb21waWxlciB3aWxsIHN0
aWxsIGp1c3QgdXNlIHRoZSBiaXRzIHRoYXQgaXQNCj4+Pj4+IG5lZWRzIGFuZCBpZ25vcmUgdGhl
IHJlc3QuDQo+Pj4+IA0KPj4+PiBJbiBDIHdlJ3ZlIGdvdCBGSUVMRF97UFJFUCxHRVQsTU9ESUZZ
fSwgaW1wbGVtZW50aW5nIHRoZSBjaGVja3MuDQo+Pj4+IFNvIHRob3NlIHdobyB3YW50IHRvIHN0
YXkgb24gc2FmZSBzaWRlIGhhdmUgYSBjaG9pY2UuDQo+Pj4gDQo+Pj4gQWggb2suIFdlIGNhbiBh
ZGQgdGhlc2UgY2hlY2tzIHRoZW4gZm9yIHRoZSBhY2Nlc3NvcnMsIEkgd2lsbCBkbyBzbyBpbiB2
NC4NCj4+IA0KPj4gVGhlIEMgY2hlY2tzIHVzZSBCVUlMRF9CVUdfT04sIGluIHJ1c3QtZm9yLWxp
bnV4IHdlIGhhdmUgYnVpbGRfYXNzZXJ0IGJ1dCBpdA0KPj4gaXMgZnJhZ2lsZSBhbmQgZGVwZW5k
cyBvbiB0aGUgdmFsdWUgYmVpbmcgYSBjb25zdGFudC4gU2luY2UgdGhlIHNldHRlciBBUEkNCj4+
IGFjY2VwdHMgYSBydW4tdGltZSB2YWx1ZSBhbmQgbm90IGEgY29uc3RhbnQsIHdlIGNhbm5vdCB1
c2UgdGhpcy4NCj4+IA0KPj4gT3IsIHdlIGNhbiBmYWlsIGF0IHJ1bnRpbWUsIGJ1dCB0aGF0IHJl
cXVpcmVzIGNoYW5naW5nIHRoZSBzZXRfKiB0byB0cnlfc2V0XyoNCj4+IGFuZCByZXR1cm5pbmcg
YSBSZXN1bHQgaW5zdGVhZCBvZiBTZWxmLiBBbHRlcm5hdGl2ZWx5LCB3ZSBjYW4gaGF2ZSBhIGRl
YnVnDQo+PiBvcHRpb24gdGhhdCBwYW5pY3MgaWYgdGhlIHNldHRlciBBUEkgaXMgbWlzdWVkLg0K
PiANCj4gUGxlYXNlIG5vLi4uDQoNClRydWUsIGl0IHJlcXVpcmVzIHNpZ25pZmljYW50IGNvbXBs
aWNhdGlvbi4NCg0KPiANCj4+IA0KPj4gVGhvdWdodHM/DQo+PiANCj4+IE9yIGZvciB0aGUgbW9t
ZW50LCB3ZSBjYW4ga2VlcCBpdCBzaW1wbGUgYW5kIGZpbHRlciBvdXQgLyBpZ25vcmUgZXh0cmEg
Yml0cw0KPj4gb2YgdGhlIGxhcmdlciB2YWx1ZSBwYXNzZWQgKHdoaWNoIGlzIHdoYXQgbm92YS1j
b3JlJ3MgcmVnaXN0ZXIgbWFjcm8gYml0ZmllbGQNCj4+IGltcGxlbWVudGF0aW9uIGN1cnJlbnRs
eSBkb2VzIGFueXdheSkuDQo+PiANCj4gDQo+IFllcy4gQXNzdW1pbmcgdGhhdCBJJ20gbm90IGNv
bXBsZXRlbHkgbG9zdCBoZXJlLCB5b3UgYXJlIHByb3Bvc2luZyB0bw0KPiBzaW1wbHkgdHJ1bmNh
dGUgdG8gdGhlIHNpemUgb2YgdGhlIGJpdGZpZWxkLS1ubyBwYW5pY3MsIG5vIHdhcm5pbmdzLiBB
bmQNCj4gdGhhdCdzIHBlcmZlY3RseSBmaW5lIGhlcmUgSU1ITy4NCg0KT2ssIHRoYW5rcy4gWWVh
aCB0cnVuY2F0ZS4gVGhpcyBpcyB3aGF0IHJlZ2lzdGVyIG1hY3JvIGFsc28gY3VycmVudGx5IGRv
ZXMgZm9yIGl0cyBiaXRmaWVsZHMuIFRvIHRoZSBwb2ludCBKdXJ5IGlzIG1ha2luZyB0aG91Z2gs
IHRoZSBDIGVxdWl2YWxlbnRzIGRvIGhhdmUgYnVpbGQgY2hlY2tzLiBXZSBjb3VsZCBkbyB0aGF0
IG9uY2UgaGUgaGF2ZSBhIGJldHRlciBidWlsZF9hc3NlcnQgaW4gcnVzdCBidXQgdW50aWwgdGhl
bi4uIGhvcGVmdWxseSB0aGlzIHN1ZmZpY2VzLg0KDQpJIGFtIGN1cnJlbnRseSBhbHNvIHJlc2Vh
cmNoIGJldHRlciB3YXlzIG9mIGltcGxlbWVudGluZyBidWlsZF9hc3NlcnQuDQoNCiAtIEpvZWwN
Cg0KIA0KDQo+IA0KPiB0aGFua3MsDQo+IC0tDQo+IEpvaG4gSHViYmFyZA0KPiANCg==
