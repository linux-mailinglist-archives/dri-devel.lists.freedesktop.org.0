Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B3251436A
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 09:47:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2F8310FC66;
	Fri, 29 Apr 2022 07:47:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B5BA10FC66
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 07:47:36 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id g6so13890105ejw.1
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 00:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=VUCWa3lSIaNzDwHCn+z/F0FVFVoykexDHXhwFfLqcXs=;
 b=Hb9Qr18ymp5oDvIwpneOgr2tAoqL9sBJ7zKZgSyrpcbSV5mYNUK9omsjGB2BUHy+wF
 hvNETRF2PNhs7QD9/wvRRjDcTsr8N9DePY6cH8hHGqe1tUFA4SY2HS0R26d67pVic+WS
 nfGHe2KFkWF9WqSUjRo8/UlNwH/umWyfvVFqw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=VUCWa3lSIaNzDwHCn+z/F0FVFVoykexDHXhwFfLqcXs=;
 b=L5hzJCS2bxV9lr9nIpXF8NNU2R8QHcD1DLNS6SyA92YN6/p5H3VoiDo4TVzjEnz0rm
 JHIYuhRVVb2oxar752bDuRpBS5DlaYa1NW2CUhe5jrGfsrJ7coC33T3MwEUE/zKEp/be
 cK4X9HMmTrtDr9W97MTMIH0ZW7/rwhBbCUmur2Bq4i3+DUDFD9BOZBxNvF5ITxuxoo82
 5B9Yqf+QXC9/HWEw4MzMo4X3uzg6ID/qbZfyrbjesNTTLVeUQ+0GLte9HIhqpCUSmgjS
 iK0zmFnb0Pd7Y6NNXHkSTJRj/Aa9sf6jQQaGofVjTXgrZbVaHShgAulkBQBGl9v8vnSU
 Kocw==
X-Gm-Message-State: AOAM532J3sxNv0Q6Bnify8aJNPWnzQkiOJr7RRwv9Qwtsqg8W9nK0eK6
 EdtnoB7dvNoRvGAkyLa4tV7dkg==
X-Google-Smtp-Source: ABdhPJx0LzJCI67IHW7p4FMMHHkPQKC/N0VzjjyRtPZ0oOI21KH7mh9tFSrg8s64jQaUV9HW5qz+Kw==
X-Received: by 2002:a17:907:3f8f:b0:6f3:d4a0:e80c with SMTP id
 hr15-20020a1709073f8f00b006f3d4a0e80cmr8378065ejc.709.1651218453598; 
 Fri, 29 Apr 2022 00:47:33 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 hv6-20020a17090760c600b006f3ef214e34sm389502ejc.154.2022.04.29.00.47.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 00:47:32 -0700 (PDT)
Date: Fri, 29 Apr 2022 09:47:31 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v3 0/5] Fix some race conditions that exists between
 fbmem and sysfb
Message-ID: <YmuYE2t51lPIRT8p@phenom.ffwll.local>
Mail-Followup-To: Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Borislav Petkov <bp@suse.de>,
 Changcheng Deng <deng.changcheng@zte.com.cn>,
 Hans de Goede <hdegoede@redhat.com>, Helge Deller <deller@gmx.de>,
 Johan Hovold <johan@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Miaoqian Lin <linmq006@gmail.com>, Peter Jones <pjones@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Yizhuo Zhai <yzhai003@ucr.edu>,
 Zhen Lei <thunder.leizhen@huawei.com>, linux-doc@vger.kernel.org,
 linux-fbdev@vger.kernel.org
References: <20220420085303.100654-1-javierm@redhat.com>
 <535ebbe4-605c-daf5-1afb-f5225e4bb3a8@suse.de>
 <093d742f-4c87-2ff3-e9fe-153cd734f8e4@suse.de>
 <220929be-91c4-d19c-b04f-312c5f7e9e40@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <220929be-91c4-d19c-b04f-312c5f7e9e40@redhat.com>
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
Cc: Miaoqian Lin <linmq006@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 Zhen Lei <thunder.leizhen@huawei.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Changcheng Deng <deng.changcheng@zte.com.cn>, Yizhuo Zhai <yzhai003@ucr.edu>,
 Hans de Goede <hdegoede@redhat.com>, linux-fbdev@vger.kernel.org,
 Peter Jones <pjones@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>, Johan Hovold <johan@kernel.org>,
 Borislav Petkov <bp@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 25, 2022 at 11:49:13AM +0200, Javier Martinez Canillas wrote:
> Hello Thomas,
> 
> Thanks for the feedback. It was very useful.
> 
> On 4/25/22 11:15, Thomas Zimmermann wrote:
> > Hi
> > 
> > Am 25.04.22 um 10:54 schrieb Thomas Zimmermann:
> >> Hi
> >>
> >> Am 20.04.22 um 10:52 schrieb Javier Martinez Canillas:
> >>> Hello,
> >>>
> >>> The patches in this series are mostly changes suggested by Daniel Vetter
> >>> to fix some race conditions that exists between the fbdev core (fbmem)
> >>> and sysfb with regard to device registration and removal.
> >>>
> >>> For example, it is currently possible for sysfb to register a platform
> >>> device after a real DRM driver was registered and requested to remove the
> >>> conflicting framebuffers.
> >>>
> >>> A symptom of this issue, was worked around with by commit fb561bf9abde
> >>> ("fbdev: Prevent probing generic drivers if a FB is already registered")
> >>> but that's really a hack and should be reverted.
> >>
> >> As I mentioned on IRC, I think this series should be merged for the 
> >> reasons I give in the other comments.
> >>
> 
> You meant that should *not* get merged, as we discussed over IRC.
> 
> >>>
> >>> This series attempt to fix it more properly and revert the mentioned 
> >>> hack.
> >>> That will also unblock a pending patch to not make the num_registered_fb
> >>> variable visible to drivers anymore, since that's internal to fbdev core.
> >>
> >> Here's as far as I understand the problem:
> >>
> >>   1) build DRM/fbdev and sysfb code into the kernel
> >>   2) during boot, load the DRM/fbdev modules and have them acquire I/O 
> >> ranges
> >>   3) afterwards load sysfb and have it register platform devices for the 
> >> generic framebuffers
> >>   4) these devices now conflict with the already-registered DRM/fbdev 
> >> devices
> >>
> 
> That's correct, yes.
> 
> >> If that is the problem here, let's simply set a sysfb_disable flag in 
> >> sysfb code when the first DRM/fbdev driver first loads. With the flag 
> >> set, sysfb won't create any platform devices. We assume that there are 
> >> now DRM/fbdev drivers for the framebuffers and sysfb won't be needed.
> >>
> >> We can set the flag internally from drm_aperture_detach_drivers() [1] 
> >> and do_remove_conflicting_framebuffers() [2].
> > 
> > And further thinking about it, it would be better to set such a flag 
> > after successfully registering a DRM/fbdev device.  So we know that 
> > there's at least one working display in the system. We don't have to 
> > rely on generic framebuffers after that.
> >
> 
> Exactly, should be done when the device is registered rather than when
> the driver is registered or a call is made to remove the conflicting FB.
> 
> I'll rework this series with only the bits for sysfb_disable() and drop
> the rest. We can go back to the discussion of the remaining parts later
> if that makes sense (I still think that patch 3/5 is a better approach,
> but let's defer that for a different series).

We need to kill sysfb _before_ the driver loads, otherwise you can have
two drivers fighting over each another. And yes that means you might end
up with black screen if the driver load goes wrong, but the two drivers
fighting over each another can also result in black screens. And the
latter isn't fixable any other way (in general at least) than by making
sure the fw stuff is gone before driver load starts in earnest.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
