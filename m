Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8BC842A4C
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 18:03:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 988A810F929;
	Tue, 30 Jan 2024 17:02:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2072.outbound.protection.outlook.com [40.107.244.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E789810F919;
 Tue, 30 Jan 2024 17:02:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U5okwUnkRsKdTAZijTxfkLWip6qD2WFCN7lNZehJIM2zLkopq0cDTm+ajdDob6ZuzluLPcUzBWmOzKnwTSqBPQJxWeQ94GS2jEbyQ81T3d3QZbnEF+thpJR/kEHq5f90Wdj7rkS185okuBOx9DnCfglc9lQ57zEJwHnpCy8Yb8VT/CSQt6DEpM1MoNM9WTlWe180pDylKrktGpywx606ECVWmLKw3P5qHo+ReGPlAvlFqM6PkiEGsIr5uRoBvfxvt5RuekKrW3ii6QevGqk8iR4Z5uH8ybLVipJp4jAW/3uWcRTZkDlWYrEl4nQNXOG1fps7D0UNrz0BSEvyga4fsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BQmjaJIXrLxCBBKzHkT2ALT4cpaSb4Kkko7QDCBeNos=;
 b=b4KLanaRyeaxQoo19YsCITasaEV3LlkWtMApjwr6h9nQy+roUYwCdIc5cyj/8iTQTK6R9WEme7x9T6DN2xGP/eqKEfihd5mU+HSd6YXeGP/TNWVheBf05Nul/IgreK/EyQjM/N1fgYBTKuAI/Xzc8RVzh7/9aAnhsGxGKe0azWhQ41dF06+UAEvcvNVeaMfwIHwfFMO78pKpG0iL/df4+AoDUnPzQlA9ze4Axkt7MGQ7ug2fhsND/tha76oXAxVKEdA8w3bI1Ee4b6zZzxqZlkXhKFifE1bV2Tn8RnLfHDQrNBt4Gr2YIhfKikQhrC2MuwEpug3xkVAlXcSx9MB62A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BQmjaJIXrLxCBBKzHkT2ALT4cpaSb4Kkko7QDCBeNos=;
 b=dEywe4bw4btQC6t1luLbRuItDlxzBusC6+UhRSK/PNWE6AtrNN/AN3enqeDmltBJeaHDdrecHA5wgIIIGrT7Acd0xHj7GJ4LGf0FTZ+QmYwPPzPbMJCFkPm2f4qFlQV8Gtg024UguM/XNTb2iafSL99u9xXagEWYWWXT2WcBROk=
Received: from CH0PR03CA0346.namprd03.prod.outlook.com (2603:10b6:610:11a::32)
 by DM4PR12MB5360.namprd12.prod.outlook.com (2603:10b6:5:39f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.22; Tue, 30 Jan
 2024 16:13:26 +0000
Received: from DS2PEPF00003443.namprd04.prod.outlook.com
 (2603:10b6:610:11a:cafe::f5) by CH0PR03CA0346.outlook.office365.com
 (2603:10b6:610:11a::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34 via Frontend
 Transport; Tue, 30 Jan 2024 16:13:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003443.mail.protection.outlook.com (10.167.17.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Tue, 30 Jan 2024 16:13:25 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 30 Jan
 2024 10:13:24 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <tvrtko.ursulin@linux.intel.com>, <daniel@ffwll.ch>
Subject: [PATCH 0/6 V3] fdinfo shared stats
Date: Tue, 30 Jan 2024 11:12:29 -0500
Message-ID: <20240130161235.3237122-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003443:EE_|DM4PR12MB5360:EE_
X-MS-Office365-Filtering-Correlation-Id: ba84c054-b793-4d06-2f88-08dc21ae6393
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A16hMYIp1iuGkKA9BJa9w9DohVCG9Eq29j/PnlOvjt/JAkwKGs3iMOg2AxnXu/p/MBL0Qqwofy0ruMjE/wC8rHUfvimymyWrXpbajF5OaI9LZPVeAqZQGLwFFolJni2j9uB8EEYsXtOKpg88SREk3NBUPR7FTiPWkT5z+WNqlff+9+QEjFL+RMSaxP3ohuTWobf1iOpXd3v0k8F6LYUJKBlHnF4eVpXm4lPGnHFH18VGAz49hGpALbn/Mic2YOKkFK3qGURiq0+O12KhmnCINN6UH0j2QqvfWn9ubd3c8MAOEjBAv2InZB0NRGAwpObK8nhHCVqrikx5tO0bC9TSnFJA6stbHb7WHvVDxp4oyQu3rs9G8ogzL4ee7VSbd779SH8L7wRC/zkyAlP5FWji1DzYJnlsjr8PC6GlMDc5BEQfhS6Zy3rjL72NVVQxYSRMahrBS3uDwEZaPWQjj+s7MR75stH+JRAvOcXrHpCvZPMUKjfrg2BCwltKrTF3iUp1xDFQBTUbjbJtcXQP/xUQRrtjE4eUjvt7siOE3Coz+bgm63IVZMi+Sku+BsKxXmHI/eRum7d2f5nEDGZLdmXj+jEqZ6acYUnvX/Nyt49U0A8MQ1IF2oI66g1/vO+7MrYP7pvQ9c5+rXzkXGvDNbldsh8juRX0/bzHOmwyeBsjR6QyIs6J4aT4+lTOnZpMLaDu2Ycdc8+jVEZ77lERK4bldRnHz4mBMCyohNysxHV2Qdx+Rrm2+97o4CEERSiMRsSbg24jLVyRRmgUwNlv57F6mw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(136003)(376002)(39860400002)(396003)(230922051799003)(64100799003)(451199024)(186009)(82310400011)(1800799012)(36840700001)(46966006)(40470700004)(83380400001)(41300700001)(36860700001)(40460700003)(40480700001)(82740400003)(47076005)(81166007)(2906002)(110136005)(8676002)(4326008)(8936002)(86362001)(70586007)(5660300002)(478600001)(316002)(70206006)(7696005)(36756003)(2616005)(1076003)(26005)(336012)(16526019)(356005)(426003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2024 16:13:25.7603 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba84c054-b793-4d06-2f88-08dc21ae6393
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003443.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5360
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

We had a request to add shared buffer stats to fdinfo for amdgpu and
while implementing that, Christian mentioned that just looking at
the GEM handle count doesn't take into account buffers shared with other
subsystems like V4L or RDMA.  Those subsystems don't use GEM, so it
doesn't really matter from a GPU top perspective, but it's more
correct if you actually want to see shared buffers.

After further discussions, add a helper and update all fdinfo
implementations to use that helper for consistency.

Alex Deucher (6):
  Documentation/gpu: Update documentation on drm-shared-*
  drm: add drm_gem_object_is_shared_for_memory_stats() helper
  drm: update drm_show_memory_stats() for dma-bufs
  drm/amdgpu: add shared fdinfo stats
  drm/i915: Update shared stats to use the new gem helper
  drm/xe: Update shared stats to use the new gem helper

 Documentation/gpu/drm-usage-stats.rst      |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c |  4 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 11 +++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h |  6 ++++++
 drivers/gpu/drm/drm_file.c                 |  2 +-
 drivers/gpu/drm/drm_gem.c                  | 16 ++++++++++++++++
 drivers/gpu/drm/i915/i915_drm_client.c     |  2 +-
 drivers/gpu/drm/xe/xe_drm_client.c         |  2 +-
 include/drm/drm_gem.h                      |  1 +
 9 files changed, 42 insertions(+), 4 deletions(-)

-- 
2.42.0

