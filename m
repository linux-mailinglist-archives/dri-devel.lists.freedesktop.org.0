Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C58BE8D217F
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 18:20:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6B1A89B30;
	Tue, 28 May 2024 16:20:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="YbkTLRxu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D6E689B30
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 16:20:04 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-6f8e98760fcso795608b3a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 09:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1716913203; x=1717518003;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WwozNjHzia8oslBT34REru3KdIh80yY+OvMr8Rvverc=;
 b=YbkTLRxurm9lSHcExspBEAK3Fb7X/HPELvP74Kn9EPiaDJT4JaKI8jwejLqBH8G4Lz
 61yHqrMbvHLGh9b9fBO6YuuLsJMTo0pXcCysZUVk931d+pvKgtReZAf/xUszKmR7dR9D
 g852RYuAnrGTLBLZVNGXnZ7uxeeAQhK9KtdIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716913203; x=1717518003;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WwozNjHzia8oslBT34REru3KdIh80yY+OvMr8Rvverc=;
 b=giXq3UqlbKamh7pdFxbhWeCv+L69uvk+KqU/HPrPHfkup9+q4PO8TrEPC/HdqQTVXw
 ekc6LJaQ9XdCqZ8e7T8864K4mKSq9UCHp0WzWZCOufXCqjB6hQvceGryi7yJJPnmbMrH
 3c8M5XOUfu+xCh08btybbqH/6Bn0Agd8RnFL3RWDFzd5ncsAs8D7T9Rqt7AHgviwTNgG
 s0jzBsaWYP+RMx/J4ddKgnCLjTz0wzrql9iUEMvAiPi6zHj4GUABwu2dhE/8GxuB62pV
 BmboV96Ej8NvOtvsx178fxRH/i+5vfcttUTW275xD+SUdw54+BzFFN25RB1VWpgiBqR6
 aMIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQAJr3PeNI0YENPZlhKiCyBtjWlNhYRFLZKrgxj4V5+EDeQKATeERQcsTTSu/oAEFs8OoMGypiET0J1pbryrd9t2Vf3h9mJ5c3v3zExlmh
X-Gm-Message-State: AOJu0YwbE/+5ukHKv/rTqov+vOllFOSIZ9GkQWxVausBj+bE8IfTbLEM
 6YoB/AMXSBAWcWFDsWsrDHUn+g0/ln1B5ptYBW1qwe/zCqQrdPb3gZXl2a3p/g==
X-Google-Smtp-Source: AGHT+IG8rDpNehph5P7FZF3+M+WL7sxADGSNYgbXmeSk+9wKTNEhBfeV+JPxzH7+f7NbZBvjBsjVHA==
X-Received: by 2002:a05:6a00:4405:b0:6f8:e998:3c5c with SMTP id
 d2e1a72fcca58-6f8f4192fd7mr19286701b3a.34.1716913203651; 
 Tue, 28 May 2024 09:20:03 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:8d59:feec:9939:40d7])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-6822092a678sm6473780a12.11.2024.05.28.09.20.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 May 2024 09:20:02 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Maxime Ripard <mripard@kernel.org>, 
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>, 
 Imre Deak <imre.deak@intel.com>, Jani Nikula <jani.nikula@intel.com>, 
 Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 MarileneGarcia <marilene.agarcia@gmail.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240519031027.433751-1-marilene.agarcia@gmail.com>
References: <20240519031027.433751-1-marilene.agarcia@gmail.com>
Subject: Re: [PATCH] drm/dp: Fix documentation warning
Message-Id: <171691320208.2507294.7545188870163730565.b4-ty@chromium.org>
Date: Tue, 28 May 2024 09:20:02 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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


On Sun, 19 May 2024 00:10:27 -0300, MarileneGarcia wrote:
> It fixes the following warnings when
> the kernel documentation is generated:
> 
> ./include/drm/display/drm_dp_helper.h:126:
> warning: Function parameter or struct member
> 'mode' not described in 'drm_dp_as_sdp'
> 
> [...]

Applied, thanks!

[1/1] drm/dp: Fix documentation warning
      commit: c7ce956bb6d0f32ab921b6ffba1a6a834df96f21

Best regards,
-- 
Douglas Anderson <dianders@chromium.org>

