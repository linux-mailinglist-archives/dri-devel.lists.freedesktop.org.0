Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6705F956F9E
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 18:03:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFF0C10E2F8;
	Mon, 19 Aug 2024 16:03:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="GS1u3Y7x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 114DD10E2F8
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 16:03:01 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-3718e416297so1993042f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 09:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724083379; x=1724688179; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hPkKW2LvTdv3KmUUw5RUkwnuj7RdV8+FsUA2SiVs/RU=;
 b=GS1u3Y7xO7bSqkORoe985ZUXEZNktM9LiDgUEaiVKhYD0APiK5KflOmgvLvSe3gtBI
 dLt/9HsITe7vAOu96nkzaaFcrRs4jzuniELjqO+ZAEIbOAW2FiPb5C3yHyJkR5mrVUTQ
 hSY3caK2r67iT8wLEN3iVFcMWpbvwKHI8eUMwvfYYXAXK+GZmK6kqO8Br5rq6eb9io/v
 udEQYOtKfdARcvO+EanLHLz/RrNtm7JxIxKRV27Sli88xLJYvalzd1HF3X9kh3GFkqgv
 2KasS7FOljF5cYqyH8fu12FLREFxunfqaKzYOS4H23hT/GHiz8LaxUsdTGFZ/lYprpx6
 /Fxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724083379; x=1724688179;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hPkKW2LvTdv3KmUUw5RUkwnuj7RdV8+FsUA2SiVs/RU=;
 b=Ooo5afGcfUASor0E7EvWj+OSsBlZOWP7RSEYsRXoEPgfUQtwD0W1/w7vDXFpA4nVsB
 Db1D03ufa/1kojadh/w7CDIzSjiTudSM13BzK207rXifpDpHGhDLUchuErrCLpumvwry
 9txGrOpfz/nQplKK5rCGZjfeS5jRmRORClcL9FMEyaWLOiYGHlCMRFXuJfpiMQWK4ynZ
 wcOkPHm72xHJmTk+p/BLc3oVW1abOWHX3mduz8fniohH4NBwP2xr/bz4/4aqbDqG3+4U
 kmbgt9TH3FDwuNnKWH5tWAtD5btkhtZUvNWAX87rZ5+mkqI7NBx7H+TbEV/xn3V+tQRa
 8bdA==
X-Gm-Message-State: AOJu0Yw9Fy8ofaGlojpz8l51/3kRmqrJV4QlCwgBI8Bypy5LY3NsX2WJ
 O7lDAlf5oNWi/1X/4mQfQ+T8M6XWcAAx3ZJ4IUcTJSdfiDUpXi9Qp8IhqkczRLM=
X-Google-Smtp-Source: AGHT+IGw6LCgPmvL6ZKIYTJsbQpctLJYo/wa4DHZVvu+Ak/SM6l58kPGLiM8dwDXzvtVr10V3LCUMA==
X-Received: by 2002:adf:cc8c:0:b0:368:3f60:8725 with SMTP id
 ffacd0b85a97d-3719468fac0mr5564106f8f.39.1724083378853; 
 Mon, 19 Aug 2024 09:02:58 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-371898aabe9sm10907638f8f.92.2024.08.19.09.02.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2024 09:02:58 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel@pengutronix.de, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20240729-b4-v6-10-topic-innolux-v2-0-27d32c766ce5@pengutronix.de>
References: <20240729-b4-v6-10-topic-innolux-v2-0-27d32c766ce5@pengutronix.de>
Subject: Re: [PATCH v2 0/2] drm/panel: simple: add Innolux G070ACE-LH3
Message-Id: <172408337763.1748689.2942378302112499804.b4-ty@linaro.org>
Date: Mon, 19 Aug 2024 18:02:57 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
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

On Mon, 29 Jul 2024 09:02:37 +0200, Steffen Trumtrar wrote:
> This series adds support for the Innolux G070ACE-LH3 to the panel-simple
> driver and adds the according compatible to the devicetree bindings.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: display: simple: Document support for Innolux G070ACE-LH3
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/99d79eacd1286bafbf5878a510b3ceb49360872c
[2/2] drm/panel: simple: add Innolux G070ACE-LH3 LVDS display support
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/b9d228a5b2ebcb1f1f63170f5b20bc2f9d276168

-- 
Neil

