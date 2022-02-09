Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA154AF3DA
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 15:14:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 708F910E5AD;
	Wed,  9 Feb 2022 14:14:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44D7C10E5AD
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 14:14:29 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id b35so1658074qkp.6
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 06:14:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=c8BMy3fH62yXJxfHY+j4P80h5ALqrjcvX+ObTuKf0iA=;
 b=V7onSa8ruWkEtkdB8irRTbQO5EhI5+EN5mjt3u01+vlKyYcQfcNp9aFh92tP1OzUTh
 ScFSSPOJZDc270JM0jq7Rhgv2t8FwpCHJ20+6gStJqzqZxWKPGAiZe6G30wozCGKb6G+
 ZLQWTS1Ro4hAfH5OwcrYeqPEFEKYoHUMzawcDJx2RgUNBo1ohb8nkxONIHkbUDMBpr5o
 apeGjKCH5BBxtNM0aA8Q1I0DV6rlydLedHpS7mVvMx/qFqliS9UfDYoHrCMy5D2aCL3F
 0jecgeDZDBF6tjcMyMnIYAGizQnperLp47omGbCJq3v5uCCpJ63E6XzU+sfOUF4jG60Y
 /F8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=c8BMy3fH62yXJxfHY+j4P80h5ALqrjcvX+ObTuKf0iA=;
 b=beO1N1OpZ7wn7V5dF1paBZEBdQDaMOF9zk2uBbyAveejbDbJHN+e59uTgY4Iujsb5v
 cGQLEuWtaelY1IAXAKr8CPXi8GkbPzZ0gzjr1/EQmfG//vwBx4kViodfsfOExailDQ2N
 IR18OsVezuAYuUmFxIvfRcrSB6idWkpXILkpNHVjFwDkQ81CtK+UV8t7vlDt8Ey2IEfY
 fP3uTTBpmfJjd0jkH4brNZrHxBgs/W0TvusrU9LzIznC/j8oOsEUns2rw9r39ySWi3zD
 leOUyefj40RSDLZnBETen4GDLV+jN6EtL+xuoi/eYgCtSlIKtHSf0bFMCpU1LCgN8mw9
 8dPg==
X-Gm-Message-State: AOAM532SecXJL0xq1W0EchwlshXZcCU6SPV3f450aFKP06BGiqXS3La4
 JarCkx1WWfVbiEIDasRVLjYMeg==
X-Google-Smtp-Source: ABdhPJzQ+iaZjCKRuCc0J8n0Ck+TXJ7O0pFZ7w0y3yYzv/vscWA+Im2JaGH4eENvWOVqnzWKMTNFCg==
X-Received: by 2002:a05:620a:1351:: with SMTP id
 c17mr1137673qkl.460.1644416068212; 
 Wed, 09 Feb 2022 06:14:28 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.129])
 by smtp.gmail.com with ESMTPSA id a14sm9094374qtb.92.2022.02.09.06.14.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 06:14:27 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1nHnjn-001FdR-1z; Wed, 09 Feb 2022 10:14:27 -0400
Date: Wed, 9 Feb 2022 10:14:27 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 7/8] mm: remove the extra ZONE_DEVICE struct page refcount
Message-ID: <20220209141427.GJ49147@ziepe.ca>
References: <20220207063249.1833066-1-hch@lst.de>
 <20220207063249.1833066-8-hch@lst.de>
 <CAPcyv4h_axDTmkZ35KFfCdzMoOp8V3dc6btYGq6gCj1OmLXM=g@mail.gmail.com>
 <20220209062345.GB7739@lst.de> <20220209122956.GI49147@ziepe.ca>
 <20220209135351.GA20631@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220209135351.GA20631@lst.de>
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
Cc: Linux NVDIMM <nvdimm@lists.linux.dev>,
 Ralph Campbell <rcampbell@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Karol Herbst <kherbst@redhat.com>, nouveau@lists.freedesktop.org,
 Felix Kuehling <Felix.Kuehling@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Linux MM <linux-mm@kvack.org>, Ben Skeggs <bskeggs@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Dan Williams <dan.j.williams@intel.com>, Logan Gunthorpe <logang@deltatee.com>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 09, 2022 at 02:53:51PM +0100, Christoph Hellwig wrote:
> On Wed, Feb 09, 2022 at 08:29:56AM -0400, Jason Gunthorpe wrote:
> > It is nice, but the other series are still impacted by the fsdax mess
> > - they still stuff pages into ptes without proper refcounts and have
> > to carry nonsense to dance around this problem.
> > 
> > I certainly would be unhappy if the amd driver, for instance, gained
> > the fsdax problem as well and started pushing 4k pages into PMDs.
> 
> As said before: I think this all needs to be fixed.  But I'd rather
> fix it gradually and I think this series is a nice step forward.
> After that we can look at the pte mappings.

Right, I agree with this

Jason
