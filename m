Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 807BC97EB2F
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 14:02:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCCE210E3E8;
	Mon, 23 Sep 2024 12:02:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="M46TjYM8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7904010E3E7
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 12:02:23 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2f753375394so29855311fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 05:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727092942; x=1727697742; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=QVRH50fCKozmOUshjN+dDlF47miSFCtvmdmtQcy3j1g=;
 b=M46TjYM8g/mFLUZdNr9/42r7MLnq30vYSkENJzrqAKIsoYjcUN434IMHR8Hn+9l45S
 CBm6aHMCyybE8eSt+RppmMA2NUi5mV7XKV2DRMEjyMxb5070Ewqtlifzkwqir9BWxvGj
 Mo3o9o4TCPN31LU+h0aWvSHvPcMDLrI3mlS7EBPCJS0ioRx+XJ5anmQRwtIu8SI2dBR7
 8xL6UJ1i/i2hGPAfWYrbCxirvEGysNKOQ2eZnRmMBKveLcWZUBlqDAyBgI7d5dbsAVmc
 Rnl4RCbjg0HgMHMG0yWkpQCTBNnQnSXb/7dvV5FSpQ++itHMA5gK2xilSC/zL6kFeTV6
 KflQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727092942; x=1727697742;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QVRH50fCKozmOUshjN+dDlF47miSFCtvmdmtQcy3j1g=;
 b=Gduao+cuZBy1PFu9MkpxFk2wLiJxPSMQDYmqd/Hnks/lHJwc4piZiNmmSEI3IGlo+d
 Soq7IUT/SUFPGJizFLUIUR0LeBV0kciAOULriyA6buCARqicmeCYf8BqIG5UV69KBp1/
 Zn9suAFaFoQNDHj86NMyjz1G9n67483FnpXCzj0ex+ZmSP/cRmNFYAhJ+AIcrstcCYNE
 bsSwYGJyA4qBulbrId2yznN6wnq48uEZcPOp5wi7mTir0sabtzMiApCCUKvvh/LN/9u9
 QRj7j/kTNDYHMFY9zyce6BO6xU5BgcYlCTDUVWPjkjX9fxQuhPMfeWbAcr5PqQTD7rGu
 nOew==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxqeIjrdbiquwsd/We4rvMsIAkDimzEwALGarHGy1jdNPI+yyaYguyBKOpnnrgDyo0fEbqHoBdJ8g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzMYN17MDZ4TvbXRFB0RHDjzUXf+ZhzVxMdLAnODX/7MG3TrK0A
 cOvN+qCjhlGfbmFWqUo6MD03Qd/Lz4gJZl6MtWl22E/eYTU7dF7oR1wrfvoZAZs=
X-Google-Smtp-Source: AGHT+IEEze98MhQNK9bySuiglBV8sRer7SucAOqy7IS5J0wr/mela9f4okwv0utK9Sj5XW+kWXtIjg==
X-Received: by 2002:a2e:712:0:b0:2f5:23a:106b with SMTP id
 38308e7fff4ca-2f7cc5bb65bmr41075461fa.34.1727092941455; 
 Mon, 23 Sep 2024 05:02:21 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f79d37fb73sm29001501fa.78.2024.09.23.05.02.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2024 05:02:20 -0700 (PDT)
Date: Mon, 23 Sep 2024 15:02:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: ville.syrjala@linux.intel.com, airlied@gmail.com, simona@ffwll.ch, 
 dri-devel@lists.freedesktop.org,
 Lukasz Spintzyk <lukasz.spintzyk@displaylink.com>, 
 Deepak Rawat <drawat@vmware.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, 
 Thomas Hellstrom <thellstrom@vmware.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH] drm: Consistently use struct drm_mode_rect for
 FB_DAMAGE_CLIPS
Message-ID: <lhm7vwyjohbnjls7kazqcdjiuurxij32j2tayldya6qldammye@n5dhn73uze3u>
References: <20240923075841.16231-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240923075841.16231-1-tzimmermann@suse.de>
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

On Mon, Sep 23, 2024 at 09:58:14AM GMT, Thomas Zimmermann wrote:
> FB_DAMAGE_CLIPS is a plane property for damage handling. Its UAPI
> should only use UAPI types. Hence replace struct drm_rect with
> struct drm_mode_rect in drm_atomic_plane_set_property(). Both types
> are identical in practice, so there's no change in behavior.
> 
> Reported-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Closes: https://lore.kernel.org/dri-devel/Zu1Ke1TuThbtz15E@intel.com/
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: d3b21767821e ("drm: Add a new plane property to send damage during plane update")
> Cc: Lukasz Spintzyk <lukasz.spintzyk@displaylink.com>
> Cc: Deepak Rawat <drawat@vmware.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Thomas Hellstrom <thellstrom@vmware.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v5.0+
> ---
>  drivers/gpu/drm/drm_atomic_uapi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
