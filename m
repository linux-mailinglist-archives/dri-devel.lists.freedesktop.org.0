Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5C94B83D3
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 10:17:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D522610EDEE;
	Wed, 16 Feb 2022 09:17:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061.outbound.protection.outlook.com [40.107.237.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 857B710EDE9
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 09:17:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NNK6wMBdhXobbLxTRN7lAtYvdQAWT0UwJ44/BsoWFro8u1qWc2dGd3b8PVffIH4yq+RbmyhjQv1r6de+4hr6Rg74gRERxf+ZX1Lz97FzDsp2idnh2Bgp79Rr1BO5CTuOUr6UDBXw7vybaQWTyJfkPvfz3zXJds4tGa8RPwFPEmhpdGDzNMdolvIDjecroiJK0wmTWDGkv9om99tVPLm0EH91iIlWnJ9OPzlj5M8zi/Ueyq2OhCotDOOtL0kTqDsQ3yYF7lZvjqe5E7k0a5QUgvJWYdMeLhqp/y7eTyxKm/+KdPCtDnZI63ZHhBUhVbu1BmQLx8v2XrUT+46YTbOvsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9fo96akUCFb2WPD/25cIK88sTApkGzfnjKmCQue1I1M=;
 b=EMXDAmGrTihWc9YY5i1i9OZ7nCeF5wVTeCjfW9xPIhxt6kxgOqcCN9zo+PyPTo+1mv/1OUB1WCrT2MOUU/jEZKm0xEsxPFI3qQg9CdUiKqwmo9wtt+NUtaCNoD7zdL0f4Balsw7Mz/4noS1Bk+kfAIGGFkl/MNqjThty9zMCq5pktrTgi5kn4GE991QJcWeHvG2v3Y12IEGKMiZmUz5c6tH0xPlSpR/8DGooxPoyG1mPE2s1zEdLKnD5qfJ9RuvJ2Z0CQ1jgzobbsXpmubaYTiV23Zyh6Tn0gS2Ev7Lev8Og/oZ3N4gCQiIw0fqOg15KwgV/Un6B8Q7VqYegQP1lWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9fo96akUCFb2WPD/25cIK88sTApkGzfnjKmCQue1I1M=;
 b=RtvDZ0/5ojpB7p5KubbfZ3un0ikI2BwWv4ZAd2sxqgXK9+ML7GyhN/V0dGIPxKePbK5jt8qcGimIRYC3wJYX6fc9VLGQXd0TMABtTOogdJMGdz9XnbZqkdD9wgq+evWgxO/RFP1kPdGZ9CzYfccRqK8BrfoZVBPiY1IOEF3h03Iemhc2WWy79SfqtwGp0WESVaWQHq52uCxus/B5oZ42Mnq6XX6eo2riTGoY3Wq/KEvW70ZlnAFkkY+jeB/qwmbFmaor45MllkE6aLy1aMbRiq6gEBh8GRxWegV9oS4ngvwQJIVmWgmBd7ADooqtGSDb7WA6WchwcjEX047ZmsEe1Q==
Received: from DM5PR07CA0147.namprd07.prod.outlook.com (2603:10b6:3:ee::13) by
 MW5PR12MB5598.namprd12.prod.outlook.com (2603:10b6:303:193::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Wed, 16 Feb
 2022 09:17:50 +0000
Received: from DM6NAM11FT039.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:ee:cafe::43) by DM5PR07CA0147.outlook.office365.com
 (2603:10b6:3:ee::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14 via Frontend
 Transport; Wed, 16 Feb 2022 09:17:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.235) by
 DM6NAM11FT039.mail.protection.outlook.com (10.13.172.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4975.11 via Frontend Transport; Wed, 16 Feb 2022 09:17:49 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.18;
 Wed, 16 Feb 2022 09:17:49 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.9; Wed, 16 Feb 2022
 01:17:48 -0800
Received: from moonraker.nvidia.com (10.127.8.11) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.986.9 via Frontend
 Transport; Wed, 16 Feb 2022 01:17:47 -0800
From: Jon Hunter <jonathanh@nvidia.com>
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/tegra: Fix cast to restricted __le32
Date: Wed, 16 Feb 2022 09:17:43 +0000
Message-ID: <20220216091743.21380-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ec5f6f33-afee-4dce-e422-08d9f12d3402
X-MS-TrafficTypeDiagnostic: MW5PR12MB5598:EE_
X-Microsoft-Antispam-PRVS: <MW5PR12MB5598708EB92C3E79D39C87A5D9359@MW5PR12MB5598.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wOpK25Y1HCKzGwjzb4oVtkwWzgNv/sml6iwQfl7jk9YI1ucMPjcGQ4y1ncb64fnK+B1LrpmmMmRcW5ZLOdnvFDAhjkeCSVFLgexLP8M+w9yAkcAwAiTtN9pG0jk0fOD4m8y3qFz/+DPg6Mlzph3j0XrIS8e8ToxX/+Ofho6OefdOkAggz4QL+dtFdf3aEW1Liy4dQOXkqYAAn8tnwx1eKO5Et9JW9JMvP5aNdAbAqKEEMo8JnYd1KAlfKsfZGR57JuK61J9wVt/54G6xUwK4cTCqxm1bDBX1q6rJ/FIK9d3VaHepEfsYlm4UK86xb+glq506iVh0XSO5efsILazCdJUVpP+vNJ1MA9lZY0R2uytA7BNO2SQpjUjLt6YhkIB4gGezdKllm01s4PtoRwSdc8qgcbQMtda3+UYGg9G1ldANbb7VtDbkG663CtpNoZivlZ8xdkx/6xgOYEaLOF6HN9aiovZeWZWxWrUNeHalQ4350SsbsuQmnUgdUloJ3HDEWKlASIbMnBDTcoT1PDu7YI9GrG4ij+N16EIMH+MjTpAiWLjCU2Z2z4NXFM1rRR8PWUxkgq2S9QmwoCn31BBcqRcYFEUO6a56tA7zqwmBWcvpFLRIDDvkL4IthHsbMSuBqeE/NmH0PTBaCjg+PmT3pu+IRlMDi8xX93iFdAT6GF/Q/7xLpT8a+LW+MknN4B6rPsUVI7ooe5SjDc1Pt16gdg==
X-Forefront-Antispam-Report: CIP:12.22.5.235; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(70206006)(70586007)(316002)(83380400001)(47076005)(356005)(110136005)(54906003)(6666004)(508600001)(81166007)(8676002)(4326008)(7696005)(86362001)(82310400004)(36756003)(40460700003)(2906002)(4744005)(5660300002)(8936002)(26005)(186003)(336012)(426003)(36860700001)(107886003)(2616005)(1076003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 09:17:49.6500 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec5f6f33-afee-4dce-e422-08d9f12d3402
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.235];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT039.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5598
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org, Jon
 Hunter <jonathanh@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sparse warns about the following cast in the function
falcon_copy_firmware_image() ...

 drivers/gpu/drm/tegra/falcon.c:66:27: warning: cast to restricted __le32

Fix this by casting the firmware data array to __le32 instead of u32.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/gpu/drm/tegra/falcon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/falcon.c b/drivers/gpu/drm/tegra/falcon.c
index 223ab2ceb7e6..3762d87759d9 100644
--- a/drivers/gpu/drm/tegra/falcon.c
+++ b/drivers/gpu/drm/tegra/falcon.c
@@ -63,7 +63,7 @@ static void falcon_copy_firmware_image(struct falcon *falcon,
 
 	/* copy the whole thing taking into account endianness */
 	for (i = 0; i < firmware->size / sizeof(u32); i++)
-		virt[i] = le32_to_cpu(((u32 *)firmware->data)[i]);
+		virt[i] = le32_to_cpu(((__le32 *)firmware->data)[i]);
 }
 
 static int falcon_parse_firmware_image(struct falcon *falcon)
-- 
2.25.1

