Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C9791BAE9
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 11:07:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B23A210EBEB;
	Fri, 28 Jun 2024 09:07:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="dQ9oZWFw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2258610EBEB
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 09:07:22 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-367601ca463so227159f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 02:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719565640; x=1720170440; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sAojY8v61Oq5pXWhl+jbz8qnbn0iqqHxroEEAHU3dVw=;
 b=dQ9oZWFw+BCamX8BHcXGdGw5JM1e9FGsogakWpu2Nqvdcb1KpB02y5HN2qfDTXWaN9
 VullNjnKqJrYJ2niLAEen6bE0R90lVUhg9bEHIBtVs3cATY5u9DawHmvNSj1WIjRovPp
 0NJkGVSPmUwUnWYBIS6dBfGzjfEcUSSlwXTZY5rkQL+uG65baXExTBvcU0hLurV2lQcX
 c6DjHrcTKOI9Le6OHdlLAAc/XnlWeDnnKWm6ahd4VQu+7VTaD8YB8LoGs2ZYHOLW3bux
 TvkWYUYABEgNKrekuueAZIhHb6sFspSh4lqmZvVChyLGh3fjyZnnitCFI8+DIoIcLewk
 wiRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719565640; x=1720170440;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sAojY8v61Oq5pXWhl+jbz8qnbn0iqqHxroEEAHU3dVw=;
 b=SAKFGkFjLm8xVbrwndYJD9fVEC7V7ZpcJn2SzNWPEcbMxBF2OaU8xZg4UtfTyifHiT
 wqPoeA37V522Nc+yJi9l/1Ey5e8lXITMLspNnwzmKz3d+Tt+gFAESef0vCVVqKz/C/v7
 SYJAVKQRqELQEgegTcmzaLZfUD2CZQbinit1V4qZVdniLfxxZosOUE+scEiGjd1g2Jw+
 jr37e3qVJIJSih9oI3QS9kS5UoWUPZ/o+NkiWeu4kLVSuhwIfN2lAZAPqE/pvrcDvHcp
 QHocp81nii0QLYsxn9L/NSZeliJvGUOLsr7Rt8VMaqNTMpI3hbEErQ6rrHCb2jJKESk7
 XYHQ==
X-Gm-Message-State: AOJu0YxulQV7rD26YrBq8PxlSQ7L5fb5L6Kjrs8EzK466bi1Vqb+9vHy
 ubzdXnPO5tOb6IUM6E78/n0JHn4lD3r7BTsq7tbsJKMvQluOJJ3TjMlhL1NZGlc=
X-Google-Smtp-Source: AGHT+IH1p4Lr0/8BDnffNORPkUxB15wlpiN10FAgg7kp26WVIDI1u2ehlcIyNvLqTtsh8o3u98LDqA==
X-Received: by 2002:adf:fd4b:0:b0:367:2ae1:9c4d with SMTP id
 ffacd0b85a97d-3672ae19d30mr5031112f8f.29.1719565640035; 
 Fri, 28 Jun 2024 02:07:20 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a0fb967sm1612896f8f.82.2024.06.28.02.07.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jun 2024 02:07:19 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Paul Gerber <paul.gerber@ew.tq-group.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240627084446.3197196-1-paul.gerber@ew.tq-group.com>
References: <20240627084446.3197196-1-paul.gerber@ew.tq-group.com>
Subject: Re: [PATCH v2 0/2] Add AUO G104STN01 panel
Message-Id: <171956563914.990484.5258309901602303917.b4-ty@linaro.org>
Date: Fri, 28 Jun 2024 11:07:19 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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

On Thu, 27 Jun 2024 10:44:42 +0200, Paul Gerber wrote:
> Changes in v2:
> - put explanatory comment for display binding before the list entry
> - collected Acked-by and Reviewed-by
> 
> Link to v1: https://lore.kernel.org/dri-devel/20240626044727.2330191-1-paul.gerber@ew.tq-group.com/
> 
> Paul Gerber (2):
>   dt-bindings: display: simple: Add AUO G104STN01 panel
>   drm/panel: simple: Add AUO G104STN01 panel entry
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: display: simple: Add AUO G104STN01 panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/21335cf6af98d524d01296865fd0a1c6886ace54
[2/2] drm/panel: simple: Add AUO G104STN01 panel entry
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/6c2b2cd33705b43cb19699500bbf7bd77bc8b60b

-- 
Neil

