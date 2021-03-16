Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD4E33D83E
	for <lists+dri-devel@lfdr.de>; Tue, 16 Mar 2021 16:53:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E6618907B;
	Tue, 16 Mar 2021 15:52:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AD058907B
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Mar 2021 15:52:56 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id t83so28591730oih.12
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Mar 2021 08:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H9qbH69IBoptMfn8E8EI/JvkYdGz2fb3BHGazwe2dlM=;
 b=N9EuUopTyLYmp/30v4PlCksqyqVrtHnmIWXaZ4XcHcyJlh/IKbvvrNQY1qfiH3e5Ee
 lelk1b8VUwFdD+q76VSpMaPnzL/lvIFOuKBCKDjInKV/GcppAeygsSyrgDsECt+95gH8
 4Hrr19JKU7qUT90Jqgp59LH0ykjG0DfXZI4HE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H9qbH69IBoptMfn8E8EI/JvkYdGz2fb3BHGazwe2dlM=;
 b=pAzNQ9kTI/fFRMQesdtvHL9IaqokuZogDP7V3ECHTHybL3YtGoRIVXdPAbdb/WI1eb
 IocM4Owj65G/eOUhK4aXZQOlnZjkrmsrhhFROOjWKt0r5NuGSV1S0SI355wZ85BbBSY9
 3LwgV5DLiqXqdkSVQyzuGLz4/qrkJ/RFyd1Jk+LaxD5uO7wTPSl5ktTZLMLpj7f5OdUd
 S8L5v8G7+zZXl3+09cNeVxaRE/dpr9X2ZONILBLgjsOK9Kbd0TnOijodOw96W/IfvNs4
 vVQui0Sb5THP9sUeDFjW16/o9xzcya9bJuh8XpVNbrqd+Cs9MZgdBntBt5CMYmt5tcP+
 9PyA==
X-Gm-Message-State: AOAM530Qquin0pdI+Ot2WJ4kyNLewLYSlyxQqLeXdoS+cd5LnjzCzWgx
 aE5cKfvVlBRDIEiQ4Kvp7h/VvhCvq7JW4T5f+Ez0wg==
X-Google-Smtp-Source: ABdhPJznz2I6yaUfu5sapSxfaawTvDWTc4egwzJFTFOwI97d2Oq+qgjhGAyeojv1m2fr5BiGgMr/zgmA3/HTfQyhJ8k=
X-Received: by 2002:aca:4188:: with SMTP id o130mr152546oia.101.1615909975767; 
 Tue, 16 Mar 2021 08:52:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210316153303.3216674-1-daniel.vetter@ffwll.ch>
 <20210316153303.3216674-3-daniel.vetter@ffwll.ch>
 <20210316154549.GA60450@infradead.org>
In-Reply-To: <20210316154549.GA60450@infradead.org>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 16 Mar 2021 16:52:44 +0100
Message-ID: <CAKMK7uF8Lv0P4TuoctjUiVHtRzAnXf9a50JaYgm0rV+v+7=LFw@mail.gmail.com>
Subject: Re: [PATCH 2/3] media/videobuf1|2: Mark follow_pfn usage as unsafe
To: Christoph Hellwig <hch@infradead.org>
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
Cc: Jan Kara <jack@suse.cz>, KVM list <kvm@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>, Daniel Vetter <daniel.vetter@intel.com>,
 Michel Lespinasse <walken@google.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Daniel Jordan <daniel.m.jordan@oracle.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>, Pawel Osciak <pawel@osciak.com>,
 John Hubbard <jhubbard@nvidia.com>, J??r??me Glisse <jglisse@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Laurent Dufour <ldufour@linux.ibm.com>, Vlastimil Babka <vbabka@suse.cz>,
 LKML <linux-kernel@vger.kernel.org>, Tomasz Figa <tfiga@chromium.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 16, 2021 at 4:46 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Tue, Mar 16, 2021 at 04:33:02PM +0100, Daniel Vetter wrote:
> > The media model assumes that buffers are all preallocated, so that
> > when a media pipeline is running we never miss a deadline because the
> > buffers aren't allocated or available.
> >
> > This means we cannot fix the v4l follow_pfn usage through
> > mmu_notifier, without breaking how this all works. The only real fix
> > is to deprecate userptr support for VM_IO | VM_PFNMAP mappings and
> > tell everyone to cut over to dma-buf memory sharing for zerocopy.
> >
> > userptr for normal memory will keep working as-is, this only affects
> > the zerocopy userptr usage enabled in 50ac952d2263 ("[media]
> > videobuf2-dma-sg: Support io userptr operations on io memory").
>
> Maybe I'm missing something, but wasn't the conclusion last time that
> this hackish early device to device copy support can just go away?

My understanding is mostly, but with some objections. And I kinda
don't want to let this die in a bikeshed and then not getting rid of
follow_pfn as a result. There's enough people who acked this, and the
full removal got some nack from Mauro iirc.

Maybe if no bug report ever shows up for 1-2 years we can sunset it
for real&completely.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
