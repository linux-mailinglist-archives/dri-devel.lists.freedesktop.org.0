Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E38ED6C1EE3
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 19:02:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBE6710E2CB;
	Mon, 20 Mar 2023 18:02:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com
 [IPv6:2607:f8b0:4864:20::c29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E15D10E2CB;
 Mon, 20 Mar 2023 18:02:28 +0000 (UTC)
Received: by mail-oo1-xc29.google.com with SMTP id
 j15-20020a4ad18f000000b00535ed74d62cso2048979oor.5; 
 Mon, 20 Mar 2023 11:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679335348;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/v9R5gnCY6fdHFgH5PKyKB7qBIPOqi3I48b2pUQUxIw=;
 b=BEvixRIUWdZ++zol6HP2FDqAImpYFJVOYn8eoRuuKOqhwahmC5d/IShmuHYtg/dggD
 3EsPNGlgrzf3IyYJpLbYHXFu8OZRMdgljUUNnsAAatON5W6gxhe148gVIkWTWm1LpcyH
 NMPEIitAs2+d1b/13yFpAG73H34vLdQEFs9dWGgKvahbsID5XBZ7sV54H5Bh0ob34n+J
 7XPeZEITpNd+s7g0oQ0esjbgBy8GrSgN7cRPw1eCSlQaITl6H6mw4Fs3qheNGRszqgUW
 o4pRJqL6d/zZ4NpVHx3Tu6VHbn0IG7aG4hIKcvI2nNJ1QA5+tqQZ/XmnTgoHMBPvN5u+
 NmYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679335348;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/v9R5gnCY6fdHFgH5PKyKB7qBIPOqi3I48b2pUQUxIw=;
 b=qIn7ZjizCJW+ja/ibYdE7AcAa4AuGMaNXk5wS2AHogAaCLbWmer/B+uY7SIDJ2dE3o
 sQilQzBiQr+Xq1logoFNOSeBuq+MHl5LZjX7dHG1HaS2fsYzAiWvbPsnBKtGWjtguIH8
 NPec/NltixI49ukeHbZLxu6hEdtawgf2XOv5WZnOkrZRrsr8m95aC5NSuqLWNEe5HdVd
 rWRtQ/ob+BTgKh5DjGqQlXbcwK8wG5mIqrQvrlUuRPjBO5utWaIoR32P37LAcZmXlS6f
 br9KZoV8hBtz9cfavpWMfOTizSUCJBkW95bmed2SRZbfbDld1A1tO2rOr/7VEcrzwz4n
 AkCg==
X-Gm-Message-State: AO0yUKUlKBbAADvDfV6yN9Vk4KfDTQLP7kEgysgcZlngEPuqSNZyjVnx
 ehgTt4OztfhK4uw1kCfE9TN8gGKm7W8WNkk/K14=
X-Google-Smtp-Source: AK7set9AD56qu+Gun/6aRs1RMmgFg9rKa49NcMCWQF/Z2GZO0K8Lp2H8d2haPlsGoAz5zglTnBSuCq77k3G24DUgNIE=
X-Received: by 2002:a4a:a301:0:b0:525:5f43:215a with SMTP id
 q1-20020a4aa301000000b005255f43215amr304148ool.1.1679335347762; Mon, 20 Mar
 2023 11:02:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230223-topic-opp-v3-0-5f22163cd1df@linaro.org>
 <20230223-topic-opp-v3-4-5f22163cd1df@linaro.org>
 <2f2467d1-f5f3-86dd-edba-fc26e60d142f@marek.ca>
 <8e9fc1c0-f74f-ba82-fade-31212637d6bb@linaro.org>
In-Reply-To: <8e9fc1c0-f74f-ba82-fade-31212637d6bb@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 20 Mar 2023 11:02:16 -0700
Message-ID: <CAF6AEGvYJg1r4A7bvfNrck-wfWv7+sQ8DnN=R_RaSK=tE1tzGw@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v3 4/7] drm/msm/a2xx: Implement .gpu_busy
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
Cc: freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 13, 2023 at 9:54=E2=80=AFAM Konrad Dybcio <konrad.dybcio@linaro=
.org> wrote:
>
>
>
> On 24.02.2023 16:04, Jonathan Marek wrote:
> > This won't work because a2xx freedreno userspace expects to own all the=
 perfcounters.
> >
> > This will break perfcounters for userspace, and when userspace isn't us=
ing perfcounters, this won't count correctly because userspace writes 0 to =
CP_PERFMON_CNTL at the start of every submit.
>
> Rob, would you be willing to take this without the a2xx bits? It
> should still be fine, except without devfreq. Not that we had
> any significant sort of scaling on a2xx before.

Yup, sounds like a plan

BR,
-R

> Konrad
> >
> > On 2/23/23 5:52 AM, Konrad Dybcio wrote:
> >> Implement gpu_busy based on the downstream msm-3.4 code [1]. This
> >> allows us to use devfreq on this old old old hardware!
> >>
> >> [1] https://github.com/LineageOS/android_kernel_sony_apq8064/blob/line=
age-16.0/drivers/gpu/msm/adreno_a2xx.c#L1975
> >>
> >> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> >> ---
> >>   drivers/gpu/drm/msm/adreno/a2xx_gpu.c | 26 +++++++++++++++++++++++++=
+
> >>   1 file changed, 26 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c b/drivers/gpu/drm/m=
sm/adreno/a2xx_gpu.c
> >> index c67089a7ebc1..104bdf28cdaf 100644
> >> --- a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
> >> +++ b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
> >> @@ -481,6 +481,31 @@ a2xx_create_address_space(struct msm_gpu *gpu, st=
ruct platform_device *pdev)
> >>       return aspace;
> >>   }
> >>   +/* While the precise size of this field is unknown, it holds at lea=
st these three values.. */
> >> +static u64 a2xx_gpu_busy(struct msm_gpu *gpu, unsigned long *out_samp=
le_rate)
> >> +{
> >> +    u64 busy_cycles;
> >> +
> >> +    /* Freeze the counter */
> >> +    gpu_write(gpu, REG_A2XX_CP_PERFMON_CNTL, PERF_STATE_FREEZE);
> >> +
> >> +    busy_cycles =3D gpu_read64(gpu, REG_A2XX_RBBM_PERFCOUNTER1_LO);
> >> +
> >> +    /* Reset the counter */
> >> +    gpu_write(gpu, REG_A2XX_CP_PERFMON_CNTL, PERF_STATE_RESET);
> >> +
> >> +    /* Re-enable the performance monitors */
> >> +    gpu_rmw(gpu, REG_A2XX_RBBM_PM_OVERRIDE2,
> >> +        A2XX_RBBM_PM_OVERRIDE2_DEBUG_PERF_SCLK_PM_OVERRIDE,
> >> +        A2XX_RBBM_PM_OVERRIDE2_DEBUG_PERF_SCLK_PM_OVERRIDE);
> >> +    gpu_write(gpu, REG_A2XX_RBBM_PERFCOUNTER1_SELECT, 1);
> >> +    gpu_write(gpu, REG_A2XX_CP_PERFMON_CNTL, PERF_STATE_ENABLE);
> >> +
> >> +    *out_sample_rate =3D clk_get_rate(gpu->core_clk);
> >> +
> >> +    return busy_cycles;
> >> +}
> >> +
> >>   static u32 a2xx_get_rptr(struct msm_gpu *gpu, struct msm_ringbuffer =
*ring)
> >>   {
> >>       ring->memptrs->rptr =3D gpu_read(gpu, REG_AXXX_CP_RB_RPTR);
> >> @@ -502,6 +527,7 @@ static const struct adreno_gpu_funcs funcs =3D {
> >>   #if defined(CONFIG_DEBUG_FS) || defined(CONFIG_DEV_COREDUMP)
> >>           .show =3D adreno_show,
> >>   #endif
> >> +        .gpu_busy =3D a2xx_gpu_busy,
> >>           .gpu_state_get =3D a2xx_gpu_state_get,
> >>           .gpu_state_put =3D adreno_gpu_state_put,
> >>           .create_address_space =3D a2xx_create_address_space,
> >>
