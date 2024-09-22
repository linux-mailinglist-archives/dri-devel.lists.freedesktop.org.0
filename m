Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1210797E278
	for <lists+dri-devel@lfdr.de>; Sun, 22 Sep 2024 18:27:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5026510E058;
	Sun, 22 Sep 2024 16:27:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="p/dIR0hL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0BEA10E058
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Sep 2024 16:27:06 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2f761cfa5e6so36237681fa.0
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Sep 2024 09:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727022425; x=1727627225; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lDY1Rx685xpsDxEMUUtRILc2NYgU/miULZ3NwVaniyE=;
 b=p/dIR0hLrwceLpBjyVDio7KdUTKLPQgC08CxS1yQg1u2qD8rsZhY1Q5PschtwhR+nP
 xdxO69WkfM/NNQncyKXfSh2vA++u6y3aM6NyPTQYVBvH3nl3BznCsdLFhKXiyE4KNlDt
 le4nWyu8YqKLcgLJoQFdCfP6roLauVRup3G1dz5C1tup8pcZEuyKGnDMnznP7tZ8O/K7
 kHMgWgNIgClNECd9tzVuYgfqjhaBtlgACIKB82h5ZOraUjBXY0qWBCbWDU+7ZFGmXCdK
 6S7odcV+j6HuWJmvyqTCQMRhgpnxAL5yQRlt6p6/BccPMDEjCOGoCfJZ8CkcWNzcZJeK
 1m8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727022425; x=1727627225;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lDY1Rx685xpsDxEMUUtRILc2NYgU/miULZ3NwVaniyE=;
 b=AHeXkQIhqH742mD+cQqC9b+6MXcYxyBIROvObapGlXeWGrw1r/sqy6N1j/g9w5f80R
 BHL0Hp6sscXiW7k5bK4TfxJGJf4nLIi3krsZeLtrS9PLiMViv20QTXBghJL+VFS8DWmU
 IsQ3uBlla3f63EKmvtwVeX6RVltkIQaStF+9QF8x5wDYTZkrpmooF0WFophs/tp2Qya5
 jgl0E86vuC31afGM8qHqZreQvsy+W/OBZ5vobAws/Jf1FpumX87EOpECtbpoXG9pWP2c
 HO0zrF1u+G+imz2O9XBPSL4NV0pXaV+7zM9B2QtfjJtkd9pYlfT+d33s5XHc83Cavwmd
 WHLw==
X-Gm-Message-State: AOJu0Yyu25EcYXxtVJ7gmWRhdk0gMXx5WEtD7R6UUujC4JpxgUZUI5Kw
 eZj+ivL888T5jNNyMYuqP95edU/cxvr8ac4/RNxNNjupyvBNhQUZlFMkm60Avbk=
X-Google-Smtp-Source: AGHT+IFzgViXl1baLryxjIB8pfU38892fW+VxPd/yZA9ZEMdkgBX/TKTyO/x2CPBHUOhIGucSPYPYg==
X-Received: by 2002:a05:651c:1548:b0:2f7:52de:9a35 with SMTP id
 38308e7fff4ca-2f7cb342edcmr32442021fa.42.1727022425010; 
 Sun, 22 Sep 2024 09:27:05 -0700 (PDT)
Received: from eriador.lan (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00::7a1]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f79d485f11sm26541611fa.111.2024.09.22.09.27.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Sep 2024 09:27:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] drm/imx: Add missing DRM_BRIDGE_CONNECTOR dependency
Date: Sun, 22 Sep 2024 19:27:00 +0300
Message-ID: <172702205091.1380824.2685575625082150622.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240906063857.2223442-1-alexander.stein@ew.tq-group.com>
References: <20240906063857.2223442-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Fri, 06 Sep 2024 08:38:56 +0200, Alexander Stein wrote:
> When drm/bridge-connector was moved to DRM_DISPLAY_HELPER not all
> users were updated. Add missing Kconfig selections.

Now that drm-misc-next contains both commits...

Applied to drm-misc-next, thanks!

[1/1] drm/imx: Add missing DRM_BRIDGE_CONNECTOR dependency
      commit: f673055a46784ccea04465b9213e999f7bc5187e

Best regards,
-- 
With best wishes
Dmitry

