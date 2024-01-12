Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7C882C80C
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jan 2024 00:42:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AFF210E948;
	Fri, 12 Jan 2024 23:42:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::600])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E4F610E948
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 23:42:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dDfDn3xvyIo8HluKk2Ab9Lag22eavNuUdWIZcz7/s2wbibkUUj+2hrEo5uEAEq38r+HCG1ByHN2otBlycy88oGCSvptHIFlTykraMToeOlcd8jwq0rjDrhrgf1nfioZifvE0Ir4QPUP5iqJ4PVVFYoEnNwOuyh9nv/Uq41Jufoy7i8fp308iHfGzW8aU/hSkMKnRhkgLt0shbDD2MK6EK5olwERe4+MeCXFxGae9IQBP6KzkGVZgmEbb3ZowqVFK7b4a1mGgn1hBkeNx1oaCFhmc7ly6BOXm+6dxTVxlVeQbchtawgAYco0eBQe138hyCCgCWbUwAbKEpvc2AniP3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qE5Bjq67QTLmRgLZKvMj0CnuE/VVuNA3xIZWfiuRpjI=;
 b=m84lewFM9v4VadHdIitAWlrupKoYTaYaPSxvDVeicFSVDwZpQMu6jAwPjDUpcW+gWtsbz2JQm2cCNVhODTMEg9LKE6WD25Pw68HSd4G9glV/YM0ScKSXsNuuvGqRu49DD9uGCESh+fS8aFGJCESMt9VY+q2Ka0JdQdAPEz5ucpw4I4EJVpe9nh9HeodLx1ouX9ocjuz+spo+AHpeRwHl+PNQXzT45NeHhKJeeWcP5sxOWACefXPUQQ5OLhXfF7mH83FKpLiBt9QxYf4v5l5b6jBB6UWqsxcv+YpEo+adpbo1lunL/p6kBPCSY+R0FQTzajIwTPgPSqONm+CDGd++3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qE5Bjq67QTLmRgLZKvMj0CnuE/VVuNA3xIZWfiuRpjI=;
 b=lfnUqRrkPIAvRnApCkRfEVnkP408vEkXF5TbNjIoQ9TLF3jjoCTWNCinzNocGR9L/6snRFZDzi82KE+bMTU2xeEnVKQgLxnGBv3T/Z7DBQ1k/9Sai9kTYQ+YSeKCWIemzBZBR64djtY1jPsbvlvZQ4KFmiyxRhNgYX/UoGkyLLM=
Received: from PH0PR07CA0005.namprd07.prod.outlook.com (2603:10b6:510:5::10)
 by LV2PR12MB5967.namprd12.prod.outlook.com (2603:10b6:408:170::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.19; Fri, 12 Jan
 2024 23:42:25 +0000
Received: from SN1PEPF000252A1.namprd05.prod.outlook.com
 (2603:10b6:510:5:cafe::11) by PH0PR07CA0005.outlook.office365.com
 (2603:10b6:510:5::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.21 via Frontend
 Transport; Fri, 12 Jan 2024 23:42:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000252A1.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7181.13 via Frontend Transport; Fri, 12 Jan 2024 23:42:25 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 12 Jan
 2024 17:42:24 -0600
Received: from xsjanatoliy50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via
 Frontend Transport; Fri, 12 Jan 2024 17:42:23 -0600
From: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
To: <laurent.pinchart@ideasonboard.com>, <maarten.lankhorst@linux.intel.com>, 
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <michal.simek@amd.com>, <dri-devel@lists.freedesktop.org>, 
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/4] drm: xlnx: zynqmp_dpsub: Make drm bridge discoverable
Date: Fri, 12 Jan 2024 15:42:19 -0800
Message-ID: <20240112234222.913138-2-anatoliy.klymenko@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240112234222.913138-1-anatoliy.klymenko@amd.com>
References: <20240112234222.913138-1-anatoliy.klymenko@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A1:EE_|LV2PR12MB5967:EE_
X-MS-Office365-Filtering-Correlation-Id: d1a85eb4-920f-47ab-7385-08dc13c82133
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: izm8DkGOuZOgdcbXjsph37DJtWLIqR0EHnCdsXlpUh2oGUnkTXZe6VNkVlhMlGrskutlVTe6RT9+GQpRQvsxZpGZ3zCG3zpczTyFweArpjjwxBFVApDFBRr0LjRUcBHjdX5is3F2+bCS+Ezm/Ow+5IWPvjglDAtBB/NauDSnRyWvY0DJamz7xgcf0/GKj9y+aCOjFLa1DDD41S/YW2+TTME0nhRtorjYgide0PMtE/VtxMiK6DIkZWnfn2ilm8/NpEFlqu/33/l6Vvpt27SMSumJzBfxoKuCn776q7sn8ZDlM7nzuw5qRJjg2aNEnxb5ZKKgR51SzX6OsVrDiqYr20y4tu+zYRTtzjMwHT4p3eJhW6FrfpK/xCaoWZRjY3UQt7ZhmQMFD95JI8KwTwOXxTfh/8OiqYTNxFwnWfzWGSwE3gr1nTJjmPDFpNGOVv+U0Kwt7/1rPd1GkGceg8uYnmAeiNaKhUesd7ND0d7FEgLDLb3trdDpssimw6RRvu4PFEPLf03QTHyqG1mp0JQlUn1EaOmNEOFa3MhZiNBJAm/TabGq/5IIkBAk9412DT383o0blb4xB+UAjKILnBbYAfOU2kEZ9aNQNYIrabl14TdmC/78Y3AYvaWuCcXEJxUZ2UOsevPBlq292iIXHQQMkS1MF1XlVrtsIB0qISf3NI/8dpzQ321i3D0TsRyfqppdkGhctyfko22sIQQHUcBIj9nthYSnXU3ImmGYLYN34xnPqLoWOQBnGjwd1qNf7WrozHLy1qMtR+QD031Uy0rXCesfVOE7xuJUXZMehEkOU1RtDu8cac7NjKf4Xkc6+JQYmTjF+L9UF1WCQ7gWfGH0rA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(396003)(39860400002)(376002)(136003)(346002)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(82310400011)(46966006)(36840700001)(40470700004)(81166007)(356005)(86362001)(82740400003)(36756003)(36860700001)(41300700001)(921011)(83380400001)(336012)(1076003)(26005)(2616005)(426003)(47076005)(478600001)(6666004)(8676002)(8936002)(5660300002)(44832011)(70586007)(70206006)(40480700001)(40460700003)(316002)(2906002)(4744005)(110136005)(83996005)(36900700001)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2024 23:42:25.0549 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1a85eb4-920f-47ab-7385-08dc13c82133
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5967
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Assign device of node to bridge prior registering it. This will
make said bridge discoverable by separate crtc driver.

Signed-off-by: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
---
 drivers/gpu/drm/xlnx/zynqmp_dp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index a0606fab0e22..d60b7431603f 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -1721,6 +1721,7 @@ int zynqmp_dp_probe(struct zynqmp_dpsub *dpsub)
 	bridge->ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID
 		    | DRM_BRIDGE_OP_HPD;
 	bridge->type = DRM_MODE_CONNECTOR_DisplayPort;
+	bridge->of_node = dp->dev->of_node;
 	dpsub->bridge = bridge;
 
 	/*
-- 
2.25.1

