Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 556CD57BF74
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 23:09:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CB7214AE06;
	Wed, 20 Jul 2022 21:09:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9DA214AE06;
 Wed, 20 Jul 2022 21:09:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hlk10Te/Ej/oYpM9TG9al4/iUKGdR2Hd9sMYtMZHjyHK33I0NAaFZEBvvEIpIBSuetzaElojShz22UPJ78DeIU178JtL+P1XrM730XN5HeeyM5eiVGUonCpNORzyz1zS+6lLYjCyCwbbejwY9Jk2h88leHJWUdg0pItI12dQtCnpDBR5IhbuSmPC1PM8irJFO3xNlFnuhUkoaS0ZDzzF4MxKxUQVg6KhK7wLEaFMSSfsVpWsPjIjO8jNUl+c/o8kCamNdOqdEdhaKlhB5HpW/u1zpKiRvnPbc/XdgE8VsdmkzGN4y16W51U/sTvaB1eHOMDw/C0Un06UbIKQqyJpJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sn198IrSCDDnI7Pl/XV+lMfBQ7onEfAYGdcKJXh+vnU=;
 b=d/IkGPnKjYcE/MBBBVZ9qLJJW+KHqvnDWA8Fc4on4hbgWgt7uYAFCmChqoC5x4Cp7SEojPg68Td95K81MrvrlwHIKcm/a7nZ8Yr5xSdWlFyKsFwYI9nd4U8OF6+WcaRx+o4UniBJ+qUTIKca8vuRyen6t1O85bC3m6Soo/2aSFi+egChyNEZQlb/6LX+/q4UiUDl48WXtEHDrw1eP+UsDB67KFRNXbankfvxzb6YRHQlaKmXRjGKH/28gIxE2HeE2ms3vtdHRs4pEOlS5zVX3wOGKtYqXfYiIpkBRVyukoGvoSpBsOzAtAxb+XqkSgylsbno7uU6zKSYNpIcm1y6Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sn198IrSCDDnI7Pl/XV+lMfBQ7onEfAYGdcKJXh+vnU=;
 b=z7ytmz6N6P7BXXUWH0q8sy1UjoKbOwoJsQbODfH4C8wzgW54e74ZPbHuikj8xJPuE86tsEPKZWoY5lXlcJIykZe5ggh9ngUprvq7ej8MP3znYlcs6NF3TpoXSsu+7LN+Rv/rUBfHubT9yDpZDAtkz7wjwXmDiyifTgVdQJvWfPM=
Received: from BN9PR03CA0130.namprd03.prod.outlook.com (2603:10b6:408:fe::15)
 by MW3PR12MB4540.namprd12.prod.outlook.com (2603:10b6:303:52::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.19; Wed, 20 Jul
 2022 21:09:39 +0000
Received: from BN8NAM11FT011.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fe:cafe::4) by BN9PR03CA0130.outlook.office365.com
 (2603:10b6:408:fe::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.13 via Frontend
 Transport; Wed, 20 Jul 2022 21:09:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT011.mail.protection.outlook.com (10.13.176.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5458.17 via Frontend Transport; Wed, 20 Jul 2022 21:09:38 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 20 Jul
 2022 16:09:36 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu drm-fixes-5.19
Date: Wed, 20 Jul 2022 17:09:17 -0400
Message-ID: <20220720210917.6202-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 117559bd-6af3-41d8-e8df-08da6a942804
X-MS-TrafficTypeDiagnostic: MW3PR12MB4540:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dVx0rS5T/hWflJ9W4JampkbQsSW2yIzFfXTGRqvq2eXdibpmVeEeBYJVv2GuqAJbGdoEhLGjUqtwlqDfxKrv1KfzWSAMhIZBiwwmp9YOepZN8dmFal1VnH9BxO8m+bXOUF8xTyzlA3LPEffW6NinTMpc7QOgUUi1byEEzW5FI2cZxzAbNljewleaU3rErc2QlRjbOlVCx4s4XRtMqUNsNsCOmnKfUpjY1UtXGNBMG6Xda15NqD3GZ2iWROPsEJTbpyjSRUCj5eG9YdU9MMn0BQrdkyNrOVvV/uW04KaMO98GaY/JXgONcIsp+tVsTI+VG7l9uwLy2WoBX8IQx6ASqX0BX3eZ3qF7ka4lqP2MQj8pv1oSDx2IxxNTcQ4YchdWUemGkVNCpVX/JmLfD0fHZeTMOStqfTlSDyOKdQbmKRb5MA+9ZvCuroXV9sPWZ7lSsDB31fQEcRP4qxcK6P2GUQelpDtG7jy9bkGCTlBbjSUgpDwgGfYLLYjTL1AkEP5WAkLBDaZNHYXiws/ddboI+h7Tp4SI8jXoNnx7ZG5ISsWZ1zTi4mJCuhZPx40JguyUysd7Dp2PCgbEFBlVAjxyro2h2uJ7BkW1qaWv1SaevuEWVvkgl4p2gUPy6S6zbUNdsI4VM5IvtheEU42KeWVV228W6MRuvueoWmjVU4Ev9xeaaK1gGzUuGbNZ9frK3JjmStAbnY5AQ1W+NOT1wNAa1NgGsEWPOHlN8bbMdZT7iawKeXBtJXpuh5uADCLcPk2yEA+j2P4wCFwBXl46nUSJWctYqoXhlPsPbJ00mn8rrvE=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(39860400002)(346002)(376002)(396003)(36840700001)(46966006)(40470700004)(8936002)(6666004)(2906002)(26005)(110136005)(82310400005)(316002)(966005)(2616005)(7696005)(36756003)(36860700001)(40460700003)(41300700001)(4326008)(5660300002)(1076003)(70206006)(356005)(82740400003)(40480700001)(81166007)(8676002)(478600001)(16526019)(426003)(83380400001)(86362001)(70586007)(47076005)(336012)(186003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2022 21:09:38.4835 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 117559bd-6af3-41d8-e8df-08da6a942804
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT011.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4540
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

A couple more fixes for 5.19 this week.  These are in addition to the
PR I sent late last week:
https://lists.freedesktop.org/archives/amd-gfx/2022-July/081597.html

The following changes since commit 2d4bd81fea1ad6ebba543bd6da3ef5179d130e6a:

  drm/amd/display: Fix new dmub notification enabling in DM (2022-07-15 10:04:59 -0400)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-5.19-2022-07-20

for you to fetch changes up to 90af0ca047f3049c4b46e902f432ad6ef1e2ded6:

  drm/amdgpu: Protect the amdgpu_bo_list list with a mutex v2 (2022-07-20 16:23:34 -0400)

----------------------------------------------------------------
amd-drm-fixes-5.19-2022-07-20:

amdgpu:
- Drop redundant buffer cleanup that can lead to a segfault
- Add a bo_list mutex to avoid possible list corruption in CS

----------------------------------------------------------------
Luben Tuikov (1):
      drm/amdgpu: Protect the amdgpu_bo_list list with a mutex v2

xinhui pan (1):
      drm/amdgpu: Remove one duplicated ef removal

 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c |  6 ------
 drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c      |  3 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h      |  4 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c           | 16 +++++++++++++---
 4 files changed, 19 insertions(+), 10 deletions(-)
