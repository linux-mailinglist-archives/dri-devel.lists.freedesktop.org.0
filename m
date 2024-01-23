Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4E2837963
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 01:38:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65ADC10F1C1;
	Tue, 23 Jan 2024 00:37:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 267B710F19E
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 00:37:14 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id
 5614622812f47-3bd7c15a745so2700082b6e.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 16:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1705970173; x=1706574973;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j2GMW5d6UiU7LajKCHttmnW2RyiQyBOWeh+blbgnn98=;
 b=JoTxnm/B4YV4fthnYQOXazFdExc0FHI76uJ2HCG9YjG3rUn+i+qcfrytj64ACajyDu
 m7ysWEZqWUSkikk+CkanKQyb1tcUG18Gt+x2HjKebEnaMbGvlB9PmWVMOZPP4r9b2nP5
 0hvHbgHBT3g0gTV4JmZ3jVe6IsSqOHx3VqHL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705970173; x=1706574973;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j2GMW5d6UiU7LajKCHttmnW2RyiQyBOWeh+blbgnn98=;
 b=OoxbEZBFMVNC0Soeaov6DMYnBEHBNmTWmVJFEWuZIB4CCsTQLD84TrgEAgmvJuKAUK
 6dje4XeToelqcdYA95I+Y5h2hS2gCCJ87AOBrMOIysVcrNhNyhOvZbJWKyuO2bYnOHkP
 ZfoXqJzqHQtVQSj+1tBlEkXzik10orUxTbwIwx+cST6Oafe/z0/BdCPdRWxLkXLwxG3a
 5B+YhLGU46bErMD3F7W69ew3cNKry9ghvkIDAYeNoLApE6Kk2vTtlRdLR98XoIeZXiai
 A1qqGwnphq7pjYYwBp4+k261IHCsdZYhUrfFXFXrxWElmSlhyL9VDcIHbuDu46scJn3C
 AZzg==
X-Gm-Message-State: AOJu0YwiEhnRJ4BBN8dMmEvvf/FhXq+5FoF2dSTeoLZd2Rutnx7/sb5D
 6Q4mYzZnBfLFbFwbPZCroWp1x3BTt6hss6m8ooIpU76WuXAScgr3G9pnlrafsg==
X-Google-Smtp-Source: AGHT+IHM+0P0FFoTrriCmMbo8B8EOrjWPouiok2qtQ86UTP2/HFLy+hSK6JukrOOVWReaOLPFOxUUQ==
X-Received: by 2002:a05:6808:2383:b0:3bd:bff5:e2c with SMTP id
 bp3-20020a056808238300b003bdbff50e2cmr1442385oib.42.1705970173539; 
 Mon, 22 Jan 2024 16:36:13 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
 by smtp.gmail.com with ESMTPSA id
 h5-20020aa786c5000000b006dbd2fb0451sm4174214pfo.166.2024.01.22.16.36.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jan 2024 16:36:08 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: linux-hardening@vger.kernel.org
Subject: [PATCH 50/82] drm/vc4: Refactor intentional wrap-around test
Date: Mon, 22 Jan 2024 16:27:25 -0800
Message-Id: <20240123002814.1396804-50-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240122235208.work.748-kees@kernel.org>
References: <20240122235208.work.748-kees@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2077; i=keescook@chromium.org; 
 h=from:subject;
 bh=KcdFfpjp2tEyCmOpl25iW2AS7m4+B6NStR38DJl8ObE=; 
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlrwgJ2AMyzRsa5sDxZ4YRjmUqmbVj5uaz9YlbJ
 skuXbMaqBeJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZa8ICQAKCRCJcvTf3G3A
 JlUcEACJwN1o8p9j5S/8sYa2gf2nY09bRSaqimJyQqXt58XWmacC7yhhCy8/YoRrWd4rtTKGNJO
 2pyhqZo0AjchZUD2eT/92rshpJ7BoxmmmipARVGs8rGccRxnL+NfA7KluKUS2arbEJZWAxsye1u
 7y9mIZmz0Rl2OEUDiZmLsRUn+x+avkj9t/3WyQhf6z4yB9UeAjExcIzx4ut7naUZQMOs4+nqkhO
 Zxzlk3pu3vEqZBDOzDzLUdhBPeX8m4ZfghTd9cnirA7bkdk+2o6zogqBJN3U6xN7BheU/BKOa1/
 z2viLhR6pAfqpCI5yqOPvSv1Vm+BuvP4sPKwJGV2Odq05P3+Crxq80AgR9KuL3Zuj0RUdDuPRr7
 CK2iELzMBzCaI6HGeRTGu1TcgkQK/Cc1GB5flX/hQ1gepvIzeDSxkg2zzksciW3yRdCdzK1R8vU
 Tp8TEvuJU2S75RSbpxkNPABsnumVvC61dAYZkurqkiHcZRtQWX2ycPQRm0/NVXUiHLtL5aNGijN
 xy3P5YOafRtNbo7sqqxpsgSvJHA6bW0Kp2/QMZetVh+TBxjwl1em23ZSqK8EVnA/Cpcn2GaT6N6
 eyYfB3sBKYHuJ6cigOdu7aG2tBuyJ9LI/IVLUrXbg5xH4fWbZdA2Dm/CSSYEZ4S40USso8DNtmk
 W8/+QxpbrEQYWUg==
X-Developer-Key: i=keescook@chromium.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
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
Cc: Bill Wendling <morbo@google.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Justin Stitt <justinstitt@google.com>, David Airlie <airlied@gmail.com>,
 Kees Cook <keescook@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In an effort to separate intentional arithmetic wrap-around from
unexpected wrap-around, we need to refactor places that depend on this
kind of math. One of the most common code patterns of this is:

	VAR + value < VAR

Notably, this is considered "undefined behavior" for signed and pointer
types, which the kernel works around by using the -fno-strict-overflow
option in the build[1] (which used to just be -fwrapv). Regardless, we
want to get the kernel source to the position where we can meaningfully
instrument arithmetic wrap-around conditions and catch them when they
are unexpected, regardless of whether they are signed[2], unsigned[3],
or pointer[4] types.

Refactor open-coded wrap-around addition test to use add_would_overflow().
This paves the way to enabling the wrap-around sanitizers in the future.

Link: https://git.kernel.org/linus/68df3755e383e6fecf2354a67b08f92f18536594 [1]
Link: https://github.com/KSPP/linux/issues/26 [2]
Link: https://github.com/KSPP/linux/issues/27 [3]
Link: https://github.com/KSPP/linux/issues/344 [4]
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/gpu/drm/vc4/vc4_validate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_validate.c b/drivers/gpu/drm/vc4/vc4_validate.c
index 9affba9c58b3..677d9975f888 100644
--- a/drivers/gpu/drm/vc4/vc4_validate.c
+++ b/drivers/gpu/drm/vc4/vc4_validate.c
@@ -206,7 +206,7 @@ vc4_check_tex_size(struct vc4_exec_info *exec, struct drm_gem_dma_object *fbo,
 	stride = aligned_width * cpp;
 	size = stride * aligned_height;
 
-	if (size + offset < size ||
+	if (add_would_overflow(size, offset) ||
 	    size + offset > fbo->base.size) {
 		DRM_DEBUG("Overflow in %dx%d (%dx%d) fbo size (%d + %d > %zd)\n",
 			  width, height,
-- 
2.34.1

