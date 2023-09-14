Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE20D79FDF6
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 10:12:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4E9110E0F1;
	Thu, 14 Sep 2023 08:12:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4D3510E0F1
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 08:12:40 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-31f4629aaaaso86087f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 01:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1694679159; x=1695283959; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=HHw2XsNcRlVELEAxaY2CyeaC60IpexjAe/+ZJCzphyI=;
 b=X9Ho0CxWs1npvi+e3kDo//JfamMok8oG/yOO1IEn+PeVbuUFATwtchCzfEy0Lb9TRq
 hKVy1kKEeCKI6G3/g2bGiuc+4poVmoSFE1DCb6Ji/VPT2XgG+1qijFXM1pGpZBXYxrip
 QATP37t2F2s5HyBTU3wvJjCPV8uXeim1m96Kw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694679159; x=1695283959;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HHw2XsNcRlVELEAxaY2CyeaC60IpexjAe/+ZJCzphyI=;
 b=gdn4hg2xLbWtGCX5J40CP0u/kZT5pdbnSKZb65lWzdrK8YJV3+YsHqyoX/zmoerQ10
 7+5EQffAXIFxB1L4UyO3tKlSJhSFAxQOnNvM8ql1GgQKBl+frXAGiJmQxFynt+yEXZ4C
 l4qIMy5ghtIbeB+4ur5IQgfCEy3+qQrFKb3sNMeJ4bIpNvWqwumCphidJBbs9UDhlLbW
 Ck+ZInipi8Ohh+BX3KezTm2mqn3IFTiV8kBMZOTJjDyk8RrUYJCnC/ePyL8Ge4eO5tNw
 yw+cHSQlUQYIwPkbjKsGdYRxpLXJ+YNWuhFX7qGtJsgNMAk6DVRyOYHA5TXogirefvbg
 BffA==
X-Gm-Message-State: AOJu0YzBkSYP4qh+Wo9k8/TCKWzyp+0FdOE9oDaX36QIrvfdXew4lgNK
 SIg6WSkGcGa/oczSpJBIDeOALA==
X-Google-Smtp-Source: AGHT+IHN2a6TwrIOVLfCi68jJ9geuUGpqTwLp+ol8pEIkVlcXlsuXbwKUZUyXrF/UalV/WH2tI9/7g==
X-Received: by 2002:adf:fd4d:0:b0:317:3a23:4855 with SMTP id
 h13-20020adffd4d000000b003173a234855mr4119411wrs.2.1694679158926; 
 Thu, 14 Sep 2023 01:12:38 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 k3-20020a056000004300b0031fba0a746bsm1071942wrx.9.2023.09.14.01.12.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 01:12:37 -0700 (PDT)
Date: Thu, 14 Sep 2023 10:12:35 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Subject: Re: drm/vkms: deadlock between dev->event_lock and timer
Message-ID: <ZQLAc/Fwkv/GiVoK@phenom.ffwll.local>
Mail-Followup-To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Maira Canal <mairacanal@riseup.net>,
 Arthur Grillo <arthurgrillo@riseup.net>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 David Airlie <airlied@gmail.com>,
 DRI <dri-devel@lists.freedesktop.org>, syzkaller@googlegroups.com,
 LKML <linux-kernel@vger.kernel.org>,
 Hillf Danton <hdanton@sina.com>,
 Sanan Hasanov <Sanan.Hasanov@ucf.edu>,
 Thomas Gleixner <tglx@linutronix.de>,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <20230913110709.6684-1-hdanton@sina.com>
 <99d99007-8385-31df-a659-665bf50193bc@I-love.SAKURA.ne.jp>
 <CAHk-=wgb9ccWN3Nks5STYUDqQUeHZdCLsK4kA37SdDJuGZfukg@mail.gmail.com>
 <87pm2lzsqi.ffs@tglx>
 <167ee2ad-6a7e-876c-f5c9-f0a227070a78@I-love.SAKURA.ne.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <167ee2ad-6a7e-876c-f5c9-f0a227070a78@I-love.SAKURA.ne.jp>
X-Operating-System: Linux phenom 6.4.0-3-amd64 
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>, Hillf Danton <hdanton@sina.com>,
 Sanan Hasanov <Sanan.Hasanov@ucf.edu>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>, DRI <dri-devel@lists.freedesktop.org>,
 Melissa Wen <melissa.srw@gmail.com>, Maira Canal <mairacanal@riseup.net>,
 syzkaller@googlegroups.com, Thomas Gleixner <tglx@linutronix.de>,
 Arthur Grillo <arthurgrillo@riseup.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 14, 2023 at 03:33:41PM +0900, Tetsuo Handa wrote:
> On 2023/09/14 6:08, Thomas Gleixner wrote:
> > Maybe the VKMS people need to understand locking in the first place. The
> > first thing I saw in this code is:
> > 
> > static enum hrtimer_restart vkms_vblank_simulate(struct hrtimer *timer)
> > {
> >    ...
> >    mutex_unlock(&output->enabled_lock);
> > 
> > What?
> > 
> > Unlocking a mutex in the context of a hrtimer callback is simply
> > violating all mutex locking rules.
> > 
> > How has this code ever survived lock debugging without triggering a big
> > fat warning?
> 
> Commit a0e6a017ab56936c ("drm/vkms: Fix race-condition between the hrtimer
> and the atomic commit") in 6.6-rc1 replaced spinlock with mutex. So we haven't
> tested with the lock debugging yet...

Yeah that needs an immediate revert, there's not much that looks legit in
that patch. I'll chat with Maira.

Also yes how that landed without anyone running lockdep is ... not good. I
guess we need a lockdep enabled drm ci target that runs vkms tests asap
:-)

> Maíra and Arthur, mutex_unlock() from interrupt context is not permitted.
> Please revert that patch immediately.
> I guess that a semaphore (down()/up()) could be used instead of a mutex.

From a quick look this smells like a classic "try to use locking when you
want synchronization primitives", so semaphore here doesn't look any
better. The vkms_set_composer() function was originally for crc
generation, where it's userspace's job to make sure they wait for all the
crc they need to be generated before they shut it down again. But for
writeback the kernel must guarantee that the compositiona actually
happens, and the current function just doesn't make any such guarantees.

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
