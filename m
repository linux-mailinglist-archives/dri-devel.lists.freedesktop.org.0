Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FB67B09D4
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 18:17:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED5E610E565;
	Wed, 27 Sep 2023 16:16:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2040.outbound.protection.outlook.com [40.107.92.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 065ED10E56B;
 Wed, 27 Sep 2023 16:16:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iC8moH6m6lZvmSLv5Ya0XSFYZsIMzRJ7pYZ+9ktEtlQuVCzep4qvBizbOGe12LV0sP0dr5AAg7yQACgsAEHlzNQdiKR4Wh69YmHDwB+HdN4n1jwestzDthk6PfTvbAazAHMCWNFg7oxpJStqUVysG1nPyxmp4wpDtmbMEHH+lqNXWaLErbTITgw4+5eoBxZJeyqs7rxER/WRqvZ48dW7CFdDhrqQ4jyXtXbXbeDLXKqLtH+7qKYXukfvMz/uCyo8eif3A5L0lwY58u0YuHuRlbDB38bnlkur01GLsd5lLcHfC7SIfqSg4imzSWvIK9wR1I3BuOLr3b8KbcxjoHR9fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FUcD5q7BXr4tMLEnp/sUExSN86whZqTyrarEcoobj/I=;
 b=bWXHc/oGYvGhO36sPQNS1Hv+C+zqHIXmAtu7Vk1O7rCVS6f+uu67LHlY6/cjtGcvRcyxEQNfJBAIr2J6CUAhhrcjkxsslPcCzcxgCasiV5xLA/dvmArbsniaHYFtVOwhfLqex1iqmOom1dmQrJFb7aItAKCnPtvMA5cWb5aLnnyjndTNAGaOrbMSTq9R+usFBnSStAehnvbh6yJHl2NX/FYde3Zj4j5nc6VkwMyqgKLCw0bDgDY8kAz5mYfMD/okdHlZEngM7wqiRgprtRatAQEzWwCG0v77JmXM0paND5gkYU+GTW7Jek0YOGknPhbQ88dyactkhx9JB6E1P5Tpfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=amd.co smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FUcD5q7BXr4tMLEnp/sUExSN86whZqTyrarEcoobj/I=;
 b=JteZ22J5CCWQjiH5TwcI/eIEzIv/SUa3GCwgvE+tuPTk5DpPNqbxXkg/MWFPhUDynuRKaLmtLl8zEl9i0tftRgOYTvmGKPE38bWrGvliJhzjIM+nDNgAB2m3EuOjlg3/MzUdmZhJ7WvOA29exeSMLaY2+HySW+MzIMEJBXzjKLk=
Received: from SJ0P220CA0028.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::11)
 by CYYPR12MB8653.namprd12.prod.outlook.com (2603:10b6:930:c5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.21; Wed, 27 Sep
 2023 16:16:47 +0000
Received: from MWH0EPF000989E5.namprd02.prod.outlook.com
 (2603:10b6:a03:41b:cafe::24) by SJ0P220CA0028.outlook.office365.com
 (2603:10b6:a03:41b::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.30 via Frontend
 Transport; Wed, 27 Sep 2023 16:16:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989E5.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Wed, 27 Sep 2023 16:16:46 +0000
Received: from rtg-Artic.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 27 Sep
 2023 11:16:43 -0500
From: Arvind Yadav <Arvind.Yadav@amd.com>
To: <Christian.Koenig@amd.com>, <alexander.deucher@amd.com>,
 <shashank.sharma@amd.com>, <Felix.Kuehling@amd.co>, <Xinhui.Pan@amd.com>,
 <airlied@gmail.com>, <daniel@ffwll.ch>
Subject: [PATCH 1/1] drm/amdkfd: Fix unaligned doorbell absolute offset for
 gfx8
Date: Wed, 27 Sep 2023 21:46:16 +0530
Message-ID: <20230927161616.3335-2-Arvind.Yadav@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230927161616.3335-1-Arvind.Yadav@amd.com>
References: <20230927161616.3335-1-Arvind.Yadav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E5:EE_|CYYPR12MB8653:EE_
X-MS-Office365-Filtering-Correlation-Id: f59efbf0-c00a-45a5-194e-08dbbf7525ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iikJHzLpyAOENKeCCnOE4WMvq3uUzEFkzKhu6IqOwhSHyM8TjBPbFQIUveBaItZWckAnoGPZdDQKkh1xQ4iVrSlSnQ5YUKXt7692z5VAqniesAN/uJudjB9bIqmGZo9Aab7aqiwk+jeUA/bAAJyHHmrIK5ZmkuiB6oL17/MyHOMfTV115QwR9EIT7HgNAWyruj6oqPvr/FpcBHcSGozKhgdl5cbXVr9fmw79vs3ps/UueSj3/LCyrQthmv8aqL/vs0fJEtZWLFg9cB3Bt5ff8WRg9CNoBeS4jZ4HNeKwEJWEEaUTwBWF5CpLJZO8JMDEjfqZXeVHQmVzGBYm4hv9gMBiyttBaOplKLGj1Imc1O/7PLQXs/BNRFWNb0Z6dY1CbTocbisxurFewHdFNF8D6qmJi9AfqsBkgxdAa0/9wATfU0WI9VwyuSBV+w2Y/jUzdbfGnKPe0oNW1KMBw4CDR6kFIpZWGWAk2Qbcfd/fhZESqaOyY9yLzsOnGE58g/kv995CieppaiNcKOH0QuWxZC7QXRGXUBM6b/PIHx+dNbiuEcAawVVF06/0qgYX4DQcc8uhxfauaRKPRkVsSZfN+ZbrkwOZeBJYggzmM6d6qwy5AJnbzFm8xLZUoSjfX1RgxMl9o82yCpVIJsWvaUrOYZgwAAbWsojxE5R6q/u4roIg06z5wisS0Sg7ibPd/pqZMVLI1tiYa2PeitSE+btYEKH/0X72zjVuftQ8NiXnnm9X7P/c54d9DnnSzE7VGYAOkgMeloqP+f4tJLDeb+dNGw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(396003)(39860400002)(376002)(136003)(230922051799003)(1800799009)(82310400011)(186009)(451199024)(36840700001)(40470700004)(46966006)(81166007)(70586007)(110136005)(54906003)(70206006)(36860700001)(41300700001)(47076005)(316002)(7696005)(336012)(82740400003)(356005)(2616005)(426003)(6666004)(1076003)(478600001)(16526019)(26005)(5660300002)(4326008)(8676002)(83380400001)(8936002)(86362001)(2906002)(40480700001)(36756003)(40460700003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 16:16:46.9712 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f59efbf0-c00a-45a5-194e-08dbbf7525ed
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989E5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8653
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
Cc: Arvind Yadav <Arvind.Yadav@amd.com>,
 Christian Koenig <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch is to adjust the absolute doorbell offset
against the doorbell id considering the doorbell
size of 32/64 bit.

Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Shashank Sharma <shashank.sharma@amd.com>
Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
index 0d3d538b64eb..c327f7f604d7 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
@@ -407,7 +407,16 @@ static int allocate_doorbell(struct qcm_process_device *qpd,
 
 	q->properties.doorbell_off = amdgpu_doorbell_index_on_bar(dev->adev,
 								  qpd->proc_doorbells,
-								  q->doorbell_id);
+								  0);
+
+	/* Adjust the absolute doorbell offset against the doorbell id considering
+	 * the doorbell size of 32/64 bit.
+	 */
+	if (!KFD_IS_SOC15(dev))
+		q->properties.doorbell_off += q->doorbell_id;
+	else
+		q->properties.doorbell_off += q->doorbell_id * 2;
+
 	return 0;
 }
 
-- 
2.34.1

