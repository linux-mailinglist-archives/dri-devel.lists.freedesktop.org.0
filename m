Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5419450675
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 15:16:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85BC46ED95;
	Mon, 15 Nov 2021 14:16:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74CF96EDA1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 14:16:30 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id g14so72619364edz.2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 06:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=+8c+5RumMJZh9uHYMQvQRaSUS4TGeeRVSmd99F1Off0=;
 b=H1dBtVH2jr5R1uqDVlcA4U1+ZHem1iRDo1ZbltSCOo8s66am7cFr9+gG4dwNYLkho3
 1PDSZEfc3VUGoJOFXl4p/tSaGGuKIpc0aBsaxo0bBWt13oAgbHrEomFkIwla3P4VEkR3
 Es7P6+IcK7UOqwi1tLfq6j4EQEuCYfmrLeHKk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+8c+5RumMJZh9uHYMQvQRaSUS4TGeeRVSmd99F1Off0=;
 b=wKq3fdnXpBr5lxn+Z1LdAF7QY/0Mfw2rTUPDw2iDREIft363FaaO9b4yqdu2RNf0cC
 gyCmqQFtR84/23gjl6GnK9Scj17NoLO/FlunTuwNmi0PtNVxj0yEK6OoDXaZQh7R5PAk
 Ft1s1lDmSHd7+1iKp3qt6Bpp30Ffp0hGwDSC17PlmlEIc71heBTmZTXCufHrKxpukZI7
 ikdS15M+6ps05gOVlz1/KZaRx2HNf12xbH7X96xY4Nxx7Z6ssKwEy2F7h1TSsEQ9SZY0
 51U7YRjeQxtJm7OmBD/PCRUlFwKwCCz8gM+f8LVxty6uZbY3kSn0JXLN8x2ZCNFd93Iw
 awgQ==
X-Gm-Message-State: AOAM533jCJGsleoA7iFFsKGEeNjjVs5rISAYERmscJxGGmAlVh9LSEMI
 vaZIi6Eso8Fn6RQql8w/PDCQVQ==
X-Google-Smtp-Source: ABdhPJwHCBo9rynWkU38xuQRIJ005wpNYrS0PpE7WODlZiw7FJv8SaUPza6N/mTGv+G2kH0hyogT1g==
X-Received: by 2002:a17:907:9802:: with SMTP id
 ji2mr47207644ejc.352.1636985789027; 
 Mon, 15 Nov 2021 06:16:29 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id ig1sm6501265ejc.77.2021.11.15.06.16.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 06:16:28 -0800 (PST)
Date: Mon, 15 Nov 2021 15:16:26 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v3 11/12] drm/virtio: implement context init: add
 virtio_gpu_fence_event
Message-ID: <YZJrutLaiwozLfSw@phenom.ffwll.local>
References: <20210921232024.817-1-gurchetansingh@chromium.org>
 <20210921232024.817-12-gurchetansingh@chromium.org>
 <YY/RBOdU6+SgbRrq@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YY/RBOdU6+SgbRrq@kroah.com>
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
Cc: virtio-dev@lists.oasis-open.org, kraxel@redhat.com,
 dri-devel@lists.freedesktop.org, Gurchetan Singh <gurchetansingh@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Nov 13, 2021 at 03:51:48PM +0100, Greg KH wrote:
> On Tue, Sep 21, 2021 at 04:20:23PM -0700, Gurchetan Singh wrote:
> > Similar to DRM_VMW_EVENT_FENCE_SIGNALED.  Sends a pollable event
> > to the DRM file descriptor when a fence on a specific ring is
> > signaled.
> > 
> > One difference is the event is not exposed via the UAPI -- this is
> > because host responses are on a shared memory buffer of type
> > BLOB_MEM_GUEST [this is the common way to receive responses with
> > virtgpu].  As such, there is no context specific read(..)
> > implementation either -- just a poll(..) implementation.
> > 
> > Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
> > Acked-by: Nicholas Verne <nverne@chromium.org>
> > ---
> >  drivers/gpu/drm/virtio/virtgpu_drv.c   | 43 +++++++++++++++++++++++++-
> >  drivers/gpu/drm/virtio/virtgpu_drv.h   |  7 +++++
> >  drivers/gpu/drm/virtio/virtgpu_fence.c | 10 ++++++
> >  drivers/gpu/drm/virtio/virtgpu_ioctl.c | 34 ++++++++++++++++++++
> >  4 files changed, 93 insertions(+), 1 deletion(-)
> 
> This commit seems to cause a crash in a virtual drm gpu driver for
> Android.  I have reverted this, and the next commit in the series from
> Linus's tree and all is good again.
> 
> Any ideas?

Well no, but also this patch looks very questionable of hand-rolling
drm_poll. Yes you can do driver private events like
DRM_VMW_EVENT_FENCE_SIGNALED, that's fine. But you really should not need
to hand-roll the poll callback. vmwgfx (which generally is a very old
driver which has lots of custom stuff, so not a great example) doesn't do
that either.

So that part should go no matter what I think.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
