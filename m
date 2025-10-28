Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B2BC1554A
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 16:07:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BF7D10E5D1;
	Tue, 28 Oct 2025 15:07:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="dk/uBsRb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012013.outbound.protection.outlook.com
 [40.93.195.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62FD110E063;
 Tue, 28 Oct 2025 15:07:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dU7J2z0U6kO+TPqiHfcTYMC3maS93mjkyY1O/ttWn7omqMi5LGYZY6eZ9nq5mzPB8E2swZLbIW8j+m8EmLKsPmocJGfF27tIhZoPnbUjxbsLccvj6w300PgXIvSEj+YFHlNvQkqM0qlNI2xlBBlmXC+iyRZW0GBmqEqQ+nH1d0Rt228aGtu7pRIQ76FkpKpIUEXhkietNPF/zSgE55E9PfURMChn0DLGylpQd1WWP6QVv3cJ28J+EVWY8HuQ/EvwhqvOOMk0POMCGUNdMA/RChMBTPiw7jrZzyPTYb8+L6gg/E9gkTwN6T0fYxT45lVni0kbGPhXVYNH4pU2DhbFxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k5zzltTgxY+mtKvdRJOX5QwZ2ki4ND2m3qfdysxuN3c=;
 b=EPztZ2Kq4iZUIU9rYpFPA+9xJMC+KHNspKvnM0I1tGjkrjuIlTvcK9NBP2/let1QUXP8xOcG2oNOCOG8+ggz4AKYkKavM6G5DzdZJVlFsaNsqlnV4Co6SyJlDWBjbqj0kZcHnXTgFv21jrOJC6cAMXUdDr9R8Tr4nocFxz0yPEeNNVuG3T03Z7za/l7Vtk4biu906S0e8B1a0k2To0A8ng+CAoIj5/MRFOVeBBlh3IDOBoR854zYyaQAzz3xwWNHmYDPCu76UyVnxq7rMC/0cFW4g3JAvsqh37GCEvWTRjpuAMn4i4ipvQoz9yPpUM6zUa2ckElEiiPVNnL6pLxf6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k5zzltTgxY+mtKvdRJOX5QwZ2ki4ND2m3qfdysxuN3c=;
 b=dk/uBsRbqFBCMZ0546Z5ZK/oKOIDKfvrKR31DFinVb4dvL9P7we7gu4gH363dt9FHsKgqNPa1NAjVTBqxDDwc6fPj3Y/xs9RXx6o2hpijBb9OSUS38duolmcM0p+RL0zQLWVuo/SPoQI3URlew0HiF5ncC05VEhDmEy1ocMGxMQPJVSqqsGtzC35FUpdxHVpwy4D1T7t8oNqRZ+HHOdr68iOQnun8+3HI6YydAzpMQQcnoJO9ghOqRz96hHYc8IptyXapuNTvwlHf8FoxXNDneENpBB4ni7Mu+RfdnS/vfaXkmh9Ox8Ao49TOCG4qvhPCOUtQm9g2Sztu6sWMDOH+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CYYPR12MB8924.namprd12.prod.outlook.com (2603:10b6:930:bd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Tue, 28 Oct
 2025 15:07:40 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 15:07:40 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH 0/5] gpu: nova-core: leverage FromBytes for VBIOS
 structures
Date: Wed, 29 Oct 2025 00:07:35 +0900
Message-Id: <20251029-nova-vbios-frombytes-v1-0-ac441ebc1de3@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADjcAGkC/x3MQQrDIBBA0auEWXdAhZTQq5QuHDMms4gGp0iDe
 PdIl2/xfwPlIqzwmhoUrqKS04B9TBB2nzZGWYfBGTdb4xZMuXqsJFkxlnzQ9WVFJhOInt5Fa2G
 kZ+Eov//2/en9Bnk8Ht1mAAAA
X-Change-ID: 20251028-nova-vbios-frombytes-eb0cbb6a2f11
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4P301CA0064.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36a::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CYYPR12MB8924:EE_
X-MS-Office365-Filtering-Correlation-Id: bb640f6f-fbc7-4872-bf19-08de1633bd03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TkorRHdsRnZVRmJWMnM0OUVNSldLdTRvbGY4R0lGNUp2MlhWT3pFYk52VVdj?=
 =?utf-8?B?c0xEK2F2VnZLbzdOYkF6dkhZRlZNSWxXMHpPTWJWNDhrcHZDZVk4SGlJMTIz?=
 =?utf-8?B?b01Jdlk0RXlFN0JodjR2dytPcE8zbFB2SWdsOVRNYXJ3M1ArT3R2c290aUpu?=
 =?utf-8?B?MXBxd1g5bmllQVBXa3FmYmh4Q21tazlkSUxxZWlxd25xK2NuQ0JNUmRtQkJG?=
 =?utf-8?B?UkNoVnJ0dmJPeDh3ZVc3WG8xb3Q3ZGxsbDFXVDlpK1BQaFBUK2tPNk1NWmNu?=
 =?utf-8?B?RlJwZERqNktaZTVzVjhNSU9pR3BidUxVNk5uY093MUFMMnBXV05STEY1ZTF6?=
 =?utf-8?B?YkVRUXVndEtmK250b05JRkFUeGVidGFad2xOQlNQQjZQMkRjODFLenF2NGpY?=
 =?utf-8?B?RjM4V1MzdTM0UzhmVWN5N1hlWERZZGY1Vm5Oa01kcVJUa2s5UHc1NURkbGpE?=
 =?utf-8?B?V0svNFFUcjB6NGtzNkVVSUtTNlNFdysyZi9JMCtSdmRxc242WkhkQ2tGTEhN?=
 =?utf-8?B?YndZV2txVVgrUWdqM0NYa1NaR0ZaSjZsaVVQdWFXQVpOQi9aNzl4SWw0a2U0?=
 =?utf-8?B?ZUFpeVAvWTFlVWpLSks5VHFkMGJZZTR0a2RYZTJJY2dPb3dObGZhTjc5cEZr?=
 =?utf-8?B?bEM0VE42MTFTMFBncmdaVFdQangweENDUm41UndPK2h6NmRPbHlnWTJrMUQy?=
 =?utf-8?B?ZmV3UXkvVUg0eGRtU0VTcENXOGd5V3FlL3lxZUNwdVM3NWJ2L0FUQ3MzMkRO?=
 =?utf-8?B?NnpyQzVSZDZLZk81bzZIYmRmM0RaS3hCNDU2ZGtra3AwNmg2dWloMHhhWUtJ?=
 =?utf-8?B?aENCUENqUnBMLzRDOHhnRzRrdXI3R29pNEREWG5OVThyYnlBN1FOa1JsSVZC?=
 =?utf-8?B?WUk2Qi9uTlo4SmFTc1dvclYzTmZtcmRuMGFLNmk3eHJDT1RvT1FnUjdHaGpL?=
 =?utf-8?B?Qy8rVDdmaU1tQ1VPQ2ZLUTU4Y0dSYld4b3BIS2E5WVJWRzFjbjhHNGluSzI2?=
 =?utf-8?B?NEEzckg1R1V6NFRER3dNYVZhZDFpY1I0dDdpeEUwTzdXTXBGY0J2bldaTis2?=
 =?utf-8?B?VFVzS0FNSjVIaVV5ZHYzNzRrU0FpM1JYSmVWUTJiQ2FvY25MV3ZhMW5DZnZN?=
 =?utf-8?B?cnlhSTJuQjBDZTZoRXRtdVFVd1R4eXBBQTlpRVdHU3poT2U0M2xxMXlZcm01?=
 =?utf-8?B?dk5SS1Q3bEppSHFpYVd5SWFoS0tFSjFsVDZCdjBPOUNRbUNtYjlZQlV5Y2ZZ?=
 =?utf-8?B?ZytocVZwbllWN25ISko4TkxjVkJ1bE8yTHpVWi9qajJXdllwNXg2UG9ocml3?=
 =?utf-8?B?Uis0TTQrYlIvNmVJS0s2RUpnSU9pSmt2UWR2djFjMWVuYUo1MjZsajlub1E4?=
 =?utf-8?B?MkNEUnRWVWhpaXhlQ3hNbmJnLzhKOWNQZUdCWmtmOW9hL1hKMFhOcWtRNlEw?=
 =?utf-8?B?Y2g2M2hCekhScUlESTdlU3NKcXd0VEc3VG9uNW5XYW9NQ25vdTROQ1NhNnhQ?=
 =?utf-8?B?Mi94akJ6b3ErdnhkbWFSK1Y0Sm03MjV1aENuQWdhMDZvYlMzQUQ2TXhhMDBB?=
 =?utf-8?B?MExWUEM3Z25pUHFRZ2cyQlJ0cGFVVVJBNm9KajQ1aWZja0IzcTMzK2pkTkwv?=
 =?utf-8?B?TzBPeTZOSkl4OXlDRlpIQVJhdlBlVXE4T3NCWGNmRWVkVm56S0JtLys4RlVo?=
 =?utf-8?B?elArYk9pSDZLZnhJaXhSUUJNREFod1gzci9ld2xNOFcyUHRsaVZQTERUem1y?=
 =?utf-8?B?K2JmK21heFBqWk9GK1JNM0pIcmlmNDl3S0VWS2R5V1poWVkwYk9kM0RxSk9v?=
 =?utf-8?B?L3pENVR4Uk1tN3RJYkhsQWRyYXc0RithZDdZbUdjd3JKR0drUy9QemlFNW5p?=
 =?utf-8?B?NmVtdDVacnFLUksrTHZ5bVZ3OEdCTVpZYldxcnlpOVd1VFRpaVNVbWZlL1J1?=
 =?utf-8?B?OFBmZHVSUTVjanBvaUgyS1B1VFV6alJBNmZXL3dRSWpLQVJtVzZaZ3hUck8z?=
 =?utf-8?B?YWRLcEs4TnFvUHNNSDB5VzNnMHJtSUVDWVp2YjJ2L3g5Y2YxM0lqTTU2dXRM?=
 =?utf-8?Q?ZXQG0X?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZDJSMWU5bVliYUhkcWlPRUVBNlhEYmNZK29oLytGVm5qdDA1Q0dLYXp2RGNi?=
 =?utf-8?B?ajNQMWZKckRNNzlxTkM4bU5xa2JLdjd5aHpyK1JGVkNaWHgrQVFxNys1OFg0?=
 =?utf-8?B?MjhVRGZTMGQvY2w2ZGJUdGpqVkowdTJqdFNEbWVBR2cvUERuNG1RVzJYNE5I?=
 =?utf-8?B?QlFNMzdDekhqbkp4TkhQOWtWNzIxUEs1WnBMVkswYzU2TXdpU2ZoMnFlT0JU?=
 =?utf-8?B?OUhHUVp1ZXBXOE9ibEpXTWR1N0hIRnVUaTIzMFpka200QXEzZUdQNCtYbmF3?=
 =?utf-8?B?a0crMmpsZHhWb1dJZGVWaWVWV1BTb0RLcm1ldHZkbEVweEJFbmdHQWM0RnRh?=
 =?utf-8?B?ekpUUU1ZWGd1K1R2ZFNmVkxsRHk5d1pNZDU0cUN1L1JKWXh1K0VGYlhrRjMz?=
 =?utf-8?B?d2lYNmlMT1BYeVlqeDFTMCtza2JnTzNWbXByVkJjbFNpZndhSGw4Mk95Wkk4?=
 =?utf-8?B?L1k5MUZPc3VYVjhVUTZXYllocFNKbExFT3dzTUxFSVN1alk3QndxTzd0aHpw?=
 =?utf-8?B?R0lwbzhzNHNWVUMxdHVpakQzU1h4YjdXYWU2MW15VWZKT1FxVHZJVzVUYUNY?=
 =?utf-8?B?RWc0ZmFjamNmd1hMdTRFY0ZwZDNyRi81T0h0YzNNYnNkL2d6SHVKUWxvYjVl?=
 =?utf-8?B?am94djl4ZlJDODRlL1BBbGdqUDFpaGpZZGczMjVSV1RIWXNJQzVUcW5UL0Jj?=
 =?utf-8?B?cXk4dndSNFoyVWlsa1BmelhYYWl2TGNFRVlqaWFpRVg0SEJ6U1hjdDFTaHM1?=
 =?utf-8?B?MmNtN1dyK2x5OUN3ZTFYQlZqNHpRMklVOG5aT2xnOE94Qm94MHErWXFKc3hB?=
 =?utf-8?B?WHNxU3UyMTlwVmtuaEJYTDF1dDBKS1hEY0JyUXJWWFVaSFlBQVRka0pNZE5k?=
 =?utf-8?B?YXFEWlg2OU5Yc0d4TmtPRTh6RHBVQWh6QU9hOWN3ZS9uQjF0aDZzaHJhSVU2?=
 =?utf-8?B?Q2NPMzJMZVRVb3Q2RWVreWRTK2ZQYU9oZTJyMDZyVzVObThCTW5uR01menZP?=
 =?utf-8?B?Q2ZvL1hiNThXRW5zYUNPQnZ5RmYxQUVqNUVTNG9FSmU3SUNDNW5GYzZ2NDJj?=
 =?utf-8?B?VlRocXgrSmV5d1A3MGk1UHUvbUV5STk1YkJMUFIzdkxudHlsMTc1TlZKWngr?=
 =?utf-8?B?WEd0d3JhMTJWdmtJOGNoQm5IRUl1aFJ2RHZpSktBelA1RTRZbHhnRXh5d3p3?=
 =?utf-8?B?NUtHRzJHdGgzRHlZVm1DbG9wSU15TWlweDhHOU1DZGlISDBZZUptRktYY1Fh?=
 =?utf-8?B?cnMraVVtTVh5Sjg5R3BFQlpZV1dkQVRGaWVPTHZZOFZnakNZbVJRNXE1VWtF?=
 =?utf-8?B?SHB3QS9TUW1tT0hVV213dTBoZjRrRDl0Mmk0KytldGttYkZGcDJycUpMYzdh?=
 =?utf-8?B?YkhzdGJVcmo0M0tjcGd1UUtaSG93Wk0xS0tVcmJLNjNFdW5LSlloTDdGTC9x?=
 =?utf-8?B?VFJUaTVqemJ3bXVaMWNrZGVOd3lDZW1heTBMa0JzbzhGcm9rcHJSMFluUEQ4?=
 =?utf-8?B?dWVvM1IveGZtY2xBKzFnR0hmUlV5MVpWU29CcVNkdk9jbTR6eVpFajVkMmZR?=
 =?utf-8?B?MTRuUDdMUE1Ba3ZHcnB1RnlHTnBmVDhKZFJXa2Q1YkdadlpaY29Samk5aHRV?=
 =?utf-8?B?SGhRRjhWTzZ0aTBrcnJKT1l0WUIzRDdvTFpXcmpORjltbXRHdlg3YnlEZ0RW?=
 =?utf-8?B?ZllEVEt2eS95bmV4Q0UwQ2tvZjU4WXhjSTVhMzFwdUtDbm9nTng1VjV1Nm1B?=
 =?utf-8?B?a0cyYjRKVmwwUFpzMUFaZUpPUHpJQk1majF1d3g0dHZBUVhwVnhiRXpiMHVT?=
 =?utf-8?B?cVRlTHpJR2ZqNjhqRHpiaGsxdncvUk56S2tBSEJBd0UvOSt0VER2TXAxUHF4?=
 =?utf-8?B?UTJhVjVWNXdXWUN6aXBzWVU2cWY0QlJiWEM4bnFKVkFJY05EYm9sbXh6a2FG?=
 =?utf-8?B?dWJWMVpqd1hpUVhMS0NGSW80ejFVRUhRL1EzZ3diV1dhT1Zpc1pwV0pGUmZs?=
 =?utf-8?B?cVA5TG5iWTJGYytwVUNMNjc1NFhlcUQyN1lGSlVUR3Jsc21BMkcyMFFGeVo5?=
 =?utf-8?B?UU9uVUhXcThqU2d2RHRpcm56WXJkWVF5b1BqZzYyTS9zTjY1cGJzdkVtZ0l4?=
 =?utf-8?B?dThGNFVqR3BERmJFeXZLN1grbUhSTEVSWENCakVTazJEUTNVRDN4OTdQOTM3?=
 =?utf-8?Q?smNYvzwa6zNrvTBL31Sm+of1CHNXPRwXE0hXwpuaA2vX?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb640f6f-fbc7-4872-bf19-08de1633bd03
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 15:07:40.5617 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WNsEeDgog9x6ksOTKR1Q6rJTDNRvZES+D89Kmj2Z0JSMfchigNvyX/QjIBM9pew1aRK8Y3r615HaoyEai5ci4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8924
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

This series spawns from the discussion in [1], where it was noticed that
several structures of the VBIOS could just be read using `FromBytes`
instead of being built manually.

While implementing it, I also noticed that we were repeating the
following pattern quite a bit in the code:

    slice
        .get(..size_of::<TargetType>())
        .and_then(TargetType::from_bytes_copy)

... which begs for dedicated methods doing this in the `FromBytes`
trait. This is what the first patch does, taking inspiration from a
similar feature in the `zerocopy` crate.

The remaining patches leverage these new methods to simplify the VBIOS
code a bit, accordingly.

If patch 1 is deemed a valid idea, I hope we can merge it into the DRM
tree along with the rest of this series.

The base for this work is `drm-rust-next`, with [2] applied.

[1] https://lore.kernel.org/rust-for-linux/DDTRW1P2I4PB.10ZTZDY95JBC5@nvidia.com/
[2] https://lore.kernel.org/rust-for-linux/20251026-nova-as-v1-1-60c78726462d@nvidia.com/

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
Alexandre Courbot (5):
      rust: transmute: add `from_bytes_prefix` family of methods
      gpu: nova-core: vbios: use FromBytes for PmuLookupTable header
      gpu: nova-core: vbios: use FromBytes for PcirStruct
      gpu: nova-core: vbios: use FromBytes for BitHeader
      gpu: nova-core: vbios: use FromBytes for NpdeStruct

 drivers/gpu/nova-core/vbios.rs | 137 ++++++++++++++++-------------------------
 rust/kernel/transmute.rs       |  60 ++++++++++++++++++
 2 files changed, 113 insertions(+), 84 deletions(-)
---
base-commit: 639291d7c30cec5cf0d9a79371021c2e4404cfc9
change-id: 20251028-nova-vbios-frombytes-eb0cbb6a2f11

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>

