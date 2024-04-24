Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E36978B02C2
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 09:00:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5049C11388E;
	Wed, 24 Apr 2024 07:00:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="sVGYzU36";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FD9E11388E
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 06:59:57 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-41b0be62a8fso1068885e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 23:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713941996; x=1714546796; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bPFwbO4h6jzZBM5axWH60HSLI0y3GLCj69yTQhf1Lwc=;
 b=sVGYzU368UL9l9q0GZ3WOC4rkKhg22bC/wqy/Nu6T5s9uZwCrgSL3w2rwD3yPNS5j6
 tIfFfSwzZMr2B/NjD2/TynojvgFaP9bL6UoWyj+KElerwEMOsVZJlbCa8MXLXdQQIcKp
 rp17ttzl6cTE+oGezC54kEbLHVISxKempfrg5mtkmomulUi2CcF8TWmesVvZaeRPbEsG
 2qycbSkU1Q+KnlQyU7vujcyw64W6tYn3VU09lFrbCVOv6L0LOAoEHA0HtsetnVNj5MrI
 4IJVeKEfqKY18ofbdzsJ+gSpjQkvZcIAhg6ccCi/QTeGOMUzdLO+PzsWbaSEc8sor/4P
 LSXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713941996; x=1714546796;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bPFwbO4h6jzZBM5axWH60HSLI0y3GLCj69yTQhf1Lwc=;
 b=obGOLgQOCkbpNViWVjf/TkqrtgquSR5Gbha74ONh3lB7oJ4hJpUuDwJwZYIQaWa6Jz
 dIx++D8NdLY8ybo0ZQErRLsgC9415OdO3uRlf1UVhqI3f473dXSOyS5uIv84QLQatt1D
 P0wRj5GtIMDP3pM0QLk3wlvz7AkkYFHyPD3CK/7GfZNANuPbJxAOLKt/8Q+Q5fkfSspT
 mpRdTljf/5Yi29J9GUX6yCUKBpI33L8ePg1oEP/h4jlwUwSaezl0Gu7aw8cqoMbnm781
 +uo2nULtXo2wTz/2nrQPtT/1/djmsJVHN8aaPRHnQjQX3Ov4iiFM/EgWLFaocH81qVHJ
 +gxA==
X-Gm-Message-State: AOJu0YyPAe1gLT+BSDsNwnVXT5CeJXjHAN6NhAXRIQEKvEXPcLRJi8sO
 P6COXKq4gcONjQ+ey5RTveAEYYTZTfNwB1OQQR6FM53xoKFX1Av5FLVuWEcq8S8=
X-Google-Smtp-Source: AGHT+IHE7xlJLAL51oWENP3DMTrQpY2csVQxTK9xxwJMvq7ioVE9w7534flnkEPfl3NdW6hNie0/Ug==
X-Received: by 2002:a05:600c:358b:b0:418:ec7a:4493 with SMTP id
 p11-20020a05600c358b00b00418ec7a4493mr1452481wmq.12.1713941995771; 
 Tue, 23 Apr 2024 23:59:55 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 iv19-20020a05600c549300b004186c58a9b5sm22465392wmb.44.2024.04.23.23.59.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Apr 2024 23:59:55 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 y.oudjana@protonmail.com
In-Reply-To: <20240423-jdi-fix-v1-1-808970662b40@gmail.com>
References: <20240423-jdi-fix-v1-1-808970662b40@gmail.com>
Subject: Re: [PATCH] drm/panel: jdi-fhd-r63452: make use of prepare_prev_first
Message-Id: <171394199490.1308236.12321198986126755514.b4-ty@linaro.org>
Date: Wed, 24 Apr 2024 08:59:54 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Tue, 23 Apr 2024 22:54:33 +0200, Barnabás Czémán wrote:
> The DSI host must be enabled for the panel to be initialized in
> prepare(). Set the prepare_prev_first flag to guarantee this.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] drm/panel: jdi-fhd-r63452: make use of prepare_prev_first
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/4edd73d174de5e8ec43f0de303f4a8b80e643529

-- 
Neil

