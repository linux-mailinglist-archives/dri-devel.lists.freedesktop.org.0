Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 541708CC8BC
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 00:06:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1AAA10E137;
	Wed, 22 May 2024 22:06:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="BVvha3v5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2064.outbound.protection.outlook.com [40.107.93.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E744410E137;
 Wed, 22 May 2024 22:05:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m8ow5f7PJTa/Q1I+AZ0dkS4GjV1O0/H1p2w1Q2aptE6Xancd3lQl82hXZu5FudC5HlGIeeZrvkBdd/J+Id6LLt26oDnWL6QVjVQ9pDHVMH+EUmx+2+eX4ALuji+RTyONsoNMYG5wM7BzNZpGwc2tfXDmZPlT2TjhUZxJjfFqfvctrIRBIx4klLe1ujXy4OHLWQxEZxxz+M8qDk/FAI2woY0Vfy47X7G0LwaRfAe/nTxnbhuU6g8Ant0iryR0Js20KOUJK6ugmvEFOH1aTpbNJnvm29ShdeAJsOPIvd38EkxqzY6IrOYAqRvWy8M+XS8yRp14pTeqXxyFSepuukFU6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pSfDidmp2jmKrHbWUaaT0d/u+oYe182t77S8/mwFiqw=;
 b=Tng5DIT+SQgWGcXVkiBOCg5yOAOhSexz1H6WrSAvXYZtVu/+hX5jEu0/DNXJhKCZmEpvkVJE7k8934KR3vMlxXkYZKzMqxUmgPAL0EeDMY/U1DpCH8wJmpwoji2q/SWbRnvYJ0f+dsVKZV3Rku4NA0P7ND21Pi00PAbywMiE+fMTCC8SL4IvtTzVrekFyAo1wAtap3zHx1PVM9dfOZz+CAHAfWSHSN3DEUCoymIU98MMGD3RIBJs7oTlkgFBkDMgWZ81zNwLTldpyrCmUzp8wOEMDlhXgOU4iWC+jTGmRJTkLSI3xXaDyMrNavUU9M4sIUIYDCSVLW2drbXR6KP86g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pSfDidmp2jmKrHbWUaaT0d/u+oYe182t77S8/mwFiqw=;
 b=BVvha3v5ylVc5nzaE4VwFRAY7s8aaQZoeWamRR2odAE8QCVQkiV4ao9y0z/kjpcfDQN7jsM4MP8SwYjTFsUKPLjC3ug1OIaEn74FyL/8gzhe+ckoBS3TPkjQW59YBRKr0lBqwgm4OsEsG9HLb337XITJ4xQy8myhWuGBwEbUI5A=
Received: from PH7P220CA0048.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32b::19)
 by SA1PR12MB9245.namprd12.prod.outlook.com (2603:10b6:806:3a7::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.21; Wed, 22 May
 2024 22:05:53 +0000
Received: from MWH0EPF000A6731.namprd04.prod.outlook.com
 (2603:10b6:510:32b:cafe::15) by PH7P220CA0048.outlook.office365.com
 (2603:10b6:510:32b::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19 via Frontend
 Transport; Wed, 22 May 2024 22:05:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000A6731.mail.protection.outlook.com (10.167.249.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Wed, 22 May 2024 22:05:52 +0000
Received: from AUS-P9-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 22 May
 2024 17:05:50 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: <amd-gfx@lists.freedesktop.org>, Simon Ser <contact@emersion.fr>
CC: Harry Wentland <Harry.Wentland@amd.com>, Xaver Hugl
 <xaver.hugl@gmail.com>, <dri-devel@lists.freedesktop.org>, Leo Li
 <sunpeng.li@amd.com>, Sean Paul <seanpaul@google.com>, Mario Limonciello
 <mario.limonciello@amd.com>
Subject: [PATCH v2 0/2] Add support for 'power saving policy' property
Date: Wed, 22 May 2024 17:05:29 -0500
Message-ID: <20240522220531.32728-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6731:EE_|SA1PR12MB9245:EE_
X-MS-Office365-Filtering-Correlation-Id: 43871e98-8ee6-45f1-7af0-08dc7aab58cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|36860700004|1800799015|376005|82310400017; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mW8hWS4vJaLUqSANaaJedKc2/TH7fzShB9VoMRqIwcmCqd8JzbYnRGpfjj9t?=
 =?us-ascii?Q?mgpeU8ic92WDmA0C8pKPMx0hy7clZ9m4PY81HzE9W7BahJXvaEIfQySsDuSk?=
 =?us-ascii?Q?jahxGvMnktbpGga5Y+bLLtAOS7M1QJaSREwgiLNxpPAZM11e2FTR8B6yl65C?=
 =?us-ascii?Q?3z6wzEXOGt/WDo93wmhV6WfcVoNBkmzkDCkNRxN803+0HfYJ8GwlZc+4bT+U?=
 =?us-ascii?Q?Vbd0YzRSoYJ5NFv9AD5yJZoI2/0UgiMZCJoNn1LXyq2E3IBeytrqtzpeonyk?=
 =?us-ascii?Q?wI+8nfyduGU0MBZeV5g0wRud0z1YXY5H1S5qHqjHPDNrUCjNo+UDKZw/SlFk?=
 =?us-ascii?Q?qJQHGLt2jenCIkrPC6L6GkMe/P51iERFaatCHNWd46E+zhYiJ5VIfVPPeidY?=
 =?us-ascii?Q?smPV+OvmTGUxHPkk138Wb2AMpu2QO2+ycKowPmRg2bHoluc8QmwyJzjX2SS6?=
 =?us-ascii?Q?BM7vifaw20IEoDWoSfsQBDjAPCXgbwykguCFQwRP2WdLSak0QohfAqw53jiX?=
 =?us-ascii?Q?1tFA1vc7iAKh5Q/xhS485cqv/Dv88QZgR+Asc74iKFHStnEsRkwPXsCQpN45?=
 =?us-ascii?Q?uQRDCMkk1FaecdXops+CBtoqj11Ag5SeqJbn+BqIY2D83I9pkabS8UO4N6yR?=
 =?us-ascii?Q?drXuwdcJPVhVxpgB/k04yVCOiPx6k6MNKGHMeqQ1atnUl0zP5EY0DzReUz/w?=
 =?us-ascii?Q?Ijaw2BXWmSWPGlZfW9rCzl5V5e94Adxj64QjXkfsYa5twDOH63jPu59VyOCR?=
 =?us-ascii?Q?v7XpHTb+EYr60sEANpWGMOrq+RtLehSGN1aq/kRd939x59eNFK8VpF2bXEJ0?=
 =?us-ascii?Q?Xxzw+t6VdEJkRdV7N30ww7NFKdL/Oezf7eWr7az4gPhqsXKp56aM7p39SBeQ?=
 =?us-ascii?Q?eJax2KS+HACZ7KWppWjdINdvzltT3yyiXZ3eSfzHsnMvlvh26ARIxfRZKaMF?=
 =?us-ascii?Q?y/DuMeZ6FYjjMiRPohRKCwKGWsRwbNYOe+TZxOBDvU3AZ5LLpmUL1gwbpT+u?=
 =?us-ascii?Q?P5RXIU8TqsbhbIQibarVw9t7Xm9+uDh4/vAP6/y3UP1MlQU5HG46wxw2MZKM?=
 =?us-ascii?Q?x7lJGX3enoHHfm7d9ZSksWusnnyLAmDFFSapCLxtsVMxX3FBQFef5LXo7jP6?=
 =?us-ascii?Q?NhwdAaE2d3FsLujxheFkmhqcS0WaYmNVeP02qgcayRL+QoX+ZhejwU03bM0z?=
 =?us-ascii?Q?sSJwqMVngHtKxrinUwc2gnGIZfT9TsdIyvWTT9yUKg/LF/rBTzZuE08ZRLJ7?=
 =?us-ascii?Q?Hw7aeDaX32rsMA4V+UhfMPSB8GZrc7zlXeujUbw6zJRTJM3+Wwi6GchTwf7Q?=
 =?us-ascii?Q?m9SRT2f+JHjfEgivxpM8h8z1qiu3Hz3xeUvvzz/2GOa1P9aW43CQoAsccRBO?=
 =?us-ascii?Q?PJpzupxP3ii0aJfho/K0IyZ8nOuF?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(1800799015)(376005)(82310400017); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 22:05:52.5997 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43871e98-8ee6-45f1-7af0-08dc7aab58cc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A6731.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9245
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

During the Display Next hackfest 2024 one of the topics discussed
was the need for compositor to be able to relay intention to drivers
that color fidelity is preferred over power savings.

To accomplish this a new optional DRM property is being introduced called
"power saving policy".  This property is a bit mask that can be configured
with requests of "Require color accuracy" or "Require low latency"
that can be configured by the compositor.

When a driver advertises support for this property and the compositor
sets it to "Require color accuracy" then the driver will disable any power
saving features that can compromise color fidelity.

In practice the main feature this currently applies to is the
"Adaptive Backlight Modulation" feature within AMD DCN on eDP panels.

When the compositor has marked the property  "Require color accuracy" then
this feature will be disabled and any userspace that tries to turn it on
will get an -EBUSY return code.

Compositors can also request that low latency is critical which in practice
should cause PSR and PSR2 to be disabled.

When the compositor has restored the value back to no requirements then the
previous value that would have been programmed will be restored.

---
v1->v2:
 * New property as a bitmask
 * Handle both ABM and PSR/PSR2
 * Add documentation

Mario Limonciello (2):
  drm: Introduce 'power saving policy' drm property
  drm/amd: Add power_saving_policy drm property to eDP connectors

 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   |  4 ++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 51 +++++++++++++++++--
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  2 +
 drivers/gpu/drm/drm_connector.c               | 46 +++++++++++++++++
 include/drm/drm_connector.h                   |  2 +
 include/drm/drm_mode_config.h                 |  5 ++
 include/uapi/drm/drm_mode.h                   |  7 +++
 7 files changed, 112 insertions(+), 5 deletions(-)

-- 
2.43.0

