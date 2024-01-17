Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF90830CDA
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 19:42:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED13810E7BC;
	Wed, 17 Jan 2024 18:41:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
 [209.85.219.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE5DD10E7BC
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jan 2024 18:41:46 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-dc223f3dd5eso2028158276.2
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jan 2024 10:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705516846; x=1706121646; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XQziOnoabwrvBkO8mFhZ12paFF8gmB+VBE+mmqVmTwc=;
 b=BEtUwm/f1ooIdO8zvfkyGWcovQpbrqXOq8zTs6SviqZwr+IxBL0kAXQskZjT+k8G6L
 TytUrTbZf3az8x43aafEsszaBQIECiWaBf+Sg1sL8YlXtubpBexNwX+7ElD4eVA/QXa0
 FAVpRtbK0UJlFC1XvXrzKAIpFQtRzVdIoEhOvYCaQsQxspJwl/JVPXnom849RBMhCeM1
 ckM5FI+L3rZTOG0ErrfVbKlAT+vnYJjnAgfi1vQx7JgB2ViKY7aTDDp0OB4QHYaknG50
 P/G/gD/R4o7C1DaEun1Yfh0PgUZg9WIdY2T3MlPuhbnucEx1PjMfk2r0x7muxjEXDGtt
 5H3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705516846; x=1706121646;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XQziOnoabwrvBkO8mFhZ12paFF8gmB+VBE+mmqVmTwc=;
 b=mI4wBSNWhszvnWgZYo24Rb5NFd8MWZFkZ/1ofZPaxVwpReNvIefedBdIDf9Y5FNPbW
 gCm/Ebj4jMWmv3QcLbdSgzQHVLpoxnDnhB3hdOGDliUgU7uBTVjR221KNjHtCWxLvKb6
 8+etJ35Dhwjyvz4bed/Pa3BIlHiwVwJXEjxEjfZnaQV7TiXnKCNOlHj9Bp6EbkoU/kJx
 KlkmAQpN0ETDyx41oxXGnlrYk42rsoyszZJvJpIHJl1tUiN6yyMOVuStRp+wyJmoobCy
 Zi4lCLT7IBjj7pQ8/TBeY8Y6+9NVBgyIDF6YDa1VfD500ZRKCaOjyphMtBNQPpHvnVvc
 gp/w==
X-Gm-Message-State: AOJu0Yw3lM5apsH8k8c/4hQ98jfYe0fUTxFOjdn/LhyR/6A1YSMRfOfQ
 ocbPBvsCa4QSxmzaVwGOJULIMkGcvsLP7uhaKGYqy0WZxPyPLg==
X-Google-Smtp-Source: AGHT+IHdq74t1Y+Nl6vyEDwlZFdSgjbmClgj4fr8wHTyhe+8ffAIpbwrakjCzN/0lvZzUMFqIpr02V6uhYWXgkyC61k=
X-Received: by 2002:a5b:788:0:b0:dbd:b205:4078 with SMTP id
 b8-20020a5b0788000000b00dbdb2054078mr5777359ybq.101.1705516845649; Wed, 17
 Jan 2024 10:40:45 -0800 (PST)
MIME-Version: 1.0
References: <1705514068-22394-1-git-send-email-quic_khsieh@quicinc.com>
 <CAA8EJpqO+SWYcCtH1hOVow18ZTbJ=qh0D68CEP1sGObdd3=ciA@mail.gmail.com>
 <33f9d97d-f0fb-96d7-eea9-c43c3a5a162e@quicinc.com>
In-Reply-To: <33f9d97d-f0fb-96d7-eea9-c43c3a5a162e@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 17 Jan 2024 20:40:34 +0200
Message-ID: <CAA8EJppWuUrjzmssh79JT3B4uDcc_WnKGhJoCNiG8NTw9xD6wg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/dp: correct configure Colorimetry Indicator
 Field at MISC0
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 linux-kernel@vger.kernel.org, quic_abhinavk@quicinc.com, airlied@gmail.com,
 andersson@kernel.org, dri-devel@lists.freedesktop.org, dianders@chromium.org,
 vkoul@kernel.org, agross@kernel.org, daniel@ffwll.ch,
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com, swboyd@chromium.org,
 sean@poorly.run, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 17 Jan 2024 at 20:29, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
>
> On 1/17/2024 10:12 AM, Dmitry Baryshkov wrote:
> > On Wed, 17 Jan 2024 at 19:54, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
> >> MSA MISC0 bit 1 to 7 contains Colorimetry Indicator Field. At
> >> current implementation, at DP_TEST_DYNAMIC_RANGE_CEA case the
> > In the current implementation, in the ... case
> >
> >> Colorimetry Indicator Field is mistakenly left shifted one extra
> >> bit.
> > This doesn't make sense. You say that the value is mistakenly shifted,
> > but the shift is still in place in dp_catalog_ctrl_config_misc().
>
> The problem is at
>
>   link->dp_link.test_video.test_dyn_range =   (bp &
> DP_TEST_DYNAMIC_RANGE_CEA);   <== this from reading dpcd directly where
> ==> DP_TEST_DYNAMIC_RANGE_CEA  is   (1 << 3)
>
> within dp_catalog_ctrl_config_misc(), cc will be left shift one more bit.
> so that cc is totally is left shifted 4 bits (bit 4).
>
> at misc0, it should be bit 3 set only for CEA_RGB.

Yes. But your patch doesn't fix the shift (which is correct). You
patch fixes the value being written to that field.

>
> >
> >> This patch return correct value of colorimetry at
> >> dp_link_get_colorimetry_config() to fix this problem.
> > See Documentation/process/submitting-patches.rst#_describe_changes
> >
> >> Changes in V2:
> >> -- drop retrieving colorimetry from colorspace
> >> -- drop dr = link->dp_link.test_video.test_dyn_range assignment
> >>
> >> Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
> >> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/dp/dp_link.c | 11 ++++++-----
> >>   drivers/gpu/drm/msm/dp/dp_link.h |  3 +++
> >>   2 files changed, 9 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
> >> index 98427d4..2e1bdaf 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_link.c
> >> +++ b/drivers/gpu/drm/msm/dp/dp_link.c
> >> @@ -1082,7 +1082,7 @@ int dp_link_process_request(struct dp_link *dp_link)
> >>
> >>   int dp_link_get_colorimetry_config(struct dp_link *dp_link)
> >>   {
> >> -       u32 cc;
> >> +       u32 cc = DP_MISC0_LEGACY_RGB;
> >>          struct dp_link_private *link;
> >>
> >>          if (!dp_link) {
> >> @@ -1096,10 +1096,11 @@ int dp_link_get_colorimetry_config(struct dp_link *dp_link)
> >>           * Unless a video pattern CTS test is ongoing, use RGB_VESA
> >>           * Only RGB_VESA and RGB_CEA supported for now
> >>           */
> >> -       if (dp_link_is_video_pattern_requested(link))
> >> -               cc = link->dp_link.test_video.test_dyn_range;
> >> -       else
> >> -               cc = DP_TEST_DYNAMIC_RANGE_VESA;
> >> +       if (dp_link_is_video_pattern_requested(link)) {
> >> +               if (link->dp_link.test_video.test_dyn_range &
> >> +                                       DP_TEST_DYNAMIC_RANGE_CEA)
> >> +                       cc = DP_MISC0_CEA_RGB;
> >> +       }
> >>
> >>          return cc;
> >>   }
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_link.h b/drivers/gpu/drm/msm/dp/dp_link.h
> >> index 9dd4dd9..fe8f716 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_link.h
> >> +++ b/drivers/gpu/drm/msm/dp/dp_link.h
> >> @@ -12,6 +12,9 @@
> >>   #define DP_TEST_BIT_DEPTH_UNKNOWN 0xFFFFFFFF
> >>   #define DP_LINK_CAP_ENHANCED_FRAMING (1 << 0)
> >>
> >> +#define DP_MISC0_LEGACY_RGB            0
> >> +#define DP_MISC0_CEA_RGB               0x04
> > These should go to dp_reg.h and should start with DP_MISC0_COLORIMETRY_CFG
> >
> >> +
> >>   struct dp_link_info {
> >>          unsigned char revision;
> >>          unsigned int rate;
> >> --
> >> 2.7.4
> >>
> >



-- 
With best wishes
Dmitry
