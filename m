Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF34A4CB449
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 02:34:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 010CC10E94A;
	Thu,  3 Mar 2022 01:34:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5D0710E931
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 01:34:51 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 mg21-20020a17090b371500b001bef9e4657cso3011033pjb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Mar 2022 17:34:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FJe6o6kOYUsVDZGZdIQBgO3hTT0nURrPq8TyLaBL26k=;
 b=Ji3otGrQQO90v6nf+Pw0zJXjsReY+4IjW093S6IgLizJrTza5WMcsk0sMiXJdviB+j
 Gh/xZapihQUXk85y5My0tcVzcCuk8AkqgJDrnZXt66EMyzvwySzGDKm5qirXLkCDOLa9
 r0BKQJj1PHblhVXqTk5umT/zQ8zvNYJiHOtkv8tWAhAAhXVNf2Mi7GKDitx2OSSr13SG
 RAJanLoAAPSd6qzFEOEk7LuaUbXGfaPd7BwQT/vCAp2c8r/EFP4NZanbRvyVdZuXbLgT
 khSadLdadCKnYa5ZhmantnCSs50Jck+Mb67Gu4iDKgfgFndBgWiTGew/b/yokahgewlj
 YdDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FJe6o6kOYUsVDZGZdIQBgO3hTT0nURrPq8TyLaBL26k=;
 b=fBPtlR5ckf6jaAMyRv+nbF/0WrK7N56q7WO+VEF/cQJLi4CFL4ySYoP2BcmiXFLhDi
 dIINRnF5El4ivW778QLn+0buEwTQJGWGQfcqCVWyYoIjvuJOxYDAtRbAyXXGfFmKmKX5
 c2G2E8Iv1n6k/7FO7/qThMH0RboLqaNauH6COTYMA8xtviBj/Sh1SqDNmbfK8iTwAM/k
 eQNmhH/zDJ5h60LIMgcrjak2QTQBOIHeA4ddZa771tIMPwDy2i7wiA8P1AkNATm3JPRv
 oxBYk4Rl6ZYiN8TpaE5Z9S8E5A8Izqp2r/ivHGDT7tSZ4lgBfnvM0fEAZMhZDSIgFq4V
 EdJQ==
X-Gm-Message-State: AOAM532bydYRaZW2xcmO1j8Ax1zSVubtxmR384UPqhXfNo7ie81XaIdv
 jFultfGXU3eQc15rUGzm57dBW2gwU7T+Rt63Jw==
X-Google-Smtp-Source: ABdhPJyKZkyhTgZtgkuDJ8TTOmVDM/RSZPhspXLa7591Zm5jXxcfkynti4aLwIUGC91ivpRbH5lsbpG1H9PVxg/0re0=
X-Received: by 2002:a17:902:8a91:b0:14f:969b:f6be with SMTP id
 p17-20020a1709028a9100b0014f969bf6bemr33826185plo.161.1646271291341; Wed, 02
 Mar 2022 17:34:51 -0800 (PST)
MIME-Version: 1.0
References: <20220302143311.2109322-1-zheyuma97@gmail.com>
 <666d1565-0467-bb21-916b-073392129e1a@gmx.de>
In-Reply-To: <666d1565-0467-bb21-916b-073392129e1a@gmx.de>
From: Zheyu Ma <zheyuma97@gmail.com>
Date: Thu, 3 Mar 2022 09:34:40 +0800
Message-ID: <CAMhUBj=P82_f6LdhWqEbe06SRPrMU2jxquNzgWkrttGDy6C4Kg@mail.gmail.com>
Subject: Re: [PATCH] video: fbdev: sm712fb: Fix crash in smtcfb_write()
To: Helge Deller <deller@gmx.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-fbdev@vger.kernel.org, sudipm.mukherjee@gmail.com,
 dri-devel@lists.freedesktop.org, teddy.wang@siliconmotion.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Mar 3, 2022 at 12:49 AM Helge Deller <deller@gmx.de> wrote:
>
> On 3/2/22 15:33, Zheyu Ma wrote:
> > When the sm712fb driver writes three bytes to the framebuffer, the
> > driver will crash:
> >
> >     BUG: unable to handle page fault for address: ffffc90001ffffff
> >     RIP: 0010:smtcfb_write+0x454/0x5b0
> >     Call Trace:
> >      vfs_write+0x291/0xd60
> >      ? do_sys_openat2+0x27d/0x350
> >      ? __fget_light+0x54/0x340
> >      ksys_write+0xce/0x190
> >      do_syscall_64+0x43/0x90
> >      entry_SYSCALL_64_after_hwframe+0x44/0xae
> >
> > Fix it by removing the open-coded endianness fixup-code.
> >
> > Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
>
> Thanks... it's already in the fbdev git tree and queued up for v5.18...
> https://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git/commit/?h=for-next&id=bd771cf5c4254511cc4abb88f3dab3bd58bdf8e8

This patch fixes the crash in smtcfb_read(), but there is a similar
bug in smtcfb_write(), and I mocked up your patch a wrote a new patch
for it.
So we should fix two bugs with two patches.

Regards,
Zheyu Ma
