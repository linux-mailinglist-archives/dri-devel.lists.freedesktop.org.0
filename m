Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B643724E18
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 22:26:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BDBA10E3CF;
	Tue,  6 Jun 2023 20:26:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2080.outbound.protection.outlook.com [40.107.223.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBF9D10E3C3;
 Tue,  6 Jun 2023 20:26:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j1XJc/mQ8D/t4iDKYzKS3OG7ZuJ4jv0HOSdbGJ36M6Qm+rwdWgewAttOH9gw0PE2EY2bwQHrjpe/lZisjmCgesprazqjz4533eQ/S4HzjeUQvBaNVXh+qX+C0GLkB/N6L78HR9Dop4CXuU/jCeh5I5c5UyKRj5iWlh7hNL7O2bXzhH9QAV6XMn8OLvtY6Jmtd+4leIFPpZyoQnrlaR1Vx997HbVQxMV3WnO8E4MwEgk9jH0QumQUw6Ls4XrW2713iq/zdLydzVF6Rfyj3iLsnmJQa/sDQhINJ0nisnCU99n7bD2KxG4BP3Tl0bZzR+qhxOlEEGHvIqjyVZ5rEalITw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2+rPeG4zSesJMWVH+q+a4CTowd2JeHgre8BXEdcfuyU=;
 b=PljBF+EnHQKiV85W8WvVbTkfcSs6DDQsgkdY9Pf8PmyzSzlbdmQQ9uH/QHGG6b7HutIsMpCnuo7jxPCdFztHXp34jsNpQOo/UgIMmgqLS76OTVF1JGeorQv0+Yh+YEl2HpiqtqT6Cd8l87UJSWTdQ78wF9cwxopxRW4d3WP0Mq2LoBF92AQ0FkjmfvmMHlBX1SNsqXAfWUfYce2cBpFyDC/5np6QMPFAfwGeJwtoliWElb1ADy9FSwlD6fcDfsefO188NFRBebrfz8DgaSU0PoykloDhXWR1QFYjOeQ352A0/UulsQoAUoCNLDS3V6BIvU2/lBbLO9t2rO3dbejWVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2+rPeG4zSesJMWVH+q+a4CTowd2JeHgre8BXEdcfuyU=;
 b=zEX/n/Af7qTdjnkjK/LeL6TDTaoeibR3h9K7GELMvkzDfdgelERtMVeZ5pnX7t0NEe2kKBCUQUuQaMIZyIyplpIwmpRYOx11BYQwIRi+OiYRJugZ2HDL5nj5o3ghduGJdgHaSUd+nc2OtYJ6wvAlThFfPg+teD7/JPaeC8mPWoU=
Received: from BN0PR04CA0101.namprd04.prod.outlook.com (2603:10b6:408:ec::16)
 by BY5PR12MB4129.namprd12.prod.outlook.com (2603:10b6:a03:213::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Tue, 6 Jun
 2023 20:26:27 +0000
Received: from BN8NAM11FT063.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ec:cafe::ac) by BN0PR04CA0101.outlook.office365.com
 (2603:10b6:408:ec::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33 via Frontend
 Transport; Tue, 6 Jun 2023 20:26:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT063.mail.protection.outlook.com (10.13.177.110) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.36 via Frontend Transport; Tue, 6 Jun 2023 20:26:26 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 6 Jun
 2023 15:26:24 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 6 Jun
 2023 15:26:24 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 6 Jun 2023 15:26:23 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v5 11/13] drm/amd/display: Always set crtcinfo from
 create_stream_for_sink
Date: Tue, 6 Jun 2023 16:26:05 -0400
Message-ID: <20230606202607.122914-12-harry.wentland@amd.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230606202607.122914-1-harry.wentland@amd.com>
References: <20230606202607.122914-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT063:EE_|BY5PR12MB4129:EE_
X-MS-Office365-Filtering-Correlation-Id: 34ed2cba-7498-4b89-04d0-08db66cc4daa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FOa+BOJoWagj7z/3p8J4dtjnOyWG7BKBaxGSBWdGzCBXOmNSEkGipbdmc1Kny4CvF8UMjAM/7QEQjNBff+Iv1v3dnFktLqr8oYLkhbDD5OWqDeKtRA5NDkZON4CZJP0q7H79GIBc4+M2FtJSJs5AYolOdARgAowOW3pqOBnq9ZdsA5Jh2uqRXoTwdtWxxU9cQYEbYf2hnXteoyyCXGGfvOp0t0QSExA5QINfwb1qrUdEH0BxTMU0jFoxorBhmsIx7enSCbXMZx1Lk6oWQWjIlPXagfsgxCmtvnNUbxyVvTuhKFxaR8mCuLH75197T+INqQgKKZhW+79Qg1oMnRY6jy0B+CqWyMGKIkgqh9rhg7dUGsEsvyyDHjiKyZIO/knjU76Kwg51DNlrc3w1LfpJKUcSJuSJzLL6zYhVciZEWy3belFzLZF1CTw+dji+Gv7plzxWdeJzi7xsxEnCQlqZh6Gpj9cAJAgggdXnV8m0ATiynyHdZRsQaLIIOQq2cr/gBmdKIeYdnKGDh+oqG+uPHFSMJKgvSaqLqAKCunI3bslec5rwdwZWI0uCDVXsaAOSZHiT5KfCdJdCa7bQRkOzBFyYM5touaX5reV5A4Hrjm7KIzIfbO/z2Q0u4UDU8iWAVzKrP3lq7FlTOjFzgyXKq2Tm5wFqYqJ8XMhoTVLPuDvocSX0ovTMw73mP3r2UJJxrtdzgWCKA4cRowOBmxCJkfGc8+Evx+j8X/TdkrrpcQa1z8XKtXCI13bYQBRSr22+79C6iZy4URIArge7QFb26Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(39860400002)(376002)(346002)(396003)(451199021)(36840700001)(40470700004)(46966006)(86362001)(5660300002)(186003)(8936002)(110136005)(26005)(40460700003)(1076003)(36756003)(2906002)(54906003)(316002)(44832011)(8676002)(41300700001)(40480700001)(4326008)(356005)(82740400003)(70206006)(70586007)(478600001)(426003)(6666004)(2616005)(82310400005)(83380400001)(336012)(81166007)(36860700001)(47076005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2023 20:26:26.5094 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34ed2cba-7498-4b89-04d0-08db66cc4daa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT063.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4129
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, Melissa Wen <mwen@igalia.com>,
 Pekka Paalanen <ppaalanen@gmail.com>, Vitaly.Prosyak@amd.com,
 Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Joshua Ashton <joshua@froggi.es>

Given that we always pass dm_state into here now, this won't ever
trigger anymore.

This is needed for we will always fail mode validation with invalid
clocks or link bandwidth errors.

Signed-off-by: Joshua Ashton <joshua@froggi.es>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Vitaly.Prosyak@amd.com
Cc: Joshua Ashton <joshua@froggi.es>
Cc: Simon Ser <contact@emersion.fr>
Cc: Melissa Wen <mwen@igalia.com>
Cc: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
Reviewed-By: Harry Wentland <harry.wentland@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 060a975f9885..e17c8afce2f4 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6054,7 +6054,7 @@ create_stream_for_sink(struct amdgpu_dm_connector *aconnector,
 
 	if (recalculate_timing)
 		drm_mode_set_crtcinfo(&saved_mode, 0);
-	else if (!dm_state)
+	else
 		drm_mode_set_crtcinfo(&mode, 0);
 
 	/*
-- 
2.41.0

