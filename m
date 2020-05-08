Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 896701CBB47
	for <lists+dri-devel@lfdr.de>; Sat,  9 May 2020 01:33:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3B9D6E239;
	Fri,  8 May 2020 23:33:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E41106E239
 for <dri-devel@lists.freedesktop.org>; Fri,  8 May 2020 23:33:51 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id 18so1775111pfx.6
 for <dri-devel@lists.freedesktop.org>; Fri, 08 May 2020 16:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aH8P4+Ei6pqqMKSRAGY6lrlBj9MTJLPAq1y54tH7x5M=;
 b=c2jrSafQfRhEZd9jTfLKbDy93UfmN/2t2IeoD8u5JqRk43Wn2SFjno2k+3fw8Ww7ha
 m/86nRlyZIcjbgT65I6GDky8MnlZk9UJacJo9vtbWrY6C2A8oO28CkrUfd8wSgbGF8ot
 w3YXATiZu/A7UtV8gDeP4jKT01vaiwWb7Walg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aH8P4+Ei6pqqMKSRAGY6lrlBj9MTJLPAq1y54tH7x5M=;
 b=YOaxQ+bd4VUFTO6CbsXX5wGHHRfLBc9Qxhp+7EJwxud44HuRh30F2JwcAFgc70WlHI
 U8hZFYlhD171XBq6RCYfD5ksRvFYdBP2h2su9uyvOQNAjxyLe8a7vJqB993E/sv+JCL1
 yztUCtwr0ziEjgzih9JMNrg2BIAYovja4PYrXkDIiRd/p8oFkkeDtFQfoZOKvjmjUBco
 MJNn3eXtYv99JwfCSS6chGLoukOXqHMcIhdfUAJnpgk0VcZwIx6GStnL3lfy01ulzGpJ
 ugP0tTxbFbIR2rClbRvmlbFSrEN0rZU6zEEWhykvUHehVSgIbn8UzXvF+Ad6vay3Ovkn
 XGRA==
X-Gm-Message-State: AGi0PuaYZJI3D0Juzlq58LTbgT+S+Rr0y+MK2m29lorhI5YW4v0dLRTX
 55fkq1RKA6QLKQYUZwRO5A60JA==
X-Google-Smtp-Source: APiQypJvhMuGbXg+gBKnMJeVTmbSCsAWmHD2jkpOVJl3TZQ859+Dq6ODnzjWWTM/O3Ntaprp3YQ5hw==
X-Received: by 2002:a63:575f:: with SMTP id h31mr3707439pgm.200.1588980831399; 
 Fri, 08 May 2020 16:33:51 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id p66sm2713991pfb.65.2020.05.08.16.33.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 May 2020 16:33:50 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: [PATCH] drm/bridge: ti-sn65dsi86: Clear old error bits before AUX
 transfers
Date: Fri,  8 May 2020 16:33:29 -0700
Message-Id: <20200508163314.1.Idfa69d5d3fc9623083c0ff78572fea87dccb199c@changeid>
X-Mailer: git-send-email 2.26.2.645.ge9eca65c58-goog
MIME-Version: 1.0
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
Cc: robdclark@chromium.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, Sandeep Panda <spanda@codeaurora.org>,
 seanpaul@chromium.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The AUX channel transfer error bits in the status register are latched
and need to be cleared.  Clear them before doing our transfer so we
don't see old bits and get confused.

Without this patch having a single failure would mean that all future
transfers would look like they failed.

Fixes: b814ec6d4535 ("drm/bridge: ti-sn65dsi86: Implement AUX channel")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 6ad688b320ae..d865cc2565bc 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -827,6 +827,12 @@ static ssize_t ti_sn_aux_transfer(struct drm_dp_aux *aux,
 				     buf[i]);
 	}
 
+	/* Clear old status bits before start so we don't get confused */
+	regmap_write(pdata->regmap, SN_AUX_CMD_STATUS_REG,
+		     AUX_IRQ_STATUS_NAT_I2C_FAIL |
+		     AUX_IRQ_STATUS_AUX_RPLY_TOUT |
+		     AUX_IRQ_STATUS_AUX_SHORT);
+
 	regmap_write(pdata->regmap, SN_AUX_CMD_REG, request_val | AUX_CMD_SEND);
 
 	ret = regmap_read_poll_timeout(pdata->regmap, SN_AUX_CMD_REG, val,
-- 
2.26.2.645.ge9eca65c58-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
