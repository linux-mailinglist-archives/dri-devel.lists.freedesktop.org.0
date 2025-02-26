Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8CAA455BB
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 07:38:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29A4A10E0F3;
	Wed, 26 Feb 2025 06:38:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="PFfCa3GK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BB4C10E0F3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 06:38:57 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-30a2d4b61e4so47220031fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 22:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740551936; x=1741156736; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+eQhnwo64qzkTeX1x17WOeYQbFtEQv505e9/PvxsOZg=;
 b=PFfCa3GKm/hq0p72haT1eoE/zGSDrimIzUMqZxNLTKqs8dq9F+DyqWctYJyw2bEpNS
 ebxx6xGGNNOhRU1b/OkmDFi7R/m+x4L1ECULT6Sovp6yxQnHCeSlbFcrUNzL9Emebwh6
 70jy7QVyMpnjaOIsvH+Q48uukAV0y5kQ3W3tyXgemdyRkjyR4PqvX+pqRXAI36YqcouY
 u8K5aXCxdjnpOQBbqO6vlpJngHnYjiPPdOiYAgUNUCTxZeA2GQqz49wwXkvsyFWaJapI
 bq/l7mtgFkvHUL2z7p3HAVEvEO5o0mYUzyUetz4v6t85rYus7TxNdEPz4r6U6WbeW1Ud
 ToBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740551936; x=1741156736;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+eQhnwo64qzkTeX1x17WOeYQbFtEQv505e9/PvxsOZg=;
 b=cWRSq2KrOLQ1vZWRFZy4shcCn4hAcilKmGbrUoZHXM0bfMroWDUDbAdKpUwM4mHpVM
 qig3+7UkkkrmgYwFX2wNT2iXJSpBGcpg27rg7hmt3u8Oq8aKAPDbdWuohTiuUli4VvGU
 oyd0ntEBvtAVlsTy/XjkiTANIYA1cgyRooVnFEOSxYKHxfdoj4e/ddJ4sh7EFD9l3fwG
 67W16Xu9wMhFZTOnI0e6ZWFaQv+Bm+ULZIDE/szD7D3ahCBlm2H7Z8EKcNEgj368+VdR
 r1ZD7zrSdZVFM7+vmuHu7vMN/XW5NJByWhlgcHlIgSm7wPySJyZboLVRl6ASmgU0gaMu
 j5fA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXF5/KX1RwbSvxi5ePcvtpPLdoi3HVxotUryW6SOvA4k78gqANT0Ks8AfwuJtaUktCy9TgIESHZVAQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx1yEh7Vo9jURWydDA2Aih7hTlwcMhu7dXY++t7c+hxXhx24ZU6
 yIc950pLKTWATtE07yup5NmEyuKEV49CMvxVZ2WekHqf2QTI+Fl2+K/gO9ss3S8=
X-Gm-Gg: ASbGncumonE2R5/DvnlGfuHuPPTpvJ+uM8+/4LNsQzxxKqmyE1TxkklvXW+70q4v8vp
 SsSFu35kfjfMqhV+Ox58HIiUSwkFsP0lBj+XnENClUn+nXDg+QnkbarAhzImR5bQizwHn0n2arf
 S+6WMAUxeKeGEBz4NWQxYCb7Vf58heU/RwkwtZeq4IzCuVSMBrr2Bd2QrVP6ykEC6HABdP5uJhE
 ea5gwc98C6iQsbC4gLp+8iQOvKUK9hkAQB28KxIX0VnIV747SblJrZShH1EGT+UdmpPrPOMH91e
 AU+QgHBiX8FNjJQsQmk9SMlTTuNVjV0dKtpgb1OKPOsLfRPgTw3/jrYgaktjifD2Msf4M4CNuOE
 aL/5NUQ==
X-Google-Smtp-Source: AGHT+IGKe/5S+/hxaWyU3JJxotCQJANZFDVGo4oTgujo3yDICmsxKIIeR9yVtprfkpzB915wP2OM1w==
X-Received: by 2002:a05:6512:39c9:b0:545:e2e:843a with SMTP id
 2adb3069b0e04-5493c5b85e0mr2012329e87.38.1740551935803; 
 Tue, 25 Feb 2025 22:38:55 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54852801130sm312953e87.258.2025.02.25.22.38.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 22:38:54 -0800 (PST)
Date: Wed, 26 Feb 2025 08:38:52 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, 
 Herve Codina <herve.codina@bootlin.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 05/15] drm/tests: helpers: Create new helper to enable
 output
Message-ID: <du3n464fulvxszzn7hkx7ugljwn2ry44kizhbfruew2etqdxgb@bsbtgntp3skg>
References: <20250225-bridge-connector-v4-0-7ecb07b09cad@kernel.org>
 <20250225-bridge-connector-v4-5-7ecb07b09cad@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225-bridge-connector-v4-5-7ecb07b09cad@kernel.org>
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

On Tue, Feb 25, 2025 at 05:43:53PM +0100, Maxime Ripard wrote:
> We'll need the HDMI state tests light_up_connector() function in more
> tests, so let's promote it to a helper.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 151 +++++++++++++--------
>  drivers/gpu/drm/tests/drm_kunit_helpers.c          |  61 +++++++++
>  include/drm/drm_kunit_helpers.h                    |   8 ++
>  3 files changed, 161 insertions(+), 59 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
