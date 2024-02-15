Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D47856284
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 13:06:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21D7010E6D8;
	Thu, 15 Feb 2024 12:06:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IW1Za7Oe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E81210E6D8
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 12:06:33 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-337d05b8942so501089f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 04:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707998791; x=1708603591; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=VMgDoMHIzFuqODakLtjtNeclHHbG8KPNcm8YqaMnNoA=;
 b=IW1Za7Oed4lYafhL4HbporMftE5m6U2qVSb6+ml1aCdJ3yKL2xKvLqFDe9HI7HDPTf
 vOwWHI1oxKH4kmX894BpQALWn6UJJ6dVsZCn90wjlBakkMwfxsmz1BjL3G5mOqXmPsxp
 NwQNqt+23oeSG7h4PPFdWNQ1PGkR65n+LdpaN8+XVxauJuluPim9m6OOOb3NvFLOajnD
 +fp8iv2icXVcUAGyZw3ZsIu9MY0Ndg9hlR9YQ7s+vZ7XubhZZ0ttpHsoJyUstsak0JP0
 2QiuMLYCZdAzv/4L82/xbOUKBBUpeL6+hiOXieNXscZVecG7WMiYp0qeU5jq1swH4Muv
 uv7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707998791; x=1708603591;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VMgDoMHIzFuqODakLtjtNeclHHbG8KPNcm8YqaMnNoA=;
 b=naE0G4S/2Hs5R+a8RH9Bu0X/t7/KjXETM062OBMtYzU3FVnFrZLuDw05xbpoeAfxID
 EGC8i3DmKUbaZRD/qg8h0GgGJ6YULBa2JPJ7rn6WSUzKOd4ruCcJ04Fbr1HFhl0IN67W
 taVXYIJiyi6HjlmqsysYbKuWjjmNFGGFv8lXZTehKj0/rEqPnnUnEam5doEeWjYhXEDB
 sIE8EloFsJ17/MTyWuo+RwSAvX7G+D6JkeLvrm9BLRAMrHhX/o1xWtb1F3AUUo5eefxy
 6FgfywEKxYe76qPlnTCJeaR47WU2YKjvSL5/wFlElljk0QmRkAHTFIdDaPsfZd4Xt2hR
 fxgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJou05gUfUmgj90K4pQ6khVoIZJ/i75zrdKdu73XaYDRIJYckRo0Qm+lGkFVr4syNyTlN9zgXeaVNxjGwQFJCYYa6KOjaRnbzkYQHYOZGA
X-Gm-Message-State: AOJu0Yy4y+BJGRAXNSUIs/l+JOpA/USoWqMaXr2p3lNC8XldZvSbKUre
 ha28TSpsWSTo3MD4MN4twlKlvFpBZNqK9HYCpSZtPvnBvXkEe9pEm4zAlcNMYXg=
X-Google-Smtp-Source: AGHT+IFXsJnSJU/aoEXOC+yNwsZ//mKJH3nNdWKrq+duj3XBkzFcLIjieh7WMKZqSCQMPoyrY6E43A==
X-Received: by 2002:adf:f50d:0:b0:33b:4649:a1e0 with SMTP id
 q13-20020adff50d000000b0033b4649a1e0mr1195842wro.15.1707998791423; 
 Thu, 15 Feb 2024 04:06:31 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 x13-20020a5d54cd000000b0033cf5094fcesm1620967wrv.36.2024.02.15.04.06.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Feb 2024 04:06:31 -0800 (PST)
Date: Thu, 15 Feb 2024 12:06:29 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: lee@kernel.org, jingoohan1@gmail.com, deller@gmx.de, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-input@vger.kernel.org, linux-pwm@vger.kernel.org,
 Bruno =?iso-8859-1?Q?Pr=E9mont?= <bonbons@linux-vserver.org>
Subject: Re: [PATCH 04/10] hid/hid-picolcd: Remove struct
 backlight_ops.check_fb
Message-ID: <20240215120629.GH9758@aspen.lan>
References: <20240212162645.5661-1-tzimmermann@suse.de>
 <20240212162645.5661-5-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240212162645.5661-5-tzimmermann@suse.de>
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

On Mon, Feb 12, 2024 at 05:16:37PM +0100, Thomas Zimmermann wrote:
> The driver sets struct fb_info.bl_dev to the correct backlight
> device.

This looks like it was copied from a different patch since you
added code to do this as part of the patch!

> Thus rely on the backlight core code to match backlight
> and framebuffer devices, and remove the extra check_fb function
> from struct backlight_ops.
> <snip>
> diff --git a/drivers/hid/hid-picolcd_fb.c b/drivers/hid/hid-picolcd_fb.c
> index d7dddd99d325e..4500f6e03d32f 100644
> --- a/drivers/hid/hid-picolcd_fb.c
> +++ b/drivers/hid/hid-picolcd_fb.c
> @@ -493,6 +493,10 @@ int picolcd_init_framebuffer(struct picolcd_data *data)
>  	info->fix = picolcdfb_fix;
>  	info->fix.smem_len   = PICOLCDFB_SIZE*8;
>
> +#ifdef CONFIG_HID_PICOLCD_BACKLIGHT
> +	info->bl_dev = data->backlight;
> +#endif
> +
>  	fbdata = info->par;
>  	spin_lock_init(&fbdata->lock);
>  	fbdata->picolcd = data;


Daniel.
