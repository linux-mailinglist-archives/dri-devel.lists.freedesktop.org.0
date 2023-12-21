Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A8381C096
	for <lists+dri-devel@lfdr.de>; Thu, 21 Dec 2023 22:56:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7CB910E589;
	Thu, 21 Dec 2023 21:56:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1C1D10E589
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Dec 2023 21:56:18 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id
 e9e14a558f8ab-35fc1a21f60so6294805ab.0
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Dec 2023 13:56:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1703195777; x=1703800577;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=d5sCfVn0Rl/7lsdspIykh4i2JHByLubzZbSyK4Lu5I0=;
 b=bdWGifRdPp4qlls+vK2y2zngQ+2dLTGJz84LNoRtvqHZpGw5FNlknRoM+iucSrmGgo
 izND64BsGzyjb/nANrFxjrLXkltBOutY1VGKonlqE9juGBqYlgu86FqN5KFzreYDtpYy
 QChcF/F8CmL8Wqj6Lqlw3H3N0vWxeVnPSY4Vc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703195777; x=1703800577;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=d5sCfVn0Rl/7lsdspIykh4i2JHByLubzZbSyK4Lu5I0=;
 b=l66sLmuFm/ZCeMrCTrXcxdBH7nVDO4DGCjuMjchuUenMiXX8RQT9dS4LCIzJVZvSV+
 ii7qeNRv7NlFz85CiJil33hPWlBPQnSNYxxAn81ipqM48l9NCHP882wm06qs9OLopfM7
 D+JCBFlXcA1ogEQdoB5zc1grlZRzfc0XGCw7GEIKtNrTx8lk1+6RT64lwl0jr6cgY1Og
 kIxV+fv9dirE3Jl2JLt82YNypaJ4H/aNiMkNhMDlvHiAmxrvj5myOCbMGmK5vocrF7af
 6KJRZWLJksSJ6VKoo+naU8OdquhFHL6iVhn6wKOY1R+vJ80Xm1j/x9CCNYs/EOf4PePk
 MPjw==
X-Gm-Message-State: AOJu0Yz9R5aQsJX22ISOgSP5ig7McYQ9MbNGnCJIqZZbqavNDf1bZ8P+
 qdMP2jmsS23LeXwPdt/j4DbEFD6Guftav08T2srJJCBvZwCeORU=
X-Google-Smtp-Source: AGHT+IGIcnnNfBQaowtnhHdWeRblSF1ebship4DKZXKcJsbxoGbQoeIHDP4o7Vpw5S8wufiKZVjLHA==
X-Received: by 2002:a05:6e02:2688:b0:35f:b958:29f3 with SMTP id
 bz8-20020a056e02268800b0035fb95829f3mr299519ilb.124.1703195777479; 
 Thu, 21 Dec 2023 13:56:17 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:153:ce57:e73a:ec3a])
 by smtp.gmail.com with ESMTPSA id
 l30-20020a63ba5e000000b005cda2559351sm1756817pgu.88.2023.12.21.13.56.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Dec 2023 13:56:16 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/bridge: parade-ps8640: Wait for HPD when doing an AUX
 transfer
Date: Thu, 21 Dec 2023 13:55:48 -0800
Message-ID: <20231221135548.1.I10f326a9305d57ad32cee7f8d9c60518c8be20fb@changeid>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org,
 treapking@chromium.org, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 hsinyi@chromium.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Unlike what is claimed in commit f5aa7d46b0ee ("drm/bridge:
parade-ps8640: Provide wait_hpd_asserted() in struct drm_dp_aux"), if
someone manually tries to do an AUX transfer (like via `i2cdump ${bus}
0x50 i`) while the panel is off we don't just get a simple transfer
error. Instead, the whole ps8640 gets thrown for a loop and goes into
a bad state.

Let's put the function to wait for the HPD (and the magical 50 ms
after first reset) back in when we're doing an AUX transfer. This
shouldn't actually make things much slower (assuming the panel is on)
because we should immediately poll and see the HPD high. Mostly this
is just an extra i2c transfer to the bridge.

Fixes: f5aa7d46b0ee ("drm/bridge: parade-ps8640: Provide wait_hpd_asserted() in struct drm_dp_aux")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/bridge/parade-ps8640.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
index 541e4f5afc4c..fb5e9ae9ad81 100644
--- a/drivers/gpu/drm/bridge/parade-ps8640.c
+++ b/drivers/gpu/drm/bridge/parade-ps8640.c
@@ -346,6 +346,11 @@ static ssize_t ps8640_aux_transfer(struct drm_dp_aux *aux,
 	int ret;
 
 	pm_runtime_get_sync(dev);
+	ret = _ps8640_wait_hpd_asserted(ps_bridge, 200 * 1000);
+	if (ret) {
+		pm_runtime_put_sync_suspend(dev);
+		return ret;
+	}
 	ret = ps8640_aux_transfer_msg(aux, msg);
 	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
-- 
2.43.0.472.g3155946c3a-goog

