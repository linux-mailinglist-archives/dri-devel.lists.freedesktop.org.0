Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5C9188723
	for <lists+dri-devel@lfdr.de>; Tue, 17 Mar 2020 15:17:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A99686E1E9;
	Tue, 17 Mar 2020 14:16:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com
 [IPv6:2607:f8b0:4864:20::f42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 472B36E4AA
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Mar 2020 19:04:45 +0000 (UTC)
Received: by mail-qv1-xf42.google.com with SMTP id o18so9474779qvf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Mar 2020 12:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=BWUlD7DMxUCjadcoWlHWZLSyInqh6sPVvbrJFhGcEXw=;
 b=b4PO6Gx41wgIvNR75/iEEHqP7YeAWOo5I4vM1hYEixFuze+GD6DaYqoq6TC5z6ZmrJ
 Ay/5Z5n3+GxgulTlewop2xKyUtwkOsk/3xSb3Dci9QGrROQg0xNI4SUrd6gZB6+izdNe
 N1pEZM8nEhG8cFaafaI7oaJVEsr/RZaSPAOGp/dvEqzcI/FlL1EmhGf5oLnxpn5fsFMX
 0vDAhrju1L63wESfxt4lt2sv7hw8jBZVFlY4uyOJvCMiAZXPlnY61hAjM+L2/9omI9RE
 eSIpwURT9g78RsWcH396M8bdPtPAtYe5mLGXoaunFXluYfTsfHTzArNAe1Kq2Vj3zALv
 DJlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=BWUlD7DMxUCjadcoWlHWZLSyInqh6sPVvbrJFhGcEXw=;
 b=FbZrAFHKsAViqlyWRNcTNcKuLNqPYnXIrCqF3Nvl8YwoGCp+w+oFFo+PpDarbyHCwI
 opwSb5MiboU4kdUrbPyZbTYDODcR6zNCynhCIzn9oMRQT+Ntqcu2mx6E/VV/s9rglBwX
 V9saVk7aCafSniz4im255AIEuHL91M7H4WWYOO9e7Btzb4f40PMLjh/D8hhE+D1oh8ra
 3L02m35Gt/boYhFbUTHzrqBo9225QJqRGVDhf5S1++LvDJosfkRBXQxJMWeG+Hb9+UQE
 Sc+xryKrNJyPnrRRzuok5Dfj0A1fq/AP/DB7uK2s01POy/Ytc+u/IH+VOPKlseRm4Q3X
 JZ/A==
X-Gm-Message-State: ANhLgQ2jCH1QGYdbmtg1mujuy+OiI8BKC20msgPCPFTfmo5L4Jp3ThE8
 T6gZziuJoV/FqJAjcVjnz+FDWA==
X-Google-Smtp-Source: ADFU+vupCuGjSfz+zG9xNUf8/b9EmEfqnAO4l1aoYhG7XjmfvRH/QvbrSw7U+oPGZcF3Uap4STtBfQ==
X-Received: by 2002:ad4:4847:: with SMTP id t7mr1236975qvy.237.1584385484358; 
 Mon, 16 Mar 2020 12:04:44 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id x19sm407776qtm.47.2020.03.16.12.04.43
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 16 Mar 2020 12:04:43 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jDv2Z-0006k6-7W; Mon, 16 Mar 2020 16:04:43 -0300
Date: Mon, 16 Mar 2020 16:04:43 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: [PATCH 2/2] mm: remove device private page support from
 hmm_range_fault
Message-ID: <20200316190443.GM20941@ziepe.ca>
References: <20200316175259.908713-1-hch@lst.de>
 <20200316175259.908713-3-hch@lst.de>
 <c099cc3c-c19f-9d61-4297-2e83df899ca4@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c099cc3c-c19f-9d61-4297-2e83df899ca4@nvidia.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Tue, 17 Mar 2020 14:16:40 +0000
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
Cc: amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kvm-ppc@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, linux-mm@kvack.org,
 Jerome Glisse <jglisse@redhat.com>, Ben Skeggs <bskeggs@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>, Bharata B Rao <bharata@linux.ibm.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 16, 2020 at 11:42:19AM -0700, Ralph Campbell wrote:
> 
> On 3/16/20 10:52 AM, Christoph Hellwig wrote:
> > No driver has actually used properly wire up and support this feature.
> > There is various code related to it in nouveau, but as far as I can tell
> > it never actually got turned on, and the only changes since the initial
> > commit are global cleanups.
> 
> This is not actually true. OpenCL 2.x does support SVM with nouveau and
> device private memory via clEnqueueSVMMigrateMem().
> Also, Ben Skeggs has accepted a set of patches to map GPU memory after being
> migrated and this change would conflict with that.

Other than the page_to_dmem() possibly doing container_of on the wrong
type pgmap, are there other bugs here to fix?

Something like this is probably close to the right thing to fix that
and work with Christoph's 1/2 patch - Ralph can you check, test, etc?

diff --git a/mm/hmm.c b/mm/hmm.c
index 9e8f68eb83287a..9fa4748da1b779 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -300,6 +300,20 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
 				range->flags[HMM_PFN_DEVICE_PRIVATE];
 			cpu_flags |= is_write_device_private_entry(entry) ?
 				range->flags[HMM_PFN_WRITE] : 0;
+
+			/*
+			 * If the caller understands this kind of device_private
+			 * page, then leave it as is, otherwise fault it.
+			 */
+			hmm_vma_walk->pgmap = get_dev_pagemap(
+				device_private_entry_to_pfn(entry),
+				hmm_vma_walk->pgmap);
+			if (!unlikely(!pgmap))
+				return -EBUSY;
+			if (hmm_vma_walk->pgmap->owner !=
+			    hmm_vma_walk->dev_private_owner)
+				cpu_flags = 0;
+
 			hmm_pte_need_fault(hmm_vma_walk, orig_pfn, cpu_flags,
 					   &fault, &write_fault);
 			if (fault || write_fault)

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
