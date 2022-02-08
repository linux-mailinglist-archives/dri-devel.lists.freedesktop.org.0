Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F424AE269
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 20:44:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA44810E163;
	Tue,  8 Feb 2022 19:44:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1DF110E125;
 Tue,  8 Feb 2022 19:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644349486; x=1675885486;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=B0beRUcpy6mm/IC1BcwaxatHK/JKj1WU47oyT+N03mg=;
 b=YzCTLMOPfIVhIbXDZTkBKZ8zDNCBZRaBIwd+1M1g1CESN5lqhSCQ4HIu
 r4NYNXzLD+xJ7Fan2NB+XsD+H6wYN2zjcj58I+Z2l9iT3Is4lkLcB+ngc
 hKIq5oEJM6NX4HJN55nLJqJMCnvM+kDPylNNv93LkyFY0UXpKt0ELxpDr 4=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 08 Feb 2022 11:44:44 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 11:44:43 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 8 Feb 2022 11:44:43 -0800
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 8 Feb 2022 11:44:42 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <johannes@sipsolutions.net>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] devcoredump: increase the device delete timeout to 10 mins
Date: Tue, 8 Feb 2022 11:44:32 -0800
Message-ID: <1644349472-31077-1-git-send-email-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.7.4
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
Cc: rafael@kernel.org, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, khsieh@codeaurora.org, nganji@codeaurora.org,
 seanpaul@chromium.org, gregkh@linuxfoundation.org, dmitry.baryshkov@linaro.org,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are cases where depending on the size of the devcoredump and the speed
at which the usermode reads the dump, it can take longer than the current 5 mins
timeout.

This can lead to incomplete dumps as the device is deleted once the timeout expires.

One example is below where it took 6 mins for the devcoredump to be completely read.

04:22:24.668 23916 23994 I HWDeviceDRM::DumpDebugData: Opening /sys/class/devcoredump/devcd6/data
04:28:35.377 23916 23994 W HWDeviceDRM::DumpDebugData: Freeing devcoredump node

Increase the timeout to 10 mins to accommodate system delays and large coredump
sizes.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/base/devcoredump.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/base/devcoredump.c b/drivers/base/devcoredump.c
index f4d794d..6b83ae5 100644
--- a/drivers/base/devcoredump.c
+++ b/drivers/base/devcoredump.c
@@ -18,8 +18,8 @@ static struct class devcd_class;
 /* global disable flag, for security purposes */
 static bool devcd_disabled;
 
-/* if data isn't read by userspace after 5 minutes then delete it */
-#define DEVCD_TIMEOUT	(HZ * 60 * 5)
+/* if data isn't read by userspace after 10 minutes then delete it */
+#define DEVCD_TIMEOUT	(HZ * 60 * 10)
 
 struct devcd_entry {
 	struct device devcd_dev;
-- 
2.7.4

