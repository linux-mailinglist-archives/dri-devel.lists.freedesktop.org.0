Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B31310D98
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 17:06:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 513408800B;
	Fri,  5 Feb 2021 16:06:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 671FE6F481
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 16:06:47 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id q7so8203903wre.13
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Feb 2021 08:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=3OSZRC12f3q/J6xvpmjxkYtxd8Kjl+PfZ12MCmFyNTs=;
 b=bYXMPhnRMDnWNLg3owU/iy8WI3TbNcpN0GVSP5459+nS10U0XMpOTznWSNv/myvTnO
 KfxK93fxhG2u7Ura35Me9qKW50VlJ2+swQ01+GIT9Oe8cw0kdtkNOd/LbHWPPDDOtZXf
 ZKZnHo5aFIIiuH5xeRO5eg9jfpcDgyJe94qos=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3OSZRC12f3q/J6xvpmjxkYtxd8Kjl+PfZ12MCmFyNTs=;
 b=Mendsz3zor+8VXP2M+sqbNqhX+LwKtqRw+WrWvZwwbFvFO/i2OYC3LcEYt+PBXBcAa
 UIaS2XOvwDDjb2vC/NAO7YtdIgFq3+uL1nTdFp+Y8RXTWRbzBwRcmd/5Ve4ZWcvigImR
 +CFqP+UqVO5XkEwbMzhsLVGAkwPhd/NcJCgjmShYvp8bUqXf2+LyU3uQRi/WwlPzIXqa
 2tqRPHPD6MbX2dVQ4EzX0owU5vmHu0DvIgYwUcSbhRStGYn8ffM9/GVJqCnc+5zCbbmO
 ziPSYRrM0ntWphrc62xj8v4vcjPODltAbHNzu+AXqcXhw4ibaOfE+yDifh44cMLQwWhL
 IZsg==
X-Gm-Message-State: AOAM531ejfLOPHgUJs+f1VF3cLQkI6saFOZuWjZXM0qXBSdMDbH4OM0E
 G2l65ycxxcFTNGoVIzhGynjijA==
X-Google-Smtp-Source: ABdhPJxZ2wdJ6quTErZl6d8W+xMqeQz+RNxGJkRMmNGfC01VLq/Z0PeyUo/lOZrBhMLQvh9lWULc3Q==
X-Received: by 2002:adf:e7c1:: with SMTP id e1mr5816296wrn.23.1612541206152;
 Fri, 05 Feb 2021 08:06:46 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id e4sm12452422wrw.96.2021.02.05.08.06.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 08:06:45 -0800 (PST)
Date: Fri, 5 Feb 2021 17:06:43 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v16 0/4] RDMA: Add dma-buf support
Message-ID: <YB1tE0WKUOBaO03x@phenom.ffwll.local>
References: <1608067636-98073-1-git-send-email-jianxin.xiong@intel.com>
 <5e4ac17d-1654-9abc-9a14-bda223d62866@nvidia.com>
 <CADnq5_M2YuOv16E2DG6sCPtL=z5SDDrN+y7iwD_pHVc7Omyrmw@mail.gmail.com>
 <20210204182923.GL4247@nvidia.com>
 <CADnq5_N9QvgAKQMLeutA7oBo5W5XyttvNOMK_siOc6QL+H07jQ@mail.gmail.com>
 <8e731fce-95c1-4ace-d8bc-dc0df7432d22@nvidia.com>
 <YB1mw/uYwueFwUdh@phenom.ffwll.local>
 <20210205154319.GT4247@nvidia.com>
 <YB1p4Bpmz0yFcbEf@phenom.ffwll.local>
 <20210205160003.GU4247@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210205160003.GU4247@nvidia.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Leon Romanovsky <leon@kernel.org>, linux-rdma <linux-rdma@vger.kernel.org>,
 John Hubbard <jhubbard@nvidia.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Doug Ledford <dledford@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Jianxin Xiong <jianxin.xiong@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 05, 2021 at 12:00:03PM -0400, Jason Gunthorpe wrote:
> On Fri, Feb 05, 2021 at 04:53:04PM +0100, Daniel Vetter wrote:
> > On Fri, Feb 05, 2021 at 11:43:19AM -0400, Jason Gunthorpe wrote:
> > > On Fri, Feb 05, 2021 at 04:39:47PM +0100, Daniel Vetter wrote:
> > > 
> > > > > And again, for slightly older hardware, without pinning to VRAM there is
> > > > > no way to use this solution here for peer-to-peer. So I'm glad to see that
> > > > > so far you're not ruling out the pinning option.
> > > > 
> > > > Since HMM and ZONE_DEVICE came up, I'm kinda tempted to make ZONE_DEVICE
> > > > ZONE_MOVEABLE (at least if you don't have a pinned vram contigent in your
> > > > cgroups) or something like that, so we could benefit from the work to make
> > > > sure pin_user_pages and all these never end up in there?
> > > 
> > > ZONE_DEVICE should already not be returned from GUP.
> > > 
> > > I've understood in the hmm casse the idea was a CPU touch of some
> > > ZONE_DEVICE pages would trigger a migration to CPU memory, GUP would
> > > want to follow the same logic, presumably it comes for free with the
> > > fault handler somehow
> > 
> > Oh I didn't know this, I thought the proposed p2p direct i/o patches would
> > just use the fact that underneath ZONE_DEVICE there's "normal" struct
> > pages. 
> 
> So, if that every happens, it would be some special FOLL_ALLOW_P2P
> flag to get the behavior.
> 
> > And so I got worried that maybe also pin_user_pages can creep in.
> > But I didn't read the patches in full detail:
> 
> And yes, you might want to say that you can't longterm pin certain
> kinds of zone_device pages, but if that is the common operating mode
> then we'd probably never create a FOLL_ALLOW_P2P
> 
> > But if you're saying that this all needs specific code and all the gup/pup
> > code we have is excluded, I think we can make sure that we're not ever
> > building features that requiring time-unlimited pinning of
> > ZONE_DEVICE.
> 
> Well, it is certainly a useful idea of some uses of ZONE_DEVICE, GPU
> vram is not the whole world.

Yeah non-volatile RAM can probably pin whatever it wants :-)

From the other thread, I think if we can get some cgroups going for
accounting pinned memory, then pinning gpu memory should also not be any
real issue. Might be somewhat tricky to glue that into a FOLL_ALLOW_P2P
flag, maybe through zone-awareness or something like that. With the right
accounting in place I'm happy to let userspace pin whatever they want
really.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
