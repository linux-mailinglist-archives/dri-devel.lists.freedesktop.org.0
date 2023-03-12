Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E472A6B65AC
	for <lists+dri-devel@lfdr.de>; Sun, 12 Mar 2023 13:02:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C50410E368;
	Sun, 12 Mar 2023 12:02:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20606.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8b::606])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C0F810E114;
 Sun, 12 Mar 2023 12:02:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BfZPUJ/B3HJSaWZSAN6avLqq+vfV2HR7hyAjwVdrXWeu/UOleniCAO7sGRz9rkWiMkd5WLKN0XqmGmNDw+UAnmbC7YoC6V1Y1uw7jXvOu55pw331yyEwjTNdATlxPETpqnlJ+/LyQK/lt2QRoKKyqATZ8LtmSp6Q5pKlTtAYAJpf7Fb0bO7ty/9f/EhS8dXoPlgLZvNxVMjGMSRBa062EfO1rwN+57E6fKRivvbcr0bNkZOgwnBnXc8xZZ7tzhorMw8WAgDf0WH/8laLjLjUcOk47gZM2ZxmXnYogbvy10N74O5r8Igiu+0Y+8KXWM8AR30oTkS6dDNEMvV9VgW6Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qEv7WzFyAvZ7dlaf6PHictVoky/OV/XaCF4pEssIZF0=;
 b=MBGi1mSmmJckLHpboYEI4H07AsPEBRGMSUZpzcKC9q1W3t2d2d2qdlWVwo3ZMbTjDRwob1zQyed8oUHsFHc/ZpaGSiybPmIbprst/5Gp6b3T/bhA0OTldMelffZPaaLDhlqa8dwSKi+eJM8Zm7a9CtNkyrMviB7xO2JsF6poz3ZtZSVSEJDulgIvcvvh7uzZELdBjZ7LMtVnfau5uCgaYapsjPcCKbYXMaP4Ren3aZrFWktEgXMJanOS88aLU+eg627EBHfqFQoSbtIxT2Y1OVh2CuZzVWjwoVqEqATArcwa2eFuTuo4CWmmWT+5v4b+s7Ycbi7v7Xhqks75ARnJqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qEv7WzFyAvZ7dlaf6PHictVoky/OV/XaCF4pEssIZF0=;
 b=Nxd1pC7PKX+qa7NOVrF0N/tPjEVr8w8yv/z+1kdWhUG0KHTR5XnLAD0SjI2CsxfbGukGU59DPzGALvaf7UNKNdUtJnFafVrMk38807OZG8TGikbyFGxPJ9BodxBNqfTcXsdL5tungrc4YAA45g7FbM4sZFcFnQPt98RqIHe4AwE=
Received: from MW4PR04CA0081.namprd04.prod.outlook.com (2603:10b6:303:6b::26)
 by CH0PR12MB8578.namprd12.prod.outlook.com (2603:10b6:610:18e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Sun, 12 Mar
 2023 12:02:23 +0000
Received: from CO1NAM11FT009.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:6b:cafe::cf) by MW4PR04CA0081.outlook.office365.com
 (2603:10b6:303:6b::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24 via Frontend
 Transport; Sun, 12 Mar 2023 12:02:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT009.mail.protection.outlook.com (10.13.175.61) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.23 via Frontend Transport; Sun, 12 Mar 2023 12:02:23 +0000
Received: from hr-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Sun, 12 Mar
 2023 07:02:19 -0500
From: Huang Rui <ray.huang@amd.com>
To: Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Oleksandr Tyshchenko
 <oleksandr_tyshchenko@epam.com>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
 <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
Subject: [RFC PATCH 1/5] x86/xen: disable swiotlb for xen pvh
Date: Sun, 12 Mar 2023 20:01:53 +0800
Message-ID: <20230312120157.452859-2-ray.huang@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230312120157.452859-1-ray.huang@amd.com>
References: <20230312120157.452859-1-ray.huang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT009:EE_|CH0PR12MB8578:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b5d0c5d-0f4e-415e-6dff-08db22f1a3ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uUZ1ncYNFXQ4JEqFhiNSwlF1CFQRyJiK/nmel3dt9i+GMx2sTO9j3VTu2uDiZCaYw6YzaAaIdbFb57BY4ezipAyIoFqcwH5qR87mRTww7hjeExah1W7yDapckzOTp5c/JOgCvecQoxAeDs2wKb8eMzF7LuvuMSaxyYQ46uGZlfX1odBUO0NPkE7IFznNhj2pQcVnc/UgDkpBLeT3g734e1qLyw41gbOHUNzgzSGzMfZzQ1wqr5HJAcoDr/KCdWtCB1hnwJk/dQXDUGD27OxImjkcJRus3LFops6ZBSDBtOPP8S6Y7iNGWAOm21uyKLn6V73RHEF4fZ/q8c8FNOdzPbaS43f7doYXmE0fxKTwqvdOoheJyiFYRZ923Oafi6+SnkRU1v30YanF4ynbmeeRnyFk34EinaQ6cHVsJBAI97Cp2LR/QJ64xb4A1T6VO6Xud6TDjmAznYIAm6In1KjBtwpv3oPfFcn57tKUtXmuEtkAsVsEa9Cq24LheVHsNCsP8X5hIoHJqjPh61veBg62YZ5+4bQAuptN6TPrz18mavJQuDmsoMmBpk76tvzizOEpOxauREjZbbEoaBU73gbjp+D3PDM4wcQ7sxfACBsllCX7wHNFlS/1aScnwWJ17N7sJ6ST1DKEr7KxNgpzDi8j9POCn2mP27XjfnXkLMa6Z4b9jFaY8On0a7hoBsdgyUhDWBN0+Qqqo9QCbrF3vXsyDrioQg451lt7BZCFi1h62xo=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(39860400002)(396003)(346002)(376002)(451199018)(40470700004)(46966006)(36840700001)(6666004)(7696005)(83380400001)(110136005)(316002)(81166007)(478600001)(36860700001)(54906003)(82310400005)(82740400003)(16526019)(8936002)(40480700001)(186003)(26005)(40460700003)(1076003)(36756003)(5660300002)(4326008)(7416002)(356005)(8676002)(336012)(47076005)(426003)(70206006)(70586007)(41300700001)(86362001)(2616005)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2023 12:02:23.3982 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b5d0c5d-0f4e-415e-6dff-08db22f1a3ec
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT009.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8578
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
Cc: Honglei Huang <honglei1.huang@amd.com>, Stewart
 Hildebrand <Stewart.Hildebrand@amd.com>, Huang Rui <ray.huang@amd.com>,
 Chen Jiqian <Jiqian.Chen@amd.com>, Xenia Ragiadakou <burzalodowa@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, Julia Zhang <julia.zhang@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Xen PVH is the paravirtualized mode and takes advantage of hardware
virtualization support when possible. It will using the hardware IOMMU
support instead of xen-swiotlb, so disable swiotlb if current domain is
Xen PVH.

Signed-off-by: Huang Rui <ray.huang@amd.com>
---
 arch/x86/kernel/pci-dma.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/pci-dma.c b/arch/x86/kernel/pci-dma.c
index 30bbe4abb5d6..f5c73dd18f2a 100644
--- a/arch/x86/kernel/pci-dma.c
+++ b/arch/x86/kernel/pci-dma.c
@@ -74,6 +74,12 @@ static inline void __init pci_swiotlb_detect(void)
 #ifdef CONFIG_SWIOTLB_XEN
 static void __init pci_xen_swiotlb_init(void)
 {
+	/* Xen PVH domain won't use swiotlb */
+	if (xen_pvh_domain()) {
+		x86_swiotlb_enable = false;
+		return;
+	}
+
 	if (!xen_initial_domain() && !x86_swiotlb_enable)
 		return;
 	x86_swiotlb_enable = true;
@@ -86,7 +92,7 @@ static void __init pci_xen_swiotlb_init(void)
 
 int pci_xen_swiotlb_init_late(void)
 {
-	if (dma_ops == &xen_swiotlb_dma_ops)
+	if (xen_pvh_domain() || dma_ops == &xen_swiotlb_dma_ops)
 		return 0;
 
 	/* we can work with the default swiotlb */
-- 
2.25.1

