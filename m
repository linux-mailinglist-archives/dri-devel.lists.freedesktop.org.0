Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B147CCF06
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 23:15:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8556010E345;
	Tue, 17 Oct 2023 21:14:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2076.outbound.protection.outlook.com [40.107.237.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF11E10E345;
 Tue, 17 Oct 2023 21:14:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=npSQy2tpNGcp86kwlW3PhitNcl2wVrROHyv0jahdtkc4rWkx/Ypp+kecXUlyeIQuEbimSIJYzAIPPCW2+pruKXWhebNMd1T7jsWikymMUw2P81bIcWiAdCFHWuZQFbIkej9pg2U/KiDxF+av0ROdDChdnJz9kk1jRuWwXtY6kmlMlsNHsfN+4adrRFdmfyE8zT6E5whnDELiEIBaTDqJJi0N6eL47SReyVBafW5fX1ZsIogN2cYqINDttUKw17/9hcOUem1R4pikUEH8QVUKxv89+iMtSug71GrF4loUzb3oe/eJ4p716fe9ElB/pTgRI3xe7RzTeJIPFZA6zEIhmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aq1H8WCJuAL37SctBUPuPK3Kqv6ruPc+2YmbD5MHcdI=;
 b=UfK3A17K5nh6FrL3Fm0S5mWMgwMtgVgF52uMEDv2PHy1qYFF8+zsokQC6Yvw1Ys1NjQseNyD2eTcrgb2vHmTTr3S+LJBYs1sUOESWMZJZr8h10e5iZ/S58SFfSYUgNwk/AD/DhRzRAYn7BFtQyQnwFe7HTiGuRa5VhrACfNW7tEv3ynVTxMuvzGWQJXXOt03wwTHVfOaBFnFA7ub8gJyt4tIUuF23I+phB0v9jeUiRM0dlgIj8IlA+EP9lFvoP2svdmoIpqLxZAGwDLvqKPQ/j/vMn2CghiUEjX1S2uI1BL8SD6G86i0VeSjKViHwZe7IWMZIE89tx1GXREF/EzWzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Aq1H8WCJuAL37SctBUPuPK3Kqv6ruPc+2YmbD5MHcdI=;
 b=GLdmFlOXlGkB53/P5feuDffiSzLX5yrBCtSRggWW7w+0bPhpMuMLPvgdgkhGmtYNpK/n4UXmRSiQySiAJ3ymws4EeiUE+C451CSnlqG0y4H1XA09W+DSO7r2JAVTDB7PTylgsUkVF5zp8TKQG1ngjOwo0/HySOz+7TOxlrzqqME=
Received: from BL0PR02CA0030.namprd02.prod.outlook.com (2603:10b6:207:3c::43)
 by BY5PR12MB4869.namprd12.prod.outlook.com (2603:10b6:a03:1d9::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Tue, 17 Oct
 2023 21:14:29 +0000
Received: from MN1PEPF0000ECD9.namprd02.prod.outlook.com
 (2603:10b6:207:3c:cafe::4a) by BL0PR02CA0030.outlook.office365.com
 (2603:10b6:207:3c::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35 via Frontend
 Transport; Tue, 17 Oct 2023 21:14:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECD9.mail.protection.outlook.com (10.167.242.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.22 via Frontend Transport; Tue, 17 Oct 2023 21:14:28 +0000
Received: from Harpoon.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 17 Oct
 2023 16:14:26 -0500
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 11/11] drm/amdkfd: Bump KFD ioctl version
Date: Tue, 17 Oct 2023 17:13:37 -0400
Message-ID: <20231017211337.1593869-12-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231017211337.1593869-1-Felix.Kuehling@amd.com>
References: <20231017211337.1593869-1-Felix.Kuehling@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD9:EE_|BY5PR12MB4869:EE_
X-MS-Office365-Filtering-Correlation-Id: 7785e31e-a189-40a4-e4ae-08dbcf560c5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e6q2sVTLuiqac5uFrPR2NdYAQZRKNbAKOQHFoW+ClSwJllEt4m93WTjJbFX1tekVJ5NoPwp0ltn0uZy69hJBpWHxOvSIf2vGYkPkTHDVhBs26uIffSbFGqavTscMV8k7guGuG2T1cvUP9rVp+wX1+slCNtqA4173Rmegl9MSXUj/smNT183I24sOqyZyPOg2dMZeeC6hH4LhC2h2Rfxvyinr8HosFiYHqiMTjx6fkOVrakSPzNW3WkoYJ4mljVJUKHn/bbm7EtarQB0xIor4P7cezEsGDp4IF3ZGlehmtai4Mz1jXmNmpFJwgkMz1wNv2+D4iw8Y9XnVfe2q5vtxYEH+yHW4eftmNk9bfAAwKcXrcX2xw/T+5Eih8+Hujf63AlTuo1TONq0Gr6T01BoYGC45E4y/tMcKs7cSezp6ySkn7r9eX4BDvCRmyO3oE4GLh+V1tMUA+BX45CR6KFLyjjXQDRdEuI33o6ywDc5EIkTZ0nfm3o/GtXroCmifQsxwu23c0AFSFzORTxnj07Bh/S32jbvxHY6OXoz48O3DeSfvBLc6hK5/5WQ5rPDGo4OMNi/vjAzU8RPgd2wINQZ1+Obf0jvboHLmUCesfQMeMI1Fjg5zlzKbYxIbFnvAYUFA2mMfJR1d644YM92SnWsx9F3nzRHenuPpbVAeVXdcJ1bGv0aAr+kGyJnXTNpId1puDNSvJ2xmaKWgp+N4X3TuqdcBL+QuUjAPp+7OpZIsP5BG7pwzsunZPxd9yAZfWa55x68mJiwPVRg6JV1+FGT9jw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(396003)(346002)(136003)(376002)(230922051799003)(451199024)(1800799009)(64100799003)(82310400011)(186009)(46966006)(36840700001)(40470700004)(86362001)(5660300002)(36860700001)(41300700001)(7696005)(8676002)(4326008)(83380400001)(8936002)(450100002)(4744005)(36756003)(2906002)(47076005)(110136005)(54906003)(70586007)(70206006)(426003)(316002)(336012)(356005)(1076003)(81166007)(40460700003)(2616005)(40480700001)(82740400003)(26005)(16526019)(478600001)(6666004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 21:14:28.4074 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7785e31e-a189-40a4-e4ae-08dbcf560c5b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4869
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
Cc: Xiaogang.Chen@amd.com, Ramesh.Errabolu@amd.com, Christian.Koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is not strictly a change in the IOCTL API. This version bump is meant
to indicate to user mode the presence of a number of changes and fixes
that enable the management of VA mappings in compute VMs using the GEM_VA
ioctl for DMABufs exported from KFD.

Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 include/uapi/linux/kfd_ioctl.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/kfd_ioctl.h b/include/uapi/linux/kfd_ioctl.h
index f0ed68974c54..9ce46edc62a5 100644
--- a/include/uapi/linux/kfd_ioctl.h
+++ b/include/uapi/linux/kfd_ioctl.h
@@ -40,9 +40,10 @@
  * - 1.12 - Add DMA buf export ioctl
  * - 1.13 - Add debugger API
  * - 1.14 - Update kfd_event_data
+ * - 1.15 - Enable managing mappings in compute VMs with GEM_VA ioctl
  */
 #define KFD_IOCTL_MAJOR_VERSION 1
-#define KFD_IOCTL_MINOR_VERSION 14
+#define KFD_IOCTL_MINOR_VERSION 15
 
 struct kfd_ioctl_get_version_args {
 	__u32 major_version;	/* from KFD */
-- 
2.34.1

