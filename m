Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A861E3BE6
	for <lists+dri-devel@lfdr.de>; Wed, 27 May 2020 10:27:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DA7F89AC2;
	Wed, 27 May 2020 08:27:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE34189AC2
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 08:27:35 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id t18so9045130wru.6
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 01:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=qZLnnmxMCCmwL7xIybwRjM600e5O3NzctQqOewNe4/c=;
 b=S8o6jE/DamT3lFrYjdPyg/weDEv18qr1g9QtUTiiIYJ9c9Y73QUO54o45klU5LQDTU
 e1dEDjV8YZG/BRkpMTYXJKBGcHnrmL0B4ceN1G5DX7Q+sCDqP9U27gUu9r8PdzAZou9N
 vJmTpLOiBOv3oHuyS7CiNJ5Jx+72rRkih22vo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qZLnnmxMCCmwL7xIybwRjM600e5O3NzctQqOewNe4/c=;
 b=E4T+BDVwYHCBcKHN/pkmbXGVjBqeui143Ff1hopDmvAn5BPT2FfDVYKBQOyDVQofWP
 PKpf4a813CTwMOA4Pg54NBjzdpHOA8ZUiBGxnuDNHIdgN0qsleD/pdA/Mim3qhb5GSLs
 RCLER/J7syRi2FA61KOt3MvoVrsruEkwjlMhj6wZo3LqJAG/PQTCvQ1Fi88BlkIIZP5G
 dv7ciDA5EkXvcokldqDNKovsbSyzoktA3ifZr8UPLXETZMK5LLJV7Tcd3YO3hs7YKCWX
 fVL055sImRq0u9vMGGJjZONYLbs3dlV5siZPlzAVCQFfarXBrl/AvTp5x93UCMLH9ALA
 HQdA==
X-Gm-Message-State: AOAM531cFmdgp5D7inylH+xB4ccPFyiIsntCVk/SCjP9RAtRwYqE+xDA
 VusvtVbSPEJ2FuupAiEaiomDJw==
X-Google-Smtp-Source: ABdhPJyZFMN+EN0+40DDiKhdVTVUog1S7hAzt1ap3xVmywVhtFfb6bZOGZ8d+fyzcUUZvTgd51QJ5w==
X-Received: by 2002:adf:e58c:: with SMTP id l12mr21222909wrm.34.1590568054360; 
 Wed, 27 May 2020 01:27:34 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 1sm2175007wmz.13.2020.05.27.01.27.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2020 01:27:33 -0700 (PDT)
Date: Wed, 27 May 2020 10:27:31 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Subject: Re: [PATCH] drm/vkms: Don't warn hrtimer_forward_now failure.
Message-ID: <20200527082731.GM206103@phenom.ffwll.local>
References: <20200525143849.4964-1-penguin-kernel@I-love.SAKURA.ne.jp>
 <20200525152119.GL206103@phenom.ffwll.local>
 <b3715721-4982-83d9-dd6f-2a87e3b02a40@i-love.sakura.ne.jp>
 <CAKMK7uE9p_qDFL9XAqfHQPitTB+-+ZVAmCor-tbvheYjx4e-ZA@mail.gmail.com>
 <579a707b-8bfd-66d1-a1c5-f7883e82969e@i-love.sakura.ne.jp>
 <eeec9373-207c-67f4-8355-edcf5643b800@i-love.sakura.ne.jp>
 <CAKMK7uFZGMuyAehjezQSaUaddn-fmqqiFR6WNX5r4Lir7TfCig@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uFZGMuyAehjezQSaUaddn-fmqqiFR6WNX5r4Lir7TfCig@mail.gmail.com>
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
Cc: Shayenne Moura <shayenneluzmoura@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 DRI <dri-devel@lists.freedesktop.org>,
 syzbot+0871b14ca2e2fb64f6e3@syzkaller.appspotmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 26, 2020 at 01:11:28PM +0200, Daniel Vetter wrote:
> On Tue, May 26, 2020 at 6:39 AM Tetsuo Handa
> <penguin-kernel@i-love.sakura.ne.jp> wrote:
> >
> > On 2020/05/26 13:18, Tetsuo Handa wrote:
> > > due to mode->crtc_clock <= 0. Thus, somehow initializing mode->crtc_clock > 0 might be able
> > > to solve this problem.
> >
> > Well, I came to think that vkms_enable_vblank() should return an error to the caller
> > when drm_calc_timestamping_constants() failed...
> 
> If my memory is right we shouldn't even get there. crtc->mode being
> all zeros sounds like the simulated output isn't on (no surprise,
> syzbot doesn't enable it and fbcon is probably on card0), so something
> higher up should reject this. I'll see whether I can figure out what
> vkms isn't doing right (or whether there's a higher level bug in
> drm_vblank.c code), yesterday my machine died and already evening
> anyway.
> 
> Thanks for digging into this a bit more meanwhile.

Ok good news, I think I have a fix. Bad news it's code used by like 50
drivers, so this will take some time to get reviewed and merged (and I
think almost all these other drivers are buggy too, which is why I decided
to fix the shared code).

Patch below, can you pls confirm this fixes it?

Thanks, Daniel

commit b882894ac0fce412b67db79a5c92f2b599ec5069
Author: Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Tue May 26 14:29:00 2020 +0200

    drm/atomic-helper: reset vblank on crtc reset
    
    Only when vblanks are supported ofc.
    
    Some drivers do this already, but most unfortunately missed it. This
    opens up bugs after driver load, before the crtc is enabled for the
    first time. syzbot spotted this when loading vkms as a secondary
    output. Given how many drivers are buggy it's best to solve this once
    and for all in shared helper code.
    
    Aside from moving the few existing calls to drm_crtc_vblank_reset into
    helpers (i915 doesn't use helpers, so keeps its own) I think the
    regression risk is minimal: atomic helpers already rely on drivers
    calling drm_crtc_vblank_on/off correctly in their hooks when they
    support vblanks. And driver that's failing to handle vblanks after
    this is missing those calls already, and vblanks could only work by
    accident when enabling a CRTC for the first time right after boot.
    
    FIXME: Fix up drivers and audit them all.
    
    Big thanks to Tetsuo for helping track down what's going wrong here.
    
    Link: https://syzkaller.appspot.com/bug?id=0ba17d70d062b2595e1f061231474800f076c7cb
    Reported-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
    Reported-by: syzbot+0871b14ca2e2fb64f6e3@syzkaller.appspotmail.com
    Cc: stable@vger.kernel.org
    Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
    Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 8fce6a115dfe..843964252239 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -32,6 +32,7 @@
 #include <drm/drm_device.h>
 #include <drm/drm_plane.h>
 #include <drm/drm_print.h>
+#include <drm/drm_vblank.h>
 #include <drm/drm_writeback.h>
 
 #include <linux/slab.h>
@@ -93,6 +94,9 @@ __drm_atomic_helper_crtc_reset(struct drm_crtc *crtc,
 	if (crtc_state)
 		__drm_atomic_helper_crtc_state_reset(crtc_state, crtc);
 
+	if (crtc->dev->num_crtcs)
+		drm_crtc_vblank_reset(crtc);
+
 	crtc->state = crtc_state;
 }
 EXPORT_SYMBOL(__drm_atomic_helper_crtc_reset);
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
