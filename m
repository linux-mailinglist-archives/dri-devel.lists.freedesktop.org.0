Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D3F3E5514
	for <lists+dri-devel@lfdr.de>; Tue, 10 Aug 2021 10:26:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B91C89DFE;
	Tue, 10 Aug 2021 08:26:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 028EC89DFE
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 08:26:31 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id z2so23068959lft.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 01:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=djm4DWbOF22GhsSvHwwgQ4MO8NZc/LJRB+Vb97tWuW0=;
 b=QtQSkDYS9w7avyA8UUAyR1p5yorxliXuFlS5AocLoZh8RLzymJJOhaznYtkRR1WTD5
 j0niLWf+G96pJbeqX2YyGUDJYSG2qwUgtzbhNIku7WnBVHtO0tXJcICn4+zeXuIcaVXD
 bENk6TgC1mpKQN/tMKlIEtmY6eWttigESp5KeiPIq2Fu6hrtyzz6vap2z7gtt3Nxzz7R
 bMlE5Kz4+ywpLvucwqdHorJd2b0uV/PvoQLrI5gSxvGXK1+yiGLSfLDqCpBDEqPSRzWP
 LtVW+VrAP/RKPjh+yxi0J30EbAP0w113KgYXaAjfM7j5dEo7FS/4XSaamI+59oW6Yc08
 Expw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=djm4DWbOF22GhsSvHwwgQ4MO8NZc/LJRB+Vb97tWuW0=;
 b=aIr6q04CYjWc6ax1K/OPhRtO8/9vL+fE9MeUwyDfJaVvw2CtrWX0bOHKyt7x+2GTKK
 fuRwDJkUXkzAaZR3nhGNR5vGaMDHAIB9LhLTDO6h5a/IjPZyBV4RxGhhdpSsnDj9xtX4
 jHqP2SgLHolVJrIeBmX16vuuFfuITYLEMUA4C/V84ftQDVm60J2u20b32ibIYFgV5yMK
 JH6tlmCd/TdAKpEU6rqrsmbHRVgu4+LOk9cztO3+PXhF38ScCZRI5IiDrzPm/MheG929
 6rm75/5LQySrqZAdxMzu5AKy24W3yOgEhVkwDLXAy3LOEyxwIan7cuYLEQ4XVqJ1APoy
 FYCw==
X-Gm-Message-State: AOAM530TglB1P2uDJPmyY4Ob57FLTnklKuikhGA3jMQvXBH2cXuMM0B2
 zhDSJ2zBGqBNYJCdzifYhlU+Ff8mbqoBDBd+IazpwA==
X-Google-Smtp-Source: ABdhPJy+8bv0DEw5D+Cldh+36uB+ypSXDqcR8YNnjehpz758RYuy1Hyme5gswVLwUSfvXz0sBmBXuqjPuDWoFcXT1Lo=
X-Received: by 2002:a05:6512:1141:: with SMTP id
 m1mr20542919lfg.492.1628583990192; 
 Tue, 10 Aug 2021 01:26:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210722190747.1986614-1-hridya@google.com>
 <CALAqxLVLMt7rbJBQtFBw-ikBAjKrVgfS8=Nu6NFQbp_gq1m22Q@mail.gmail.com>
 <CA+wgaPOQmY4H9n302YspKuLk9iq9vBzdWBTu19EUUsiQYTUOzQ@mail.gmail.com>
In-Reply-To: <CA+wgaPOQmY4H9n302YspKuLk9iq9vBzdWBTu19EUUsiQYTUOzQ@mail.gmail.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Tue, 10 Aug 2021 13:56:19 +0530
Message-ID: <CAO_48GG_=zA39iUzzHD-2b1ktqrTCZ3k8z8V12x48u4SS30_TQ@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: heaps: Set allocation limit for system heap
To: Hridya Valsaraju <hridya@google.com>
Cc: John Stultz <john.stultz@linaro.org>, Liam Mark <lmark@codeaurora.org>, 
 Laura Abbott <labbott@redhat.com>, Brian Starkey <Brian.Starkey@arm.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 linux-media <linux-media@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 lkml <linux-kernel@vger.kernel.org>, 
 Android Kernel Team <kernel-team@android.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Hridya,

Apologies for the delay in responding;


On Wed, 4 Aug 2021 at 03:09, Hridya Valsaraju <hridya@google.com> wrote:
>
> On Mon, Aug 2, 2021 at 7:18 PM John Stultz <john.stultz@linaro.org> wrote=
:
> >
> > On Thu, Jul 22, 2021 at 12:07 PM Hridya Valsaraju <hridya@google.com> w=
rote:
> > > This patch limits the size of total memory that can be requested in a
> > > single allocation from the system heap. This would prevent a
> > > buggy/malicious client from depleting system memory by requesting for=
 an
> > > extremely large allocation which might destabilize the system.
> > >
> > > The limit is set to half the size of the device's total RAM which is =
the
> > > same as what was set by the deprecated ION system heap.
> > >
> > > Signed-off-by: Hridya Valsaraju <hridya@google.com>
> >
> > Seems sane to me, unless folks have better suggestions for allocation l=
imits.
> >
> > Reviewed-by: John Stultz <john.stultz@linaro.org>
>
> Thank you for taking a look John!
Looks good to me; I will apply it to drm-misc today.
>
> Regards,
> Hridya
>
> >
> > thanks
> > -john
Best,
Sumit.


--=20
Thanks and regards,

Sumit Semwal (he / him)
Tech Lead - LCG, Vertical Technologies
Linaro.org =E2=94=82 Open source software for ARM SoCs
