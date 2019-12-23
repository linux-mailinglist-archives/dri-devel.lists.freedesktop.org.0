Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A26129232
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2019 08:20:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FC586E162;
	Mon, 23 Dec 2019 07:20:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DE206E162
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2019 07:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577085648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MW6YhL+RcyQYvYpj5YrVwXN8MDvDRWOnMuiAt/nHw6w=;
 b=BKvS60xxrDyGPxcHtlBgjcjNqD9a/6K/bFjDzZxTegfUrLvKN4Tvx8Mn1KYdyDiNMts4+c
 apJnNY9wDigX95BU6Kwoe/V9wYH0g7rOw2TeO9h4/0JJB+XqADkXVZxR7gL0+5ec02hGEq
 R1lLAfOA1TsXVXv3x+cQL9YVRUZ3PY8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-KC-JDB_cOcm-mTCqJAK6MA-1; Mon, 23 Dec 2019 02:20:45 -0500
X-MC-Unique: KC-JDB_cOcm-mTCqJAK6MA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 63424800D48;
 Mon, 23 Dec 2019 07:20:44 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-202.pek2.redhat.com
 [10.72.12.202])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CD95A808F5;
 Mon, 23 Dec 2019 07:20:38 +0000 (UTC)
Subject: Re: [4/5] drm/i915: Auto detect DPCD backlight support by default
To: Lyude Paul <lyude@redhat.com>, intel-gfx@lists.freedesktop.org
References: <20191122231616.2574-5-lyude@redhat.com>
From: Perr Yuan <pyuan@redhat.com>
Message-ID: <3ba84125-ab4c-e1a7-cb74-b65638f1c2d5@redhat.com>
Date: Mon, 23 Dec 2019 02:20:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191122231616.2574-5-lyude@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/22/19 6:16 PM, Lyude Paul wrote:
> Turns out we actually already have some companies, such as Lenovo,
> shipping machines with AMOLED screens that don't allow controlling the
> backlight through the usual PWM interface and only allow controlling it
> through the standard EDP DPCD interface. One example of one of these
> laptops is the X1 Extreme 2nd Generation.
> 
> Since we've got systems that need this turned on by default now to have
> backlight controls working out of the box, let's start auto-detecting it
> for systems by default based on what the VBT tells us. We do this by
> changing the default value for the enable_dpcd_backlight module param
> from 0 to -1.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
> ---
>   drivers/gpu/drm/i915/i915_params.c | 2 +-
>   drivers/gpu/drm/i915/i915_params.h | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_params.c b/drivers/gpu/drm/i915/i915_params.c
> index 1dd1f3652795..31eed60c167e 100644
> --- a/drivers/gpu/drm/i915/i915_params.c
> +++ b/drivers/gpu/drm/i915/i915_params.c
> @@ -172,7 +172,7 @@ i915_param_named_unsafe(inject_probe_failure, uint, 0400,
>   
>   i915_param_named(enable_dpcd_backlight, int, 0600,
>   	"Enable support for DPCD backlight control"
> -	"(-1=use per-VBT LFP backlight type setting, 0=disabled [default], 1=enabled)");
> +	"(-1=use per-VBT LFP backlight type setting [default], 0=disabled, 1=enabled)");
>   
>   #if IS_ENABLED(CONFIG_DRM_I915_GVT)
>   i915_param_named(enable_gvt, bool, 0400,
> diff --git a/drivers/gpu/drm/i915/i915_params.h b/drivers/gpu/drm/i915/i915_params.h
> index 31b88f297fbc..a79d0867f77a 100644
> --- a/drivers/gpu/drm/i915/i915_params.h
> +++ b/drivers/gpu/drm/i915/i915_params.h
> @@ -64,7 +64,7 @@ struct drm_printer;
>   	param(int, reset, 3) \
>   	param(unsigned int, inject_probe_failure, 0) \
>   	param(int, fastboot, -1) \
> -	param(int, enable_dpcd_backlight, 0) \
> +	param(int, enable_dpcd_backlight, -1) \
>   	param(char *, force_probe, CONFIG_DRM_I915_FORCE_PROBE) \
>   	param(unsigned long, fake_lmem_start, 0) \
>   	/* leave bools at the end to not create holes */ \
> 

Tested-by:Perry Yuan <pyuan@redhat.com>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
