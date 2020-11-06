Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E39A42AAE06
	for <lists+dri-devel@lfdr.de>; Sun,  8 Nov 2020 23:50:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBDBD897F0;
	Sun,  8 Nov 2020 22:49:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E2806EA94
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 12:58:42 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id m65so620593qte.11
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Nov 2020 04:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=LDmpY5Q3jeo13aLjq8mpu4vGc1arJjADg5EChwDGndg=;
 b=SpM7chHfdZV7h7CKnja31DtYMLYzvOBfAlRtmJ/n/nmTfwC0/x656sMJMRCmtcchj/
 ZyUoXciqxn2yvqmwaFJGHZpzSVxZGn6Ze+JMY7srqI9JIuOIozv+IXpP8Z+LAF7g6ch/
 geDIF/iCN2g4ZH9VZGIJGVBqjOuzBGBXOfBZNRG4f137xGwffeFnYlpuanA0eFi1/Rzl
 pE4g37GMMac8kgjZ4ctH1Noi6iDIudZDIDNiFDVJFDqddViW7d1FfR7i1JICWyRJ9Ug1
 S57hfmUNM5E/OZ/BlY/n0jaRZ1v6nFt9MTt+r5sEgovuILshM1zaV3phLFg35dveDz2Q
 NHAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LDmpY5Q3jeo13aLjq8mpu4vGc1arJjADg5EChwDGndg=;
 b=grPqSKClGQob205wPF0PGnNM/XqLEUGSaPgvs1dq1AGsnJDWhCmUswKbqSZsDyJvGy
 Ivy/lYOFOH05TduWUCRnSTJGGDw+Pozj47Wh7idQ09pVYEN6Thos2DJVYq6c2w9ulCGg
 qBX8B3JZhcQ9+kNN6yerAzpz4Zd1EUaazoOjK+Al7hZ/ciK/TXkPL8k2Lbn7/rGhGEzh
 N1z2gr0hrAAE7ykKcvdDislMv0z/7ErtKaSpqkyXxcMlZf1JJrSbezob9VXlg3NoihQ1
 4ajoAQvsSGafkguJTSdDis2cieaRNC7JZmQRcKaxefcc8hMbQ8bQItnd6uQIQqYu3Xyh
 LYQg==
X-Gm-Message-State: AOAM531npod8021RFDIFW6cgnk09DUvm4qBAsZpHqQVuAu07au+w1KQR
 QXcxs3HU+i/mI8Bg7KZg2B7bDA==
X-Google-Smtp-Source: ABdhPJw+rwYTMNOCDOtELAS3ZURAM14wn0+raNRbu4MJsphc7No8hlqtgP1VZD/3115+BJAOILEwww==
X-Received: by 2002:ac8:74c:: with SMTP id k12mr1292900qth.32.1604667521864;
 Fri, 06 Nov 2020 04:58:41 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id o63sm432040qkd.96.2020.11.06.04.58.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 04:58:41 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kb1KC-000leP-L9; Fri, 06 Nov 2020 08:58:40 -0400
Date: Fri, 6 Nov 2020 08:58:40 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v5 05/15] mm/frame-vector: Use FOLL_LONGTERM
Message-ID: <20201106125840.GP36674@ziepe.ca>
References: <20201104162125.GA13007@infradead.org>
 <CAKMK7uH=0+3FSR4LxP7bJUB4BsCcnCzfK2=D+2Am9QNmfZEmfw@mail.gmail.com>
 <20201104163758.GA17425@infradead.org>
 <20201104164119.GA18218@infradead.org>
 <20201104181708.GU36674@ziepe.ca>
 <d3497583-2338-596e-c764-8c571b7d22cf@nvidia.com>
 <20201105092524.GQ401619@phenom.ffwll.local>
 <20201105124950.GZ36674@ziepe.ca>
 <7ae3486d-095e-cf4e-6b0f-339d99709996@nvidia.com>
 <CAKMK7uGRw=xXE+D=JJsNeRav9+hdO4tcDSvDbAuWfc3T4VkoJw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uGRw=xXE+D=JJsNeRav9+hdO4tcDSvDbAuWfc3T4VkoJw@mail.gmail.com>
X-Mailman-Approved-At: Sun, 08 Nov 2020 22:49:24 +0000
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
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Jan Kara <jack@suse.cz>, KVM list <kvm@vger.kernel.org>,
 Pawel Osciak <pawel@osciak.com>, John Hubbard <jhubbard@nvidia.com>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Tomasz Figa <tfiga@chromium.org>, Christoph Hellwig <hch@infradead.org>,
 Linux MM <linux-mm@kvack.org>, J??r??me Glisse <jglisse@redhat.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 06, 2020 at 11:01:57AM +0100, Daniel Vetter wrote:

> gpu drivers also tend to use vmf_insert_pfn* directly, so we can do
> on-demand paging and move buffers around. From what I glanced for
> lowest level we to the pte_mkspecial correctly (I think I convinced
> myself that vm_insert_pfn does that), but for pud/pmd levels it seems
> just yolo.
> 
> remap_pfn_range seems to indeed split down to pte level always.

Thats what it looked like to me too.
 
> >  From my reading, yes. See ioremap_try_huge_pmd().
> 
> The ioremap here shouldn't matter, since this is for kernel-internal
> mappings. So that's all fine I think.

Right, sorry to be unclear, we are talking about io_remap_pfn_range()
which is for userspace mappings in VMAs

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
