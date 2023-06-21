Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38EC7737B1E
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 08:19:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5847C10E07B;
	Wed, 21 Jun 2023 06:19:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2081.outbound.protection.outlook.com [40.107.223.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24AD310E07B
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 06:19:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a5YPZAAoxtVF6Vk/UQa25L/Hq9Pp8U16HX6zxHgcPhkA/TTs6ncN2exI8IGwLxIbyZI2zeuDXZqmdw4Hb0QREIdmpOw324aIu8LfBZ7Vd06RSgZTvx34HGJ8gXcfCmBP3jxJQZHD82hHNGWUHcwdZ5CSCpAJhUc7opUW1kUGs0UjLLPFV8PD54KsG3bHmW/vqaRZzsrE1nXN6Q7vWYEkqyxoExDU+OHjk0t0urj6idDofDshYgArV8QVoaXNI15Y0F8Wi3auAKRYrZQAtB4F5BQ8QurKeu1FguW22b7oBZg6ggTrMhKrifZb3JWJsii5BgZX84aoSffIt4vuiXEQ8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P4PrwyniEukTYvPgE5ESkBr2G5YngTXPLJgj1TExeAM=;
 b=WhRvT1E05gI/XyCpNfR/IKZoKnDu9rSZybIpXOCTeZQI2h8feobNgU3V+IMwaMd7znxNlyDc1NrK1Phm1De7oKKpNiVxagOaxBahJLGd0Agcd7RP9x7Q8292LjLMHWenKf+fd9G/5UvSBGlasr73G/39zDWreTD3TOgojAziyrjdC2WPGjZ+VNxv0MRsbgAmMQ661rTNRyfzVZBN5M5WsurU05ZiMxH1J8qqD93ABOlLTy0it0maEkEqN2OXp58GMSWlr+nOq4BK6cLvVZpM7I1GdCKG/rzvtMT+ismUXsg3MAMhFcUT7TlDV2K+XqKi3Ur1+JeXDcNRHOCPSkI2xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P4PrwyniEukTYvPgE5ESkBr2G5YngTXPLJgj1TExeAM=;
 b=CilMzAGapSzZR1QYW5hlDTISuuscDZanNE+s8rTEI0f9y9oTWZJ+G8BAtK0xGCBE4Aeb5wN98/KttYeNQDoD5wKBdPQvdLiNDz9nAzxx/InBa1/66AJ2JVYioE6IzOREU7ZKE0G8aUccvZiARvBxZd51A1xNo4q1TFYwQUW+fb2lzgw5mdCp8LUUdj1nmxhvN7Pb1yYc5eORlqjYvCl5svuSltjENs1cBchgCZA5M5cGJdHjDPiTtHjfwf7ikQM7b3rCHATy/zbcEU4ZWp2AMGA0PrcC34wuBB+hgNu0rwxgAp7ms6X+VHGxprol2RRwz00FSIf5u5U/FFHaeY6SOg==
Received: from PH0PR07CA0046.namprd07.prod.outlook.com (2603:10b6:510:e::21)
 by BL1PR12MB5804.namprd12.prod.outlook.com (2603:10b6:208:394::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Wed, 21 Jun
 2023 06:19:32 +0000
Received: from SA2PEPF000015C8.namprd03.prod.outlook.com
 (2603:10b6:510:e:cafe::29) by PH0PR07CA0046.outlook.office365.com
 (2603:10b6:510:e::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.21 via Frontend
 Transport; Wed, 21 Jun 2023 06:19:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SA2PEPF000015C8.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6521.19 via Frontend Transport; Wed, 21 Jun 2023 06:19:30 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Tue, 20 Jun 2023
 23:19:21 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Tue, 20 Jun 2023 23:19:21 -0700
Received: from rcampbell-dev.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.986.37 via Frontend
 Transport; Tue, 20 Jun 2023 23:19:21 -0700
From: Ralph Campbell <rcampbell@nvidia.com>
To: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] drm/edid: Add quirk for OSVR HDK 2.0
Date: Tue, 20 Jun 2023 23:19:03 -0700
Message-ID: <20230621061903.3422648-1-rcampbell@nvidia.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C8:EE_|BL1PR12MB5804:EE_
X-MS-Office365-Filtering-Correlation-Id: 3780a8ec-7f01-4b2a-1ff0-08db721f797e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jMsmffO5he3+HW6W/WzlYc1OusKVQJWUuU4qzIbjDYjS4Oqsy+c5jI95HKzYGMTMQwXxrr6xTYgWI8N1Z9+CeQhRTwe81BeyPQhgsKKvNYC3J5oaMHR8SCOR1A4XaEL1GEF5tpxQYrkY6z6DYMG2E0xjAdv2b3mWuJYdI/lKJFEyl3tPsunl81AnQxeF2ifkFAEt3clzix9VVpL0Y5kbpT2H8kfkj9NdoWrvbvLPs3N0lGEjYdBIjIJSRX+QrL6QilUW76sdDMds8ZEFBh65++Pn9PPp94XWlr4LMzcqsuWZlDR3tjc2N11LaPIQlebSoNgHznyj4cvXwKCjRT+VdLyZegx26kqcaH65yibw5wouS5D4imjti/vpXKEBZJm1F8qRULDlcO5cSSNC1Kcu+pRb4ngjlGQa68sFuuG1P23HihvHY+MVn/LwNXX4BhN7mhBra2Yj2MwaCxiY2XMb7W/fnpcxC2HnjT0NbDh/cBA54XusXaKY1yI1VOhAfo4G9C9vXKYjlru/YAOpHVt2XHfs5qbl+Uw8pPCRlkMEZI/s62UnJ2UinI+7rTCTUXXYmCmQyWufP8uYeDFj8L+Hvx9+ojVhajkoAU0UJLI3vGpZ9Pr75kQRH7UPMa/s1RIsjUUvk1AhDxkqS6B3IPCPuuRiC1MirceXqVfuV3fJaQuRgkPxx7vVXFiavAFr7mrWV//mlM0Teycr8r3dNleliW1eeeAJDoPGXRPfUWIFJrYpTsLhhsIOPutzg2vykklq
X-Forefront-Antispam-Report: CIP:216.228.118.233; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge2.nvidia.com; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(376002)(396003)(346002)(136003)(451199021)(46966006)(36840700001)(40470700004)(478600001)(6666004)(4326008)(54906003)(110136005)(7696005)(1076003)(107886003)(186003)(26005)(70586007)(2906002)(82310400005)(8676002)(8936002)(41300700001)(70206006)(316002)(5660300002)(7636003)(82740400003)(356005)(40460700003)(86362001)(36756003)(40480700001)(47076005)(2616005)(426003)(336012)(36860700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 06:19:30.9668 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3780a8ec-7f01-4b2a-1ff0-08db721f797e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.233];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015C8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5804
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
Cc: Ralph Campbell <rcampbell@nvidia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jani Nikula <jani.nikula@intel.com>,
 Maxime Ripard <mripard@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The OSVR virtual reality headset HDK 2.0 uses a different EDID
vendor and device identifier than the HDK 1.1 - 1.4 headsets.
Add the HDK 2.0 vendor and device identifier to the quirks table so
that window managers do not try to display the desktop screen on the
headset display.

Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
Tested-by: Ralph Campbell <rcampbell@nvidia.com>
---
 drivers/gpu/drm/drm_edid.c | 1 +
 1 file changed, 1 insertion(+)

I don't know how many of these VR headsets are still around but I have a
working one and I saw an entry for HDK 1.x so I thought it would be good
to add HDK 2.0.

v2: The vendor ID was byte swapped.
I'm not sure how I missed that in v1.

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 0454da505687..3b8cc1fe05e8 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -230,6 +230,7 @@ static const struct edid_quirk {
 
 	/* OSVR HDK and HDK2 VR Headsets */
 	EDID_QUIRK('S', 'V', 'R', 0x1019, EDID_QUIRK_NON_DESKTOP),
+	EDID_QUIRK('A', 'U', 'O', 0x1111, EDID_QUIRK_NON_DESKTOP),
 };
 
 /*
-- 
2.40.1

