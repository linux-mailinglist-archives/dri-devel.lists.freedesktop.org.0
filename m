Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B421E5AD7A0
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 18:36:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E689B10E443;
	Mon,  5 Sep 2022 16:36:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2056.outbound.protection.outlook.com [40.107.93.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E873C10E441
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 16:36:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RfZFWBXBH+9k+iceZvmiSDP/z6QexFExSUZQMn3yNAqLrFA8mh9xxvSWCSUjbFqjoAzh6VO/WRj2B6ed5NNbCT3OT62LQdSvB9ed/fipq5Exl+6EVisouwg5yACJKT+CuX9iwUe075nXUJuPpq3A79REn1VosLevoCMFeZhEcg8e+blqZviE47c7+j3Mq9YLo64jyv1NrM+zYekfHEW+wn1fmtFjK6/0nqUeXSDhc0hmc7ZEUI7Rv06ardjnfNWXNmQlmqKgDNwGRrowypMiTzYsZz9LU6IkkGfe+lHOKjM6w+CKpd/Maa8O7TENeVe2wqVrJMlnyJcOXkzxbL9bSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mUwfcN9RcBMlXB7kfzU9FSQfgic2GMfc2+p1zM/Mva8=;
 b=OxeNNucDEG8DiDbeEkPuvR+DXW1Ozw+2d+gWG+RpbVAmETmfj+52g0QVdlp1PRkqGuyi0sa8X/t5tiioWtDuhNnjT3zhIYjO0mXHNkB67ynnlmGnQ0OoArgcT96dm9nrai0Jn5Qs5cUkuk28llACaTnoLUlRjCmMblDltwaIIvtCHIvQHX3V0/tMFDAATjJJrLThdwP5cnMr441YHmU3Qpqga6vYRC2RTmHvMggALanEIn/pwNn2P6j6wYPuAvueDvHqE86Zr4JyTaxKD9FE5eJtcl5Y677bnnKwHfesYGpnLXT8M0PjoF9KzbLOasg1qTrWpGDwe4iEYrvxQu8wYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mUwfcN9RcBMlXB7kfzU9FSQfgic2GMfc2+p1zM/Mva8=;
 b=UE3Jy/qR8ShUZh6/an4k8bXWONNYGBnjdumHZF7dZC90lUsrH82HGwPUF9Cm8wal7Pi4h6EcvP+h1W7/BZT9IGqaW5f8fiZEs2XK/cCipLBlFOb2wgKNFNo/Txu9yYNI3wMh5yhxB3laJewZCgfHTSL7pOhbJ5rsdRvu+I8LHlY=
Received: from BLAPR03CA0146.namprd03.prod.outlook.com (2603:10b6:208:32e::31)
 by DM4PR12MB6469.namprd12.prod.outlook.com (2603:10b6:8:b6::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.16; Mon, 5 Sep 2022 16:36:05 +0000
Received: from BL02EPF0000C405.namprd05.prod.outlook.com
 (2603:10b6:208:32e:cafe::77) by BLAPR03CA0146.outlook.office365.com
 (2603:10b6:208:32e::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.13 via Frontend
 Transport; Mon, 5 Sep 2022 16:36:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0000C405.mail.protection.outlook.com (10.167.241.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5612.10 via Frontend Transport; Mon, 5 Sep 2022 16:36:04 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 5 Sep
 2022 11:36:00 -0500
From: Arvind Yadav <Arvind.Yadav@amd.com>
To: <Christian.Koenig@amd.com>, <andrey.grodzovsky@amd.com>,
 <shashank.sharma@amd.com>, <amaranath.somalapuram@amd.com>,
 <Arunpravin.PaneerSelvam@amd.com>, <sumit.semwal@linaro.org>,
 <gustavo@padovan.org>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 4/4] dma-buf: Check status of enable-signaling bit on debug
Date: Mon, 5 Sep 2022 22:05:02 +0530
Message-ID: <20220905163502.4032-5-Arvind.Yadav@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220905163502.4032-1-Arvind.Yadav@amd.com>
References: <20220905163502.4032-1-Arvind.Yadav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000C405:EE_|DM4PR12MB6469:EE_
X-MS-Office365-Filtering-Correlation-Id: fc92a4e0-66a1-464e-09b3-08da8f5cba32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7Lwfi/Mp2BbF+qBU4kt6QFUW/krNuRT1yQo9+h69HQBnjPwcJLOWeqURq2Ft1ZgdWkN6KuKlF5yIQNpmA0tICmbYlV/Il6JDi1yciccMLEHIX66CcopuzkX9s3wSSkTyx9ESLvyZDR7lM0jgDQwRvzdTJM1zYix8NGsaAqtIAkYnazxT6nRjxoWdYnxk7mGUNwTbxOT8bT9FIBYSfcXMt7wJpoI5uGLhu5aIwts4AKnrqenBuASaV3aobU75tljzipf5pXPRFqcxArmDwFWRHvPEKVn8M735e+Cv0OJlzgfv4C7lGY/NKxMtJlSZD6bFHWT6TX4HhIlf11+zKuicX9Onz3mPfIL0rx8nuBVYECOMC6UkhEqNQWbWng1ox39K1RDGdPqf5/ruViFO22tHeTetv2GUpCodWcDNRNBuK7U7VWn/EmnrnRM6zygeH/NaY4sXOch1Qwkb/3heqKf7YXffbG7WoEo1+/qpuBatadLjUYGtP6kT4zqiLjdWIw8N9rpleGAY8Metreti2kgALp9WKrEaandpVK1dTcwIR0envNkOOlocslc6q1oo1PTbfx5kqI1jokxWOgFB54P82fCe72xbdGsMFAN7lW0SBPkkbenfj+ZY9cDPfdN9+TQ+gkalCEblAelKSG11TXF3hJhZtjKgcfiBnlWXTajwSlo+byu9Knba109VVRFx+o10C6t1h1F3otao2rLdMMGJXgNVVT3o3AM+8Rv6vjis1UnrsaaDP7Hlr2u3WHUEEb/9zrqjdcPjxLD7Q5fNlm5BN2q/UYmkT8J5zbSAyyPr1pxezLYQPxrM0RObDXoMqAZIn42X6tLcfpNqvTwyZPIe8vHRETi9fSJUv371vvKOEIFZDnQ30xfemge7JoIkfqer
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(376002)(136003)(346002)(39860400002)(40470700004)(36840700001)(46966006)(70586007)(316002)(110136005)(2906002)(70206006)(478600001)(81166007)(356005)(36756003)(921005)(86362001)(82740400003)(4326008)(336012)(36860700001)(47076005)(426003)(41300700001)(40460700003)(1076003)(2616005)(26005)(7696005)(16526019)(5660300002)(186003)(82310400005)(40480700001)(8676002)(83380400001)(8936002)(83996005)(36900700001)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 16:36:04.9168 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc92a4e0-66a1-464e-09b3-08da8f5cba32
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0000C405.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6469
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

The core DMA-buf framework needs to enable signaling
before the fence is signaled. The core DMA-buf framework
can forget to enable signaling before the fence is signaled.
To avoid this scenario on the debug kernel, check the
DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT status bit before checking
the signaling bit status to confirm that enable_signaling
is enabled.

Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
---

Changes in v1 :
1- Addressing Christian's comment to replace
CONFIG_DEBUG_WW_MUTEX_SLOWPATH instead of CONFIG_DEBUG_FS.
2- As per Christian's comment moving this patch at last so
The version of this patch is also changed and previously
it was [PATCH 1/4]


---
 include/linux/dma-fence.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index 775cdc0b4f24..ba1ddc14c5d4 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -428,6 +428,11 @@ dma_fence_is_signaled_locked(struct dma_fence *fence)
 static inline bool
 dma_fence_is_signaled(struct dma_fence *fence)
 {
+#ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
+	if (!test_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT, &fence->flags))
+		return false;
+#endif
+
 	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
 		return true;
 
-- 
2.25.1

