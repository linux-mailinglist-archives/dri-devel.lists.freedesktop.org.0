Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9854A228A9
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 06:46:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44F4710E8E7;
	Thu, 30 Jan 2025 05:46:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="UemLSSkA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2084.outbound.protection.outlook.com [40.107.223.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFC6710E8E3;
 Thu, 30 Jan 2025 05:46:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BT9tyAVARc7z/yHnKbLMnIDiHYtuD4rFyUmzXwZhLL4QXQMPKDBrdgJ5PaKRTXt9x8TFhy539CZdK54ktfbiSzhdqIW40MCUZtHAI94UQvyjNvpJ7vKcHtqGEhUvXGvtVFD91ynPCoZ8iMBTFa5CUMf/ArkP6AJU1uuTimH79CGWR2ylXbszRuQwIru+siwH65W0IMe1Yerg/NHidcTwIU2imohLTE36I+NMeVXmlnDUlsx0g5VihEyy0tzacVib0qPhcyv7wIff1DR4HKj2feRDmjWKBYwDnUgvILUZz+OGT2qBnZnWP1cLEhbofcrQ1fAjntNn+FiQeK7maPZZvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p3FTj8q6llI27MN6AYtzXFxHUMMnvCsgyXqr0zFAaRQ=;
 b=E4zELsq+/HVUE+pgd2Wd5dWj9S5W4sZV/xRQbiyoIXKvmV8sTt2ymO9lK3saRIebEEk+6JeioFaoYiuZcNXC90bSf+HBRHI4dYfq8UFkXB5y0CKyopLWUyVNRwT6HIOwCuYI7F7aBONL0S8J974Y/pKTV8nLN2N3HXJ0DKsB7lfIJAb0drN0JqnIJUb51pwGFzWa7/s23gZRPaLGLfbNFw7ukKMEFFap982Y6trANMhOoRYp+4N4yO3/EELJxxnzJ3N5UkvJaZFlADBZ5btrrWcCqFOF8zHwd3Ir885JPPR2Dl3vLWA9YnuxpBozgR2pf6wuT9AIvsDAewsLDTdznQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p3FTj8q6llI27MN6AYtzXFxHUMMnvCsgyXqr0zFAaRQ=;
 b=UemLSSkAWCj6A0PJbCr3ZglALV+qxWAHGF6T1PG36M1Rj2oRXysxwGP2r++JZwkBmKB4aWQpdYzzXvrFJhmVKijYOGjttXhOCayfAgMLDyBIS2H5V+XfPlnDo8MRoThqhtKMc9clsuaO4gu62fWJDS/YcISqscmbq/h4itb/zmt1Sy2ErV7E7lmBtF5rgBs6UTMaqgKDs9XUFthWY4041efFgn/CbR8xyH1hngzKMb80IOJ0SBm0wEiP4bL2hGQLShKVi38iQ7MJs1GJEdsLqeeCZmsqtZIs7Zg2cb3vO3ijUgC5SMIccMBnZYOXMUSZvLFrRPlyRdLmPhlGxMv0xw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 IA1PR12MB7520.namprd12.prod.outlook.com (2603:10b6:208:42f::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.18; Thu, 30 Jan 2025 05:46:17 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%7]) with mapi id 15.20.8398.017; Thu, 30 Jan 2025
 05:46:17 +0000
Date: Thu, 30 Jan 2025 16:46:10 +1100
From: Alistair Popple <apopple@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 nouveau@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>, 
 Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, 
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>,
 Jann Horn <jannh@google.com>, 
 Pasha Tatashin <pasha.tatashin@soleen.com>, Peter Xu <peterx@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>, stable@vger.kernel.org
Subject: Re: [PATCH v1 01/12] mm/gup: reject FOLL_SPLIT_PMD with hugetlb VMAs
Message-ID: <ffuio46xoqweudqg7qxnjoufhodwdy2sdcmbet2ddsoagutxzi@sw26penoyceu>
References: <20250129115411.2077152-1-david@redhat.com>
 <20250129115411.2077152-2-david@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250129115411.2077152-2-david@redhat.com>
X-ClientProxiedBy: SYCPR01CA0021.ausprd01.prod.outlook.com
 (2603:10c6:10:31::33) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|IA1PR12MB7520:EE_
X-MS-Office365-Filtering-Correlation-Id: fdd6c9c5-56d5-4803-c4ea-08dd40f16a28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?58brCuYcmbiRjN6fdduoRzaqIcczaDNLo6levqOBxHg0/ebseWJByzW7OyAM?=
 =?us-ascii?Q?DBy9rcLEe+Ih0/cK6Okcrmt+TVzhe3sKV4y/F/mOIbF0vY9kbQuk3qY9v0eK?=
 =?us-ascii?Q?bAE9D7v8CYR9PNy0Fa2rxJdt1DhhXxYplSIvidp8+yJyoEqWp2SwvtmNzgRI?=
 =?us-ascii?Q?2XxcCgAA7zAchkzQa2V8k84nQf5Nq9NXy2avLTzguWbJe9t2VLzbkOPoCrjA?=
 =?us-ascii?Q?mtgvdZFvM7H3n9MTRXphWsgvALygfZiFVCRqdh/774AzjMFPMG7c+8u6U4pz?=
 =?us-ascii?Q?H/NhTNbFc4S302Q3GWi4F4g/hON1JfQkg6Yima3SWLIX9l//oAfhvlIvFJEe?=
 =?us-ascii?Q?i1WSvmXxobV511hyfGjgzlvIgwyfEI0WfCv3n9iVXKlQ8oGVwpnDnPdYaLvH?=
 =?us-ascii?Q?Bo9tHFEfJwqZLk/yBydayNW8P1y7P5IOj+dg380+MVe+a8x4R4ZyvQp8U1ka?=
 =?us-ascii?Q?U5eT5hGqznqAyi8jIdE56eZvzBirpbswxoeMscnOWLlePFMu3n38jp10SNLX?=
 =?us-ascii?Q?iVFfd1aJ3tywmupomr4zHzVhaa4BMJhjsK8Uy6KFzPW968Jp1gjLEnyv75wj?=
 =?us-ascii?Q?ldJAWsSsdDZW7HxMpgn+avDQG3RCIzGHknAhLuC1zEl9/JJz3u6a1yvlHTnI?=
 =?us-ascii?Q?MiM19DmCFsUNUDT0URSw3C1UWYm9eL4XRthdgln2yJwzjRKO24aKiEEyJpM7?=
 =?us-ascii?Q?ybnSbc6KnHO1/IIwRSf69VzMEQJM/DwhfMImABZeKleroipfEXknxQayH3Rx?=
 =?us-ascii?Q?c1wsmJpnMXLnhq1mLfC043pknU1pMLNnib/Zf7MaFO9DgdD5YC9HIGzOxu/J?=
 =?us-ascii?Q?X8kNILAJVdDd1o+pnoUmj34UGnafy7XppnjZZtCqaI1BqMUsY7iHEgQLM4Z+?=
 =?us-ascii?Q?udb85VH3KDaa3JU8ud/NaMSyiTe0hWp/cbaTvMZmCIPZ7omPxRpMcB6LCzuB?=
 =?us-ascii?Q?qinAHpekZn7SIaQLg035cqp+zt5nAVu/y23IzLVPl2h5fWvcZ1Zml+HzGf4U?=
 =?us-ascii?Q?EQV7V/em+yOgekXkwQ5oYCgflQyeWQrGyOw7sZXI8V9bxLCx/XZ+VuThX4ym?=
 =?us-ascii?Q?GFFCU8sBoU49tWdB3Y7H1cUm0jXocfBHv8ncnHBU0W7JcxPkyl4qpQa0AGSI?=
 =?us-ascii?Q?Z47uIeI1rUHhry/DUE7dt36a0OxmLBB71XBcxtC2tXUsh7r/1WmbrXYtoH48?=
 =?us-ascii?Q?nYx9Sva3HrIxMWR22bXq8pn8+SeQcJT066LQAEf3JlI3xj2rgoz7MDjzcwql?=
 =?us-ascii?Q?jyII8VbkeUJ1ugmu85McPtzfdeZc+dVsghml8dDSjFy8Uv3mP7eVGew0xMqE?=
 =?us-ascii?Q?rzMJ0Tc1+5dFYfd9v/MuXZLAKcCj0Cw8Lh1yq+0LDejPP6Ls2fLlLylw3Q5b?=
 =?us-ascii?Q?K6wA89GRcd8a+b6QYqPHYIf/cTtR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?V1u4KQILwUMrqZMcl6XItqCX5Bm+tEGurIa+eUV9WdNnKu8bf3xlM88J+yUs?=
 =?us-ascii?Q?OlhPkjU9O6K3qBGjV+HJ0183N8l6nZrxqjZIuB58rhXSgGyoMwsPIZ7K8diA?=
 =?us-ascii?Q?oJFkxZKfm2zNrflGOhegp28PJgh0UwjOpeTL8fgvU+8BkiawPV6/5Gtxy/nG?=
 =?us-ascii?Q?wnTxAh/eBj2y8YjnwnB2diGJgrHEf3uPoGUBXxNSI/pAgvwna4vTj1oa8x/L?=
 =?us-ascii?Q?sWO6wPIutdzDADfEwp4wJygIb0SXAzpGG1LI7doymD/RZjWLaarNk896swP5?=
 =?us-ascii?Q?p+WCpDclF97LaFGSx7j+aGg1RLZl7SwUicS50AQCBsNSfyf0UohiDfMwCYYA?=
 =?us-ascii?Q?VTtgxTV4l/IMPfdJAfxk2F3pDz8YbTgKvLISsrGojXyCPR9ZxgzgA1hPs0Ey?=
 =?us-ascii?Q?LPUeBOQiCWQC44Kzf3jiXswEP60mUehOYEfBfaLw276PiTZyj0yNSdkCemqo?=
 =?us-ascii?Q?rar6h5pCF0AnOrpa4hxY+okelCZm/r13xGIXaT97zK0xCiYg5MEu7Vkcmldr?=
 =?us-ascii?Q?0GQeBHIVCGldKnM7CktvskKzMnkuQ8xH+WsoRZ/1zdNDuyk/kpC7zNuT9ZTJ?=
 =?us-ascii?Q?UuaO2iAXgMxsRoJmITLQPEEXWlwdVqt1uurQWc4tZun6Zny9vxinWPGWrjJE?=
 =?us-ascii?Q?t+66ZoDD+g7QlQehaCnoytxJAAuhftmbg3nMczAZk5WP26f4fLl0Yk7CEcxS?=
 =?us-ascii?Q?p6YC3cdn61E+wKlhmlbj794JcrJKCnnE4Tiwi3tPGd2BTFrhrnSvWCLIhqAu?=
 =?us-ascii?Q?XYW7TytA2tZg8Ky3L3O1ABoSIOlayKePxXlQ5O7En4uWcULoedkOeUHOxvkO?=
 =?us-ascii?Q?TIf8CcyjzBUX/zOE0VYtP3faSDddvz2W0Rcwf/5gNaEgI6UvmTf5jTezAPW4?=
 =?us-ascii?Q?3+haMnS7n9eulI/cFRmaSG+afvE9Ms0W7OQvdTY48u8g6V8WA5Wg6iZ2F7eV?=
 =?us-ascii?Q?mIyZMifA54KSo6IGKznLBnXAZE2UmTSA8NH1CPd0SUQBapwzjKs62PE96/1N?=
 =?us-ascii?Q?u7foguerRuRvzG9aYM2k1fUyUaKAChWiPTTMzhpRJ9T2fYHKXGrnChEpB0Qc?=
 =?us-ascii?Q?UsFJa5BNj+paTD0UtOX++lpmS/+8obmWlC2/WOMLVn9w+mafFnyNUC3nN6dn?=
 =?us-ascii?Q?se5KLTrbm6mg7c/42IvdhPgz2UUVweC6+/Yw7vs7u+q5bH5iULW0jSbfaq5y?=
 =?us-ascii?Q?h4CfgH+ChDtRb7/UlandO6bSaTE5JmndKpdvAizgw5aZyc53JYavw/iYJak9?=
 =?us-ascii?Q?VnTwCfvB+n6OlgHHoqSIlgj3hIVO3Jq7MHhUDfTDGqQj3IfKjH8dFC1xhxH/?=
 =?us-ascii?Q?QXDtICXX83CshPgfm9Cg6SChi2my7NvYK2mM2lKRnpMQofv65b2oHeuxP97Y?=
 =?us-ascii?Q?ACiP4dSPIeko7+FPHQn2OdiniUdPYLVOXu8GlwyKqFbOJ4qLw60S96ybxqKm?=
 =?us-ascii?Q?rSvSwGltSaPSgXim+Yn0PeX9oWXLBb+edxEcGcmWx96gFp7XZukF9UlG3lgO?=
 =?us-ascii?Q?3XGkYrAgR+qsPzJ12QH120sUAjqqjQ2nyZuM/jlZP7UjA6FzNVMdjqIW1Qs2?=
 =?us-ascii?Q?lLHX+KLtlGt5z7Yoy65F1FMnmKV2h1YHap9Si8pR?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdd6c9c5-56d5-4803-c4ea-08dd40f16a28
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 05:46:17.1804 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J770+0ogY4tGLvt4IERXP3cNX7AmXDg0N1eTwwzb0ZFY8P/yogpQim3bQEePIaGpHN/cOTEesDg5CBVKg41juA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7520
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

On Wed, Jan 29, 2025 at 12:53:59PM +0100, David Hildenbrand wrote:
> We only have two FOLL_SPLIT_PMD users. While uprobe refuses hugetlb
> early, make_device_exclusive_range() can end up getting called on
> hugetlb VMAs.
> 
> Right now, this means that with a PMD-sized hugetlb page, we can end
> up calling split_huge_pmd(), because pmd_trans_huge() also succeeds
> with hugetlb PMDs.
> 
> For example, using a modified hmm-test selftest one can trigger:

I haven't explicitly tested this with nouveau but I can't see anything that
would prevent this being called on a hugetlb vma there either.

Reviewed-by: Alistair Popple <apopple@nvidia.com>

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
> simply refuse the combination completely in check_vma_flags(): the
> caller is likely not prepared to handle any hugetlb folios.
> 
> We'll teach make_device_exclusive_range() separately to ignore any hugetlb
> folios as a future-proof safety net.
> 
> Fixes: 9cb28da54643 ("mm/gup: handle hugetlb in the generic follow_page_mask code")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  mm/gup.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/mm/gup.c b/mm/gup.c
> index 3883b307780e..61e751baf862 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -1283,6 +1283,9 @@ static int check_vma_flags(struct vm_area_struct *vma, unsigned long gup_flags)
>  	if ((gup_flags & FOLL_LONGTERM) && vma_is_fsdax(vma))
>  		return -EOPNOTSUPP;
>  
> +	if ((gup_flags & FOLL_SPLIT_PMD) && is_vm_hugetlb_page(vma))
> +		return -EOPNOTSUPP;
> +
>  	if (vma_is_secretmem(vma))
>  		return -EFAULT;
>  
> -- 
> 2.48.1
> 
