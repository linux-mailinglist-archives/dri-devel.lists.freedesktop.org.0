Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 688C0310D6D
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 16:53:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AF7A6F478;
	Fri,  5 Feb 2021 15:53:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE5C46F478
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 15:53:08 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id u14so6260959wmq.4
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Feb 2021 07:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=8Ir4+6jXeWF96O1JJUoPM2tro7HgHzmtgfQxRaavk4k=;
 b=GG4/X4vfqGxHf+FcSU1m0HfMF3nZHr/JkWja0qFhQnEm4oNaQ4Ne1XqdW2nY85/nNu
 c32RcEEvul0N+mNo54y/xEeLO0m9B9bp3ksBZlm1QSFP0fJYnnh2EWf4+vIxtgV3TEr5
 ugFftl0I++sc6DjOP/rSWFANYqFl18yBXjwpc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8Ir4+6jXeWF96O1JJUoPM2tro7HgHzmtgfQxRaavk4k=;
 b=koYoYbdkSd61dwC52x/Gi7q/O2Vz3ldLmH8c8T6672LBeiq8zFBnqEPf+x86yPTSZf
 rR88aDGu23TJ0YclcESQwJk1rwOVR1fbXCAG/b5rCpviVvusDlPYqtEl4afA5PlIK64c
 UWRNHqZhT4a3xYzxPzJIfG9J7HlUl/N3wYk4EExfm7b2/HaGQNMfqqtT9t9M4XKTWzQK
 Dga1gS7V27NvpXWQp6Pwb/12iLTY4mf0L1Jk+DY+zsTdsZbgo8IEH/HlQMcQkoux5b6x
 SO+WDSHd1hyVqWij4xi8zm8ANLn6Y4Ms9Qh5rP1W7KoYKm5iY6mgAaraZYbIK+cFApv2
 DmSA==
X-Gm-Message-State: AOAM533PWZCdzoV6Vcp65Nl/qcE/Ru7m5WuyaAtWuSw/32in4IXgD32l
 rh3IRHmtqO2D0/smfF8SEA2cgb+CTc68w16X
X-Google-Smtp-Source: ABdhPJyHjupniXZffmsHLQ5vfS77YrHpoNGLCS1sGwzhA+NN8PKI/ovT3ResDGrVha19lSn77gFBig==
X-Received: by 2002:a1c:cc19:: with SMTP id h25mr4151508wmb.124.1612540387688; 
 Fri, 05 Feb 2021 07:53:07 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f14sm9338758wmj.30.2021.02.05.07.53.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 07:53:06 -0800 (PST)
Date: Fri, 5 Feb 2021 16:53:04 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v16 0/4] RDMA: Add dma-buf support
Message-ID: <YB1p4Bpmz0yFcbEf@phenom.ffwll.local>
References: <1608067636-98073-1-git-send-email-jianxin.xiong@intel.com>
 <5e4ac17d-1654-9abc-9a14-bda223d62866@nvidia.com>
 <CADnq5_M2YuOv16E2DG6sCPtL=z5SDDrN+y7iwD_pHVc7Omyrmw@mail.gmail.com>
 <20210204182923.GL4247@nvidia.com>
 <CADnq5_N9QvgAKQMLeutA7oBo5W5XyttvNOMK_siOc6QL+H07jQ@mail.gmail.com>
 <8e731fce-95c1-4ace-d8bc-dc0df7432d22@nvidia.com>
 <YB1mw/uYwueFwUdh@phenom.ffwll.local>
 <20210205154319.GT4247@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210205154319.GT4247@nvidia.com>
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

On Fri, Feb 05, 2021 at 11:43:19AM -0400, Jason Gunthorpe wrote:
> On Fri, Feb 05, 2021 at 04:39:47PM +0100, Daniel Vetter wrote:
> 
> > > And again, for slightly older hardware, without pinning to VRAM there is
> > > no way to use this solution here for peer-to-peer. So I'm glad to see that
> > > so far you're not ruling out the pinning option.
> > 
> > Since HMM and ZONE_DEVICE came up, I'm kinda tempted to make ZONE_DEVICE
> > ZONE_MOVEABLE (at least if you don't have a pinned vram contigent in your
> > cgroups) or something like that, so we could benefit from the work to make
> > sure pin_user_pages and all these never end up in there?
> 
> ZONE_DEVICE should already not be returned from GUP.
> 
> I've understood in the hmm casse the idea was a CPU touch of some
> ZONE_DEVICE pages would trigger a migration to CPU memory, GUP would
> want to follow the same logic, presumably it comes for free with the
> fault handler somehow

Oh I didn't know this, I thought the proposed p2p direct i/o patches would
just use the fact that underneath ZONE_DEVICE there's "normal" struct
pages. And so I got worried that maybe also pin_user_pages can creep in.
But I didn't read the patches in full detail:

https://lore.kernel.org/linux-block/20201106170036.18713-12-logang@deltatee.com/

But if you're saying that this all needs specific code and all the gup/pup
code we have is excluded, I think we can make sure that we're not ever
building features that requiring time-unlimited pinning of ZONE_DEVICE.
Which I think we want.

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
