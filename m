Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E638F5AD0DC
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 12:57:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FE4010E2D7;
	Mon,  5 Sep 2022 10:57:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2040.outbound.protection.outlook.com [40.107.93.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B996210E2D7
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 10:57:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aJAbKQBS/cKXobXmtnw6HAzlTsYepZx8AIg/+lQNJK/zux2WEONNkqFkuX+to+3s3VdnWyaff5tS4+tIzoqAwVXvFRb9m0C+BbrHJm3kIo0EI6XCRY56pF8Ls/OZnHAJyG0wFZTIJuLVLSFCts+1+vwtZ3+RoX1ovRQHmLWONBB4goTKolbt7vTCwlodCBBLVqlLLn7JQm86NrZ0NDKIK3fNKAEchly78jNGeQVTX3i6WAtKkUEWjJ0Z940CW7PowUhIRiUpLN2PDaZ8yTgBYYCSJ1nDVQqH/AdAng/yC+V6E15zaO8fL1cku5D8Cy9RFxMhl+Kza7Jxekz7CEacOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XrkgqnG4jmtIuG9iVKmai3er2XeGUfGvp122zWwXYFQ=;
 b=l4mmzP8E6UN2sPpcVTR+lsulr1ZJerphsMKgE7tcwqbNRtnmChlTbp4JuQVimVJxKqBHxTAp5kWaXuk1HP/30db0RR/Y1ep4FSs3kUOlvruQa+2sWUHvRkNPy5etvIHwY0128LfsHvKugG9Xv9mfoy2nY9n10pJD1hMvN5ByJkywpdenTiFaoio5189gq1SmwiupaE4bZzk6apJqsO0qBinseoEHVjYttjIEdISf6W1lsqJDDzzcJIyONuXgjHo5sF7GoSwQ2AAtSlWPGlIlYj611s37qWynokQ4JsgyVv+usAaWmrEpCLXVDN3wslMCKoO/01Z5dcR7yG9E+IArcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XrkgqnG4jmtIuG9iVKmai3er2XeGUfGvp122zWwXYFQ=;
 b=ASCar5MxXIlsGFr3QcQJbjmQyBEVV8qExwgwv47n4q0U4MR6yY/YkNVHH2i0/zzuEpeRh/5oMzEmQjMoA0ypeXmTORhZPd/pr9QzQNhCOwHUxSvbU88TdAMXnBvKyrVUcGrkgxqu/irij3Mg1bipPilkQArdiBBgBQjewnOrpZE=
Received: from DM6PR12CA0016.namprd12.prod.outlook.com (2603:10b6:5:1c0::29)
 by BY5PR12MB4164.namprd12.prod.outlook.com (2603:10b6:a03:207::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Mon, 5 Sep
 2022 10:57:42 +0000
Received: from DM6NAM11FT016.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1c0:cafe::bc) by DM6PR12CA0016.outlook.office365.com
 (2603:10b6:5:1c0::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10 via Frontend
 Transport; Mon, 5 Sep 2022 10:57:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT016.mail.protection.outlook.com (10.13.173.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5588.10 via Frontend Transport; Mon, 5 Sep 2022 10:57:42 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 5 Sep
 2022 05:57:37 -0500
From: Arvind Yadav <Arvind.Yadav@amd.com>
To: <Christian.Koenig@amd.com>, <andrey.grodzovsky@amd.com>,
 <shashank.sharma@amd.com>, <amaranath.somalapuram@amd.com>,
 <Arunpravin.PaneerSelvam@amd.com>, <sumit.semwal@linaro.org>,
 <gustavo@padovan.org>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/4] dma-buf: To check enable signaling before signaled
Date: Mon, 5 Sep 2022 16:26:49 +0530
Message-ID: <20220905105653.13670-1-Arvind.Yadav@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7470613f-5454-41c1-5bdd-08da8f2d74bf
X-MS-TrafficTypeDiagnostic: BY5PR12MB4164:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K9ub2N6o3hV89xbKbc7H3FINkAhdjUby1yYlZgI9hLplOTEm+w6NM27zAKZeBataLqe7tWBcM2dYFD10AdB+dzpaOkvBczZTxGbFsqpii8Fs/uw9WS9hjlMCWGTTPZ6zEEnCKkdSwXT7rzGzSNMCntKKiQzmGjrs3rTWTQWUiGvzWAGk0XKUJfqkoGwxMm8/MlXhDfNWdeRfrUrDZMfp7XMJ/MZeNAhs1ZYSZPUHSbVRnX9XFRPI9BgSI2OuFf0t+i8SDdNaRWM2uhaBeQR6mUu53z4BFhfsTvBU2+2AGwA3soFwp5iTuKGzOUUhHxECXwsG+FVUSwT/VWo8ub1dQHQyzND34fJZ68pY3CgrhWq9fwgPlSccFWUlIu5NtsLDvy2kCzqr9YOjpaz7zKfPCkkffdEvpPJ/3Xt9QUzWAf6zTGPnsE6ElE1alROuaaDqpEAE6p+sf4kwmdUCJOzfH7B41wmTwG0MHWm3d3Rz75j28yYgNEpGBJ3LiK6rYlhhAmCho+sfhctGl5p/iawUt8W49Jj/HeHIHgm8eW6YFvfHvKaoQ/fxCddX7K4148wvmT4/jZPui9bB/Ykk2GqH0GzG+8h72rxeCxRGmGYqLKNYFuQZQma8WH6xpq3QzOa+taa4PSfFUR/ylYmvUjlCGUIp0+sey6U78ttm4UxNUuET6MdxYQJQdK+NPKlj+J130DdDwgRHkcVRKUhUU+gCyqr1mmeeBPigGDaAb2USR2qsnFAjq1B7O//TYJbf8kJUpE+IVjEkv2a0GJkSPvuwBaeUT0LVsMBPcq0bxUNzvicMCB7oCnr10GzDs213WXs5tKuTQrMPkgJwn4HPNRpvdbNNwf/gvtE7oCcUVqS8myBTMwr4o5hA3OmJLBBq7Qz7
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(346002)(376002)(396003)(136003)(40470700004)(36840700001)(46966006)(4326008)(8676002)(83380400001)(336012)(70206006)(47076005)(426003)(16526019)(70586007)(8936002)(5660300002)(36860700001)(478600001)(26005)(7696005)(6666004)(41300700001)(1076003)(186003)(2616005)(82310400005)(316002)(110136005)(86362001)(40480700001)(40460700003)(36756003)(356005)(921005)(81166007)(82740400003)(2906002)(83996005)(2101003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 10:57:42.0407 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7470613f-5454-41c1-5bdd-08da8f2d74bf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT016.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4164
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

TTM, GEM, DRM or the core DMA-buf framework are needs
to enable software signaling before the fence is signaled.
The core DMA-buf framework software can forget to call
enable_signaling before the fence is signaled. It means
framework code can forget to call dma_fence_enable_sw_signaling()
before calling dma_fence_is_signaled(). To avoid this scenario
on debug kernel, check the DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT bit
status before checking the MA_FENCE_FLAG_SIGNALED_BIT bit status
to confirm that software signaling is enabled. 


Arvind Yadav (4):
  dma-buf: Check status of enable-signaling bit on debug
  drm/sched: Add callback and enable signaling on debug
  dma-buf: Add callback and enable signaling on debug
  dma-buf: Add callback and enable signaling on debug

 drivers/dma-buf/dma-fence.c             | 17 ++++++++
 drivers/dma-buf/st-dma-fence-chain.c    | 17 ++++++++
 drivers/dma-buf/st-dma-fence-unwrap.c   | 54 +++++++++++++++++++++++++
 drivers/dma-buf/st-dma-fence.c          | 34 +++++++++++++++-
 drivers/dma-buf/st-dma-resv.c           | 30 ++++++++++++++
 drivers/gpu/drm/scheduler/sched_fence.c | 12 ++++++
 drivers/gpu/drm/scheduler/sched_main.c  |  4 +-
 include/linux/dma-fence.h               |  5 +++
 8 files changed, 171 insertions(+), 2 deletions(-)

-- 
2.25.1

