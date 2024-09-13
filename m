Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 820AC977C0D
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 11:18:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04E3F10ECC9;
	Fri, 13 Sep 2024 09:18:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SJb6rQFJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AC1510ECC9
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 09:18:38 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-42cacabd2e0so17280155e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 02:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726219116; x=1726823916; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uq1OUH9zOqOD8Y0n9EUsrRMAyvSF4LZSIOe4n6BSVno=;
 b=SJb6rQFJb5E7+R6p4zgqUqV2KamS1k+Lg83I1OicMKBMCj2OVJiWEK1AUzGN2fhsBB
 PN7etTFYzOueTOX3Fu+QvhD850Bsuitvo2z6QfY9JAX+rSLaH9OI4H0BWr93eKYDl5wN
 6DxNO6+uDkvHcxJVOEZohOp+XVVBQusOIn5Sb6xec0Q00NTuCnlxRkITwgm0fCQac/qx
 YS7xhB7a65vXC7Imt9adYvgdCuUTnS8KiabDrQbHrZasqPUZC1ypUE1O4JOZcs3baFqo
 A72P38xzVhp2GqbIq0o1M1tAOEf3oozm4TBcX4kXOFvrY4WjCo0aGyx+gTCd064BvydX
 v6vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726219116; x=1726823916;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uq1OUH9zOqOD8Y0n9EUsrRMAyvSF4LZSIOe4n6BSVno=;
 b=UwObyUjqRf3u+LPqE2iY2dSZNBRkCaarILlktKIDm8iUhr97D99Q5FuGFDjlpiHYRq
 ct0Yg4/0BvTs73uajm7t9qm+b/tiy+IUdTEtH/fyl9hPjtXY1qvHD59d1AYAV3Hx08aY
 e0ffudUgLPiSGsyFkji+4PJUimDJU3LGZ+WCLqodClYUTTXqIyZGcmvxzeDUKX4KB51Y
 peQyCpC5SRyIpysSgFpyPz1AsvArgUP00flt5OltHycMyJUzWtY2O/+7XWhG2BirPD+E
 w6z3EX3WWYELAO4g3LtQMd+hkMvGicjacDpzvR7rCfEpRs93ZUlSTVX5Wt2qMLE59lAA
 k9fQ==
X-Gm-Message-State: AOJu0Ywrdv0PJj2y/0sByHV7KHYe5XKjJtPwRekRQ2VBkAV27uGlIof4
 NhADsNQvu2sNgpBQwY3+DuIGF52jZddPyEAh2nCT3D7CX7nxVe0tWC/+TGTyk3k=
X-Google-Smtp-Source: AGHT+IHDJGoQVhZeDx+JOIUQ9Cd8sptY6QohqTjqBy/QDYuAMQ9PBkRfRMdewJWGkhuVGeZYURG05A==
X-Received: by 2002:a05:600c:4f4f:b0:428:1965:450d with SMTP id
 5b1f17b1804b1-42cdb53bd22mr47776685e9.17.1726219116378; 
 Fri, 13 Sep 2024 02:18:36 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378956de0e2sm16258982f8f.105.2024.09.13.02.18.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2024 02:18:35 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jianhua Lu <lujianhua000@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240904142907.367786-1-lujianhua000@gmail.com>
References: <20240904142907.367786-1-lujianhua000@gmail.com>
Subject: Re: [PATCH] drm: panel: nt36523: use devm_mipi_dsi_* function to
 register and attach dsi
Message-Id: <172621911559.1200554.9536280533966410927.b4-ty@linaro.org>
Date: Fri, 13 Sep 2024 11:18:35 +0200
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

On Wed, 04 Sep 2024 22:29:07 +0800, Jianhua Lu wrote:
> Switch to devm_mipi_dsi_* function, we don't need to detach and
> unregister dsi manually any more.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] drm: panel: nt36523: use devm_mipi_dsi_* function to register and attach dsi
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/62f6bc14bbd12c13abe08b5a1bd8e55c843b776b

-- 
Neil

