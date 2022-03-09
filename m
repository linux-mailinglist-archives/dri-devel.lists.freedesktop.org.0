Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CAD4D2FB3
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 14:10:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4343E10E905;
	Wed,  9 Mar 2022 13:10:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AE7010E905
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Mar 2022 13:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646831419;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iAU44weXti04FLi2etjzVw+K+va7nBLkmB5FdNWAcI0=;
 b=Ciuwj6fWM1jqbyzxXo1RPRtJ0/v2aReVAEb140djTOujZbHUmvBy1uJAIkllfzh0GLWEcs
 PV6aR0BW0fgLGBSs/sjUwSVPw79JF3t5i0WhCWuxwWGON0yrTAUnK3TH1qp5O6nE2Mxsw9
 7RjZ44cdsetl7AUqT+yLvxetOpDt28o=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-73-60AjcPTeOiqD-8jeZs4glw-1; Wed, 09 Mar 2022 08:10:18 -0500
X-MC-Unique: 60AjcPTeOiqD-8jeZs4glw-1
Received: by mail-wm1-f71.google.com with SMTP id
 h131-20020a1c2189000000b003898de01de4so769880wmh.7
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Mar 2022 05:10:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iAU44weXti04FLi2etjzVw+K+va7nBLkmB5FdNWAcI0=;
 b=iaQlB6+gk2Ihduo+667X21r+R2X+ta5r42iUUY80daah1limbu5mOJThs7PH6pu07e
 krltX6949urYskos0kKx0fllsMkd3VJYq8ve7E4RXfu6wQAtlvBPnyVLPBQ8OgkNMYJe
 u6L1xyo8WrNYriMyEtnqX+vZoJ1GW811SNCG3smIN4N4O+QEy5qTw16ZX4OR6suXlnh2
 N7NdHrJjE0LLReqavLJyKBbUchr8JjF3dkyMfkdehdoua0wswQw048YAxnAaKCwXQZga
 8o0cahs4jWpd77qIN2Mb1aomzzaL0YACFIdjRpFyroG9mEvjuLfL4is/qTjInKUg6lei
 z2tQ==
X-Gm-Message-State: AOAM533FCqqUyzVWVbGDBMjEd9xTVXSJsm5qC2MFCe28csNzP6TwUeC9
 2LUesPqAcUNfTHhfZKVIdNrxwennoFOd+RFiZbaDhYWN1oUS6i49HTBrWDij8EKptRadqRB1O2w
 HYbUno1bdRj6Qwz9HQIHLBrOvmh0y
X-Received: by 2002:a5d:4dc5:0:b0:1f0:73e4:2cd9 with SMTP id
 f5-20020a5d4dc5000000b001f073e42cd9mr15765174wru.212.1646831417442; 
 Wed, 09 Mar 2022 05:10:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxvX2Au00DweT17gWXJkTfHnd/3tQIRGysI0fVMgShhCARC1khCEjjWT3sGgGyIigEkQZnnNQ==
X-Received: by 2002:a5d:4dc5:0:b0:1f0:73e4:2cd9 with SMTP id
 f5-20020a5d4dc5000000b001f073e42cd9mr15765152wru.212.1646831417244; 
 Wed, 09 Mar 2022 05:10:17 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 4-20020a056000154400b00203812ca383sm422698wry.78.2022.03.09.05.10.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Mar 2022 05:10:16 -0800 (PST)
Message-ID: <355f94c7-fc8a-7d92-5979-5b1b49c1d738@redhat.com>
Date: Wed, 9 Mar 2022 14:10:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 06/10] drm/fb-helper: Add support for DRM_FORMAT_C[124]
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>, Helge Deller <deller@gmx.de>
References: <cover.1646683502.git.geert@linux-m68k.org>
 <c665d6ba072f3debb3fa0a139454fefef6a55011.1646683502.git.geert@linux-m68k.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <c665d6ba072f3debb3fa0a139454fefef6a55011.1646683502.git.geert@linux-m68k.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: linux-fbdev@vger.kernel.org, linux-m68k@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/7/22 21:52, Geert Uytterhoeven wrote:
> Add support for color-indexed frame buffer formats with two, four, and
> sixteen colors to the DRM framebuffer helper functions:
>   1. Add support for 1, 2, and 4 bits per pixel to the damage helper,
>   2. For color-indexed modes, the length of the color bitfields must be
>      set to the color depth, else the logo code may pick a logo with too
>      many colors.  Drop the incorrect DAC width comment, which
>      originates from the i915 driver.
>   3. Accept C[124] modes when validating or filling in struct
>      fb_var_screeninfo, and use the correct number of bits per pixel.
>   4. Set the visual to FB_VISUAL_PSEUDOCOLOR for all color-indexed
>      modes.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

[snip]

>  static void drm_fb_helper_fill_fix(struct fb_info *info, uint32_t pitch,
> -				   uint32_t depth)
> +				   bool is_color_indexed)
>  {
>  	info->fix.type = FB_TYPE_PACKED_PIXELS;
> -	info->fix.visual = depth == 8 ? FB_VISUAL_PSEUDOCOLOR :
> -		FB_VISUAL_TRUECOLOR;
> +	info->fix.visual = is_color_indexed ? FB_VISUAL_PSEUDOCOLOR
> +					    : info->fix.visual;

Shouldn't this be the following instead ?

  +	info->fix.visual = is_color_indexed ? FB_VISUAL_PSEUDOCOLOR
  +					    : FB_VISUAL_TRUECOLOR;

Other than that the patch looks good to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

