Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A11969DDD4
	for <lists+dri-devel@lfdr.de>; Tue, 21 Feb 2023 11:27:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D121A10E155;
	Tue, 21 Feb 2023 10:27:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 917A810E155
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Feb 2023 10:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676975224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hiLmjzvpE18Y20gNAl/hePHswT74MZjZpMb0h3yOJZI=;
 b=Z3Q2Zi10hlCQa8ofLpOaS/vu8JtkMnrh3kDnXKizOX/mg6G5FLLWq73mBvf6MGA7FhSMVj
 oiNBjAa3sBBpgRw2KWrBBOB4K/9Ji2bW4D0n/nKN0CMRPnIRUjSC/Fsydcvh8PU2ulluVK
 U6tGIbwjzWCNXaVxo6NRKHjlRHdwydQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-251-d6iDxoF_N52Xm6P_1vhdyg-1; Tue, 21 Feb 2023 05:27:03 -0500
X-MC-Unique: d6iDxoF_N52Xm6P_1vhdyg-1
Received: by mail-wm1-f69.google.com with SMTP id
 n15-20020a05600c500f00b003dd07ce79c8so1649616wmr.1
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Feb 2023 02:27:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hiLmjzvpE18Y20gNAl/hePHswT74MZjZpMb0h3yOJZI=;
 b=1CfbgqUjhHZ1mbeYINQ9ToEv1a+v0UC8q/AUHmkLCIMpd2Rlrc30KOm1a7dVwybWRt
 KASSN0eXnM1bbHhX2TszlprEf/24L4n3kJRQzOQdEBziyn2O9QwNjPrb3NpIFT5F1RIx
 FzuFMba6hXIB73BOKbOPTjdAOCoQqgtvGVA+GDx4XCQiSyzttmKb08F3g8IvU0CRXplL
 41hArJXcLzLenPm/RxmMcCMnt8b/ip2/A1OYyn5q7507IYQeTjgYxmDHayggI/yo0bB0
 7GYmnYeRBKViX7qAgbegrK83H16tKtupIXQt5Ma2/y/haXe8WwYNgPfhET1u+zbVKhfO
 bwwA==
X-Gm-Message-State: AO0yUKXR+7MOubKIjf7wTgEMGNi2HUIOYVxy8FILocxBQxgf0wa1+RJS
 O/5YXuD6iC8pNWung1Ntp6aao0osPkq4w65x8K0LydZUxtLTTYA9CLhaw8IeXrk68b4pSqYstGY
 /7CJerJk3l1q3nAL586d3nPToKRIW
X-Received: by 2002:a05:600c:1887:b0:3e2:918:ecd4 with SMTP id
 x7-20020a05600c188700b003e20918ecd4mr2997466wmp.37.1676975222125; 
 Tue, 21 Feb 2023 02:27:02 -0800 (PST)
X-Google-Smtp-Source: AK7set/cKnMX/kNp3d4wm95Jc/vSbL62QyA9ckz6jygZFZOsNWWFJ1UBaXn9HDaaIXMU9JLf5j495Q==
X-Received: by 2002:a05:600c:1887:b0:3e2:918:ecd4 with SMTP id
 x7-20020a05600c188700b003e20918ecd4mr2997460wmp.37.1676975221852; 
 Tue, 21 Feb 2023 02:27:01 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 1-20020a05600c274100b003dfe549da4fsm4700968wmw.18.2023.02.21.02.27.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 02:27:01 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org
Subject: Re: [PATCH] drm/fb-helper: Remove drm_fb_helper_unprepare() from
 drm_fb_helper_fini()
In-Reply-To: <20230216140620.17699-1-tzimmermann@suse.de>
References: <20230216140620.17699-1-tzimmermann@suse.de>
Date: Tue, 21 Feb 2023 11:27:00 +0100
Message-ID: <87y1orxqiz.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
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
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-tegra@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Move drm_fb_helper_unprepare() from drm_fb_helper_fini() into the
> calling fbdev implementation. Avoids a possible stale mutex with
> generic fbdev code.
>
> As indicated by its name, drm_fb_helper_prepare() prepares struct
> drm_fb_helper before setting up the fbdev support with a call to
> drm_fb_helper_init(). In legacy fbdev emulation, this happens next
> to each other. If successful, drm_fb_helper_fini() later tear down
> the fbdev device and also unprepare via drm_fb_helper_unprepare().
>
> Generic fbdev emulation prepares struct drm_fb_helper immediately
> after allocating the instance. It only calls drm_fb_helper_init()
> as part of processing a hotplug event. If the hotplug-handling fails,
> it runs drm_fb_helper_fini(). This unprepares the fb-helper instance
> and the next hotplug event runs on stale data.
>
> Solve this by moving drm_fb_helper_unprepare() from drm_fb_helper_fini()
> into the fbdev implementations. Call it right before freeing the
> fb-helper instance.
>
> Fixes: 4825797c36da ("drm/fb-helper: Introduce drm_fb_helper_unprepare()")

I think this should be Fixes: 032116bbe152 ("drm/fbdev-generic: Minimize
client unregistering") instead? Because commit 4825797c36da just added a
wrapper function for mutex_destroy(&fb_helper->lock), but it was commit
032116bbe152 that made drm_fbdev_cleanup() to call that helper function.

> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

The change itself looks good to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

