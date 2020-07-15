Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 982502209EC
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jul 2020 12:23:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED0616E0D2;
	Wed, 15 Jul 2020 10:23:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B84736E0F7
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jul 2020 10:23:46 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id i4so1631289iov.11
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jul 2020 03:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen-nl.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z/JLbNZazA/j0a5kNivQXd8pY24GFHoSwTmJDj+hHVw=;
 b=ehu9Iy4fcEWGFJMDKwhB0NOaSI98wDmGtdkltCrGbK7d905qRhahmAx7Hb1kVmptqh
 TtU9W49zAs6hTR2KfxOWtGbsYS0RiLcjLGdqGNzJajLlzbhHmCYrzec1xLp47e2RxiGC
 3dgI30a3OyW3JD8FOtokh7Whiw9HhABYwPfT6J/LYzHJYQBK6JrZKTid9zq9jRpTocTp
 b3u/X3g3eIsnbAEtmfH7414Q0PYfnBSaouxofi3aXXnSz4e1gbnHS8U7GOhq52unGBRC
 HSJ2Qe9twi++3AOiemhLBjKuS0a58tIzJtRK29lU63F2Wyygk9ezalLBDha6KcpDgbig
 tSiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z/JLbNZazA/j0a5kNivQXd8pY24GFHoSwTmJDj+hHVw=;
 b=Ly0nmDLDTCu8Vty4RKvhnYioSRibL0zWNAn5DyoUVMazEPmCwrPQQIxRUySr1Y8U3E
 nptQ1okAhKMGmPhbXlJgdqbxoshS6o0ML9x07vroRCstCJ0D108SI9zbwJ7pJMlqETeK
 wJMC0GeaucQRpbLUjGNHAJ4q90+9ThD4NihnRCULY0omG6o1UkmIA08t8ZonOM5Ear4n
 m8yxSUjr4vgSdTW2kdFm/1KVSE3arY2WfNwm5DvJyG6F9LLguE8GYWf6C6k5GVzncOlb
 eged1DZVhsC6GkJSITPtGdq70XCfq3QPkhx0IHOydvYyjKhUYBDx+oj94GzU2Nux4Slp
 q8Jg==
X-Gm-Message-State: AOAM532fq7eJoGfi8Z1CbsR3U8e7lz0Wkruaitk4MVT8Vq3fIq/p5Dxj
 UBZnzaTh6pD76xOFYBI61mSc/T1zDtkMuM0rD9xUAA==
X-Google-Smtp-Source: ABdhPJzfXxWLaUn7LtXuIPX19z25siA7keSJghcbsWmdG8+Bf0/gBcZ6KNciA6hKx2DLP+nbyW3TPoGclb8Qwk6esJk=
X-Received: by 2002:a05:6638:14d3:: with SMTP id
 l19mr10871475jak.25.1594808625871; 
 Wed, 15 Jul 2020 03:23:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200715100432.13928-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200715100432.13928-1-chris@chris-wilson.co.uk>
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Date: Wed, 15 Jul 2020 12:23:35 +0200
Message-ID: <CAP+8YyF9djTo++3Gww2NNkOE_=fu9n+HzjoN7e78pVgJf_SP7A@mail.gmail.com>
Subject: Re: sw_sync deadlock avoidance, take 3
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
Cc: intel-gfx@lists.freedesktop.org,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Chris,

My concern with going in this direction was that we potentially allow
an application to allocate a lot of kernel memory but not a lot of fds
by creating lots of fences and then closing the fds but never
signaling them. Is that not an issue?

- Bas

On Wed, Jul 15, 2020 at 12:04 PM Chris Wilson <chris@chris-wilson.co.uk> wrote:
>
> dma_fence_release() objects to a fence being freed before it is
> signaled, so instead of playing fancy tricks to avoid handling dying
> requests, let's keep the syncpt alive until signaled. This neatly
> removes the issue with having to decouple the syncpt from the timeline
> upon fence release.
> -Chris
>
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
