Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2478CA67B
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 04:58:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EC1110E051;
	Tue, 21 May 2024 02:58:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn
 (mail-bjschn02on2139.outbound.protection.partner.outlook.cn [139.219.17.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3057B10E051
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 02:58:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HXzKzeY9BZklV87c1b5xBD0l8wjagp303AR+vaigQwaaZfUnkADHbaFfkgRwmO172FZbA88VJ4ekagxEBOCf6I5dc6h6TGRprcZvrASI+LH2qjsn6H53LjzFRiYBvIu3Nr8qk6ZNdXX7vEOzHTLkdObSPMBf0DEejuLK18d61gqkQPE24dRdFw1qYZEziqHM2b4idHpQnU3hGcwsriusu+byjvqW8dtQz0yjrvs2375XmTR1VDyeEIcUVtINBi7/siL9DEUyj6V2ZG/FUuIJKivCC7H0T4iphrLKouxs72JgfqU7vAFQ7WsoVrRg+OgGDnnW49+86WRxXOM2lt1H0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W++pRmxoPDdJvPI/iKzomS2ZqHbsM40diYc7PmtnUCw=;
 b=gSGIfEYif7lUR03QqYKRCCggKzyTg9H2UmxLcGdsLg11h4gEsoplEVIb+aNmguvvrptXHk7uafr6tFxXTNy7NeHEmyZS1wdg92v4pciXUUiqxlz4rAAmrXnAn6ZbagbDPW3Hk7hKKuyrlTMEUFU4t6rpSuKT9f0oW2l2mg0u/Uug3X6IF0s6L4hzfzgG0phwcURUSevRqF4gqM2gUPWQThDcsht2oDFoh66z3EPR5leVkR03mMM8lUqKP9NCwVkoINxl5gLaoxnuHbXgeQZ9ao/28DGVdci70/RhvlJYc+7ZO90pa4YVEWiZ0CQP/4h+tDKTw2J9AUS4MqYASjMmtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ0PR01MB1047.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:c::7) by ZQ0PR01MB1255.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:19::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Tue, 21 May
 2024 02:58:31 +0000
Received: from ZQ0PR01MB1047.CHNPR01.prod.partner.outlook.cn
 ([fe80::39be:8ed9:67b7:adc6]) by
 ZQ0PR01MB1047.CHNPR01.prod.partner.outlook.cn ([fe80::39be:8ed9:67b7:adc6%6])
 with mapi id 15.20.7472.044; Tue, 21 May 2024 02:58:31 +0000
From: keith <keith.zhao@starfivetech.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 xingyu.wu@starfivetech.com, p.zabel@pengutronix.de,
 jack.zhu@starfivetech.com, shengyang.chen@starfivetech.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 keith.zhao@starfivetech.com
Subject: [PATCH v4 05/10] drm/vs: add vs mode config init
Date: Tue, 21 May 2024 18:58:12 +0800
Message-Id: <20240521105817.3301-6-keith.zhao@starfivetech.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20240521105817.3301-1-keith.zhao@starfivetech.com>
References: <20240521105817.3301-1-keith.zhao@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHXPR01CA0020.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1b::29) To ZQ0PR01MB1047.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:c::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ0PR01MB1047:EE_|ZQ0PR01MB1255:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b81af45-4ec3-4454-7cab-08dc7941e580
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|366007|41320700004|1800799015|7416005|52116005|921011|38350700005;
X-Microsoft-Antispam-Message-Info: DyL5NCnOY0pZ9jUs94HsZMB4AfKxVdxVpf8lhra7JK0lKpMzKW0gajEeMhloBbVe4jOyWrnt8RZUnd4v+WoJgiclocmLDPNJe9ysD61QWofka7/r4L0wYo4orBAJcjqLvtHzYzSaSx6qIKnBkcv5LN1YPrN2At6jFpb4ROJlm68b4sqJbcSynBrMpD7S8uPZC8vNCjw/NVN4tP+btbmo6fGlhrCx0HY9a721W4WRlh1jo+FKxKWkZOOrVTvXrOFteHPNru9DVQNucgiOcfDqSz8j0rDyK5PiJcu3Hy70J03p4jxKBQ+nj4OYtIlsYseCQO/ToTrECxR4MgJv2W410shRtW4POGkq2m33JpF5kZhspBwOnBiOCNVgnNhmitN5c7De8/BMV+JkcwoH3vGDdJjGNLi9k0QPOlJYxl7A4EFqcePZSa07lQv+sHR1vCCS/HTUMyEZCiJhPsLNUcYmqj4BFTjsaXtqft0kwhRB+tNaWQWKE5iJaLaPbG3wwLzjwDcjtiLlBE5iYoCjSYhKyv/3P0Q1STbpIy9RsZsCxnl+Jy9nuSmiJcvySWUMWGZrtzJf/m2jddSKMEAY6Vt8t2PIxL2avI5vTrW1GI6qEB4qd3MyYeR4gh21aOlwGnGKyq34k7tLnWF9JipKaMeemQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:ZQ0PR01MB1047.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230031)(366007)(41320700004)(1800799015)(7416005)(52116005)(921011)(38350700005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DEG9ouOA7UQ5Kh72liSD6AWqlrqZHGRjmQ2BYBpxJF/OYjpKW8tfIwsABGl6?=
 =?us-ascii?Q?RWSSG0ueXFNj3eYLSyfwkks2nx1VD6R0vnMxMck3GUtFhzdCD1/Zv3An97gM?=
 =?us-ascii?Q?8xgs1ZqqytQ6x3OnanE/IoVNsMs+/jtrn3SLM+enxtkz7wmLr8xIt60lH8oM?=
 =?us-ascii?Q?Y+aOJSTrhKlMkUOVpk3eyxl476KJmb4QuiBO/izOQxKJUfUkvN7fjmUklYa2?=
 =?us-ascii?Q?OT1ISCe3Lgjv4mZM9KkwtQPUHa7Wg9G0evAMYsWjKGZgykQLnmNjle7rDDbY?=
 =?us-ascii?Q?0GAuKUrSfYzss5G4dkqCxKy9vA+vQJaM2FBPB4TOmYMMtFvHxPF71kyOiEEQ?=
 =?us-ascii?Q?PkGeJ1dBnF48RwJi0CGdS6Ktxwt795SXBPkoq8vxBdfstTDO5tWbIAZpa0yT?=
 =?us-ascii?Q?fNQsZCEkP4B3qLio7Q0Vba8LvXeBfc2Qjw0HTE4Xgo0+vWu1jwwM9oB7CqQo?=
 =?us-ascii?Q?tqmKjwNei/owOAOHaEVlAUYyacrvRlJqMFf0TImoevP4/r7b400ZKZkNMWtk?=
 =?us-ascii?Q?vSk8Oo1/+6LvMQSl7qoiYZR/3dyufFoFBncUDj4TMo7Y1ZubGMrvXTbHPFR7?=
 =?us-ascii?Q?GEdVAL9K3kJxUA/+9ZvH9Y0+6RvqtCsVxV7hQ3nZu0ZBIwktwylhX6hM+Ok6?=
 =?us-ascii?Q?RCoPSywSET1eU5kLANSYOc5ZqgeSer6g+w68OjKfVSZi1wfKMCeTVxceKLUZ?=
 =?us-ascii?Q?rFtBkrVVmuytvQCz6LB3bEFm2J3BDSvGzTcxQJQlRpzJYNnzW62fnNrq9rug?=
 =?us-ascii?Q?jcy9pA2MJHoBFeLwJQSjHXpSYMIImz8EF48xfnYbKkzw3kuEbVMWfI/XZ7rj?=
 =?us-ascii?Q?1PjQTMUNdzcx2fdyRLYr3jmUFdgcPuAcft0TyU/I0OhxS1kliA2fts18NsFM?=
 =?us-ascii?Q?6OoYIILO0Fpjx6qZ46oWr8Ft+TIFhgQ/ZHhljFexPk2Cmq+l8L+DA22Vdbyb?=
 =?us-ascii?Q?B5/asGvjx3bunP2hJvf6sMqH8kxZPunJBc0NtXvInhyGQJp8RfFBoxv9bRBs?=
 =?us-ascii?Q?QxWjotby6kwsnfQ6170zrhfaJjtMi8mfO8rqF1s2bDnt/dW9OsxgSggbcvbS?=
 =?us-ascii?Q?4VN1joRZf06sUsK3nZoTQHoAW9UZtxgsl/816WkG+9V5lKkfnEGb9mSuW7XQ?=
 =?us-ascii?Q?BXeHVFEzVQqQq9pwQuDIVgp6/SbO/r7zMsIhX329YB5Tk+5Vy1UaDsTj9JeP?=
 =?us-ascii?Q?tjRT1X9SevCpj93+t0hTI9melr4txQXT8CxL3huoUKnJcNNqm7u0vXEkXh3P?=
 =?us-ascii?Q?n1sP6o5jltPhWl/D9dxPKE5vqrF70Mujszn6Ah5V8bGDlwKiD4SCd/ep3t7j?=
 =?us-ascii?Q?Sr6jIUcZ9WfDNiMVRZQFzC9laP7QqSsHDdxmjzExfD5ui/Xge2NJioFXHXX3?=
 =?us-ascii?Q?cuL7d6D81yDTkie+129puYvkWtwU6QhlD9hhd4tR364XVb3lhSOxMnaF3K4R?=
 =?us-ascii?Q?CyL5cImOdENzJBr5sYGMdbO4bdftIEf3tzkCl25hkaReEJ1cGM/nw8GtcP0r?=
 =?us-ascii?Q?d+XAYoZcZCPiTM33OvhdGCrnIPLAufojQnGSWarvmnm+ZuOj9AIrZOj646o2?=
 =?us-ascii?Q?kP4CEeU4s5lgB3vpp9DhtmI49OT4XDCSyXecyMVbMM+t0uN4oij6aovAk3yN?=
 =?us-ascii?Q?Bw=3D=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b81af45-4ec3-4454-7cab-08dc7941e580
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1047.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 02:58:31.1042 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a2v5yBDiymup/cVmt+I+9Z7lh1mcXel3zGYfkkCk1Fws14b0IBazE6jTkZwhxSf7ma8pZz21gvGk4LEhN+/MHCmM+g3LVOB5uO1Eq+fEbHo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1255
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

add vs mode config base api

Signed-off-by: keith <keith.zhao@starfivetech.com>
---
 drivers/gpu/drm/verisilicon/Makefile     |  3 +-
 drivers/gpu/drm/verisilicon/vs_modeset.c | 36 ++++++++++++++++++++++++
 drivers/gpu/drm/verisilicon/vs_modeset.h | 10 +++++++
 3 files changed, 48 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/verisilicon/vs_modeset.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_modeset.h

diff --git a/drivers/gpu/drm/verisilicon/Makefile b/drivers/gpu/drm/verisilicon/Makefile
index 7da54b259940..536091f37378 100644
--- a/drivers/gpu/drm/verisilicon/Makefile
+++ b/drivers/gpu/drm/verisilicon/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
-vs_drm-objs := vs_dc_hw.o
+vs_drm-objs := vs_dc_hw.o \
+		vs_modeset.o
 
 obj-$(CONFIG_DRM_VERISILICON_DC8200) += vs_drm.o
diff --git a/drivers/gpu/drm/verisilicon/vs_modeset.c b/drivers/gpu/drm/verisilicon/vs_modeset.c
new file mode 100644
index 000000000000..c71fe0d32504
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/vs_modeset.c
@@ -0,0 +1,36 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2023 VeriSilicon Holdings Co., Ltd.
+ */
+#include <drm/drm_damage_helper.h>
+#include <drm/drm_fb_helper.h>
+#include <drm/drm_gem_framebuffer_helper.h>
+
+#include "vs_modeset.h"
+
+static const struct drm_mode_config_funcs vs_mode_config_funcs = {
+	.fb_create			 = drm_gem_fb_create,
+	.atomic_check		 = drm_atomic_helper_check,
+	.atomic_commit		 = drm_atomic_helper_commit,
+};
+
+static struct drm_mode_config_helper_funcs vs_mode_config_helpers = {
+	.atomic_commit_tail = drm_atomic_helper_commit_tail_rpm,
+};
+
+void vs_mode_config_init(struct drm_device *dev)
+{
+	int ret;
+
+	ret = drmm_mode_config_init(dev);
+	if (ret)
+		return;
+
+	dev->mode_config.min_width  = 0;
+	dev->mode_config.min_height = 0;
+	dev->mode_config.max_width  = 4096;
+	dev->mode_config.max_height = 4096;
+
+	dev->mode_config.funcs = &vs_mode_config_funcs;
+	dev->mode_config.helper_private = &vs_mode_config_helpers;
+}
diff --git a/drivers/gpu/drm/verisilicon/vs_modeset.h b/drivers/gpu/drm/verisilicon/vs_modeset.h
new file mode 100644
index 000000000000..bd04f81d2ad2
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/vs_modeset.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2020 VeriSilicon Holdings Co., Ltd.
+ */
+
+#ifndef __VS_MODESET_H__
+#define __VS_MODESET_H__
+
+void vs_mode_config_init(struct drm_device *dev);
+#endif /* __VS_FB_H__ */
-- 
2.27.0

