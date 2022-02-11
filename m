Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A98DB4B2EEC
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 21:55:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2580510E278;
	Fri, 11 Feb 2022 20:55:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2088.outbound.protection.outlook.com [40.107.244.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7137D10E278;
 Fri, 11 Feb 2022 20:55:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DbJxnjzUAd2R5Q2E2N35DQ7IkW17VFlQ1RKDnHnPOkzmXMh/cNjbKwchhPJaLxy0h1KO2x+0sabzTOsC6EALlDaeMTxyg5tcOi+ZnemDeETCjkCqazk5Hwm8DbRMpysOXIDxiXmud6yWuKiID12wFzAk3iSDelPaURtyhfoapoNkmSI3uTMSGQwpaN0C1Ms/D962+r7UT5kUSBUY4U+rc3e62kPMITHuFpUo0cQWlMqeu9MmUrAPL3NBetiVG1jKzsA+Ym5xWIPWsfEa/UvPiQmiIrPwz274YC+OiMTG76m6IiEBQQYtED/5ir9RFIZkwP/7fLhyYEIPnKxRumb0MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hy9Xa8RKN13sWuWAMiADOBc6gqH7rdhBYOwhNT3G6mY=;
 b=NiqDSdtE5V2z7Pd1R6gzi3ZlMWjMJRju4Qp3zo7tvN8KGLHlKJWFL0yYGZ6mMfiV1IKhFETIy+SvdoqZLU0Pw4XR87VpwQjD0g6/g78hjYxwe1ce0leCkMyS3aSWz8jBsMM9FtMDcLhCUnY3o1OfHG+9Nswx1hvTN5xHRpFsQn1SKFYmrluIoiVyES7yU7vRG6VdZ/hq31WrNzSVzgefMGcNqNP6f4pJs2zTX2Hftv8W2mYO9dVEJmN6qMTVbcjFn1SD+koSzwu/qVV89klFfhHK/uVkoGHZwafwMJyT7JN7Vai05bpFQGAoX6iM6VIYer07t3oNbPbqDzrpDRikDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hy9Xa8RKN13sWuWAMiADOBc6gqH7rdhBYOwhNT3G6mY=;
 b=tYWEFlwaLrY3N8xxPZU0m6kKmxdY8lRc6xSDeWCe0KUTf0oMss0d3dy1LsNNvinRTXATfZHnQTOrCpGAS7sevIy8mEkzNOQt+EGTjG6L+poVG77eSYMV0eDSVPxBsu7YZlrOnhn4EO/vJUZ/Ob1yT4oly4DkafNeHEVlHvNWMoA=
Received: from BN6PR13CA0018.namprd13.prod.outlook.com (2603:10b6:404:10a::28)
 by BN9PR12MB5051.namprd12.prod.outlook.com (2603:10b6:408:134::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.12; Fri, 11 Feb
 2022 20:55:12 +0000
Received: from BN8NAM11FT014.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:10a:cafe::bb) by BN6PR13CA0018.outlook.office365.com
 (2603:10b6:404:10a::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11 via Frontend
 Transport; Fri, 11 Feb 2022 20:55:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT014.mail.protection.outlook.com (10.13.177.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Fri, 11 Feb 2022 20:55:11 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.18; Fri, 11 Feb 2022 14:55:10 -0600
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: Fix htmldoc warning
Date: Fri, 11 Feb 2022 15:55:00 -0500
Message-ID: <20220211205500.601391-1-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6586de1f-94d5-4ca5-89f2-08d9eda0cbdc
X-MS-TrafficTypeDiagnostic: BN9PR12MB5051:EE_
X-Microsoft-Antispam-PRVS: <BN9PR12MB5051E0615DA6539C3CE8E4D4EA309@BN9PR12MB5051.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:862;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YIpr5lvvTGN4ulh1l1RWv76kV+eeSqZKFX7zYMBLsXiHYJwsbYWW33molIvvGIFfVgCo2oaGWVHa3loKuypq1cIgy51abiq4opnY0iU+9Bc9nf7MdHV06j84B9N9w3PoGblyG9ysJ8htb++pVZxxaWuMLjnSD7WikkoPVONHvi+1nMtG6gUclPpWoLqUj5gY19v4ayAMUSE3Y7HdrYgce71hNCUMnoC++8eaJPTQa0bdVshIIWcp31tjhFIWyFc0Y4WvLuoIEfclv4u8fuot/qZozUn/4dBb8LBQDk/DOqpFhbXAox4wtiB53f1dMT6sDtG+M2Cyr2NPppqnO9mP/l/rBZ/B0qBWwSKpGsTR9YVoeMVdGkhzJMTxUGPKMM0gS+uzucKaJdWhQuLL2godmOme8COfNAAYUHjxieLtoPWr9Fxuz/Fwss8zIAMBJNyzJOn6KT8MX7smYj6DYFJ9DqdR/+uxprjProryCNTN0zmS4SfGMwred5MXG08YkDlqjDE2FrLfdd7MSKdj1rR/aA34rc7IGzySSLB6k1TQIbP97Yc+sx+WVhEQy4Wx/88W94cogRVEhQMyqJrlDK4o7GUt+UkOgH4GxyTNfHChICPQfo26k+zlearKYOEq8xzs0XIWeIo7syJ7EY9iq/3qJdaog0RVS/2+1+4OY7nyJAsgecZVRSa2NZEv2FiCiHQ/ZL1LFPSYFKz/5z//N65tQw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(83380400001)(508600001)(1076003)(44832011)(47076005)(6666004)(4744005)(5660300002)(2906002)(40460700003)(36860700001)(36756003)(356005)(8936002)(70586007)(86362001)(70206006)(4326008)(8676002)(316002)(82310400004)(16526019)(110136005)(54906003)(336012)(426003)(81166007)(2616005)(26005)(186003)(7696005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 20:55:11.9789 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6586de1f-94d5-4ca5-89f2-08d9eda0cbdc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT014.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5051
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
Cc: kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Update function name.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Reported-by: kernel test robot <lkp@intel.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 54f8e1fa4cae..d78141e2c509 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -4978,7 +4978,7 @@ static void amdgpu_device_recheck_guilty_jobs(
 }
 
 /**
- * amdgpu_device_gpu_recover - reset the asic and recover scheduler
+ * amdgpu_device_gpu_recover_imp - reset the asic and recover scheduler
  *
  * @adev: amdgpu_device pointer
  * @job: which job trigger hang
-- 
2.25.1

