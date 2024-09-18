Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8775C97C178
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2024 23:39:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B68810E654;
	Wed, 18 Sep 2024 21:39:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="QBYnyCuj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2055.outbound.protection.outlook.com [40.107.237.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0927B10E649;
 Wed, 18 Sep 2024 21:39:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NZBBgqD6STBaDBetZ7c+rlrldds2DJphcotf14d+JGyCws6x6TSKnyTkiIGAN4sEMpvjkHaKJkyL1BXn/ymmmspmajXMLPSR9/vgx62kenNVEkTwtIu6FTlbkJJJRvFBY6G9E3TRfP3Xubk9ktTI0lOJ2MUwfMW52DP7S+Ypdh7AVeBxkLDteQvjx6+EsZLr/M6b95F68DR+qSO1isaFOHiCwsV8MN3jD2x0ZclFnjeoS8NZsbzeZJ2b1yLpgQOgsnjWNSaAmGYNNWgkXnKeM4Xicpb5Xft8HiRTmwirGlBQ90vJ9mj4SWxlicga4e9CtR/G0zuN4csIy0LR4KtxTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=prryrh2a3I/ule0oKqdvwaeTuHP9cxxZiuugzjgFnfg=;
 b=ijo5renIVBDeHzZC3qEMQz9gYrA7r3dxOj3Qbi0rl5ffn6Kn+F65vebN/H/Vw+PAgDuMX9iaXSnD9SPdngQ7T5p5ZCZ3KmIIk7NYmm3LBEeXGfyTjDZbdKlcCdOvsL6i0P5SVhHJJECDPNo3v52kWXcLuDx9MtbO5cbUx1dz52VlBPSphkZBltRK7bBzG+hzhQz92nKm7SNxTa0ItX/8J24DQDGSq3wBnSFzu7zsVlObB6ktaPzMD7oV1n141T8c79osRxjbT4gbBGBPqFmsAYCgzPGEoSdFeKmpfZwwOc5r6p8BnwUzCTi1ug4iGxRSisuzy4n6XUFhqvOR5IdpSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=igalia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=prryrh2a3I/ule0oKqdvwaeTuHP9cxxZiuugzjgFnfg=;
 b=QBYnyCujBMK40WUZGBGFroNTfhhgqi9Wz+NQgOuejP/ORra1rIodweAuJ6th6JALiYyx9usgDJQm+0jMFSOSsQj0oMQn+O+x+KolPkOF+IEYZJgU2rfWFk1s2dJg+yOuDCORAj46h0rSFNEJko3pbQ9K+vJ61b7IJSFSYg6dVNQ=
Received: from SN6PR01CA0034.prod.exchangelabs.com (2603:10b6:805:b6::47) by
 IA1PR12MB6388.namprd12.prod.outlook.com (2603:10b6:208:388::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7962.24; Wed, 18 Sep 2024 21:39:15 +0000
Received: from SA2PEPF000015C7.namprd03.prod.outlook.com
 (2603:10b6:805:b6:cafe::86) by SN6PR01CA0034.outlook.office365.com
 (2603:10b6:805:b6::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.25 via Frontend
 Transport; Wed, 18 Sep 2024 21:39:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015C7.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Wed, 18 Sep 2024 21:39:14 +0000
Received: from AUS-P9-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 18 Sep
 2024 16:39:12 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Hung <alex.hung@amd.com>, Alexander Deucher
 <alexander.deucher@amd.com>, Melissa Wen <mwen@igalia.com>
CC: <kernel-dev@igalia.com>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <sunpeng.li@amd.com>, Mark Pearson <mpearson-lenovo@squebb.ca>, "Mario
 Limonciello" <mario.limonciello@amd.com>
Subject: [PATCH v7 03/10] drm/amd/display: always call connector_update when
 parsing freesync_caps
Date: Wed, 18 Sep 2024 16:38:38 -0500
Message-ID: <20240918213845.158293-4-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240918213845.158293-1-mario.limonciello@amd.com>
References: <20240918213845.158293-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C7:EE_|IA1PR12MB6388:EE_
X-MS-Office365-Filtering-Correlation-Id: cb92916c-a017-410f-de71-08dcd82a574c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?c3cyjqjxko8iZNfCB4U7D4NNRUpyhHYrryUWEALrzFoVSHNp//n4YRfNDR4p?=
 =?us-ascii?Q?Nnn+KOtrGrvnyhKsGSpL76o3WJ3+rgdrudMFsGP2YM04tcuevONE7wbLuZ8h?=
 =?us-ascii?Q?7UEu6LMGlhTPvXA/5jTYXocfP88qVOuABvqau8Iyjs7b0dsnknXrazWbdZgG?=
 =?us-ascii?Q?AU5PNvaqiYDKS7kIXLpXbOOccsbAD0B86LMNK2oeBl27qgCNpkaQxLqt7hnW?=
 =?us-ascii?Q?fWETBvz7QMPUnV3Sy7sKL3AYu7ZvpLxJXPV8bSFiv1rPMye2DuBXpIyeL+Ou?=
 =?us-ascii?Q?PzTLQHmXikOSbxvKkVJTGHDtlEnUh5jjQ3/OVVsleHCdtt4aaNeASo1it77J?=
 =?us-ascii?Q?D/fyBnEvaZ6Epo+JJTwVSply55wved8rL7ZhnzYLNd1tkmFa8nf2hsRN8gUW?=
 =?us-ascii?Q?6q372x7ALlzf21XitRqt0mfY31oBItORB6f22A6hk2wih4ndv24wglfnGo/Q?=
 =?us-ascii?Q?8vYoulEOP0JxTWSWA7cO2agbaNTl74UTSNIk6XZJ3EkdCv8ppZwjULCfbRbC?=
 =?us-ascii?Q?VETwviLgew4qZ6gtuiECdFI4xGZmbQQgeuFkqir06lA8o4pMP/IPSUA4Fhkg?=
 =?us-ascii?Q?m5qwoBzvNyNVJumx+mZmsuqcjIuYCqCuOyQRQr+uw5rp2BPGGFoubtPqPZKj?=
 =?us-ascii?Q?zxmisfBrdakOYl84DFXtUiwBXz7Kw/u/rRnl0KLaZe4vgTcsX2P0Npfz5eKn?=
 =?us-ascii?Q?yryMH2QpeUtSYu3Y1J41W4CP9ARvhE4ImpNgt+K8HYXespU91NbZx1j4zPfQ?=
 =?us-ascii?Q?rPNiTgRT9U+bHYUV44DuFwBerlf4AkZ416TD73c9Q3q/CqGOVj5QBu1dv/uT?=
 =?us-ascii?Q?r5TD5sK+qiggZQYgsUqVDpPYQer32FHU0dkWSyhHlAmIA3jAGQbFlJRW57Nc?=
 =?us-ascii?Q?4mZckgb+3JXCkUWpsSI/Adky/nS477hCnJGthO/ghtkXvN0pcD8AJ9sx37lh?=
 =?us-ascii?Q?j3KxvpEDTpSVFg/v0+fr62rUs7gFjjvmFetVbtGgIk0IOIzLsjBFecZrTQMP?=
 =?us-ascii?Q?9wwJG1Srisiw/J/n1XJvUzhim+UPPV5qkX66+8L9VOcLKd4FWLIQkWDgdODI?=
 =?us-ascii?Q?4t9IhAKu05GLZyXQxg3MJ84i/LboXMHkYhPJhyy4JhYL2IQ8XKJ6reBQps0o?=
 =?us-ascii?Q?UCGIpNXuh/ZmJ/T6g55B/LBagXaJlhhVsetGZ9LDJrul1PtimlAyfPrQMYxJ?=
 =?us-ascii?Q?TIPaO7bAUMe3lLE84u9Qp52rj2kGav+Wva2NJghoF6dSJJlsodM27FOjzDGQ?=
 =?us-ascii?Q?d/zgxeCvrXnjwa8EvJHdYjfLPuS+sHU8ukIUFw0a9UglmaGVXyi9/rjRMpC9?=
 =?us-ascii?Q?1my1gTBqbRJG76PwU+gEW7UYlLd6GRLKl8Urw7bt/CDoRWPIv9FNYSEq0yJo?=
 =?us-ascii?Q?3TG+H+A=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 21:39:14.3711 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb92916c-a017-410f-de71-08dcd82a574c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015C7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6388
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

From: Melissa Wen <mwen@igalia.com>

Update connector caps with drm_edid data before parsing info for
freesync.

Signed-off-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 0b6c936be7a6..efc1609ff26f 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -3569,13 +3569,11 @@ void amdgpu_dm_update_connector_after_detect(
 					"failed to create aconnector->requested_timing\n");
 		}
 
-		drm_edid_connector_update(connector, aconnector->drm_edid);
 		amdgpu_dm_update_freesync_caps(connector, aconnector->drm_edid);
 		update_connector_ext_caps(aconnector);
 	} else {
 		drm_dp_cec_unset_edid(&aconnector->dm_dp_aux.aux);
 		amdgpu_dm_update_freesync_caps(connector, NULL);
-		drm_edid_connector_update(connector, NULL);
 		aconnector->num_modes = 0;
 		dc_sink_release(aconnector->dc_sink);
 		aconnector->dc_sink = NULL;
@@ -12088,6 +12086,8 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 		amdgpu_dm_connector->dc_sink :
 		amdgpu_dm_connector->dc_em_sink;
 
+	drm_edid_connector_update(connector, drm_edid);
+
 	if (!drm_edid || !sink) {
 		dm_con_state = to_dm_connector_state(connector->state);
 
-- 
2.34.1

