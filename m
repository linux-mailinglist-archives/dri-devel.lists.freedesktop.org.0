Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0893A2B9A2
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 04:23:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70EBE10EA11;
	Fri,  7 Feb 2025 03:23:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="odCio4Tx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8F6F10EA11
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 03:22:58 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-307e4e72ef3so5177611fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Feb 2025 19:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738898577; x=1739503377; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=uALpbCMvBFofduuPW6uWQl2C4OnvkNNaUMBLkiGkw4g=;
 b=odCio4Tx85XRxZ7WXTu5YPSNEk4t6Ww2+RA8fkXdmRpvDJ6UqoCD3jI/2iFpftC4QV
 tYxTUGiWJJQfgLok4inXHKOR0KH9BCeQo/1X0BrQJm7GtvIVSzhegepTkUUQFGa/q1mv
 FW4mTpjpuWnBTuOVfA2z6bZhEC+psjEC8raTy6NpslJa6AGPLa2+8+vwHhpn01NjOTQF
 +P9aOYq1NBPbhJydtJ/EuCpFgpzZGNzRW1dmlxgcSV3z6oUWFtIMrdwDrJnRDrn7qkyh
 DTWSMZednGJxfu64l6fGwVZkVfIC4VSF4O1yK52DTabwbQSLhWy/gGwrRF2wNWzRKhhV
 rAXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738898577; x=1739503377;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uALpbCMvBFofduuPW6uWQl2C4OnvkNNaUMBLkiGkw4g=;
 b=KjBy/DfCr6BSlBiHTGAn3cAtzTE3zBIrrO3rjaXlVCLeD2ezkwvTNKVWg3cTRZmI7c
 hZL1GpEXxZq+tt7k68eFKH+318dCWX1PcpM+ymjvHHyTdybTQHHEhVwL/BikjYCZNE63
 eFbp+kdxRjC/VV7SDbPKBzdbP6RcOIeYyX+f1v0O9L8sXlcrgc4k14+NTPWSUfWA09Ny
 vGHSsKRO9O3NZGbYxO5zIN7JOpx1Rw0NCFhXCUKwj1hq2U51qNTjgcHX/EppyPO1zeBn
 W6AdHiFzfUELHks2IDgocah8BPPONBTOtKHvRCzx3C0wzzZN/msibvJzIIoecu+ZdIyN
 tV+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVo65P33M0pYig9I/oa+Yc9wE1jm31wb60KLei3iaitzZKGsrSw4xyn3JU82BEwikhM4EtN5/7dFPM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz3e7wULZkxVgNMahAokUCqtgEjg3y0bLb2H964OulvJBAUna1A
 v2s/7os7xgP/NiaqaNfb6PFGpEShc9VWQRy43F4ZTxRKCkfXhOnKQgMZ2l9aLBs=
X-Gm-Gg: ASbGncs0eHCjhOf72D4+Q//4dD9tYmMkgt2APbuWme+wVi9AgrzxAHTAoDaeOHJ7DMB
 snS1oNbi3+rrEOIdbInGp+avBn061f6uAjet0Yfv4yOy5OU2g/QkWiYivQed2YaW3vG4nnBaNxR
 K+Mwl2SUKT2mMhKUczEyPqKjG0FU2S2AO5E2mFSZu58r6aI7AV8rn1GHo3iwxoP8buVNI8+VeBS
 LceLIGg9y7PxtwXHlPFE+4BUcMBp+XANryJ1exS978yqP/WlhuhPAvZB2yLY1E6Cb9fDoS9FCkj
 iaWcJTmnItkGe2bJJSfSMebw4xQ2h8s1tIg6XM9xWmbcIkKfDrPNtH9R2ZBT5+DlTjIyliA=
X-Google-Smtp-Source: AGHT+IFC4Fpe+U5znUFqIBSXDmtc4T7rNKyLqsHSxrXcFTZCGMU3kjSm+u7NZQVRLX8PWNWDM/ixFw==
X-Received: by 2002:a05:6512:3e1b:b0:544:1223:1a81 with SMTP id
 2adb3069b0e04-54414b08467mr306378e87.52.1738898577076; 
 Thu, 06 Feb 2025 19:22:57 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-544105f3153sm305413e87.180.2025.02.06.19.22.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 19:22:55 -0800 (PST)
Date: Fri, 7 Feb 2025 05:22:53 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/tests: Drop drm_kunit_helper_acquire_ctx_alloc()
Message-ID: <6ag2gkxxewljgx72rea773pmtg7ppd7jjlwqyjk6d54fm5mdqm@p5utue3d4jnr>
References: <20250206160548.683996-1-mripard@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206160548.683996-1-mripard@kernel.org>
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

On Thu, Feb 06, 2025 at 05:05:48PM +0100, Maxime Ripard wrote:
> lockdep complains when a lock is released in a separate function the
> lock is taken in, and it's even worse in the kunit case since the kunit
> actions run in a separate thread.
> 
> This means that drm_kunit_helper_acquire_ctx_alloc() just cannot work as
> it's supposed to, so let's just get rid of it.
> 
> Suggested-by: Simona Vetter <simona.vetter@ffwll.ch>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/tests/drm_atomic_state_test.c |  24 +-
>  .../drm/tests/drm_hdmi_state_helper_test.c    | 242 +++++++++++-------
>  drivers/gpu/drm/tests/drm_kunit_helpers.c     |  41 ---
>  .../gpu/drm/vc4/tests/vc4_test_pv_muxing.c    |  46 ++--
>  include/drm/drm_kunit_helpers.h               |   2 -
>  5 files changed, 184 insertions(+), 171 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
