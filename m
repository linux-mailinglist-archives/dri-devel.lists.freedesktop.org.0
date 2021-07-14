Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD64B3C8B43
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 20:48:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE047896EC;
	Wed, 14 Jul 2021 18:48:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FB0389690
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 18:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626288516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IAAG1k0NOT+ym7PfZu/f9WCZIsLgpHJ+m+NpG0hxB7k=;
 b=bmKq37HmdYD/xxnD0FX1Unkgw7IMHFYckIlSm7jjUIGwOBY1OXuogG2azPqu39c1yAc+9E
 4ECcMGY+O+T3F9Sp1axvDG60VaRAoBjd2pJg9inrH/gtDGzDhnvJpeN0VmyCX+CrBhIj2z
 KGXkuQtcPaMyf8RcsPjTGF4f24XnF0Q=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-2MRdVKsxNVGd9n3N1lXwng-1; Wed, 14 Jul 2021 14:48:35 -0400
X-MC-Unique: 2MRdVKsxNVGd9n3N1lXwng-1
Received: by mail-qk1-f197.google.com with SMTP id
 o14-20020a05620a0d4eb02903a5eee61155so1945082qkl.9
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 11:48:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=IAAG1k0NOT+ym7PfZu/f9WCZIsLgpHJ+m+NpG0hxB7k=;
 b=n83VqD9caHqMacCd6L2nwC8y1MxYyXdo0QY3I0e5ua4N3uYEb5760vDCN5U1Iv7wGH
 flZgY+/zpP/oeCYEBpudejXTKnMjOBoJVYVy8D+2sXTtk4prtA4RwXDC0HoglBxe3/pb
 2TZVCBjpl0Ut+r88YtHhl+CFEQvfCH7pJLXDHAng4L2HhVdgBuF7Xkdcb6A57OlGwx01
 iofMyAnixS/b2AatK5Sxp1tSFXNLUZLSQX36NIfbd4P3uMnhvI5vBPPxp3ofjl2700al
 lt5JKQbKzYhenB8h5RQyNKwIg2BCBBJhXUw06CpNs06BJIYcyCWJXsH69j0fJLx6D9y5
 v7zg==
X-Gm-Message-State: AOAM533qNZDIFYVBAQsgugXLX0trPogonE3lmPYBdjRHmVzEyGX8FLcb
 tKfKEpKwgwkJCnEwZsbzt4B0RQ6oil8yKOEgADDqgv5uXsgz+Ufxq4HsENY9Mj2nhYvIvgR5i60
 6MdjoJJJWwkDbufSuMB2pfMuo7TAo
X-Received: by 2002:a05:620a:2486:: with SMTP id
 i6mr11706226qkn.142.1626288514788; 
 Wed, 14 Jul 2021 11:48:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzTzkuZkVkZeDwSGZU5OrDpRxFfb/p+SDHUynGKRITTybPtm0GFBfFCAzQogD2Ky5fRu2d1fg==
X-Received: by 2002:a05:620a:2486:: with SMTP id
 i6mr11706211qkn.142.1626288514646; 
 Wed, 14 Jul 2021 11:48:34 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id c16sm1355706qka.122.2021.07.14.11.48.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 11:48:34 -0700 (PDT)
Message-ID: <a1ece28471de34abbc8238836622f662dc2f27af.camel@redhat.com>
Subject: Re: [PATCH] drm/panel-simple: Power the panel when probing DP AUX
 backlight
From: Lyude Paul <lyude@redhat.com>
To: Douglas Anderson <dianders@chromium.org>, Rajeev Nandan
 <rajeevny@codeaurora.org>, Robert Foss <robert.foss@linaro.org>
Date: Wed, 14 Jul 2021 14:48:33 -0400
In-Reply-To: <20210714093334.1.Idb41f87e5abae4aee0705db7458b0097fc50e7ab@changeid>
References: <20210714093334.1.Idb41f87e5abae4aee0705db7458b0097fc50e7ab@changeid>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Wed, 2021-07-14 at 09:33 -0700, Douglas Anderson wrote:
> When I tried booting up a device that needed the DP AUX backlight, I
> found an error in the logs:
>   panel-simple-dp-aux: probe of aux-ti_sn65dsi86.aux.0 failed with error -
> 110
> 
> The aux transfers were failing because the panel wasn't powered. Just
> like when reading the EDID we need to power the panel when trying to
> talk to it. Add the needed pm_runtime calls.
> 
> After I do this I can successfully probe the panel and adjust the
> backlight on my board.
> 
> Fixes: bfd451403d70 ("drm/panel-simple: Support DP AUX backlight")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
>  drivers/gpu/drm/panel/panel-simple.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c
> b/drivers/gpu/drm/panel/panel-simple.c
> index e0a05f366ce6..9b286bd4444f 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -827,7 +827,10 @@ static int panel_simple_probe(struct device *dev, const
> struct panel_desc *desc,
>                 goto disable_pm_runtime;
>  
>         if (!panel->base.backlight && panel->aux) {
> +               pm_runtime_get_sync(dev);
>                 err = drm_panel_dp_aux_backlight(&panel->base, panel->aux);
> +               pm_runtime_mark_last_busy(dev);
> +               pm_runtime_put_autosuspend(dev);
>                 if (err)
>                         goto disable_pm_runtime;
>         }

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

