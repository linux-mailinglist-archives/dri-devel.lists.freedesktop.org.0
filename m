Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB19F2C68C8
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 16:37:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86FD66EE39;
	Fri, 27 Nov 2020 15:37:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AC536EE38
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 15:37:02 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id g14so5967687wrm.13
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 07:37:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=K1Lvq4AT8euTQFOTDi7SD1yQLWPU3xtKj6SslzOCQcc=;
 b=j0CTYxjISTzyYB3fnH07BP1SfkXZdDJFFx3Fq1Vh21kSx5OS6XHKFajDvVcGcx8pA8
 cPCJqXp/h1c+KknHtBJuMbi8uavr493P4Sb/k+TrVqytxJYTAlRNAo2DznOvjz/xp51u
 jzdWE2vocNjByPF32K8tQ5Xdol/Cx8Q13Vf3w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=K1Lvq4AT8euTQFOTDi7SD1yQLWPU3xtKj6SslzOCQcc=;
 b=FjENL5JC+kzIhYqaJfNzAYkA065AynsIzKY2GZSwa5ZsfnefmT1D3fgH9yKXWB5GyI
 ScpDmPAjWUXxQAeKP/c9hLp7rxMoY9sk5o+XSxdLdMATq4uge6K+aXXK98ASyBjrvlLM
 rT5i+SvrwIoDShpISUEIY956UOx7YVagcK3JB6o6XNV0y/95IdC/6xz0SL6vK4rbAKIL
 Sa2KX8Nwn9Iqjqa7vs7tGU9WGK5ExZh1MFWCj9UQBoTNMA7Sjf6xDZGWqEJ3w1UxNyo/
 oir4K/8XXnhL4z/1kZ3+DhsIbSbCLCa0SCKIuZOAlv1Dxol9jDzdYPaYgrNHO2SCMVJ2
 1oWw==
X-Gm-Message-State: AOAM53183YsbbCogbHNbFvRBPPPKGvZfeMMlhdLJTpT3bHkoHfpGkx+P
 NIaaSda8NZZm/8FzlmKkqWYJSA==
X-Google-Smtp-Source: ABdhPJw+HtnvrbrT1AqdueQE1hAvJ6eYSG3hDtZ8dwkM1q0A/rHWJIoxRYFcjysrLjp6WJc+IFTRWQ==
X-Received: by 2002:adf:dd52:: with SMTP id u18mr10975193wrm.44.1606491420509; 
 Fri, 27 Nov 2020 07:37:00 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t184sm2744650wmt.13.2020.11.27.07.36.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 07:36:59 -0800 (PST)
Date: Fri, 27 Nov 2020 16:36:57 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v6 00/17] follow_pfn and other iomap races
Message-ID: <20201127153657.GJ401619@phenom.ffwll.local>
Mail-Followup-To: Jason Gunthorpe <jgg@ziepe.ca>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, kvm@vger.kernel.org,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org
References: <20201119144146.1045202-1-daniel.vetter@ffwll.ch>
 <20201127131225.GX5487@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201127131225.GX5487@ziepe.ca>
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
Cc: linux-samsung-soc@vger.kernel.org, kvm@vger.kernel.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 27, 2020 at 09:12:25AM -0400, Jason Gunthorpe wrote:
> On Thu, Nov 19, 2020 at 03:41:29PM +0100, Daniel Vetter wrote:
> > I feel like this is ready for some wider soaking. Since the remaining bits
> > are all kinda connnected probably simplest if it all goes through -mm.
> 
> Did you figure out a sumbission plan for this stuff?

I was kinda hoping Andrew would pick it all up.

> > Daniel Vetter (17):
> >   drm/exynos: Stop using frame_vector helpers
> >   drm/exynos: Use FOLL_LONGTERM for g2d cmdlists
> >   misc/habana: Stop using frame_vector helpers
> >   misc/habana: Use FOLL_LONGTERM for userptr
> >   mm/frame-vector: Use FOLL_LONGTERM
> >   media: videobuf2: Move frame_vector into media subsystem
> 
> At the very least it would be good to get those in right away.
> 
> >   mm: Add unsafe_follow_pfn
> >   media/videbuf1|2: Mark follow_pfn usage as unsafe
> >   vfio/type1: Mark follow_pfn as unsafe
> 
> I'm surprised nobody from VFIO has remarked on this, I think thety
> won't like it

Same here tbh :-)

> >   mm: Close race in generic_access_phys
> >   PCI: Obey iomem restrictions for procfs mmap
> >   /dev/mem: Only set filp->f_mapping
> >   resource: Move devmem revoke code to resource framework
> >   sysfs: Support zapping of binary attr mmaps
> >   PCI: Revoke mappings like devmem
> 
> This sequence seems fairly stand alone, and in good shape as well

Yeah your split makes sense. I'll reorder them for the next round (which
I'm prepping right now).
> 
> My advice is to put the done things on a branch and get Stephen to put
> them in linux-next. You can send a PR to Lins. There is very little mm
> stuff in here, and cross subsystem stuff works better in git land,
> IMHO.

Yeah could do. Andrew, any preferences?
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
