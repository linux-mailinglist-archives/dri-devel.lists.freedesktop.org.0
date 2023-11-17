Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2277EED95
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 09:33:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38C9610E13A;
	Fri, 17 Nov 2023 08:33:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A72610E13A;
 Fri, 17 Nov 2023 08:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700209995; x=1731745995;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=LadFFOa9cUtU7ECOTPF5KVOGh+N1azQgLZ4EmevYVpc=;
 b=SU3UIyebWj6jGxHRvX05dBpekQ3zEExgY9zDPj9Cza05QwwJa/uFxuKk
 Xu0VPEg53DQ9vX3zskiOb7rCVhXDKlL96mIrpWuuaCgdTJD4v4IF15/E1
 uEiLLzSYU+0Vmj0NGR5RdHW0DMVZdlShBQXsOWHBDLJzgNqTzL84Nx0zx
 sYhfnC8BRaHYSaIlESiNxNuS/5Z2eVnltb9N/h1nOSvo/qaqJlh+GXDWm
 qRkTBBJKgopU5+5yuChI7WzHWU+yXkGOVSyYpR1Lir8efG2XT0Z2YTARd
 aRP6b2gCmHTlYdCQR5FaWUdi8E5XYrspDa1lqYb7R25jBQLULBhm4pE5z g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="422355779"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="422355779"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 00:33:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="13846915"
Received: from jpoulsen-mobl.ger.corp.intel.com (HELO [10.249.254.136])
 ([10.249.254.136])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 00:33:11 -0800
Message-ID: <a1cbe3e8-2b2c-150a-7919-65bdd38f75be@linux.intel.com>
Date: Fri, 17 Nov 2023 09:33:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4] Documentation/gpu: VM_BIND locking document
Content-Language: en-US
To: Bagas Sanjaya <bagasdotme@gmail.com>, intel-xe@lists.freedesktop.org
References: <20231115124937.6740-1-thomas.hellstrom@linux.intel.com>
 <ZVYVk8KutkQE0RDU@archie.me>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <ZVYVk8KutkQE0RDU@archie.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Oak Zeng <oak.zeng@intel.com>, Boris Brezillon <boris.brezillon@collabora.com>,
 Danilo Krummrich <dakr@redhat.com>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


On 11/16/23 14:13, Bagas Sanjaya wrote:
> On Wed, Nov 15, 2023 at 01:49:37PM +0100, Thomas Hellström wrote:
>> +TODO: Pointer to the gpuvm code implementation if this iteration and
> "... implementation of this iteration ..."
>
>> +Using a MMU notifier for device DMA (and other methods) is described in
>> +`this document
>> +<https://docs.kernel.org/core-api/pin_user_pages.html#case-3-mmu-notifier-registration-with-or-without-page-faulting-hardware>`_.
> You can use internal linking instead:
>
> ---- >8 ----
> diff --git a/Documentation/core-api/pin_user_pages.rst b/Documentation/core-api/pin_user_pages.rst
> index d3c1f6d8c0e0ec..6b5f7e6e7155fb 100644
> --- a/Documentation/core-api/pin_user_pages.rst
> +++ b/Documentation/core-api/pin_user_pages.rst
> @@ -153,6 +153,8 @@ NOTE: Some pages, such as DAX pages, cannot be pinned with longterm pins. That's
>   because DAX pages do not have a separate page cache, and so "pinning" implies
>   locking down file system blocks, which is not (yet) supported in that way.
>   
> +.. _mmu-notifier-registration-case:
> +
>   CASE 3: MMU notifier registration, with or without page faulting hardware
>   -------------------------------------------------------------------------
>   Device drivers can pin pages via get_user_pages*(), and register for mmu
> diff --git a/Documentation/gpu/drm-vm-bind-locking.rst b/Documentation/gpu/drm-vm-bind-locking.rst
> index bc701157cb3414..08b6a47a6e592f 100644
> --- a/Documentation/gpu/drm-vm-bind-locking.rst
> +++ b/Documentation/gpu/drm-vm-bind-locking.rst
> @@ -366,8 +366,7 @@ need to care about, but so far it has proven difficult to exclude
>   certain notifications.
>   
>   Using a MMU notifier for device DMA (and other methods) is described in
> -`this document
> -<https://docs.kernel.org/core-api/pin_user_pages.html#case-3-mmu-notifier-registration-with-or-without-page-faulting-hardware>`_.
> +:ref:`pin_user_pages() documentation <mmu-notifier-registration-case>`.
>   
>   Now the method of obtaining struct page references using
>   get_user_pages() unfortunately can't be used under a dma_resv lock
>
> Thanks.
>
Thanks. I'll take a look at doing this as well.

Thomas



