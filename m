Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F488C6DBF
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 23:23:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BC7210E0C0;
	Wed, 15 May 2024 21:23:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="sfL9Nc9h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E83AF10E0C0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 21:23:00 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-351d3898640so382666f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 14:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715808179; x=1716412979; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=02OMX2IuQAjEPGw2rAjJ5BimZOrw1fH/m9JV58iRemM=;
 b=sfL9Nc9h4lKoGrHUriMu5BpdPr8TUDi2SrPbmtERhrlO8wuVoMdvZZfToKf2VXLcyl
 ozqlrDtTfP9EMQMTOZM3ej8lW9ac4tUytAoI95bqj2jEjHS76DwOLrkpG/bTNrwUy85a
 SaqCptHL2n0eoPiS4hSbdCwi4umRVBdb5Vczt7Gem4LLhqY999QwL26EvBn4+bWihai+
 AH/Kx8LKZJwhfpj3IBxb1vkC/6uZVtvokHVt0hCvdFXD2Uij+FQnnWDkc3fvtyhAkQJ+
 Ig+pdt7ceMgU3cM4QtCx1mSQN3nMshExIdKkTZ+m8COxrThZRNW9EJVmjgn9vouVaO4e
 qAQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715808179; x=1716412979;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=02OMX2IuQAjEPGw2rAjJ5BimZOrw1fH/m9JV58iRemM=;
 b=MPavnHRk1DqdKrW6EhKd7NIIjFKftOXysRgTPaUqroQPLlMlpU6yZGQsaxje054Y/5
 dHoljOYFXRpHCQHz/i+Mbxhf1s599pLJQPmxdUGEXZefVkVf7CmeeOoYEL4eAgCi4Oc3
 E9EIx/bzRrAOCD51YDcgAaZisOawe3Z0+TO/zOdq4/gqE6ZrMTbaCjXFTSsPhBhlKLpF
 aEPR1U/lI0oxwp5aVCwGPdD3KWbBdGTu2mWqglS1EisK+6WcnZl95vpsTvM8GCNT8+yD
 vgAM3APeb50szbBvcamNSJltx0ZI0o/Y0R6ewlUtEm/ZQZJJR4DrRwzZx//QlFlhZDMm
 iOcQ==
X-Gm-Message-State: AOJu0Yx5tTftP/j/6GD52aL6SH+dwilklbJgOgP9M6h2swEwJLug5UdC
 c9xQFuDjZ+tzjMTP8oyMLqNJhCtxHchMQvtTbQWR260Wd9Qq0WppnIlImtjG8P8=
X-Google-Smtp-Source: AGHT+IGeQbrRopmwSba59K7PV2A3scK722IGRG+7XPMRIEHVc5y/YoDGZ+vh8GIBi063AAn6tL4LqQ==
X-Received: by 2002:adf:fb4f:0:b0:34e:e5c6:521d with SMTP id
 ffacd0b85a97d-3504a73da61mr10904352f8f.38.1715808178716; 
 Wed, 15 May 2024 14:22:58 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502bbbbde1sm17374879f8f.97.2024.05.15.14.22.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 May 2024 14:22:58 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liu Ying <victor.liu@nxp.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Aradhya Bhatia <a-bhatia1@ti.com>
Cc: DRI Development List <dri-devel@lists.freedesktop.org>, 
 Devicetree List <devicetree@vger.kernel.org>, 
 Linux Kernel List <linux-kernel@vger.kernel.org>, 
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Praneeth Bajjuri <praneeth@ti.com>, Udit Kumar <u-kumar1@ti.com>, 
 Devarsh Thakkar <devarsht@ti.com>, Jai Luthra <j-luthra@ti.com>
In-Reply-To: <20240515095133.745492-1-a-bhatia1@ti.com>
References: <20240515095133.745492-1-a-bhatia1@ti.com>
Subject: Re: [PATCH v3 0/6] drm/panel: simple: Add Panels and Panel Vendors
Message-Id: <171580817744.3240821.968286353425260350.b4-ty@linaro.org>
Date: Wed, 15 May 2024 23:22:57 +0200
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

On Wed, 15 May 2024 15:21:27 +0530, Aradhya Bhatia wrote:
> Picking up this long-standing series which added support for Microtips'
> and LincolnTech's dual-lvds panels.
> 
> Microtips Technology Solutions USA, and Lincoln Technology Solutions are
> 2 display panel vendors, and the patches 1/6 and 2/6 add their vendor
> prefixes.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/6] dt-bindings: vendor-prefixes: Add microtips
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/71465a86296ab963bc120b5e32b9a19f69090e6f
[2/6] dt-bindings: vendor-prefixes: Add lincolntech
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/37dbca37f3b53cb698798462f197db2637f6ab34
[3/6] dt-bindings: display: simple: Add Microtips & Lincolntech Dual-LVDS Panels
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/43f092d2540f7869ab5dc5a53ae1f76d44fc6293
[4/6] drm/panel: simple: Add Lincoln Tech Sol LCD185-101CT panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/ac9b8b7fee6578015483c5f130bad78d368c00cd
[5/6] drm/panel: simple: Add Microtips Technology 13-101HIEBCAF0-C panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/f558d676cfbc388f2c3175c3c1f99c57902ea3c1
[6/6] drm/panel: simple: Add Microtips Technology MF-103HIEB0GA0 panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/2c3d1bd284c5141a85188f48e7f42112e81ffcd8

-- 
Neil

