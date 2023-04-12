Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5F56E0140
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 23:57:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8D8A10E9AD;
	Wed, 12 Apr 2023 21:56:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062.outbound.protection.outlook.com [40.107.220.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D87110E9A7;
 Wed, 12 Apr 2023 21:56:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P1cMisLQbWwCvE+YZKUjmCxFnJ8z1ObsnkE24OfnPdhZogi+Up+viMROwfjvzbt/fmqrmqYEhwx+rwVR0SsbsWDldd2Sgph/94N3xXjo9zHH07MHFHPzFJzPh/coQFqdYCy8JijDmh6RnOms+pnbUv6YRY91y9LWvtu7H+vPWVFPAZmZ10d+Sk8Lg5mqCXwu10SfCiGxSmL/pBrHfvYHtEijm7bO9RAhEdJNMFusB8t/zulCkKctfRYutyl9oSyVNF5JLqURJKe2QRnoU3pLhlTQdIvm9TxEGZnWX5H6U1G1pTylkyXxwEPqP7sXd4vyQHn3b9nGS4P0b37aW63MDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gEp0PtbEk2gdhw5sAM68xlWFDzznBeJKEZFxz78wd8Y=;
 b=YH5V/24dzmEAeqfT8f9Wk1YuYLsgYPH4xdJxcELURGp+3kzH6zS3RKg/2fO7dzLOt4Qbm0G0MmUh/HojggDr4+VXwkyppkzvOyJlsgs6ELqeR9Vkd4IIjCE2fndsrHYH8n29isy1aqazxbCNp/JZC71dVH7PHOJrI1b68N6rF6BcUnLwZdrAtkujsQ7KRobcQqBaHq6WZFkuY3m69t4fDbCoJIi0Bfr0UnaeYSPlcoDsxYU0GiPj90UEWA+Ail8Dg3ArNhWZdGqTHubv6xepvst3l0KQYkr+QzgDvZC+RDo3FKNkzB+Hmm2sJrEbx90l+3mQ8UHuGRXt9XRgvSQYPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gEp0PtbEk2gdhw5sAM68xlWFDzznBeJKEZFxz78wd8Y=;
 b=VBW/Z/iKT7RQvvfwflPPlwhSmZj+gXZrNfL1CJE0eYf6tsmC178XPRzNI2vQTJvYFHx9RtMotv8HoKnlbXkeWemeRJjW+iTqiIi+MU6RFiYXHsAB0bc2kb28Y9RQ54DPUkWbN8RJWloC3OLMndIESyCh2j20bnDivuDJCDHhZyU=
Received: from DM6PR07CA0106.namprd07.prod.outlook.com (2603:10b6:5:330::15)
 by CY8PR12MB7313.namprd12.prod.outlook.com (2603:10b6:930:53::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Wed, 12 Apr
 2023 21:56:52 +0000
Received: from DM6NAM11FT093.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:330:cafe::63) by DM6PR07CA0106.outlook.office365.com
 (2603:10b6:5:330::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.31 via Frontend
 Transport; Wed, 12 Apr 2023 21:56:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT093.mail.protection.outlook.com (10.13.172.235) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.31 via Frontend Transport; Wed, 12 Apr 2023 21:56:52 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 12 Apr
 2023 16:56:50 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu drm-fixes-6.3
Date: Wed, 12 Apr 2023 17:56:37 -0400
Message-ID: <20230412215637.7881-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT093:EE_|CY8PR12MB7313:EE_
X-MS-Office365-Filtering-Correlation-Id: 463f1436-ed6e-4bec-9cad-08db3ba0d2d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8zh+OqQPg9y4pa7Ej4Qd/tQmbcQn5p+IKpiExmU6vekA6yIdTkO9bdPYvG1jc0+1Wr8P9WH0+R07tgOiRyqNpA3xwIOIFk/0Azxr7ZaepXGcjcijpU290x3Lx3dLntkdSGiq/jQpeJm96OZv9eHrhtOC7n+4zGCzmsTTXc7MuYYbJFjM0afhVxuqLlM9pvn2lfCAgCHr3qn0GZkk89gZOZQJSO95Km4pFOdxkf8uLjiuf3SJvkrTZs/Q2lzA2lCpaMvLp+aGJBt95GTdGPzLEl+e4Rgq/GOUE2X7SVtDZEwCEsZoL9HThGSs7RvuakOTlJqgLoK+WmvZVhqCPGmOjT34q+SOAu3uJasAdw+XeIwCvmO+UUWrR56UAu88yAuUUZw3iEcvgwd61QI5UDO6dpV1QiJVXNWi1kqjtinduL3pHWqsxQa2fASZsUip1YqQScyAR1FCQ3TE/h7AfsLtyFJt4a6qTRYwfkULSh+QP8YLauTPpw0Av2Tjk/ECnthkXf2211pqLj3GgbmcEjkgn9sTXrieDb7pv1VSUbYJubkP1d7Je2q+to6naRwcHKmyYQyojZLj4Bx85gZ8ie/piGZf2mRwCPzaFTpUHsnYy52XAoOqJFuxlLRdj/6pc+x7lNxTuq+NlqAV4z1BPMVXrFY2MF5lKzK+9zhwHoGkTEIDjF3zwXy/8llU0v8HioV9
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(396003)(346002)(136003)(39860400002)(451199021)(46966006)(40470700004)(36840700001)(40460700003)(478600001)(7696005)(1076003)(966005)(316002)(26005)(5660300002)(16526019)(110136005)(186003)(40480700001)(2906002)(6666004)(70206006)(70586007)(4326008)(41300700001)(82310400005)(8936002)(8676002)(356005)(81166007)(82740400003)(36756003)(47076005)(83380400001)(426003)(36860700001)(336012)(2616005)(86362001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2023 21:56:52.0165 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 463f1436-ed6e-4bec-9cad-08db3ba0d2d3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT093.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7313
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel,

Fixes for 6.3.

The following changes since commit 09a9639e56c01c7a00d6c0ca63f4c7c41abe075d:

  Linux 6.3-rc6 (2023-04-09 11:15:57 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.3-2023-04-12

for you to fetch changes up to b9a24d8bd51e2db425602fa82d7f4c06aa3db852:

  drm/amd/pm: correct the pcie link state check for SMU13 (2023-04-12 16:11:22 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.3-2023-04-12:

amdgpu:
- SMU13 fixes
- DP MST fix

----------------------------------------------------------------
Evan Quan (1):
      drm/amd/pm: correct the pcie link state check for SMU13

Horatio Zhang (2):
      drm/amd/pm: correct SMU13.0.7 pstate profiling clock settings
      drm/amd/pm: correct SMU13.0.7 max shader clock reporting

Wayne Lin (1):
      drm/amd/display: Pass the right info to drm_dp_remove_payload

 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  | 57 ++++++++++++--
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |  6 ++
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |  4 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   | 87 +++++++++++++++++++---
 4 files changed, 135 insertions(+), 19 deletions(-)
