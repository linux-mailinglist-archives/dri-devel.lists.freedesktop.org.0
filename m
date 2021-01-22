Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B62B030100D
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jan 2021 23:35:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6E5D6EA6B;
	Fri, 22 Jan 2021 22:35:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85ECA89E35
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jan 2021 22:35:21 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id a8so9707289lfi.8
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jan 2021 14:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TVHHWido/EH2Vt59qdy1Zby/ZP47wr14BUSPLPmA0j4=;
 b=vRtzT2R7AO6c4k2leJdr9LSRmXNc6Xyl/1AF/P7bdVFSKXBE97fAh73Oss8ZhECx99
 tUmbI1ES3YH2WefY9ABfgwQpDa6Yk2uICzg9wT2S8oBIb7MsV5E4Ohx26IanqF6f/8lY
 ZZKGvs+Fjlfs3zVa8b6/TjZam2qMpcoJEO1oIlZRiY37NWIfIp8j89KenGVwyuV45bIB
 4oFqn+/7bkNaGaniA5pcfuPjBIej3sTakGYOkVyxozrrICb83JvbcP71N/2iYpi6nNjW
 4oEk04IiHcpIffCzEs3r5v0MJvgPra/+0VbZxFschKo/9/xGNdHScf9vQ6WQWusHo/NJ
 Do3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TVHHWido/EH2Vt59qdy1Zby/ZP47wr14BUSPLPmA0j4=;
 b=GGazVDGIUPBQhbiVNDdRBlbzlHmbr4yDqAB1SuwiG+/064JGBXzjpR70L7HrGNDXZX
 fyDtzOBGlN0C3ua/yHhKAzE9SSwnYmoYN1d06bJVMUbgLx2zSu+obd/QYYsZc75b81I0
 hxUOggFKqYcna2ruWXPgxh9JTCq3xCLJV+kF+PCzsFfjxZojG16LdLWw1T0GZ6+ChyFu
 G/UBmAabZh6tm02QSd/olMHc9rC00T9SvSSwS76M5JOeZ/uZGzvdw3eTv9Td6ova7EQG
 isZAvlVvWeZ+J/3gd/bEbPgMGXLSUU0whkuFQYKNQy9HrqI2RVFRU+yBPYOc9ieTH9F5
 eobQ==
X-Gm-Message-State: AOAM53172mqKRiRW999iNis5mJ/2DTdB9WSGLJj6iV2+WFx2G8OD2I8w
 igcMmAQ/PN+IC/ZoHSUZJmNKEohxgtEih1k8u/IglQ==
X-Google-Smtp-Source: ABdhPJy1BnxeBPTkzgt4QScOHWd/QI0f84MDBJMyCAHwV8LfTy+jZGVeA/xcg+uD8cA806qlu/XHkmck+4PXwcqcImg=
X-Received: by 2002:a19:48d0:: with SMTP id v199mr2069375lfa.535.1611354919948; 
 Fri, 22 Jan 2021 14:35:19 -0800 (PST)
MIME-Version: 1.0
References: <20210119204508.9256-1-john.stultz@linaro.org>
 <20210119204508.9256-2-john.stultz@linaro.org>
 <CAO_48GEYGzY8cZybwrXgfODhuoAJqi4AvwbZbWd+PiYjMqKYpw@mail.gmail.com>
 <CAJuCfpGRkM+h16SJp7gJOaAhy+gFw1-++WP8kavOjRj3MHcpBQ@mail.gmail.com>
In-Reply-To: <CAJuCfpGRkM+h16SJp7gJOaAhy+gFw1-++WP8kavOjRj3MHcpBQ@mail.gmail.com>
From: John Stultz <john.stultz@linaro.org>
Date: Fri, 22 Jan 2021 14:35:07 -0800
Message-ID: <CALAqxLW-Z3-Zcwkeuard5vfU_bAZkRRsAo2fX=3Wwp2-yURiuA@mail.gmail.com>
Subject: Re: [RESEND][PATCH 2/3] dma-buf: heaps: Add a WARN_ON should the
 vmap_cnt go negative
To: Suren Baghdasaryan <surenb@google.com>
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
Cc: Sandeep Patil <sspatil@google.com>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Ezequiel Garcia <ezequiel@collabora.com>, James Jones <jajones@nvidia.com>,
 lkml <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 Laura Abbott <labbott@kernel.org>, Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Hridya Valsaraju <hridya@google.com>,
 =?UTF-8?Q?=C3=98rjan_Eide?= <orjan.eide@arm.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Daniel Mentz <danielmentz@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 22, 2021 at 2:21 PM Suren Baghdasaryan <surenb@google.com> wrote:
> On Thu, Jan 21, 2021 at 11:56 PM Sumit Semwal <sumit.semwal@linaro.org> wrote:
> > On Wed, 20 Jan 2021 at 02:15, John Stultz <john.stultz@linaro.org> wrote:
> > >
> > > We shouldn't vunmap more then we vmap, but if we do, make
> > > sure we complain loudly.
> >
> > I was checking the general usage of vunmap in the kernel, and I
> > couldn't find many instances where we need to WARN_ON for the vunmap
> > count more than vmap count. Is there a specific need for this in the heaps?
>
> Hi Sumit,
> My worry was that buffer->vmap_cnt could silently go negative. But if
> this warning is not consistent with other places we do refcounted
> vmap/vunmap then feel free to ignore my suggestion.
>

Yea,
 My sense is that it didn't seem like it would hurt, and if the
warning happened to be tripped, it would be good to catch.

However, if you are skeptical, feel free to drop that patch from this
series for now (it shouldn't impact the following patches).

thanks
-john
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
