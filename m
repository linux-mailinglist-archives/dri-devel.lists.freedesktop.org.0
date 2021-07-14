Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C65643C8B26
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 20:45:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 070256E48B;
	Wed, 14 Jul 2021 18:45:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B2846E48B
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 18:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626288312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1ZAdf0GJIbLpyyVrXbwjxcRS9oM/2mE5p8d6as6VgdU=;
 b=CHvZoMSZMVRLXBso62ZLS33B0Xysn848pgi4n0GdkeBpeqPR3qrjXaeChG6rUCIXAujHQt
 0XeBwRZPFNeabfEKUOqrezmCHKr9Qm0MZRQuJOnXfdXzc7Syaydb0vUjAN+mvM1aMgN8Ot
 Julml2KHcQjnuuUE4VGLrUFqsewnFb8=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-395-PihywuLpPxqwfJXc1nkn_A-1; Wed, 14 Jul 2021 14:45:09 -0400
X-MC-Unique: PihywuLpPxqwfJXc1nkn_A-1
Received: by mail-qk1-f200.google.com with SMTP id
 x2-20020ae9e6420000b02903b8853778c2so1899830qkl.18
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 11:45:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=1ZAdf0GJIbLpyyVrXbwjxcRS9oM/2mE5p8d6as6VgdU=;
 b=nprTRNzBQArfYG9D87WFyS/8jMw/rmlvhQS9tQN39jraL8eOgFV1MAxIR1qecmTWEq
 9ZysDZsP5vZ2vhpi7DrfNkMyV6a6LRjqAgcT2Y+JekZWmI68FaXnff5YrY+HO4h0U6wm
 gtfZL6Yi4srCXejHSp7pJAv+M1/v8yWt/rUwG5Hf0bQjw5E/pglSwNOuQICemCouyddk
 TGumi/51DbKO+12KZHdaWko2KWfRdbVre3LbqdOtdwFqZ1jNPUE1VInV4DewUon9sNer
 5+iv7EVxCds614UasAcwaIlTA8HJc36yXmbP+M8xuT1m++6HmjvSS1t8AXIAKW7IrMnY
 +3Xg==
X-Gm-Message-State: AOAM533iot3ceeB39W3oB8EV86gljsp5SQX8/OPsPgA39VwTYKFmWSqr
 wXn2sUkjnJySsleIlevfQYiqMTetW4gPljGoyG6WChh3Y7dLIifPC/WsDfAzi2geNJwfwTIx7ax
 tm8cuQGOKcqvX33Q65n3Ed8zK/Etx
X-Received: by 2002:a05:620a:31aa:: with SMTP id
 bi42mr11236389qkb.425.1626288308706; 
 Wed, 14 Jul 2021 11:45:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyk7kMcvMar0jLNDySN2hM8tTHtPUpoD6ejpE/O4waO1AawEFynsB5XM12PtGqCXW7BIy7C9w==
X-Received: by 2002:a05:620a:31aa:: with SMTP id
 bi42mr11236374qkb.425.1626288308567; 
 Wed, 14 Jul 2021 11:45:08 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id j3sm1354331qka.96.2021.07.14.11.45.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 11:45:08 -0700 (PDT)
Message-ID: <281cfad8220d37683ac433f583e37f5f2667aedd.camel@redhat.com>
Subject: Re: [PATCH] drm/dp: For drm_panel_dp_aux_backlight(), init
 backlight as disabled
From: Lyude Paul <lyude@redhat.com>
To: Douglas Anderson <dianders@chromium.org>, Rajeev Nandan
 <rajeevny@codeaurora.org>, Robert Foss <robert.foss@linaro.org>
Date: Wed, 14 Jul 2021 14:45:06 -0400
In-Reply-To: <20210714101744.1.Ifc22696b27930749915e383f0108b7bcdc015a6e@changeid>
References: <20210714101744.1.Ifc22696b27930749915e383f0108b7bcdc015a6e@changeid>
Organization: Red Hat
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Jingoo Han <jingoohan1@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Lee Jones <lee.jones@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Wed, 2021-07-14 at 10:17 -0700, Douglas Anderson wrote:
> Even after the DP AUX backlight on my board worked OK after applying
> the patch ("drm/panel-simple: Power the panel when probing DP AUX
> backlight") [1], I still noticed some strange timeouts being reported
> by ti_sn_aux_transfer(). Digging, I realized the problem was this:
> * Even though `enabled` in `struct dp_aux_backlight` was false, the
>   base backlight structure (`base` in that structure) thought that the
>   backlight was powered on.
> * If userspace wrote to sysfs in this state then we'd try to enable
>   the backlight.
> * Unfortunatley, enabling the backlight didn't work because the panel
>   itself wasn't powered.
> 
> We can only use the backlight if the panel is on and the panel is not
> officially on when we probe (it's temporarily just on enough for us to
> talk to it).
> 
> The important thing we want here is to get `BL_CORE_FBBLANK` set since
> userspace can't mess with that. This will keep us disabled until
> drm_panel enables us, which means that the panel is enabled
> first. Ideally we'd just set this in our `props` before calling
> devm_backlight_device_register() but the comments in the header file
> are pretty explicit that we're not supposed to much with the `state`
> ourselves. Because of this, there may be a small window where the
> backlight device is registered and someone could try to tweak with the
> backlight. This isn't likely to happen and even if it did, I don't
> believe this causes any huge problem.
> 
> [1]
> https://lore.kernel.org/lkml/20210714093334.1.Idb41f87e5abae4aee0705db7458b0097fc50e7ab@changeid/
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
>  drivers/gpu/drm/drm_dp_helper.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_dp_helper.c
> b/drivers/gpu/drm/drm_dp_helper.c
> index e8eec20ab364..b5f75ca05774 100644
> --- a/drivers/gpu/drm/drm_dp_helper.c
> +++ b/drivers/gpu/drm/drm_dp_helper.c
> @@ -3568,6 +3568,8 @@ int drm_panel_dp_aux_backlight(struct drm_panel
> *panel, struct drm_dp_aux *aux)
>         if (IS_ERR(bl->base))
>                 return PTR_ERR(bl->base);
>  
> +       backlight_disable(bl->base);
> +
>         panel->backlight = bl->base;
>  
>         return 0;

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

