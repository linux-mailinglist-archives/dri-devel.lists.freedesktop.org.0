Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A209D12922F
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2019 08:19:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E9306E161;
	Mon, 23 Dec 2019 07:19:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 989C16E157
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2019 07:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577085553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZvvmjsaQRSYI5Hwo2AugDJq97eSzPxkp9W+pRzyQSNY=;
 b=H6FUA0QAdZg4dDD4ImV5rgYnSSinogPhH1Z9N4AnbV8X5vm4FBhZhfwWqoMHvGKel/N0UV
 bPDzkOLqBzr3VPMnyGuDjXjoqw/4O2/iGUKg5KTGMu6kzmWy93ErWF4qx/O4rMXKuPsKr6
 ZCk1HLsAVpDd2A6tmjNaLsCYqOhV7Xk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-dYUBmFnvMG2D053ZSakGLw-1; Mon, 23 Dec 2019 02:19:09 -0500
X-MC-Unique: dYUBmFnvMG2D053ZSakGLw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8471E802CAC;
 Mon, 23 Dec 2019 07:19:08 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-202.pek2.redhat.com
 [10.72.12.202])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C2F636444F;
 Mon, 23 Dec 2019 07:19:02 +0000 (UTC)
Subject: Re: [3/5] drm/i915: Fix DPCD register order in
 intel_dp_aux_enable_backlight()
To: Lyude Paul <lyude@redhat.com>, intel-gfx@lists.freedesktop.org
References: <20191122231616.2574-4-lyude@redhat.com>
From: Perr Yuan <pyuan@redhat.com>
Message-ID: <c1f93ab5-0eae-5c07-4ad4-abab81e0b596@redhat.com>
Date: Mon, 23 Dec 2019 02:19:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191122231616.2574-4-lyude@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
> For eDP panels, it appears it's expected that so long as the panel is in
> DPCD control mode that the brightness value is never set to 0. Instead,
> if the desired effect is to set the panel's backlight to 0 we're
> expected to simply turn off the backlight through the
> DP_EDP_DISPLAY_CONTROL_REGISTER.
> 
> We already do the latter correctly in intel_dp_aux_disable_backlight().
> But, we make the mistake of writing the DPCD registers in the wrong
> order when enabling the backlight in intel_dp_aux_enable_backlight()
> since we currently enable the backlight through
> DP_EDP_DISPLAY_CONTROL_REGISTER before writing the brightness level. On
> the X1 Extreme 2nd Generation, this appears to have the potential of
> confusing the panel in such a way that further attempts to set the
> brightness don't actually change the backlight as expected and leave it
> off. Presumably, this happens because the incorrect register writing
> order briefly leaves the panel with DPCD mode enabled and a 0 brightness
> level set.
> 
> So, reverse the order we write the DPCD registers when enabling the
> panel backlight so that we write the brightness value first, and enable
> the backlight second. This fix appears to be the final bit needed to get
> the backlight on the ThinkPad X1 Extreme 2nd Generation's AMOLED screen
> working.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> index 0bf8772bc7bb..87b59db9ffe3 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> @@ -205,8 +205,9 @@ static void intel_dp_aux_enable_backlight(const struct intel_crtc_state *crtc_st
>   		}
>   	}
>   
> +	intel_dp_aux_set_backlight(conn_state,
> +				   connector->panel.backlight.level);
>   	set_aux_backlight_enable(intel_dp, true);
> -	intel_dp_aux_set_backlight(conn_state, connector->panel.backlight.level);
>   }
>   
>   static void intel_dp_aux_disable_backlight(const struct drm_connector_state *old_conn_state)
> 

Tested-by:Perry Yuan <pyuan@redhat.com>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
