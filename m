Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5357D222013
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jul 2020 12:00:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AA0F6E128;
	Thu, 16 Jul 2020 10:00:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E7BE6E128
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jul 2020 10:00:10 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id j18so9723364wmi.3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jul 2020 03:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=p7ULmXvRXYxCcTo8wTXcMu3x+yaWMQIGr98XOBExKbA=;
 b=WiOCEj2aX2XvOMwJRHGb2nmKLYzIngZK3V8yvoeZMgI50rW5jzQZSaclNCu+hYD2fh
 W9Ax4Z9wBtrHU6XdeweO1EuJSpp4uBxsxMIvwZ3p2oBWvSvklN2/tqt+R++hmOJph1Pa
 Cg4wzU0cANnHCT1Vl9YvZXeDnZQsbNhLUpOQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=p7ULmXvRXYxCcTo8wTXcMu3x+yaWMQIGr98XOBExKbA=;
 b=DOf02X6rswfxCqKehmnfelOSilJqLfKbbMHbmaQ+9RlagWyLrx4Gxz2CCH6K0d8iyb
 1bRabxTJB1xVyZOq2nrnNzijy/i6QC9JuRLU4vkBlZFFptGBJUigtE0oK66Qw6nuP10O
 CAFi2PeLof4uuYnQkRMdMD771NkqqqdcWIAZXGuVlUQ9z9L50FpDeIYUUOamD+4NJkBE
 AaZxhiF58OvtbsWIKLTAe72huI7YF8vbJjB6/X6dcT+vyJM4q2YDyC6yowZyfZDDmsEU
 kjcka5KzUWcbZKTmbM8ycwVaUJwI8OJfSkqgug5Fxs5bS4PVAcjNwd9fFYhOCDBo38c1
 hQIA==
X-Gm-Message-State: AOAM533rPIlIupzM9ryPJhUDYLoLkei8V4blFgTNyh0f6J5Dx2vYHVR9
 ynyGyL8IIl4sjRINXusKpr5pQw==
X-Google-Smtp-Source: ABdhPJxn6oG23L3JWUoDJgbj2CK99jMIxywnQc6uT8hr9FP8YkPYYWAV3FpUvuGMkDhTuMGWgHs27g==
X-Received: by 2002:a05:600c:2249:: with SMTP id
 a9mr3448422wmm.163.1594893609246; 
 Thu, 16 Jul 2020 03:00:09 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y16sm8215061wro.71.2020.07.16.03.00.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2020 03:00:08 -0700 (PDT)
Date: Thu, 16 Jul 2020 12:00:06 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Subject: Re: [PATCH v2] fbdev: Detect integer underflow at "struct
 fbcon_ops"->clear_margins.
Message-ID: <20200716100006.GN3278063@phenom.ffwll.local>
Mail-Followup-To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 syzbot <syzbot+e5fd3e65515b48c02a30@syzkaller.appspotmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 George Kennedy <george.kennedy@oracle.com>,
 Jiri Slaby <jslaby@suse.com>, Dmitry Vyukov <dvyukov@google.com>
References: <adff5d10-fe35-62d4-74c5-182958c5ada7@i-love.sakura.ne.jp>
 <20200715015102.3814-1-penguin-kernel@I-love.SAKURA.ne.jp>
 <20200715094836.GD2571@kadam>
 <9e6eac10-c5c3-f518-36cc-9ea32fb5d7fe@i-love.sakura.ne.jp>
 <b50f85c7-80e5-89c5-0aca-31d8e9892665@i-love.sakura.ne.jp>
 <20200715151220.GE2571@kadam>
 <adfa8720-c411-dfe6-6b0f-7591dd95396c@i-love.sakura.ne.jp>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <adfa8720-c411-dfe6-6b0f-7591dd95396c@i-love.sakura.ne.jp>
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 syzbot <syzbot+e5fd3e65515b48c02a30@syzkaller.appspotmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 George Kennedy <george.kennedy@oracle.com>, Dmitry Vyukov <dvyukov@google.com>,
 Jiri Slaby <jslaby@suse.com>, Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 16, 2020 at 12:29:00AM +0900, Tetsuo Handa wrote:
> On 2020/07/16 0:12, Dan Carpenter wrote:
> > I've complained about integer overflows in fbdev for a long time...
> > 
> > What I'd like to see is something like the following maybe.  I don't
> > know how to get the vc_data in fbmem.c so it doesn't include your checks
> > for negative.
> 
> Yes. Like I said "Thus, I consider that we need more sanity/constraints checks." at
> https://lore.kernel.org/lkml/b1e7dd6a-fc22-bba8-0abb-d3e779329bce@i-love.sakura.ne.jp/ ,
> we want basic checks. That's a task for fbdev people who should be familiar with
> necessary constraints.

I think the worldwide supply of people who understand fbdev and willing to
work on it is roughly 0. So if someone wants to fix this mess properly
(which likely means adding tons of over/underflow checks at entry points,
since you're never going to catch the driver bugs, there's too many and
not enough people who care) they need to fix this themselves.

Just to avoid confusion here.

> Anyway, my two patches are small and low cost; can we apply these patches regardless
> of basic checks?

Which two patches where?

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
