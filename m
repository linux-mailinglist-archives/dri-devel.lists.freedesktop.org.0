Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A23FFA4059D
	for <lists+dri-devel@lfdr.de>; Sat, 22 Feb 2025 06:16:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDC1B10E095;
	Sat, 22 Feb 2025 05:16:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="kBy1q0cE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA97510E095
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2025 05:16:25 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-3092643f4aaso24490901fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 21:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740201384; x=1740806184; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=OVU0YAacU3CPA7LBjjQVHcZVAYe0I9EDkRANIrm2Xy8=;
 b=kBy1q0cEld6Uinye+BCAACjKdqeY97++waZ6Euju9EQ2Xek6YZJYBTvFiQJ0miq2MV
 52WAVnE3V6TTUu3LhOxj7QXq9MPnSM4Y3LESeMZvnO92uj4byiMb5oXmTfQOf/NoJm09
 ShqahTM4472Mm1N6fcgGv3haPGPbSaMV1a3lhteDjOYKcHN33i8hMPKJ3hhYd6bfla3I
 9v456VSqrUJxXePR3uNVHr7U/7s4tz2ch3f7FVTHz3Vs6uMnnQslcaglJJmpu9aILOUj
 aW4xk52b4bmjShsdkBo6oC2MIsrsBgoBpc0ypp+9XOIXaOmltbVEBRkrdKJNuNvKKdXo
 ng/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740201384; x=1740806184;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OVU0YAacU3CPA7LBjjQVHcZVAYe0I9EDkRANIrm2Xy8=;
 b=XoCELZpFP9lVBX6yOK0nYutrIDkydEAvOAxC7mayjGLbSxHUaevMqyJAJE/ykiyZo0
 rPapJ0TlLQPmnMJuuoMhaokG5ucPiebUezjOJmMgnnMR3G7huwQP0f/T7DmaN+BjZsLp
 v1ki/neYozATPXiO1VLliPx1XYPJBZ2CJ4pnGnEc+HhjfjcFNvx408ZZQnWWnwSEOVVo
 w1adxBEQNHyAoZjBIBvXoAqE8PHtEQWgS/REsT6MtNV3Z2hi+Cd9TUuzg7/Fh3VFbj8A
 LNi2ekVuymcRxUBKXoCX5cuBlLbRuRdSLzsHGHCYEpJFqlDvmwqVPHtLXJ2an5PfyfC7
 DoNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxT04DFDKHAuGswOugkm0uoUaHenwYUMPWMuVVKpH14UaNZx7g4eNjBEituvBKwMNu1OeX5hr/T/A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxOaxcFdszmsx7Anvl5vFmnPshIAAkIGIOedXH860pQmZedTm6y
 XH9XfuV5m0icY9ntpBuTaZLpGaZ483Q90ISKnGLYG51Tc9YvgmYXsPKTxPduhbw=
X-Gm-Gg: ASbGncta+2Kk8tdEKdlQ/0Z4dtvV3s/EyP2hN1ay+SY7Z/x6oCsI2fYcdcFYnQLMKM/
 NO/tsaiNICKJtPGCv6+Y4un4dzktbhEFsxTozTilYjDtYEzwv3XAcJnUSAijeKcrcp7bYl7kojH
 z9GxPXgcPn17HRLCr8qKYasVBuLq4/Q2vuYRNFceQp42ipKmZPNHFkGjPN/5Unbwia0pgwMpFjl
 CqerXQcaac4RfdbeJn3ow+noOoTKLMOBuL7pmACkMMbxTyEPNTS/rjAUkq27r7jadxMYmYRoyxi
 DMh8weUv6Za2psSLTaZoY2J0hWcACZddZrqVkqFJ3iI6OyYoIv2iGUfcF42mwBdpq+owsr3/k9o
 81W2r+w==
X-Google-Smtp-Source: AGHT+IGUz3dETrnXBm4GATMpvH4STrOmJ2kxSysNuaoNAmCJrs3j7Br8API+6W+CwqlJMhs6QlWQag==
X-Received: by 2002:a05:651c:cc:b0:309:28c9:54c3 with SMTP id
 38308e7fff4ca-30a5063fcacmr34146701fa.12.1740201383604; 
 Fri, 21 Feb 2025 21:16:23 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30a23fe35adsm22358781fa.79.2025.02.21.21.16.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 21:16:23 -0800 (PST)
Date: Sat, 22 Feb 2025 07:16:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 daniel@ffwll.ch, kong.kongxinwei@hisilicon.com, liangjian010@huawei.com, 
 chenjianmin@huawei.com, lidongming5@huawei.com, libaihan@huawei.com, 
 shenjian15@huawei.com, shaojijie@huawei.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 drm-dp 1/8] drm/hisilicon/hibmc: Restructuring the
 header dp_reg.h
Message-ID: <5bv6hja2dn6wcibdwfngs26dv3xxoltuq7qv3hsslw4rd5nw5g@ftslsijavujv>
References: <20250222025102.1519798-1-shiyongbang@huawei.com>
 <20250222025102.1519798-2-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250222025102.1519798-2-shiyongbang@huawei.com>
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

On Sat, Feb 22, 2025 at 10:50:54AM +0800, Yongbang Shi wrote:
> From: Baihan Li <libaihan@huawei.com>
> 
> Move the macros below their corresponding registers to make
> them more obvious.
> 
> Signed-off-by: Baihan Li <libaihan@huawei.com>
> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
> ---
> ChangeLog:
> v2 -> v3:
>   - restructuring the header dp_reg.h, suggested by Dmitry Baryshkov.
> ---
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h | 98 +++++++++++++--------
>  1 file changed, 60 insertions(+), 38 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
