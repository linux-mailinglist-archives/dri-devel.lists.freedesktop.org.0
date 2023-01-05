Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8094765F1B5
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 18:02:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BDE810E772;
	Thu,  5 Jan 2023 17:02:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2053.outbound.protection.outlook.com [40.107.94.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE25C10E768;
 Thu,  5 Jan 2023 17:02:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U1h9m1DTVCY52CO9+hl1Y8GxYT4eajNNic19ubrgvKVF4HTznXPs6I+DkBS5BsgFg4+4mcxQUJXIs0hKbG3Ykc11Uju5/l28auXx7mIC2oRDT+xG0TUi6QxeYGHa03b0PPqa+s8Cs1eLJNjJF7dvdOLA+A6H58bOz2qb0mOw95mnrn9fzoqstNq/pc5nK1wRjr9fxMaBb1RuYn1ucH8iG7Gm3wEPAFDod7cmgX8FXJGEpZP7yeymIqc5/QDb8ksBTp37hitTfO7vb7MZ7KmTZx81paSIvSwepPOJb5vJkyY+lv+mHevGcns4iIo/2CD6ue96UPRdQywU6xG/u7kddQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8VyiVX8uG0OwppPh6fz8Sxv8sfahQNlNKEKUOhT8HpM=;
 b=Dwe+9cQR8ubrrUb9W5BP0LA9656UVqo1oUhKw167KkKZF45JDZIHnxfKXcka2mLkwtz4BTCT7QCS6mYEa1y8PQ/MUJSUQ1Ad0npQX2xoSHeFas5nftq+wfFXtHQjkIxl1M0EIlo3shx7oEULpp9P+1rW5aCUlqs1JhDuINvnJhl9XbhVpJns0E9fDDQ5kxeWgTI5yeqt6OTz4XxROwgyMPaaH3vYi65Rq+BpC+i+quv307R48aV8nct930Bkw3ZiTXibFs82GM6qkNx9QAS/phuEHaQ6TjATxO5fjKC6OvXusYhV758HtbCtITOCGtrXrJU4e+nFyc1/nF2IW0b++w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8VyiVX8uG0OwppPh6fz8Sxv8sfahQNlNKEKUOhT8HpM=;
 b=dsIn1m+IVDw9HbkXVcjuJe0aVcesJVVnHmkCkfEw1dwfQM7crumEeXRgj5q0Veo4RqezrJZYKXlmhLlNpwlJPs5fyuLp9Q7s9c6gtu8W7jIYHfUXFn5w1QvNVtu591r7qHxpbGsVsYB7bwXhZ4N0cjXDCu5/d6gcEVbP7OmmCJs=
Received: from BN8PR03CA0032.namprd03.prod.outlook.com (2603:10b6:408:94::45)
 by SA1PR12MB8143.namprd12.prod.outlook.com (2603:10b6:806:333::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 17:02:04 +0000
Received: from BN8NAM11FT104.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:94:cafe::ae) by BN8PR03CA0032.outlook.office365.com
 (2603:10b6:408:94::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.15 via Frontend
 Transport; Thu, 5 Jan 2023 17:02:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT104.mail.protection.outlook.com (10.13.177.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5966.17 via Frontend Transport; Thu, 5 Jan 2023 17:02:04 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 5 Jan
 2023 11:02:02 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 06/45] drm/amd: Use `amdgpu_ucode_request` helper for SDMA
Date: Thu, 5 Jan 2023 11:00:52 -0600
Message-ID: <20230105170138.717-7-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT104:EE_|SA1PR12MB8143:EE_
X-MS-Office365-Filtering-Correlation-Id: f6802bfe-a618-4580-0ab5-08daef3e91e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PCOVkcp1krYCgyvU6Ql8ODGEwN6N3c1YrJ2Mqn8J3cgPjO8fXdFB/GYsnHFR8J3MGPylEgPjbib0k0QyW0LmB0Qy1yoZpTMXNbmvQxonLTKnDuz9QR7QtV5xbLzagPxpmMvEtmU5FmoVpW+6wUsxbUUyoq1+NH6Wk+4wPK9u+fgXTgMZ7gtAj76KqOsum29M04onio4f4fxzrGs6IdS4CPu2LEzos9OPnUyrAEHHlxi4RKo5rYYQs0i0pGwnPXNY3aY3SX0k2qKsir/iw0fQEHYEgdDO0kGLSJ1xjiU3GwnEsS1faBWQ47ggid6m6uIpVMeDsUgTCA2jD6zD6o/2l+joOpEaj1N3BIqtSjfNFD/HQ06cG4LTsuct+/8ar1duP8gLqvhkPR6/kvEovMbJj5/BqZIlhgFwqWnXMpxDFQTbtQy9y+gzRkJuyNMgKw6qoNCNTL+ZSLaAQ/MXiOv68l6wb1HS+bI2gt8PGfFkcy5PBEzSbzWLJiiM16J2MHhJ9H0mWAhUW1lJgLgUt+o4TLvIfoqpZVQ+rQEehbT7XjnJ7YwgEXAifDYVOOfe9VHHEEXRC2OTi8FND/H9ip/Gt6K+Dx0sGfFIJq0v8rQiHwYReV4gmfDlAIR6+p1IASWR3f4AdLQGwBpGtg2vgrz7OtuKBhBnKe7pQU10wEuuOHfxO1uHzc14KvwwfMjsgTvPnVzHUuBmsGOGZSAg6Fxxc8O+9e3mmlerNOsWPOsDadsUS7web91YY6x3uurnU8YtvvXgE3PZOZfLD+6y4ByIrQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(376002)(39860400002)(346002)(136003)(451199015)(36840700001)(46966006)(40470700004)(5660300002)(2906002)(44832011)(41300700001)(478600001)(4326008)(8676002)(8936002)(70206006)(110136005)(70586007)(316002)(54906003)(1076003)(2616005)(336012)(26005)(16526019)(7696005)(6666004)(83380400001)(82310400005)(186003)(40480700001)(47076005)(426003)(81166007)(356005)(82740400003)(86362001)(40460700003)(36756003)(36860700001)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 17:02:04.0660 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6802bfe-a618-4580-0ab5-08daef3e91e6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT104.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8143
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
 Carlos Soriano Sanchez <csoriano@redhat.com>, christian.koenig@amd.com,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The `amdgpu_ucode_request` helper will ensure that the return code for
missing firmware is -ENODEV so that early_init can fail.

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v5->v6:
 * Adjust for amdgpu_ucode_release argument change
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
index ea5278f094c0..a6a491569022 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
@@ -154,16 +154,11 @@ int amdgpu_sdma_process_ecc_irq(struct amdgpu_device *adev,
 
 static int amdgpu_sdma_init_inst_ctx(struct amdgpu_sdma_instance *sdma_inst)
 {
-	int err = 0;
 	uint16_t version_major;
 	const struct common_firmware_header *header = NULL;
 	const struct sdma_firmware_header_v1_0 *hdr;
 	const struct sdma_firmware_header_v2_0 *hdr_v2;
 
-	err = amdgpu_ucode_validate(sdma_inst->fw);
-	if (err)
-		return err;
-
 	header = (const struct common_firmware_header *)
 		sdma_inst->fw->data;
 	version_major = le16_to_cpu(header->header_version_major);
@@ -195,7 +190,7 @@ void amdgpu_sdma_destroy_inst_ctx(struct amdgpu_device *adev,
 	int i;
 
 	for (i = 0; i < adev->sdma.num_instances; i++) {
-		release_firmware(adev->sdma.instance[i].fw);
+		amdgpu_ucode_release(&adev->sdma.instance[i].fw);
 		if (duplicate)
 			break;
 	}
@@ -214,7 +209,7 @@ int amdgpu_sdma_init_microcode(struct amdgpu_device *adev,
 	const struct sdma_firmware_header_v2_0 *sdma_hdr;
 	uint16_t version_major;
 
-	err = request_firmware(&adev->sdma.instance[instance].fw, fw_name, adev->dev);
+	err = amdgpu_ucode_request(adev, &adev->sdma.instance[instance].fw, fw_name);
 	if (err)
 		goto out;
 
-- 
2.34.1

