Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C0443E4F6
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 17:21:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AAF46E993;
	Thu, 28 Oct 2021 15:21:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 970396E993
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 15:21:41 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id o14so10803766wra.12
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 08:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=tA0VzRqtEp9p/s3l1/NkFeuNIBw4q8Z4uqqRJVrGR9s=;
 b=G6mTplY3fRPAAjgbHNe+uj+5NSNgEBrZf0xsZXtvItIbf5Zoz92no4fw4S+jxjrNBq
 D2f43wkRSC9E/OgcnLCmq/9ZYRgYDz3/YCkS1EQJXI7LTChuVofERjpO39pUcsOgrnVa
 c9VqwkBZpkpP5aOxO7pm2qmX4iw37vaxdOSBg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tA0VzRqtEp9p/s3l1/NkFeuNIBw4q8Z4uqqRJVrGR9s=;
 b=wg9Ozkz983ZWnPRAH/hZJyM7Y0Un7eQyDgDgrqTk7TPEbqfP2wr7U8hrF3WCL9+TPW
 kdsd4i1TrAWVBOY7VJIO7cyFai3CEzjMcS0A+tl3XGmJs7G9gh5pxRpi6y+LnebXwkAK
 /MM2UBWmxNsmsQCeF3lPwuJV62ghAv4oO0P5Woxq1lSGwdh3KAR2FsZWbb5r/f8PYrA7
 aeXeRwipX+OXpVQe2/AyNKOrcDkluuDJ5y7S0owBms507Ja0WNVctxu9R5rTx6bxwKul
 dGd4ltr9p5jcqyre1N/A0I2zmDoQHKQWW+i+Mofev6Dfi/qrLlDPtr83VgnF1MV5E4bc
 wlsw==
X-Gm-Message-State: AOAM533s0UX5W4hE7/Ygda48ZgYDrJ/Y/0sXsO+Upk5EKo0JvBCs2Nsn
 F0wF2JmCI4AT1e2KlvdYRwxCxw==
X-Google-Smtp-Source: ABdhPJxaHXjKmsR7ic1mMPKR033CCC7sjGjMAhMqFUy0ef7+PJHRM8cFCcA5/Wy4oBui2AG1sm9MdA==
X-Received: by 2002:a5d:6c65:: with SMTP id r5mr6668671wrz.26.1635434500139;
 Thu, 28 Oct 2021 08:21:40 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y12sm1578449wrn.73.2021.10.28.08.21.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 08:21:39 -0700 (PDT)
Date: Thu, 28 Oct 2021 17:21:37 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Daniel Vetter <daniel@ffwll.ch>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 dri-devel@lists.freedesktop.org, kaleshsingh@google.com
Subject: Re: [RFC PATCH 1/8] tracing/gpu: modify gpu_mem_total
Message-ID: <YXrAAZlxxStNFG/K@phenom.ffwll.local>
References: <20211021031027.537-1-gurchetansingh@chromium.org>
 <20211021031027.537-2-gurchetansingh@chromium.org>
 <YXFVdkeGHvOoTpZ0@phenom.ffwll.local>
 <20211021090715.2318259d@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211021090715.2318259d@gandalf.local.home>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 21, 2021 at 09:07:15AM -0400, Steven Rostedt wrote:
> On Thu, 21 Oct 2021 13:56:38 +0200
> Daniel Vetter <daniel@ffwll.ch> wrote:
> 
> > Yay, that patch is just impressive. Lands a new gpu tracepoints, never
> > even showed up on the gpu subsystem discussion list.
> 
> I'm guessing there was some confusion. When this was first introduced, I
> stated it needs to go into the gpu tree, which a new set of patches included
> more Cc's. I never checked if those Cc's were for the GPU maintainers or not
> (I assumed they were).
> 
>  https://lore.kernel.org/all/20200224113805.134f8b95@gandalf.local.home/
> 
> I'm not sure where Yiwei Zhang got his email list for the GPU maintainers
> from. As he obviously thought it was going to them.
> 
>  https://lore.kernel.org/all/CAKT=dDnFpj2hJd5z73pfcrhXXacDpPVyKzC7+K94tsX=+e_BHg@mail.gmail.com/
> 
> Seeing that this patch set is going through dri-devel list, which I'm
> guessing is also for GPU, even though it's not under that in the
> MAINTAINERS file:
> 
> DRM DRIVERS AND MISC GPU PATCHES
> M:      Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> M:      Maxime Ripard <mripard@kernel.org>
> M:      Thomas Zimmermann <tzimmermann@suse.de>
> S:      Maintained
> W:      https://01.org/linuxgraphics/gfx-docs/maintainer-tools/drm-misc.html
> T:      git git://anongit.freedesktop.org/drm/drm-misc
> F:      Documentation/gpu/
> F:      drivers/gpu/drm/*
> F:      drivers/gpu/vga/
> F:      include/drm/drm*
> F:      include/linux/vga*
> F:      include/uapi/drm/drm*
> 
> Should the list be added there?
> 
> I've been struggling with this patch set because nobody claimed ownership
> for it. But now I believe we have one (you? :-)  And I can now just comment
> on the tracing POV and leave the content and usability to you folks ;-)

Hm we indeed don't have an entry for drivers/gpu, but there is one for
gpu/drm overall:

DRM DRIVERS
M:	David Airlie <airlied@linux.ie>
M:	Daniel Vetter <daniel@ffwll.ch>
L:	dri-devel@lists.freedesktop.org
S:	Maintained
B:	https://gitlab.freedesktop.org/drm
C:	irc://irc.oftc.net/dri-devel
T:	git git://anongit.freedesktop.org/drm/drm
F:	Documentation/devicetree/bindings/display/
F:	Documentation/devicetree/bindings/gpu/
F:	Documentation/gpu/
F:	drivers/gpu/drm/
F:	drivers/gpu/vga/
F:	include/drm/
F:	include/linux/vga*
F:	include/uapi/drm/

I'll do a patch to include drivers/gpu here, not sure why that's
different.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
