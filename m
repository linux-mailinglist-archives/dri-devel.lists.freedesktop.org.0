Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E43C1D58F
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 22:05:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F44410E850;
	Wed, 29 Oct 2025 21:05:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="uTapesbz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E76510E850
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 21:05:41 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-475c9881821so9844975e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 14:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761771940; x=1762376740; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dp/uSNyKeZVNzX/sxeqr4hGjK3rcULOo3zDuh2qi5pU=;
 b=uTapesbzmaSikmwO9igHCj/EFpFLFr3grvmLxDc5YBAm+FmLL5WPpBMBvoNnd9Qnkp
 Sq5zJt1D3Baa/tcmcYErwYWiHkS8QwDhI0or56ByqSHwa+v75Ls+nhGCtPFQvdP99MHO
 +2t1rH9va19EC0tQVYwP03aQeEZqv3KyFRtS/Pfw4OYH4BnA9YNjNOIIWjzNEAtEbObE
 1gpbdXB/fbvQ8fkoxv8vES1kTyPAMTwDFYesSaxu+wJzSuZBG8gsp7ncfgeMCmPRvELH
 Hjaq+4bwzb6c/QUkbeu0piOWrIfeSqFsCh7v2/5/gdLN9Ag0xvqWuJdFflw1oF/b39LV
 8KYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761771940; x=1762376740;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dp/uSNyKeZVNzX/sxeqr4hGjK3rcULOo3zDuh2qi5pU=;
 b=MuNQ0eqGH/RmMtpPA6VIf1/1UIGCrz++6MybhG+qcTmtE2AskBx+LxT4KXqJF5wOqU
 AuvQtcGJ5EAwMlPqfvtVu7FNfhef8q0rpEF6FCa6+ohUvDtSXxwrfSdpSD5SpZfQxs6t
 lwYsyg/cw5Nc5sB727Zicjprzqiicj/7p/XeXm+bHero4bxHu9hPa2aiSl870EBjS4Ax
 +DxCkp6mJ+hRVSVCoZ+S8Jo/Y+aRIzpkBXjhnO6cQj7qjUf+JBt1i5hVjU/HOUw5ExTn
 RNATwFXdZvQQT+jCHlZaGZ0Sc1unY4r1fj/QIKN/vJOp5ZdpdYWgsGuWIWnxQQxdYUaD
 OFBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYosxRFPgv1CaT4qU7IekD1Aphnt69J6Wr2adTFn0QavUKGXjv+KzkvEFl0kl/+Wc3Y3B0wzb7/go=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxokjD3JcAJQ35eAexmFXVsxMVxLYBpb5QlaqHUSv21tO/feOox
 pECgmeZaf7t+Ud6QdPY0ZDOtcI++1iVoYYgapAar2xeLg+M5a8uENbKEIYcdGLJmqQY=
X-Gm-Gg: ASbGncu/03AAg6Gbkn+5xBGHn/6ORFU9MRlDQjOHW/awcgrnNPseSoZ2oVMy8i2hW6w
 hy3+pIYpXkszeFkoktS0R/7LgSCbEbgf9Af623eME4iBDKU5WVVJeYmtVEOWidICdq/YkTD89gN
 PoJHhPiFvEBtDcG4vkkRwDz9DfAFI/15V8Tfv8Pe+JJHBx2CTE60/5B4HVvNlAnmITPQtWFj9KU
 f5KJUjiK4u06AOfWyhmevon3HCf9EtgMEUlCSFWJ0j3YTiNsIgyM5pTPr78ifDO8Iwsvx48UMUi
 e1PvrO+QVAoPjq6t5uKyJR/6T4WFwxE7Kuu25/0esWvLiD+iP8DwlEaRUgggf+soQZpWDYAbV8m
 9i3thZ1OgiSqQCBDZmQAjpoTAmklkHXeKAdL45Gw2jNFdAdLacx9IBRdmYXen4CXuC8q8umTHv3
 9j2pG8cQ/ErJ16WRE87PRb
X-Google-Smtp-Source: AGHT+IHHUJuep9vUZ0J1lsKWcApbeF6pJYJ0OqFJ1EzP3xpMcStMDlbBzS8uE2XDGHUoQdaeRIr5og==
X-Received: by 2002:a05:6000:402b:b0:3d3:b30:4cf2 with SMTP id
 ffacd0b85a97d-429b4c4bf46mr877008f8f.19.1761771939864; 
 Wed, 29 Oct 2025 14:05:39 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952de971sm27815109f8f.39.2025.10.29.14.05.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Oct 2025 14:05:39 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: devicetree@vger.kernel.org, Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>, 
 Robert Foss <rfoss@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org
In-Reply-To: <20251029200519.214548-1-marek.vasut+renesas@mailbox.org>
References: <20251029200519.214548-1-marek.vasut+renesas@mailbox.org>
Subject: Re: [PATCH] dt-bindings: display: bridge: renesas,dsi-csi2-tx:
 Align panel example with ili9881c binding
Message-Id: <176177193908.2073083.2063773161714746895.b4-ty@linaro.org>
Date: Wed, 29 Oct 2025 22:05:39 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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

On Wed, 29 Oct 2025 21:04:48 +0100, Marek Vasut wrote:
> Update the panel example in this DT schema to match requirements in binding
> display/panel/ilitek,ili9881c.yaml . This fixes the following schema check
> warnings:
> 
> "
> /tmp/dtx/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.example.dtb: panel@0 (raspberrypi,dsi-7inch): compatible: ['raspberrypi,dsi-7inch'] is too short
>         from schema $id: http://devicetree.org/schemas/display/panel/ilitek,ili9881c.yaml
> /tmp/dtx/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.example.dtb: panel@0 (raspberrypi,dsi-7inch): 'power-supply' is a required property
>         from schema $id: http://devicetree.org/schemas/display/panel/ilitek,ili9881c.yaml
> "
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] dt-bindings: display: bridge: renesas,dsi-csi2-tx: Align panel example with ili9881c binding
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/cf4ec6212f3ab705b05de0519ae7acb55061fb31

-- 
Neil

