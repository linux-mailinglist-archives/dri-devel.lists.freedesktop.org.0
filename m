Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FDCD178A3
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 10:14:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6238510E488;
	Tue, 13 Jan 2026 09:14:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ndLnUtdp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D36A10E485
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 09:14:06 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id
 5b1f17b1804b1-47ed9b04365so2694555e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 01:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768295645; x=1768900445; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KMDgVPdIGJYUf6y5Oggv+7udOHVtwJ863RSkn2wJe9M=;
 b=ndLnUtdpfA3sL+DBolw6LTFc/mhvhCF0aWU4F1pd41aZQbn6FZOq6OFbBuuuP1uciv
 p9R2X6DnpIbd3aA9aFHxQWFQqnj4x/rTsBCQNpnku4H1wSU3aNknlHdfjWCFmea9/Gtq
 5vJh0PiqihOJDFnobMIruPMDKshs33q3tMnWotx4dAAk9YSZSS3wj88lItKJPheNCixD
 pMwizWNmrkITI1OAvjRmHULwtNQG3F0rCj5ceMxSutW5MiZ+w+b98CBJKADU5sgmoCCy
 nNpYBLrxzXjtXkyxvmPPlFBzBqb6LdU7ESlZI4vdLndLJGVOFux6i3qk23bWGX6IPVh0
 JC7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768295645; x=1768900445;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=KMDgVPdIGJYUf6y5Oggv+7udOHVtwJ863RSkn2wJe9M=;
 b=S3R14R1YRafJ/dnQe/7C6LgVgbcPga35uTKyMD0zVr1+JpGqCFk354X3HUZecs9l6D
 Zb6vp1ICvy2T6Nu3GrZlGlPNKfKduBfkmIi3M5zIJLoBqhEpVLe8OClTpLl1CUsiHtaS
 agp1nTRefiUOFCchjeyqjc9GAbusFckc2EDmG/vwW4wz90q6gsuDqbAdUI6Z1OWrgxq6
 0tQDXj3O0QUfecCMmmSZEC3CBCy+9LxJdr922dUmMCh7BzuMxRf+QBrGPYKgvy55/t2w
 LUxHYO1YC665q/nPUUfWIiW7oQOGKPuhXaHAbufu50lW6KSTGio9aiAKZSFvC4nyoz21
 OzKw==
X-Gm-Message-State: AOJu0YyGi/GIijh3xxHUjhrp5q8f6vCfN9e8G35062rlEQOCivAwPvKq
 kLaLlP2inD6L4E1U20cwioBBKKTCOMgLtQq/ekXZ8H2ZMz9KCxBqqcyHZMj7EMbZ4iUPi94KdyZ
 Y+A6q
X-Gm-Gg: AY/fxX5ojdbaqkldT2YtKwEO89uF8IjqJwwWQ/cbRAHN9Kn5UDcRCkEZqRLvWv0PIsK
 OGGCpItW2s2WBqh1Xke4KqwJYpH/7cLEHjI9M7ID72NSW3BuAWkkKyBhSdIXobw40+a1CmkJ7On
 wbKctLzHDukrXY9Nz6LRywwJlGAsaqkLLWKQP4L2R64LNMGQPUCuIWezGbh7p0djo9C3ceLr4oe
 JzfwnyEZolwmtH5N+QFhY12Wk13mdKi6Hx7kxiN7BYJMEHsVZ4Ab7fTTQQ1UhPTNC6g2i1ThULJ
 KUsBtBvjR/qYs6uyX+UpGPyEThadDmm9CAWIcsRRY7+RhUcKNiCcDPfZ0GVTW8sHO+sUNP+dB+s
 rqH+GmrxDZaZQ//kLTrnxYGTmtEMQGjQ7si+YoTNUy248Tlqu/ef0YPnMjisLcrVayEXa9asdgp
 1wZ1fUGi+QakbRrNWCrHXBrzjFwsHq5w==
X-Google-Smtp-Source: AGHT+IEPcscQv2ri8mOfi12wdz6zyBY4BZVDA7abTN2YTuRZ3izGc0ELm8FGAzpFw+QVhENdmw6gyA==
X-Received: by 2002:a05:600c:1385:b0:477:582e:7a81 with SMTP id
 5b1f17b1804b1-47d84b0a227mr236803025e9.4.1768295644684; 
 Tue, 13 Jan 2026 01:14:04 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080::17ad:35a9])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47eda0ee80bsm11389945e9.4.2026.01.13.01.14.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 01:14:04 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Anusha Srivatsa <asrivats@redhat.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Ludovic Desroches <ludovic.desroches@microchip.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20251218-lcd_panel_connector_type_fix-v3-1-ddcea6d8d7ef@microchip.com>
References: <20251218-lcd_panel_connector_type_fix-v3-1-ddcea6d8d7ef@microchip.com>
Subject: Re: [PATCH REGRESSION v3] drm/panel: simple: restore
 connector_type fallback
Message-Id: <176829564393.3883041.15471923198292664331.b4-ty@linaro.org>
Date: Tue, 13 Jan 2026 10:14:03 +0100
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

On Thu, 18 Dec 2025 14:34:43 +0100, Ludovic Desroches wrote:
> The switch from devm_kzalloc() + drm_panel_init() to
> devm_drm_panel_alloc() introduced a regression.
> 
> Several panel descriptors do not set connector_type. For those panels,
> panel_simple_probe() used to compute a connector type (currently DPI as a
> fallback) and pass that value to drm_panel_init(). After the conversion
> to devm_drm_panel_alloc(), the call unconditionally used
> desc->connector_type instead, ignoring the computed fallback and
> potentially passing DRM_MODE_CONNECTOR_Unknown, which
> drm_panel_bridge_add() does not allow.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-fixes)

[1/1] drm/panel: simple: restore connector_type fallback
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/9380dc33cd6ae4a6857818fcefce31cf716f3fae

-- 
Neil

