Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2774B295915
	for <lists+dri-devel@lfdr.de>; Thu, 22 Oct 2020 09:27:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D0166F3D8;
	Thu, 22 Oct 2020 07:27:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A58426EDD2
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 16:37:04 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id i22so3075024qkn.9
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 09:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=BzRdHxhoEjnpcVyZTB9k2I2+fkzcE70kBpksBajHHPg=;
 b=c06LmWtB/eBV/fSiYmdEtL9GPYUkBEwiw6eScZ5dk4Sur880r0RUDUdOasWQ2KsUGe
 bZgM/0p8jMLFa+ikbb0dWN5Ow5CevA+xGmpM9sZNHVumRdO1Tl6lKH78eEdBiQO/7MSc
 SyBxogrPHboOf7N/zRQinZbDgCQncGQf+B3tCHdeRI6jhJnIAAoc2n5M0i1ORD3y+prI
 vtMVVV6QAXuny3nyioqppKj86tWO1HhufpTOjkK/v2RsEfqLugKDikZxGHBEJZrzkhBg
 lGNMu1/vnxQxiUuVEAydazAgNl/YziHidKE+BchWShczAu98wiVxpsNR+uw83dVIq+/q
 VdCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BzRdHxhoEjnpcVyZTB9k2I2+fkzcE70kBpksBajHHPg=;
 b=np1v7m63xmaN0N/DVTbAcchBkmSYiqjiVYQUJAMzvNzG4zjq1qntwzhPou0VsUbzUY
 maLTX080w7IfkcLWmyW3jwq76PcwHFRTX0xnwvvRBsf4otJmRt+Jn+ZwxXNp5UcU6Sgg
 dgGtLqbYDSt2ZgXeKQQsw0AQJpeAHYDR9HrRG9+YL+walGaSl19A8WXp3nnvomSZoPDa
 uc2riKztLWOtGy45MD4xWsNWI3Cb6ilmZrn7UKuXyZZ/4xbRZrS5Xt2vHjg1RZ/+1XIb
 xwj7zuDmVRlqdink9GKezHlQ++ZgHrwygSYPD4+Hj5txVQAI1tDQ4FiERf6Nso1nyWlu
 d80w==
X-Gm-Message-State: AOAM533EQXZvbcLS9p3uMIZVI+ieSShY4RYvTVauotMjlwCDBr5FDB+G
 4QS05H91e8IyEZpg/eD4mf24Aw==
X-Google-Smtp-Source: ABdhPJzGADmR3Upv87Rf5RxP6nvmSwt5ZnM0S0wnKL/4oE2AOzzQDQjF/MbwQajcSGEwpbzdpDuubQ==
X-Received: by 2002:a37:4244:: with SMTP id p65mr3998477qka.141.1603298223560; 
 Wed, 21 Oct 2020 09:37:03 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id r58sm1532749qte.94.2020.10.21.09.37.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2020 09:37:02 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kVH6k-003YkE-3P; Wed, 21 Oct 2020 13:37:02 -0300
Date: Wed, 21 Oct 2020 13:37:02 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH v3 12/16] PCI: Obey iomem restrictions for procfs mmap
Message-ID: <20201021163702.GM36674@ziepe.ca>
References: <20201021085655.1192025-1-daniel.vetter@ffwll.ch>
 <20201021085655.1192025-13-daniel.vetter@ffwll.ch>
 <20201021125030.GK36674@ziepe.ca>
 <CAKMK7uEWe8CaT7zjcZ6dJAKHxtxtqzjVB35fCFviwhcnqksDfw@mail.gmail.com>
 <20201021151352.GL36674@ziepe.ca>
 <CAKMK7uGq0=ks7Zj1Et44k7x9FwE9u_ua4zANSqrLRri0v01V+Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uGq0=ks7Zj1Et44k7x9FwE9u_ua4zANSqrLRri0v01V+Q@mail.gmail.com>
X-Mailman-Approved-At: Thu, 22 Oct 2020 07:27:48 +0000
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
Cc: linux-s390 <linux-s390@vger.kernel.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Jan Kara <jack@suse.cz>,
 Kees Cook <keescook@chromium.org>, KVM list <kvm@vger.kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.com>, John Hubbard <jhubbard@nvidia.com>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Linux PCI <linux-pci@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 21, 2020 at 05:54:54PM +0200, Daniel Vetter wrote:

> The trouble is that io_remap_pfn adjust vma->pgoff, so we'd need to
> split that. So ideally ->mmap would never set up any ptes.

/dev/mem makes pgoff == pfn so it doesn't get changed by remap.

pgoff doesn't get touched for MAP_SHARED either, so there are other
users that could work like this - eg anyone mmaping IO memory is
probably OK.

> I guess one option would be if remap_pfn_range would steal the
> vma->vm_ops pointer for itself, then it could set up the correct
> ->install_ptes hook. But there's tons of callers for that, so not sure
> that's a bright idea.

The caller has to check that the mapping is still live, and I think
hold a lock across the remap? Auto-defering it doesn't seem feasible.

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
