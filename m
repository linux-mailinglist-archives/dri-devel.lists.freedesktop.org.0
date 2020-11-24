Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 892B72C2992
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 15:28:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E45A46E41D;
	Tue, 24 Nov 2020 14:28:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCD966E41D
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 14:28:18 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id s8so22477394wrw.10
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 06:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=KSq6GECp1i25ezV0Y6T/3NvT3N3r3AJ5cEVxbDW0CLw=;
 b=M8OKVKLPb+FMINuPALRG9V3PVI91CXQvXh6el7xGRjUkVyzBaQH4KHu/tMBmJ5taDe
 59iDiQDNm2o3xbPwv0oSLio8yFOJvro7J42g63pWYI73IIHBT3JzdvD1M0d8OksY+kMI
 XGPBgQVF+ghp0Mqq2KbUaYPWwm0MKVO12MAPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=KSq6GECp1i25ezV0Y6T/3NvT3N3r3AJ5cEVxbDW0CLw=;
 b=i1ZxDnu4k6QBYO7RuxbqUQHZzd1sv1PDYEktiL9h2x3PN+E60QoEyb/XG/2pFMmsoy
 i3aPhAzqcStIjMgliyz/h1tghEi3gEpkhGCCO/h4P92ZMnybfoXsEzDqoaZbTpeNXBvA
 VW1QY3runB9KvjJdsDeenAsWaIqr/CNnBNX0bkki3qHPpDPaFqMkw/ohG89PS9Bb5C1c
 nGwh1r7q9rOo/Fx9k+piX1FPOpGRKpok8k4XqysM3AVMI4aDwxhUmhNjIh/gHM1qzKhY
 9D84aYGvTjjA0H66rBfhfvaIFbchF8pHzeCbPgxvGkQiJhd48qJ5rddaoYjwXJmm0iH8
 xVwg==
X-Gm-Message-State: AOAM5328u1SfSRIuMFOl9Q3b4+XzTS40dOAIH2hW5poC4Nf+FLD96TUq
 iXE7y74ovfcLFjDiCxssEcej5vtxlHfNPA==
X-Google-Smtp-Source: ABdhPJzYIyfiFO7Qic0f+2tVMFNssr9Nw0LvMxY+vwY4ywKdlugcFp6ONKZKvUGFaWMjY1vmdCWa+w==
X-Received: by 2002:a5d:610d:: with SMTP id v13mr5595456wrt.425.1606228097589; 
 Tue, 24 Nov 2020 06:28:17 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 35sm27158318wro.71.2020.11.24.06.28.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 06:28:16 -0800 (PST)
Date: Tue, 24 Nov 2020 15:28:14 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v6 17/17] RFC: mm: add mmu_notifier argument to follow_pfn
Message-ID: <20201124142814.GM401619@phenom.ffwll.local>
Mail-Followup-To: Jason Gunthorpe <jgg@ziepe.ca>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, kvm@vger.kernel.org,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
 Daniel Vetter <daniel.vetter@intel.com>,
 Christoph Hellwig <hch@infradead.org>,
 Kees Cook <keescook@chromium.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 John Hubbard <jhubbard@nvidia.com>,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Jan Kara <jack@suse.cz>
References: <20201119144146.1045202-1-daniel.vetter@ffwll.ch>
 <20201119144146.1045202-18-daniel.vetter@ffwll.ch>
 <20201120183029.GQ244516@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201120183029.GQ244516@ziepe.ca>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: linux-samsung-soc@vger.kernel.org, Jan Kara <jack@suse.cz>,
 Kees Cook <keescook@chromium.org>, kvm@vger.kernel.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 John Hubbard <jhubbard@nvidia.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 20, 2020 at 02:30:29PM -0400, Jason Gunthorpe wrote:
> On Thu, Nov 19, 2020 at 03:41:46PM +0100, Daniel Vetter wrote:
> > @@ -4805,21 +4824,15 @@ EXPORT_SYMBOL(follow_pte_pmd);
> >   * Return: zero and the pfn at @pfn on success, -ve otherwise.
> >   */
> >  int follow_pfn(struct vm_area_struct *vma, unsigned long address,
> > -	unsigned long *pfn)
> > +	unsigned long *pfn, struct mmu_notifier *subscription)
> >  {
> > -	int ret = -EINVAL;
> > -	spinlock_t *ptl;
> > -	pte_t *ptep;
> > +	if (WARN_ON(!subscription->mm))
> > +		return -EINVAL;
> >  
> > +	if (WARN_ON(subscription->mm != vma->vm_mm))
> > +		return -EINVAL;
> 
> These two things are redundant right? vma->vm_mm != NULL?

Yup, will remove.

> BTW, why do we even have this for nommu? If the only caller is kvm,
> can you even compile kvm on nommu??

Kinda makes sense, but I have no idea how to make sure with compile
testing this is really the case. And I didn't see any hard evidence in
Kconfig or Makefile that mmu notifiers requires CONFIG_MMU. So not sure
what to do here.

Should I just remove the nommu version of follow_pfn and see what happens?
We can't remove it earlier since it's still used by other subsystems.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
