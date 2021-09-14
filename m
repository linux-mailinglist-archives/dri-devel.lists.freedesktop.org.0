Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D73C940B441
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 18:12:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABD0489FDB;
	Tue, 14 Sep 2021 16:12:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8169989FDB
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 16:12:20 +0000 (UTC)
Received: by mail-qk1-x732.google.com with SMTP id t4so15405078qkb.9
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 09:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=I7DiJbd0cxUCLQIOVYzn8bpAGXC1DpRRoThWyrXU5us=;
 b=VLAPpylLAYTeobmTkVR3mMWEApbSzQVCY6y9NZmlGqOYAYmCLqLovz+JRKOW4zbFQO
 SsICmqARfpElDi01jfGPfhfGp+XbjOWG5j7xhqkXBcfxNTtfN0Q2EHL2YIPXJAmE5lqq
 9fO4vT4ebWpM51oXh2PN3UzJN/nZE167NxFttlYk9zDneLRVxgg54Ms6stPw+IfwS8fE
 BcU8DH0Wkz0TT/2TEuDT6T2VOxScMtYxzNvvbGLNasoE4MraqR/e/O1maoUvya4XQnt5
 8ZqntLHL5K06ZWcY7hFsB6CkWDvb6eMwUQMOMC/DyK5zV21pUx/5Wgk/nJhjm274HIe8
 i/Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=I7DiJbd0cxUCLQIOVYzn8bpAGXC1DpRRoThWyrXU5us=;
 b=GfEKNdaMI2LLo6CAfo7cQVo4XOqG3ysZj2hAhi52i4kbuXo2kkihjJzC6/Z16dXYn9
 2w7rSvlFxfN0lKwWqp6VvUfYTtaUM7IN+azhN34KkVlbz3ZlFGdvmI7fHR5fcVbbRxDT
 ZI/c9OSPoNdsb+nbZfBl38c3TwANuln6uZix5POYVrmmWxVAON4U25ZWornYSKt3Fzwf
 JGZmCaUi6eTW2MoecaPIKRu3XR7Pn8p6yIT35obW2RQZ2uqy+vodDCQ5Xzv+gG53kZLj
 0ounzPclPqhZ71fXv2riMgb5+5QRYu3hEdznxh8pT4KETMWq5p7uQmF3aQyJszMM3Lqd
 WmXw==
X-Gm-Message-State: AOAM5320tKTnv53xfgmurFyqVVe5olUFepFKr6YQshXrnShIqblD3F7m
 GuNXPTekwi0ykxGI+1fuxP/WIA==
X-Google-Smtp-Source: ABdhPJx4jViYSyei0WdKfCFMJbXr109wAbeh5pMtA2HJlrp+YG8SrdRPcGb67UHsXDEjE3Pl7PPDDA==
X-Received: by 2002:a05:620a:4541:: with SMTP id
 u1mr5785047qkp.106.1631635939466; 
 Tue, 14 Sep 2021 09:12:19 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.129])
 by smtp.gmail.com with ESMTPSA id s18sm7826361qkj.87.2021.09.14.09.12.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 09:12:18 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1mQB2g-000UiF-8O; Tue, 14 Sep 2021 13:12:18 -0300
Date: Tue, 14 Sep 2021 13:12:18 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Oded Gabbay <ogabbay@kernel.org>, linux-kernel@vger.kernel.org,
 gregkh@linuxfoundation.org, christian.koenig@amd.com,
 galpress@amazon.com, sleybo@amazon.com,
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 linux-media@vger.kernel.org, dledford@redhat.com, airlied@gmail.com,
 alexander.deucher@amd.com, leonro@nvidia.com, hch@lst.de,
 amd-gfx@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v6 0/2] Add p2p via dmabuf to habanalabs
Message-ID: <20210914161218.GF3544071@ziepe.ca>
References: <20210912165309.98695-1-ogabbay@kernel.org>
 <YUCvNzpyC091KeaJ@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YUCvNzpyC091KeaJ@phenom.ffwll.local>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 14, 2021 at 04:18:31PM +0200, Daniel Vetter wrote:
> On Sun, Sep 12, 2021 at 07:53:07PM +0300, Oded Gabbay wrote:
> > Hi,
> > Re-sending this patch-set following the release of our user-space TPC
> > compiler and runtime library.
> > 
> > I would appreciate a review on this.
> 
> I think the big open we have is the entire revoke discussions. Having the
> option to let dma-buf hang around which map to random local memory ranges,
> without clear ownership link and a way to kill it sounds bad to me.
> 
> I think there's a few options:
> - We require revoke support. But I've heard rdma really doesn't like that,
>   I guess because taking out an MR while holding the dma_resv_lock would
>   be an inversion, so can't be done. Jason, can you recap what exactly the
>   hold-up was again that makes this a no-go?

RDMA HW can't do revoke.

So we have to exclude almost all the HW and several interesting use
cases to enable a revoke operation.

>   - For non-revokable things like these dma-buf we'd keep a drm_master
>     reference around. This would prevent the next open to acquire
>     ownership rights, which at least prevents all the nasty potential
>     problems.

This is what I generally would expect, the DMABUF FD and its DMA
memory just floats about until the unrevokable user releases it, which
happens when the FD that is driving the import eventually gets closed.

I still don't think any of the complexity is needed, pinnable memory
is a thing in Linux, just account for it in mlocked and that is
enough.

Jason
