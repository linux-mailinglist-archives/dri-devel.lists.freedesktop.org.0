Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBCB28C54D
	for <lists+dri-devel@lfdr.de>; Tue, 13 Oct 2020 01:39:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E8916E857;
	Mon, 12 Oct 2020 23:39:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFEED6E858
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Oct 2020 23:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602545956;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rW0rq42E0Ia7pA/3O1pSHV86DfoT5jFkZR8FD7wpIhQ=;
 b=FjhfLqUU90o5Z5jPNA+2M0yrTeLW6/utZC6+EbmFxusn2VMGXqCEYyCMv68VjXFtAKEE7t
 DJ8rTYFAzNJnLtADKuGDyZHUX2zCx4Cyp77Xbq4dD7fbqOcB3ig7845sP7oqI+x3GBJdUK
 9Drdu6I1UN4qZ3t2u7mxaNfUlEP9AFc=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-540-pxXAG8cdNuWa6mAuY4aKdw-1; Mon, 12 Oct 2020 19:39:14 -0400
X-MC-Unique: pxXAG8cdNuWa6mAuY4aKdw-1
Received: by mail-qk1-f200.google.com with SMTP id u16so13724731qkm.22
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Oct 2020 16:39:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=rW0rq42E0Ia7pA/3O1pSHV86DfoT5jFkZR8FD7wpIhQ=;
 b=NKThP/epc9yU4SbamD1jMsj7713EsTSR2OBeKIjv07/29jGtca/ISQ9wyqsSnjHdv/
 xPpErGdCDjUVwv7gaZox7W/Y5gSAxfQTu/0el7VnwF8IBR8uqQ0A6vVKLSxeWbV9JLmh
 QNpmajoHK3Rr/JPaGRiApqvyHh4SwpBeyEO/fs47gp4KtLcfL/NLYTACwp44pgDGqRIs
 xvfDoSc6YjCXDz9OxJCVkVScQW67do28mHGMbLE8nSzb6qGy4JR9Q/STH3UYYxOQ20XR
 jQNnNyrUMvJIn/IowCXQqZHOm0b3F2i1ryZDyo5HgUsrkjJFbaMjEwGUWgVGtsf6Uwng
 ua4A==
X-Gm-Message-State: AOAM533Nn9nqpZcPCqtU6j+7NO2XuzfxeJ2ocTYlA3m93mvL528vXaYs
 7vmFjc03VuhhpkfTQ/p4dR4kII/iQLjl1UpB1TU9HXkRiRTj+EitrxWFGlbwW4H0sBPv64BrccI
 78Vu0ogbSSxuLuLrrxO6DpZEUkRWx
X-Received: by 2002:a05:620a:4:: with SMTP id j4mr8855249qki.164.1602545954411; 
 Mon, 12 Oct 2020 16:39:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyPc5P35iA6gXgoVAJSgh/p8EZmd1mF8MJWKHd6dMdvNW16yF9VfLRK/jtKJ+he966MNK0pKA==
X-Received: by 2002:a05:620a:4:: with SMTP id j4mr8855235qki.164.1602545954156; 
 Mon, 12 Oct 2020 16:39:14 -0700 (PDT)
Received: from Whitewolf.lyude.net
 (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id g5sm13323920qtx.43.2020.10.12.16.39.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 16:39:13 -0700 (PDT)
Message-ID: <3a89934f69387ddf654745e2c78bbb8362bbc4b4.camel@redhat.com>
Subject: Re: [PATCH 1/2] drm/i915/dpcd_bl: uncheck PWM_PIN_CAP when detect
 eDP backlight capabilities
From: Lyude Paul <lyude@redhat.com>
To: Aaron Ma <aaron.ma@canonical.com>, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 mapengyu@gmail.com, daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 rodrigo.vivi@intel.com,  joonas.lahtinen@linux.intel.com,
 jani.nikula@linux.intel.com,  ville.syrjala@linux.intel.com
Date: Mon, 12 Oct 2020 19:39:11 -0400
In-Reply-To: <20201009085750.88490-1-aaron.ma@canonical.com>
References: <20201009085750.88490-1-aaron.ma@canonical.com>
Organization: Red Hat
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Reply-To: lyude@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Completely zoned out on Ccing these patches to stable before submitting them,
but once they hit the mainline kernel you should be able to ask Greg to backport
them if you need. Anyway, pushed to drm-intel-next-queued. Thanks for the
patches!

On Fri, 2020-10-09 at 16:57 +0800, Aaron Ma wrote:
> BOE panel with ID 2270 claims both PWM_PIN_CAP and AUX_SET_CAP backlight
> control bits, but default chip backlight failed to control brightness.
> 
> Check AUX_SET_CAP and proceed to check quirks or VBT backlight type.
> DPCD can control the brightness of this pannel.
> 
> Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> index acbd7eb66cbe..308b14159b7c 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> @@ -334,8 +334,7 @@ intel_dp_aux_display_control_capable(struct
> intel_connector *connector)
>  	 * the panel can support backlight control over the aux channel
>  	 */
>  	if (intel_dp->edp_dpcd[1] & DP_EDP_TCON_BACKLIGHT_ADJUSTMENT_CAP &&
> -	    (intel_dp->edp_dpcd[2] & DP_EDP_BACKLIGHT_BRIGHTNESS_AUX_SET_CAP) &&
> -	    !(intel_dp->edp_dpcd[2] & DP_EDP_BACKLIGHT_BRIGHTNESS_PWM_PIN_CAP))
> {
> +	    (intel_dp->edp_dpcd[2] & DP_EDP_BACKLIGHT_BRIGHTNESS_AUX_SET_CAP)) {
>  		drm_dbg_kms(&i915->drm, "AUX Backlight Control Supported!\n");
>  		return true;
>  	}
-- 
Sincerely,
      Lyude Paul (she/her)
      Software Engineer at Red Hat

Note: I deal with a lot of emails and have a lot of bugs on my plate. If you've
asked me a question, are waiting for a review/merge on a patch, etc. and I
haven't responded in a while, please feel free to send me another email to check
on my status. I don't bite!

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
