Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D58042A7926
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 09:22:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BDE06EA36;
	Thu,  5 Nov 2020 08:21:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD87F6ED0F
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 14:00:26 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id z6so19343594qkz.4
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 06:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=J6Nw3097qL1FGBO59AefdNEIbSIDtL/HHl1l69CFDp8=;
 b=Wan5zLNCc03uOg3crmJFeRaNbOEA+qwrbKwCY9LDkg1fZnFvzGEBwk4V+VLFOn5oKx
 tmcyGIKCw4+CD/juWp2ijPQPLgAyQG0AhFaLumt8mFw7D817cQkKUY2w7oYalFQSRaiQ
 Vb/ptf8IpP3WfnK3UuZPUxBAXkXY6PqsAqGNVYoZolg0yUEgsR1Di4PcNN7C/aUr2Q/R
 O0ZcNPr6tO0Ab4yQ9aVnuDw44g3gsPath6hDrZSj4xe9Loas/o/6/OXlQjyqG2MFoi+n
 R3zy4MV988W7+StxSAydki/+D4rJ/lZx0EB7vwQbsli0N+fpB6onleBpY6HTFL+CpY9E
 jiFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=J6Nw3097qL1FGBO59AefdNEIbSIDtL/HHl1l69CFDp8=;
 b=sU5rOjODTpbu6W4zDGPYbW0I6AnzvE3sWZCtS+ZaNVXJQhH3ge+Mqr7dOxVkJuzXs2
 3uXnAsR9b0dU0tRF0gkv7wtEgSxfCpbae2G1JmgUfr8pRSdS0UyaSJEAwHNuF1PrtBT9
 +jKnFK+B4KWOqvJ0AUo+L6+xaQgMt3cmrlHlIKT3nFndsY1Nx2lS5Z0wJ6cnHHs2TziP
 0OPswrAQjW5MOEfQXp9vGwQu0Aw3tB6B/Ml6FBaLn2NyOfRo1PZqS4qufVvsmu1aBKgv
 oCxaXIWx48qnLFBvGM4O/sD3M9K/NXySmSWs9e0ZHKNWJw12MRiiNixqxZsgSWrnEBMs
 AHuQ==
X-Gm-Message-State: AOAM533Sxf1Sy488Q8eznl+hFWJ+VjrFVgMT7bTqnpgRy6HtL2XY77iv
 FfvpBV2DmWbC281WrtX2fafEnQ==
X-Google-Smtp-Source: ABdhPJz06+PUPTCOD5MO6YcYJfu8e1guRGyarj130cNdAlQFDKce0Oko/G5bRBr5wbl0qK0lrF7Apg==
X-Received: by 2002:a37:4ccf:: with SMTP id
 z198mr26929935qka.348.1604498425743; 
 Wed, 04 Nov 2020 06:00:25 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id y3sm131855qto.2.2020.11.04.06.00.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 06:00:24 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kaJKp-00GVgS-9E; Wed, 04 Nov 2020 10:00:23 -0400
Date: Wed, 4 Nov 2020 10:00:23 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH v5 05/15] mm/frame-vector: Use FOLL_LONGTERM
Message-ID: <20201104140023.GQ36674@ziepe.ca>
References: <20201030100815.2269-1-daniel.vetter@ffwll.ch>
 <20201030100815.2269-6-daniel.vetter@ffwll.ch>
 <446b2d5b-a1a1-a408-f884-f17a04b72c18@nvidia.com>
 <CAKMK7uGDW2f0oOvwgryCHxQFHyh3Tsk6ENsMGmtZ-EnH57tMSA@mail.gmail.com>
 <1f7cf690-35e2-c56f-6d3f-94400633edd2@nvidia.com>
 <CAKMK7uFYDSqnNp_xpohzCEidw_iLufNSoX4v55sNZj-nwTckSg@mail.gmail.com>
 <7f29a42a-c408-525d-90b7-ef3c12b5826c@nvidia.com>
 <CAKMK7uEw701AWXNJbRNM8Z+FkyUB5FbWegmSzyWPy9cG4W7OLA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uEw701AWXNJbRNM8Z+FkyUB5FbWegmSzyWPy9cG4W7OLA@mail.gmail.com>
X-Mailman-Approved-At: Thu, 05 Nov 2020 08:20:02 +0000
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
Cc: =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Jan Kara <jack@suse.cz>,
 Pawel Osciak <pawel@osciak.com>, KVM list <kvm@vger.kernel.org>,
 John Hubbard <jhubbard@nvidia.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Tomasz Figa <tfiga@chromium.org>, Linux MM <linux-mm@kvack.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Nov 01, 2020 at 11:50:39PM +0100, Daniel Vetter wrote:

> It's not device drivers, but everyone else. At least my understanding
> is that VM_IO | VM_PFNMAP means "even if it happens to be backed by a
> struct page, do not treat it like normal memory". And gup/pup_fast
> happily break that. I tried to chase the history of that test, didn't
> turn up anything I understood much:

VM_IO isn't suppose do thave struct pages, so how can gup_fast return
them?

I thought some magic in the PTE flags excluded this?

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
