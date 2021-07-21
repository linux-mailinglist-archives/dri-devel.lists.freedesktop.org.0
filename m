Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 085833D14D1
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 19:07:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 337CC6E854;
	Wed, 21 Jul 2021 17:07:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2085.outbound.protection.outlook.com [40.107.95.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0CCF6E171;
 Wed, 21 Jul 2021 17:07:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rkt31fbgW1Nforwbx1KwL33im4CzX1Gfb4Z0pa+8vmPdeFMEUj6pN13MV+yieUpwLo1ZIJGLYaPEJp0TQ0WxHc4HpL37iGNkhC4R7ouqNDgG+5xun6DJeOIS6UiwdcGM4gJhums2PW4Jt1sq3VHZtFmVSc8I+NDJ+mk4d1k69yOrU9d5aJDiM/Tai8RiPp0FUNxe5/nQak+uw1EYuzFnfH0CuuAlDAfdbYGINX/zJDIfMUCrxghhibTdId+ZKetJvy2/rliJH6RdeGyEYzEJuKKlI2Xe5eASCyjpxHiwiOPtyjeG4Z5jbgAp1GRVM5b5LqN9VesVn/V+sbGZYGU+Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pEYqskQukjsqskSeIb03EZGvo1EJwPKcUiKWtp8/gKs=;
 b=CYZjU6Q5Sf0iZMK/R+UOQjSJ2emV6Rlxkzd+yHiBOKy7UFnlbNFncnnShtqq/fw3u2U0ufiQFBIBSWQC5z9qBKbgjZ8tSoQFWAcZuATtvHHmSlbXGtnH3sibv7lI6JoKklihFUBUHLJODaXpMTie57/WaRuD/HwVmQjM9qjdyx13BLTA1CH0xSJqiRTLv0D24vwuvSpYMe9NUcYUJV7VaaJMjHw4eeJOJgIpYQtkKd6hQ85lKQRDxfPEAzyFWanRemW7475sCFhCgodLbS85H6LuDX60RW+rvHfMXCh44DewWeXAlAvtENJxb4pWG872XcDKEJpBT8QZApjUUSgsUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pEYqskQukjsqskSeIb03EZGvo1EJwPKcUiKWtp8/gKs=;
 b=Bpzodn6ZkEXSQcv9HO7ZwTKOw968NfsiaRTkhwdFxb06OS7+zSpaOTX3zHvE7isvnO1e2Yp1x/pTWOyZPe/Jt5dMn+xrr0rZZWdIq//zJh0n9LVs4nlAPU18th6K+WaFfVdFYA4U367n01ErZes9UKhssgNnbde4J+3Dg39QqKk=
Received: from DM3PR11CA0014.namprd11.prod.outlook.com (2603:10b6:0:54::24) by
 MWHPR12MB1838.namprd12.prod.outlook.com (2603:10b6:300:106::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Wed, 21 Jul
 2021 17:07:26 +0000
Received: from DM6NAM11FT039.eop-nam11.prod.protection.outlook.com
 (2603:10b6:0:54:cafe::a1) by DM3PR11CA0014.outlook.office365.com
 (2603:10b6:0:54::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22 via Frontend
 Transport; Wed, 21 Jul 2021 17:07:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT039.mail.protection.outlook.com (10.13.172.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4352.24 via Frontend Transport; Wed, 21 Jul 2021 17:07:26 +0000
Received: from devbox.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Wed, 21 Jul
 2021 12:07:25 -0500
From: Ryan Taylor <Ryan.Taylor@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 0/3] drm/amdgpu: modernize virtual display feature
Date: Wed, 21 Jul 2021 10:07:02 -0700
Message-ID: <20210721170705.4201-1-Ryan.Taylor@amd.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fab5d41f-be67-42ee-f43b-08d94c6a03d3
X-MS-TrafficTypeDiagnostic: MWHPR12MB1838:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1838BB0FA20E37179A6C968EEAE39@MWHPR12MB1838.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JLdupJIJqoMta2Mr+bIFcaBOt+PWgjqUDAnnm2wHrArd8Wg+daVB3EJFIZkXnNd1Ewm6cs2cY9hxY9qyQB0jeA76uFnO8ZgAj4P6N5J0inwujXBHcjy+R+CouA7PJGroC5v17IrAJJMYxsa7Iy8QuJAQQxgNo18Iu+P4RmWrbhlcAOqdhdBnbj1Crp8E3ti0gl/sQORzBo40bGQiUS6P/psicuiuS4O7T9dXIw3jNOnlmHm+//X/vARVaiablUsfEdTb5xoBOk+G4LHClh9D7ImzlKnDPCiLCw/uO8NQYjjK6OMdvthT4VelqpiUVt/46AF2jphmSzOOITIXm9krCPMCVyUiXmhxfeKJ8RkoALx3UmSryz04R7SAZkbv7oWRAp0d9PE+3mqAKPjRPiJxcECA8k8w/HcObOs84BTrHWIRSFaSiJfcOFrLs8pPsv/1+ew5xxirr8F9mbfesreW8/0LAesvnhyseq7dL+NWzIyKI07F9TU4H9CiLwF+fZZRSh2EJVDGXy0psZcjotScQd0Qlxncu/xls4aACqQkhTf0vKp+zSwviuzk5cj0yIV9AZRuR5TXnTMfNmqy4+cZzLuL7TEodirOgm/9Vys3hKOYcGI6+0gKJZntbrF93BTwGjuul5VmQpytCB6ufTKRY9QEes12MIZwt7uafwAn/NYz/9XB5/fegQQhhWLawhGcXFw1FhYUEehW5ULM44sqqq9b0I6SqXHJIK+CWMEhBbg=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(346002)(396003)(376002)(136003)(39860400002)(46966006)(36840700001)(54906003)(36756003)(81166007)(356005)(6666004)(47076005)(478600001)(2906002)(316002)(336012)(1076003)(110136005)(82740400003)(4326008)(7696005)(5660300002)(426003)(8676002)(36860700001)(2616005)(8936002)(82310400003)(186003)(16526019)(70206006)(83380400001)(26005)(70586007)(86362001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 17:07:26.3103 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fab5d41f-be67-42ee-f43b-08d94c6a03d3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT039.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1838
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
Cc: melissa.srw@gmail.com, daniel.vetter@ffwll.ch, rodrigo.siqueira@amd.com,
 Ryan Taylor <Ryan.Taylor@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The amdgpu vkms interface provides a virtual KMS interface for several use
cases: devices without display hardware, platforms where the actual display
hardware is not useful (e.g., servers), SR-IOV virtual functions, device
emulation/simulation, and device bring up prior to display hardware being
usable. We previously emulated a legacy KMS interface, but there was a desire
to move to the atomic KMS interface. The vkms driver did everything we
needed, but we wanted KMS support natively in the driver without buffer
sharing and the ability to support an instance of VKMS per device. We first
looked at splitting vkms into a stub driver and a helper module that other
drivers could use to implement a virtual display, but this strategy ended up
being messy due to driver specific callbacks needed for buffer management.
Ultimately, it proved easier to import the vkms code as it mostly used core
drm helpers anyway.

Ryan Taylor (3):
  drm/amdgpu: create amdgpu_vkms (v2)
  drm/amdgpu: cleanup dce_virtual
  drm/amdgpu: replace dce_virtual with amdgpu_vkms (v3)

 drivers/gpu/drm/amd/amdgpu/Makefile      |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h      |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c  |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c   |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c | 639 +++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.h |  26 +
 drivers/gpu/drm/amd/amdgpu/cik.c         |  10 +-
 drivers/gpu/drm/amd/amdgpu/dce_virtual.c | 780 -----------------------
 drivers/gpu/drm/amd/amdgpu/dce_virtual.h |  30 -
 drivers/gpu/drm/amd/amdgpu/nv.c          |  20 +-
 drivers/gpu/drm/amd/amdgpu/si.c          |   8 +-
 drivers/gpu/drm/amd/amdgpu/soc15.c       |  10 +-
 drivers/gpu/drm/amd/amdgpu/vi.c          |  14 +-
 13 files changed, 700 insertions(+), 844 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.h
 delete mode 100644 drivers/gpu/drm/amd/amdgpu/dce_virtual.c
 delete mode 100644 drivers/gpu/drm/amd/amdgpu/dce_virtual.h


base-commit: cfd09f1e35231aa7f69845b6195e7d935e81421d
-- 
2.32.0

