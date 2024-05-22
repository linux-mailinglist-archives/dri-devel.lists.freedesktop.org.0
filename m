Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2328CBDEB
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2024 11:38:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F30D710E15F;
	Wed, 22 May 2024 09:37:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="e3KNMcJC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F93810E15F
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 09:37:53 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-5241b49c0daso4218822e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 02:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716370671; x=1716975471; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=sZF8Y1rE8W87y+bamUNsSfTcDwSCLB9HcTvYTUeX3LE=;
 b=e3KNMcJC++7605E0t/E1Z2/6k8odfNAiEp8v5hl0jd0YPfM+yqQH+/9QtGq44mCncS
 /1HLvAEAlYbuPhpRo0MQzbxKdZpnogLJTfxRBvosj98RIumyV2YIZKr0tl9FUu0vgd7y
 BQstxGhzUCECMP+/DPMxPXKp2vnxEdpj1nT69D+wb9mPe2WOw4p43qNdTQ/SV2P5S6i3
 Pz4TM9/0OHoDaaPiLOGFWFMfIIVmb9T1ZpPUmjXoje8yCVT/GG7IuyShl8Ov0/SfoQD2
 bcN08LDgv2craBeSkC1wvo98DRWGyljHpaGlvtHeCl1KpJob+oXyUbpaReR96jpO9cbm
 VkrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716370671; x=1716975471;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sZF8Y1rE8W87y+bamUNsSfTcDwSCLB9HcTvYTUeX3LE=;
 b=OPwg6UmFTkIdSK7YSU5ok7TzFHMmvcX1B+3C6e1qYWdsgUbQb6tKh+XQcyZjQ0KobS
 Fx9rxos6PFNlACFK0shHidbe/R3H0Tbl9oBaCDnyKK4FFZRY2o6Mhekt6wK/cllEJz7y
 /dpJc8hctyd43VFZzFveplYZOCYCI4+bgHRQwcRulbuPgoT068Ugq/V7IE1gPNFaVsrY
 x9ave7G3bG4KAs9fe1LTAy1HxNslt9KM59Ocqe1Y18y5Eq1zgM5CrT0m5SL8/e+RxpJE
 svRwzDNVbg70smZjJOiJxrBAaBO2OM+PN5trZFocJe+sulxm+eR8kHH7jyKr5k967ewE
 Bruw==
X-Gm-Message-State: AOJu0Yyg2RXCg+SIBAuY3Wegjg5oG6g4ke8j6+F8TRhJzKjNURqFJJ9A
 OwJJZWQIeeJwlHF3JEG/HL87G4KzMGV/Ik4uTOIvenQBB2ix7B8arI9Jhymn4Bo=
X-Google-Smtp-Source: AGHT+IEf2YOTRO3VJ2d0ZMuzHoab/K1zVfDL60pRbaPP8ah3ZaMLS3wZxTPa0AZ0Zd8NImV/sFNEAg==
X-Received: by 2002:ac2:42d8:0:b0:51f:d989:18f6 with SMTP id
 2adb3069b0e04-526be8d484cmr989268e87.13.1716370671033; 
 Wed, 22 May 2024 02:37:51 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f38d90b2sm4970070e87.242.2024.05.22.02.37.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 May 2024 02:37:50 -0700 (PDT)
Date: Wed, 22 May 2024 12:37:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/display/dp: fix all kernel-doc warnings
Message-ID: <q3525v4os3yrrgr2bcllc7xbnw4tdtc3373hsqg7cxfpea7isp@wxdh3xrz6vb4>
References: <20240516002642.6659-1-rdunlap@infradead.org>
 <p2n7d7lhiogmn3niblqg3sj5nx7c7tx2m6h6z2xlyf3ks74753@7qze6k4jhp2k>
 <b47a415d-2e8c-4d09-8131-d361aa28dc60@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b47a415d-2e8c-4d09-8131-d361aa28dc60@infradead.org>
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

On Tue, May 21, 2024 at 08:59:06PM -0700, Randy Dunlap wrote:
> Hi Dmitry,
> 
> On 5/20/24 3:37 AM, Dmitry Baryshkov wrote:
> > On Wed, May 15, 2024 at 05:26:42PM -0700, Randy Dunlap wrote:
> >> Fix a struct member name in &struct drm_dp_as_sdp.
> >> Add Returns: kernel-doc syntax for 4 functions.
> >> In the Returns: sections, spell "%true" and "%false" consistently.
> >>
> >> Fixes these kernel-doc warnings:
> >>
> >> drm_dp_helper.h:126: warning: Function parameter or struct member 'mode' not described in 'drm_dp_as_sdp'
> >> drm_dp_helper.h:126: warning: Excess struct member 'operation_mode' description in 'drm_dp_as_sdp'
> >> drm_dp_helper.h:237: warning: No description found for return value of 'drm_dp_dsc_sink_supports_format'
> >> drm_dp_helper.h:539: warning: No description found for return value of 'drm_dp_dpcd_readb'
> >> drm_dp_helper.h:554: warning: No description found for return value of 'drm_dp_dpcd_writeb'
> >> drm_dp_helper.h:721: warning: No description found for return value of 'drm_dp_has_quirk'
> >>
> >> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> >> ---
> >> Cc: David Airlie <airlied@gmail.com>
> >> Cc: Daniel Vetter <daniel@ffwll.ch>
> >> Cc: dri-devel@lists.freedesktop.org
> >> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> >> Cc: Maxime Ripard <mripard@kernel.org>
> >> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> >>
> >>  include/drm/display/drm_dp_helper.h |   17 +++++++++--------
> >>  1 file changed, 9 insertions(+), 8 deletions(-)
> >>
> >> diff -- a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
> >> --- a/include/drm/display/drm_dp_helper.h
> >> +++ b/include/drm/display/drm_dp_helper.h
> >> @@ -112,7 +112,7 @@ struct drm_dp_vsc_sdp {
> >>   * @target_rr: Target Refresh
> >>   * @duration_incr_ms: Successive frame duration increase
> >>   * @duration_decr_ms: Successive frame duration decrease
> >> - * @operation_mode: Adaptive Sync Operation Mode
> >> + * @mode: Adaptive Sync Operation Mode
> >>   */
> >>  struct drm_dp_as_sdp {
> >>  	unsigned char sdp_type;
> >> @@ -230,7 +230,8 @@ drm_dp_dsc_sink_max_slice_width(const u8
> >>   * @dsc_dpcd : DSC-capability DPCDs of the sink
> >>   * @output_format: output_format which is to be checked
> >>   *
> >> - * Returns true if the sink supports DSC with the given output_format, false otherwise.
> >> + * Returns: %true if the sink supports DSC with the given output_format,
> >> + * %false otherwise.
> >>   */
> >>  static inline bool
> >>  drm_dp_dsc_sink_supports_format(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE], u8 output_format)
> >> @@ -280,8 +281,8 @@ drm_dp_sink_can_do_video_without_timing_
> >>   * backlight features but which require the brightness be set through PWM, and don't support setting
> >>   * the brightness level via the DPCD.
> >>   *
> >> - * Returns: %True if @edp_dpcd indicates that VESA backlight controls are supported, %false
> >> - * otherwise
> >> + * Returns: %true if @edp_dpcd indicates that VESA backlight controls are
> >> + * supported, %false otherwise
> > 
> > If you are touching this part, maybe it's better to change 'Returns' to
> > 'Return' as documented by Documentation/doc-guide/kernel-doc.rst ?
> > (the same comment applies to other chunks in the patch, I've trimmed
> > them).
> 
> scripts/kernel-doc accepts either spelling, but sure, I can change these.
> Thanks.

An alternative way would be to fix kernel-doc.rst :-)

> 
> >>   */
> >>  static inline bool
> >>  drm_edp_backlight_supported(const u8 edp_dpcd[EDP_DISPLAY_CTL_CAP_SIZE])
> > 
> 
> -- 
> #Randy
> https://people.kernel.org/tglx/notes-about-netiquette
> https://subspace.kernel.org/etiquette.html

-- 
With best wishes
Dmitry
