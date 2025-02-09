Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E2BA2DA5C
	for <lists+dri-devel@lfdr.de>; Sun,  9 Feb 2025 03:11:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7978B10E1EE;
	Sun,  9 Feb 2025 02:11:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pTBWeMg9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48DF310E1EE
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Feb 2025 02:11:25 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-30613802a59so34447631fa.0
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Feb 2025 18:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739067083; x=1739671883; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=5xAVhVop2aTDGIjV9AdqhKriCgeATAkESM8gozGS0rY=;
 b=pTBWeMg9FB/aZrnaoRHBXgCK+ZfjsqDdrMykJz4n2n6LUcDoHJxouPOo5PqeBvKls0
 sHbgrqYE+a7pdIHUQRcBeuE7/d76lB4WaTifmIqnbWSUkN8d19zPNMz9qDqelPwGGmoN
 ZJfLAoXhZ5MdfyfpJbXRRDZRrG5V/GmNbHScAjjSjidi9z4uWONyIGI64Fl1CkjNPIUs
 Esyut+EZEMTWMUWt9ai7nC4rNAIaWsb7AWcih1T4EAnrfWUH+PU7aH6D/DbXlI38jcAa
 2vvOtYVeqzdDQuNAesmngdoKHQk+Kl+LvBJDO/4/MSXHy4YoPwSm9Hpa0wiedrzA+kOs
 oVQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739067083; x=1739671883;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5xAVhVop2aTDGIjV9AdqhKriCgeATAkESM8gozGS0rY=;
 b=rHa79s2dYt57j7n9UXYsOU39pL7fSzWss/AMWT8oRKedtL5YfY2yJCEQeH4yRCXEeW
 wbs4r6yNmJxdVhq4OrYN3hWRWqfDHF3xBSx81JRgml14+wHkMvUbRqqgnDs4nY+1A6Sr
 wtuwZFVZfxH1pEcFHhePi2JJvbX+LD/EaiZ+kaHgxBDfvV+SIG4m+H7D6R3QgJ8kDRGg
 fTWiOl0gaD1HYGvSD/S76Dm4ngrQMhDWGUqmu6rHfGgQflGQu4MBiZf/bIQS2qUdm8dB
 g+y3SNM2A/4kiEoixe2Dek1I3M6owKdPS+d39qR/gOiRV/EWnprSj53OOzBuEIZRqYdx
 jNdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhLi+R3031mR1Qaf85xjtDAeX033nBQqQ2epVdINI4qPjzjRt07ZjAhoTXFE/eXvD0Cuo29rx1rz0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxKgN3GNck6wyRqhCTdeBhJ1oiOEQjy2V/0e7TqI21wiVrKYEej
 DkreteYXorhDovVCZCjjBlGgT4e4d0iKKHdg3rp5y6PEZFytGMJJ4xeDLVW2Tgg=
X-Gm-Gg: ASbGncvCtwwRscaiNYmkJUMqjsJgBrjniR81cd4WI+/OjDcNAaWZQFrO83gMTmU3bp6
 jQU8eVxeM/lrxD+B64j/dY3e5SRsJzZi1GaF2240qxESMkTcKHNNMAc6YNdoAhndbtAWwyN5S/W
 Nf62v/RIf8L6XjZ2TFvFYllizBs1eQzf13M+LneiNkPbFQooqswrDdcLXfgKxh6uSfXHfueSdxs
 OaobO02GokGO2SkIPLWi0xhwRTlp1OOdQ4doWkiRBKcvzc4fTjvF5/QCpP2vHG5JZQW0YwX6Dgl
 yuB2xOMkWCHPDl9XBVRye+2v9K/sgBlZoz4ol2hDc6ijiEIEmL/InN4e4skbqNeFNGoZddU=
X-Google-Smtp-Source: AGHT+IFs6OrEdoSwUPTIH9fVG0mx0aqa7qNKEWV50/9z/Cggn7qt0oX6DOfpW1sximTShUpmIGidTw==
X-Received: by 2002:a05:651c:546:b0:307:2bc6:5eae with SMTP id
 38308e7fff4ca-307e561ccd1mr27868491fa.0.1739067083535; 
 Sat, 08 Feb 2025 18:11:23 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-308ea506dbasm448771fa.51.2025.02.08.18.11.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2025 18:11:22 -0800 (PST)
Date: Sun, 9 Feb 2025 04:11:19 +0200
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
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 10/35] drm/atomic-helper: Change parameter name of
 drm_atomic_helper_modeset_disables()
Message-ID: <ktlxm3pzw5n4fkwzocz3itcl33pv7z5rfrngema47pyal3x46c@5k7knomejiz3>
References: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
 <20250204-bridge-connector-v2-10-35dd6c834e08@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204-bridge-connector-v2-10-35dd6c834e08@kernel.org>
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

On Tue, Feb 04, 2025 at 03:57:38PM +0100, Maxime Ripard wrote:
> drm_atomic_helper_modeset_disables() disables all the outputs affected
> by a commit. It takes the drm_atomic_state being committed as a
> parameter.
> 
> However, that parameter name is called (and documented) as old_state,
> which is pretty confusing. Let's rename that variable as state.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
