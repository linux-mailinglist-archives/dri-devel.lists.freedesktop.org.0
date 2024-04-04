Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD208989F9
	for <lists+dri-devel@lfdr.de>; Thu,  4 Apr 2024 16:23:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2D0410E17D;
	Thu,  4 Apr 2024 14:23:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DBDBAMHM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FDDA10E82D
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Apr 2024 14:23:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E614ACE3152;
 Thu,  4 Apr 2024 14:23:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A946EC433C7;
 Thu,  4 Apr 2024 14:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712240597;
 bh=b3EY+mNSXgIdLMY9ITw3WfxFk9HC0dMLqxJZU09hjE8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=DBDBAMHM+iUVP8sdLO6xyOXK5QN4LOaKEBdtm96HhyodtSg4mQFfkEzbHYhFfdhPU
 jWu5uizAHYxisLUzLoDFXQSD3omyacqUGqDFvwlwbumzMxwdZPrI6WsijMaWTi5964
 AcQypyAXYTaT3fSWw2oNDopr3HQ6uH+bCxXMTQ+fUxVdDfUW83kLQbTC4179qAoqnX
 YV5epJlTJ8QvH0uJO7VQOwTb0SJJZURvkKkHeZyAqRh0XMQ2kPFdTfRbrCvOtVE0Qf
 pUFwWJO/y5OXAKcM8geNdbOS2KM3EjNZQCiZCk0KEU6I7moGYRAN33r+qS//XcFs35
 uders58eF6Fbg==
From: Maxime Ripard <mripard@kernel.org>
To: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Jani Nikula <jani.nikula@intel.com>, Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
In-Reply-To: <20240404124101.2988099-1-arnd@kernel.org>
References: <20240404124101.2988099-1-arnd@kernel.org>
Subject: Re: [PATCH] drm: fix DRM_DISPLAY_DP_HELPER dependencies
Message-Id: <171224059404.143870.12869649896294820835.b4-ty@kernel.org>
Date: Thu, 04 Apr 2024 16:23:14 +0200
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

On Thu, 04 Apr 2024 14:40:51 +0200, Arnd Bergmann wrote:
> Both the exynos and rockchip drivers ran into link failures after
> a Kconfig cleanup:
> 
> aarch64-linux-ld: drivers/gpu/drm/exynos/exynos_dp.o: in function `exynos_dp_resume':
> exynos_dp.c:(.text+0xc0): undefined reference to `analogix_dp_resume'
> aarch64-linux-ld: drivers/gpu/drm/exynos/exynos_dp.o: in function `exynos_dp_suspend':
> exynos_dp.c:(.text+0xf4): undefined reference to `analogix_dp_suspend'
> 
> [...]

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime

