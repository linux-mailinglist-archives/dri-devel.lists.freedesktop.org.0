Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F973324DF6
	for <lists+dri-devel@lfdr.de>; Thu, 25 Feb 2021 11:25:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DDCC6EC85;
	Thu, 25 Feb 2021 10:25:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DE3F6EC85
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Feb 2021 10:25:54 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id m1so4355166wml.2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Feb 2021 02:25:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=qtTO3l0yhHIrazRtLFS+om08YvRX5sl5TWHFOMKpxcY=;
 b=Y29xvRL2SdE14yqgwXClhqLMFLUfjiVw2oLteoDj6/cgAiCiDnIVqYIPX1fDvTVnp4
 kKN0ODaTB27weQ4wxO4WjhpbdmMH4q9dOH5JtAVoN+p8LIdq/wErg/5GGzppIXZCCafw
 EeefXPYZZQm/NAbjSXt7SWSbMgmO93Ff1rcNc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qtTO3l0yhHIrazRtLFS+om08YvRX5sl5TWHFOMKpxcY=;
 b=E7KhT0qkdZE31ZsctuYj3YZYiO63Zw+ykVmTLiJhz9KKQKWlllfiKrW69SbnDqcEBZ
 +9r/8CJ1BKggSseoTpWnDeRt9qMGFoQpGL/v5lPMTxTJ0bzzlzF6VYTXsQcPJBH/x8qp
 mREQzZKhy4SvkeriNYyJ5Uslf0KQ5+Tl501YHGShGNTv2Evyw3olrwU2F7/pYEHOT6xc
 Obd+gveYrTY66LfVnuO/YkNoLPNijjjU2W5aIBvQ6gNjEv5QIaaI5uwfI3KLVWkZ3VbU
 gHy95jhXv/53k1QASQwdu+9R0dA/A7GkJ4L2uNE+wG5Ys0afu0p5J6yXwMu1MXoXMY4q
 ClWw==
X-Gm-Message-State: AOAM530J5yJn3topDvke7GNlHgPew14FDFHXh9pl5/dE7t6qqAeud3LD
 1eSIRtrMmPIWoHl5bWe8fPDmcg==
X-Google-Smtp-Source: ABdhPJy/V9WqScGmrk3qYdNxr/wcer8xFT/W0Xfyro9Bqv2ccY/aRjJNdpbs8APYw4X2L56GO8nqvA==
X-Received: by 2002:a05:600c:210f:: with SMTP id
 u15mr2458738wml.119.1614248752833; 
 Thu, 25 Feb 2021 02:25:52 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id d17sm8386388wrv.93.2021.02.25.02.25.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 02:25:52 -0800 (PST)
Date: Thu, 25 Feb 2021 11:25:50 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Subject: Re: [PATCH v4 00/14] RFC Support hot device unplug in amdgpu
Message-ID: <YDd7LkMw+S4obnFe@phenom.ffwll.local>
References: <YAfyPEB2gpMnW/PP@phenom.ffwll.local>
 <8ea4b2d7-d5f3-3708-724d-c70520603283@amd.com>
 <CAKMK7uE11MonjPB3dmy6u=b029am1p2KqJ57DgLUGu-9QgtebA@mail.gmail.com>
 <75e782f1-4cb9-9210-87d2-e7d2a76782f1@amd.com>
 <CAKMK7uH=ycuBQ5qbujA8kwcrExAC4YAM26W-7wJjE7RS4zPiHw@mail.gmail.com>
 <6152bf16-6086-17f5-4157-c9be0ef84155@amd.com>
 <YCJa2HraImprr4Ew@phenom.ffwll.local>
 <871a02d8-e776-dd37-bd25-3169f8167923@amd.com>
 <CAKMK7uEKERRmQRfngkO_1yfi6kHJjarJncFm3eZ1Uxcf9pNWGg@mail.gmail.com>
 <c8666ac8-e7b4-59e1-dac7-a10d77aeb9ff@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c8666ac8-e7b4-59e1-dac7-a10d77aeb9ff@amd.com>
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
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Greg KH <gregkh@linuxfoundation.org>, Alex Deucher <Alexander.Deucher@amd.com>,
 Qiang Yu <yuq825@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 24, 2021 at 11:30:50AM -0500, Andrey Grodzovsky wrote:
> 
> On 2021-02-19 5:24 a.m., Daniel Vetter wrote:
> > On Thu, Feb 18, 2021 at 9:03 PM Andrey Grodzovsky
> > <Andrey.Grodzovsky@amd.com> wrote:
> > > Looked a bit into it, I want to export sync_object to FD and import  from that FD
> > > such that I will wait on the imported sync object handle from one thread while
> > > signaling the exported sync object handle from another (post device unplug) ?
> > > 
> > > My problem is how to create a sync object with a non signaled 'fake' fence ?
> > > I only see API that creates it with already signaled fence (or none) -
> > > https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Felixir.bootlin.com%2Flinux%2Flatest%2Fsource%2Fdrivers%2Fgpu%2Fdrm%2Fdrm_syncobj.c%23L56&amp;data=04%7C01%7CAndrey.Grodzovsky%40amd.com%7C5085bdd151c642514d2408d8d4c08e56%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637493270792459284%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=sZWIn0Lo7ZujBq0e7MdFPhJDARXWpOlLgLzANMS8cCY%3D&amp;reserved=0
> > > 
> > > P.S I expect the kernel to crash since unlike with dma_bufs we don't hold
> > > drm device reference here on export.
> > Well maybe there's no crash. I think if you go through all your
> > dma_fence that you have and force-complete them, then I think external
> > callers wont go into the driver anymore. But there's still pointers
> > potentially pointing at your device struct and all that, but should
> > work. Still needs some audit ofc.
> > 
> > Wrt how you get such a free-standing fence, that's amdgpu specific. Roughly
> > - submit cs
> > - get the fence for that (either sync_file, but I don't think amdgpu
> > supports that, or maybe through drm_syncobj)
> > - hotunplug
> > - wait on that fence somehow (drm_syncobj has direct uapi for this,
> > same for sync_file I think)
> > 
> > Cheers, Daniel
> 
> 
> Indeed worked fine, did with 2 devices. Since syncobj is refcounted, even
> after I
> destroyed the original syncobj and unplugged the device, the exported
> syncobj and the
> fence inside didn't go anywhere.
> 
> See my 3 tests in my branch on Gitlab
> https://gitlab.freedesktop.org/agrodzov/igt-gpu-tools/-/commits/master
> and let me know if I should go ahead and do a merge request (into which
> target project/branch ?) or you
> have more comments.

igt still works with patch submission.
-Daniel

> 
> Andrey
> 
> 
> > 
> > > Andrey
> > > 
> > > On 2/9/21 4:50 AM, Daniel Vetter wrote:
> > > > Yeah in the end we'd need 2 hw devices for testing full fence
> > > > functionality. A useful intermediate step would be to just export the
> > > > fence (either as sync_file, which I think amdgpu doesn't support because
> > > > no android egl support in mesa) or drm_syncobj (which you can do as
> > > > standalone fd too iirc), and then just using the fence a bit from
> > > > userspace (like wait on it or get its status) after the device is
> > > > unplugged.
> > 
> > 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
