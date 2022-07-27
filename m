Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5595828D4
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jul 2022 16:42:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C115C8E8D3;
	Wed, 27 Jul 2022 14:42:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2059.outbound.protection.outlook.com [40.107.237.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 014938E64E;
 Wed, 27 Jul 2022 14:42:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QmAFmzdXupzaQ1GnSZChTShBqVIxF26XZ6HimLgY7Jg/CInq9GOSbJ69om39v5U8F9wwHMJHaD/WcSYpUu9hwqHAmGhY9AEzktMLrh3zMV2w7DiWx1Uas3g+kJ9z30nWR1qYw4WCOrcaW9DI8xjDUKuTs1fUFr0DV5m7bvfIJn3o/cc6x9o3+tSgYBPtgnS9upT+VtWljrL8SWqkG3XquzS5Na2ufEJfLfO7B0QyyHvXgDoIfOudykWgRgIpP/h2LZuDQmdxaf10w71B2gGStCpDMJPQKUJZ/3m8zf47NNGinGo+ePRV+usNB5v8AwrJ5L+WmW+aaWwa5rc1QXF6lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T+5XiYM4qOD5y1VLSERXqEiGZySvwG04rj6ed5j6IEU=;
 b=K8EVJ4o9FXW32W8Hzrftpfvj60jwoLkzdk02mO9SpVwMhdYt1lkLqLp3hNnlDeoA2Fcj6mMs9PUkqRZxEv0Yoi62ioRX6pu+nhkToqVxb8iq7Ob5ikYZNcO9v5/NFuaiFf2Hc0/UL+CrVDdOW2vmDHK2vTPMFKOb+85Qam1ucKZw8p+1R/f6fyDxnjEzcRo2HfCnkJ7xa8aacIFMCe0ecvClZxGgVHzAA9EIrMwFAupSi9No4fBxeiAybi5R1+PJQ8Bc9Kdr95Wz4/jJ/JScG0CrUcXhS0QlaoCeeWavmVTYHWNWJwfr3rQiF5xw1lybldCPxQvDK1LqJYFDRN+GVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T+5XiYM4qOD5y1VLSERXqEiGZySvwG04rj6ed5j6IEU=;
 b=McVMx4u47T3Du3DlD+Nv/8pe8E0880PYB2ZC2sneMlPW7Ir786auPzMBfaBjs7Qlwh4hmc9Q0fhIkIXH5aEWVvbsLacXoDds6rIGb/EQ1o1OdabCnCWDdqSSGZdhgr48A0+iMBF/a6AqB4FYLAJK1xUrttP7rKvQNk83KeIiGGQ=
Received: from MW4PR02CA0023.namprd02.prod.outlook.com (2603:10b6:303:16d::16)
 by DM6PR12MB3548.namprd12.prod.outlook.com (2603:10b6:5:180::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.20; Wed, 27 Jul
 2022 14:42:29 +0000
Received: from CO1NAM11FT011.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:16d:cafe::1a) by MW4PR02CA0023.outlook.office365.com
 (2603:10b6:303:16d::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.22 via Frontend
 Transport; Wed, 27 Jul 2022 14:42:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT011.mail.protection.outlook.com (10.13.175.186) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5482.10 via Frontend Transport; Wed, 27 Jul 2022 14:42:29 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 27 Jul
 2022 09:42:27 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 27 Jul
 2022 09:42:24 -0500
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Wed, 27 Jul 2022 09:42:16 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: fix i2s_pdata out of bound array access
Date: Wed, 27 Jul 2022 20:12:48 +0530
Message-ID: <20220727144249.415228-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7540c613-2a08-44b8-352b-08da6fde3b6d
X-MS-TrafficTypeDiagnostic: DM6PR12MB3548:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c9tE/91OZxP7wmaMNCBsnXjJeBPZEhNa63A/9VTarEhQPw/e7ryHL+t+yqZ1ZhKEw9sQL2hlrGY+9DJz8+hau6IZ0g4FJVjl0xmaPMs7XU+5iClPL56OdBySsWk7xekfH9OnKpP3uaIuXr6+USzh5qLWV3PWRNAfSEM/Ydabe+qk4vajx4g3GJ+aaKlkKWiTZcj/iPyNSRiVcqbm+DKIdMi/m0kU4n3gZMt/Dr4RDiS5d/CbI1t+H4V9I62Z6q91624IdMqoFzLxP/I1TBJqS2vy5hECrXPKn7yN1sTN3jMDlTG15qsWmAN7VHHRVcqfEjKUHuPjFx3pBydrOe0PRmOhW/c2PFh6EPXdOh1MMJdA3wroyieYxNCd2KGonC3jh75HAy74IHm1U85VvOG2jbPFDhMW2ErK7OquzDuxcBNfHtwgJ/WslS9y6x8IDjFoB+xevzAvxdYAdJq70DQKs67CSxcbWwpTv2Ml+Kp7jPOA1Xlr57kGy0LepGBGvP4AQdEfPahvjDGfZKaATqygAP8n+ovZacNnZKVv5yeYfcyYhMAidMYozHwFe/b3dWksvskJKpRfXO8CX2bS3Eaw1h0Fh9yAsHbEtIyktBtdo9ykV9WJ8uZoQIW1pnTd5GyOh8Ac9mavHmJai34L4NiXlGgOmN7FFGdBe2e1zFh9sQqMfI8WSA4Wc3cFiCktR/FZX5GitTcYxKD9Jprq7B//gNEt4+nM9PJvAyGR/Cl2s9DCuL29bx7IdS9/j2Rbdgo5Ly7agSP4kCV4e+bJPoKwIfVWSR9dfQ27zQ95e4DlEqnJn9snxauAmEb8hX2IOiccDzovoataRDGYuhQa9hvG+Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(346002)(376002)(136003)(396003)(40470700004)(46966006)(36840700001)(110136005)(26005)(54906003)(6666004)(70586007)(8676002)(40460700003)(86362001)(7696005)(186003)(36860700001)(47076005)(426003)(82740400003)(336012)(81166007)(4326008)(316002)(83380400001)(82310400005)(40480700001)(2616005)(70206006)(1076003)(356005)(8936002)(478600001)(2906002)(5660300002)(41300700001)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2022 14:42:29.5063 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7540c613-2a08-44b8-352b-08da6fde3b6d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT011.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3548
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
Cc: Sunil-kumar.Dommati@amd.com, David Airlie <airlied@linux.ie>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, open list <linux-kernel@vger.kernel.org>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dan.carpenter@oracle.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixed following Smatch static checker warning:

    drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c:393 acp_hw_init()
    error: buffer overflow 'i2s_pdata' 3 <= 3
    drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c:396 acp_hw_init()
    error: buffer overflow 'i2s_pdata' 3 <= 3

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
index bcc7ee02e0fc..6d72355ac492 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
@@ -390,14 +390,6 @@ static int acp_hw_init(void *handle)
 		i2s_pdata[2].i2s_reg_comp1 = ACP_BT_COMP1_REG_OFFSET;
 		i2s_pdata[2].i2s_reg_comp2 = ACP_BT_COMP2_REG_OFFSET;
 
-		i2s_pdata[3].quirks = DW_I2S_QUIRK_COMP_REG_OFFSET;
-		switch (adev->asic_type) {
-		case CHIP_STONEY:
-			i2s_pdata[3].quirks |= DW_I2S_QUIRK_16BIT_IDX_OVERRIDE;
-			break;
-		default:
-			break;
-		}
 		adev->acp.acp_res[0].name = "acp2x_dma";
 		adev->acp.acp_res[0].flags = IORESOURCE_MEM;
 		adev->acp.acp_res[0].start = acp_base;
-- 
2.25.1

