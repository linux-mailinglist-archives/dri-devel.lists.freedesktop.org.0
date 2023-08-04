Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D9576FFD3
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 13:58:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D6C210E092;
	Fri,  4 Aug 2023 11:58:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1D3D10E092
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 11:58:31 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-307d20548adso1697990f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Aug 2023 04:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691150310; x=1691755110;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=roPCqYVq5FoKhSTLB3DxuQDru8Tg95QBFx3xWNHBOBc=;
 b=vdFbzy+iPivOypCOS2MY/xP86T/mvKswug/NCUWqWWrxiMgBRbE7h3uPn5iTHbYAFK
 ciaS8/uhuK/UUCFMvQblvz2c6hwFA0GJSYLeQjmJK0kDMcADFsLArjJeLaiUH+H4jlHY
 DIrtpf1+USs77uLSO9QpWe6psg/bWLa1RMOlI7MRbPyQqKej/FxV7Ctnv4EmQlWFPwBA
 1zwiHA+GzVG+OKOxseTLKQPkYuUpJr//SDAdN7g3hb4uF0CNFZUhQr3L9YpFErWmUqkD
 oj35587kSsXhXKSkBuW5kfuECxr/zZvjlKW0N28ETKGB8cUc7mHt2iNQ6Lg1gdZ7byRt
 JKHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691150310; x=1691755110;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=roPCqYVq5FoKhSTLB3DxuQDru8Tg95QBFx3xWNHBOBc=;
 b=BDMdfJ51NglkBhHvNqplvd3s3Cpub6DFUuEvyj2E/Te/sHKhdwDXKbdVl9abXT5nVK
 evh1jBZQ1tADBcGZEL0+1ov4hIiIQBbCrUKOpLujMtge8e3NfIVS8mQ7LbC8b2Cc/aHA
 Lr7c2pBlegh6TSpTkQNZ89t2XyrZUSmBWm1MIXkK1Lp++R3gcmiM/0EhvnVyR9dSP1TL
 J/qyEFXnaWJwjxj1fL4xPWrrlvho61gQAU6aE9dKr8WT5z00hN1yqKVt0SVzr+1lZvH8
 sL0sUIVYbC15s2CaUxrhyqJuZEJ7iNgp9VxvlMIdYCSSbl2Jwq6TyCTnN7MbTFDhBAKN
 3zcg==
X-Gm-Message-State: AOJu0Yx7opGodchPv8544zhbfV1k0r5Lx18aD67dgTZXcEvc2ORYSiZB
 CYOEdC57J+dlluzvonH/7vkImA==
X-Google-Smtp-Source: AGHT+IHdmAs57eM0Rz7KVhiySNQUuzLMCFVU6AXXyP/fH2yGgk5lSYGIfz3aoQtQCBNs8nXrYFi6OQ==
X-Received: by 2002:adf:f8cb:0:b0:30e:5bd0:21a2 with SMTP id
 f11-20020adff8cb000000b0030e5bd021a2mr1278153wrq.52.1691150310046; 
 Fri, 04 Aug 2023 04:58:30 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 n1-20020a5d67c1000000b0031134bcdacdsm2358350wrw.42.2023.08.04.04.58.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Aug 2023 04:58:29 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Sebastian Reichel <sre@kernel.org>, 
 Gerald Loacker <gerald.loacker@wolfvision.net>, 
 Michael Riesch <michael.riesch@wolfvision.net>
In-Reply-To: <20230718-feature-st7789v-v3-0-157d68fb63e2@wolfvision.net>
References: <20230718-feature-st7789v-v3-0-157d68fb63e2@wolfvision.net>
Subject: Re: [PATCH v3 0/3] drm/panel: sitronix-st7789v: add panel
 orientation support
Message-Id: <169115030877.3531293.12258712491460228869.b4-ty@linaro.org>
Date: Fri, 04 Aug 2023 13:58:28 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, 04 Aug 2023 13:23:07 +0200, Michael Riesch wrote:
> This series adds support for orientation specification in the device
> tree to the Sitronix ST7789V panel driver.
> 
> This is can be seen as reduced version of [0] (some things of [0] have
> been implemented in more general fashion in the scope of [1], other
> things have been rejected).
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/3] drm/panel: sitronix-st7789v: fix indentation in drm_panel_funcs
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=a238b5ee39e3d3581ec826cdb7b604adca37b5ea
[2/3] drm/panel: sitronix-st7789v: add panel orientation support
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=b27c0f6d208d6ba269f184ed6f92c6a9908866e6
[3/3] dt-bindings: display: add rotation property to sitronix,st7789v
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=e83172ec548d420f2e0b01e80a9a8cbae39bbe29

-- 
Neil

