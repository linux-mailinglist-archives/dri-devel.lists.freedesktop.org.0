Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 172D4286250
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 17:39:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8518D6E926;
	Wed,  7 Oct 2020 15:39:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 882CE6E8EE
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 13:42:37 +0000 (UTC)
Received: by mail-qv1-xf43.google.com with SMTP id t20so1126258qvv.8
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Oct 2020 06:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=bm7Nux/xb6SXj9ZR29eQsCeZolUUGIlGA/3pCXOWnqY=;
 b=oRN0ouP+3GVYiwbPUcOxPk+cVTMSfi6e6xB/kp+ZpPLA+3QEn3FltuYnLYp3IbMyT4
 XLTyLwYzH3ifqaZnXaU/ZWFyM48epTsFUjsHkhU0idcCtjI43xlPcUDIQI5i97qJQ1Z/
 hmWU0XhKPvhi2J7X6OI+NOkn5m1fjar7B+5a/IGgH6kfN1aHK788jThYwphFUhnE71h5
 QymuBRmevVtIbPPsb8/x5Mk95uTwIXwCIbZATz13huzt0//nPIRFE0pqbC5dvTfYdelP
 5WCCE51W2P5JcKqcJp27ijUk9DzYAmgp+0NhYYdt4Crdv5HPqfR+eWr9bpKdWw5SdwKY
 eKWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bm7Nux/xb6SXj9ZR29eQsCeZolUUGIlGA/3pCXOWnqY=;
 b=ogY8ClFHXjvwZ50JmYlAm4wR4Ee+8i8eBfV4t6D3ljd9zG/J+/d9hlax8aVYAAF83Y
 /KEineE+1gC2TJuDRaJ0ufF/rU6gO4y5pORtM7QzgwWKiJwc23iPwr6wyajeG926D2xM
 LGZjUincoQF7mGL/UtHSVt+8fUXJbaa56fPNBpK/GuHrq9NoTAAe/tFkpQC4/NVaK6js
 Ni9XcghiUbqxNTGlivL/wS5Xq499qZ+nyDpmE7MCZVlahiRHT2CPjRcT4AdYa/OEO8tY
 e9jVf/LU2zDf+CTAqT3aq9jjyrcFkr13RigoOT9Fd4hUO+BjNzz+lS2pWlQkTOJumVel
 gKZQ==
X-Gm-Message-State: AOAM533kKvC1hZESED2jMJXx1hlUG7Lw2kpXOjFYuhUV7yCFJBZ33nbd
 MjiMs6dN7tm/fn9m5CI0ZEJSKg==
X-Google-Smtp-Source: ABdhPJwsa8h0AE9bNg84UqMhO3s2DHUlgwedfs5Hzzp4d+UxHAd3U8iQNwNgaZByIN+Ca7e6aXxfNA==
X-Received: by 2002:a0c:e2c1:: with SMTP id t1mr3148068qvl.35.1602078155592;
 Wed, 07 Oct 2020 06:42:35 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id b9sm1325969qka.86.2020.10.07.06.42.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2020 06:42:34 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kQ9iE-000uYh-A3; Wed, 07 Oct 2020 10:42:34 -0300
Date: Wed, 7 Oct 2020 10:42:34 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCH 2/2] mm/frame-vec: use FOLL_LONGTERM
Message-ID: <20201007134234.GR5177@ziepe.ca>
References: <CGME20201003094038eucas1p12aaafe0f52a7747bc2ba95ccb91d1651@eucas1p1.samsung.com>
 <CAKMK7uFP-XQHUPYeRhPx7tjvjARQiF-os9z9jx6WANV6sgSf6g@mail.gmail.com>
 <d2f8e8a7-614d-18c8-9e2a-c604e5e54ce6@samsung.com>
 <CAKMK7uF+a1PSn+e-6F+YhkSXn9vC7etS-z0AFBMCU+Vzb2PwqA@mail.gmail.com>
 <725819e9-4f07-3f04-08f8-b6180406b339@samsung.com>
 <20201007124409.GN5177@ziepe.ca>
 <CAAFQd5D0ahP-3hp_vGEmJ2cyBOMXeW9HX5yKaVPcQTsFwwOE8Q@mail.gmail.com>
 <CAKMK7uG3fds79Yf9VhMstnJ2+UHYUEVdODkoOvtwFC28_+T6RA@mail.gmail.com>
 <20201007130610.GP5177@ziepe.ca>
 <CAAFQd5CH8ytmwfd_AD0e9C92xkW3fRPmqvi9_4UN6pw-y3f-sg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAFQd5CH8ytmwfd_AD0e9C92xkW3fRPmqvi9_4UN6pw-y3f-sg@mail.gmail.com>
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
 Kyungmin Park <kyungmin.park@samsung.com>, Linux MM <linux-mm@kvack.org>,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 John Hubbard <jhubbard@nvidia.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 07, 2020 at 03:34:01PM +0200, Tomasz Figa wrote:

> I think the userptr zero-copy hack should be able to go away indeed,
> given that we now have CMA that allows having carveouts backed by
> struct pages and having the memory represented as DMA-buf normally.

This also needs to figure out how to get references to CMA pages out
of a VMA. IIRC Daniel said these are not pinnable?

> How about the regular userptr use case, though?

Just call pin_user_pages(), that is the easy case.

> Is your intention to drop get_vaddr_frames() or we could still keep
> using it and if vec->is_pfns is true:

get_vaddr_frames() is dangerous, I would like it to go away.

> a) if CONFIG_VIDEO_LEGACY_PFN_USERPTR is set, taint the kernel
> b) otherwise just undo and fail?

For the CONFIG_VIDEO_LEGACY_PFN_USERPTR case all the follow_pfn
related code in get_vaddr_frames() shold move back into media and be
hidden under this config.

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
