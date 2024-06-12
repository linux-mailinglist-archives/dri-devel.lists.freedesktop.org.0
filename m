Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC7C905B72
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 20:49:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C012710E8D0;
	Wed, 12 Jun 2024 18:49:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YiBnVJ5O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27C1E10E8D0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 18:49:09 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-52c89d6b4adso216373e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 11:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718218147; x=1718822947; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6wcKgj5zsYVOyH6BWAvyb1hbmnSeIW1QyuIXQI4S1PA=;
 b=YiBnVJ5O5hAVAA4AHbLdKuPAsRP9flRDS0FBBlVROggiKx6pNQ5X2wAs+GrXuV2pF0
 TkavxWBduB261o5EXCYjjEeWkWQlUqm7NzDgdbmsAa3PvBNE7X5lzTE4qZe/kk/uGkIW
 YlEOfEWSRmEA2aP0nr04keYb6MJk3rVJxTwiUceqEKV7Xz4a8uxfBOj3qnypEACMN7f6
 cgIuiFYbxrl/Q8j4fjc3m7R7tggAhrrkB7Fipj7OjoJ7E0VmHMa27dx4oGdElzMpl5RT
 4pvQx2ukFXqfDzBFXuZ+OLwFLtS0XlMAb00wlJoBP9fP7hvBeWz+yRedvdOe+VzOgPkS
 1Ekg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718218147; x=1718822947;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6wcKgj5zsYVOyH6BWAvyb1hbmnSeIW1QyuIXQI4S1PA=;
 b=qIb658Bd+wjfaGsd1PvF+MBwtor9Fbm3eYqeDaXC/oZPAA5iIvICkDFNn3XOYraG2q
 kghtGqk5bIvrN7OkkVkQKq+m7lNGoCWU3z9l/8OaO0/+DwFS/eAzvN/5cIlFg4SzhTQJ
 H2knBZZgr8aN44mYKOnET6ZMVlCmGtN4mgxKmW4ZlLNSMpwbDO7T2Cld9d0bj+7HLBJd
 29ooDApSu/0s+RERubwT+LUJ/+xuknYTz+57UioccGdp3L9+PDQGL//LYtePRaI2Ucut
 zUC2fh+DQXlIzSllgv3oCaGAk8HCBvLffE4Yg033FAqkctPfBlAadKuXpGLO7AONXi/Y
 nKbg==
X-Gm-Message-State: AOJu0YzuUIMNXuB+2tQi4yAHQru65l5SfGwy2BGFmok/RiVlEbHm7uro
 /QsA+wz2/g2Ru7odrTYCAlm/Nqze5oVtd4U0Mxq20+jehJZEcFX9ZxKxCROUwUs=
X-Google-Smtp-Source: AGHT+IGyvxu872t4BsW6JiGET/DhuF9qsFjDL1gMdOoTZOUSXHG1OOWd/MW/ArXn2QgFwiwgep5ySw==
X-Received: by 2002:a05:6512:4028:b0:522:33dd:dcd9 with SMTP id
 2adb3069b0e04-52c9a3e1cebmr1897247e87.33.1718218146994; 
 Wed, 12 Jun 2024 11:49:06 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52c9840e9bfsm498315e87.75.2024.06.12.11.49.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jun 2024 11:49:06 -0700 (PDT)
Date: Wed, 12 Jun 2024 21:49:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH 3/3] drm/todo: Add TODO entry for "lints"
Message-ID: <dbrceupwkm5dwtuyyc2jymdxuknqptwcprkqgwwffv3x5zmolh@giauwxd7wmhi>
References: <20240612143553.915966-1-mripard@kernel.org>
 <20240612143553.915966-3-mripard@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240612143553.915966-3-mripard@kernel.org>
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

On Wed, Jun 12, 2024 at 04:35:53PM +0200, Maxime Ripard wrote:
> Having lints would prove beneficial to prevent the same dark patterns
> from reoccuring over and over again in drivers.
> 
> Add a TODO entry for that.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  Documentation/gpu/todo.rst | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index 94139c652663..16a9a24b33a6 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -717,10 +717,38 @@ doesn't or document it if it does would be of great help.
>  
>  Contact: Maxime Ripard <mripard@kernel.org>
>  
>  Level: Intermediate
>  
> +Create lints for KMS drivers
> +----------------------------
> +
> +Over time, we've accumulated a list of dark patterns in KMS drivers that
> +should be avoided. However, none of them are published anywhere, and not
> +all reviewers are aware of them. It creates a situation where we have
> +more drivers with problematic / deprecated code, even though we know
> +that they shouldn't.
> +
> +We should create a set of coccinelle scripts that match these patterns,
> +and make new drivers run that list. And possibly integrate them in CI.
> +
> +These patterns include:
> +
> +  - Drivers using kzalloc() or devm_kzalloc() to allocate their memory,
> +    instead of drmm_kzalloc().
> +
> +  - Drivers not protecting their device resources (MMIO, clocks,
> +    regulators, etc.) by drm_dev_enter() and drm_dev_exit().
> +
> +  - Drivers using drm_dev_unregister() instead of drm_dev_unplug().
> +
> +  - Drivers not calling drm_atomic_helper_shutdown() at shutdown

- Drivers setting state->allow_modeset manually.

> +
> +Contact: Maxime Ripard <mripard@kernel.org>
> +
> +Level: Intermediate
> +
>  Enable trinity for DRM
>  ----------------------
>  
>  And fix up the fallout. Should be really interesting ...
>  
> -- 
> 2.45.2
> 

-- 
With best wishes
Dmitry
