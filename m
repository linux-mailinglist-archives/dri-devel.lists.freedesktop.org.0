Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AD8285970
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 09:23:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C1306E8B4;
	Wed,  7 Oct 2020 07:22:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6FA46E0F6
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Oct 2020 18:38:36 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id v123so17775935qkd.9
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Oct 2020 11:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=13YCzlSbobruCRdCEQfgKiUmjdZ6nwwv8Uv0t+JOKFI=;
 b=GZKzFytcMUX7skguYChyzGwUh1yGRhMhssr0V+wX796XPf00l/yK8pRgwO7CpiQDnp
 AXGUikgcD6TQ2u7FZxq3DYDp15rx5tsiuW8KvBJ3vdh5YEmX1df+KH1urtD4sCk/zlRd
 5dngYHISziSvybxIdJHMYMrGhdlb+r6exc/RqlaD3Ss+NPCBcgruHV7sA6uBCgiDZpx8
 FOq3xWcnHWMcPQMywDWFzqVLEY1LcCopkJWL4v0Tg2GpZoD0qGWbCgLazZ4wkTbjWIcE
 X/f0OsEpyGD6vkOYT6OqAF0hpiFR7YkISo24nVS6yZ9qYvbiX9qMEh2aLWx5qmfQb1Fa
 NwSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=13YCzlSbobruCRdCEQfgKiUmjdZ6nwwv8Uv0t+JOKFI=;
 b=Z6e+lP/T8UaNOSPQpAv7e2f0SMvGalwbzj/yRQSvV1O2sY7/QBx2wM2uvYPIFERohC
 PcrnRuVyMuVPxzme274p+dXMetdb7jTTomq7UQPaXTe/7Km48h5R9a2c3na59BeGSaLx
 iuN+wxFb4byhSqZ3Pbbo425fxNBJOb5EhW9n6PSfje+Qi4/PqPcfCyJ0XbkCEH4V9X9R
 1qFYMMbtgCQNzXI4cCwh1GmNSO+R4pjk2snJcmPHp5+21/aQdpUGfR+my0t5CVfUJ2qG
 jaWhhmsln/3pBHY2i+h8R/Z5GGPBd2/enMyRN72xWZqYQtiNPhvyZnit/JkEUkJgC0sA
 62wA==
X-Gm-Message-State: AOAM530LNG5qtxmw+kutfF7FERGIdc2Y0Dn8wkPVtT6ipyj5c5Elx6kv
 d+waRqCkyt+LlCOllZg0Cx4LDw==
X-Google-Smtp-Source: ABdhPJzAXC5Bn7VV0YZDL9P7NK2cu4LXcaynCA+uQfRqJBnk9WH/uiH5J114DhJkMjYgWP+yITXpbg==
X-Received: by 2002:a05:620a:54f:: with SMTP id
 o15mr5182925qko.91.1602009515885; 
 Tue, 06 Oct 2020 11:38:35 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id w6sm3271631qkb.6.2020.10.06.11.38.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2020 11:38:35 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kPrr8-000d59-KY; Tue, 06 Oct 2020 15:38:34 -0300
Date: Tue, 6 Oct 2020 15:38:34 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [RFC PATCH v3 1/4] RDMA/umem: Support importing dma-buf as user
 memory region
Message-ID: <20201006183834.GK5177@ziepe.ca>
References: <1601838751-148544-1-git-send-email-jianxin.xiong@intel.com>
 <1601838751-148544-2-git-send-email-jianxin.xiong@intel.com>
 <20201005131302.GQ9916@ziepe.ca>
 <MW3PR11MB455572267489B3F6B1C5F8C5E50C0@MW3PR11MB4555.namprd11.prod.outlook.com>
 <20201006092214.GX438822@phenom.ffwll.local>
 <20201006154956.GI5177@ziepe.ca>
 <20201006163420.GB438822@phenom.ffwll.local>
 <CAKMK7uG1RpDQ9ZO=VxkNuGjGPqkAzMQDgi89eSjDoMerMQ4+9A@mail.gmail.com>
 <20201006180244.GJ5177@ziepe.ca>
 <CAKMK7uEN7=QGOJMMf5UwR5Azsk+3-apFjn_hFmoSUTDOh1f85g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uEN7=QGOJMMf5UwR5Azsk+3-apFjn_hFmoSUTDOh1f85g@mail.gmail.com>
X-Mailman-Approved-At: Wed, 07 Oct 2020 07:22:33 +0000
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
Cc: Leon Romanovsky <leon@kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Doug Ledford <dledford@redhat.com>, "Vetter, Daniel" <daniel.vetter@intel.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, "Xiong,
 Jianxin" <jianxin.xiong@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 06, 2020 at 08:17:05PM +0200, Daniel Vetter wrote:

> So on the gpu we pipeline this all. So step 4 doesn't happen on the
> cpu, but instead we queue up a bunch of command buffers so that the
> gpu writes these pagetables (and the flushes tlbs and then does the
> actual stuff userspace wants it to do).

mlx5 HW does basically this as well.

We just apply scheduling for this work on the device, not in the CPU.
 
> just queue it all up and let the gpu scheduler sort out the mess. End
> result is that you get a sgt that points at stuff which very well
> might have nothing even remotely resembling your buffer in there at
> the moment. But all the copy operations are queued up, so rsn the data
> will also be there.

The explanation make sense, thanks

> But rdma doesn't work like that, so it looks all a bit funny.

Well, I guess it could, but how would it make anything better? I can
overlap building the SGL and the device PTEs with something else doing
'move', but is that a workload that needs such agressive optimization?

> This is also why the precise semantics of move_notify for gpu<->gpu
> sharing took forever to discuss and are still a bit wip, because you
> have the inverse problem: The dma api mapping might still be there

Seems like this all makes a graph of operations, can't start the next
one until all deps are finished. Actually sounds a lot like futures.

Would be clearer if this attach API provided some indication that the
SGL is actually a future valid SGL..

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
