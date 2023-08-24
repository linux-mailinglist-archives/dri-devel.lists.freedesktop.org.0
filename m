Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D3A786687
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 06:14:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8458910E4E3;
	Thu, 24 Aug 2023 04:14:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2056.outbound.protection.outlook.com [40.107.93.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B64010E4E3;
 Thu, 24 Aug 2023 04:14:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bSLOzUTQpdUxVw3s8+cQPAxwzjRMN42IpXQ8G5NW87zsmtmNVCEFrTKz5GmCypREeySzsXum4Q8PnIs6ryqaXo4aXDR+MR8EDbfPN4neQDjqpYYBync6Gu+5Ur8AHkmEmaale5gbx/yhx4fcSDkOgIFAvhYr+ZO+qVkjFErgfQtRIyPK/ADLiAXRjEO4VKTX8Juhswh/+un72Ot3x0V3/MjbMOT/sqdvk2LM7kWRCcSPK6+2MKer3Mno/Mw8ox4e7ZcSJWO+ATWP0fpqgQNvCQXj/DVY0wSfBeA0y4Nq8p6NJwNITCOfITxUO67Yabgn/VdYeuRy1hXZls6dVWxOMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TVQAighXsprThYE89Wff8qQmlmEqk7qmdVh+98DSEFM=;
 b=lvXqg+tj3Ky1frouCfLUbnxVocBAzzkigyIvtaXR9fx+8roSvUyOSwFj0S/EfyUTAtG+OvYPph0KGSqdX2NBzFqwh91sfIO3RlQi4Eyi61sAI6btL7NOUXbQnS0zaqlkgFRXDSI4wuEI03kw+0O0J+fRWa4VNn/bsjZJFq4ylJELb0qDLzeSwvDldS+Rjb8PDhkTQHX90yLuLaqcs1JadotzOO0R1T7ZpEc+lT8do4gv8FPoKkIVqocghk8y+WHCLi74hmF8nOkxkRTbUpKF/mOGIV01A9apMmDAxHTLwWSAWe+L7BS/Qz+zjGRYvQvLTx5e+gCuGXZ+ZGYl+osbTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TVQAighXsprThYE89Wff8qQmlmEqk7qmdVh+98DSEFM=;
 b=w3idQB20gm4vo446CNEqLXo18Lq3bddPlaY0/lkD5uBSts9pdOOUcUsUMNseESgTJQugZ1znvM8zcWWxIPmfV7hM6/r0M7sw8mkbYfjqCDxrP9Pf9wob9dkz/lg1Vlc2pv25AvDn2BHxzeUDE0yFaAEpeWMxTR1ZTuIzLO6iwkk=
Received: from MW3PR06CA0011.namprd06.prod.outlook.com (2603:10b6:303:2a::16)
 by SN7PR12MB6816.namprd12.prod.outlook.com (2603:10b6:806:264::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.25; Thu, 24 Aug
 2023 04:14:20 +0000
Received: from MWH0EPF000989E5.namprd02.prod.outlook.com
 (2603:10b6:303:2a:cafe::1) by MW3PR06CA0011.outlook.office365.com
 (2603:10b6:303:2a::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24 via Frontend
 Transport; Thu, 24 Aug 2023 04:14:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989E5.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Thu, 24 Aug 2023 04:14:19 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 23 Aug
 2023 23:14:18 -0500
Received: from wayne-dev-lnx.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 23 Aug 2023 23:14:15 -0500
From: Wayne Lin <Wayne.Lin@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v3 1/3] drm/mst: delete unnecessary case in
 drm_dp_add_payload_part2()
Date: Thu, 24 Aug 2023 12:13:56 +0800
Message-ID: <20230824041358.4164010-2-Wayne.Lin@amd.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20230824041358.4164010-1-Wayne.Lin@amd.com>
References: <20230824041358.4164010-1-Wayne.Lin@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E5:EE_|SN7PR12MB6816:EE_
X-MS-Office365-Filtering-Correlation-Id: 501ee9e5-d9eb-42d8-4c06-08dba45896f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fVqjIKqeMZLiq+cyI0tt1XLJzLy2xet3aw/VYr9QTr+dfzKeo8J6VOJcBmYt2m4LOfL1fvS2jaW/DVmz8I4BCfZ2h8eHSGZmqmgd2kJGZJiMkLTmlRuU7Ii5LUsd7v2I5svlcIhAJ+IRj8DpbZrobLMcvaDWN3MMzFbfEQSJJTNA1QHXIJ5ljQzj/PhA3KKtmUdPzxGkO5AwFygdsw5MgwdaYCYtN961Z8XGJoq/hmTsok+twkG74q1BHVnc0u5z4V0eZA5d9lakN1i9DcxyFVS0p1MS0XS3GcDswmkpZ/x28YoN+PMJvP5zOpntSuQzE1+g9V1VcjsysZ8zy2IzLVGNc3SLg7oTSxZmVxWYvHi3lzSwz7ubGgLfbVb5q1ZFzo36JgXzDmErOj8dR0u3JxKhuGIDbl3Bf858kVSsgtJ68yehVWQxaA4il+5ulA4G7XopYUSitL0BDJndsz76SM04s1QJv7AFb3gwu4tansiaS0Ct2snb6wdfqHnRvjNgGNfvwsaeZAOvXrLngGx612RGWBQdA1XwG+ggJE5EwMsw96Edh8GTN4MrIGeHWWPUZ0tXwmGiWdT4mLvuUIpNcJBRwalOEoEgE8qGFuC7GvkxD1aNVds+veTuwyZHk/XKaRJaYwGYs2Cd8iaI9PUFnuU4ZdfO+FK5e+5eT5xaLkM0bMC1bQka9BY7v3QQCsUo4v62gvPyeWQnoxgUrWLdNs+tXrL1klMzRzrSYaXAen2qJlMC5wJ4tdGgtHFVCxIUuNz+n7gNJoc0KJDhlUw/zg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(396003)(39860400002)(136003)(346002)(376002)(1800799009)(186009)(451199024)(82310400011)(36840700001)(40470700004)(46966006)(54906003)(70586007)(316002)(70206006)(110136005)(8676002)(8936002)(2616005)(4326008)(41300700001)(36756003)(40460700003)(1076003)(356005)(82740400003)(81166007)(478600001)(6666004)(40480700001)(83380400001)(2906002)(47076005)(7696005)(36860700001)(86362001)(426003)(336012)(5660300002)(26005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2023 04:14:19.8386 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 501ee9e5-d9eb-42d8-4c06-08dba45896f5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989E5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6816
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
Cc: jani.nikula@intel.com, jerry.zuo@amd.com, Wayne Lin <Wayne.Lin@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Why]
There is no need to consider payload->delete case since we won't call
drm_dp_add_payload_part2() to create a payload when we're about to
remove it.

[How]
Delete unnecessary case to simplify the code.

Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index ed96cfcfa304..4d80426757ab 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -3411,12 +3411,8 @@ int drm_dp_add_payload_part2(struct drm_dp_mst_topology_mgr *mgr,
 
 	ret = drm_dp_create_payload_step2(mgr, payload);
 	if (ret < 0) {
-		if (!payload->delete)
-			drm_err(mgr->dev, "Step 2 of creating MST payload for %p failed: %d\n",
-				payload->port, ret);
-		else
-			drm_dbg_kms(mgr->dev, "Step 2 of removing MST payload for %p failed: %d\n",
-				    payload->port, ret);
+		drm_err(mgr->dev, "Step 2 of creating MST payload for %p failed: %d\n",
+			payload->port, ret);
 	}
 
 	return ret;
-- 
2.37.3

