Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8641128623
	for <lists+dri-devel@lfdr.de>; Sat, 21 Dec 2019 01:51:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CCB96E03B;
	Sat, 21 Dec 2019 00:51:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04FF06E03B
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Dec 2019 00:51:23 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id 77so14052577oty.6
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2019 16:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f33NX0mVyrexoBKmQnsG32ndr6o8M91RbejlTLuxhxw=;
 b=pKfg9UEBLsx6njksUWHLBV9YCmC5Ieahekn+9soc7jLMlGZN8QDuUe3MhuCdhXgXC6
 g0gDbbESs7X3oUrBExJ9JsdMsONU9A10XuSMv7r8Td92VT1lvZSJH3UfCQW1i7Y0MISg
 uS2PRHygg40RsyzjDa8SUbOj6VLjR2LDyqGO5Ul/NJDf/46uh1PoxGQX+YfMU/CyyhtG
 IsL2jFD1nFl5Z6Er0wIUYcOuiqmnJVB2yzStFIksAJDkZZdbo/uCNxgEImf+VVc9jwa2
 glafhYHVftVEBCWLnGSypqNiji5kRigGyeEpI9CJW0wN6LfgAQUPFbSEuCWO48b4Xx35
 0q0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f33NX0mVyrexoBKmQnsG32ndr6o8M91RbejlTLuxhxw=;
 b=DLplnN2O9auP66SNu4VAgFHDfPNo5CvknJo40Dnn2zpG64ehMFIousi5YzCrNNeLIb
 P7v5V4f4KRk+RaviDbDcC+9e6lNzW1++qV0oky/RZqArYq+h5VHxOUPMW7YQe6gXf8wu
 s5R7YVDjWnKkOTeOklq+pfuVFpggMdxjXGa0kQZhc4IxHeZhoBPrNzJ776Ml/mv4vdzL
 ueIyFtpQqQREwVJmIqA/3Al3yKCbE/BFAXK8cxTRdOd6E3loZNqbUFMJtKJJiN2696Dc
 aGiYL3wu4JYBY2iCeuCLZQeFvOsYqydCs/rRgWiDrFlKzmkLAfS8fDmFE62Le/MHad6s
 qeDg==
X-Gm-Message-State: APjAAAWorZdl5X/RFP6OUlNRG+/6FcideMow9KnzV+IakZY4xy5r8LjL
 igmGVNtcQaIKFr1U8tb9nCvIYfSerkYZVpPk/jIGPA==
X-Google-Smtp-Source: APXvYqxbY+fIz2rYDoZ2kDh5L9IxT6HAH53HFulCDl1AVxBdn9qKQM5q+s8gqlaKrOEYdyRgaFLwOdCutzqFOh8YHY0=
X-Received: by 2002:a9d:6f11:: with SMTP id n17mr4302678otq.126.1576889483302; 
 Fri, 20 Dec 2019 16:51:23 -0800 (PST)
MIME-Version: 1.0
References: <20191216222537.491123-1-jhubbard@nvidia.com>
 <20191219132607.GA410823@unreal>
 <a4849322-8e17-119e-a664-80d9f95d850b@nvidia.com>
 <20191220092154.GA10068@quack2.suse.cz>
 <CAPcyv4gYnXE-y_aGehazzF-Kej5ibSfqvE2hTnjKJD68bm8ANg@mail.gmail.com>
 <437f2bff-13ba-0ae9-2f3c-bc8eb82d20f0@nvidia.com>
In-Reply-To: <437f2bff-13ba-0ae9-2f3c-bc8eb82d20f0@nvidia.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Fri, 20 Dec 2019 16:51:12 -0800
Message-ID: <CAPcyv4hMvTmb5X8gNtXnapJFR1qej1bKto2fvv9zUtebHMhvVw@mail.gmail.com>
Subject: Re: [PATCH v11 00/25] mm/gup: track dma-pinned pages: FOLL_PIN
To: John Hubbard <jhubbard@nvidia.com>
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
Cc: Michal Hocko <mhocko@suse.com>, Jan Kara <jack@suse.cz>,
 KVM list <kvm@vger.kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>, linux-kselftest@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Maor Gottlieb <maorg@mellanox.com>,
 Leon Romanovsky <leon@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma <linux-rdma@vger.kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 "Linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Shuah Khan <shuah@kernel.org>, linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 bpf@vger.kernel.org, Magnus Karlsson <magnus.karlsson@intel.com>,
 Jens Axboe <axboe@kernel.dk>, Netdev <netdev@vger.kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 20, 2019 at 4:41 PM John Hubbard <jhubbard@nvidia.com> wrote:
>
> On 12/20/19 4:33 PM, Dan Williams wrote:
> ...
> >> I believe there might be also a different solution for this: For
> >> transparent huge pages, we could find a space in 'struct page' of the
> >> second page in the huge page for proper pin counter and just account pins
> >> there so we'd have full width of 32-bits for it.
> >
> > That would require THP accounting for dax pages. It is something that
> > was probably going to be needed, but this would seem to force the
> > issue.
> >
>
> Thanks for mentioning that, it wasn't obvious to me yet.
>
> How easy is it for mere mortals outside of Intel, to set up a DAX (nvdimm?)
> test setup? I'd hate to go into this without having that coverage up
> and running. It's been sketchy enough as it is. :)

You too can have the power of the gods for the low low price of a
kernel command line parameter, or a qemu setup.

Details here:

https://nvdimm.wiki.kernel.org/how_to_choose_the_correct_memmap_kernel_parameter_for_pmem_on_your_system
https://nvdimm.wiki.kernel.org/pmem_in_qemu
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
