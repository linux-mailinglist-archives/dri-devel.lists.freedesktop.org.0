Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 199B091548D
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 18:44:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5AE410E150;
	Mon, 24 Jun 2024 16:44:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aLlRjoWN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D393410E150
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 16:44:04 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-421cd1e5f93so34954325e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 09:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719247443; x=1719852243; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uPl1ZQhtp404/46Icx++0xUILGoKNCSD4Zi+KclrJiY=;
 b=aLlRjoWNQo8KrMNhgtKj5nhqfbf/N3ZnK7U9emL42hDr+B0L7IfFN4cxPTJGDIf9Uh
 NEcyuj/D+5yaIOa55F9dFSlXboVZ09fNxLes0w9D6DPTpl1Ac42CzXVFY23YZhyihdcU
 D4kL7maBDYKYDEbi+Seh7HVF4QcGHeomv1TSnbxeFFLmgyBlNKtdkWMxJXfwncmtXjRz
 2Y9KLs+Qq2VL4vIVSdPQpPTKGBd3I9l5M2vXYbMf29yRuINZMBktfTd9l1PnM5qD5A8g
 ZsXKxaDEszEAfJRja+0Q0OYkJOwRDZ5Q51BWEUaZzuVm83SeYPPsR6S/lUkxG/Isi9G+
 +JcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719247443; x=1719852243;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uPl1ZQhtp404/46Icx++0xUILGoKNCSD4Zi+KclrJiY=;
 b=YWp0vRXr868HxZS/EzgqSVd6xda95rygL0WHUy0q2Zzcp2zFLFTHDBvDyYtrOOqxXw
 qdxHAHqATVDlbfaM8IIAoygDLmANyNWzT5MGwf4FhdFhwbYimMhmgXohU8JRPKAIfqt7
 JiR9X1P6HAivJq6FjAfyLumtzLU5qUP6oRoWMOP7B5bxYrwhFTW4Q6dJZ9RdhxWv8RdA
 +jKxvqaAFRmM4I66E+cDoOlNEsG6hmssuVxFGx6At4d/HnKYMic4/FPhxOGBnpnWQeRW
 AKY+WAt9BbSN4HpVaAoWsCPQRzEHzGSNscPy3oJws5kPG3LS+6CSwYGqu0ZwJUCliv98
 qVQg==
X-Gm-Message-State: AOJu0Yz0i4qIa+H4LP8hHO4KAi2dtEM5MoUBsfyrO0KuBAgigl9nOJQk
 fIQ9OwSNZLA+j1KT3nM+tE47Bpcie0Z8zf6IDmryNUw6T0eVRVmK
X-Google-Smtp-Source: AGHT+IHZL64bTgMiLUEUoyTtjAuoK7dRxFHbZnfAkyi5qDaE8VVg4wQ9jBw8En6Ky+VVdvaKH93RwQ==
X-Received: by 2002:a05:600c:4fd0:b0:424:74ed:dbfc with SMTP id
 5b1f17b1804b1-4248cc66abbmr38179755e9.35.1719247443096; 
 Mon, 24 Jun 2024 09:44:03 -0700 (PDT)
Received: from [127.0.1.1] (84-115-213-103.cable.dynamic.surfer.at.
 [84.115.213.103]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42484fc0aecsm126090365e9.12.2024.06.24.09.44.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 09:44:02 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Subject: [PATCH 0/3] drm/mediatek: fixes for ovl_adaptor
Date: Mon, 24 Jun 2024 18:43:45 +0200
Message-Id: <20240624-mtk_disp_ovl_adaptor_scoped-v1-0-9fa1e074d881@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEGieWYC/x3MSwqDMBAA0KvIrA3EMVjwKiIhTUY7+EnIiBSCd
 2/o8m1eAaHMJDA2BTLdLBzPiq5twH/cuZLiUA2o0egBjTquzQaWZOO9WxdcumK24mOioPRLoxv
 e2BvTQx1SpoW//32an+cHv+QRl20AAAA=
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 "Nancy.Lin" <nancy.lin@mediatek.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719247441; l=1065;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=ROPDCII861NLGqzE80k9+DtJm8iQ/4QlSPD6kcUJ+YY=;
 b=pk334UJ3+WtdigFDy/IyUejM7j4FgWaYmPUO9ZXnCA9jfFn1yVyJk19bsKp+cRJMFnnrkWzpz
 lSZ8e01j9sfDdOUxhI2QnN//s+lP7nzC5B3oCoMDOacSUVG55AN/ACX
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
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

The main fix is a possible memory leak on an early exit in the
for_each_child_of_node() loop. That fix has been divided into a patch
that can be backported (a simple of_node_put()), and another one that
uses the scoped variant of the macro, removing the need for any
of_node_put(). That prevents mistakes if new break/return instructions
are added, but the macro might not be available in older kernels.

When at it, an unused header has been dropped.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
Javier Carrasco (3):
      drm/mediatek: ovl_adaptor: drop unused mtk_crtc.h header
      drm/mediatek: ovl_adaptor: add missing of_node_put()
      drm/mediatek: ovl_adaptor: use scoped variant of for_each_child_of_node()

 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
---
base-commit: f76698bd9a8ca01d3581236082d786e9a6b72bb7
change-id: 20240624-mtk_disp_ovl_adaptor_scoped-0702a6b23443

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>

