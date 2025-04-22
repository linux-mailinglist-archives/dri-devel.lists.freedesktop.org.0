Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52416A95FC4
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 09:44:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB62410E091;
	Tue, 22 Apr 2025 07:44:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="UcVGO1Pv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFB9D10E514
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 07:44:51 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-43cf06eabdaso46279935e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 00:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745307890; x=1745912690; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WgK3a7wLnoljW2o1N7kchVd14A0Rfs+vpaS3Ag30LgM=;
 b=UcVGO1PvBdeGG7NVL6baY4zBoj2ExbEe7hqAR9NAMX1HbQYxWGmFOdtdns5MjaxYEt
 iypnxA2BsJo9QoF1GVdbYjvzq/kIGimIENoBnoQ5A4Ku5bqFQgQ6r5tOYyBkP2O7Ncbc
 hqqocpjnm6vLGQdFcnQhTf5T+X/XXpsyWvKCLKqzP14P+is6PaFUbG0Uf30lKwVIhj3Q
 xNncoqLeUfDWicoFKkBGC5wVkZko83xFoGK9Kg7CU+7EtMUNw0/00s7xTBaOW16d2cBj
 qPNZNd+u11bmcXWI/4YkCRtmtQTYozpbBE1HXp1DGec5V7yGnE7T4Ky/nMvEliSVxwp9
 S39w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745307890; x=1745912690;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WgK3a7wLnoljW2o1N7kchVd14A0Rfs+vpaS3Ag30LgM=;
 b=QCfEMWGwytsIF0SocnCV6w5PNp0ccRvSa3XZhRtpV6aHiVCC4llNTul66aZ9yyN4cG
 ZMwrE2ulMjWG1dfs8k+fhA1DpEaGPaiGhTGYoFlEA3mq5SwvZyduuDWHhiFt8Vy1DxLa
 Yloyg06k/MnmyabJ3xLkTQMrsNnlH3YP24Ez00IqivMp4hzdAgSDOnXLRjM5FbATq5GN
 fU+P1bpKdnPUqjXql+KgO1iyH07SW+izZVmaE+jg6XzGN7j0amoUmuWnDHlkXTxbAyML
 hu14+wPAKKq+E3C32NFm9R7JUd3tQj53K1F023CQSxRpacURLFs7G+vgaxjYKVrwoBlo
 btsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCULLBjcfJo7SgDSeu7+C7GSL1XBrPaRnQVn/Ikw6MWyTNpcNSdKkpzEOxIs2BVoYxZVa5O+6FzKP/o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx6gUROkP/Sa5hwmp+cdgSzaHzB8Z2te7xWLCRyyKJnNZ+Yem5F
 NrGgqA1MGaeEGazT4wWo6FESQviK6OF9ox+Gq54JN38tOjwCbS0I6K6r2DYCiDE=
X-Gm-Gg: ASbGncvmKQnFYRydDgoDIIGCm+eFgMNQYTnySlMjNFK0wuLdgSyCKzcn/GuGrjmKsl5
 Qc4Vawl9P6e14rGLto1q4cMMRlBXcaUCdTu7ncbesdo+sGYKTfImxJrowrs/n1IEvHJvecoFrge
 FDMMm6+5T+H8fYrTu9e3k8qx13g5mVDSHVQD1PKXWEhpzXVoR4nKatSKRMy38MF3irSdXhSxg6K
 rzP6PhsQPxBSYBrfUN6omV1k+gBhYqCojGF+a66ImI6jfLN4+K5nhMynIPAHQ/Y2hRYtCOjxhtS
 XQg4GxN5oWjirynQQlTwjEnvhNyBFYaVlIMKuRfrMbAZ7m1lDYlfB7+1RJXKVg==
X-Google-Smtp-Source: AGHT+IGLlnDAxBOPlwHZaIDg6mBq4R6Kpd8YZK+9dm41VFGVOnrsjJ4xvgJsjjZwn8EYlnSwLGHSqg==
X-Received: by 2002:a05:600c:4708:b0:43d:300f:fa4a with SMTP id
 5b1f17b1804b1-4406ab97c6cmr118259525e9.12.1745307890356; 
 Tue, 22 Apr 2025 00:44:50 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4406d5a9e38sm166628775e9.2.2025.04.22.00.44.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Apr 2025 00:44:50 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jagan Teki <jagan@edgeble.ai>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>, 
 Hugo Villeneuve <hvilleneuve@dimonoff.com>, 
 Hugo Villeneuve <hugo@hugovil.com>
Cc: stable@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250417195507.778731-1-hugo@hugovil.com>
References: <20250417195507.778731-1-hugo@hugovil.com>
Subject: Re: [PATCH] drm: panel: jd9365da: fix reset signal polarity in
 unprepare
Message-Id: <174530788965.2868524.14547275141165599808.b4-ty@linaro.org>
Date: Tue, 22 Apr 2025 09:44:49 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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

On Thu, 17 Apr 2025 15:55:06 -0400, Hugo Villeneuve wrote:
> commit a8972d5a49b4 ("drm: panel: jd9365da-h3: fix reset signal polarity")
> fixed reset signal polarity in jadard_dsi_probe() and jadard_prepare().
> 
> It was not done in jadard_unprepare() because of an incorrect assumption
> about reset line handling in power off mode. After looking into the
> datasheet, it now appears that before disabling regulators, the reset line
> is deasserted first, and if reset_before_power_off_vcioo is true, then the
> reset line is asserted.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-fixes)

[1/1] drm: panel: jd9365da: fix reset signal polarity in unprepare
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/095c8e61f4c71cd4630ee11a82e82cc341b38464

-- 
Neil

