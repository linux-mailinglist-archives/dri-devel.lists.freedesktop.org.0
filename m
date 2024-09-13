Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC38977C0C
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 11:18:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E23810ECCF;
	Fri, 13 Sep 2024 09:18:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wG2UAi3n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66E5E10ECC9
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 09:18:37 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-374d29ad8a7so1479702f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 02:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726219116; x=1726823916; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kaqlJSHsnewVm2em4WrxriA9s7od43kYT88LXwLPapY=;
 b=wG2UAi3nEmKNotDaiw36oRKlRsZDyLT4OKKwJoXx8x5UEZQEt4y3+I8Rio/foA84KG
 2ZUFlRri7ho7qIhQi/Mnq6+/jJ0KFrr6hgdpZYlx/ZhyTajTR90kmI+/jjjnYIp3Ssby
 R+ImM8K7k/qBzCjwj+xwTjEK3ke2QbeCSBzwIZbY6oUROAyOJJzq50cZIgQ2GVK0II05
 aAc0Ie6AVeBT/txake1/vuTqSNQ2x+pgf9WYJmsR0y10ip5ZDdOBdU12/EWYBDtcvkdc
 QmjomjfKJ/1cr5UvkOoLyv9ocIlnk9FCQM60IW8RkaOZol8O580Byoy2CDV5kPS6vMso
 GDJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726219116; x=1726823916;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kaqlJSHsnewVm2em4WrxriA9s7od43kYT88LXwLPapY=;
 b=Z5qctNPR0DzSan23pcB95ehBk0nc/dA+z65otOv/Jw8vr4sdjIRqg8NMcyDHPIvWtc
 UHNBHcWzL6h4ucD8cdkgaR9wdBP/TJ1ejxHXsQDh2jozClJDnM0tQuwNV8sciGez0cqJ
 MdpTarav3GX47oFwnulPATxa0FmVv1hkImMnqLr1M2nVITH8HNc8CnkpOPAmDI3ONjVe
 efzQFD+3gtNNQAJ0dHT9zx7rKS94Ku4J3GbBoXWil9EmjMZLLdZLwPZoyc2v0WZ1ywOw
 RIr77GJVBR8jy8Jp1zNJHMiyCOwvWpbwHZW0z/uHNPySR5JX9MOnqW2lBjYHo494e3Ec
 BKfw==
X-Gm-Message-State: AOJu0YzZexSStlQI58MFwLyhdX7p4+cmstiEcscm55hI3BjWUitaSwTA
 R3LHlGzLwS5vmFUYiaKf9LpZu4KaRtt0IGg2UkqAeL+hUlP4SzM78ZdDSgFiTcQ=
X-Google-Smtp-Source: AGHT+IGCqWSH9YxA72B8MbCebnxY2+ZE05yklBj0RjAp4qiWjLJCbRGUykl+6byjkUE7YWjPxAFfow==
X-Received: by 2002:a5d:6b8b:0:b0:374:8f90:b78b with SMTP id
 ffacd0b85a97d-378c2d512f3mr2723645f8f.44.1726219115490; 
 Fri, 13 Sep 2024 02:18:35 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378956de0e2sm16258982f8f.105.2024.09.13.02.18.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2024 02:18:34 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Min-Hua Chen <minhuadotchen@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240908133533.112894-1-minhuadotchen@gmail.com>
References: <20240908133533.112894-1-minhuadotchen@gmail.com>
Subject: Re: [PATCH] drm/panel: khadas-ts050: make ts050[v2]_panel_data static
Message-Id: <172621911461.1200554.12665559180853848377.b4-ty@linaro.org>
Date: Fri, 13 Sep 2024 11:18:34 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1
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

On Sun, 08 Sep 2024 21:35:30 +0800, Min-Hua Chen wrote:
> make ts050_panel_data and ts050v2_panel_data static because they
> are only used in drivers/gpu/drm/panel/panel-khadas-ts050.c,
> and fix the following sparse warnings:
> 
> drivers/gpu/drm/panel/panel-khadas-ts050.c:620:32:
> sparse: warning: symbol 'ts050_panel_data' was not declared. Should it be static?
> drivers/gpu/drm/panel/panel-khadas-ts050.c:625:32:
> sparse: warning: symbol 'ts050v2_panel_data' was not declared. Should it be static?
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] drm/panel: khadas-ts050: make ts050[v2]_panel_data static
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/d5acba46ebf5a4fd9ea9ae5121dd381ce85e94ff

-- 
Neil

