Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B84305AD79E
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 18:36:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 616E210E43D;
	Mon,  5 Sep 2022 16:35:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2059.outbound.protection.outlook.com [40.107.96.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 258EA10E436
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 16:35:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ACCm5RDwA+k6QZbmYzeWi10eTh7VWeQPC3l4V/3T6UIzcxAwp8fti9sL2jx+sog+804vNDHri7hNhVUMWJQPBvuxbXxXQZeFXFuVaqC/qWqliO5OWcMTah8l57sA2PN1eOJ1+/4LWPxBsVgHbFM3bMVuuqLo2XIRjIvNqr/5i37uwr3BLQlCiAxmeU69WbhytBfmw8qLTMIn1fEPNiDtBa23nDrbUUdk8W8ANIUyb+qo2xHwXjTdWZOEVnVD8fQ3/cBOcKUtuhyOx7jpzgX6Hea8M4+/vvSG6iSTsCryW01BkLXsKK8GaSaBLV70BvsLyVVT+i9SFdpJFK3SZ7310A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1SW65poqpuHHQckIRhIhpciTmFwZuUpATn81B7zZAxg=;
 b=mXztTWLWbX8mWgXVzkwG482jfkkjo88rBSAnW7tX5Wy5qFcpWBpnJ9/iXrAtHIjkuPyNQo63+/IrPZ3ZhXXn4ZFeb0Z8EEdjK8XKq/IDCh5WW81uO7uqjDH2AmGPl0HiqzyDGq9+ehQvgz6CFI5KmtwRqpqYpa3d/tVChDbwLbgSqP9eziJ8Lhtd8KMZKj21AACjwQU32he/4iah8qsogb+jgd9WQWNb3O3PH1NIgiN9HXWIkhdbQ015ieGYvX+OoLFToBSH4NQoXkipEHfnIMA4qocpGIcpKPxW8eoX9YKuIGZibflxeycRcBGkiRyJk/zB1BobTdkqceNBfCgh6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1SW65poqpuHHQckIRhIhpciTmFwZuUpATn81B7zZAxg=;
 b=fh1G2h7/cByJg8wRVsEkLmCjMEoJF1HuozjfMI0y1H+dnQaoc22Axdizt7GWRPMBP4iBex7dXUzjNworxATIe8SWGqhZXYlJxk3tCCYXb2z0GOVorqW+oXPeskxTkaDvLH+Cp2p+SvAFIIIL8dB+7OGadLOu/fHN1wgHH7wgZ1g=
Received: from BN9PR03CA0977.namprd03.prod.outlook.com (2603:10b6:408:109::22)
 by MW3PR12MB4491.namprd12.prod.outlook.com (2603:10b6:303:5c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Mon, 5 Sep
 2022 16:35:51 +0000
Received: from BL02EPF0000C406.namprd05.prod.outlook.com
 (2603:10b6:408:109:cafe::ae) by BN9PR03CA0977.outlook.office365.com
 (2603:10b6:408:109::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10 via Frontend
 Transport; Mon, 5 Sep 2022 16:35:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0000C406.mail.protection.outlook.com (10.167.241.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5612.11 via Frontend Transport; Mon, 5 Sep 2022 16:35:50 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 5 Sep
 2022 11:35:46 -0500
From: Arvind Yadav <Arvind.Yadav@amd.com>
To: <Christian.Koenig@amd.com>, <andrey.grodzovsky@amd.com>,
 <shashank.sharma@amd.com>, <amaranath.somalapuram@amd.com>,
 <Arunpravin.PaneerSelvam@amd.com>, <sumit.semwal@linaro.org>,
 <gustavo@padovan.org>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 2/4] dma-buf: enable signaling for the stub fence on debug
Date: Mon, 5 Sep 2022 22:05:00 +0530
Message-ID: <20220905163502.4032-3-Arvind.Yadav@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0000C406:EE_|MW3PR12MB4491:EE_
X-MS-Office365-Filtering-Correlation-Id: 9097f839-af40-43ba-768a-08da8f5cb1bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WsmxWOMlAexiZ1DGvvhBAVp863qrM+kcaJzOqQ5CKuhhnD9PXUuZRvUomri2cW4r8wsfk8pnAgITk9JHp8xJKJbJZOri3fiEGLDhezM/ajUbjas+WpfwTkqrLjFr8y23J3lzRaqnNBou+ER2VLxXcVO7ots/KcCgT7wW+cnQyEMe9LAXDIjv4SQq2paJ7A+O/61bwPtgOOT7zw6LSPPTAfKcx2TvVOMBcoaXsp4qsmhEPEaCgdq2WhmpvbpASynPlxa+4J2UyIfna9PJwwGzWkhciT7jIS5+pgupZj4iOLn9W1cKdrlx5BtmT2rTVgJ74XHyQ7HEGvRJMK0W6BQ8TuDYv+ymyJOa9AW190dHpUUeJfwTYpO2m/0HHdyqLe9zFSPGc46NGbh2VGT+l6Inu0UO2qVTs/apQ6dhTJHfNQeZgBNBE50TuO6aYuSVnj9jtlu54rdSEe2uYZZ/sHbE7nOArANcFaqVV5pjvaHck1MkXEz3QG0AqMTK94+DwbODU4N3nzyv6jLcOEggBYRj0oHwyeMbfluKSb/3uh7kSMWnZJit8dbHdw9N3PNXDO1i0jLpHxET2r3CyDOL1R35kCTQ+yCfiPr9ishGN3qx2Flo4Q0mDQJo8D4/gyu3qhrhs8D+su/D7RDdSRYC0Uz6Ufa+QxraX2KPYcke1jOOHzY9FDBMB+d1O2yqsaw4TZ6iYJ1kkqBpt3LWxqrvyinQTlsC4G812pJ81MX5fHz88FqnCo4S25B7DOzPSXmlPjb4yfe1bFcbbYTMEvLO0SpxQyiyjGPDsyV4AoDPPbtLTGzBLgzF4Ja3xLyr+ZIc8NlF7Y7mlqY55V0YCfSoB2e3gvPsoQMJpHEmMNCSka+zvo/4xFyzVNVy2FwxFwob1rEu
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(136003)(346002)(39860400002)(396003)(36840700001)(46966006)(40470700004)(40460700003)(83380400001)(82740400003)(36860700001)(7696005)(6666004)(26005)(47076005)(336012)(1076003)(186003)(16526019)(426003)(2616005)(36756003)(5660300002)(2906002)(70586007)(8936002)(40480700001)(82310400005)(81166007)(86362001)(110136005)(921005)(41300700001)(478600001)(70206006)(316002)(8676002)(356005)(4326008)(36900700001)(83996005)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 16:35:50.7598 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9097f839-af40-43ba-768a-08da8f5cb1bf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0000C406.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4491
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

Here's on debug enabling software signaling for the stub fence
which is always signaled. This fence should enable software
signaling otherwise the AMD GPU scheduler will cause a GPU reset
due to a GPU scheduler cleanup activity timeout.

Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
---

Changes in v1 :
1- Addressing Christian's comment to remove unnecessary callback.
2- Replacing CONFIG_DEBUG_WW_MUTEX_SLOWPATH instead of CONFIG_DEBUG_FS.
3- The version of this patch is also changed and previously
it was [PATCH 3/4]

---
 drivers/dma-buf/dma-fence.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index 066400ed8841..2378b12538c4 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -27,6 +27,10 @@ EXPORT_TRACEPOINT_SYMBOL(dma_fence_signaled);
 static DEFINE_SPINLOCK(dma_fence_stub_lock);
 static struct dma_fence dma_fence_stub;
 
+#ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
+static bool __dma_fence_enable_signaling(struct dma_fence *fence);
+#endif
+
 /*
  * fence context counter: each execution context should have its own
  * fence context, this allows checking if fences belong to the same
@@ -136,6 +140,9 @@ struct dma_fence *dma_fence_get_stub(void)
 			       &dma_fence_stub_ops,
 			       &dma_fence_stub_lock,
 			       0, 0);
+#ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
+		__dma_fence_enable_signaling(&dma_fence_stub);
+#endif
 		dma_fence_signal_locked(&dma_fence_stub);
 	}
 	spin_unlock(&dma_fence_stub_lock);
-- 
2.25.1

