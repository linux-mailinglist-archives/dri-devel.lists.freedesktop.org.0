Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9A69765F5
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 11:46:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D79610E15D;
	Thu, 12 Sep 2024 09:46:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="AvrxgYmi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A60F310E15D
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 09:46:55 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-5365392cfafso730230e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 02:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726134414; x=1726739214; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=xjtqfHfRcfKQ5w0sEXjGIUYVnAdujJDo61KSjXXwUAc=;
 b=AvrxgYmi8hB/qQ4n7WPDf9BZzZleDauOTM1fMUW+LvSmzg2j06FVpm4g/4ZquKleLM
 fvD82Ughwa4HzES5kVtpL47M38MLRmTJRqzfPBDt8lN5Y8H4tRkjjPhSB9Z2Qvn85xSt
 pO7Z6FZgJ3oHg+vitZCxwg3RUxAjIrndkk65dsKSxD32/Rg6J7Ez50+QSOffhdDzfmYO
 uTZw/90slav+QlVPHCiNQmCyajbEHi2+wKEsLNcgmQhgo0tIwF+ZuR3gY2Eg+9Dycv/a
 OSAcGRekqKvVE6LK5qhrLF+XtVQOqWrs37bzLmmOGSSx+aBLrG2L2ZAd+AR7niHSIm7v
 0VDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726134414; x=1726739214;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xjtqfHfRcfKQ5w0sEXjGIUYVnAdujJDo61KSjXXwUAc=;
 b=onjAJefPAPgZ6FZPJ3iJw51+ke7MmJsQAM1O2U+XcrkOeH2jNBRlxo66stfewsy96I
 O9CwTHIAA+KFBuKIy5il7r0bkVYGUcAXmACwxi7MI0UL+QyC/hSDm1bAf4qL/q9u+rzG
 +9qNdy6l/RJiboflMDXIe2TZ8N9TngrU/mvzDT3NyNBDq8KGQFnQUh9MKM+duzxWYtsi
 AULaW0pMfAT1/J7zD59+d68PDeGzCqdY08k3nArYdl1aDeP/SaLvAF0X+rspYm68yfpO
 HjCMjBt1S01hhEmCZx18T3YnfZBCMabCMYTq3OesVhvafevZSLuFQe+IPOH2NmTDWcpC
 yojQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7yGTZLK6SumMfxWCSyUuq9Rja1s2S9pVK2Uvodcveu0fkQg1Hkd/PxfZrHXya7a8+aceQ4zZW8bQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxfsi7qT2rU9M6NDSCfr+y+oCsLPcSmpYYYFh+TdxHOC6bQMWjV
 byEjmCWwTg9/r/dkLwzSShe6yqybrADtkGCKj2MUIB6xl7ITcffKhD6LY2pLGos=
X-Google-Smtp-Source: AGHT+IG5cW7iOqsMFNTTX9UV+7kHmIMbFWnDYcjy69de1cGerUaeAt5gV+fLAilQojfIG0emqxXgqw==
X-Received: by 2002:a05:6512:1095:b0:536:54fd:275b with SMTP id
 2adb3069b0e04-53678ff62f4mr1313521e87.54.1726134412981; 
 Thu, 12 Sep 2024 02:46:52 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5365f868e60sm1849080e87.38.2024.09.12.02.46.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2024 02:46:52 -0700 (PDT)
Date: Thu, 12 Sep 2024 12:46:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org, 
 Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] drm/doc: Update drm_bridge_connector path
Message-ID: <rq77jt6wfq2s6i5mk4x4v7hfvpz7cgl5uqnwrq7odyz5k6rbxo@riierkdmvhp5>
References: <20240912084540.1213343-1-mripard@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240912084540.1213343-1-mripard@kernel.org>
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

On Thu, Sep 12, 2024 at 10:45:40AM GMT, Maxime Ripard wrote:
> Commit 9da7ec9b19d8 ("drm/bridge-connector: move to DRM_DISPLAY_HELPER
> module") recently moved the drm_bridge_connector file, but didn't update
> the doc resulting in a doc build warning. Update it for the new location.
> 
> Fixes: 9da7ec9b19d8 ("drm/bridge-connector: move to DRM_DISPLAY_HELPER module")
> Closes: https://lore.kernel.org/dri-devel/20240904163018.214efaa7@canb.auug.org.au/
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  Documentation/gpu/drm-kms-helpers.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

https://lore.kernel.org/dri-devel/20240911-drm-fix-dbc-docs-v1-1-ae5cb82fce1e@linaro.org/

-- 
With best wishes
Dmitry
