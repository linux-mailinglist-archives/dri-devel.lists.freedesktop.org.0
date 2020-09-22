Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AEB2752A6
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 09:54:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 051C26E479;
	Wed, 23 Sep 2020 07:54:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E40389CCB
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 20:31:26 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id z4so18524417wrr.4
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 13:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K7apNRD9MQ+dEbnQVbfSw0In2eqPMXGuCV372ylb3ZQ=;
 b=OagBs5Mr581914UQu8F6d9SAwSkG5/gcggEYnmLSooih5w9+pvahrzoIo2l+4uXwRw
 wjaY4E8zGIqTlotqJhMU8FHlmwguHxCbYQKhPJYXCRYfYeFeeUYVCGEbyRRAAeLMpDPJ
 HSe8JFQioKful9hDEQIeYIMkv2sUsxjDpYInrA9RfSc17XwQ3IUqXuHcX2s0v3dkg/2J
 nNijXALVdV8Jufj78uqr2Q2Jyh2HwnAaTdTSA5wJ958V4f6P3ovWd2t3URWp0bHmqw0E
 V5uRcAHj+NbxkdGvpdwu3JllgyS0RkuQpFv2URaWLwDYNTVlAaGuqW1ZTQUWip7PVARJ
 NlYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K7apNRD9MQ+dEbnQVbfSw0In2eqPMXGuCV372ylb3ZQ=;
 b=ZDDf/J0a587zWh5Pty8Vv9C7upPKtKl0d+6mAyJaaPkU3khmuor8/tenhOCvJnTvSF
 GWXoIYsaJR4MCg/y4y5V5J+WG86vJ9w+aMJEbw4VSOslCwzLLe9+qxkQm3FDj+UFcXJA
 wMD9vujBPVbbI+6FU+2Jrj29dsw7o2gfFdF1TEQQ/BKhI3CPi6GYobkdtxmYkcFsof1t
 gjMhB/0Ogl6UNwcHtVQhZgw7e5bNLKQVWdavRx2AjzTm1wvmJVZjz2MK6Oe8QFtE0DPb
 bHSMYUVMutjetvFfY7+rftrqblcji7QupBAi1XNmHZj3Is+HUMIkGvJXAm76VY+27k8i
 P6qQ==
X-Gm-Message-State: AOAM533VrA1rPI8c8gw0CEzZ+BSIgGnwbLYlTG/WEDL0xzSq65c0FaBc
 gaVsN3TOAnU35zage+Lk7t8=
X-Google-Smtp-Source: ABdhPJx50jBkOlmQ/FbMgVAs/A5mIKKUMOJHkjBKcDGQzYUJcDfEyFDWSptl/aeOyIz3/TeA/+7d7g==
X-Received: by 2002:adf:81c6:: with SMTP id 64mr7064800wra.176.1600806684782; 
 Tue, 22 Sep 2020 13:31:24 -0700 (PDT)
Received: from localhost.localdomain ([170.253.46.69])
 by smtp.gmail.com with ESMTPSA id r14sm27256849wrn.56.2020.09.22.13.31.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2020 13:31:24 -0700 (PDT)
From: Vicente Bergas <vicencb@gmail.com>
To: Doug Anderson <dianders@chromium.org>, crj <algea.cao@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org
Subject: [PATCH v2 2/3] drm: rockchip: hdmi: allow any clock that is within
 the range
Date: Tue, 22 Sep 2020 22:31:06 +0200
Message-Id: <20200922203107.2932-3-vicencb@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200922203107.2932-1-vicencb@gmail.com>
References: <20200922203107.2932-1-vicencb@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 23 Sep 2020 07:53:19 +0000
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
Cc: Vicente Bergas <vicencb@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For a video mode to work it suffices that the available bandwidth is
large enough. There is no need to have an exact match.

This greatly expands the list of supported monitors.

Signed-off-by: Vicente Bergas <vicencb@gmail.com>
Tested-by: Vicente Bergas <vicencb@gmail.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index 23de359a1dec..87a9198f7494 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -230,7 +230,7 @@ dw_hdmi_rockchip_mode_valid(struct dw_hdmi *hdmi, void *data,
 	int i;
 
 	for (i = 0; mpll_cfg[i].mpixelclock != (~0UL); i++) {
-		if (pclk == mpll_cfg[i].mpixelclock) {
+		if (pclk <= mpll_cfg[i].mpixelclock) {
 			valid = true;
 			break;
 		}
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
