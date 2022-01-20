Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBCC494D23
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 12:41:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAC3610E410;
	Thu, 20 Jan 2022 11:41:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com
 [IPv6:2607:f8b0:4864:20::c29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B05610E456
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 11:41:01 +0000 (UTC)
Received: by mail-oo1-xc29.google.com with SMTP id
 x21-20020a4a2a55000000b002ddf492c201so2075733oox.6
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 03:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/S8k15AcpnXJR5sZmK0Rcxc+q7sXlvNu6yj6zSEHGrM=;
 b=AhbLp7Lrf/Hbom1/nqt1i9iL8YdYmD1NGte7834RS0WBZ0e4HZSvvgEnRviDNt+ijl
 +ExPcaeqep414/+Np4/OrvaZ1+CMi4uzmk42JdqTz0HgQELcdKTw5LfsCxPET5H2iwUZ
 XNMbk0TsUZ/N7jN6oUb1Kh0EfZWT6TrI9Ndwo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/S8k15AcpnXJR5sZmK0Rcxc+q7sXlvNu6yj6zSEHGrM=;
 b=uNnQzfceWPjZ/KTCv1241pkiXZVrEfk6vb76nnyftlfZYEZayHt7B/t3Br+igWL3GC
 D45dY5fZ2f1uK7+NamQ05uVYs6uZga78NiEbmuhD2hXddpExXPdqOMDfUxGHF07qOS+h
 VZIxKBl8SvZmIgvEwSFZTJr9aluIClq65mW76fHL0lKDSYTfBac9WJojYWdCnguwHmSi
 NgEl3tRIvXRVIFdVAQ3kjQ9Nhg3O77tfE5YpzdvBnQbRIQKoUw89P+KHsXhjMRmFqMV0
 8KS/tCTCxprgXQqGjrhsZmUyoDGS6GjP2Atx1NoTmPTAd78ryd1sJvEz8/tl92aiKmnb
 1fnQ==
X-Gm-Message-State: AOAM531aBMf3KGqe7aUUr5MR6Z3DZk9RpLjODf4seEuqd20Nu0UtJ0fu
 DmABMpKIJKCseD6K5trD5fYzHOuvRJSCFInFIhBx1zj0IAg=
X-Google-Smtp-Source: ABdhPJwa7VL7d5xj1gVrA32gnMHYFGhcySOnufhi//Z+qMUimvyBQyMQD3mUQexgWnazoLdFsFC06rjJ6XZ4Dnorwvg=
X-Received: by 2002:a4a:db96:: with SMTP id s22mr23232794oou.66.1642678860411; 
 Thu, 20 Jan 2022 03:41:00 -0800 (PST)
MIME-Version: 1.0
References: <CAFr9PXnig9YfnwSzMg5UPm3UtAsEAQT_xVheBbLppiU45mc_QQ@mail.gmail.com>
 <Yeg8mi0S2ACy9q8O@phenom.ffwll.local>
 <CAFr9PXkUwfyZ9yJgNYHX5_jo_SFfDU9wKA3Ldf+hbVL23faqKQ@mail.gmail.com>
In-Reply-To: <CAFr9PXkUwfyZ9yJgNYHX5_jo_SFfDU9wKA3Ldf+hbVL23faqKQ@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 20 Jan 2022 12:40:49 +0100
Message-ID: <CAKMK7uHxjmZShgzVdt6yPRN6qN4QVMvwCfNYxTp8yWdfs4x_ng@mail.gmail.com>
Subject: Re: [RFC] How to add hardware rotation,
 scaling etc to a DRM/KMS driver
To: Daniel Palmer <daniel@0x0f.com>
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
Cc: Hans de Goede <j.w.r.degoede@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 20, 2022 at 12:12 PM Daniel Palmer <daniel@0x0f.com> wrote:
>
> Hi Daniel,
>
> On Thu, 20 Jan 2022 at 01:30, Daniel Vetter <daniel@ffwll.ch> wrote:
> > > I got the feeling that maybe I should just provide an interface to the
> > > blitter from userspace and userspace should be doing the rotation. I'd
> > > like to do it in the kernel so stuff like SDL1 apps just work but
> > > maybe that isn't possible?
> >
> > panel orientation property is for that stuff:
> > fbcon will head this and rotate in sw,
>
> This is working. On boot I get Tux rotated correctly etc.
>
> > as should any competent compositor
> > in userspace (but some might not, it depends).
>
> That's the problem I guess. I don't have one. SDL1 apps like prboom
> use the fbdev emulation as-is so they render upside down[0].
> I have 16MB of local storage and 128MB of RAM so I don't think I'll
> manage to get the standard userland bits onto it.
>
> I wanted to do the rotation in the kernel so I didn't have to hack up SDL1.

Move to drm kms, fix userspace. fbdev never supported this, and I
really don't think it's a good idea to add in-kernel rotation to
fbdev.
-Daniel

>
> Cheers,
>
> Daniel
>
> 0 - https://twitter.com/linux_chenxing/status/1479801511274491909



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
