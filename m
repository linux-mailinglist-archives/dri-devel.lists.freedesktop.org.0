Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2095F892D37
	for <lists+dri-devel@lfdr.de>; Sat, 30 Mar 2024 21:43:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D485A10E47F;
	Sat, 30 Mar 2024 20:43:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gBRAMsjQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAC2B10E045
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 20:43:29 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-3433e518c78so580962f8f.1
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 13:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711831408; x=1712436208; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=K7N0D7Kjfk0JATRsxflDv0tI3CZgim2NBK8j/8+EBeA=;
 b=gBRAMsjQzP0S/UAHfoQ8/uwZn8XDw0Th5ijB6sK2Sc8k+BlrlLRWrBhkuc7h4Q8afW
 ExNbrT30Ywx3caGy58CPZCZ6+0DSx8hKARQVqdOhgo3oNY94WgPv7QvBF+ypOPFwKWy2
 DLQ16uhOJ8r6t7/UvflxOOIqctN9MeSr3Rjss+qlvyB3RNGXYa0Mh2/LyIv+nZEJSQLd
 6NsS4YgTH3LVZGy2bZtBeNpF/vCgJ4zkWAUxW7B3+AnUixKO8BOp4z6lgPOD599LYk6x
 bpRJlEb5N1X6Nf0zDW/LHnQgacDtKnUPqKJEYrBFJnZBD/GyLy7j0rQLtXt4yrcmvqBo
 UNLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711831408; x=1712436208;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K7N0D7Kjfk0JATRsxflDv0tI3CZgim2NBK8j/8+EBeA=;
 b=Q7gdKVBWy4YY1CBPReP4C1H5ZleD8Kf7goO7bp8w6dg6C8De+5fHIEniNBJ3sjaijM
 65hYDeNkGniZuaLRQJsH4zjeK/+fTT77aLv2192EgEDG4+Xolvi6YVMMtobhS11TEtB2
 dC42gMRjlkN4LW/tZkF1/gHELexwI0CjAIzTPXikD0/5/xFv7NpMihPmnk4AZaOFoaeF
 8Qvl+WMR6tPV69zbVKvuJjBP7I3CzfUznPDPAtLaRiZRzB9OvWh4fxflB0ce46Xi7SBQ
 MhrHsxbCN4NFUNlXTN8TLQibBOccKp+KFI+cSsywbseCGujV0s7OMi928fmVwwWOlXhg
 bPzQ==
X-Gm-Message-State: AOJu0Ywa+wSPlBC4zcWhz6DuLjCG0msLWaTnkRh5NbE9pGpzp+lVFhSu
 nobc3pb/THbzFBaj392fFKufB/t9AyjaxrjQGSpC63Z6DsaKA8JLN8dcyK3t+mTdOPDbsrvGEpy
 l
X-Google-Smtp-Source: AGHT+IGovvSTbspKm9/uX3uiFBF3Rzq6mLU/EqERkjT+y/Op/qBmj/dbGtOoq0wlVWRETE6RaWnnJA==
X-Received: by 2002:a5d:6043:0:b0:33d:8c9d:419 with SMTP id
 j3-20020a5d6043000000b0033d8c9d0419mr5302058wrt.24.1711831407999; 
 Sat, 30 Mar 2024 13:43:27 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16]) by smtp.gmail.com with ESMTPSA id
 o12-20020a5d4a8c000000b0033e7b05edf3sm7231299wrq.44.2024.03.30.13.43.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Mar 2024 13:43:27 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 00/11] drm/mediatek: drop driver owner initialization
Date: Sat, 30 Mar 2024 21:43:11 +0100
Message-Id: <20240330-b4-module-owner-drm-mediatek-v1-0-fd5c4b8d633e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF95CGYC/x3MQQqDMBBG4avIrB2IUSl4FXERm992aJPIRG1Bv
 HtDlx883kkZKsg0VCcpDsmSYkFTV3R/uvgAiy8ma2xn2tbw3HFIfn+D0ydC2WvgAC9uw4ud620
 /38xSUiqLVbHI978fp+v6AXV4FlBuAAAA
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1673;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=5hjA386zwMlffmMn4NRghhyylnCA9pQb83mqNAD1Gws=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmCHlky5Ab07wRdqkTCAV1panAirUB2C1L0ur5U
 OVvafL4tMqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgh5ZAAKCRDBN2bmhouD
 10EZD/4w3np5oImOf6K7LQ7H1fmbPZuL+mTQh94jIgP6B7mi7lCuetbrxbmX9ijN8D3RvaGfH6S
 V1+KbFL+cj9L7V76xfnKzZIvbLSKwXqZdxpg6cQqhiFko8NA7d2OrH7Vi4ObyUEGYSuYoZ6s3qK
 U0ZwJlDue5FA1BWh3GmIjkn/tEiDRb5ALIHn2asHTZlqsBn3YN+N0CtSlB6dIFkWmvNa9e9Ewdz
 k0U4Fw7hGPH8aQMRbV64K5ykBTKhpyamK5M88gmp/yDN5JVvr7r+sZJi68lpORSr5bpHGXLU1+Y
 dCYrWy7fPjLbURMCm4IQcTh3bKafPXM3E2gNH+PMz4Bn+iZcgqrBhj750Psn7QTplIwawfFQTQf
 b7jk8TRAVjRiA0FaVx368uEBGtBJKWX2lllipHiiTYkhvPOYvyVPvdc8FDxebngkxuAxDcBaZok
 +soCitosPhDTF7SPeqHqBuuS2OADZzJEVINvuXllxkAZ2EewnUrgj281B0BYhmto1ZX6nqb8tZa
 esoGpfD6kOCoK5BIQUZMPd7CNV6KTXyXzDpaqq1nvwnt4W4KZMn2dEuEmCmZ+g47R4MP6adIfxg
 bJam4PP2V/8geJx70BJY7XJoWix1UrUwTVAtpENs5W1iKjFSggoGibqIHJe6cEQa8/LPMH9s0Xq
 gDCpgluIJFYRuBw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

Simplify the code by dropping unnecessary .owner initialization in the
driver.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (11):
      drm/mediatek: aal: drop driver owner initialization
      drm/mediatek: ccorr: drop driver owner initialization
      drm/mediatek: color: drop driver owner initialization
      drm/mediatek: gamma: drop driver owner initialization
      drm/mediatek: merge: drop driver owner initialization
      drm/mediatek: ovl: drop driver owner initialization
      drm/mediatek: ovl_adaptor: drop driver owner initialization
      drm/mediatek: rdma: drop driver owner initialization
      drm/mediatek: ethdr: drop driver owner initialization
      drm/mediatek: mdp_rdma: drop driver owner initialization
      drm/mediatek: padding: drop driver owner initialization

 drivers/gpu/drm/mediatek/mtk_disp_aal.c         | 1 -
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c       | 1 -
 drivers/gpu/drm/mediatek/mtk_disp_color.c       | 1 -
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c       | 1 -
 drivers/gpu/drm/mediatek/mtk_disp_merge.c       | 1 -
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c         | 1 -
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c | 1 -
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c        | 1 -
 drivers/gpu/drm/mediatek/mtk_ethdr.c            | 1 -
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c         | 1 -
 drivers/gpu/drm/mediatek/mtk_padding.c          | 1 -
 11 files changed, 11 deletions(-)
---
base-commit: 7fdcff3312e16ba8d1419f8a18f465c5cc235ecf
change-id: 20240330-b4-module-owner-drm-mediatek-aa525b70f033

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

