Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2971696EEA
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 22:12:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43F2410E127;
	Tue, 14 Feb 2023 21:12:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2059.outbound.protection.outlook.com [40.107.220.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C15A10E0FD;
 Tue, 14 Feb 2023 21:12:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ea3spVb9V/ANpkNvYiEqT6iMSa1jRs4WnaQi9BQBUuKdxRHA8ieP3HCJr1iKQkzsFTk5aXGTILakTxnMU9VbOcm3Dt7UQQBUOAH9Xf3sQxvUk4uq9tKcA5JfScx2q+xvVxZ8JpHjWDBoDvhswF2uPslHZqlIXhsJ4jUbPhYWsBLJhhB6v1Ecx4To50LCZZb+gn9GEkiqgDhynBHJiqIVjS758NCSxAo9D5O3xmE/PJY3kGidoVuQEv5zZJYLLSo/o0zJF6epNKq6XHGMSfx3CYtJDg4HqQghPXDLWEnvBypit2vsqAnjBzXvAt8N6QWf8l2tJMP12aY+Reaxy269Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OWs7F9eCOdpi4KdwL8v/e6svZn1EccRKMbmYQOmIfAw=;
 b=KeWHrrqwjI9HHYRYEflTf8dVvonCIwYPSTq9EUEfSkPkWce/9jsnnQAKvHSOuN9YNWUCqrl2W9CFN5XKtA+1o38smrWwWuDSDgHFI/kxBRwwimTX7/IUqZyJDk7hZDFP4Pe4w+uhoTi4WAB/ufdMyqwKXPl11uuUt3mwMdIaPsG6bYkqdG9ch69DQEpwS7UkJbJzQ1DM+OupNbOqbytquRW6VrKUSoM6GZrSWEKCGVtZLYPHA5T2gdcjv+GFZrHphGhQPT6U4yWw3DnRtSKh8I1cCBN3nWefpm50zNHgd3UssjdnLTsinVOUdf3h+Qlc7Uwb5DH47mJSuTR4fUHNKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OWs7F9eCOdpi4KdwL8v/e6svZn1EccRKMbmYQOmIfAw=;
 b=P7xGdkdhj5fxXf56+i/2obRq5YvwkTrDPaY1yVTO3OD7+Te4Xl9StiuP8VVXmEw2eNxbDa5+CXu7xI5FfdASm4x67UBfxG/pzN+srCcjUPSoL7ZMK28VJRUUv/pELEa6noSXxtJ8+3NkYGbIIef7voBSqoLQtRAz6rgiRzPIXNY=
Received: from BN9PR03CA0364.namprd03.prod.outlook.com (2603:10b6:408:f7::9)
 by CH3PR12MB8711.namprd12.prod.outlook.com (2603:10b6:610:176::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Tue, 14 Feb
 2023 21:12:01 +0000
Received: from BL02EPF00010206.namprd05.prod.outlook.com
 (2603:10b6:408:f7:cafe::80) by BN9PR03CA0364.outlook.office365.com
 (2603:10b6:408:f7::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24 via Frontend
 Transport; Tue, 14 Feb 2023 21:12:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00010206.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6111.10 via Frontend Transport; Tue, 14 Feb 2023 21:12:00 +0000
Received: from hamza-pc.localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 14 Feb
 2023 15:11:58 -0600
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/display: only warn once in
 dce110_edp_wait_for_hpd_ready()
Date: Tue, 14 Feb 2023 16:12:54 -0500
Message-ID: <20230214211254.233468-1-hamza.mahfooz@amd.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00010206:EE_|CH3PR12MB8711:EE_
X-MS-Office365-Filtering-Correlation-Id: c564e2cf-ac09-4e06-d7ed-08db0ed01d28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ocVjFEGknyzklbNDFTOb0+J1sKTmuRN5g2qA69g3Ac67l3uXXtQdXcYce3/87j9UWDi6WK455/7kdZnE/D0QR/ve3mMI52xkIo85vXwfWd9IqFgbu3wvVnpbnMJEIl2v/thdX2dec0Tb/upLnL9rKromRA7fBmr6VeM+yaFDmz+4v554s1invBQ8XLsqX2t6gP7i3OTLziHfCUgwkOGq/JJLMfwhRZ5WjtSP7rczUX6QM4/VU/ygOL6xTFl2oLyrIHBJ1SfKn6wCNZKQp8GMJ1UIOieBcV5MmnIEuzj8CEj9qj1LEjTx1wT5jfaw/53ZKe1PQssUj3sYFCmz3aiZ4SL9W05ST2VZPZ+tIOboFDVvPzAi7H28HFDiIUEvVN2XejCY/X1NoSqP1nHg4ckS+8zOlDaxtjk5xmoqyZ4v0HELMWmUQrqoGBxrHt+REvHrRgDwVmg8xL46yZrjmenxPV2iVjuPKlRuiuPHsN6rBo63+LhOm4d9SlgYE/yJ/r51Ufkg6y00lcoZvSMnGT6UOrc6MXK++QksfRp0gODvkFIeBRwumjA2JdPUYa/eeRWPpXlWB+xiNjaFdBjCToZQEx0q9Mgndgl4FJ74Zz02zoljpHFtv9pI2wkDUIN/uZ+FWqe4XP3HIvdwn0vkPi5tb4gC+pQS1oY7oW627bAzPzX4DCPKVOl0GfPLQFoYofBVSh5Q+gcGa2kEl3k5hMHEUATVfMw7Q0nT0cBnq6nX2xHRJswofOYII/zgTghG2vg+SCbOsyj+8X0JU3whR2MRVA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(396003)(376002)(39860400002)(346002)(451199018)(46966006)(40470700004)(36840700001)(478600001)(47076005)(36860700001)(40480700001)(83380400001)(426003)(86362001)(81166007)(82740400003)(82310400005)(356005)(6666004)(1076003)(36756003)(40460700003)(186003)(26005)(16526019)(336012)(2616005)(4744005)(5660300002)(41300700001)(44832011)(6916009)(8676002)(4326008)(316002)(54906003)(8936002)(70206006)(70586007)(2906002)(36900700001)(16060500005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2023 21:12:00.7790 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c564e2cf-ac09-4e06-d7ed-08db0ed01d28
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00010206.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8711
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
Cc: "Nagulendran, Iswara" <Iswara.Nagulendran@amd.com>,
 Wenjing Liu <wenjing.liu@amd.com>, dri-devel@lists.freedesktop.org,
 Mario Limonciello <mario.limonciello@amd.com>, Jun Lei <Jun.Lei@amd.com>,
 Charlene Liu <Charlene.Liu@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Tony Tascioglu <tony.tascioglu@amd.com>, Alvin Lee <Alvin.Lee2@amd.com>,
 Leo Li <sunpeng.li@amd.com>, "Leung, Martin" <Martin.Leung@amd.com>, "Leo
 \(Hanghong\) Ma" <hanghong.ma@amd.com>,
 Wesley Chalmers <Wesley.Chalmers@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, zhikzhai <zhikai.zhai@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since, hot plugging eDP displays isn't supported, it is sufficient for
us to warn about the lack of a connected display once. So, use ASSERT()
in dce110_edp_wait_for_hpd_ready() instead of DC_LOG_WARNING().

Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
---
 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
index fb3fd5b7c78b..0d4d3d586166 100644
--- a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
+++ b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
@@ -779,10 +779,8 @@ void dce110_edp_wait_for_hpd_ready(
 
 	dal_gpio_destroy_irq(&hpd);
 
-	if (false == edp_hpd_high) {
-		DC_LOG_WARNING(
-				"%s: wait timed out!\n", __func__);
-	}
+	/* ensure that the panel is detected */
+	ASSERT(edp_hpd_high);
 }
 
 void dce110_edp_power_control(
-- 
2.39.1

