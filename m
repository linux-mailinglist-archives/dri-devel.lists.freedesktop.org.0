Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2075497436C
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 21:24:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CBF510E904;
	Tue, 10 Sep 2024 19:24:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="fTCrJjS+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2065.outbound.protection.outlook.com [40.107.94.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BA6A10E135;
 Tue, 10 Sep 2024 19:24:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rdhx+EJSFa9wN3F0TgGkBoD+SfM1acG9gb2IzOwcNbci0RZf/x6aBNIeu6dmB7IF4C2c1XPC713TcfGcVqqT8TM+XO5vUe0qVxz0gioO6r1jXC2sbFjI9CbMGvZ3ztOSg0x218xKD57YhANSP1FEGbLMQqDZsZMyUglI7Jli0WI/2sMD29m335mC5Vvq5jDWRZUi1CmGdUXyWGx6wevz+N5VO1kXB7rVPpaSAT1s0FY9uF4ZjtJzJ3wUg/QhSCttqhbZD19+XxWgyEFh2G1jdZP12ZfzO1ZSIGmtSvj8opBglYw7Fk+ASWClu9S1cJw5HBiV2TtFYaIW55ltUegkQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cW0Q3X8UCe0nK6XKhCM+Czl+kkmWIVT1YMVDu1Bj4O4=;
 b=xCo9kj1+eDjis1mQbxX8+++yK60IUI2aqFGnYMM2HQu0GipAaRAgfve5QGmnY8cwbbZzPUM0/AfoeCOxCf1nRSf3lMt3gmHAl99Ow6emDumyDDgND26c/h+TepRUnQG9+hLqws5ZY7bYfZ8XyF8KsJH7R4B3sbW0iBlT9qXoUkOWmqjTqYL5TASh5NFUCzfMJXCnJq8ocsaFk0BTrZBicpL/ZSqfVPsUpMG0j0uyEIUOpLeMHWSxIF8aKThWI9uM5B+ixPup6ApPl1c4Wzv6zFKtvWfxBjz7OETlMWvgRWtQ/ZOwNxm23DyR1w/2zNaSho8abyx7rmN2Tm3YgWRfcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cW0Q3X8UCe0nK6XKhCM+Czl+kkmWIVT1YMVDu1Bj4O4=;
 b=fTCrJjS+lcbZy1MPEeMoZ3IVN03rPF2pSG8tAZF1sz+Z3ekeD/pWWtEwl39hZEXPJxtC7T10TXBZnuE9d19R7r9uWt8WhabnAZ4e/yftQIf5rWCWKU7s1c+SCVVNh/I97VDGVR9gSyFK3nTSNv9E1uV/nfGw0KIehb13KUNPHQo=
Received: from CH2PR17CA0011.namprd17.prod.outlook.com (2603:10b6:610:53::21)
 by MW3PR12MB4378.namprd12.prod.outlook.com (2603:10b6:303:52::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25; Tue, 10 Sep
 2024 19:24:24 +0000
Received: from CH2PEPF0000014A.namprd02.prod.outlook.com
 (2603:10b6:610:53:cafe::e) by CH2PR17CA0011.outlook.office365.com
 (2603:10b6:610:53::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25 via Frontend
 Transport; Tue, 10 Sep 2024 19:24:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF0000014A.mail.protection.outlook.com (10.167.244.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Tue, 10 Sep 2024 19:24:24 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Sep
 2024 14:24:23 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 10 Sep 2024 14:24:21 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <xaver.hugl@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <wayland-devel@lists.freedesktop.org>, Harry Wentland
 <harry.wentland@amd.com>
Subject: [PATCH] drm/colorop: get DATA blob ref at duplicate_state
Date: Tue, 10 Sep 2024 15:24:19 -0400
Message-ID: <20240910192419.302801-1-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <CAFZQkGzLjCOSPvk0kYYXyJm8E6Szdw9PJUcUQzew-EBfQjzz_g@mail.gmail.com>
References: <CAFZQkGzLjCOSPvk0kYYXyJm8E6Szdw9PJUcUQzew-EBfQjzz_g@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000014A:EE_|MW3PR12MB4378:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bb9a2b2-4e79-4c0e-5cdf-08dcd1ce2de1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hpi5BTjbIz0vL9xPHVTHNkl0EMXDd6lOK8K/ERL2Zui9zSgbOR/+iUkjW09d?=
 =?us-ascii?Q?+vl8gf6oEPDlNn9lpjjsnLXM54Byxvl/Jeiw6hoAjnJNjHqoINFRgXGzNJkX?=
 =?us-ascii?Q?c5SFV64hQSRLgLgvlXdzM+tvlhrXhhMv1d9tJRn0rW14G+edual/mRS3iW/U?=
 =?us-ascii?Q?Jlx8E4HyGnmfvxOEe9ZTFNLio0pMrsBEULjYJmpY+vi5m08SD39Fa64PEvHh?=
 =?us-ascii?Q?MmDUk4ppTDxHbFHGXAv09Y29OGrPeB4k66sB4PCPBcP3oN17RfUsEH4uPFeA?=
 =?us-ascii?Q?KkdmzMiXcYc5ThHb48uucobqgCYYohLSApnCKGAMeEaUpMytBA/2StL1t7zQ?=
 =?us-ascii?Q?1Ty8YP+qpmsAYsQg/o5jG3+GMpWnlB3F5p6HocjOJeQVQEWRWPRt/S+GJTqi?=
 =?us-ascii?Q?zXNmKuoREmliGF5HKct31x5np5Ql7fF0qLvdd4SwPb61/MQE6mBIdTNjSZCX?=
 =?us-ascii?Q?SmBmPmiatcnRhTm8Ar5D1SjtHdlGoGta8GdUZ6/DG021hnG07UU+FWqyUYxt?=
 =?us-ascii?Q?wfbEGkVJ3NxQz8sR5pLeMLcJlngjwdoUHvzegLwoCQSjWCp2opJSdriDaev0?=
 =?us-ascii?Q?87HLubysOQGV7nLfjgrVgv605oKAknvfmO7pJ/lcS0xfGgpXuMCeiJ8BWP23?=
 =?us-ascii?Q?W6Z8qYJUsuM6SIYh/XRe3Fej+YHoDaJQvUKPzQsS3v/UTnIONfht6eWvMNNJ?=
 =?us-ascii?Q?qoqelacK4q+G/cFvQQ2t6mvRTK+W/oiBujTL7LG3DmOWIM+hwgThiKG+jDVr?=
 =?us-ascii?Q?2hyrhuebHiy6Xev3zw91dj0X6QWMM7+pRSSzzku5w4XBgtsFw9fknOz5E8EJ?=
 =?us-ascii?Q?tI84DuiajzhD0V6lc8kIscjqgcKX7EntQlUqYgj2T7hS3pYp4mcKi7hty+ct?=
 =?us-ascii?Q?nqQsF+0LRV/v/WjtPu9f9SMriT2ECcp1wTLcl5aVYyT/pLL/39JHP5eVNkwA?=
 =?us-ascii?Q?yoDgj0O58w9oViEfSxmRWcoBLTPKeqoqxjnMjbCHcVKZkMLiBTytVrB/1pcp?=
 =?us-ascii?Q?zPnWH1o/e13405ScXscWL4ei2TTfo1HWt6FZTK3YqxVsInEOiRXpmbUxtME2?=
 =?us-ascii?Q?yV5D6GGIHUP0tt91mbX4ALUTG0hg5n6E0IjS+/Co/cCpoUbmNqxi9L/Etuff?=
 =?us-ascii?Q?oBbEpSQ3ed/RAPX9BAhkgiW4q14ldNffAz+I2N/3o9TS7X7fLZQsGc//z/GK?=
 =?us-ascii?Q?2RqTsfSwxJf+s0MVrQru75PuOey67ECmjDCqwjJh9abqh2KedG1muabR04hD?=
 =?us-ascii?Q?WyxcehYqemunb2EeZDj0YDR5QS1e//DdE6ho1cH+AlkO9Ow0Ov19S5Or5Bn0?=
 =?us-ascii?Q?eSsy9CxgEpXv8Sktq3k6xwjDs2BJ49PfqNB//26HIipS/wHbFUumSIJH8JQM?=
 =?us-ascii?Q?esb/VzZYB1cWSVlt9Uxw2c8nFlJAigYm5Ajuxh6fLFSKDi80PdSMkBrnBiQA?=
 =?us-ascii?Q?iYmLQa4yMUu0AAMq2DoLilN6aMSJaOTf?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 19:24:24.2198 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bb9a2b2-4e79-4c0e-5cdf-08dcd1ce2de1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000014A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4378
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

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---

It was a stupid mistake on my part. The duplicate_state
function needs to take a reference to the blob.

This should fix it. Please give it a try if you can.
I'll roll it into the patch that introduces the bug in
my v6.

Harry

 drivers/gpu/drm/drm_colorop.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 86f7f084a73f..fd1cd934df48 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -401,6 +401,9 @@ static void __drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colo
 {
 	memcpy(state, colorop->state, sizeof(*state));
 
+	if (state->data)
+		drm_property_blob_get(state->data);
+
 	state->bypass = true;
 }
 
-- 
2.46.0

