Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8AA3F27C9
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 09:45:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 144086EA30;
	Fri, 20 Aug 2021 07:45:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 575966EA2C;
 Fri, 20 Aug 2021 07:24:36 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id w5so18288587ejq.2;
 Fri, 20 Aug 2021 00:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=hackIAZ3S1L343gFXtpY/gtSDJbx92UQ+Z1VIutr7Q4=;
 b=g5yqqWSA4TLqINjr1gWlzC3DhuGDPMwW2AAzRfYhxUb7bYXOzF6Ib490yt1JaYTU8T
 wfHDhznvJ+7YGogl+Sr1RkAbH5LSmuosTtBFlIlSDkdHsWxZtrD6kYgUtggf7S8rl9AM
 ka2pLHFhvIHXWAZcVD7XlOPLd2OrUwFosIHlUdvYbrPxmhm+uQJA7Xj2NCNxfY9MYQ5Z
 ZOKMbyArtXZtYfDk1czutDEhL16nNZe5pKW+p53gCX82RVV2iOV2SqswhJh23xq5e3nF
 wU4wK8uBSSbIrY1ConUJzP2LMLH8Fp5TlfbQBZFyqmgyeCGyg0bpWlovZmKfY9073clk
 uSVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=hackIAZ3S1L343gFXtpY/gtSDJbx92UQ+Z1VIutr7Q4=;
 b=BUErp5xaq0CUD2LlXgfYrJFQ6d2/Cylb+zDTqeyF899IZ64A41zBocHYXWiQH/JNYy
 A3x5SB5JvZzBjbK9ZnSvre4ISxSIk6VovCC8l3yKPuwSGGyd6eUTAhrOibG4nZCFK3fY
 vjp3B5GO6XaXJfXvusMJY90k0m2PJJ95KDedy8KklCu96uz29//5PJmRzw2QGjrVBiYA
 g7GBclh5uxaXOCeoXUvWShbpiQNon0JGhQjaHhIqCxwSlQpYkjvc/BBdV9UCWQ76yZQm
 DLkBVJUjlSd1bYh2hNRof68RMVpeRHjWs5LTSJwWUNklXI2vL/yGlDt8TvvVkbSoqR/0
 rKdA==
X-Gm-Message-State: AOAM533HX9daUvw+p2oSVy/3J71UxD2g66WZ2v9FJ7ILVX9iJCx/OeUv
 NfGTTpsOkR7SVNO8h5P9vmaISC30PEIFwrYv9do=
X-Google-Smtp-Source: ABdhPJwyKQMVEx7L/ikxtW82X48PcfARrIBCnNbsdgDsW8gvfmgcYX6kBNSV0Omk/D8TyPfB2pw1wTOxxepwKUL87Yw=
X-Received: by 2002:a17:906:c1c9:: with SMTP id
 bw9mr20251460ejb.3.1629444274765; 
 Fri, 20 Aug 2021 00:24:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210813063150.2938-1-alex.sierra@amd.com>
 <20210813063150.2938-9-alex.sierra@amd.com>
 <20210815154047.GC32384@lst.de> <7a55366f-bd65-7ab9-be9e-3bfd3aea3ea1@amd.com>
 <20210817055031.GC4895@lst.de> <e5eb53f9-c52a-52e1-5fa0-bb468c0c9c85@amd.com>
 <20210820050504.GB27083@lst.de>
In-Reply-To: <20210820050504.GB27083@lst.de>
From: Jerome Glisse <j.glisse@gmail.com>
Date: Fri, 20 Aug 2021 00:24:22 -0700
Message-ID: <CAH3drwbWPFESOGEOFXQKjkhUPmwDEB3nKwcV=S64FPuTimN_Yw@mail.gmail.com>
Subject: Re: [PATCH v6 08/13] mm: call pgmap->ops->page_free for
 DEVICE_GENERIC pages
To: Christoph Hellwig <hch@lst.de>
Cc: Felix Kuehling <felix.kuehling@amd.com>, Alex Sierra <alex.sierra@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
 Ralph Campbell <rcampbell@nvidia.com>, linux-ext4@vger.kernel.org, 
 linux-xfs@vger.kernel.org, amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, jgg@nvidia.com,
 Jerome Glisse <jglisse@redhat.com>, Roger Pau Monne <roger.pau@citrix.com>, 
 Dan Williams <dan.j.williams@intel.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 20 Aug 2021 07:45:11 +0000
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
Reply-To: j.glisse@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 19, 2021 at 10:05 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Tue, Aug 17, 2021 at 11:44:54AM -0400, Felix Kuehling wrote:
> > >> That's a good catch. Existing drivers shouldn't need a page_free
> > >> callback if they didn't have one before. That means we need to add a
> > >> NULL-pointer check in free_device_page.
> > > Also the other state clearing (__ClearPageWaiters/mem_cgroup_uncharge/
> > > ->mapping = NULL).
> > >
> > > In many ways this seems like you want to bring back the DEVICE_PUBLIC
> > > pgmap type that was removed a while ago due to the lack of users
> > > instead of overloading the generic type.
> >
> > I think so. I'm not clear about how DEVICE_PUBLIC differed from what
> > DEVICE_GENERIC is today. As I understand it, DEVICE_PUBLIC was removed
> > because it was unused and also known to be broken in some ways.
> > DEVICE_GENERIC seemed close enough to what we need, other than not being
> > supported in the migration helpers.
> >
> > Would you see benefit in re-introducing DEVICE_PUBLIC as a distinct
> > memory type from DEVICE_GENERIC? What would be the benefits of making
> > that distinction?
>
> The old DEVICE_PUBLIC mostly different in that it allowed the page
> to be returned from vm_normal_page, which I think was horribly buggy.

Why was that buggy ? If I were to do it now, i would return
DEVICE_PUBLIC page from vm_normal_page but i would ban pinning as
pinning is exceptionally wrong for GPU. If you migrate some random
anonymous/file back to your GPU memory and it gets pinned there then
there is no way for the GPU to migrate the page out. Quickly you will
run out of physically contiguous memory and things like big graphic
buffer allocation (anything that needs physically contiguous memory)
will fail. It is less of an issue on some hardware that rely less and
less on physically contiguous memory but i do not think it is
completely gone from all hw.

> But the point is not to bring back these old semantics.  The idea
> is to be able to differeniate between your new coherent on-device
> memory and the existing DEVICE_GENERIC.  That is call the
> code in free_devmap_managed_page that is currently only used
> for device private pages also for your new public device pages without
> affecting the devdax and xen use cases.

Yes, I would rather bring back DEVICE_PUBLIC then try to use
DEVICE_GENERIC, the GENERIC change was done for users that closely
matched DAX semantics and it is not the case here, at least not from
my point of view.

Jerome
