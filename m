Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4324485A84
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jan 2022 22:16:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 760C210E13D;
	Wed,  5 Jan 2022 21:16:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D2B210E31C
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jan 2022 21:16:28 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id s127so869002oig.2
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jan 2022 13:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=lQIYB8bEUDp4cYpSdlfyhVUVPvpZOy0FK7CuWF/SNCs=;
 b=VJULhypwX0wcHpzibsftrllI34j0tWSOHncXLf7DHHkdYytd/cshD8afr1mSu99W1X
 5576rOFq3ZsuMTtEMmkl35fCepUmdxDNOuSIyBj8AZ8Ln5mt1Q5T94eSYumDbIGu8xj3
 KOX/VorQzAFVCWTJ3UCq5UmHuzcc0ZdP3q3y4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=lQIYB8bEUDp4cYpSdlfyhVUVPvpZOy0FK7CuWF/SNCs=;
 b=LTBkIbxwGQ6pdAPdqJtlxroU6vIIW9xvMKYu/KGJDAD8D6KVPtNNjlHiUT7w3Q3S/e
 +YGO9qfifxWCraVXjQTwfDzn2Wo/zXZJuv0WWfrCmGkoLYllMcSxKcgp52PdaYLANmke
 4w9J3+SUiLH5vE7gXibA4pFv8brdtwdZI9HHTEHV/TkXwmB7RpBreg7/5cNIqkQujyoi
 SgfFTAQ7upa8mXCBeqou+5wvqel0lRin5pFNgq/nAxXHdU46CgOXW1oNFlRB9BM39im6
 9SJaAnMnRomsiO4lAtl73jV4Kbz6yOtb2x9ycGLfCs/eqQkceR42ifQ/DI9vBzhmm0S0
 09Wg==
X-Gm-Message-State: AOAM532hiB5KBPg+azUlv6VoH16lz1+ic2qrkbxrmpXR1Rh+h5UYCgLD
 1RRJJ834pknWOqRx6IZYVXVACzKiPWoBpkmhGaWsyQ==
X-Google-Smtp-Source: ABdhPJyOxzmq0ckko0uEYH+WNow6f32CMqXcPtkrxYZG3rRoP/75NVBgFtr5ndOsSm393obYSgK+4GjDbI6lo3fsLZI=
X-Received: by 2002:aca:a953:: with SMTP id s80mr4041796oie.164.1641417386974; 
 Wed, 05 Jan 2022 13:16:26 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 5 Jan 2022 13:16:26 -0800
MIME-Version: 1.0
In-Reply-To: <1641340327-2261-1-git-send-email-quic_khsieh@quicinc.com>
References: <1641340327-2261-1-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 5 Jan 2022 13:16:26 -0800
Message-ID: <CAE-0n51FHOks2mF1tNxzEt7Hqz03in0KHRx8_49SGk-0F34Cvg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: stop link training after link training 2
 failed
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dmitry.baryshkov@linaro.org, 
 robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-01-04 15:52:07)
> Each DP link training contains link training 1 followed by link
> training 2.  There is maximum of 5 retries of DP link training
> before declared link training failed. It is required to stop link
> training at end of link training 2 if it is failed so that next
> link training 1 can start freshly. This patch fixes link compliance
> test  case 4.3.1.13 (Source Device Link Training EQ Fallback Test).
>
> Fixes: 2e0adc765d88 ("drm/msm/dp: do not end dp link training until video is ready")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
