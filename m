Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FBE984EA8
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 01:06:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FBCE10E797;
	Tue, 24 Sep 2024 23:06:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bbEiEIVS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B36AE10E777
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 23:06:40 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-53654e2ed93so7190086e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 16:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727219199; x=1727823999; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Ot0UCcvaEAKPUSxY4CDMqGuFsrwzINAe5eEjab+YIEg=;
 b=bbEiEIVSsBRv4zZNw3/317dSSJzPhSt3wXQEql7RLN46qaupJvoAp/6LstYtOdrwyR
 OEyL5YhqI6UQexOnTluG6Yb7MNzypvo2RM7QjUyAFM9+KWYtCcHnHE/3/Ps6CuGYJpdf
 7imBJpvqoWZC+EstrQKJx+bWqVkOL3NBjjincXqzH4bFXIeYEV4Z95iLWk3Hxusovy+5
 a11iMynxb17DCP8nW072V4/QMcJ7bwDvXn5XBMhVqd/yBBiuoeRzGvja7Fowzuo3pa+U
 Iv9xXj4f/hONXg+ap23fLx88WWkcSVstgVZ8oIKzcfDbHXEWLkblWxXUF9dwpNqHhZbj
 TZFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727219199; x=1727823999;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ot0UCcvaEAKPUSxY4CDMqGuFsrwzINAe5eEjab+YIEg=;
 b=kiWRJuFR57Hmedz5QRBdZIu/VL7iDBInTtPuiz6jRxo9vLR+/c/u2j5W5FztAxiPPf
 kZlxkW0w4dsZ23pymJBYpxITj6PhvVAtA71QiWTqlyEtxK5jAZkkOr+L0r1VLFctzGqU
 H/sAGhVI/zL/Djcvki+QtM6lllCcV7I58OvjHzG6y4gQNhyghPqNlMEu1/ddXfB7HFfU
 ELpCTR2v4RTeOtOwuBdLLqfWtkJfRrCWg1rQLDexGcbE8vSbct56Py45a5SFYfI1V8n8
 Tdij13FOFxRzsQRkmsaFmox9nqFcVM6pWMJBt1VK5uP0oge7fnSHEjQ22NcnHzu4wCY5
 fpww==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRKFAmoP/uln/OJKUY1gi/+OkWw7i5aZHZh9tdL0mr+3YVohjRxkMg0QQHtVZ6DauGWKMBBkEJqdU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywl60bZdxIpYdd/TA/g+zrzxqRByoyZ+11ebv0gY0MvDwqkbUXW
 8pFvLXketvm1iS+A6q8+ZcujbaEYPH7l8cQLICQOkDEe58TDxnaJUQbMOAusc1A=
X-Google-Smtp-Source: AGHT+IGdSmMW42umh+q5VuXZORxUx2TV5lqbdEctn2Rn3L/TYI6A/pArZFkotNwLnY3N3aHG3FKpiw==
X-Received: by 2002:ac2:568c:0:b0:536:9ef0:d854 with SMTP id
 2adb3069b0e04-53877530b7emr326255e87.32.1727219198658; 
 Tue, 24 Sep 2024 16:06:38 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-537a864e26dsm354725e87.295.2024.09.24.16.06.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 16:06:38 -0700 (PDT)
Date: Wed, 25 Sep 2024 02:06:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, quic_ebharadw@quicinc.com,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2 01/22] drm: add clone mode check for CRTC
Message-ID: <y2apz5arp5d7jv2fqujh2qyl2gqovmpvkpvpvpxewitfcreke2@ihung7uzmcwu>
References: <20240924-concurrent-wb-v2-0-7849f900e863@quicinc.com>
 <20240924-concurrent-wb-v2-1-7849f900e863@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240924-concurrent-wb-v2-1-7849f900e863@quicinc.com>
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

On Tue, Sep 24, 2024 at 03:59:17PM GMT, Jessica Zhang wrote:
> Add helper to check if the given CRTC state is in clone mode
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  include/drm/drm_crtc.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
> index 8b48a1974da3..ecb93e2c4afc 100644
> --- a/include/drm/drm_crtc.h
> +++ b/include/drm/drm_crtc.h
> @@ -1323,5 +1323,12 @@ static inline struct drm_crtc *drm_crtc_find(struct drm_device *dev,
>  
>  int drm_crtc_create_scaling_filter_property(struct drm_crtc *crtc,
>  					    unsigned int supported_filters);

Missing kerneldoc

> +static inline bool drm_crtc_in_clone_mode(struct drm_crtc_state *crtc_state)
> +{
> +	if (!crtc_state)
> +		return false;
> +
> +	return hweight32(crtc_state->encoder_mask) > 1;
> +}
>  
>  #endif /* __DRM_CRTC_H__ */
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
