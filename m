Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A3C14D7A6
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2020 09:32:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBEDB6F906;
	Thu, 30 Jan 2020 08:32:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A373A6F59A
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2020 14:59:20 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id x1so17244018qkl.12
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2020 06:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yFFnDEPV8qmyFvWAxO/SsQ1ehnqonaxGmlVfD7DOHfw=;
 b=VRc/dzK3xlehE4NkXiPMTzQvco1YgZqPdC67Aj4XVnuYXdNkzl3gH/3q9wgQCEXrEp
 1WnH9g1GcpcXS/Dadf2PmPjf3BZ1tB89mrZor0Wv6gVb//ED/V9CL85atg8KgIGRbhoE
 UtpOfEjAmgSf0JjL1XlYUR85oWVnW4Did/+iD4hBaKVQD7KQ7PA/i/ZXC3jRIlIcLRbm
 fWUiWIK0RbJxX116SieaSBN3Vnhk6IGxcF3q+sAeB/0tG8ytEOjqZWVUaPOOmh9krclh
 TqIfKEGMyzHJF5V+3bcrRFQBXvSpG3gFoTJ/3goH0dBXGPN7cGqbebQ5QRBCj4Q1+75r
 SzJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yFFnDEPV8qmyFvWAxO/SsQ1ehnqonaxGmlVfD7DOHfw=;
 b=NGTTHdr7JPVK9COvJOsD4ezaPwcYnPZsxjjFAJ7KAn2AuAT5y/9KKE2Ghvc120iLWK
 mUPCJifj3QEVY1Mk/JvDGmgWy+1LT3aFe+ewcqW+AyBmvSiWpGKsksZN5vgsoRCKytba
 hL58tt4MZzJhUJoytMxIPEJBcigyeAcFb3xf2MxoO+HSOIOXhNQ2cyW2tEiCTDRNWqE4
 3Y6GOmrwCyoOb6rBcX2bRWnFy6Shsdzn3hKF1LFJBbRjymzIMrlv6vXP/un2l7dm7kQW
 onzz7nXg8jZsqBTEhE98/+Ph6Qk8kKrBeM2m39Mqa3EpKJpqk/lZofSmRbRVyPfCX07a
 DZ8g==
X-Gm-Message-State: APjAAAUKV9v5SPDc0nr9ldkO7RxezvCA+PSFZm+xwzhCU05NTVbVDN+L
 VjEUet7qvRH6s+oCyNaqaaJCUK45qRzEkFDv3HxcwA==
X-Google-Smtp-Source: APXvYqwBRCLvaDwM/oWv/aFmiTw4TFm3vq6Ctvjx34oTuJTJNW+q/P9l5V5F0gFF1pyjOyG52SAL74GWBo5NlxJ1bQI=
X-Received: by 2002:ae9:e50c:: with SMTP id w12mr25953401qkf.407.1580309959502; 
 Wed, 29 Jan 2020 06:59:19 -0800 (PST)
MIME-Version: 1.0
References: <CAA=061EoW8AmjUrBLsJy5nTDz-1jeArLeB+z6HJuyZud0zZXug@mail.gmail.com>
 <CGME20200128124918eucas1p1f0ce2b2b7b33a5d63d33f876ef30f454@eucas1p1.samsung.com>
 <20200128124912.chttagasucdpydhk@pathway.suse.cz>
 <4ab69855-6112-52f4-bee2-3358664d0c20@samsung.com>
 <20200129141517.GA13721@jagdpanzerIV.localdomain>
 <20200129141759.GB13721@jagdpanzerIV.localdomain>
 <20200129143754.GA15445@jagdpanzerIV.localdomain>
In-Reply-To: <20200129143754.GA15445@jagdpanzerIV.localdomain>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Wed, 29 Jan 2020 15:59:07 +0100
Message-ID: <CACT4Y+bavHG8esK3jsv0V40+9+mUOFaSdOD1+prpw6L4Wv816g@mail.gmail.com>
Subject: Re: KASAN: slab-out-of-bounds Write in vgacon_scroll
To: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
X-Mailman-Approved-At: Thu, 30 Jan 2020 08:32:45 +0000
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
Cc: Petr Mladek <pmladek@suse.com>, Kefeng Wang <wangkefeng.wang@huawei.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 LKML <linux-kernel@vger.kernel.org>, anon anon <742991625abc@gmail.com>,
 syzkaller <syzkaller@googlegroups.com>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 29, 2020 at 3:40 PM Sergey Senozhatsky
<sergey.senozhatsky@gmail.com> wrote:
>
> Cc-ing Dmitry and Tetsuo
>
> Original Message-id: CAA=061EoW8AmjUrBLsJy5nTDz-1jeArLeB+z6HJuyZud0zZXug@mail.gmail.com
>
> On (20/01/29 23:17), Sergey Senozhatsky wrote:
> > > Hmm. There is something strange about it. I use vga console quite
> > > often, and scrolling happens all the time, yet I can't get the same
> > > out-of-bounds report (nor have I ever seen it in the past), even with
> > > the reproducer. Is it supposed to be executed as it is, or are there
> > > any preconditions? Any chance that something that runs prior to that
> > > reproducer somehow impacts the system? Just asking.
> >
> > These questions were addressed to anon anon (742991625abc@gmail.com),
> > not to Bartlomiej.
>
> Could this be GCC_PLUGIN related?

syzkaller repros are meant to be self-contained, but they don't
capture the image and VM setup (or actual hardware). I suspect it may
have something to do with these bugs.
syzbot has reported a bunch of similar bugs in one of our internal kernels:

KASAN: slab-out-of-bounds Read in vgacon_scroll
KASAN: slab-out-of-bounds Read in vgacon_invert_region
KASAN: use-after-free Write in vgacon_scroll
KASAN: use-after-free Read in vgacon_scroll
KASAN: use-after-free Read in vgacon_invert_region
BUG: unable to handle kernel paging request in vgacon_scroll

But none on upstream kernels. That may be some difference in config?
I actually don't know what affects these things. When I tried to get
at least some coverage of that code in syzkaller I just understood
that relations between all these
tty/pty/ptmx/vt/pt/ldisc/vcs/vcsu/fb/con/dri/drm/etc are complex to
say the least...
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
