Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7943A54263
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 06:45:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2566B10E791;
	Thu,  6 Mar 2025 05:45:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="fw/0dUtE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2086.outbound.protection.outlook.com [40.107.244.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AADCC10E791;
 Thu,  6 Mar 2025 05:45:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sAV5i6xcJT4Q3/jzJ/ns+vLYPn7cHQe3yTJBWnZZ6I7dFW7rRRPmvBTBMQEx1UQnLjLLRAkQfA+v2GqsB7P+Jo9X6UREGUzm9CeANQKEtg06q+b+5jlis7AwD4XVLqxJfnMFtaPFJAuz7SBd8mJNQ2v04BnAP/g9yKDIFp6yzTTA6zjWKeW8sA9STXSd70fBWfiehmNoKqMknmZZmR4gy9HXNw1A6dQKubu/byEZB9M1nPPN79UTBFI0Wln+DNhzNAh2DYGoqXmirQiPQACL3dkpqBaq1FWdRQSAWanSxs90qPSxZc91A+qi3T65NIXZxFTdxA0+8rEg4ckC0ENiGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ONlxXS39zLq+jIxOFRRgwHMVognv+edtAMt11wVOXFM=;
 b=TzFZVZw7C6jim9YP4Os3B6ZCiUrKQZQSSUtRSy9MdV3hXTRRPs3GkszJaRua51/+mLYxTDHWIO4xHFLYCEppXJbo/3XDvIIRmPQ0Td+9fK1fS9gWoeFaTc8k6RnBsqUFESlnekg53+262Zz/ntS/NmyLF27R5vVcbZ2IuYOyvtcrGC3Bve0AgqVRyhSlXV5r+CGEAJOoqX6STSxz5xtdUJLCruMZPKq32perg9KAtCYDO4LhsZrRlDwuUlzS8ppeAidAd3RW47LpzMCP/tSg3CwSoCekvkoMkKCDAyUYIxKHVz44gsR8G0XikwO2I3hCO+nUzb+UyIvt/tUBFZC+Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ONlxXS39zLq+jIxOFRRgwHMVognv+edtAMt11wVOXFM=;
 b=fw/0dUtEbxa9rdoCRUX1sXMnYEKiMESFidi+6ZUELrKv6H6omKtYlz3ULRgPAnTIyxjer+1baflsqWVdOwgtQYtor6nBwVfWJcMYrfkGwFBbpL33/aF03dwvoR5LCMuuG8oH6OAB+xD1JdNRLM7cDTHqGpLV0xSizkQHFhplsORR3B98GGAz/ODaWx96zbGgmKrWWeIUXQMc2n99imdDjDbkyVTr16XJ4QedcRGN6kSrdlji1zqtGVP7Hs4O1qpim285uYWtaKuEBrSLKzRMS2bQdXqjYX1q+efruKIzmkczk9K/YtvUkCtOQ8NiPnZ/Tw8xaeogd81qVsB723T2kw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 SN7PR12MB6840.namprd12.prod.outlook.com (2603:10b6:806:264::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Thu, 6 Mar
 2025 05:45:37 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%6]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 05:45:37 +0000
Date: Thu, 6 Mar 2025 16:45:31 +1100
From: Alistair Popple <apopple@nvidia.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 himal.prasad.ghimiray@intel.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, 
 simona.vetter@ffwll.ch, felix.kuehling@amd.com, dakr@kernel.org
Subject: Re: [PATCH v7 32/32] drm/doc: gpusvm: Add GPU SVM documentation
Message-ID: <4vqsd4n7umeimw4gqwa6c5oeuvrpqxfxquzsaizfzuqcdfd7vs@bed32kv2hjom>
References: <20250306012657.3505757-1-matthew.brost@intel.com>
 <20250306012657.3505757-33-matthew.brost@intel.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250306012657.3505757-33-matthew.brost@intel.com>
X-ClientProxiedBy: SYBPR01CA0039.ausprd01.prod.outlook.com
 (2603:10c6:10:4::27) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|SN7PR12MB6840:EE_
X-MS-Office365-Filtering-Correlation-Id: 05e41578-6393-497e-d6d1-08dd5c721ea4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?jyQdb3L5ge+klNr6N+xDqNBgX1rQZMXFJ6BlUUN7uF0IxBBf3ZztwEiCRq?=
 =?iso-8859-1?Q?cSGCntI4jMuSJzdQm+90Kd+UqD8KliyjIzyI10nEGUxXDonB1VngY4jUHl?=
 =?iso-8859-1?Q?DUGwk/YPVfeGKvx90bn6ftTduBUfifiGEo/Y3OChQXeB8M5RIS7OyE23g4?=
 =?iso-8859-1?Q?pR8/wNTQY1tIQY/2rn6rlIa4CpZ3eF8T464iJxM13VRiK1TtZt+tfBYbaJ?=
 =?iso-8859-1?Q?H9SLjSq/dcBQo9fuevJbx7NGVyGLbcPuXGcI90yid/zJGeztHmR2rlerBE?=
 =?iso-8859-1?Q?uxbCryAzrIVWFj4MKLCQOh3XI46aEsN1+lHX+SkodkN0pn/ITcATu5DsiS?=
 =?iso-8859-1?Q?0EjRopLD/tq876RlR/ArLC+fUuihDkzOjNLGS3ilELh5Ct2GDAlzxggJX7?=
 =?iso-8859-1?Q?wABwAPJkColIBCYCtZ2zYvwMeleE1xFQ8UBe/KJQ3QhDvz6WlpCunDaK1J?=
 =?iso-8859-1?Q?4xXEcCozsw0ovto/HpWm2I7TK8SsJm7xLZwuRRh2933HVc1hBv80TFWse5?=
 =?iso-8859-1?Q?suik2g5o/Tp85pIPGMQWNucHYk0t1IPxOSs5qRRbpLk3LyLmg95ax0G/fI?=
 =?iso-8859-1?Q?XDPfPArp3mhXntdi8dleQXWAXYW1p5hJvWF48HWUc8TO0xeGvWhK0zxvGD?=
 =?iso-8859-1?Q?Z0PnLSqQ5my0xs+Savv7/tSjIElsWP4D0FzgfQp83sEc44CobJlggf8BIT?=
 =?iso-8859-1?Q?mcbxuRB753SHkPVRQTqA/BwqRYEHZL3FyQzbJy1NNDdBnF4NV9r/xiz5Ar?=
 =?iso-8859-1?Q?TFFj5MB7xCEhn0/vffyfUsnVX/puLknFHQTqMoAFTkTsErgd6WvMNUM5nX?=
 =?iso-8859-1?Q?aSmgM3RyOTRsbGLpwoKS2gH2OqU3XJT/IQqtGVBz7ovPuyZ2fUAsTXV399?=
 =?iso-8859-1?Q?qTsIWOGdvUI07A2rWOw6iTDiSL8r3J80AspKvfhG99eOGxfWBVr2R2END5?=
 =?iso-8859-1?Q?oeKWcanc2bagmZczTZ6pZVJfEkAjCUhcSKEIx5Hz/Zl7UvZ9Z8/u1yMoC4?=
 =?iso-8859-1?Q?oIu9vCZwiIDI8vf3hC90fXuPfHpzL71IandraEHUbjE2BqLuxsMIXgd820?=
 =?iso-8859-1?Q?+NkZYike513lEJH6xbW152KJULt5lHZAkUkpkws74H49oIDpHF5hhjsr2A?=
 =?iso-8859-1?Q?DXsIQIB3Sqqg+vp5IgaHbn9X0EaZhyQzgw4EMVL9Tt9abU9Mo+ufqVgXzz?=
 =?iso-8859-1?Q?9/Jpt0WdT3kCJZytnJRxpR0ioiEmrtJSjkLvub2Vt1eNE/KY0oLh0n9wry?=
 =?iso-8859-1?Q?U2+PT9lPR71JWgDffLOSN14nZLcNOlSvG50+ZHleZYA4wlCpVJrOHpZJqS?=
 =?iso-8859-1?Q?xBFHUF5iYj7TgKpH/mPg2dacsgdCpotbkoQ/ywUCsq0PQktb/YIgwwLHpC?=
 =?iso-8859-1?Q?PAwkpU9PwfY1VLQQaADX9qX99J2wG+XbgEa8uuzUKoOt+h0QS26KTO94cX?=
 =?iso-8859-1?Q?4FQEUyvxlED2A5bp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?GUuOtgEwFGgpah1IQ1KMo5G6vT3x3dGOoSVR6cTfYpytA6FNwthL6fSemd?=
 =?iso-8859-1?Q?3WqnqiJA/TDMtyE7jzX3wuMQv6b5H35RK9vMTu4UW1EOc5i1/q2CYMZ53h?=
 =?iso-8859-1?Q?vLCXx5XtSQ/QjuobS/DcOMoIc1m5Rpxd8dk2SYUI6SSnUNeYTMKUcDH/Zv?=
 =?iso-8859-1?Q?w+6LRxjLUxK/5Wt6mR4xUE9tptXhNwUIclDoVBO+Gbrz7qrBBRRhKHAuZJ?=
 =?iso-8859-1?Q?HWN1itZ+wCYSQVslRMftREynakkwM0OJFhw0WxIUWyNsOPuNi8639HuAZM?=
 =?iso-8859-1?Q?d+I2KaSdrGwctMCNHbYqFBL/UwhLhx4bWJh2+RjJoS87EcsvCB9jWZQBMH?=
 =?iso-8859-1?Q?ouynV2CeVVG40oS4L1li2ytD8aYlh3l+SmBb2xfYz3Gg1L5oC+E6twBBkR?=
 =?iso-8859-1?Q?5nCSIgvEpO0TyiyhNInwjy15oFpG9WizzrfksyEW400JWQ0f1uF8aTqXn0?=
 =?iso-8859-1?Q?rbtJw3dOT4mY2e6fOoxZdE8nv+xgr3wB8hcorWbYGXuDLntZBJGdz02Px+?=
 =?iso-8859-1?Q?6BYhglaRkBzm24UzC+qkkgQdaGXt+MthKBqHVJGKdJx21bCBzppdDhwEt6?=
 =?iso-8859-1?Q?7aUCcl8ZXqYd6DQB7+ufIJOD807XNJ0XdXqFdOmRJaqLMzt0eC2SJ5VPrQ?=
 =?iso-8859-1?Q?t/m00DXZZEin2QqiwMoBbCuTmg0EW2MrEmgD4IJ61tHEe/2psrz7ivOrsb?=
 =?iso-8859-1?Q?4tnoorfG6lJp19BrfHZaeuIPPz2SER+jxTz1Xh7+I08z8b5iU9jwk54dcR?=
 =?iso-8859-1?Q?f00ztmuSciaL+Z1leCoCflk7qbtRPGasw4VyUvunnqFz0l5G0/Yhiveaxv?=
 =?iso-8859-1?Q?eQcTOrNdTFmPNeyajvkwEmh5C4+kCcnGb7RY1fuT6mD7Omg2lEIdW6j31D?=
 =?iso-8859-1?Q?XyCJ73m4uTkZzVT7x+g7nFfvzNv9kOessVOKSKkOdr8WUm2W9oROkSqZFb?=
 =?iso-8859-1?Q?nmknICdgbjcy3jrZbjkfW2KsJUgI8QlPDmgKwku4bRxgFeS822rqW+z2ni?=
 =?iso-8859-1?Q?c6JlcAot2GaehcLW3wzcZVX122KlV3PB2OXVg7fqCGjga1zUU8bkI7P4th?=
 =?iso-8859-1?Q?qcP0D/GZXEIpGPWPqE5BxZgJNVb9flOvYlAamxfYj1xBHzV1O7ajyYPFAl?=
 =?iso-8859-1?Q?1LFPuFQSbnlrJda+mOdmdJrcU+WRLh9aaUlC/YHp2fTpE8S6FqWqfbSQ9t?=
 =?iso-8859-1?Q?1vlOQouqdLxg/yU1elIrFnLzigNy2QJyiLVhKg4Ys5ShIQYoJJM7exEOjK?=
 =?iso-8859-1?Q?DhmtPaOPlEcxEFHPkLlU0Ig2INFeSpS3+6zLZUAmYJbBBD78Ae2NgxoNbJ?=
 =?iso-8859-1?Q?3AvLUV8UcKY+ajly3eE//SAXGhZhNF6Bb44jxgScoZSoZeAV0lBr/C4WDk?=
 =?iso-8859-1?Q?MnWIddknOinRU1Y2vnVbrzDyhJj55dcp+7R87BoFII27Zp3rt+3PQHMEIC?=
 =?iso-8859-1?Q?6m98GGRvy+qnv0NzgQ7t7E7YLpFwV1EoS0Ea5SoFe3HtYyA79J/B4S8Wqm?=
 =?iso-8859-1?Q?frFmd5AJj0PEXaOvyV7KP0wrNgYDszz3cU5T52Q2O7chQZClbQAeNlRw21?=
 =?iso-8859-1?Q?rOZN9Y2fQioxYqOMG8n16LatAE1ulEWRM2A7LQiNkdg+v4F2xg22Y4zd0u?=
 =?iso-8859-1?Q?emkqhxkFGUcku21vOOclgn62p135GLtE+N?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05e41578-6393-497e-d6d1-08dd5c721ea4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 05:45:37.0880 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fic+FIYoH4Kr806pIV1kwbPISMfp0FuKkG4OHpcKKJBCDCnel+CrR8D3mgF7ZyO7VZhVl76QsJIfVyYlPLAMNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6840
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

On Wed, Mar 05, 2025 at 05:26:57PM -0800, Matthew Brost wrote:
> Add documentation for agree upon GPU SVM design principles, current
> status, and future plans.

One minor nit and a comment below, but feel free to add:

Acked-by: Alistair Popple <apopple@nvidia.com>

> v4:
>  - Address Thomas's feedback
> v5:
>  - s/Current/Basline (Thomas)
> v7:
>  - Add license (CI)
>  - Add examples for design guideline reasoning (Alistair)
>  - Add snippet about possible livelock with concurrent GPU and and CPU
>    access (Alistair)
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  Documentation/gpu/rfc/gpusvm.rst | 106 +++++++++++++++++++++++++++++++
>  Documentation/gpu/rfc/index.rst  |   4 ++
>  2 files changed, 110 insertions(+)
>  create mode 100644 Documentation/gpu/rfc/gpusvm.rst
> 
> diff --git a/Documentation/gpu/rfc/gpusvm.rst b/Documentation/gpu/rfc/gpusvm.rst
> new file mode 100644
> index 000000000000..87d9f9506155
> --- /dev/null
> +++ b/Documentation/gpu/rfc/gpusvm.rst
> @@ -0,0 +1,106 @@
> +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +===============
> +GPU SVM Section
> +===============
> +
> +Agreed upon design principles
> +=============================
> +
> +* migrate_to_ram path
> +	* Rely only on core MM concepts (migration PTEs, page references, and
> +	  page locking).
> +	* No driver specific locks other than locks for hardware interaction in
> +	  this path. These are not required and generally a bad idea to
> +	  invent driver defined locks to seal core MM races.
> +	* An example of a driver-specific lock causing issues occurred before
> +	  fixing do_swap_page to lock the faulting page. A driver-exclusive lock
> +	  in migrate_to_ram produced a stable livelock if enough threads read
> +	  the faulting page.
> +	* Partial migration is supported (i.e., a subset of pages attempting to
> +	  migrate can actually migrate, with only the faulting page guaranteed
> +	  to migrate).
> +	* Driver handles mixed migrations via retry loops rather than locking.
> +* Eviction
> +	* Eviction is defined as migrating data from the GPU back to the
> +	  CPU without a virtual address to free up GPU memory.
> +	* Only looking at physical memory data structures and locks as opposed to
> +	  looking at virtual memory data structures and locks.
> +	* No looking at mm/vma structs or relying on those being locked.
> +	* The rationale for the above two points is that CPU virtual addresses
> +	  can change at any moment, while the physical pages remain stable.
> +	* GPU page table invalidation, which requires a GPU virtual address, is
> +	  handled via the notifier that has access to the GPU virtual address.
> +* GPU fault side
> +	* mmap_read only used around core MM functions which require this lock
> +	  and should strive to take mmap_read lock only in GPU SVM layer.
> +	* Big retry loop to handle all races with the mmu notifier under the gpu
> +	  pagetable locks/mmu notifier range lock/whatever we end up calling
> +          those.
> +	* Races (especially against concurrent eviction or migrate_to_ram)
> +	  should not be handled on the fault side by trying to hold locks;
> +	  rather, they should be handled using retry loops. One possible
> +	  exception is holding a BO's dma-resv lock during the initial migration
> +	  to VRAM, as this is a well-defined lock that can be taken underneath
> +	  the mmap_read lock.
> +	* One possible issue with the above approach is if a driver has a strict
> +	  migration policy requiring GPU access to occur in GPU memory.
> +	  Concurrent CPU access could cause a livelock due to endless retries.
> +	  While no current user (Xe) of GPU SVM has such a policy, it is likely
> +	  to be added in the future. Ideally, this should be resolved on the
> +	  core-MM side rather than through a driver-side lock.
> +* Physical memory to virtual backpointer
> +	* This does not work, as no pointers from physical memory to virtual
> +	  memory should exist. mremap() is an example of the core MM updating
> +	  the virtual address without notifying the driver.

Pretty minor nit, but this could be read as core MM won't send a mmu notifier
when calling mremap(). That's not the case, as it will get a notifier to
invalidate the address but won't explicitly get notified of the new address.

Not worth sending an update just for that though.

> +	* The physical memory backpointer (page->zone_device_data) should remain
> +	  stable from allocation to page free. Safely updating this against a
> +	  concurrent user would be very difficult unless the page is free.
> +* GPU pagetable locking
> +	* Notifier lock only protects range tree, pages valid state for a range
> +	  (rather than seqno due to wider notifiers), pagetable entries, and
> +	  mmu notifier seqno tracking, it is not a global lock to protect
> +          against races.
> +	* All races handled with big retry as mentioned above.
> +
> +Overview of baseline design
> +===========================
> +
> +Baseline design is simple as possible to get a working basline in which can be
> +built upon.
> +
> +.. kernel-doc:: drivers/gpu/drm/xe/drm_gpusvm.c
> +   :doc: Overview
> +   :doc: Locking
> +   :doc: Migrataion
> +   :doc: Partial Unmapping of Ranges
> +   :doc: Examples
> +
> +Possible future design features
> +===============================
> +
> +* Concurrent GPU faults
> +	* CPU faults are concurrent so makes sense to have concurrent GPU
> +	  faults.
> +	* Should be possible with fined grained locking in the driver GPU
> +	  fault handler.
> +	* No expected GPU SVM changes required.
> +* Ranges with mixed system and device pages
> +	* Can be added if required to drm_gpusvm_get_pages fairly easily.
> +* Multi-GPU support
> +	* Work in progress and patches expected after initially landing on GPU
> +	  SVM.
> +	* Ideally can be done with little to no changes to GPU SVM.
> +* Drop ranges in favor of radix tree
> +	* May be desirable for faster notifiers.
> +* Compound device pages
> +	* Nvidia, AMD, and Intel all have agreed expensive core MM functions in
> +	  migrate device layer are a performance bottleneck, having compound
> +	  device pages should help increase performance by reducing the number
> +	  of these expensive calls.

Balbir has also just posted an initial RFC implementation of this here:

https://lore.kernel.org/linux-mm/20250306044239.3874247-1-balbirs@nvidia.com/

> +* Higher order dma mapping for migration
> +	* 4k dma mapping adversely affects migration performance on Intel
> +	  hardware, higher order (2M) dma mapping should help here.
> +* Build common userptr implementation on top of GPU SVM
> +* Driver side madvise implementation and migration policies
> +* Pull in pending dma-mapping API changes from Leon / Nvidia when these land
> diff --git a/Documentation/gpu/rfc/index.rst b/Documentation/gpu/rfc/index.rst
> index 476719771eef..396e535377fb 100644
> --- a/Documentation/gpu/rfc/index.rst
> +++ b/Documentation/gpu/rfc/index.rst
> @@ -16,6 +16,10 @@ host such documentation:
>  * Once the code has landed move all the documentation to the right places in
>    the main core, helper or driver sections.
>  
> +.. toctree::
> +
> +    gpusvm.rst
> +
>  .. toctree::
>  
>      i915_gem_lmem.rst
> -- 
> 2.34.1
> 
