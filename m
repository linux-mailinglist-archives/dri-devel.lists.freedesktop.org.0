Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A12DA2272B
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 01:27:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A624010E8C7;
	Thu, 30 Jan 2025 00:27:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="VvnHQWQc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2067.outbound.protection.outlook.com [40.107.223.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05AE710E1FD;
 Thu, 30 Jan 2025 00:27:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VZPAlUxCZ0VJvl2hl6f1HZv/SvYKLwW5hrtSsrrRbW2pKhcwHNAFD+BIrmHPh+Ysf5ZgqFfNVj8RNYEdKMYGOb6aLZ8D1RMrFrENIXYdRfkjMpXh8BREa+F54V0n9AASzMvbr0XCatQz0/3iutyYx0HGIuMZesgTVi/+uEpby1RS+kIpNaT324xt4Qm6VJbrWx/nWHd94nn6ie5dTpILvq3uv2pxrPlOG02/TXLy5XhqXint4EQbLI/9fRlAT14ZlsACqxNBzv1WMiBZAXjqteQeQzUcullIxvL1ebUSzeWFwbiUwfDznoBtXlH2ZvPQiwU/3+BWdZeLB6wLV0L/eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eUdYHVup223LwPG4t1221TE0aH77iwGDq4JZaHKQ1Xs=;
 b=v75dQzmjGzb/781B0hBYij+0l4CmJ6EKxaydAGvO98v22OvQWNm9VZ4fssU8gLNm4F95tiTnWANq0W5GS8jeSY34y15fUNkvYerhTG3SppO9Zi133cRfoRysF4V/qtsJKeYg79fRScbyy1ly+HVjgwHTMNfcje0ZAmNaiWQfRVk3GUdiT3kyqqCnvi488Ebqdl5oVFi2HwgOd2HI6VaPLh2CZ8dzEtmPiL8VwQyMd3aEiBQ1sy7I8PXbCDN2/ukW/fB9zzG7tcDLk6LKamJIhqqTMJKjAxNrWBNvSKtUtA/Z64u/XEoGSqSG87qogKK8bUaWiRix0Bnm+bPLP+OV4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eUdYHVup223LwPG4t1221TE0aH77iwGDq4JZaHKQ1Xs=;
 b=VvnHQWQcF9ZbIWbfB/dgGtv/3iNNJBIKS3qT2zIt+0nA+B8Ftn77ml4hyyiwDiOArMZKUyTgh1OFDzd5G3vBr70F6hBemWI3ol8fi8dl6CAE2K7/7P2lpMs6EI6oqwERtFygqHEX7wd2PpkQVgtFPlVALUM02l0KFqccPTtlQj6TOsGi7qh8Gnu+aCAoJmMEIvSO2kfu5movK1HALLBWW1W0uDR0IxAyUvkW12/4SCgPyFWTwt1PqZ1jVdR23xyKW3R4FsTs2iUK6IysAAzwPXxdw2vOhQS0n47FbE2Nhf5Rqdpq6Hoezhr3DUCbV6viPWis2nJttizp+vFGaMjK9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY8PR12MB7705.namprd12.prod.outlook.com (2603:10b6:930:84::9)
 by SA1PR12MB8844.namprd12.prod.outlook.com (2603:10b6:806:378::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Thu, 30 Jan
 2025 00:27:42 +0000
Received: from CY8PR12MB7705.namprd12.prod.outlook.com
 ([fe80::4b06:5351:3db4:95f6]) by CY8PR12MB7705.namprd12.prod.outlook.com
 ([fe80::4b06:5351:3db4:95f6%6]) with mapi id 15.20.8398.017; Thu, 30 Jan 2025
 00:27:42 +0000
Date: Thu, 30 Jan 2025 11:27:37 +1100
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
 Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v1 4/4] mm/memory: document restore_exclusive_pte()
Message-ID: <7vejbjs7btkof4iguvn3nqvozxqpnzbymxbumd7pant4zi4ac4@3ozuzfzsm5tp>
References: <20250129115803.2084769-1-david@redhat.com>
 <20250129115803.2084769-5-david@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250129115803.2084769-5-david@redhat.com>
X-ClientProxiedBy: SY5P282CA0025.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:202::10) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR12MB7705:EE_|SA1PR12MB8844:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ad70f6b-1627-40b2-734d-08dd40c4e8b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oqx6zFvBozuXs4+q/BKT8+PYxVxoE7geH/zKtX+4UQ9IZ3HrD/nqr2vP+KGv?=
 =?us-ascii?Q?XDJFomq3JS55jLRqKDUk23EBWVcfDjE2fbItzmAIT3/OuIIk5PDi4AD4YSmO?=
 =?us-ascii?Q?NCGu43xk7FcGS/A4giMoQAN7y0Aw8RcVsuPgftbErch2ts5CIALZHYsg2DPn?=
 =?us-ascii?Q?DvcyTAIcPmM2a33bx8BXsC7K71pJ7hF9qPD+M1ZLYcc3FML63YrS76VJpLNy?=
 =?us-ascii?Q?DKPT9MksENzXmHPV+7/8TuSQI8B+TsqqAdwLuaq2KhD//w59J38T2rXlpLig?=
 =?us-ascii?Q?EJV2gbFfmMHDHGPufQaeHt7fM0ppp5Gxhp4dwdxhtOz0ygPo2TLU8JhuG/DR?=
 =?us-ascii?Q?jbtlcHBnPZDjk4nElNQuAwu5tebb3nfiqwSCwZpPyQGogLtVzlz1F9LM0tvk?=
 =?us-ascii?Q?ifLvwzd90unGVZIph9VF7vOvjoX1+YcqjX2ZwNMFk84ZIwFhb3H3r4iYg0hl?=
 =?us-ascii?Q?rcYO3upP50YYiqMoNgpeEDX/CLVgg2qNVx/br/gn5i/rDu/fn/h6vkPWG/mZ?=
 =?us-ascii?Q?W/rk8BVx6mZDe4IJBKdXzY4xoImqRFWLSnt/ARt/4Aa3H9Kdp1ZpPkOr7HYC?=
 =?us-ascii?Q?n0zpewWM4ZF6dXuDWOR3UogFGRpFTXiAWPqY/v3qe09q0oEmjSDFh/1U9VQ3?=
 =?us-ascii?Q?9OxDP3EZPqALOkpsxfO6sHkJ6IL4cujRWdh4B99xGe26bM1j3DIwVE+TjLfB?=
 =?us-ascii?Q?n0zI8+ZJEHtujPr06zy9s7uALt04VPPrxy2KfcxogK+tAseabHYgLR4kKUXb?=
 =?us-ascii?Q?Y1vYlx9I5KfvMUSbLK3WzQsF4rte6QukYJHNnHpLWpHrIyaKBiIIBTyBi37d?=
 =?us-ascii?Q?Oq5O97VCo6FWLBO/lQRAy6hLbd15VtIDp8/MOU8gEnXumrRzaODdPfzR3BvW?=
 =?us-ascii?Q?lMvsfm/QgUpN9Sf0+J7HOEdcTdP0VDmtyLTg+UjMhUgFrl/4GnCwM/JLG/lS?=
 =?us-ascii?Q?Kkily71CM2tA8R8vZqnPQzj0Lrkf4CWMJrMU5ZhG0WL8LiZmh5eZ1kaSyOS9?=
 =?us-ascii?Q?TBcYm5wZELkeO2t4qUYdhWk3wy7zuadmy3fURAZOHv9nKMOrWVBlbZyCfnEk?=
 =?us-ascii?Q?F6VmLfUfIXeNluOdkW5nTmYaq+0xZ1EszMChU+uUevwZXoANy3ejryvWQIYB?=
 =?us-ascii?Q?pSkGJKgkj0lK+paKdKZPsHxP6Fmeaby4ph50ZsUHIpcpOID8OY9cMF6PVnXe?=
 =?us-ascii?Q?/khwR2BcgTRAu5ovbb1GEvx8xQOUQaTvMdFSyzqUyNRg9bXUa9rTJR30YB4B?=
 =?us-ascii?Q?2dQ2TKajjrYLlumrSdm/L4WiDnV/+1dhg4wSh2QCr4g1Yzl99Z3Dv1FtH3f9?=
 =?us-ascii?Q?K5qj/NX4vY0SQV0Nr2zrB0AoL+fIEosVr5uA1KkJH5Ee4nzpwtu67jeUebLy?=
 =?us-ascii?Q?8Ze7upXAYbJ94eDdHEFRwsAWNdgs?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR12MB7705.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BUbg/FPrBdCuvp+X9Ywg6+ZsrGALFYI0K8ncVNAyZWB2ctBitgrtlKG0gr+M?=
 =?us-ascii?Q?d6bBCpXEB8QhEO+3LTS7cSpZHIRlh60vHMj+QbTjxNq2AFINtcM/rPBH78qZ?=
 =?us-ascii?Q?KAFn01WLshQPYEPAa/uPOFdjP24eJMz4wZbS9osb1w0eKC4JWFqR2UZamxpt?=
 =?us-ascii?Q?uA2yV+U3cNHhPj6MnuwxcTJNRJZ+gqRi8IJzcGX5SLvH9D7Ne2qfINfiL17o?=
 =?us-ascii?Q?q5DAkWHGFsozTl51uxgF1MkNTlQHTBG3pZsGDuNkA8UGdGxfOvJb4Boe7XdL?=
 =?us-ascii?Q?L207U8IJUt8mkr5yLdZeKwOtD+gob71KxPl0e9EDZsFK732OkSO8/b/ngekM?=
 =?us-ascii?Q?1uANVjL5u8slD8irrYpC4RODog+CPmYIS8vf6MeURT7k7T9lxe2pSDh/TITW?=
 =?us-ascii?Q?eVUAfMTDT6grYK1K1M4V4/1SNuCWNrwpZe+OL3X3JZK6EDBQ4IKr3MbgoeEs?=
 =?us-ascii?Q?DBHxqSW/bdNcjWe6Dr+O1TRMqzo1YPs9XYqrjzEVCb++vjyljcswFULTIB/5?=
 =?us-ascii?Q?k6E0f50lt883LYvUUGwJEMoyVT6DbxiDcOi7eL1ijcJ3Wbf0bndkSSxgbPAI?=
 =?us-ascii?Q?h4eewKZFxzejg4il3FA/qrIKeLs2JUpmiC7X1aSMAovbBSEEEKdBIV7VSqgb?=
 =?us-ascii?Q?iIYWmSurWzFYviwXNd5PGyiZuusvzO+PGKBZc+laRMGF45yXttVD/lsmoZ5c?=
 =?us-ascii?Q?RcE0ydocQdOOW0fGi3dvGHDO49OxIvdXb5nlryH4Lb/7C0Gc/Y0j7SYWB8vm?=
 =?us-ascii?Q?oLO0Wa782hqzcEM06lyy3iLfe1tXzvqxsnOgFJZ0oAPcLQnBEpNSb2fV6cgH?=
 =?us-ascii?Q?REpN+mOfC7VsnwlOhr3dfOoxr2kcbOKemAcG31zCuZTpSSdyfaCYqSX84cH/?=
 =?us-ascii?Q?jRq9o44B8e4VjkS0slV/Kfen1+JMq88VwlZteu9xvy/dkSvN8H1iOGw0ahoP?=
 =?us-ascii?Q?kruLwNwFwORQUWx7TWMMLx5uTHQjOpEbf/wlkOQk2928qM+K4swq6uHkPnIR?=
 =?us-ascii?Q?IZUPWO3TKGdH4c4HkCK9CC7rhQUtAta+sGZd/dqozNFR04qBnPzVpYDYF7jp?=
 =?us-ascii?Q?YcjlB/lulelSA9RodmSb8UTqh/YVQmy1zp2axd/5Lo9Vrmvrx4RCDCWGSxks?=
 =?us-ascii?Q?suPNdJN/Joaz3WvuOJsvRKd9vpaiK9Z2oE67Qjjr+iYqGXDmMfpGo7TkG4lC?=
 =?us-ascii?Q?w4ulLsf4PDfXvhRdB9WtUhTG3bgeCCeia4a71ETSfFDWP/ZyNIrIeVUAAxCL?=
 =?us-ascii?Q?mokUqGCLbRAkEImYkN1W63YLx+1NsX0UQ9n8F4Ne2C6K4s+K/U0sBXEqwjJF?=
 =?us-ascii?Q?oe/M5kg54yXNqPE+uPcypBG6jHJGOVLeGKmrr1d4KzJTtaNnU1k6LHrA+7mg?=
 =?us-ascii?Q?jeat5btSqS1mMpBhhFGa76G9a8BN0+s7LFuM5R02FLqGgzttGTqgO2jEUk4z?=
 =?us-ascii?Q?DsArgHlcqnKWJmoagzoXPB0t/XWBjw6009yTO6I4hoZ4GcIGHBByX5fgHgep?=
 =?us-ascii?Q?wOc/dEuoy9x+prfE7SOyjVeXXB5XkwrK5aafGO/rxyZlACpdw5R5qBoMUWyC?=
 =?us-ascii?Q?OvLDTpiZ+s7d7cj20ECWJVLp9eminRdOzbNfxjw3?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ad70f6b-1627-40b2-734d-08dd40c4e8b2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 00:27:42.5678 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +5Zh4RaA2OhZ6VjrGxzRplZEPcrBh1F8bV7lGDu+0kVDk4HEANrc6XJOo7l1nvUeQIBqRpdbaaBuVFUo+hEmjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8844
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

On Wed, Jan 29, 2025 at 12:58:02PM +0100, David Hildenbrand wrote:
> Let's document how this function is to be used, and why the requirement
> for the folio lock might maybe be dropped in the future.

Sorry, only just catching up on your other thread. The folio lock was to ensure
the GPU got a chance to make forward progress by mapping the page. Without it
the CPU could immediately invalidate the entry before the GPU had a chance to
retry the fault.

Obviously performance wise having such thrashing is terrible, so should
really be avoided by userspace, but the lock at least allowed such programs
to complete.

> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  mm/memory.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/mm/memory.c b/mm/memory.c
> index 46956994aaff..caaae8df11a9 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -718,6 +718,31 @@ struct folio *vm_normal_folio_pmd(struct vm_area_struct *vma,
>  }
>  #endif
>  
> +/**
> + * restore_exclusive_pte - Restore a device-exclusive entry
> + * @vma: VMA covering @address
> + * @folio: the mapped folio
> + * @page: the mapped folio page
> + * @address: the virtual address
> + * @ptep: PTE pointer into the locked page table mapping the folio page
> + * @orig_pte: PTE value at @ptep
> + *
> + * Restore a device-exclusive non-swap entry to an ordinary present PTE.
> + *
> + * The folio and the page table must be locked, and MMU notifiers must have
> + * been called to invalidate any (exclusive) device mappings. In case of
> + * fork(), MMU_NOTIFY_PROTECTION_PAGE is triggered, and in case of a page
> + * fault MMU_NOTIFY_EXCLUSIVE is triggered.
> + *
> + * Locking the folio makes sure that anybody who just converted the PTE to
> + * a device-private entry can map it into the device, before unlocking it; so
> + * the folio lock prevents concurrent conversion to device-exclusive.

I don't quite follow this - a concurrent conversion would already fail
because the GUP in make_device_exclusive_range() would most likely cause
an unexpected reference during the migration. And if a migration entry
has already been installed for the device private PTE conversion then
make_device_exclusive_range() will skip it as a non-present entry anyway.

However s/device-private/device-exclusive/ makes sense - the intent was to allow
the device to map it before a call to restore_exclusive_pte() (ie. a CPU fault)
could convert it back to a normal PTE.

> + * TODO: the folio lock does not protect against all cases of concurrent
> + * page table modifications (e.g., MADV_DONTNEED, mprotect), so device drivers
> + * must already use MMU notifiers to sync against any concurrent changes

Right. It's expected drivers are using MMU notifiers to keep page tables in
sync, same as for hmm_range_fault().

> + * Maybe the requirement for the folio lock can be dropped in the future.
> + */
>  static void restore_exclusive_pte(struct vm_area_struct *vma,
>  		struct folio *folio, struct page *page, unsigned long address,
>  		pte_t *ptep, pte_t orig_pte)
> -- 
> 2.48.1
> 
