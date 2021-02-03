Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C02130D4F5
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 09:14:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B69E6EA18;
	Wed,  3 Feb 2021 08:13:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 042136E237
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 01:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=QFRyLZQvy4ORvvMG6SE1r1pZqMndDwp/jNnta/YZPo8=; b=HdDDoWTb8bo9AwL1G5w2J7c9ny
 j9Kua+EMQKkyR33mcx4U6ibju3pWjrJGQa02FxuTrLNz9NBpwLaKOvLfpaXV22U0v1Sx6SUkWumSy
 b+9rFFzl8yXHvy1u97aR2dVMeG2MC+qkdmQoNwdKcSMBjvjrsnZDKdAQVIDt/wtpYp0unwvRLJ4UC
 m86VphVHnSR9fSiWoorXllaHjnU3wmYZU3k5LO7GZD+v1R/y8v3lDqvGEZdCzjy5bU8uc9DjdlI9G
 DG7cOhCNVxr7TcvyPCzO5Topma3ZvmP8uG91WBbYdaAb7AGxYKJLcWJFwRgRGCzQYpYBlutPt9UOz
 c4nNEUFA==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1l77Ob-00G1Gl-Gl; Wed, 03 Feb 2021 01:55:54 +0000
Date: Wed, 3 Feb 2021 01:55:53 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH 1/2] mm: replace BUG_ON in vm_insert_page with a return
 of an error
Message-ID: <20210203015553.GX308988@casper.infradead.org>
References: <20210203003134.2422308-1-surenb@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210203003134.2422308-1-surenb@google.com>
X-Mailman-Approved-At: Wed, 03 Feb 2021 08:13:07 +0000
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
Cc: linaro-mm-sig@lists.linaro.org, orjan.eide@arm.com, sspatil@google.com,
 christian.koenig@amd.com, kernel-team@android.com, jajones@nvidia.com,
 linux-kernel@vger.kernel.org, lmark@codeaurora.org, hch@infradead.org,
 minchan@kernel.org, linux-mm@kvack.org, dri-devel@lists.freedesktop.org,
 cgoldswo@codeaurora.org, hridya@google.com, akpm@linux-foundation.org,
 labbott@redhat.com, robin.murphy@arm.com, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 02, 2021 at 04:31:33PM -0800, Suren Baghdasaryan wrote:
> Replace BUG_ON(vma->vm_flags & VM_PFNMAP) in vm_insert_page with
> WARN_ON_ONCE and returning an error. This is to ensure users of the
> vm_insert_page that set VM_PFNMAP are notified of the wrong flag usage
> and get an indication of an error without panicing the kernel.
> This will help identifying drivers that need to clear VM_PFNMAP before
> using dmabuf system heap which is moving to use vm_insert_page.

NACK.

The system may not _panic_, but it is clearly now _broken_.  The device
doesn't work, and so the system is useless.  You haven't really improved
anything here.  Just bloated the kernel with yet another _ONCE variable
that in a normal system will never ever ever be triggered.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
