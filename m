Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B77D6565D86
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 20:40:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFFA992ACC;
	Mon,  4 Jul 2022 18:40:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0EC8927A7
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jul 2022 18:40:51 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id e40so12699527eda.2
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Jul 2022 11:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FxRBS06pE2CQHpTgzqatJymLAXpPxBjp9lWephyRcDY=;
 b=ZzhWOBgJ0GXukDvteK8pJ1ErEi30xPBI7PuEbXANjYY+GfjMg8DGZmihDOeq55CeNv
 B3EiHByVuVltQhnfQsGWQ6tM991OfExy7KSZm7UHWTy/AAlMJfLRe3S9xBf1Mu8+JvYE
 6jlc7j6DzV70SzlqcJIeDFOI+9bgZcBZj48GnHQb1TJCKiJObYNEQpaTyHq4xVFnXTgs
 Zb4oMM6tMTl/XzmH4/O+/jGX0nS2ogif4uIKXLt3Mgahojcge6y+TRPbPnxM+sTenBqt
 mkEy00pY5fntyEdKWymMdJmhxCgNjgZzPSNUHc3CFQAye9q10oBCd3jprGZJJcQjwxWP
 Vp4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FxRBS06pE2CQHpTgzqatJymLAXpPxBjp9lWephyRcDY=;
 b=ErDwpA47cgBe4JCWFEb57h2IseDabh1y2LfZhj3dEyR5QhpTeyggaC0SnzxmGcpjUz
 R+3BDUwAkze08PajEPgWjS++SGwq9gZAIYZ0mhPPzkO2dltYs8lE2gGhNvt14rPbArxn
 IxIdXNU/dW+NW6tdsSN116kB1aAXolYY7OGTNIp1hBdAuPaDUphwMJ4L0V0aQb/Qp/bt
 C27upe4saz++8qYchA6zW3tT9vfxvNlbfsFn2PFrBZ+6BZpQpyzpHsv4zHgd/9qONlSQ
 k0kFb2OJDucQ6jgNxw/AxpxjJotvog5LErA69RZhhScXuuqz+1Yn+8O2yHaBtaHVR722
 gZdw==
X-Gm-Message-State: AJIora8hVTDTYb7dfiQeRc+Vuzxaf5pZThl1gsQ8AcG0bxUU2qfAkhRH
 gNSSA+QvKBlrV6iFZh12eabuFnFebtVw+C3vH6S7Ig==
X-Google-Smtp-Source: AGRyM1v61sLa0Q+4hwdTmFbbx9mwGhQVVpp9ymXC4i+qg4KlnAe+6zmh0YCXopnDMl6JRzNEZMVijDCYhENkXwVUQC4=
X-Received: by 2002:aa7:cdc2:0:b0:43a:7255:5274 with SMTP id
 h2-20020aa7cdc2000000b0043a72555274mr1955839edw.159.1656960050072; Mon, 04
 Jul 2022 11:40:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220518065856.18936-1-hbh25y@gmail.com>
 <dc52f807-f4bc-13d6-7b9e-81b4fe94a6e0@intel.com>
 <fe6fe929-578e-5828-7886-3fe69b9d3a6a@gmail.com>
In-Reply-To: <fe6fe929-578e-5828-7886-3fe69b9d3a6a@gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 4 Jul 2022 20:40:38 +0200
Message-ID: <CAG3jFytopyV+gN3QAVAZYd_HYWeAygTZkb7iQAA-jmSBMQexfw@mail.gmail.com>
Subject: Re: [PATCH] drm: bridge: sii8620: fix possible off-by-one
To: Hangyu Hua <hbh25y@gmail.com>
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
Cc: architt@codeaurora.org, jonas@kwiboo.se, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, narmstrong@baylibre.com,
 linux-kernel@vger.kernel.org, jernej.skrabec@gmail.com,
 Laurent.pinchart@ideasonboard.com, Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 23 Jun 2022 at 04:55, Hangyu Hua <hbh25y@gmail.com> wrote:
>
> On 2022/5/18 15:57, Andrzej Hajda wrote:
> >
> >
> > On 18.05.2022 08:58, Hangyu Hua wrote:
> >> The next call to sii8620_burst_get_tx_buf will result in off-by-one
> >> When ctx->burst.tx_count + size == ARRAY_SIZE(ctx->burst.tx_buf). The
> >> same
> >> thing happens in sii8620_burst_get_rx_buf.
> >>
> >> This patch also change tx_count and tx_buf to rx_count and rx_buf in
> >> sii8620_burst_get_rx_buf. It is unreasonable to check tx_buf's size and
> >> use rx_buf.
> >>
> >> Fixes: e19e9c692f81 ("drm/bridge/sii8620: add support for burst eMSC
> >> transmissions")
> >> Signed-off-by: Hangyu Hua <hbh25y@gmail.com>
> > Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
> >
> > Regards
> > Andrzej
> >> ---
> >>   drivers/gpu/drm/bridge/sil-sii8620.c | 4 ++--
> >>   1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/bridge/sil-sii8620.c
> >> b/drivers/gpu/drm/bridge/sil-sii8620.c
> >> index ec7745c31da0..ab0bce4a988c 100644
> >> --- a/drivers/gpu/drm/bridge/sil-sii8620.c
> >> +++ b/drivers/gpu/drm/bridge/sil-sii8620.c
> >> @@ -605,7 +605,7 @@ static void *sii8620_burst_get_tx_buf(struct
> >> sii8620 *ctx, int len)
> >>       u8 *buf = &ctx->burst.tx_buf[ctx->burst.tx_count];
> >>       int size = len + 2;
> >> -    if (ctx->burst.tx_count + size > ARRAY_SIZE(ctx->burst.tx_buf)) {
> >> +    if (ctx->burst.tx_count + size >= ARRAY_SIZE(ctx->burst.tx_buf)) {
> >>           dev_err(ctx->dev, "TX-BLK buffer exhausted\n");
> >>           ctx->error = -EINVAL;
> >>           return NULL;
> >> @@ -622,7 +622,7 @@ static u8 *sii8620_burst_get_rx_buf(struct sii8620
> >> *ctx, int len)
> >>       u8 *buf = &ctx->burst.rx_buf[ctx->burst.rx_count];
> >>       int size = len + 1;
> >> -    if (ctx->burst.tx_count + size > ARRAY_SIZE(ctx->burst.tx_buf)) {
> >> +    if (ctx->burst.rx_count + size >= ARRAY_SIZE(ctx->burst.rx_buf)) {
> >>           dev_err(ctx->dev, "RX-BLK buffer exhausted\n");
> >>           ctx->error = -EINVAL;
> >>           return NULL;
> >
>
> Hi guys,
>
> Another patches for this module that I submitted at the same time as
> this one have been merged. Is this patch forgotten to merge?

Applied to drm-misc-next.
