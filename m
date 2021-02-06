Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D57531179E
	for <lists+dri-devel@lfdr.de>; Sat,  6 Feb 2021 01:07:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 844516F531;
	Sat,  6 Feb 2021 00:07:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com
 [209.85.221.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB69E6F52A;
 Sat,  6 Feb 2021 00:07:25 +0000 (UTC)
Received: by mail-vk1-f174.google.com with SMTP id a6so1861135vkb.8;
 Fri, 05 Feb 2021 16:07:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GWIdyaZk9/oYRcHEJ4+7tjtfndiQTrSxe6MqleW8vSk=;
 b=TjCRztY1E1JmK+EUfjwcDwHwxvF1sekqQoU85hIXotGMRKUzcEcO0YfT4RUOOD3X5o
 pHVHq5gGO5C/Y+fZ0M9TUTpWo3LRPWT8Y/9nqqkAJ+qjm1iWu5gUcnLOAy7QjCCnPDK4
 /z9bUfWFAjAHix9IMVKkKAbvzF3SeiTYt8vwA7CQ8TYv+R7UaFyfMcSg8ah5JK7kCDiA
 4IqAXuQ3EYrUagIQL75oDcVEIzcXvSbh2MyFJjAfeR77+DutqZkNhyDSVn0g4VMwnCmM
 c/vSmNalXdylhZy+42lOkMpn6g/QyazsU3tBTltlE+x83YbyYCBATxHR24HLB+bhrzX5
 qYTw==
X-Gm-Message-State: AOAM531VOtD2sSf59uz21NxZgkj3+4fyjvTffCkblI7v79+q2O7+TWrA
 35w660yTs8vHwHBLnSzJ1k03e87M97nBICfI4+eACCQJZH4=
X-Google-Smtp-Source: ABdhPJxJIgKIk10RyyaoxQblF4duLLNKgdCrZTM3t0nEtDR0HKVJ+HMhYv8hicaLUuB9Bc+5v/j665IqMkjHYeTsV0A=
X-Received: by 2002:a1f:ae81:: with SMTP id x123mr5136104vke.1.1612570045044; 
 Fri, 05 Feb 2021 16:07:25 -0800 (PST)
MIME-Version: 1.0
References: <20210205234515.1216538-1-lyude@redhat.com>
 <20210205234515.1216538-6-lyude@redhat.com>
In-Reply-To: <20210205234515.1216538-6-lyude@redhat.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Fri, 5 Feb 2021 19:07:13 -0500
Message-ID: <CAKb7Uvhj+hMwhaNNng7yOOTSBf5gPNRT86aeXebvmPKHY1yTcw@mail.gmail.com>
Subject: Re: [Nouveau] [RFC v3 05/10] drm/i915/dpcd_bl: Cleanup
 intel_dp_aux_vesa_enable_backlight() a bit
To: Lyude Paul <lyude@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <seanpaul@chromium.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 5, 2021 at 6:45 PM Lyude Paul <lyude@redhat.com> wrote:
>
> Get rid of the extraneous switch case in here, and just open code
> edp_backlight_mode as we only ever use it once.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  .../gpu/drm/i915/display/intel_dp_aux_backlight.c | 15 ++-------------
>  1 file changed, 2 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> index c37ccc8538cb..95e3e344cf40 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> @@ -382,7 +382,7 @@ intel_dp_aux_vesa_enable_backlight(const struct intel_crtc_state *crtc_state,
>         struct intel_dp *intel_dp = intel_attached_dp(connector);
>         struct drm_i915_private *i915 = dp_to_i915(intel_dp);
>         struct intel_panel *panel = &connector->panel;
> -       u8 dpcd_buf, new_dpcd_buf, edp_backlight_mode;
> +       u8 dpcd_buf, new_dpcd_buf;
>         u8 pwmgen_bit_count = panel->backlight.edp.vesa.pwmgen_bit_count;
>
>         if (drm_dp_dpcd_readb(&intel_dp->aux,
> @@ -393,12 +393,8 @@ intel_dp_aux_vesa_enable_backlight(const struct intel_crtc_state *crtc_state,
>         }
>
>         new_dpcd_buf = dpcd_buf;
> -       edp_backlight_mode = dpcd_buf & DP_EDP_BACKLIGHT_CONTROL_MODE_MASK;
>
> -       switch (edp_backlight_mode) {
> -       case DP_EDP_BACKLIGHT_CONTROL_MODE_PWM:
> -       case DP_EDP_BACKLIGHT_CONTROL_MODE_PRESET:
> -       case DP_EDP_BACKLIGHT_CONTROL_MODE_PRODUCT:
> +       if ((dpcd_buf & DP_EDP_BACKLIGHT_CONTROL_MODE_MASK) != DP_EDP_BACKLIGHT_CONTROL_MODE_MASK) {

You probably meant != MODE_DPCD?

>                 new_dpcd_buf &= ~DP_EDP_BACKLIGHT_CONTROL_MODE_MASK;
>                 new_dpcd_buf |= DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD;
>
> @@ -406,13 +402,6 @@ intel_dp_aux_vesa_enable_backlight(const struct intel_crtc_state *crtc_state,
>                                        pwmgen_bit_count) != 1)
>                         drm_dbg_kms(&i915->drm,
>                                     "Failed to write aux pwmgen bit count\n");
> -
> -               break;
> -
> -       /* Do nothing when it is already DPCD mode */
> -       case DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD:
> -       default:
> -               break;
>         }
>
>         if (panel->backlight.edp.vesa.pwm_freq_pre_divider) {
> --
> 2.29.2
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
