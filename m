Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F4F9F8B73
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 05:40:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E0DA10EEA3;
	Fri, 20 Dec 2024 04:40:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="DNwYrfYE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2047.outbound.protection.outlook.com [40.107.101.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36AE910EEA3;
 Fri, 20 Dec 2024 04:40:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AZF7qy8AIWL8JfYaG/kHBE1u3+UsNhdzs2Nwdml53Xc8fVu5V6DLISY/9vwEFJQutt3F10gqaHxW+gLjr0jS1rE1VkB83zjHpa6OaBk8B2ZquKtht/361qY2KHatUWchyzFDCaZhA4BSygGk6XzjYTm2PHxJQOG6LcDfQBUWvPdsp/jIjE6SKRezmcttOyOB7MRYyz9cUGbPyUWKtB03fGyCODw3zjaOBVLSzdhIWkv8R2OY8+U8ccXSwvZDraAJQ7Xy9a1uyq1+KKRxaM8X/fg8QLXMM9xGPM+2ix3wDt4mNHykW3fdms7tdqHAVOYbDbZ3W7AD6vhW3JK6ZGEd8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RqvpWbRZ++mCvFPi52xvEHhVKwj0waEPxpwqTnUWI4w=;
 b=R+WwS7seRGSbwPHIkF9clJigoo3Ylp9YAHVZ7b7FCmBlJQu19QVUTDOZod+GmEcXpEyW6KmgKjb77unjvmF9j/6PgC5X6wtFfbe8eLNRBxSkQ3qaB63AEbpbtu9aMMme3gKmPDbYd0Ph3xtvoXJuZzL9kDDOwNkhLpi+9rrbb4CsRwWxi6sIuOoOf+QYp9Lvpb+Cs8DJwV+fgv8Glbluswb0L4o7u+thlWruZ0yt1tUPaa5zIYkPxxHPhKyBnKfqMPtk6/Lwsn4KlOVya+B5YNAMrykxtsWNNcJi3KIw0PqmpAtuqzCAqRb9snjQ2BQZAGpXRCglAaoJEjdNjzALJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RqvpWbRZ++mCvFPi52xvEHhVKwj0waEPxpwqTnUWI4w=;
 b=DNwYrfYELrNrA9gNi4d5aI7XWgMaXZa0CdGIuQTrzPKiIltivH5fWz6N2FDgdgl+4MnctcAujJ1b6XgPeUvknGJxoXIorVjt4GkTtwZ9q3SsXH/0GoPHzvCdYSKIx5vlhql2aiDkdpo6Z4zUYoDHNGXqxpx1QG6bsbd3DSRi1gM=
Received: from SA1P222CA0134.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c2::7)
 by IA0PR12MB7652.namprd12.prod.outlook.com (2603:10b6:208:434::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Fri, 20 Dec
 2024 04:40:44 +0000
Received: from SN1PEPF0002BA50.namprd03.prod.outlook.com
 (2603:10b6:806:3c2:cafe::4c) by SA1P222CA0134.outlook.office365.com
 (2603:10b6:806:3c2::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.24 via Frontend Transport; Fri,
 20 Dec 2024 04:40:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA50.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Fri, 20 Dec 2024 04:40:43 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Dec
 2024 22:40:42 -0600
From: Alex Hung <alex.hung@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <alex.hung@amd.com>
Subject: [V7 22/45] drm/colorop: define a new macro
 for_each_new_colorop_in_state
Date: Thu, 19 Dec 2024 21:33:28 -0700
Message-ID: <20241220043410.416867-23-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241220043410.416867-1-alex.hung@amd.com>
References: <20241220043410.416867-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA50:EE_|IA0PR12MB7652:EE_
X-MS-Office365-Filtering-Correlation-Id: 80300962-160e-4b86-8027-08dd20b07709
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?v4zECNwG8onXmddHHMr6ycFDp50SRntQSQAE+QeZnOjVCXAszKOQV6TkOoQz?=
 =?us-ascii?Q?eLH9WL+Gc+4t4hmWtQm/sRqvJb49T61GOmd/YVhPOoAy6U2VjmgNw/lxGJl9?=
 =?us-ascii?Q?qgA3YfUi5SW2GDZliuWv/soSuPZobZiSUcJ0IaHcmV+ATeZQ3jnviqQPSW5V?=
 =?us-ascii?Q?GiQclhyLYZrEzsOsOYMjoozHQ0svss8VJwnmwjohWrOk1m7IMZoWg4/MwABH?=
 =?us-ascii?Q?pv0fhwATPWwdy9AeuG5fidVXD/HCHO1ewPXtrcc05BLcbTOUU1j0yaQhZJ0M?=
 =?us-ascii?Q?q1z9voMQ5vApmtl6J3yqxoGFKA29+tNiK4dCBsZtZ9nNDO6gsmhtsc7L4z/R?=
 =?us-ascii?Q?eS1zM8KP68LK3fINQHDt2UcRLN5yhFntUaAv1gRc5HpfRNFowdfyH4m/Ui8/?=
 =?us-ascii?Q?ZDtdPRchFgaLakNp1w+X41oHyA5LIFzugngtAYGT5TYR6HxgcGqMpGfnMVz4?=
 =?us-ascii?Q?cyUmvWuf3aZe22hzFS8XO0ykYJvmvWVQCamjwQgoz/ZpfnE4+whXh9iBt+8D?=
 =?us-ascii?Q?pTUPtSPkceyafFiBeCGgNnr83exYiMmROlBIikrNimSZ0C8nHPV7VA/LtdLt?=
 =?us-ascii?Q?7COx6FhsFA2i8vK/zyBILtuw5j3sG3iSmzcGuaiJEQxc/HCBJbCgc1HzkK3Z?=
 =?us-ascii?Q?J5SbYfkoZbwJ3GDuGZvozrQzD81r6gkC2ByCslcT8/4Zk6BbBSUV8vUGHqml?=
 =?us-ascii?Q?C89b5lvTBuNH3xlWR93fX12AeIXhrMpcJn2Ym1ElC2Fj4Dc+j9FPbjbcQkbn?=
 =?us-ascii?Q?yfChM1oM1W/OX7NUS3r7T0XVy3PcCo4XwGykLI/fUFPfy79uDe5vGDhYUnEZ?=
 =?us-ascii?Q?9vTPKrK4Bqf4cP8BCu5A9ksVy32YuJTP0oppzihmkdT8VUISnA7rpnSrY2uE?=
 =?us-ascii?Q?Iq6MZhkdYbIgbvyxNHfQVTYv+MQKhZZuzIXcWOfB7iiX1lYkSIhk3a07qQCm?=
 =?us-ascii?Q?Hm2UeMQYgw9P/9xCwkBnwTQKho1sWyx9QQGuki/kgLizuB1mEZSeI4skx9Rt?=
 =?us-ascii?Q?VAvJVXPGOHXMKttXfrN8YLJPsBwuKi7NYiaqGtlHhWtdnKXBTt+ua0iTb8vn?=
 =?us-ascii?Q?iR0sqeISEYjIexANMMlKazVeE812/aXEOMRcwomVw8+hLPC6wxM6A4IoNGE8?=
 =?us-ascii?Q?s9GiESileK3PPdcLIPRDQQuwq8JLWHn/NFmf7+Wze8zn3zuv11gKySxjppUG?=
 =?us-ascii?Q?5Y/KEyMVt+I/GXnqx6ReOb3lUSBxXa9lGTBMiT3MMWsjjBpvXC8vaxo+fxsa?=
 =?us-ascii?Q?dYLunO83V/XyD1unqMrc1sc58GqISSpTiIpW+JYMZoQ9nBaRk/C35fb+1Nir?=
 =?us-ascii?Q?m/Rq9x2jhf3xQjinycv81mU7szhJ9cogAg09kf0DYH+D4SPke/V4DNt2WfbJ?=
 =?us-ascii?Q?rwjvxd6ZEGnORPSmFROu8oAxJpgo4nIem+SGDoHwnWBqdWWD/7ExI1iUp+3I?=
 =?us-ascii?Q?aqVrrbxtkcqBvydW/rpfm8h1RAB/ezAaR68R1bIpRdyE4AyLRq3kaPcB5jqA?=
 =?us-ascii?Q?pRwQCnh083seO1Q=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 04:40:43.8985 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80300962-160e-4b86-8027-08dd20b07709
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA50.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7652
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

Create a new macro for_each_new_colorop_in_state to access new
drm_colorop_state updated from uapi.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 include/drm/drm_atomic.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index f3afc1ef3f81..c926f1924edc 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -1035,6 +1035,26 @@ void drm_state_dump(struct drm_device *dev, struct drm_printer *p);
 			      (new_colorop_state) = (__state)->colorops[__i].new_state, 1))
 
 
+/**
+ * for_each_new_colorop_in_state - iterate over all colorops in an atomic update
+ * @__state: &struct drm_atomic_state pointer
+ * @colorop: &struct drm_colorop iteration cursor
+ * @new_colorop_state: &struct drm_colorop_state iteration cursor for the new state
+ * @__i: int iteration cursor, for macro-internal use
+ *
+ * This iterates over all colorops in an atomic update, tracking new state. This is
+ * useful is useful in places where the state delta needs to be considered, for
+ * example in atomic check functions.
+ */
+#define for_each_new_colorop_in_state(__state, colorop, new_colorop_state, __i) \
+	for ((__i) = 0;							\
+	     (__i) < (__state)->dev->mode_config.num_colorop;	\
+	     (__i)++)							\
+		for_each_if ((__state)->colorops[__i].ptr &&		\
+			     ((colorop) = (__state)->colorops[__i].ptr,	\
+			      (void)(colorop) /* Only to avoid unused-but-set-variable warning */, \
+			      (new_colorop_state) = (__state)->colorops[__i].new_state, 1))
+
 /**
  * for_each_oldnew_plane_in_state - iterate over all planes in an atomic update
  * @__state: &struct drm_atomic_state pointer
-- 
2.43.0

