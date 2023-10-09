Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B71BF7BD161
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 02:09:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EFA810E1DB;
	Mon,  9 Oct 2023 00:09:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3E5B10E19F;
 Mon,  9 Oct 2023 00:09:09 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-53627feca49so6611710a12.1; 
 Sun, 08 Oct 2023 17:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696810148; x=1697414948; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9OeAouwbiIW3oa603x3NICDHKjYzU+b9TyziED7iPnQ=;
 b=Gl2vBR8CCr0uTOaY8QCBo1Yyxm8nqjwlcaQzlIDHRLZhGuIzkQ6XZMOc8oMwvtyTZ4
 wO1tN0MvIhFISiXXKey4m1Nobrg7CV5OeOtT+WTpEriUrLlHoWVmn+Y3Fgy9NU4KOmLW
 4x8Bc7UT/9b/gBzsiNwHNsEE1mMDYHrrclD0zff39+QwQ1EumsAzyjHc6Z7nMJAM97yH
 P3sl/J2E40OAOASyXvVIYpo5oSef7LtMPOOGvYmG/XmLQ7nPfbTAos5nFhtFxTprfX1O
 sALyRrAtj5jScmd80+yqL8pEZAE5Tr7OktdnlXdKTUPAZjB67kwzMwTxKCw1WoOUtM7V
 vIrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696810148; x=1697414948;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9OeAouwbiIW3oa603x3NICDHKjYzU+b9TyziED7iPnQ=;
 b=OKqIpVtg/9Dg1K+fPejal+pK9Eby6UxGf9oEcvMEejL2hM0h7LV8ooHVKI+q9013hv
 ZF9Ho3m5C0+QDv/MIZ92khjdid9Ez1z2T6yFe2knFMlDbI2ELiOaFnIOJ6qZMZqCH27l
 Gc3tsAdeKjnPtsWw+NAs14W2qGOEGtlLjrE/TCj8go9mygJplp72kGvR/Fwvm51JpzMK
 NRTrzqHstd4Op8lhGt1DtotrApFJRYpyfll8HN8MqOvMqI6VFLxSyZSpB+GLt8c9UId3
 MjcBQva1TLmFQYPCo/6pKkb+ClVYpTTFo35NImfKPURvy3Y6Kqj3GYCtYIgOzxH6PnzU
 cJnQ==
X-Gm-Message-State: AOJu0YxpwKtwAVmU5xf6SsP18v1TKltEa1GmD/zT2UVieL1esFctS+nI
 ECURpeCspZirymhvrDF6r19csO0Zs+gDBgsdQSA=
X-Google-Smtp-Source: AGHT+IEmRGETHMC0oZivK2NW82/PXGmCkgOWv6RewoLXm/o/GSIZ8n2ZVNbmKSZMKbASRhS9km/BFJ9w09k2uM9DQC8=
X-Received: by 2002:aa7:da44:0:b0:532:aaca:d39d with SMTP id
 w4-20020aa7da44000000b00532aacad39dmr11921076eds.6.1696810147764; Sun, 08 Oct
 2023 17:09:07 -0700 (PDT)
MIME-Version: 1.0
References: <20231008175615.413497-1-robdclark@gmail.com>
 <CAA8EJppgUmkLrhTw779tq5wkgXfu4sypGrQbJFYtrnCrbwa3=Q@mail.gmail.com>
 <526457dd-37f2-467d-b583-b710a5e84b97@collabora.com>
In-Reply-To: <526457dd-37f2-467d-b583-b710a5e84b97@collabora.com>
From: Rob Clark <robdclark@gmail.com>
Date: Sun, 8 Oct 2023 17:08:55 -0700
Message-ID: <CAF6AEGukUgPfa2h17oNt9QEP7b6AqUWR5EwK3bP3W9tj6yX2Lg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: Use the encoder for default CRC source
To: Helen Koike <helen.koike@collabora.com>
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Daniel Stone <daniels@collabora.com>, linux-arm-msm@vger.kernel.org,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Vinod Polimera <quic_vpolimer@quicinc.com>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 open list <linux-kernel@vger.kernel.org>,
 Kalyan Thota <quic_kalyant@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Oct 8, 2023 at 4:21=E2=80=AFPM Helen Koike <helen.koike@collabora.c=
om> wrote:
>
>
>
> On 08/10/2023 16:59, Dmitry Baryshkov wrote:
> > On Sun, 8 Oct 2023 at 20:56, Rob Clark <robdclark@gmail.com> wrote:
> >>
> >> From: Rob Clark <robdclark@chromium.org>
> >>
> >> i-g-t expects the CRC to reflect any applied CTM.  But the layer mixer
> >> source is upstream of the DSPP, so it is before the CTM is applied.
> >>
> >> Switch the default source to 'encoder' instead so that the CRC is
> >> captured downstream of the DSPP.
> >>
> >> Signed-off-by: Rob Clark <robdclark@chromium.org>
> >> ---
> >>   drivers/gpu/drm/ci/xfails/msm-sc7180-fails.txt |  4 ----
> >>   drivers/gpu/drm/ci/xfails/msm-sc7180-skips.txt |  5 -----
> >>   drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt | 11 +----------
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c       |  6 +++---
> >
> > I'm not sure, if updating the CI skip list together with the
> > functional changs is a good idea, my preference would be towards two
> > separate patches.
>
> On the other hand, having both together in the same patch documents
> which tests this PATCH is fixing.

on the mesa side of things, where we have more experience with CI,
I've found updating expectations in same patch as code change to be
hugely useful.  I *might* end up dropping the xfails changes when I
apply this patch (because there are some dependencies on igt uprev and
I'm not sure we have enough CI runs to be confident about flakes) but
I definitely believe that we should be updating expectations along
with code changes.

BR,
-R

> Regards,
> Helen
>
> >
> > Nevertheless:
> >
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >
> >>   4 files changed, 4 insertions(+), 22 deletions(-)
> >
> >
