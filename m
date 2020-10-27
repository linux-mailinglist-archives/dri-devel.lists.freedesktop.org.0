Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1842429CEB6
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 09:07:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E04856EB33;
	Wed, 28 Oct 2020 08:06:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA7876E1B2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 08:32:47 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id d24so756649ljg.10
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 01:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=X82VobCub5wdmETS8bjf+vsdYdzdCr0PUmctvSLcEXs=;
 b=KhZ5AD7Jw9jBSL5FbMoztfPKGbPuygHGVL/xEfq2XjOAML/HDO8WCDbzSkhKyibuAU
 EdS7G74Z4xdzPbTaGFJM60aGA7elIq0mM1xpSG+76kNXuXg6Zy8JHG5XHUqOGhpK34S2
 GBXe4XxWKlqFmjAjWTSutGi7pdAEaHPAGR/I6Ugdxfahk/n85pfH7WdokpQ4nweP/5aU
 vnGoTK/26xRIqlW1NPVseaIbS5jZF3f1FigFuawXl+oSZfctnBZn0uvRAMMYelFfoK8V
 oRGzJyg+Yn7kqncPCe2KU5YcVp2fuIKuT5nFQCCis7SYNgPo0hG5Xb9SkGKPfW0vnSPc
 d6Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=X82VobCub5wdmETS8bjf+vsdYdzdCr0PUmctvSLcEXs=;
 b=SUyHMyy2pKqgVvkiBVb516P6FnPPAeZ9tsHvPJamqLyOHo8KDus83ZY4uFncyNMrqq
 3ZpXV31bDJdBpo+AvsXJ592V1K/Dmc23WNFpC530sLy3DxxbHj9Pv8zMV8qeoRZi9CAY
 oAtuUyhV/owR/1QGBHdrhb90o2PLLCmj1w7pQgF9bPwqNRr7Yt+4cAXIQYu78zJta8I4
 7TOXE3TukXqMwrEUIFLXeE0UDR6ETkCgeGn7W1aqa/FT3quHRXBEcAf6Km0hPF0arlxi
 G/DkhCi8P3YRitPAyXLhnXNPE+icW+iMhpZAy0UXtjkzce3XMLYBrwgv5n+HnlaRzHYd
 WE0w==
X-Gm-Message-State: AOAM531NhvxT5cuoaIYtnsAu7ux9NtRbD6xWjvLYb5LnLrx2WK+Qg0Z7
 d33Goe7AXcHtle4X/k5nmQfqcw==
X-Google-Smtp-Source: ABdhPJz1bsKo5yTgSnDzbbvP5V2jQw+5aQqoUkmOwX1eV8OBkkpGpm8QyCzEOzVMO02QIpg+mOjbYQ==
X-Received: by 2002:a2e:874c:: with SMTP id q12mr579587ljj.148.1603787565936; 
 Tue, 27 Oct 2020 01:32:45 -0700 (PDT)
Received: from [192.168.1.211] ([188.162.64.248])
 by smtp.gmail.com with ESMTPSA id c4sm67675lfr.14.2020.10.27.01.32.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2020 01:32:45 -0700 (PDT)
Subject: Re: [PATCH 3/3] drm/msm/dpu: add support for clk and bw scaling for
 display
To: Rob Clark <robdclark@gmail.com>, Kalyan Thota <kalyan_t@codeaurora.org>
References: <1594899334-19772-1-git-send-email-kalyan_t@codeaurora.org>
 <1594899334-19772-3-git-send-email-kalyan_t@codeaurora.org>
 <CAF6AEGsYmxwmG2OWdX3Q-5tio+kU-AwhiL_0EyLTVb0=gWgwgw@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <1faa4d88-7acf-1895-f93b-59fd20d6de06@linaro.org>
Date: Tue, 27 Oct 2020 11:32:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <CAF6AEGsYmxwmG2OWdX3Q-5tio+kU-AwhiL_0EyLTVb0=gWgwgw@mail.gmail.com>
Content-Language: en-GB
X-Mailman-Approved-At: Wed, 28 Oct 2020 08:06:30 +0000
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Krishna Manikandan <mkrishn@codeaurora.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Raviteja Tamatam <travitej@codeaurora.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Douglas Anderson <dianders@chromium.org>, Sean Paul <seanpaul@chromium.org>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

On 04/08/2020 18:40, Rob Clark wrote:
> On Thu, Jul 16, 2020 at 4:36 AM Kalyan Thota <kalyan_t@codeaurora.org> wrote:
>>
>> This change adds support to scale src clk and bandwidth as
>> per composition requirements.
>>
>> Interconnect registration for bw has been moved to mdp
>> device node from mdss to facilitate the scaling.
>>
>> Changes in v1:
>>   - Address armv7 compilation issues with the patch (Rob)
>>
>> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>

Kalyan, back in July you promised to provide a followup patchset, 
removing code duplication. It's close to November now. Are there any 
plans for the followup or is a forgotten topic?

> 
> Reviewed-by: Rob Clark <robdclark@chromium.org>
> 
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c  | 109 +++++++++++++++++++++----
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |   5 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |   4 +
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c        |  37 ++++++++-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h        |   4 +
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c       |   9 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      |  84 +++++++++++++++++++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h      |   4 +
>>   8 files changed, 233 insertions(+), 23 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
>> index 7c230f7..e52bc44 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
>> @@ -29,6 +29,74 @@ enum dpu_perf_mode {
>>          DPU_PERF_MODE_MAX
>>   };
>>
>> +/**
>> + * @_dpu_core_perf_calc_bw() - to calculate BW per crtc
>> + * @kms -  pointer to the dpu_kms
>> + * @crtc - pointer to a crtc
>> + * Return: returns aggregated BW for all planes in crtc.
>> + */
>> +static u64 _dpu_core_perf_calc_bw(struct dpu_kms *kms,
>> +               struct drm_crtc *crtc)
>> +{
>> +       struct drm_plane *plane;
>> +       struct dpu_plane_state *pstate;
>> +       u64 crtc_plane_bw = 0;
>> +       u32 bw_factor;
>> +
>> +       drm_atomic_crtc_for_each_plane(plane, crtc) {
>> +               pstate = to_dpu_plane_state(plane->state);
>> +               if (!pstate)
>> +                       continue;
>> +
>> +               crtc_plane_bw += pstate->plane_fetch_bw;
>> +       }
>> +
>> +       bw_factor = kms->catalog->perf.bw_inefficiency_factor;
>> +       if (bw_factor) {
>> +               crtc_plane_bw *= bw_factor;
>> +               do_div(crtc_plane_bw, 100);
>> +       }
>> +
>> +       return crtc_plane_bw;
>> +}
>> +
>> +/**
>> + * _dpu_core_perf_calc_clk() - to calculate clock per crtc
>> + * @kms -  pointer to the dpu_kms
>> + * @crtc - pointer to a crtc
>> + * @state - pointer to a crtc state
>> + * Return: returns max clk for all planes in crtc.
>> + */
>> +static u64 _dpu_core_perf_calc_clk(struct dpu_kms *kms,
>> +               struct drm_crtc *crtc, struct drm_crtc_state *state)
>> +{
>> +       struct drm_plane *plane;
>> +       struct dpu_plane_state *pstate;
>> +       struct drm_display_mode *mode;
>> +       u64 crtc_clk;
>> +       u32 clk_factor;
>> +
>> +       mode = &state->adjusted_mode;
>> +
>> +       crtc_clk = mode->vtotal * mode->hdisplay * drm_mode_vrefresh(mode);
>> +
>> +       drm_atomic_crtc_for_each_plane(plane, crtc) {
>> +               pstate = to_dpu_plane_state(plane->state);
>> +               if (!pstate)
>> +                       continue;
>> +
>> +               crtc_clk = max(pstate->plane_clk, crtc_clk);
>> +       }
>> +
>> +       clk_factor = kms->catalog->perf.clk_inefficiency_factor;
>> +       if (clk_factor) {
>> +               crtc_clk *= clk_factor;
>> +               do_div(crtc_clk, 100);
>> +       }
>> +
>> +       return crtc_clk;
>> +}
>> +
>>   static struct dpu_kms *_dpu_crtc_get_kms(struct drm_crtc *crtc)
>>   {
>>          struct msm_drm_private *priv;
>> @@ -51,12 +119,7 @@ static void _dpu_core_perf_calc_crtc(struct dpu_kms *kms,
>>          dpu_cstate = to_dpu_crtc_state(state);
>>          memset(perf, 0, sizeof(struct dpu_core_perf_params));
>>
>> -       if (!dpu_cstate->bw_control) {
>> -               perf->bw_ctl = kms->catalog->perf.max_bw_high *
>> -                                       1000ULL;
>> -               perf->max_per_pipe_ib = perf->bw_ctl;
>> -               perf->core_clk_rate = kms->perf.max_core_clk_rate;
>> -       } else if (kms->perf.perf_tune.mode == DPU_PERF_MODE_MINIMUM) {
>> +       if (kms->perf.perf_tune.mode == DPU_PERF_MODE_MINIMUM) {
>>                  perf->bw_ctl = 0;
>>                  perf->max_per_pipe_ib = 0;
>>                  perf->core_clk_rate = 0;

Now bw_control is unused and can be removed alltogether.

>> @@ -64,6 +127,10 @@ static void _dpu_core_perf_calc_crtc(struct dpu_kms *kms,
>>                  perf->bw_ctl = kms->perf.fix_core_ab_vote;
>>                  perf->max_per_pipe_ib = kms->perf.fix_core_ib_vote;
>>                  perf->core_clk_rate = kms->perf.fix_core_clk_rate;
>> +       } else {
>> +               perf->bw_ctl = _dpu_core_perf_calc_bw(kms, crtc);
>> +               perf->max_per_pipe_ib = kms->catalog->perf.min_dram_ib;
>> +               perf->core_clk_rate = _dpu_core_perf_calc_clk(kms, crtc, state);
>>          }
>>
>>          DPU_DEBUG(
>> @@ -115,11 +182,7 @@ int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
>>                          DPU_DEBUG("crtc:%d bw:%llu ctrl:%d\n",
>>                                  tmp_crtc->base.id, tmp_cstate->new_perf.bw_ctl,
>>                                  tmp_cstate->bw_control);
>> -                       /*
>> -                        * For bw check only use the bw if the
>> -                        * atomic property has been already set
>> -                        */
>> -                       if (tmp_cstate->bw_control)
>> +
>>                                  bw_sum_of_intfs += tmp_cstate->new_perf.bw_ctl;

Just a nitpick: indent is wrong.

>>                  }
>>
>> @@ -131,9 +194,7 @@ int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
>>
>>                  DPU_DEBUG("final threshold bw limit = %d\n", threshold);
>>
>> -               if (!dpu_cstate->bw_control) {
>> -                       DPU_DEBUG("bypass bandwidth check\n");
>> -               } else if (!threshold) {
>> +               if (!threshold) {
>>                          DPU_ERROR("no bandwidth limits specified\n");
>>                          return -E2BIG;
>>                  } else if (bw > threshold) {
>> @@ -154,7 +215,11 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
>>                                          = dpu_crtc_get_client_type(crtc);
>>          struct drm_crtc *tmp_crtc;
>>          struct dpu_crtc_state *dpu_cstate;
>> -       int ret = 0;
>> +       int i, ret = 0;
>> +       u64 avg_bw;
>> +
>> +       if (!kms->num_paths)
>> +               return -EINVAL;

This broke bandwidth setting for everybody except sc7180, since 
_dpu_core_perf_crtc_update_bus will be still called for them, and 
returning -EINVAL here prevents dpu_core_perf_crtc_update() from setting 
clock rate. Returning 0 here fixes the issue.


>>
>>          drm_for_each_crtc(tmp_crtc, crtc->dev) {
>>                  if (tmp_crtc->enabled &&
>> @@ -165,10 +230,20 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,


-- 
With best wishes
Dmitry
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
