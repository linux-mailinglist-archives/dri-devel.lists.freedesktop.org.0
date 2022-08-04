Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 496BB589B97
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 14:21:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC4F997317;
	Thu,  4 Aug 2022 12:21:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2069.outbound.protection.outlook.com [40.107.102.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84FE091B22;
 Thu,  4 Aug 2022 12:20:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b3HFy4FCiDMrpuL+4fUeSyVik0vw1GRrpDr8726FZQDWQOGP8mo6ChNdB4D5IJj9CuBepfcfeYq/cY9RxXyghctZoCnRxuYfJUpVUbaMRJFllWclP+oIHtJk1muZRuLEHH2tanwLuPpw8TxI/N1QzC4b8DPtKm811Alxu6KhJBsb2znYGO0XHuBTbCwBkBu04EwdalwCuvLyeFKN5MqvwkAXTRz19JzYvvQLgohM4gV+eKLlBQKEthuzU+yV/yCLuU9STeiQd0MQyLydiGcfr0+qRSUcX/O15QFg+ckVXF/V0DxjG2X4qsV1qVNsgzLOZbiZkervvLishes69DMsww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LNG2HOCzmu9ukuOyisfgnQMqREmpbUTXSLRUO1g9esU=;
 b=lGoyg2y7Q6nCzXvoAh51BP7EEEhjxOapMRW3no9zLsbzWN4EA+DFltjnnZWW2PD9YCGMu2pNQ9SXooAC+Hbt9nFFE1NaPZ4IA2tkELYC3nQd8libWwmFXDjcrPRHOAZQRo2hryl70eFhfDSFS2/dB07Pmd2ApEpSoOyDRrvIxP2NuvSKCZZgz3n1Spj9t7yaEk/dQmAXLGCe9Y2fQIObErEAMKrnlg60rztTjviiNkzEKqGiypWRxLoWEnFSs03WiJYUUTgSZ6zwUf/T5KiWGpdc0OAike8bjzigVuew42kra1gPTQreCcP7dulCmMJCHbOQzO7771gj9H1aONSZzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LNG2HOCzmu9ukuOyisfgnQMqREmpbUTXSLRUO1g9esU=;
 b=iEC7X/3WyTkaLpiFoWZyZmoyZFbWK4hWZrBUGIi2SikEuLhZmqyNchTgZc95CiSyAaYY7mjS4BWn7a3faGuyZLwD+OrJ9m94L9bqYt7Yq0e2ZqEGTStHAk0HtEC7u20Vby68O8hq694WrKUxAu1hUqlBEmMe9HH1PO+hBjf/e8c=
Received: from BN0PR04CA0210.namprd04.prod.outlook.com (2603:10b6:408:e9::35)
 by DM6PR12MB4601.namprd12.prod.outlook.com (2603:10b6:5:163::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Thu, 4 Aug
 2022 12:20:47 +0000
Received: from BN8NAM11FT044.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e9:cafe::1) by BN0PR04CA0210.outlook.office365.com
 (2603:10b6:408:e9::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.12 via Frontend
 Transport; Thu, 4 Aug 2022 12:20:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT044.mail.protection.outlook.com (10.13.177.219) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5504.14 via Frontend Transport; Thu, 4 Aug 2022 12:20:46 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 4 Aug 2022 07:20:42 -0500
From: Arvind Yadav <Arvind.Yadav@amd.com>
To: <Christian.Koenig@amd.com>, <andrey.grodzovsky@amd.com>,
 <shashank.sharma@amd.com>, <amaranath.somalapuram@amd.com>,
 <Luben.Tuikov@amd.com>, <Alexander.Deucher@amd.com>,
 <sumit.semwal@linaro.org>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
 <linux-kernel@vger.kernel.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH RFC] dma-buf: To check DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT status
 on debug
Date: Thu, 4 Aug 2022 17:49:38 +0530
Message-ID: <20220804121938.622630-1-Arvind.Yadav@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 248535c8-f8f8-46d6-8cd1-08da7613c2be
X-MS-TrafficTypeDiagnostic: DM6PR12MB4601:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iw6iWsy/Ffnfr8atDGAVam2ylH10Tvv/utjPhT48d3UK1q8ti+G6uJrajR1cjA4BUIwgHKBYk7GMFoA1lbdO8IlFJgdfAQkH2UmAFjTae0IztMn/WK6zyCDifiBku3ZnGuZmrdL6cpNgkjkkJWVwK78FAGMbEauEOKtchjyOLm5DoANdPUgxnFdq1Ikm+IQ0bCQpi/SvPusE89V1uVKyhcfawHLNRkDEg/D6TSusItfTURBk6Gt9JoIsEJhNzFy8DzFaWpVmdpczkpZt/DZmKARxxI9c4svNHFY5TUdnp+TO4nCM/U1dihsJdjz2+mYme2mK15yZdFMbrRnWqTUmUMV32t1SB8c40B1F9B8ew72DqO/gFvTyIqYUgNWUYjcWLENqXrelJPA7ZijewlW2n27Q1B8pdpTCuGrsw2wDp2+2L1k5sXNHIV0StCaZlUEaq/i+mcX5ou6cOkG1n1ttuxRfXcBvX9YTyCdzP1GufFMDKVl6tMBHW9n1XQT/ll1OOPnyDgoQviPWH8Hu5HoDRYMZkfYjdVg5L5Cmtn5/SSyGaIPKEiTg7Va2ZCOA5iMO1LjRmfPL0hbMyJmRciJmqsqokWrVd217muyo7rIQQQKdEZGbno8uEg6hNIv+lYTJifFcI50YgGb/DTWOCgbtH400hspSIohJpa2J8bNUjgaRaEYmtkS44JYGvgTqXw+HN2wNIfZqAbIvO0U+dHYMKOhHZPuqBL0e/nKqbTM1QkHIlDTQds2VO8VLg1faxhj7L27PHcNsMW/pfq/tRkAotJPTuEV5qEJkDa2qsR2zRW3PgWQdMfTHkhovWEVpM1wh0HlFspgT8MDrWuHZ4NpZklEy3kEL2TFEYfPkr2OuJLm7lBSDxg3JM5oVNMKj6LV7ZiyC39irNPQ2eLggNojQcQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(136003)(39860400002)(376002)(396003)(40470700004)(46966006)(36840700001)(921005)(356005)(86362001)(83380400001)(70206006)(40460700003)(81166007)(70586007)(8676002)(40480700001)(36860700001)(4326008)(82740400003)(110136005)(2906002)(316002)(5660300002)(8936002)(2616005)(1076003)(26005)(47076005)(336012)(6666004)(7696005)(426003)(16526019)(186003)(82310400005)(478600001)(41300700001)(4744005)(36756003)(2101003)(83996005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2022 12:20:46.9289 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 248535c8-f8f8-46d6-8cd1-08da7613c2be
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT044.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4601
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

If core DMA-buf framework forgets to call dma_fence_enable_signaling()
before calling the dma_fence_is_signaled(). To handle this scenario on
debug kernel the DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT needs to be checked
before checking the actual signaling status.

Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
---
 include/linux/dma-fence.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index 775cdc0b4f24..7c95c8d5e5f5 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -428,6 +428,10 @@ dma_fence_is_signaled_locked(struct dma_fence *fence)
 static inline bool
 dma_fence_is_signaled(struct dma_fence *fence)
 {
+#ifdef CONFIG_DEBUG_FS
+	if (test_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT, &fence->flags))
+		return true;
+#endif
 	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
 		return true;
 
-- 
2.25.1

