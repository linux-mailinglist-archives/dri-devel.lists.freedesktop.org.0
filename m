Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9841FB17B
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jun 2020 15:02:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DF896E15C;
	Tue, 16 Jun 2020 13:02:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 368006E8BD
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jun 2020 13:02:43 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id m2so15817714otr.12
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jun 2020 06:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NzTqWXpX+jIvy6nNJlsuFOKnjF4HL8dCMVxHFmjhNpc=;
 b=ZiAh19reRpuQMNnULfDrvDsIF/sHi3PNBI2av/6tLQoIpHlpsGZyVyf5/f9zfAkXsT
 RvqRMv27tjZWKFR9Snu8Rk1bKEaoZyL/3MRnmiJD2SYG7VpqMcAfTK6UqN88hIEJj+VT
 ZZoCkxccGShzokCjF5GTZ+PUN11Lr1oNW1HT862bUqaAOlMVCxgyKCPIV1P3uEkrqLi1
 kxFv1PNr65IJYwIvN8H7k/8AJzUyeVk39JEE9mCjY/8kT+oymEOkTRGIvQYJsIyQkvwl
 VTRqUzdDBZjs9D9mgj+yTLxxaJOBRalDP+g3Ki0j/9PsO5oPKeJHujNesCv6z51OEUI/
 s7Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NzTqWXpX+jIvy6nNJlsuFOKnjF4HL8dCMVxHFmjhNpc=;
 b=t3JTu9xFk3FU4h98UHLC2hRoGtixKnj1nmPMl5anWZD0W4wszBVoQSbLwMeuWtbN4t
 XUD5SBD8dTByoRQGXuf4oJ4ViPT80Yq/8qrh1lKVp0OPPJmQSk97BJMARzzWFpSEDsQv
 n1IaU6y0wXrgaVL6yx6huMi5Z+X+q5U82EFRvkdXVCkzaE2HtUDmu5GHYnOzSEqWmfs3
 muewLqhNe8RvoCvpxMwejgdV8OLiecceljpajpnsE/NUUV45risH6JMAZuQt05/UfL9N
 u/satBw/GpksywF+NVPBUc4MgGALvWLfYTglDK3Cs3AKj5figspH9qqziCILW8U4vPaS
 baDA==
X-Gm-Message-State: AOAM531aQ0XjR3U50305G93gTX5fsqSsTKFuQsR6q5dzT620x8cciTir
 DRn6SyAK0HcOtLJkmsuXQ37ZpgNcUuIT7H3oh9WiAw==
X-Google-Smtp-Source: ABdhPJxsO1eVEcTPZvlTMUrXhz7ujf5MbjRiGA+lB51S5epUV5ph0XXmivVwvq7RJRM5fxua8F5YwdkG3RxhSDPGT/s=
X-Received: by 2002:a05:6830:242e:: with SMTP id
 k14mr2249753ots.36.1592312562394; 
 Tue, 16 Jun 2020 06:02:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200611114418.19852-1-sumit.semwal@linaro.org>
 <CAO_48GFVYOv8Km7fEh8iBPp7d5ziySBV0vB9nu_+oset6hBO8w@mail.gmail.com>
 <159231181752.18853.1290700688849491922@build.alporthouse.com>
In-Reply-To: <159231181752.18853.1290700688849491922@build.alporthouse.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Tue, 16 Jun 2020 18:32:31 +0530
Message-ID: <CAO_48GE8K_nDXs_LDU9caRdP-aK9DWV3vXcD4EuVCxyShCBbmg@mail.gmail.com>
Subject: Re: [PATCH v2] dma-buf: Move dma_buf_release() from fops to dentry_ops
To: Chris Wilson <chris@chris-wilson.co.uk>
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
Cc: Arnd Bergmann <arnd@arndb.de>, Chenbo Feng <fengc@google.com>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Linaro MM SIG <linaro-mm-sig@lists.linaro.org>,
 syzbot+3643a18836bce555bff6@syzkaller.appspotmail.com,
 Charan Teja Reddy <charante@codeaurora.org>,
 "# 3.4.x" <stable@vger.kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Chris,

On Tue, 16 Jun 2020 at 18:20, Chris Wilson <chris@chris-wilson.co.uk> wrote:
>
> Quoting Sumit Semwal (2020-06-16 13:42:13)
> > Hello,
> >
> > If there are no objections to this, I will plan to merge it soon.
>
> I was going to suggest running it against our CI, but that's unavailable
> at the moment.
>
> There's a particularly nasty BUG_ON() in dma_buf_release that we hit
> irregularly, that this might help with.
Thanks for your reply; if the CI is going to be available in a couple
of days, we could wait - it'd be definitely good to see a bug being
splattered out!

> -Chris

Best,
Sumit.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
