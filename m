Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D138C9B6C
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 12:38:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E5ED10E28C;
	Mon, 20 May 2024 10:37:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="dQa+6K3K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BCA010E28C
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 10:37:54 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-51f0602bc58so2322219e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 03:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716201472; x=1716806272; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vROlPILoNKAGtI5nlKIoUzWd52w8WaK5YSEJHAZoeZc=;
 b=dQa+6K3K7FfxS4z4BR4RkKaw3wF975wQY+F67MfVF+ZTxsLYoQQ1GBy/oI8Fp1FXOP
 l+lkHMOOwmPkmCl+a28qhbOGCK/NYOoQdRb1ZS2IBOVlV3H0tQA+96BnUD9Lq663Gvd5
 hnv+bv0R54p//KAjdZwg0xFQ0xLp3ZWBO8raLVxbNXV1FP7gwP+Re50/P0kdmZrWvjcg
 y72kvEumis+/PQzcuAZH7LqPJorVjQlon8msKmtJIzSvPiJ8QNBPmq0vWbCCE0fsN0/c
 aQjTGjyyNJkd4T5NZA+5DU5rIl2GehmIHEpQEVM5SYLzFF4dd3b6hn2siGmxVmdniZCw
 dE+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716201472; x=1716806272;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vROlPILoNKAGtI5nlKIoUzWd52w8WaK5YSEJHAZoeZc=;
 b=xQo/zHxiW5te5Ivaw4VviRSbpTs/2j4WL0ZHZvYGTw2NWnpkjeCvR2AfCv/n3CprDA
 H2mhCYL1jxfaNc0vFotrFtG1gylbXAHo2azM7xYNNSZzfi4avB1lQvVGAt2q793lh3qP
 cOwNlo6K/u107TF5IyW+Za82yn9+Yv8jKAOBpxcQ8VSkBtF8maupLNeVX+43tOEms8u/
 dSLfTQ3qqD7UGo5trW7WsgOjWA4ttAEOHf3uVfdAI88q+Sd+uErxhqVejWmc9w7NwFCx
 95p0HAoAbHioo2LiYz4gJ62udrAkVW0p06M5nurRz7RgpYnq23PRjxamlj4vB1+xL1L0
 KeRQ==
X-Gm-Message-State: AOJu0Yzrc8/y72MOSvoZvUVL2aAkmXi95PgIgI4R0RR3XK5Gp+jMSOxr
 iRz23G0t4BIjB58manf9VCJ/NLHv7yQMql9m8K+LL2nIc8hJUQyVjHOsQ8ZRv9Q=
X-Google-Smtp-Source: AGHT+IFaeG8xp9fMh6rVylXMaGL+biT0666eRJ9pwrJ+PIS93cu7SFiEQjQtPoC2qx+E853ZQn0GFg==
X-Received: by 2002:a19:2d4e:0:b0:51f:9a88:be2a with SMTP id
 2adb3069b0e04-52407cde448mr1470423e87.23.1716201472248; 
 Mon, 20 May 2024 03:37:52 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f39d32absm4245086e87.296.2024.05.20.03.37.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 May 2024 03:37:51 -0700 (PDT)
Date: Mon, 20 May 2024 13:37:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/display/dp: fix all kernel-doc warnings
Message-ID: <p2n7d7lhiogmn3niblqg3sj5nx7c7tx2m6h6z2xlyf3ks74753@7qze6k4jhp2k>
References: <20240516002642.6659-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240516002642.6659-1-rdunlap@infradead.org>
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

On Wed, May 15, 2024 at 05:26:42PM -0700, Randy Dunlap wrote:
> Fix a struct member name in &struct drm_dp_as_sdp.
> Add Returns: kernel-doc syntax for 4 functions.
> In the Returns: sections, spell "%true" and "%false" consistently.
> 
> Fixes these kernel-doc warnings:
> 
> drm_dp_helper.h:126: warning: Function parameter or struct member 'mode' not described in 'drm_dp_as_sdp'
> drm_dp_helper.h:126: warning: Excess struct member 'operation_mode' description in 'drm_dp_as_sdp'
> drm_dp_helper.h:237: warning: No description found for return value of 'drm_dp_dsc_sink_supports_format'
> drm_dp_helper.h:539: warning: No description found for return value of 'drm_dp_dpcd_readb'
> drm_dp_helper.h:554: warning: No description found for return value of 'drm_dp_dpcd_writeb'
> drm_dp_helper.h:721: warning: No description found for return value of 'drm_dp_has_quirk'
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> 
>  include/drm/display/drm_dp_helper.h |   17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
> 
> diff -- a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -112,7 +112,7 @@ struct drm_dp_vsc_sdp {
>   * @target_rr: Target Refresh
>   * @duration_incr_ms: Successive frame duration increase
>   * @duration_decr_ms: Successive frame duration decrease
> - * @operation_mode: Adaptive Sync Operation Mode
> + * @mode: Adaptive Sync Operation Mode
>   */
>  struct drm_dp_as_sdp {
>  	unsigned char sdp_type;
> @@ -230,7 +230,8 @@ drm_dp_dsc_sink_max_slice_width(const u8
>   * @dsc_dpcd : DSC-capability DPCDs of the sink
>   * @output_format: output_format which is to be checked
>   *
> - * Returns true if the sink supports DSC with the given output_format, false otherwise.
> + * Returns: %true if the sink supports DSC with the given output_format,
> + * %false otherwise.
>   */
>  static inline bool
>  drm_dp_dsc_sink_supports_format(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE], u8 output_format)
> @@ -280,8 +281,8 @@ drm_dp_sink_can_do_video_without_timing_
>   * backlight features but which require the brightness be set through PWM, and don't support setting
>   * the brightness level via the DPCD.
>   *
> - * Returns: %True if @edp_dpcd indicates that VESA backlight controls are supported, %false
> - * otherwise
> + * Returns: %true if @edp_dpcd indicates that VESA backlight controls are
> + * supported, %false otherwise

If you are touching this part, maybe it's better to change 'Returns' to
'Return' as documented by Documentation/doc-guide/kernel-doc.rst ?
(the same comment applies to other chunks in the patch, I've trimmed
them).

>   */
>  static inline bool
>  drm_edp_backlight_supported(const u8 edp_dpcd[EDP_DISPLAY_CTL_CAP_SIZE])

-- 
With best wishes
Dmitry
