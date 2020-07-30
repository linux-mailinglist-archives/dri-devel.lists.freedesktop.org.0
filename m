Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF91232C1A
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jul 2020 08:52:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 094FD6E860;
	Thu, 30 Jul 2020 06:52:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 765BA6E860;
 Thu, 30 Jul 2020 06:52:03 +0000 (UTC)
IronPort-SDR: SOQhpEhqE08K8gBvoGYCYZ3FG1er4800WWG4tXZkGlj1DKPApW5QsZ6GpXxXGGEgzK/o0eJ6rW
 iBAY9rmTH9Cw==
X-IronPort-AV: E=McAfee;i="6000,8403,9697"; a="152776387"
X-IronPort-AV: E=Sophos;i="5.75,413,1589266800"; d="scan'208";a="152776387"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2020 23:52:02 -0700
IronPort-SDR: 2zghKGF/AZVMS8LEGACb/O+AyJrUiWq0fMuhlSGd/5xMVnJHle45MBG1NAhn8uN6s79I/jCM+S
 7nCe/DF3bR1g==
X-IronPort-AV: E=Sophos;i="5.75,413,1589266800"; d="scan'208";a="330650977"
Received: from unknown (HELO intel.com) ([10.223.74.178])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2020 23:51:58 -0700
Date: Thu, 30 Jul 2020 12:09:53 +0530
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: Sean Paul <sean@poorly.run>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Avoid modeset when content
 protection changes
Message-ID: <20200730063650.GA25561@intel.com>
References: <20200714160627.1269-1-sean@poorly.run>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200714160627.1269-1-sean@poorly.run>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Sean Paul <seanpaul@chromium.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-07-14 at 21:36:27 +0530, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> Instead of doing a full modeset to enable/disable content protection,
> simply go through the update_pipe flow which was introduced in the
> related patch below. This avoids flashing the screen every time the user
> starts viewing protected content.
> 
> Related: 634852d1f468 ("drm/i915: HDCP state handling in ddi_update_pipe")
> Cc: Ramalingam C <ramalingam.c@intel.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: intel-gfx@lists.freedesktop.org
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> ---
>  drivers/gpu/drm/i915/display/intel_hdcp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
> index 89a4d294822d..839ce1715253 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
> @@ -2191,7 +2191,7 @@ void intel_hdcp_atomic_check(struct drm_connector *connector,
>  			return;
>  	}
>  
> -	crtc_state->mode_changed = true;
> +	to_intel_crtc_state(crtc_state)->update_pipe = true;
IMHO intel_crtc_check_fastset() make sure that every crtc_state->mode_changed
will not turn up to a modeset. It seems it is already being taken care.

Thanks,
Anshuman Gupta.

>  }
>  
>  /* Handles the CP_IRQ raised from the DP HDCP sink */
> -- 
> Sean Paul, Software Engineer, Google / Chromium OS
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
