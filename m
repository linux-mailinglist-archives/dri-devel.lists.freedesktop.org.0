Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9CDC1B8BF
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 16:07:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DCA310E7F9;
	Wed, 29 Oct 2025 15:07:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="TmXlY2BB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azhn15010009.outbound.protection.outlook.com [52.102.149.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A515C10E7F8
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 15:07:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jc9+4oxQcnFu/Y0jw9qM3h5hkQTt9WHRjZiIo5PBEm5cSaG0//rCJ7MzHL9cktXgxuX7qGJF7bbiv2N+UeHHT5S4srQuqKiCr7oHTl6VOvoc4GBmqqWfJJqDUx9bC1nwBO5FCZzmN0V3DlOVdSD13bg04KAWZ21V4T4wfLKmg+lbQbdsgvJjLoRTH9Bs9Zpp5YHISoF5bf8fsffYMVCiH01MbRBTIlEXnbUD05GTLskOxce2CLQcA6ci19IiZMV6qPTG49ypdvVDXETW1neE6Ki0ptvEumN74WAJP0o1D11o/lwgmVcC93Dvh7NbeyIlXl/e7CA9ZL5YyDaKK35YiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RiG2b7Kfz0cHZ9ztLIYTq6TX6wTyAXjHpMA/+QKcph4=;
 b=OdHlFf4jUj9h4f2+zOrsmdLmXO2adFhoBNLY/Kq8PRwpMdBgt35iwsl5aDYR+4wlcficGFw7hCJuJGJY4D+nhZJe0iSJuu4Irnj+SjfMr4fntLJMuQLbxZU7gXe2TvHRiE7/uO0uRRt9cydTMDAOzaPChU08eQdQAes/HaGMskfr4q/JclzSHBKy9yjbjw7uz1n0cMJJ126HDt71Y1tyeOLTTi13zqY4ut43GP7yLOBpYBuL9C8qjL0JTNv1VCSXWTt/D/NFxzfKTmvoLgyZsHZ//oyEi1LUxQ3OyzpW7c4FmjNp14RpScy5nxk+t2y0Rvee22OowjYyiqn96ifwhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RiG2b7Kfz0cHZ9ztLIYTq6TX6wTyAXjHpMA/+QKcph4=;
 b=TmXlY2BBl/pxTya5CyMrfVIxYDZ8283sIQxc23l/eyS/nfS+GVGLzlsLW17uqJ2lYVcqP+0WD5EKOR35bhtXn+wm0AN1CYg7aow3RdJIpcZUk4SYoYjXBtyWOZg8OxPw+MlfHphOKO+LHBlb8wnpbTH3+qvu3KY4ZS2Obiq7Gas=
Received: from BN9PR03CA0044.namprd03.prod.outlook.com (2603:10b6:408:fb::19)
 by DM3PPFC3D93F6EF.namprd10.prod.outlook.com (2603:10b6:f:fc00::c49)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Wed, 29 Oct
 2025 15:06:56 +0000
Received: from BN1PEPF00004684.namprd03.prod.outlook.com (2603:10b6:408:fb::4)
 by BN9PR03CA0044.outlook.office365.com (2603:10b6:408:fb::19) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.13
 via Frontend Transport; Wed, 29 Oct 2025 15:06:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN1PEPF00004684.mail.protection.outlook.com (10.167.243.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Wed, 29 Oct 2025 15:06:55 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Oct
 2025 10:06:44 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Oct
 2025 10:06:44 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Oct 2025 10:06:44 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59TF6iGe022430;
 Wed, 29 Oct 2025 10:06:44 -0500
From: Nishanth Menon <nm@ti.com>
To: Simona Vetter <simona@ffwll.ch>, David Airlie <airlied@gmail.com>, "Thomas
 Zimmermann" <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Robert Foss <rfoss@kernel.org>, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Phong LE <ple@baylibre.com>, Dmitry <dmitry.baryshkov@oss.qualcomm.com>
CC: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Robert Nelson <robertcnelson@gmail.com>,
 Jason Kridner <jkridner@beagleboard.org>, Andrew Davis <afd@ti.com>, Tomi V
 <tomi.valkeinen@ideasonboard.com>, Devarsh <devarsht@ti.com>, Nishanth Menon
 <nm@ti.com>
Subject: [PATCH V6 0/5] drm/bridge: it66121: Add initial it66122 support
Date: Wed, 29 Oct 2025 10:06:31 -0500
Message-ID: <20251029150636.3118628-1-nm@ti.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004684:EE_|DM3PPFC3D93F6EF:EE_
X-MS-Office365-Filtering-Correlation-Id: f1d6d973-fb4e-4bf9-e8fe-08de16fccc7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|7416014|34020700016|36860700013|1800799024|921020|12100799066;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hKw8SzcCO2zGD9hA3G/FrRuoXlLaEiNrXFyyP1bD0b+G/rxt3sG1uu42rerj?=
 =?us-ascii?Q?7UZ3BwrQjCxmImGEto4KRHbu4uSd2rJdtuo1Zn+zS0+4KxVoR8G37f25t1nh?=
 =?us-ascii?Q?VBSYyA5grJNqRnmxKU4TTKc1Rnj5vIHC8ji+sKsBwpSYE52mpBg08YKPXr+s?=
 =?us-ascii?Q?OpQ1Qzsvt6t4CRbrvKtrnWucrvMYBe3EvP3BytsQ4wWNN6SPMT30IWH8SNOM?=
 =?us-ascii?Q?FvEoAsM6zHYhXdxvZcH2G8PFXHA7w0k8+TH8JxhvI7+lhhyDBeemKwpCuti4?=
 =?us-ascii?Q?Rh0WiyRPjB8OXTW7VeOcFvH/PH2FZI+RVAsFnjPlEif/xGX2W/avVUsRbYow?=
 =?us-ascii?Q?jLh2pi71mgD9ReqIftF/Yhcflx/kQ6W6GjsXF09zgv5Wc1zWMEvAeJAQVJ88?=
 =?us-ascii?Q?1pNXDtM5CrRr32ZGJ7bClBNQtXPAh9OcFoL4BFUtf7raY2ot1pK8vM565/s6?=
 =?us-ascii?Q?GS6Z7MbchAKCoR3/FG1NST00avFVkUBay7eXfHfUhQwMML1lfTGG+jTW2gsK?=
 =?us-ascii?Q?Kkaq7vxNJF+fAtG+KH7wiEqsrSi5b9IVpo3QngBZkX5o1TWVT9LSpSMsTbTG?=
 =?us-ascii?Q?X7TmNhN4WwQsLgem+OSKr62AsyFV86eJem9B59RezIlqLWDbZ27iyMAL1Iqh?=
 =?us-ascii?Q?xZxiCUQ9VzqVAKkEFjez3lFxWjx8ueNdGuCly699eY3sRZwMwbDWzVgLKaLR?=
 =?us-ascii?Q?F9dTrqnSRAWKeQKpDiAO6aFb8zOhDZjWwEFIRZIKpN8izZFqLXEVGHRiRgcq?=
 =?us-ascii?Q?9Hb663b8MY3jdM9XppIOmt50PrMJ8epFEkzoOqCj1IAyFGf8mCg5vLG5/tqt?=
 =?us-ascii?Q?sVlinlC4cwA/clAvRx1fn1lPOaHQQHSpm6ro8WDx5M4dO6TbsOUtOB0KwFqQ?=
 =?us-ascii?Q?AXzOGtAjKtchZsTBbQtV9kmneXMfRCvv/vp6qrAauN9wKnwePd2c8iXi/wHy?=
 =?us-ascii?Q?JpTydZJKAtnx0HUusLQi0ruofIxxHWIqnEYoOFrbpXZ4POM/oyn47tvZ6/mG?=
 =?us-ascii?Q?UO2V80Jk7zZTLMku/azTSBsqOScaEvNvUJelQK5rAhBVWLCNNApITGjhlIgs?=
 =?us-ascii?Q?MIJf5nWoC264NDG1zgpOsffD/SdvMo2vXKOnyLEB5+zUIeHbd5ChEuYSH9sA?=
 =?us-ascii?Q?mkMxfkLYRn7phkmGMt45uYjejLSraiVCO0VVwf+R27Pi3oslVGERbYndpE0M?=
 =?us-ascii?Q?pq+U5H4Ph0PGg4FkByj6BhSeaitSxRPF36kCnLtOlAt+sE2UJ8xPyOK9lfKI?=
 =?us-ascii?Q?1jxPsXdoggb7J53obJuqGzfUmQxa3JsiE3pHbicMsrEvDsKwZX3+VeIRUG8i?=
 =?us-ascii?Q?vev7tRpsrjzWB4gACLfS4mLwup++O4/RKqFXiZCx1QRvIQYjioDWWSyKoGFX?=
 =?us-ascii?Q?rv/1BgV0VLv2KCOOY4JipI6ke1lP/eQgQkg6CGS03KnSXcujGMJLi8hFf5li?=
 =?us-ascii?Q?OgWoLcXQeiBz6ru5PbkMVKsPGIpxZHsaIhXNdEOPX/x3dwppnhDkAoan+9Cm?=
 =?us-ascii?Q?/RqpzaD9foQ/ju4/DR9Tk3D0Qd7trECnOokScCMkcfsL9B4P9iqbkDh2lylL?=
 =?us-ascii?Q?DANoDrVCZnZUe5tWFoVY/UJE3YH+F8gyTR9lKqW8?=
X-Forefront-Antispam-Report: CIP:198.47.21.194; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:flwvzet200.ext.ti.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(7416014)(34020700016)(36860700013)(1800799024)(921020)(12100799066);
 DIR:OUT; SFP:1501; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 15:06:55.0786 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1d6d973-fb4e-4bf9-e8fe-08de16fccc7d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.21.194];
 Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004684.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFC3D93F6EF
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

Hi,

Add initial support for IT66122, which seems to be compatible to it66121
but probably has additional functionality.

BeagleY-AI uses this it66122 as the old part is no longer in production
as far as I understand.

Now, BeaglePlay uses it66121 at the moment, but at some point, it might
end up flipping over to the new part. Additionally, it also looks like
Revision D of BeagleBone Black switched over to it66122 as well.

Series is based on next-20250827

Bootlog: BeaglePlay: https://gist.github.com/nmenon/65afb917ee1818979d338cf25732a920

Changes in V6:
* Picked up Tomi's ack
* Rebased on next-20251029

Changes in V5:
* Switched over to ARRAY_SIZE
* Picked up Andrew's Reviewed-by

Changes in V4:
* Added patch to sort the compatibles alpha-numerically
* vid/pid lookup is done without using the match_data.
* picked reviews

Changes in V3:
Based on Tomi's and Devarsh's reviews, and searching online (and failing
to find) for a public data sheet, I have refactored the series to:
a) Detect the ID by matching vid/pid
b) Introduce it66122 basic support which seems to work based on
   empirical testing evidence on BeagleY-AI. This allows incremental
   patches in the future by someone who might have access to the data
   sheet to add additional features for the chip.
c) Irritated by checkpatch --strict warnings, added a patch to fix
   existing warnings as part of this series, but it could probably go
   in independent of everything else.
d) Stopped claiming it66122 is drop in replacement of it66121 :)

Changes in V2:
* Picked up Krystoff's binding ack
* Switched over to a vid/pid list

V5: https://lore.kernel.org/all/20250827202354.2017972-1-nm@ti.com/
V4: https://lore.kernel.org/all/20250819130807.3322536-1-nm@ti.com/
V3: https://lore.kernel.org/all/20250815034105.1276548-1-nm@ti.com/
V2: https://lore.kernel.org/all/20250813204106.580141-1-nm@ti.com/
V1: https://lore.kernel.org/all/20250813190835.344563-1-nm@ti.com/


Nishanth Menon (5):
  dt-bindings: display: bridge: it66121: Add compatible string for
    IT66122
  drm/bridge: it66121: Drop ftrace like dev_dbg() prints
  drm/bridge: it66121: Sort the compatibles
  drm/bridge: it66121: Use vid/pid to detect the type of chip
  drm/bridge: it66121: Add minimal it66122 support

 .../bindings/display/bridge/ite,it66121.yaml  |  1 +
 drivers/gpu/drm/bridge/ite-it66121.c          | 68 +++++++++----------
 2 files changed, 34 insertions(+), 35 deletions(-)

-- 
2.47.0

