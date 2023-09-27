Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 355717B09D0
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 18:16:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71CA010E570;
	Wed, 27 Sep 2023 16:16:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2058.outbound.protection.outlook.com [40.107.94.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15D4A10E55E;
 Wed, 27 Sep 2023 16:16:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iMeUhTBB21f46ft9+jY56cCv6VtT08sq8tqPqjZ2ksXfAbAb6+1zS9Qebd1ynsEFPWNaLXcMkyd/d0vFLD8QJqpvdXf3AZbtricGIga9p+iY/ezRbC0vgGu9qTe+oIEuXPIA1o850uB+E6a8EZW8sPUbX7YF2pIckZ6tQUFUAQn1/s9dd/d6CTm28ogPl6bndjyBkrize4Pvjg8oauIoDySUbGiXNzEvTjzi2huStZAkwWjnHcbAKm7ifBipZE+jhQ02xvbPHHCcOAl9v3HlVMhMzDSonaZC7nWXjhm2/F2y9r2lC6FLbVDKrm4k1mhiQmPxNlxWC2N6Ov4VwJ+/Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qWB4/4//Kqx2tjsriyqEPfwArpJgf4VFwbCDjK2FTow=;
 b=KNX4oSzW//aDsleEI6Z1BbzLd0OZ54+jtqGSxe1JA0lXzH7SChxL0cn7AaHNJ8K22YOSliRis+Rmv+UwlbYziMOpY4AL/wnI2XfKaqTaXPYzHQei2AAv+xM0vsE6XP7TxPi7J/2VsKhExfqUf9G+7+PvOBuw08lYPGiUQ5btl1YWgtCcpK4d9DAR0J7YuMMSyAJoBMS7pSNe/DMDwswvDysm0JBLJU4WcVgnS6IWHtpYTQkGecCvQK7TjWZoLz5KPjRgKa5V7TTj0e2Nqr7qy8wyBRDPMEwbZTiOPRlFaGQyVJ/JwCz+5ZtX6+FrH3gwAl/PkhzTNy1bl9EHGHj47w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=amd.co smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qWB4/4//Kqx2tjsriyqEPfwArpJgf4VFwbCDjK2FTow=;
 b=BASIuBOkEAHz5rxbqUZL4kyym5EvsQG6o9YgkON8nt3maKDsIWs+r/l7f30Qas1x6FmHzzyjb7Clr8LtfMSNMul8la6OqPpiV/7MN7+7VvTtBb+h8CKrYf5cHvjaILaDPDAMKc0g0BrKXA2VFmDZbqT6bPpg5w4zuvoJq5Z5IW0=
Received: from MW4PR02CA0011.namprd02.prod.outlook.com (2603:10b6:303:16d::28)
 by DM6PR12MB4403.namprd12.prod.outlook.com (2603:10b6:5:2ab::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.21; Wed, 27 Sep
 2023 16:16:42 +0000
Received: from MWH0EPF000989E7.namprd02.prod.outlook.com
 (2603:10b6:303:16d:cafe::30) by MW4PR02CA0011.outlook.office365.com
 (2603:10b6:303:16d::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.21 via Frontend
 Transport; Wed, 27 Sep 2023 16:16:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989E7.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Wed, 27 Sep 2023 16:16:41 +0000
Received: from rtg-Artic.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 27 Sep
 2023 11:16:37 -0500
From: Arvind Yadav <Arvind.Yadav@amd.com>
To: <Christian.Koenig@amd.com>, <alexander.deucher@amd.com>,
 <shashank.sharma@amd.com>, <Felix.Kuehling@amd.co>, <Xinhui.Pan@amd.com>,
 <airlied@gmail.com>, <daniel@ffwll.ch>
Subject: [PATCH 0/1] drm/amdkfd: Fix unaligned doorbell absolute offset for
 gfx8
Date: Wed, 27 Sep 2023 21:46:15 +0530
Message-ID: <20230927161616.3335-1-Arvind.Yadav@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E7:EE_|DM6PR12MB4403:EE_
X-MS-Office365-Filtering-Correlation-Id: 9efabb93-be65-4c3e-b094-08dbbf7522a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ff6mTVDDE+3OOGaZ1UQ27jfAsre4dPt1FD2t8MUr7e4gY1AtYuCLLy2nFj/uYLuArK2DrQMzUiDlOzZNJAub9fE6T/dPSi/YXWRo+q0XZQbDdBmf27QO8c14jqb4XV415kApoGpKInJCFYKZlDzxelsV02ddeFCSCG3XgvTTAdwfwSEJR8kc3158G4d1Uk1jE30EpEYEYTxgsHt5LbrV8m20WhRBBasYSNIQcYaHmsukyhLKuvO2lv4XWj1V6LP3oh1lwK+f3CGt6HMV8zzERMD4rYDEmfVovta9M38bFsp4GLSbbV9jcB9lx1oaQXR1GWpFnAvyxGvSHWkPajScNaKbWD+XS4Mcq3I8LT0WLnA83Pve7NA5TlmtiScbaHsGZ7isIty+fIEYYTyCBecfDZc/KnPWgEuBSE8vPlqLJmYpvU2DsFiCHp5FeDKO5uuPZlAfSRvzyGB+g//L7ch/PzHtn+hirgxaY6KCqKW9hyvOHmJC+hg7LoD9yjvHjnEu3tPxU8XRqjAPqB4dEHu9NtkFD+/83RdAOnIL6N81VKBmBbOPAcKdMkgweWULJ+/6F6m2UtiHfmDdNqAbhBfWc03ILT6Jr/mGCiU1dPiYD7yT4agwgCsiN/BrBIEI+xrohX8vCQLPYN5Gs4f1AKQ7JOmJ+IwNadMhwTGUYyLki0etc+uenqRxrMvxiprP1CiLB7gNaygu2BFVAehZtVAeEhTpnuzxlerTXirSUI+f/qRdlsoFnLKniONzxSOvpPi5QLaE1TMh7t0OTX9hoRC7pA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(396003)(376002)(39860400002)(136003)(230922051799003)(1800799009)(451199024)(186009)(82310400011)(46966006)(36840700001)(40470700004)(26005)(16526019)(426003)(2616005)(1076003)(8936002)(5660300002)(4326008)(8676002)(83380400001)(356005)(81166007)(82740400003)(36860700001)(47076005)(7696005)(478600001)(6666004)(336012)(41300700001)(316002)(54906003)(70206006)(40480700001)(110136005)(70586007)(86362001)(2906002)(4744005)(40460700003)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 16:16:41.4963 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9efabb93-be65-4c3e-b094-08dbbf7522a9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989E7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4403
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
Cc: Arvind Yadav <Arvind.Yadav@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On older chips, the absolute doorbell offset within 
the doorbell page is based on the queue ID.
KFD is using queue ID and doorbell size to get an
absolute doorbell offset in userspace.

This patch is to adjust the absolute doorbell offset
against the doorbell id considering the doorbell
size of 32/64 bit. 

Arvind Yadav (1):
  drm/amdkfd: Fix unaligned doorbell absolute offset for gfx8

 drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

-- 
2.34.1

