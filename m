Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 826698C6D7C
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 23:07:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F4E910E07E;
	Wed, 15 May 2024 21:07:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nGzBP+6z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EC4810E07E
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 21:07:53 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-42017f8de7aso25123445e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 14:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715807271; x=1716412071; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pWHLY+0xu3zArTUYXPHmiujebW7avno1a1q9nZr/Hdo=;
 b=nGzBP+6zNl5c9+fb+yyL2iA4XrEBBBfdPXFBmJFTYTgaZVgI3HgA7u1B7QPiAWHZyz
 gtq0Oh9xTLjnfQpbXQbCj1VCoEljnk2Xou7LXuQEe4k9JaE9GgL0L9U0PmwStuGG+OdI
 MVpoTV5pQ1ZMU2JTS6l5eSEdfrdjLcHC1kenvDIrSfSVZBGfEfWL7x5QYWXsjZwMxQSN
 H8hNGqVNG2FoUnN+7lm4KgGXd2UjDf+0O8A4hvE1t189pydU4ZpGXAC37v7E7TFRoJ3N
 Jax5b3/kABjy4OKfPOGFDeGWV29ZqZkvllvZJQXkUNFF6xe4vw0DXT5AYK9zWJ8a4mOK
 3/sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715807271; x=1716412071;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pWHLY+0xu3zArTUYXPHmiujebW7avno1a1q9nZr/Hdo=;
 b=DVqoGFA1kCvtoK6PSYrMdy3i8jd/3DSNwRxYth3RTryM3aQRL6P+S+whQhMBp5M5Mr
 yrguduhKju9Ap0BYK2/7IqrsXgbBmMIcGRZiDBc3SSI3d1rNMCDSFoCXiw/K8emLCLPM
 boKfzqO37g/NlfCK0Lr0+LfrrhqYR+/yrBcztrvWAiiLr85Tri2NRnocuiUm0uoqYpFK
 bT+tbYSh0ZN2LjZhPYVUdn124nvzI9x2iIQ8fccdPxIl1Yx/H6XxVIvKolZYW/QkH8Kj
 WCxi1kfsJv0CFb/DVYLGlFXoPNRxLGsvr6kUYF1WrPvgDNkSFyugh/h3U1zc6xeZ62gG
 AbDw==
X-Gm-Message-State: AOJu0YzS6eF66eFWmtECz1iunxIFt6ddZgZYmwNJPmEawOx0q/vgflFY
 3iqM7fLTrvbl5A8XevXhXpGaxXsprphBA68JHHCSg5gmjNeHwy4OrCeTbCRZ5gc=
X-Google-Smtp-Source: AGHT+IGGQuEli06xc4lxHRwmkEHLH+J+jWaeAZEBTyYly20sTNZPUnHHWZFcp4FcGy4iuEd2zzsfJA==
X-Received: by 2002:a05:600c:5685:b0:418:f991:713f with SMTP id
 5b1f17b1804b1-41feab42b13mr125950055e9.23.1715807271323; 
 Wed, 15 May 2024 14:07:51 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502baacef2sm17424110f8f.85.2024.05.15.14.07.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 May 2024 14:07:50 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>
Cc: Javier Martinez Canillas <javierm@redhat.com>, 
 lvzhaoxiong@huaqin.corp-partner.google.com, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Brian Norris <briannorris@chromium.org>, Sam Ravnborg <sam@ravnborg.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Maxime Ripard <mripard@kernel.org>, Joel Selvaraj <jo@jsfamily.in>, 
 Hsin-Yi Wang <hsinyi@google.com>, 
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@gmail.com>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240514172136.1578498-1-dianders@chromium.org>
References: <20240514172136.1578498-1-dianders@chromium.org>
Subject: Re: [PATCH v5 0/9] drm/mipi-dsi: Reduce bloat and add funcs for
 cleaner init seqs
Message-Id: <171580727020.3184993.17823317356671253009.b4-ty@linaro.org>
Date: Wed, 15 May 2024 23:07:50 +0200
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

On Tue, 14 May 2024 10:20:50 -0700, Douglas Anderson wrote:
> The consensus of many DRM folks is that we want to move away from DSI
> drivers defining tables of init commands. Instead, we want to move to
> init functions that can use common DRM functions. The issue thus far
> has been that using the macros mipi_dsi_generic_write_seq() and
> mipi_dsi_dcs_write_seq() bloats the driver using them.
> 
> While trying to solve bloat, we realized that the majority of the it
> was easy to solve. This series solves the bloat for existing drivers
> by moving the printout outside of the macro.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/9] drm/mipi-dsi: Fix theoretical int overflow in mipi_dsi_dcs_write_seq()
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/0b03829fdece47beba9ecb7dbcbde4585ee3663e
[2/9] drm/mipi-dsi: Fix theoretical int overflow in mipi_dsi_generic_write_seq()
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/24acbcce5cc673886c2f4f9b3f6f89a9c6a53b7e
[3/9] drm/mipi-dsi: mipi_dsi_*_write functions don't need to ratelimit prints
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/7d3f6acaf87c7db6dcd868694a2f65e7040478dc
[4/9] drm/mipi-dsi: Reduce driver bloat of mipi_dsi_*_write_seq()
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/3b724909a380fddb44dfa0072fc459c698a52658
[5/9] drm/mipi-dsi: Introduce mipi_dsi_*_write_seq_multi()
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/966e397e4f6032b73438f8d775756541513e7daf
[6/9] drm/panel: novatek-nt36672e: Switch to mipi_dsi_dcs_write_seq_multi()
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/d6fcbec281a2ed16794fabea49d4ac93db2d2944
[7/9] drm/panel: boe-tv101wum-nl6: Don't use a table for initting panels
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/d6ddb6624a7fc4fc3d7750bccaf43c66b55beab9
[8/9] drm/panel: ili9882t: Don't use a table for initting panels
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/95951654ca57786c658942a7c6f4471ef3f0d47e
[9/9] drm/panel: innolux-p079zca: Don't use a table for initting panels
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/6f6fd690de1aef476e631ac03779e7d1de3fe451

-- 
Neil

