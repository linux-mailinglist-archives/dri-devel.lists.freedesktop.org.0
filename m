Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2412A859F54
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 10:11:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D671810E1D3;
	Mon, 19 Feb 2024 09:11:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Vx9q6jCg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 821F910E1D3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 09:11:11 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id
 5614622812f47-3bbc649c275so2252571b6e.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 01:11:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708333870; x=1708938670; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+h4S1K1tLaVXVrg7ekOJUruu89mTgLkF+9ddaVZWrlg=;
 b=Vx9q6jCgKaQ2VG/L+6zrFLk271ZunP3E51CCbPN/y4UafsJggPgyixTUclen+gSdpn
 wWOo5cCtC9pob7o9lPvpDdN5OTEBN0KAtxftoQMzSt4mCqkSqpVjsluHJ7QGFK9pGqkF
 j1DnHPDciHc3B0q8Wy7KKhUEWras6OgvvizRX2AShv4StY0r5DcqW/u2IhAup0UBSca2
 KY+xgfTAx1o0o68FGGlaR+dtK4OKDGYSoqf3im/5WjNQE4AlKrlgkrjdvgtvUmn66b7x
 PUh4IeTVOSvtwf7qHgUYmYu+wtSARgXb1iA3FePQYkoNsWiplKz8SQGeszWAAjNb0EoX
 P1hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708333870; x=1708938670;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+h4S1K1tLaVXVrg7ekOJUruu89mTgLkF+9ddaVZWrlg=;
 b=CUempiqNicABmcN1px2vdRQ6MPGZJnc4w3cXPXho46ag/I/9g0QW1ImjmEqGPRzhhY
 vHrQGxThpe414Gi5c2UzS+dADL4AFIANTJaXNbHL6Dkte5VSce8hINQ7GuB1aUNbnOLT
 rGbAndmtPlupUcN6l6l2dIewqurX95gIFOCfWdAUYsAgQg+1kb9ALH+/kgynpY1ATaJV
 Swrho35rdCABMmqJ/jZu8TUZ8R/nYa7m0GXL5mUMf6qhrYDCuwi5VQOesY5VsLKuqXiG
 8YwaeioA2C1i5Y0HswuE5GekTs81609Jc/PJIvhUSuHZNbBJyUewgy74uvcLvswkf2ub
 GE0g==
X-Gm-Message-State: AOJu0YzR6kWYWqupyCX6zDPzODt3/JgZSPBcqLV3fQh9hz8HaClV/+OB
 RgvaDvbGlREP18fRSOdr0byHZIxn8jDEfDfzIUPZtovgqzy+hDC9YQOPSO9hMrA=
X-Google-Smtp-Source: AGHT+IFrJDEsmrNpenTSRtilhd/10AdR+4gy/uGPKPaR81L4w/RKMIvbZJSKvSK+eK/CCppY8sGY5A==
X-Received: by 2002:a05:6808:1c5:b0:3c0:4229:89e5 with SMTP id
 x5-20020a05680801c500b003c0422989e5mr9494381oic.51.1708333870551; 
 Mon, 19 Feb 2024 01:11:10 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 z16-20020aa791d0000000b006e0d165f8a4sm4307506pfa.20.2024.02.19.01.11.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Feb 2024 01:11:10 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>
Cc: Stephen Boyd <swboyd@chromium.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Sam Ravnborg <sam@ravnborg.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
In-Reply-To: <20240216123111.1.I71c103720909790e1ec5a3f5bd96b18ab7b596fa@changeid>
References: <20240216123111.1.I71c103720909790e1ec5a3f5bd96b18ab7b596fa@changeid>
Subject: Re: [PATCH] drm/panel: boe-tv101wum-nl6: make use of
 prepare_prev_first
Message-Id: <170833386468.1779963.10700248718904415408.b4-ty@linaro.org>
Date: Mon, 19 Feb 2024 10:11:04 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
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

Hi,

On Fri, 16 Feb 2024 12:31:12 -0800, Douglas Anderson wrote:
> The panel on sc7180-trogdor-wormdingler and
> sc7180-trogdor-quackingstick hasn't been coming up since commit
> 9e15123eca79 ("drm/msm/dsi: Stop unconditionally powering up DSI hosts
> at modeset"). Let's add "prepare_prev_first" as has been done for many
> other DSI panels.
> 
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/1] drm/panel: boe-tv101wum-nl6: make use of prepare_prev_first
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=42a7a16bedc991190310a02dd202e29cfac52525

-- 
Neil

