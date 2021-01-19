Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 538E42FBB94
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jan 2021 16:50:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15A5F89E59;
	Tue, 19 Jan 2021 15:50:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2052.outbound.protection.outlook.com [40.107.92.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F86D89E59;
 Tue, 19 Jan 2021 15:50:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kOvmSuRLD3v/IKsy5hSppZnwl41y+O6gOnAcquq+mA0B11L9E/opYVcgEsiLPE3ekOFeO+5S2fqW7dfDRRRI3LR+cTP4FvuNNYQjS3qiAqCQ+8rpmFQpvzhKUKnrIWMqNpGcAjmItBye4j0vtIHoIx9nEPsUehs5HLaxz8afa59cQYDsKqfFTOVW48IE8/UEyYn2IcOhPhby1ZtJhHbNZk1qBYOy0qTU/OP45PGlUSO7bwBwECNN4aKfYoFLocA3/oTk5/z+XfDGNTZasLqgCRGHVEE3i5MGRKFhXvqdBs3nqLmnyX6H+YsoZn+UORd1AduT8Li4oCMj+hc7D4NSYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1zS7j93gh+PxMqhvsAzJxGpAg6HkL7hXvMkdDNBJU4s=;
 b=oLKx3h1/joFd5b0vRXNct0Uk3bSjhIkaSmD/ytWKdjVxvNlWVMD8UGtXlL3eA7Trig3pUH5775eQf8jITeCaG3hK6UA1A3/3z/4AOcwhDHfoHhQaFig6bcVk9ZAirJlHpjEHqQEerVfPae5D9pF8wXfnBo/d5YFbZYnSIxUjgIm7VCxSGmGsHuGXlELlIPhVODhWf69W3zwCL81H+psDF2jdsE9FPTCh1vZ9a1xFAUDcw1J1Mb5j7K2XSvzTklrffu5lDK5n8ZAq8CK042eJElBE2Mr4ipIAvlXzwo2emAvq7QoddDQnSf3gPtPReRSHJ5qRr+nqVHeWyzLbN6CWrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1zS7j93gh+PxMqhvsAzJxGpAg6HkL7hXvMkdDNBJU4s=;
 b=48niRdeXM48aLht8SIPRcn7GYVl6UhmdgZW3EvL3kxhyvyNHLP2rLjJrxznLw76s89iKGwnd6hR6fMt+3oMOTFGZ3q/xvrm9IYhCpxR+YfzKO/GCRvWLF6LaHGsWAGpAP+oJhxsC48iPL4ZtX+Ht9IcH587SYqmt+T/FmLz1Iws=
Received: from DM3PR12CA0114.namprd12.prod.outlook.com (2603:10b6:0:55::34) by
 MN2PR12MB3870.namprd12.prod.outlook.com (2603:10b6:208:166::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.12; Tue, 19 Jan
 2021 15:50:34 +0000
Received: from DM6NAM11FT038.eop-nam11.prod.protection.outlook.com
 (2603:10b6:0:55:cafe::97) by DM3PR12CA0114.outlook.office365.com
 (2603:10b6:0:55::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10 via Frontend
 Transport; Tue, 19 Jan 2021 15:50:34 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 165.204.84.17) smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none
 (message not signed) header.d=none;lists.freedesktop.org; dmarc=fail
 action=none header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 165.204.84.17 as permitted sender)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 DM6NAM11FT038.mail.protection.outlook.com (10.13.173.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3763.12 via Frontend Transport; Tue, 19 Jan 2021 15:50:32 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Tue, 19 Jan
 2021 09:50:31 -0600
Received: from elite-desk-aura.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1979.3 via
 Frontend Transport; Tue, 19 Jan 2021 09:50:30 -0600
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/3] Experimental freesync video mode optimization
Date: Tue, 19 Jan 2021 10:50:26 -0500
Message-ID: <20210119155029.18943-1-aurabindo.pillai@amd.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9aadefe2-6361-4c8c-c7ba-08d8bc91f40f
X-MS-TrafficTypeDiagnostic: MN2PR12MB3870:
X-Microsoft-Antispam-PRVS: <MN2PR12MB38704613C179CE89AA3FA27C8BA30@MN2PR12MB3870.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hsnL6plfd5rNbrOOIFpMBVBRaaeIzVtH1xDwgpyeXfQpnZgdLbAs0/dZq9j1yNQUva77I4Eijm3Hkb8ZHLphzf7jlF0AuKlAsvoftarJC7DKPzOvnZBnFSITVNitSgraBJo1a3pd1epIGKOqcMqHdCJ4GfUI1iiV9eKE2H+/Mt3gwZgD8E61liDicz+eeD6m9TM9DG+McxznWPWhR4t3q/YjMX5bm7YXU3SSbf5EjPbrDRcOvockIjx8UIFXoR4yE8mAfKZALEg/HC/iZHY/6Ug+kTBYbx9DPkLtUmvUM9dTz4XX/HRiXQMVTz6Ym9Y8HGXdIIcRhTnWBp8Xsj91Ai4TjY2ThhOhXbdqfw7i7qXO+1DG6wvcHYCRvqtDj0QkDmlrnLD5n6vwO40Jg5MJTpyiHrVe+Yfd89RoAAtgqfE8fU8YU7jK2owXyIEFDUWdEI5PV+oceBDTVqYhi6fsFQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB01.amd.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(346002)(396003)(136003)(46966006)(82310400003)(83380400001)(478600001)(26005)(86362001)(8676002)(426003)(6666004)(2906002)(4326008)(7696005)(186003)(2616005)(47076005)(36756003)(336012)(5660300002)(82740400003)(70586007)(54906003)(110136005)(316002)(44832011)(356005)(8936002)(1076003)(70206006)(81166007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 15:50:32.2830 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9aadefe2-6361-4c8c-c7ba-08d8bc91f40f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT038.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3870
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
Cc: stylon.wang@amd.com, shashank.sharma@amd.com, thong.thai@amd.com,
 christian.koenig@amd.com, aurabindo.pillai@amd.com, wayne.lin@amd.com,
 alexander.deucher@amd.com, nicholas.kazlauskas@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Changes in V5
=============

* More info in commit messages on the rationale of changes being added
to the kernel.
* Minor fixes

Changes in V4
=============

1) Add module parameter for freesync video mode

* Change module parameter name to freesync_video

2) Add freesync video modes based on preferred modes:

* Cosmetic fixes
* Added comments about all modes being added by the driver.

3) Skip modeset for front porch change

* Added more conditions for checking freesync video mode

Changes in V3
=============

1) Add freesync video modes based on preferred modes:

* Cache base freesync video mode during the first iteration to avoid
  iterating over modelist again later.
* Add mode for 60 fps videos

2) Skip modeset for front porch change

* Fixes for bug exposed by caching of modes.

Changes in V2
=============

1) Add freesync video modes based on preferred modes:

* Remove check for connector type before adding freesync compatible
  modes as VRR support is being checked, and there is no reason to block
  freesync video support on eDP.
* use drm_mode_equal() instead of creating same functionality.
* Additional null pointer deference check
* Removed unnecessary variables.
* Cosmetic fixes.

2) Skip modeset for front porch change

* Remove _FSV string being appended to freesync video modes so as to not
  define new policies or break existing application that might use the
  mode name to figure out mode resolution.
* Remove unnecessary variables
* Cosmetic fixes.

--

This patchset enables freesync video mode usecase where the userspace
can request a freesync compatible video mode such that switching to this
mode does not trigger blanking.

This feature is guarded by a module parameter which is disabled by
default. Enabling this paramters adds additional modes to the driver
modelist, and also enables the optimization to skip modeset when using
one of these modes.

--

Aurabindo Pillai (3):
  drm/amd/display: Add module parameter for freesync video mode
  drm/amd/display: Add freesync video modes based on preferred modes
  drm/amd/display: Skip modeset for front porch change

 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  12 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 401 ++++++++++++++++--
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |   3 +
 4 files changed, 382 insertions(+), 35 deletions(-)

-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
