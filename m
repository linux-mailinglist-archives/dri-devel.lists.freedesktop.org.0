Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 734E54DB76A
	for <lists+dri-devel@lfdr.de>; Wed, 16 Mar 2022 18:37:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62FEA10E8F7;
	Wed, 16 Mar 2022 17:37:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E84A10E8F5;
 Wed, 16 Mar 2022 17:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1647452267; x=1678988267;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=7W8kooW+UTmGyvszE1jPzSwZsl1xQ+fW8wQHJr2tNSs=;
 b=WYKo+Z6mE774B19/AA+QXd+XvVwjJRcbrAmt/VzBX5QEYIm6JvJQQfB3
 w7EYjlgkD299aZ3x7sYSlVmaZHOKxDfmbkw/3BocDoXhDWy5CVkfYmJbc
 Pcscrxvi/peAewu/oBtCqSxvYPFkIbr8nSXqny8Y6eg20scusav8X0ebG c=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 16 Mar 2022 10:37:46 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2022 10:37:46 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 16 Mar 2022 10:37:45 -0700
Received: from sbillaka-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 16 Mar 2022 10:37:38 -0700
From: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>
Subject: [PATCH v5 9/9] drm/msm/dp: Support edp/dp without hpd
Date: Wed, 16 Mar 2022 23:05:54 +0530
Message-ID: <1647452154-16361-10-git-send-email-quic_sbillaka@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1647452154-16361-1-git-send-email-quic_sbillaka@quicinc.com>
References: <1647452154-16361-1-git-send-email-quic_sbillaka@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: quic_kalyant@quicinc.com, Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 dianders@chromium.org, bjorn.andersson@linaro.org, quic_vproddut@quicinc.com,
 airlied@linux.ie, sam@ravnborg.org, quic_abhinavk@quicinc.com,
 robh+dt@kernel.org, swboyd@chromium.org, agross@kernel.org,
 seanpaul@chromium.org, dmitry.baryshkov@linaro.org, thierry.reding@gmail.com,
 krzk+dt@kernel.org, quic_khsieh@quicinc.com, sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some eDP sinks or platform boards will not support hpd.
This patch adds support for those cases.

Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index f15316b..f8ddc73 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -596,8 +596,10 @@ void dp_catalog_ctrl_hpd_config(struct dp_catalog *dp_catalog)
 	reftimer |= DP_DP_HPD_REFTIMER_ENABLE;
 	dp_write_aux(catalog, REG_DP_DP_HPD_REFTIMER, reftimer);
 
-	/* Enable HPD */
-	dp_write_aux(catalog, REG_DP_DP_HPD_CTRL, DP_DP_HPD_CTRL_HPD_EN);
+	/* Enable HPD if supported*/
+	if (!of_property_read_bool(catalog->dev->of_node, "no-hpd"))
+		dp_write_aux(catalog, REG_DP_DP_HPD_CTRL,
+				DP_DP_HPD_CTRL_HPD_EN);
 }
 
 u32 dp_catalog_link_is_connected(struct dp_catalog *dp_catalog)
-- 
2.7.4

