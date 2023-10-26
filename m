Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A077D7B5A
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 05:55:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C659710E749;
	Thu, 26 Oct 2023 03:55:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2045.outbound.protection.outlook.com [40.107.243.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED84B10E749;
 Thu, 26 Oct 2023 03:55:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OT+pQiaqih/MRyQDlbCk+FVwWJW9qVVbRIk/dEcokQsnlsUy15t2axP64iQF5k3JRXn6/gZ+G6VFPWrzgNKGoeYs8h3iZNlSbg23aVvqUW5EQ1mzMslmZ5iGwe4FLloOP51TdHMACfl96572nlgtPeOls4y+yEqOInfM6WQRnr4YVQDjAFSUBRWmU1QepJLD9bsuU+Fxm6opMfp42v1O9bYj9ahr0VAMyg0Zu3i7h/dJZkJSiab6VQt9d3OBhOBWnyHB7bZsah8mKFjdS/gGuWoWbv2nUVKtNcMWOhLJairPaM2T6eXRTCtqTRQr5QThAo3kBHWNosXEB+WGJsoAsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wlr+m+8IXKhVQD4zLG6tdh95UyKDhgSjGdsYL6556ig=;
 b=S5MKCv9Rga13VhLC6EyOUICvXMKLdwPZYya315ShmT2ZmIrmPUEsuESzbdWqMQZZ7pFakwz/LdGaPuTnIwqWNZqZIjK11VNWn6NOzRbm9mIeswuO0tMv6NOzMEiLZIEyc7HN36cE8cqWpmoUqkCVAZyqIJueYoogLWsP5iDGeGFMoUWyzCqf4rdC9yt8tqBnjG9FN7m28bqa6nhxHFoHpdGwVlucPAPDwnxUyh7qQLvHBcOLWaQJMBP7UxnG9okXHw2LDBm19pNDvKQOAReXMrFVwVULCEdbFxM6X3YBpffLQmzp6dduV48i2Zk3ZXIHokBNF8vpXA+/HktaV1aEwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wlr+m+8IXKhVQD4zLG6tdh95UyKDhgSjGdsYL6556ig=;
 b=eCdW7gfh8TegVdHZLthrTRNCeaQvk3JSBhgbwRIUcROWCR8TpwJorefDpAfsKVV1pNu0mnye8PPnPYgCv3oa+2GHEqKFXrd9hcYcSOld1NrvRROOnD+sGkkdDthndSSYBi47dMTjsgOOJD3To7weXA4Tzktu9ePH2vd62iWIeBI=
Received: from CY5PR14CA0017.namprd14.prod.outlook.com (2603:10b6:930:2::16)
 by SA1PR12MB8965.namprd12.prod.outlook.com (2603:10b6:806:38d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Thu, 26 Oct
 2023 03:55:08 +0000
Received: from CY4PEPF0000EDD7.namprd03.prod.outlook.com
 (2603:10b6:930:2:cafe::79) by CY5PR14CA0017.outlook.office365.com
 (2603:10b6:930:2::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.19 via Frontend
 Transport; Thu, 26 Oct 2023 03:55:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD7.mail.protection.outlook.com (10.167.241.211) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6933.15 via Frontend Transport; Thu, 26 Oct 2023 03:55:08 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Wed, 25 Oct
 2023 22:55:06 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu drm-fixes-6.6
Date: Wed, 25 Oct 2023 23:54:52 -0400
Message-ID: <20231026035452.14921-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD7:EE_|SA1PR12MB8965:EE_
X-MS-Office365-Filtering-Correlation-Id: 685362bd-1b39-45fa-8dd9-08dbd5d75870
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gVjjcZ+aUHU6/V6kCwtczDJMnOiq88gcPU4A/Pss/Gay+4gfaz2LoCRbfPAnbfaMwBwQtGTsWZMLslTK3Mye3JbPyinauxbGWEmsonH41o7lHGTY0+W7MpI4UrbVdSLqClA4u0vF8B/aJv6lNeVOISYFQA6U5jO0ZV/RL8nIAkoOsOrm9Ppb9e4DxtFEjCaCP0GlnmVsybyPdSnV1GZsmc+dd7HVGp7KlvXlMPhMXLAVMYx3TCYTykQ4Gb1y6ZSFqfYIQzKplJhKc0m/Plu0vVGtf8CTMOZTHyFQzkfsoDLQoIUq+ELe+E9wTnyGmtafzw4wAkWv4mHy/1rZIuK2QD0Md34mLz9Lgr6NvSb86gglduBMTwV4oplxaOcRqlMjmITrXg48UxZiTideXf19kz+z85jli2oBVJZavFDEr2rKLRbMFK/9Eh2BKXXHaCbvVeVWRIlsgBV44jyBaGlCfmmUaEGDqT7I3YaonANxms+dpT+NlLB2Ox2hZm9BGxw7RbvpfYHDPNirbq5v34KHwb/FzhBYXQIOYn1yZd6saQ5p0UiEx7RJZLIM+tkwEb1KmTKFAV/vW5QqiB5LeE3sEMoFv45Bn5Xcm5cbytSGs2PXGAzFjbszd6RDQwpjLnvOInNPiq5wsoivrGLXPm7qjl0iL2bRIUgl5xzWMq8Xk8JfVwSM1UgHwChN31mC4OwGk7M86lGGS06ss+JsSc2nV2GUd9MF4HrfJzadOzhlZPIDHv0fcdsqu34z6ve5Sy96
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(396003)(39860400002)(136003)(376002)(230922051799003)(82310400011)(1800799009)(451199024)(64100799003)(186009)(46966006)(36840700001)(40470700004)(8936002)(82740400003)(41300700001)(70586007)(40480700001)(5660300002)(4326008)(40460700003)(8676002)(86362001)(70206006)(110136005)(478600001)(966005)(316002)(4744005)(36756003)(2906002)(16526019)(4001150100001)(26005)(336012)(356005)(1076003)(47076005)(2616005)(426003)(83380400001)(7696005)(81166007)(6666004)(36860700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 03:55:08.0575 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 685362bd-1b39-45fa-8dd9-08dbd5d75870
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8965
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

Hi Dave, Sima,

One last fix for 6.6.

The following changes since commit 05d3ef8bba77c1b5f98d941d8b2d4aeab8118ef1:

  Linux 6.6-rc7 (2023-10-22 12:11:21 -1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.6-2023-10-25

for you to fetch changes up to 64ffd2f1d00c6235dabe9704bbb0d9ce3e28147f:

  drm/amd: Disable ASPM for VI w/ all Intel systems (2023-10-25 09:53:17 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.6-2023-10-25:

amdgpu:
- Extend VI APSM quirks to more platforms

----------------------------------------------------------------
Mario Limonciello (1):
      drm/amd: Disable ASPM for VI w/ all Intel systems

 drivers/gpu/drm/amd/amdgpu/vi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
