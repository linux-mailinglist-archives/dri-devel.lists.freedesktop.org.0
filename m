Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B65A26973A2
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 02:28:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68D6210E9FE;
	Wed, 15 Feb 2023 01:28:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 438B110E670;
 Wed, 15 Feb 2023 01:28:36 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id bh15so14576780oib.4;
 Tue, 14 Feb 2023 17:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wP7ZSWKSYiSNh4//0LGY48SytGVZ1Q61Ky7oicSasw4=;
 b=dChf08Fgnzc/7i6cHdWw4ZCN8pOkax0iU+IhPt21tPCgPwuXypoS40QqLbiAv/33P8
 /3K6c9U99sy0+Gx2dYpPoxWKvQKpZkuOlJ0SeeZQYbJC0lXEaAAXc92slmCULAKqBRSI
 PKQWWXZ90P4WZY9iZJx6zI2Lk6OelHvcgkQXxGBMuVKTasv+qKRcNSgV7Og3tsPQMPCN
 im5nOOY8X8jOROq8eTUDRr0lmjhVgmnHtfhLdzks8zgWdJc/7/bLgwOOAhy3X8lKliCs
 P8R6uQntT9k6532jw0Qr1bDlMapQ3R9JwbNo61VTJILAf3rla3wOUk1F+dUccL+8kzsm
 bvtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wP7ZSWKSYiSNh4//0LGY48SytGVZ1Q61Ky7oicSasw4=;
 b=seOqO1tHh5JfZ4iexCaBrl0n4RrVzb+83zxCc8AP8n3sgHUaQqvkBX/SJa0PiUkx3F
 3+fBkrOmQCFs1jAZ8F8hMrfj0GxCxNUvCVeHn3Bc/y6rgHSFgGvYNkulEsjf/Ti21NOt
 qOnKFXPZDcethmjdy3ujfDcJC5xD8LetWZngH8EAiKGcZ9hq0x22JkUorjtyDDw6czfR
 etT6mT+Qa5biGgPNbQ1yef5lkQ84++nfmtIOC1wPclMBCtIB4ZSMnRAoT26a2ua6yc0d
 BYSLYPPsOUhOrr7P5Wl4XONhoRJloFARqdztZwqJDnGygRqTq42qKd3x/K3Qu3X+DQKX
 v19A==
X-Gm-Message-State: AO0yUKUy+E5+niNez3DiRgoORgBKlMvSDMAznZtbu7aXVISG3F1MAihJ
 3wF+vppzP6BGoekPii0uTUJ1W1Ub6btvrdkgkVI=
X-Google-Smtp-Source: AK7set/EfopdPMu3y6nt7yUm2rlRHgHLya+Z6RM5IvHr0a1MZI40AQ50Jr0ypH+faKcjsdOkWLzLFYp9mgf3o4zXExM=
X-Received: by 2002:aca:d743:0:b0:37d:81a9:5103 with SMTP id
 o64-20020acad743000000b0037d81a95103mr52567oig.38.1676424515344; Tue, 14 Feb
 2023 17:28:35 -0800 (PST)
MIME-Version: 1.0
References: <20230214173145.2482651-1-konrad.dybcio@linaro.org>
 <20230214173145.2482651-11-konrad.dybcio@linaro.org>
 <CAF6AEGva3ecxTOx3Yb+Wh-1K=jYA3tDo_aXg09jS9pzJupYExQ@mail.gmail.com>
 <a4627ca5-46e6-2f32-c0e2-a85990e02f54@linaro.org>
 <1c57fcfd-8e94-649b-df6f-655626f94454@linaro.org>
In-Reply-To: <1c57fcfd-8e94-649b-df6f-655626f94454@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 14 Feb 2023 17:28:50 -0800
Message-ID: <CAF6AEGs=7TxfUPOu1aP09WsehCwYHnZE_oDoZ3KOzrqY=NDrbA@mail.gmail.com>
Subject: Re: [PATCH v2 10/14] drm/msm/a6xx: Fix up A6XX protected registers
To: Konrad Dybcio <konrad.dybcio@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 agross@kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 marijn.suijten@somainline.org, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 14, 2023 at 4:38 PM Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
>
>
> On 15.02.2023 01:10, Dmitry Baryshkov wrote:
> > On 14/02/2023 23:56, Rob Clark wrote:
> >> On Tue, Feb 14, 2023 at 9:32 AM Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
> >>>
> >>> One of the protected ranges was too small (compared to the data we
> >>> have downstream). Fix it.
> >>>
> >>> Fixes: 408434036958 ("drm/msm/a6xx: update/fix CP_PROTECT initialization")
> >>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> >>> ---
> >>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
> >>>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >>> index 503c750216e6..d6b38bfdb3b4 100644
> >>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >>> @@ -690,7 +690,7 @@ static const u32 a6xx_protect[] = {
> >>>          A6XX_PROTECT_NORDWR(0x00800, 0x0082),
> >>>          A6XX_PROTECT_NORDWR(0x008a0, 0x0008),
> >>>          A6XX_PROTECT_NORDWR(0x008ab, 0x0024),
> >>> -       A6XX_PROTECT_RDONLY(0x008de, 0x00ae),
> >>> +       A6XX_PROTECT_RDONLY(0x008d0, 0x00bc),
> >>
> >> Nak, this is intentional, we need userspace to be able to configure
> >> the CP counters.  Otherwise this would break fdperf, perfetto, etc
> >>
> >> (although maybe we should comment where we diverge from downstream)
> >
> > Yes, please. Otherwise it is extremely hard to understand the reason for diversion between the vendor driver and our one.
> +1
>
> I am content with dropping this patch from this series, so long
> as you leave a clue for others to not scratch their heads on this!

Yeah, I admit it is kinda a trap as-is.  And makes things less obvious
what to do when porting from downstream.  When I get a few minutes
I'll double check that there weren't any other exceptions (I don't
think they were but it has been a while) and add some comments.

BR,
-R

> Konrad
> >
> >>
> >> BR,
> >> -R
> >>
> >>>          A6XX_PROTECT_NORDWR(0x00900, 0x004d),
> >>>          A6XX_PROTECT_NORDWR(0x0098d, 0x0272),
> >>>          A6XX_PROTECT_NORDWR(0x00e00, 0x0001),
> >>> --
> >>> 2.39.1
> >>>
> >
