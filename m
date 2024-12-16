Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1A19F3E39
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 00:26:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2A2710E1CC;
	Mon, 16 Dec 2024 23:26:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="t5BKnvHQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EA8A10E1CC
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 23:26:33 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-540215984f0so5321990e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 15:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734391592; x=1734996392; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ga5plnRRD21rZgiC5DgyaFqBZPJrKxo5KG3LNUuDhLk=;
 b=t5BKnvHQfnErrrqOvk95dmlJUxZuzKfOBLqvWoliNAgWNURbzornFEQYbRmhXExqb9
 d82dcvFNIjGLqY9o1HR2qzazm/HekJkCsUllzg2mxwCTVUdly4RS6MTSDPYPB8b7MleB
 qb9kN0x0go+uMImyWBcXKO7v2FD7OTLREvABkfXQ/vGPHFUSS/bvU+kwFbNsIXiFLPsw
 aHCUnJVIwqMwQIVUoBaZ68qtubGOTbdm58YbmwkyyTCqHyymKHzFAa1ERQd7A44K+s/X
 ZgTRwEsLQvwv2qIqaxxqk4aT0yUTzQe8WZBsoPio9TvIPaTdh2aNW1qrWFzMH8FyfKlG
 dHGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734391592; x=1734996392;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ga5plnRRD21rZgiC5DgyaFqBZPJrKxo5KG3LNUuDhLk=;
 b=vMm7vTt41zqv6DzB88K5q8F59jXF4x1Ddtkhlq+YPGo5Xn/e+GgAauckMBDiHsYT6F
 NeoD5aMjHu5xUOD2I8eF8iN62ucYgJJy7RWImbPdot5hOPyRAShyIUVKln5vpPUo/Uby
 g2K//qZrRxdrIDrexUvfwSJ9AONgzGAO8W2S8jXTD+NX440Wg+CS2Kxs7FmfObT4JBAw
 re+YEsBXZf5AxxXxDI7R+cwcb47FlLGPh+NgU4b09CHmk3e1tzu24rDDUdDdxG2fCNCQ
 nViQz/Bhasoyj7q9w0FU1VZT+eBrOztE7XCJW5kvp29OsOsI6RLhbsnyOGGm6qWIQqd4
 Wyvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXW1gMKfT6VjkZZAs4YBKobrtzOfJ1TMrvhS2v95mflJw/Sq9ySp6mjsVtqs1955ZFjNKt5wl32a80=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxKPypScXLd0zUB4ov2EqTHHBI4WjzpS84y4PTczzliVLjP9Mpm
 FhncGNapU8BktCb/rvHQnfRweE1zEWkol0E0TXmOP5Tx/ZW5fIiAFlcYwuQ/VNU=
X-Gm-Gg: ASbGncv4PbR2tyI+lpkT7B8i/DiI3ej2xE8QAGSbqVreOAXQ31qaO/D30pzrs3EdGBN
 kju0S6QHz8pSoHLHWPH7KS3+KzAtwbNwlvtQRFbpkbL8QwymRcm7Y3Lq/QpeRBUzvw85E8O/Dnj
 p/2w8IeH81rFUGi87csLUqDRfZofJBIk8EDUHHqeXYhejkSK130okDi97JzvwhGuoHvrIOe4+k6
 sperupZYQaLkToijFgV48Cfhpg6V7zlvxHN7ZqUIyK5YfKYImybm4G0/XJmPVtcH+tTwQ0fj8Wm
 GsmtUBMaKefEo/OdyiCTeGDQ9hFVQPar6eSs
X-Google-Smtp-Source: AGHT+IGJqsn7bXTR3lEoGpFZPPm/vHrxJicdtdEx5gqHp7xCDLE0cMihc/n6szg+zYkNGeZh6CjlYg==
X-Received: by 2002:a05:6512:3049:b0:540:1b41:c75f with SMTP id
 2adb3069b0e04-5409054bf54mr5448476e87.16.1734391591836; 
 Mon, 16 Dec 2024 15:26:31 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54120c13c97sm985014e87.215.2024.12.16.15.26.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2024 15:26:30 -0800 (PST)
Date: Tue, 17 Dec 2024 01:26:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 kernel@collabora.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] drm/connector: hdmi: Validate supported_formats
 matches ycbcr_420_allowed
Message-ID: <3djtdbyy3ndeb5cg4ndlelsnhxcd3jcve5pydvmvsjqp5yfxnr@6lkglusanztr>
References: <20241217-bridge-conn-fmt-prio-v3-0-3ecb3c8fc06f@collabora.com>
 <20241217-bridge-conn-fmt-prio-v3-2-3ecb3c8fc06f@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217-bridge-conn-fmt-prio-v3-2-3ecb3c8fc06f@collabora.com>
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

On Tue, Dec 17, 2024 at 12:54:08AM +0200, Cristian Ciocaltea wrote:
> Ensure HDMI connector initialization fails when the presence of
> HDMI_COLORSPACE_YUV420 in the given supported_formats bitmask doesn't
> match the value of drm_connector->ycbcr_420_allowed.
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/drm_connector.c | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
