Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F3F998B73
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 17:26:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5125110E95F;
	Thu, 10 Oct 2024 15:26:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YXpVQH+z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6754A10E95F
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 15:26:17 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-5398cc2fcb7so1339906e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 08:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728573975; x=1729178775; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Sjv95FcATPuD0KP4sHFq/UApzMJM/NMZewKQ0oq5ikI=;
 b=YXpVQH+zZmUeYE2z3aXXum3Z5jV9ZmJ3Y4rBmtUMsGwJ6+hRQgvbbwfnoB9cr4o5+R
 XDCZPZD6bca9fZepMaTFRvnAHXLVynVnurP9SQ7MSjRJYYrP0ZMYa60MmRvQIVCdQenc
 xnhSwOn6qE4YoJYpUQGzqQ1UzmKCoqa1AGVv2F7RYLhy3sJAAjz+OLAGsa0oohe5204L
 OokOjkBzLUOEtFKurQfPx1dLyVC/BUC/6/IIzWU67W8deVooAMxe0PkE+jxMY8M4P5+J
 f/jAzcijxSl18P+hqAp2C5Fxgg2IeN/evq+sGwYZKoHJlPSxHOuTPN8dAoTK0rC4Q9HJ
 W5RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728573975; x=1729178775;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Sjv95FcATPuD0KP4sHFq/UApzMJM/NMZewKQ0oq5ikI=;
 b=q1clE8ugAgqHGeh21JvAWXvEEPYYvYvJv2V3mx8gGIEV/SV82wBE0JcABunIX+H/eT
 cHSBLWS8ltXptsraftAMV1wHCtWE6CumBZHrC9g8ugRoEP4CauaIHh5HIlE/dEHDyKQH
 Ht3NrqQsq7sNRXEEH2Lj5ArTZh6nH3s0Fw7pgUd8HNA5wLUfioDDBpJ3FnPyujKAruJS
 fFUzE3oRrGzuZ63XNkwN3tymyODZKx611gJKGt5a0WK6uoZhg88eziAIUKVhTxaj391K
 ijNJ7Pi1AJXrIRuEzoPhDsk/Nsb0VvTcWOPvdMOv7dQcnwpk3yDxihxp2aG6qa6phyoK
 KODg==
X-Gm-Message-State: AOJu0Yz8dyNPZBrfmdxKOCu/Uu7Z0LUTqs8qni/Jmm+Rq6Xk+1Rax9nk
 Azxyyc5HlFJsW/VDup00/i4v+3Wi48mRJpfPu5xhdr9fNIMk7H0dZ1cEnRx4nGg=
X-Google-Smtp-Source: AGHT+IFJsbsDmm6eiwBtSIMPdm44NFqMMEfCi5YwEg7a+EYMDtuYGtgssNmQ+Re43AO2ySLd93pCRQ==
X-Received: by 2002:a05:6512:3b83:b0:535:6992:f2c3 with SMTP id
 2adb3069b0e04-539c495ec7cmr4698143e87.41.1728573975454; 
 Thu, 10 Oct 2024 08:26:15 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539d0c2d25bsm69243e87.5.2024.10.10.08.26.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2024 08:26:15 -0700 (PDT)
Date: Thu, 10 Oct 2024 18:26:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 ple@baylibre.com, neil.armstrong@linaro.org, andrzej.hajda@intel.com, 
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, 
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Subject: Re: [PATCH] drm/bridge: ite-it66121: Drop hdmi_avi_infoframe_init()
 function call
Message-ID: <wsz5umbmcunw3bm5ppqxb4ypcryvgrvx5vndig5dl66ubt75pf@nwzkwnytswwz>
References: <20241010092643.1048116-1-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010092643.1048116-1-victor.liu@nxp.com>
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

On Thu, Oct 10, 2024 at 05:26:43PM GMT, Liu Ying wrote:
> drm_hdmi_avi_infoframe_from_display_mode() called from
> it66121_bridge_mode_set() already calls hdmi_avi_infoframe_init() to
> initialize an HDMI AVI infoframe.  So, drop the redundant
> hdmi_avi_infoframe_init() function call from it66121_bridge_mode_set().
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
>  drivers/gpu/drm/bridge/ite-it66121.c | 2 --
>  1 file changed, 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
