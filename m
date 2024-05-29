Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA2A8D310C
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 10:23:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 748F610E38B;
	Wed, 29 May 2024 08:23:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="EDTJKvhs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D1CF10E38B
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 08:23:54 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-5295eb47b48so2233503e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 01:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716971032; x=1717575832; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=DvbxrGFOdFlgHNkw+vhxhg73hUqntw/C2yDFlVEGy4o=;
 b=EDTJKvhs7zGyg9SfTluvilOmE1Z0pdYpEA+t7BLjZeJudVaor725/TWdl4svMujh80
 PnaXZWN3vV8pzfSlcnMS377ThXXiQhetE8YaA1VdoKNdKjQOsHpi9MTJJkv6gw49hCDW
 F3EVNA8WGt8pXiSoTexbjuPMK45D8tr5oHKrAy/URtrRaHBA843uzEVm4DP8AoOcbUEB
 t0ixbDXIKGsQ1eQkhr1WIfJvSR6FWFJfou5kWo1YsLMQfwZ6MQ/0GY+9Tk5pwpeL2Bvw
 YwRZ1HnfqplE1BOmvYM1dyjIvKYYq0L4rQEcpWiszAL27rWbC7W6tuKVuVBr5sVsDe9u
 LVAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716971032; x=1717575832;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DvbxrGFOdFlgHNkw+vhxhg73hUqntw/C2yDFlVEGy4o=;
 b=ZNmMKAGSXFwPzC7M4GSujJgbKNrHDu7ov9xAHZwY3BfbQVJNK0bM4q4SUEHnXwxxDw
 o1YVTg9YkJOSWidpwCzw7qMG80S80JFXYT4VKXpem2hF4qCy0RvrfUnGUKObVNssc1hi
 CAoEf9yWxuvHbgykBb8wuMvNJorMoMaL3h1JrX1Ss+l5XDYtMYUBl1yNc9tFctNXAaen
 ubOjyu46+GQQ6VpHb+mkwlo8g7hotXF3yc/BU5RWYP/O6Q+dCtl42pBAkhkQJz24ALUV
 GriFIM7aNmLe4LoAsxSmjA9RT1Mh5QbfxS9onAivpa1iNiPlaFXMBkZjmyKZ8hFdhANk
 aQvQ==
X-Gm-Message-State: AOJu0YzEuU1+ZDXtSj5N64vaV4s/LkuAzEesgO6rxsnyYtErPhKNLsET
 NTH7bbND3z6+Qpd7MmdyNk7LFIAgZjigp2NLXCFhmVzLupY//IeBMKFJtkRF/XtyTIKg2uRkIPt
 4
X-Google-Smtp-Source: AGHT+IFkzT9RmdwBqesR+/tSDkDL2ozzH5l1j3F6jk3YONUM2stlzXdwCr0XYqCvEQRg7a22f3FR2Q==
X-Received: by 2002:a05:6512:224c:b0:51f:d989:18f6 with SMTP id
 2adb3069b0e04-529645e230emr13855915e87.13.1716971032591; 
 Wed, 29 May 2024 01:23:52 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-529712f3343sm1202382e87.281.2024.05.29.01.23.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 01:23:52 -0700 (PDT)
Date: Wed, 29 May 2024 11:23:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] drm/display: Fix HDMI state helper dependency
Message-ID: <or7ywdkvmunw22vyx2nxiue4yxkjtkoekq6vyljkch3fefd7kl@7q3smb6vmj4a>
References: <20240529080013.2325748-1-mripard@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240529080013.2325748-1-mripard@kernel.org>
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

On Wed, May 29, 2024 at 10:00:13AM +0200, Maxime Ripard wrote:
> During the life of the series that introduced the
> DRM_DISPLAY_HDMI_STATE_HELPER option, we reworked the Kconfig option
> dependency setup to rely on depends on with commit f6d2dc03fa85 ("drm:
> Switch DRM_DISPLAY_HDMI_HELPER to depends on") which got reverted later
> on because it was creating too many issues by commit d7c128cb775e
> ("Revert "drm: Switch DRM_DISPLAY_HDMI_HELPER to depends on"").
> 
> However, since the series was out of tree at that time,
> DRM_DISPLAY_HDMI_STATE_HELPER wasn't properly updated to take the revert
> into account and is now creating build issues.
> 
> Let's switch the depends on to a select to fix this.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202405290332.Sqtt0ix0-lkp@intel.com/
> Closes: https://lore.kernel.org/oe-kbuild-all/202405290438.TOYhXMIn-lkp@intel.com/
> Closes: https://lore.kernel.org/oe-kbuild-all/202405290803.c3178DYT-lkp@intel.com/
> Closes: https://lore.kernel.org/oe-kbuild-all/202405291109.PQdqc46g-lkp@intel.com/
> Closes: https://lore.kernel.org/oe-kbuild-all/202405291221.a0NStxHE-lkp@intel.com/
> Fixes: 54cb39e2293b ("drm/connector: hdmi: Create an HDMI sub-state")
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/display/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
