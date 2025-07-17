Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A07FEB09302
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 19:19:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DF9D10E86D;
	Thu, 17 Jul 2025 17:19:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="b99xtaLd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2080.outbound.protection.outlook.com [40.107.237.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C29A10E173;
 Thu, 17 Jul 2025 17:19:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FFiYM8uAUVhfhvH0fdmjErhzQ+PKhtlx8n7mpPwt6EqSpBmvQGP//FXX47PZaDx9dift7DsG4L/tJGQ3wEZ2YogP+C+u6Y871crpFIns4S+VqAmuBjVxVHxUCBKfn5INsjiIM+sNpVH1HUlNXmHBd/wyVDz4HdQbJSox0sYzuxoNsDpsH/favChXVKOVb8oUHFmT3oe7QnX0VI+OFOKqmB6ivxYhsQcEYAsMPYPUCFyRspbYEEOttOhtYyaoV7LjCIP4af7Ir/Pd+h9pZTaQgI5qOzWXr93wmnb9UZKMJlxWh0GKibNKCoPmOzWLsPnyfWTGlYL7D6v53FMyqLUDhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5UEjjmXCPy3hs4f8JcmkYkuYIn++I/Qqk8Z+WWqql2Y=;
 b=c6QBXHmF3R1xxHNQjWRvIu+cKZFLEVTg8jU6jJH1R49/hQluZAXhs9r2Vz+3BRaE8dg9Rz51RBCojtgaZZ1KEqHwNSWIncnp1IcADLwy5ZcNM3jdQa3Frjxi7kNnvCrPHND7c+tlRlOj/hR8gMx50Bb+7V/CGTHIyaknWUamCQPflj86v77G/AaBKL8EgZUABdfyWifiDHGCzTV4C3fWeEcUG0ZBB8aHE6bhAE84ZAAHXRfn+1a/7OyJynntBUcpepzbMIkRIbXy3HEw6m1lvWYtiDiCFPdY4lhfGrrq8lXvXNiVtXQSu1Z4FxfJn69Tn9xWXfiwunlMNXzWYamjYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5UEjjmXCPy3hs4f8JcmkYkuYIn++I/Qqk8Z+WWqql2Y=;
 b=b99xtaLdEAROAghC68rZBCFhcIQRj1flS5ZJ2pfPxoPVKLlxq2jHbWmenYt5ccLAm9ikCf6xv/fiPoWZQ3DV5n7Zr9vODMfMHfFe2VEY3i/SxSrVd2Tr6vL0oR33W+JCIKhBfxOzURNYrRZqAYuIVMfPs/XoxxhYrdxRgEgPOX8=
Received: from SN7P222CA0006.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:124::19)
 by DM4PR12MB7575.namprd12.prod.outlook.com (2603:10b6:8:10d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Thu, 17 Jul
 2025 17:19:50 +0000
Received: from SN1PEPF0002BA4B.namprd03.prod.outlook.com
 (2603:10b6:806:124:cafe::dc) by SN7P222CA0006.outlook.office365.com
 (2603:10b6:806:124::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.20 via Frontend Transport; Thu,
 17 Jul 2025 17:19:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA4B.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8943.21 via Frontend Transport; Thu, 17 Jul 2025 17:19:49 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Jul
 2025 12:19:48 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] radeon, amdgpu drm-fixes-6.16
Date: Thu, 17 Jul 2025 13:19:34 -0400
Message-ID: <20250717171935.642380-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4B:EE_|DM4PR12MB7575:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f5df99c-f77f-49ca-406d-08ddc55622ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mFbuxEE5QDUahGEhZ/hlYKVT4EPcTaVR04f8sAHWr73U/JKLEdt9CftBPxRi?=
 =?us-ascii?Q?2ZrtYv0fS/sU2gNgCZUDpMpdCBCxKl/+LFxtsSbJZTMHNmqNB7QFO5CqfMHV?=
 =?us-ascii?Q?KsMZpJmM+4A2dwHrqKKC7wsCIwmcCHPoCNMh/Qc+NG6gUd7xTfSLUPuhPkIt?=
 =?us-ascii?Q?T57EQAnK+Bnc03rNPc4CKlKcwB8s8gbZoNr2GRGFLem13omVZpqjJpZsN1FF?=
 =?us-ascii?Q?Us01prXUEn+VQHTuBT8lLwQ2yROxZkBWtotGB8dE8y/yWJ6BFzofe39oWBdI?=
 =?us-ascii?Q?K3Isaon3Wul3svsh8Epei0REAAp4SKrYCkJCy678+0/DSF5X+peA2ghAwBee?=
 =?us-ascii?Q?VVEGDOjQJP8WUWWctG28U4tKT9I5bCRFaY47oEo3YPua0EOSPQ/mtR5NWJFo?=
 =?us-ascii?Q?5sFfMilb9EMPXb8u8GsfGmqwGLhswbbHjh662InwkyztNZ27ljNWlz6i0fTW?=
 =?us-ascii?Q?BoHMK/4Z9i8VXlJj6/5Jf56Ag9LYuzEw+ZzG32ceNNCRGvMha4DL3Km1Qqp3?=
 =?us-ascii?Q?cC+jI5wJVahVSclzN78jIyr+M73qOZKawgpPLbi7khW0Eo49bdRRmz/o1KKR?=
 =?us-ascii?Q?xHcnX6cBg6UFGjQnFjijYO14XPmiJP0zYrGx1j2IbsAGoLDM9EjAcVRCQrqj?=
 =?us-ascii?Q?R53oJnHwifUWfiW3f56EylvuB//hT+eFoxDJMYgWllVKGckPKQO3wMHTuVk7?=
 =?us-ascii?Q?AatX8eV+HUnJ1t4peHRuAeHvycaIjGkvc3UftJk66x+cpk2tHV5rx3SH+ggX?=
 =?us-ascii?Q?P3OH1AjcKp3/z8zy445kw22BAcL65xxJlZznCUKP2IfHuFDWymYtDytFH+6S?=
 =?us-ascii?Q?gYfSHrvRGqbBd7rQ2tRUdyeLiGQP3lBLLtXAuZxhG8tRuP7lCX62Xiu4PGBX?=
 =?us-ascii?Q?h+pjxL+J1nQpISBpL8tNExavt6dwpG42OEPsDLBzjcJW+ED/gJ0bQ90nwsDW?=
 =?us-ascii?Q?lcb6UYKVhZcL+ligpBOLosimjAtagPnVPmG0JBpS06eWg1yLFQStuuzmE36c?=
 =?us-ascii?Q?d5kN0jU98QWL+tGrXGkxrq7IEvxLH6wjLnvxHjVMLsm3sAGF07To2GfIyQmy?=
 =?us-ascii?Q?iQx9QvBFbaAJdbRBK89aS+Rl7cJJBgaVJDg337qadExUp5FKAcS+W1EGREsp?=
 =?us-ascii?Q?ed8l5KkGnO5OHgqv379bHYXHdvKEuB5t5oHDO5lZz/8F2gCI7pKuCckdeU3u?=
 =?us-ascii?Q?384geQfD+L2Nt5n3DKzLan2hhfKC3NzqDA5lWGQoWsKSDaESL9FSkjm1vjuz?=
 =?us-ascii?Q?9dV0CoGh1FIIhe039LGagl7OLf4UC61WH1kkNRmxMaX2ddxxRKqzbBUEBmVE?=
 =?us-ascii?Q?CGqIFLiNzS4MD48IgkkxK743Xov8S6myp7jnM/E3kmCwLynuOvw48qASDlea?=
 =?us-ascii?Q?qNaekaGadWjzA6xovQMUIadO00snaf80L31XxLhK9TOKwiD69WAomn+TQPoC?=
 =?us-ascii?Q?xayyS0yoHv447n/OxVNGIx8tQC1IdEVeUyPNMzUtqqp5Znujr1Jj5w=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 17:19:49.5532 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f5df99c-f77f-49ca-406d-08ddc55622ae
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA4B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7575
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Simona,

Fixes for 6.16.

The following changes since commit 347e9f5043c89695b01e66b3ed111755afcf1911:

  Linux 6.16-rc6 (2025-07-13 14:25:58 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.16-2025-07-17

for you to fetch changes up to 83261934015c434fabb980a3e613b01d9976e877:

  drm/amdgpu/gfx8: reset compute ring wptr on the GPU on resume (2025-07-16 16:50:45 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.16-2025-07-17:

amdgpu:
- Fix a DC memory leak
- DCN 4.0.1 degamma LUT fix
- Fix reset counter handling for soft recovery
- GC 8 fix

radeon:
- Drop console locks when suspending/resuming

----------------------------------------------------------------
Clayton King (1):
      drm/amd/display: Free memory allocation

Eeli Haapalainen (1):
      drm/amdgpu/gfx8: reset compute ring wptr on the GPU on resume

Lijo Lazar (1):
      drm/amdgpu: Increase reset counter only on success

Melissa Wen (1):
      drm/amd/display: Disable CRTC degamma LUT for DCN401

Thomas Zimmermann (2):
      drm/radeon: Do not hold console lock while suspending clients
      drm/radeon: Do not hold console lock during resume

 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |  9 +++++++--
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c              |  1 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c | 11 ++++++++++-
 .../amd/display/dc/clk_mgr/dcn401/dcn401_clk_mgr.c |  3 ++-
 drivers/gpu/drm/radeon/radeon_device.c             | 23 ++++++----------------
 5 files changed, 26 insertions(+), 21 deletions(-)
