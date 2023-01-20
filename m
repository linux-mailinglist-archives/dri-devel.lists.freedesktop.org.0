Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FCE675B92
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 18:32:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87B1710E388;
	Fri, 20 Jan 2023 17:31:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2061.outbound.protection.outlook.com [40.107.100.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B70C610E385;
 Fri, 20 Jan 2023 17:31:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VnjE3zo9LyA+hl0fDjQerf0OTwPydaohXjmHzSQseFgyz8XpIrvFL0BU57+I4j3+RmeZtRZcygKo//uXQ/4zFSh/YzrchWzCrTV8zFP2iPG+EOR8s/LFELyapstDoXgeO+oQEW9gTVJ8gH5Iv7znGFVmtyF5S+r2MKtyx7dgCF1RE/aCIwiyqDXRhXVG0qHIWys+Hwr81zSpz+J0q/Z8BYE5++7VgO7TffwgxD9voON0aEBeWeDWk8XLNrtlCrtdlV6TVlAvQc52YHpEclsO7SVHHED7P3nMmMpAXgKAc1ZDWpGPVPe5DjxABIcfFYzjDLt9VXnMoaJI0Gzuz1w7vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1UaUlVHi9t0u9oFk/h5G2dJi5oO6zN5KYpcCNzQnFns=;
 b=BCxBKoERGhxKxiGQTvCyfsDvxpWdSQ+w08Pyupx9QbgPZ7rjSiiXY4MHJr0R3o7dWeRUq8XXu3WnCOV4vHUv45nsXBPQVZsXtjQ9IQM9l3bLRLm1qVyGgsm+Xlvzg/ZwdRzvC/pAFLuFdbUsNQGdcav0+u7I+fON3FGeT4F1UTkZqqD4ZdijvKIqDtOZC0DPSeOVgyOMYMoMP+7mJAZ+uwmnMCs+abRi/Ryu5R7l0D/+NSILup7xQPE1MxQky6FFP4w0WHLzE1tgDbz1QZJYk60ugCd2ki6ultVR3Jls34RDSILKSPcAOOvBjDnQ3HsdDCU7PFeD5GvaBGF4X3QiKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1UaUlVHi9t0u9oFk/h5G2dJi5oO6zN5KYpcCNzQnFns=;
 b=r4dRhdTAymOD5wYjNNKY3PVonzSA/B939lsj62MoALZQBEwOKrMEMIw4KXzplaUyWA72iphZQkjhvszlBdLlVuwEhkC5Qm9LxoQUGAX1i9E+HsaxSknY2kP9oGb0jhWXrQhfr8rPA0+Srg/Yw/b2qcKh6atL/qTPMKOCg4eQTVg=
Received: from BN9PR03CA0168.namprd03.prod.outlook.com (2603:10b6:408:f4::23)
 by DM4PR12MB7741.namprd12.prod.outlook.com (2603:10b6:8:103::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Fri, 20 Jan
 2023 17:31:46 +0000
Received: from BN8NAM11FT074.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f4:cafe::1b) by BN9PR03CA0168.outlook.office365.com
 (2603:10b6:408:f4::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.27 via Frontend
 Transport; Fri, 20 Jan 2023 17:31:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT074.mail.protection.outlook.com (10.13.176.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6023.16 via Frontend Transport; Fri, 20 Jan 2023 17:31:45 +0000
Received: from hamza-pc.localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 20 Jan
 2023 11:31:43 -0600
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/display: use a more appropriate return value in
 dp_retrieve_lttpr_cap()
Date: Fri, 20 Jan 2023 12:32:23 -0500
Message-ID: <20230120173226.98569-1-hamza.mahfooz@amd.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT074:EE_|DM4PR12MB7741:EE_
X-MS-Office365-Filtering-Correlation-Id: 77d5ffcd-5b88-4624-165f-08dafb0c3405
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Nr1dzFOGMJQRyzkC/kMAcDjeh0cldPF0X+AE472sPcy5Nx4w6tKniXa3dC3S42KSttRsGEjz4ffgow33vA2wTNn9oisCkRuPcSTtzQoCMqgJDRxT+1Uu9iFw5qkGC9YA2MAyd0ORKcqivm6tCTSdNALG7njDE7jTTZD6i4wQdSxIuI8KH7lNxcp90UClqDkBZ/BrkMIdg5jgBhY4Vn5HaHhMQNYBCxq1RxD32TBEJSnHAcgaxzVfa6pN5CokF5dOdShIBNwplAAyv/fcr6wDhMrOcbxCkDIrjC4+MUJy0PAm7qxwjCq569d6fhgHcJgrLAXYtP7bZ+jYBhOQx15D5LdsxAEujKzI0betULrupyh6BYJktTl/3yroVhVK88EluYiUmJafEOi6+aImNPdSOgC2QgG6M7t2k6xBdnbZG2P8giUiA1rJKGJ2ENJLyQl+4g6PAGIfnTeUSO8EMnDC7cytpTaHi0GPH4FzkaK8LoPfofmvhwDgYCBwfdqM7qqZlLkYsSV2WfqokDjzEdW8/hA+hS6z643GNIfowDQ7MqcAKvZd4FF+VDvA6uT2R4Y6ZRdD/PcE7TA4qhdyvRJxA5HKZ2ekSjnmk49ImVmJ2O+NPes/tEn0GZcmghbkjxWf6KM6Id+EuLWWv9aiiWnpzj8fqmKXPTOiDlhH8llYEKa57Wy/ENo0DOsvg/XTMBtHnQDhQOG9mek+XexejRk9p2ILHV0fDNPsr9B2QTBNOeBllPb5iGtR80IxXyzJpOghiZnH8uP/tZOs5knwYGEPeQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(136003)(396003)(346002)(376002)(451199015)(46966006)(36840700001)(40470700004)(83380400001)(36860700001)(82740400003)(81166007)(70586007)(6916009)(5660300002)(44832011)(356005)(4326008)(8936002)(2906002)(70206006)(1076003)(82310400005)(86362001)(426003)(478600001)(40480700001)(336012)(16526019)(186003)(26005)(2616005)(41300700001)(54906003)(40460700003)(8676002)(316002)(6666004)(47076005)(36756003)(16060500005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 17:31:45.6805 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77d5ffcd-5b88-4624-165f-08dafb0c3405
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT074.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7741
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
Cc: Arnd Bergmann <arnd@arndb.de>, Leo Li <sunpeng.li@amd.com>,
 Wenjing Liu <wenjing.liu@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Not all ASICs support LTTPR, however if they don't it doesn't mean that
we have encountered unexpected behaviour. So, use DC_NOT_SUPPORTED
instead of DC_ERROR_UNEXPECTED.

Reviewed-by: Wenjing Liu <wenjing.liu@amd.com>
Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
---
 drivers/gpu/drm/amd/display/dc/link/link_dp_capability.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/link/link_dp_capability.c b/drivers/gpu/drm/amd/display/dc/link/link_dp_capability.c
index e72ad1b8330f..21fd9275ae4c 100644
--- a/drivers/gpu/drm/amd/display/dc/link/link_dp_capability.c
+++ b/drivers/gpu/drm/amd/display/dc/link/link_dp_capability.c
@@ -1462,7 +1462,7 @@ enum dc_status dp_retrieve_lttpr_cap(struct dc_link *link)
 	bool vbios_lttpr_interop = link->dc->caps.vbios_lttpr_aware;
 
 	if (!vbios_lttpr_interop || !link->dc->caps.extended_aux_timeout_support)
-		return DC_ERROR_UNEXPECTED;
+		return DC_NOT_SUPPORTED;
 
 	/* By reading LTTPR capability, RX assumes that we will enable
 	 * LTTPR extended aux timeout if LTTPR is present.
-- 
2.39.0

