Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E21C1095A
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 20:11:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5529710E557;
	Mon, 27 Oct 2025 19:11:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="GMIM2gP1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012041.outbound.protection.outlook.com [40.107.209.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A04810E554;
 Mon, 27 Oct 2025 19:11:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TyLHmlSJWXrw3NndNyNSNFAqkxS0N/bQ71kMjHadOK/78Zc5lOvsn+tjPeMZs4uxnGJOr01LtwSZkLxfxz5umKVvsqM2CL8REu15uY+1u7/8qXgnfn6T299URPkCdalw1h/PgR9AC9Yuaf+VAwTd/nILUJig/7RRqRz24nAaurql+ItMCwa8PSNR22an9tXUGF01lTxXadr4TtImMCaBg6/b4ntUqll0iOe3ZcaEa7wMP5jbTPzT4MWCGxQBIvNMQZDdTb0Omv+XoDDhBRTO5eQ85Nw2aE8jGz9eWN4tWaLANCd6IUfGYeUbj2BL+v+l32NByWAykqL3gmCrH8egtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4u8PcBDpO8222yN+q4l69+GIB4N1dclSNqXMcjLX4Ks=;
 b=hPn/lLVS3DoALl4Xpbxl/T55eygYUE/YQ3kaRveO8qgOXOe87GShAcDH/UUI1wz5IU5X86dCqf8G0ilolit14gPkY7l472dTYBT86r2QTmG3pCyhmPG8voQ+wDrlYFxHcs4P4XyQrFGOePjjqB6rmJSPyYAsX29YlonrMwqTSC57GMNjYOkz8Ce/CAmOFeByUSLoBD6wtMuxaj6kiaVcEB6LMjZsxBnWii7kObg6o+O1W8klV9bS6OUUVtUzbu/9idioGUicUI82sWZ9F1s2zlXSdJPO4uFHmP4WxuLEG4lNSVYS3h9PSOLsYLGDFs4s+QThxz4X10ot5hzFC+RQkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4u8PcBDpO8222yN+q4l69+GIB4N1dclSNqXMcjLX4Ks=;
 b=GMIM2gP1z1cLfpSQHsd0WrsW1VsFIFeRUsKZDsJ6hSDLExK8Uk0CfuBE+qVTvMxMXuBoLK/lerwD3+XHoI77Tis8issb/8imsMenjHYQEPnVNmFQWfu6G0IyUGNDNgP3LbDnf7KclY7iuzYtvGtaMTpM4V0Bgr01cfCgqx6NOMMuWYE/tCfx9k6mF/t8bmL4GO3wTT2DbRIZsYxNyxGJa2zL/TfoJg9WmCM9CzBoK6PWk+YWbb2VnfyqonoOGnAZ8XKsUmnEoAS5WIDRwPRGrrzkCsZS0S7xPLB9PrF6RmB6I819L1e6ePnqfsScVw8eDNFp+QpUmTkmq+ZNBt9wYA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DS0PR12MB6560.namprd12.prod.outlook.com (2603:10b6:8:d0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 19:11:04 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9228.015; Mon, 27 Oct 2025
 19:11:04 +0000
Message-ID: <d6b29e56-9ac2-40ee-8994-8517adc73f34@nvidia.com>
Date: Mon, 27 Oct 2025 15:11:01 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] gpu: nova-core: add extra integer conversion
 functions and traits
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl
 <aliceryhl@google.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 Danilo Krummrich <dakr@kernel.org>
References: <20251027-nova-as-v2-0-a26bd1d067a4@nvidia.com>
 <20251027-nova-as-v2-5-a26bd1d067a4@nvidia.com>
 <c94dd17e-0e81-47cc-9482-e8743d3bc68f@nvidia.com>
Content-Language: en-US
In-Reply-To: <c94dd17e-0e81-47cc-9482-e8743d3bc68f@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0325.namprd13.prod.outlook.com
 (2603:10b6:208:2c1::30) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DS0PR12MB6560:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f682799-7f3b-4120-e103-08de158c930d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|366016|376014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SnFHMmdZUWRvWDVjRTBUY3p4dXNoZ2k1YnlqZzk3Y0dzdkdYRUVVV0NUZlUv?=
 =?utf-8?B?bFphQzcyTkRHcFQwWFU3QWlJTEdLMlRFVXFOUGlxY05SNCttbStHUGxoS3Jx?=
 =?utf-8?B?eGtBR2kvQmZqSTBnYkRBTlNTN1lhb3FLcS9FRWJsVmJ6VUJNaVB4YWJJRzF3?=
 =?utf-8?B?N3VxbERHMjJmN1FkQ2VOQWVuVXBndXNGR3dGRGU1azQ1ekJBZlYzQ3JJR1Bi?=
 =?utf-8?B?UTdxYmRsU1RYQ1BJaDIzQ3dNaXJoTzdtclhxeVVybldsMFUyUTFLU252UjlR?=
 =?utf-8?B?eVllQ29pWTY1QmhCOTRxVlVQcWtaUTdtR0FYZTJiNmlYNTJPTUNabHV3UEpF?=
 =?utf-8?B?RWFreGd4blBuUlN5cFVXTE82YXB1cytNcE9qVzdhbGlMMDR5SHhZTk14UzJN?=
 =?utf-8?B?dVQvT1hMbmszMDJqODhuLzE5R2FTM1VURlR3NEVxVHYwNUdJWGZaaGc1ek5E?=
 =?utf-8?B?Z1ZsTlRNQXovUExFbDhBdWk0d0lBeENoNzVVUE51NExOWUw1YnBCTHNheFJQ?=
 =?utf-8?B?RTZPVkdYZGl0c2FPM0o4V2tIQk0zajhNTmNnbFZuaGdEa3FlY1JqNi9lc21P?=
 =?utf-8?B?a28ySC9PNjloak1nSGJaQmJqY08rcmZYM0l1TWRnRWxBeFVFVmFDVmhSSm16?=
 =?utf-8?B?VHEwWEtTa2pGbnpISXQ2M3UxUE42NzNYdm5zcDhXMDdZRTQ5enlaSWFJZGhI?=
 =?utf-8?B?aEM4dTR0dHJTbDg1M1hyYU9SVFBCNFlka0UzejFBc0gzcTYxeXUzMDRxVUtU?=
 =?utf-8?B?TjNzV0ZFNy9uRU9VMkJ5TU84OXZVZVdJcTRuYWpPdlNyRXZ5TnRlNllKR1NG?=
 =?utf-8?B?NU5qcUMzL2swZEdwMmVmS2R3WEk3ejVQSEc0d1VLUEpGVDBJV2h6ZzFXV2JD?=
 =?utf-8?B?K2V0MjFVSnEyRzFGbk9oVTJESlB3dGVSZy9FNW1vU21KenQzL21Xb2JaZi96?=
 =?utf-8?B?YmdxTi9ncCt3bThDWUFCUHl2Mlo2VTBzMGd5Yk13K1dVZXEyd1FoOCsrS1ZQ?=
 =?utf-8?B?UVVnS2ljVlljYmlMd1FXZ2pYLzlMWkRZOE5xNzFib3VvRW9KTG9GVUlBVlda?=
 =?utf-8?B?UmV4aWk4VGZEYnJuREY2TEI5bThnWXR2cjcxKytIckZUQk9rVGhDeDJQZExK?=
 =?utf-8?B?THdIcE16aFhnVVF2WWljZ2JZVnkwVjhXRUNYMTZQbVd1Zm1VU0Z2SGJONG5i?=
 =?utf-8?B?UXZyL2plZTFZUFBCWXYyRitIME4rZlZLL1daV1pjNmkyR3hwckdZdGFFVmpv?=
 =?utf-8?B?R2hLeWY4eE1MbGpQWVBGN29MN05rZm55eE9XdENuQnd0UDJnOGIxVy9IS0J3?=
 =?utf-8?B?U2RsSTU1WXlleTF6T0RJdFJFdGpucXF6Y1dOTjVLYTZUTkRnWFh5cjRhUzZT?=
 =?utf-8?B?elp4YVRJTlpqaDlPU0poajQ4TG5Nb296bWIrZTFLVkV4VHd6TGlrVy9HZk1S?=
 =?utf-8?B?SGVmcVhtakFQVlRuTmJGanJ3Q1B4dGd3UjRlQ1JNeHRVTlUwQUc3SWJyRGZn?=
 =?utf-8?B?bWVvRFJLRlhzM2x4Um8rYmV3RkcyT3J0cGNTWDNuKzNFN0gzMTJxMmhVdisw?=
 =?utf-8?B?ejBVYmFOdmFZUE02NHFIV3JOOEYvSTJrNFRTbGdRMFFRWDNJUTJDczhhUTRI?=
 =?utf-8?B?U3hYVEMrTFVEMUlxL3JVcjJ4UlVhbHpjZlBXbGdFZjl0dnJ0S0d0RExhZHRG?=
 =?utf-8?B?b3JyakIrc29PZnIrK1U5WG5OMjlXd2JQWVcvWVhLYWp5TnFOc3h0Z1BpSkNl?=
 =?utf-8?B?Zm1vaFg0ajVSZGVFc2tRamYwVVE3bDQ2UEdJM2N2cyttalZ2TkdjelM5N2lD?=
 =?utf-8?B?Mk5nVTlJUTdDQ0h3UUpoZnhvTENiOERSaS85NUtRdGtwSHZGRFh0NFJiUGI2?=
 =?utf-8?B?czVyL0xmY3RXNHAwMm92dFZYKzhmRjBsNVRHZkhFcTE2bUdKQzYrWlp0d0RF?=
 =?utf-8?B?T2t5cUFMZDBBZFcxWjlreG54M3RqcW4xQ05xaHByT0xUV0lRTVROS0piUXR2?=
 =?utf-8?Q?MKxr9wapIWUehEhVeKW07RG4FIiXM8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(376014)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c2J6MHFpU2NTbk0rWGZzS3NNbzVQQlZCQnZwZHFqbzNQNmRIMVQ0M2lOaU5Q?=
 =?utf-8?B?QWJESXUwbXV1ZTQ0dGdSZ0NoMktFUUtZSWdVSDNHKzFIQVk4TEkwaVlSUHdi?=
 =?utf-8?B?b003YVhEM29vVHZCU0Rxc0RKZVFGaTliSmVYU2RJZzhvMTVyaVlTU0hiemd4?=
 =?utf-8?B?WlVjY0ZRUjJSVTFiMU02WDRSOCsrMS9HdUdsaURYdEVzcnpTdzdYRUFwVUtm?=
 =?utf-8?B?RkFxQzFIQW03bXNsOWR4U0RBRVhmZWwxR3M4MnB5Wno3T2VlUTdpWkd3NkZU?=
 =?utf-8?B?Rm9jcWhkQjFxQjJWMUJpNkJVbk01VGxlajY0amRDNlNidHpERTUvTGdXQ1F2?=
 =?utf-8?B?VVAyY210MUFmRkRiZ0kwZ05ITGp4V3NJRWJ4TlZ2b1p1Ykt0QjczVnRMYnFC?=
 =?utf-8?B?RU5EV2V6WTU2WUhzSEg3NkpZUjdwT0ZMMjVmR1RGNVE0aXFnbEJScjJrNTJ6?=
 =?utf-8?B?NmthWDBMYXNoS0d5dXBGZWVRUG1ZVVF5TDlxMWpYTWRLWkk4WTIxdlFOc2JW?=
 =?utf-8?B?NU5HSk9oOFk2S1ZoTTJMV0lCL3J4Ny9UNDNWZjU5TGpXUjI3bVIwYkZseGxX?=
 =?utf-8?B?WGJLdGxWako1SVBMRkpTZXA3cGtCT2swbGxJcTY1c3l3WWd6U0QycGRqOThC?=
 =?utf-8?B?UXl2OWliWGlNS25RYndRUnJUREJadHB2TTFrbzNHcVJMTXRXeWtZSzQrTDFG?=
 =?utf-8?B?WmVxdDlTNWxOOHhVbmZJcFFNbHV4VlE2TnRGUXBERHczb0lvd1cwc08rQjgz?=
 =?utf-8?B?Znd3SVBERGRWMjR2OU5VT0g3dlJQS1JnU3Z3VmM3TnFERDdmbmFVMTdYTXpt?=
 =?utf-8?B?S3cvZjBYMGFWenBTT3pidEk3bXZrZzZob25EaEtBTDZJU3BFS1FiV3ltRkx6?=
 =?utf-8?B?MHBrejBkWUNseVBHM1JnZlNoeDJodllDZFdMVVRyUThrR3FXU0Q3bmVSbENV?=
 =?utf-8?B?YXYxM3U4a0diNzdTWmpuTnY0WlRBYmRwa3dWWUcvaFVXL0RRZVVFLy9uM3lH?=
 =?utf-8?B?S0NqQzhtenhyZ09PT3hIVE9Eb0N6dmFlcm9LMnVYanFXT0l5SDFJaS9JZUdR?=
 =?utf-8?B?NzhyaGxEbnpDelJnOFJXY1luNms2emZ5Sm95ZDI4LzIvYXk3RnFqUjlCNVRs?=
 =?utf-8?B?M3dFQ2VEZ0txTHVHU1F2cWxHd3NlcmxIRW12OERkeUR3b0JudllvRFZucXhO?=
 =?utf-8?B?cElQOEF0QzArTHpHbFVGaHJLSkR0TmZvUXJxd2tNUFJtc0tYRXRjVjcwOEFa?=
 =?utf-8?B?MEhSb2R3R252dStWNFdMZWFCMVExZVJIcUpMQmk3OFh4cjQwQlROWDBTazVE?=
 =?utf-8?B?ektveUgrakxFYjBoSGl1TmE4OUtrUlpxSzZCbXhKS0tWQmNEUmhORVNPUG9B?=
 =?utf-8?B?SEJtK01pdUlqdGRjNDNOMlM5ZnVkWmVOUmVNTEswTi92Ui84UENNTmw1Ulg5?=
 =?utf-8?B?QVg5RUMvQTJ1ZkpQWnlGMEtPaXQxeEZiNHV2ZDNMZE9nTlFFN2hEdXZrRHZL?=
 =?utf-8?B?R0J2bmwyZHNmdlFibGNkNnlTMTJLM1AxdFJjU3lGR00wVlBvVThXQUc0R2Fk?=
 =?utf-8?B?WFlCTkFzY0Vudm1OUzFqRGZPMjVnYjR3QkVXNTFPN1RLNWJxZmIzbDFFS252?=
 =?utf-8?B?Q0QwYVpFYnhqdkpxMnVIOFVXVWtNbmg0SHA2VGlxcTZrSnBzZS9lcTJvN25B?=
 =?utf-8?B?R1o0UnVVSjFzZXJ6bGJqdCs1dmI3ZG85NXUrNitsYmVDYTk2RGJwNmx1ODd2?=
 =?utf-8?B?bGhiWUMwVXdyNVdoUStkVGdmRllDZ1Fud1BqMzh1Mm52OW5EemxobEJmaTlw?=
 =?utf-8?B?QWpmK1ArSnRFdk5tVXdIWTZsbi9NenhRdUFVYWJranZUV3N2dlU2QlJjWFFi?=
 =?utf-8?B?TWxvVUExWmd1SVlGMmJzM3VSNG0wcWlGVXlFZjRmV0RqTEUxY3hkbENQOVhG?=
 =?utf-8?B?dFZadXIvdzFHc2JrMllybDlTM2NhWWdBb21SaVZZenVHNG0ycEloMFhDanoz?=
 =?utf-8?B?MlFnT0RDQ1BiUXFlT0h0eTEwN1VmSUkrUGFvRmxFTlNHSGZsNzkyKzZDMmRa?=
 =?utf-8?B?VTVQazBNS0N2WjlxSjY3TVlibTdubm9iUm5lSE5vUExvdzhFMXpqaTE5Qzl2?=
 =?utf-8?B?TXhlanRXTXA2WGlLR2VoZ05sU2VyWVhqbk5rUTdGOERHbkU2d0lYcmd3MmVB?=
 =?utf-8?B?alE9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f682799-7f3b-4120-e103-08de158c930d
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 19:11:04.1916 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bNWPbtEdB3io8eOQVxZm5uiokaNm8xYVjFX/+FL39V3XHMXhd7dMV9zN1SltjPAuzqdhhuL+i6S1m+RoIRNAog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6560
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

On 10/27/2025 3:09 PM, Joel Fernandes wrote:
[...]
>> +/// Extension trait providing guaranteed lossless conversion to `Self` from `T`.
>> +///
>> +/// The standard library's `From` implementations do not cover conversions that are not portable or
>> +/// future-proof. For instance, even though it is safe today, `From<usize>` is not implemented for
>> +/// [`u64`] because of the possibility to support larger-than-64bit architectures in the future.
>> +///
>> +/// The workaround is to either deal with the error handling of [`TryFrom`] for an operation that
>> +/// technically cannot fail, or to use the `as` keyword, which can silently strip data if the
>> +/// destination type is smaller than the source.
>> +///
>> +/// Both options are hardly acceptable for the kernel. It is also a much more architecture
>> +/// dependent environment, supporting only 32 and 64 bit architectures, with some modules
>> +/// explicitly depending on a specific bus width that could greatly benefit from infallible
>> +/// conversion operations.
>> +///
>> +/// Thus this extension trait that provides, for the architecture the kernel is built for, safe
>> +/// conversion between types for which such conversion is lossless.
>> +///
>> +/// In other words, this trait is implemented if, for the current build target and with `t: T`, the
>> +/// `t as Self` operation is completely lossless.
>> +///
>> +/// Prefer this over the `as` keyword to ensure no lossy conversions are performed.
>> +///
>> +/// If you need to perform a conversion in `const` context, use [`u64_as_usize`],
>> +/// [`u32_as_usize`], [`usize_as_u64`], etc.
>> +///
>> +/// # Examples
>> +///
>> +/// ```
>> +/// use crate::num::FromAs;
>> +///
>> +/// assert_eq!(usize::from_as(0xf00u32), 0xf00u32 as usize);
> 
> This `from_as()` syntax will be very confusing for users IMO, honestly we should
> just keep it as `from()`, otherwise there is confusion and ambiguity around
> whether someone should use `::from()` or `::from_as()`. Please let us just keep
> all infallible conversions to use `from()`/`into()` and all infallible ones to

s/infallible ones/fallible ones/.

Sorry, thanks,

 - Joel

