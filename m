Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3419ED660
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 20:22:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5547310EBF9;
	Wed, 11 Dec 2024 19:22:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="B0AeIbHI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8BAF10EBF9
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 19:22:06 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-5401c52000dso3938349e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 11:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733944925; x=1734549725; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=fhMIxqS4yJy4TMfF6IpImxcWZLV7gqt0icqJ+XQLDEs=;
 b=B0AeIbHIUSq607/t+edx4VpnmVxnTqcSM2ZAGouPVa7UiSTtwttVn/2baRFBp2ZYc9
 tvGE8mJOm+SZztkPHvaulvx4Md22eZhCHo2BnsuUxgMhrBED6d8qQeVTkEqQ60HuVn2g
 atM9j+3GiBJnoc4wRjRgSAINLLSrFP2a6ajW7BYgZ2nKiO0SUEmFLU5yqipNzxvolOuI
 ssBjQbpaX7tz//97szhwM7zDtv80Kdmrp9SJaHJSENn1Bj9e7COtqWDekdGpsyslAQMk
 kKYPQz+NFg/aEDl8bD8P/5FhqBWuOjgT0aQgtirioX9dQC9EE0p09mUFOu5C8F+JobIw
 B6RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733944925; x=1734549725;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fhMIxqS4yJy4TMfF6IpImxcWZLV7gqt0icqJ+XQLDEs=;
 b=syY733o758UO9mYSGLtoyTWPQWVHpim9xgqbKCgA83v3uwUdOv+CM8cUv1WbvgvYGd
 S/MoyAhdHLugiXwqSC87P2af5hWgp6JT8ayoYFHmNClreXI/Uwj+t/8nylU/NLnhfaxY
 z84JPn3ov8AoTn+sQtPCieZUIxsYgNDo0uSzfS/TojuoL5x3nqJ6lWF+PaDeQT9FV0N0
 D5tKKstDQ7dhKAUosRsSB0mUET8e399mRLvWJaHzpOglnjJWN9t05bVO+1zHUt5TI0Qm
 fyEf4RnN5AL/CSP7nzjns9ZIWnqwKRnTIIAwQOY8SpO/RgiJoSCp2d1i5aFE5dMqOQbh
 E7xw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFyx4oND0VrIN5jgvc44ejvWavMtb2bHtoG5ho9WBy0bco3lNDa9O5fQd4tRtMl4uo8JL18EoyGKk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzxsPf1ZElNC6ymZT8zyCfP327lxsWzTpOL5h9wjTrRA9jc1ptr
 xRmPT++84yzfYhMeQbf8IIY8gEChs6itludWS9JP5rKq6+DRkGnuESOW17miYrI=
X-Gm-Gg: ASbGnctGNEzz75pQxY6tzgkJ2ZxN8MQ3JtRHfVRnHoZZjtE8z+ejiKWf9wuE47yKQAY
 O74zxqHZ9qwUSxK36XZ5rMyrCLUlfrtT2U6DdgCf5+cKa8omTuXZzhUT3h0qAxawEPVq0K0/e8y
 IcBrhHXPJ8mMmM8eNTAVKeBJNDAJsmSoYNIYGoe1oyz0dR00o2hrzW2EYqF0QGfMTwG7/OfNnWt
 +gnbWwVtfWr0EY2QNp1X60xz9SrLvOY3YKMpWpBcQix/XQ1hSkqjICqCLVLLL363FT0k3sh0sjH
 AuDw2obQwLOnGL2NdfzL2UBnSKUwYL5RKQ==
X-Google-Smtp-Source: AGHT+IE7tOuuyi7X6war4XV8L7zXaUOuiy/zuezb7qOEEGBSx8kQ05R5q5SvNGFQfCAc2tJou2uPgw==
X-Received: by 2002:a19:8c1c:0:b0:540:2ff1:309d with SMTP id
 2adb3069b0e04-5402ff1319cmr40692e87.34.1733944924716; 
 Wed, 11 Dec 2024 11:22:04 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e38dcdd1esm1617171e87.124.2024.12.11.11.22.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 11:22:03 -0800 (PST)
Date: Wed, 11 Dec 2024 21:22:00 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@redhat.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Johan Hovold <johan@kernel.org>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 1/4] drm/dp: Add helper to set LTTPRs in transparent
 mode
Message-ID: <o6xcm7jdcay77b6kltj7zownk6je6umqlmxsuscbbubw4jlr5v@w4zuusufajwx>
References: <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-0-d5906ed38b28@linaro.org>
 <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-1-d5906ed38b28@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-1-d5906ed38b28@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 11, 2024 at 03:04:12PM +0200, Abel Vesa wrote:
> According to the DisplayPort standard, LTTPRs have two operating
> modes:
>  - non-transparent - it replies to DPCD LTTPR field specific AUX
>    requests, while passes through all other AUX requests
>  - transparent - it passes through all AUX requests.
> 
> Switching between this two modes is done by the DPTX by issuing
> an AUX write to the DPCD PHY_REPEATER_MODE register.
> 
> Add a generic helper that allows switching between these modes.
> 
> Also add a generic wrapper for the helper that handles the explicit
> disabling of non-transparent mode and its disable->enable sequence
> mentioned in the DP Standard v2.0 section 3.6.6.1. Do this in order
> to move this handling out of the vendor specific driver implementation
> into the generic framework.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c | 50 +++++++++++++++++++++++++++++++++
>  include/drm/display/drm_dp_helper.h     |  2 ++
>  2 files changed, 52 insertions(+)
> 


> +/**
> + * drm_dp_lttpr_init - init LTTPR transparency mode according to DP standard
> + *
> + * @aux: DisplayPort AUX channel
> + * @lttpr_count: Number of LTTPRs
> + *
> + * Returns 0 on success or a negative error code on failure.
> + */
> +int drm_dp_lttpr_init(struct drm_dp_aux *aux, int lttpr_count)
> +{
> +	if (!lttpr_count)
> +		return 0;
> +
> +	/*
> +	 * See DP Standard v2.0 3.6.6.1 about the explicit disabling of
> +	 * non-transparent mode and the disable->enable non-transparent mode
> +	 * sequence.
> +	 */
> +	drm_dp_lttpr_set_transparent_mode(aux, true);
> +
> +	if (lttpr_count > 0 && !drm_dp_lttpr_set_transparent_mode(aux, false))
> +		return 0;
> +
> +	/*
> +	 * Roll-back to tranparent mode if setting non-tranparent mode failed or
> +	 * the number of LTTPRs is invalid
> +	 */
> +	drm_dp_lttpr_set_transparent_mode(aux, true);

This means that if lttpr_count < 0, then there will be two requests to
set LTTPRs to a transparent mode. Is that expected?

> +
> +	return -EINVAL;
> +}
> +EXPORT_SYMBOL(drm_dp_lttpr_init);
> +

-- 
With best wishes
Dmitry
