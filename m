Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA258C96D8
	for <lists+dri-devel@lfdr.de>; Sun, 19 May 2024 23:38:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D1F110E189;
	Sun, 19 May 2024 21:38:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KYopEigl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0AEE10E189
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2024 21:38:21 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2e724bc46bfso6391521fa.3
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2024 14:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716154700; x=1716759500; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wSxrfZ0oRAwj9B8MCjCwxHy+wwDOeEeTa8x5GmYxZow=;
 b=KYopEiglSLQErX2WXUiX4J8cUk3AToYEDEAUkQBHi2exWKxnwLZktveVhFyIoIUAiT
 +wawG8qVGfTXPD2QsAZy26WarJ0yJDWMFKynV2f8BqKLSv2dlX2kc4ip6H1y24X6oIbo
 N3jm6hSGbyuCadgwaJz0PfYSF+Va+KEfaI+ISpFOneRRyMHR3f2Cd6gWca9i9TsJlH2a
 Tt0eoUCZkRg0g8He+SHAuv69kJTo3CAKrlpaKPW3f65AspYYd+HNcGVB0Wy2T/cnVj4Q
 RvSfi7JUV54QjMMWjvDvoO4Q+VrRHxdf0WSjJ1Sufo/BuuOK7RfDnGw7A9+VjdcWtsYF
 SBSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716154700; x=1716759500;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wSxrfZ0oRAwj9B8MCjCwxHy+wwDOeEeTa8x5GmYxZow=;
 b=R8+UZ6ULf3ji7HXK0nB4B81Sjz9+651qCZcGQIPy3NtzZ4glHMxlEmlY8JsTrrLp6U
 Uzv75zXrPd9U2SdNpG223s/HNknCh7ehQii7WHk1TiiTpQ48HQXp1E5MkGTKcfqYmg8k
 vzz0qrAvFwB5CWL5yixg0itT969zh3KGXV1XCiqr/cdOalNSA0/FtXqHyY5MQVe74I3b
 uU8u3mcdjsTtRjmb1RcpDqxwHhuLuaAa6eRCs3YvtOxd2J72lwZjdqDHTF4oWYIiHV+1
 cR4YTrvxtFU34ZjQ1PxqpLMV6iBrPsQcUaIwGVHNdweYXwVCv4jItk1C+LzxLQOLu45Y
 7Xww==
X-Gm-Message-State: AOJu0Yw2IUVbVfnE1BtYLpUAbHve7R1aBw4m2E7gtufvwxsmUpyDfGuw
 dzo9f8uFZ4AHSOu9YLIpofkYgtuKLxK4ak25sw5hy6HxhGNSrCbJxwtmdKi7h98=
X-Google-Smtp-Source: AGHT+IEUH19V+vEmh0vdgqdjb2PjC/szcp5BDB5ZW0G3HCDMts+Vy7eNFw1QUHccveiG8GvVfXL24Q==
X-Received: by 2002:a05:651c:1045:b0:2e6:fee8:7cc1 with SMTP id
 38308e7fff4ca-2e6fee87f09mr73749981fa.34.1716154699832; 
 Sun, 19 May 2024 14:38:19 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::8a5])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2e4d0ce38b5sm32082041fa.51.2024.05.19.14.38.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 May 2024 14:38:19 -0700 (PDT)
Date: Mon, 20 May 2024 00:38:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 03/11] drm/bridge: analogix_dp: convert to struct drm_edid
Message-ID: <kky2o4p2gpx2kbilhfbowoltg6hne6whqllj4egb5hljxukawm@su6bjg7ovqgn>
References: <cover.1715691257.git.jani.nikula@intel.com>
 <6f3bd1233a0922551761666f0c96c3766e3c5f96.1715691257.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f3bd1233a0922551761666f0c96c3766e3c5f96.1715691257.git.jani.nikula@intel.com>
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

On Tue, May 14, 2024 at 03:55:09PM +0300, Jani Nikula wrote:
> Prefer the struct drm_edid based functions for reading the EDID and
> updating the connector.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> 
> ---
> 
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  .../gpu/drm/bridge/analogix/analogix_dp_core.c    | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
