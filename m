Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CD055B067
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jun 2022 10:49:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38C7110F3B1;
	Sun, 26 Jun 2022 08:49:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF45810E8D9
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jun 2022 08:49:25 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id c13so9046257eds.10
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jun 2022 01:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=GNdchxRslazyj5SgOwFKdUehViH56RrEi3mJbYurW6k=;
 b=V++vrujWFfFurayWgFtPQXQi4iRTnmlF1pUXa1JKynRk2W22zd2T2d6ZYefTtjep6w
 w0B80maccWuW7EGNnZLf8gOCYJFQ9I2Ve9OhVxf3ZhVRGvb6Z7AsW//PMVO7MFc23BpX
 v7yI/TXTw9eVKFBDLrZ4nzPbcvpP2OeMYM+fk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GNdchxRslazyj5SgOwFKdUehViH56RrEi3mJbYurW6k=;
 b=sN8BPQfpQxVP4rlqf1YnBP6SFOxvGCnDoeluTD4GxqvLlcY00vvQOMjpjP2LHnAQ5s
 vOVXLYM91Xuut7vJNzInwxI6uKFRYTZWQ1K5QZe6pRtPyLmsOXqj75t7r7ppEdZV6EzD
 fbprU2P9Q8aQCVLSZRLVmdaJXHRajgUAVww25rapJ4PW5C+E1T9e1aizVZfYE8RXYp84
 qAsZ4SJqZLn2nc75ZPHi/e+S0DyWyruYxkQwlVRPX1AeLphZCxmQahoCWYPBdmEnWP+2
 mPkJxRFJ7peA/e7C8HSF2m+OFu8gR3tnPD7IVqLAH+lxdmoAbl533mycmmL3KcXqukj3
 KrRQ==
X-Gm-Message-State: AJIora9hQxlxECwhbeA1ZwNdr2iwiFR2UWutWkN3n8hmZGHbFPtrgnGH
 2ZLlZIzwilmInaTQ9S6J9R68zw==
X-Google-Smtp-Source: AGRyM1uW8dGNEUmEIE/IQi2CP0GV3oL6OLmpPM0j+lP6lahpDtZ3SpDU6V4zlM9APKzgFWAbZqi9jg==
X-Received: by 2002:aa7:c45a:0:b0:435:d7a4:99bc with SMTP id
 n26-20020aa7c45a000000b00435d7a499bcmr9565349edr.158.1656233364443; 
 Sun, 26 Jun 2022 01:49:24 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 o7-20020a170906860700b00722d5f07864sm3444932ejx.225.2022.06.26.01.49.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jun 2022 01:49:23 -0700 (PDT)
Date: Sun, 26 Jun 2022 10:49:21 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH v3 3/4] fbmem: Check screen resolution change against
 font size
Message-ID: <YrgdkWEvxrh5Wam9@phenom.ffwll.local>
References: <20220625220630.333705-1-deller@gmx.de>
 <20220625220630.333705-4-deller@gmx.de>
 <YreNUfv8d9QeJT8C@phenom.ffwll.local>
 <YreODaSXhAhipJKa@phenom.ffwll.local>
 <5e03d6c5-e254-f5f6-9e02-bc996d41718d@gmx.de>
 <92f2ca1e-20f7-c456-0cd2-609202e337a2@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <92f2ca1e-20f7-c456-0cd2-609202e337a2@gmx.de>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: daniel.vetter@ffwll.ch, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jun 26, 2022 at 01:56:18AM +0200, Helge Deller wrote:
> On 6/26/22 01:12, Helge Deller wrote:
> > On 6/26/22 00:37, Daniel Vetter wrote:
> >> On Sun, Jun 26, 2022 at 12:33:53AM +0200, Daniel Vetter wrote:
> >>> On Sun, Jun 26, 2022 at 12:06:29AM +0200, Helge Deller wrote:
> >>>> Enhance the check in the FBIOPUT_VSCREENINFO ioctl handler to verify if the
> >>>> user-provided new screen size is bigger than the current font size.
> >>>>
> >>>> Signed-off-by: Helge Deller <deller@gmx.de>
> >>>> Cc: stable@vger.kernel.org # v5.4+
> >>>
> >>> Please squash with previous patch. You might also want to add a note there
> >>> that on older kernels backporters need to open-code
> >>> fbcon_info_from_console instead, since it only exists since
> >>> 409d6c95f9c6 ("fbcon: Introduce wrapper for console->fb_info lookup")
> >>
> >> Maybe easier would be to include that patch in the backports instead of
> >> open coding.
> >
> > I was afraid that WARN_CONSOLE_UNLOCKED() hadn't been backported.
> > But it seems it's in v4.19+ (from patch 56e6c104e4f15), so that's ok.
> >
> > So, yes, it seems pushing 409d6c95f9c6 backwards is probably best.
> 
> It would be the best solution, but sadly 409d6c95f9c6 can't easily be backported.
> So, probably my other approach (fix up afterwards with extra patch) is
> the way to go.

Ah right there's some conflicts with the restoration/removal of scroll
accel.

> What's your thought on this ?

I guess just open code in a separate backport is simplest.
-Daniel

> 
> Helge
> 
> 
> 
> > Will try that approach now.
> >
> > Helge
> >
> >  I think that's what Greg generally prefers at least, less
> >> divergence between stable kernels.
> >> -Daniel
> >>
> >>>
> >>> With these two nits: Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> >>>
> >>>> ---
> >>>>  drivers/video/fbdev/core/fbmem.c | 4 +++-
> >>>>  1 file changed, 3 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
> >>>> index afa2863670f3..160389365a36 100644
> >>>> --- a/drivers/video/fbdev/core/fbmem.c
> >>>> +++ b/drivers/video/fbdev/core/fbmem.c
> >>>> @@ -1106,7 +1106,9 @@ static long do_fb_ioctl(struct fb_info *info, unsigned int cmd,
> >>>>  			return -EFAULT;
> >>>>  		console_lock();
> >>>>  		lock_fb_info(info);
> >>>> -		ret = fb_set_var(info, &var);
> >>>> +		ret = fbcon_modechange_possible(info, &var);
> >>>> +		if (!ret)
> >>>> +			ret = fb_set_var(info, &var);
> >>>>  		if (!ret)
> >>>>  			fbcon_update_vcs(info, var.activate & FB_ACTIVATE_ALL);
> >>>>  		unlock_fb_info(info);
> >>>> --
> >>>> 2.35.3
> >>>>
> >>>
> >>> --
> >>> Daniel Vetter
> >>> Software Engineer, Intel Corporation
> >>> http://blog.ffwll.ch
> >>
> >
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
