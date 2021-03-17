Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCA633EAFF
	for <lists+dri-devel@lfdr.de>; Wed, 17 Mar 2021 09:05:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 000C36E4DE;
	Wed, 17 Mar 2021 08:05:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 359AC6E4DE
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 08:05:02 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id w65so40925178oie.7
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 01:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EI5qglqxsKAU/W0ZKYTsFSvZf8l0B/oXcoORkaxMSD8=;
 b=fb1VA654QtgBN7yjx24Vbsgr8qILHcsfU8IERmXJmGaXai7ib/t/sz/A2+trz33o9V
 +jZ2x+KTzIoXu9ur15pcoOP0mcety3wwVzOYYhW2IDGTduuc/R5KdINLJaadqXnV3Anw
 TPbRuol5s8uvpHLE2zkBMQ0iFY8Iob2xpapBI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EI5qglqxsKAU/W0ZKYTsFSvZf8l0B/oXcoORkaxMSD8=;
 b=CehDqxBgccZBZfDpK/d2tnbhI8JupqZjrSjr7PNdjbxeHD6GQbHliFOljB6TMQEJjD
 hTJdWKtkn3nukA+BFXKat1++UHxHliBKNKsMRj+70tC+wG6ud+GPOeX8tY5VmEnIoov5
 c5/LKZMRP36IZIjtZi0JDPXZmcvvPqsKprcvlNB1CiBqnetUP/wLm1wxz0kTGqQnbu2+
 75XNSSM8xwS7ZteaHwFhp7667NFwg4NO4NBVhs3nlWMsxc0/ZLlnzwiK8KEjcKSNwu40
 pxo2zZX47WQC42RrlE7NBoCzkQMlWzR649z5IStRL6vBlRPFnWKvFZ3ayjp5HVS4Dcoo
 gI2g==
X-Gm-Message-State: AOAM532jlZ2zguO+STElROLthSg4T7pkdsC6B30crrVmM64xUnsbn9F4
 VJqD0l1O7XtHnEGv1EKvIFtsw1mojEBrDr3mlD3f+w==
X-Google-Smtp-Source: ABdhPJwZYNnRwoTd/kuED1Yfh8EqOUzOIuqMpTc+matmHqjzLk6Tn4x3yBWT0QFOmmnBuxIzgcZ9JwEdKsAutEEaYeo=
X-Received: by 2002:aca:4188:: with SMTP id o130mr1878713oia.101.1615968301447; 
 Wed, 17 Mar 2021 01:05:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210316153303.3216674-1-daniel.vetter@ffwll.ch>
 <20210316153303.3216674-3-daniel.vetter@ffwll.ch>
 <20210316154549.GA60450@infradead.org>
 <CAKMK7uF8Lv0P4TuoctjUiVHtRzAnXf9a50JaYgm0rV+v+7=LFw@mail.gmail.com>
 <20210317072248.GA284559@infradead.org>
In-Reply-To: <20210317072248.GA284559@infradead.org>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 17 Mar 2021 09:04:50 +0100
Message-ID: <CAKMK7uGe4-7EzgYo-rLyhxp5Dft-6V_a610TmL0hRucYTpdmRQ@mail.gmail.com>
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

On Wed, Mar 17, 2021 at 8:22 AM Christoph Hellwig <hch@infradead.org> wrote:
> On Tue, Mar 16, 2021 at 04:52:44PM +0100, Daniel Vetter wrote:
> > My understanding is mostly, but with some objections. And I kinda
> > don't want to let this die in a bikeshed and then not getting rid of
> > follow_pfn as a result. There's enough people who acked this, and the
> > full removal got some nack from Mauro iirc.
>
> Hmm, ok I must have missed that.  I defintively prefer your series over
> doing nothing, but killing the dead horse ASAP would be even better.

I have a bunch of slow-burner things I need to fix in this area of
driver mmaps vs get_user_/follow_ conflicts anyway, I'll add a note to
put the horse out of it's misery in due time. We have a few problems
still where things might get pinned or used where it really shouldn't
be.

Can I count that as an ack on the series? You've touched this quite a
bit recently.

Thanks, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
