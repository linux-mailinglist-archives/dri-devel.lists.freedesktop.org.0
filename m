Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5BB17BDDD
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 14:12:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 478A86ED0D;
	Fri,  6 Mar 2020 13:12:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66DF76ED0D
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 13:12:28 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id x75so2464154oix.5
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2020 05:12:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xpK8kATRR5IULu5Ty4ktaaz9fInoLK6h5kiSCEaAQTA=;
 b=ifDG7eRGJBVsY9yZe/ywT9alzJa4ksSVsVCGQqLR6WBSkpMnT4HSkSBA3xrfUdFmFO
 UzM/83G++1TH566fmbVYh/OiqK6e1xYg14RAQx94tKmtH+SLFn58f930OX0CaFQFKV/8
 1W/bhc4lizG6PrmZkA+dn+WFkfJQsDo8lkjG8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xpK8kATRR5IULu5Ty4ktaaz9fInoLK6h5kiSCEaAQTA=;
 b=mz0wfE4XN7xjlWPp0Ml7UqVJfxPm1EqkwGpavLkdhYlnbmkX5B+/0ZLDFutZmbws+W
 AECd8HYht6XCZjyv5Q6gPNjzQZbwLvGSVSjUsHwdcrDZFcY5EU2lnS3pwF95TFKaMWn8
 qq9j6UHLh6KJLKFAn4/YfkSIMRuE7Jb7rOA5gPmlyFBmh3VI/kWFFAKaLOQ5Nf5yba/p
 Ry3v7beuviafEssLiFdkp92zSkFXkDdhFkunzMrr/fHDy+Cxgzw1tyFmmDRvJvURDYNa
 /xzk0W5IRU1LFXbGgWKMx/2PeOsByoyL+aiQWDcbR6LfYEl3wUsnkkfvKHXndsW3A3eC
 dBhA==
X-Gm-Message-State: ANhLgQ0MG9MQ3jmGltPqATSZAZYXL3gx2AA24gmXk5bUPUl4iSQ/Swmq
 mwlGRSKm0yFdd9GqOR55GVnlvrIoSscDqcSZ3fSgMw==
X-Google-Smtp-Source: ADFU+vvx+RoFcv01sd8hhwIAyMC0qgoTEasKLc0LumZuFhVm1ZkRdTTdO5QpApNyGa9g7p18SMulX6mrBlc9tgc0kAo=
X-Received: by 2002:aca:d985:: with SMTP id q127mr2404605oig.132.1583500347682; 
 Fri, 06 Mar 2020 05:12:27 -0800 (PST)
MIME-Version: 1.0
References: <20200304022429.37738-1-zhangxiaoxu5@huawei.com>
 <20200306103846.GS2363188@phenom.ffwll.local>
 <CAHk-=wgA7wCXf2s+ihRopi7dzfzc7hWQ0jGiQiV8vMW-XVdD-A@mail.gmail.com>
In-Reply-To: <CAHk-=wgA7wCXf2s+ihRopi7dzfzc7hWQ0jGiQiV8vMW-XVdD-A@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 6 Mar 2020 14:12:16 +0100
Message-ID: <CAKMK7uF_JnyWi+2QUG9OscC9DUA+4wh4dZGAXXAyYeXMTzXFyw@mail.gmail.com>
Subject: Re: [v4] vgacon: Fix a UAF in vgacon_invert_region
To: Linus Torvalds <torvalds@linux-foundation.org>
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
Cc: Andrew Morton <akpm@osdl.org>, Petr Mladek <pmladek@suse.com>,
 wangkefeng.wang@huawei.com,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Zhang Xiaoxu <zhangxiaoxu5@huawei.com>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 6, 2020 at 1:55 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Fri, Mar 6, 2020 at 4:38 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > Linus, since this missed the -fixes pull from Dave maybe double check I'm
> > not grossly wrong here and apply directly?
>
> Hmm. I don't have the original email, mind just sending it to me (with
> the proper added sign-off chain)?

I'll stuff it into a pull and throw that your way, that's simplest.
btw we did add dri-devel to lore a while back, so should be there:

Message-ID: <20200304022429.37738-1-zhangxiaoxu5@huawei.com>
https://lore.kernel.org/dri-devel/20200304022429.37738-1-zhangxiaoxu5@huawei.com/

> It does strike me that there's nothing that seems to check for
> overflow in the "(width << 1) * height" calculation. Hmm?

Indeed I failed to hunt for that :-/ But I think we're good, in
vc_do_resize() we have

    if (cols > VC_RESIZE_MAXCOL || lines > VC_RESIZE_MAXROW)
        return -EINVAL;

And they're both (1<<15)-1 so I think should be good enough even on
32bit - I quickly checked and we're short of UINT_MAX:

$ echo $(((((1<<15)-1) << 1)*((1<<15)-1)))
2147352578

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
