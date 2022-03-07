Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DEE4CFF67
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 14:01:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4936B10F30B;
	Mon,  7 Mar 2022 13:01:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E2C210F30B;
 Mon,  7 Mar 2022 13:01:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 10C6661197;
 Mon,  7 Mar 2022 13:01:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21564C340E9;
 Mon,  7 Mar 2022 13:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646658066;
 bh=vNwLmHMPAuTNQ58SyXP5JOCzc1E/QIa9EAucHhxuwk4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uvdN7XqNAxzEAmE9bN4/uMtzHnmxTF8Bf1x603RX/KNlDIprB9VVaWZhQeHHnpzbB
 L4kxbqOzloAbu6i7BoQuYqHyMOyLIeQm5T/Xe9xRq6c/W5XBudU0rcZiYQpMIqW8K8
 1un6it52tzYgjHiFXgaZvOMiGyPNX8+j799swQCbH5hFeVmQIpZ6iuDIBfN618OhEW
 E3SyRB41KCkHqiZUuZ0YCU6MdmAWosgy6SdJC1dEwmvD9h3AKYZQWeH4JTR8WfP89z
 OZU/YwJS8GT7u3ZHIoY0Pijc0jpcUbZjNcaA6ewtS9TXcLeg8b87/dA7oNopSl/pXR
 0BIy9frXh9DtQ==
Date: Mon, 7 Mar 2022 15:00:25 +0200
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH RFC v2] mm: Add f_ops->populate()
Message-ID: <YiYB6WWz8cbvaAqX@iki.fi>
References: <20220306032655.97863-1-jarkko@kernel.org>
 <20220306152456.2649b1c56da2a4ce4f487be4@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220306152456.2649b1c56da2a4ce4f487be4@linux-foundation.org>
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
Cc: codalist@telemann.coda.cs.cmu.edu, jaharkes@cs.cmu.edu,
 Nathaniel McCallum <nathaniel@profian.com>, linux-unionfs@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Dave Hansen <dave.hansen@linux.intel.com>,
 linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, Reinette Chatre <reinette.chatre@intel.com>,
 linux-sgx@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Mar 06, 2022 at 03:24:56PM -0800, Andrew Morton wrote:
> On Sun,  6 Mar 2022 05:26:55 +0200 Jarkko Sakkinen <jarkko@kernel.org> wrote:
> 
> > Sometimes you might want to use MAP_POPULATE to ask a device driver to
> > initialize the device memory in some specific manner. SGX driver can use
> > this to request more memory by issuing ENCLS[EAUG] x86 opcode for each
> > page in the address range.
> 
> Why is this useful?  Please fully describe the benefit to kernel users.
> Convince us that the benefit justifies the code churn, maintenance
> cost and larger kernel footprint.
> 
> Do we know of any other drivers which might use this?

Brutal honesty: I don't know if any other drivers would use this but
neither I would not be surprised if they did. The need for this might
very well be "masked" by ioctl API's.  I was first proposing a ioctl
for this but Dave suggested to at least try out this route.

> > Add f_ops->populate() with the same parameters as f_ops->mmap() and make
> > it conditionally called inside call_mmap(). Update call sites
> > accodingly.
> 
> spello

Thanks, I noticed that but did not want to spam with a new version just
because of that :-)

> 
> > -static inline int call_mmap(struct file *file, struct vm_area_struct *vma)
> > +static inline int call_mmap(struct file *file, struct vm_area_struct *vma, bool do_populate)
> >  {
> > -	return file->f_op->mmap(file, vma);
> > +	int ret = file->f_op->mmap(file, vma);
> > +
> > +	if (!ret && do_populate && file->f_op->populate)
> > +		ret = file->f_op->populate(file, vma);
> > +
> > +	return ret;
> >  }
> 
> Should this still be inlined?

I think it might make sense at least to have call_mmap_populate() so and
mmap_region_populate() instead of putting that boolean parameter to every
flow (based on Greg's feedback). But only if this implementation approach
is used in the first place.

As said, I chose to use RFC to pinpoint a bottleneck for us, not claiming
that this would be the best possible way to work around it.

BR, Jarkko
