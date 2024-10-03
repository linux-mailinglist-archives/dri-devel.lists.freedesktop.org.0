Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB0D98F7CF
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 22:04:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60E1110E994;
	Thu,  3 Oct 2024 20:02:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="SeUKz8oX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2083.outbound.protection.outlook.com [40.107.244.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA74C10E987;
 Thu,  3 Oct 2024 20:02:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wto5XaqN/2FLWkflJDLHxGfx3tyJbVEcL2DVxTjTCYIatEvrIKsDjBOT9PR3H8WyTqIN/NCKJGkJXg05VpSTWLiyXWyIMLZFj50rws8crMNoyCtcOql4LlCDzIA8ayE1KEm28LOGGHWSvZcKR3wPB7kEjyEWEqujqVnTJDcZjBfHafLyUA+DV5BiXLeHhSBaEpVwnUrZzItTnMuojGhv6eKAyHjTT0DDbzkwDPqfwIwVxXwls3/bFstj97OxYZ66TTy3e8QERnRp926IrVRXlB0RqKVzBHpfT9mMKITGdWm1SH/RzJTlM5dyjfW6oqZS3JZo3eNKDyAakJXzwpsJpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jvwBTJgIkNXhzm9B2nuvATeqv1kkbfKKPkeMFHvymBE=;
 b=jV+NhZbhKKWQ2p/fpQKYGDryK5XYOgXpfkgWmk+1TTZ+Dib+MUo5CIYVjzYkzhGyRTzQsDBpK+JJD3mb8wno6qDLXYvIZz5kbZ23gzy6qSTjB9pqyNg2B9xI18BhA0+05uzWepgN1V+noQk5G1y7NnV+Sm0BxEqry13iVN+ueW2/b4OhiZIM+Dmvz9vNGySsi5ovfCEMCGayHnNyEjlUNrUg7jTx34/h9h9Shhnj0VGnHHJAzvDGv4qRIP+uKm/uWfaYM3Kr9JIwtthHq4yDVIKIPBiorm/AYI0dX8zvJF0cgc/KuOQZmlZPVBR1fxDXtc9zEICETOMFJw0yIlnTew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jvwBTJgIkNXhzm9B2nuvATeqv1kkbfKKPkeMFHvymBE=;
 b=SeUKz8oX0CvEYgmP5nHgHzyOYNLVh/bLl6zTDIX9GAU26jZsZjRqvHOu8eeTIhG8XvwgHWgBm/0x4i9i2dwo/f10pUcy4aEWwPDHtHBedI08IPdAJlpSd7JDKOZYEAiBsZNTEZhKy0WlQ6Quo5w9FJPQyPwo6kQPRR3QCushodk=
Received: from CH0PR03CA0249.namprd03.prod.outlook.com (2603:10b6:610:e5::14)
 by CH3PR12MB9430.namprd12.prod.outlook.com (2603:10b6:610:1cd::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Thu, 3 Oct
 2024 20:01:52 +0000
Received: from CH2PEPF00000142.namprd02.prod.outlook.com
 (2603:10b6:610:e5:cafe::3e) by CH0PR03CA0249.outlook.office365.com
 (2603:10b6:610:e5::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18 via Frontend
 Transport; Thu, 3 Oct 2024 20:01:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF00000142.mail.protection.outlook.com (10.167.244.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8026.11 via Frontend Transport; Thu, 3 Oct 2024 20:01:51 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Oct
 2024 15:01:48 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Oct
 2024 15:01:48 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 3 Oct 2024 15:01:47 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Alex Hung <alex.hung@amd.com>
Subject: [PATCH v6 26/44] drm/amd/display: Skip color pipeline initialization
 for cursor plane
Date: Thu, 3 Oct 2024 16:01:08 -0400
Message-ID: <20241003200129.1732122-27-harry.wentland@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000142:EE_|CH3PR12MB9430:EE_
X-MS-Office365-Filtering-Correlation-Id: 43782392-ca60-465e-082b-08dce3e6390a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Rj5H+j639gqChrSwElkKNMMnMHh5/N8JLK8FLZma4O5UboVwUYnAB2KoEsHd?=
 =?us-ascii?Q?S9AZ8Rr2Wu0bgXuV8n5zl6TZODnmGaJdsF43CRK+bgrtKhLWZrbwhJxhDwjG?=
 =?us-ascii?Q?W77EVOZb0zpFjMBDyZ8iDI2vW7wZTWghdvRgglG4ZikOQyot70PGd3VCb1Kv?=
 =?us-ascii?Q?xm11IEk7ypa4J1UnEuXYJIzx4nvIxlONYSO7BMpKuUAXyQCix8Ggxik81hFj?=
 =?us-ascii?Q?aZA9k2a+lrMqlMNBB1/aK5kU/HGGf/p9eCpS7Oi2RkJ6DlPqsJAWK0WYBhpc?=
 =?us-ascii?Q?+hciAaqlivMc91c8ndcU2gJljAT+i0XkXcp+XLwVeZJrMrP0hsz21hDbYQMK?=
 =?us-ascii?Q?thW3XNDpKGcjxcpqLtpJP6L1V5eSodTA/J7fAB+49MN0yFM67RNxVZClTgT4?=
 =?us-ascii?Q?Xbzsvw5t3K5SM9UGcB2sblP3J6sKwtNYcFgBPqZCa2uL/FcN0cPbTJxQmz9P?=
 =?us-ascii?Q?zoEKquAyiVHsML2IE+k0vqAqYiC0JZ16XHcprx2kYNwGb9X8ya+XBuYqy4cD?=
 =?us-ascii?Q?mHzan4xEcEwqfdoUncJcJ0xME8GGGUV2/1AlvPx+EZOa3mphJ/OEJdiskFql?=
 =?us-ascii?Q?ZHuiIAIYS6aTsSV7fWLJqk1qZhStrrEskF2lnmMpOl5244rnt3WEi0Fkc68S?=
 =?us-ascii?Q?1YIHHLRjESebh7+/vhCWyJ+8kMLh2EoblND1KYHbJLIbWqB1NxC+GSgGtWKt?=
 =?us-ascii?Q?1DUsqLhQ1rPcF/LKYUI86P5d3oaHatt7R9o9eEXo5SCsECXflJesPk0m2ZlM?=
 =?us-ascii?Q?66lnbrwcYUIwwGOoPzC+sW2Cw8Nnyf3ezMwSUcHts6xzbJSPJFM0DKzpOpH+?=
 =?us-ascii?Q?HyU8fY84+jy9T8Cy59piLmbjuAZW/RneBJOSSRZXisd/2A+i14+yf/z/iPCt?=
 =?us-ascii?Q?Oc632WW2qto9HKcTW3XUfJjkPh3an3eUjKPta8JnauFOdgXf9GY40w1Mu4BL?=
 =?us-ascii?Q?UqvfV8o/mGDGS+ztYsuNwrchLw9ZF45gvemy8AtZfuCPoYETjdbr/EV7WhJ4?=
 =?us-ascii?Q?VNrvvl6L79OdFx24CcA88hwQ/+KwRGyGET+w/bhIGz2EN/MGBahznlHkE1dC?=
 =?us-ascii?Q?B24PQbHR54tTorWCH2MThpPQe4Y3XDgnjJZp4VYvoWBrhsnK8sXAKrWqO9e0?=
 =?us-ascii?Q?I2nApX0jYcII31ezE8B3iq/vRuggfNJLfpY3cz79uW3h6piTfjKk1cV2mYjm?=
 =?us-ascii?Q?lKUbZrjtlrB7DXUAkRBLeAgGMfRbifAe7W0Cqzl6v0WMCnOjnTz8IduB2gvo?=
 =?us-ascii?Q?oU1TCR6la8vTGID7gnk6imo+k+1h3FN2IOzLfDzQRGufJSOUNmZK68KRRZOn?=
 =?us-ascii?Q?xso4PuiKtB+Bx7ssN2WgY8ZJVb46iQc7Fopo7lxT7JJyeN5r6k9KVGlScDpn?=
 =?us-ascii?Q?QDDPVwiK66QHdNWCzzKgQBnq2bpS?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 20:01:51.7772 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43782392-ca60-465e-082b-08dce3e6390a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000142.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9430
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

From: Alex Hung <alex.hung@amd.com>

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index 22ff9a31b592..1bfb9f340c24 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -1764,6 +1764,9 @@ dm_plane_init_colorops(struct drm_plane *plane)
 	struct drm_prop_enum_list pipelines[MAX_COLOR_PIPELINES];
 	int len = 0;
 
+	if (plane->type == DRM_PLANE_TYPE_CURSOR)
+		return 0;
+
 	/* Create COLOR_PIPELINE property and attach */
 	drm_plane_create_color_pipeline_property(plane, pipelines, len);
 
-- 
2.46.2

