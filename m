Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDFA786686
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 06:14:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB56010E4E2;
	Thu, 24 Aug 2023 04:14:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2055.outbound.protection.outlook.com [40.107.223.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDE2910E4E1;
 Thu, 24 Aug 2023 04:14:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G8utceYLhZH7fJeOzWlbkFEvkA4ILkL6pxqo/txVk/hFctz6hdwTShQXexdesxDH2qwCuC5XOAaPduLRFt3YrH9+wYlmdT1uIhLFxpSael+IfxmclE7aJIXYyByZ+vngF5HEHSDyxBaRjVfxqKHL+K8dMmqeVhLj33JVVM35xuTTSeIKvauemz4YKmo3V9Fd3NZ98/8CWFy5Z6e10Co3iLY7ifpsp1J8+peqRDp9LpPMNarlR7CbLbcVcNCDIoRbf1PObr3e+H8buthdBIlXGNgUkSnqEYAmnx6dBqj8EqTVHbQ6sZuA8pMc1NEsQ5nOfi0BP97HnBXR58EN2RxoAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QD3zg2UYY7iyiiOr63BJWwnqypCMMfkEVY5lGc5uNhc=;
 b=P1deKFol17Vrf1zXUvvdl2EZsZwS9a4Joj0DR8XiPKljF3PeZF6Nk82Li3G7twUvsERmw/nLgmu9efR2bppR+Vfo9PRweppuIgBk0m0B87CHP+Y0LT74gCKypJ4ke3kilOWZE+Mg4eYHL0X0znbdqTiELSRn6UoNhzn4nCqseAJFVqw2DPEihmY3H5q98n/n3g+T2JU5u+jcvQCbtMQioU8+fvDLWc0LuW3g+yy7Q/ukP62pMMGe0ZyR7SHs2ceoruY8gZ+PPe9mRY5aCf8WyBr4/61V9yMBu742MnHPI+Wwt6+EYry7H6105wjKwFc2X2e74dTmq7zqEE9n8xF0Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QD3zg2UYY7iyiiOr63BJWwnqypCMMfkEVY5lGc5uNhc=;
 b=w7LQuO2QqQb0JlD1CTFY1U9tbdnXJBOYkl8E3kFw6JRkcZmg+nEN7hFKr2dVbFWEtkeSElGc6G93EKkNYw6Gi03+zjAvhh3lzDMlKfripDXbYA72sfDQIoGkvswgpCBgD2+/Hlmw1vrO+m6sxSD2CsNhHOEksdh44KkvUUeXorU=
Received: from BYAPR07CA0035.namprd07.prod.outlook.com (2603:10b6:a02:bc::48)
 by BL1PR12MB5922.namprd12.prod.outlook.com (2603:10b6:208:399::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.26; Thu, 24 Aug
 2023 04:14:15 +0000
Received: from MWH0EPF000989E9.namprd02.prod.outlook.com
 (2603:10b6:a02:bc:cafe::1b) by BYAPR07CA0035.outlook.office365.com
 (2603:10b6:a02:bc::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.26 via Frontend
 Transport; Thu, 24 Aug 2023 04:14:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989E9.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.15 via Frontend Transport; Thu, 24 Aug 2023 04:14:14 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 23 Aug
 2023 23:14:14 -0500
Received: from wayne-dev-lnx.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 23 Aug 2023 23:14:10 -0500
From: Wayne Lin <Wayne.Lin@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v3 0/3] Refactor and clean up codes of mst
Date: Thu, 24 Aug 2023 12:13:55 +0800
Message-ID: <20230824041358.4164010-1-Wayne.Lin@amd.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E9:EE_|BL1PR12MB5922:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e08f1ba-5c8d-4a11-f856-08dba45893f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Zx7fXMlvn/ljhTG8ZLFcE3RARY7PpksMJ6FP68rPB+rSCsG014KDYvSQBztOypwt0NPyT5m7G7bUrC+fzyxHJWutJGbcHuWgidNuqZ7d2r1bj2KhfrG1184MCCJ6SqOY6apjC6N+ik78y3dsXj8UkC4a/dLOpHpy01OZAFCHMiV3WwobB8wGuebexbW+SoqPgJBMd/e8Cd7Df/ZPH6oWFKbh2lS/e9lOEhnxYOLNPMZDOanqvP9DQQD8tIIWmqOY+/jN30UM+LuVrkDBUsdsFaszEUwO09WPYfxfFA896bsrbot0sLJmhrUZuvkTZoH3R+J0G7o1SNp1wQbbkWgnC0F50pSfinv3LK2JpRIKfnKq1KvA4JsJ424aIDV+WlicfFlbLQdomzQ219wSClENR8HBwW/A+OVuKqSiEJkkRA3+2xB0bCSiTdgsB0nRWaahe86xWRG6iRz4rFKir/EcBMVuJH77XTzlHGbviAvmCGS7lx5qZdUZkoHt1V077XogONjURCSWcz0nXSS28IMM9CqiMndL9Rhijh9qZaSBuP7ZfY2To5ega8X3+wRb5EDCW9MV3joR9jIRHKKzMAN0cw9ZCWvZaW4B4N1xi6m1+pn/ksbImlwIlY+uo+hs52/LnsjuclPLtZ2j4hDzzKuYSU41AeuyUG5P1i11eMwrAOMY4ptuL1O/e4MtU4jI7QoAOOD54HnbLLKRa0fa2400c+1oSR2yEx4tWpH0HnbAlXcvyYLy2Zb6xl0/Q5vtH4TxIe2GjKnF64oybOFV7wCdFg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(396003)(136003)(39860400002)(346002)(376002)(1800799009)(186009)(82310400011)(451199024)(36840700001)(40470700004)(46966006)(356005)(82740400003)(6666004)(81166007)(40460700003)(7696005)(336012)(426003)(1076003)(40480700001)(26005)(47076005)(36860700001)(83380400001)(36756003)(2616005)(316002)(2906002)(41300700001)(54906003)(70206006)(70586007)(110136005)(5660300002)(4326008)(8676002)(8936002)(86362001)(478600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2023 04:14:14.8008 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e08f1ba-5c8d-4a11-f856-08dba45893f6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989E9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5922
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

This patch set is mainly trying to organize the mst code today a bit.
Like to clarify and organize the sequence of mst payload allocation and
removement.And also clean up some redundant codes today.

The main refactor one is the patch
"drm/mst: Refactor the flow for payload allocation/removement"
which is adding a new enum variable in stuct drm_dp_mst_atomic_payload
to represent the status of paylad alloction, and then handle the payload
accordingly. Besides, rename some drm mst functions to better express the
behind idea.

The other two patches are mainly to clean up unnecessary codes.

Changes since v1:
* Remove the set but not use variable 'old_payload' in function
  'nv50_msto_prepare'. Catched by kernel test robot <lkp@intel.com>

Changes since v2:
* Fix indention

Wayne Lin (3):
  drm/mst: delete unnecessary case in drm_dp_add_payload_part2()
  drm/mst: Refactor the flow for payload allocation/removement
  drm/mst: adjust the function drm_dp_remove_payload_part2()

 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c |  60 +-----
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 189 +++++++++++-------
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |  13 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c       |  17 +-
 include/drm/display/drm_dp_mst_helper.h       |  22 +-
 5 files changed, 159 insertions(+), 142 deletions(-)

-- 
2.37.3

