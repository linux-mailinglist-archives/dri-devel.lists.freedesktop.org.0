Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04434912FBB
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 23:44:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 357EB10E166;
	Fri, 21 Jun 2024 21:44:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="yueXJeL/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3E5010E166
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 21:44:38 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-5295e488248so2905184e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 14:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719006277; x=1719611077; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3uqrF3+ai/cjb9cIpwJW8lMs7SIa0ZkESmSmmWesSvE=;
 b=yueXJeL/jpCHyein22XcdDoPtRu2g0uWNCopQ4qYe6t1RHKGAQpj2TqaxqZAzOaCdv
 m/4m9IHKOkVHqQni4c14TEGyz/shba0G6ndj43zdDCOg+RXfydjEJLaozMTvz5PUr5hb
 SiJZprXYdFH1HTziopjYx1thUU3o67m0zuiPWwZZJuc5ZFy2IqVHizQh4Oq2g2Q9wAcu
 PfVRktNgG6KeBjGItaegy+xaPSS18r2IKenFeDctGlHCtEUU+tGiDFPMb9SH9f0ipQND
 EQwKZedJu8UejDlH0IV/ZwQukMfMufbIh61qo7tkR4Ny/ejnA/NOFMSRO56qgdofOO8D
 8jZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719006277; x=1719611077;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3uqrF3+ai/cjb9cIpwJW8lMs7SIa0ZkESmSmmWesSvE=;
 b=THWnrTGzNBxJU5YQJMXXVIqNYVSkK1mP48jSG1YLYyqr4o4qF/7R+YpYfyF7gjerSS
 4f1VuUSDFqLBWS/t/rl3oBPw+MGGMvnuImWki0z31Lp/u/xqd8xeyXsGOPG0xbFfQELC
 sJlc08LR9Yonx+YjBaztnIAcq5oA0zBxnTvC0KxrHIeQw33IVX06ZsTzD9ESk2Lj+t1C
 LZ774iPY1jZ2QC8nyOL/OUWJWOqa6zNOFak7fw2jGn3/SeURGMCAkcRCchVRi5k3+Uvc
 +Mc07ki82FmoeBBHD0ouWNKRvN5yHdlnrOZ75Gztmg1VQx9zYbsSUfsWdlOYfiJmqyHz
 8wQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWd0Tvv07uoPvouTOH6vsZjK6BrYYZ8BpP77qvkj9nzyS7QyOWtP7O+Cc6h4pKav7Smvh5bCj/8rr0Z1QgbKj04gPxO9PhJGNoqZ9rT4/bc
X-Gm-Message-State: AOJu0YzszJGxd8r6YwIunmJemUStifS1wxTTsvjh787bK6TkmGY2JCqi
 fhaW+kyQW/VJqTfMRhEEauwz3s1mvp41ke7C+ffPOH2IyHhKsJnp12NPgfb51+Y=
X-Google-Smtp-Source: AGHT+IFl/V3yW8CJCWsS/UIq8YVxYKhV++rCKzFxbM9PSDfSHyU9d/4C0cWaowOPOYRtgogZXIxAGQ==
X-Received: by 2002:a05:6512:3b90:b0:52c:cb77:2b8 with SMTP id
 2adb3069b0e04-52ccb7702eamr6425124e87.5.1719006276605; 
 Fri, 21 Jun 2024 14:44:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cd7079478sm300520e87.153.2024.06.21.14.44.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 14:44:36 -0700 (PDT)
Date: Sat, 22 Jun 2024 00:44:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/panel: ltk050h3146w: add check for
 mipi_dsi_dcs_enter_sleep_mode
Message-ID: <znfhystpy6litynlgdgvc5h2plgbirec6ykkv64y3kb57lan4a@tuazxhuszpus>
References: <20240620074720.852495-1-nichen@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240620074720.852495-1-nichen@iscas.ac.cn>
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

On Thu, Jun 20, 2024 at 03:47:20PM GMT, Chen Ni wrote:
> Add check for the return value of mipi_dsi_dcs_enter_sleep_mode() and
> return the error if it fails in order to catch the error.
> 
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
>  drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Fixes: 6ea4383b9214 ("drm/panel: add panel driver for Leadtek LTK050H3146W")


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
