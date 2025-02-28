Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20647A48EAA
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 03:34:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3978E10EBDB;
	Fri, 28 Feb 2025 02:34:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="qBspN3/E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2042.outbound.protection.outlook.com [40.107.94.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5349510EBDB;
 Fri, 28 Feb 2025 02:34:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HILpZdHUyK4LwBs6sFsGoekTLE4Wori0MFXMWdYuhbdBnz6krzbYr21srrDeUfMzc8PQeIXb5rsUd7BReA/iA+kXxW7etDI1/yfOAzB/Ip3Hxf5w3VTDlwerVxiBpSAznH2PklNcYwJFn/qsBUtnHlSgy/hqFRXSD0x5JfKPj4f6Tesx7YoXSE7LMoscPmZXtXyKLdhMabfidK/KmXVuv/YgnIJTtaahq5x38skUzb7YXTyYLi+N+3zOIIuRK31pc4oylsjCE9YDqz4T6ODvH6uYLX6qa3M0wyWk0PPp5CX+4MsenD+V0EiMKY+F0C3VMfaFCyLTzI9rPZre7k3lkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IixhYQjeMFYJVrdRVLXw7vjTYxFy9vcVNLMmorKZ96w=;
 b=Mrideq+V/yQ54hJlxIg3uywpIzdf4XamejlG+j4Iib0VoW/nc/6WIk86gXOWTD9YtjqJwqaeQ2Wid4WyAcP+80fGpKy4k8Sd+wvuuHn0b80sIs+mLXNsG/WuhW6BpG+qQnihSI2hR5BpXgcMtlbq0ciMA6IDoiEmvfHQbff8UL+Ig1OnLvVVfbUOKHQQmzgUCyKPjod/FVWb6Vs9HxqeiIwAs7YSzgMQZJdx6VRL3P8ep77rkgfIbKPYlFHmrQDyVXcEud8Pz3HiAj1He/qHts6B87UpKqBPuHI4caeADpO9Uk3oIuVl3DXuRCtc3yuVva9FHu7hjrELGn1Cj7MfmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IixhYQjeMFYJVrdRVLXw7vjTYxFy9vcVNLMmorKZ96w=;
 b=qBspN3/E5aPBfjyy0Axg1TleHaNu+mQMNkjJsfAK4wQ0atWrQ9GvmvtmWqAzOmXBbB1UMuyjSk1+5wJCQsQHKdzdy3UUAMSYijLKd9YoERdbiuUI4oVQYwdz1o0mnlNIb7iMV7UPqt6waBUIxRil2DShi+l2vaXKl8KX+Me+G0KEW/40UCS25t+2VvDG1ZhiKgQMKRJe2Vi59aQIvWAgXDR+cQAXykcjEnL+EVg0wRVU1pHeddlIdd5NtPMB7PH4myoVdZpphzBu0GF4ywp94AbjzaEMM0OcJOgvZ0Aw56wIHNr3NEZA0wS9SJPDH80vBK8Hr5zsr675be2FkwwJew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 DM3PR12MB9325.namprd12.prod.outlook.com (2603:10b6:0:46::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8489.22; Fri, 28 Feb 2025 02:34:47 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%7]) with mapi id 15.20.8489.018; Fri, 28 Feb 2025
 02:34:47 +0000
Date: Fri, 28 Feb 2025 13:34:42 +1100
From: Alistair Popple <apopple@nvidia.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 himal.prasad.ghimiray@intel.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, 
 simona.vetter@ffwll.ch, felix.kuehling@amd.com, dakr@kernel.org
Subject: Re: [PATCH v6 32/32] drm/doc: gpusvm: Add GPU SVM documentation
Message-ID: <cnt7o3wvgv37cfxsdothxv6agwi7nkqfqn37mafsyhl64h4lnv@rw7rbaha3au4>
References: <20250225044311.3178695-1-matthew.brost@intel.com>
 <20250225044311.3178695-33-matthew.brost@intel.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250225044311.3178695-33-matthew.brost@intel.com>
X-ClientProxiedBy: SY5P282CA0048.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:20a::7) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|DM3PR12MB9325:EE_
X-MS-Office365-Filtering-Correlation-Id: d571df14-df8f-480f-a99f-08dd57a0778a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?KSgD40rX+ze+fhuOLCiLmHtkECWf5GhVHm8rwg7vXxNIPrbhm64ZkcLhBz?=
 =?iso-8859-1?Q?5PSX5Ur7fFQjG2GoTbIgoz8DD4qGkXR9Zfy8kFWXdEB0dWSvhlJdZoj0Ea?=
 =?iso-8859-1?Q?5gOyJnVdIWDKN5knNeLZNS1d22ZQdmoCShCT9YbVpdezzgRQu+vNZc6whq?=
 =?iso-8859-1?Q?6T+Y99TC4LwsY+nkqYntaig6XZ/krcfQ0sa879E2+v1+hJf/1HhzTe+/o6?=
 =?iso-8859-1?Q?NeY3cw+mD8bmc8HVTtImlCfGq/kwOh8q4btYs0rFpUFM6uO+aWZgfELmub?=
 =?iso-8859-1?Q?hcAwsL3+R4FUEjwRggilpbyAIidelD9ggZA/c/xiY56g07qgzREzWEUGwO?=
 =?iso-8859-1?Q?6P9Hu45guwaSgqlNGpSjKWZ1bI+5pTKw53AuGT/SX9RO1nYlVd45y+2vYf?=
 =?iso-8859-1?Q?INQ7rMT0FB1X4A89opALJfL0i98/qVtp8X8j/XjEq+Tmrzn5f0uZr6G6Ow?=
 =?iso-8859-1?Q?4ZiUYd50MdJK2emQLL2l/K7UACcrm+GfZTb1TN7wkJMhickSW34HzgIPgx?=
 =?iso-8859-1?Q?LgOwiJ6sv8brfk5qanwFiUISBavgjcJNKD0HB2YsYAEVK8q5QtMZfouifl?=
 =?iso-8859-1?Q?9llml26K5mbKYlm2xtcEX1fIMZu1ocYpnIkqtEv13LgLuiLYHLHhWXGlvh?=
 =?iso-8859-1?Q?/L6BG5NIrfMiodyDmiSdbAxum4APHZ+yMTBVXdPYgnh0+1WS0qTnQGTxYO?=
 =?iso-8859-1?Q?ApXdKfWFo9CQcKmSTg3B6SllywDmeeYr0NX9DabvyGvF/GjvpiSoZnzOt7?=
 =?iso-8859-1?Q?LCBIcxsDssbO2Zb6po9pst/PP7PV4ws3OBtv5WcHlZKtfk1u5Kgp0/UWre?=
 =?iso-8859-1?Q?h+vhMYPHlpXxdlqooD+bpGq/vVtuit8clB8zKklkjNRMHjlYJbezcasLeh?=
 =?iso-8859-1?Q?jJNTdmDKbipTKrwt0LXSczAyROro2rLuk6QymStAdIlKVQUb6Iww9LuvM6?=
 =?iso-8859-1?Q?G08c2O3BaIE2jR3nkYTn0yNumke9+JM2f3b8Ex6IN0Wvs7pl2x/2Xpe4sI?=
 =?iso-8859-1?Q?XhDXpjq0Z2jdEBPGiKxNLDEUi2ObFzgKWHjNX66mLpujbi9hvXgflazmKJ?=
 =?iso-8859-1?Q?bIOHhvEVrKA6GNKxMmoqiLGlcye4eCNEjaEQGUetSWKX2MyOZKlrzB96s2?=
 =?iso-8859-1?Q?FfNMx3YleAWdcqSEp1VMkt3TLUaAVKI2wNR/SAoBK4Q9Q52GdldRM8/B8i?=
 =?iso-8859-1?Q?O9JUY9nR3mmWo+ejXUXQU9Ef3h+BZkJXt1imVDq4u2sLVly+jnDhiDnniz?=
 =?iso-8859-1?Q?QfgNqqBK7B5L4RaumWl+YmCfzpV3Qyn1n0jv++L5aG+Boxpu5iA4admYk0?=
 =?iso-8859-1?Q?ZDqzj41oAbnDwN9OQw10atvftbEWtjUziv+ooPtaFZO0Uh8RRgJfxnAi+t?=
 =?iso-8859-1?Q?05xgg/Aa+sOK12F6AbNjA3Cb//SPgcMKHk9vrfECqpBlE1ybnElWVyO7IX?=
 =?iso-8859-1?Q?uU1ucxz6qZCxxMAf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?qjTPuYRuU+qmwYszZlJKYmdxEQrM0XLyZyJeMHpk6pZbStNvARBMYCZ912?=
 =?iso-8859-1?Q?YRv8wGBKqMy3Yv426MxbwKJIM1QVliMYAwBRFrA3MlcY9Y6/cjlVvvLpcw?=
 =?iso-8859-1?Q?qc+b5sENXmcwy8EpbsI5V1yP/f3uhU2O+sEU+SmgA0jzjvaS5BwCm7aygQ?=
 =?iso-8859-1?Q?mT83CDS15JEqbrZkrdphkWUlv8WKZM/gEwVyqBc7yctmob+kMViHg5+8ZL?=
 =?iso-8859-1?Q?SYKLXz5SpYpWpj1nl3q/U9tG7lS795ZuEJTlYKT2LntOVkAq6eLfJZEfSO?=
 =?iso-8859-1?Q?SLzdgF+42hwcm4vdi7QOjKMiAwZS903/Hc0B7ydf980YYQY7FNc6VjOY/t?=
 =?iso-8859-1?Q?zvpOJdu3kxmrTo0zOma5DvdeQY6BUzqH1AkFPdr5WTIW4ir4KEk0kfq4wM?=
 =?iso-8859-1?Q?8D9ZntjRMnwCPwW0r5t6uAinsSmsuFCe+g0GDJaOVd7dmpZFbycE/RJ3J3?=
 =?iso-8859-1?Q?59NNcd6QvFdSVldO4hopWJnH10w0kSKaCJpawhsk5ZBnerGKK5pF94QcIa?=
 =?iso-8859-1?Q?BlJNiR5plwte6YixV/NNJsnGWVIgR6BwAnkEZSQ3InUKMQQ/HbTRtd2ptB?=
 =?iso-8859-1?Q?dqTqcEMWtiMTKV1WPxVPWkAXPfjfPAUknA02FnvIFg4sqt9RygKWzba5xF?=
 =?iso-8859-1?Q?WvqphOwCBsQ3MLjsPUdlpW+b4sTZFsae7gXomcfFpTOdpnlfoBlZq8fFiO?=
 =?iso-8859-1?Q?HPM2XFjOuNgnCZTg8+XNfmW6ILNeYWIXrTm3CQO8VRmDBH6d4rMdtoSLj6?=
 =?iso-8859-1?Q?1lnyomUMsuIU8LkHVpQKna51WawbgJFhnu8lsXKOt5oA6HZTx3vjDwcY2E?=
 =?iso-8859-1?Q?4o93MKL+jw2a+OdhJHKDQhkkJMLhl5hvjKREmCN4elqD2/Q9CO4bF5DwrM?=
 =?iso-8859-1?Q?OPoYF0WuqrTES4p/6R6ox6mOi+qlrungtRG+yyotElFSHfnVZMXYpK84j/?=
 =?iso-8859-1?Q?P+b/CPJY4Q8HBfwzWYISft5+vrRVqdOaP8DQEDbY2f/GrRE5/djRFs7lth?=
 =?iso-8859-1?Q?Pd0ZRxNhpQ1H9NhH8wqEV6+aykJdXqwzCIarETzVi30SB6wirG3H/FFEpO?=
 =?iso-8859-1?Q?cif06sfaU+V7uFf6G2OdiIRMI+Wa1SGOBYW1QMg7gMpa+DyuVsnFLdx+nF?=
 =?iso-8859-1?Q?dWVRJ4KwxI9IJlDmLe35mMc7dmMnnEWKlv8ruj7v7C7ISI1rzaNPvLFMrV?=
 =?iso-8859-1?Q?tTsKWRund4+SA5R0NG/LGsFWjOkfgLB6bh6P+ZFlf2893BNmsTUawUFsUC?=
 =?iso-8859-1?Q?uKJMdEtHX67RFscTs0aT4dKhjv+uDMxED3GH+ZxhV4nLKMsdkgAM2wdBcL?=
 =?iso-8859-1?Q?NGJ4eDLTSCaP3HP2PV1W2M5ZZUbYGWfj6l3B6Hyt65bN1fupAnKPheKbIF?=
 =?iso-8859-1?Q?IbMFLk0QxuHSjBMdrk2n1gQmIUTCKpoWXV9KDKQaoX3jesD4yaLIebMWsY?=
 =?iso-8859-1?Q?4sDB3hhEP6KzGhCSAr3VWWHIc86KAbUF0LQWc0ab8SvhCRxdxWusugG+vG?=
 =?iso-8859-1?Q?WE7oA/Wm4mxi+GGoZKMZqzCYR1pIthotlrnL3LH3E44G80Q/lvms7DZaXo?=
 =?iso-8859-1?Q?g1vSt2yVP2gR9NuBRH/eOrSSo8kjnM/Rm18sSTfVJUBWjQU1GZva5P1Zfy?=
 =?iso-8859-1?Q?qcwLPDN8YiIPvKZxy5VRip+8m1RCf+rz4d?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d571df14-df8f-480f-a99f-08dd57a0778a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 02:34:47.0096 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jdxZXExchknCYrKUc1ECOv2+k+3ZY6Xs/bfd8kP+WcEVGp2cs+WE/IczlDHltJe3zsuec+kUMiNGuEx+MYqLmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9325
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

On Mon, Feb 24, 2025 at 08:43:11PM -0800, Matthew Brost wrote:
> Add documentation for agree upon GPU SVM design principles, current
> status, and future plans.

Thanks for writing this up. In general I didn't see anything too controversial
but added a couple of comments below.

> 
> v4:
>  - Address Thomas's feedback
> v5:
>  - s/Current/Basline (Thomas)
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  Documentation/gpu/rfc/gpusvm.rst | 84 ++++++++++++++++++++++++++++++++
>  Documentation/gpu/rfc/index.rst  |  4 ++
>  2 files changed, 88 insertions(+)
>  create mode 100644 Documentation/gpu/rfc/gpusvm.rst
> 
> diff --git a/Documentation/gpu/rfc/gpusvm.rst b/Documentation/gpu/rfc/gpusvm.rst
> new file mode 100644
> index 000000000000..063412160685
> --- /dev/null
> +++ b/Documentation/gpu/rfc/gpusvm.rst
> @@ -0,0 +1,84 @@
> +===============
> +GPU SVM Section
> +===============
> +
> +Agreed upon design principles
> +=============================

As a general comment I think it would be nice if we could add some rational/
reasons for these design principals. Things inevitably change and if/when
we need to violate or update these principals it would be good to have some
documented rational for why we decided on them in the first place because the
reasoning may have become invalid by then.

> +* migrate_to_ram path
> +	* Rely only on core MM concepts (migration PTEs, page references, and
> +	  page locking).
> +	* No driver specific locks other than locks for hardware interaction in
> +	  this path. These are not required and generally a bad idea to
> +	  invent driver defined locks to seal core MM races.

In principal I agree. The problem I think you will run into is the analogue of
what adding a trylock_page() to do_swap_page() fixes. Which is that a concurrent
GPU fault (which is higly likely after handling a CPU fault due to the GPU PTEs
becoming invalid) may, depending on your design, kick off a migration of the
page to the GPU via migrate_vma_setup().

The problem with that is migrate_vma_setup() will temprarily raise the folio
refcount, which can cause the migrate_to_ram() callback to fail but the elevated
refcount from migrate_to_ram() can also cause the GPU migration to fail thus
leading to a live-lock when both CPU and GPU fault handlers just keep retrying.

This was particularly problematic for us on multi-GPU setups, and our solution
was to introduce a migration critical section in the form of a mutex to ensure
only one thread was calling migrate_vma_setup() at a time.

And now that I've looked at UVM development history, and remembered more
context, this is why I had a vague recollection that adding a migration entry
in do_swap_page() would be better than taking a page lock. Doing so fixes the
issue with concurrent GPU faults blocking migrate_to_ram() because it makes
migrate_vma_setup() ignore the page.

> +	* Partial migration is supported (i.e., a subset of pages attempting to
> +	  migrate can actually migrate, with only the faulting page guaranteed
> +	  to migrate).
> +	* Driver handles mixed migrations via retry loops rather than locking.
>
> +* Eviction

This is a term that seems be somewhat overloaded depending on context so a
definition would be nice. Is your view of eviction migrating data from GPU back
to CPU without a virtual address to free up GPU memory? (that's what I think of,
but would be good to make sure we're in sync).

> +	* Only looking at physical memory data structures and locks as opposed to
> +	  looking at virtual memory data structures and locks.
> +	* No looking at mm/vma structs or relying on those being locked.

Agree with the above points.

> +* GPU fault side
> +	* mmap_read only used around core MM functions which require this lock
> +	  and should strive to take mmap_read lock only in GPU SVM layer.
> +	* Big retry loop to handle all races with the mmu notifier under the gpu
> +	  pagetable locks/mmu notifier range lock/whatever we end up calling
> +          those.

Again, one of the issues here (particularly with multi-GPU setups) is that it's
very easy to live-lock with rety loops because even attempting a migration that
fails can cause migration/fault handling in other threads to fail, either by
calling mmu_notifiers or taking a page reference.

Those are probably things that we should fix on the MM side, but for now UVM at
least uses a lock to ensure forward progress.

> +	* Races (especially against concurrent eviction or migrate_to_ram)
> +	  should not be handled on the fault side by trying to hold locks;
> +	  rather, they should be handled using retry loops. One possible
> +	  exception is holding a BO's dma-resv lock during the initial migration
> +	  to VRAM, as this is a well-defined lock that can be taken underneath
> +	  the mmap_read lock.

See my earlier comments. Although note I agree with this in principal, and we do
just retry if taking the lock fails.

> +* Physical memory to virtual backpointer
> +	* Does not work, no pointers from physical memory to virtual should
> +	  exist.

Agree. And my rational is because core-MM can update the virtual address for a
page without notifying a driver of the new address. For example with mremap().
So it's impossible to keep any backpointer to a virtual address up to date.

> +	* Physical memory backpointer (page->zone_device_data) should be stable
> +	  from allocation to page free.

Agree. And presumably the rational is because it is very difficult to safely
update page->zone_device_data and ensure there aren't concurrent users of it
unless the page is free (ie. has a 0 refcount)?

> +* GPU pagetable locking
> +	* Notifier lock only protects range tree, pages valid state for a range
> +	  (rather than seqno due to wider notifiers), pagetable entries, and
> +	  mmu notifier seqno tracking, it is not a global lock to protect
> +          against races.
> +	* All races handled with big retry as mentioned above.

Sounds reasonable.

> +Overview of current design
> +==========================
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

I don't see much of a need, but also don't see any barriers on the MM side for
doing that.

> +* Multi-GPU support
> +	* Work in progress and patches expected after initially landing on GPU
> +	  SVM.
> +	* Ideally can be done with little to no changes to GPU SVM.

See above, but I mostly agree.

> +* Drop ranges in favor of radix tree
> +	* May be desirable for faster notifiers.
> +* Compound device pages
> +	* Nvidia, AMD, and Intel all have agreed expensive core MM functions in
> +	  migrate device layer are a performance bottleneck, having compound
> +	  device pages should help increase performance by reducing the number
> +	  of these expensive calls.

I'm hoping my patch series[1] to allow for compound device pages will land in v6.15
as well. The next steps are extending that to DEVICE_PRIVATE pages with
migrate_vma_setup() and migrate_to_ram() and we have been making some good
progress on this internally. I hope to have something posted before LSFMM.

The other thing we have been looking at here is being able to migrate
file-backed pages to GPU memory.

[1] - https://lore.kernel.org/linux-mm/cover.a782e309b1328f961da88abddbbc48e5b4579021.1739850794.git-series.apopple@nvidia.com/

> +* Higher order dma mapping for migration
> +	* 4k dma mapping adversely affects migration performance on Intel
> +	  hardware, higher order (2M) dma mapping should help here.
> +* Build common userptr implementation on top of GPU SVM
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
