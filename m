Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C21E98F79C
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 22:02:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AA2B10E938;
	Thu,  3 Oct 2024 20:01:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="c2R/io+Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2041.outbound.protection.outlook.com [40.107.95.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D78510E927;
 Thu,  3 Oct 2024 20:01:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bpEKvY2efVMQf11rl5sulPJh+A9tz+M5j4x/+U3p/RwRSQHY44EosfQdPBlatmcb6Tt8gq+HB9nMovSfuvmFq7Ng0mGhmpx5Kx54NJrW0N0a+IUyDxy2mKJhVw0P76GG4FneXJ1PCUhahDx/oQlu39J2dvyN8WeDP+kSBYLm+f0iJiYAhKvunFy27x7MsP3wwL4V67IEIOA8+FdeX5ZZGWgTyH+el13eRTPQzNXgDip18fW6q50jQDGsfrajaKbllL+sqew3SppPLqJka2EI4KzqzssQlsRe7Tq6fvt5OCIcCJli1RTv7SXsJE8s7TM2rjoHmX6bNlFDS/V8hEr2EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a0f2fUMHSGS8VRdlJYGKBRkvuZhJQLh8w1q7IS6p4YY=;
 b=fhe3/GJrV/o5b2YHQ3MKFmYEyk6nmifZbfOyzHrW+kkQJ9grzbMvX4vfbWRksEYnoL11wgV16UU4E0Oj7PnvPxx21hop0Cqa9F+sWMhxMlW45JSb32Um+MmqGJzbJuWSFOON3Z4l3xrEgWo6FZrmUbqfzwwmRuppMY2g6tDr3oK9oCidPvCyEiUIYwAMUi6T6uAPcama1i7rhSeYQznWNsGE2WM8W4KXjoKvxzgVa4y73T+KpYRG8w9gNxgG9X4yOqfs9d69u0ZQfBhUguZ3Eqa1ailslKjXA0jFYrRaz/bnbZXjnOGbIsIaB1D7QZvom3kHqzXczE9XDsFQnKIRcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a0f2fUMHSGS8VRdlJYGKBRkvuZhJQLh8w1q7IS6p4YY=;
 b=c2R/io+YAGLkEIaWHKnFVhAjq7G1ABGVfr3ao/RpKRb6pkb+IPgJbJUMT8f6DjRI+zxl2c54QcbUvS6tcudIi9sz/EKDn7jvDCwiiM3m2s3Wq3EHn1UKZp1SLM3WMj/NmZEI/oI7y/9M5/3QixFvESsqAX3IPH/RCWi4kPkItKE=
Received: from CH2PR14CA0033.namprd14.prod.outlook.com (2603:10b6:610:56::13)
 by SN7PR12MB7369.namprd12.prod.outlook.com (2603:10b6:806:298::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18; Thu, 3 Oct
 2024 20:01:47 +0000
Received: from DS2PEPF0000343E.namprd02.prod.outlook.com
 (2603:10b6:610:56:cafe::cb) by CH2PR14CA0033.outlook.office365.com
 (2603:10b6:610:56::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18 via Frontend
 Transport; Thu, 3 Oct 2024 20:01:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343E.mail.protection.outlook.com (10.167.18.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8026.11 via Frontend Transport; Thu, 3 Oct 2024 20:01:47 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Oct
 2024 15:01:45 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Oct
 2024 15:01:45 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 3 Oct 2024 15:01:45 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Harry Wentland
 <harry.wentland@amd.com>
Subject: [PATCH v6 22/44] drm/colorop: pass plane_color_pipeline client cap to
 atomic check
Date: Thu, 3 Oct 2024 16:01:04 -0400
Message-ID: <20241003200129.1732122-23-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241003200129.1732122-1-harry.wentland@amd.com>
References: <20241003200129.1732122-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343E:EE_|SN7PR12MB7369:EE_
X-MS-Office365-Filtering-Correlation-Id: 7598050f-b7b0-4a18-f543-08dce3e6363f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dAAaRU0op03lCerUHmDRYfVkA/xUiJ3ziLknGOo/6PYLSTX1kH+H044qqyyU?=
 =?us-ascii?Q?SiNa24Jd8RKRdH6wDN31IE72iqv0VEfksZmqFaInInqbdQ7RjFiOhbr44ae7?=
 =?us-ascii?Q?71OF3W4xMREqbhqm3kIglv+bTE8C0hr5DY0AWd1FBTlTH/yVGEffujQeS3J7?=
 =?us-ascii?Q?RUM/mNCb/LJLgPzvfGkKA3Jk7QCH+8+ThourkqDLtkI6gsATOGmtZR+rC+cU?=
 =?us-ascii?Q?0M88N0a/TxFYuQLudYGVHdoBBAmGc0UBHLPevVzhuIWuucgAz/XZdXgqCRuF?=
 =?us-ascii?Q?uze9CVudpZDsk6PLlmcVsOewhJ5MqG0DlPFqbjti2uw/3EnGsf6POoodUlq3?=
 =?us-ascii?Q?AzHHeZgcSoP5NzZJr+s60sKwV5Rghwn5qHuJJl8USRZE5X0GzzodDiU4RdO2?=
 =?us-ascii?Q?7zYpnwxUIYMZBS9h/SGn4cCXF7cFqeAVS4e3nsg6TdOhkGAr8oXqVjUDcVbM?=
 =?us-ascii?Q?6/ejWgFPAAy5bQ00v8XaJG5WTOhK9WirjNEA5JLhS7auoiZ5/MxJoU3FsABs?=
 =?us-ascii?Q?UMw19xf7J0bT2zT9gngBr09jsCx0LzOeVRHOQnl6AXwwiVISVYcErtzdDVtc?=
 =?us-ascii?Q?qvXkUDsExBDneH9vDYJESR3PLNzuKIHXHiYx7uV1CC/o3TfpAW0IbvuYUtCn?=
 =?us-ascii?Q?zkIjHUY+SMVAa0xRdvlIpdwMqU2nbr6vlABGYuFBTAF9MZBxUqRWxAiDxymY?=
 =?us-ascii?Q?cXtokE3z6J0selnjjsJW0TjbFalP16ihTqzH69+c2T++bhh09UuwagKxGDgq?=
 =?us-ascii?Q?jXrHbFp8+fyYnQFQAJOQ5LF5VASIiYlrKEik0/Pl+0yw0ifSGmDUXy8p8W/c?=
 =?us-ascii?Q?uFoc8dktQ8+pIBFL1OR6BrZ6/MHbbe8ZqoxxVV5HLcBXYaQ0A5/bc4gKPpnN?=
 =?us-ascii?Q?ivY+G1qR33dVJDPDS7CeNWC+le4QIxJzETCCowsHHD9ABAhAJoaBL7eqsMYp?=
 =?us-ascii?Q?cTIta9IhRdB/WCShJF2efsKh0CTAgO317rqMvjogSlrSnfM7NeJ7f2IUjUMC?=
 =?us-ascii?Q?1fQDIwtjkty7Wejgo1cXupLo26iobjEq5GnbDI+f0RzmtpEx9sVNAetjCqGs?=
 =?us-ascii?Q?YHGEroK+vX2uFJvR90rLUPdxWeUxqNMV/P60knuE+6XRQOFFzbSa/OuNW2ai?=
 =?us-ascii?Q?Vhc2u420uuBwr9IvZVm4hasACmGCIX1h1t0l8nGNd403Bf1AaDpz4aqDOJ/J?=
 =?us-ascii?Q?0pZCweymk2hz6HGsGtviCqDYVe+Fxugsk6NsTAaiZFhM5p5/G1bgLZMGQhll?=
 =?us-ascii?Q?JlgPEosLDde6oijyVP04d8JlMwXnlYuSUdHuq4LmDFm9x2S8FS0kUaBs9aQw?=
 =?us-ascii?Q?LSagJfy4rDI7IIOnvdrL5LHBmTtXJW05w6K4LWCiZ7PFrwe60sC7nugXPHL7?=
 =?us-ascii?Q?2HBB1p6mZpPED4mJ3W4zpjlkS06r?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 20:01:47.0662 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7598050f-b7b0-4a18-f543-08dce3e6363f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7369
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

Drivers will need to know whether an atomic check/commit
originated from a client with DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
so they can ignore deprecated properties, like COLOR_ENCODING
and COLOR_RANGE.

Pass the plane_color_pipeline bit to drm_atomic_state.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---

v5:
 - Fix kernel docs
 
 drivers/gpu/drm/drm_atomic_uapi.c |  1 +
 include/drm/drm_atomic.h          | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 12d9d18c1c78..fafbaa73b95f 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -1571,6 +1571,7 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 	drm_modeset_acquire_init(&ctx, DRM_MODESET_ACQUIRE_INTERRUPTIBLE);
 	state->acquire_ctx = &ctx;
 	state->allow_modeset = !!(arg->flags & DRM_MODE_ATOMIC_ALLOW_MODESET);
+	state->plane_color_pipeline = file_priv->plane_color_pipeline;

 retry:
 	copied_objs = 0;
diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index a2e7ac463eef..29e5d400a362 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -414,6 +414,24 @@ struct drm_atomic_state {
 	 */
 	bool duplicated : 1;

+	/**
+	 * @plane_color_pipeline:
+	 *
+	 * Indicates whether this atomic state originated with a client that
+	 * set the DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE.
+	 *
+	 * Drivers and helper functions should use this to ignore legacy
+	 * properties that are incompatible with the drm_plane COLOR_PIPELINE
+	 * behavior, such as:
+	 *
+	 *  - COLOR_RANGE
+	 *  - COLOR_ENCODING
+	 *
+	 * or any other driver-specific properties that might affect pixel
+	 * values.
+	 */
+	bool plane_color_pipeline : 1;
+
 	/**
 	 * @colorops:
 	 *
--
2.46.2

