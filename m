Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A06E07E4A6B
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 22:17:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFD5110E37A;
	Tue,  7 Nov 2023 21:17:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F87110E37A
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Nov 2023 21:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699391830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ob/MXK41O4OQx740+jxcRvyOcu6h47UXeYggZNgy7vI=;
 b=PIU1M3gVVlmU+pMWReuPAEZf75um/Zy9Q1PGe0Cu6stbLAvqOQFHpKg6jjG56NpN2izkKb
 fns+AMpzEsEkU9Vv+ygsw/12mvziikO+G7tpperSxqJvqsnPjHJaq9Q2y5ZGBm6ljEp+sr
 oGXQuTE5HD4hDB8LZRU9Fk/TNMucQeM=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-625-N-5Bd0MxMK2tHtTbjY8jbQ-1; Tue, 07 Nov 2023 16:17:09 -0500
X-MC-Unique: N-5Bd0MxMK2tHtTbjY8jbQ-1
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-5090b916b7fso7170034e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Nov 2023 13:17:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699391827; x=1699996627;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ob/MXK41O4OQx740+jxcRvyOcu6h47UXeYggZNgy7vI=;
 b=WDV+iBvMaMiy9MA9a9SUBZjOVj//CBBPxylX4iSLHEiCaIyiKQlHIgbpaGq0/SFTh+
 9rpX1b2WsJ+iff5ERG9ekV1YIYrnKB6bGWVefEQCmD7MxsDOAhrMSNskrVhoI6YSyHZf
 +t1PuNT6M1vsrxqvB33UbaVMwXsC36YQFjaUfVm5axYSY7YNdo689vyVd4+dD2gyjp5Z
 B3UFMd/w9UM/+F8YzdBV/QwqKUZhufvEFGhUBCKL5lBpRzYcXotaW4K1PXcOeLzwTipu
 7V6p00nLF9bvvGDv/nPZfZac5HG7ZjMjydo/g32M2QNmCVbTeLZ6MdX6Z9SgRdQEMvu6
 1vJw==
X-Gm-Message-State: AOJu0YyJ6h+fYiSmOYXrkSG/Y3sRJJxDQOEmqcYFXb+BqvVFue/ydXt6
 F/OpiZYvKeUF2iyz9HCPf0aRMVxLosTskSDNfbzjGIgvkQHoH/LCLAXwCZ9xArvXzfSrriWmhsG
 5idDhq9ErON2MBNTRlNN4SNHJV0SZ
X-Received: by 2002:a05:6512:48d1:b0:500:bf33:3add with SMTP id
 er17-20020a05651248d100b00500bf333addmr23100771lfb.47.1699391827252; 
 Tue, 07 Nov 2023 13:17:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF5XEkNwzuGQAcoD50Xr3EQ05V5BJtGBPT5sypNyy9BGc31fvKeVspxhKF5xGMnrJAqrH6EWQ==
X-Received: by 2002:a05:6512:48d1:b0:500:bf33:3add with SMTP id
 er17-20020a05651248d100b00500bf333addmr23100741lfb.47.1699391826866; 
 Tue, 07 Nov 2023 13:17:06 -0800 (PST)
Received: from toolbox ([2001:9e8:89b4:f200:c97b:caca:1f2e:f4c1])
 by smtp.gmail.com with ESMTPSA id
 y18-20020a5d4ad2000000b00323287186aasm3313181wrs.32.2023.11.07.13.17.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Nov 2023 13:17:06 -0800 (PST)
Date: Tue, 7 Nov 2023 22:17:04 +0100
From: Sebastian Wick <sebastian.wick@redhat.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [RFC PATCH v2 06/17] drm/doc/rfc: Describe why prescriptive
 color pipeline is needed
Message-ID: <20231107211704.GA321697@toolbox>
References: <20231019212133.245155-1-harry.wentland@amd.com>
 <20231019212133.245155-7-harry.wentland@amd.com>
 <20231020142256.GA859375@toolbox> <20231020175703.09cd2578@eldfell>
 <20f33898-4c40-4854-a1e8-afaef52f6524@amd.com>
 <20231023111219.6e287958@eldfell>
 <bf69b740-dce7-94f1-293d-a4b274b52f55@nvidia.com>
 <20231026115747.44cbddad@eldfell> <20231026173003.GA319477@toolbox>
 <947016a2-8df2-4f76-86dc-a375c26d5f22@amd.com>
MIME-Version: 1.0
In-Reply-To: <947016a2-8df2-4f76-86dc-a375c26d5f22@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: Sasha McIntosh <sashamcintosh@google.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>, Victoria Brekenfeld <victoria@system76.com>,
 dri-devel@lists.freedesktop.org,
 Michel =?iso-8859-1?Q?D=E4nzer?= <mdaenzer@redhat.com>,
 Arthur Grillo <arthurgrillo@riseup.net>, Aleix Pol <aleixpol@kde.org>,
 Shashank Sharma <shashank.sharma@amd.com>, wayland-devel@lists.freedesktop.org,
 Jonas =?iso-8859-1?Q?=C5dahl?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Naseer Ahmed <quic_naseer@quicinc.com>, Melissa Wen <mwen@igalia.com>,
 Pekka Paalanen <ppaalanen@gmail.com>,
 Christopher Braga <quic_cbraga@quicinc.com>, Hector Martin <marcan@marcan.st>,
 Xaver Hugl <xaver.hugl@gmail.com>, Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 07, 2023 at 11:52:11AM -0500, Harry Wentland wrote:
> 
> 
> On 2023-10-26 13:30, Sebastian Wick wrote:
> > On Thu, Oct 26, 2023 at 11:57:47AM +0300, Pekka Paalanen wrote:
> >> On Wed, 25 Oct 2023 15:16:08 -0500 (CDT)
> >> Alex Goins <agoins@nvidia.com> wrote:
> >>
> >>> Thank you Harry and all other contributors for your work on this. Responses
> >>> inline -
> >>>
> >>> On Mon, 23 Oct 2023, Pekka Paalanen wrote:
> >>>
> >>>> On Fri, 20 Oct 2023 11:23:28 -0400
> >>>> Harry Wentland <harry.wentland@amd.com> wrote:
> >>>>   
> >>>>> On 2023-10-20 10:57, Pekka Paalanen wrote:  
> >>>>>> On Fri, 20 Oct 2023 16:22:56 +0200
> >>>>>> Sebastian Wick <sebastian.wick@redhat.com> wrote:
> >>>>>>     
> >>>>>>> Thanks for continuing to work on this!
> >>>>>>>
> >>>>>>> On Thu, Oct 19, 2023 at 05:21:22PM -0400, Harry Wentland wrote:    
> 
> snip
> 
> >>
> >>>>>> I think we also need a definition of "informational".
> >>>>>>
> >>>>>> Counter-example 1: a colorop that represents a non-configurable    
> >>>>>
> >>>>> Not sure what's "counter" for these examples?
> >>>>>   
> >>>>>> YUV<->RGB conversion. Maybe it determines its operation from FB pixel
> >>>>>> format. It cannot be set to bypass, it cannot be configured, and it
> >>>>>> will alter color values.  
> >>>
> >>> Would it be reasonable to expose this is a 3x4 matrix with a read-only blob and
> >>> no BYPASS property? I already brought up a similar idea at the XDC HDR Workshop
> >>> based on the principle that read-only blobs could be used to express some static
> >>> pipeline elements without the need to define a new type, but got mixed opinions.
> >>> I think this demonstrates the principle further, as clients could detect this
> >>> programmatically instead of having to special-case the informational element.
> >>
> > 
> > I'm all for exposing fixed color ops but I suspect that most of those
> > follow some standard and in those cases instead of exposing the matrix
> > values one should prefer to expose a named matrix (e.g. BT.601, BT.709,
> > BT.2020).
> > 
> 
> Agreed.
> 
> > As a general rule: always expose the highest level description. Going
> > from a name to exact values is trivial, going from values to a name is
> > much harder.
> > 
> >> If the blob depends on the pixel format (i.e. the driver automatically
> >> chooses a different blob per pixel format), then I think we would need
> >> to expose all the blobs and how they correspond to pixel formats.
> >> Otherwise ok, I guess.
> >>
> >> However, do we want or need to make a color pipeline or colorop
> >> conditional on pixel formats? For example, if you use a YUV 4:2:0 type
> >> of pixel format, then you must use this pipeline and not any other. Or
> >> floating-point type of pixel format. I did not anticipate this before,
> >> I assumed that all color pipelines and colorops are independent of the
> >> framebuffer pixel format. A specific colorop might have a property that
> >> needs to agree with the framebuffer pixel format, but I didn't expect
> >> further limitations.
> > 
> > We could simply fail commits when the pipeline and pixel format don't
> > work together. We'll probably need some kind of ingress no-op node
> > anyway and maybe could list pixel formats there if required to make it
> > easier to find a working configuration.
> > 
> 
> The problem with failing commits is that user-space has no idea why it
> failed. If this means that userspace falls back to SW composition for
> NV12 and P010 it would avoid HW offloading in one of the most important
> use-cases on AMD HW for power-saving purposes.

Exposing which pixel formats work with a pipeline should be
uncontroversial, and so should be an informative scaler op.

Both can be added without a problem at a later time, so let's not make
any of that mandatory for the first version. One step after the other.

> 
> snip
> 
> >>> Despite being programmable, the LUTs are updated in a manner that is less
> >>> efficient as compared to e.g. the non-static "degamma" LUT. Would it be helpful
> >>> if there was some way to tag operations according to their performance,
> >>> for example so that clients can prefer a high performance one when they
> >>> intend to do an animated transition? I recall from the XDC HDR workshop
> >>> that this is also an issue with AMD's 3DLUT, where updates can be too
> >>> slow to animate.
> >>
> >> I can certainly see such information being useful, but then we need to
> >> somehow quantize the performance.
> >>
> >> What I was left puzzled about after the XDC workshop is that is it
> >> possible to pre-load configurations in the background (slow), and then
> >> quickly switch between them? Hardware-wise I mean.
> > 
> > We could define that pipelines with a lower ID are to be preferred over
> > higher IDs.
> > 
> > The issue is that if programming a pipeline becomes too slow to be
> > useful it probably should just not be made available to user space.
> > 
> > The prepare-commit idea for blob properties would help to make the
> > pipelines usable again, but until then it's probably a good idea to just
> > not expose those pipelines.
> > 
> 
> It's a bit of a judgment call what's too slow, though. The value of having
> a HW colorop might outweigh the cost of the programming time for some
> compositors but not for others.
> 
> Harry
> 
> >>
> >>
> >> Thanks,
> >> pq
> > 
> > 
> 

