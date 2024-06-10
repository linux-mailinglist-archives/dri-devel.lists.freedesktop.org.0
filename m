Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56AE99022AA
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 15:28:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10FFD10E156;
	Mon, 10 Jun 2024 13:27:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="L1LrkjUd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2082.outbound.protection.outlook.com [40.107.93.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A42C610E156
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 13:27:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e3R3Mt3VKY4x/uGFVbGbdFBZHBWM5OueW5BwvR29GzVS+LoeUVCv7OyYyg6clhCMC5ljjWKno80yGm/N0euCNo08tT+P7g5UOMFL8PRC9o5KsQXo9udM7zWHVjCU9wTgRTWI5stxNHL9nysthzRIC9lVAUA02Sp4n1bNswx06ZWziwRoqmBGrIFLGamsnAIIdKSfsPRAZceKBrzjMJzZo23S0vn7ButEW/1qbmjfAZk8L8vqxr3dOi74xAiMjGRP/N0ZNDBMb/rZuXN/W1BfAZWsbGaq/vQzW8q1OwQ7j8qyJMF2flXhlYbFUA66UlyXMJuHyxzoCLuLtr/eKhvWew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=krb7fLberEgiAFeKkZFOfSJDuQ8AyilOTKwn/YxQER8=;
 b=mR8CxxN5kNm9CaJ3s9oqI9qt/Ktj91fzozhmDhIb8MLNNi81yY9V4ZsaR8cjyweqHI+mqivoOmvwLroiHIAgD9PtupSb2qGe247Uzgebfdt5b70Kxrq+QGEhoJzjVQhM86Fkwdy0+3p/6eteB4UfpmHofPBTDLpVExeQm6F1YQJtPnCncPNuDnl1GdKIocnrlWH6ZKBg4RE5PIqxKBOY2OuTsDQsv9/wiS5do5fDq6U+c2I6qpN232u5vCtmNXAeVR3rzWEhssb3n6Ms0lqtRn+FuAFWXcoNoQBYvh3Cc1EMvPlD33m5AhxcINHRFxD7PZZ1Vxx+yjMTIbUAjhGOgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=krb7fLberEgiAFeKkZFOfSJDuQ8AyilOTKwn/YxQER8=;
 b=L1LrkjUdv41XlLZZQOgIuX1f7R0szitegCO2Cu2SVC+0m/Z34ZhG2fe50tLpDmNL6C1VLeBQ8XUvjBpQ1DrHQC9bH+kVzyV3L7//BH0/lJgMpTerdkbrwgyk6b45cuOjI4l4HPIJNWsw+Y8lq0D6BDbv7g4y7HJNFb8Oc+APoqQ=
Received: from BN9PR03CA0684.namprd03.prod.outlook.com (2603:10b6:408:10e::29)
 by LV3PR12MB9402.namprd12.prod.outlook.com (2603:10b6:408:213::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Mon, 10 Jun
 2024 13:27:45 +0000
Received: from BN1PEPF0000468C.namprd05.prod.outlook.com
 (2603:10b6:408:10e:cafe::77) by BN9PR03CA0684.outlook.office365.com
 (2603:10b6:408:10e::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7656.25 via Frontend
 Transport; Mon, 10 Jun 2024 13:27:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF0000468C.mail.protection.outlook.com (10.167.243.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Mon, 10 Jun 2024 13:27:43 +0000
Received: from patedamande.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Jun
 2024 08:27:39 -0500
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <ltuikov89@gmail.com>, <matthew.brost@intel.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <ville.syrjala@linux.intel.com>,
 <rostedt@goodmis.org>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Subject: [PATCH v4 0/3] Improve gpu_scheduler trace events
Date: Mon, 10 Jun 2024 15:26:53 +0200
Message-ID: <20240610132707.61404-1-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468C:EE_|LV3PR12MB9402:EE_
X-MS-Office365-Filtering-Correlation-Id: 524cbd48-a68f-4cbf-b680-08dc89511bee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|7416005|82310400017|1800799015|376005|36860700004|921011; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?e3KAiziPm0qIeTRHIyPKDGOzgeS7WXCLvB1h0EbbBnCcg6fdT8+PPR1G79h+?=
 =?us-ascii?Q?dWvwBjueEb5m1o2cZBna1IO7A4de8ckzcIN1LqM+hdLF1DkWrZ119VYw0PwE?=
 =?us-ascii?Q?sKIJ+AjPnuafZLe3mSMagK7C2T+a/5ZV8zgcgPaxMlhCBy6xSB85k8ookChx?=
 =?us-ascii?Q?1zv/jkxvMMYlYwuPnss4d/z09oFbqHHXuzxJ7R1uVs/lAWvx5+onefeGCf9T?=
 =?us-ascii?Q?LXWoTejut0C0fSq2wXDg+LHuUrQ1ZCBHUg8suMMgSSVrRhSBp/exiEzde5Js?=
 =?us-ascii?Q?KkgDgi7Qt7CE4eUZlfI4YtYvajozGsW9VqLQRzCC4r0rfGf59tx06KihzBAT?=
 =?us-ascii?Q?+v28OJPmylCb+CgR0pptlQ1Csc6JwAwktq0C7taVe8mFuqY302lPP5/bovqF?=
 =?us-ascii?Q?AiTNDrhcA9wf0qOZQm2T7wQZnvJaI1A39VIUwemg0T8OtNUHPEcKFVnLaBjL?=
 =?us-ascii?Q?+/4WM6BhSuFzy30HaJFu3rdC0L4y7RahLvyWA9rvLLa2jbTOp6Yu6oh9FZUH?=
 =?us-ascii?Q?djM5JxXlHsR9r0XgtGsQa9fUciT+CQoTUFFC755PSx1JNr6cDNDSD5lNzkbF?=
 =?us-ascii?Q?AE+MEkb0+nXR02QA36dxlO4GvrY59vUBUMMdJjbgrbiYbUnByCPnfntcGldz?=
 =?us-ascii?Q?vw/PvsQ5rNqjN/ob3mZVT+2lHSXacXY05n6Qu1gc3k75Rz8oTQtnpGDSvokj?=
 =?us-ascii?Q?QRTwgm+4x59jGtaoJVXfLwNiCGm+VwAuJ9dAA8YUs+7ARvAmyd8AVQHA8Nmn?=
 =?us-ascii?Q?jcCj66tenKEgbrkbLrQmMFockXOMhQ+Il8NBBAT699YqEyub3THflg/L3yDc?=
 =?us-ascii?Q?p1HRH38/UjCRXkh1gN9qmnvyN33H/NSdyOVcz8Phpb2LXowiNAnxof6RIlJ/?=
 =?us-ascii?Q?xR/CUyFR2wXIxkKnuJxu4NfIsQR4R5veQILnGkE9jAnnCoNqkSieoBmeEEMU?=
 =?us-ascii?Q?vaOWyrjAOT7f8zpVOBSzUwvrZ/Q/POPc1azi2BufJKHuJsHM35Jgsa2TYh4n?=
 =?us-ascii?Q?1KNzWv97IoA82gDWI6FaRF1Y166yCsW7LUv7daVZi/255+rErwH27IXxnY+o?=
 =?us-ascii?Q?6ZYvyc1bTSkcRfijX+zwQ4tVXBbWiDiKaoI93wmWhjTbZAPkCYyR1IAYtjTl?=
 =?us-ascii?Q?c0eYiM2OJAtbpzzMQ+LN60A8Xr/BZuaWydK1I9LW9kO3YcGuYLwxd2GUgnMc?=
 =?us-ascii?Q?N1LCYHNt8xF/8gH88FOgG4OOC8UqHcivKB/Ldk8MVFALiScjefwezVq/n6yH?=
 =?us-ascii?Q?DII0s4vViiEX6nv0ofgigSJ/L2JSI4WKiICPRzvDM16Z5cPbsZ0i4mixE3HA?=
 =?us-ascii?Q?70NrfmLpVRcLD50QXErTQW31rA/iQq4zpisllURullbMQ5dJuNycA0bALemX?=
 =?us-ascii?Q?GkhRoRk=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(7416005)(82310400017)(1800799015)(376005)(36860700004)(921011);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2024 13:27:43.3128 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 524cbd48-a68f-4cbf-b680-08dc89511bee
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF0000468C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9402
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

v3: https://lists.freedesktop.org/archives/dri-devel/2024-June/456792.html

Changes since v3:
* trace device name instead of drm_device primary index
* no pointer deref in the TP_printk anymore. Instead the fence context/seqno
are saved in TP_fast_assign

Pierre-Eric Pelloux-Prayer (3):
  drm/sched: add device name to the drm_sched_process_job event
  drm/sched: cleanup gpu_scheduler trace events
  drm/sched: trace dependencies for gpu jobs

 .../gpu/drm/scheduler/gpu_scheduler_trace.h   | 97 +++++++++++++++----
 drivers/gpu/drm/scheduler/sched_entity.c      |  8 +-
 drivers/gpu/drm/scheduler/sched_main.c        |  2 +-
 3 files changed, 84 insertions(+), 23 deletions(-)

-- 
2.40.1

