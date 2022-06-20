Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4DE5526C9
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 00:03:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BFDD10F718;
	Mon, 20 Jun 2022 22:03:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062.outbound.protection.outlook.com [40.107.223.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C67E010F718;
 Mon, 20 Jun 2022 22:03:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VsPcrE7c9qOyX/QV12+M2J5A8NOQhA3S5SrzCWFTKe9muDdsf8rzEgOuFyKmL/7h5DlSu2zwc9VQZmDGezcS35tjQNNnOmv7P4qoR8aI69ZUqV3dov/zlXOzgCsx7g9+5aOy8tQLj3WjSEzzxj8nrPuWxmuxuM0b5gSZNWnxj3cP1RCVcOzAxbRSj+gAmB/EBKe+qSjhUvqmKhrOFJXfFxfnXfrRK7bygPd8CfmpMwj3cQSSF5jTiFcmMEfTX5Oe/hJSt+YYwTNfD0FETunOlKsZdEIRXpU56faMrIdLMihTLi+u6BiBuxDPyMSRCF4OeZEyaS12QjIzjL9s4m2IJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jvJ5kfZmmZsZtf+4ZKXqzuMwiVVcEsw5hwOuMrhcIoI=;
 b=At91XSnjwc8kV+VyNyDrNs0tvVpbczrI5czFds1U19y1BO80HnjL/ek1XXUhDFfe2ZmdDOyFd9r0aEEg8SsmkM0oUHBD7UqYfcCyK14tXJ/slFdz06p3cAGIVaWM5YhT26RvF9ta42D6bgxqsmF5PDbwES5Etd6jA+roNrxfqEONL5S7NSqMd/SDcrQQp/BnLR5RKilv45z6u0Cur2vQn3ESfOYIY5KhAhQp8CMwJKh3hN38lxr9S7Be8mo3maBUBUAOpL9Jv9sskOD96VZrD/hn45i++8iAkpgsg+GA7CHx5yTnOLYur0Cb/7r9VJ2kRUftogmLK3Ej9MaDFTzChA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jvJ5kfZmmZsZtf+4ZKXqzuMwiVVcEsw5hwOuMrhcIoI=;
 b=2h9HdOqyBrDjlIyfRFsb7vCbZE/+upND0CvNYOhsFZpe9Vt8PjnW367fH+zmQpRVO5siNEw3opFGRhwYUJJ73JxktUjNKnajadnZMZgsL0W1ZJCd3/H00sXJ0bEr4qQPkm3ggwP9OwgYLBlJWzuhSPs9czAwoUXH/yvnB1+jXLc=
Received: from MW2PR16CA0068.namprd16.prod.outlook.com (2603:10b6:907:1::45)
 by PH7PR12MB5925.namprd12.prod.outlook.com (2603:10b6:510:1d8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.17; Mon, 20 Jun
 2022 22:03:37 +0000
Received: from CO1NAM11FT021.eop-nam11.prod.protection.outlook.com
 (2603:10b6:907:1:cafe::5a) by MW2PR16CA0068.outlook.office365.com
 (2603:10b6:907:1::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.22 via Frontend
 Transport; Mon, 20 Jun 2022 22:03:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT021.mail.protection.outlook.com (10.13.175.51) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5353.14 via Frontend Transport; Mon, 20 Jun 2022 22:03:36 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 20 Jun 2022 17:03:34 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 0/5] Rework amdgpu HW fence refocunt and update scheduler
 parent fence refcount.
Date: Mon, 20 Jun 2022 18:02:57 -0400
Message-ID: <20220620220302.86389-1-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9736494c-d6ae-4f37-26ba-08da5308b9ac
X-MS-TrafficTypeDiagnostic: PH7PR12MB5925:EE_
X-Microsoft-Antispam-PRVS: <PH7PR12MB59259277148B9688EA53B35BEAB09@PH7PR12MB5925.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hvMNnIbDG5ATbdn8Y70LDj/oCqy4V3pYJza6oSfims3zPjolM13FUkwjend9c9pFuOcqXLNpMgVEIDWttKHds06RYz6cDEe5sgRom9nTm2Lp/FX4YhaCv/rquglKTRsw73lTU6TQXTigYLbg1m9JsuHkzy9RJpH0X3DrGKcWbLjTyUAipxmtC22+MnUaEKhv0ar9/qiSqb89UgpUmwLw5UZYWR0knpyRD5a+SpNTKF3rFcJ6TmRl/+YVTaM5doUvPON4wvdroSwv7ddR/FJH2sjqRkx4pzfYmZxjTXLRfrdXHjUMDuHiGX7pwmoTk7jw7E84iRs9J2KJ6oaDZAsv/0TLJdpmJTxAxnolUQPk/WJ73GkPmlCVNZ05WxuJXE++xPNrh/NSDfNx5hzpqMB6FcjcrDLNtO9YSD/2vuVR6m2S/kgq6ZO7LgdfSGn0gFXpiWGTRUONmaSFl4MY32JeINkxhy8qMEmTXfw7HnHkJ/7oVsbgzS5no3/JcmZ4Kli38f5JkgDzQnvB7c+Yt6k2UCQ2B5Kc/OvMAPeceIWQo9jTk0sdPiUn32kLfbjAPjsMQr/coIrmCBAgegQKvSS4INCjslZH21ucI/PNIU9DtM2hkpweoJho2tOHy2A4N8qyzQq3Vi4o+GOvQQXURh6mNxcdT7aOLb86rjeqAvBHD6XsYjmsR0zHxcmSfVypHN9qNThNwcy8ujv1bQSxJ7ISHErMwaxnUr4CCtancwUM1YO4bKAy6M9J1sLGb1CRbjPZ9w56xnNGWinm1e8vQQIS3oXTE3vNryVUaAwYVPBZlmgoKV9K+SSMS0y8TMWShCE1tHwPiLoj1xbz9chRKIikxMqzBnS9cEpx5ACxSPolocA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(346002)(376002)(39860400002)(396003)(36840700001)(46966006)(40470700004)(83380400001)(44832011)(40480700001)(450100002)(6666004)(82310400005)(336012)(966005)(186003)(16526019)(81166007)(86362001)(47076005)(356005)(40460700003)(41300700001)(426003)(8676002)(82740400003)(26005)(70586007)(7696005)(316002)(1076003)(2616005)(36860700001)(70206006)(4326008)(478600001)(5660300002)(36756003)(54906003)(110136005)(8936002)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2022 22:03:36.4382 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9736494c-d6ae-4f37-26ba-08da5308b9ac
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT021.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5925
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
Cc: jingwen.chen2@amd.com, Christian.Koenig@amd.com, monk.liu@amd.com,
 yiqing.yao@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Yiqing raised a problem of negative fence refcount for resubmitted jobs
in amdgpu and suggested a workaround in [1]. I took  a look myself and discovered
some deeper problems both in amdgpu and scheduler code.

Yiqing helped with testing the new code and also drew a detailed refcount and flow
tracing diagram for parent (HW) fence life cycle and refcount under various
cases for the proposed patchset at [2].

[1] - https://lore.kernel.org/all/731b7ff1-3cc9-e314-df2a-7c51b76d4db0@amd.com/t/#r00c728fcc069b1276642c325bfa9d82bf8fa21a3
[2] - https://drive.google.com/file/d/1yEoeW6OQC9WnwmzFW6NBLhFP_jD0xcHm/view?usp=sharing

Andrey Grodzovsky (5):
  drm/amdgpu: Fix possible refcount leak for release of
    external_hw_fence
  drm/amdgpu: Add put fence in amdgpu_fence_driver_clear_job_fences
  drm/amdgpu: Prevent race between late signaled fences and GPU reset.
  drm/sched: Partial revert of 'drm/sched: Keep s_fence->parent pointer'
  drm/amdgpu: Follow up change to previous drm scheduler change.

 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c |  2 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 27 ++++++++++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c  | 37 ++++++++++++++++++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    | 12 +++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h   |  1 +
 drivers/gpu/drm/scheduler/sched_main.c     | 16 ++++++++--
 6 files changed, 78 insertions(+), 17 deletions(-)

-- 
2.25.1

