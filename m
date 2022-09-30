Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A5F5F038E
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 06:25:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2E2810EB2E;
	Fri, 30 Sep 2022 04:25:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22E5110EB2E
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 04:25:30 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id 70so3170536pjo.4
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 21:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paradetech-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=ua2CSrcc4+s+YVRSAUzNcpQVlpY+dzHINIhgN6gplb0=;
 b=4XlFTYMrZPfOIVs+cVbucYVJAWGt8s1yJrTDQB7kVJBlZTC5rqls1yCwJArMS8IdGr
 QZaraZv6ZqWcSiiBnF9jhrv1tKah7vAG3w8s+TrEuDHXlROO7Ew54gEgxO6cJZw0jYdI
 cDF76p3waGjAQlU6NgZoNV/vOTzpYpIRYCSQu5/uOK9n1yqDBYmSuvuCn7ULjdBdVw7O
 txO9yIXKIK72yJFB8OuyxYH87b8ZMzrXjPs12CckYec9H90oLtPLjKF789ms4ETQcScY
 Tm7kxdNeOwfn6e0zGIrq6ymoKYsL9+UwHLK+6KYWjusLzetJG+nfN6CxQTicyw3bmdik
 YRYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=ua2CSrcc4+s+YVRSAUzNcpQVlpY+dzHINIhgN6gplb0=;
 b=ZCC41eWSQ+vfcuEwNff7aQpEdfUwQqryRrHn07//dEfDYLwRYqlhH5uy/9JpM/7Vcq
 Q6IFOcfabOUqYbCMFPu5538Nd6YJkhlQyzZ5Rx8Dmq8+NsqdyGlAvJFOaFrKHBR1xmCB
 2Fca6g0MvzQ6Lh1F5Ui0d0UYQZBbo5Os+q0NUa6YinnKvQO4dvm5jU6syZ9tZ8WaPyjJ
 0hlyHjR31guZfFl9a86XQPSAAOHLLLaktjldBZ0ZN9ONGMaYi1T6U3V/yjXe3mDYZxMR
 WbRxyjJxj6wvag1bLKbV32QO4e+AYieJIsK2EpMsHWvdJ4aQqBE31DBcScQtefpWYKlz
 RXLw==
X-Gm-Message-State: ACrzQf2an8vYprwI/W2HUpiHCxqKEIO/CaTn/IyFfDacrSjNSHuZiElH
 vXI0bNJ42xHlE6zAOmuIZ/7TxQ==
X-Google-Smtp-Source: AMsMyM6W0/5fgyQbbNfwZpW//Zplh6Np7NoxH0rNh0NvD6dM4daQr/NGbJiMtd4s8l8nsxzthnPDvw==
X-Received: by 2002:a17:902:6943:b0:178:4751:a76b with SMTP id
 k3-20020a170902694300b001784751a76bmr6717778plt.37.1664511929420; 
 Thu, 29 Sep 2022 21:25:29 -0700 (PDT)
Received: from jason-ThinkPad-L15-Gen-2.. ([203.67.103.146])
 by smtp.gmail.com with ESMTPSA id
 o17-20020a639a11000000b0043ba3d6ea3fsm760638pge.54.2022.09.29.21.25.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 21:25:28 -0700 (PDT)
From: Jason Yen <jason.yen@paradetech.corp-partner.google.com>
To: LKML <linux-kernel@vger.kernel.org>,
 Douglas Anderson <dianders@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/bridge: ps8640: Add software to support aux defer
Date: Fri, 30 Sep 2022 12:25:06 +0800
Message-Id: <20220930042506.2529522-1-jason.yen@paradetech.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Jason Yen <jason.yen@paradetech.corp-partner.google.com>,
 treapking@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This chip can not handle aux defer if the host directly program
its aux registers to access edid/dpcd. So we need let software
to handle the aux defer situation.

Signed-off-by: Jason Yen <jason.yen@paradetech.corp-partner.google.com>
---

Changes in v2:
- Add aux defer handler
- Remove incorrect statements

 drivers/gpu/drm/bridge/parade-ps8640.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
index 31e88cb39f8a..76ada237096d 100644
--- a/drivers/gpu/drm/bridge/parade-ps8640.c
+++ b/drivers/gpu/drm/bridge/parade-ps8640.c
@@ -286,7 +286,6 @@ static ssize_t ps8640_aux_transfer_msg(struct drm_dp_aux *aux,
 	}
 
 	switch (data & SWAUX_STATUS_MASK) {
-	/* Ignore the DEFER cases as they are already handled in hardware */
 	case SWAUX_STATUS_NACK:
 	case SWAUX_STATUS_I2C_NACK:
 		/*
@@ -303,6 +302,14 @@ static ssize_t ps8640_aux_transfer_msg(struct drm_dp_aux *aux,
 	case SWAUX_STATUS_ACKM:
 		len = data & SWAUX_M_MASK;
 		break;
+	case SWAUX_STATUS_DEFER:
+	case SWAUX_STATUS_I2C_DEFER:
+		if (is_native_aux)
+			msg->reply |= DP_AUX_NATIVE_REPLY_DEFER;
+		else
+			msg->reply |= DP_AUX_I2C_REPLY_DEFER;
+		len = data & SWAUX_M_MASK;
+		break;
 	case SWAUX_STATUS_INVALID:
 		return -EOPNOTSUPP;
 	case SWAUX_STATUS_TIMEOUT:
-- 
2.34.1

