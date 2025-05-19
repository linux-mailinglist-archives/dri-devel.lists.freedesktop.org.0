Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A37ABB822
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 11:04:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 861F710E36A;
	Mon, 19 May 2025 09:04:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="O62kloSE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86F3C10E382
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 09:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747645483;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=b+x4vTIQvSf2FWpLg3QbvkOR5KW8aweHD+AVnGY/4x4=;
 b=O62kloSEmf5cu8d3Chcyck8rxUJwR48K9IWIFjJNBMEVgUZW5zH+IJJKlqGC3GHcUauUvw
 CH96IeB43/CN695b4/3/yeumwfM9te0TvoQggbiNHXzB03Eem8yJlb+G9Re07WeS9UrZA0
 GRwUv8tA+jByy7fw7/WNjboHrCBcv+0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-vkE3qHzsMP27p0Y9fd7Xtw-1; Mon, 19 May 2025 05:04:40 -0400
X-MC-Unique: vkE3qHzsMP27p0Y9fd7Xtw-1
X-Mimecast-MFC-AGG-ID: vkE3qHzsMP27p0Y9fd7Xtw_1747645479
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-440667e7f92so21051815e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 02:04:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747645479; x=1748250279;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=b+x4vTIQvSf2FWpLg3QbvkOR5KW8aweHD+AVnGY/4x4=;
 b=UMb+y/XW2GBjwBrhw4lDRcpbhyFQSXr1alyno/0Si0yTdstQ9M/iwMS32uIMBhX9Kx
 8Ryu9BaVLbSfGkuaDHYvfIbfkhWMP7+vAHBsgsCtcdK2tIRPuGFY637jerYfPIVvFxSb
 Ta6VvPGPpPCyxf334x29ltKjC2/4jQdLvli4Qvys5wIHLTlGgcASandxR70+Tygz617q
 VCzDyVoUyhTcWWK4ZLbw5T5VuuzXbkM5dVmLC9YTq2Sbd65pdzRieBKQUslqdu+4MRMo
 sTFRBAQp/lAPFNeuQo9bAcRVVhFhe6ymmwU48uQRvK7UKdoNR1LDKHyMYi6tXTI+gjAL
 fORQ==
X-Gm-Message-State: AOJu0YzF9qO/Ocj/rodps7ysHyrpWUiqftJj0gCRarN3ivIvnTFys6eJ
 +d3WKoSvxA7o7jehZz4DttQjexzHsFuhmqAsK5eLH59n+k3gjD6HFnyQbu7vzslNPYMasuvb5Pf
 ERTuTQempTJVxHKlt+eYG4zfb1fK6F3qyN1qMhqr2IuJkb9dwZwYeF8mjF6f4MyQ9k+fVAA==
X-Gm-Gg: ASbGncsSyI0csljhb3cJVDnzHackx25HLWqysusviFOk8MIq/xyfeY9ON0aF3l/lkL8
 Px5eioNohmjkcAfuEFhyCeTcz9wA3Ly5axgGqrql48Rig441r8uV/wUncDeSEhGi7yIYPxm/oBD
 mcGF+rlRhMJduOFE2bX+QAGNdFu7sha2V9ZBY6G217DIsDZDKX2cMRL6HnFuyJ2DYPP+7EzwGVO
 m1XH9dg34ztRlHS6LKFxi6xSWgqZBgDlOMquy/8kT/qxWnY7QhfU/TuRHJ+tY9j/HhwBwXOtu88
 osp4l3A4rRLWj87wnkQ+kzILGZKhAC0sxl0rGsFuPw==
X-Received: by 2002:a05:600c:524d:b0:442:e109:3027 with SMTP id
 5b1f17b1804b1-442fd6649bdmr105814915e9.24.1747645478940; 
 Mon, 19 May 2025 02:04:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBHT37+a7uQLiNF7xXa9+Pq3Q8b9W3F1Dvt9NV0dg1vkagGrtK9lGqM9kuxuBv+sLOTByRBg==
X-Received: by 2002:a05:600c:524d:b0:442:e109:3027 with SMTP id
 5b1f17b1804b1-442fd6649bdmr105814645e9.24.1747645478524; 
 Mon, 19 May 2025 02:04:38 -0700 (PDT)
Received: from localhost ([195.166.127.210]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442f3369293sm207128905e9.6.2025.05.19.02.04.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 02:04:37 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, gregkh@linuxfoundation.org,
 hdegoede@redhat.com, arvidjaar@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 stable@vger.kernel.org
Subject: Re: [PATCH] dummycon: Trigger redraw when switching consoles with
 deferred takeover
In-Reply-To: <20250519071026.11133-1-tzimmermann@suse.de>
References: <20250519071026.11133-1-tzimmermann@suse.de>
Date: Mon, 19 May 2025 11:04:35 +0200
Message-ID: <874ixhotss.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oh5PcunxYi6w8teqY-nMNlEqrboRwMecbReKTayQd60_1747645479
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> Signal vt subsystem to redraw console when switching to dummycon
> with deferred takeover enabled. Makes the console switch to fbcon
> and displays the available output.
>
> With deferred takeover enabled, dummycon acts as the placeholder
> until the first output to the console happens. At that point, fbcon
> takes over. If the output happens while dummycon is not active, it
> cannot inform fbcon. This is the case if the vt subsystem runs in
> graphics mode.
>
> A typical graphical boot starts plymouth, a display manager and a
> compositor; all while leaving out dummycon. Switching to a text-mode
> console leaves the console with dummycon even if a getty terminal
> has been started.
>
> Returning true from dummycon's con_switch helper signals the vt
> subsystem to redraw the screen. If there's output available dummycon's
> con_putc{s} helpers trigger deferred takeover of fbcon, which sets a
> display mode and displays the output. If no output is available,
> dummycon remains active.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reported-by: Andrei Borzenkov <arvidjaar@gmail.com>
> Closes: https://bugzilla.suse.com/show_bug.cgi?id=1242191
> Tested-by: Andrei Borzenkov <arvidjaar@gmail.com>
> Fixes: 83d83bebf401 ("console/fbcon: Add support for deferred console takeover")
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: linux-fbdev@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v4.19+
> ---
>  drivers/video/console/dummycon.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/video/console/dummycon.c b/drivers/video/console/dummycon.c
> index 139049368fdc..afb8e4d2fc34 100644
> --- a/drivers/video/console/dummycon.c
> +++ b/drivers/video/console/dummycon.c
> @@ -85,6 +85,12 @@ static bool dummycon_blank(struct vc_data *vc, enum vesa_blank_mode blank,
>  	/* Redraw, so that we get putc(s) for output done while blanked */
>  	return true;
>  }
> +
> +static bool dummycon_switch(struct vc_data *vc)
> +{
> +	/* Redraw, so that we get putc(s) for output done while switched away */

Maybe this comment could be a little bit more verbose about why this is needed
for the framebuffer console deferred takeover case? It doesn't have to be as
elaborated as how you have it in the commit message, but more information would
be nice IMO.

> +	return true;
> +}

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

