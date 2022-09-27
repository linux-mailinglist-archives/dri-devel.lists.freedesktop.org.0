Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 846A55ECAC7
	for <lists+dri-devel@lfdr.de>; Tue, 27 Sep 2022 19:25:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE8E110E0B1;
	Tue, 27 Sep 2022 17:25:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2054.outbound.protection.outlook.com [40.107.95.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F30110E085
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Sep 2022 17:24:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mKiGz5rXap0DPTGh1Ev7T3Zxn/YMt/YfPi8BU/rSYgoqOe1MyHrPk8DRmyuHysux1QuVVpKY4XCxFtg9kfS6W9NU8IhzRVZzgPUspVioo800Hcew9TI3hFRPDBbjBBwOX3GxcZqfc0U0mro+GvR/C9oI1/uBcNujCV0loPnUa1RhbeM6jRkg5rnphqdQidl/rF9AMBKGzuznCFFBeuvRGY0SCFJX7z1AiRJbzB/FSneeIaNg0nz8TaMIOvnJzNRFbGKFB8jVvkc/wIlyPe1r5bSyFTwQB3G1LYPijbsPDjEhMe+iPzviwn0keXykqXqdQTMXku+zim0/MhtzLVXtPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vzpAP7aCoaET4RHIGUlsyf3t9mv1CqQCdFqwMr60Gfs=;
 b=bs6eDB0kTFKHgGMGQWo5soT+3q9YyacoIyE2uSvBoL7f853vEJUEwf1lltv38pGC7jMMQzkomyvDIVIuX6aYh8TzH0zKTjRij6wnYJOkaT68DX8UnuP9x8noe9alJ7I0GBZ70QvQC6aPXp8SH62R6d7edx/RZ4RDl9HN/5SSDqMqNdKKMh7nsOfygiapfLzXr7VtMaxSi5O6zJZkryVE3gmYd6wL905aX0YkwQSTwKNlq/9VcEhjUnon/tQnTBixzMpKnaTyx0nC2XWbBkXZUCIGA9vOjZyROrLkZ1iUVclxTMaxBBDdaPxVjkShgLw/mcdfesUO5zzf739UXBj4Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vzpAP7aCoaET4RHIGUlsyf3t9mv1CqQCdFqwMr60Gfs=;
 b=UCqZvusClfUEMn2pqAhM4lSjT0NOEyF0d4fhP6JWaryHdRi10LXN44TAGC8WN6CLRnaIOONU3/WAnwH5l5TTjFa2WeU14wwKV6P06bD3KSXqPcSBzkSUeDKA1Gq/AMqIbmq3IPNtCivjD2erDBGAAuQJ3qHc8ob5fJaH6ClRvj4=
Received: from MW4PR03CA0224.namprd03.prod.outlook.com (2603:10b6:303:b9::19)
 by CH2PR12MB4038.namprd12.prod.outlook.com (2603:10b6:610:7b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Tue, 27 Sep
 2022 17:24:45 +0000
Received: from CO1NAM11FT042.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b9:cafe::a8) by MW4PR03CA0224.outlook.office365.com
 (2603:10b6:303:b9::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25 via Frontend
 Transport; Tue, 27 Sep 2022 17:24:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT042.mail.protection.outlook.com (10.13.174.250) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Tue, 27 Sep 2022 17:24:44 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 27 Sep
 2022 12:24:39 -0500
From: Arvind Yadav <Arvind.Yadav@amd.com>
To: <Christian.Koenig@amd.com>, <andrey.grodzovsky@amd.com>,
 <shashank.sharma@amd.com>, <amaranath.somalapuram@amd.com>,
 <Arunpravin.PaneerSelvam@amd.com>, <sumit.semwal@linaro.org>,
 <gustavo@padovan.org>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/3] dma-buf: Remove the signaled bit status check
Date: Tue, 27 Sep 2022 22:54:07 +0530
Message-ID: <20220927172409.484061-2-Arvind.Yadav@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220927172409.484061-1-Arvind.Yadav@amd.com>
References: <20220927172409.484061-1-Arvind.Yadav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT042:EE_|CH2PR12MB4038:EE_
X-MS-Office365-Filtering-Correlation-Id: b8459f1e-f091-4377-0dbd-08daa0ad2b9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ByAt3uFis77yFoc7MO+Zh5+QaWb4kZz7GnTjw9CvrXNX5KJGD9+UygBroEylctxO6z1uS90xvk7tWr/FYeK9+4H+oAlAfEioUJ0CS+/O/GJMd+vgnJVoZbhmA8lxmGa4+mxfyO06CoB+xqXoauT+kqdp/HBcqarRpOhB/IgU+I6dc5CZ3sAH0qAVSJA8JOBdmdRL6GAvbCuNLV9XzJA26yfmoRgyPzPS4lkWgSJ6emyZeJ6V8NtucfMGHQR/lUHjh8myUenpIyRfcHwUWMgOlgM86VJ7q0kWlz1qADylcycoGf2863m+BUJRft2unptpS8rseYb24trFmr8p55DwoY09nGRfQZ22+BA6RcEUO5fn0QVm4oeOMQfJ0Z8O8LmW9AuLVHRUeAQJ6yn7K21+C30k+5jnBQEQeM6wZJqpJsyAlZtlnx4nFfX3vgRaGhsX41XTLLgcDno/PBySLaSHMdqVGdIegPIVmUwOXRdWWXsraydjPVotlQgSrYypCd81UFVnIgHVFsD1cgYJdLrXCncypdYpLhWgXM2JgjkLBlNT9YA4f3AupSODG95+av66HzP9e7i1k3mZbIULYJlmEtH75il5QMTi8eO2TKwnLU/BbPNajemt9SFP4KyliT5Rn1AJwNWDJdJNgMSjrJDI5wEE2F91VqnKOexSEJdho/SlvQbn/WP51/u/2c1SY8IY3PNZvCGVm5SJaUuVxbkQA+G+zksHYqBv7tiCWwGeWln5PUdcky7OhGKMK4WBlpsFAj7Pp6zXh7UQwZYZhZ75ELxOphjpT5N4kqi/KJgBYd6SeVQ626zAEP8r9w1y2/5gGCNvliaVkmkvjBz9NbvgZtIrjtQ0XQ7Mt92ow/GkA24=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(136003)(396003)(346002)(39860400002)(451199015)(46966006)(36840700001)(40470700004)(36756003)(7696005)(316002)(336012)(82740400003)(110136005)(16526019)(1076003)(186003)(8936002)(26005)(2616005)(36860700001)(86362001)(70586007)(2906002)(41300700001)(83380400001)(40480700001)(426003)(47076005)(8676002)(4326008)(70206006)(81166007)(4744005)(478600001)(40460700003)(82310400005)(5660300002)(356005)(6666004)(921005)(36900700001)(2101003)(83996005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 17:24:44.6036 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8459f1e-f091-4377-0dbd-08daa0ad2b9e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT042.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4038
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

Remove the extra signaled bit status check because
it is returning early when the fence is already signaled and
__dma_fence_enable_signaling is checking the status of signaled
bit again.

Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
---
 drivers/dma-buf/dma-fence.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index 406b4e26f538..11ef20f70ee0 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -648,11 +648,6 @@ int dma_fence_add_callback(struct dma_fence *fence, struct dma_fence_cb *cb,
 	if (WARN_ON(!fence || !func))
 		return -EINVAL;
 
-	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags)) {
-		INIT_LIST_HEAD(&cb->node);
-		return -ENOENT;
-	}
-
 	spin_lock_irqsave(fence->lock, flags);
 
 	if (__dma_fence_enable_signaling(fence)) {
-- 
2.25.1

