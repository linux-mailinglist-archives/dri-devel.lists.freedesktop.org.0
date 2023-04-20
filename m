Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 981CA6E8887
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 05:17:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A53810EB60;
	Thu, 20 Apr 2023 03:17:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2068.outbound.protection.outlook.com [40.107.101.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0595510EB60;
 Thu, 20 Apr 2023 03:17:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dn+960zDwnr6YMT654N8comV/smH7bEHRTekPE6IVDeEDBq2n4FY+Y3dDXgnCZbA1S812PKjhlBM/CY9Urcm5OTxzX/pqqkC5EqDwaXQlXkufqtwF4KgJaDRbM2HJ9AhMnWm8s35hKGaZasXneIcCPpgBYWeQxnJ07htdfwZY2c1dSvarUkI59QSKt2lqgcZ86rgfC1TxZAEnZwF/Ovdr+oWXxF11Qw1UOvReqvk0x9cNeHxqRIfnB43PJa8BPMD9ofsoba6ogGtHrz/3ONuJ+/A9FZa8RQyxl49oESxprt1qoh7PDOOGCnE/L3rKy+m5pjAxdHAjmIQ88gI5BLR7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GLd9RjPvk2LujQ3TdBQYgy6L8/Yu/4SYWfzUtE59IPo=;
 b=nIE9mBo7Ngn4Mq6FKOjrhcvyYfKCoPx0PmtcMLhZKP6onrcjN3PzTs49mtLHxH6HgnZheUl5u1cwHBhDqT7ATmmp57ao8L2GXFlY9ApDuAA8GVqPMvOAZeujg/Pg5I/rGxg1GmDH52SHnG0seCvaXTWIbQmeKW2ZSgGZe9pZDRireUG7lyvkQVqPO24fLc371Jc7tFjfF02SIy0i94prhwDqP/kiiiX3byBcYUDtYrtNJym7IdA4m2tnqh3ujYqmceVN3wUIdOpr3Su8QPrQ4COtA3QBK+gkDdcEH0SJqeYJsW4Tkceqv2R0hcqZs4cOHSqkLigAoF8LJ2AoConANw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GLd9RjPvk2LujQ3TdBQYgy6L8/Yu/4SYWfzUtE59IPo=;
 b=SGkxYB0m01Bm8B5ZDxz+YJd6+ZD4aODKZa/uFkptja58cRYQKGabPb5OCtSE34POiBAoNilJ2KQ6MvCcnHiPs9SUkSeH+pzquN7y3OVTi2LpGpCWGqOW8JZNwLu/K/IdLrhH5avVBm+cimjxglMNbmfeg6O5bQVgrhrKGRcmquc=
Received: from MW4PR04CA0051.namprd04.prod.outlook.com (2603:10b6:303:6a::26)
 by SN7PR12MB7021.namprd12.prod.outlook.com (2603:10b6:806:262::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Thu, 20 Apr
 2023 03:17:37 +0000
Received: from CO1NAM11FT029.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:6a:cafe::14) by MW4PR04CA0051.outlook.office365.com
 (2603:10b6:303:6a::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22 via Frontend
 Transport; Thu, 20 Apr 2023 03:17:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT029.mail.protection.outlook.com (10.13.174.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.30 via Frontend Transport; Thu, 20 Apr 2023 03:17:37 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 19 Apr
 2023 22:17:36 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu drm-fixes-6.3
Date: Wed, 19 Apr 2023 23:17:17 -0400
Message-ID: <20230420031717.7790-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT029:EE_|SN7PR12MB7021:EE_
X-MS-Office365-Filtering-Correlation-Id: d956d118-8c5b-46b4-f42b-08db414dcaf3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KK2ZCA3o6bNbVQpZFlLYwKnl5anTZVVHrFRrPvGyvvtIzgSGvEQCEcvLeXd7/eVBRpyoXwTPbXfty9JIJb1RHVSwzMMy5W/FS/0iJfiMEbrd5P7xU0DulHYvFBFroToL/ERHl3l3km4OwQZDfCsTP5eZSMbEciUYUrwoSw4f+/xb2stX8TCQhzRW0gQAjqrIroS8AgjxuhTVLiqs6kEfWQQzcwdAbqyOuvRDpFEJejzvdmrViE0QKyxYLyS07bqS5DeUcyHH4E1pyxnWPx7O8c1P1N2yFzcbyRRoJIjdqZ/E50JSK+uCJ8pdFoIlt+OjIDxalcWW5T+C6VKXIg7eiB6uIA9yQRheskIVDiM6nl/cPbifksKG+jaM7hH2U7aRVlkTd1jMn+bfJ9xYlJNPfLe731fpTnVUBdib/8zPALLHX8UQAKSqz6BNS4dFJgSnnY4u/TsqWBCyRu9h0ZqYl8uzCtTa9xOKim2qFPPPukOijHfbxVmy/sFA+tPMMSRDJeScGATR2+H7nVy2OwOPbDZY4mNbL2wyfZCJNOet/GwZ/v7MNRC73FBWHExst+zjm7nEa/ss4CSA9cJOwf7peSd5+t84A3rYH1nNLYAyp6aDd4gg/T8zCSL6YbCMgwgl3JqWsJ7qeoT6frxTlg9jbd40MfNYkj4Omauv8zmj/Xtu52dI0jDHMMzR7fejMVeQ
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(346002)(376002)(396003)(136003)(451199021)(36840700001)(46966006)(40470700004)(316002)(110136005)(966005)(70206006)(4326008)(36756003)(70586007)(186003)(40460700003)(26005)(1076003)(16526019)(47076005)(36860700001)(81166007)(336012)(2616005)(426003)(83380400001)(40480700001)(5660300002)(41300700001)(8676002)(6666004)(82310400005)(8936002)(478600001)(7696005)(86362001)(356005)(2906002)(82740400003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2023 03:17:37.4611 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d956d118-8c5b-46b4-f42b-08db414dcaf3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT029.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7021
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

The following changes since commit 6a8f57ae2eb07ab39a6f0ccad60c760743051026:

  Linux 6.3-rc7 (2023-04-16 15:23:53 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.3-2023-04-19

for you to fetch changes up to 0b5dfe12755f87ec014bb4cc1930485026167430:

  drm/amd/display: fix a divided-by-zero error (2023-04-18 17:20:00 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.3-2023-04-19:

amdgpu:
- GPU reset fix
- DCN 3.1.5 line buffer fix
- Display fix for single channel memory configs
- Fix a possible divide by 0

----------------------------------------------------------------
Alan Liu (1):
      drm/amdgpu: Fix desktop freezed after gpu-reset

Alex Hung (1):
      drm/amd/display: fix a divided-by-zero error

Daniel Miess (1):
      drm/amd/display: limit timing for single dimm memory

Dmytro Laktyushkin (1):
      drm/amd/display: set dcn315 lb bpp to 48

 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c              |  3 +++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c   | 17 ++++++++++++++---
 .../gpu/drm/amd/display/dc/dcn314/dcn314_resource.c  | 20 ++++++++++++++++++++
 drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c |  2 +-
 .../drm/amd/display/modules/power/power_helpers.c    |  4 ++++
 5 files changed, 42 insertions(+), 4 deletions(-)
