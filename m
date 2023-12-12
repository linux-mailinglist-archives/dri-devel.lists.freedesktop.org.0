Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A9080E089
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 01:56:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E015910E091;
	Tue, 12 Dec 2023 00:56:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24BFB10E091
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 00:56:05 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-6cea0fd9b53so3141204b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 16:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1702342564; x=1702947364;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AS84DpIlnHadbg548UoBHWDlxNfb0zaNqIcRTC+jUtI=;
 b=TfaIj72TJlKAhZdJHH779Sgj+Sc4xQTMnLIM7KxnbsuSe/PD1pWddScQplyVDQdSkz
 ePSZ7lBrIc8ycyYW56Mkt1gXDjRFHzqXxEvPIdC2GidJaUwtky8TsWyfYDsxJArDb2pO
 S0cw1PqgF06JUEc02HPT40GiHFpswy5S20aTw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702342564; x=1702947364;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AS84DpIlnHadbg548UoBHWDlxNfb0zaNqIcRTC+jUtI=;
 b=Qonc2geRFrv++NL26BeQk6bGN/D+LxYIWapObB2Elx0c+ADd+h3N/0I+kL2sMs4e1C
 epH6lYympm1cWx43kTgxPVi6r8cZa7m3PxQXOyeOFn/8D0t6A6G4fyBaOyQsWao1Py8T
 JeIiU+rf3B0QyGy5AG+B005nDWg80hDbQPuS2p6M/bz1l+xNgO6qI1ZQTdlZPjbQGdMe
 BIhuU+OrRDt9nHnlgaxdd5xIctDa8dHCG3Lh1Dj5vSpMkTb+bihktIcf3jSsvAVJmLC7
 YVtdHXUbpn+x/re/jq0kv6jxKdHd/C+xydHOYN6BPXfR1R5CAiur+J6hgvxeEZxHKIEi
 yVpg==
X-Gm-Message-State: AOJu0Yzvgl8J4wdEBleI8N5NGNew1qP3V4aN7PiLWmvdLb6t6Z6l2Ej4
 Br2bo1xke01RZLdvbR3ZniR0V41rqDgF3hH2a5pO1Epf
X-Google-Smtp-Source: AGHT+IEImkGOKriQgUmpcCdrkAlZGOVMJy7dWUFL7Mf+hsw6l3dDIoDd8j4PpPAdxvC2/AV5oSW9hg==
X-Received: by 2002:a05:6a21:99a4:b0:18c:18d3:c8fd with SMTP id
 ve36-20020a056a2199a400b0018c18d3c8fdmr3061776pzb.14.1702342563762; 
 Mon, 11 Dec 2023 16:56:03 -0800 (PST)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:5c08:e1ed:d922:d30c])
 by smtp.gmail.com with ESMTPSA id
 k10-20020a170902694a00b001cc311ef152sm7251271plt.286.2023.12.11.16.56.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Dec 2023 16:56:03 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/bridge: parade-ps8640: Never increase the length when
 reading from AUX
Date: Mon, 11 Dec 2023 16:55:26 -0800
Message-ID: <20231211165526.1.I9d1afcaad76a3e2c0ca046dc4adbc2b632c22eda@changeid>
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
 Neil Armstrong <neil.armstrong@linaro.org>,
 Philip Chen <philipchen@chromium.org>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 Sam Ravnborg <sam@ravnborg.org>, Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Stephen Boyd <swboyd@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While testing, I happened to notice a random crash that looked like:

  Kernel panic - not syncing: stack-protector:
  Kernel stack is corrupted in: drm_dp_dpcd_probe+0x120/0x120

Analysis of drm_dp_dpcd_probe() shows that we pass in a 1-byte buffer
(allocated on the stack) to the aux->transfer() function. Presumably
if the aux->transfer() writes more than one byte to this buffer then
we're in a bad shape.

Dropping into kgdb, I noticed that "aux->transfer" pointed at
ps8640_aux_transfer().

Reading through ps8640_aux_transfer(), I can see that there are cases
where it could write more bytes to msg->buffer than were specified by
msg->size. This could happen if the hardware reported back something
bogus to us. Let's fix this so we never increase the length.

NOTE: I have no actual way to reproduce this issue but it seems likely
this is what was happening in the crash I looked at.

Fixes: 13afcdd7277e ("drm/bridge: parade-ps8640: Add support for AUX channel")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/bridge/parade-ps8640.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
index 8161b1a1a4b1..fb2ec4264549 100644
--- a/drivers/gpu/drm/bridge/parade-ps8640.c
+++ b/drivers/gpu/drm/bridge/parade-ps8640.c
@@ -302,7 +302,7 @@ static ssize_t ps8640_aux_transfer_msg(struct drm_dp_aux *aux,
 
 		fallthrough;
 	case SWAUX_STATUS_ACKM:
-		len = data & SWAUX_M_MASK;
+		len = min(len, (unsigned int)(data & SWAUX_M_MASK));
 		break;
 	case SWAUX_STATUS_DEFER:
 	case SWAUX_STATUS_I2C_DEFER:
@@ -310,7 +310,7 @@ static ssize_t ps8640_aux_transfer_msg(struct drm_dp_aux *aux,
 			msg->reply |= DP_AUX_NATIVE_REPLY_DEFER;
 		else
 			msg->reply |= DP_AUX_I2C_REPLY_DEFER;
-		len = data & SWAUX_M_MASK;
+		len = min(len, (unsigned int)(data & SWAUX_M_MASK));
 		break;
 	case SWAUX_STATUS_INVALID:
 		return -EOPNOTSUPP;
-- 
2.43.0.472.g3155946c3a-goog

