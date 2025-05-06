Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67083AAC412
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 14:31:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92BAE10E67D;
	Tue,  6 May 2025 12:30:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ZCMCJ6N2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D53F310E67E
 for <dri-devel@lists.freedesktop.org>; Tue,  6 May 2025 12:30:56 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-391342fc0b5so3320926f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 06 May 2025 05:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746534655; x=1747139455; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t7IBsGQwGYgPcheDIcojgL5LMCifVqWhnKTxheDU/Zs=;
 b=ZCMCJ6N2YIdVaV6JM+mdlhx7QtQ06jxA1IFsIoHKptTMIEfhofiCmdyecCLEDWI9I5
 R/0r3lQni5zZJ9/IQcgtvyA+Hb15m18eGLk5riMhffVwYhkbAr10RVeiBGYdKOgfmZRR
 mIa4hqbCUNJJ+cXvs72xTudvlhgM/cvXd8T3bg7jXsHTtnyIYsMC9nofKG6EX4tW3Rx8
 36I1gZvERKAMroQYgVGsDZ0EW77E7fRFAgsSajMdBFEZ18Fb5MSgRwOkJZrMWzEi3lp4
 zlLk0+AXV53AqDRR5paNl5NTB+IECpPcG1MufXRm1LVcYz/pXc0M/GzhYlHs11ce2WVk
 2GYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746534655; x=1747139455;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t7IBsGQwGYgPcheDIcojgL5LMCifVqWhnKTxheDU/Zs=;
 b=Q6tg7CZEB/lfQJWTFzr3ngdrwdN4uMEkxo2om5vtQDv6JuDQwi61sIoJFNnjs9uD+Q
 P6hVcuNuQvRjP3CTlvDMGc+F0YJxYEGBXOguHvBGYiK+xsaxJBfMru0bpDPxzbVZ4M5f
 b+wrOJJsKu8MCWSzoxOSfB7YxAoIKOczONF8Tg89CuOq0buN81OciTp5L/ABAtzDIZyi
 Y+86sXEBf8RYIiW1tvjxPnqAdjz5DseTwqlefp0artaPjFYbGrWjeXifYvEu3zJ0FTWW
 yBUDyvpvYGFogZG6/4ZBJoQU0caQpUU1bZxZMV3OWKwi0Iop7Q3DrAJh0RAX+BMEszyl
 ny9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWoSikmkpFHSm/akvDrxUktcu7lPkGGg16vGXCYDGdZI3Oe1rhCSBd+EET+PTK3HSyOumDEnZM237M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywc8SeuKRBSppooHyOgAclyRa+Kyf4oFY3fuCEoC1CM3Mbn1iTE
 jwPgf4V2MGTkaD48uyOei66E7JcO37jwswxCKKiiJHfiiS5PEQNsPv9aFgvytSo=
X-Gm-Gg: ASbGncukixfsL0ZIpFDHu19K4D0kUGVJV5LblC4/gHQm2n9UgVUKf61IMC2trpjqyT4
 Fii3+vjhCN7eM9Jb5lZS4jGYGab2KOcANBMLSEOaI18EYC2jfy1/d5WM6rRjRR8NKKPCYK2mFAp
 NIuZ5TsZzQJg6dCDQjGjBf1ELceCNBsCXsGbPiEU75zg/Q/8dTvs0mXMbOUEEayX9LzBg1nDL+8
 74NMdMcQ2wgbUQ3SSDPtEX24WbMsoyvy7+TL5bmyV9PueJJR9yjGujci84jRmXgSgEkItU3bVGZ
 LwMi55ogxtwNvPMU9BOd7Yf1i4cQtH1MfneNDuexWZecrgp13LXk9pfx01gXzw==
X-Google-Smtp-Source: AGHT+IFiNduezl2ORHpPQhoDSRGna6T9OnPBxShMP1wby802ouYlA9QnFT7yGrjYy5zvoNLkJmiZAA==
X-Received: by 2002:a05:6000:18a5:b0:39c:30cd:352c with SMTP id
 ffacd0b85a97d-3a0ac0cb0abmr2175514f8f.8.1746534654686; 
 Tue, 06 May 2025 05:30:54 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441b2af32a0sm217429775e9.23.2025.05.06.05.30.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 05:30:54 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Sam Ravnborg <sam@ravnborg.org>, Kevin Baker <kevinb@ventureresearch.com>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Alex Gonzalez <alex.gonzalez@digi.com>, Thierry Reding <treding@nvidia.com>, 
 Rob Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250505170256.1385113-1-kevinb@ventureresearch.com>
References: <dbd8e1bc-bc23-4240-b6b1-321ac6f5ed68@linaro.org>
 <20250505170256.1385113-1-kevinb@ventureresearch.com>
Subject: Re: [PATCH v2] drm/panel: simple: Update timings for AUO
 G101EVN010
Message-Id: <174653465377.4169673.5902707474315665274.b4-ty@linaro.org>
Date: Tue, 06 May 2025 14:30:53 +0200
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

On Mon, 05 May 2025 12:02:56 -0500, Kevin Baker wrote:
> Switch to panel timings based on datasheet for the AUO G101EVN01.0
> LVDS panel. Default timings were tested on the panel.
> 
> Previous mode-based timings resulted in horizontal display shift.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-fixes)

[1/1] drm/panel: simple: Update timings for AUO G101EVN010
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/7c6fa1797a725732981f2d77711c867166737719

-- 
Neil

