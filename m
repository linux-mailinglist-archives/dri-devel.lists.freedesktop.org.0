Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DE73243F5
	for <lists+dri-devel@lfdr.de>; Wed, 24 Feb 2021 19:47:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FBC26E062;
	Wed, 24 Feb 2021 18:47:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 101B36E062
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Feb 2021 18:46:59 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id b24so2171894qtp.13
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Feb 2021 10:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=VrjvjB78Kh6dNXfIIH+c0MkGaNwqdx16pxLGBYXPvwM=;
 b=jjB1UZuK32Ke9VRfm8YRmJuxrd4jZ1KKlPi1xH/k5SNHmtI/GLgaFN69BYYMoxeFow
 8gEKIaXrz5BpYsWTJADgqUGv0djXy6d2kY+4vqKKNpK8qxCSumaxTraBmtIslCFKG2X0
 DYlXBpigpHVPYOrS5YReFqkHPL8sUn0GMShwU6OUMKWpFbrON5nWwXE4X3DnKEHDIk6e
 HSdhgiFhl9Q91uR3Lv/4rNnt1VShcndISi7JtOjlSRtHy6idWrvd/Z70EFKux1zP1A8+
 aZ++cfzRJMVErMv90bk+Zua1JTlHjDPaBQEmvTQTYo7D61pMJmlMuPEhu4ho0QmdajHv
 NvNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VrjvjB78Kh6dNXfIIH+c0MkGaNwqdx16pxLGBYXPvwM=;
 b=Ib4hEPWGmf0SQoN8vYeP/h0QxMuhexZDA9Kzs6MR8gM1BAZiVVURg96FAqAXjl6PPB
 dbNN849slwPDQi3y07TDZ/8kMia72RRRWvjifBsBgYW9lrMovzXlLuRbHyNfHPb+3RiG
 XxZK7Y57MsHAamdi82PzkPnMFzAKQDpeqNRWKxPK6I/bUwMxK60yxeg79Zid8MQPe9xE
 Tj27Fv++1YmC2G7T7UGSefaijZcukK9RKkEkRPAG2Yuq7845bDmt9zOJ+bWXmEZ+n8Kx
 vN6pUvFca+J3f0gyo/ml1jRcs3xDAdsacXALmZlyNVg7IyWLR83ayPJC8NluAgo9Mxy7
 cotg==
X-Gm-Message-State: AOAM532xjopUm8KDXtTJfqxpyAVynOijoFUfoYGUPc/DjyDbhxJAbPVv
 7TlMRAKrqTbonbAGME/KJfNIeA==
X-Google-Smtp-Source: ABdhPJxW9xJMQxdNXP/6Q9rzo3S7DhLtVdo2G2c7/gZ8wtaJRcPsqAqAlDlqAQRUSlE9KXebcfKo2g==
X-Received: by 2002:ac8:5ac9:: with SMTP id d9mr29408484qtd.123.1614192419030; 
 Wed, 24 Feb 2021 10:46:59 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-115-133.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.115.133])
 by smtp.gmail.com with ESMTPSA id i75sm2129440qke.47.2021.02.24.10.46.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 10:46:58 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1lEzBZ-00GmDm-Ok; Wed, 24 Feb 2021 14:46:57 -0400
Date: Wed, 24 Feb 2021 14:46:57 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [Linaro-mm-sig] [PATCH 1/2] dma-buf: Require VM_PFNMAP vma for
 mmap
Message-ID: <20210224184657.GR2643399@ziepe.ca>
References: <20210223105951.912577-1-daniel.vetter@ffwll.ch>
 <1a7c2295-6241-f2bf-4a78-6cadd43bc248@shipmail.org>
 <CAKMK7uHzRb6Q_LgPUrrHn18sorYo7ysTgB+PNE36LDUUsJpHDg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uHzRb6Q_LgPUrrHn18sorYo7ysTgB+PNE36LDUUsJpHDg@mail.gmail.com>
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
Cc: Thomas =?utf-8?B?SGVsbHN0csO2bSAoSW50ZWwp?= <thomas_os@shipmail.org>,
 Matthew Wilcox <willy@infradead.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Suren Baghdasaryan <surenb@google.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 24, 2021 at 09:45:51AM +0100, Daniel Vetter wrote:

> Hm I figured everyone just uses MAP_SHARED for buffer objects since
> COW really makes absolutely no sense. How would we enforce this?

In RDMA we test

drivers/infiniband/core/ib_core_uverbs.c:       if (!(vma->vm_flags & VM_SHARED))

During mmap to reject use of MAP_PRIVATE on BAR pages.

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
