Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AAEBA30D86
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 15:00:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D082410E2EE;
	Tue, 11 Feb 2025 14:00:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mRfwNCXv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 925A310E2EE
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 14:00:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 42BABA4045D;
 Tue, 11 Feb 2025 13:59:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F95FC4CEE6;
 Tue, 11 Feb 2025 14:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739282450;
 bh=YiB9whoNKM1H3gMhzkN3emRsT4XFNu21k9bVsUDkNgw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mRfwNCXvCqJx0Y/pz/0juCzTceuOU1Bx4RA7QeDf0MXZjeEI5dTNvfKFIQtw5eel7
 qtR+59sbmC+vqzLfIL2ekkpeIwl5wJeG28JqqPpQGtz1OusuSORS5DXrzvQF77q33W
 LTOEgf4i40ExWQ82ywNPFE9nCmh+4vNUNI0v5OZJ9ZrZM64UucCBxcG6LcGEnmzixZ
 3yrnUIJTte0/ep0uVoyphHKgbkBawANi1Qc6u1qJpJ7qkkh/cvF7hxSQYOHUjdekAq
 +Ix8fYOku0wKIJPQZ402IONRfrDe5eHwFdRDrHeNpUqBiryiTloSklC/imKphLLTAR
 Uj5OS/KV5Szeg==
Date: Tue, 11 Feb 2025 14:00:46 +0000
From: Lee Jones <lee@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: pavel@ucw.cz, danielt@kernel.org, jingoohan1@gmail.com, deller@gmx.de,
 simona@ffwll.ch, linux-leds@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH 10/13] leds: backlight trigger: Maintain global list of
 led backlight triggers
Message-ID: <20250211140046.GU1868108@google.com>
References: <20250206154033.697495-1-tzimmermann@suse.de>
 <20250206154033.697495-11-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250206154033.697495-11-tzimmermann@suse.de>
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

On Thu, 06 Feb 2025, Thomas Zimmermann wrote:

> Maintain a list of led backlight triggers. This will replace the
> fbdev notifiers that all backlight triggers currently subscribe to.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/leds/trigger/ledtrig-backlight.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/leds/trigger/ledtrig-backlight.c b/drivers/leds/trigger/ledtrig-backlight.c
> index 487577d22cfc..c1c1aa60cf07 100644
> --- a/drivers/leds/trigger/ledtrig-backlight.c
> +++ b/drivers/leds/trigger/ledtrig-backlight.c
> @@ -23,8 +23,13 @@ struct bl_trig_notifier {
>  	int old_status;
>  	struct notifier_block notifier;
>  	unsigned invert;
> +
> +	struct list_head entry;

You don't appear to be doing anything with the list here.

It would be better if you introduced the list when it's first utilised.

>  };
>  
> +static struct list_head ledtrig_backlight_list;
> +static struct mutex ledtrig_backlight_list_mutex;
> +
>  static int fb_notifier_callback(struct notifier_block *p,
>  				unsigned long event, void *data)
>  {
> @@ -118,6 +123,10 @@ static int bl_trig_activate(struct led_classdev *led)
>  	if (ret)
>  		dev_err(led->dev, "unable to register backlight trigger\n");
>  
> +	mutex_lock(&ledtrig_backlight_list_mutex);
> +	list_add(&n->entry, &ledtrig_backlight_list);
> +	mutex_unlock(&ledtrig_backlight_list_mutex);
> +
>  	return 0;
>  }
>  
> @@ -125,6 +134,10 @@ static void bl_trig_deactivate(struct led_classdev *led)
>  {
>  	struct bl_trig_notifier *n = led_get_trigger_data(led);
>  
> +	mutex_lock(&ledtrig_backlight_list_mutex);
> +	list_del(&n->entry);
> +	mutex_unlock(&ledtrig_backlight_list_mutex);
> +
>  	fb_unregister_client(&n->notifier);
>  	kfree(n);
>  }
> -- 
> 2.48.1
> 

-- 
Lee Jones [李琼斯]
