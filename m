Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23570233109
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jul 2020 13:35:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4796A6E045;
	Thu, 30 Jul 2020 11:35:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5915A6E1B9
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jul 2020 11:35:17 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id h1so19794189otq.12
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jul 2020 04:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MRzokrMc0Qm9FKeka5mjSS3X3+tAOXypP+ce1X7MQBI=;
 b=iipVaGjfy4vwKxkDV4BAQroSsbhnoNOfVaRbNPsPbYc617UHV3vMKacI3QuoVFW4Ym
 NMEfZrR2B+sQF5rf1QYFMQhm71yOP2XE0ErB0cuM7dlMVGT/r/UTqlQt9ZlRjsV3FiHj
 KOP0wiur98KfxTYFxbJ78Ro9HO5aYJz9EPxPI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MRzokrMc0Qm9FKeka5mjSS3X3+tAOXypP+ce1X7MQBI=;
 b=NqlnfmPZdSdCub59XfXQTBGHOiX/gxUJ9uOOQRJ5JNI83TmR2WEpWcGDaTWDo9tlhC
 YkDVqOTp6nmCmcCyyMaawaR7RwqU0sHK161+q6ewpYutu/b2Ut/RtMRCY9oxI9WC64an
 6sL1HjjGiQ+5tJx3KcNk0EWYXj5wV6sxlxBgMwGsK8P+vYnvHLqzQ3HNkB8u1r8yNSdx
 ojbZ+4TDjR5B0pCSPDMphLx+M2nSp/t8gHn9QkWSsrCSK19Ie2tKuxAjoLce6AxFZzsL
 9M6N7EGdKrP340xrQ3ucFEXYLef1jspxGap64ecMGb3oMyWDfInYJmIm0Wd3b5nqRaaM
 8KOw==
X-Gm-Message-State: AOAM531jLCHhqMXvUUkkUk9X9ayddTvJnYiyPesj9wEYYJkst/UZ4ZTx
 1r4lRijrin227xXlMNpkd34XLl8+cBPOZjvSV5/nOC/3
X-Google-Smtp-Source: ABdhPJyK3XjO3qAYxV/3DE11QmLPyeVuxGiJw5ED5uo8MdAzpo+p3AFXndZW5wHhjoS7i3OPw7tr1pOnjbzeng7wAi4=
X-Received: by 2002:a9d:6052:: with SMTP id v18mr1821579otj.303.1596108916621; 
 Thu, 30 Jul 2020 04:35:16 -0700 (PDT)
MIME-Version: 1.0
References: <1596000620-4075-1-git-send-email-penguin-kernel@I-love.SAKURA.ne.jp>
 <CAKMK7uHeteS2+rKrZKrAM+zQO==hAX0XaVc9JfHPsdLTCtzKOw@mail.gmail.com>
 <a3bb6544-064d-54a1-1215-d92188cb4209@i-love.sakura.ne.jp>
 <CAKMK7uGTL02SHbEazu5YEnEncO6c-+P6DXt1GWSVQ28enqLx2g@mail.gmail.com>
 <d4c97785-467a-6e04-b8bb-c8aa4177882a@i-love.sakura.ne.jp>
In-Reply-To: <d4c97785-467a-6e04-b8bb-c8aa4177882a@i-love.sakura.ne.jp>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 30 Jul 2020 13:35:05 +0200
Message-ID: <CAKMK7uH_Y6eFuLZOvsDbzk2D0S5uREjM_kwAFkcK1k0z9qXSug@mail.gmail.com>
Subject: Re: [PATCH] fbmem: pull fbcon_update_vcs() out of fb_set_var()
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jiri Slaby <jslaby@suse.com>,
 syzbot <syzbot+c37a14770d51a085a520@syzkaller.appspotmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 30, 2020 at 1:27 PM Tetsuo Handa
<penguin-kernel@i-love.sakura.ne.jp> wrote:
>
> On 2020/07/30 20:16, Daniel Vetter wrote:
> > Patch looks good, except ... does this compile? fbcon_update_vcs is
> > defined in fbcon.h, and that doesn't seem to be included here ...
> > Maybe what we want is an fb_set_var_ioctl in fbmem.c so that the fbcon
> > interaction is a bit better hidden (but that's a bikeshed, feel free
> > to ignore). Also I have no idea what trickery you need to compile-test
> > ps3fb, that's why I'm asking :-)
>
> Right. I didn't prepare environment for compiling powerpc kernel.
> Kernel test robot found it and I already posted V2 patch as
> https://lkml.kernel.org/r/075b7e37-3278-cd7d-31ab-c5073cfa8e92@i-love.sakura.ne.jp .

Excellent. It's still stuck in a queue somewhere and hasn't reached my
inbox, I'll queue it up as soon as I have it.

Thanks, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
