Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E88D178A0
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 10:14:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B7B010E485;
	Tue, 13 Jan 2026 09:14:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="eF8QegMr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 645B710E485
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 09:14:05 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id
 5b1f17b1804b1-47d3ffa6720so67688805e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 01:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768295644; x=1768900444; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6t77eX7yaBvcCOvnjldeAucp/yf03hkwDiK7NZl34Ao=;
 b=eF8QegMr7OPfTfKArBf/2LNIs1h1lZI2RGdW9/4fUqrvnJQL8crY5xisILwa6jbBKv
 PS8o9syrD87TwIXNmYGybtEnLYHgOFLqH2QiU4JxZ89+Ep4OFe5gxUGOmiPb/vvpqzKl
 QO2UvGQvFZLMVZR+sMAIkQQ+zu8If11Wkc8lMlv1e/NjcyOnU3aDISVqBXXVOGtk7kMm
 HljdJfLjRC58yM9mbmzj9MhsfwVqoWn8HyoOb9Y8VGFM+NQfL/9EH3HRL2vf+2nmTvcl
 MvrviaGvpdhFbd4gftWZjn7oxIBpbv6xJNPACpxb7EcvyUm1VMiB8lczHFDprM2SmoDC
 EHdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768295644; x=1768900444;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6t77eX7yaBvcCOvnjldeAucp/yf03hkwDiK7NZl34Ao=;
 b=eXPMSVp02gf4xsJjuvGEaCxXaLTJkf4SjEUM+R1HReU3X7s8aFokMPExSp/NPXSUAX
 hhLpRpfnvKuOmI69LGZCoXDxXIDDeEnoc1MDGQhOHgDnLLJyg4TDu5QB4wZ8AQkHEJBR
 dyRP7utCFCJj3fbLyP4nBEd7wGhSgyXI6VucW3hVIJQzM2P0PLzsxiLCB1U4J6jQKxLe
 nClJJpXhKuTgJqb3aWCpy5Qpb2QrrMXn5KXNA9JrMVp2A1ybnNP1m+Q/WYIoN2NLD58R
 89TS4fTK+GzH+uneUgP0Y4+HkyT9lF7I0du0aI9TAeY+PXlBQMYqAHtpTENY7Lpz9VCX
 3gqg==
X-Gm-Message-State: AOJu0YyhETuz76OALwNevrOIaI4VFbCioZa6Vjkw6YysahIXsz45Od7q
 7a1v+Rfz+0zS5EKryu3qtR2iA5LMuB4/Cf+aY5Lbux2hGlYOfn5aCG9AWwaqydCNHk4=
X-Gm-Gg: AY/fxX628VLMpF8b5Bk3n1Z8kMRv9l1S3H/0MZ78ZkppnH/E1uZGn6ixKYEnl7bLZnU
 CCbSp+JZk1cci1Oqj9EhTDcGa2mBNFRNFW1b0Lyt54YlXskojkGn0WbzGxRUyawkeT3zzW6AlmK
 WZcQCct4yXo3OSW1LbELwstxZf3KQ5d7+HOwvG65Tvy0Fw9xPod+KTUCRAcaIsUPEa1aecWfDWq
 7BPhicFPEHwXdUm/fpcskZCAHvhxNnA8YEaM8VhVTT7ALbqUhalKd9/NfCX4dYDHZoTZsc6LW59
 zHzzOmQ0djpuDfcwyBeRF2exUaK6oTWZjAtLZvWA+aKTbgLkjYi+g5EYwIMsdz+rBWXJC+agr5a
 H4xBLJddgtvkHEnMIw3XbnQR9BO/7JERJvI2Guwqet/HRCftvtxdozH1457oGudK9+sdU237DQ2
 LXYRD4vXOkOaxe4DSKd5o=
X-Google-Smtp-Source: AGHT+IFdwglDB4crXEY7aXy9oh45LxhHLxaO2WfsMgiAukZiGDRTuNDlAiSJmqz3Kb/0VrBgLjUUog==
X-Received: by 2002:a05:600c:3b15:b0:475:dd89:acb with SMTP id
 5b1f17b1804b1-47d84b3472amr233883255e9.22.1768295643794; 
 Tue, 13 Jan 2026 01:14:03 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080::17ad:35a9])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47eda0ee80bsm11389945e9.4.2026.01.13.01.14.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 01:14:03 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: dri-devel@lists.freedesktop.org, Marek Vasut <marex@nabladev.com>
Cc: stable@vger.kernel.org, David Airlie <airlied@gmail.com>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
 Thomas Zimmermann <tzimmermann@suse.de>, kernel@dh-electronics.com, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260110152750.73848-1-marex@nabladev.com>
References: <20260110152750.73848-1-marex@nabladev.com>
Subject: Re: [PATCH] drm/panel-simple: fix connector type for DataImage
 SCF0700C48GGU18 panel
Message-Id: <176829564314.3883041.15001190221335999378.b4-ty@linaro.org>
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

On Sat, 10 Jan 2026 16:27:28 +0100, Marek Vasut wrote:
> The connector type for the DataImage SCF0700C48GGU18 panel is missing and
> devm_drm_panel_bridge_add() requires connector type to be set. This leads
> to a warning and a backtrace in the kernel log and panel does not work:
> "
> WARNING: CPU: 3 PID: 38 at drivers/gpu/drm/bridge/panel.c:379 devm_drm_of_get_bridge+0xac/0xb8
> "
> The warning is triggered by a check for valid connector type in
> devm_drm_panel_bridge_add(). If there is no valid connector type
> set for a panel, the warning is printed and panel is not added.
> Fill in the missing connector type to fix the warning and make
> the panel operational once again.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-fixes)

[1/1] drm/panel-simple: fix connector type for DataImage SCF0700C48GGU18 panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/6ab3d4353bf75005eaa375677c9fed31148154d6

-- 
Neil

