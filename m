Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1315861E1E
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 21:48:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09AFA10ECBD;
	Fri, 23 Feb 2024 20:48:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="m6YOgKHW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63CE210ECBD
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 20:48:54 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-dcc86086c9fso1295153276.3
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 12:48:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708721333; x=1709326133; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=n7tZ+EC9ojFjjK2NVOfZ08xT+I6M/Mo4egf1wNzLGBA=;
 b=m6YOgKHWi56qtl7k0IA+qaAaD1bW4o64E4NKir5N4g/WBXGfBwhzQ3g1tejwJ7iTa1
 YU5VIy9nCeO8rFS37w0W/52Y1yWdcG4nZgnfeK6wQIbyu+jDTHtOAhisvR1FScfiDXPL
 CV29qWnru/BbNEhOEcCHujFzcJ6UlkYPAVSitR6b9w470MaiCztPCISe9IlTX5iWNF4q
 PgdRt8/h3AfqbRxwA82oCQooSRrJXY9lX2FK5exVSLGLo+hq4xfUDLLBE9OcrVczscsu
 1BeOENaqTT4bn+Q0coHNDlkHTJP7U6gviFMNuA4/H/rLPWUlnhWO/VtPNGZWudQQ5pZ2
 O77Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708721333; x=1709326133;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n7tZ+EC9ojFjjK2NVOfZ08xT+I6M/Mo4egf1wNzLGBA=;
 b=AtOpNlIEJqtw5AH7Sl1hOvY6GTx8NZQiyg1JOtyOhnL97T6yrqI5rbtFTr+jhe280r
 bafUuFwnWw8oPsvFsmkC27c7RuYYJfxnHx+TMeHbTTgezqEvenXuZothNn+xgLDxisHi
 u1h/ldKYQI+nnshoedyrXUOrAZqBB323bKj23bhNo8b9Wjd/i+rLeBoxvq4NfaSM8X6W
 r/MgHMvaJIpY/Gkm45xSdSMYTfaVy0Y88Y/RCHCn4h25XxYPqzT8mSC0oEXXWrftrOUt
 uHGOfnQIXsyu43MByaM7y0Ujk15tXtobewep4slCRWTuicl6l+Hq4NeezXlFwAR7oMqA
 g7XQ==
X-Gm-Message-State: AOJu0YydPoo+/mIXOBHNTgYQis1r2eqLY63mXeMWuu7Zz5aioQTRLhRr
 iNUKhz2cQ85pByxVQZ5mdHeyGnEbkBiM4u0Jz+nu7qqVYmxzllH71A53f3r3EbJ/Fgj666cFmRW
 N2BWcypOGSM096pEvMhXF3jlyJBt9b/uYlhkSeg==
X-Google-Smtp-Source: AGHT+IFvJJ5yAn4KMgAHoNyeQ4+J8UmmdYVdtX1Z5E2Xlcpcrqf29DTmlvRmHO0aafogfdCdtkVo4DtVhDFnL+jvknA=
X-Received: by 2002:a25:e905:0:b0:dc6:b8f5:50ae with SMTP id
 n5-20020a25e905000000b00dc6b8f550aemr912059ybd.32.1708721332997; Fri, 23 Feb
 2024 12:48:52 -0800 (PST)
MIME-Version: 1.0
References: <20240223191548.392185-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240223191548.392185-1-rodrigo.vivi@intel.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 23 Feb 2024 22:48:41 +0200
Message-ID: <CAA8EJppRNF_a1=wz3QTgtPT+Nd5Oowkh2Eh0b=FqhU48u7B4oQ@mail.gmail.com>
Subject: Re: [PATCH] drm/i915: convert remaining intel_dp_vsc_sdp_pack
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: dri-devel@lists.freedesktop.org, Dave Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
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

On Fri, 23 Feb 2024 at 21:15, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
>
> Commit 47f419e07111 ("drm/dp: move intel_dp_vsc_sdp_pack() to generic helper")
> and commit b55b88d86fec ("drm/dp: drop the size parameter from drm_dp_vsc_sdp_pack()")
> were based on top of a tree containing the
> commit 31a5b6ed88c7 ("drm/i915/display: Unify VSC SPD preparation") but
> landed in a tree where this commit didn't exist, leaving behind a spurious
> case calling for a removed function: intel_dp_vsc_sdp_pack()
>
> Let's convert the remaining case here so we can port this patch to
> any tree that doesn't contain
> commit 31a5b6ed88c7 ("drm/i915/display: Unify VSC SPD preparation")
>
> In in kind of merge where this commit does exist, this line here will
> be gone anyway and not needed any longer.
>
> Fixes: 47f419e07111 ("drm/dp: move intel_dp_vsc_sdp_pack() to generic helper")
> Cc: Dave Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
