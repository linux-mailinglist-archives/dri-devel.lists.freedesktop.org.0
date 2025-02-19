Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8DBA3B0F5
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 06:37:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D285410E229;
	Wed, 19 Feb 2025 05:37:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="j/Gpg5x3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2052.outbound.protection.outlook.com [40.107.223.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6294C10E459;
 Wed, 19 Feb 2025 05:37:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tijpaXJnDUEgniMCQjgRwjVNX3pjkQuMeetA95FVo8sD3Qd8U76X+mY/JZYs6mP6HVrTKea8XS/9yQ8Yzr4vGFUDJQwdrjgtwpGFoHz0//LUiogXooSh3SxbLzL+Voz+gQE0gb7qA0jMfjgs/T5/zsZGSv5g/hlPx8SltREBxGC1ICuLoug23H22zVNEDVmIAU9MpqX0o2AE0ngyZBra2J187j4wD8Qegd8Bi53t5fcBDH08GwLbmeRE2xoLw1w55GnVtxMDVScs7ApnNuNpMUonIEVzDrhAy1SZ213AIqvO4DxDddMZfTSUjG47D3nK4nrNpDr0g9KtN69nMU1Slg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ep3emZ98GVhzdyr5OCDIEc8gEnOng7IYvgcTq4yTo3U=;
 b=mMQt1Xdy0z3QwJQIBLJsxCXnvVQX6JXzVAJo2ASZY2S8Sl0si8kRhRRSjXGUW615PkKYGghGERLCdZOmJlef6Tx2dH8k/00nNaytd1DDj7XSjYwUpsbp/Mrh3ec4/X6BKwpifqzVZghuU7PdmL11iyyfvABpBtP2P3+nkIfFwUSYnFVc3ZfVhrB9aW6nqpE2WYo87R64G3K2EKat+yBOrs0mV2Hlgjiqog5H2vrqIAKxfr9wQkIa4Umrelz29Fukd9lbdgF+kIaI7NaGcOAL2/Aw2HtFCVtbRL/gNoeBB8vISkuNsE0hivcqkrWuCR5lzTRY+J+GLbo9RBE9Elppqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ep3emZ98GVhzdyr5OCDIEc8gEnOng7IYvgcTq4yTo3U=;
 b=j/Gpg5x3TIclO//YpgOfwVMpRqPpKVRiXXs+gsveOCSMw60KTmXxYoo5LiGZr+tLs3AKEFI+d/h+LKEJCLxcbfI+412apYJLKCMaOuFAtVPC+P5aTTMxqSvZGfYbpN25n5LZSdXs7f22kfyGNLmhYIxaAHdnM+bAo00TMGdFcmn/RJGuNRrMHQVO7RqKuta+U3mwKLNTYD8qvu2myPhRt0zxZO9OL4JGAKeJ9vZFGowDm3WkY1XafB3Q1BvLJE9auLJpRbCLyD8pYnb1bIOzWJcrgQHi1DEmnPPyTTahJ5MzLu5DdbTKmVA5YHT0xc7pNGMB0AJY0Q/9bafmVB0hFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 DS0PR12MB7704.namprd12.prod.outlook.com (2603:10b6:8:138::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8445.19; Wed, 19 Feb 2025 05:36:59 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%7]) with mapi id 15.20.8445.017; Wed, 19 Feb 2025
 05:36:59 +0000
Date: Wed, 19 Feb 2025 16:36:54 +1100
From: Alistair Popple <apopple@nvidia.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 himal.prasad.ghimiray@intel.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, 
 simona.vetter@ffwll.ch, felix.kuehling@amd.com, dakr@kernel.org
Subject: Re: [PATCH v5 03/32] mm/migrate: Trylock device page in do_swap_page
Message-ID: <roahnchztct5tff3elxhzssei537m5hijmq2zp2t2kbsyetwy2@e3b4msq4bbdr>
References: <20250213021112.1228481-1-matthew.brost@intel.com>
 <20250213021112.1228481-4-matthew.brost@intel.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250213021112.1228481-4-matthew.brost@intel.com>
X-ClientProxiedBy: SYBPR01CA0162.ausprd01.prod.outlook.com
 (2603:10c6:10:d::30) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|DS0PR12MB7704:EE_
X-MS-Office365-Filtering-Correlation-Id: 10973a13-f0d8-4d67-15c0-08dd50a76de5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?b3zVm6FTUFj3vQ1L3tp03Ku+JotHXrwuRjRSK/bgB9d0mN/yTSRUyRy3gw?=
 =?iso-8859-1?Q?nzNQT4ev+sGGw/OhSBK9YuwvFJCBAJzOQXDOfGO6i15vGe0YV3plzgBYJh?=
 =?iso-8859-1?Q?IEPhChlo3sU0pSV2WND7+sJ4L/IEq6sMkJHewK3FOnfIkVlske9ZwkN2Uw?=
 =?iso-8859-1?Q?yA9CEkQ38ck4D+nYGVG66zpqrwaWwz+/dHySpDP+bOnByN8OQx4w/iyjj8?=
 =?iso-8859-1?Q?vVH8HUeGOTMcOfMD9jPLHMGJlSlQUmBs/dlKuDUHEGHZUZVcmtk4QLzZ3i?=
 =?iso-8859-1?Q?XZy5YYeZmXROcDsObA8C6M7KeIWnrmsrWydDhnIWrdvcPUY4bhEeAaLGl2?=
 =?iso-8859-1?Q?FPcZquETUAEdrS0xbRvh72a6mwEazf2eV32GdAOqkJbtCGyHqtJn4SA/e/?=
 =?iso-8859-1?Q?hBBnn63gT1dP/xaGTEtZ0d1v5qIVJEY77vxaZyfZXwT+E6y20P2s01g+Qc?=
 =?iso-8859-1?Q?L51WaIX/hRkkNWdavOe/lWGnvwditM+a9AStHf2wNYwYvhITTAgGyGTtcU?=
 =?iso-8859-1?Q?W+5uO1/rFlh3ESaHPvHJCBZPzO8QbXdlhAKih5zfNsdHO1IssrI6cjSXDG?=
 =?iso-8859-1?Q?bwS4/GhZAjTtcKIjbVMBsEXRwa5GNdacHqQ3tD/wo3+6YV6lhvJcznv1A3?=
 =?iso-8859-1?Q?S7PP1mgLjkMcf5iIz2+rBJg5LklN/Y/gTSHX+VZ31HZJ4sb5PKzPQWbG1N?=
 =?iso-8859-1?Q?Yw+/deKJ0wD7G1n7W+4riM4mlc1WJVSWINYNTMUburrtjAyT6fukixhv5T?=
 =?iso-8859-1?Q?//IQjvF4yI6Aoda7LemyhpxNKWJRRplooU4h6G8z+9zEVnKQZXvaJzpDk+?=
 =?iso-8859-1?Q?n0Cf3aghXNJJsG0mvQCOqCIE5q/ImlrUq5IcYMb8Dt4fAcxQWtJX4lTs3S?=
 =?iso-8859-1?Q?lU1cL/2mbYL4ga5V1az81Mat2KxgXPzCz58vALug1kvZ5dCNbbofrrwU26?=
 =?iso-8859-1?Q?ktsCfK7aRGCSOqV8A3Kb1bLJL8U7oZIH4OGMchE8Pkp3n9fWHMlvFBFVyd?=
 =?iso-8859-1?Q?3lV9iqZCPEeljtEIlh8QvdBYLQAtsz/xNaBvTMGtXMe+NZBLjX5Io6Wzzb?=
 =?iso-8859-1?Q?OeHVWX8+ch89hl9fhQZhTbcoMQwTMX2fMVItKuI+HjhO4xKrzWOdmkBvt6?=
 =?iso-8859-1?Q?X2td+5ML/HoNS+bxoaB4AIA4jn+r766kJ3KVskfIw/pCsOwOW2cym2wu4g?=
 =?iso-8859-1?Q?yBAxd0132vk2/CQN4tCHxM5N43qbeTcWa4Pnl2fF+h5P8pU1gAeG0iU+gz?=
 =?iso-8859-1?Q?hzGD8rebiM9NER1Sb1BeAB1BoH64q43wPvETOb8gjxnGn0zuns06IkkkYH?=
 =?iso-8859-1?Q?3ZeR+tLU2855mcTh1HrGfiv4bB3Ia2ELcyn2wjeHFWouGSjizFq9FBiT0c?=
 =?iso-8859-1?Q?rnsSWq3m97vx4umWzde0Cval0Cj5WsCUQXjKmipC8IwF4YHD56awy+6Akf?=
 =?iso-8859-1?Q?ayX5ZQb4KCZM5Vja?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?BkHlJH88hoO4t8YKSjLIik9u7X+lyNlk824VarlB54qR0/TmepYiptpKK3?=
 =?iso-8859-1?Q?trMj489T7NP/k0FI0UmQqFYrPbVVI83SE2pu/Cwc5vvCwV1CMb3TQJxWg9?=
 =?iso-8859-1?Q?V3+QC91zR1e15GS4pizEYVgZ3BHLCNDNz4W8HdGoc1HglX5OMvUbTwlYS2?=
 =?iso-8859-1?Q?yzInSrmAAeOi4B79qBgY6iLHGeiprUwrnYwi439GMvHEka/nuUQu03Gyee?=
 =?iso-8859-1?Q?iulXiZ6g2dSh0pVXdC6YfAiUP6fTn3+pVVlbhbQOBIhM4ShLZu0ZUVm/OR?=
 =?iso-8859-1?Q?NRAvcbJs9bO5or96rbjZO+8idO16DPWm0KBr/iMHNO7ktOiqAZyUqYcf61?=
 =?iso-8859-1?Q?mAoecQX8F+DWt7TUerX5z+9FQ6Rao5ZmsX4X1m9H6VvznrcZAzZ6TNFuMt?=
 =?iso-8859-1?Q?xwanZT5lX7x4kwaCs86nZ04NzaER3az69zDY0mrTqMW2Vnbc5oee2RHhl/?=
 =?iso-8859-1?Q?mFmQJPWXOqVuksvq+BRgBysNRqs5AA/RVbR92uZJIn/0WBP4GBC7KPxNSn?=
 =?iso-8859-1?Q?Wo+gTVz9tmbKyP9uB9bdzV+8tjzcrJw5180ADEhw3kz9vYbPLUP0VuJVSE?=
 =?iso-8859-1?Q?f4pkTL2K0a0d5itFKVRUbIncWh1rLcsCLEt7cX6TIhPcYlePJxqSH5kXuz?=
 =?iso-8859-1?Q?QEmVbR5MAfMAKFyLUGU2i4q4tSoUEY6jYSC7kVgypDNB06LrX0qo8oKy8k?=
 =?iso-8859-1?Q?YBD9lbu1FF/YuTuvS5radJbFI2ez9RjNABIL0s3ZggQngfXBdntjPGTk8h?=
 =?iso-8859-1?Q?PeXPw/BD5duXFx+MrmdtgN8Gzmq5nkOD45BCYeD1O2AOpl3PLJ5fRI246N?=
 =?iso-8859-1?Q?z4fL49pYiBb9h0Ty+/wUH0RZJ9JJjB5mqGJgkMiiIyhLEfEzqNbZ1+G1Ar?=
 =?iso-8859-1?Q?E/tj0rVR2AzEW6QOwf6tnkCIUs7ZcFECgdxUCXTdnUzWH6MLihMGZ1p3ee?=
 =?iso-8859-1?Q?X91EHH+wj/Jre6lNWN9SAt52lTGlAXQwxBpqEgKBhP5Zrs+NDamDmI17d8?=
 =?iso-8859-1?Q?F/KFlxhNhFTFmjknXlHV5BZLlbjZO8n/b+FCyPhLFOmWwWQG8Phx7Xk+Tn?=
 =?iso-8859-1?Q?aadTxgd0BCOka899sLc7nTrvaR582Q06R+gV/qd9F27Ro5Xmh5UPIyBzyc?=
 =?iso-8859-1?Q?DcxwaYhvFYJUdqEfD+YvgPh7/TMnvrN0WxJpkn/4+Jhtndy56g53BWSANA?=
 =?iso-8859-1?Q?4F1b5ljN/wdAKm4c7XwOyMZotiSUHODfPO2/CPm6LQVsE/1kOG90pHC9FO?=
 =?iso-8859-1?Q?uID5YuwCcKtbPPZ0dkBGkwldlCluhWkhef2z54DqEk8WRcx5z677/x8AVr?=
 =?iso-8859-1?Q?6zTzqgqKfBu/pInZzQ4YKtnM7C25lMPspP9aRyieFkZtLBHFtD8i+LC39u?=
 =?iso-8859-1?Q?91vFMHoOjuikoP3zI9U5yTq37+zLyxlIPzGQETwcJnJdfBmGNB9Rcmu39O?=
 =?iso-8859-1?Q?frP66DAshkBmkyejT6eciuClvMPEdiDizOz6mkGoX1UxuKkn/nTj6fJGCN?=
 =?iso-8859-1?Q?xpzX5NJQlVOLISTDQ+yDs66IRHIjM6+/5/6f/jVrOvih1q0zmdbfISUM38?=
 =?iso-8859-1?Q?YQDGK92ign0hNegFgvmZeYcH2EBeXMVEOz6PBfWpbu3pqx4vGov6sNO018?=
 =?iso-8859-1?Q?CuX+zcjrW4gjyJ+m85oD+W2nwW30iIJD+s?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10973a13-f0d8-4d67-15c0-08dd50a76de5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 05:36:59.3880 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gWM/ZG4b3pH+Oqb6G2ACk+8Wsfmxq7ZySVQNMJsZv08KNkmIG14mdvdNvTlVLFMFoa+gzRmeR64BNWHzJ4bjHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7704
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

On Wed, Feb 12, 2025 at 06:10:43PM -0800, Matthew Brost wrote:
> Avoid multiple CPU page faults to the same device page racing by trying
> to lock the page in do_swap_page before taking an extra reference to the
> page. This prevents scenarios where multiple CPU page faults each take
> an extra reference to a device page, which could abort migration in
> folio_migrate_mapping. With the device page being locked in
> do_swap_page, the migrate_vma_* functions need to be updated to avoid
> locking the fault_page argument.
> 
> Prior to this change, a livelock scenario could occur in Xe's (Intel GPU
> DRM driver) SVM implementation if enough threads faulted the same device
> page.
> 
> v3:
>  - Put page after unlocking page (Alistair)
>  - Warn on spliting a TPH which is fault page (Alistair)
>  - Warn on dst page == fault page (Alistair)
> 
> Cc: Alistair Popple <apopple@nvidia.com>
> Cc: Philip Yang <Philip.Yang@amd.com>
> Cc: Felix Kuehling <felix.kuehling@amd.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Suggested-by: Simona Vetter <simona.vetter@ffwll.ch>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  mm/memory.c         | 13 ++++++---
>  mm/migrate_device.c | 64 ++++++++++++++++++++++++++++++++-------------
>  2 files changed, 55 insertions(+), 22 deletions(-)
> 
> diff --git a/mm/memory.c b/mm/memory.c
> index 539c0f7c6d54..1e010c5d67bc 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -4337,10 +4337,15 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
>  			 * Get a page reference while we know the page can't be
>  			 * freed.
>  			 */
> -			get_page(vmf->page);
> -			pte_unmap_unlock(vmf->pte, vmf->ptl);
> -			ret = vmf->page->pgmap->ops->migrate_to_ram(vmf);
> -			put_page(vmf->page);
> +			if (trylock_page(vmf->page)) {
> +				get_page(vmf->page);
> +				pte_unmap_unlock(vmf->pte, vmf->ptl);
> +				ret = vmf->page->pgmap->ops->migrate_to_ram(vmf);
> +				unlock_page(vmf->page);
> +				put_page(vmf->page);
> +			} else {
> +				pte_unmap_unlock(vmf->pte, vmf->ptl);
> +			}
>  		} else if (is_hwpoison_entry(entry)) {
>  			ret = VM_FAULT_HWPOISON;
>  		} else if (is_pte_marker_entry(entry)) {
> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> index 19960743f927..3470357d9bae 100644
> --- a/mm/migrate_device.c
> +++ b/mm/migrate_device.c
> @@ -60,6 +60,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>  				   struct mm_walk *walk)
>  {
>  	struct migrate_vma *migrate = walk->private;
> +	struct folio *fault_folio = migrate->fault_page ?
> +		page_folio(migrate->fault_page) : NULL;
>  	struct vm_area_struct *vma = walk->vma;
>  	struct mm_struct *mm = vma->vm_mm;
>  	unsigned long addr = start, unmapped = 0;
> @@ -88,11 +90,16 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>  
>  			folio_get(folio);
>  			spin_unlock(ptl);
> +			/* FIXME support THP */
> +			if (WARN_ON_ONCE(fault_folio == folio))

This threw me until I realised this was the THP path because we'd expect to find
the fault_folio during migrate_vma_collect_pmd(). Of course we don't currently
have DEVICE_PRIVATE THP so faulting won't ever get here which makes sense, but a
slightly more verbose comment along those lines would be nice.

Otherwise it looks good and passed my tests so please add:

Reviewed-by: Alistair Popple <apopple@nvidia.com>
Tested-by: Alistair Popple <apopple@nvidia.com>

> +				return migrate_vma_collect_skip(start, end,
> +								walk);
>  			if (unlikely(!folio_trylock(folio)))
>  				return migrate_vma_collect_skip(start, end,
>  								walk);
>  			ret = split_folio(folio);
> -			folio_unlock(folio);
> +			if (fault_folio != folio)
> +				folio_unlock(folio);
>  			folio_put(folio);
>  			if (ret)
>  				return migrate_vma_collect_skip(start, end,
> @@ -192,7 +199,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>  		 * optimisation to avoid walking the rmap later with
>  		 * try_to_migrate().
>  		 */
> -		if (folio_trylock(folio)) {
> +		if (fault_folio == folio || folio_trylock(folio)) {
>  			bool anon_exclusive;
>  			pte_t swp_pte;
>  
> @@ -204,7 +211,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>  
>  				if (folio_try_share_anon_rmap_pte(folio, page)) {
>  					set_pte_at(mm, addr, ptep, pte);
> -					folio_unlock(folio);
> +					if (fault_folio != folio)
> +						folio_unlock(folio);
>  					folio_put(folio);
>  					mpfn = 0;
>  					goto next;
> @@ -363,6 +371,8 @@ static unsigned long migrate_device_unmap(unsigned long *src_pfns,
>  					  unsigned long npages,
>  					  struct page *fault_page)
>  {
> +	struct folio *fault_folio = fault_page ?
> +		page_folio(fault_page) : NULL;
>  	unsigned long i, restore = 0;
>  	bool allow_drain = true;
>  	unsigned long unmapped = 0;
> @@ -427,7 +437,8 @@ static unsigned long migrate_device_unmap(unsigned long *src_pfns,
>  		remove_migration_ptes(folio, folio, 0);
>  
>  		src_pfns[i] = 0;
> -		folio_unlock(folio);
> +		if (fault_folio != folio)
> +			folio_unlock(folio);
>  		folio_put(folio);
>  		restore--;
>  	}
> @@ -536,6 +547,8 @@ int migrate_vma_setup(struct migrate_vma *args)
>  		return -EINVAL;
>  	if (args->fault_page && !is_device_private_page(args->fault_page))
>  		return -EINVAL;
> +	if (args->fault_page && !PageLocked(args->fault_page))
> +		return -EINVAL;
>  
>  	memset(args->src, 0, sizeof(*args->src) * nr_pages);
>  	args->cpages = 0;
> @@ -799,19 +812,13 @@ void migrate_vma_pages(struct migrate_vma *migrate)
>  }
>  EXPORT_SYMBOL(migrate_vma_pages);
>  
> -/*
> - * migrate_device_finalize() - complete page migration
> - * @src_pfns: src_pfns returned from migrate_device_range()
> - * @dst_pfns: array of pfns allocated by the driver to migrate memory to
> - * @npages: number of pages in the range
> - *
> - * Completes migration of the page by removing special migration entries.
> - * Drivers must ensure copying of page data is complete and visible to the CPU
> - * before calling this.
> - */
> -void migrate_device_finalize(unsigned long *src_pfns,
> -			unsigned long *dst_pfns, unsigned long npages)
> +static void __migrate_device_finalize(unsigned long *src_pfns,
> +				      unsigned long *dst_pfns,
> +				      unsigned long npages,
> +				      struct page *fault_page)
>  {
> +	struct folio *fault_folio = fault_page ?
> +		page_folio(fault_page) : NULL;
>  	unsigned long i;
>  
>  	for (i = 0; i < npages; i++) {
> @@ -824,6 +831,7 @@ void migrate_device_finalize(unsigned long *src_pfns,
>  
>  		if (!page) {
>  			if (dst) {
> +				WARN_ON_ONCE(fault_folio == dst);
>  				folio_unlock(dst);
>  				folio_put(dst);
>  			}
> @@ -834,6 +842,7 @@ void migrate_device_finalize(unsigned long *src_pfns,
>  
>  		if (!(src_pfns[i] & MIGRATE_PFN_MIGRATE) || !dst) {
>  			if (dst) {
> +				WARN_ON_ONCE(fault_folio == dst);
>  				folio_unlock(dst);
>  				folio_put(dst);
>  			}
> @@ -841,7 +850,8 @@ void migrate_device_finalize(unsigned long *src_pfns,
>  		}
>  
>  		remove_migration_ptes(src, dst, 0);
> -		folio_unlock(src);
> +		if (fault_folio != src)
> +			folio_unlock(src);
>  
>  		if (folio_is_zone_device(src))
>  			folio_put(src);
> @@ -849,6 +859,7 @@ void migrate_device_finalize(unsigned long *src_pfns,
>  			folio_putback_lru(src);
>  
>  		if (dst != src) {
> +			WARN_ON_ONCE(fault_folio == dst);
>  			folio_unlock(dst);
>  			if (folio_is_zone_device(dst))
>  				folio_put(dst);
> @@ -857,6 +868,22 @@ void migrate_device_finalize(unsigned long *src_pfns,
>  		}
>  	}
>  }
> +
> +/*
> + * migrate_device_finalize() - complete page migration
> + * @src_pfns: src_pfns returned from migrate_device_range()
> + * @dst_pfns: array of pfns allocated by the driver to migrate memory to
> + * @npages: number of pages in the range
> + *
> + * Completes migration of the page by removing special migration entries.
> + * Drivers must ensure copying of page data is complete and visible to the CPU
> + * before calling this.
> + */
> +void migrate_device_finalize(unsigned long *src_pfns,
> +			unsigned long *dst_pfns, unsigned long npages)
> +{
> +	return __migrate_device_finalize(src_pfns, dst_pfns, npages, NULL);
> +}
>  EXPORT_SYMBOL(migrate_device_finalize);
>  
>  /**
> @@ -872,7 +899,8 @@ EXPORT_SYMBOL(migrate_device_finalize);
>   */
>  void migrate_vma_finalize(struct migrate_vma *migrate)
>  {
> -	migrate_device_finalize(migrate->src, migrate->dst, migrate->npages);
> +	__migrate_device_finalize(migrate->src, migrate->dst, migrate->npages,
> +				  migrate->fault_page);
>  }
>  EXPORT_SYMBOL(migrate_vma_finalize);
>  
> -- 
> 2.34.1
> 
