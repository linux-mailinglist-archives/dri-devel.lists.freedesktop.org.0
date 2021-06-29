Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91FC73B6BAD
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jun 2021 02:23:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B13756E5B0;
	Tue, 29 Jun 2021 00:23:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61CC76E5B0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jun 2021 00:23:48 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id d19so24178272oic.7
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jun 2021 17:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=R/6nR4UW4kPU6Pum9dl3DddSZeMlmk/JUVE50CblSMc=;
 b=Kc0cb9xCHAM3DWJg6MEv4rNVluBteWNjCoQa9PoewQdlXNPMLB9SrAGQUOO10D1Z+7
 sbEaU5+tom7zfGhk7ipRliodb5MrU4q2YfzFxmgCyuMBzYinUrFkregE00INk666MLzI
 pikrsnv3cF3DVNSJg+z2bCbGTSYNNO1NNdEeWSozcGiYzKLoAjEZeZFOfFkjgpIXzRQv
 N+6vCHCgoHrssbxnHQECzu1VdE0a8o9npTDbpbZDPOXJSZXjpw5e9SKBH2x6MKChK1dc
 DnO/IA54Js7KGGgPgZqKhxNLtdyHbBgR+s9kKuQoNIXCKwi1sB6M2kLU1YhytUvyaZR/
 fr/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=R/6nR4UW4kPU6Pum9dl3DddSZeMlmk/JUVE50CblSMc=;
 b=qteedlU50MC+tIh3gzjeoYzw/UQ99HpYQbIpxDyThQrDX8AvHmHopa7mj+9qJjWhc4
 ZrvtySQ1fyZkVDriilaHI2gkyCjy+6eO5c/43wy16CTSoMStwLvgI+2eoGu6DkLl2PcX
 vut5I8HHxNGJv5oD2gV3AnpIVxnoeDcVn3mnPhyeRi0hrkr73Yvn1Qd21yLjVIeEc/rH
 MH51ltsz88A2ui64fohcxB1py0KRr3VN9nIInFLSYymq8/JwfxJwWnrx/pwvG2cK1xwn
 QuSjKCaWQs5a/krBddB1jFxmoHgsUBTbASMpt1bm1JYbrXdJFLS6rruJkOplpylH2EZx
 SyiQ==
X-Gm-Message-State: AOAM532kxFXH3x2sIzqa2h1886+t9wcwNoiu8grEYu7DVEMq9APOVPvH
 G9xZwtDARHV5Vexdck8OaGgCQQ==
X-Google-Smtp-Source: ABdhPJwR+e2m+qyRi/h5qg5s6o66E6B7NlowbEmn0tGDJxb9ItlFX5cK0ayhCbUJj9qo2FX0VTw4vg==
X-Received: by 2002:aca:1910:: with SMTP id l16mr7959451oii.12.1624926227351; 
 Mon, 28 Jun 2021 17:23:47 -0700 (PDT)
Received: from localhost.localdomain
 (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id k14sm1980801oon.5.2021.06.28.17.23.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 17:23:47 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH] drm/msm/dp: Make it possible to enable the test pattern
Date: Mon, 28 Jun 2021 17:22:34 -0700
Message-Id: <20210629002234.1787149-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The debugfs interface contains the knobs to make the DisplayPort
controller output a test pattern, unfortunately there's nothing
currently that actually enables the defined test pattern.

Fixes: de3ee25473ba ("drm/msm/dp: add debugfs nodes for video pattern tests")
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_debug.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c b/drivers/gpu/drm/msm/dp/dp_debug.c
index 2f6247e80e9d..82911af44905 100644
--- a/drivers/gpu/drm/msm/dp/dp_debug.c
+++ b/drivers/gpu/drm/msm/dp/dp_debug.c
@@ -305,6 +305,8 @@ static ssize_t dp_test_active_write(struct file *file,
 				debug->panel->video_test = true;
 			else
 				debug->panel->video_test = false;
+
+			dp_panel_tpg_config(debug->panel, debug->panel->video_test);
 		}
 	}
 	drm_connector_list_iter_end(&conn_iter);
-- 
2.29.2

