Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 972C79B354A
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 16:49:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 381F510E509;
	Mon, 28 Oct 2024 15:49:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mzJTfD0E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F10310E14F
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 15:49:08 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-539f72c913aso5719031e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 08:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730130546; x=1730735346; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=KISn4ajEN6jm5LZjsepP2y26q/blNdWSZ5nbOIICJkM=;
 b=mzJTfD0EiTPPv+kWb1J/bkjcwlcgjy3Bo1FX6BqCL9J3uU5tksF3gbHL1LAntx1a+t
 lhL1I4y/yQrp1PQjciqA8xkn3i0MIk66kWF6ZN5vHvK5LaUr0++oP1Ktn7xHt3cmXyQf
 +fRI2S7B/vxIwxIz9tNeDMAP+iNZ9e6zMd2AUWZD01DUrCJWG2halb5CSEU4lBqJ9gnZ
 Xx/qkiCEtVM26WDTfhDtrgxoEqXCBTf/SxrheRKom9K9EaAxydSi+WEBAgggNx4pbziJ
 0Z99ECS5SxWWbPCF3egY8IksjdVSfgUJDZZprRzRhHZ1M2WgIW/OD1lgZHRq4FLAsZO8
 gnJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730130546; x=1730735346;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KISn4ajEN6jm5LZjsepP2y26q/blNdWSZ5nbOIICJkM=;
 b=jQ4sIPyUcPrhHH7WsRQvDL3Fr0sRhHPxB4aWiyV59JAba5RHW5VhfDQAVi+tcDrQlh
 Bh015G4gtze2iHeK/5vB3kBqWHLLHlLY3GqgJYL0F7+AJvXovtLz6LQwuhU1nfSk5pXs
 lC4ibfk1/VQLhKZ9UTZGzoTgv3avI0QOleBwYKEQ9otzfSSmSyPFnH8NgBhpTjMqk3Qc
 yjI+cbPC07thkSmr8KnJxImXCaHn1T6FWXNEUKdAzfzcOaUu5D3YFYoZPX7JgMD2mswM
 SbVKH01Sqs3S3PezPaVgXEdGy3x9NyZ4aef5hD7m4l+5l0xhuEgKrsmtO0Vi5KNrxWD5
 dWnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVskMmtz3CWEEafdsd3AhvexH74j7TOA0QXVQ5NQay7VzgLuAcMzZ5FxGrH5s0Sra5kj6bll571OYc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyhful7ANJdKEwO34MVh7Ce75iv332A+onjJyDz4mPXXQKwh1FB
 /6+DpIQ+mFdQzfoV40651hkKatmIXy9cOhUiB162i5VTxhOd3tWughQf+Pv1DbU=
X-Google-Smtp-Source: AGHT+IFI5tmzS11hemouTLmu6s90tOaOy8jXdLAbgpJykIrY0NOiAIeJNt91xxpzNdrysH+4FtKz/Q==
X-Received: by 2002:a05:6512:a92:b0:539:fd10:f07b with SMTP id
 2adb3069b0e04-53b34b39774mr3854774e87.55.1730130546439; 
 Mon, 28 Oct 2024 08:49:06 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53b2e1c7aa8sm1106077e87.187.2024.10.28.08.49.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2024 08:49:05 -0700 (PDT)
Date: Mon, 28 Oct 2024 17:49:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: linux@treblig.org
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] drm/vblank: Remove unused
 drm_crtc_vblank_count_and_time
Message-ID: <mfyy44dn7rrshmc3m4da5chmt3lthppatv7qpcjhs3fam46zx3@bk2uusqgzplq>
References: <20241022232934.238124-1-linux@treblig.org>
 <20241022232934.238124-4-linux@treblig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241022232934.238124-4-linux@treblig.org>
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

On Wed, Oct 23, 2024 at 12:29:32AM +0100, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> drm_crtc_vblank_count_and_time() was explicitly added by
> commit cf6483050e9b ("drm/irq: Add drm_crtc_vblank_count_and_time()")
> in 2015, but never used.
> 
> Remove it, and rework comments that reference it.

Not having the deep knowledge of the drm_vblank code, dropping the
function unused since 2015 should be fine.

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> ---
>  drivers/gpu/drm/drm_vblank.c | 44 +++++++-----------------------------
>  include/drm/drm_vblank.h     | 10 ++++----
>  2 files changed, 12 insertions(+), 42 deletions(-)

-- 
With best wishes
Dmitry
