Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA462416982
	for <lists+dri-devel@lfdr.de>; Fri, 24 Sep 2021 03:35:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A4EE6EDC6;
	Fri, 24 Sep 2021 01:35:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2058.outbound.protection.outlook.com [40.107.94.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFCF06EDC2;
 Fri, 24 Sep 2021 01:35:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jbQ1zGb2AVbGFVFjW54x9GI3fGFWLHdZxcBgV0L2U7EDi+ed+9utU1WzmOEYoBwIxs5ka7NTIsHG+Je9R+1LDHvm/1k7EJTJM9ljiMuvSzrkVl3DdP9fGR57YzgfRl7zGHj6dre3zh6y4kOn9sL3yIu+gU4//w4L2Nwq8oi3juzaWFteXCd8O+Orpov0TFkh7IBOSu+1AyML4boaC/z2+iFi+GpzZqJCejwC3ZsiMnLlm0pOETymgZxeBXJyBwR6s9KqANGlGAAPk1FJ9iOfjJxZyurVm8W6hug8SNUXNJomwWwhkjR6LZImq92x0D210gNI8AaYCqRsUJE5PsBCHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=ELetepFpLbkmWJZgtVO/WFe+geunVXvNfM9e1/EFTJQ=;
 b=cAYWCini0dr2xcq235n4wZUrnLi0r/vNV3iT3YwlET61g2PHvt8kG0rqFOlWjaJHJP1v1La6cSdFMIwTHqSW6FEmkuyyZSznSZAToBIIetpIiXoVc8/7BKsaF0DqQHXnAVxTuOUl37ZHyjLApOBznFlbsraGJ0UGbZ+mJXCdphR+oNfJoxQJgWnASAl4/kYnh+GKohk9P1gK4DTJhD9Yq2yA5Txc7POWLuyK0r9uAQVPo6zj5Jdi9Wo7el1sm7vCSOrNGHbDtRdHVU2s9fF1CIuyFr/04MsVx3vON7dV6Bd29+7IZswVvP6vN86Lfw+9kss5zuXqe3W5JYKbh2YEyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.ie smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ELetepFpLbkmWJZgtVO/WFe+geunVXvNfM9e1/EFTJQ=;
 b=Ec3D4SaftdMDJCxu19dxgLyMj+613xEeX8GktEX1gJC1Ri7SV95yj07lzCxhN9uQdLAp/AVaZu3/Gh1bcz318Rn3yZ7p7sPNjr1VnRl6UBw28B+AnUlya9UFnSEFY6YHSEgiT7yG2eMxbdDIm7EbKgDp2/Qb9mVkHj+5NGDdJNg=
Received: from DM5PR11CA0014.namprd11.prod.outlook.com (2603:10b6:3:115::24)
 by MN2PR12MB3632.namprd12.prod.outlook.com (2603:10b6:208:c1::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Fri, 24 Sep
 2021 01:35:41 +0000
Received: from DM6NAM11FT066.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:115:cafe::19) by DM5PR11CA0014.outlook.office365.com
 (2603:10b6:3:115::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Fri, 24 Sep 2021 01:35:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT066.mail.protection.outlook.com (10.13.173.179) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4544.13 via Frontend Transport; Fri, 24 Sep 2021 01:35:40 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Thu, 23 Sep
 2021 20:35:39 -0500
Received: from jasdv6.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2308.8 via Frontend
 Transport; Thu, 23 Sep 2021 20:35:34 -0500
From: <yipeng.chen@amd.com>
To: <harry.wentland@amd.com>, <sunpeng.li@amd.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <qingqing.zhuo@amd.com>, <Aric.Cyr@amd.com>,
 <Anson.Jacob@amd.com>, <bindu.r@amd.com>, <martin.tsai@amd.com>,
 <bing.guo@amd.com>, <roy.chan@amd.com>, <george.shen@amd.com>,
 <joshua.aberback@amd.com>, <Ashley.Thomas2@amd.com>, <Jing.Zhou@amd.com>,
 <dale.zhao@amd.com>
CC: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <ching-shih.li@amd.com>, "Yipeng Chen
 (Jasber)" <yipeng.chen@amd.com>, Roman Li <Roman.Li@amd.com>, Anthony Koo
 <Anthony.Koo@amd.com>
Subject: [PATCH v2] drm/amd/display: Fix randomly flicking on overlay with
 enabled ABM
Date: Fri, 24 Sep 2021 09:34:41 +0800
Message-ID: <20210924013441.97128-1-yipeng.chen@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7b8d86bf-64f4-4099-3cd9-08d97efb9e4f
X-MS-TrafficTypeDiagnostic: MN2PR12MB3632:
X-Microsoft-Antispam-PRVS: <MN2PR12MB363231DF8AF903480F42FF16FFA49@MN2PR12MB3632.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pbsWbrOmnvwCHHk7OLA6uEr+6d+vUorNLhpoElLueIz6cL/5IxnT9s6lpXxIRnZJGIZH+ZEBdwUfBXaPgggHqVN7qmtEONNjFeKAQwBAt+a+3LwsM53VKTF7G+HySdZ91e++XGrXNhBmswcmn+pINvWAMqSE0VVgiHvCtFQ4cWUamS+26Q/6YpVA4mnyriFsh+4TfEoLD5LSLOXByXp7t4WO30mnh3aDSwO7SSZKylgQljDPUhuDXLWxEmhdZJM/do8Yy7baGdxVJFutrRsGTf6XmsD2tVjTSSARRb5HRK2dMol6HqNfvZwz+oG7R6J0KkYs2P3w41u1Qcm1AcpzKwahbkZfmMW1dVr3pLLBkl6IrdRZrc9CTU99dIa4Y4NYdBf4GGrmlCWTIETfLSM0nOyi3+Glv7IVurBbvFMN0CJoYqqe2nMTHZMyfSa9C6U4bg5yODCfRlJD6pzXp6Td6mrg2fohfLMopZ57ubjIX9xP3h+QQKZsmyWexRqy8BRtmUlqe4zXSP15AH7ET6tHEZNu8rtloWvex+0l9X+ZnyykhpViDlD26G1YqwY5QdDvCa6IqYh4BlP88sniuFGbfTARFLZYEOuBcIyzb3WshsgsqqDYw+pxBHrlceZlMZmfNqfQzGbTO6c54x5hygv+SWTV1XJZusTGIVZxTfJKExqEZx7boXXLtuv08k8w4VQlHZo4zCbLkd8H+WqpplrWCqD4q5pslQsWRI1hS3h5SR9vl66O0Dg1ScPLEFdpQ4QU
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(2906002)(186003)(336012)(47076005)(8936002)(82310400003)(8676002)(2616005)(316002)(1076003)(356005)(508600001)(83380400001)(54906003)(5660300002)(70206006)(921005)(86362001)(36756003)(426003)(110136005)(6666004)(4326008)(70586007)(81166007)(2876002)(7696005)(26005)(36860700001)(6636002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 01:35:40.6730 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b8d86bf-64f4-4099-3cd9-08d97efb9e4f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT066.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3632
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Yipeng Chen (Jasber)" <yipeng.chen@amd.com>

[Why]
Enabled ABM (level != 0) would raise short pulse irq DC_IRQ_SOURCE_HPD1RX
randomly with PSR error LINK_CRC_ERROR. Actually there is no hot plugging
on EDP panel. After correcting CRC error, there is no need to send drm
hotplug event.

[How]
Returning false would skip doing hot-plug when handle_hpd_irq_psr_sink()
handled irq. Hot-plug process causes visible flicking on overlay.

Signed-off-by: Yipeng Chen (Jasber) <yipeng.chen@amd.com>
Reviewed-by: Roman Li <Roman.Li@amd.com>
Reviewed-by: Anthony Koo <Anthony.Koo@amd.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
index 1e4794e2825c..9b9fbe5e9bd4 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
@@ -3007,7 +3007,7 @@ bool dc_link_handle_hpd_rx_irq(struct dc_link *link, union hpd_irq_data *out_hpd
 
 	if (handle_hpd_irq_psr_sink(link))
 		/* PSR-related error was detected and handled */
-		return true;
+		return false;
 
 	/* If PSR-related error handled, Main link may be off,
 	 * so do not handle as a normal sink status change interrupt.
-- 
2.25.1

