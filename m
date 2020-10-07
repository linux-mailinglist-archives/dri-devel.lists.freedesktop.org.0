Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8596286258
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 17:40:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED81B6E930;
	Wed,  7 Oct 2020 15:39:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BED1089319
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 12:44:11 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id y198so2489569qka.0
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Oct 2020 05:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=YHwK7fj40rs6RtWBfMsDdiNwOc6I5e7hiW0vaeAiWPE=;
 b=L3Snl2lKZ0Efotdw5H66ICtk7hAPeqPHl2yvT2hFObgLWAEy3EBTXL+OsvS8u/QndV
 Pj12VmdFi1Z+tf74AMThconTJmYhkFSDG8iZx1jlaA7Czeyr7poiFxBLjV1keUOmp1a1
 r6jTl4FOE/mmJjXmQ3zxvk1dmo6U3QKzXB0dREWbZ5bVe5DnC2HmgHKbEjSJ6zySfOog
 R+kS8ezo1stmGnlupvsVnR3bPxmU38krpYm29D741/i3IkmlnAWe/GfJ9rN+yP8YE0dg
 cFJCTIqTz/UvPJG/mR+/5L+YhDdX7fqDJnzC1ZYlkGVtaAUiADgRS6KwWpAwdsPJXKnQ
 JC2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YHwK7fj40rs6RtWBfMsDdiNwOc6I5e7hiW0vaeAiWPE=;
 b=gCDAeuzdjow5xgNTGRibpqDQeP+YUleJrF5k4xpsqz+lP/OapEMs6o4Uy751kHuXu/
 XTha+/qVXg2OrDgDT6YE1DttIh+eTxrptz0wGNUJ2We6BQ0mi2Q+vdn/i9CbVcEB+wRu
 AbhL5SxhuCd5kwnLEuOVb4Gt0rTMkyxJBCH09/uPf9Zf42SQ17yhw5C5CkwTFbh9h90k
 HrDpHMP92S3KYJ/9P2+Q6mWPaML4leM8Yg77zD8SWuoWsxg5etXbvZVSWuAPGQcsXZx2
 OYIqk7ejuHtfc8IA8XqZINatO6ntZOgNDV1Kvx2vcw/ALtdS3SQLuK63PJX8xF+ugsdh
 tzrA==
X-Gm-Message-State: AOAM531wtWF8+Tq02/CYt63vi4MYo7/nyBWhaXKbWFn9/cPMy3kTej5E
 EFtBDbVmYAP33dvksZPQ+E5OEg==
X-Google-Smtp-Source: ABdhPJycqhqp8fRGIUb3jRYRy+8x/MiJ9pPbNPYQD1G3WrU7BU6Yp5GlTMFR/KPoICRs6eJqoSqkUQ==
X-Received: by 2002:a05:620a:a90:: with SMTP id
 v16mr2505177qkg.226.1602074650939; 
 Wed, 07 Oct 2020 05:44:10 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id d37sm1423421qta.76.2020.10.07.05.44.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2020 05:44:10 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kQ8nh-000tZ6-KI; Wed, 07 Oct 2020 09:44:09 -0300
Date: Wed, 7 Oct 2020 09:44:09 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH 2/2] mm/frame-vec: use FOLL_LONGTERM
Message-ID: <20201007124409.GN5177@ziepe.ca>
References: <20201002175303.390363-1-daniel.vetter@ffwll.ch>
 <20201002175303.390363-2-daniel.vetter@ffwll.ch>
 <20201002180603.GL9916@ziepe.ca>
 <CAKMK7uGF+y-r4swLXmodhduRMy0NPa=ASBY8JOXS_g=9Rq9XQw@mail.gmail.com>
 <20201002233118.GM9916@ziepe.ca>
 <CGME20201003094038eucas1p12aaafe0f52a7747bc2ba95ccb91d1651@eucas1p1.samsung.com>
 <CAKMK7uFP-XQHUPYeRhPx7tjvjARQiF-os9z9jx6WANV6sgSf6g@mail.gmail.com>
 <d2f8e8a7-614d-18c8-9e2a-c604e5e54ce6@samsung.com>
 <CAKMK7uF+a1PSn+e-6F+YhkSXn9vC7etS-z0AFBMCU+Vzb2PwqA@mail.gmail.com>
 <725819e9-4f07-3f04-08f8-b6180406b339@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <725819e9-4f07-3f04-08f8-b6180406b339@samsung.com>
X-Mailman-Approved-At: Wed, 07 Oct 2020 15:39:39 +0000
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
 Jan Kara <jack@suse.cz>, Joonyoung Shim <jy0922.shim@samsung.com>,
 Pawel Osciak <pawel@osciak.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Tomasz Figa <tfiga@chromium.org>, Kyungmin Park <kyungmin.park@samsung.com>,
 Linux MM <linux-mm@kvack.org>,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 John Hubbard <jhubbard@nvidia.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 07, 2020 at 02:33:56PM +0200, Marek Szyprowski wrote:
> Well, it was in vb2_get_vma() function, but now I see that it has been 
> lost in fb639eb39154 and 6690c8c78c74 some time ago...

There is no guarentee that holding a get on the file says anthing
about the VMA. This needed to check that the file was some special
kind of file that promised the VMA layout and file lifetime are
connected.

Also, cloning a VMA outside the mm world is just really bad. That
would screw up many assumptions the drivers make.

If it is all obsolete I say we hide it behind a default n config
symbol and taint the kernel if anything uses it.

Add a big comment above the follow_pfn to warn others away from this
code.

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
