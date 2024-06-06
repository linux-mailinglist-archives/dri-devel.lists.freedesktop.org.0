Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE998FF297
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 18:35:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21BF710EA22;
	Thu,  6 Jun 2024 16:35:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Oi/oEb6L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87DB210E233
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2024 16:35:04 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-5295e488248so1434362e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2024 09:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717691702; x=1718296502; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LYeDvpyslmhIzpGI3AD4w6L+ydSsr15MY3+gnoMDLT4=;
 b=Oi/oEb6LJw5KWrD+cH2Frmm2C7Pcc//zP8cKv+b9XS6ro+lNRyOXlf9euruEPyjpRl
 j6EsGChaUv+i+Pbr6YIscy0yOfqz5OYPrVLtcWx1khKWvnBsWczBETrLMz2LjAcOq2Im
 X8FcmJ+bzihx/++G/YWYaSYGW7iqd6x0MZIb82SU0KZmwDp9Ht0RcFV+OmDzYug8Kaet
 AjY5qTDBSeexciqb8ZsyF7SmW/xV4x9Pf9kzeOA1i4A9Af97jQC6g7lLNyWrBd6VNz+N
 jQOK1BBuJRcx/HGYw9B3tzs7lvtnW5JoBvMgaYRWeKMKqDSz1wXkH/HyNTZHlKiCsg7Y
 n3Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717691702; x=1718296502;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LYeDvpyslmhIzpGI3AD4w6L+ydSsr15MY3+gnoMDLT4=;
 b=Q96zOyL+CPpAd3xUj5AnZsJthX1Quy4jYtWo4t7wt/2nwS7j1iTOnzmYbanE+W/wVv
 FvxwupXiowAtV0kt/zGPaPU+amViRRRTwtDbr24GJuxpDI+Sx6UtwqVoqigx79D734Fk
 KdOpxPuom4cFZoFiG5LuWlbQYTd7CotFCLc2qglhxScUzJFaPr++ESdtvJqSwXabfbF1
 lZ62nfaAuR9l0HKZl/k1wDoNC94BGNxgRTX3skHKy8kKTd4dbvZSTHtGGA9znP1YycYQ
 m75EHgtDgFau9ihN466s+rtmiFqxl8yLQvQyz33HoSIX39NrZ+Ooyb7z1GnaTv/d26/K
 TQBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVm1Az9HrEJPNFRcVMNZtEd9l4cyHXp7DJuDh00G9hUd5K0zf71CLf0e3kqsH+3dAShq4/UehmPrKb5PDzkoCzhjhmsNKaC2gdpqZKityK
X-Gm-Message-State: AOJu0YxEPE0u6y3mirpxBOgaoTFeAQICZp++6jdApV5K6yHwlFg0gKyM
 7Iji5mgy6FWhkQAVbNIOdc4pHFrkWEYP3W0KLDeScVBJATAKZPU5C8xa5whWD08=
X-Google-Smtp-Source: AGHT+IGDBTuayGV8M0B3zpRufQXpsAV+fc95GA12jvvP2cyoVpIgQSgJJR2EYut7ZdDXNJCfPEUKNQ==
X-Received: by 2002:ac2:5042:0:b0:52a:e538:e563 with SMTP id
 2adb3069b0e04-52bb9fcc4e4mr87450e87.44.1717691702501; 
 Thu, 06 Jun 2024 09:35:02 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4215c19d5besm26783755e9.7.2024.06.06.09.35.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jun 2024 09:35:02 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Heiko Stuebner <heiko.stuebner@cherry.de>, 
 Chris Morgan <macromorgan@hotmail.com>, Sebastian Reichel <sre@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Primoz Fiser <primoz.fiser@norik.com>
Cc: upstream@lists.phytec.de
In-Reply-To: <20240606080104.3663355-1-primoz.fiser@norik.com>
References: <20240606080104.3663355-1-primoz.fiser@norik.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add PrimeView
Message-Id: <171769170166.322973.8720705983345725480.b4-ty@linaro.org>
Date: Thu, 06 Jun 2024 18:35:01 +0200
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

On Thu, 06 Jun 2024 10:01:02 +0200, Primoz Fiser wrote:
> The Prime View International (PVI) is a LCD panel manufacturer.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/3] dt-bindings: vendor-prefixes: Add PrimeView
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/3b37a419b710797138c31c0f41c2a7d8aa9f62cd
[2/3] dt-bindings: display: simple: Add PrimeView PM070WL4 panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/d046611a6187379c19c58d928f342c6884fcbbe7
[3/3] drm/panel: simple: Add PrimeView PM070WL4 support
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/8d1330d24788e1e28f6939779391ce835f19fbd2

-- 
Neil

