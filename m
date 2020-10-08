Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A24B228838B
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 09:30:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0469E6EC55;
	Fri,  9 Oct 2020 07:29:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A84E96E145
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Oct 2020 12:41:51 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id y14so3871997pfp.13
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Oct 2020 05:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=urluBRAZhemlAGNYR9JHz7//XtKVwD7KOsOnuK3XEvE=;
 b=i93YgqfP2Qs8dlAx7dyQ+W0IRG7pAxhJwW9+eRHcvMVYP3djMki+CGM6zO0EVJGk6K
 IbQzLSWJO3N1l0EX9JrKSfHEa7utNqIB47jME7UstUYw4VjXJ3eqfisu2Lv5k6vC2Rji
 RXYD2ZA+lWznWQWoRqSMqejEaxBGkz94802iEmzJd0MCBP2cDlv790XzP6x1cW1hFd/9
 VynwcCRsd9uDLYGf7l4gaVrI2jMIq7IhzjCPA4DTCHUEEBJWY9srCgIimdgBAYkzeSSZ
 OrD77ImZWUgTRcr1HoKIi9uUAfbiDRf/QR54E/fTvbFXgKqiTQNN+jJNb/teyHBDz9PA
 L6Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=urluBRAZhemlAGNYR9JHz7//XtKVwD7KOsOnuK3XEvE=;
 b=Z+6OZBW++W58cPJxFQfbJtG62GipXt6lZQkz3hj591/tIBcu2Bdadpytwecr2So+iT
 /YqtTFCF58bAVbJRg2/cfoCGjLRBVfcQ8Dcw4NTuqxwpnOSirqiHAUzeeVd03lHmYLcc
 vPLv/r4IxMvTnuR0BawDsvmx7EzrXN8pbE3pSOVWd6vPOhb29RgEfGB0pYcCcXH6s4qg
 y0KUS+LYkN3mTheO7XmUa4iyiTkAYaFzWdCnuawTb524AaoeyilAntNUOcHkhXNftf2o
 tIlCunSUcgiWYVafoEBwiXuPoptJ9wQRT7X2MA/Jhl+vL+5m/g24HwRBJR6/9lw7fxFV
 LQPw==
X-Gm-Message-State: AOAM530Iqo2tuONtdvbZoMwCNZ1+TLfAQ7CcadaYqxrAypEffAR0v9j3
 5huFjtH64EF9kGDpQhIXRDURqQ==
X-Google-Smtp-Source: ABdhPJxnQ64uysYsu/F9BjeJkE2gf+57wvTrXl8yFyGGP/X1izZlhvOyXG/ViriTgaaOJPI9vrc0XQ==
X-Received: by 2002:a17:90a:6787:: with SMTP id
 o7mr8072496pjj.125.1602160910911; 
 Thu, 08 Oct 2020 05:41:50 -0700 (PDT)
Received: from ziepe.ca ([206.223.160.26])
 by smtp.gmail.com with ESMTPSA id k11sm7411830pjs.18.2020.10.08.05.41.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Oct 2020 05:41:49 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kQVEx-001U2l-UT; Thu, 08 Oct 2020 09:41:47 -0300
Date: Thu, 8 Oct 2020 09:41:47 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH 10/13] PCI: revoke mappings like devmem
Message-ID: <20201008124147.GD5177@ziepe.ca>
References: <20201007164426.1812530-1-daniel.vetter@ffwll.ch>
 <20201007164426.1812530-11-daniel.vetter@ffwll.ch>
 <CAPcyv4hBL68A7CZa+YnooufDH2tevoxrx32DTJMQ6OHRnec7QQ@mail.gmail.com>
 <20201007232448.GC5177@ziepe.ca>
 <CAPcyv4jA9fe40r_2SfrCtOaeE85V88TA3NNQZOmQMNj=MdsPyw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPcyv4jA9fe40r_2SfrCtOaeE85V88TA3NNQZOmQMNj=MdsPyw@mail.gmail.com>
X-Mailman-Approved-At: Fri, 09 Oct 2020 07:29:53 +0000
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
 Daniel Vetter <daniel.vetter@ffwll.ch>, Linux PCI <linux-pci@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 John Hubbard <jhubbard@nvidia.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "Linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 08, 2020 at 12:49:54AM -0700, Dan Williams wrote:

> > This is what got me thinking maybe this needs to be a bit bigger
> > generic infrastructure - eg enter this scheme from fops mmap and
> > everything else is in mm/user_iomem.c
> 
> It still requires every file that can map physical memory to have its
> ->open fop do

Common infrastructure would have to create a dummy struct file at mmap
time with the global inode and attach that to the VMA.

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
