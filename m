Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 238A2286F2D
	for <lists+dri-devel@lfdr.de>; Thu,  8 Oct 2020 09:21:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE2B96EA36;
	Thu,  8 Oct 2020 07:20:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCA266E96F
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 23:21:19 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id g3so3551347qtq.10
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Oct 2020 16:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=wKVq0v36o1OseOTfSiRENpilMLoRQr0K5VZe4J2K3Kc=;
 b=eonGoy0XmwUCVUGspJnsew+Xt7VaOYXBvCVLNfKebMnycQvmW3AnbQjz9lSZk+oJTt
 dhvuV/v/cnVlxITNMU9OjuXLMypWJUZ21uT0gYOxQ8d5Ns6agyhkSgI250TcvBKPkqcq
 eDXVSqeP187Kj7hX9ZW21soQCHyKtnnpRD86xF4iV4vIsAEXErr5M7nS61S+a1iD/LIb
 LoT/Oje5p+16A0FP2LPQqK7+AMDx5byuewUWnk+LOvBmW6M8aHFUXTPUZju1RP8UOXu8
 sLtKGSyXFXzBShaXLdlI6xM43DeuV6UnkYTmZJGaAH/xG5nThTf8qdvy8p02SSq+yIph
 +DKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wKVq0v36o1OseOTfSiRENpilMLoRQr0K5VZe4J2K3Kc=;
 b=aVxLK8s/gaMKgtupCtwfl3eh5XoNBYTY6YNTOSpwb0HAhlk3pbE7Hke8icdcMjIyRP
 4dblwV/im/AeFlRi5jWbeshH+L0zUFZXnJOxSnbztE2HW1UxXHh0Lw57n9hnj0Wi8Vyt
 6A32Ssu/cuLQe8EeXOloPv/KFdbUh90nd0Y1htxWWRZ9UO/ZrG6h5nwtFWX6sLNLYEGC
 UHw+s+jvK+zTvKTHk+weAT5aTfdnWQCQlTfPOx7bRM0xyFrKkKG0NHHpdt987XtjA6VG
 ioVCfe2DMQuwRhBFe3yzwk4fvNum4ZIm6nBDlrnryDTZl4oZFjtmjxLwQHkBN0M42idq
 PEGQ==
X-Gm-Message-State: AOAM533U0ptwefMLk4uurp/op22vp45aqb3pCrzhC0s8Gg2VlN7kdpqn
 chqU1QbaMrMCY7RwVGwrvvDzNg==
X-Google-Smtp-Source: ABdhPJyQZRi/LW8n5yhULmf0Fru5TIwyRzoLwr2XtdSWRnkxdnVhvqGusX2Dk2zCuTvGMQkdks5bXg==
X-Received: by 2002:ac8:5bd0:: with SMTP id b16mr5601331qtb.296.1602112879011; 
 Wed, 07 Oct 2020 16:21:19 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id z26sm1881713qki.40.2020.10.07.16.21.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2020 16:21:18 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kQIkH-001IkZ-3z; Wed, 07 Oct 2020 20:21:17 -0300
Date: Wed, 7 Oct 2020 20:21:17 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 07/13] mm: close race in generic_access_phys
Message-ID: <20201007232117.GB5177@ziepe.ca>
References: <20201007164426.1812530-1-daniel.vetter@ffwll.ch>
 <20201007164426.1812530-8-daniel.vetter@ffwll.ch>
 <20201007172746.GU5177@ziepe.ca>
 <CAKMK7uH3P-6zs5MVceFD7872owqtcktqsTaQAOKNyaBg4_w=aA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uH3P-6zs5MVceFD7872owqtcktqsTaQAOKNyaBg4_w=aA@mail.gmail.com>
X-Mailman-Approved-At: Thu, 08 Oct 2020 07:20:54 +0000
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
Cc: linux-s390@vger.kernel.org, Rik van Riel <riel@redhat.com>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Jan Kara <jack@suse.cz>,
 Kees Cook <keescook@chromium.org>, kvm@vger.kernel.org,
 Dave Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>, John Hubbard <jhubbard@nvidia.com>,
 Hugh Dickins <hugh@veritas.com>, Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 07, 2020 at 08:01:42PM +0200, Daniel Vetter wrote:
> I think it'd fix the bug, until someone wires ->access up for
> drivers/gpu, or the next subsystem. This is also just for ptrace, so
> we really don't care when we stall the vm badly and other silly
> things. So I figured the somewhat ugly, but full generic solution is
> the better one, so that people who want to be able to ptrace
> read/write their iomem mmaps can just sprinkle this wherever they feel
> like.
> 
> But yeah if we go with most minimal fix, i.e. only trying to fix the
> current users, then your thing should work and is simpler. But it
> leaves the door open for future problems.

The only other idea I had was to fully make the 'vma of __iomem
memory' some generic utility, completely take over the vm_ops.

We did something like this in RDMA, what I found was even just
implementing mmap() using the kernel helpers turned out to be pretty
tricky, many drivers did it wrong in small ways.

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
