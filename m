Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A173498F78D
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 22:02:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04AF010E926;
	Thu,  3 Oct 2024 20:01:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="sYm9X0hh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2042.outbound.protection.outlook.com [40.107.92.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB66F10E908;
 Thu,  3 Oct 2024 20:01:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T6azpWa9JmYZHbrzHmyayN3mKJB5geoNs3OJGdynwIL+knxPUF4iJLeyrmPWfAs8m49PVaHPAK7K1wk2Chf1fiv4anzleSi4hXAa7cVHu6mJ7uGmzTwx+wGGCIRRHleofQK4ma/t9psyvO18tMu5aRqVrIRwM5msluRcSIXJMlW9IE48Q5NK91Zyed4V3ZSH/d3rhk22wCMdJ3jGjRM+NyaG7q2O2P+IsP8lI4CiYS4z9U19ATXILHMhSAVCT4AyM9rYmyzXG9lAF9gRHG4HUGxgc2y1009puB61BSJaQsCI863HdGeQ6A0zfOHR/Sl6s9E+T1ZsXXZHOUUuQht+Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ENN9/RUgMyV61otFp8tylTbyGoEG5qPQekxBQiwXkWU=;
 b=ibOumOU/yVww92GP67htk4Tn2tw/aCxJuM8QY034Ps/RVNK5KF8z4LTYSebnQeBRIo3KRvTtsVjt5C8OvE4DFeAq872vAT6QZXIj6RjBz2ookyilKBd9FLJdvN8DubsoXCD+PeIIHjh4YXN+pCr/7PAx93CrzE0oRCCv4wTJ8M+FAi9jUo5RKYfGtXxAKmN+ISZE9igvInQ1FzrDU9FqGj1x36Ar3ik9XNCW1KyYvgeRLB9ufUblK4S8ZkfyWArZX/R/SMxJWnWaTmStu60Ts4YwG/KJLs1DjyY2PMjGHILyowITMK0jEuHJ8le01TxT9UZbpSCIIktn9gCg3ZDBpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ENN9/RUgMyV61otFp8tylTbyGoEG5qPQekxBQiwXkWU=;
 b=sYm9X0hhV7HIK87p1dgihnizwwHbEqg4qSxjpDwLXeb6SUmBp5QP2plPhXAZgVEy8Dh9hd9BsdbLggyT6NU5uV8Ln1mfQNzwjQEpDTMqLwTNA2oMnfKQbpiAHVunkb5WkaIBYDlzeNaAOcxqIhE5RbmMC6S7+49cRkJd3D9s0qo=
Received: from CH2PR14CA0052.namprd14.prod.outlook.com (2603:10b6:610:56::32)
 by DS7PR12MB5958.namprd12.prod.outlook.com (2603:10b6:8:7d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.27; Thu, 3 Oct
 2024 20:01:43 +0000
Received: from DS2PEPF0000343E.namprd02.prod.outlook.com
 (2603:10b6:610:56:cafe::76) by CH2PR14CA0052.outlook.office365.com
 (2603:10b6:610:56::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18 via Frontend
 Transport; Thu, 3 Oct 2024 20:01:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343E.mail.protection.outlook.com (10.167.18.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8026.11 via Frontend Transport; Thu, 3 Oct 2024 20:01:43 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Oct
 2024 15:01:40 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Oct
 2024 15:01:40 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 3 Oct 2024 15:01:39 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Harry Wentland
 <harry.wentland@amd.com>
Subject: [PATCH v6 13/44] drm/colorop: Add NEXT to colorop state print
Date: Thu, 3 Oct 2024 16:00:55 -0400
Message-ID: <20241003200129.1732122-14-harry.wentland@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343E:EE_|DS7PR12MB5958:EE_
X-MS-Office365-Filtering-Correlation-Id: 73e7466a-f9a7-4389-5deb-08dce3e63401
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?260pnWIoda1XirenU0JRM4VQ1sZn8Fqf1+oWIkQ50qGGTMh4YmH5WyjqGgyI?=
 =?us-ascii?Q?1xwn004rao/uWh6RhN1yitxS3LoE6QM2Pz6MZyEbX8ULg0O6a5xMdBRBCCUc?=
 =?us-ascii?Q?0wzFwHD88Vl7Mm6M1XmVkyrhjL0wbdVEygIDSCblHobWPb6JmwPuO4doYHcq?=
 =?us-ascii?Q?21B7dMKBeOTRlyxMVZDLjKSy5FunBgdnGYmtkowIQ1JJNWSyAtvaX1aaQclA?=
 =?us-ascii?Q?SKuq0OyKnL68Ld/sxEgC0UP8G2EPi6qHGzTmNVZkA7oMO/Nnne38FoHpoKYp?=
 =?us-ascii?Q?IjS6jxK3BSu4vrSeZmwrzrjKPU7SILxVplLCPDBPdPuLsZbXjbH/IENKRQI0?=
 =?us-ascii?Q?whUFFU0WaX/1aBJBWjiTFYLyoOMqIj9YfUu1DCT4RmypNVQivIgyO7AXrp1R?=
 =?us-ascii?Q?5Kby4WrH9jvWgwt7FuXiOiEUWKGqBIsluk/PuPX1qqO+N5fKbti3covrkMVO?=
 =?us-ascii?Q?jdW9mdESMeY9W+5tVNJp5b3cj+EIw4w4cbandGSnnwalIXx4ASptSb6nOuZk?=
 =?us-ascii?Q?ROkswVyxbxNquqsj2JIy68RZusEc1zngPC2e9kN9I3zDROJbsX4yU58Uwnud?=
 =?us-ascii?Q?w0bZo71TU37/lm3Wj012gAlndN88aqXUig58d7KQxQ4mEZdcnMgkgWOKpWgA?=
 =?us-ascii?Q?exI6SfEp54a4MwgoH/8TbuLIh4TP8Jny7sFk4ShyJHgPaxoYqTOai2cukRFS?=
 =?us-ascii?Q?TlFMeSq/AJzY+kNwln1d0VOjx2Not/xK/H6FJKZpjZ+kQTpgJRvMs+a3Z7eO?=
 =?us-ascii?Q?dVn6aVrlWd/ReO6Xz5NliX4wjU832PKlpYNoDtvrAJc03crf5BKV2jflSxy+?=
 =?us-ascii?Q?5A1xE9iSD80Yg6XLoUxvrLdtfpd5QHlfJZguRMqCoY8+e3d4IM4+BQP/NS8l?=
 =?us-ascii?Q?LSbRa3OWGE4iFfwSByRsPc2YkMBFjWsmyqvH/sn2SM3tygOvMqCJR/MqBwD4?=
 =?us-ascii?Q?kYEWCdedSm9/rrn+jImIPYOAZAbASfHOxKXxj33iUsrShKI4Vg4PVKBeg89x?=
 =?us-ascii?Q?Fme7u6za2ycTt82e5pzLfgYyvC8+nB6PgKAQpqdrBnV4k+Cw78gSkhfFEVCe?=
 =?us-ascii?Q?pyZgzOH4VLcMZBAe8HGUX57Gb7tHGcOxvZz16nGGYIFmhAYlfoV9OrQBRo/0?=
 =?us-ascii?Q?lDB7v5pd8U/gYAJb9hSk9uJ22Ck0+pfQyAysdzK3kzkWu8B+g0xHPjV3M0Le?=
 =?us-ascii?Q?+bFlmcOvSTl+/omuigaR34tfVrKK9A5XE70r8+mcZYG38MkExhhAsDzna5/O?=
 =?us-ascii?Q?NaUYfRa+XoXcuRiqt5mmX6epgmSlfEsOt/DxG1Rd77TYc1P1cU4yLAv8neud?=
 =?us-ascii?Q?d8bcK7Qn4W5uYQZuhN/i/ncVJPpDYKMPpkdCPnisgA+qBe6Sd8oCBp433ZY4?=
 =?us-ascii?Q?ftyA9ck=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 20:01:43.2068 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73e7466a-f9a7-4389-5deb-08dce3e63401
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5958
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

v5:
 - Drop unused header definitions

v3:
 - Read NEXT ID from drm_colorop's next pointer

 drivers/gpu/drm/drm_atomic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 12e787e73c63..35136987d5e8 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -788,6 +788,7 @@ static void drm_atomic_colorop_print_state(struct drm_printer *p,
 	drm_printf(p, "\ttype=%s\n", drm_get_colorop_type_name(colorop->type));
 	drm_printf(p, "\tbypass=%u\n", state->bypass);
 	drm_printf(p, "\tcurve_1d_type=%s\n", drm_get_colorop_curve_1d_type_name(state->curve_1d_type));
+	drm_printf(p, "\tnext=%d\n", colorop->next ? colorop->next->base.id : 0);
 }

 static void drm_atomic_plane_print_state(struct drm_printer *p,
--
2.46.2

