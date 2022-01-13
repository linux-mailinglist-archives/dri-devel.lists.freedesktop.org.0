Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F2D48D64F
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 12:08:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 862FD10E18D;
	Thu, 13 Jan 2022 11:08:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A2BA10E18D
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 11:08:00 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id br17so18163657lfb.6
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 03:08:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uHTsUg3HEau620/3Kt1gAirKaZRBvN3yED5BHth3EE8=;
 b=dAGW/+aPFYxzL5NwBWOLkEHowvoffuEhYijSaiZkmNoQ7tuOanFh14QMD1SolHX+Od
 ZcQGJCoWKfare85WMgR9oIfvWZRXuXjz3JN/hl2iXKThx6a7qflq5E+NjfIWKHYvVMnJ
 0L23TtFXT1C33VTjgoMo5ehRQnuCZL1YbCxvF4lV0i8UWUx6MOouRyFUypddAC1MK1c7
 sl0ID7467dkjgodXqgUhP1qHr9sjR15RC2lnPV4sknEKUu3H8/MDtGh5HT3skdCRu1d4
 FkjJgtrnEkOa5XbAr8Vs2+79TeXdJ6w99SGIbEt+kaxRJZ9c6z6NglWMO3XiJvM1/T3c
 flZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uHTsUg3HEau620/3Kt1gAirKaZRBvN3yED5BHth3EE8=;
 b=XrFSbuGJiWigui1gPNGmEo/qAwVK8yOQAXBrLxoj4JYk4ReqJTbqnRAsA98WoQ9oaZ
 DR6CdY8OWbWak3nqXoo1TYZb2D7jqZrMzX1RCA8gnbMYBBH65u0S5JJniJ6cRpB7+SK9
 z9M5TdU26+RUthYmSFlRW+eiF+xy0uwrleCfYCXIbyY11/t5pGS7qPlRROorGiHJP6Rw
 0ux0U/6ztFGkBEX8l8EB/nCyPw+k+l9F+glEctw1rjZoHKgwQ4cvZx2Nya5QO+whEnBl
 XYCNTKPIOBWMwwIbkH/ZIbnPBfDz8r/GQpHpZUoqBYsvZElHC7aq2Fnb3XCgcujNNu+k
 PWgg==
X-Gm-Message-State: AOAM531Vjovumci7Z2P9ajjPUIEnPkWtpEcTrkOpYEEGh1LOEov03nbH
 olkDaGAQSS+kMV3apAA0mDoMxjFKu6Av+Bt0Ygfxp1W0tBBsVg==
X-Google-Smtp-Source: ABdhPJyRSSwu/fXZpwOWb9PbbQDN2SucJ/Z3pJ3GPSqtm5fyS7O/knAwPvWu/fu3VvtFCd2Fz4E2+/3NTNhYY5/F8U0=
X-Received: by 2002:a2e:93c9:: with SMTP id p9mr2661168ljh.63.1642072079166;
 Thu, 13 Jan 2022 03:07:59 -0800 (PST)
MIME-Version: 1.0
References: <20220104073545.124244-1-o451686892@gmail.com>
 <CALAqxLVSaZywOOnF=67X+gu9eo+ZmKQmW3wUOOKEM0rUZ4K5gg@mail.gmail.com>
In-Reply-To: <CALAqxLVSaZywOOnF=67X+gu9eo+ZmKQmW3wUOOKEM0rUZ4K5gg@mail.gmail.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Thu, 13 Jan 2022 16:37:47 +0530
Message-ID: <CAO_48GHsoixQ8kpdMTnKy--jC+vphLEmf7L_1eDivRV=tdwZog@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: cma_heap: Fix mutex locking section
To: John Stultz <john.stultz@linaro.org>
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
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Weizhao Ouyang <o451686892@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Liam Mark <lmark@codeaurora.org>,
 linaro-mm-sig@lists.linaro.org, Laura Abbott <labbott@kernel.org>,
 christian.koenig@amd.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Weizhao,

On Tue, 4 Jan 2022 at 13:13, John Stultz <john.stultz@linaro.org> wrote:
>
> On Mon, Jan 3, 2022 at 11:36 PM Weizhao Ouyang <o451686892@gmail.com> wrote:
> >
> > Fix cma_heap_buffer mutex locking critical section to protect vmap_cnt
> > and vaddr.
> >
> > Fixes: a5d2d29e24be ("dma-buf: heaps: Move heap-helper logic into the cma_heap implementation")
> > Signed-off-by: Weizhao Ouyang <o451686892@gmail.com>
>
> Looks good to me!  Thanks so much for sending this in!
Thanks for the patch; it's merged to drm-misc-fixes.
>
> Acked-by: John Stultz <john.stultz@linaro.org>
>
> thanks again
> -john


Best,
Sumit.
