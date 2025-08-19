Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E417B2C52D
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 15:20:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EED8310E5F6;
	Tue, 19 Aug 2025 13:20:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="3Ymw32DB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A66C10E5F6
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 13:20:24 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-45a1b05fe23so32238705e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 06:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755609623; x=1756214423;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=iK+PjU319NF3+63SA/e/ZLM4YA51y7lBBdjgoAhh/gc=;
 b=3Ymw32DBhMwZNSJhxdxPcUMky7IgxIFSxN+Yt4WhQlP7XxOk3f4FmWL17Dj0hRBWaY
 0bu0LcVv4340wz1CgTbkabEZ1uyD2NMBhejFjr/1SFkKxQc4pc/OuQTe7lKM2TY6jAOX
 +DKnWaCPTfiM3l+37h3ef/v8DxeVfEN3Y7dVgV0djI/ow0OR5ViMJh0M03n9uTsXhU6f
 nya03i5a4jT7vxRNaB+9lTGz+i7EkBLfCkvGfthGmexoB20y79d07qwGS1jAd8W0qrZk
 rak+UQWgY5+a3Zd41nYgU+2K7GMfgS5PHcsdxAZU8Ba5oYfLBcHls/l6n9LhqEunpB+r
 IoNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755609623; x=1756214423;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iK+PjU319NF3+63SA/e/ZLM4YA51y7lBBdjgoAhh/gc=;
 b=HsFMqYCcvrARhObOJhXMGQYWc4uOAildBbePvP7sZ2g+4IaMNMUAurdEbyfPbSJonM
 q+cZWQlCKgKO+SqYyEeJcSt0s0unrga8Atsp5qkYJqPSP6TsmfCyRFhtMTW8r+nZZruh
 guFTUz9LqyAoSEJvV6650vpPe+PkXUCxCvvrArOGihoqDGfX/twhV/vECuqMYn8BOBfx
 6hTbDg3Hx2nEgFnHf9D4b1dyC7deeZd96OHs5GkKiPAkAhatn+z9+vGytCADs2gXHfVw
 iU4ELUMTEZiiXp3+zKsCaScdXCETUBGaFYROLli1fpHGnCShbHuB6f2ldfXGqSjr2pJA
 Trpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4Jgbggz7MqsxGKZVkHFbbCn6ESytDpXRA1eJatdgGSH/Kg+1bxXhRd6dymmfUGKWWy0/QDhs62k8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwFTxNNJ1azoKgaEjhFMJLcKDd1cfTP4+8qcf9i687n6omoLkJT
 SPdFITBEbeMezLYdQscv7GbQn4H0rtmegFfhL+VtZu66rej/RrpMr3Eoccyr36cGmbg=
X-Gm-Gg: ASbGnctLCXHNIRgq+SLw1bx/L3jVxUDJpgJ+e07cJA9U9GRrbmfp4sRcWSxJHg+glhD
 WsQQOX6zkKU9JSzJ+vkmYY/Y3l5+XIrnXnJPAMWva2VmojzfSCNv+Z7/WGM+OvVZwNIOyavVJfB
 FUXB+LMzfBdJgpSoOEdr6f6pz177wKFZW2LB/a1whpa5gl4HtH2G+oe7HcZhiTtiH6v3qKn1/FQ
 Ut2nCLLwFjIEnR6vUPNPVnlxvhyoKwPBKXK18KJB/vH3SEZqhfOroHewKt6tybHP/ddFAfs4SRy
 JAe7u2WCz6IGRvBiJJt+zU/BCNIMZ7z0EV74aE076kIHwdndTSxdVXsCamH+rtWfk6m1eMRs7M6
 qMNRom+F1wXNQ4MgD3Qvc1GshYrOKOihS95RL07SxKBZz2hzH6s/pm/XNCCHdpGz8jUNEDD+w4A
 4XRyPSIg==
X-Google-Smtp-Source: AGHT+IFAFNd/RoQaRD/TbbBTaHuoGyv0Q+NnN05rjh0d94CuTJBBUxpriDjYGFCYgFp1Qcx/lqW/Hw==
X-Received: by 2002:a05:6000:2204:b0:3c0:4f30:acde with SMTP id
 ffacd0b85a97d-3c0ed6c4504mr1917448f8f.55.1755609623300; 
 Tue, 19 Aug 2025 06:20:23 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c0771c1636sm3673176f8f.43.2025.08.19.06.20.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 06:20:22 -0700 (PDT)
Date: Tue, 19 Aug 2025 14:20:20 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: Qianfeng Rong <rongqianfeng@vivo.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] backlight: led_bl: Use devm_kcalloc() for array space
 allocation
Message-ID: <aKR6FAYDrNDhY6Af@aspen.lan>
References: <20250819035804.433615-1-rongqianfeng@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819035804.433615-1-rongqianfeng@vivo.com>
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

On Tue, Aug 19, 2025 at 11:58:03AM +0800, Qianfeng Rong wrote:
> Replace calls of devm_kzalloc() with devm_kcalloc() in led_bl_get_leds()
> and led_bl_parse_levels() for safer memory allocation with built-in
> overflow protection.

>
> Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
> ---

I assume you scanned drivers/video/backlight to look for similar code
patterns in other backlight drivers? If you did it would have been
really helpful to say so in this part of the patch (because in it's
absence I had to do that myself).

However, the code changes are fine:
Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>


Daniel.
