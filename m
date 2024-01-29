Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD328402F2
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 11:40:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71D36112859;
	Mon, 29 Jan 2024 10:40:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27E9A112857
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jan 2024 10:40:14 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-33ae2d80b70so1143871f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jan 2024 02:40:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706524752; x=1707129552; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yy4LSrThD6B1eb4xQvZN3hJ9wb7EqOezkE8yyXZlbIY=;
 b=AdJuwrR6ROsvuf8aCXjvCybE/TbOTEQwwQQPlclSTB3KiVMD2xQaEPZt0fsE8iqj/q
 DedcgQnZksjcT+LprcMz2qFwVDjySkaryWdsVWQAH40kQFpLt76l6qxigh4PFnI48L7Y
 OfuEXRAjZ71jTsbW83jsxPm5heiTojAzky2JLFq52Y1ZyP1vbyaU3nFxS29t6ILSay/s
 bvL3TcXX9UQsXz7QYfNum+4boXEQPqKGA0GoDmwz6y/y1kcCgdN1fm+i8Qpb7XGQSE+b
 LCCaOWqo+lxcuKYJNJjkg4QrIum/Rmo78ng99Fwlwm5/yAfML/U5SNaATMfwFMIiwd6L
 e3HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706524752; x=1707129552;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yy4LSrThD6B1eb4xQvZN3hJ9wb7EqOezkE8yyXZlbIY=;
 b=ECRcnKKS1vd4yHWJV+AHt1TFJv+5NHi+i7Gief4L1GtbVfAD7fBpGUiBdYAjvT5kcY
 cmrA0NwnKoDY+g6mZbddwI1kuZbQt1asyX/PXgnERYJxjMd8hsPCA1SW0TKuZfIWMIrx
 S6Vq3wzx791DU5E09a//SV+maBJqQwyZtwAy98FBRaLuqvZWDFU4HkR7gqBC85KtZH7B
 Y9YLv8/Pg4Fb8S83+Ah8FPwNOzH3FuHIj8vaVUwBkxhR7rQjC9DCLl34U1R6x9sA8mUX
 L+/pYAPbZE9gduz2a7tE9DH6e9h63jmFyPahtp1JMZh1uSESWaoVDERPqrs7rQpZ/5lL
 vKoQ==
X-Gm-Message-State: AOJu0YyevR632sJMuAvB0Ci1xW2qc8qg6ZJMmMO+Z0kBIRrdKd5on7v6
 RcGyu9zrAo6GXV5i1+Y72CtqN9QTv2HOnoRag6/MwtV5ZaRWz6zuJaUAUR2LSY4=
X-Google-Smtp-Source: AGHT+IEO8b3pJJV7rJ7hOViBXy7NMTFzTO85zFdO9Ky08vsbwOJeCzVMmIHGj0zqkVpp+PEn3xCaGA==
X-Received: by 2002:a5d:5510:0:b0:337:bd95:b0f9 with SMTP id
 b16-20020a5d5510000000b00337bd95b0f9mr3463645wrv.35.1706524752598; 
 Mon, 29 Jan 2024 02:39:12 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 bw11-20020a0560001f8b00b0033af42529d4sm891148wrb.68.2024.01.29.02.39.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jan 2024 02:39:12 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Yannic Moog <y.moog@phytec.de>
In-Reply-To: <20240126-wip-y-moog-phytec-de-upstream-pollux-lvds-v1-0-8ec5b48eec05@phytec.de>
References: <20240126-wip-y-moog-phytec-de-upstream-pollux-lvds-v1-0-8ec5b48eec05@phytec.de>
Subject: Re: (subset) [PATCH RFC for upstream 0/4] Add support for
 ETML1010G3DRA LVDS display on phyBOARD-Pollux
Message-Id: <170652475149.176242.14095285829208464241.b4-ty@linaro.org>
Date: Mon, 29 Jan 2024 11:39:11 +0100
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
Cc: devicetree@vger.kernel.org, upstream@lists.phytec.de,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Primoz Fiser <primoz.fiser@norik.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, 26 Jan 2024 09:57:22 +0100, Yannic Moog wrote:
> This series adds the LVDS panel support in simple-panel, introduces
> device tree support for the LVDS panel on the phyBOARD-Pollux and
> enables the FSL_LDB config option needed for the driver for the imx8mp
> ldb bridge.
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/4] dt-bindings: display: panel-simple: add ETML1010G3DRA
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=7a61bbc10a7b2734fbffa4438340b6878cce2e5c
[2/4] drm/panel: simple: Add EDT ETML1010G3DRA panel
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=aeb262c353354eab81ab0d3242afa70984b7dc34

-- 
Neil

