Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE20832D37
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 17:34:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A813B10EA61;
	Fri, 19 Jan 2024 16:33:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2062.outbound.protection.outlook.com [40.107.100.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72E7010EA5B
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 16:33:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gjqV5aiZAZOfJJe7f+UTFPnrMWafvtiZ1/SCpso5AtXZKZtBuHA47eE+dd8OM8ap59u8NAvyP+Y5GJFKctDU4j/jfc49GAiwMrZwSQVLiV4qqWBgyPgz51ibz0baJ39aeJ49w/sIXFK9N8VqD5l1mgWoxR377Hjnolf2o+lnm+hucKc5pyu/+MrUAnFZguEK3U+2vMCwVykRLEEdTNzUC5YAuyzyUnRLD98Is9z1SPvGZE1/utLtHfs9PSnpPfrOok/a9FIN49CkfX4Amy3cgW7Lu6WZFHb9zqSHpj5KDzoSHltDww+W3tdXbkgJ/yAiP30zX7/zmgR09dGk+wEFGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e3yq0bbbOLzlUELDFANfh9F1CbUuuu25jjuJupmDrDo=;
 b=mwKdAEwmGhdJEDQHmZKfruzEUeUvCL/F/0tW0mM1XWKhjOkET15WS6EsCdz5gqIThzsIgxE29d6p7j4kKkS5XDW6N7bRQURy2Jk52iFybDKQAnuvRWz6cpk0zLZU3Vz7y1pqjFScuUCPgV4B/ZhaS+fys8qm/rsnJYVUymEvWDJJbT9s7QvQOigrAdLSeoLtfKpfxgHelJzToNh3GOdCSVWCADRvJVjZWQ+7yc+jhxwwU0MjUt890ZPSg8lT/R1MVO2+yTwCQefNoKVzKlQAXvAzzHaMNx1Y/eabGvPq2ED7Lt28UPuEW74PF5L1YkOoVzPar3j69vNVaU9ZUr4ppg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e3yq0bbbOLzlUELDFANfh9F1CbUuuu25jjuJupmDrDo=;
 b=IoIsxTY/wywEwFFkIWerkhhzE4yKPTzCTtApbI/nKbp1lQ4WxjU8t/qsR8yXdzB7hiXvmqCU2iEIurruHT8joQJPt7YhnjLh3kivp2fLemYvOc32ELrtCP2ka6cG24XOrTB+Vj5g/kQv4pRbpFmOuQlPvorh+OyO128rw0CJuruWaKyVAsDGR/80mAaYowrCyWn/xyhImRW+XrjF4c4d/JNgtWUvU+zosXsrEYLg2QpGQ4Uj/eKbEcEaOeHjYGS58cRcK1Czi1ibXHPkqWNzBc4LZIidaH2NlmfV9mvOiibCDoppFgYph3gJ/s7Bp97mqexy8FTckc6PaEpzdV9bcQ==
Received: from SA0PR11CA0154.namprd11.prod.outlook.com (2603:10b6:806:1bb::9)
 by SN7PR12MB6864.namprd12.prod.outlook.com (2603:10b6:806:263::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Fri, 19 Jan
 2024 16:33:15 +0000
Received: from SN1PEPF00026369.namprd02.prod.outlook.com
 (2603:10b6:806:1bb:cafe::1a) by SA0PR11CA0154.outlook.office365.com
 (2603:10b6:806:1bb::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.26 via Frontend
 Transport; Fri, 19 Jan 2024 16:33:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF00026369.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7202.16 via Frontend Transport; Fri, 19 Jan 2024 16:33:14 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Fri, 19 Jan
 2024 08:32:55 -0800
Received: from precision-5760.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Fri, 19 Jan 2024 08:32:55 -0800
From: Erik Kurzinger <ekurzinger@nvidia.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 3/3] drm/syncobj: call might_sleep before waiting for fence
 submission
Date: Fri, 19 Jan 2024 08:32:08 -0800
Message-ID: <20240119163208.3723457-3-ekurzinger@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240119163208.3723457-1-ekurzinger@nvidia.com>
References: <20240119163208.3723457-1-ekurzinger@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00026369:EE_|SN7PR12MB6864:EE_
X-MS-Office365-Filtering-Correlation-Id: 41b1b774-af46-4951-ef5d-08dc190c55df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N9mdSSpoI0KDuHmdEo0OVyqNStiU4yFu5bnB3zrald0Ml9i+A3tFSJEe4meR4dbVAzC97SZHhjaSg23jIhypseFGvFjulcf2XXBQ6KRNYGQ3iO1WQ+2HqhFEKBI6IfKtgeY6TZ3gxLphsVaRb2y9tmcuPnd/p8+PcNsKfS6FAOJj9OlAlHR9fNuuURdQwyGFKIF6A9ybSsV2lE95/ANgG3Ag02lyCOgskgSEnp92IK3hVDKZVuG78UCok4XynUrzOCRxx0fdZ2qzBs+VmCt0XnDrSlFUzIpVDzlED/pwajLaky7XRzjLKcQrKmT/NpYSaHDvInXV7v5erGg3rW9G7omiVpqltsyBkl/Mnl5cHR6EvaNSQKIdqls5K4bNeRJtvONQZ+VjQ+AuCErWFxvpBq/au4JORvNH9k2H8QAVEWW/rssg8qleyKe4PSrGwdPVobsosJzEdGzcklZrfst8zmPAiEpuyx3FZ1x9Xp0Biqr69SUUSAtPA/KdwWQj2Dcp3MCLlFIcxOr2xlfdj026pq3+z6w5z5vgwu1B/Eu09L1y5CJ7UYEM5mHdsi4taTEG0ypwsXkHtYQQsJTp6mp3qS7q3onHrmYdn11Unx9AJ0MmkjVDOagvh8ye3EZnusKqqwa15Ic7gDB11voSHESslb8KL85lPgszH8tNuYiJCkIA2r+sZmSQvAikQfEC8KU7YVt71FaRpL2UzmbVaaBlMELI6t03Cg6iN4EjkUsF+R0=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(136003)(396003)(39860400002)(346002)(230922051799003)(64100799003)(451199024)(1800799012)(82310400011)(186009)(40470700004)(46966006)(36840700001)(356005)(7636003)(41300700001)(36756003)(336012)(8676002)(8936002)(83380400001)(16526019)(6916009)(426003)(70586007)(316002)(70206006)(54906003)(4326008)(6666004)(478600001)(26005)(1076003)(82740400003)(2616005)(107886003)(2906002)(5660300002)(47076005)(36860700001)(7696005)(40460700003)(86362001)(40480700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2024 16:33:14.9246 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41b1b774-af46-4951-ef5d-08dc190c55df
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00026369.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6864
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
Cc: david1.zhou@amd.com, Erik
 Kurzinger <ekurzinger@nvidia.com>, jajones@nvidia.com, kbrenneman@nvidia.com,
 ashafer@nvidia.com, daniel@ffwll.ch
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If either the DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT or
DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE flags are passed to
drm_syncobj_array_wait_timeout, the function might sleep if the fence at
one of the given timeline points has not yet been submitted. Therefore,
we should call might_sleep in that case to catch potential bugs.

Signed-off-by: Erik Kurzinger <ekurzinger@nvidia.com>
---
 drivers/gpu/drm/drm_syncobj.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index c59bb02e2c07..e04965878a08 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -1062,8 +1062,10 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
 	uint32_t signaled_count, i;
 
 	if (flags & (DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT |
-		     DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE))
+		     DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE)) {
+		might_sleep();
 		lockdep_assert_none_held_once();
+	}
 
 	points = kmalloc_array(count, sizeof(*points), GFP_KERNEL);
 	if (points == NULL)
-- 
2.43.0

