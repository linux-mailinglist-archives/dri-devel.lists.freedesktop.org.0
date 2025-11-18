Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C854C6A036
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 15:36:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A8DD10E4CD;
	Tue, 18 Nov 2025 14:36:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="k3p/6osf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 939E710E4CD
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 14:36:15 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-591c98ebe90so6030964e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 06:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763476574; x=1764081374; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fTNlBrxG1reK6Iqv2BdVIFoWuExCnojLAXMCRWIF47U=;
 b=k3p/6osf5Ny/kkVMvvoe/E5ocYdX6NI6gL7il5hlgE/lm983QiYt3jtb3o0vCFyNXJ
 ERLKn/qOTt2D1PndWgCWct1uDJQtom03+IUJ5DgM+CVmNnzf95MAr4XgM51B0I3Gfg2H
 LiMm5xr+LIVNyXAdnE5J6wfxjk07lOVRn8JBn7+Uvbf3jtEcO2TiXGQkBvvSqDXH262f
 9SYpVLXTLIv0gcKwlJxm0qUYobQtsOnE0Ra9dtfVlx9+LHBCeQ2B+GJbcVDhZpN9x4gX
 QMib5i+7VdJyrZfYOMBsoTNYcIrzAnI0pSDgNtFcNqT3PU3UK1LEq/mMkdWwjSsCCTQr
 tD9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763476574; x=1764081374;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fTNlBrxG1reK6Iqv2BdVIFoWuExCnojLAXMCRWIF47U=;
 b=EMZK6iDKqY876FSfs7QMzFHaT0tX7fXUeZODR7KLyDIQ/2mTzQ4dqoWgt4hD8QHZEe
 vuzP4BKk5xUDDysfQUnwSMP1MrcG2eoOd+Q+Q8lWF80BbtA3rJeK916nBVEiKbTwLfdh
 nxtoFWIX+BAxtT/JX5G9VzEdaISOO/IuBoIe55pZU+yxqvSkTaOZTe1DeQ7/I3sYApj5
 5w9fFcednK2uhUjc3MjNZBZBW0nXriWIjsYmfcdn7diucjFEMQcIAGqCvOD/7jbQh/BE
 jtMmRjjRNH6IZv0Ha57lnq3nU5SqnFXBr5lBrh+1ffgXrYnjee+zjiPQDDiOTr8rbO4i
 /A1A==
X-Gm-Message-State: AOJu0YxjIcx9jRqPZTT8VoE8tiQ5jwloZ6EhCtre59ZB42BSLKiHIATv
 CRkjT/y1VOgVuyDzX9+KEKc3TVFwTA/JS8uSexNOpT65SRTuBWHYkQgPg7TLohQPZXs=
X-Gm-Gg: ASbGncuzR34+fyi4JXptTFYsqn9b2VSh3DNnlp6RrEZ49gXbbvA2qvIDRgkbM/gErit
 VnzfJq8+aTEcxDiVau2cSxfb/KKY6XB0jF8xnxFL3o3RfvbdgStoRX0oJyiuc52ouSLTTBILLI+
 0OI6xxgZMHmtQkgQBSEuPqq8vCppQvaTwd2DBJ/0nuCi+x0OlX3v0DGeQ27TQcBYVbnOD1qlBrs
 760Qwgj+w4gL1LKAzpLv+tvRK53Y1JI5WGSCxRyEEar/mlDL9iwySbVUaHKnpcaUvE4ZQU56l/E
 Z2L4N+Y67/DVBYNKnX5TE7om5AXSiTcR696fS8oAvnuiI5UCCTTntfG0QsY0qJ9g986cqDxNPbh
 mPE2S8Ughbvs6ffywGrOxcSGOcXvz/nPg6AfYDZZwLIVQN+JmSP7pu4pSrB7tAvMPf8D/EKyoCq
 FYFl+QFhf8udSo8UJEi4LrNj/bcEwqEYJiSdG+XfyXGBJQWt1zGiLZhkQ=
X-Google-Smtp-Source: AGHT+IHsV5sIm3zMMnJUvvx2rOPpIW9GCCJGnR8UVkAd8uKtGIyR3NkhPAK1Gvxj0emMFr7oIz9qMA==
X-Received: by 2002:a05:6512:2250:b0:594:2475:a160 with SMTP id
 2adb3069b0e04-595841febc7mr4260322e87.26.1763476573888; 
 Tue, 18 Nov 2025 06:36:13 -0800 (PST)
Received: from [192.168.1.2] (c-92-34-217-190.bbcust.telenor.se.
 [92.34.217.190]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-595803b80dcsm3955909e87.44.2025.11.18.06.36.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 06:36:05 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 0/3] drm/atomic-helper: Fix atomic modesetting
 regression
Date: Tue, 18 Nov 2025 15:36:02 +0100
Message-Id: <20251118-mcde-drm-regression-v2-0-4fedf10b18f6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NQQ6CMBBFr0Jm7RgLKVZX3sOwKHRaJpGWTA3RE
 O5u4QAu38//76+QSZgy3KsVhBbOnGKB+lTBMNoYCNkVhvpSa6WUwWlwhE4mFApCee9j0zjqr8b
 eWuOhLGchz5/D+uwKj5zfSb7HyaL29L9vUaiQnNamId+71jxeHK2kc5IA3bZtPwvtHu+3AAAA
X-Change-ID: 20251118-mcde-drm-regression-33deb78a968f
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Aradhya Bhatia <a-bhatia1@ti.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
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

This fixes a regression experienced in the R-Car and MCDE DRM
drivers after

commit c9b1150a68d9362a0827609fc0dc1664c0d8bfe1
"drm/atomic-helper: Re-order bridge chain pre-enable and post-disable"
caused a series of regressions in all panels that send
DSI commands in their .prepare() and .unprepare()
callbacks.

This series make it possible to selectively bring back the
old behaviour with explicit semantics.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Changes in v2:
- Queue Marek's patch first in the series for coherency.
- Add a patch to also preserve the late CRTC disablement
  semantic.
- Rename helper function to reflect the new semantic.
- Update the MCDE patch to use the new callbacks.
- Link to v1: https://lore.kernel.org/r/20251118-mcde-drm-regression-v1-1-ed5583efbd68@linaro.org

---
Linus Walleij (2):
      drm/atomic-helper: Add disable CRTC late variant
      drm/atomic-helper: Add special quirk tail function

Marek Vasut (1):
      drm/atomic-helper: rcar-du: Enable CRTC early on R-Car DU

 drivers/gpu/drm/drm_atomic_helper.c           | 98 +++++++++++++++++++++++++--
 drivers/gpu/drm/mcde/mcde_drv.c               |  6 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c |  2 +-
 include/drm/drm_atomic_helper.h               |  5 ++
 4 files changed, 103 insertions(+), 8 deletions(-)
---
base-commit: 6548d364a3e850326831799d7e3ea2d7bb97ba08
change-id: 20251118-mcde-drm-regression-33deb78a968f

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

