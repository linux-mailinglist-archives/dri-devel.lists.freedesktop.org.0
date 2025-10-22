Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0594BFDB4C
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 19:51:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E209C10E825;
	Wed, 22 Oct 2025 17:51:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="U+/faqK+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012043.outbound.protection.outlook.com [52.101.43.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B62BE10E825;
 Wed, 22 Oct 2025 17:51:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OxdnlW/oe51yv1Zg0TwMOTZ7+dNrhlPHhtsvaTJjRPeOEl70avNE3mlkeZW9YXGYboBGYzfe+GqzvgfYlgTg/m3UHLvBbt/8+iABe7f/lI9ylagnGgwxYshj+zzWmv2bPjMrRhZq38s4XfIqJlnBDlwm1ibeyXU3eReBzW7hLs1CspEFocy42l73PDhn6ytJNnGU2e5R+YAF2ovqcaPUxFFOn6TYydy9AHBD2FXa34z3HpXLZksccAEPwYqJXvvXNXxXIgCIwQgM95FISGvBhpf3JgQA+FbuMr6amHJK1tFfkmCINB6MgSmOUxSinTA1jGuR51R0bVVsJ1wtbW6YLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zlco/BZI0TD5ffYko3g1khvNBgJ/VrD4ojvXbOlV3Ho=;
 b=M634udMiw7i6vutJn0uxaQ5mjnHOjdH3wllxglKC6Gxncb97PLg3btCnd9UlPOAuwf8iKgG4Fp0OZDRXQBy5+TW4KtHiyorBkmapuKg7ngBfMOTgC40PdsuuNWCW6+5N1rVsBXdWFmsldEZl7Ov+w0jEETIaFinfp9+ZRSm7GJxzBlZkuxPWrOtztjXm0Xr2nXJ807Jtky27oLrfQvNXaTWBUwMGbrEyL49eeIYDSDlLNdPjTkkt/4h7JQc9AXFqbDyGxgzy3bgmZeijUkIDBvyx/4avRrhCqsSmHF0XSqQqJqTvYz1M4/b1JK3OSjHFppP2rtS/S/Cf59Yv8ENnXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zlco/BZI0TD5ffYko3g1khvNBgJ/VrD4ojvXbOlV3Ho=;
 b=U+/faqK+hHaC3OjwNGTfIddXZ+j4f78blaFKeD3CPWRGmM1nxfUmYDhhLhbZdbjdEru6pXfg8OLGyfbMYrrG67Wx5WqZ7hydz4HK/go1dUqPI2p/dk5Toh3pUU9I3zB1MfeY1STCEpGi0NVHLi9fkLh/zTlM9RWw7qMc8adVTwtYgB5s9PqKG/GJugphGlHbj5fPr8toztOfeVtSHD5DS60VKpG6kAs5gBfptPISoR/lHJlZtMgyRO1n00dYX5Nhte2UzzR1C4eQ4DLUGMnfg7/wJrXwSNaeEbu6SKp49jj/EW3+Ps8U9YfvG/74qf6Sdl4MZA8Pyogj8ZmOyiKxHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SJ2PR12MB8848.namprd12.prod.outlook.com (2603:10b6:a03:537::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Wed, 22 Oct
 2025 17:51:15 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9228.015; Wed, 22 Oct 2025
 17:51:15 +0000
Message-ID: <7ad70505-d75e-4509-9d88-7906bd65b164@nvidia.com>
Date: Wed, 22 Oct 2025 13:51:09 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] gpu: nova-core: Add support to convert bitfield to
 underlying type
To: Alexandre Courbot <acourbot@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org
Cc: Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>, nouveau@lists.freedesktop.org
References: <20251020185539.49986-1-joelagnelf@nvidia.com>
 <20251020185539.49986-3-joelagnelf@nvidia.com>
 <DDOMXDDVNHSE.1KA62KDD8JOZ3@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <DDOMXDDVNHSE.1KA62KDD8JOZ3@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR11CA0066.namprd11.prod.outlook.com
 (2603:10b6:a03:80::43) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|SJ2PR12MB8848:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a566939-a154-437b-edae-08de11939886
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bERObEcrM2lJUnkxMlZ3VjFFOWt4SmtoU2hTcEhqbThrQnhmaUVBNW5NcGdZ?=
 =?utf-8?B?TVVRdllkdFQrK05NeDgxbTB3N0FzYzA5OEtOd240WDNvR3hybnkrb0prRGpW?=
 =?utf-8?B?NUV6TU1zU2k0ZXBua1YzWnQrMkI3VjVIc0t0WnNJNFhIMG5HZWhhNXIvT2FW?=
 =?utf-8?B?T2xzZkNqNG80c1hqZWF1azRHVk1BQnB2TU00TmZsUEJqTmllMVFmZVN4K0pP?=
 =?utf-8?B?QnhMbFdFQ084eXRqNmZwQzVFVTl2OHFsMnRKUGppSzl2eWh6VDlNa3E0cWxK?=
 =?utf-8?B?TlVpRVdiOElSbkVkWUREMGlWbGRRaUs4N1BjOE4yaWwvWFdPRlJnQnhTOEhi?=
 =?utf-8?B?ekxrL0Zob25rUVdyMVc5RHM0NTJsZ2tWOFdZQ2JiVmVZUzdVRjAyd3kwMTRR?=
 =?utf-8?B?UFZRaWpuSmhQMk1FdjYxYllxR2N1R2xody9GR2dyRGFsRnRsQmM5RU1Zd0hV?=
 =?utf-8?B?d3VNeTNQY0swc2Z0RmdSQjUrMC8rdTZEVDh0SHRqSGhnZ2VkWjZCSlZKd3RV?=
 =?utf-8?B?Y282NEhBSEdnWVVzbHJkTXN1bVdkVDRnMFVocnZRR0ZuQTVjbWFsQnh3MmtG?=
 =?utf-8?B?Uy9GRy9pL3BmanJHTHBGZGpqY3V4bUs2ckRuUno3S1BhQnQzL013Z2xjSkxH?=
 =?utf-8?B?ZGtISWRkY2RDb0Q4b0s2MHZmanJVK1hOUlhGZGMwOE9ZQm5zSm1HbHd3dHgy?=
 =?utf-8?B?TElXc1JqdGxRa25JY1BjZ2ZmTUdwWHA0ZlVyOHpFa0R0TThwaHdOOXRWdm9W?=
 =?utf-8?B?OTVJbWYwUXpaRS9pTFlpMUNkWEtXeGY4WWlYNUJGcTA5YnUvVld4ekhtTHNV?=
 =?utf-8?B?UXRTNjMvTURGUm00T0x6R0xhSEtYM0RTRklXeStNRHFPbVlQVzUydmVOTXJH?=
 =?utf-8?B?MlpaYnRBY2Mwc2dOZW5Qc3I4bnFqQkI1eWNPS2F3akZrRHpmRTY4UVJwcUlY?=
 =?utf-8?B?VHNKUjZla0Fia2VpR1VYRVdQWEhGNTcwSXI1VDFJeS96US9uc2xLTTVFbldY?=
 =?utf-8?B?eEhNUzhOTkJEemMrSFVySnVEeU41SkJKaVhEVklEczNYbmRsNXhzd1AwWlpU?=
 =?utf-8?B?Z2dVWG1lNjFVdFpXMVVEb3RuWVQwc0RPSkI0UjN5NDJQd05UeG9HRmJ3Ui9r?=
 =?utf-8?B?WVRjS3RBZnJjMmpoMVVZWkFqb25RYUJyeU5kUTdvK1M0UldoVFVzRy9Dblc2?=
 =?utf-8?B?a3dqaGlXUERrakZEUjlEbXRqS29sckxIeXFWV1JRcFRwSjBaNjZQZS9uZ1Vq?=
 =?utf-8?B?dEdVN1NOREZmc3VxSTlVMURLWGh3c2lMandYVVFuRTgxS2t1NWx5ZHIvbkM5?=
 =?utf-8?B?VlhobGFMdXFzYU15Wi96ZzV0Zmo3OHBQb2c5YzgydjExRVd3M2xNWm81QWlB?=
 =?utf-8?B?T2g5OTdBbjdSNHlBb3hOZ2NNSlJuSW45TktmUTVJUHJGSW5sK044WklYRU53?=
 =?utf-8?B?bm5MdGZLMTFtc0VzZ3UxVGpPZ3k0Wm5STmFzTzhZMFpGL005aWFvMzhKQlY3?=
 =?utf-8?B?SzArWjk4Q3ZuN2dXYVlJR1R4clJVcTlwTmYzL2VjaDYxZ2kwRjErQUtqekV1?=
 =?utf-8?B?dzNWV0FhSWtiUXN5YmVZZFZEZWJyUUVTUDhybEZRamxueVIwaStUcDNWN3FQ?=
 =?utf-8?B?Q2RCWWZjVktSbXRNUmhURzdNSHd4dVhZZ2dHWW9ySjVsd01hZlQ5ak5ib1pH?=
 =?utf-8?B?REdrUldoellUcEtCTlhreVJRSFJtY2pSb3ViTXdIWW5vb0VLc3hMY3pWUmlv?=
 =?utf-8?B?Nk5wSzMzRjNPWGZ5RW0zOHc2OTd3TXRZamNtMHh4MGNZa0NSR3VaUEpxRDM3?=
 =?utf-8?B?ZElMcmdtTU93NTAwMnlQQ0huZUhhZk5BNGhJVGJyVWgzN2xmcmlFeGM3M2R2?=
 =?utf-8?B?NjZRMXlnT2dQZTYveXRJYS9CUCs4VnhRWmxCMkZFc04zWHdrU29JaTMyQ0lD?=
 =?utf-8?Q?PE5t4jKnMGiZxipKLWWdU36j4AbkWbnE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0JlaGZLSHM2MnExN0dqaWJIdUVHelBvbFlpUGFMOUtmQ1Z3L2Q5ODdFNWpK?=
 =?utf-8?B?Nnd5MW1vNVE0RlQ5cFdYSS9xZmdCRXVpaUxnbDRtTHJFd0plZUx2czFuUXdY?=
 =?utf-8?B?blI1SE1GV0JFNWdYSWxpeUM5RzV4MTRWZ2UzVVlianRyUDFGWlJ3VStmQW9n?=
 =?utf-8?B?WnRwYTRFSDNGMlAwWHdzSXNXc2ROMjg1NSs0REJ0K3I5UXpIL2hOby83eWdi?=
 =?utf-8?B?TFBZQ1NoYnNiOFhDOHNmajU0bC9UMnVWV1p0RWtPM2orUHc1VFJtQnNrUklB?=
 =?utf-8?B?SzBaczFmRzFDNmVtWmRobUlCWTdBTTNqK1c5YVVjT2FwU3BXWGh6VnlVZUJF?=
 =?utf-8?B?d05RK2paY3RFMkZkWFgvWFhkbWNKQWoxaGJWampBV3NreXBTajgxUjlFbTBj?=
 =?utf-8?B?NFg4a05hc0FwS3BJWms2QXVMdzdNWVo0V282LzZvMDVPNExMdnRpRmlvZFMy?=
 =?utf-8?B?bm1JbHZYN2pmT2RzWXpiNlFlRUNwWUxvOThnMlZpeGZNQW40M3VqZURjSnJB?=
 =?utf-8?B?Q3VPU2tUS05HdWU1K3hVaVQxYmtiZlhqV1U5b2JyV0VwdnZBK2Y0SzVDU1dh?=
 =?utf-8?B?V1Q2K1pWWWRYbGYzUHJoMWR3U01EOHM0YWE4aFlXRFRkdVBBTGdYT2gyS1FV?=
 =?utf-8?B?SFczRXZpcENJRHhsekZYbjhqQ2hKNEhCdkhSdy9xeUJRSnZTRHlYdU43aDQ4?=
 =?utf-8?B?UFZFZnBuWklBa0RPOUIzNkJXVzU2bTBjQ21pbnpIRXJVOHN0QUtqbkZJZEx6?=
 =?utf-8?B?VkV6Q0l5ZnRrZUtsQVpzNEJCdThDdW85Z1R3QUNaZkg2Mys0T05TRUFOZm5q?=
 =?utf-8?B?YTRrekp3ZTVMYXpwNG9KalZaTzBqRUZpK1o3b0dDaFlRbnltTWdkMWc1aHB1?=
 =?utf-8?B?TnUyaXpweTRCTnNUQ2RSQ2EvaEpENlI0aTJuNU1rNWx4b081ZFh3dDJWQ29N?=
 =?utf-8?B?MkhvMHhDazgwb01weHJuSHo3TnRUVXV0ODI0L05JZXBQcExzeldnVkZJemx2?=
 =?utf-8?B?OElQbXR1ZlhMcHZhZlRtMWkvZnc2UEorRUdjaC93RlJnNi92R2NGSUlDaGFS?=
 =?utf-8?B?aHBGTitxOTQyS0lrcEdMcE51dFNOYXpaT0JLZDJqa0hlQVZUdzh5MEhEeFJL?=
 =?utf-8?B?OCt0MnJTWE9VNkpoNnRma0FIS2JKY1N4aFhuZW5lZFRWY0FteFV5NFRrU3NI?=
 =?utf-8?B?cnlDSWptRTNZOW1NRUQwOGR3ZGlBZnIzSkFHdVZvN0tUMmNYV0VjZklmSFpC?=
 =?utf-8?B?Rk9Ya3BtZlBKZ040R2IvYjJubzl1c2ZIUnVQTjI4OERYRktIa1J1a1BMczJM?=
 =?utf-8?B?T0gvTWJacVFCaFJXakZUU0Vhb0VablM0RmFVbjU3QkVhc2p3MWNiMTNvNkM3?=
 =?utf-8?B?TElQTC95eE5xVEtOalI3b3RLcWhLQ0lBOVREVFMxSEhUUzBRMW8wTGdZVHBy?=
 =?utf-8?B?eCtEOEN5bzFKQUZtN1dubUZRSjJTZklUK04xdDFYVjlMK2dzcTlvVkhFeFVv?=
 =?utf-8?B?K3A1b3d0cHdkNHpNeGF6ZkM1U2w5dURFNXNCQm1LYmxZWWtFSkFLMXdCM21z?=
 =?utf-8?B?NEdIeHZ6cnU2TURiNlJPaXZKbUo2clRMYkZ4Zmo0aEtFeVpITFNJOUs1SFlj?=
 =?utf-8?B?MnlGNWxlWjliOFZkVkNQODV1ay9DRFpVVVdkN1c1Vml6cm51emw5QitxdDM5?=
 =?utf-8?B?d3Q2eisrR1NKcHcwU013WXd4TXFoTXFMUkRyU1kxRlRFaCtrelQwVnJrRG0x?=
 =?utf-8?B?ZkZGcVhIS0lRbUdJQ1ZDYmtFK2N3UTg4VG9WS2FOL3R4UVN2ZFltMEFydENF?=
 =?utf-8?B?Y3ZpVGxhVTMyRHZHLzVkMU9wdHJwaWRMUUI3aTViYSs1SmZFYUhSU2N3V1RM?=
 =?utf-8?B?WFc1MFlVTUQ5S2dvSVFqRlN5NS9Eemx6d0IxRzhBU3dIOTNlQXJDZzZqZVRt?=
 =?utf-8?B?S3V3M1pyWURGZEpXQTVUOWhIdW9vaEtQMjgzcG5MckdlMHFJZ3pBYUtrMVpz?=
 =?utf-8?B?OThNYm9mMXhMNno0U3ZobGVXY01nMVlVcWtsc3lObUMzME43bHF0UDZ4Tnk3?=
 =?utf-8?B?K1hNdDZLSEZXL0RQVHVVUlJWRG9iYlpOMzhHbmVpU1JmeDNIVXBNZVFveUNB?=
 =?utf-8?B?eTZVdXZWOC9LQ0lQcTNnRyt4Y2NOd3hMS3RLSk1sZGtObk0rMGY4dmV5aGtL?=
 =?utf-8?B?T3c9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a566939-a154-437b-edae-08de11939886
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 17:51:15.2299 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W9KeTtlWUGt2fOXgf6jzlgLXJ9fe9Fpl0ZPKTB9QJvmLzIhdX5vTtH+qURL97+kr5xs+gGV2Y0l3e57v0UG3zQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8848
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



On 10/22/2025 2:25 AM, Alexandre Courbot wrote:
> On Tue Oct 21, 2025 at 3:55 AM JST, Joel Fernandes wrote:
>> To support the usecase where we read a register and write to another
>> with identical bit layout, add support to convert bitfield to underlying type.
>>
>> Another way to do this, is to read individual fields, on the caller
>> side, and write to the destination fields, but that is both cumbersome
>> and error-prone as new bits added in hardware may be missed.
> 
> Shouldn't the title be "Add support to convert bitfield FROM underlying
> type"? Since this adds a `From<storage> for Bitfield`.
> 

Good catch, I will fix the title for next posting.

thanks,

 - Joel
