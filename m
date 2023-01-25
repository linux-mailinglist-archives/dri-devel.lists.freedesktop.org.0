Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E09D867AF35
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 11:03:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BA8710E0E4;
	Wed, 25 Jan 2023 10:03:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2044.outbound.protection.outlook.com [40.107.212.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 619EA10E0E4;
 Wed, 25 Jan 2023 10:03:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LYl/KS6+m5703MrrbFC5wir15w0DRztMfVE9fYlCVL90TPzbaK7Uq+5Se7V5UKH8egGCaV6L52yfxqSIQsDFVv5YQSUX72lMooL2k1gSyNagJ2iLrMgw+Z/E9f2fqf8DID32OJyaOfZmvxGN5x8wyxHZt1T30TsbwLRCQIapduryUhVzL+HUgoC0HFs1n5jDUqSF2L9j8wY/APuOEuCZ9My6ifqZWbueHrlH/EVrU+i3PzjDQHx+mOuzZFjdzxzpaQHit7Jc0t9g8ef6685OXTQ9I2WzRRsSPJiCeFRkPcLqWHEZ6+gbsJ/WDGIFXDW4/Z2DQ8Erdy4RsyaTRM56Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gu3zOrUbTyTENllp0xG6yn2zIxiLvfxmInpK+gEl0ak=;
 b=VmEuB5GY4DrbW9pQBJGzi85S0jpw0aDcJB49CKxNSo8f1IrxYzKgM6POGGd/a3K5p40zyBf6IrRG+uTjM9MlBd3y6oj3RDUSsel7IpWkxzc5K9CuWGBfP9N1XdDJTLhMJGjs24/Ss3SA63HWY6hx/5Ms72NJoomY5OVXsUjtdNxF9pidHFi9bxgkPZ4pLFvZlumiPHrbyIN3JSBIg82h3Gk5uXsnpzJT6WtJ4sPco+3XhKmC4qNC6apk+uUs0fFkTajHFAlnR+3SAxCZTMXiOIWwejIVoVpX3gjq0e1/EB7rlOvB5ORysv+mZh9rD2S5HKIJNb41qTM6ZrSk8/mv9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gu3zOrUbTyTENllp0xG6yn2zIxiLvfxmInpK+gEl0ak=;
 b=3t0SHrp+sccRSbcF+VfzWILkmcZ9I825BLW4SwhybFWEnll7z0clRfjPdLf3I1RnZzPN2ktwy9jakKAJLwp39XYVTg1xGb759faGgtnH0CYcxOX8gHjlZGYsgrhenwTPfUXVaCOOgH6+07S6rtvenlm1Pneb/SoQInqBWfl6Q+Y=
Received: from MW2PR16CA0062.namprd16.prod.outlook.com (2603:10b6:907:1::39)
 by PH8PR12MB7025.namprd12.prod.outlook.com (2603:10b6:510:1bc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.17; Wed, 25 Jan
 2023 10:03:44 +0000
Received: from CO1NAM11FT040.eop-nam11.prod.protection.outlook.com
 (2603:10b6:907:1:cafe::8d) by MW2PR16CA0062.outlook.office365.com
 (2603:10b6:907:1::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21 via Frontend
 Transport; Wed, 25 Jan 2023 10:03:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT040.mail.protection.outlook.com (10.13.174.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.17 via Frontend Transport; Wed, 25 Jan 2023 10:03:43 +0000
Received: from amar-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Wed, 25 Jan 2023 04:03:38 -0600
From: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v4 1/4] drm/gem: Remove BUG_ON in drm_gem_private_object_init
Date: Wed, 25 Jan 2023 15:33:12 +0530
Message-ID: <20230125100315.6214-1-Amaranath.Somalapuram@amd.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT040:EE_|PH8PR12MB7025:EE_
X-MS-Office365-Filtering-Correlation-Id: f6a11538-8f53-4b01-a484-08dafebb70ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 45FW8xCYGjam0UQ+cH2duDzsn2LAw54k8j0n0jSz6Ay/VrvHioKfhB0jlwSkehkdKcdFNiCPK9SPHUW5KIAwcstwxIs+NZJK/fUPqoR1kNRgt+oicWRnqoufiFblFLFuj2wPdi8dGHQEy+qZpLx9QDhKT04g0ODKLnBRIA51GM8pTZOiWGy0Aj3Eu1UBM0jES7t5aMz76CKrU06xsMKebSbe5kJqhIkILSYibUc8pZoqesiprLJhUQo0nEJjnO3CU10Ja/nbbMDceJ7ryLNs4fEafInyblfeejtCrPaBoyYHH14Fnes+OzntJ4N6ZeUMuZJuG/eSTY07QIzyx91y+U09oHWB7M681C5VHy+iCzfviOD6KX+nYktgX0sIZJVv+loeyup1NXjnmLxxp/zswzD4pvw6rEftMiE5FFZZ0iC5Go4mqoAl6ClUiuTtSu8xqNpcZXUmGPDS25KD75/ptjiX2x4jwb11vcF3bf8C0DQnORMfi1X4u6C9Xle7RwoSGc/GWQbHlWF39vWK59RHdESgZoMpb/3QcU8F1LKham6eScYWCcDFN82wbJtOHpGkYdO/7WmO2tbm0zSqdN6te+kvr/lHtN8mLBsW5yvwiN/hYBcBpYX5R5gRFmsnq4pxkTdsAQb2Et4nFGGKQrgNyL6aRMG0kBcx+0gygrpPwMFutyfteILma5rx+gwQ2+xQ9cV2IE145ZphZzXRGq05rjfvjl5sxNDVp3balBjJ3uI=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(346002)(376002)(136003)(39860400002)(451199018)(46966006)(36840700001)(40470700004)(5660300002)(8936002)(2906002)(70206006)(70586007)(4326008)(450100002)(8676002)(41300700001)(478600001)(1076003)(7696005)(6666004)(186003)(16526019)(26005)(2616005)(336012)(426003)(83380400001)(82310400005)(47076005)(82740400003)(316002)(54906003)(4744005)(110136005)(81166007)(356005)(86362001)(36756003)(40480700001)(40460700003)(36860700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 10:03:43.1745 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6a11538-8f53-4b01-a484-08dafebb70ed
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT040.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7025
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
Cc: shashank.sharma@amd.com, arunpravin.paneerselvam@amd.com,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>, arvind.yadav@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ttm_resource can allocate size in bytes to support less than page size

Signed-off-by: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
---
 drivers/gpu/drm/drm_gem.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 59a0bb5ebd85..ee8b5c2b6c60 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -152,8 +152,6 @@ EXPORT_SYMBOL(drm_gem_object_init);
 void drm_gem_private_object_init(struct drm_device *dev,
 				 struct drm_gem_object *obj, size_t size)
 {
-	BUG_ON((size & (PAGE_SIZE - 1)) != 0);
-
 	obj->dev = dev;
 	obj->filp = NULL;
 
-- 
2.32.0

