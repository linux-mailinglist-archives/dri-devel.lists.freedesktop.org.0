Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E50A4971D
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 11:23:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29D6810EC59;
	Fri, 28 Feb 2025 10:23:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Q6/C0J57";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4113D10EC59
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 10:23:52 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-5439a6179a7so2161295e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 02:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740738230; x=1741343030; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=sOXRurkxs0z+V+7lsmPMX66oMcslr79MsEtI3f5CfhE=;
 b=Q6/C0J57OU94FEeEvaVo2zwlVE8wPvq+yF8htG2lnd4Zbjb7zQ4fcXPpIK91U8pHvl
 8ZKXL7RGsR0qubNXV2I0X9JMLeQfIjFPQHozQGcqrZibNT2sh+11+v6ohFBZH9qlMHGc
 Vzq/ZqclNe6UiuQrobtV12Z2S8Xk8r6Q3FERqyzIWFIBnHcl14zKpSz84mBuYIFAdRau
 WIQtq/w7sQDVnWstIcyp/mjqbcjZ3zvZ4Dt/YlyP5FCDXhAtJaIumOTP3XhSg9/oxqBn
 QAXekyLKTapYkXVUFIj5/zGQRYQGH9haxI+HY4Va8qAUWVZNbz9ZXVcvNvDxe33l+EEy
 oIUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740738230; x=1741343030;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sOXRurkxs0z+V+7lsmPMX66oMcslr79MsEtI3f5CfhE=;
 b=Brmv5+cI1Lbj7KOJO3OFSfso09JWkZKg3yzjCSby51TbMLLlSnHUaH9NSCTvPizaAI
 8ZwWxdKqlQF3EW2yYYw8rscimmn1Pkd//B4qy8SMDHI1UihNMOVpuQDvBEJafNVYPbvy
 xSmYRDWh/1vN1KbZCCrQB474ciBoinyn8KQiWF94DW7QYPlXIib47aPqnALD6nKXJ0ps
 rPwVstnAWopSQAuganXa4MbtDJezbceZ12GCeY8s89J8HKseh07zH4KYQkAP/EIMfysh
 mZ2dzDGU18FSqh58WH9IYOdbghdfJbXA7tyWW1PwlmgSHVXZARntzzL8A4RbRhPQwLvn
 cV+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/Zb4bYcJlpGYufvZYwYbLvh2bU483Iy0Nw+8oBLYMfc11x4C5d26AkbHAcP0CkgESblgJ0g155hk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz7o1MK8VnN6OWJuIETXwQ+J929vDssKsEx9DfIb38YFIjgXEsL
 o3GEQftfh7YUF4a1Jy6P7YdoPJZg8X2vvNnblJ6PHkWWqCxzj6aoB7QZ1fktMg1hiCdiPHhDmsD
 oSr4=
X-Gm-Gg: ASbGnctVmYlo7R3KCioKTM67LQjnDFcwFRu9s1N2DUBkxtPTur2VGJLmdb+GgDsya9M
 kzzH3JURcZwnhDeDAuyKQtpf+RDVtY6I/fyqIDBiIlnM9XlBJWLWgJy2TvGLnT9q/fpgxKQcr/a
 7oX1tflKIuZgI2Oh0azEsWsqL8eXCTbQjpDCdmGEpBOv8sYKnKfU59zUWKvmZStD2KHBRhP7qQj
 xDAtOjNwPtsMlXWCFvspjw03++4RTC0ro7oWJ6nv90/XZhIZ4dWNx+5XGpD3KWYxhl8eFolx4He
 Q4y/5PTxf+1Q69+KFO5XuvGU5bL7z12kOmcwoBF/AHzBhFMF+jgHP1gxy/gerirK9Bb66OT6vm2
 w05ovJg==
X-Google-Smtp-Source: AGHT+IF9LbW1HCKmZbmSt9YCfBY3dVCCtw9fK87uyuUzNs/7q6xF88ILJDPLd2GLLROaUD03gbt8UA==
X-Received: by 2002:ac2:4c4f:0:b0:545:25cc:23cd with SMTP id
 2adb3069b0e04-5494c3339e6mr1166834e87.16.1740738230560; 
 Fri, 28 Feb 2025 02:23:50 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54944174494sm441628e87.10.2025.02.28.02.23.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2025 02:23:49 -0800 (PST)
Date: Fri, 28 Feb 2025 12:23:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] drm/bridge: Fix spelling mistake "gettin" ->
 "getting"
Message-ID: <qyckacqgtlqrmu7xip3o5h3qjrdqegtvsivtqihg2asbk3rzm5@sagoukfjydp6>
References: <20250228083248.676473-1-colin.i.king@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250228083248.676473-1-colin.i.king@gmail.com>
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

On Fri, Feb 28, 2025 at 08:32:47AM +0000, Colin Ian King wrote:
> There is a spelling mistake in a dev_err message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/gpu/drm/bridge/sii902x.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Fixes: ff5781634c41 ("drm/bridge: sii902x: Implement HDMI audio support")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
-- 
With best wishes
Dmitry
