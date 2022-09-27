Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B73C5ECAC0
	for <lists+dri-devel@lfdr.de>; Tue, 27 Sep 2022 19:25:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DADF10E041;
	Tue, 27 Sep 2022 17:25:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2041.outbound.protection.outlook.com [40.107.212.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACE0C10E085
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Sep 2022 17:24:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=guho5G/NH6Uu9NUxWGjhkF77HE9kSSuZnRLp6eRk7MxRSjvqQl0Yhw0ci7kmX1BZcS62AG+oWMxR4h78EU9Fdz0W9AGfgVQomT4RtteryyRYE/iPK78K/3to7iRtQvgT4loIxuyUS2FdX7ZU2o9XMxRlkhme7hGE6q8eWq/cogFRuWfupjV23gWCb8dwQg10gpA8ozKbnmqW/8BWX8yopFcgZdRnrIx6n16j2NuaTDY95Tifa7yZvCiPQIzfnCuxUYiOkJGzmAwJkgJFcP7O7KzvYIe+dZYIevYYGh8tcG/3e2Y5wOVmgf1oLzMYjNfvaTzNkLOaaHZEV0tIZcZHmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZxjL6udLV/T1l2yE4VhuGlIkYVYM5IUzlKBuY7TuvR0=;
 b=ci7l0hkU8RRgQ+lX1l3zWKlAZixQSJn2Xzy3b7Y5wHbXQu8TaYIzEDGCmqh1yNWQjd1pbyU5M8KzmR89uiQ8vpk0xI2KGrCZlumPtUsXa6lCDGu+OkfQ7M0+nHkx0AULa2tY5yXn0MM6aZvhtAQJIUJ5FXdjuONgEAw2uoUQIGYPm8QZOq/U7lD358Gcc8bVi0/5rNG0jY0ayzBY0Yl1eDEqffRROHsxpAEMnHGz61m8SuF6ldlPiKMD8l6hJdCsyhKg3MB/e9v1HH5+agaB6jhAY/u84Bx1mFbuSsckKb1v8ecsM2ZW6KnyTry1ek+Uuu3WHEMyvl7/Xp463Y4+3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZxjL6udLV/T1l2yE4VhuGlIkYVYM5IUzlKBuY7TuvR0=;
 b=5KpjGn737RF8cH5DLQLUBGS9Ii9dHKm4vO5JQ7gMHom+9bYOisSpuQMjqJcbWFwpXPZt/W23z3gU+C3WKId+fw2u+1JLcUjDL0SwaYbmJplWt903rNwjsk+N9G8v+GEEa/pL+K13XhOzBQT7Exb4Z+RGTWJ0BhWrpsQtIRUIceU=
Received: from MW4P223CA0029.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::34)
 by PH0PR12MB5450.namprd12.prod.outlook.com (2603:10b6:510:e8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26; Tue, 27 Sep
 2022 17:24:56 +0000
Received: from CO1NAM11FT039.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:80:cafe::61) by MW4P223CA0029.outlook.office365.com
 (2603:10b6:303:80::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.19 via Frontend
 Transport; Tue, 27 Sep 2022 17:24:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT039.mail.protection.outlook.com (10.13.174.110) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Tue, 27 Sep 2022 17:24:56 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 27 Sep
 2022 12:24:51 -0500
From: Arvind Yadav <Arvind.Yadav@amd.com>
To: <Christian.Koenig@amd.com>, <andrey.grodzovsky@amd.com>,
 <shashank.sharma@amd.com>, <amaranath.somalapuram@amd.com>,
 <Arunpravin.PaneerSelvam@amd.com>, <sumit.semwal@linaro.org>,
 <gustavo@padovan.org>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 3/3] dma-buf: Check status of enable-signaling bit on debug
Date: Tue, 27 Sep 2022 22:54:09 +0530
Message-ID: <20220927172409.484061-4-Arvind.Yadav@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220927172409.484061-1-Arvind.Yadav@amd.com>
References: <20220927172409.484061-1-Arvind.Yadav@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT039:EE_|PH0PR12MB5450:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bf6b998-fc9d-4ad3-f00d-08daa0ad3272
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y50vJD8GGXWyhmE+X+CQ/XcTz3zF4YmHs1Imndn0Z3CiRyuRiQ/UUx78fZvi6HinR2exwG3H8EAQmCLH3RNI5q9e5swuTMXx1qGwYjO+Y1kxHrcbkQ/Gx7Kpis7WeH4yBNDMaZT3iREvdK7BgcMuc+xjiy9CAo/9L13Ps26UKJTq88oJpB4x4q5zniqfO6N8UO7EkQxnzbVgc+ZT8YYqnBxjcaySCa+zVC3enCQWXGlXeFRezrKsWZAPPG+A4vh2kZlKm/cysgUQbXwyD8/Fd16QqiwoBGxta+cC1/i2K1GCop4Q1O1iM1csC+xF1vnhGgrJWO97V0o2REmSmqSkHSMafs9GUWAWSQisFO4vMrgY20svql2lmSNPqL+FsTZN8GCvtXZWE0Kio5SM7aZNPDBy5p71ZDQCe9xH7KdT2vlPL94vb7n/9qqHcpNlCCdtazFarvQ+RqsYG8+ybhWTh/v7SXalfC3Pk2Hhjb6KHeEKAdmCk5t6m3hhZaE1BwKaxyWks0Mw5btnyyNVJBWb9u5OxmWh8e79yRf2moZA2oxIxWbfsECKZMK81hmwMgQfjwWhwTbOLiP5yeLY59+czrWBGogzs91wYOAY4i37OazSUqnFaDw1qoh3Z2QIAxlEv9EeaEFEnubyxy/dxvZBzNFFRq+YHEYsmClC2ZFfzvIfGClPi1ZzyQgVk+/HNJQw1R71JKJ2j/LSPAH1S8iz8GOUe2xy2YfjdBHUPhz5rs5lfsUXqrA6iILSeqWujQpaB55IXrUy7ZK1zCWGw7vYAhu5UdAo4y18rGs78sAal4uq2IZcxQmxh6TkztrQvKqDxOmTHBmoyy2+dMDRrbHfEIh7GEF+X03cOcrFOiWantAbJQKLdlN5Am32P1e89/cO
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(396003)(39860400002)(136003)(451199015)(36840700001)(40470700004)(46966006)(2906002)(16526019)(186003)(1076003)(47076005)(83380400001)(356005)(86362001)(81166007)(82310400005)(2616005)(36756003)(40480700001)(921005)(82740400003)(4326008)(426003)(36860700001)(336012)(40460700003)(110136005)(478600001)(70586007)(8676002)(70206006)(316002)(26005)(5660300002)(41300700001)(6666004)(7696005)(8936002)(36900700001)(2101003)(83996005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 17:24:56.0651 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bf6b998-fc9d-4ad3-f00d-08daa0ad3272
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT039.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5450
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
the dma_fence_is_signaled_locked() function ever returns true.
Since drivers and implementations sometimes mess this up,
this ensures correct behaviour when DMABUF_DEBUG_ENABLE_SIGNALING
is used during debugging.
This should make any implementation bugs resulting in not
signaled fences much more obvious.

Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
---
 include/linux/dma-fence.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index 775cdc0b4f24..5156dc6be0a6 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -398,6 +398,11 @@ void dma_fence_enable_sw_signaling(struct dma_fence *fence);
 static inline bool
 dma_fence_is_signaled_locked(struct dma_fence *fence)
 {
+#ifdef CONFIG_DMABUF_DEBUG_ENABLE_SIGNALING
+	if (!test_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT, &fence->flags))
+		return false;
+#endif
+
 	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
 		return true;
 
-- 
2.25.1

