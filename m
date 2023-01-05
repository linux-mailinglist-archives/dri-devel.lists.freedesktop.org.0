Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 030A765F210
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 18:03:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 479F910E7B6;
	Thu,  5 Jan 2023 17:03:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2041.outbound.protection.outlook.com [40.107.212.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E30310E7AF;
 Thu,  5 Jan 2023 17:02:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dednwl63yQGQYbOHEJEz4mpupnKhgMYMYtmLZgPFR8aruOk9wnJ76P5EZiOUT7BLtXpoer/ccFnhHHV4g5nmvRl/c4oFqtYw1ag+sYvyjNPq2drQDSvRc4Pqxk1UX+rgO/4QRvUSM/9S2NfsLDEjmj26q5F2SgME+7+JxNFFAoPGPms/vxa09mfGLJ1Grnx4Ih5uYPBr1F71T2HqvSeMEU44+dxTChT7KQeWrKx4XBevwtmrF9zJdFgsqJoex3zWviqb7yxpUuXNQ0bz97DwViF+TezajJVHOEYhpcCUPgXPw65xBDf5WwSn7YPS/2hdkvSyu++0x6h5xSxMqFnV1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6kQ/L0+xBbJJ8mqE/txSRX3GQhAZ+AXJ0q037RNhi7Y=;
 b=jKJ/uXYTIPodhlaMDqs+7xTn+vqQ9Xi2GY2lIOP8o7B5zRI+BJ/ctV5U/TwuPltVNgq+Ib/eYGGTD6zGs0DUfaU8VvvCK2ANQAyMpgSf6BbGGbwtPOUTYYnw9ujhY86asXd0C0Why4cqjbl4ULPzpHZEQN0rpLHh89OHlFdBkTOtbN0JEvTxM9CH0DC8u6BHHmWiIBtBshb3ARwc3u817ODgv9+xMUiNyvODO87c2CMxJy5myEnBm6AkkJh8a52dIj9YNRNCbjrhPWAkTqHG/qa1GeUVB+svySuWQA/Pg1GSD7aIX8e2hJIQgSVIKd2bBUltYOERWs2NbN/Xf58gZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6kQ/L0+xBbJJ8mqE/txSRX3GQhAZ+AXJ0q037RNhi7Y=;
 b=JxZ6UG6DDJJowoUueSE0v6AP3DHS74oT7yt8sXpRFVV2sUGt0nOj44X4IytfW5yMi5xNn7hZBWhLW8ODTTKd76YoNadMxz0pZhnmhTqM16QLfKz8e1JNBduoQbiJuoVzZXDFwguqOZneHJzwdd3+FeXKxVeW2er7ngyG4/RnfTE=
Received: from BN9PR03CA0171.namprd03.prod.outlook.com (2603:10b6:408:f4::26)
 by CY8PR12MB7098.namprd12.prod.outlook.com (2603:10b6:930:62::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 17:02:56 +0000
Received: from BN8NAM11FT014.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f4:cafe::ab) by BN9PR03CA0171.outlook.office365.com
 (2603:10b6:408:f4::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Thu, 5 Jan 2023 17:02:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT014.mail.protection.outlook.com (10.13.177.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.17 via Frontend Transport; Thu, 5 Jan 2023 17:02:53 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 5 Jan
 2023 11:02:52 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 43/45] drm/amd: Use `amdgpu_ucode_release` helper for
 powerplay
Date: Thu, 5 Jan 2023 11:01:29 -0600
Message-ID: <20230105170138.717-44-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230105170138.717-1-mario.limonciello@amd.com>
References: <20230105170138.717-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT014:EE_|CY8PR12MB7098:EE_
X-MS-Office365-Filtering-Correlation-Id: 79a96b7f-c672-4cc9-1e39-08daef3eaf7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yGtEuJsUjSBHIb7LN8I8926KveHJarkeSAnHqTuDlSatsfMGKLxKKD6nG6c5gWoV8aqh20mRB+G9Ve7XKKuOMvnj08KMcpQm7Vhq3Y5huxpy+h2kdAgt9VTPmtnRJi3v+Ty6fZ1Qlhkvzxv1Dp4TUWZwTvRAAK5NBos27Xf3lTg7JoTVAR13Fh6JliIiJlsSjfAnYBZLp3N1g/UYGspti2tO8xkCULmEWYpo8N+xe9GsumBjBi4jkzf66A64793ySZGcyNVqAp6LdUFOofqo+/RB74ki/+15LfEiFvNPWH9Rnjx2Rqsf3IAmeB6ic7lQZPrBkECodnzX1hUCbaqNnEbWONfBQGeJWZ1iH1gL72jACF0m1e7u96UCOkU5XV0xO2F/a4ks2i31Wy3LmUBKg2+Ti2vjZy6k4qNBujki8ZRZhdPboCowciyunPkTu25K5Ce8yAyu5/ehXcjVjMdmtAMcj84xxaD25DzJ23hBg8hRTqh63U4sLrqvzkb6jxjjjyNnQWU3Gi+Eny6jNmjfRWXGT1wqyMXoCm5dRXCjgYiXm5FUKtBz+K1fORVeQtJNFuAk5pROqT3sLPjP5kbGW5mbKacuGrILWnnvFn0NbWZWe0df5SROKsw0La+2Iyl67CTDE5fb6GwlL07MLwQ0UGRYe4vLNncPqX8r/QFkMRDFo3Z/aQl4tfbajXy3Q88d791GiSzFodxw4ETrJkeBkkEV93BiPBFfW0cMWbBUxzSfXSHfrIyTA7dd2h4yunJKzl2yUqEabvHPplkCMLjjOQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(136003)(346002)(39860400002)(451199015)(40470700004)(46966006)(36840700001)(4744005)(2906002)(5660300002)(8936002)(44832011)(8676002)(41300700001)(4326008)(54906003)(70586007)(70206006)(110136005)(316002)(478600001)(82310400005)(26005)(186003)(16526019)(7696005)(336012)(40480700001)(6666004)(83380400001)(426003)(47076005)(2616005)(81166007)(356005)(82740400003)(1076003)(86362001)(40460700003)(36860700001)(36756003)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 17:02:53.7101 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79a96b7f-c672-4cc9-1e39-08daef3eaf7d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT014.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7098
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>, Lijo
 Lazar <lijo.lazar@amd.com>, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Carlos Soriano Sanchez <csoriano@redhat.com>, Evan Quan <evan.quan@amd.com>,
 christian.koenig@amd.com, Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The `amdgpu_ucode_release` helper is replacing all calls to
release_firmware.

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v5->v6:
 * Adjust for amdgpu_ucode_release argument change
---
 drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c b/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
index 8f2cc6310340..11b7b4cffaae 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
@@ -111,8 +111,7 @@ static int pp_sw_fini(void *handle)
 
 	hwmgr_sw_fini(hwmgr);
 
-	release_firmware(adev->pm.fw);
-	adev->pm.fw = NULL;
+	amdgpu_ucode_release(&adev->pm.fw);
 
 	return 0;
 }
-- 
2.34.1

