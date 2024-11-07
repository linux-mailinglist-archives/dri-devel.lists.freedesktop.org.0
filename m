Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C80D9C0835
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2024 14:56:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10E6710E30B;
	Thu,  7 Nov 2024 13:56:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="deCyeFxZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99F1810E30B
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2024 13:56:04 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-53a0c160b94so998598e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Nov 2024 05:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730987763; x=1731592563; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=22xOEFDUKtzH1RkL0q7gdFIurZuuV8lHMvP9OcbXdk0=;
 b=deCyeFxZ3EWFbY3142Tp0lpXe+HFkhZJJnV7Urw5UE/OYrViMLpS7g5OS4IZJGznw7
 J99eZAdnasZV/xoHvgo+WsaMjfjv9ndTrb4IOaZrmgNTP5zYNa3CxV6nJwPVliHQrl3r
 A+cvKI78Z9UGAA+E7arIJbRF2BTHnLDXZqDBp3ep2PKz8uP7JgX3wDkkqoTwSy88svZF
 dWJXPsS7BejMaV4hzdBclewT4AZFrfYkDm3xpHIIdRplyw6NU7dLzde9OW7MRSlIyWIW
 XVaVBaU+MFGaGe0/vhGxLNmqwmMDqDKxvspRLz5AELlMvF4xft7jKdMJpy9LjJAhE8AG
 Xsgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730987763; x=1731592563;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=22xOEFDUKtzH1RkL0q7gdFIurZuuV8lHMvP9OcbXdk0=;
 b=mmYtg0VthNrZeQWcB4Ib3ygb87QrTTc9lICwpeUwjGycqErGlJiY4orkL0j3LaX53e
 7s6yXWkgjjyLnJAf16472/O10tPxf+QMqx1f4HV0NVk2FPt03E9Pq8ujjj4abKdXbR48
 Sq3rL0WPO5QrGoHbo++40HNdURVQAAEmo/TFO1pWUdkLe5/qanPtYpk+lRpaOG2OEBBO
 AD8+TS+cxxqPFl04GZwtj1UFARTsbIwnLDOaO/cvNo+t33TMA7/sIUQ34vq6ATlD5aXL
 CgyabbO8B8S/19L6wsnQC6MBaiUmndJSt9ChQHXgWCke7dtNUQDMd02xJM0f8HiWV2Jz
 G90g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVt9e5OEADe48Lt5xqOVpRb7WtwvA61W135yJMXy2U9irQBt1OU1n3hvvOvfCIhjOOwXFzMi8eGJtM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyOAUvxT6EPzNsAHHhasUejp4fXM9LWiyUFF22st4WMvWQCryNb
 WimVLjH/NXJQY0fIKDEVOCgsEftPbxTKMUvV7RUDoxLl+a4MqZeMSrpIAfX+I78=
X-Google-Smtp-Source: AGHT+IHUagBWPMmBh4EiOrB3yVjeY1HaiP031J1nWQB2/wkG393Hem3zaDuXF9PmeQAHxLP6A0R20A==
X-Received: by 2002:a05:6512:3343:b0:535:6cde:5c4d with SMTP id
 2adb3069b0e04-53d65de5381mr12041759e87.3.1730987762659; 
 Thu, 07 Nov 2024 05:56:02 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53d8269a86dsm226684e87.31.2024.11.07.05.56.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2024 05:56:02 -0800 (PST)
Date: Thu, 7 Nov 2024 15:55:59 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] drm/connector: warn when cleaning up a refcounted
 connector
Message-ID: <p45gxavvtsr6monn5us7ndf24p47e3vjyykuejtcg5ji5sk2xn@gljukglstv6z>
References: <20241106-drm-small-improvements-v2-0-f6e2aef86719@bootlin.com>
 <20241106-drm-small-improvements-v2-4-f6e2aef86719@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106-drm-small-improvements-v2-4-f6e2aef86719@bootlin.com>
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

On Wed, Nov 06, 2024 at 11:48:27AM +0100, Luca Ceresoli wrote:
> Calling drm_connector_cleanup() should only be done via the free_cb =>
> .destroy path, which cleans up the struct drm_connector only when the
> refcount drops to zero.
> 
> A cleanup done with a refcount higher than 0 can result from buggy code,
> e.g. by doing cleanup directly in the drivers teardown code. Serious
> trouble can happen if this happens, so warn about it.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/drm_connector.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
