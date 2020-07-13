Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC0A21DB35
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jul 2020 18:06:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5FC86E235;
	Mon, 13 Jul 2020 16:06:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED9FE6E235
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jul 2020 16:06:25 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id b6so17122645wrs.11
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jul 2020 09:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=5Rz3k8xfkL0FMNwHmJJTUxCZdJf58RRiYrG6rM5Yiek=;
 b=KKAGfH6p/LWgpuJCAIOkZHA1vspGCZMrnWxjJJTuab88ZnDyZ7m/uIL23A+/Nt00Gx
 +hb5xlS1YNrLtW+xyjepv+tuG7AWfEWDgCXbnfwFxtEicywKoJZVO5m5gT3niJMoRLmC
 p01iK/cfScpMyBckAqE8UovUlvP+6hTLXVrNk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=5Rz3k8xfkL0FMNwHmJJTUxCZdJf58RRiYrG6rM5Yiek=;
 b=NoDQLNXOOanVZCFDZGAwue9zWB5kEMPTq1VQSVa1e/46tt1nAB11zIhNLoIjaVd1iz
 m+yraQwdVrQe/vuksiR2A2YMIoLz/p2XDe3kIQULYSKn4iLAEqpIshiAjfO3BYLuivwJ
 0GmUBRTDi/8nwTFXRZ/gX5RQTk5ntROacm234nUQJsBSJ3pBm497BIdy0t1uicDRNOvt
 IbYjEO9lVzo6syX0F4KL4Qj1dW586lTWNeggn1+uqvKX1cQnMdE9EC9n9tps+CuINx0P
 9FOPndDMumhebsvKNwJWg/Hrp7SE3YWzf66Aq9jJ/EEu4yu4BwmJuA17cVVi38VQpT7g
 xIuA==
X-Gm-Message-State: AOAM532hBF1akxqG1SJKrpX4ZmZF57bh+CJMyzAa4wF6gfyida3J/ei6
 svWcuae2uF80+rB5KNCXN6Kc8w==
X-Google-Smtp-Source: ABdhPJzUPIXjT4HRFL9Ye+YC11COAKOTD5o0UW7SkSLGgcRUoA8itDDxp9cysn17q2KFM2dgvtZ2lQ==
X-Received: by 2002:adf:ed4f:: with SMTP id u15mr55226wro.318.1594656384637;
 Mon, 13 Jul 2020 09:06:24 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id x1sm23724641wrp.10.2020.07.13.09.06.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 09:06:23 -0700 (PDT)
Date: Mon, 13 Jul 2020 18:06:21 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Melissa Wen <melissa.srw@gmail.com>
Subject: Re: [PATCH] drm/vkms: add wait_for_vblanks in atomic_commit_tail
Message-ID: <20200713160621.GQ3278063@phenom.ffwll.local>
Mail-Followup-To: Melissa Wen <melissa.srw@gmail.com>,
 Sidong Yang <realwakka@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 David Airlie <airlied@linux.ie>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20200701153134.4187-1-realwakka@gmail.com>
 <20200702131355.GX3278063@phenom.ffwll.local>
 <20200710170533.xn2ar2cpekom6i2n@smtp.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200710170533.xn2ar2cpekom6i2n@smtp.gmail.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 David Airlie <airlied@linux.ie>, Emil Velikov <emil.l.velikov@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sidong Yang <realwakka@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 10, 2020 at 02:05:33PM -0300, Melissa Wen wrote:
> On 07/02, Daniel Vetter wrote:
> > On Wed, Jul 01, 2020 at 03:31:34PM +0000, Sidong Yang wrote:
> > > there is an error when igt test is run continuously. vkms_atomic_commit_tail()
> > > need to call drm_atomic_helper_wait_for_vblanks() for give up ownership of
> > > vblank events. without this code, next atomic commit will not enable vblank
> > > and raise timeout error.
> > > 
> > > Signed-off-by: Sidong Yang <realwakka@gmail.com>
> > > ---
> > >  drivers/gpu/drm/vkms/vkms_drv.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> > > index 1e8b2169d834..10b9be67a068 100644
> > > --- a/drivers/gpu/drm/vkms/vkms_drv.c
> > > +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> > > @@ -93,6 +93,8 @@ static void vkms_atomic_commit_tail(struct drm_atomic_state *old_state)
> > >  		flush_work(&vkms_state->composer_work);
> > >  	}
> > >  
> > > +	drm_atomic_helper_wait_for_vblanks(dev, old_state);
> > 
> > Uh, we have a wait_for_flip_done right above, which should be doing
> > exactly the same, but more precisely: Instead of just waiting for any
> > vblank to happen, we wait for exactly the vblank corresponding to this
> > atomic commit. So no races possible. If this is papering over some issue,
> > then I think more debugging is needed.
> > 
> > What exactly is going wrong here for you?
> 
> Hi Daniel and Sidong,
> 
> I noticed a similar issue when running the IGT test kms_cursor_crc. For
> example, a subtest that passes on the first run (alpha-opaque) fails on
> the second due to a kind of busy waiting in subtest preparation (the
> subtest fails before actually running).
> 
> In addition, in the same test, the dpms subtest started to fail since
> the commit that change from wait_for_vblanks to wait_for_flip_done. By
> reverting this commit, the dpms subtest passes again and the sequential
> subtests return to normal.
> 
> I am trying to figure out what's missing from using flip_done op on
> vkms, since I am also interested in solving this problem and I
> understand that the change for flip_done has been discussed in the past.
> 
> Do you have any idea?

Uh, not at all. This is indeed rather surprising ...

What exactly is the failure mode when running a test the 2nd time? Full
igt logs might give me an idea. But yeah this is kinda surprising.

Also happy to chat on irc for debugging ideas, that might be faster (I'm
danvet on #dri-devel on freenode).
-Daniel

> 
> Melissa
> 
> > -Daniel
> > 
> > > +
> > >  	drm_atomic_helper_cleanup_planes(dev, old_state);
> > >  }
> > >  
> > > -- 
> > > 2.17.1
> > > 
> > 
> > -- 
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
