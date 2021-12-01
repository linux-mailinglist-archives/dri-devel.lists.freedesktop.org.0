Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5BE464B42
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 11:09:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FF9A6EAC6;
	Wed,  1 Dec 2021 10:09:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3656F6EAC6
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Dec 2021 10:09:31 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id 13so46977973ljj.11
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Dec 2021 02:09:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OUz5GIJwWhsCyqmvdwiSMp+8PenKcEyq20yCWjGw6oo=;
 b=h0Fitg9dKp6Gl/4ZI0YCCzy6luvo1s9aJSiGf6y033HzRqpc5bZcL22MlRCxP3mbCw
 qaFmDSHUWkmclJFd6Gfp/IFpPuiU7sHzEXpo7ODUC+M3ObKQBAze5n0u8m5zdnSf40pd
 rWicWAkANUpI3/KhOCbjO6u0XEmS6Zjz6t6xbahAOXpcxxGSwPHx2ZvT9rC83GjQ/Jyi
 Zs4Tb/H/YaHN/WStBxRlcFz1073veJYxBn+ifRYQ4WrGuao/yfclD+EQY65wwJ1LSDgT
 t35ruCeNnZ7SL3r0UrUHhEBHvQHgn/B3WNXWOVMGwWma20ykKSLR2Leaqfo+hPq4XYAq
 HpsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OUz5GIJwWhsCyqmvdwiSMp+8PenKcEyq20yCWjGw6oo=;
 b=smXfYzBb4Pmiah+HLFAc+bTmQtKeV4tXv3L4TwE+nJWAfxn8ziAhL9VVkjboUYep4/
 G9Zu295THykf6mJhsEWgfw+BInJ3H5vWQ2rGIiOIZuifRPlH56VNFa4NEzpBezIJMc+2
 eMiRHaLJATrLa0MGEeTMp7NF4mnLWe1+7WXDVW3ZRtzQ8vsrRXT5V+Vw6pE5yFmiM4Uf
 TJ8h/rzBKKuKra/C+4p4SqJARqRM4gLgT2RrnLg+osAqKJeqj7WEZJSf/qqufr3rmqXi
 87ye5617hmpZ1PRn3815HRmqGtK7+84x1LDTuzPFzm4J60NRTzXIq2boC7KOp7oOR3Kk
 fEDw==
X-Gm-Message-State: AOAM532bO0c7UgE1l/pj/bmtnG2b+6QbrQyPNvQcSGcBfguHQ0o3EN9d
 yljkenF5Zjh/F2QCdyyNPHjizdafxTF9FeGBq5VGqw==
X-Google-Smtp-Source: ABdhPJzDsJHqm+aHiy+lkIXP5Ar3k9o7SMl/nP/3Xx3p2ShJFSukJaXUE1CMRVgy9JAkWUv59xYkYWSvKKpQZ+pGyjE=
X-Received: by 2002:a2e:5850:: with SMTP id x16mr4763005ljd.122.1638353369362; 
 Wed, 01 Dec 2021 02:09:29 -0800 (PST)
MIME-Version: 1.0
References: <YaB/JHP/pMbgRJ1O@kroah.com>
 <20211126074904.88388-1-guangming.cao@mediatek.com>
 <CALAqxLVF1BPznzwjem2BcsDDoo5gMoBqjKEceZDLJan4zCtk3w@mail.gmail.com>
In-Reply-To: <CALAqxLVF1BPznzwjem2BcsDDoo5gMoBqjKEceZDLJan4zCtk3w@mail.gmail.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Wed, 1 Dec 2021 15:39:17 +0530
Message-ID: <CAO_48GHxanR=-mN232ANwxQEiBo9zb3WjvO-6WmP6eFYWA1M5A@mail.gmail.com>
Subject: Re: [PATCH v4] dma-buf: system_heap: Use 'for_each_sgtable_sg' in
 pages free flow
To: John Stultz <john.stultz@linaro.org>
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
Cc: guangming.cao@mediatek.com, wsd_upstream@mediatek.com,
 kuan-ying.lee@mediatek.com, greg@kroah.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-mediatek@lists.infradead.org, lmark@codeaurora.org,
 benjamin.gaignard@linaro.org, matthias.bgg@gmail.com, stable@vger.kernel.org,
 labbott@redhat.com, robin.murphy@arm.com, christian.koenig@amd.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Guangming,

On Mon, 29 Nov 2021 at 23:35, John Stultz <john.stultz@linaro.org> wrote:
>
> On Thu, Nov 25, 2021 at 11:48 PM <guangming.cao@mediatek.com> wrote:
> >
> > From: Guangming <Guangming.Cao@mediatek.com>
> >
> > For previous version, it uses 'sg_table.nent's to traverse sg_table in =
pages
> > free flow.
> > However, 'sg_table.nents' is reassigned in 'dma_map_sg', it means the n=
umber of
> > created entries in the DMA adderess space.
> > So, use 'sg_table.nents' in pages free flow will case some pages can't =
be freed.
> >
> > Here we should use sg_table.orig_nents to free pages memory, but use th=
e
> > sgtable helper 'for each_sgtable_sg'(, instead of the previous rather c=
ommon
> > helper 'for_each_sg' which maybe cause memory leak) is much better.

Thanks for catching this and the patch; applied to drm-misc-fixes.
> >
> > Fixes: d963ab0f15fb0 ("dma-buf: system_heap: Allocate higher order page=
s if available")
> > Signed-off-by: Guangming <Guangming.Cao@mediatek.com>
> > Reviewed-by: Robin Murphy <robin.murphy@arm.com>
> > Cc: <stable@vger.kernel.org> # 5.11.*
>
> Thanks so much for catching this and sending in all the revisions!
>
> Reviewed-by: John Stultz <john.stultz@linaro.org>


Best,
Sumit.

--=20
Thanks and regards,

Sumit Semwal (he / him)
Tech Lead - LCG, Vertical Technologies
Linaro.org =E2=94=82 Open source software for ARM SoCs
