Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D21845DD7D
	for <lists+dri-devel@lfdr.de>; Thu, 25 Nov 2021 16:30:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 486296E86B;
	Thu, 25 Nov 2021 15:30:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DB8A6E86B
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Nov 2021 15:30:31 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id o29so5919232wms.2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Nov 2021 07:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=mT5CztXXGEVtVu2lf/CwV1g7OPVgRExJfPGlfmMywm0=;
 b=PEQF6bMcJoShAAAQZkOF5BkWuiwr/n8dHKen+aLofuFtfwvoi1JRGleq7frRxwDwPz
 dnnd09H6YI8fqa/4VFmNOCorgx79h5Kb8CTaEQBFTgi9u06DecieiPFcyxaALI3u/tie
 nIGrxVpEgmrjxTTqEkl42sXE71D31J1/kYVeo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=mT5CztXXGEVtVu2lf/CwV1g7OPVgRExJfPGlfmMywm0=;
 b=3cuNcRUG8PzQ+50U4e+zXZBAFQ9J5YVVWT3cESWu6+qeDJvpl/o3EiEr2a6XIu1ekz
 9TgkFTth7kU4qeEpQ1tx0kjxaXAg7aQ0bfbeYZc6GP9Deb/ALD985b33MmhRwstmjJXE
 cJ2hbQgQWSgCJ2N/F9X0IMFaWukq73lNUovm/CE3AcJ4e+VlHL2wwkq16aEoYTTJy/FI
 6VOf3Pz34aF/RTbiTmYzD2dIG7a/WtcWCjJQTSvva3rk41J4xQ7mN7wgufCXJ/CqH80O
 T+zKbmt9yZjLBjEfZcYoz92wPM2lpI2HQcrkAJCzvA3oocG1gej7AOIYbPMz2WXxT+Ze
 qrSA==
X-Gm-Message-State: AOAM530HoGXjszCce3IBmhiR8VSWFkFe2Ltr8E6DS1+hIxTIr4pes/Mv
 LBaguCwElt2jxEFMtTk3E2cwP5A3CdG5tw==
X-Google-Smtp-Source: ABdhPJxhA/VhsuDIAS0OWxUiI3i8TAhLLHvv9SkU+3wJwc/Kf9vwByE1Bdg0iWstOjaQzCy5lMbUTQ==
X-Received: by 2002:a1c:6a0e:: with SMTP id f14mr8313877wmc.58.1637854229881; 
 Thu, 25 Nov 2021 07:30:29 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p27sm3220547wmi.28.2021.11.25.07.30.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 07:30:29 -0800 (PST)
Date: Thu, 25 Nov 2021 16:30:27 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH v2 1/2] drm/input_helper: Add new input-handling helper
Message-ID: <YZ+sEw2ya80bYYaC@phenom.ffwll.local>
Mail-Followup-To: Pekka Paalanen <ppaalanen@gmail.com>,
 Simon Ser <contact@emersion.fr>, Rob Clark <robdclark@chromium.org>,
 Brian Norris <briannorris@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 David Airlie <airlied@linux.ie>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Doug Anderson <dianders@chromium.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 linux-input@vger.kernel.org
References: <20211117224841.3442482-1-briannorris@chromium.org>
 <20211117144807.v2.1.I09b516eff75ead160a6582dd557e7e7e900c9e8e@changeid>
 <20211118123928.545dec8a@eldfell>
 <CAF6AEGuc9JbOsC4Lrvoqo8VzMHq+7ru7Y6_UwoZaGV2wHQ6E5g@mail.gmail.com>
 <20211119115419.505155b5@eldfell>
 <YZfIgd8s7uGXAD2X@phenom.ffwll.local>
 <98236dpcx39iOz8xAYrwGLfiLdwgUlljrbBgHL3wd8A0Wz4KzRk3PR8s_tb5Rxu4eScKI4483kB6Vhv-T64CJYOeQqwXlqo2c-64HvoS5cg=@emersion.fr>
 <YZfMm3GkFereYPTZ@phenom.ffwll.local>
 <20211122114342.0d23890f@eldfell>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211122114342.0d23890f@eldfell>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Brian Norris <briannorris@chromium.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Doug Anderson <dianders@chromium.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-input@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 22, 2021 at 11:43:42AM +0200, Pekka Paalanen wrote:
> On Fri, 19 Nov 2021 17:11:07 +0100
> Daniel Vetter <daniel@ffwll.ch> wrote:
> 
> > On Fri, Nov 19, 2021 at 04:04:28PM +0000, Simon Ser wrote:
> > > On Friday, November 19th, 2021 at 16:53, Daniel Vetter <daniel@ffwll.ch> wrote:
> > >   
> > > > Random idea ... should we perhaps let userspace connect the boosting? I.e.
> > > > we do a bunch of standardized boost targets (render clocks, display sr
> > > > exit), and userspace can then connect it to whichever input device it
> > > > wants to?  
> > > 
> > > On IRC we discussed having user-space hand over a FD to the kernel. When the FD
> > > becomes readable, the kernel triggers the boost.
> > > 
> > > This would let user-space use e.g. an input device, an eventfd, or an epoll FD
> > > with any combination of these as the boost signal.  
> > 
> > Can userspace filter eventfd appropriately like we do here? And can they
> > get at that maybe 2nd eventfd from logind or whatever there is on distros
> > where /dev access is locked down for compositors/users.
> 
> (Mind, eventfd is a specific thing, see 'man eventfd', and evdev/input
> device fd is different.)

Yeah I was a bit sloppy, but I knew.

> I don't think any of that is any problem when userspace prepares an
> epoll fd to be given to the boosting machinery. The boosting machinery
> could have several different targets as well, PSR vs. GPU clocks and
> whatnot.
> 
> I envision a compositor to maintain an epoll fd for boosting by
> adding/removing the same device fds to it that it already uses in its
> operations. I don't see any need to open new device fds just for
> boosting. It's only the epoll fd given to the kernel and after that the
> epoll set can still be changed, right?
> 
> The boosting machinery would never actually read or write the
> registered fd(s), so it would not interfere with the normal operations.
> But it also means the fd will remain readable until userspace services
> it. Userspace may need to set up that epoll set very carefully to have
> it work right (e.g. edge-triggered?).
> 
> If your input handling is in a different process than the DRM poking
> for some reason, the epoll fd should still work if:
> - it is possible to use SCM_RIGHTS to pass the epollfd from the
>   input process to the DRM process, and
> - you cannot extract the watched fds from an epoll fd.
> 
> Do we have those assumptions today?
> 
> Then the attack surface in the DRM process is limited to changing the
> epoll set of which fds can trigger boosting, but the DRM process can do
> that anyway. I also presume the input process can still add and remove
> fds from the epoll set even afterwards.
> 
> > I do agree that if we can do this generically maybe we should, but also
> > the use-case for input boosting is pretty well defined. I think it's just
> > about making sure that compositors is in control, and that we don't make
> > it worse (e.g. with the sr exit adding latency when the compositor can
> > redraw quickly enough).
> 
> The epollfd design sounds very good to me. One can register an
> arbitrary set of fds with it, and use even eventfds in the set to have
> purely software triggers.

Yeah I think just allowing to internall poll on any arbitrary fd sounds
like a neat interface. Userspace should then be able to do whatever it
wants to.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
