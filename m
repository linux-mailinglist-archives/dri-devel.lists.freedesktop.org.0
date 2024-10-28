Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE2F9B2D15
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 11:41:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB98810E46E;
	Mon, 28 Oct 2024 10:41:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jhpbltVz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1EEA10E46E
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 10:41:20 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-53b34ed38easo1448039e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 03:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730112079; x=1730716879; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=SZIT+7wViTRtCbCkEjqqUgZ88WoHF9Xu9mW2Hw20sWw=;
 b=jhpbltVzvSw9pDyKArCL+P+bKuylgSeinoMrhhOEzILqGsLFH4/ohUGud2ukTMjGlP
 Di6GpWITz/pDvnhPcAnLHC+Up1yWVUydHDpg4fw8eL2JF40VZgKLEQ8MXN/j+KqQJoyW
 IPsEJdP2vtMeE7wevlHjyLXENLM29D4cNJHl4m8/lpGKI2H3SZdCq9NBktYY42qfQR/L
 AsAwauAqSf8K4KrlVCadJaaJeBFE3zUdLrC4heRCuxcpMq/8vYx34e1iyF1C5lQZPJRU
 A0C1TixIrldn+e2cAlx1I4nfWJcI3BsEO8BraSUfLBLuJyjmy1auaoBTo8Cv/YmPsmg+
 ZwSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730112079; x=1730716879;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SZIT+7wViTRtCbCkEjqqUgZ88WoHF9Xu9mW2Hw20sWw=;
 b=jtm9bG19Ybqv+fhqvEGyrEx/2dzn+cqfHjdouqQ5j2mfINzQmJbPvj6QxdheTPwQNo
 4I993uhYFt96GEgdWlLPZAOoalyzNOsyprYDrpman0feXO8tV9/nKnMZiEOgyVEZZwk+
 l87HMbyJUwogUaMv4ctQW0bAuF2cAkzKUWcMSj3aR60E2ggBvzeDYezJ4fqtH+HL261c
 cFtMpyziw1qRKFsodw1YOr6rJ0hdJB6g9dAZgN8qHZk529H8r2X4H8XKpGKSsEoCvKly
 8tpN7BnoUyT/CBkHwGSxzl9s5YdABUqqg3uCdjnOnJLOK5FG45JReYoat0LaKpX2kOhu
 e9yw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzMBc30lxMkq985lU2BL4J57H2tyhTjFwOJp5wOmHiiFI14qNC57F9AVam/NemaS1oK/WHtofNr5A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yycjvd5iAAjIig+z9BelONupPIZe60Q/lNF5R+/Gy9oT9ZPYIwK
 V1/KBawlkz/y0L4q4P3szG6gW48ORjUaAhLmls60zcmUrbHxv2sOeDXNrmj7hUA=
X-Google-Smtp-Source: AGHT+IGacIyVLhHZd9j9VvJGOkzqOCuHA5kIm5Z7ZY+EO2eWEKnqJWz0dHf8Wy0AOggaYTiUjU1Fkw==
X-Received: by 2002:a05:6512:a8e:b0:53b:1625:bcf8 with SMTP id
 2adb3069b0e04-53b348dac0cmr2859403e87.30.1730112078871; 
 Mon, 28 Oct 2024 03:41:18 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53b2e1b0526sm1027418e87.180.2024.10.28.03.41.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2024 03:41:18 -0700 (PDT)
Date: Mon, 28 Oct 2024 12:41:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Zhen Lei <thunder.leizhen@huawei.com>
Cc: Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] video: sh7760fb: Fix a possible memory leak in
 sh7760fb_alloc_mem()
Message-ID: <ehzle6x534lfgxbcfisgpy3mmvggqlbh4zbrx2kl5sb2c3hnmn@biaxdd5cjcb4>
References: <20241026035634.467-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241026035634.467-1-thunder.leizhen@huawei.com>
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

On Sat, Oct 26, 2024 at 11:56:34AM +0800, Zhen Lei wrote:
> When information such as info->screen_base is not ready, calling
> sh7760fb_free_mem() does not release memory correctly. Call
> dma_free_coherent() instead.
> 
> Fixes: 4a25e41831ee ("video: sh7760fb: SH7760/SH7763 LCDC framebuffer driver")
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> ---
>  drivers/video/fbdev/sh7760fb.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
