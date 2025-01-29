Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDABCA225EA
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 22:43:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05ABF10E16F;
	Wed, 29 Jan 2025 21:43:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="JRUuLpvJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2081.outbound.protection.outlook.com [40.107.96.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7893910E16F;
 Wed, 29 Jan 2025 21:43:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l/Y3ozbiHXo06gnlgQYCRD5KoWnyCjilBIq762rJnj/qlO40G5AU1oyAdpkpZzyOrDytFk4Xqz/8mhTI1IJeGBZpgc1eRh8+/Z5tSi/gvztE0VM75s12US7wD0lyIiH2sQVDxFx6jX0J7C/7KEPgwKo/6Db/XgHX8woFAoz+YZO7t4iypjV3GjLHt/PUD0BxjwEUC5eZqITOlB9VDdTtZRkeoXL1Q5AtEZqaIBh9aO9whtuPz1Nif+jdM6EIqAPknZn+BygALNinRYPz4eT4ZaShfvJ1ZJt5gFSyt9kJP6Z8MWUS8H9dUxnVgWeO1okn8hT5J/f1ml5C3rFVZMLYBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y+xm6bZ4u2WVBXmjdGFsWMI8eKqdH839TUVOVN7HUSc=;
 b=cG5m9e6E98n2u+3jXAQE4iGajDTnYRVXouIHRmO0qBq5lgCX8BwcZcJNAGDs5LO7b/XfeCebWeK1RX/qp1/hh32EOE5n7YHiBFCmHRIjchtMObBAV3oqb3+o5AeBT95+/zN6Ge6fxydHL6gp4Ww78rD3kmw7/eJizQHBUqi9zMlPU4BnrdfRmpUsKSrYb7HltxOdcesK1AjeUmLR1az2j1r0VvRsN1fHXXEKdhRpALkByPNLj5Alk369MJeIfPCMsEWA+rvQxlxAT8lkyVAv0V8fKtN/4NjXXIxGpC8fWuxn89yrZN1T9YMTv2hlOUpozHAD/a3EBUh2rIC7vhijIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y+xm6bZ4u2WVBXmjdGFsWMI8eKqdH839TUVOVN7HUSc=;
 b=JRUuLpvJDBbNQd+IpiCs/0NwO8pdUvRNBalOO7XgR2Gq1/112IVZE2YfFAk/n16Xwq1ucAPJxC3YUqfTheYOfDTEwX+rkTThwrSLJLwl4XJnvdbWEXhEtjXbcRDLo8+KRxy7iuJQTb4k3k3Ix0+edeVALMf+ncGknvRjsNouQ8qkhq30/aAdxM95ov2pwZRQwyoNrxK1jIWWtAX5WY6WPRyH3jHdOF9ST5lQ1/0LU9UfOjuuJawquZyC7aaoqIMuAccCrZ6UBJcGyu8mUB4uQYfJobCQDEJqocwVWX8PVtdsImoRylwUP0USRJQHfjJ3zeh13/3ulU6ZGjiEd7g0SQ==
Received: from IA1P220CA0024.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:464::12)
 by PH7PR12MB8055.namprd12.prod.outlook.com (2603:10b6:510:268::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.23; Wed, 29 Jan
 2025 21:42:59 +0000
Received: from BL02EPF00029929.namprd02.prod.outlook.com
 (2603:10b6:208:464:cafe::76) by IA1P220CA0024.outlook.office365.com
 (2603:10b6:208:464::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.17 via Frontend Transport; Wed,
 29 Jan 2025 21:42:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF00029929.mail.protection.outlook.com (10.167.249.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.14 via Frontend Transport; Wed, 29 Jan 2025 21:42:58 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 29 Jan
 2025 13:42:44 -0800
Received: from [10.110.48.28] (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 29 Jan
 2025 13:42:43 -0800
Message-ID: <24e88fec-65b5-47ad-8833-67257f86fde5@nvidia.com>
Date: Wed, 29 Jan 2025 13:42:41 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 01/12] mm/gup: reject FOLL_SPLIT_PMD with hugetlb VMAs
To: David Hildenbrand <david@redhat.com>, <linux-kernel@vger.kernel.org>
CC: <linux-doc@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-mm@kvack.org>, <nouveau@lists.freedesktop.org>, Andrew Morton
 <akpm@linux-foundation.org>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?=
 <jglisse@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Alex Shi
 <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, Karol Herbst
 <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, Danilo Krummrich
 <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, "Lorenzo
 Stoakes" <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>,
 "Jann Horn" <jannh@google.com>, Pasha Tatashin <pasha.tatashin@soleen.com>,
 Peter Xu <peterx@redhat.com>, Alistair Popple <apopple@nvidia.com>, Jason
 Gunthorpe <jgg@nvidia.com>, <stable@vger.kernel.org>
References: <20250129115411.2077152-1-david@redhat.com>
 <20250129115411.2077152-2-david@redhat.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20250129115411.2077152-2-david@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00029929:EE_|PH7PR12MB8055:EE_
X-MS-Office365-Filtering-Correlation-Id: 96a907b1-641c-4b57-74d7-08dd40ade62f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SURZSXBVanNRMlNZNlJ5T2FvbGF5OWl5bTJXa0pMTzNsSXZMMDBlcEllbng0?=
 =?utf-8?B?Z1VWTzFseVNjUVhyNXU1ck9PdFBYdkI2dEJLQTIrbkEwRmM4UVgyRS9aTkpG?=
 =?utf-8?B?TFVzOWFxbG5aN2dWeVNxcU9RL29jVVFtZWc5VGxCSDJSTTN3WTU1TFlmOFBa?=
 =?utf-8?B?ajdqVzU2RktBU1NyY3NCUHJBQjdQNmdURmw1SXN5ZlNZUlNuN0xXTWZoMDl5?=
 =?utf-8?B?WTl3bVR0Rlg4OEc0L2U5SHA2OC83L0gwY2lzbDgwemhsRzhhelR1VGsyK2Ey?=
 =?utf-8?B?OWF1dmFyUFRnWFNzSFFCbU1MWmQrdTFXUVA3eHBicVpaZ28zeGt0WDBBS01M?=
 =?utf-8?B?T2dYNVBSWmpETm9IUDdJMnRpbmFIT2kyZ2dPRytBVkZiMXNqcVVaaCttMDho?=
 =?utf-8?B?M2ZUM2FvVW0xR2ZtTVZnNVh2NG8zR2JjM1VRZkhRUnoxc1BDMy8yL1VhZllJ?=
 =?utf-8?B?RXF0YUxVWjFNaGhzMVNVMUFhT3NlWU9SOWFIWnNEaXpXWjNIWFNNa0ZHbEpL?=
 =?utf-8?B?cjBsOXNwOW9BbkMxZnFybkNDQmhLTEZEOWtIVWtNclJMSkFObnVpaDNRY2l6?=
 =?utf-8?B?UzVObmdCRlZ0eThKNGZyaDN2UVhCdzhPR1ozVFBDekZsTXMveXgxb1hpMHFO?=
 =?utf-8?B?cHE5bmtKK0NwQUdFOGNER2x2RjFtazB0dnRrZWhIZWZzUkdPODBkemJSM3Zj?=
 =?utf-8?B?THBsNWJBeTYwVzc3eHRodHprbEI4WEFZQzRTUWdwMzZmamRlbDdoVFZrTEhy?=
 =?utf-8?B?V3dHV2M5ZTNrUHViNFdZZTBia1RDSG93bUVVcElTalhwVllDVGkzWXNtZHZG?=
 =?utf-8?B?TlBGM09hbHM0eVAwcm81VXVsMW0yd0t5Y0lNNkpOclRZREQ4aHVxbnZUQlpE?=
 =?utf-8?B?d0dYcFY5ZHpmVWtnOGwwYjR2ZVlZL2R5ZEhWVGRJTTVqUFNxVjNKaXQ2Z2pL?=
 =?utf-8?B?Tzc5Wk1EeTAxaGpRNm5vb0Q4MXF0Y0JheFk1QVdCbzluTUxjU3RXNWVxYkxZ?=
 =?utf-8?B?M0hucEw0bERNMUU3MU1iRlVLTDhVaFlOdWc4em9SajloRVZSdkw5Q0NPb25K?=
 =?utf-8?B?ek5kcldLNnhEVDV5U1RCeWxRUGxYMjd2d0lYRFZ1aXprc2dUNE10R0ZLbmFh?=
 =?utf-8?B?dGg4S3dFb2hXd0pHZ1NWTFduampIRDdneXV2YlIxQlRPdmlsZGFkZkZKc1Ax?=
 =?utf-8?B?UTRVTzBlNlovbWNiM3o0V1RlK0VYS1ord2FmYUh5c1dCb3lDSGU5dDArNFhz?=
 =?utf-8?B?djBreUxlNTlXVWpnU1cwQ0UzOGQwUzk4clR6Ry9wUnRqRit3UHhCU2FuZHlm?=
 =?utf-8?B?UkExdVptVEpsUVk1WWc1SlF6VVhjTTNiNWh2YnN2UE14WWRYQjU0ZVcxdm5C?=
 =?utf-8?B?b2g5c3VXcU15QkhwQVJPVEhuUU0vTWlkUzNXaHQ5UXlsMkZzUkY3S1c5L2p3?=
 =?utf-8?B?Tmt4LzdqRFYwenVrOWxVNFNtWGlvZEFVbHk1dXdRa3h4ZUd4Y2UrRjFhTkNJ?=
 =?utf-8?B?VVV1bGJ0dnZjRnJxZkt3TGJ2VFI5bzVZNXMzV2hZQjhXN3loNXNOeERFcStp?=
 =?utf-8?B?NHRlOE0yRFU5TnRLL0RoTHBPTWt3SkdxWCtVRDc5NTh4L0pzSnV1S3Y0OS92?=
 =?utf-8?B?b3RUOWF1SkpxcjRiMHg3QTE5elZwWE9pQlRFT2RLK28weW5CTnlIejkxaFk2?=
 =?utf-8?B?SGVzTW9CY3J4S0gvYlU0a1BLSG1ENHVnNjZDaXhrKzd4YkgvNEJnb1FXNFR1?=
 =?utf-8?B?SDBCcmZLMktpUXZnaDB5TkljejBBTmhyMlhCN3JWZy9scTlUUlBUQlRiWmhR?=
 =?utf-8?B?UUdqR2VwRTlCNzRQeGZjcm1yZ1l6Wm1JdW9Wci9wYzJaRm1qWnRPTmE2VXdT?=
 =?utf-8?B?cUhoTHdSdHVoUlA4alNvb29EYzFHY2tBdmYvOXNkRCtLNWlqdVBrRTNEaW93?=
 =?utf-8?B?ZXRIWlUrRkwwbnlhSDA3MG9EYkR1SjFZZlZoVGtRU0cvdzJ2UlhCZU9uUHVX?=
 =?utf-8?Q?l/sAhJxrTdvB+PJU/25XUiCUw6AQog=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2025 21:42:58.9836 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96a907b1-641c-4b57-74d7-08dd40ade62f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00029929.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8055
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

On 1/29/25 3:53 AM, David Hildenbrand wrote:
> We only have two FOLL_SPLIT_PMD users. While uprobe refuses hugetlb
> early, make_device_exclusive_range() can end up getting called on
> hugetlb VMAs.
> 
> Right now, this means that with a PMD-sized hugetlb page, we can end
> up calling split_huge_pmd(), because pmd_trans_huge() also succeeds
> with hugetlb PMDs.
> 
> For example, using a modified hmm-test selftest one can trigger:
> 
> [  207.017134][T14945] ------------[ cut here ]------------
> [  207.018614][T14945] kernel BUG at mm/page_table_check.c:87!
> [  207.019716][T14945] Oops: invalid opcode: 0000 [#1] PREEMPT SMP KASAN NOPTI
> [  207.021072][T14945] CPU: 3 UID: 0 PID: ...
> [  207.023036][T14945] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-2.fc40 04/01/2014
> [  207.024834][T14945] RIP: 0010:page_table_check_clear.part.0+0x488/0x510
> [  207.026128][T14945] Code: ...
> [  207.029965][T14945] RSP: 0018:ffffc9000cb8f348 EFLAGS: 00010293
> [  207.031139][T14945] RAX: 0000000000000000 RBX: 00000000ffffffff RCX: ffffffff8249a0cd
> [  207.032649][T14945] RDX: ffff88811e883c80 RSI: ffffffff8249a357 RDI: ffff88811e883c80
> [  207.034183][T14945] RBP: ffff888105c0a050 R08: 0000000000000005 R09: 0000000000000000
> [  207.035688][T14945] R10: 00000000ffffffff R11: 0000000000000003 R12: 0000000000000001
> [  207.037203][T14945] R13: 0000000000000200 R14: 0000000000000001 R15: dffffc0000000000
> [  207.038711][T14945] FS:  00007f2783275740(0000) GS:ffff8881f4980000(0000) knlGS:0000000000000000
> [  207.040407][T14945] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  207.041660][T14945] CR2: 00007f2782c00000 CR3: 0000000132356000 CR4: 0000000000750ef0
> [  207.043196][T14945] PKRU: 55555554
> [  207.043880][T14945] Call Trace:
> [  207.044506][T14945]  <TASK>
> [  207.045086][T14945]  ? __die+0x51/0x92
> [  207.045864][T14945]  ? die+0x29/0x50
> [  207.046596][T14945]  ? do_trap+0x250/0x320
> [  207.047430][T14945]  ? do_error_trap+0xe7/0x220
> [  207.048346][T14945]  ? page_table_check_clear.part.0+0x488/0x510
> [  207.049535][T14945]  ? handle_invalid_op+0x34/0x40
> [  207.050494][T14945]  ? page_table_check_clear.part.0+0x488/0x510
> [  207.051681][T14945]  ? exc_invalid_op+0x2e/0x50
> [  207.052589][T14945]  ? asm_exc_invalid_op+0x1a/0x20
> [  207.053596][T14945]  ? page_table_check_clear.part.0+0x1fd/0x510
> [  207.054790][T14945]  ? page_table_check_clear.part.0+0x487/0x510
> [  207.055993][T14945]  ? page_table_check_clear.part.0+0x488/0x510
> [  207.057195][T14945]  ? page_table_check_clear.part.0+0x487/0x510
> [  207.058384][T14945]  __page_table_check_pmd_clear+0x34b/0x5a0
> [  207.059524][T14945]  ? __pfx___page_table_check_pmd_clear+0x10/0x10
> [  207.060775][T14945]  ? __pfx___mutex_unlock_slowpath+0x10/0x10
> [  207.061940][T14945]  ? __pfx___lock_acquire+0x10/0x10
> [  207.062967][T14945]  pmdp_huge_clear_flush+0x279/0x360
> [  207.064024][T14945]  split_huge_pmd_locked+0x82b/0x3750
> ...
> 
> Before commit 9cb28da54643 ("mm/gup: handle hugetlb in the generic
> follow_page_mask code"), we would have ignored the flag; instead, let's

...and so after that commit (which doesn't touch FOLL_SPLIT_PMD, we no
longer ignore the flag? At a first look at that commit, I don't quite
understand the connection, can you clarify just a bit for me?

> simply refuse the combination completely in check_vma_flags(): the
> caller is likely not prepared to handle any hugetlb folios.

Yes.

> 
> We'll teach make_device_exclusive_range() separately to ignore any hugetlb
> folios as a future-proof safety net.
> 
> Fixes: 9cb28da54643 ("mm/gup: handle hugetlb in the generic follow_page_mask code")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>   mm/gup.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/mm/gup.c b/mm/gup.c
> index 3883b307780e..61e751baf862 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -1283,6 +1283,9 @@ static int check_vma_flags(struct vm_area_struct *vma, unsigned long gup_flags)
>   	if ((gup_flags & FOLL_LONGTERM) && vma_is_fsdax(vma))
>   		return -EOPNOTSUPP;
>   
> +	if ((gup_flags & FOLL_SPLIT_PMD) && is_vm_hugetlb_page(vma))
> +		return -EOPNOTSUPP;
> +

This seems correct by inspection, as one cannot split a hugetlbfs page, so:

Reviewed-by: John Hubbard <jhubbard@nvidia.com>


thanks,
-- 
John Hubbard

>   	if (vma_is_secretmem(vma))
>   		return -EFAULT;
>   


