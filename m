Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A46C3399D0A
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 10:48:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD1276F455;
	Thu,  3 Jun 2021 08:48:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E187D6F455
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jun 2021 08:48:37 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id f5so1176071eds.0
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Jun 2021 01:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=vPAp0cDqkozZvEWRxxBHH5RxVtokOPhreu0KnKBlDT8=;
 b=Dfc5iwcBu7xHR6cCUm7AXpRC3Am+2tgSjO2cK3b+y81daO+VUcDnqv5aiqhlX2f8ET
 6onChdoAnMmIk5UTlu73QIpDDtNnf1X2MUG0IL1DmsIJFdqoA6heSynaLiB8Ryp9ysYy
 aHhDS1NSxmydVwhy0JCxhpd7kO6T0dhC7iCfU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=vPAp0cDqkozZvEWRxxBHH5RxVtokOPhreu0KnKBlDT8=;
 b=piA7Tx20hEIrhdeaTrOdiJ/qYiFw+5uN09N8EFl1Gvt3gOXjHkc9JersfcaCGhvUEi
 ppJQyj/B1LN8ZWPHygWOx57rSgFrm1+F/gBfwwb8+PYepY8yacIHDGdwycamPaHrB20o
 BFrpUDzv3um6V3J03tOUD1Hkal0DpZMJlaBY8wmTndmciHho0klVkMLlN7zE48dqRO3r
 iWis6mPIp5swOrRopFirRKpmBqtEohlVBkPJzBV9M3RGOw4pbkwXs/05Umiapg7wjA8B
 u4R7opuT+8/Ymeo5xXyYIoK3ZyyjLSZ/mJhkqR/rwLzlX2Yn15V6frM+4x3/MmEtJNjy
 YYDA==
X-Gm-Message-State: AOAM533TwFuG7HnX9T+JZKa9Qb/qx3ntWfvynoJ6YIhQN3XSGVvla6mH
 TC+GZiRaH/N3I3p4ef+cvDeYsw==
X-Google-Smtp-Source: ABdhPJwv4djZniG7P4/1rgxf9Fevn796Yj3QoQ3lNQh0vjHJ+sYM0uCv+TLIpzDfNoN6sGHi5HwO+Q==
X-Received: by 2002:aa7:dd57:: with SMTP id o23mr42071917edw.98.1622710116626; 
 Thu, 03 Jun 2021 01:48:36 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z17sm1232609ejc.69.2021.06.03.01.48.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 01:48:36 -0700 (PDT)
Date: Thu, 3 Jun 2021 10:48:33 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH 1/3] drm: Avoid circular dependencies for CONFIG_FB
Message-ID: <YLiXYa8OG9hlaEE5@phenom.ffwll.local>
Mail-Followup-To: Kees Cook <keescook@chromium.org>,
 Dave Airlie <airlied@redhat.com>, Arnd Bergmann <arnd@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, kernel test robot <lkp@intel.com>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Emma Anholt <emma@anholt.net>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Rob Herring <robh@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
References: <20210602215252.695994-1-keescook@chromium.org>
 <20210602215252.695994-2-keescook@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210602215252.695994-2-keescook@chromium.org>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: Arnd Bergmann <arnd@kernel.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Sam Ravnborg <sam@ravnborg.org>, Sharat Masetty <smasetty@codeaurora.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
 Dave Airlie <airlied@redhat.com>, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 02, 2021 at 02:52:50PM -0700, Kees Cook wrote:
> When cleaning up other drm config dependencies, it is too easy to create
> larger problems. Instead, mark CONFIG_FB as a "depends":
> 
> drivers/gpu/drm/Kconfig:74:error: recursive dependency detected!
> 
> Suggested-by: Arnd Bergmann <arnd@kernel.org>
> Link: https://lore.kernel.org/lkml/CAK8P3a3jUQs6c5tESSNMbqfuymewj9FhqRizyHcfOXf8Rgy-nA@mail.gmail.com/
> Signed-off-by: Kees Cook <keescook@chromium.org>

I rebased this one for -next and applied all three patches to
drm-misc-next.
-Daniel

> ---
>  drivers/gpu/drm/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 3c16bd1afd87..90891284ccec 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -83,7 +83,7 @@ config DRM_KMS_HELPER
>  config DRM_KMS_FB_HELPER
>  	bool
>  	depends on DRM_KMS_HELPER
> -	select FB
> +	depends on FB
>  	select FRAMEBUFFER_CONSOLE if !EXPERT
>  	select FRAMEBUFFER_CONSOLE_DETECT_PRIMARY if FRAMEBUFFER_CONSOLE
>  	select FB_SYS_FOPS
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
