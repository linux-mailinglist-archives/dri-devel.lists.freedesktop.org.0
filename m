Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 848A286829D
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 22:12:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1337B10F24C;
	Mon, 26 Feb 2024 21:11:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Rd8OqJZB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2081.outbound.protection.outlook.com [40.107.94.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8C2D10EF34;
 Mon, 26 Feb 2024 21:11:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KXhQmdhI3QESrO8gNlxG4PDAoNry/6UmY24D6jHKOsYTKGcVRy8WfjhNkankIaZAUcXY6gIB+kPUPq37marlUrnJ80BxM1xerHQtxchUkv3bhGZ8817unJDo6RksmIevid2ZQZz6QlA3pl2n67v0Gqbm5nYxWiFMPJdUV6siLhjI4syqwnirjS2LOV4LiZYI2iaQ/UrIncJ3gIRxZd5Rx3ZN3WoK/TS3qutMNhOU/LqUSPtND9Ix0MGGOEPYxHsl/pwpWJ/RYYHeVrtyCyb5bQ0A8uALjODTUQSoAjNWerVQxyK2EkeID5vnF2BPDIG7eSvJVbOUJutHqaC6Mr0oTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WjOLnjf2CEsSrCm8RQZRSNFPDrL/1Yo4OcOtcqrOzq4=;
 b=mJjVvQbLWaxs5lsuc4aMarokRaKwim04keEeOJElD9ZhMyj9kCI07dWMMnQoOEAPOR2hOFi4iygEIICdYIxhomffNrccXXjwBdx0uUKeNdx/T1syxvlXJ0qhlW+Qom/eyLoOL+bA2f4bhJPjDwIPODy6llC1D3oIyurF98xv7eBVLtscDE6gGBBcQlb54pBUNRJCzAXB3HMZ4NLR2PhVvTa1nWrBo3SjrlnO2n8LOZZFPAjZO78MZOTzqtwyJ+PQWSkVvuplGXO4eqkWSaksiz5O/UEbmCuY4Jz5F0UcYORiKVmfnzKCzb49UL0Fp8P7TfvSr/6ba4OHVXpc27sKBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WjOLnjf2CEsSrCm8RQZRSNFPDrL/1Yo4OcOtcqrOzq4=;
 b=Rd8OqJZBNK6+7Gis1/EoXefmCa44hrLksPuYV0583tPVCMcYG5JldpFse69HGpfshooQwRxZKzTaTfQcXdmYAi31qN5W7dz4Azr+C8+G4lxkd9VqVUuADQmxHBZjwlvSMBQ65IqQu6BRRZvgGf4++W5IV4enhKqaSNCfcb8S7SM=
Received: from SJ0PR13CA0063.namprd13.prod.outlook.com (2603:10b6:a03:2c4::8)
 by MN0PR12MB6224.namprd12.prod.outlook.com (2603:10b6:208:3c0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.33; Mon, 26 Feb
 2024 21:11:22 +0000
Received: from DS2PEPF0000343A.namprd02.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::33) by SJ0PR13CA0063.outlook.office365.com
 (2603:10b6:a03:2c4::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.25 via Frontend
 Transport; Mon, 26 Feb 2024 21:11:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF0000343A.mail.protection.outlook.com (10.167.18.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Mon, 26 Feb 2024 21:11:21 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 15:11:16 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 15:11:16 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 26 Feb 2024 15:11:15 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Harry Wentland
 <harry.wentland@amd.com>
Subject: [RFC PATCH v4 16/42] drm/colorop: Add NEXT to colorop state print
Date: Mon, 26 Feb 2024 16:10:30 -0500
Message-ID: <20240226211100.100108-17-harry.wentland@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240226211100.100108-1-harry.wentland@amd.com>
References: <20240226211100.100108-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343A:EE_|MN0PR12MB6224:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ba75eee-55c3-4539-17eb-08dc370f7b45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KN1ZstUQifTHUKv9EXPEp30LBaJU6Gfn0f8QH+kTAqTQ8cDDsdiCtb2zRLcgge6WTTwlW1zaUGlEyzkvR84qrhZ6S19CTnehdoSO+bQFeJ3J7ejUtJ/2g9ftgCjeQYYnxtBOuEYUOlviCHfoEHKestoQJ7yszR7xdETboHmLoQ8y2CMgfU3a/itaszWAq8Pouex7h+Bw7RA23DUMFzlBQgWgW8FVD3Tm302ySnxroDxlo7renIEmeTHU1O8Lkco4mbSoUOZ0plArdY2MqcOO4WHkOLyEIXmS2xHWtXKeFqlqzqSeFC3K8Du3Zg+5Br5ijtQnTaOutz+kUUQvuj7ArVOsgPC0yBfnA/3oNykaSEZFhf2QYWwoL7pQBkMD/Pw7L/mwz44RjiR+anYVfoRDojmy1SHsGCQjjyrhVrJKxjzjQxfUYUhk9Prgx8U3DUoUpDnLXf8D4XdRJAa8nfZsgjc9/6HDgB9i6luYbe5aXd2C2428DimSIk1kP32a8OhMWnbtylb7BP6RBbZ0g1I55t3/iT8rz7+G8FROcXnA6Ltuq7CIEVS0VmR2ifCPkFDYGdvAJ2BN10gZ/SBxuktXCAE+1dsY3E7Eu38kkySrHBmqw79TKeXmkGAZlxYF4Ycy0Z+vkpu2UTy+l8t3obul1rztwiG8iJKBMj+rtCGlFI/23ctr6TJhlBkJmAo11T9ggngqZM+Pah0nVXJ0CzHWPefCYOENT/SQJ0E/d8nJ7WZ/pR/IvmiXkMeABhqkgaH0
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 21:11:21.1149 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ba75eee-55c3-4539-17eb-08dc370f7b45
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6224
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

v3:
 - Read NEXT ID from drm_colorop's next pointer

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 drivers/gpu/drm/drm_atomic.c | 1 +
 include/drm/drm_colorop.h    | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 27a8805c5fa1..d82858dabf06 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -794,6 +794,7 @@ static void drm_atomic_colorop_print_state(struct drm_printer *p,
 	drm_printf(p, "\ttype=%s\n", drm_get_colorop_type_name(colorop->type));
 	drm_printf(p, "\tbypass=%u\n", state->bypass);
 	drm_printf(p, "\tcurve_1d_type=%s\n", drm_get_colorop_curve_1d_type_name(state->curve_1d_type));
+	drm_printf(p, "\tnext=%d\n", colorop->next ? colorop->next->base.id : 0);
 }
 
 static void drm_atomic_plane_print_state(struct drm_printer *p,
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index fc9a28d138b8..e85ed5aa68d0 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -237,6 +237,8 @@ const char *drm_get_colorop_type_name(enum drm_colorop_type type);
 const char *drm_get_colorop_curve_1d_type_name(enum drm_colorop_curve_1d_type type);
 
 void drm_colorop_set_next_property(struct drm_colorop *colorop, struct drm_colorop *next);
+uint32_t drm_colorop_get_next_property(struct drm_colorop *colorop);
+struct drm_colorop *drm_colorop_get_next(struct drm_colorop *colorop);
 
 
 #endif /* __DRM_COLOROP_H__ */
-- 
2.44.0

