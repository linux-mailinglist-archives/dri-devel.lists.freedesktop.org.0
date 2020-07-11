Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBE421E8D3
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 09:02:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF8F06E8EF;
	Tue, 14 Jul 2020 07:02:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9DD26ED92
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Jul 2020 00:50:20 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id r22so7051029qke.13
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 17:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SH81ocgF+oAHcpIFHcVCEtbEA/eMMo0Rk5aeuJez85E=;
 b=dk7x85B9jBSqI7kMWwQmPep7Pkq3sdXPexpRQmUWMhTwZ52iwjKKuxKtcbipHk7IYI
 8YG31wZnH0cwTX1hmClJ1RDV9ymQi2jZ9H5gb0U16msjGovfyDw9K/xkgi32Nvez02PC
 PDPvBFV8pR7VIk9walAh8IXIDpl7OxYqPUAuCW/ZQW/r4n7TWtgmRnfZxNBAoHrqFPwS
 GT/bgOtQo2ipBNLbsmXkQPf2QdUui4c3EX1H61CGOrmoOy51bNfysCVYlTTBhuKRfaF5
 soiQv8PL9EZRvHsUgqNFnlTrNEG755A52YMwu9R8M5K5ME5KlAhbLvIblN1Sk7yxN0dT
 Y38g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SH81ocgF+oAHcpIFHcVCEtbEA/eMMo0Rk5aeuJez85E=;
 b=PHjRBvYj9Rj4xGa36jnrFUPkMQDwS/6s51P/W3Tr1SZwd22A0LF8NMhAVqho1kNpS1
 qC+RLtO6Gcu4CU8h66wlKXIAMI90CVGnAye32N1ByVMvWuwYdENoi8wpzt255Wp3hG3e
 AHEdHAWABxBdvYTBfQnuyh74YOiw4vHTnJU13ipdjidnd0d/Nukg9aOqZUdSCC/wxfXg
 D+QN6Pbb8GCTqXO30esuPNbAsJzwlMcYdi1quSclqMBBGixouKZFb2gb6Xiol/l01p2o
 NpuDqRdT4OcH+Zg2TGWiDnKeUFrUd3IDH8eI5rgg0o6mwKK0SgFTjdYHl4E/Rk8vh9R8
 ZC1A==
X-Gm-Message-State: AOAM533eSS1yeJ3fjR6fa1llPRha3UdGDIzDZy0JaMMLTuVpCCVWtauR
 dX0MxdteJh+E2gyJqMvrN4/JYQ==
X-Google-Smtp-Source: ABdhPJwKzjLiuX94fBfKmcTzf4I0K3ACIWPkWPoQt+kid5Kr+J3Euh9ydp8oQ5K7CTfbe49c39DuXQ==
X-Received: by 2002:a37:6758:: with SMTP id b85mr59916869qkc.238.1594428620058; 
 Fri, 10 Jul 2020 17:50:20 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id g20sm10427510qtc.46.2020.07.10.17.50.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 17:50:19 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [PATCH v2 5/8] drm/msm/dpu: set missing flush bits for INTF_2 and
 INTF_3
Date: Fri, 10 Jul 2020 20:47:28 -0400
Message-Id: <20200711004752.30760-6-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200711004752.30760-1-jonathan@marek.ca>
References: <20200711004752.30760-1-jonathan@marek.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 14 Jul 2020 07:02:08 +0000
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
Cc: Shubhashree Dhar <dhar@codeaurora.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Kalyan Thota <kalyan_t@codeaurora.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This fixes flushing of INTF_2 and INTF_3 on SM8150 and SM8250 hardware.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 20 ++------------------
 1 file changed, 2 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 613ae8f0cfcd..758c355b4fd8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -245,30 +245,14 @@ static int dpu_hw_ctl_get_bitmask_intf(struct dpu_hw_ctl *ctx,
 static int dpu_hw_ctl_get_bitmask_intf_v1(struct dpu_hw_ctl *ctx,
 		u32 *flushbits, enum dpu_intf intf)
 {
-	switch (intf) {
-	case INTF_0:
-	case INTF_1:
-		*flushbits |= BIT(31);
-		break;
-	default:
-		return 0;
-	}
+	*flushbits |= BIT(31);
 	return 0;
 }
 
 static int dpu_hw_ctl_active_get_bitmask_intf(struct dpu_hw_ctl *ctx,
 		u32 *flushbits, enum dpu_intf intf)
 {
-	switch (intf) {
-	case INTF_0:
-		*flushbits |= BIT(0);
-		break;
-	case INTF_1:
-		*flushbits |= BIT(1);
-		break;
-	default:
-		return 0;
-	}
+	*flushbits |= BIT(intf - INTF_0);
 	return 0;
 }
 
-- 
2.26.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
