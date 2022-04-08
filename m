Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6874F99CB
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 17:45:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56DD610E4E2;
	Fri,  8 Apr 2022 15:45:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2073.outbound.protection.outlook.com [40.107.244.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75E5510E4FF;
 Fri,  8 Apr 2022 15:45:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BPVR/Lpll+Vjk59ESNfWp5MmWu3bb8GOsQ22ACrGTTbR/WbeQXHqrWffnK7bHoW81mpLy0XexnYM3m7E3/dyR+96ftN3556I7dQcfKXMShY0HDYzki975SUT0s23w9yehjSR9+HN6oiAPswEmM3mqI8mt31lEz16WNuuvCdMG3pMjb0CMYLJ6dw2rj/3UcCO0uCCSwAfxSK5IxP9TLM7amS5unc/BECmbqTCrhivNiOh/XtxaDKqJtcScH1ZcdX08i5fDtRLN0rExT2orrE5v+gqgYfLbQisFYiDzDkDiuEvpT54RPy9UdIjj0th8efUTE5RsZIciFHmFcanHsIhXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wu5CEs84Pz8jC68gyTkYgwVBmCWtQe/6e9uCAfkDbKY=;
 b=AxPJuGzLEJaOiF0HdQvKbJSjKeoaYvnWReoLaa3ftT2+PA/O9APj7ua/ehdoh9aFwTbyGOipephs4fxaMPo6ytDwRV4ovyzxYNfq05XODpe6pksmxH7Grm7kg9abmoihiw2JCN1V8kU7+JqFYqkTTR8v0xyzb+tb3iJJ8vY4u3fd1WEMuuimKDgUnfNm4mCv5+S7JppbK8ZiLVqNXGBbD3gzsPcNNCr4tM/IuzEclc+ocdg+6b5EgvLrOweQWP57PbLGLWYs5l9GzznCn+HAao0h4y7+4jTgEDClTgK7J6H+WXxrFSUpul3XOaB+0lMQ7v2Lqs4vbblGmaQ6VYq2PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.ie smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wu5CEs84Pz8jC68gyTkYgwVBmCWtQe/6e9uCAfkDbKY=;
 b=Q6WG7n6S1tLn0whmzjYz5rOpJAe69CcFWLXC0/pMbMP84kTsKUoiKfzySJNwB0r3oysgRTW4sdHyxVLNM443rZRhJ+4om/SLiNO63FioEoGbZSxl3mVP9EmWTZ4ioXlVVuO+lEISaqTswaBg3fTGXgb6Zn09qg5P3PZ47VgKv08=
Received: from MWH0EPF000554DF.namprd21.prod.outlook.com
 (2603:10b6:30f:fff2:0:1:0:4) by DM6PR12MB4547.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.26; Fri, 8 Apr
 2022 15:45:34 +0000
Received: from CO1NAM11FT012.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eab::200) by MWH0EPF000554DF.outlook.office365.com
 (2603:1036:d20::b) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.16 via Frontend
 Transport; Fri, 8 Apr 2022 15:45:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT012.mail.protection.outlook.com (10.13.175.192) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5144.20 via Frontend Transport; Fri, 8 Apr 2022 15:45:33 +0000
Received: from doryam3r2rack03-34.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 8 Apr 2022 10:45:30 -0500
From: Richard Gong <richard.gong@amd.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <Xinhui.Pan@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH] drm/amdgpu: disable ASPM for legacy products that don't
 support ASPM
Date: Fri, 8 Apr 2022 10:44:47 -0500
Message-ID: <20220408154447.3519453-1-richard.gong@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: abfdf697-12b7-4d2d-28bb-08da1976d14c
X-MS-TrafficTypeDiagnostic: DM6PR12MB4547:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB45476CF27524C84A46C1F3E995E99@DM6PR12MB4547.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FiHDYYApcNi3KNojUm8e0Dwh2Ly9eLDH2XDocdWesnpJbEQFHOjLgibTpAcPkKYSfI1ticWrCJvg8JxOhavzkUFespjjA/zxGZhT+zvH+2G3Mb+Gnr1PPHpthyZ5DDB0ORNkpQKE0EOiZyeNIj0XloPKA03dAEFpi+hZzgR/MbJxfrB2fPJZ8dFJogE/dK6BG4F6jRJhNFs/apPxUqdJhbAdaSD49zGrFKg1J5+g1yNNivDfN0KFlB0js6rt29qkR7uVPlehHyxqRwynEJfWeNelPR0zlvObjTb7iwhqfs+c1vZItfHbO5xJCv0AdagrvzAobUTysZxjUJS1jDQKxLK7HO6/oKycrJ3s9wsUTiDnYhkFcwlCE6X4DtNSOLE68OYIU4P6vIc1x8S8qFhTLalK3p0fJ+fSis/dkn6VK4EbZayyIggNa8mYS4DnqzmWJFf6MBdcRgCvhtIc38nNbjeCQ9BjyRv9DSTac6IRUE0BOV55mIIeLL2ey05LGuDZSqARZBkinhANtphIXTGXMp/NRN2aNybPXrsld4LmxBYZAWy1ITrasd9AxGbx3WanEMFP8WCz74bX6lIuqcNG+Zj+JTLLP+A4C/twHknx9r10QmN8TzsWeoWcztU0zmMppRURKfXNTMPWjKexWBntrTUEYndZ4glp/fFe1n+Uy2A79A6ksCubQi3wJEZDM+QfopUHg7LQcw/je8icYB9i+g==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(4326008)(70586007)(70206006)(82310400005)(8936002)(36756003)(110136005)(356005)(44832011)(54906003)(86362001)(47076005)(81166007)(426003)(966005)(508600001)(336012)(7696005)(2906002)(5660300002)(83380400001)(316002)(36860700001)(2616005)(6666004)(8676002)(26005)(1076003)(16526019)(40460700003)(186003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 15:45:33.2892 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: abfdf697-12b7-4d2d-28bb-08da1976d14c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT012.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4547
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
Cc: mario.limonciello@amd.com, richard.gong@amd.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Active State Power Management (ASPM) feature is enabled since kernel 5.14.
However there are some legacy products (WX3200 and RX640 are examples) that
do not support ASPM. Use them as video/display output and system would hang
during suspend/resume.

Add extra check to disable ASPM for old products that don't have
ASPM support.

Signed-off-by: Richard Gong <richard.gong@amd.com>
Link: https://gitlab.freedesktop.org/drm/amd/-/issues/1885
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index bb1c025d9001..8987107f41ee 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -2012,6 +2012,10 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
 	if (amdgpu_aspm == -1 && !pcie_aspm_enabled(pdev))
 		amdgpu_aspm = 0;
 
+	/* disable ASPM for the legacy products that don't support ASPM */
+	if ((flags & AMD_ASIC_MASK) == CHIP_POLARIS12)
+		amdgpu_aspm = 0;
+
 	if (amdgpu_virtual_display ||
 	    amdgpu_device_asic_has_dc_support(flags & AMD_ASIC_MASK))
 		supports_atomic = true;
-- 
2.25.1

