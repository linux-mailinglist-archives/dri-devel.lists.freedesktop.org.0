Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CF4A2DB1B
	for <lists+dri-devel@lfdr.de>; Sun,  9 Feb 2025 06:08:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00EEE10E480;
	Sun,  9 Feb 2025 05:08:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zYQa0Lqa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4260E10E480
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Feb 2025 05:08:56 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-5450475df04so990385e87.0
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Feb 2025 21:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739077734; x=1739682534; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6vniHDsW5ouehiZFIChgglHKHfbM7mAiZxppcXJq6G8=;
 b=zYQa0LqaDOBW16tFgP7cIPkp5pvYujMjuqymXhSGpMcaY2rHaJtVPIIVRnAW6t1ZMh
 suNOUtqW/GwIcQmnFxtVacuI1ARvitlPtcTbBOW852ZEhl6Z5/Nj4U1VpOpFgmbjndVK
 ebqKQqTua57OoPUh54+QOLmCkdcl21gry7Fs1tsYqz0sBIrGlL1+QYHEx/1Go2OhgZcy
 096tIhjQkESQKsgqGafsv4c2DBbW0FMqfr74asVuByr8iu/v1l+q2ehm9MVdMQmHawC+
 CDFqJp/LwpCUMVPXscjpbikLtzYdVAtfyTjoMzuW6zpRF33lX98183UDDT1ly9kcZ90Q
 X6iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739077735; x=1739682535;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6vniHDsW5ouehiZFIChgglHKHfbM7mAiZxppcXJq6G8=;
 b=RpW/Mxv6j6rIPlR9Bc8nqU0/GvJI1FWFElN8SUAknE41IgUzB/swtZpQ7p2hrZCsLV
 VyMmmnYgX6TKwc0cPvwmBDuXJgpWTSbLM1ZwRG9+GsEAAi6MpCoy0AJiwFuS4BoEkynr
 v10IFWpMBzbPsD7hOAA58Wx/AV9ztWqigc25owKWDP87rRiG/B+8o7RMRIgWynCJ8nUu
 LYr6WabxNgSf9JyCSXorsgmygaTRuNuPRZviid+6zkxqa/NVa3lz5+12tdI0DDxg/gBn
 22D9ktRI3iDnBuGE/dUoD3RL8XjEhLrJHww9/j8jJ4WWB4xQJgTk31EOpmBnmi0s13zP
 sxJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8HAFiNs44LNfHz6LfXrisJ5tYwgzfDekeB1q1KsISdZF+qvaJFpLbE6KvQTiE6jwUcWqyl5Rtjqs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyiU2zfTzqeAxd0k47whhAjDercS2zKiv17k5rrBL17s4ai4vz/
 VRwI74Q6RzzmonzXezeE3sAn4Lkryvd5uh5mTx16+u+4gw2SBWkev6fqoHovo30=
X-Gm-Gg: ASbGncuwy+xNiq7DS2oNs+tEZYLrKITkbxD+Xq5uir6/qKvjBEl3BmZTJlcewIjYtxV
 gxqJv9Ff8+XQQmofKhwNhPUsfoeM5QJxoLuiIVD+KE1K+CIY8Z2WSi4kOtKpQT8KmbfeEUYG8L5
 YMR4eOsiV5CK2O3tTlvPuTZHvTnUcDVAs9tB1ztWYSRkTY2teXVfhAI+2O5tGxwTmCmU5cysV4r
 a6blWsNXw7n/q+x5AmGg+baKcMuvLwADoLVGfKfGvcEaqqNT+BwqIzUJDVKFn5upj0yXUFES1yo
 AFVLEkX0wFaG0glZhmsTfrqPfUrUsr4BzdX5S+Y7aZjTe37X4VkxRxxw9QA2HgM/LoF3kXQ=
X-Google-Smtp-Source: AGHT+IHVtTFImXGcQGNiXcqSV5QKAI+VPsdj45bt7ErMQHkXPNBwx4FZnW9ojCpLADgLC2pvgJg7ew==
X-Received: by 2002:a05:6512:3052:b0:544:f67:f0d with SMTP id
 2adb3069b0e04-54414a9ccd3mr2948081e87.17.1739077734590; 
 Sat, 08 Feb 2025 21:08:54 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5450bc4f792sm3386e87.175.2025.02.08.21.08.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2025 21:08:53 -0800 (PST)
Date: Sun, 9 Feb 2025 07:08:51 +0200
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
Subject: Re: [PATCH v2 15/35] drm/atomic-helper: Change parameter name of
 crtc_set_mode()
Message-ID: <trz6g733whfel76xu2pd5jtjwsclvrrwfdonjukgx6qg2c4pt3@vlxu4q6x2q7d>
References: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
 <20250204-bridge-connector-v2-15-35dd6c834e08@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204-bridge-connector-v2-15-35dd6c834e08@kernel.org>
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

On Tue, Feb 04, 2025 at 03:57:43PM +0100, Maxime Ripard wrote:
> crtc_set_mode() deals with calling the modeset related hooks for CRTC,
> connectors and bridges if and when a new commit changes them. It takes
> the drm_atomic_state being committed as a parameter.
> 
> However, that parameter name is called as old_state, which is pretty
> confusing. Let's rename that variable as state.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
