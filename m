Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B5C8B565C
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2024 13:20:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD330112BAC;
	Mon, 29 Apr 2024 11:20:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="uZ0kMz8Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59D9B112BAC
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2024 11:20:06 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-51ac9c6599bso4646837e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2024 04:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714389604; x=1714994404; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=8jsHr1i+3e2shTV7drwyDmrC6kyp1zvUUgs5PDdl9uw=;
 b=uZ0kMz8QwSuLMa0Y61UOkL5GXhu7fcgbLSiMB6TQ85AhF/IVsY2f2MYOveSkrntFLo
 TRFPydgOigGcj3IE1JmgRfxJt+X0t5iua3HZtpeDRfoIjmh/Ce+kLebUncHd9QSPZFVI
 BIU4aOggYZLMUluSOAHEtI/ESr1G4AOrKbKIQ9jA9kk6QwkwUm9CTuxShnzPtvs0Hu9X
 +GE0Bzw+eXJmU0c43Q/PWCspKlPn2CQwFxs3BU78jvmS325Q/QHf8ECXxbSq8Qg2+vpp
 2cnqmo2MGVN9txfdx5LabUB6nutO/GX2LSAZa5F4edIPGZG2IHE1mZrIGH5K54jdsNAh
 /53w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714389604; x=1714994404;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8jsHr1i+3e2shTV7drwyDmrC6kyp1zvUUgs5PDdl9uw=;
 b=OxRQXI4Nbwc3+DEGXc8p0/A5u+SYbsyAkHJGVfYUU4Gf4EGXvccNL252H/8IGs0IRB
 vrtXZbVBJpSjvNBtS/oeYuwmXptf8pSPSUWN3fpABz1venAOUbKtmrD7VIoeskDsKZF4
 b7Fws64O2wspK0Ejfl1uNbloQgSRBQnxY/C2uQA1/ceI8jXphozJUb3yWAsyRQWD6tai
 uTKxCz+VkdnDZ/mQozLp60IUFfJvgzuc2BPKU2a0Mug/JTxAMzNnUPJTchQOJwHm45sT
 u+3p6phKbqIPIQ/cotfHPEPvSiEpQf6MZ8tVvKvYI+m63m8ptGO6wSx5oJjs5Xy4cur+
 pvww==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkyeszRfynVj6T441dbKfv7Xctc2YSyRDQo+1ufiURR2OTIYPpess2sMhDjV2U1KGsX/+e+fJRfHOuFXbDHWMoa/YAM6hIikekfft+aRUn
X-Gm-Message-State: AOJu0Yx0DMMxyrXGSG82+5rufseejrSZxvI7dVG+Qx334astytQ480aZ
 n8IrcTETyuH5C3G50T8qzpa+a5IYSaI/aR97yOw012+XHl1JTvpfMmynw2orO5U=
X-Google-Smtp-Source: AGHT+IEWhb8KSCrCjZUpJ0cIBjaXZi2tC5MyhxWNHeFV7fufH48LCXzuUsSc4zQPDOo03dyk+2X78Q==
X-Received: by 2002:a05:6512:1112:b0:51d:a1ca:5f26 with SMTP id
 l18-20020a056512111200b0051da1ca5f26mr2737330lfg.20.1714389604215; 
 Mon, 29 Apr 2024 04:20:04 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 h37-20020a0565123ca500b0051c4e9ebc71sm1509704lfv.210.2024.04.29.04.20.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Apr 2024 04:20:03 -0700 (PDT)
Date: Mon, 29 Apr 2024 14:20:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Douglas Anderson <dianders@chromium.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Biju Das <biju.das.jz@bp.renesas.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/debugfs: Drop conditionals around of_node pointers
Message-ID: <5zckqabn6oay3wlq7dlvcydbmgio5ktjg3ovia5qpmknpsibi4@b3nkhnrjqtql>
References: <20240321222258.1440130-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240321222258.1440130-1-sui.jingfeng@linux.dev>
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

On Fri, Mar 22, 2024 at 06:22:58AM +0800, Sui Jingfeng wrote:
> Having conditional around the of_node pointer of the drm_bridge structure
> turns out to make driver code use ugly #ifdef blocks. Drop the conditionals
> to simplify debugfs.
> 
> Fixes: d8dfccde2709 ("drm/bridge: Drop conditionals around of_node pointers")
> Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
> ---
>  drivers/gpu/drm/drm_debugfs.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
