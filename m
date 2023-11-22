Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C9E7F4BE9
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 17:06:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAE6710E679;
	Wed, 22 Nov 2023 16:06:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2047.outbound.protection.outlook.com [40.107.96.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1029210E679;
 Wed, 22 Nov 2023 16:06:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F75zKz2uyLa5jPpB1aeIuWyYIfeWsSqMQIqAcmW0nUCdDpfiUxu75f0thG5ebvOZcpeWuI+AONmJ/4MLyBXp6Vi+TPNfXYgCTzkEstbam3DzfaWrJZ6EguL0Cweqh+DMqxOjbQKtQ8FZ+RuNiumwQc/2sV1SUDy5chFLJ6yR2NkPGxyQtmA4D+7GgO7RAfe+rF5kT2LLQNlNslAvDZ03Ths+fOERuvSZiOYCq8eBZvnLDR0t7Mycxvo4GSBvF69iltvu50/y+MGPbp7huZMu8f4tlGxm7iX17AtUrulNndfKBvqp5GADU1mnxQ/1WW4WLjK14SOv8d4NFbTQQgVGRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ssQ4Yr7Ver3oTpMBl/KrUoFjnDijHLncadph/ptPiV0=;
 b=R5OUM3GDlMcS4O3XRPZNRLL5dd3dAlSi+58/2mjVjuCdkKkPa58m299EIhTlOMPEmXKo+yV4GE0+g3zfTlvjmp2h7oYUKxQ3DZtro3XGX/ov3V3LrbJbCMrpgos9ZB7mgt74gnQJk9dmGnPOrHYbjL02H5AzEfeC2tBFPFcm7E1UnJ4lL2cRruNP0jWIibQegbS6xolRO71QVvnlm+i8F91kYsdhxAgfomnN7d3RCvT0pKdY771dpgTR6ESL+a4DMI8zHRE/LEr+GzJztJ8LGxvJOlLcyGYfKM4RxG2PIyoIue7t/IzVi3vSgkjECV26AQV3SU2f8vx6aIeDMPsf5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ssQ4Yr7Ver3oTpMBl/KrUoFjnDijHLncadph/ptPiV0=;
 b=R+gNuEkmsX2UjLOVK7lCldTik7/WlAkiMvPDi4+UwpRpjMSUM81l8EWTFdr8KjVJEjQGBQ3D9ciBNUzr+7e7WlkJhbdnzScPgHuAAr6B+qH8feGhL4Dhg9ya8FUhF/E8YucsGC5PwECYsYMBkL6xxlgEVaSaXCyq0a4aVYn1WGg=
Received: from DM6PR02CA0131.namprd02.prod.outlook.com (2603:10b6:5:1b4::33)
 by MW6PR12MB9017.namprd12.prod.outlook.com (2603:10b6:303:23b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.28; Wed, 22 Nov
 2023 16:06:07 +0000
Received: from DS1PEPF00017096.namprd05.prod.outlook.com
 (2603:10b6:5:1b4:cafe::4d) by DM6PR02CA0131.outlook.office365.com
 (2603:10b6:5:1b4::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.19 via Frontend
 Transport; Wed, 22 Nov 2023 16:06:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017096.mail.protection.outlook.com (10.167.18.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7025.12 via Frontend Transport; Wed, 22 Nov 2023 16:06:07 +0000
Received: from KfdLnx23.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 22 Nov
 2023 10:06:06 -0600
From: Ramesh Errabolu <Ramesh.Errabolu@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <christian.koenig@amd.com>,
 <sumit.semwal@linaro.org>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] dma-buf: Correct the documentation of name and exp_name
 symbols
Date: Wed, 22 Nov 2023 10:05:56 -0600
Message-ID: <20231122160556.24948-1-Ramesh.Errabolu@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017096:EE_|MW6PR12MB9017:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d719f19-5872-4469-ae89-08dbeb74efa6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lDhYJdv/R0P45oUCt1aSWdGZQHUUqbdA7ao1p/TFSKlEb2ZaDghmS7FXrFC/ML3ccyehRFm8BuuG2IjJsIts7lvLM1+iage75S4b1Iv7XhYb3b+VATbkBTJYu+orZevYQWgYiDr99Bn/21gjx0H6aupAb41DntrXryvuc8ue+CdDOL++qRUPIgU2R0dlbwX53+nF1r4sixgYpvB2EQiJGEilS/VP4iDvYWvd0C2JtsXQsdCVyEFCXnFbdPZKCHTRaEqf97nncZmQnP1ySBD7IvSVTTuuiBYu2/9qw8etAYFgAAHMXHq0JegYH8urcjRKwlOQOMMA+AptnP/xEo+Om/U1AyvE7Ei9A7iA8KBKcAEYc4tJwD19UajHO4SziXwrNPsT6dlHWt6GmO0iXBk918r4ABXa5l1yVEcYZjwy5PhDSWCej8dOu1Mk/iK616hrFRcucIv2xWPuZBSDtrpuSUxJsRSQanFE9Wh1X5+y6sJO/GAuqPguAeYDg3mH+6z7qSIeWa5W9ou/5JL7SHWjyw8BZl/CQxdIsWsVBvDvAbnnYpCbDDwYUyEvS28xHOIiprQO/vqRHWdhXWbFHb+g8z5z1Rg6mHV7YsYSBkIIJ9+w17y1NLp2iUw6MhpRXkqR6AHF0Z68yeqZl/QZ5Z2GMxlsNnXsZfqv4OSHiTNHroWMyRT2UbKM5C4UcitkLam5SH6bYuso8Cv/qBnrE/doiZ3A/9l3Wzq3/uxgw+zpso3TtUxRTloenMwErysbGbOAbBSxJg9D1cz0YFMORfiVE9nXsddDofoTkgO7uQep/Bw=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(39860400002)(346002)(136003)(396003)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(82310400011)(40470700004)(36840700001)(46966006)(40480700001)(7696005)(6666004)(47076005)(82740400003)(478600001)(83380400001)(81166007)(70586007)(110136005)(316002)(70206006)(8676002)(8936002)(4326008)(36860700001)(16526019)(356005)(2616005)(426003)(26005)(336012)(86362001)(40460700003)(5660300002)(1076003)(41300700001)(36756003)(2906002)(36900700001)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 16:06:07.1687 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d719f19-5872-4469-ae89-08dbeb74efa6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017096.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB9017
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
Cc: Ramesh Errabolu <Ramesh.Errabolu@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the documentation of struct dma_buf members name and exp_name
as to how these members are to be used and accessed.

Signed-off-by: Ramesh Errabolu <Ramesh.Errabolu@amd.com>
---
 include/linux/dma-buf.h | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index 3f31baa3293f..8ff4add71f88 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -343,16 +343,19 @@ struct dma_buf {
 	/**
 	 * @exp_name:
 	 *
-	 * Name of the exporter; useful for debugging. See the
-	 * DMA_BUF_SET_NAME IOCTL.
+	 * Name of the exporter; useful for debugging. Must not be NULL
 	 */
 	const char *exp_name;
 
 	/**
 	 * @name:
 	 *
-	 * Userspace-provided name; useful for accounting and debugging,
-	 * protected by dma_resv_lock() on @resv and @name_lock for read access.
+	 * Userspace-provided name. Default value is NULL. If not NULL,
+	 * length cannot be longer than DMA_BUF_NAME_LEN, including NIL
+	 * char. Useful for accounting and debugging. Read/Write accesses
+	 * are protected by @name_lock
+	 *
+	 * See the IOCTLs DMA_BUF_SET_NAME or DMA_BUF_SET_NAME_A/B
 	 */
 	const char *name;
 
-- 
2.34.1

