Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 370BD6CF115
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 19:31:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AB6210EBC9;
	Wed, 29 Mar 2023 17:30:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A11210EBC9;
 Wed, 29 Mar 2023 17:30:55 +0000 (UTC)
Received: by mail-oo1-xc2a.google.com with SMTP id
 m6-20020a4ae846000000b0053b9059edd5so2549944oom.3; 
 Wed, 29 Mar 2023 10:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680111054;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t2IPudqLQnBF6M0Cb+sHJqpiyOjjt5yWTuSQtgO57oM=;
 b=Q8+YeanEpf/SrDNg8nrGpxL7PTrLvQEfhSFAYYcuKvNSKqKuqGWknevyESHXx0I5Z/
 GMYJZY7b7Hug1vmkBmhqrFJe1N3TqVTi+7ReyDwouTGpW8X0Oi/abMeHBBLvNdHamwM5
 f8nKWOzxYcb4rvHJY91frT56FbwjrPAsdTJr/qkjlaLUoLD+bu8yN5rM2bm5Aao3ceJE
 iEAiGYsJ9e6i+O8NIHv+FzGB5U9TgTB3N3hUmRfhn0GLUtQ28aUKr5CoKv4H4/Lt6zJ2
 ZK4uXM4edeOazX08ps4D+8nSbotnxdQgEiQ1DjIJWCpKVF+dIDkRvH5rgSFufM1WHs2k
 GtTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680111054;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t2IPudqLQnBF6M0Cb+sHJqpiyOjjt5yWTuSQtgO57oM=;
 b=lf7dnFRbOj652F0cdBypMHQaLfSYAdbWlpcdOlhWj6LXjnn9zY5MkjYbxDxAWlF87v
 5JiinbRW5/78kL3Nk0wlaG57IP3fpAbo53+Slouq2I28h/eGauTyMtdMdt7E4t5V/vAM
 hOmeZq40KE9HoCoppqL2QPdW5lBwsKrg39KOhbboUrELhz16O4cGKQZMxHQxvnAB25LO
 kmH5Q2I6oO02qR49ZqirO+kKoraAmfK/jky7mpyh/hKWuGU8sraNsok+mmS9kFRmGCDb
 C2KcA1vc4ITklgdzVnRBcNpmys4dQAxEz7JfVPoWXm+SB/6brK3x2AjrMCqqu/ZPQyLi
 e+OA==
X-Gm-Message-State: AO0yUKXb/YSWwU6Ja8416eYFGaKMtdICfSARJM9YzyMsPvSSaJ56dB+r
 TZ2vSKPwi/RanVXDGrsOemVslRnMuwkptnYWWy4=
X-Google-Smtp-Source: AK7set/PYDGb/qktpF5+p6KZzT9FAS8IXhgUr0yK9clidh9mIEJ0n7X2fd4eNmJxGIBD6hMIGDshYwZ32Q4NpJTf6vU=
X-Received: by 2002:a4a:d0d4:0:b0:53b:57cf:d23c with SMTP id
 u20-20020a4ad0d4000000b0053b57cfd23cmr7236916oor.1.1680111054642; Wed, 29 Mar
 2023 10:30:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230329140445.2180662-1-konrad.dybcio@linaro.org>
 <ZCRNFitcrAeH27Pn@hovoldconsulting.com>
 <83986fa9-c9eb-ae5a-b239-584092f2cea5@linaro.org>
In-Reply-To: <83986fa9-c9eb-ae5a-b239-584092f2cea5@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 29 Mar 2023 10:30:43 -0700
Message-ID: <CAF6AEGsYimELcEAs8hdkYqdMzteMwzhPFavvmEUiEFsO01RrrQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/adreno: adreno_gpu: Use suspend() instead of
 idle() on load error
To: Konrad Dybcio <konrad.dybcio@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, Johan Hovold <johan@kernel.org>,
 dri-devel@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Nathan Chancellor <nathan@kernel.org>,
 "Joel Fernandes \(Google\)" <joel@joelfernandes.org>, agross@kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>, Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 29, 2023 at 8:48=E2=80=AFAM Konrad Dybcio <konrad.dybcio@linaro=
.org> wrote:
>
>
>
> On 29.03.2023 16:37, Johan Hovold wrote:
> > On Wed, Mar 29, 2023 at 04:04:44PM +0200, Konrad Dybcio wrote:
> >> If we fail to initialize the GPU for whatever reason (say we don't
> >> embed the GPU firmware files in the initrd), the error path involves
> >> pm_runtime_put_sync() which then calls idle() instead of suspend().
> >>
> >> This is suboptimal, as it means that we're not going through the
> >> clean shutdown sequence. With at least A619_holi, this makes the GPU
> >> not wake up until it goes through at least one more start-fail-stop
> >> cycle. Fix that by using pm_runtime_put_sync_suspend to force a clean
> >> shutdown.
> >
> > This does not sound right. If pm_runtime_put_sync() fails to suspend th=
e
> > device when the usage count drops to zero, then you have a bug somewher=
e
> > else.
> I was surprised to see that it was not called as well, but I wasn't able
> to track it down before..
>
> >
> > Also since commit 2c087a336676 ("drm/msm/adreno: Load the firmware
> > before bringing up the hardware") the firmware is loaded before even
> > hitting these paths so the above description does not sound right in
> > that respect either (or is missing some details).
> ..but I did some more digging and I found that the precise "firmware"
> that fails is the ZAP blob, which is not checked like SQE in the
> commit you mentioned!
>
> Now I don't think that we can easily check for it as-is since
> zap_shader_load_mdt() does the entire find-load-authenticate
> dance which is required with secure assets, but it's obviously
> possible to rip out the find-load part of that and go on from
> there.
>
> Do you think that would be a better solution?

Hmm, to hit this it sounds like you'd need all the fw _except_ the zap
in the initrd?

BR,
-R

> Konrad
>
> >
> >> Test cases:
> >> 1. firmware baked into kernel
> >> 2. error loading fw in initrd -> load from rootfs at DE start
> >>
> >> Both succeed on A619_holi (SM6375) and A630 (SDM845).
> >>
> >> Fixes: 0d997f95b70f ("drm/msm/adreno: fix runtime PM imbalance at gpu =
load")
> >> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> >> ---
> >>  drivers/gpu/drm/msm/adreno/adreno_device.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/=
drm/msm/adreno/adreno_device.c
> >> index f61896629be6..59f3302e8167 100644
> >> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> >> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> >> @@ -477,7 +477,7 @@ struct msm_gpu *adreno_load_gpu(struct drm_device =
*dev)
> >>      return gpu;
> >>
> >>  err_put_rpm:
> >> -    pm_runtime_put_sync(&pdev->dev);
> >> +    pm_runtime_put_sync_suspend(&pdev->dev);
> >>  err_disable_rpm:
> >>      pm_runtime_disable(&pdev->dev);
> >
> > Johan
