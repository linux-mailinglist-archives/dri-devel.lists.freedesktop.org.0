Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 068AC3CFEAD
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 18:06:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 267426E45D;
	Tue, 20 Jul 2021 16:06:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2087.outbound.protection.outlook.com [40.107.244.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38CB76E45D
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 16:06:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TvQPjPbEasQONoeSWB+AQc3qhEt4kr1aj/iEJF+HTyFsaQHIUXOxFRuCkT3mDSgLTLsJOnzXYwDHa8lpkQlx2HrUy59lq7MCWpGs08lpRVcU7+QFrz1kSGTDv/0jeMYiepoSLu+C/tK2hLlm2UoMCRzNpMqNAx6weejDNUeGJc6X/0SZgvMTXGvWt/Q1+l0pc3kk57dB7iPqmGo14XO4fnsJ9XekhOstA8tF0CEW1/AmR0587oMV+pghkWRGIYoFgESd7hwBkoMJqZ02q5eXCy7js5a5YAGqAM62LRyQe9MjaukPQahIu5VC1aRR4vTyGgLhGjCnzGlNlHUYvEUz9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N1yMvrkLkmA90rfhKygin4xQqiD540LHOlQLNFc/rTA=;
 b=UoQSIV0kuzD5EeADGmrguKeliKfFkqpKpPAiPBRsoJv+T/0TclVuTo44fkoeJd6RX9uAvzDDDIKOxp8n0ziqNRB4axmCmk0HwEIDL07n98gTOj0bMfV6JqCCKCjia7sH/XW9rDbGfjIBJehGPaKttDB+Y89gieuHiULGotz5ermI4S25H+Zm9qVxuk3TaUFipuzVG3G4hfyoM6LUyAV5jodrcsqy+65JStZPK70kBOK+EiKsJgcaVxmHjw33jEcquFZHhcXy5dBNqhikV3ekPRgyZpU7CtGdYtvnpE07DsT2Xv/suVtWzfJJTUCzs8zagPdG1xLD3DB54wgiVm/btA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N1yMvrkLkmA90rfhKygin4xQqiD540LHOlQLNFc/rTA=;
 b=Rwrp95NT+b949Y5ib/fj02F4qlzUTcKwUUSm1kbzqeCFRL56wAZcNDpCQ86srSh1wOXEP/m3sz0BDhcQzt08aSgdb1OIMHeu1e8jpC580Q69SznA4xJofAAry2vc4EENYAqwZdKzkZCcvMKvEuplDXuaLuZj8Obz9olJLJ3k+Cs=
Received: from BN0PR03CA0040.namprd03.prod.outlook.com (2603:10b6:408:e7::15)
 by BN7PR12MB2785.namprd12.prod.outlook.com (2603:10b6:408:2d::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.29; Tue, 20 Jul
 2021 16:05:47 +0000
Received: from BN8NAM11FT021.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e7:cafe::1d) by BN0PR03CA0040.outlook.office365.com
 (2603:10b6:408:e7::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Tue, 20 Jul 2021 16:05:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT021.mail.protection.outlook.com (10.13.177.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4352.24 via Frontend Transport; Tue, 20 Jul 2021 16:05:47 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 20 Jul
 2021 11:05:46 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 20 Jul
 2021 09:05:46 -0700
Received: from wayne-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2242.4
 via Frontend Transport; Tue, 20 Jul 2021 11:05:44 -0500
From: Wayne Lin <Wayne.Lin@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/4] Unregister mst connectors when hotplug
Date: Wed, 21 Jul 2021 00:03:38 +0800
Message-ID: <20210720160342.11415-1-Wayne.Lin@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 957a096d-9772-48d2-3abe-08d94b983c9e
X-MS-TrafficTypeDiagnostic: BN7PR12MB2785:
X-Microsoft-Antispam-PRVS: <BN7PR12MB2785FB3DE6C921B41112BD25FCE29@BN7PR12MB2785.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1360;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ETumQHjOFmX+9J1TrAstPY5Oa3YK7+byYi5YNZUt1OrZsKCzuZr4XpIsPE35AFUMKiM+JVfj3oaiteNM4g5/cgvs/RCscf/SbJZQYokHZuKtU2Py7J6lpl6E9tNvJaYvwR2I1hx8JBDkI/SQdlb5DGIYAJBZGmJUZAb/rkxLXr7dJ4TelH1KQyGKpg/PWKS9rCI2QTI0o1lh20qJSRPrlbzfC/XsgKBZxu3j6qnHepE7VXJB7uHAfPRSU7r4Rlp7Zr6kzMXwnSUfc0r737diBfnlz2CfEmi+TBV5XOwYY0lsFaVkhZuaXX3+jGFpLAwRs0DkV4mJdM+6SbPLonHfgBKEuJulUjniFV4sf8pW1wgNvl8BJQGVbFoMAVzlo7K6HbTgh1Dzaf8vLbHRP347s5DCkvP5bipP+jvHOCChT9IQ6PkaqSYgzh2dsHd2TdF+asOzrMyBIrJIrzzEO1ehYS2+ITpPW+Ccf+PR9PDp7FBib3l7sK6p3DHbMNuGv4/SQfj0KnilpirTJhi0djJBJE8A/9ouWEO/zuJbVHndoaLBjX6yhLyL4vYpHXXJsMAXqkwgFxc1TqKC9xfc8bXFSNNSQWCwhJHNSjutOKKIgyxX8q5+iTf9Ku+4QezkcPKvo9NyQOyHhPXCyDrC8pllH2AU9tsbLThERQGrLlYVUpRGP8vRDWwEP8lau/acT0PyIblsapP6Yfzhf1rOFamjwaC7Vjk3/tC8JNhyj0A/TeE=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(396003)(376002)(39860400002)(346002)(136003)(46966006)(36840700001)(8676002)(81166007)(82310400003)(336012)(36860700001)(4326008)(1076003)(8936002)(70206006)(6666004)(426003)(83380400001)(316002)(6916009)(70586007)(5660300002)(356005)(2616005)(478600001)(86362001)(54906003)(26005)(36756003)(186003)(47076005)(7696005)(2906002)(4744005)(82740400003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 16:05:47.3221 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 957a096d-9772-48d2-3abe-08d94b983c9e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT021.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2785
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
Cc: jerry.zuo@amd.com, hersenxs.wu@amd.com, Wayne
 Lin <Wayne.Lin@amd.com>, Nicholas.Kazlauskas@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

By patches below, we change to clean up resources of a mst connector
and put port's malloc_kref when we start to destroy a connector.
* 09b974e8983 drm/amd/amdgpu_dm/mst: Remove ->destroy_connector() callback
* 72dc0f51591 drm/dp_mst: Remove drm_dp_mst_topology_cbs.destroy_connector

However, find out that mst connectors won't reach connector destroy flow
after hot unplug and hence will cause no more resources for new added 
connectors. Thus, this patch set is trying to solve observed
registration/unregistration problem of mst connectors.

Wayne Lin (4):
  drm/dp_mst: Put malloc_kref of vcpi pointing port when disable MST
  drm/dp_mst: Only create connector for connected end device
  drm/dp_mst: Put connector of disconnected end device when handling CSN
  drm/dp_mst: Release disconnected connectors when resume

 drivers/gpu/drm/drm_dp_mst_topology.c | 39 ++++++++++++++++++++++++---
 1 file changed, 36 insertions(+), 3 deletions(-)

-- 
2.17.1

