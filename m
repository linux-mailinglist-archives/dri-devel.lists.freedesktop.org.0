Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 310919B9938
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2024 21:12:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08C7410E9FE;
	Fri,  1 Nov 2024 20:12:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cehXVlHl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F69010E9FE
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2024 20:12:21 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-539ebb5a20aso2489612e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Nov 2024 13:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730491939; x=1731096739; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=XRuudTPNmMwLHY1n1kU3xhjTGMpQc0UfbLasNRVgYtU=;
 b=cehXVlHlYopBBlkinAfTLIr1ZjhzYZvoGn8MOluK6YsUcVUqN6JYU1Ok0R8HGn1zZQ
 J3iBH4BUljq2rWOjTg4N+r6JyFPFwry3TxtxArxq/N49ccNb8jPtQidFkw89N/LFPBTn
 BM++HRrTVaUM5HLi/sAiL1uij76LTtTaJYxXFin6jmsANUEpGowXhbs3cs8pNClrTAEE
 eckTH0bud2aY92I0ZbZlGa70fVujmg+/4FbACVKu989Kn8KWmQyWz8kEdPbezFORvRGS
 DTxKzSgjrwya080SmKfMGDEWRFWwmt+5b8h2JAJ+86Sl/emqBmhNqBd3L3tSuaixeubB
 7/Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730491939; x=1731096739;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XRuudTPNmMwLHY1n1kU3xhjTGMpQc0UfbLasNRVgYtU=;
 b=FQi5Wim6VPEXBXwnpsZIRC6j5enfJtsT6Nct/uKuFYxUEFRHL217ywzkKxQKPPA1AX
 IVab757a4eGyV4y/WL1TYmF/JrDLokx3889Pal03Rt/A1ndFRtEKUsOdqlCQpN9tG6rS
 khNprjM/ssBgPNPLdqXAgOIGCf+kc6ZR9Tu1r3jH3BaxDt7YoB9KeUIFIhD6imeKbmiu
 dhpFSkAz+qEKtUFyDIjfyFSwyJdFEh2BFg1IMQwgIfk+4cTYs0/sBMUoc197ToN89P3q
 butJ5iLqmmo8Og22eKa4zTlIskKTdqxRjKL4pRU6K6ST+sVEd4RhlkALrR4YfSaYbLot
 CfsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnFAYRRruMNyZtpLtXcZ6C4nQFgAf8DsDVkYaX6BZhaslprg15cSK5Izi+49yAT06eJVXehR8SH+A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxaRcPcCZJyPORJSnpEkDT1YimtIK+wsak/DmfpERIowzL9fNXt
 d8nCXhvNGGLTYUS2CJW7vk3xRSvIs3cMi8taaq3GWaupxzN4eQ7fNrpy+/0PD44=
X-Google-Smtp-Source: AGHT+IGIvW5ByRLM9GHWvfJdsh1B2I5joze+CQnZ10eSEsQVXQNXZharaJdv+roZF+ZF+jW9UKOllQ==
X-Received: by 2002:a05:6512:3d21:b0:53c:7363:90c with SMTP id
 2adb3069b0e04-53d65df7d34mr2770112e87.35.1730491938782; 
 Fri, 01 Nov 2024 13:12:18 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53c7bcce3d9sm656782e87.161.2024.11.01.13.12.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2024 13:12:18 -0700 (PDT)
Date: Fri, 1 Nov 2024 22:12:16 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Imre Deak <imre.deak@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 Abel Vesa <abel.vesa@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Johan Hovold <johan@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH RFC 1/4] drm/dp: Add helper to set LTTPRs in transparent
 mode
Message-ID: <skyowhfl2qoaaoa4gyj5mf4j3nlznmtc6l5b3oicopmc5u5nxb@f3i2iif3r6ya>
References: <20241031-drm-dp-msm-add-lttpr-transparent-mode-set-v1-0-cafbb9855f40@linaro.org>
 <20241031-drm-dp-msm-add-lttpr-transparent-mode-set-v1-1-cafbb9855f40@linaro.org>
 <ZyPxLpykHkO9Xx_R@ideak-desk.fi.intel.com>
 <87msijjol6.fsf@intel.com>
 <ZyTbDELVW5vqFoMS@ideak-desk.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZyTbDELVW5vqFoMS@ideak-desk.fi.intel.com>
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

On Fri, Nov 01, 2024 at 03:43:40PM +0200, Imre Deak wrote:
> On Fri, Nov 01, 2024 at 11:22:13AM +0200, Jani Nikula wrote:
> > On Thu, 31 Oct 2024, Imre Deak <imre.deak@intel.com> wrote:
> > > On Thu, Oct 31, 2024 at 05:12:45PM +0200, Abel Vesa wrote:
> > >> According to the DisplayPort standard, LTTPRs have two operating
> > >> modes:
> > >>  - non-transparent - it replies to DPCD LTTPR field specific AUX
> > >>    requests, while passes through all other AUX requests
> > >>  - transparent - it passes through all AUX requests.
> > >> 
> > >> Switching between this two modes is done by the DPTX by issuing
> > >> an AUX write to the DPCD PHY_REPEATER_MODE register.
> > >> 
> > >> Add a generic helper that allows switching between these modes.
> > >> 
> > >> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > >> ---
> > >>  drivers/gpu/drm/display/drm_dp_helper.c | 17 +++++++++++++++++
> > >>  include/drm/display/drm_dp_helper.h     |  1 +
> > >>  2 files changed, 18 insertions(+)
> > >> 
> > >> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> > >> index 6ee51003de3ce616c3a52653c2f1979ad7658e21..38d612345986ad54b42228902ea718a089d169c4 100644
> > >> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> > >> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> > >> @@ -2694,6 +2694,23 @@ int drm_dp_lttpr_max_link_rate(const u8 caps[DP_LTTPR_COMMON_CAP_SIZE])
> > >>  }
> > >>  EXPORT_SYMBOL(drm_dp_lttpr_max_link_rate);
> > >>  
> > >> +/**
> > >> + * drm_dp_lttpr_set_transparent_mode - set the LTTPR in transparent mode
> > >> + * @aux: DisplayPort AUX channel
> > >> + * @enable: Enable or disable transparent mode
> > >> + *
> > >> + * Returns 0 on success or a negative error code on failure.
> > >
> > > Should be "Returns 1 on success".
> > 
> > But is that a sensible return value?
> 
> It matches what the function returns, but yes, would make more sense to
> fix the return value instead to be 0 in case of success.

I think returning 0 is better in case of this function.

> 
> > >
> > >> + */
> > >> +
> > 
> > Superfluous newline.
> > 
> > >> +int drm_dp_lttpr_set_transparent_mode(struct drm_dp_aux *aux, bool enable)
> > >> +{
> > >> +	u8 val = enable ? DP_PHY_REPEATER_MODE_TRANSPARENT :
> > >> +			  DP_PHY_REPEATER_MODE_NON_TRANSPARENT;
> > >> +
> > >> +	return drm_dp_dpcd_writeb(aux, DP_PHY_REPEATER_MODE, val);
> > >> +}
> > >> +EXPORT_SYMBOL(drm_dp_lttpr_set_transparent_mode);
> > >> +
> > >>  /**
> > >>   * drm_dp_lttpr_max_lane_count - get the maximum lane count supported by all LTTPRs
> > >>   * @caps: LTTPR common capabilities
> > >> diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
> > >> index 279624833ea9259809428162f4e845654359f8c9..8821ab2d36b0e04d38ccbdddcb703b34de7ed680 100644
> > >> --- a/include/drm/display/drm_dp_helper.h
> > >> +++ b/include/drm/display/drm_dp_helper.h
> > >> @@ -625,6 +625,7 @@ int drm_dp_read_lttpr_phy_caps(struct drm_dp_aux *aux,
> > >>  			       u8 caps[DP_LTTPR_PHY_CAP_SIZE]);
> > >>  int drm_dp_lttpr_count(const u8 cap[DP_LTTPR_COMMON_CAP_SIZE]);
> > >>  int drm_dp_lttpr_max_link_rate(const u8 caps[DP_LTTPR_COMMON_CAP_SIZE]);
> > >> +int drm_dp_lttpr_set_transparent_mode(struct drm_dp_aux *aux, bool enable);
> > >>  int drm_dp_lttpr_max_lane_count(const u8 caps[DP_LTTPR_COMMON_CAP_SIZE]);
> > >>  bool drm_dp_lttpr_voltage_swing_level_3_supported(const u8 caps[DP_LTTPR_PHY_CAP_SIZE]);
> > >>  bool drm_dp_lttpr_pre_emphasis_level_3_supported(const u8 caps[DP_LTTPR_PHY_CAP_SIZE]);
> > >> 
> > >> -- 
> > >> 2.34.1
> > >> 
> > 
> > -- 
> > Jani Nikula, Intel

-- 
With best wishes
Dmitry
