Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4EB8CD17C
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 13:48:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A664D10E112;
	Thu, 23 May 2024 11:48:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pDZ2AQXA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A01AD10E112
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 11:48:08 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-52848dcebe7so438939e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 04:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716464886; x=1717069686; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6E61Jxzxjq7f22HqS8A7YYLGqKHl4SecZqgeLR9j6N4=;
 b=pDZ2AQXAcvWalPJe3chJvNy2tt8F2iR7nvlnLuZEruMjPSUCKBgte/RqYMUWpb0KWt
 qEKVfK69HzDKieiJgKHQKclM0WUtzAp3BUMDjb4WogSqXbrSZ2D7TnAKHezZ9O8x79UP
 NlTOsfcATzat6qD1l8KznB8Sxmureq9kSWwU3fsuMvmU73kJVsdjK1djol+Winl7Z8s1
 aIMJPn6jUxG1Yyd8PmnfyrykdiZGNOBu/jdCqLjHZd6DNx8eIfpXz97jw95VLX2Ps3aA
 cyancXn2BNxfxxE+A1ClmUmyx7ZMS5tcaWXdgRU1R7gdYNTL+/0hTp2lh+lVjNZgYSYT
 pwVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716464886; x=1717069686;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6E61Jxzxjq7f22HqS8A7YYLGqKHl4SecZqgeLR9j6N4=;
 b=RKm+4b9xnh/BQF1z056siPOk23Lx8PRmUSpOWawHvLUhm66Kzcbtdd2/k++CaY/PQ5
 K/L4/lGCeE/gCaI8eN6kiCK2ardl+zoDHNMSavj/0H1jXrvx1SZrcjCDqr/mie81u3di
 jK27bdHZSZo78vi8tT01tfsVci0qXzPKIILq/TPF1/IMooVg/uQtqzSZOBxb0Vng9sta
 FAuOWUZ4kREjaSO9AsXkFipFXUymNg2GhiFhG7inhoY0vMqxq5rAsAaZt5rNOvo3gSf5
 WOIn+70o7v/Sw0G82aTKWKriwA0uJ6ZoORuT8LsHKpo9BrrddvhSDLp+T6N+vKJcI6Ij
 4Mag==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEL5i18/zEAAt5YfM9r6ZItDw+Z8HvA6HGHyVK9KqqgSFB3Ej7R9O2k6k6I04dr9Lu/cXpkJ47Bc+5i/YZvh8BSeHYWvkrMGdOoU3WbvZJ
X-Gm-Message-State: AOJu0YyvDV2OMlKWWAlrNPqy3a1t91lf2wZRjSbVGiKtJdsbPDXr/QOg
 7buQt602Rh9gWY9F31d9xdiRCQQwyOTkwVkTZNFyiMKBRWW0g35VJHLvGpJKyRw=
X-Google-Smtp-Source: AGHT+IEyzI18nfzrDPezUD9GxCNOdOCNYajNRn6pfAF677xU9i/D+vNI4ocAHpHkdn63Af8sVdouJw==
X-Received: by 2002:a19:2d45:0:b0:51f:30dd:f35f with SMTP id
 2adb3069b0e04-527ef9d932bmr566891e87.14.1716464886556; 
 Thu, 23 May 2024 04:48:06 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-528ce560b22sm42924e87.238.2024.05.23.04.48.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 04:48:06 -0700 (PDT)
Date: Thu, 23 May 2024 14:48:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Andy Yan <andy.yan@rock-chips.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Sebastian Wick <sebastian.wick@redhat.com>, 
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v14 23/28] drm/connector: hdmi: Create Infoframe DebugFS
 entries
Message-ID: <dflaec5kcwlo2y23txb5susqimiohuvf5uox5kecmbrcs4wnox@dq7xak3vcazm>
References: <20240521-kms-hdmi-connector-state-v14-0-51950db4fedb@kernel.org>
 <20240521-kms-hdmi-connector-state-v14-23-51950db4fedb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521-kms-hdmi-connector-state-v14-23-51950db4fedb@kernel.org>
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

On Tue, May 21, 2024 at 12:13:56PM +0200, Maxime Ripard wrote:
> There has been some discussions recently about the infoframes sent by
> drivers and if they were properly generated.
> 
> In parallel, there's been some interest in creating an infoframe-decode
> tool similar to edid-decode.
> 
> Both would be much easier if we were to expose the infoframes programmed
> in the hardware. It won't be perfect since we have no guarantee that
> it's actually what goes through the wire, but it's the best we can do.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_debugfs.c | 152 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 152 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
