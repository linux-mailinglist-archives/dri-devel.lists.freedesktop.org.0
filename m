Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4778499D3F
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 23:41:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFEBD10E24B;
	Mon, 24 Jan 2022 22:41:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82B4910E24B
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 22:41:26 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id p15so25563322ejc.7
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 14:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=uXDJy29KRa4aADLFl/N15nh7M0VaTORTTf56QaN1/D8=;
 b=efqbMukuNMqUuks37174gIM5nhm8Gen4FtY57CdK2tEi3BfMZzBFRqgmzNeBtajT3i
 UZq7JOvZGrjgXK8khxabKMnqG4WwKYAL5FfmYg5D5IlXAexyxMaYdHuaAYUREX+N3TCU
 Opdh+/jMhD1bB9/57dSGaCBHcnH2ZUCSK+LbU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=uXDJy29KRa4aADLFl/N15nh7M0VaTORTTf56QaN1/D8=;
 b=A1R/+VbR7RNsxcTVN0zzzLIxOKgiW39ArZEpuRTYVwterQQ7rq1TEqE2oMcfDmyPjM
 9fLa/7kCOgKORT3DNoukWCtbm0kfHYTOlnGrm/sdj8jOEdt4SovtrzK5HWc0Ql8xR5bL
 Uy251n6GQChqIldw1bOzpgsrj8CQhyjpr78T0p7Fj4Q0IrPvgJxNEV+wSZWIv+TYcUKy
 SFWZp9iltk2AAms+FQ8PMGW+Ow0biOV38R9s9GteQa21EAZr2RASSAqYAiyYanXn89Af
 BO1l+vxspIYxZDuwVsMVSBcQytYQIV+T3EvndEIYmPX4KxwTM/oqMQEEQpdSQg6mUqps
 uPqg==
X-Gm-Message-State: AOAM533zhXQ18CXrq8jL5gMP9KEewKAAhtA4tE35WxlML3MfIoJvalOI
 kxAnTxwsR0YI2Y+bfcFHWn+z2A==
X-Google-Smtp-Source: ABdhPJwEBu82CanT1FE6tnzaZiKu217V/6ZzbRSjWilrwERD5ltPGeNXbEtdzOWx5lKLMTP+U507fQ==
X-Received: by 2002:a17:907:e8d:: with SMTP id
 ho13mr3105265ejc.169.1643064084993; 
 Mon, 24 Jan 2022 14:41:24 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z4sm5364919ejd.39.2022.01.24.14.41.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 14:41:24 -0800 (PST)
Date: Mon, 24 Jan 2022 23:41:22 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH v2 0/2] Fix regression introduced by disabling
 accelerated scrolling in fbcon
Message-ID: <Ye8rElg/lANVos2Q@phenom.ffwll.local>
Mail-Followup-To: Helge Deller <deller@gmx.de>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Pavel Machek <pavel@ucw.cz>, Sam Ravnborg <sam@ravnborg.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sven Schnelle <svens@stackframe.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Claudio Suarez <cssk@net-c.es>, Gerd Hoffmann <kraxel@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <20220124210319.325512-1-deller@gmx.de>
 <Ye8mDFcWSiXoRJbD@phenom.ffwll.local>
 <16884bfd-36ca-dd2e-43e4-4977861f8fa1@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <16884bfd-36ca-dd2e-43e4-4977861f8fa1@gmx.de>
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Claudio Suarez <cssk@net-c.es>,
 Gerd Hoffmann <kraxel@redhat.com>, Pavel Machek <pavel@ucw.cz>,
 Daniel Vetter <daniel.vetter@intel.com>, Sven Schnelle <svens@stackframe.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 24, 2022 at 11:37:03PM +0100, Helge Deller wrote:
> On 1/24/22 23:19, Daniel Vetter wrote:
> > On Mon, Jan 24, 2022 at 10:03:17PM +0100, Helge Deller wrote:
> >> This series reverts two patches which disabled scrolling acceleration in
> >> fbcon/fbdev. Those patches introduced a regression for fbdev-supported graphic
> >> cards because of the performance penalty by doing screen scrolling by software
> >> instead of using existing 2D hardware acceleration.
> >>
> >> This series has been discussed on linux-fbdev, dri-devel and linux-kernel
> >> mailing lists. The consensus is that they will be reverted, but in addition
> >> it's being worked on to find a solution which allows to disable parts of the
> >> classic fbdev hardware acceleration code which isn't needed in DRM-only
> >> configurations.
> >
> > That's not my take at least.
> 
> Which is?
> Didn't we discussed about introducing something like
> CONFIG_FBCON_LEGACY_ACCELERATION ?

Yeah, as part of the reverts. Or at least that's what I meant to say.
-Daniel
> 
> >> The patchset is planned to be kept in fbdev's for-next git branch and later
> >> pushed into kernel v5.18 if no issues are found until then.
> >
> > Neither this. I don't think we've resovled maintainership of fbdev core
> > code and fbcon yet. That is the part that drm folks very much still
> > maintained, as a quick git shortlog will show.
> >
> > Maintaining these parts outside of drm trees just doesn't make sense,
> > since none of the other graphics relevant development happens outside of
> 
> I have no objections if you are willing to take those two patches through
> the drm tree.
> 
> Helge
> 
> >> ---
> >> Changes in v2 compared to v1:
> >> - adjusted the stable tags (one v5.10+, the other v5.16+)
> >> - moved the analysis and reasoning why those should be reverted into
> >>   the commit message. That simplifies to analyze later why they were
> >>   reverted.
> >> - resorted the To an Cc mail recipient lists
> >>
> >> Helge Deller (2):
> >>   Revert "fbdev: Garbage collect fbdev scrolling acceleration, part 1
> >>     (from TODO list)"
> >>   Revert "fbcon: Disable accelerated scrolling"
> >>
> >>  Documentation/gpu/todo.rst              |  24 --
> >>  drivers/video/fbdev/core/bitblit.c      |  16 +
> >>  drivers/video/fbdev/core/fbcon.c        | 540 +++++++++++++++++++++++-
> >>  drivers/video/fbdev/core/fbcon.h        |  59 +++
> >>  drivers/video/fbdev/core/fbcon_ccw.c    |  28 +-
> >>  drivers/video/fbdev/core/fbcon_cw.c     |  28 +-
> >>  drivers/video/fbdev/core/fbcon_rotate.h |   9 +
> >>  drivers/video/fbdev/core/fbcon_ud.c     |  37 +-
> >>  drivers/video/fbdev/core/tileblit.c     |  16 +
> >>  drivers/video/fbdev/skeletonfb.c        |  12 +-
> >>  include/linux/fb.h                      |   2 +-
> >>  11 files changed, 703 insertions(+), 68 deletions(-)
> >>
> >> --
> >> 2.31.1

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
