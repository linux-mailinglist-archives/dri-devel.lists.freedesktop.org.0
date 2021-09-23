Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96AEB415A82
	for <lists+dri-devel@lfdr.de>; Thu, 23 Sep 2021 11:03:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AA1E6E0F6;
	Thu, 23 Sep 2021 09:03:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2074.outbound.protection.outlook.com [40.107.223.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 893946E0F4;
 Thu, 23 Sep 2021 09:03:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ki0+SDyMVV3AfDFMWKdEwnLfQ7C0TwzFLBesBomnbP9DbJN0V7qz+6iUrYGKwIGYNXGdNfEgwi1Us2q7mcG2KZLCAjoPWNf+UfdLh0M+OO99UhXuc3IFuF0owQ9hnzmAb5mbQJnb5bpNQU4+Pk2XVOr2dmOQDcN63AAgA6/0uymJJwLsTz3Y6JYlqnPjG+q9oQprEydc9dYBtJ19octNybRULFhx0ZqKFYe0VUkfW0rGvD6PYIUmLqkL+HlTQ+i+t/0ZBySeBOp/d0nEVSlkvIcA/smoc1bkHsRh9B+nSUd0ouU6FwTJSI56rTGN4afSxBWb1xNWUu1gGTAkaTlujw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=Z5IvkNW+PQl5XE+cn9sNi/+NRSmilfcnoHM0rpMFc3g=;
 b=nyTA9XqWcP2kufF0nfrmZv7oVeGrVyf7pKMB3xsynsPR2GS55cdpAqCVIU4vdVUuMXteWBM13VhDRinOdBI95PSrSNdfrocRdkxDsfqjyLMOH0DDwm20CdulUQVYz0uThixKyALZ7A7kQiLlGuTPirqfzIPBp3rRkLqPfZtcGCGJQDMcitoYj7UyNEXwYRL9jSQLiAlsm1A5+2unHTnHJeQx8RIr5QcRXmyPWVxL1pNTWX5uhBQ14G8dj1i0MRG3XPX09HKFxYL+B0zGmvxB9/t46MMyKIHS5ep9y/q/Qpm+B+DHv6O4rNiH+jOfmtXCDgNSxvQYOVKwEPl42t/GWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.ie smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z5IvkNW+PQl5XE+cn9sNi/+NRSmilfcnoHM0rpMFc3g=;
 b=XV303PX18FvfHYqbfVQVvQdiX7WOpuSoZ8xcqbKFTVe5iGlh5ka2M8TTZ5yzQLnk9IuWmv7obaGCyQVa+UZIZlM3hc9nK/Auy3vBWwuqaZq2lb3ldgnS4ipueIQghcw1gyTcvpTviV3B6KEfWsBM7xVXNiJfNzwRiHnfeYV0iAo=
Received: from DM5PR1401CA0006.namprd14.prod.outlook.com (2603:10b6:4:4a::16)
 by BL0PR12MB4740.namprd12.prod.outlook.com (2603:10b6:208:84::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.18; Thu, 23 Sep
 2021 09:03:35 +0000
Received: from DM6NAM11FT057.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:4a:cafe::a1) by DM5PR1401CA0006.outlook.office365.com
 (2603:10b6:4:4a::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Thu, 23 Sep 2021 09:03:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT057.mail.protection.outlook.com (10.13.172.252) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 09:03:35 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Thu, 23 Sep
 2021 04:03:34 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Thu, 23 Sep
 2021 04:03:34 -0500
Received: from jasdv6.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2308.8 via Frontend
 Transport; Thu, 23 Sep 2021 04:03:29 -0500
From: <yipeng.chen@amd.com>
To: <harry.wentland@amd.com>, <sunpeng.li@amd.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <qingqing.zhuo@amd.com>, <Aric.Cyr@amd.com>,
 <Anson.Jacob@amd.com>, <bindu.r@amd.com>, <martin.tsai@amd.com>,
 <bing.guo@amd.com>, <roy.chan@amd.com>, <george.shen@amd.com>,
 <joshua.aberback@amd.com>, <Ashley.Thomas2@amd.com>, <Jing.Zhou@amd.com>,
 <dale.zhao@amd.com>
CC: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, "Yipeng Chen (Jasber)" <yipeng.chen@amd.com>, 
 Roman Li <Roman.Li@amd.com>
Subject: [PATCH] drm/amd/display: Fix randomly flicking on overlay with
 enabled ABM
Date: Thu, 23 Sep 2021 17:02:32 +0800
Message-ID: <20210923090232.61559-1-yipeng.chen@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4ee36f0d-0d0b-42ae-4146-08d97e71069e
X-MS-TrafficTypeDiagnostic: BL0PR12MB4740:
X-Microsoft-Antispam-PRVS: <BL0PR12MB47406829332999C395DC5ADFFFA39@BL0PR12MB4740.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q0TQyc+kODCMTuTwfSA3lsIiWmMC+dPz3epT/Vru8rd7jUR3MeCnz88sNyiz7qawobBbLZUkFcvCdg49W8XpUTpg0mXQpFWkoHftQcH1zvk4XPJA+b+HvIIcqKgaKZpLfP83QdCVtECjStmresMR0Jr71D6tXbMQJEKiF++qv7NR6S/fM2wZRUjH5IlFrfGByH/8N4dGcZtHr3ZcTQ/a0sU5LEYa/Rq+J93RC/gSrAuM+pBsJ9Da9utWM9jbscnlQ3kXU91k5EiHG/e7h7g5rx9fV1PlzYiZWDsU9+FrhJj48oIykEevKMb6GYaEXSzyGoaBINus5WEnerJbbknP3zMn2kDIUBHK3ATErCRCdTyaONAT3R7C1uBrwzqwfn5JcycH7e3OWKEIFISSw7CoLD6xg5WzLOqgLFE3U0j5vxaPccwB/4r8LXwLB4c7wxDNMIYujTN1Oev7cvui6oANr8Fw66+LwuMGz8Na3y5PIYzvrVF+vnmKBekrv4B9DdwUJExbvbFNhuMH+2qrpNBsqU4MK66TzINjPvDXwITK4yDXRcTEvroWgTRVSwkGpttHsAUHOo+vWBJ8FcIrR/oYM4EI6OV2gp01pejn0fSX1HvuQ1LnHqBtV63TtBDTL3s6irr0ab1VvkCe3kh3SX9z2UYsTH0oSmKotYdK7Tmn/a5L7vciUGepkCsAJvA/8DMrUWjQGj8NjjFWM5wdGjcTPO1s6pExE61sb939RhAeMYmYxaOs1TWxL8Eo4gTKjTtb
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(54906003)(2876002)(1076003)(316002)(426003)(4326008)(47076005)(36756003)(2616005)(2906002)(508600001)(36860700001)(356005)(110136005)(8676002)(6666004)(186003)(6636002)(8936002)(81166007)(921005)(7696005)(83380400001)(82310400003)(86362001)(26005)(5660300002)(336012)(70586007)(70206006)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 09:03:35.6235 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ee36f0d-0d0b-42ae-4146-08d97e71069e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT057.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4740
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
Enabled ABM (level != 0) would raise short pluse irq DC_IRQ_SOURCE_HPD1RX
randomly with PSR error LINK_CRC_ERROR. Actually there is no hot plugging
on EDP panel. After correcting CRC error, there is no need to send drm
hotplug event.

[How]
Returning false would skip doing hot-plug when handle_hpd_irq_psr_sink()
handled irq. Hot-plug process causes visible flicking on overlay.

Signed-off-by: Yipeng Chen (Jasber) <yipeng.chen@amd.com>
Reviewed-by: Roman Li <Roman.Li@amd.com>
             Anthony Koo <Anthony.Koo@amd.com>
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

