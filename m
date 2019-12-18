Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC7A1256E0
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 23:36:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7E796EA91;
	Wed, 18 Dec 2019 22:36:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D5686EA8F
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 22:36:00 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id b9so2006587pgk.12
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 14:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bs+0Z3ZAq0GUCLQ+n50Ot+tqfKigg1gtSIr+d12Ntvk=;
 b=OZ/SeBNzOTFV3iidD+L+EgqMHqkaR4aikrerDs76ymG1SN7nhEpyOC+UFiuamQUjd9
 ZD6SI1x5UKTrlQf2/09RPG1BGfMDxmxEPOhAcd7nfVhLEiBlV9oh1FI2bQ68S9BVPFlH
 m6nFcGb2TR8Wubr07fHZ0mnErVPI/Mjx5sEms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bs+0Z3ZAq0GUCLQ+n50Ot+tqfKigg1gtSIr+d12Ntvk=;
 b=IiMAG032oxhdKt8ykTbfSFTZlLHL14z7omBjOkmGOllc/QZfC1HEpi8r2dTz+bS1Xu
 w3/7K7sws9t1aXtpAa6Xu9aQpgcXECmnq9XUGc3zqFOULjtbIpIMcin5oIDLISmwFOhg
 5VOXF3yLQhv5cEsW9rrQUZeYh35+nDcb1P/4ZI1XDA6YGgK4bczXpwgylGHZkq4TPBSV
 4gAeznAWV+zhG0uCwfgk43GUaAJdX+lWsLZ6jzu/KSmn58znXdkREMZn4wSs2Yqq82Vd
 iiS33jPfvyZ7ev0Jvt7VBSyCDoG/BSN5P++cu70GURz83AJVHmMRV6r8pKNTd7Qx7xoI
 z1/w==
X-Gm-Message-State: APjAAAVYcwrNOL0nr3FsyedNm703mY4PwsIMeyb5Uv+BENS+aPy8c8Rb
 6u5H7vE+d3VAlivn3cHpV0PhEQ==
X-Google-Smtp-Source: APXvYqxHbtd+gTe6cUJkLw0xl7+3zIZbnWasbDkDhnj6z7TE+24OJXXlyEG+S4g65cIiX359hal6dA==
X-Received: by 2002:a62:5290:: with SMTP id g138mr5847412pfb.54.1576708560228; 
 Wed, 18 Dec 2019 14:36:00 -0800 (PST)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id i9sm4709919pfk.24.2019.12.18.14.35.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 14:35:59 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v3 2/9] drm/bridge: ti-sn65dsi86: zero is never greater than
 an unsigned int
Date: Wed, 18 Dec 2019 14:35:23 -0800
Message-Id: <20191218143416.v3.2.Id445d0057bedcb0a190009e0706e9254c2fd48eb@changeid>
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
In-Reply-To: <20191218223530.253106-1-dianders@chromium.org>
References: <20191218223530.253106-1-dianders@chromium.org>
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
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, seanpaul@chromium.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When we iterate over ti_sn_bridge_dp_rate_lut, there's no reason to
start at index 0 which always contains the value 0.  0 is not a valid
link rate.

This change should have no real effect but is a small cleanup.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Tested-by: Rob Clark <robdclark@gmail.com>
Reviewed-by: Rob Clark <robdclark@gmail.com>
---

Changes in v3: None
Changes in v2: None

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 2fb9370a76e6..7b596af265e4 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -458,7 +458,7 @@ static void ti_sn_bridge_set_dp_rate(struct ti_sn_bridge *pdata)
 	/* set DP data rate */
 	dp_rate_mhz = ((bit_rate_mhz / pdata->dsi->lanes) * DP_CLK_FUDGE_NUM) /
 							DP_CLK_FUDGE_DEN;
-	for (i = 0; i < ARRAY_SIZE(ti_sn_bridge_dp_rate_lut) - 1; i++)
+	for (i = 1; i < ARRAY_SIZE(ti_sn_bridge_dp_rate_lut) - 1; i++)
 		if (ti_sn_bridge_dp_rate_lut[i] > dp_rate_mhz)
 			break;
 
-- 
2.24.1.735.g03f4e72817-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
