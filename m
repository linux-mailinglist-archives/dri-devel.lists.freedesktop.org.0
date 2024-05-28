Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F12D18D113B
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 03:01:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2C2010FD92;
	Tue, 28 May 2024 01:00:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LhUwVtvv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C61210FD92
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 01:00:56 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-5295a66e775so376316e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 18:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716858054; x=1717462854; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=BmwopWG0DiE3sCpp8aZ0JQHOY+FYWa6TPkm28zzJyuE=;
 b=LhUwVtvvDMMFau44V1eX6sEze/yGiREx02VQHbhjynm5Kba5lRVMj99PlfTVVSgEwB
 mtSgB+wn6SmJ/mLQgvuNEfp9ahS13oZZTFTe8f/ptAFUDR9RGpg+Rk+3IogwLjHN2RrW
 wOi7jKN9vA+0xfamuthZHDy1oULcdrkcRgMFSQH78xftCHf/058w+hgBJWHQyhqEIN13
 Kzum/qBH3rbA4J1o2AtVh30kM67MM1AHqP+utRPN9W5pB9ZdPD13VXa0nPeFmWjPaTgO
 2qRLmI/co0035bTZJVwN1TD9RFCPhQr+ETD+05cBVPOexMYw9jbnHOlFEJsN6+hkZDuN
 RGnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716858054; x=1717462854;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BmwopWG0DiE3sCpp8aZ0JQHOY+FYWa6TPkm28zzJyuE=;
 b=hj5dzJ2fNjzyOR5jobzSKa8A12JakoPtrLkG8H8MqcIStIj+jXGgb1FCZRVnxQssEI
 3VXBmrYCMjkHoa4U5VZ+qrdS58SeuoXj9ppFzNx6WabzovJjVemQsVawbNAaHMl4f4T2
 CjXexvgOGidsRkNhgHbk+eIIDxee9ZmT08K5eldPbjrqf9Xz4N3qwq+nL+Q76CAz53b4
 7xqLz0egSx7JLI/cl0TaY1+pvv5CqhGvc6Pa6PHnirB/rLQt4bTQm0JXl5f718S7oK1o
 eGSst8+hNI/HDYNV3HXSNJoflVPbydkyiIQA47AuZVV2JIJmFc1jImydFvgdkLECcj/P
 V1Ww==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFtlIz/h1WP5TIx4tOSYdRgYUqO4NGDMKnUZ19WMvFtU2jUe8fLLkESxuUsVro4XB265Y6IBokbs7brx+UQ1P3Xd/6icuO6YlCUXWBlmJY
X-Gm-Message-State: AOJu0YyThQ0hJdAfu9MDJ2SNbG/oIfpZ5RVu5WlROLRLGLtGX4bdkc2P
 mQ5AM6OL3OIbwTq8uzE4CVjeZuJx1NBTR65C1X9djPWQvm1oBki+Pqla93v+oJM=
X-Google-Smtp-Source: AGHT+IFvbCrRsIbF9xwlxxNScbQE81pHqx1ki/P6zSR2F11gCd7AhgIu3KUS7x8FnRnamS3CF4QPsA==
X-Received: by 2002:ac2:5a07:0:b0:520:11b7:6caf with SMTP id
 2adb3069b0e04-52967465dbdmr8591708e87.64.1716858053510; 
 Mon, 27 May 2024 18:00:53 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-529712f32f7sm825854e87.282.2024.05.27.18.00.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 May 2024 18:00:53 -0700 (PDT)
Date: Tue, 28 May 2024 04:00:51 +0300
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
Subject: Re: [PATCH v15 09/29] drm/display: hdmi: Add HDMI compute clock helper
Message-ID: <gdfhorm6pj7l2z4mfhkyabtckoprp3xmdcihjnulzt5gcbtlbq@hmaoimvgwgqn>
References: <20240527-kms-hdmi-connector-state-v15-0-c5af16c3aae2@kernel.org>
 <20240527-kms-hdmi-connector-state-v15-9-c5af16c3aae2@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240527-kms-hdmi-connector-state-v15-9-c5af16c3aae2@kernel.org>
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

On Mon, May 27, 2024 at 03:57:58PM +0200, Maxime Ripard wrote:
> A lot of HDMI drivers have some variation of the formula to calculate
> the TMDS character rate from a mode, but few of them actually take all
> parameters into account.
> 
> Let's create a helper to provide that rate taking all parameters into
> account.
> 
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/display/drm_hdmi_helper.c | 61 +++++++++++++++++++++++++++++++
>  include/drm/display/drm_hdmi_helper.h     |  4 ++
>  2 files changed, 65 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
