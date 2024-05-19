Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E055D8C94BC
	for <lists+dri-devel@lfdr.de>; Sun, 19 May 2024 15:07:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5B9510E248;
	Sun, 19 May 2024 13:07:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="hV8Rx8rZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2067.outbound.protection.outlook.com [40.107.102.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F4FA10E24D;
 Sun, 19 May 2024 13:07:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iy5nkW9Ax2pdzawZJxHGXZEahqtlYc1SOlfYa6zaHjDaxspOmXYICYdZRt742n7ObdEUgm5cKalsML3OhRm7VU4nv5FpIqHgY54XENkrL3CjpJSLk9qL6Q1YR7fuU5zx+uJb7znVdji3+AJGIkF1miBAmj7CgK291NsF9YLSdMaP4Z9Iub5yEe7dWBA9v0GoUeEkL2mToGh0K74dE820mpPs3Ag5od86CXmSZ0/9r4ZEontcWsCzBWheHIPy9ePD8tV56A9wp/eXooy1Q5h4IOzYKM+CPCaWGX4uPE3yFUO7sQ/EotBWFWVTFevHDfjdepQ2hMiEmtxETjEbWGie+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iDqMjI6FOBCat2RXy5DecEbOQMGjwfwCoy68Ofrvj5s=;
 b=hJwYeQLz0a16gdrEb3kc1TiAecjm0IwY1UPFW23T0Uz2BBu1C26/l8pBZQZurY3BzdADFMh8nviHJZBA9pRuuPA/5xzohdggbKR1XwVtiIVjd2gsEWO0L+9B+k04PnK7hllOAMz6CD83azkIL/n90vP7nvRiNM6lb1IO1xNd5vuRzjeDvtYL8b6JKIBY7P8cRyTbWFgdiGudjAAoV9/fFNJWNsckAtlgGMd2KL2H8MeeerBkjyhf5+Fq7c7txH/FvC3yx7zt58WtfPZTG1o5z7bOvfmsBWJx2AbQm0eIoCh5DBJrM5lDtRBGVpCbVzSJBOIniAGrPaRsout3cffq7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iDqMjI6FOBCat2RXy5DecEbOQMGjwfwCoy68Ofrvj5s=;
 b=hV8Rx8rZBFHJ2awChLKjE0z0MCXK3U6UQd/p7HRtSrrE/+J+zpY61hEnrt8B6udieZs8WEXE5bgKE0OXfz4oMYjjdKV0YLZ/OqBEy6Z6p86C5yMLKqpQqVjFVhLOJArxFNN3h0gAhpVWS0RB1v7yMhouPi975okr0TnA4GvxfEU=
Received: from SJ0PR05CA0209.namprd05.prod.outlook.com (2603:10b6:a03:330::34)
 by MW4PR12MB7032.namprd12.prod.outlook.com (2603:10b6:303:1e9::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.30; Sun, 19 May
 2024 13:07:31 +0000
Received: from SJ5PEPF000001CC.namprd05.prod.outlook.com
 (2603:10b6:a03:330:cafe::dc) by SJ0PR05CA0209.outlook.office365.com
 (2603:10b6:a03:330::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.15 via Frontend
 Transport; Sun, 19 May 2024 13:07:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001CC.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Sun, 19 May 2024 13:07:31 +0000
Received: from SITE-L-T34-2.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Sun, 19 May
 2024 08:07:29 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <Harry.Wentland@amd.com>, <xaver.hugl@gmail.com>,
 <dri-devel@lists.freedesktop.org>, Mario Limonciello
 <mario.limonciello@amd.com>
Subject: [PATCH 0/2] Add support for testing panel power saving DRM property
Date: Sun, 19 May 2024 08:07:15 -0500
Message-ID: <20240519130717.8087-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CC:EE_|MW4PR12MB7032:EE_
X-MS-Office365-Filtering-Correlation-Id: 28b4a0e4-6746-4e0f-2491-08dc7804a463
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|1800799015|36860700004|376005|82310400017; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KJHJUSGCiAw15kbSqzc17Hh4ORY1x8mgrR7GwWLuUGjE9MXkW12GSr93D2Bl?=
 =?us-ascii?Q?pPvtCPn9rMaP7s4lQfkAako8GGdlt1Y+uku6l4eTQ3LFt47zRG+OyUiq3ZCh?=
 =?us-ascii?Q?hfwGCWWqBu2GO17v6NRFLZ1/q9FsSC/lkSzuRPmEYW6WGbV5cgEu9H14yJt/?=
 =?us-ascii?Q?7k4MTkd7SR6uIdTX1DZ6Jjf/HaJHkpGaBxrZF9U5KY3OfeIz3oCzY8z1sZIs?=
 =?us-ascii?Q?Z6ZvF7uAPmdl6E8eZdU6hW8s8BgWFs6D7P03L5nB/utKW831DhpbkdgQWjzD?=
 =?us-ascii?Q?lFBGj+Sy7QywMcJWn5zM5k7oF+yl6tRRx+A3vRb9XFnxYiMUSydTpLsDLqsd?=
 =?us-ascii?Q?7MG5T+h5bs6RnF426rhWFN4lUtp1fUbi1nCogsR9n8ZNiS+fR74RZAsBFlfq?=
 =?us-ascii?Q?pGtru0bRwplnkXtRX1ei5xM6SN1EMl5Fk/xvRFIGZ6PCDgRSESI/EypPotyF?=
 =?us-ascii?Q?T17PvvQqhE7T3WzzCph/uAGqB2OcT17/QcBmyWRCAiCtbI9Ehw/UEar8zzM2?=
 =?us-ascii?Q?Twwqu1aEbPKu1pxBJ9pGNSgiVc8s2aPhfO87YwGKUyehdH0q1ObPKhJMHFV/?=
 =?us-ascii?Q?T/3fg8QG7ToGelej1KF+FUW8MKtygKp6VYksDwURjiYq4eCuvZq1y8Dp04fa?=
 =?us-ascii?Q?OSSSOuPK3KM+KzcC9n64WoebyMn0eXY0RJocBgGq9jm7n3nFwcFrCUgcaT6F?=
 =?us-ascii?Q?WcjwGkI0oPzXxp/8957O+9+hA/xS91pE4QmhF1bx8wi17FXWYw7SoCeAEXTm?=
 =?us-ascii?Q?z2vvTJovPsR1yMIfEjoOqsx7zPeY0pdS8RYmCFtwaYNlcaEeRLnC/IuZBsRK?=
 =?us-ascii?Q?sJ3oZRnpRJd8ixndtyvAKfJMT9KzhFLsxxlRW4TUjtKg5GWOThhy6t4UIFHS?=
 =?us-ascii?Q?ntt4DoxTPpWq0RO5EBN7HV2kAAmSH6fBgeRUucNGUiOaQ+JHL72oZZrkwFU4?=
 =?us-ascii?Q?PNtKVPHEoTi2jrTD7zIdbwBR2Msszo1h+nR+mtGgp9dRxnDW11Hvv+1AUrPR?=
 =?us-ascii?Q?Nz1AX5mQKJ+LHLwL728NURq0TDQy8fj3Py+1M11A57swUsOF5TaIQY539q9z?=
 =?us-ascii?Q?e+z2zEJonBgkzin+YtARXKrIqbPUTR/U2T6YAXB0hnLHZHsvH3k9esnhiRig?=
 =?us-ascii?Q?v5bQXx155b/RFjrOZI5AbYLy/FKvfDNkLOXvYziurU3SC1vY0T6QDy1E+F6K?=
 =?us-ascii?Q?tvOdx/c+n/Z1UWVRK3xWxwgNMinPDk0ytA5JuwlApmIBNqTyCpDrdfD7FLeD?=
 =?us-ascii?Q?iYHp0dOH2hmxiruKp+pj0I75dy2ZVl30Dfnj9Vktog579kMhV5R3zRhc2ezl?=
 =?us-ascii?Q?kanbUeXp/z8YJG1d3dkjL8NAUeBGYMFiZeyWQzqMxtdNeR05mZKFmWqYfI23?=
 =?us-ascii?Q?27GcraoRJ7DzWFM5sypf7wlr/+o3?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(1800799015)(36860700004)(376005)(82310400017); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2024 13:07:31.1524 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28b4a0e4-6746-4e0f-2491-08dc7804a463
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001CC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7032
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
"panel power saving".  This property is an enum that can be configured
by the compositor to "Allowed" or "Forbidden".

When a driver advertises support for this property and the compositor
sets it to "Forbidden" then the driver will disable any power saving
features that can compromise color fidelity.

This set of IGT changes introduces a new subtest that will cover the
expected kernel behavior when switching between Allowed and Forbidden.

Mario Limonciello (2):
  tests/amdgpu/amd_abm: Make set_abm_level return type int
  tests/amdgpu/amd_abm: Add support for panel_power_saving property

 tests/amdgpu/amd_abm.c | 98 +++++++++++++++++++++++++++++++++++++-----
 1 file changed, 88 insertions(+), 10 deletions(-)

-- 
2.45.0

