Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9753299618D
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 09:56:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A08610E678;
	Wed,  9 Oct 2024 07:56:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zs0qyHRV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A25D10E678
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 07:56:00 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-42cae6bb895so66675625e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Oct 2024 00:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728460559; x=1729065359; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c3mGdhkESXbSGOutFwSjJARGpxBweZTtd236mLhsQ9g=;
 b=zs0qyHRVEgUeZ/Y/Zp0t1yUesBb59e8FBmXPQvFaV//edRk5RnWrCpddk6Nffg95qT
 GNK/5S3YneQ3M5NZXARfgrXw6IfaDge2K8eswMUZhdDaOXne7mvsbowx+dINZs2RahaG
 kNS5PL5ZeFzh5wYERN51m7P6Nlh6F4Czz39gj4oOLjBBaXxeijkh4lPmHgWhCkq8U1xf
 L3MmHh+1NCAeAV9i7NXgcDX0hMaB69fMz675yLl5Esl8hJMyG223M9Ot7iPRpB9qkgbP
 0n1XEjBnS8qz39+ZyJ9esdP47IRpFUDfwF21+onmQPa/kRByi6cjNjMEl1z5xE9OxzQ0
 5eQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728460559; x=1729065359;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c3mGdhkESXbSGOutFwSjJARGpxBweZTtd236mLhsQ9g=;
 b=Byf77ggUZics6fD879lilM+vB/tR2G0StfrcfCbmRpQxgtLRBcR05hG6Y42vkeFEEF
 EN4bVnoEoGWPzbnf8Xb6070wq39ddfA21gMzmgV3NTzPkbbHALG/bdJRgsLs3Fu00yMP
 zYwpOzF4UZHlXdfQHlmlQ8cLeD9jTi7gpGYEojRCUdV0AKNAYT2G4sqGqA6NuJNFkzgA
 UAkS/ZxnOOrZg6e6n5L7LSSvpw1g3z1b7c6PwDLk2Qq2x+zLn+nOfiK3f0DRxtbIJ8Xm
 VcxQUL+nPT7+X9T6JcRdlaEuuIHCWOp9v8/oinP6byxPu991gaRMmdZpv3jtVuLRYQy0
 aYPg==
X-Gm-Message-State: AOJu0YyCNiOHP84xgBeQ6Z+IJao5oKvMkFjYLuv/ZdWpsscT+wb63/gL
 x7ZSFq8FjCcEzitSB5n4YOd9ofBhaHFqJhHbV3Po7vVGPmootM9IzWSknku72XMHtD801uTfVfV
 dRVk=
X-Google-Smtp-Source: AGHT+IE3teKQjoC11XbHKw2dnXg8kunMSFpC6LsgSmK3CTM3I5DuVWJ55y7TScmZP6415W7EVrP1tQ==
X-Received: by 2002:a05:600c:1f0d:b0:42c:e0da:f15c with SMTP id
 5b1f17b1804b1-430ccf511eemr9491165e9.20.1728460558648; 
 Wed, 09 Oct 2024 00:55:58 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d16972fd9sm9660342f8f.104.2024.10.09.00.55.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 00:55:57 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de
In-Reply-To: <20240626-drm-panel-ili9881c-rotation-v1-0-e0ff54173e32@pengutronix.de>
References: <20240626-drm-panel-ili9881c-rotation-v1-0-e0ff54173e32@pengutronix.de>
Subject: =?utf-8?q?Re=3A_=5BPATCH_0/2=5D_drm/panel=3A_ilitek-ili9881c=3A_?=
 =?utf-8?q?Support_in-panel_180=C2=B0_rotation?=
Message-Id: <172846055704.3028267.5069542346452493531.b4-ty@linaro.org>
Date: Wed, 09 Oct 2024 09:55:57 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Wed, 26 Jun 2024 16:40:37 +0200, Philipp Zabel wrote:
> The Ilitek IL9881C controller can rotate the image by 180°. This
> might be desirable on devices with their display mounted upside down,
> that don't have rotation capability in the SoC display controller.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] drm/panel: ilitek-ili9881c: Explicitly set address mode, allow 180° rotation
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/b64e7d59ba75b1b080a65da20ffe0bae532854b5
[2/2] drm/panel: ilitek-ili9881c: Report subpixel order according to rotation
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/655b92ca60a2d3fac83e8974fd786da6aea7fca2

-- 
Neil

