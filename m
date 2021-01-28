Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5254E307ECE
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 20:45:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D97D26EA1C;
	Thu, 28 Jan 2021 19:44:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2C866E115
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 11:12:46 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id q5so4835535ilc.10
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 03:12:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/WJw1aJ983EEKpRj5gZ4zFlUrwFHoMadbviHbndDVT8=;
 b=dfDCHTrz8XskJkazSFR/d269ImWmkT6WKjpQ1j4AVPkVQ0H4j5zdogEiMZAuBs2Nuq
 PLm6Pn+zV760awkBSwTDMSe/TivqPc3s/134zz9sRbBQABFJfAnM4SjROF9bDhhkPFXx
 dFFpptCksPnvkPoUioIRniNKaaMkEX+xcGyNg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/WJw1aJ983EEKpRj5gZ4zFlUrwFHoMadbviHbndDVT8=;
 b=S0wH+oHcUcm2F4+2VcCpYBX50GH8A5QMBV7I/n6FdmjFwUy431GWyPUEagME+cuLkL
 QeWJKAVnCykB+LlHWYicyZpA8iqWTR8eXtKrXM6BjwkivNwB2NnFULjqsFo+Unqy7JY4
 ixIfecu3sS3GQPss8wLwBR/Zpd/9G8vO/wQj4IqReaTDdAdxoRFgdn53xg3tz/CTTJyy
 dd+/SsqFTs+JAOAisHzRFq0mRWnfIzl4ix9N51Jv/thg9V0oxt3iWn6x3Xph4dauW21q
 s8wgUK7eHHE8HG4BGCCM4pxzDSqjKfDR6U93I0R9vzQqlLYMMTLLAWvwB8++YB1/Z9jQ
 b+GA==
X-Gm-Message-State: AOAM5328r1p+OYMCLw4J66MWk2h7oQL+3VZrdW4NmJonVHAm5db/zVsI
 5i6TEnH8zjzowzkSh82IqhSfHmbgua6JXuwB3bkNYQ==
X-Google-Smtp-Source: ABdhPJxpvtqvyRoNVw2J32fCidzTHWv4s/97L1l2P7XY3BFLhw9LEXqsuGOgsssZ07Bdcb7TGzMR023+FxP+UJYso4w=
X-Received: by 2002:a05:6e02:509:: with SMTP id
 d9mr12671592ils.150.1611832366253; 
 Thu, 28 Jan 2021 03:12:46 -0800 (PST)
MIME-Version: 1.0
References: <20210128072802.830971-1-hsinyi@chromium.org>
 <20210128072802.830971-4-hsinyi@chromium.org>
 <1611820251.16091.7.camel@mtksdaap41>
In-Reply-To: <1611820251.16091.7.camel@mtksdaap41>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 28 Jan 2021 19:12:20 +0800
Message-ID: <CAJMQK-igcZXrnTb6pA3S6X_uTF6aGhKFLAHtdet62od9vVx4rg@mail.gmail.com>
Subject: Re: [PATCH v11 3/9] drm/mediatek: add RDMA fifo size error handle
To: CK Hu <ck.hu@mediatek.com>
X-Mailman-Approved-At: Thu, 28 Jan 2021 19:44:35 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Devicetree List <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 28, 2021 at 3:52 PM CK Hu <ck.hu@mediatek.com> wrote:
>
> Hi, Hsin-Yi:
>
> On Thu, 2021-01-28 at 15:27 +0800, Hsin-Yi Wang wrote:
> > From: Yongqiang Niu <yongqiang.niu@mediatek.com>
> >
> > This patch add RDMA fifo size error handle
> > rdma fifo size will not always bigger than the calculated threshold
> > if that case happened, we need set fifo size as the threshold
> >
> > Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_disp_rdma.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> > index b84004394970f..04b9542010b00 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> > @@ -168,6 +168,10 @@ void mtk_rdma_config(struct device *dev, unsigned int width,
> >        * account for blanking, and with a pixel depth of 4 bytes:
> >        */
> >       threshold = width * height * vrefresh * 4 * 7 / 1000000;
> > +
> > +     if (threshold > rdma_fifo_size)
> > +             threshold = rdma_fifo_size;
> > +
>
> Please see the discussion in [1].
>
> [1]
> https://patchwork.kernel.org/project/linux-mediatek/patch/1607591262-21736-6-git-send-email-yongqiang.niu@mediatek.com/
>
> Regards,
> CK
>

Hi CK,

Even if we set threshold to
threshold = RDMA_FIFO_PSEUDO_SIZE(rdma_fifo_size) * width * height *
vrefresh / 2 / MAX_WIDTH / MAX_HEIGHT / MAX_VREFRESH;

I'm not sure what value MAX_WIDTH, MAX_HEIGHT, and MAX_VREFRESH should
set to for each SoC.
Since there's no conclusion yet, I'll drop this patch in the series,
as this seems not an mt8183 specific fix.


> >       reg = RDMA_FIFO_UNDERFLOW_EN |
> >             RDMA_FIFO_PSEUDO_SIZE(rdma_fifo_size) |
> >             RDMA_OUTPUT_VALID_FIFO_THRESHOLD(threshold);
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
