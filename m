Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 750D18329A0
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 13:43:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD9B010E182;
	Fri, 19 Jan 2024 12:42:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com
 [209.85.128.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F39F10E182
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 12:42:57 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-5ff84214fc7so7786187b3.0
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 04:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705668114; x=1706272914; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=23vuA1+7BgcGfSlqZ4nH0qFr70mqNSgh0bqFZoyYKpg=;
 b=anAt07MoU7nZ/fTEOqyORcKFDVUpdOAOPDglHV8JsiYcgTXxUx7oW6zWo7CwJguJgq
 AJVfH0NjT6XU+Q5IlVuQnfJZi3Wyow1tevbHjp3qP0Lgwyel4oZFc7KKNj8LR1Xeu5hR
 wW/xTAAirlIwMvZqEVJD2PH0EtGNOkg24+51ERjKc3v2rpxKSK9BAyrE7WLNuRffiEIQ
 OPCHB4i1VkgtH2CB/u7KHgHuK3uqdBekXXm6Bc4tGA6ho5f8fkX6DOUHTRhjLGxbu69c
 aWZ44GacZeHRBHGgBt3xRBtJzsf1S3AqOW69e31zM8kQS464s8p0mvb1zCp74nXhj4IX
 BXjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705668114; x=1706272914;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=23vuA1+7BgcGfSlqZ4nH0qFr70mqNSgh0bqFZoyYKpg=;
 b=tA4RSRpsptmxFqQ2q9Opa7oJf3T7zcoTmyLZOvdWUB8N2EQbHl1YcMmWOwCuviP0Md
 2C6aeQrGJryJY2/0Kt5Isz5SC1t57Y+o3lMsvGZtc/s+4+tas5Er+f/8zjoA8IhGKMFU
 hG3EIk1c4AWx0dJwwlKB0RAtm2CrVa9xowIj8IwY0eTHeywGedVB73VuAZNEC+AncFV/
 mEoX3TcuqjbLZ5hDzFOWQ4GJrjLXOwC1SKqQh3ibrG5NwKPin7CLchqgwWoaDyidmy8o
 Vbtj8TebWl4eIfmmr0y00Nl0o6dMUvj0eEioiwmpbePyxhs1QXJIJHhsDAT41Ps/SIXn
 RNlQ==
X-Gm-Message-State: AOJu0YzvvtVr+cdax1Zx4kNqmLJMfRlQtcWHEbNlMm9ihqOI55BYuu4p
 EKsXV+Ehnv4PxVP8ZcVkntlTw44OoUAd1vsVHNr19PgkCfaHQ3788Sz1gK5824J9XKTNvonwvNY
 J044uTvKyQNO9L13Ze9UOFZWEwPEySUUi/iw+Lg==
X-Google-Smtp-Source: AGHT+IGXaB/Qo5C8K/AVwVpt0k+i3/3nYM44JB7FzXsWZairbE64gJOEa8s/VJ7iEick4vjqREgSJWa6nU4h2xbXln0=
X-Received: by 2002:a0d:df17:0:b0:5ff:7cca:a434 with SMTP id
 i23-20020a0ddf17000000b005ff7ccaa434mr2084545ywe.51.1705668113943; Fri, 19
 Jan 2024 04:41:53 -0800 (PST)
MIME-Version: 1.0
References: <1705526010-597-1-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1705526010-597-1-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 19 Jan 2024 14:41:43 +0200
Message-ID: <CAA8EJpqm5KW_UOkvV1JhX+LEh_e8bo549NNQ1AgAXMZ=ZPVCOA@mail.gmail.com>
Subject: Re: [PATCH v3] drm/msm/dp: return correct Colorimetry for
 DP_TEST_DYNAMIC_RANGE_CEA case
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

On Wed, 17 Jan 2024 at 23:13, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> MSA MISC0 bit 1 to 7 contains Colorimetry Indicator Field.
> dp_link_get_colorimetry_config() returns wrong colorimetry value
> in the DP_TEST_DYNAMIC_RANGE_CEA case in the current implementation.
> Hence fix this problem by having dp_link_get_colorimetry_config()
> return defined CEA RGB colorimetry value in the case of
> DP_TEST_DYNAMIC_RANGE_CEA.
>
> Changes in V2:
> -- drop retrieving colorimetry from colorspace
> -- drop dr = link->dp_link.test_video.test_dyn_range assignment
>
> Changes in V3:
> -- move defined MISCr0a Colorimetry vale to dp_reg.h
> -- rewording commit title
> -- rewording commit text to more precise describe this patch
>
> Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_link.c | 12 +++++++-----
>  drivers/gpu/drm/msm/dp/dp_reg.h  |  3 +++
>  2 files changed, 10 insertions(+), 5 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
