Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B65C47F799C
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 17:42:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49B7110E209;
	Fri, 24 Nov 2023 16:42:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E1F310E206
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 16:42:47 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40b2c8e91afso15544825e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 08:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1700844166; x=1701448966;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nY57yW8jqPx4DCjz4gafCo99TqRgCQishv/BZqsXq+M=;
 b=ZuSgZFeWGc0oidT3v9FqRgterNGS6fBAmZ2UEERbpBdJI9RqgzWr2jSqGfzT3zNcXW
 AjXsg18O74rlbI4zLL5WKzeR9mUY248oIQ6X4pGLFHQAG//XRwIzbfnB9Nr9uQd1EyI0
 kb6J9AXb9IUMln7gqe1MHa6YgYhXNKzwhszdcuOe3JVfcmgKCWKwpOhQRiOYsGuyFhn+
 Myw0VHWo3TELjSNa5AxR3d4ofb+z9KmvrsBzsTDmX9bnqf5oRgPwIOC8fakYbjt69A6/
 v30NoBTu5lcoBMqYoXcNmhnQYe4z1r0sZj29rgn3f1bGCo+wPW4rRDyNzerNiaEM9y0m
 xPNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700844166; x=1701448966;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nY57yW8jqPx4DCjz4gafCo99TqRgCQishv/BZqsXq+M=;
 b=gtsl5qs590KfI/BBn274HTKqSz24nfxm+uplW8J1hNaZC9qogazzMPT9sW/jQFFJJH
 U3ukp5/7CJk+7ixkN+9TI1XDErOZQ/1Ue5HIWtYUbdG/8KaUE8XE8JswlMkKmTiWYwYr
 onwBNW04XgaGA/E0fJKvIj8WlRqJkdkRFSj7T4z3dv9pV+xRGC+cWcjrM1KaU2tXGY3y
 SE2OY4L00mz7sNv19uqmSHuKCNa+odnRkcQf7xMV790nA4IAMyQgBGBA6sV/u7sxG+jK
 ueRM0/5C7OTUdxk6OFq2iccovFtdW/gWw8lIudcKBmhbIeT9y8AXakZFICiDKsePyL0i
 9FvQ==
X-Gm-Message-State: AOJu0YwgwVepVq60dMxqDAuTuIXZjI+Pkj7M0zeuwRB9uAMAKBbY2oIC
 1iOajc/GmwDcew0TVrC0D3EtQQ==
X-Google-Smtp-Source: AGHT+IF0qtFjt0i/sxwkQJ9BDFSUDAmlZ1vNck5maPD+WnShRNQ0koLnOjpHlDBfcr97NsaHGHftKA==
X-Received: by 2002:a05:600c:1f93:b0:401:2ee0:7558 with SMTP id
 je19-20020a05600c1f9300b004012ee07558mr3057188wmb.32.1700844165899; 
 Fri, 24 Nov 2023 08:42:45 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:1243:6910:fe68:2de5])
 by smtp.googlemail.com with ESMTPSA id
 r4-20020a05600c458400b0040648217f4fsm6159082wmo.39.2023.11.24.08.42.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 08:42:45 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Nicolas Belin <nbelin@baylibre.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Remi Pommarel <repk@triplefau.lt>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-0-95256ed139e6@linaro.org>
References: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-0-95256ed139e6@linaro.org>
Subject: Re: (subset) [PATCH v9 00/12] drm/meson: add support for MIPI DSI
 Display
Message-Id: <170084416459.2546450.3587219733392523958.b4-ty@baylibre.com>
Date: Fri, 24 Nov 2023 17:42:44 +0100
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Conor Dooley <conor.dooley@microchip.com>,
 "Lukas F. Hartmann" <lukas@mntre.com>, linux-phy@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied to clk-meson (v6.8/drivers), thanks!

[01/12] dt-bindings: clk: g12a-clkc: add CTS_ENCL clock ids
        https://github.com/BayLibre/clk-meson/commit/bd5ef3f21d17
[06/12] clk: meson: g12a: add CTS_ENCL & CTS_ENCL_SEL clocks
        https://github.com/BayLibre/clk-meson/commit/5de4e8353e32

Best regards,
--
Jerome

