Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED10C998E7
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 00:15:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7214910E4C2;
	Mon,  1 Dec 2025 23:15:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="kLpBvuCU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013066.outbound.protection.outlook.com
 [40.93.201.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2270A10E268;
 Mon,  1 Dec 2025 23:15:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yKDzgnnglOGjnIU+c1cEviYj5Yr5KqPYUReUrCZL3EVsIOlKfKAsiRpKQ7zwo63IFio4uBlqyq/6IaDGH5mcvE+wK9GeBoTLtbeO4Tu5+01qVYVM2tf/0UhuE24GuhCMpLgmI9pUheJ0e+K/whNvymPq9IndcjdxQo4vObfMTwAmn09uGT39RF0P0+orNfj3LZmKq3VPnFzeIHgijiakbVGRIL/EoRh0AA32WSVJfUA/5hHZlVAwIij9JxKiBMuyd6qbHBOETV+NcQ2glpI9cMI0vikXN5H0XXVxnmQfR7CKHrqBjkoqUiXxYJRjobIKt6tHhzSSgwx12GJhsYSbUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X7qktZzaBVy2NWqZdll8ock3MOEfJXi8FsvWHSxQdZU=;
 b=aCuVQvHTTdWyCv71BtdGh+zKo+XcYzglYn+q4zhSNfXVYAqJXpp0yjAuEwHW4UCFB1QvfFs0dlzjlWaoCNTJUA/Nv6mWLah3dcRZVUoOtJo43Roq2TXlfw6k6iY9sV4ihSjdgQN0CB0Q6BF2uZ3EMf/EPTk6cSn93EvWga3zB6v0ZOK+6OmeYRmG0YR2uISW7b3CoX9TiJmnWsRGkxo/holYR3gCSCKk1MEArE3wOBzdRl7ayUd0LJkhmnM6rmh7I4MNlAT4wuaCusnclS8rFy89EWcmnzZelHwRyhSAkagtqBjXZLAleYYPI0yajVV3rS6SpvN9R0KPi0oIu+PtsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X7qktZzaBVy2NWqZdll8ock3MOEfJXi8FsvWHSxQdZU=;
 b=kLpBvuCUbAYHYB4BWTaXbnuIy+3Y5lsU/cgimOrgkqk9gdANeqe9PC6ZUGGXt0tyDdUPycJTGicnJuZjr1Aj+fqDuMhdms1VdVa2CtPsfz+6siDnLn2Ve/NePRcsB2eLNwAgP7yqo5Y+mjOXpEDlo09XUHoN2nipFIa4ClWkeabnkpNqPGOQiCLw7VdmnFDu3FzlzX9pS2qOK3hbcuBHpk8GHaQRl4nPn1ctheZizflu4InTPabN00/7bo8lqMcmfAoDIssVZU3A3Pt3mcs0KqY1b36qKczDuKXNweX9dg1l0HKwrr39pmx7OKJkOx3Z7iNZFdJrM7H+xFlkVwNAlQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 IA1PR12MB6650.namprd12.prod.outlook.com (2603:10b6:208:3a1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 23:15:16 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 23:15:13 +0000
Message-ID: <733283c8-03d8-438f-8c80-5a51714504b1@nvidia.com>
Date: Mon, 1 Dec 2025 15:15:07 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] rust: clist: Add support to interface with C linked
 lists
To: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Danilo Krummrich <dakr@kernel.org>,
 Dave Airlie <airlied@gmail.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Timur Tabi <ttabi@nvidia.com>, Joel Fernandes <joel@joelfernandes.org>,
 Lyude Paul <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Andrea Righi <arighi@nvidia.com>, Philipp Stanner <phasta@kernel.org>
References: <20251129213056.4021375-1-joelagnelf@nvidia.com>
 <2653abf6-5cd4-4385-b7c2-f377a9503160@nvidia.com>
 <7a88da9f-c67b-4a68-b8d6-a66f9096bab4@nvidia.com>
 <497c91a2-ca6c-4e05-bc5e-7c3818302c7e@nvidia.com>
 <2700c827-d3af-403c-857a-30324e0d8502@nvidia.com>
 <4224983e-7788-4c40-8046-a67e67c9d052@nvidia.com>
 <0ed2f00a-0f32-4ed4-b04b-0a94728b998c@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <0ed2f00a-0f32-4ed4-b04b-0a94728b998c@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0206.namprd05.prod.outlook.com
 (2603:10b6:a03:330::31) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|IA1PR12MB6650:EE_
X-MS-Office365-Filtering-Correlation-Id: 3417643a-cbbf-4811-f438-08de312f7b15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cXdEU091QU41OGlvekxGVGpXdkRpLytnNjlJd2VHcC9TNjBTZWcwSFVPNUNJ?=
 =?utf-8?B?WWZBNnYyQjNQTEp2T202b1FhVU5kNlBMT1k1ZnFSUlVmb3ZvYUc0K0R3T0w0?=
 =?utf-8?B?M1hxRFMyT0pKT0RkTUU2ZzFnd3VkdzNLNjVFN09MT09sekNKWVdKUE5TVFAy?=
 =?utf-8?B?UWxvNXpEdXJKQXRkOVh6aVlRL3FPVmFXM3ErYVdSbVBBazBzNmZUeHhqUVFj?=
 =?utf-8?B?YWFHU2hWcG1iOFRsRkFvM1J3aFd3UjlLdTVXTUZFZkN0Rm04R05KdXpKem9l?=
 =?utf-8?B?dXdLWFEzS2JMVFdKRTZJMEplV21PelA3Qm9oYU51Smt1L3Fkcis0Q0NoUkNq?=
 =?utf-8?B?aWU2RmhncFU2TVRNRmxFTFMyd1d1SU5MeGdqWHFzN2c2NVl6U1FSbzV6bmk4?=
 =?utf-8?B?SzRVNFp2SWN3ekdKRjdFZmRjZzk5cW5CSVIyT2ZFZEZTU2dYcnBTWFZYT2Fk?=
 =?utf-8?B?QzU2dkg3R3dsLzdKYUdqSVN0NTM1cllRZjZRcGtEejFtSkg4OE00NjQ4UWVk?=
 =?utf-8?B?eVNsZC9HZy9kY0F6Q0tBR29FNTBPNGZ3Z1VUVmQzZktOcjkyV1lGWTBLRWxZ?=
 =?utf-8?B?SDQ4djNrQTMybWJiRGszYXBmQzZqRXQwdkV4emhERzArM3B0TXlyUDRsZUtQ?=
 =?utf-8?B?cHcvYnErM1NITExDbE5BbUxweEZrMnFnMHhDYjVralJqQmpPNmxkSXJOQUxy?=
 =?utf-8?B?SC9FcTlBcEYzdkZKT25DbDdWeG93Z1F3Uk9PVVh5MHBaU3c5SE5FWkczMDZq?=
 =?utf-8?B?WW94OE1EM0tiN1FSZjh3bEdjUGFzTFlacU5xd01md21PbTFKdjhhYlhwUWNG?=
 =?utf-8?B?REJtYU1CVmk5dFpWOTFZSUdFNktZSkRrUjJCNUc5RmhJczlTU1J2VjFEWkNG?=
 =?utf-8?B?WlhTUTFIQ1Z4eVNsUVlNZEZxYnVvUDhBWEtUdmgrcWFaeWNSVEdJcU9remlR?=
 =?utf-8?B?bUptQ0JmbERJVVNhbDZiNGZPMFQ4RWdma3NOTGFaSXRKRjdFeUNRcWNlRTJh?=
 =?utf-8?B?enprbXhjdEVCU3RhbzBtNlRvYlcrTzBVVXZuUW0zcVhzZlZCRmZUY0RZalVn?=
 =?utf-8?B?WHhDMkpUTnZOWVpobExuRm5tcnFWN3JnMllTTXhOdytISjFZYTVFcmtDZDRy?=
 =?utf-8?B?bThmWERIb0JWc0x3VHNFVVd2NGpBSisyVHZjRnpBUXNUZTZ4YnRVZE8rT0Fv?=
 =?utf-8?B?N3FLcUNvbmVxTFkzN3hKNkJQU01aQnNjRXNDV2NmMjdDZE9uWkY1d0oycUlS?=
 =?utf-8?B?ZWIzcnFlL1VEWERvdHRlTXIySEZBUi9iV1NzVEpObDlGYVpvRkZydEw2Q3l4?=
 =?utf-8?B?amZCUFZIcWJuWHNwWkM4OFcvUW53ME5LbFlESDFMOVdSd3BUSHEwaU5MTzNi?=
 =?utf-8?B?K1MzdDl4bXVVUTIvOTQ3enVxbnZLa3N5VHZoN0NFaktqcGpGTkZWRXRmZXkv?=
 =?utf-8?B?bDRJY0FmR2VNNC9ib3JyNXZJcytMeTBGRDdabDJINWZXOGhmaFpaQ25ULy9H?=
 =?utf-8?B?ZjhpZUxLcnBidU94Sis4OS9Pdm5tUXlxVy9lZElibEhYclRiWTZwL0wzSWpp?=
 =?utf-8?B?Z05nTHhOS3J5RW8vZUczZ2E1Q1hSTzJnZFBZaWlXa1pRcEswYmZYaXZab2VM?=
 =?utf-8?B?TmlLY3BhYklwL3UraWxwZTl5R2NkY0dzMDVDaVNGK1BXV2tZM0lqeXYyTjFT?=
 =?utf-8?B?NDZKaXdSVFZUaVBEODF6cUk3NDNQMVpFT2xpZXZWR1dDUmxjUE9HT1ZHQUxZ?=
 =?utf-8?B?QlRJcHVsVE1tNStJZHplUEtkUWQzNzhoKzZVeU1ZampPWTU4eVlITklwRnhP?=
 =?utf-8?B?aUxLUlhyUFcrNXBZWHUrMjJXWm1hWXBZeThkQXl2NUpFVWd1d1pPbjdCM2tL?=
 =?utf-8?B?cThLdWYxT3VUSituTXFKMHVsakJnY3lpQ0U0YTFTbFhDaDdNaHRpdmNFQmdk?=
 =?utf-8?Q?6sOslB0uJeKdczZwPUiOalQZmUhxkpca?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bis4NUYzQSs4NzEzeENBQkxUcFpaT0FnM0JNblNKTk9KVmh3RldOVWFKbENM?=
 =?utf-8?B?dnR6RjlsbDRza0diRWpHQU9JUElFZS9zR0FXTmtsNXFRdFZXS3dhRTNHNHRB?=
 =?utf-8?B?RmRvUk9KWE40SlFkOXZMUU84UjFnYm0yRk15bTg2bk9Ick43RHRDNTRLcFNB?=
 =?utf-8?B?U1h1bkVTekhSdElmYmdYS0ZmTXNPZjJlMHRGSzlqSjFTU1ZUbU52VWZWUk1w?=
 =?utf-8?B?ZE56N3dsdUFDQmRUbFl3Rjkwbmo1WEtMOHhocVFpN1ZiYXdoWVJHS2JlUzIz?=
 =?utf-8?B?aTVYY0I0dnlGWS9kNkxJWnZycWlkM2c2cWpRS09oTjJRZ09XNXFHSHExS1pR?=
 =?utf-8?B?TnFhdCs2dmZncC9ZdmgxTE9GLzBqRmtWSFcxMGJ6aVpWd2piWG1XNnk4Ky9X?=
 =?utf-8?B?RU5RTGtmK1JVUlhTbnh2dzcxU1NLRTFRL3ZQVVdZeUZqV25XRC9SejZHQ2hQ?=
 =?utf-8?B?dmlNV1VOdFZpTnk2ckgwbXZ6SUoxMGY0a0tpdDJHNGpWRDdaNVVmZ3oxQVY5?=
 =?utf-8?B?OVc0WjhVMXoyTU9OM0hzSHZwTXZySDA0Z1JibUtlQ1FkeklzTFQzL1A5RWx4?=
 =?utf-8?B?ZGtTdWZ1Y0R0UTE5ZFl0YnpVTEFqNGVVM1ZrbWdES1hqVndCWGVFVXd1NVpY?=
 =?utf-8?B?dks4T2w3eFZsNDM4MXFIeU5XTG1UMVo5VWJRS2tIbTdTUUpmV1c0d3BQYVNR?=
 =?utf-8?B?NGtLUWlHU0Nkd0grSzFOU0ZJUlNoaDlzNGxNQytTeXEvbytmNVVTTy9HOUZY?=
 =?utf-8?B?RXF0VDhpbmdSYWc2c0dZbS95OWw0d1BhRGRzcEMxOHpVa200MHpsSkhWZ3V0?=
 =?utf-8?B?ekZRTVB5eGxKQVZiKzdGRkhFemxadDUyYmJFeTlrMFYyNTJmNWhwcXdhQ1pK?=
 =?utf-8?B?YVR4ZXk4a2pIb3ZUakNZeDlVODN3a0hUa093UFM3YTlRbCtJZ29qRFBUbEhw?=
 =?utf-8?B?MTlWRjdzcUg1UXdjSFhaeXFKYW11dmxYc29sbHFHMHBkUGQvUC9HUEo1cmtR?=
 =?utf-8?B?WXgzeS84ZGZtTFNFVjlrOXI3TXdqMmcreDZqUDY4ODJYOGo2N05FRmZFV2hw?=
 =?utf-8?B?bVJpazNPN1AwalFsVkJlbG0wRHViN3VjaUVGMm9rVDZmVG9heWxFdjNnNyt0?=
 =?utf-8?B?NmtKY2xDQlNwRitNZCtraHhjRmxUTnUzMkFWUlk5YkN5bjl5ek9KMVNDWVJR?=
 =?utf-8?B?VUJ6Tk9WUENCQVVhQ0Job2hZU00vZGZYMW42WHFJRVdvUVBJeXovTVpKREIy?=
 =?utf-8?B?Ri9IMDFFRzJKaUpodFh1elZzUDk5TkZwSkk5MXhqTlozbDE0VUJpd21hNWM4?=
 =?utf-8?B?U09BclNwZ2lRenUza1c0U29qQWl4aDd6TnkwanRCSGkyMWZ1N0xURUZadjNV?=
 =?utf-8?B?b0d1QUpNT1JSUGR4bGRvV3dMbThhekQrWEdJemhmNVNSTm5LclRSVWdnbGEz?=
 =?utf-8?B?VzQrcERlYThscE5KcERpZnpZaTZuYzhkTEJVYTM1YzllVDFYMU41bDhKUytM?=
 =?utf-8?B?WExFL09VN0hKSStPV2JkTlQzb1Y1RWRiRmJaeHV2RkNzVHhUZlFvZ3FVSVk1?=
 =?utf-8?B?N1EwenQ5TnFETWVBSFB4UE9BU2QvVlpYZWRkeGZ3RTl2ZWVvdWZmRHdsakFo?=
 =?utf-8?B?WmUyZXFMMnVqcmJzblBsTkNDTUVHaGtUb0p5RE9RdTZaK2VXR2NOSG5GakJC?=
 =?utf-8?B?QlJaalU0Nk11QlZjajRLQ2JQTmJLSGRYZVhUclZackwycG1PRmFDWlkxenlV?=
 =?utf-8?B?MUpkVkt0LzN6QlQrVHNTT2FxMFF0bFRPNXV2NTlBTzFHVHBIWFVnSktxU2Jy?=
 =?utf-8?B?Q0hndFo4aHlyRUNTYi9acG1CYURhN1BNMzVpcWthVGNoNksyR25vVmdBMS91?=
 =?utf-8?B?ekNjbk9ScXBvZk83VVJMV0RFclR1dDR0YlF4S3g3MWRMMVA0NFc5K3pzVytV?=
 =?utf-8?B?UjUzbmxseHpxK1Ryd2F2YzhKT1o1UjBKSUJxMzVmQjRaRTFvWGhwWDdtczF3?=
 =?utf-8?B?L0dWbGJNRUYzcnE0ZXN1U1d3VmtDYTYvSmx5V210aER0R2NvQWd4MlNWU2tj?=
 =?utf-8?B?ejJhdDh5NVZMNVFrSTNrSE5pY1h5M2QzT3oyN3hlRm9aOVJzaFB0ZHg5RUNO?=
 =?utf-8?Q?EfGNqZQB4xV78+5euT+gmMl2W?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3417643a-cbbf-4811-f438-08de312f7b15
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 23:15:13.4976 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FJpuGp8TJ0yvxT9JIJarcNHnJiucGpLgYVisIJzT0sosaPKw5tbEDzxRG+c1vgfeV/NJL6GGjiunPDxktFP1Yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6650
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

On 12/1/25 3:09 PM, Joel Fernandes wrote:
> On 12/1/2025 5:52 PM, John Hubbard wrote:
>>>> And actually, after writing the above...I still think it would be better
>>>> to post this with its first caller (DRM_BUDDY, or BUDDY_DRM_ALUMNI, or
>>>> however it ends up), so that we can see how it looks and behaves in
>>>> practice.
>>>>
>>>> What's the rush?
>>> Who said anything about a rush? I am really confused by what you mean. It is
>>> useful to post patches even if there are external dependencies to get feedback.
>>> So this is also an invalid review comment unfortunately. There is no rush, this
>>> is v3 now, did you miss that?
>>>
>> I mean, doctests are far weaker than actual code that uses the new API.
>> It feels rushed to propose merging code without a caller. And I don't
>> think doctests are a "real enough" caller.
> 
> Actually I was already rebasing my DRM buddy bindings patches today. So the next
> version was already going to be with the actual DRM buddy bindings (inclusive of
> the clist patches), now that clist has mostly settled. The point of posting the
> clist series was to focus on just that part and get it right. If you notice, my
> first version included the DRM buddy user as well but clist required a lot of
> changes first.

Excellent!

> 
> I don't think one needs to include all users in a series if the series is
> sufficiently complex (as long as you posted the user or share a tree using it -
> which I already did in the v1). Then the maintainers can decide if it needs to
> be pulled in advance or with the user. That's really up to a maintainer. I
> certainly want clist to merged only once the drm buddy bindings go with it - why

Probably good to say that directly, in a cover letter.

> else would we want to do that? There is absolutely no reason. I am unable to
> find where you go the idea that I was proposing merging clist without the drm
> buddy bindings - there is little reason to do that considering clist.rs is
> mostly independent of other things and is really easy to rebase.
>

Just the fact that these are non-RFC patches.

thanks,
John Hubbard
