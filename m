Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C6B98F799
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 22:02:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4412210E911;
	Thu,  3 Oct 2024 20:01:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="J22RZD/W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2072.outbound.protection.outlook.com [40.107.95.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96C9A10E92F;
 Thu,  3 Oct 2024 20:01:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oJSMXT26keozqJB5t6+BSdB/ypUIiaPi38KL1CLeWB5Pseoqynv30YKhMPvz+QDBmmgk4VxLkSOJQq7+vyawL0i4YgcEO/kiMPRpFfwIjOT71R8FuyOwMObrTijmIyoy1sVbzL9Gd08TD+ZV4MMY15TYW1SVffIIBddzdrkraatKz8HISznYsPggPdgbx62eg5NvCBkH/D+cTH60E2gj25M5RrvzjX1qmJ/ec3TsSr4vUin6EtExvEQp6FKMVjJ91efIq8nez0xVU++97wRUv+Q6IfZIMF9d5s+X/pD8ejosJ9OqRkPxXyiRtlwQCoqpWcUMEXDSJBZiZeyasLH4Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+mDyacCAbHsyEVsCCmn7QUdAmvddf9Oc07pFMrrDisg=;
 b=U249u68Xv4N8U1kJDx3fzuqwCEcF1ZzOTr9vn8L5+6cgWPIpbxcsK85ynp7QxeE+ZPBHEhQH8hP78k9okTQq/iqPmlNKJeqM7qWuwJ2gWFuu6698WE+X+AJ5282P8a7sOh4JFCwBDQY2xAM40gUPvKPnotD9othFLcYZ+nKUDFrmUDuuA9hkwC4vP2le0/btthFj+Rb+EmmPU4zgelujcYOkWdrSKm9CftNzGuEHQuYt5LbXlYL/6OqSnKkvvRP9sy+3es4R0WVj3ri7/Js/nBbGOb0wNwxzY/qfmgiEhloQOPc+XqVfIc1ALAEnmqkP0k2gsd8oiPRlDLtu24XLVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+mDyacCAbHsyEVsCCmn7QUdAmvddf9Oc07pFMrrDisg=;
 b=J22RZD/Wan5UW2l1NZWOif5ET5/rv3DErfRaeHs+FD6Otp1f43j9+0E7HqhsAqnFIGd2V9gRWjiFk06aEVakIwCBKhhMISodyF69jJhR8JYk5MSAyrXZ8lk+G3XA+AVWa6skcfXCL+TD0ek4JZw6rxU6sI/vDl9HuicClLCmbm4=
Received: from CH0PR03CA0241.namprd03.prod.outlook.com (2603:10b6:610:e5::6)
 by CH3PR12MB8187.namprd12.prod.outlook.com (2603:10b6:610:125::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18; Thu, 3 Oct
 2024 20:01:48 +0000
Received: from CH2PEPF00000142.namprd02.prod.outlook.com
 (2603:10b6:610:e5:cafe::86) by CH0PR03CA0241.outlook.office365.com
 (2603:10b6:610:e5::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18 via Frontend
 Transport; Thu, 3 Oct 2024 20:01:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF00000142.mail.protection.outlook.com (10.167.244.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8026.11 via Frontend Transport; Thu, 3 Oct 2024 20:01:48 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Oct
 2024 15:01:46 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 3 Oct 2024 15:01:45 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Alex Hung <alex.hung@amd.com>
Subject: [PATCH v6 23/44] drm/colorop: define a new macro
 for_each_new_colorop_in_state
Date: Thu, 3 Oct 2024 16:01:05 -0400
Message-ID: <20241003200129.1732122-24-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241003200129.1732122-1-harry.wentland@amd.com>
References: <20241003200129.1732122-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000142:EE_|CH3PR12MB8187:EE_
X-MS-Office365-Filtering-Correlation-Id: 48d73ff4-2075-4d72-7fa7-08dce3e6371c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UH9n+5s96hLK/ZP/IbX5EjSEyP6dfbs6eTX0om9lgI01+y4yor3Dlw7smI9/?=
 =?us-ascii?Q?xDMVHT7KONWdXDkbluGFLTev6hkJUrGnS62ouGJV/+6zRi7e/Xqef6g192tO?=
 =?us-ascii?Q?E4PhnoRB6m6zBXxYJmVpmOS7euWJxlqSFNufKWHDk+oQrwIgH3klMNTY6jCU?=
 =?us-ascii?Q?oxcu2rQx/Dg+kcchm+CtDhOQKUeEg8LSpBGcMMnq3nGfYFceiZr1YG4Hkoca?=
 =?us-ascii?Q?Xm6WPdOPcbJfBYNGcVFFVo3kJmNtcjdLj7TNzhFv1mW6eISL4vV/laHnkedI?=
 =?us-ascii?Q?M3xr+XtF2Y1tdvZlTXAM/kVN6Nq/SFdK3h+OgjvGkr9+xdgZF8CFHOKgjrFt?=
 =?us-ascii?Q?cKzvdQdRrXu+duSHmJM9nRRgmB2xXOTmLUsJUsDHlzUUPc7GfpcIRHCzbVpm?=
 =?us-ascii?Q?RPLMZh9ak2WhHBXP9DxL4qr+ZZJtN99n+vi9Mdj4XiuslmNM5adLefQTJTVn?=
 =?us-ascii?Q?1X1shGlwE8GnFjiMlONnjH9XkMI1jlhnEhdTEbIQoTVk5jdggxPALmLrv7hj?=
 =?us-ascii?Q?TecQ9AqzHS1Y36bDrRGnIpoPbgYol+2tWqZpRmRjbAFDz5gMGvJ7+qibah+K?=
 =?us-ascii?Q?O0tUxcvB85u5szJbt24o3t8YDekvev4uhrUP/aLmDqRY8WyDHg4ebMrhzLfc?=
 =?us-ascii?Q?kwpMcBMLZYKfq0BAEqevDXxOgEybLY0JGTmkZ8GDu9a6xHdUiIYMnPDzSKCa?=
 =?us-ascii?Q?qZu/G/BJv2ZoEO5RFOwX5ATieINlfrDMZgEyK7FCKyHHuRSyuTOQ+elnM4c/?=
 =?us-ascii?Q?BcU2Jz13SBFElTeUow/7hvlV13ITw3jYqpghQl5KbNDh1Q6INsI2i2ug9h0b?=
 =?us-ascii?Q?sZtcSlexiyRm9HYpGHy00UoPKwO6oR0B5TL1egibccWNUQosu06aO5FM7D/i?=
 =?us-ascii?Q?HWReADO5ENbTV1xbkKMs62LfJTq+nU1XAyUXUfJoL2b3axJ9yPpIBIve0ZNM?=
 =?us-ascii?Q?Mhff5TeJbzym1z+iBoSX8LYqPJfGmTS4qCPnvHEElQiNGIJo9OHrUdkSQ4k8?=
 =?us-ascii?Q?1Mdx/mtGqrbsNDYgOhqua/u3cq7cGClJFh57SMTIlARnifDQXr4zazWmqLYW?=
 =?us-ascii?Q?Fdde8L8fpCCS2dzTBMRZmDCNXqR+8+IH5fM6BsXVyZnyS8MjMxn6cXRiqqr7?=
 =?us-ascii?Q?rC1P451QHk4KyBVkVKo+ZypDV902eQQ8f2Yl/f/0rRm9pGxJ2bW4nnnQq7i2?=
 =?us-ascii?Q?eW6Oywbzb+2kM2vZPQtFHIQRBPU3ziZ4WA6nYi4H8JeZsJghgRL3OBKtff1K?=
 =?us-ascii?Q?LTBePRD17mS13KvhCMrry9afgTvcMrXLjPC3IDlHETNX0f0P0DfN73UsKuIm?=
 =?us-ascii?Q?UzRsjdzLx3hVKLp2eJPmsgEtKOTEqOneYXxJZKEnofIuhXeCv8zqlaipMdqZ?=
 =?us-ascii?Q?f8cTZBjHD1uXEbm8w/Ijx9fz9xhV?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 20:01:48.5115 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48d73ff4-2075-4d72-7fa7-08dce3e6371c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000142.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8187
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

Create a new macro for_each_new_colorop_in_state to access new
drm_colorop_state updated from uapi.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 include/drm/drm_atomic.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 29e5d400a362..8b0c90d1d7be 100644
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
2.46.2

