Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C7F57E935
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jul 2022 23:53:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63B748F132;
	Fri, 22 Jul 2022 21:52:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2066.outbound.protection.outlook.com [40.107.92.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F4788EED4
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jul 2022 21:52:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZB8Evkj7KYHmcMVkm7LfmMLVlVLPEFUcabrkWVrMBJmMmc3WMtR1bfVLdKksxZAyh9Q1UtNKwyVJ0JJ6TFa7STEgkCRWdY/MF3mY/EVPZL+/nevKaBPI00jS6eMkkqXyWz7kgmHoxQFj29aiC3EyjByUr9ggHRj46avPBNVs/fvSOYoGbWxq1wGIkmXjC4L193PkXuO3ZSgjd6Tspawnu2ydES4bjz+jGC0Cld7mpzzU5rdWvJjePZLo38vXcB+1OvRFrbEKwOELKJm+hJGgbK9LcrvelDvRnYp0Zs9OOnzIJkBW+wt9L8vgHRNhR38ApSYtRyu61U0rKYg3zYw16Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0zqQKWznE5h99mn1dIjG/T5+ktt33izYp5qNEGms3KE=;
 b=KZjHDk5s2jpJAb8pA8NkPm7ZFVBIUwFBtqaVxhtuiFB181tFQF4MVZh+QHcaDf2DHGwHmMIuu44NFc52cp7ofeY+vq9CQRrM9ftxu1xVQc94YQvkodYsKjKOxADs+YbUEg1Xx3X221M1zFZisctLMB2LgjhnzHU9DumFWLrpZsdtJT7x2ylX+uIZ6wfO5zN3a5zHhmyWsGwrSDqX7S3yKJ2b80j15ePlYc5D/qIKyJnDZ0BB6D91tvKvn51GTdBuiOL8RqoV7fvd1NZp+DSDTvipYN0nmyuXsnkCjUfZq6Zfr/HycNsQaBVZcWhfjOxJkPuQQLR/t0Q7lHuzTXb0xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0zqQKWznE5h99mn1dIjG/T5+ktt33izYp5qNEGms3KE=;
 b=sofGFjffpra/O3dLkLtzewWiv4E2mGBEtUMJapTmmZEufU0kxDCDZDmILcsPz+Vaxf+55HuCTbQOkifIJQB2vw/UogJoG/Vv0ekx+B5BsZ1uuBuR5nkYGZ+ugXIyPSN+if8cO8+C8V3lRi4Ax43H2ynpSt1bxLx/xlIk9HY9qxU=
Received: from DM6PR03CA0079.namprd03.prod.outlook.com (2603:10b6:5:333::12)
 by MWHPR12MB1133.namprd12.prod.outlook.com (2603:10b6:300:d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Fri, 22 Jul
 2022 21:52:48 +0000
Received: from DM6NAM11FT017.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:333:cafe::1) by DM6PR03CA0079.outlook.office365.com
 (2603:10b6:5:333::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.19 via Frontend
 Transport; Fri, 22 Jul 2022 21:52:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT017.mail.protection.outlook.com (10.13.172.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5458.17 via Frontend Transport; Fri, 22 Jul 2022 21:52:47 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 22 Jul
 2022 16:52:47 -0500
Received: from MKM-L10-YUNXIA9.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Fri, 22 Jul 2022 16:52:46 -0500
From: Yunxiang Li <Yunxiang.Li@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/2] drm: Fix vblank refcount during modeset
Date: Fri, 22 Jul 2022 17:52:33 -0400
Message-ID: <20220722215234.129793-1-Yunxiang.Li@amd.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0405d45c-78b5-4458-bd0e-08da6c2c842d
X-MS-TrafficTypeDiagnostic: MWHPR12MB1133:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sIf7aJoI62YtKnI7pLTw4m/LKtFLupXJcUcnOx8X5Zp7934LcKlbozupjYB0c7QVyK4K2Hqix5Gej8I+1oZG+vzb7JKxYEX+Rgpii7/m1LtNEBNhv13bg1yv5laRguFOTzZfdzkD63vAfgylYL08QCUpVLYMQLVTJ0YzMWMaS1mnJgnEpZ9/oe0ujpbuLxY+KONKydPdvF8cRhtv+ardz8tC/EJtNO1f2nWbSEo55hhK7sBeqbTiKT4380SEQA0XMZsh7CZPLS6lfuTxh/J5THmwI7gK6Qtui+0wYyoa3LyAaOKa8XoJINjLXo1VPpjVjzbDYdOuJXT9qA+tBJpdQdROcuhZgMDgWpFv1Xzmwsuu7GNCfVFL/nHFHat4WH9Mcu1gp3DikmZeIY+l/7I/NrF1a739ql/lcU6HFzWwD7I/G0Ujd1Njz85hTNuJbiH+YoZPLs+hDgeFXhNgQ8+WHf2aS7jWUaKGseCEGT6qV7URzcoLJIeltrpq6oSYrav/kzptPxLRXJgkssvzogD4luI3y6Wky3LBHXpqmRu8VgZMRMbdRfTxAC+BEikxXf0U3wdKSD5Aaw/5BBpCR8LWWh/+09VN+exsqNPqpC8KzSDLjuVqpZDrxj2v/M2dZqJrCU619vDNQeo5RCxhUuP2qfz01DgforYQZrGTMxzL5igqca9feYBD4doAFkjIfesisXaCYXANT/+pLEunO2xNT2ybPz2HjMRWLRjMDZr6xqDZKj0whXGLKBQp2oTT8OjOlXrhZpaER4Y9sdFUsclMnAMB5zQzn8Po8Y3kJQYSbqs=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(396003)(136003)(376002)(346002)(36840700001)(40470700004)(46966006)(86362001)(70206006)(8676002)(40460700003)(478600001)(2906002)(40480700001)(5660300002)(70586007)(4326008)(82740400003)(8936002)(356005)(186003)(81166007)(2616005)(47076005)(426003)(82310400005)(1076003)(336012)(41300700001)(26005)(316002)(6666004)(6916009)(966005)(36860700001)(36756003)(83380400001)(7696005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2022 21:52:47.7203 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0405d45c-78b5-4458-bd0e-08da6c2c842d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT017.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1133
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
Cc: Yunxiang Li <Yunxiang.Li@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_crtc_vblank_off increments the refcount to prevent vblank from
getting enabled during modeset, but this causes the refcount elsewhere
to be off if they call drm_vblank_get without checking the return and
do a drm_vblank_put later. This can be reproduced by toggling vrr mode
on amdgpu.

Since drm_crtc_vblank_on later re-enables vblank if the refcount is not
zero, letting drm_vblank_get succeed during modeset should fix the behavior.

Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/1380
Signed-off-by: Yunxiang Li <Yunxiang.Li@amd.com>
---
 drivers/gpu/drm/drm_vblank.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 2ff31717a3de..159d13b5d97b 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -1174,7 +1174,7 @@ int drm_vblank_get(struct drm_device *dev, unsigned int pipe)
 	if (atomic_add_return(1, &vblank->refcount) == 1) {
 		ret = drm_vblank_enable(dev, pipe);
 	} else {
-		if (!vblank->enabled) {
+		if (!vblank->enabled && !vblank->inmodeset) {
 			atomic_dec(&vblank->refcount);
 			ret = -EINVAL;
 		}
-- 
2.37.1

