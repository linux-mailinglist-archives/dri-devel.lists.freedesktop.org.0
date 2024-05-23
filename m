Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CE28CD04F
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 12:24:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A078610E4C8;
	Thu, 23 May 2024 10:24:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qd+/wXBO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84D0E10E4C8
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 10:24:42 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-51f174e316eso7029734e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 03:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716459881; x=1717064681; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=YTs4KhPH145/AJRmP8+6lMsBop1Ixgucc2xC1shylpk=;
 b=qd+/wXBOv/YpS4aYkkRP4rRxtdiSktXtl5RKEe3+5W8MkSfBOAgrGkO+3BQZXM1wrR
 NhWJiCYo8sBY3rU3FuQ/EsLNtgQc6h4Vdpa+NjZA4CfHF5b/gQXordMUmmU+P8w3rnBY
 Pn/NTmNiWDH7rg1dR283bRy2ghikjvkKZFdhKNHDAHeb9BR/hfxasd84BD8LdD7VXY2i
 JUi7ZEwmsm5EvGjOwm1wONldCXDtbrSKF5kC4UV9V2xdr/z69a8biVGqlLvqiINbAie7
 ijWWRzS25eQfpMH1rTAWvDPRiWzBzg1h976Lwj4hQtXkLj82Z0gCxDfJXNdu9yasJArm
 Bhtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716459881; x=1717064681;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YTs4KhPH145/AJRmP8+6lMsBop1Ixgucc2xC1shylpk=;
 b=aEgbi1AhqPRHrWkPoW6fZYdQREy+XCcoxmTs310NdCTLCyOG3qOw0RcASGBImaAQDE
 q9nixqwVV+qwQBFsn37CRXUk3dLUnpNX28xSuEZ+5CE59Z+xiL2GvOw8nItPcmF8W3PA
 H3WJOwQ2HZKuLjE7DZNMs+hFGN68eeWAxFCNw3ZeBvqbWr6mtt8O8VSYdTBCHxIh129X
 kIEdfKEybuvY05OrXuIu23BnKj+T2ZsctG/1nue61IoRMagS8WCsc7g1a8H6AqtQkhgf
 2hejgl6mEXZt7iTTqIFfF4HBUfcfMwkcDVrSaj6B9nwhRrMu5k4lA38OgkgdEIwJZy7E
 Foqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGbN0q/SZoQLzh6AkWHFeIR9mAUV76QVgjXzGVynqdRv9vFzin8rH6YwwoXEm6G6Zs6PGjpM1xfzavAVnYKY5jbocWAyesYu4G8Vuo45EA
X-Gm-Message-State: AOJu0YyX6vCAzF6G+M2swWLV17/A2V8JlUYoJ+YGMw2OTEQWWxI72AuK
 t8kPTFc5ikFBkJQx7a4mEc7bhubcfOpvhWCI4p1nYb37AwlPkhl3fLEhuYVjVek=
X-Google-Smtp-Source: AGHT+IFh8tvpeC+TwvjC1fPxZfM+UwuyED0DKgyl3oWL27XorJPrG1npFHJwvig7HdSlbfPLtqhR9Q==
X-Received: by 2002:a05:6512:3141:b0:521:9207:189d with SMTP id
 2adb3069b0e04-526c121522amr2191728e87.65.1716459880614; 
 Thu, 23 May 2024 03:24:40 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f35ad526sm5387014e87.54.2024.05.23.03.24.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 03:24:39 -0700 (PDT)
Date: Thu, 23 May 2024 13:24:38 +0300
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
 linux-sunxi@lists.linux.dev, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v14 19/28] drm/connector: hdmi: Add RGB Quantization
 Range to the connector state
Message-ID: <evhxta7gk6mogntoafibz7kxcgziikrhitrjg45t3p3lhify2k@uwwdo6i4bqbx>
References: <20240521-kms-hdmi-connector-state-v14-0-51950db4fedb@kernel.org>
 <20240521-kms-hdmi-connector-state-v14-19-51950db4fedb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521-kms-hdmi-connector-state-v14-19-51950db4fedb@kernel.org>
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

On Tue, May 21, 2024 at 12:13:52PM +0200, Maxime Ripard wrote:
> HDMI controller drivers will need to figure out the RGB range they need
> to configure based on a mode and property values. Let's expose that in
> the HDMI connector state so drivers can just use that value.
> 
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 29 +++++++++++++++++++++++++
>  drivers/gpu/drm/drm_atomic.c                    |  1 +
>  include/drm/drm_connector.h                     |  6 +++++
>  3 files changed, 36 insertions(+)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
