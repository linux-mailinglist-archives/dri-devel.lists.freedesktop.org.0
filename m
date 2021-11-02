Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC65A442A7A
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 10:36:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B36D72D1F;
	Tue,  2 Nov 2021 09:36:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4EDD6FC47;
 Tue,  2 Nov 2021 07:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1635839372; x=1667375372;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=bUC50mfIJyBns7fqhgK329wyRxmw8IFfdQcl4OGlqUc=;
 b=qsHviMpejWMT0D3xNhcpX6Ts7TpjsvMGXskqDQo71VafpBVIO3GpQsdG
 3RAMozE9udivyXc1QQ2CuZZTXK0ar74JoNOuJVGSwv7XgnW1jKtvYXSa5
 +HqHp1E9LIVZZKnRuPCj6elruBALGyIETnPYQil3TwuzqQjO0yArPoCSh M=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 02 Nov 2021 00:49:32 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 00:49:31 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; 
 Tue, 2 Nov 2021 00:49:31 -0700
Received: from sbillaka-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; 
 Tue, 2 Nov 2021 00:49:27 -0700
From: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 3/5] drm/dp: Add macro to check max_downspread capability
Date: Tue, 2 Nov 2021 13:18:43 +0530
Message-ID: <1635839325-401-4-git-send-email-quic_sbillaka@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635839325-401-1-git-send-email-quic_sbillaka@quicinc.com>
References: <1635839325-401-1-git-send-email-quic_sbillaka@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Mailman-Approved-At: Tue, 02 Nov 2021 09:36:34 +0000
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
 dianders@chromium.org, quic_abhinavk@quicinc.com, swboyd@chromium.org,
 seanpaul@chromium.org, quic_mkrishn@quicinc.com, quic_khsieh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a macro to check for the max_downspread capability in
drm_dp_helper.

Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>

changes in v4:
    - Return 1 for DPCD version >= v1.1 (Stephen Boyd)
---
 include/drm/drm_dp_helper.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index b52df4d..596635c 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -1767,6 +1767,13 @@ drm_dp_tps3_supported(const u8 dpcd[DP_RECEIVER_CAP_SIZE])
 }
 
 static inline bool
+drm_dp_max_downspread(const u8 dpcd[DP_RECEIVER_CAP_SIZE])
+{
+	return dpcd[DP_DPCD_REV] >= 0x11 ||
+		dpcd[DP_MAX_DOWNSPREAD] & DP_MAX_DOWNSPREAD_0_5;
+}
+
+static inline bool
 drm_dp_tps4_supported(const u8 dpcd[DP_RECEIVER_CAP_SIZE])
 {
 	return dpcd[DP_DPCD_REV] >= 0x14 &&
-- 
2.7.4

