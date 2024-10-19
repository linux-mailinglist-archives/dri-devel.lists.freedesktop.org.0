Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9425B9A4E68
	for <lists+dri-devel@lfdr.de>; Sat, 19 Oct 2024 15:52:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBCE410E0EA;
	Sat, 19 Oct 2024 13:52:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bSPoMted";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 969D110E25E
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Oct 2024 13:52:15 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2fb3ce15172so37624281fa.0
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Oct 2024 06:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729345934; x=1729950734; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vQwmYNtzm3cZvNfpTYZFoEiYNHH4mYbWhA3IgVfwxn8=;
 b=bSPoMtedn5f+zQiZucnMzvaVtLoZVgrZykBTyorsMiK8zYx9VUnL5OF56HR8pEWnDR
 vaQwil2X9Le2syiBW9qVEBPKWwP3cPklnGsg5DLW4v4ltNbKBPcC0pB7QNNre5vXLZnp
 gvGtck0cK9al3tnGZ0rwhQgP0bBBF7W6iRTfXnwKY0bNG4Iq0IXmMhaMh2m4x+byLG0F
 65RPDbfCxHFJh3wwMYHYOSBwOpMQtOsC2WTkjYlBeeXa7yKnIegdOTYbe4BuK2JTj41Y
 nDlL7Yk4wv53zE3UwcAykVEy8xCi52slK1Y7GGn+f8KkYj25Jpzin+cw02h0yebmaSDK
 AF1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729345934; x=1729950734;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vQwmYNtzm3cZvNfpTYZFoEiYNHH4mYbWhA3IgVfwxn8=;
 b=pExnR4iREKwQoTu27xTpRJgW5zVRINvDWm723RinzbWYqGtmBffk/PE98DheeAtEl/
 Lr39SXhv7m5vRK8YvREA0DV/Pgh1s9DCOKXlxq+HnNCAlyBKaeiiL5B+dJSMsZZPuz80
 qlHuCHoegE2eYc8Y2anVQEPI0qlMhwdfvUZ2iJyzHOxRr7KiytPzTteiyYeUZifWafXw
 NkcZnFGOK0xzHottRAlXlMxtuMv3Phg9wq7yGaKoIOsuzgFFWXpA3vNvgpRyIvQCP1cZ
 G+E/B+KVD+nZaGm4cOLMq+6vkNQ22BRxWkNUniJG14bIAwl/5FDkt5ox+ckNPTM3bMQO
 swgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUxFLrIGIB3bpdJ1U6FAtqZV9GUiruovRji/OQrSERv9Sz5fRYN2wOhcmZcISseRZjsH7hotro9tg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyuRQoxi3sZkgt2SzzuZyAQIMm1EbqeVF9L4akxt2PmcsPw+nNg
 Bp8r+Eu7CsSUE7Wo/nbs/4xSAd+jz3jM/drwO9Ikdr/JBwK0VJsnvGQecF+gEBY=
X-Google-Smtp-Source: AGHT+IHtKTwuA/16eF7+hnpWDZ2rjnjnTyFtXBWks05kOqX6iBQ8/kSxxHlzDOwjU9qt3ITnAANufg==
X-Received: by 2002:a05:6512:2210:b0:52c:ad70:6feb with SMTP id
 2adb3069b0e04-53a15b808bcmr1583655e87.20.1729345933627; 
 Sat, 19 Oct 2024 06:52:13 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a15211e36sm534215e87.283.2024.10.19.06.52.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Oct 2024 06:52:13 -0700 (PDT)
Date: Sat, 19 Oct 2024 16:52:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: javierm@redhat.com, airlied@gmail.com, simona@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [PATCH 11/28] drm/msm: Use video aperture helpers
Message-ID: <nua5c3v4vxxqlhtozshhhw6u2fpnhjzmmnbnx7joknlzotm5yr@zbhplfbawmu4>
References: <20240930130921.689876-1-tzimmermann@suse.de>
 <20240930130921.689876-12-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240930130921.689876-12-tzimmermann@suse.de>
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

On Mon, Sep 30, 2024 at 03:03:09PM +0200, Thomas Zimmermann wrote:
> DRM's aperture functions have long been implemented as helpers
> under drivers/video/ for use with fbdev. Avoid the DRM wrappers by
> calling the video functions directly.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  drivers/gpu/drm/msm/msm_kms.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
