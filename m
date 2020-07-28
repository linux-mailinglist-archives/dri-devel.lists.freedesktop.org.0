Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD51231537
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 23:55:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 358696E0A5;
	Tue, 28 Jul 2020 21:55:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5C8A6E0A5
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 21:55:18 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id a14so19711648wra.5
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 14:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=1Z4LFmpGBH8VoUSg5h3v4QFcVv1VouJZ9d4ywj1fyZI=;
 b=fDFvzQadt8Ho81/WiYwbZc7yUdpmNj1rSdcAmvWu+bOpiytHDhX7SQqTWLOn0SbAS/
 A1GyODcoJ5zXMF67xseTb/sHkSq1jLRPAj1ZkdNAnaeibZmjMVsdLxZ8w86QH1IvkMZI
 H8d0lwY9yZUnGgL7JN56aM/ob/+6lMgi7Pczk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=1Z4LFmpGBH8VoUSg5h3v4QFcVv1VouJZ9d4ywj1fyZI=;
 b=YnxWowKWKW3mBNv1A+AllDbLgVBwKFQ4aoPLOajoP8Zdkk/OsDFdn0cAs2g+B39pOa
 cDhSRECDnlRxQR7UGO4dwQp5TxNbmQLTHKCySptsfgR8HXRB7crlVDO7k2HuzY6/6NC4
 7lZJgMS83FjZxozAyZ9WcmiVpksd2L6RZw6WOKgt8hhN94sW0aOHD6C7PflOoYEq//QX
 kI6wpN3J6K86v6ZAArkZOEJkidQv/RiAmynTjv8EiNo8A+iQkqQh7MU4WjTRM2SPi8M9
 3Z+EgYSjNltrFwsJLlF5OWm89aBipe9OC+j44JUPABgTNHdz41lvWEKw/aKWKH//GsDo
 cIpA==
X-Gm-Message-State: AOAM530ICVn3z/jtnkp+5u81dJqbU4z3qC8TaX3m6zSaQR0SRSZ3tJa9
 sc48CN82bUhDaHhScrTgCbzKiA==
X-Google-Smtp-Source: ABdhPJyXKCmmcKvyoF3AKxTFUYpWNFk2HjYm2Sf0mcvxSXQQG+hT4Lp7B61wON5bD6C0AitS/XG39g==
X-Received: by 2002:a5d:548f:: with SMTP id h15mr26977647wrv.331.1595973317554; 
 Tue, 28 Jul 2020 14:55:17 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 128sm303063wmz.43.2020.07.28.14.55.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2020 14:55:16 -0700 (PDT)
Date: Tue, 28 Jul 2020 23:55:15 +0200
From: daniel@ffwll.ch
To: 
Subject: Re: [PATCH] drm/vkms: add missing drm_crtc_vblank_put to the get/put
 pair on flush
Message-ID: <20200728215515.GG6419@phenom.ffwll.local>
Mail-Followup-To: Sidong Yang <realwakka@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 David Airlie <airlied@linux.ie>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 kernel-usp@googlegroups.com
References: <CAKMK7uHWCnJ+3YnP2FwVGH6cEDkmPnH9ALjY_1R51QVs0HPG0Q@mail.gmail.com>
 <20200725011737.GA2851@realwakka>
 <CAKMK7uEWPCzx+K=+nJsLT5HRBVJ+s8tqx30Ljkr4BCBDComyWQ@mail.gmail.com>
 <20200725174514.esh4gqek6oddizvh@smtp.gmail.com>
 <CAKMK7uEi0UFSwYTO7h6_YKN+UykOuVcmhMSG_ySy9uyo_7Pz-g@mail.gmail.com>
 <20200725184918.togb54bxuifrq77c@smtp.gmail.com>
 <CAJeY4oEr1mDASzdjfyeXqfqUmM6n1ULgnedM7dif6db6Qk-r2g@mail.gmail.com>
 <CAJeY4oHzL2q1yRDQweSK5CM5WdHrWqqPVhkNc5DPzP1ayJLw+A@mail.gmail.com>
 <CAKMK7uGQXXDhYGOwYdorKECgNW2Ydq=Mxu_Tm-GrOY8SHftB+g@mail.gmail.com>
 <20200728161634.GA6555@realwakka>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200728161634.GA6555@realwakka>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 David Airlie <airlied@linux.ie>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, kernel-usp@googlegroups.com,
 Melissa Wen <melissa.srw@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 28, 2020 at 04:16:34PM +0000, Sidong Yang wrote:
> On Sun, Jul 26, 2020 at 12:26:08PM +0200, Daniel Vetter wrote:
> > On Sat, Jul 25, 2020 at 9:29 PM Melissa Wen <melissa.srw@gmail.com> wrote:
> > >
> > > On Sat, Jul 25, 2020 at 4:19 PM Melissa Wen <melissa.srw@gmail.com> wrote:
> > > >
> > > > > No, this very first warning continues (only once) :(
> > > > > From here (drm_crtc_vblank_on):
> > > > >         if (atomic_read(&vblank->refcount) != 0 || drm_vblank_offdelay == 0)
> > > > >                 drm_WARN_ON(dev, drm_vblank_enable(dev, pipe));
> > > >
> > > > Sorry, not sure when this warning is triggered.
> > >
> > > Again, I just had to look at the trace:
> > > [   52.299388]  drm_get_last_vbltimestamp+0xaa/0xc0 [drm]
> > > [   52.299389]  drm_reset_vblank_timestamp+0x5b/0xd0 [drm]
> > > [   52.299389]  drm_crtc_vblank_on.cold+0x37/0x103 [drm]
> > > [   52.299390]  drm_atomic_helper_commit_modeset_enable
> > 
> > Yeah I think vkms can't generate a reasonable timestamp when the
> > hrtimer is off. I thought the warning comes from a different
> > callchain, but seems to be a general problem.
> > 
> > I guess in the vkms timestamp function we should check whether the
> > timer is running, and if it's not running, then we just grab the
> > current time and done.
> 
> I tried some test about this scenario that commit_tail calls in sequence disable 
> - enable - commit.
> In a first test. there was a warning and found out that it raised from 
> vkms_get_vblank_timestamp() the code checking vblank_hrtimer's expire time and 
> vblank_time. In first run, vblank_time and hrtimer's expire time was both zero.  
> because vblank wasn't happened yet. this warning wasn't happend since second run 
> that vblank time was set from first run. 
> 
> I don't know it's good way to solve the problem. Is there no problem in other 
> drm modules?

Generally real hw drivers always have working clocks, not like the fake
ones we have here :-) The idea behind the timestamp callback is that when
vblank interrupts aren't enabled, the timestamp will help us keep track of
how many vblanks have happened.

So I think (but might be wrong) correct fix for this issue would be to
check whether vblanks are enabled, and if not, simply pass back the
current system time. That's a lie, but much better than whatever value was
set last time around the hrtimer fired- e.g. similar problem can happen
later on when the vblank interrupt was off for a very long time.
-Daniel

> 
> -Sidong
> 
> > -Daniel
> > 
> > > >
> > > > >
> > > > > > But I'm still wondering why after step 3 we don't get -EINVAL from
> > > > > > vblank_get() - after vblank_off() vblank->enabled should be false
> > > > > > again, getting us back to the same state as after 1. Is that not
> > > > > > happening?
> > > > >
> > > > > Yes (sorry if it got confused), we got -EINVAL after setp 3:
> > > > >
> > > > > In step 3, at the end of the 2nd running, we have:
> > > > > atomic_disable
> > > > > --> vblank_off [!vblank->inmodeset + refcount going 0->1 + inmodeset=1]
> > > > > and then in next vblank_get: -EINVAL (!vblank->enabled + refcount ends 1)
> > > > > as in the first step.
> > > > >
> > > > > Melissa
> > > > >
> > > > > > -Daniel
> > > > > >
> > > > > > >
> > > > > > > > >
> > > > > > > > > Thanks
> > > > > > > > > -Sidong
> > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > > > > >             crtc->state->event = NULL;
> > > > > > > > > > > > >     }
> > > > > > > > > > > > >
> > > > > > > > > > > > > --
> > > > > > > > > > > > > 2.27.0
> > > > > > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > > > > --
> > > > > > > > > > > > Daniel Vetter
> > > > > > > > > > > > Software Engineer, Intel Corporation
> > > > > > > > > > > > http://blog.ffwll.ch
> > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > --
> > > > > > > > > > Daniel Vetter
> > > > > > > > > > Software Engineer, Intel Corporation
> > > > > > > > > > http://blog.ffwll.ch
> > > > > > > > > > _______________________________________________
> > > > > > > > > > dri-devel mailing list
> > > > > > > > > > dri-devel@lists.freedesktop.org
> > > > > > > > > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > > > > > > >
> > > > > > > >
> > > > > > > >
> > > > > > > > --
> > > > > > > > Daniel Vetter
> > > > > > > > Software Engineer, Intel Corporation
> > > > > > > > http://blog.ffwll.ch
> > > > > >
> > > > > >
> > > > > >
> > > > > > --
> > > > > > Daniel Vetter
> > > > > > Software Engineer, Intel Corporation
> > > > > > http://blog.ffwll.ch
> > 
> > 
> > 
> > -- 
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
