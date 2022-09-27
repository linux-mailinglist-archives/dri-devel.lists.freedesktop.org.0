Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC175ECABD
	for <lists+dri-devel@lfdr.de>; Tue, 27 Sep 2022 19:24:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45DD210E057;
	Tue, 27 Sep 2022 17:24:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2085.outbound.protection.outlook.com [40.107.244.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 014B910E057
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Sep 2022 17:24:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ia6+3fXt+DncJzKlBu37l6kaQj6XF6XFRtU59gOhibO60o/T5UCqQXp35LpQP2ZIFbhlWmglbeAhw6AtwjWDZBe7DwDCqYx6iHBjGz27aoeeKKaq9aIKDW4buGSSuc09+bWxpPwyxJHDeQUlp8l/a70R8elVyphA9Ll1fnvVkSXaS8vTyPtw87C2A9KddKOmxmC9ma6nQ/eMcXmBnjEL9arrDherCycb4cDy9/8dOWXcKidIGcozNuLSppHD8M0VUl+KgGa3sCtLYzxXDkKP+iiReB7hD9fbKvVndS8kLyvW8C0qWFjVeM9g6jhxb/SlyokSqPDdAmLOEu0VbWdFsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tKTyzsJ0ljT61DA4htSA+rC31t1TO/IKCYHxj1HK1n4=;
 b=hmdRtZ9W9AtTSMAPI4bTekfHnR8cQ88c6D2iYJ4/1uSTYMy+QhkZUyRDzhHWAm+oKH7q/f0A1S5qJmDu/XxUwvEntGKlyycSkEFgbpjSKws6er6g0/T+vnUnNLT/FRlSZsXouN24TEe3v/46KwaXH1YOp8ItJNmFXkxAB3g1p6pP1b+vMD76OnLhL+3KnaZWrf9lGqAk1bdmHEzEmM5dH9P4qYJrpEZ6/feY4kxhl8tiQ9qmObc/nOc7Zn2TgAEhzmYeZDdXj8u6jSX7XX9MYc2QHGXtCvDwny4B02f0X/OgXg6IQIV6OEAtj7aQh7OaDJuQgwmNksofTBBeuOlAag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tKTyzsJ0ljT61DA4htSA+rC31t1TO/IKCYHxj1HK1n4=;
 b=tA9cKDzSX8ecqXbv1BL6gZpPD2odq41cAP2OM/gIh0ui8s0y1GAG9yJsua3O3AlqDmncOC+OrJeBqsZT9CV0F9weWrkYvz5YQ2iRxH/saZUbBJHMd5sw4+JUpqEbct9spLj5y/YOm0J9BB5Q47UDahdGUd1U4+4v7FUCMmUPTX4=
Received: from MW4PR04CA0376.namprd04.prod.outlook.com (2603:10b6:303:81::21)
 by CY8PR12MB7635.namprd12.prod.outlook.com (2603:10b6:930:9e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Tue, 27 Sep
 2022 17:24:39 +0000
Received: from CO1NAM11FT048.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:81:cafe::d) by MW4PR04CA0376.outlook.office365.com
 (2603:10b6:303:81::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17 via Frontend
 Transport; Tue, 27 Sep 2022 17:24:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT048.mail.protection.outlook.com (10.13.175.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Tue, 27 Sep 2022 17:24:39 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 27 Sep
 2022 12:24:34 -0500
From: Arvind Yadav <Arvind.Yadav@amd.com>
To: <Christian.Koenig@amd.com>, <andrey.grodzovsky@amd.com>,
 <shashank.sharma@amd.com>, <amaranath.somalapuram@amd.com>,
 <Arunpravin.PaneerSelvam@amd.com>, <sumit.semwal@linaro.org>,
 <gustavo@padovan.org>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/3] dma-buf: Check status of enable-signaling bit on debug
Date: Tue, 27 Sep 2022 22:54:06 +0530
Message-ID: <20220927172409.484061-1-Arvind.Yadav@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT048:EE_|CY8PR12MB7635:EE_
X-MS-Office365-Filtering-Correlation-Id: 664d4f8b-c55f-42a0-0bcc-08daa0ad2862
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w2XMLu5MfqTzOQvtjwK01rWaZh7kNGYTUGgmnA38bumGAVkxfWRtCBVmUvmvBRPp8MMrrg0ndPiIAshKnDs1BCGYVKzhW8uoK1sUhWWZARpSJ/VrIQ6qqnhpajne1uh5pamBx6U6NSSheY/E+f5A3eSRFsrAeWnndgG1buoMLLw6mOp0IRQs4UZ8l4R809XCcMrWcf8rNwEhdKFNBTIaByZ1pqIa0ORsl6qPVF2ytp7+8IU/girRo5gsoMqTDbsq95Gvl/aYk4bpuTgBtXxFHKFtuoqxCdFd9j6Vysq+aM3TH4I6qJvWlJ6LDCV3/LvzdADsrt9ry485Cu0HcQMiZMBepXIAGfugH/7ivedBiygLctDMAxcPytrbFUBHCpDigAoYQSIjK9e3a73ifYtfAXWy99faUcGwwrpz2AtJjVl1iS8z7LB2jDQveHLE6Gl9f0cPZfw1ztgSKX6u1d5m7EQdSu77txAsBpaBwtAoKiRD+O8OrQTJBSvlYqZW6ihlF87k4WO/qqU4U3UrCHqQWmdxN2RJh0Vd2460fLwJci4/gJu8MgK9nN724G0X6YWXH+5/DQ/++ZwaqZ5LduYszvGQMce/SmtaFSIIq+HFm9v7KjoNpWy6uwXEWvrGYfuZyT5zDDEBW35ZczkpbbFRP7jfLwFLwiXs3oQG/A3N4mfaqBS7V6acV0gpNlHI/U6NeKhX1wyFqi00u1EcW7WQJtkzextFcMQmcZT0cSmN419tB5Dz4kgvfwZOM20DBkT/8moKtNYw2aQRJ3kS4T2r2UL6Kbmy6x+LAjxWGNwKluF/XGYnUMlynepeSoVeSHTJqTKg9aCVhUTIJgAvG/S0kEpLamDh1iTl5sEIHdGjaP4=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(39860400002)(136003)(376002)(396003)(451199015)(40470700004)(46966006)(36840700001)(7696005)(478600001)(41300700001)(83380400001)(47076005)(426003)(186003)(6666004)(16526019)(2906002)(82310400005)(336012)(4744005)(26005)(2616005)(1076003)(40460700003)(40480700001)(5660300002)(110136005)(70586007)(70206006)(8936002)(4326008)(316002)(8676002)(86362001)(82740400003)(81166007)(356005)(921005)(36860700001)(36756003)(83996005)(2101003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 17:24:39.1772 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 664d4f8b-c55f-42a0-0bcc-08daa0ad2862
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT048.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7635
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
Cc: Arvind Yadav <Arvind.Yadav@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fence signaling must be enabled to make sure that
the dma_fence_is_signaled() and dma_fence_is_signaled_locked()
function ever returns true. Since drivers and implementations
sometimes mess this up, this ensures correct behaviour when
DEBUG_WW_MUTEX_SLOWPATH is used during debugging.
This should make any implementation bugs resulting in not
signaled fences much more obvious.


Arvind Yadav (3):
  [PATCH 1/3] dma-buf: Remove the signaled bit status check
  [PATCH 2/3] dma-buf: Enable signaling on fence for sw_sync
  [PATCH 3/3] dma-buf: Check status of enable-signaling bit on debug

 drivers/dma-buf/dma-fence.c | 5 -----
 drivers/dma-buf/sw_sync.c   | 2 ++
 include/linux/dma-fence.h   | 5 +++++
 3 files changed, 7 insertions(+), 5 deletions(-)

-- 
2.25.1

