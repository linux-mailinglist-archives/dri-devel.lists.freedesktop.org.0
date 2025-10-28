Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35991C16193
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 18:18:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0595510E619;
	Tue, 28 Oct 2025 17:18:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="q/wr1ea3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010048.outbound.protection.outlook.com [52.101.85.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36BB210E619;
 Tue, 28 Oct 2025 17:18:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tyHiGfjBttrm5yhann4icLZmW441BYhNwQTPiG0ZVk7CfBH2zMVBekNv8lhZD6gQjpv7q0fJMPnHKVWXS2v1b1SMSm00/DoQ08OZI735V90cVXuDAli7cQ3uxYySgnL1aQHQpVeUjDG++tkYalpmJY9Bc0q8EgJR0sR9jY/RCTclNQIw6Q0JnSmOGZe5rabKEIpEsV7OddgcqR77sS+/L6LdzvzJEJR9Gj1X2cawXZ7s/i61SqJ9ND+xOUGIOanu02uDOKeHZmrakWUH9KvajVIzRFcHcxgY5daDH5zCCfBx7/TO6VnyWOKCZIG4oRGMnqNmNbjM9cVmSnDEnKr3Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JbADUguVEkxMs56yQ0Q4oqrvnkVneBYSs0vUGVMgezE=;
 b=FvrPLKAxBvTewxmqmapgj4gq1r3CCpDc01vHi0ITr/FTtX17LYIzx8hox6mMKbQustvKvTGD7KYlQAXoCIn+1HFJ//P60Kbvv4qeUcGA793fb5H6TPN+Oy/LNNqwm1rSHoIa1xo5FxiFGHpgEEXKQgv1lsOKkrs2iCYZ9qV36OthETW2tEq1PouGe4zZGYWghYk/lKeHTACOkaV/qU5n0+8qCAHOrx+6MtQadbX+wUyKCWF5Jo9B2uwTczHLCTDwV9xW8pWn3obFSrlbP8BtFZRdNjOECp444tDrN7mgKv2d86kXr/yq9WeVSJr78g04ltinu/8nTUkLCWUSUsU4Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JbADUguVEkxMs56yQ0Q4oqrvnkVneBYSs0vUGVMgezE=;
 b=q/wr1ea3pxpJP6by+KyWYuNtID5kvwi17dZzIgj5AUcsRs6r8vz8o+Z1/iFe4XIPTWfx9n7fcJEupHTFbA2I+0+tsSPspSYeHs/iyzQFTX9WEYk6D0x/eCfaHg/9Jmy4TE+YLIiKUwuWkLnENUmwbBAo9lEPUam5nIjAE9bYgmhO+3ux18TLeBpfFFcn6ma3Mf4EpYDZB/c5hqzcz2SyzvcDACggx1VyzhYFQET7Yz1X/JHWiQ3FRuFdMgij2Sd3j2tp04KW7jaEdLjjjDO5gezRj3tQeINvlJu/X91ccN9gwkedandx377JxgCstbyKh3x/p84Nk0Z+pBT3PUqaPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by DM4PR12MB6039.namprd12.prod.outlook.com (2603:10b6:8:aa::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Tue, 28 Oct
 2025 17:18:27 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9275.011; Tue, 28 Oct 2025
 17:18:27 +0000
Message-ID: <1772ce29-c84c-42b3-8c77-e92355fbee53@nvidia.com>
Date: Tue, 28 Oct 2025 10:18:21 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] gpu: nova-core: add extra conversion functions and
 traits
To: Alexandre Courbot <acourbot@nvidia.com>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Alistair Popple <apopple@nvidia.com>, Joel Fernandes
 <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 Matthew Wilcox <willy@infradead.org>,
 Nouveau <nouveau-bounces@lists.freedesktop.org>
References: <20251026-nova-as-v1-0-60c78726462d@nvidia.com>
 <20251026-nova-as-v1-5-60c78726462d@nvidia.com>
 <CANiq72mgoW_TyWf9Nv=5t3Qij_dsDjicNpGsa=F1t+sg23vxSA@mail.gmail.com>
 <de796658-ed1d-41f1-b153-f3d1089656ba@nvidia.com>
 <DDU1AQDW78QI.1CBHEW03926H0@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DDU1AQDW78QI.1CBHEW03926H0@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7PR17CA0070.namprd17.prod.outlook.com
 (2603:10b6:510:325::10) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|DM4PR12MB6039:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a23d741-5a7e-40de-1041-08de1646021d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZC9oZWZXN3ZUSHA3c2cva1dmempvbEhaRzRhZGVtdnYraEYzMnZpYklSOHo1?=
 =?utf-8?B?TGxXdEVIZkZmNmxhNW8wNnhkVlUzcGhYek4zWXl5eEZTcDVLbHg2NjBvc3Z1?=
 =?utf-8?B?M2hxZnVvOGhIU2pyRTh2RitiVVMvQXJpZXBBajkwYlR3UEd0Qmd6c2VMdnJQ?=
 =?utf-8?B?VVJYZ3ArbldrU2NCdkVnOVpPMS9KdDdqM3FNRTMxY3pTdUtObng0ZS9FQnVX?=
 =?utf-8?B?Nksyb0l6MmNrNUZydTczbkRNNGExTmF3VFdIczZIQUJuNlora0V4N1pFUFBC?=
 =?utf-8?B?TDZ5MkVsQldkcFFCcVZSTUlIUHJ1dzhhUGgxZkQvbzVITXowaUVJRVZSaGg4?=
 =?utf-8?B?MWUxZ0FaMjNnb2c4VTByb21XNnNPWUdMc0tTVWZyR0E2aW5ZTkh6RnNVbXJ5?=
 =?utf-8?B?Y2NKVXRLSnMxc3NqenhEeVlWRzI2VjB3TTE1TnppMTBNYisxK0VTbzFnbGdI?=
 =?utf-8?B?T3pFZ3pXa1NlakJIeDNMT2QyeGZLdHRIUExhZ0FPWUw2SmdFR05NdlBBN255?=
 =?utf-8?B?TUhRUHI4RkR1YkROVjcybW1JcGtSdjZCMVJHZnNRaFBwZzNuK2tWZ2M1OU1o?=
 =?utf-8?B?bk5wNkdPMFplS3U2cHZFNVFqV1ZScTM3Vk5RK1lMNXBtaXpHQVZKY2FkVmZL?=
 =?utf-8?B?SXlxTUdBVjVNckFzWTB1T2dFTVg0eDVHeGlZeXczWDUyVzZzMld0aHgybnRU?=
 =?utf-8?B?M1luY0ZFZmtqTmpzdlNUNTJGcldrKzBmU0lRRFBMM3MrTytrNFhoY2JObjhJ?=
 =?utf-8?B?aWZQUDR6OERTdHN0WmdFdkJqb3ZqSEc5Vmt6aVBJODAvOUJnWnNsNGtvZkRi?=
 =?utf-8?B?YzFlbnlSYk9HQTB4Q2xEUWtxVU9MOUVaSm9MUXhMZjFNRVdmUm14cUlBOVQ1?=
 =?utf-8?B?U3NLcmpBd3kvVEplN0dxOWpSeEZPQW9GR0lDY3pGaUNBSWsxYk5DS3dDa2hi?=
 =?utf-8?B?bk5BV2NheU9VZ0FLVWhmS25SREdjSVJiOVh5bkt3SWZEVUNSekI4L1pWcmNa?=
 =?utf-8?B?N0ZJMGNIMU1ocUxEVWNGdDl3ODVXaFlMTWpKT1VXSlY5OWwrNDFmbVRmMjZz?=
 =?utf-8?B?VjdZZFRpZ1dEL3paU21KMkZJbFI2RzFLWXZ5eTQwaFJPeXBuTjllTXhFc2d5?=
 =?utf-8?B?dHVRNUU3MFFyRkVVVUlUL2VaSGZadVBEd2ZZcGM5WTlYSFBNZkJKMHlhWEpz?=
 =?utf-8?B?RzlnK3RBay91dnArZVd3aVlvVmpReURLNXdHQTlMbW5DWCtnUWg0bC91VjF4?=
 =?utf-8?B?YmtaK1ZsY3pNVU4xMUh0SUdZcGhJaWovU0hGQ0NBcDhpczVIK1c4WXkrZ1M4?=
 =?utf-8?B?OVdaVHhVZ3JwK2V6Z3h3TWZzQlhuSWJTNDZleHF4MHJUZXFzUUVTUi9XeVpU?=
 =?utf-8?B?STFqSXNORHNXZVUrdjNnZFBGTXhlUWVrVVBvdEpoSWZZdVIyV1Z0alIxc0ha?=
 =?utf-8?B?cDhrdWdmUEZlQmRWdVoyYWZMd2UzOWgrWCtodGs5NlBuOTdSQ005NFNTOEZH?=
 =?utf-8?B?SW1mMFNJMi81K1JzZDVNaW9IQ0ZLdk85RXFVanUvQThHMVBwTnNFcmtIamRZ?=
 =?utf-8?B?cXBzbjhIRUVqNVlDVnpuUUJsSzA1S2xVeE5DekxtNEdLazd6TmdIUjRsMnVI?=
 =?utf-8?B?YjJOY09qNDNTMVpIdk04Vk9tMzR6MDIrbEw1UGFIQkFtMGwxdTg3K3dPWmNl?=
 =?utf-8?B?RDJqR2NpMlpDUUw1NlEzMHllTkJUUlc4LzJTeFVwTk1lUTE3U05OZUNhdDUy?=
 =?utf-8?B?SmwrL0VEU0Nta0lNNEpQR3plc1FKd0xhY3JSTGRCTjdxMk50dnRIQnJ1V2Fh?=
 =?utf-8?B?UEZqV3A4b0xTUGtjUFo1UEFLaVU0NklhY0xaK1hrZGtSNzhvTVpnTzlXZGVZ?=
 =?utf-8?B?M3Z6YzNpUmtZZ3loSzBSb0JLV2JlY2J0WGVMc25ibXkwRGdJOUNhRWUyWDgr?=
 =?utf-8?Q?DCZ0XyD/CHv3WaLDSDJ9eKZDXskxljuQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bE44ZU9QM0dkZitaWWlacFk5Y1hWNTUybVA5Q1pvcDJaTnU0UnY4M080ajNT?=
 =?utf-8?B?UjNmYzVCZk5ydzIxZGVLWm9jbDh2Ukl3TmY0K2FYY0dsT01TbTBjcEJBWHNv?=
 =?utf-8?B?d0pIOERWTDc3c0VtOXRGQTkvSkxQcjZQKzBnWUszTHNVQklwKzRzK3NYWE90?=
 =?utf-8?B?aGNBUGNoQXpOZ0duQWU0S2NneW9qRkUxbElWb1dmSVhnZ2NwdVpITXF6RGRh?=
 =?utf-8?B?SjdIVkF4bzJGTG5SeWxJeThhcFZjSGU2WWtSNW9ETE82dmYrbnQwMEhwOVNR?=
 =?utf-8?B?WG9IbncrZ1BPMXhQaWJHelJYaTJjVVJmUWk1TzB2U1BHR2JEYnNFSzBaa056?=
 =?utf-8?B?dTRWMlFoQmF4dElCOXZveWRkSWlKejBvUkx3L3laUnJLMXp2T3pmbnQ3dVB1?=
 =?utf-8?B?TlpGUjVrSkozSlJGTTlGclQ3blk5M2grU3I1UEJnbkx5RHFCRXQzbjRZMWlv?=
 =?utf-8?B?VmpzTEY3T3RDNGgxbjBMUzNKZnFwN3Nuc2pRUzNPVVAwV0RvWGtDWldoVEhk?=
 =?utf-8?B?N2toODlzWnMrMWRFTXcrd3JFbzZNc2dualdoblNpVzNJVFpuenpXMnhqVUNi?=
 =?utf-8?B?RGU1a2Q0eWtZL2tXY0pUR1N1dUE2bGllV1g5ZEpIM0dDQkR2SUF6QkJIcmto?=
 =?utf-8?B?K0gwT3N3NFdaaW12YkxaZmFQSGdESHlZWnBhRnVHK0xJUjcxOGVabVlDck81?=
 =?utf-8?B?UTZvTjY4VndVNFdVTXRaTmpoY1RWaDltSFhzWkNrR0kvcEFUb01GbjFnREdo?=
 =?utf-8?B?dVNRNnRzZU5LSlk1SEVyYnhIK0dCVFJRNEw5SE0rSXpuUUR1dkh1YmJjcUxu?=
 =?utf-8?B?M2dQNUdmWHJFZ1ZDdmJ5SG9aekJNMEFtZkM1WVNHVFBMcTVvTGplbVNGU0Jo?=
 =?utf-8?B?VnVvQWg0YU96NEd3WVBlNlo1RXQyNVNQeThVSzZKamF1WVR1UDAzTTF6OERB?=
 =?utf-8?B?NWRySFIyQ1VaTGhJYWxRSHhLUHRUb3ZLbUQ2R0MweUVzLzJvd0dZZWNtT2xW?=
 =?utf-8?B?eHBrSjRieDZXVDREZ1E0L1k0MFRHUG96VTBPUHFuS00rUThPS2taS0Irdkg4?=
 =?utf-8?B?aU9pSjZxYm1WdGNLMktzMkJYenlMbkQ4T0ZoditSd3dWRnFtSlhCTHVLYXho?=
 =?utf-8?B?enZSanN5UkQzZWRwSWdQOHN3MnZYWTBDVThQTHZrcnBGQUhQSWdOZzkyRzZ0?=
 =?utf-8?B?VXFIbFk2cWdzTWhLd052VFpvQ0U2N1RJTTN4WWpZdm5PZHQ5S0srSCtDMTY1?=
 =?utf-8?B?eU00bVNmQWozcWg2WEJ5MEJKbFUwbmY0SEdFSkdCdjdBSzlYMkppc2NWZ2ky?=
 =?utf-8?B?czlqbFF5dW01QmRLZ3JZbFVFdlJ1cTlTdWVwTXZiWUUrcDZXR3c3SWdTanNI?=
 =?utf-8?B?UFB0WGRsa1J2WUk1VFRLODNnRlRRMnFOSGdmalVSSnBjdnZkbWR1azkxSHpM?=
 =?utf-8?B?K2R5eWNzNVllYU9yeEJ2TFpqbnp2R0U3VDcvQ052eXdUQlltR2E3YWxuc1dj?=
 =?utf-8?B?WWdZVGJaVVRsZnc3N0U4RkU5Q3EvZVNzTjJ6UUo5b010NWJlV1ZyRSt0ZzJ4?=
 =?utf-8?B?MU1vaFN3Q2U1NjhVYXhkZ0RjUUgzV3ZwTXlFbFRTeFlVOUhNRjFrZlV6SGRr?=
 =?utf-8?B?M2ltUlNYWVdTdmI5VzF3aGExRmhlaksxMWhUZnFjN3pqeFRHZEhwM1RkQ09F?=
 =?utf-8?B?b2dIUXh6S3plMCtveGpKWVdXK2VadFY0SUtlTG5aTDBEY2pCNXFJUkE1aXRI?=
 =?utf-8?B?OVpHbE9LUE82dXhJRGI4eTVnV3Z3MVM5Rk5jZno5K0pDd3BUMVYrSlI5OG5N?=
 =?utf-8?B?SUZXZzhjdVR5V0diNE5wd1NMVExwTC9OQkFkdVFGUUpwSkJGM2pmTmwxS0NR?=
 =?utf-8?B?Z0RIbnp5VDdYV0RPVXpaNlMyQVJmUkYzSjNsdXRzWkpieHphK3htc3JzbXEx?=
 =?utf-8?B?Y1UyKytEUEQrV0tvUlJ0bVRSRFNiMS91Ykx2OUZSVEJqdm5aNUNuLzZPTExD?=
 =?utf-8?B?cEgwVFZvd1J2R2RKQVV0TWZLa09tZUMrVmxHelJBbUQ1cGlnZFlzQXJqdDZM?=
 =?utf-8?B?aFVLeDhvb2hqYU1SK010MnRVNi9hUEk5d2hwYW41UEpNU29VdkFMWkxTemh4?=
 =?utf-8?Q?l78xjEl2NwvM+lXERwttzY7VU?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a23d741-5a7e-40de-1041-08de1646021d
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 17:18:27.4447 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jLMzNGf8KkJNcWjkveesDhMiYoRcWvRoSJD+t0C4EXPWdd5LcW/az4OZlh2NpgLbYBIkTDMZGb8Ohx97EUvXkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6039
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

On 10/28/25 7:44 AM, Alexandre Courbot wrote:
> On Tue Oct 28, 2025 at 3:46 AM JST, John Hubbard wrote:
>> On 10/26/25 9:44 AM, Miguel Ojeda wrote:
>>> On Sun, Oct 26, 2025 at 3:40 PM Alexandre Courbot <acourbot@nvidia.com> wrote:
>> ...
>>
>>> Regarding the `.into_as()` name, it makes sense, but it can be a bit
>>> surprising when reading out of context... The standalone functions are
>>> super clear, in comparison. But I am not sure what could be better.
>>> `into_in_this_arch()` or similar could emphasize that this will only
>>> work in certain architectures, i.e. it is "an `into()` for this arch"
>>> rather than the general one.
>>> That would go well with the idea that you didn't implement it for
>>> other obvious types, which I guess was to avoid developers using this
>>> instead of `into()` by mistake, right?
>>>
>>
>> Exactly: the into-as, from-as naming suffers from *appearing* to be
>> familiar and readable, but actually, the naming gives no hint as to
>> what it is really doing--nor how it is subtly different from the
>> basic from/as/into standard conversions.
>>
>> Instead, we need to add something (almost anything) to the name, to
>> make it clearly different from the from/as/into.
>>
>> into_for_arch() goes in that direction, for example.
> 
> I'd like to get more input on that, for I am not sure how we can stay
> succint in the naming, while carrying the relevant information.

That's too many constraints: if you want an extremely short name
that carries information, *and* avoids (as requested here) confusion
with existing "as" methods, then...you can't.

But you are allowed to be less succinct here, because the more
specialized and rare a case is, the longer you can make the name.
And here, you are definitely allowed a few more characters.


> `into_arch` does not sound much more explanatory than `into_as` - the
> intent with the latter was to say "I would normally have done an `as`,
> but instead here is a method that attests that this operations is indeed
> lossless and safe".
> 
> The best naming scheme I could think of is to have the methods carry the
> source or destination types: e.g. `from_usize` or `into_usize` (like the
> standalone functions), but that would require defining as many traits,
> and increase the number of imports - if we go that way, we might just as
> well drop the traits completely and use the standalone functions.

Accurate names are really desirable; maybe we shouldn't completely
close the door to the above approach.

thanks,
John Hubbard

> 
> `into_native` also comes to mind, but like `arch`, it can mean many
> things depending on the context.
> 
> ... I think I still believe that `into_as` is the clearest name, once
> one has read the documentation for the trait - which one should be
> expected to do anyway. :)

