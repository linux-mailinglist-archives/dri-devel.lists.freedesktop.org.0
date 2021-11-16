Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3DF7453621
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 16:43:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0631D88A56;
	Tue, 16 Nov 2021 15:43:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57DE988A56
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 15:43:05 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 az33-20020a05600c602100b00333472fef04so2338145wmb.5
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 07:43:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Sq+0ak02lzhJjbaWYko+uz1TZ4OoI8j/iENN7Yvfpsk=;
 b=K8OXCTNAFjSsjlKjgcqdc8alHWIDAhKgq6cLkfx2x/H3g3hLYUeANxziU12+227OWD
 NElOrZvgf+jHE1z3yrSYOX/y83AzvDNc8Xicgj+2V10NMUQEnwgdey5/LaSFmtmKOyTD
 U9O/I9by67OuWQibMhaS1H+gFbT4PrOJmeswQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Sq+0ak02lzhJjbaWYko+uz1TZ4OoI8j/iENN7Yvfpsk=;
 b=ITWwsN7x7v+Ky5UznFrk2swHEnW22eTGFje5Dz6bKGA0oVgmjmYby5kZiPkBvqNxku
 WF19wkoT9Rn2S3oTctK8jY0yXIn1Nvn5BbssNgyTuViAKTXLPRZ8ZLX0JGCkQ9CEnAaW
 RnjeWA/WPFk22W+9U3kTTMtJ5eQ1ZCaB+yJhSlfEjMOV4QaQWBybCMN7H5bjNrPqrDNY
 Zj4mXbbhPwdEFjpFOr+RYb5vYiEZ5ciut0dhlKSvUwKtzjwJbXTWZSpkrtMVv422RyA1
 tl+fSwQ17j+SnEcHEGZ9j8RE+1F8r19I07bVpSF2+JBMOCChGvWIq1HwRPx86dSJO3CX
 DASQ==
X-Gm-Message-State: AOAM531NRdqJkV74WYUVafUeNdmCHW8KXbCLoush5DUYKvMD5JyTsTRp
 5gg37xWT5qwZNP3EWUhd1cT0MA==
X-Google-Smtp-Source: ABdhPJxsdLbVvZFruoC5L8wm8vYIfH12KoEd+8T3tMF4yQEEqLAY+zwsS9YXWO98kUrgSR0xuXj1AA==
X-Received: by 2002:a1c:a984:: with SMTP id
 s126mr68213367wme.156.1637077383774; 
 Tue, 16 Nov 2021 07:43:03 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q8sm17480581wrx.71.2021.11.16.07.43.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 07:43:03 -0800 (PST)
Date: Tue, 16 Nov 2021 16:43:01 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Subject: Re: [PATCH v3 11/12] drm/virtio: implement context init: add
 virtio_gpu_fence_event
Message-ID: <YZPRhZDcU3/VYWgb@phenom.ffwll.local>
References: <20210921232024.817-1-gurchetansingh@chromium.org>
 <20210921232024.817-12-gurchetansingh@chromium.org>
 <YY/RBOdU6+SgbRrq@kroah.com> <YZJrutLaiwozLfSw@phenom.ffwll.local>
 <bc799da264c045fb9ad9ccad5dfba631@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bc799da264c045fb9ad9ccad5dfba631@intel.com>
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
Cc: "virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
 Greg KH <gregkh@linuxfoundation.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 "kraxel@redhat.com" <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 15, 2021 at 07:26:14PM +0000, Kasireddy, Vivek wrote:
> Hi Daniel, Greg,
> 
> If it is the same or a similar crash reported here:
> https://lists.freedesktop.org/archives/dri-devel/2021-November/330018.html
> and here: https://lists.freedesktop.org/archives/dri-devel/2021-November/330212.html
> then the fix is already merged:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d89c0c8322ecdc9a2ec84b959b6f766be082da76

Yeah but that still leaves the problem of why exaxtly virtgpu is
reinventing drm_poll here?

Can you please replace it with drm_poll like all other drivers, including
the ones that have private events?

Thanks, Daniel

> 
> Thanks,
> Vivek
> 
> > On Sat, Nov 13, 2021 at 03:51:48PM +0100, Greg KH wrote:
> > > On Tue, Sep 21, 2021 at 04:20:23PM -0700, Gurchetan Singh wrote:
> > > > Similar to DRM_VMW_EVENT_FENCE_SIGNALED.  Sends a pollable event
> > > > to the DRM file descriptor when a fence on a specific ring is
> > > > signaled.
> > > >
> > > > One difference is the event is not exposed via the UAPI -- this is
> > > > because host responses are on a shared memory buffer of type
> > > > BLOB_MEM_GUEST [this is the common way to receive responses with
> > > > virtgpu].  As such, there is no context specific read(..)
> > > > implementation either -- just a poll(..) implementation.
> > > >
> > > > Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
> > > > Acked-by: Nicholas Verne <nverne@chromium.org>
> > > > ---
> > > >  drivers/gpu/drm/virtio/virtgpu_drv.c   | 43 +++++++++++++++++++++++++-
> > > >  drivers/gpu/drm/virtio/virtgpu_drv.h   |  7 +++++
> > > >  drivers/gpu/drm/virtio/virtgpu_fence.c | 10 ++++++
> > > >  drivers/gpu/drm/virtio/virtgpu_ioctl.c | 34 ++++++++++++++++++++
> > > >  4 files changed, 93 insertions(+), 1 deletion(-)
> > >
> > > This commit seems to cause a crash in a virtual drm gpu driver for
> > > Android.  I have reverted this, and the next commit in the series from
> > > Linus's tree and all is good again.
> > >
> > > Any ideas?
> > 
> > Well no, but also this patch looks very questionable of hand-rolling
> > drm_poll. Yes you can do driver private events like
> > DRM_VMW_EVENT_FENCE_SIGNALED, that's fine. But you really should not need
> > to hand-roll the poll callback. vmwgfx (which generally is a very old
> > driver which has lots of custom stuff, so not a great example) doesn't do
> > that either.
> > 
> > So that part should go no matter what I think.
> > -Daniel
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
