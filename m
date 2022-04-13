Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 134884FF187
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 10:13:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6F1810FCA6;
	Wed, 13 Apr 2022 08:13:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 121F610FCD4
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 08:13:12 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id v15so1369901edb.12
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 01:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=COYmy9WSgxhyW6JEptJgXqC1UQEHgsiPzrBZVjfxvVs=;
 b=OJn63GHKsd5dju0BmHXHVv2HhZQsQo3PBeKyMiueIcr7zOwc7LrYuA6j87V4c0o1B0
 /8zF3+5Y7rxLR0VEn38g3J3wzrbZm546uzNfDCih/zUb8aszzv3C3zH83pUXCTfPYDLP
 jeWlFN2bCL+pL+zYd890puilgRdSGtz6+AXgI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=COYmy9WSgxhyW6JEptJgXqC1UQEHgsiPzrBZVjfxvVs=;
 b=Vd4RUy55VXiHeQOi7nIGYEMlhwOqBeGgKH3CuTFPZIOx++lwOEUjkPCWCib+6te9ww
 Ia+vOCQSF0iWd7v6jSRF0/1ZeWIDFz1azAvo4MSo2yq5d0kAo66mfd+dU8l9vGsodXRg
 hrQLR/fA7mFnL1WXf4VJxeuifUKG4uXnPLp3be9J+9TzUB4ywfcZDda2l99pHFDvISrv
 iVkd5XberLshbxI72+kIRUQetlBMV7NgaOiFRVP/8ilqOrss0zOmN54ytx68b6d9jxd3
 WIog1QW/fjtimi7kTlAMwpQ8QvFgeXhzBTWbyhMyZLNJIm1/F/yCWIrHx8Ykd3TqeN4B
 8o0w==
X-Gm-Message-State: AOAM532XyB1327oPWvW5BzyVaxZr9mcGnlVgrspbmmR1tco3wVkYwZ0T
 uFk4N8Femu8cG1ARxq0RhKUrqA==
X-Google-Smtp-Source: ABdhPJy6TWQdaAulZQsPdXvlWVHTY42LcIP31ec5zmHVAUZSHLN+f6feRDRuYyromHuJ+9UEFZwhXg==
X-Received: by 2002:a05:6402:1d51:b0:41f:cf6c:35a5 with SMTP id
 dz17-20020a0564021d5100b0041fcf6c35a5mr676665edb.25.1649837590569; 
 Wed, 13 Apr 2022 01:13:10 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 do8-20020a170906c10800b006dfe4d1edc6sm13805690ejc.61.2022.04.13.01.13.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Apr 2022 01:13:09 -0700 (PDT)
Date: Wed, 13 Apr 2022 10:13:08 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH v3 14/17] fbcon: Move console_lock for
 register/unlink/unregister
Message-ID: <YlaGFJTkM85CqXX9@phenom.ffwll.local>
References: <20220405210335.3434130-1-daniel.vetter@ffwll.ch>
 <20220405210335.3434130-15-daniel.vetter@ffwll.ch>
 <YlSrYyVlcq/gHV5T@dev-arch.thelio-3990X>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YlSrYyVlcq/gHV5T@dev-arch.thelio-3990X>
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
Cc: Xiyu Yang <xiyuyang19@fudan.edu.cn>, Du Cheng <ducheng2@gmail.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Zheyu Ma <zheyuma97@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Claudio Suarez <cssk@net-c.es>, Matthew Wilcox <willy@infradead.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Zhen Lei <thunder.leizhen@huawei.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 11, 2022 at 03:27:47PM -0700, Nathan Chancellor wrote:
> Hi Daniel,
> 
> On Tue, Apr 05, 2022 at 11:03:32PM +0200, Daniel Vetter wrote:
> > Ideally console_lock becomes an implementation detail of fbcon.c and
> > doesn't show up anywhere in fbmem.c. We're still pretty far from that,
> > but at least the register/unregister code is there now.
> > 
> > With this the do_fb_ioctl() handler is the only code in fbmem.c still
> > calling console_lock().
> > 
> > Acked-by: Sam Ravnborg <sam@ravnborg.org>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: Du Cheng <ducheng2@gmail.com>
> > Cc: Claudio Suarez <cssk@net-c.es>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> > Cc: Matthew Wilcox <willy@infradead.org>
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Zheyu Ma <zheyuma97@gmail.com>
> > Cc: Guenter Roeck <linux@roeck-us.net>
> > Cc: Alex Deucher <alexander.deucher@amd.com>
> > Cc: Zhen Lei <thunder.leizhen@huawei.com>
> > Cc: Xiyu Yang <xiyuyang19@fudan.edu.cn>
> 
> This patch as commit 6e7da3af008b ("fbcon: Move console_lock for
> register/unlink/unregister") in next-20220411 causes a lock up on my
> test Intel desktop; I get no output on my display and I cannot ssh into
> the machine. Bisect log below. If back out of this patch and the ones
> that follow in this series on top of next-20220411, everything works
> properly (i.e. 'git diff 6e7da3af008b^..efc3acbc105a | git apply -R').
> 
> What information would be helpful for debugging this? The system has an
> i7-11700 in it and it is booting under UEFI, so I assume it should be
> using EFI_FB. I am happy to offer any debugging information or test any
> patches.

I think I got it, typing a patch now for you to test. Thanks a lot for the
bug report and bisect!
-Daniel

> 
> # bad: [d12d7e1cfe38e0c36d28c7a9fbbc436ad0d17c14] Add linux-next specific files for 20220411
> # good: [8b57b3046107b50ebecb65537a172ef3d6cec673] Merge tag 'tty-5.18-rc2' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty
> git bisect start 'd12d7e1cfe38e0c36d28c7a9fbbc436ad0d17c14' '8b57b3046107b50ebecb65537a172ef3d6cec673'
> # bad: [8f0b3ef070bd35e80da1caa85824fc344fb6b82e] Merge branch 'for-linux-next' of git://anongit.freedesktop.org/drm/drm-misc
> git bisect bad 8f0b3ef070bd35e80da1caa85824fc344fb6b82e
> # good: [69ae2d6587df089ec1c21bddddc7852df403d3ce] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git
> git bisect good 69ae2d6587df089ec1c21bddddc7852df403d3ce
> # good: [43ffc7321ed6ce13e5424fa687576f4442c25f9d] Merge branch 'master' of git://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git
> git bisect good 43ffc7321ed6ce13e5424fa687576f4442c25f9d
> # good: [d44c2642c40b6c11e4a0afc76d491287c074376c] drm/gem: Delete gem array fencing helpers
> git bisect good d44c2642c40b6c11e4a0afc76d491287c074376c
> # good: [3223e922ccf8b5c3dd0b05faeaba407655ee0774] orinoco: Prepare cleanup of powerpc's asm/prom.h
> git bisect good 3223e922ccf8b5c3dd0b05faeaba407655ee0774
> # good: [689333136327b6cd618df85d83d79f2aa620d585] fbcon: Move fbcon_bmove(_rec) functions
> git bisect good 689333136327b6cd618df85d83d79f2aa620d585
> # good: [840db0076b05a1dd4c2ded8d08f8481e0297d09f] Merge branch 'master' of git://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git
> git bisect good 840db0076b05a1dd4c2ded8d08f8481e0297d09f
> # bad: [6e7da3af008b72520f5318507f455f344b27f022] fbcon: Move console_lock for register/unlink/unregister
> git bisect bad 6e7da3af008b72520f5318507f455f344b27f022
> # good: [6b2060cf9138a2cd5f3468a949d3869abed049ef] fb: Delete fb_info->queue
> git bisect good 6b2060cf9138a2cd5f3468a949d3869abed049ef
> # good: [d443d93864726ad68c0a741d1e7b03934a9af143] fbcon: move more common code into fb_open()
> git bisect good d443d93864726ad68c0a741d1e7b03934a9af143
> # good: [43553559121ca90965b572cf8a1d6d0fd618b449] fbcon: Consistently protect deferred_takeover with console_lock()
> git bisect good 43553559121ca90965b572cf8a1d6d0fd618b449
> # first bad commit: [6e7da3af008b72520f5318507f455f344b27f022] fbcon: Move console_lock for register/unlink/unregister
> 
> Cheers,
> Nathan

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
