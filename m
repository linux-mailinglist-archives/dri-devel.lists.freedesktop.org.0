Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F62645516
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 09:07:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70C0A10E146;
	Wed,  7 Dec 2022 08:07:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2074.outbound.protection.outlook.com [40.107.244.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C049610E146;
 Wed,  7 Dec 2022 08:07:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YWCaHpOsS09mzhaUDYXN1DpwGC9yaq6Wzg+X0kXOQ/U7v8CEJRgOdE0xibWKqjt01xcSHulsALg58ZMEq7IibT/NpMBGDjOjBfOHMQtXl1Ml+hF159qMtuki67gqE1vcXcmpZu0bu1hZpfdyRNMff1ZLxcbJw207OMsUi6zbiR5oqxjGp6+NU/1VA8sIb3Oebf49iVLGxsbLHQRupu5oLHUicaQ3dkcGWIzPt+lhqTH7SCYGI7x8KQxxociAaqHD0Y2udx4jTui3ZViyAx2lzfeol1M/e3SSbOV1dhkGongBg80Xyji91wvB47qpXjsotZW0VNotg0BopzX0Vj3bEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xGgLRpw97Vgn0WIPFB68gZcsb0Db9xmN7sOej2QWccM=;
 b=NWiEwbSrm3XhmW3Qd64mot33k/Q5dUFxABtaSJiCWrMWoEKvKJ+VvDziHzaZzsCru/zw34OOuI5OrvF3ieRdzfWEoGYwFG9rwqQuR+fNZMjJcJVWoPLrdm66PniLsEIPPCwGP6jxcFawjjW6O+BGIZ09d7jUvM6JB8mlYivMGunbkji+ddYxMmJrwPQcRigxFNlODssEeUrc6h37L6AZr+wY3Aod7TYMpVCCWGc6vDP0a8T0yJbWnqVgs0NvF8+Pm3UT0GM0aLwTtCQrLTdGDpemz5hNaVjJS3NofJiDnxhvkqaASDnoL7h44zIPhZ6QOEBuV9MK+2zg4bC1rmlxcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xGgLRpw97Vgn0WIPFB68gZcsb0Db9xmN7sOej2QWccM=;
 b=T9gt3seZDSbgQIkJpB93hiOMbNxCwXrxDjjqaW1IfHrrkRKm0IESD2Er1ePi83DEzcknIMDhwfWU0Pgdn2UFh+CLXDnF53usvU8Wfx89jiI5TjyfuHxAepNeGKSokFYbYqe64fK2/7eJxVoigYkKgyPPAJl6cSZXBUqKQ+05QR0=
Received: from DM6PR11CA0049.namprd11.prod.outlook.com (2603:10b6:5:14c::26)
 by PH8PR12MB6724.namprd12.prod.outlook.com (2603:10b6:510:1cf::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Wed, 7 Dec
 2022 08:07:24 +0000
Received: from DM6NAM11FT029.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:14c:cafe::27) by DM6PR11CA0049.outlook.office365.com
 (2603:10b6:5:14c::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14 via Frontend
 Transport; Wed, 7 Dec 2022 08:07:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT029.mail.protection.outlook.com (10.13.173.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5901.15 via Frontend Transport; Wed, 7 Dec 2022 08:07:24 +0000
Received: from majun-mlse-vm.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 7 Dec
 2022 02:07:23 -0600
From: Ma Jun <majun@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <tzimmermann@suse.de>
Subject: [PATCH] drm/plane-helper: Add the missing declaration of
 drm_atomic_state
Date: Wed, 7 Dec 2022 16:06:35 +0800
Message-ID: <20221207080635.688090-1-majun@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT029:EE_|PH8PR12MB6724:EE_
X-MS-Office365-Filtering-Correlation-Id: 95ed36b9-8d63-4f17-022f-08dad82a1317
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JSXc5km81N5jl7lM5lm4hIpoo6NofHHwBMhqEx1eYqlfUmfc1mQlKLegenOxWsCIJoUFZVtfOifBvigahhQZo/CyLsZmx0c9LpUT2wlxa+WT1aTFgMUEU5py+qyNjSvkQb9wU3AVS71eru0AbOg/IFbA4UXuK8QB1i6G6pkYucfBaaYZi97mGnoLkpW+lukP4q84yXa7z0kc52CXt80sCRIdZLXCnxBZ39kkj3W+/OcqcNsopYaP2oshAhjCUYFwzOfRTClbvZUJZsn0XhQYdTkQ7Iy6dALPWa3/5Q827a2GV9p22H4qQOYAT1wLM3y4SHPVXWt3L5s5Zwcpgo/36ChrMmpEWnOyhkm8/Y4/8/8j8vR+3kyiwWu7NYD+3v2EyFBuIVomQvOWr0s2n5qWXwnc39mnW7FZma8/2q05iAjHOrIJ9GmzJQaJr3w8TWtYJSOPu2rFuBzobYzUwxsVbgcwOf0pXy+6On7eq4o4Syva6rJaqhdh8ocCeKkxO5jP4dJE0Dey4fT3C49mzSf5SeefHCSi/QDlNqqPl1Sgq5fJaYuEVTFVV0O9pJipqH1iEOMgAeeyvV5bDvihvA1YBOTOPYVypyzSTj7pP0zUzCtL7HXErnnxd/qgGsE0jjZS3k6/dAWptIWBKWsM/p7GEaNxKhh3qWccVCREY8eFuSMMe0DAuNqQLdlqvftjHnxSSEbolYk/THves9oLulCvjD2b7yXXx/2y4HE4m/cXlzk=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(39860400002)(136003)(346002)(376002)(451199015)(36840700001)(46966006)(40470700004)(36756003)(4326008)(82740400003)(356005)(2906002)(4744005)(70586007)(8936002)(8676002)(70206006)(41300700001)(83380400001)(36860700001)(5660300002)(478600001)(81166007)(316002)(2616005)(1076003)(40460700003)(40480700001)(82310400005)(110136005)(47076005)(336012)(6666004)(426003)(186003)(16526019)(7696005)(26005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2022 08:07:24.6066 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95ed36b9-8d63-4f17-022f-08dad82a1317
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT029.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6724
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
Cc: majun@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the missing declaration of struct drm_atomic_state

Signed-off-by: Ma Jun <majun@amd.com>
---
 include/drm/drm_plane_helper.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/drm/drm_plane_helper.h b/include/drm/drm_plane_helper.h
index b00ad36cf5b6..530f88176db4 100644
--- a/include/drm/drm_plane_helper.h
+++ b/include/drm/drm_plane_helper.h
@@ -30,6 +30,7 @@ struct drm_crtc;
 struct drm_framebuffer;
 struct drm_modeset_acquire_ctx;
 struct drm_plane;
+struct drm_atomic_state;
 
 int drm_plane_helper_update_primary(struct drm_plane *plane, struct drm_crtc *crtc,
 				    struct drm_framebuffer *fb,
-- 
2.25.1

