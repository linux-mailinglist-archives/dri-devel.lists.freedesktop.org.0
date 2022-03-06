Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 961354CEE71
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 00:25:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 287AF10E065;
	Sun,  6 Mar 2022 23:25:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97C3210E059;
 Sun,  6 Mar 2022 23:25:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0FBC5B80F91;
 Sun,  6 Mar 2022 23:24:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CA81C340EC;
 Sun,  6 Mar 2022 23:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1646609097;
 bh=0cqmIug9g7oG6mFioe4WoIPYjd14yu8jFI6WfYAYx2Q=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mJm2xppEGzjgLE/glCcJmV0TehPtxjJ+lycqBJSyvAs8JzXqSIbKWj3rrVFiBbKL5
 7/hnf52KDFrLBN3myrVg4WJ/9WFycZ2QECK8dsmsdk/BG2nBa12rv/S/E+SSIMEqou
 FiTgfJGetklkO9IgIBUfhvpyTJJKyOdhKYjQpqGQ=
Date: Sun, 6 Mar 2022 15:24:56 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Jarkko Sakkinen <jarkko@kernel.org>
Subject: Re: [PATCH RFC v2] mm: Add f_ops->populate()
Message-Id: <20220306152456.2649b1c56da2a4ce4f487be4@linux-foundation.org>
In-Reply-To: <20220306032655.97863-1-jarkko@kernel.org>
References: <20220306032655.97863-1-jarkko@kernel.org>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Sun,  6 Mar 2022 05:26:55 +0200 Jarkko Sakkinen <jarkko@kernel.org> wrote:

> Sometimes you might want to use MAP_POPULATE to ask a device driver to
> initialize the device memory in some specific manner. SGX driver can use
> this to request more memory by issuing ENCLS[EAUG] x86 opcode for each
> page in the address range.

Why is this useful?  Please fully describe the benefit to kernel users.
Convince us that the benefit justifies the code churn, maintenance
cost and larger kernel footprint.

Do we know of any other drivers which might use this?

> Add f_ops->populate() with the same parameters as f_ops->mmap() and make
> it conditionally called inside call_mmap(). Update call sites
> accodingly.

spello

> -static inline int call_mmap(struct file *file, struct vm_area_struct *vma)
> +static inline int call_mmap(struct file *file, struct vm_area_struct *vma, bool do_populate)
>  {
> -	return file->f_op->mmap(file, vma);
> +	int ret = file->f_op->mmap(file, vma);
> +
> +	if (!ret && do_populate && file->f_op->populate)
> +		ret = file->f_op->populate(file, vma);
> +
> +	return ret;
>  }

Should this still be inlined?


