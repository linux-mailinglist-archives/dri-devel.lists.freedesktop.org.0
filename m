Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E650A962D34
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 18:03:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3137310E4A9;
	Wed, 28 Aug 2024 16:03:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="eQcP0zR6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C7B910E4A9
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 16:03:49 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4281ca54fd3so59650295e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 09:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724861028; x=1725465828; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6KaeAtS4w+qmZprwWGkoTcR3oRoqE544x0VrIYID4nI=;
 b=eQcP0zR6wKFswJcBNPRaJ4DjS99Z7EGBcuueCR7E964sBIOeL+LJAAlmYSbvLgjmSd
 SWZmmxSe9YBtKAoxD+H/KUle1HV71uP2tuVZYfC/MjSHxM5KhfBK1XrOw1AZDwubPX0e
 vmTyemh/JoDozdJqFTCXu0qGnE6HjGWptw8xsISvM3ipTS2uKKm9l4JSZPigGkmCz9LT
 NAXOkSudMWKoq1N77xlNfVJT4ad7FIQZd8Xf/3CRTs4e4fpi1Da3YkUqySCUX/zR3sFa
 FZeeCy859SG1RqBpGiGolpmQ97lc517y+FPiHZNgybzmdBA1EKTYylYogyFuzg3bNj4c
 52ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724861028; x=1725465828;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6KaeAtS4w+qmZprwWGkoTcR3oRoqE544x0VrIYID4nI=;
 b=cFS2Hum4BJmThEyPJfR7METnGjcUOvTdxcDF0Cr1idvtNs2vvWIYd8KRyXkMjl3QBi
 ez5qRdNl6EeXr0DJTAa7TrUtMC/mgbIsWgXQ5VtSyIymQVyZzdJorvNg/jH+hZxXxTvS
 BDXEiekgpx8hR9CQJ/pgHHgvv5EV315nQLW+wQBvVOrL+93g7yQ26HtLDV9COqPqjGqE
 95a0XA95Wp1P0+vXw8FdGVvqIULl9cA8Gg0pR7cCg6jvPAKBJGus94+fZRxQMGGg6+Bn
 pQOLAARLhyBkLpUwoyXjcxJWRa7a9bBec0TehqIAI63aDyIYtLcuTtimGIftDu0TgDmr
 C0Qg==
X-Gm-Message-State: AOJu0YxpZIhYLWuYLdZ8wVQtrIuchaKITL66xWox9GzUP8mS6K3tJBgW
 GREuF2NLDuueFwEnhuML4quPQDs92MKafb6WLqTcDUOfn5c0MiuEMmmaS+6xOp4=
X-Google-Smtp-Source: AGHT+IFNJLAVMcwNXPymIxJQq/HRMeAHgttyxGUyXJwWLcd/lnfaTpuOrUwquFYyUe5TQgAbz9ln/g==
X-Received: by 2002:a05:600c:3b11:b0:425:7884:6b29 with SMTP id
 5b1f17b1804b1-42bb0306e86mr1038505e9.19.1724861027270; 
 Wed, 28 Aug 2024 09:03:47 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3749b22da51sm153232f8f.15.2024.08.28.09.03.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2024 09:03:46 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 0/2] drm/panel: annual cleanup of visionox vtdr6130 driver
Date: Wed, 28 Aug 2024 18:03:38 +0200
Message-Id: <20240828-topic-sm8x50-upstream-vtdr6130-multi-v1-0-0cae20d4c55d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFpKz2YC/x3NQQqDMBBA0avIrDswSYzEXqV0EcxYBxoNSRRBv
 HtDl2/z/wWFs3CBZ3dB5kOKbGuDenQwLX79MEpoBk26J6cd1i3JhCW60xLuqdTMPuJRQx6UIYz
 7twoGNZOxo/Vm7KGlUuZZzv/m9b7vHyCKubl2AAAA
To: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Doug Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=641;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=ujwNTQtf+AJwJFlFp29hT/8lwBb/S99JhAGeM1B2rQU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmz0phjtvSHrOFyrGNgGpv2xzzDkjRzWePNy62W6N6
 LmPXbn+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZs9KYQAKCRB33NvayMhJ0T8GD/
 wPUgWXXX64GlG0B+hfYGPmDrSlFLTtJ/b3t/QnO+W4vJDitrQ5J0dTrN3b2bj+xzCYNBxBsY6ijiul
 yI8blOZIpENltMyfKhBRxrIeTsPOqZGPDFw6QsF4b8Q0JDJbGurAFwf32yls1QZ5NMmfmPCIQ8+mML
 a7S1v0E9NCRFxKdjgG6h9UaiDTOz5x3W9seglemykWh/I72IoxoUZtVu0kc7T4JQNn6XltvI5N+tqj
 YxW0Fd8AFnkRRuoCyIpo+ji84HuuiKaiEQYxMGFAL30xzr3Q71D8rRXnHP1IF1YmPd7fLVhIbsTeKQ
 O+eHQAnmA035BrbiimrdMbpr0m1fRT1T939ScJnhyDtNxq6oST2bRBhMPIt6ynUKL5iyUUSsK/f5Nw
 Uc2yi60EUG+MBxfiDQQrOsXm5gjCQRvTupX0iydpfexBQXqfZbAf9AcFZC+efdCFQiYdud1drOCPGl
 JHRBfJ11Ml1ku5rQ34og8FeyW6/brafbvWgXA6xV0FBQ77yLgr3BI/KyWGewR2E5zjSN7Ohu2ClbTo
 GqsuTmDsKij4Fi2lV2AIGs1H6WKTYxaFA1Uq/g+fWcflu36Em6avP8aGioTtZJux5z+8YVtHIVTvq6
 BrwDoj8wcvJP1SOUURriQOmoVKh6eAOsgL0alIOvmUlDSHcr4i96GaMXWrwg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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

Switch to _multi() dsi functions and devm_regulator_bulk_get_const()

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Neil Armstrong (2):
      drm/panel: visionox-vtdr6130: switch to mipi_dsi wrapped functions
      drm/panel: visionox-vtdr6130: switch to devm_regulator_bulk_get_const

 drivers/gpu/drm/panel/panel-visionox-vtdr6130.c | 212 +++++++++++-------------
 1 file changed, 98 insertions(+), 114 deletions(-)
---
base-commit: 195a402a75791e6e0d96d9da27ca77671bc656a8
change-id: 20240828-topic-sm8x50-upstream-vtdr6130-multi-d1f03595a394

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

