Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36ADBA3E0F2
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 17:38:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38EAA10E9B3;
	Thu, 20 Feb 2025 16:38:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="o/RtX+r8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2048.outbound.protection.outlook.com [40.107.237.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E764D10E9B3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 16:38:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v3MFoCM6A2I6zQjgyN/AdCAd2LF5E4dQIfS9BqfpmS6sQpNxCwf6ObK1CQGRAJIoNP+SM55ikGas9LJln9SOoqKCviQgqJQ86XTfwTcNFkOaBafi+TbQGo19ztYfhD6/VxSgV6RsTQSwGbU3yCqOZA73CDmM7CX9xcuTXoDFlVTbRhqnFQ2g78IQQPrBhwv9BHT2EG7Ohh7nkbBTKD7Vgx5/mneYoRVve/H3UrQ8wEdDZ36s+HUiSKVIFXEhL5aPCQ4l++lmi1urlok6Y4phml8c0pOWZAOx/5RdiyRd37GMX9OHctfYjSARI0oD/q9rTfesP1UDTCwQYah6oJjhWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qIbMfBMNb6C/kawLlU9KH2UL9BK+ayxWO6Is0/bUrDQ=;
 b=lRMxnsYCbEnMvyAm0My5bktnxwSAZo4qytp8qDCDNc5n0D9lVgF54wbJutDBHFbsC5ZpYAj+4FYrqirhDauwfdXmLyDZqy9sf+JS/gztqGoF0ixfUebjj2v4nUY8Hn4FPvTVksmSAc56M4Y7nr4cbOQqKqd8iL+AL06xNC4BzcPed5RcOOTAa6x3+5JeL/EjC7pIABfYE6rANC1sKKDpa37nhlXf9H1VTZIwG6SVMwQuCCWAX++UH7dR3gFw6joSyxA4pjHUbm6xcJ89r2m1U06UopNHRRqeZ+1BC9vARDbZXgVKybSQ3VONRk+tijD/j65Kss8T97w/KEY0IXdAxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qIbMfBMNb6C/kawLlU9KH2UL9BK+ayxWO6Is0/bUrDQ=;
 b=o/RtX+r8f5TZhIvjdMBjfWP5/oW6KTHU85zfRShfb3ErVs5NwQSHDJpZTXDCPrkDzhxKHZSg2jd5PvfbbN5SaLlJoRGo2xEafMxRgg+XTAfVy5N1qFDIKUm7hT7HAAVKc7QV0ZsAt9mUtsDppm3s6Ky7+dLPeLR/SantmLDgyiPVcdbF9GWSN7lrqyOXna1VZvsxtDsQD97yLpoW0VRzVgd1eOBJ+qPVToyTYtdwHsyqSbVH+ckMaaMOTKI/hoasncRkqH9yxSKNpYgpumODSJINjJSOqIyZ9SxaU0xaVZ7tUaxnahlm8y3Xjyu0U3tW8Y9Z4L/n2bvYKEPM+XpxGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by SA1PR12MB7197.namprd12.prod.outlook.com (2603:10b6:806:2bd::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Thu, 20 Feb
 2025 16:37:48 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8445.019; Thu, 20 Feb 2025
 16:37:48 +0000
Date: Thu, 20 Feb 2025 12:37:47 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: David Airlie <airlied@redhat.com>, Theodore Ts'o <tytso@mit.edu>,
 "Dr. Greg" <greg@enjellic.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Hector Martin <marcan@marcan.st>, Dave Airlie <airlied@gmail.com>,
 Greg KH <gregkh@linuxfoundation.org>, phasta@kernel.org,
 Christoph Hellwig <hch@lst.de>, Danilo Krummrich <dakr@kernel.org>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 daniel.almeida@collabora.com, aliceryhl@google.com,
 robin.murphy@arm.com, rust-for-linux@vger.kernel.org,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 Bj??rn Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Valentin Obst <kernel@valentinobst.de>,
 open list <linux-kernel@vger.kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 "open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>,
 DRI Development <dri-devel@lists.freedesktop.org>
Subject: Re: On community influencing (was Re: [PATCH v8 2/2] rust: add dma
 coherent allocator abstraction.)
Message-ID: <20250220163747.GA69996@nvidia.com>
References: <20250131135421.GO5556@nvidia.com>
 <2b9b75d1-eb8e-494a-b05f-59f75c92e6ae@marcan.st>
 <Z6OzgBYZNJPr_ZD1@phenom.ffwll.local>
 <CAPM=9tzPR9wd=3Wbjnp-T0W8-dDfGah-H3Ny52G85B+2Ev9ksA@mail.gmail.com>
 <208e1fc3-cfc3-4a26-98c3-a48ab35bb9db@marcan.st>
 <CAHk-=wi=ZmP2=TmHsFSUGq8vUZAOWWSK1vrJarMaOhReDRQRYQ@mail.gmail.com>
 <20250207121638.GA7356@wind.enjellic.com>
 <20250208204416.GL1130956@mit.edu>
 <CAMwc25pxz2+B329BArDQMpxOvpMtvhop1u_Uwc0axn2LqNP0vA@mail.gmail.com>
 <Z7dXIfFJ2qXNKtwT@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z7dXIfFJ2qXNKtwT@phenom.ffwll.local>
X-ClientProxiedBy: BN9PR03CA0469.namprd03.prod.outlook.com
 (2603:10b6:408:139::24) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|SA1PR12MB7197:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a871814-61a2-41da-d279-08dd51cce938
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SHpNZ3d2Ky9VK2J4RnlMeWs4TVlnZTdueTQ1QXM0NnNsM2xzK0dXdEM1dTNj?=
 =?utf-8?B?RzFaeVNxWWIvNW45UGRueGVsa3prR3hwM1JPS0tyR3U0VnVUWGRZR3FxM3Uw?=
 =?utf-8?B?UWEzbmFUMHdsT2s2dGMvQytuM2xyczRFNmg5ZUFlYmhRMGR4bGk2eSs3aVlh?=
 =?utf-8?B?Q01rY3h2enppNU5ML09NS0tkdllxR3htUzhHUFB3NWVEb0FFdE5XSGUzalo5?=
 =?utf-8?B?bVN6MkdzUG9UUFk1UThJREpSa0Q2aG9yajl5VnB3eHcvOExxZXhtSURiNlYv?=
 =?utf-8?B?empnWk8wMXpNUVF0TVliYWYyZXk3NXNaWXFFUy8xaWVKc3RwZkQ2TDZKdnlX?=
 =?utf-8?B?RmI2UnBSUEp2RzJOc244ejA2UGNPZGdNZzFtOFJvcEt1Nm8rRW9RckxUNWx1?=
 =?utf-8?B?WkRKZGVmZ3F6aUhnZXl4eGxwckRlUXBzYTFaRnR5aFNadnpCbG4rZ2JSMDYy?=
 =?utf-8?B?UXlpaG9BMmZqVjI5MytqRGFxOXdITnpUemtVTGl3T2JIZkZHK0o3QW15MFRB?=
 =?utf-8?B?czhwcXN2MHFDdm9vcDRGSWI4M2JuMmRKZTZIWHNpSjlucGRWcXRrb096aksw?=
 =?utf-8?B?YWhTYXR1V3hTTy9MU24wWXZmcFQycUgwZXRyU3FlUDRCenk2ZEM4NHJPQ3pO?=
 =?utf-8?B?RXlRbnkxTGkwbDg2K1AzSkNjeUhCUmU0RzBwaE9DaWpKTnMxRW1ZR3crZ0tu?=
 =?utf-8?B?dDZyMnYrV3lEQzBSamJNMDNpWEdrczVQL0R2Q2VUSTVqOVBad1U4TWs0OUs0?=
 =?utf-8?B?dHgwWE1ZRjdwTEwveDlqOEcyVzhpYUcvRFJDSkRNTUFITFJtRWd1Uk0zbVc5?=
 =?utf-8?B?dTY5STR0bkp3M2NxZExtY3RrN2R4bUJScHVmdjNqVWRWcm9TUW9ON1Rwc2dJ?=
 =?utf-8?B?NGRDSWFjRGRlb1VvNXRaeTFCcEViLzdZUmEyMm5sWit4b043WCtIS2NScDJj?=
 =?utf-8?B?WjVNMGp5L2tTZ1NyNVhQQkNjTmVKOWtDSkZEc0xoYTNWNUV0UnoxT3BlVGhm?=
 =?utf-8?B?YjNKMGZJM1dlbHd5cnVUOStpdGY4RHl4bEswVkFNbEIrS2ZJMmFwMWFzVkx2?=
 =?utf-8?B?YVM1M1FIUldCUWFTaFFHNlU5ZDVNd283RDFDRDM1VXlvQkE1a2UwYUZiMDJE?=
 =?utf-8?B?WUdJbkdIdDc2ZnE2elR5RXhwVmFNam9CTENKVDQ3REpsN0pzaWF2aEE2MXd6?=
 =?utf-8?B?eTJjR3Rha1lVdXNnT29IcmthWWJyOU5kTExWY2UvL2VvaXk3NXM2SWdoM0VJ?=
 =?utf-8?B?eXArYmZPeFFDbGNkYmhqbWFFYXVwUkxMUW5WR2Q5Q0Z0aXh1TzlQVDJwZ2kz?=
 =?utf-8?B?YWxiVUhJQWw5OXRYaEY1eDBYVmlmb1dqT1VXRHdIZmYyVHJSMms4VzZOMUNh?=
 =?utf-8?B?bnA0OXlIZXFGUTU4MTEraHRBV1Y1cUc3K3lkVEppVXlKZlVIaStlRWdDZzlE?=
 =?utf-8?B?STQzSElHNWZHdGwzL3prMkdnamppZEllbHA4Mkk3KzRQaGlxRE9rZnl3Ny8y?=
 =?utf-8?B?NStob3cvYTVxWWpuaHZ1SmRzZk1OZ2I0NEFYU3ZzOUVGSE00OUk0TmZsOTly?=
 =?utf-8?B?UkhXZFRZNUp4Qkl0VFgwRDIxMjFSd1I0bGpMbmR5REdqQmNoUEpEZk9aeTFP?=
 =?utf-8?B?bERLVDVGcE95YmNQTnN6MFZwcUlLSzB4R0U3NGxvdnhKb2YzMnMweWVYdEVk?=
 =?utf-8?B?T2hmWjBNSlRpT2kxYTFvY2xFcTNxR3JGeTlFZmhyc0VaVEpTM2l3WnZpMGEx?=
 =?utf-8?B?ZFhXYjI5bG1ybkpuSUdYdzJvWmZuV3RndXZydS8zTFZtWTk2Y1h5MUpoNnhC?=
 =?utf-8?B?NmMwY25HVzFURTZPYjZrdm5zcTFNdnR6enFBRjRwam5jalNyWmRyQXlKakF3?=
 =?utf-8?B?SS9WQm84R1ZGV1o0cVdQT1Z5bmhOR3F3KzEydmpqUWdvNytsMi9SQ0gzaks4?=
 =?utf-8?Q?ZB8wYr7TxXM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NmNMVExwcmsxM3lSMXgyK21VMVlCWFhNZElxRlI5OWppdVdnTXJXeDBPdW9k?=
 =?utf-8?B?R1pJVm1pMTB4bm1GWlBSQlpCN05ya0UvMU1yR3NUV1ZUUjZXdGFHTWdwTENz?=
 =?utf-8?B?U245cnZTS29zSW9ZeUdLSlJ0dFNMd2FzYk9WZkJreUMwU1N5NGlXbDIzRzZY?=
 =?utf-8?B?M053S0pUc1VCVm5CSnduNnRHN244aldFckVTQVFUd21EdUFsQXY0L0lrYW5V?=
 =?utf-8?B?NDM4TjNlYmgwMjFRTVM1WEo4RXJYY0VNUTBXVFJucDZRNFRXTkhTZ2NRR3BN?=
 =?utf-8?B?ejhtQ1VXWEUrSFRNQ0ZxYk1Mc1drSWYvaEpnNmlKQmZQbDNVOHZOZ3JhWnAy?=
 =?utf-8?B?Vno5OExUMUNyNXovSHl5c3UrajVuV0kwbmpMZDJRQkR1WFBhdjJTcVM1WDFQ?=
 =?utf-8?B?MHBBMzRvRko0RWp1WEFkZ1NHdHM3TDB4OENaZjFjK09Zc25BNXdlOGlmMkxj?=
 =?utf-8?B?SjBXYVVUQjNhZlBocUY5NUg0dFF3UnBKR1lnWVZ6Zmg1TjJuVk5vWEkvNnNX?=
 =?utf-8?B?RTIrTTU4YkQ1dEoxaWdCL3JkdjhtdVJnQjFnREpONE5jc0t5RHZGeERTcnFI?=
 =?utf-8?B?NytpM01peG9UZjlnczloRTdRTXhEb0FrL3p0WGo5YnNhMDJZOHJkY2NuTzBU?=
 =?utf-8?B?UGxRSEZ0cUEzN0RlNWZ4Ny9yZHNNMVp4N3N5T2puaUdHaTBhMmlpTzQ0T0J2?=
 =?utf-8?B?cG5LZzA0ZE5KN3lDUVp3MmQzdGt0RnZXNTBaYXlzVThSb2hnb0tuZFhoZ0xJ?=
 =?utf-8?B?TkpYeENQd1dzMSsxR25kcTdReUs2ZHVtRld4dklJbWhDZFlLMXVVNjl4STl4?=
 =?utf-8?B?N1ltaFV6R3djUU9HZCswNVJEOVkvOTk1dXdrTE51a1lxRWIxVjdWSzBZT09H?=
 =?utf-8?B?UHJkVlRzVXh5NkxiZVBqbVl6V2NZTG4zY1dDWU13bmFCeUJwU090aDNKUFFi?=
 =?utf-8?B?QUczbzlzdnEvL3cvK2hKeHJXRzI5eCtCdXc5UGIwV0x6b3NkUENVZmlEcTV6?=
 =?utf-8?B?dVIydjJ1R1crU1VkZ0xMbm9JcFlETDlIVXJnRVM2TDBQOXVSUXVxNUUyVGZB?=
 =?utf-8?B?YjRMV05mVGxzcmNsNzBsVVRuSEYxUU5TTjNYd1QwU0VvUWw2bTBlaTFrc3p4?=
 =?utf-8?B?bW1OMzFmU0p4MlVYTEVRQVdXL1BNd2xFM0FQY0ZmVW1acEZtVUpGQXBvQWJB?=
 =?utf-8?B?RmZrZk5jZnlCKzFMcDkxNTNsMy9yOEFTdFB3TFdHcytKU04wTkI3bFUxbitC?=
 =?utf-8?B?TFJuM1VITEVUck5mc3NrUERWdU5KcTg1djR4eU92ZWRvU0N0Yi81RWhscTNP?=
 =?utf-8?B?VDY1ZHk5eUM2aDEybjJEMTZTaDgxZmxaUll3bUJselAwL0JXQW1XUFp2cndi?=
 =?utf-8?B?YkpHNDZod1BlUmNVWnczZS9SK1pxSWx3bXorYzhQeGRwUmNXRmZZbWhwR2ky?=
 =?utf-8?B?SlBqMDM2QThnem1uSUxRMTNHaXN3TWpjSkJ3aEFyRlZrT0tDZ2dsb2NjaWtC?=
 =?utf-8?B?Wnd5RFErYWNaakxvVWtkU1F0d3djd2M1RE9wTGsvNUdFOUVxL0ptZ2gzMjJp?=
 =?utf-8?B?d0hGUEJSaUtLa1dsTk9taDlaQlNPczg5K2dnZnNoRDJ1dWlyRnlHWDBBVmw5?=
 =?utf-8?B?VTVzUWVmYS8vK3U0VFhHckdIcHMxbnBGc0Zmb3RxeG1NRklyaDdaWjJINUp3?=
 =?utf-8?B?OVlVVVYxaDNGM0FXbVV6Z25Tc1EzK0RUa1dXUHd3V21UVnJ6OU5lb0tWU0J2?=
 =?utf-8?B?WmRMcVBhMmQ5VXhJM0dzL3RURnNSOGxBL05pcmNjNFZLdTZmZ1orUEs5cTJS?=
 =?utf-8?B?N2ZocWlmV2NMY1JsSzJFMU9BbnFIZlhNR3Vrc0tSdVUzNUpVS2lxTm5ObE5F?=
 =?utf-8?B?MytiRkZKMVJuUitXbVpPWjFkOTVnSkg4NjdkVGJ5eGlZODFCYkNSY2hzdXRs?=
 =?utf-8?B?UExVZitualRuSHdEUjVnUFpsUUt4WWJJOEM5ck0rMEd3RC9ZWTZNMkpXcVIv?=
 =?utf-8?B?eDVwbFdCMjZRWHZDcXBpSmM4aEhrNUlHMWs2VkpXRTJtVjRDWDV3SkowZ3ZP?=
 =?utf-8?B?YXJEY1JzZTZacDFRNkgvaXA5dzlaVktjc0dRZFVJUXc3ZTZnVkg4aFpJUk4x?=
 =?utf-8?Q?JhJs=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a871814-61a2-41da-d279-08dd51cce938
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 16:37:48.6080 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L1BBLayiN8xxTR8tVstTk+OAvBk2YDjLA+oog6H63Vt0ZKzNlJDthpnEX65mT4wj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7197
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

On Thu, Feb 20, 2025 at 05:24:01PM +0100, Simona Vetter wrote:
> Better analogy aside, I fundamentally disagree with understanding
> maintainership as a gatekeeper role that exists to keep the chaos out. My
> goal is to help build a community where people enjoy collaborating, and
> then gtfo so I don't hinder them. I think the talk I linked above is
> holding up quite well even years later, but the last part really embodies
> that idea, so let me just quote that:
> 
>     Be a Steward, Not a Lord
> 
>     I think one of key advantages of open source is that people stick
>     around for a very long time. Even when they switch jobs or move
>     around. Maybe the usual “for life” qualifier isn’t really a great
>     choice, since it sounds more like a mandatory sentence than something
>     done by choice. What I object to is the “dictator” part, since if your
>     goal is to grow a great community and maybe reach world domination,
>     then you as the maintainer need to serve that community. And not that
>     the community serves you.

+1

I agree and try, as best I can, to embody this.

Jason
