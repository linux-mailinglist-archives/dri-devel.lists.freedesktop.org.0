Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5763EC05F7D
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 13:31:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B07A10EA33;
	Fri, 24 Oct 2025 11:31:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="iZraHwwq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012060.outbound.protection.outlook.com [52.101.48.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD41210EA31;
 Fri, 24 Oct 2025 11:31:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=twPrZV/NhRdr7MNrKW7vh6ccN3GphE+omKPfJ1Nba8uZoHWmLZbJc0CXpg44AQ0NEznCYm5GGhNyEIEqDX2TgN5K+OHtvyIRBXHcb7BbountJF4eDIYzP1iDWL77kdj6vWO4OOnXN9XkHPWLby4P/lBUblUdnuMwhfkE7PiE1LoM3d1+angjixk39uxyYm3t9MOS9JORz4WYjpzimoVWtkBBzOIcTBlksEuplzIZQ/rr/a+/w9pHuplJW5pzcr2aOmC2v8hPZ7MzbeULOGUWI+/AiZDUo+2gFhOphKjH2dSX1BLQns5LqxkcjqYajg8k/m5MbIdy5/42n0JLtgjhHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CX/UwW0JtNZOuWi7WgCmDttpC5DraAJLZACuvMHQyLM=;
 b=sOjEKNIsnwMAuX9Tvl+zSn5qhyk6z3mRgw9OFSayMkDEiZxXnxjEiZ7qfELLhgmiJ8q3q+YHicg/VGZl0UVppZMdYSxkxpM0K8neeu8947QLm5kpEbJTCMoqFPZHn0kuYWkwz7xpcgcuzuBiE1E3daaW1mbPlHPbjk/FI/URV2izOZuoi6ZZU8BbX6Cmt1Bv39qclh2t8TTfmyP/HofOd2BphNavMvPRM4+5/WV7kn9dKdgj7HQFyo0SFP1Is6nwo4bmD8r0XZMc3rXra+0iPL1rViYDV6zT0j1AH3vwdCUZBQyr/0YgMNhxtQSbCn5niIopRanXyHQKXvbvUEJxkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CX/UwW0JtNZOuWi7WgCmDttpC5DraAJLZACuvMHQyLM=;
 b=iZraHwwqWdMPgxIdMUlRrglugHXFtNL7RUKJLXcJE3hxC9KPOuPI2oinTf3XjWVRs5B0Ug1j7jiKf37ia2o9nCoqWngwO/l/cf0dvE0KGy6vD8hBGu5mlFdc7Qo1K6GXmnkYmhMxwqLFU5Nv7ZlTwqToXEYBMViV9+uRLDLU40PhvKbWNvZGcgWseMRuBUhCwNtk/2ZtfujgQ1xYVqwDcwDVUpYcXk3tBokJZTKBiZ/V1yIM33jXxulsePV0PSngM2FsdJcrjuDXCbME1vtp6Pf9fw7rbz5GkQtjc824lYKRwB2qJgEGIHp+6i3fDnJ4qeFv9G3+w8R+IUTXBIO+Ow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB7872.namprd12.prod.outlook.com (2603:10b6:510:27c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 11:31:17 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 11:31:17 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 24 Oct 2025 20:31:13 +0900
Message-Id: <DDQIOKFEXK29.3FDIXOR8S1284@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>, "John Hubbard"
 <jhubbard@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <dakr@kernel.org>, <acourbot@nvidia.com>
Cc: "Alistair Popple" <apopple@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Timur Tabi" <ttabi@nvidia.com>,
 <joel@joelfernandes.org>, "Elle Rhumsaa" <elle@weathered-steel.dev>,
 "Daniel Almeida" <daniel.almeida@collabora.com>,
 <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH 6/7] nova-core: mm: Add support to use PRAMIN windows to
 write to VRAM
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251020185539.49986-1-joelagnelf@nvidia.com>
 <20251020185539.49986-7-joelagnelf@nvidia.com>
 <0cfdfc96-f98b-4ec1-9218-10f7344d6605@nvidia.com>
 <a8eeccb7-9586-440f-a12a-e877a9197652@nvidia.com>
In-Reply-To: <a8eeccb7-9586-440f-a12a-e877a9197652@nvidia.com>
X-ClientProxiedBy: TY4P286CA0018.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2b0::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB7872:EE_
X-MS-Office365-Filtering-Correlation-Id: e2b35252-c8ca-4908-2e26-08de12f0d86e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|7416014|366016|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RXlpSWtENkRreHdyMTNJWjFzVUg5c3hhb0pnWXhmTEt4U3RhQzJKZmFQMndw?=
 =?utf-8?B?NGMyV3Z6U1REKzJxR1Nqc1NFYnNLRVcyb0NETXRHaUZKNnNpY1p0QUErOTBy?=
 =?utf-8?B?SXZDUnM5VENMUEpLQ1VrQ3V4bzlqMVJwQlNNTDNhTml5KzJpZVZIaFRPRSt0?=
 =?utf-8?B?cGEwZU05SDIyV0YwUUtrb3pLVVhab05FckcyNExSTjdyczRKb0JqaFlhbWpG?=
 =?utf-8?B?RjREd0dZMW1qb0ZWSUpxVFVGR3oxWVl0NGFQR3FlaVRGWTRSVElhMlFmMlJE?=
 =?utf-8?B?eUplbXRZZDREYW1LVTJLYWg4Z2NmNGJLeGFwbmkyeUwvMkRQellYTHovSUl4?=
 =?utf-8?B?eThqSjJpZUVRRjdkenJ0cXJBRjlkUnk0eXJJL1NDdVM2WlFZRktFRm9jeHZw?=
 =?utf-8?B?d3hsVUI5UmEwY21JZ1V5d04xNnlaUU5Zck9DbzFZUVQ0T0taV2dwU1B3Vjhz?=
 =?utf-8?B?NHV5anNuYkRVSTNXUlUxWEt0ZUhuUlNsWE1SZkJmcW52K0kwRGYrWFBMTUJQ?=
 =?utf-8?B?UXZDM08rNklTdCtoakxZVDc3dHNPMDRuVFFLR01valhXT05TVkpWRW0rNllY?=
 =?utf-8?B?ODJhSkV1eTZqWENyc2JCQ29LUVFvVkhoYWtlNW9JaGZwSG5BaTVJQnJzblFS?=
 =?utf-8?B?YkM3S2FsVVFZajdIS3lodVUzU0dObG9vVmxCbS9DUnlSQXVlRlB3UDh1TGtT?=
 =?utf-8?B?M1VBMjFESkIza1dZNHFad1I3ZDYyTVBpSmY1dUdISUQ1YTl2NkxzQ2tmanVo?=
 =?utf-8?B?UTRWSVJEdHRLVjNlVEQvcUROZnRYWVdQYnJ2K1RhZVE4NC9RNkJUaU9Eb2Zz?=
 =?utf-8?B?OW9YTW5NcCtURUZNYm01L1BaTVlMREE4enJZYjQvVFBFdS94a1NMbkgvQ1BH?=
 =?utf-8?B?R1E1YU1tVDFDenplSEFVQldFbk80VnF5NmtUMzllbjZCemQyOVBpUnJRNTZz?=
 =?utf-8?B?YmNreE5KdXFDbzBCakU5alZFSnFMdDNpZ3k5MFhxQTBkdEV1SUpLWC94SGtQ?=
 =?utf-8?B?aGVoVmUyV1hmRHV6YytqRXAvSnk1eGZFMWpONElPS25Tanh2TU1TeHpxVGFh?=
 =?utf-8?B?SFAwUGVsaEZncEVBWk9Vd2VXcy9yaG9LeTJ3cm5MSDlveUhzNDdZR3dYcGFz?=
 =?utf-8?B?L1RPMzRjdVFpaytaNnBxU1hQWFdtaXhUc1FhcVRGMjM2UDgvQVBRYWh5NWdY?=
 =?utf-8?B?d3BZL245MHo1YjVpNUNya29TaE9CQzVOemEwWUxUczU3cFA5dnpPc05tZGky?=
 =?utf-8?B?NmFMVzM1TGR3aExaRm85dTlHcDI2Nm5sWFZ3U01mTEdsNVV1Z1B2UFVKNFly?=
 =?utf-8?B?TjlzVlhuYmkzWGZDZ0R1UUt2amZjc3RrQ3hENmJEeHZIVXlLbXZobVg2alhX?=
 =?utf-8?B?OUhXbkRHaEx5N1E5VUxzVkd1ODArUGNNeWNWMjBPODNhNDdVbVl4dlpJRnhh?=
 =?utf-8?B?NHBZWmhpWGYzVXdVOGRic1FMNUlEZSsrcUNWRmZWZUFRcStjL01QTHBlN1hn?=
 =?utf-8?B?RHdnUmN4R3I4ZHY1bzYvdGdlTVZZNks3RDBzRUxVeEFhTktxZTljSU80aHlB?=
 =?utf-8?B?QnppM280OGFqWFRXQW56MHlzUWYzSWk2cXFnQ0lWSUhZWE14UmFWd3pqVHZT?=
 =?utf-8?B?TGpjRDRCQ0s5empyeXpxRVVtdU9vRTJGczZiTklMNVVPdkZWUnhiVEdDeVZP?=
 =?utf-8?B?QVdZQjN5L1Q5VWlQcm1IVkZ3NmhJTkhFcjY3MS9lNzdkSkRIQm5RVkp3MUl3?=
 =?utf-8?B?cUs4dC9sK0FaNGY1SFZXQlE4SWN4NmNNQkRoY2t5YlpheGtWYkQ5bXkvQ1Y3?=
 =?utf-8?B?WlpUM0Y5OFlwa1k2OTFBRWV3ajZZc2pkdzh3eENkUEJtbm1xUFhkQ096R0FF?=
 =?utf-8?B?czhmRCtaT21WR2RIZjhpUDZzNGorVlhGUkUwamF6ZVpJQkphcUwreGlweE11?=
 =?utf-8?Q?yFUobuoSrPqg2528yVnUVxmZF6j8rVPL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(7416014)(366016)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHJXNTlLT1VHVE1FeXBDMFpsOWdVckdtU3M2c3Exd1V6cjBaNldqYWFFOGdN?=
 =?utf-8?B?Zlg1RThodXo5UHhKQWRoVXozdElYamNyVEVkbkFTL1BlZ3FIV1lFYmFodFZh?=
 =?utf-8?B?cDlMYkxHdWxmTUlLYVIrNW9FclkzMkc4b3QzV0pCdk1BRVNqdmd1dE9OZmtK?=
 =?utf-8?B?dE1uRHFydGMyYkg0dUJLb1VIb1ZqOUtSUDJDTk42VU0yV2QyWEFlQm5ZMVl5?=
 =?utf-8?B?aUk2Vzd6VmZxbCtZS3kxdk9sOUxSNytIc3N6emVyaDRTUURwNlBsSVhudkFJ?=
 =?utf-8?B?cGZKVUEwcUZnUnJwQ3NnWUJnMlFPaFFLU05wUXhtbEFZQnVoZHRRN0ZwUUJ6?=
 =?utf-8?B?UE5WMmpYd3Y1UUl5RHJ2SCthM29PRHJkaEdQYnp5aitrT0JKdFVrOTR6UmZr?=
 =?utf-8?B?blVFNW9MbnpnTzVVSVM4enY4dmErMHdSY0RZMUxxZDd5RzVEK2k2ZHlOZUNv?=
 =?utf-8?B?dVAwT0M3bjY2UldkRjV1SCtSYjZ1YnlhN0pMSXBsYk5idVEzWkVMdXRYbUZG?=
 =?utf-8?B?anA1WmFscnR0MCtZQlVmMjZMNmsrOFcxbTN0bW9kSko4aVhVeTV0cXRsWGhx?=
 =?utf-8?B?L3NQRjFQdXpMZVJrZXI3UDhrbU0rZkRCL0FqNnhKZTVLY01FbmJqN1BIWFlh?=
 =?utf-8?B?cGdmZzZHREw0WEhvVUV5YlQzZUF4NkpwUVY3eDMycHdnS2tjclZ3RzRlT0JN?=
 =?utf-8?B?dnhkNnF1dXN2Q1BmVHJYVzlwN0J4Mmkzb2tFTm1uYm5oNjNwblpuMm9ibHV3?=
 =?utf-8?B?amRpZlNpZEh6aGIzUTVFRUxNQkU3dUhMejVDVUxkZVNjSS9NNVVvMXdSUnpH?=
 =?utf-8?B?UXFFTFFFZUx0Wm9RUlowMHluVVRXYnRqVE5NWEhVZVhWSjJCRVY2S0FBMHFr?=
 =?utf-8?B?U1g1MnhFQjVsNFMwV3J6YVZTQXMzK3lqTFVmM1lWdDdFRXA3Ukc5TjBUcDJT?=
 =?utf-8?B?eGo2NVB2bThleDk3NkhKUE8xNVUweTdpdDBBOC9NWCtLaFJIMGprNlQ5MVNM?=
 =?utf-8?B?YWFVeE1MR244RE82ZjhidTF1c09NVnFLb0lmc0xMSWt5SXBtM2diU2hISkky?=
 =?utf-8?B?NW9aUWkwSkpmK2ZFV3hiWEpXLzhQYnRBdS9hekJvYWE5WlozNTVVa1A0UlEx?=
 =?utf-8?B?Y3pydVhENWk3RGtoMXNjYVpkekZFTDNiZnpZTjI0RU1rT2J2L05nSVB5UzRG?=
 =?utf-8?B?eVUzSjNVY01qVERqM0t6dEhtS0RPejBDb0dibXFndGtnVVJaOUYvNDJhNkV6?=
 =?utf-8?B?aGdQRGpMMGQ3VFNveHdXclhuR0EwWXg3MUw2Q29jbEZyNmM2S2dxV2diY0hr?=
 =?utf-8?B?U1dZSHNudnlicTl2czdsYWxEZ0RjZVZvK0ZRa2pNOXJLOHBlL29IM2Mwd0Zx?=
 =?utf-8?B?TVNsZThiUHh5azZzUVVEOHNiQ1NSQzZYOEU0VWxyVHJmaUZSUnRqdFNiTVQ3?=
 =?utf-8?B?cjZHK0FJYklybDNUQ25majJjb2JRL1AwZDlGUlRiWkFscDM3S3c1V1VOZ2xH?=
 =?utf-8?B?d2VxZ1VEVk4zQXlCQ3Q2dVF1cncyZ0Y1OTRoTVE2UnQrZDlHRGJPb2FwSVZJ?=
 =?utf-8?B?cVMyRDE0ZmU0WTh2SzVUZ0ZVNjJwS2RlOEJjUm1mQXRYRSszM29nTHp0bC91?=
 =?utf-8?B?UjZiakdXaWtzb0szcFN3WVE4dmt4bSt6ZGxNZ0RtMGpLU0tyVGZuSm9KQWhD?=
 =?utf-8?B?cVEvTHprZ2hKUVdoWmU0RCt2OGRsVlFTdHZtTFhGdndxYis3WWxRL2gwMmgx?=
 =?utf-8?B?QkZqT1JIUmdSRk9iRXFZa0w5cjE1OWRIQjVUMWVuQUlCekJuYlR5dnBGRGV5?=
 =?utf-8?B?RE0yTzFTazJPdXhkYVhDVTk4N1pWYUN0elZCZGV0UFZiM1ZmOGFhcjhyOFZG?=
 =?utf-8?B?aFF3ZEhzVmxUa1VVdkhFOHZKSzVReTB2Y3M4THhWdS9oY2s5YkFFWjNRMVJH?=
 =?utf-8?B?VVgzWHVEWVk2SzI0UXhSOUlPRlVFV2hUN1JHS3NHdDlHb1FXdEoyVVNFRmJ4?=
 =?utf-8?B?TkFFSlAyK3NzbmJPbk1PTFhEcU1PZnBXMDZoSlFtR1VoVDhIZjBIaUlIdi9a?=
 =?utf-8?B?QzdQZVJCbGRET245bDJ4eE1OVUFHcDlNaDBHL0IyUUlTMXZQVENjV2pMWmt4?=
 =?utf-8?B?aWRIMHJqZEg2SVVEWWhEM1l4UWo5bi96YThaN1cvbk5MVC9vQUJ3YW1TVTJL?=
 =?utf-8?Q?xILDuPleBgt6+8tfkwYXvEOkn9ToFxEM1MbFATBm/i0x?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2b35252-c8ca-4908-2e26-08de12f0d86e
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 11:31:16.8847 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EIe+r+th4aeTE6oX4oqNvaz5B+denYyk9OhoIKwPgUK8vSjq6on+Vw3pWepR7tcda2zAcQwHjrum765mIs2orw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7872
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

On Thu Oct 23, 2025 at 2:48 AM JST, Joel Fernandes wrote:
<snip>
>>> +        Ok(())
>>> +    }
>>> +
>>> +    /// Get current BAR0 window offset.
>>> +    ///
>>> +    /// # Returns
>>> +    ///
>>> +    /// The byte offset in VRAM where the PRAMIN window is currently p=
ositioned.
>>> +    /// This offset is always 64KB aligned.
>>> +    fn get_window_addr(bar: &Bar0) -> usize {
>>> +        let window_reg =3D regs::NV_PBUS_BAR0_WINDOW::read(bar);
>>> +        window_reg.get_window_addr()
>>> +    }
>>> +
>>> +    /// Common logic for accessing VRAM data through PRAMIN with windo=
wing.
>>> +    ///
>>> +    /// # Arguments
>>> +    ///
>>> +    /// * `fb_offset` - Starting byte offset in VRAM (framebuffer) whe=
re access begins.
>>> +    ///                 Must be aligned to `T::alignment()`.
>>> +    /// * `num_items` - Number of items of type `T` to process.
>>> +    /// * `operation` - Closure called for each item to perform the ac=
tual read/write.
>>> +    ///                 Takes two parameters:
>>> +    ///                 - `data_idx`: Index of the item in the data ar=
ray (0..num_items)
>>> +    ///                 - `pramin_offset`: BAR0 offset in the PRAMIN a=
perture to access
>>> +    ///
>>> +    /// The function automatically handles PRAMIN window repositioning=
 when accessing
>>> +    /// data that spans multiple 1MB windows.
>>> +    fn access_vram<T: PraminNum, F>(
>>> +        &self,
>>> +        fb_offset: usize,
>>> +        num_items: usize,
>>> +        mut operation: F,
>>> +    ) -> Result
>>=20
>> This is far too much functionality, and the code can be made much smalle=
r
>> and simpler.
>> and still get what we need. Open RM only supplies small accessors
>> (8 thru 64 bits wide), and no "bulk access". The calling code can loop i=
f=20
>> necessary.
>
> The code uses a sliding window approach to reposition the moving window,
> abstracting away the details of the moving window from the caller. That
> simplifies the callers a lot as they don't need to "loop" and know when t=
o move
> the window when they hit limits. They can also write to greater than 1MB.=
 The
> bulk of the logic is in this function and the surrounding code is mostly
> wrappers, which part is complicated or that you did not understand?
>
> Just to note also, the PRAMIN moving window functionality in this patch a=
llows
> us to not need BAR2 to access VRAM for instance memory. That is a code
> simplification then as we do not need code for BAR2 (the tradeoff being s=
lightly
> slower instance memory access). I confirmed with the team that this is al=
so an
> option. Abstracting the sliding window functionality becomes important th=
en, so
> I'd not vote for removing this functionality for that reason. And if we e=
ver use
> BAR2, having it is still useful because it allows us to have a fallback t=
oo for
> comparison/reference.

Whether we want a sliding window mechanism or not, I think it is
valuable to expose the PRAMIN functionality the way the hardware
supports it (i.e. set base address and work with a fixed slice), and
then build QoL features like the sliding window on top of it, through
e.g. another type that wraps the basic PRAMIN one.

This would make the code easier to read, allow more flexibility for
users (although in the case of PRAMIN we might not really need it), and
matches what Rust does for e.g. `BufReader`, which consumes a basic reader
and provide buffering for it.

>
>>=20
>> We should do likewise, and avoid this.
>>=20
>> Then we can just create things such as write_u32() or write<u32>(), etc.
>>=20
>> And do we even *need* read?? I'm not sure we do.
>
> We do need reads as we walk through page tables structures. Note that the=
 page
> tables are partially allocated by the GSP.
>
>>=20
>> This is hopefully showing the value of including the calling code, as
>> a follow-on patch in the series.
>
> Unfortunately, there are too many dependencies as I mentioned in the cove=
r
> letter, so I would like to get functionality merged in stages. That's the
> best way to make good progress IMO for nova-core. Of course, we have to c=
areful
> about design etc and I kept it as simple as possible out of that intentio=
n. My
> pramin patch was written 3-4 months ago now, so I'd like to not keep it t=
oo
> sitting comfortably in my tree. :). And this patch is critical for mm.

Although we have neglected it lately, we could use our
`nova-core-unstable` staging branch for that - IIRC the goal was also to
keep track of pending patches and make sure they don't bitrot until they
can be sent.
