Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFC5C0AAB1
	for <lists+dri-devel@lfdr.de>; Sun, 26 Oct 2025 15:40:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 294E510E2D6;
	Sun, 26 Oct 2025 14:40:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="eBG3K6n7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010044.outbound.protection.outlook.com [52.101.201.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1B7410E2D3;
 Sun, 26 Oct 2025 14:40:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eKRpVpPwDrQ+dnfeEkUY95Vj3/NNb7ZTSDSDxjX1uUV+YZPMOqJzowc/mE1XMFd/bD9x+veg6adqArcjxwDV5qAteLObiPAQOzmikx1L6Gs+omK0UqzPaJUiUklNTSl8YAkL7TAYUmHvmd4x6ZeUEnLm5+nLsI/RYDzKVBDLXpw7hmZldqthZwoLHa/YTKQmWLrFuwDacV5pM6UuWPDjxfMlNRsy3YS/R9NpmgiCPhOjRA37NrRLT/6Pr8lS714Pwv8kR1V4KWEz8s0Ug5kv82eB/uTa6U6Nfp+ZgSKFhuCBjEQ5BzUo0ndkQzJXPZyulkJOlF6lQZpLn8osUpxHFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VPvXrVS7Sw4XnMtGmyawHTKyPyppaK6cUDOIlBhlYWU=;
 b=eWQ7OZ0vS6E7jX3sZ9j8FaeovuPs+wFd27V0G7jdcW7XkE51JIEFM39xVfFUXuy61N8gh1nhSbw/BXeMv69Twt8s7SAcrTR0tLy4ojYHPwXWiCYCBg8jPxe0ZkYYZbOmuThYgxQm/1K0AvovvZYzjfpkQBdHfchZyapuQLB5022WdMaTWQ/tR63jByVANBSxrUzX2tqxICMm8XqMQDZ0eanYojl0P1sQ3CwVkdAuyQHUewkj6voyzoqNXKKDZxCJphNyDYggYtyYdyBhGZVh1UjloEJKnw1w3mbqJ3j17jSYDaQgKZ5vWq4rE56h2BvC8J3L1XDFngMD1hD6+NazsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VPvXrVS7Sw4XnMtGmyawHTKyPyppaK6cUDOIlBhlYWU=;
 b=eBG3K6n7LHRhUKCWhrSrlQ2hT9VAchqIY68L9StFE63LV0WCouh2Zg1S6/gjhIOTo12XVwT1TBtvWpwOwq8fi/7xJKtp//Z6VVR0LhKjBkuwuQoFzc4yAQAe6xT90D7VM9KzCr3LSAUL70DQ1CnM0VwznBEkUZObONK7Myfb567UBk/0qO9qzQmbLcaUw6RDcIbEbRFcPEKCkYguSjDtJDcOeLIickpoEoTMCJc5SwPNtgQQlbPT93yiO27eG093hX/bOX5+AS58kmgBE9ZUyMjOWXDqWdfJHYUE1Ilmx/blZKG/OARYe54Z0NZ04TIQlFzsgZ86nmfTYqN1tbQ/bQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3997.namprd12.prod.outlook.com (2603:10b6:208:161::11)
 by SN7PR12MB7833.namprd12.prod.outlook.com (2603:10b6:806:344::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.15; Sun, 26 Oct
 2025 14:40:26 +0000
Received: from MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316]) by MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316%4]) with mapi id 15.20.9253.017; Sun, 26 Oct 2025
 14:40:24 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sun, 26 Oct 2025 23:39:09 +0900
Subject: [PATCH 4/7] gpu: nova-core: use `try_from` instead of `as` for u32
 conversions
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251026-nova-as-v1-4-60c78726462d@nvidia.com>
References: <20251026-nova-as-v1-0-60c78726462d@nvidia.com>
In-Reply-To: <20251026-nova-as-v1-0-60c78726462d@nvidia.com>
To: Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0257.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::8) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3997:EE_|SN7PR12MB7833:EE_
X-MS-Office365-Filtering-Correlation-Id: c7975188-25a3-4513-6ef4-08de149d9945
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|10070799003|1800799024|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UzhFOWprejNnd3lIWTFLbFFzRHFiWXhDWkJBdUVtb1lkWkJ0Q1MzdFdndkUr?=
 =?utf-8?B?Qm12SERseU93MGs3NHFweVZtOUR3N01BN0doYWxMVVBKSVNkM1lCb3ZuL3g3?=
 =?utf-8?B?aFB5Q2RzS0NOTTY2TjFmVmV0RGJYQXp6Y1pRTFZ0S25lTUNYaEk5azFKWnlL?=
 =?utf-8?B?K0JIemNkRm9uczNMZ0hNNXAxMXBDYzNpNExPNzZuUmFmWFE0NFFicnpsQUFF?=
 =?utf-8?B?bjhLQnpYa0JlV3JRVVllckpXQ2UvQmFxd3JWMXl3cHFQcXl5UVRPQnhHeG5X?=
 =?utf-8?B?dTIzVjAzYTE3L2JIaFkvaXJWYXpoYktwbHVsNE8rbG0xdzZZUEFyM2FEVEhM?=
 =?utf-8?B?aENrRmdrV0UwdGViTEtBS2k5VUl6RkJhbThnYnFMUVhTMGpQaTRIbVJnUDJm?=
 =?utf-8?B?K1JyK3BNMWlSM2U5Z3FtQUhLcEFLOVpqbW9rOXRsYW1kN0srRmt4SW16U0d0?=
 =?utf-8?B?WU1FdlZ2VHpjY2trb0pnQXFSV1cxY01ZSjZrNThyZFkrUjdTZDVKeFh3RUVa?=
 =?utf-8?B?aVlGS1NhZ0RPbDdjVUV6UzZFS0pkYTJqejNSMjg4dTVBNkVGYzQvK08zSXh3?=
 =?utf-8?B?d2pIczhDWnozVGxhSkpvQ002VWRXYTY4R1NGZ2pBYTgwUzZpUm40VkZFOEFx?=
 =?utf-8?B?cEZVSFdWWE9VbEt3QXY0TUNUZVZoUnZCa2V1ODluVlhNL0YvMkZQSXN1SjRD?=
 =?utf-8?B?YU85M1VCK05ieTZxOGFCQUFYYlE0Sk54Rjlld2dQOW5CdnRSK2gyZkZLbUV2?=
 =?utf-8?B?NU5sbXRUeTNLUmNiT05yOUhtd3NDeW5UbURqQ3NCU2NLdXBwZGJ2YTdCN1pB?=
 =?utf-8?B?VzdZV2ZDR3lNcGFhbDdMZmRpQzZQOEJ1NHdtVld4ZnZkTXk1RS80WDdpWTdQ?=
 =?utf-8?B?blU1emJmbW15S3dHYWI2YnhVRHNRN0NXdkZJT0JQVXY4UnNPZXZYTUFCdzh5?=
 =?utf-8?B?enZTaDltSWRxdU4rUk45ZWE3akRmUmwrbjd6T2ZuNUM2dTNpb29MSy9heDhQ?=
 =?utf-8?B?OGMxeDhNcFMwT0w2WTBrZ29jVzVPNEdiTE1ickhLY3FKRUJEN2RrWTJMbzFv?=
 =?utf-8?B?cnFCc0hGM0ovN3AzQVliUFRXN3p2SEJaQUlybWxUVDRjaEdtU1F5eGUrWVR5?=
 =?utf-8?B?L1VRcHh6QUpUaEtneUk3YitJbG1TZUMrVllwbEUvZGFzTlNnNEt6bEdXNFlW?=
 =?utf-8?B?UVV5dHBvM3Y2QUFSOUVLSWJRRUFoMURNZlhiQjd5bHNTdjdhMTJXREZ6NFQx?=
 =?utf-8?B?MjhJWnVOUzNoYlY3NllHWWF0OG9PL0EzY3FpK2h6Q2pzQW1rUWpFWVZ6dEpU?=
 =?utf-8?B?cWRjSXRod1B6T1V6dm5xRlZKVkYzM2VudktHRHFaaE1pYVZXTFpHSmxzRW96?=
 =?utf-8?B?YVBCbVUwU2tDWmxEQ2FxVytiZjJQWEpoem5abVZySDYzSElqYTVXNUV5OE8z?=
 =?utf-8?B?WkhQZlVhOVY4QmRodk1icjRYS1NFeTQySEhKb3pKeTNlYWpibzZrWlpxSjUr?=
 =?utf-8?B?ZnpoZ2VwZlNDWjdGeTZuYUdtcTgvc0tWYVFQRHp2cEFVTzRNYUVRQ1crY2Rx?=
 =?utf-8?B?cldlQXJkYk5xcHJ2cUNIeWJOckxYT0ZPaHI4ZTBPd0lxMUVsUFcwckR0K2FX?=
 =?utf-8?B?VGozaEZHOHFvWUFubmJUbzNIZXlNNWsvdUZteWVFc3FXYjdZc3NHaWtwNnNl?=
 =?utf-8?B?anBhcittKzNra3NUbUg4TnhEaW1GdjBvYjdpeC96alNaRGUremZLdEtQNUZq?=
 =?utf-8?B?c3N4ZU1pL3lndVZTakJDUmNqRWJuUWtidUpTdUI5Z1puRjhrV1VocFpNclIr?=
 =?utf-8?B?bGExTlR0bXRIUGxFWjViMWluVm0raXBNTThFUDcvMzVlVWJHL3hJclVPdlBO?=
 =?utf-8?B?OVpvcnFUNjVsR2ExNXVRTkdTcmNZdGFETTk4WDZVVkZLeTZGRXBrUHBHNytS?=
 =?utf-8?B?bTZueG1udjRkVEplYkdkZlJocGt5bkdRR0Qyb3R3ZDZwMFZqamUvZS9oUmZ6?=
 =?utf-8?Q?LaBud0Sj7OXR0gw05uqCbvk2SYW6ek=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3997.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rk9hV3V3MnhSMzZtOCtmQ0Nwbm9TYi9oclFWakV3dlFKLzNiRjJsU1MzaXFG?=
 =?utf-8?B?elBSK2U1OWYrdlJYaHdOaHhrbDh1NmNkcWt5L3EyODJ2bERSY2t1REpBR3V1?=
 =?utf-8?B?SE9ESVJheWdzbDhTZDJTRXd4QjRDbjlTSk1JUVVqRGNDWWlRUS90byt2M2pP?=
 =?utf-8?B?N2NxMThMUXBuVVYxZnJJaWJCWHl6Q1ZqaDhmWGs5c205K0pYS1JLZEN4QlpK?=
 =?utf-8?B?SlQ5Q01xZTB5QUpZUWhwUndDenZKMzZFMTZUWXRiQ2tFNlpYcnFlejFMY01q?=
 =?utf-8?B?SS9lVG1KcTM0YTZKZTBnK3FXUUpFbXdpSGo1STFCYjNlWWhGOElSbFFWQnVD?=
 =?utf-8?B?am5zQ09sVmtUN2Q5K0FIYnQrNzVQSVE5RDdLRXFFZFovQktGazNwOXdXdjcx?=
 =?utf-8?B?aDN1NjlKRU5lVXZNazBBVnVnazFDZDNMVTM1U0dURWxjNUZ3d0lMSkJLa1N3?=
 =?utf-8?B?blhwWlBGSDAvYS83T2UrZVBmN054aWtER21tSWJsdE9yblFGQ1JES2QvOHRS?=
 =?utf-8?B?NzNDcmhkamFWZE9jZklHa24vdFBTckk5RmVuNTJRaXA1Sy92ekpmdXg3T1JS?=
 =?utf-8?B?Uk9CQW9VbGlTK3QveEYxcWl1MW8xbjNvQXZQV3dwa0xzd0NVNkhVdkhZeXdF?=
 =?utf-8?B?Q3FRK095YmNiaTd1NlBFQlNmcXp0T1QwQWpIRzZrQkJiNmkvVlk1WTRvanBO?=
 =?utf-8?B?RGR6RXpyK1Bqc2JER0l2aU9RNkpRNnRFazVLYTNraDAzSzhlVlF3RGVqLy95?=
 =?utf-8?B?Rlh5b3hZMkZOVmh6S3krNml6MWs4L0NNZHJqVS9BTnNucGV6emZCRHBZeXJY?=
 =?utf-8?B?YXZUMHdjZ1loY09HNFlLMXVwUk5PNjdmbWorNFZxWWQrWFBmeGdLNkxVcVVT?=
 =?utf-8?B?ZVp4S1A2cGdrUjJQWUxGdG5QeVZDRjFYaXlYaHp0V1lXZnZBRlJyWk01NitF?=
 =?utf-8?B?RERWN0NpUUJ4eGs3bVJraUJDT3hINStpVC9EOVFHaFczaHRYdHNZSzdBQW1Z?=
 =?utf-8?B?S3dyVzdWaHkrUEwzUUNrUk9WQUkrMFNCYm84VEVUWm5mNmZldkNWb2hWMWVC?=
 =?utf-8?B?R1I0TjVvQ2JkRTRmZGJXZy9ZSU1QS1VoNXI1dXl5V1JyeDhWQ2dSU2h1VGNF?=
 =?utf-8?B?SXl0Mk5kdWhUSVhXekkrT0VSUGRiN1hYb3NwajdKcFl3YTJiTUpkYVc3VkN3?=
 =?utf-8?B?dHlLVjFQdXVtLytYSWtJcUNwdThwUFNxdURJbFROZHBzb3loTVJPaU9ZNmhy?=
 =?utf-8?B?SUNCajlxbVZmMU5ndjJuSzVxNC9CNDNvb0ErQ0FZenI2amZxQ1RyTlhTeTJv?=
 =?utf-8?B?RlljOGhrblB6Nis4UGl4eE1aWk9KbDFsRkNsazBTZkxYK3dBbnFvSWl6REpN?=
 =?utf-8?B?b3lSKzJjN0FPUTA1anhsdXdpa29XOFhLZW94M0t5d1ZKOTlzUkhiZHlvbVFE?=
 =?utf-8?B?NWNZNVRIb1ozZE40alhOZkd2NUpyUFRRTlVaTXRmSk1oSHhSWWU0NDJra1Vk?=
 =?utf-8?B?QXJPYlpHWmhTaHR2WjhYWmhGT0Vvck94TXV5THBMUGZua3hJQkdvUE5LMUJ1?=
 =?utf-8?B?ZmtKWEF0RXk1bithQTNuV1dEcDV2ZkduWlFXMFQxMUIyemU2bzF6ZDRSRk1R?=
 =?utf-8?B?dDBXNWw0akdpSFZSYzlNRzVrS2ExcmVFZkVHbEJyQWdReTFwc3JrTHEvMEpI?=
 =?utf-8?B?TjY4SUVyUTFDZHVsdEtLSnQvOVVNaFdHZCt2WkxMb2o4V2hVUzhtWXhiZG5i?=
 =?utf-8?B?eHZ6YlFDdjAyVFNNZDlTUEg2UUhUcFczRzJtVWkrRDgxZzFuUm9yYW1GUUgz?=
 =?utf-8?B?QWtrZFJKdGRXVVdwREFQK0FBUTFjN2JRcGl3c2gzbmgyM1ZGVUtpd0sybXZ0?=
 =?utf-8?B?eU90RE01NStLLzlhTkNCMHplTHB3dXFLSHlWUUVzakNVQXI5Vzhuejl2UUZp?=
 =?utf-8?B?SkhPRDlxRHFCSld1d2s2bGFtdzZOR1QzY0NtMG9mM2xaZngwbXowNXlDNUQv?=
 =?utf-8?B?ZndldGlVb2lEUC9EMHMvN0RsUlR0OFRxV3V4WSt1b0VqWk5XWndwWGNzMGtx?=
 =?utf-8?B?a2VmaWlaMnJTSFE1YUoycFdwR1BTM0V5cUNJdlNpNldvQlBOVHh5ZGt4MDVW?=
 =?utf-8?B?WkljR0ZRQWR4WEJMcUxndTB1MlJleFh3M2F2VGNjMnZxNWkxOHFaTjkvWWE4?=
 =?utf-8?Q?eZHC0RzkT0OmCN+wX3WdLNiBg9F9i42E3TnrXnaf7bCK?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7975188-25a3-4513-6ef4-08de149d9945
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2025 14:40:24.8253 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /cx+xDKl4jq3xOJa/y+gjftd79pBk1Wgni5Ub3S6ANBXpAEl4NqRI54FB0WyuEW/mA69OZN1IGBYbmovz4MLhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7833
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

There are a few situations in the driver where we convert a `usize` into
a `u32` using `as`. Even though most of these are obviously correct, use
`try_from` and let the compiler optimize wherever it is safe to do so.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/fb/hal/tu102.rs   | 16 +++++++---------
 drivers/gpu/nova-core/firmware/fwsec.rs |  8 ++++----
 2 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/nova-core/fb/hal/tu102.rs b/drivers/gpu/nova-core/fb/hal/tu102.rs
index b022c781caf4..32114c3b3686 100644
--- a/drivers/gpu/nova-core/fb/hal/tu102.rs
+++ b/drivers/gpu/nova-core/fb/hal/tu102.rs
@@ -15,15 +15,13 @@ pub(super) fn read_sysmem_flush_page_gm107(bar: &Bar0) -> u64 {
 
 pub(super) fn write_sysmem_flush_page_gm107(bar: &Bar0, addr: u64) -> Result {
     // Check that the address doesn't overflow the receiving 32-bit register.
-    if addr >> (u32::BITS + FLUSH_SYSMEM_ADDR_SHIFT) == 0 {
-        regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR::default()
-            .set_adr_39_08((addr >> FLUSH_SYSMEM_ADDR_SHIFT) as u32)
-            .write(bar);
-
-        Ok(())
-    } else {
-        Err(EINVAL)
-    }
+    u32::try_from(addr >> FLUSH_SYSMEM_ADDR_SHIFT)
+        .map_err(|_| EINVAL)
+        .map(|addr| {
+            regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR::default()
+                .set_adr_39_08(addr)
+                .write(bar)
+        })
 }
 
 pub(super) fn display_enabled_gm107(bar: &Bar0) -> bool {
diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
index dd3420aaa2bf..ce78c1563754 100644
--- a/drivers/gpu/nova-core/firmware/fwsec.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec.rs
@@ -291,7 +291,7 @@ fn new_fwsec(dev: &Device<device::Bound>, bios: &Vbios, cmd: FwsecCommand) -> Re
 
             frts_cmd.read_vbios = ReadVbios {
                 ver: 1,
-                hdr: size_of::<ReadVbios>() as u32,
+                hdr: u32::try_from(size_of::<ReadVbios>())?,
                 addr: 0,
                 size: 0,
                 flags: 2,
@@ -304,9 +304,9 @@ fn new_fwsec(dev: &Device<device::Bound>, bios: &Vbios, cmd: FwsecCommand) -> Re
                 } => {
                     frts_cmd.frts_region = FrtsRegion {
                         ver: 1,
-                        hdr: size_of::<FrtsRegion>() as u32,
-                        addr: (frts_addr >> 12) as u32,
-                        size: (frts_size >> 12) as u32,
+                        hdr: u32::try_from(size_of::<FrtsRegion>())?,
+                        addr: u32::try_from(frts_addr >> 12)?,
+                        size: u32::try_from(frts_size >> 12)?,
                         ftype: NVFW_FRTS_CMD_REGION_TYPE_FB,
                     };
 

-- 
2.51.0

