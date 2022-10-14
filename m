Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B79555FF16A
	for <lists+dri-devel@lfdr.de>; Fri, 14 Oct 2022 17:31:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A545110E1AE;
	Fri, 14 Oct 2022 15:31:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2073.outbound.protection.outlook.com [40.107.100.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B647110E1AE;
 Fri, 14 Oct 2022 15:31:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jhE0gFXLthsetxxBmoG1RwI+chgKQq4GZiOs6870oHmeGNt8ptIywpSBX76DufAuK4ZQrbzDCVAJTRQaqxVq5We3q9lOY6zVmyjsnBfMb7a32+kzf7+KB370cg2BkOp6vIFT4zdj/iVj5cnMKHprAl4iVQ5zQ+ynfacdYQti22w9dNZKHREzzjzWGGV9JGCcXXa4QID+4r3lQwVFdoU3TQSbwWRkXNTCq+va34Nc3mIlpkPsUuYuoRg+h67eMQ36g7aCaWaAesQ+LI3lScW1jV4hl5DXyjrnfwo8+ek4CpjCRPk3dXxVDcTmoiBE2nlh0771JIb7oyHlS4FKPk47vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9MToeA3Tj4MASB0FUVMaeoyR2z/lR62GD+rHISPLaic=;
 b=EszSe6C4VzWveeksB3wPiF/kfOCuMUQskQLewfTYplnp1oG1Fstc3xQ4bnn2tFxghY5D/mId8ELRBSqNWTvFT1LBlA+fQHQ9tx+qC6u6ZfLiKQqURXrJ8/Zb45cWrM6OjhW7ljGtRva4Fr0RZk3L1DmZru1h9LYj85ZxG07K2duhxVtZKU9XvkyytVo0KoRJ1XPETXfGv2RL+C0R70SaXGfawxlLzNKbuU+zP31+PuaLW9W6WIjDzytczSev2UofU5aWP98qyiSs9IA/2wtzdWzQFKhkpIigPsSLXFDEog5YQSbDD9obhsIi/2s134cepvtpI6uL8kz+9i6q0eB8Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9MToeA3Tj4MASB0FUVMaeoyR2z/lR62GD+rHISPLaic=;
 b=39cFVOPshxd8YrrBCGRp8M9a8PSME8LUUjTydMIUeiHBrxdd+8hrgL+Y4GrkgE3DDljR4T20DmdK8Px8yOvxsxn+r4pII9YMWurB2sk5mchys+tgY5MxK8WlOxt5kD+PR1GT0s7meaj+A2izKmindNQSeQPEjdgWkhZVie66dFU=
Received: from DM6PR02CA0121.namprd02.prod.outlook.com (2603:10b6:5:1b4::23)
 by SA1PR12MB6824.namprd12.prod.outlook.com (2603:10b6:806:25f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Fri, 14 Oct
 2022 15:31:15 +0000
Received: from DM6NAM11FT085.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1b4:cafe::22) by DM6PR02CA0121.outlook.office365.com
 (2603:10b6:5:1b4::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.20 via Frontend
 Transport; Fri, 14 Oct 2022 15:31:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT085.mail.protection.outlook.com (10.13.172.236) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5723.20 via Frontend Transport; Fri, 14 Oct 2022 15:31:14 +0000
Received: from hamza-pc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 14 Oct
 2022 10:31:11 -0500
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/display: add a WARN() to irq service functions
Date: Fri, 14 Oct 2022 11:31:29 -0400
Message-ID: <20221014153129.68674-1-hamza.mahfooz@amd.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT085:EE_|SA1PR12MB6824:EE_
X-MS-Office365-Filtering-Correlation-Id: e982dbc4-1b72-48d9-37bf-08daadf92137
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6BuStJodXFhGSel44I3JZ9TQWWTNnAQlgUSSzM/xWoGX2OHbZODT3DFN6T6yWdqYvJ1talgarZRFIPStWh3hYFzGoW9r7BNd/fRsIHoebyjiAQq4nsU5T6+CZvvWu0OMpjauoWWtdWrUMqhYULN9hDQ0QG072BzabDmXJ6p9LaC9UO4LOrnGQ7JWgbIC5O597lHYE77BT9nIaSk0Oq+4Gekn+BnzMJp3hNJAjs3b9kYATCtxpQ1G8KoJp4J4/F0IwJf1d8kaLElgZsGgDr9Yj4UzMUB3alXp/bibLB2QEsWH/DdJIWIKJcmCmct9gVgEgCd25iu778p+v7FOs/3eg/wdSGfyGTyNp19NUaRFzQ7349xECG+PiIOUT3um6wvuKVtsqLxh8g+I/4C5xF2qrne9NlSpjjrreowe9257SNUf+702m3A26cAPii/kexWtRHKaj6dnuzivrc2IgZoIl5cvGQ/5jl21HDsP9fMZEKwef8P9PB6YaXb1JUaKm+HQs3o6FAKOXRW0piOAYDcllh+gFw8BqUsCxikdKkcU11pI/YBCuwPwfzyfwyxSJdXrbLudy4OxG/z3pjEvf80QQ63zN2uKYwLHti+twveI8jkF73O+aipgDKJwyAW3TGDOiH1qGzC2rtSiJDZLp8ufVFl08H//unULYZ0nqzEHQ7nRQOhhLfWSAiyIQqIY5Xt8g4hkqmpApOTW3T/ezZSemhUrG4pR3ABDdBYSGrDxecsXLeHo2/U7NMLxi2BVnGeRQJjE5oz6ghvSinucChfbauQRLlk+ghxrF1/umpt5/t9tGE4ueuGsCml+Omfpdz1afMPUw0Yvbem+iQfDBGizHw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(136003)(376002)(346002)(39860400002)(451199015)(36840700001)(46966006)(40470700004)(41300700001)(7696005)(82740400003)(36860700001)(336012)(81166007)(1076003)(2616005)(2906002)(44832011)(356005)(8936002)(40460700003)(26005)(186003)(36756003)(82310400005)(5660300002)(16526019)(83380400001)(478600001)(70586007)(70206006)(86362001)(8676002)(6666004)(47076005)(316002)(54906003)(6916009)(426003)(40480700001)(4326008)(16060500005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2022 15:31:14.1294 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e982dbc4-1b72-48d9-37bf-08daadf92137
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT085.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6824
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
Cc: Leo Li <sunpeng.li@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Nicholas
 Kazlauskas <nicholas.kazlauskas@amd.com>, David Airlie <airlied@linux.ie>,
 Alex Hung <alex.hung@amd.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, if we encounter unimplemented functions, it is difficult to
tell what caused them just by looking at dmesg and that is compounded by
the fact that it is often hard to reproduce said issues. So, to have
access to more detailed debugging information, add a WARN() to
dal_irq_service_ack() and dal_irq_service_set() that only triggers when
we encounter an unimplemented function.

Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
---
 drivers/gpu/drm/amd/display/dc/irq/irq_service.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/irq/irq_service.c b/drivers/gpu/drm/amd/display/dc/irq/irq_service.c
index 7bad39bba86b..b895bdd8dc55 100644
--- a/drivers/gpu/drm/amd/display/dc/irq/irq_service.c
+++ b/drivers/gpu/drm/amd/display/dc/irq/irq_service.c
@@ -112,8 +112,11 @@ bool dal_irq_service_set(
 
 	dal_irq_service_ack(irq_service, source);
 
-	if (info->funcs && info->funcs->set)
+	if (info->funcs && info->funcs->set) {
+		WARN(info->funcs->set == dal_irq_service_dummy_set,
+		     "%s: src: %d, st: %d\n", __func__, source, enable);
 		return info->funcs->set(irq_service, info, enable);
+	}
 
 	dal_irq_service_set_generic(irq_service, info, enable);
 
@@ -146,8 +149,11 @@ bool dal_irq_service_ack(
 		return false;
 	}
 
-	if (info->funcs && info->funcs->ack)
+	if (info->funcs && info->funcs->ack) {
+		WARN(info->funcs->ack == dal_irq_service_dummy_ack,
+		     "%s: src: %d\n", __func__, source);
 		return info->funcs->ack(irq_service, info);
+	}
 
 	dal_irq_service_ack_generic(irq_service, info);
 
-- 
2.38.0

