Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF9B5AE35D
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 10:46:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B003A10E5F2;
	Tue,  6 Sep 2022 08:46:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2053.outbound.protection.outlook.com [40.107.101.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4AF810E5F2;
 Tue,  6 Sep 2022 08:46:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I5O1yUpoe3ELpiHsXVBedsiEwtVqXuMaohLaiVhM4B/uSWXiyRNqWX0Qr2qGhnMmz8Yafaqc7mkdAKJo7BxVKUEqv4GBKBVqYwrDDk9Kzefi7L81+sJ/ZLpHCuFCrrLOIRVJnL8QV+CqrUEVxfC8Xi5vOYRt9khHrsA8f8cykWvKirhNnbF+Mc4QOqESKUJVRzq7USs3aKTSoaWNT4ZWP34YRycefGShwGPvyX4mX4Vp4JPFok53uKWYC/mxbjUU3qV5iWzJSEiCIyjg7eyQnPCN3ETfv2sn4LX2o4ylJNXML8FpCkCflJPbPv8OnfN9m8ytisbx3/IqeobjfQn6Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6QPLBU/eHcRnGJ/D+c/44QIeFauiGthEAYDVeWACFu4=;
 b=n2EjysMQn9wYVt2Ql3OsP+sEaiy915/HZcuUYhO43W8DjP53T18mlx9gRI+xqGlK7aW5pt7r5fss/3AlV4kPoztAclTfQkqx293cCHYakq3oqENCjMkxyN4zb1tpAl4ZiAO3eR77pLc8dBlVWkjVmyjc7q87+UMTZaP4GU0XFwwYaEBOWldNrB2ZItit3D2HtxqMliE7olyGnliD/VnbQ0ICYwUjtMaasHPvyY8Vx6Qy4S+yMSihgP5pUaIuObTXQz8kaVxjCNI4/SLUnV3avO0JHZEnuja4mvGzfq5YNmVBJejc8QHK/TvoPAtR8zTzovsFEfinh1CmaTJV2vb46A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6QPLBU/eHcRnGJ/D+c/44QIeFauiGthEAYDVeWACFu4=;
 b=pTFJUwwMEieJ8mHIkSzKp+kfEziTeUSgo/gJDSdcvwW/fZvTWxiuYOs0ron022hFoqxv8LlKnqINPHZBsfq3x3AzLePwmr02O7SMO2bxhXuXvj6zVWiVPfvN96mVdjYyUKRstK9omM55z0jJ3gr79KDBtxWnYr9egd807ez0Oxs=
Received: from DS7PR03CA0212.namprd03.prod.outlook.com (2603:10b6:5:3ba::7) by
 BN9PR12MB5065.namprd12.prod.outlook.com (2603:10b6:408:132::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Tue, 6 Sep
 2022 08:46:33 +0000
Received: from DM6NAM11FT101.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3ba:cafe::a8) by DS7PR03CA0212.outlook.office365.com
 (2603:10b6:5:3ba::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.17 via Frontend
 Transport; Tue, 6 Sep 2022 08:46:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT101.mail.protection.outlook.com (10.13.172.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5588.10 via Frontend Transport; Tue, 6 Sep 2022 08:46:32 +0000
Received: from amdoffice.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 6 Sep
 2022 03:46:30 -0500
From: ZhenGuo Yin <zhenguo.yin@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2] drm/ttm: update bulk move object of ghost BO
Date: Tue, 6 Sep 2022 16:46:19 +0800
Message-ID: <20220906084619.2545456-1-zhenguo.yin@amd.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c972730a-81ea-4288-481a-08da8fe44ccc
X-MS-TrafficTypeDiagnostic: BN9PR12MB5065:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ixixI7tEOG9xwu3J/JlxypCd0+1OkmhjCwKEKPbXxixtdI+sLFYKWLaTavTPqhhTirqQ5JZKwjOHap013DVXBn7c1qrK59tozfJZQYnsR4wbkYAk51SCxIaPLVJQfpFN6He0rIkbVE90vJiVPUjYjs7Re4a5/R1CEx7m4AbMwwh0w7FUo+ZaP3N6Y7jp2FC0zbpWB+nfqOo/d1kp5tP4q7De5azmKwg76+HY++OlYzRBUYsiKnqofKYfWh/tF3qD7Yi5YfmaOUjIrQDfO77Xj3hgFZzm55D9EuSF+jV7GYYyRUrSiT6T7mG78ATKu98QfX7Y54ro82mV21fuNK6DAZVh4vbdF3sH1l1dWjKnAawkh4AGQGjoHALndJ/WFPeir6FrTWpUKp44JMubhUVYCN3eCc7/JypXLLJuylpTO+G/6GPbyxYbVHuEysppZf0lSh81wFKP2p/8tZE56Gsnu1YFdU5jsdBWk1gDkNBau9whnqpo0uVErE/t0DYhgV8a+oBH12ld6l9SHL0ytlYsgitjtxBeAB/4n3ICXHacNCIAwBf2PAvgv/VHQURjUdR3ze8di4KiSKnXRQrmOHUtmh0W+UjwUyOQWiSaZQ9nuHG77E9vo6CQ9jbxoJkd7Ch/PlcsTjORguAnmZYO4pBu+SxgicRtycB2Jdk1hd0oCFQb4K70HcuREVaIwS2nkKbK9MyZlENV0SCpDtTBJ7tY56DBqXL4qccMiuRSmDP9e19VKKDY4lqpvpGVzBoN5jde2fd4AbJHDexG8mASZ8T6OSQArCnYI9iU3SSa40UEkAB50LHgVqYs+eZBREcZ2hNY
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(346002)(376002)(39860400002)(136003)(40470700004)(36840700001)(46966006)(40460700003)(82310400005)(316002)(40480700001)(54906003)(110136005)(86362001)(36756003)(82740400003)(2906002)(356005)(81166007)(426003)(36860700001)(5660300002)(8936002)(8676002)(70206006)(4326008)(83380400001)(336012)(70586007)(450100002)(16526019)(47076005)(2616005)(41300700001)(186003)(1076003)(6666004)(478600001)(26005)(7696005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 08:46:32.9180 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c972730a-81ea-4288-481a-08da8fe44ccc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT101.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5065
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
Cc: ZhenGuo Yin <zhenguo.yin@amd.com>, jingwen.chen2@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Why]
Ghost BO is released with non-empty bulk move object. There is a
warning trace:
WARNING: CPU: 19 PID: 1582 at ttm/ttm_bo.c:366 ttm_bo_release+0x2e1/0x2f0 [amdttm]
Call Trace:
  amddma_resv_reserve_fences+0x10d/0x1f0 [amdkcl]
  amdttm_bo_put+0x28/0x30 [amdttm]
  amdttm_bo_move_accel_cleanup+0x126/0x200 [amdttm]
  amdgpu_bo_move+0x1a8/0x770 [amdgpu]
  ttm_bo_handle_move_mem+0xb0/0x140 [amdttm]
  amdttm_bo_validate+0xbf/0x100 [amdttm]

[How]
The resource of ghost BO should be moved to LRU directly, instead of
using bulk move. The bulk move object of ghost BO should set to NULL
before function ttm_bo_move_to_lru_tail_unlocked.

v2: set bulk move to NULL manually if no resource associated with ghost BO

Fixed: 5b951e487fd6bf5f ("drm/ttm: fix bulk move handling v2")
Signed-off-by: ZhenGuo Yin <zhenguo.yin@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo_util.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 1cbfb00c1d65..57a27847206f 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -239,6 +239,9 @@ static int ttm_buffer_object_transfer(struct ttm_buffer_object *bo,
 	if (fbo->base.resource) {
 		ttm_resource_set_bo(fbo->base.resource, &fbo->base);
 		bo->resource = NULL;
+		ttm_bo_set_bulk_move(&fbo->base, NULL);
+	} else {
+		fbo->base.bulk_move = NULL;
 	}
 
 	dma_resv_init(&fbo->base.base._resv);
-- 
2.35.1

