Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A0FCDB8C7
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 08:00:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 850DF10E34D;
	Wed, 24 Dec 2025 07:00:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="Mb1PTMMk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011036.outbound.protection.outlook.com
 [40.93.194.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84CCA10E34D
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 07:00:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e+y27N8zXiYHo12yQIo87/6o1uFytV2rtjo3k/0/hXNWcIZyw6rL5xVKFz68ALiiDBVatbjW/6ZToMNPMVqydEVd4910V6SXsiETPy5DorFtidOTUZ2DKe+3MG7HbOhSeUhW4Sdvc5WkN0qjJRvk5qCuSXqvn1U7s5aCRmV8mFBdEDXAv8KrezzfPm+PLxyK+61ikDO2Dhlrc2LAiyZQP/6vjQ8w+exwJp7QWYStRp6mYp5gW6mUk6ZBDvrksLXLjuD4TSZlBYcZ7rLyGoWw5xXefe5u+FssfTElqnC/DN+abjnuKaasZxGtu6ZnMs7Hhup5qiduoH7Q94OJYAUi5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bSgWIv+T9rCDXiW8jcHe6E4ueKiJTaih52TYojC+bWI=;
 b=uK3SJ+QVkwIHuOvq7AwbQzKX0+DnfI4SuwO//f+kF/sIftTzX/gkqQidQ7PcHCVGVGFFnur1+AoHtoYMrQZscPKUKzEcd/ByHBqXzHAmY6kn6F47MmR2bNrotzPUvyunVK1Fcds81oRYDS1GDVp+JLi/g+1CTbIu+q6QR7CStz/I5SmPB/aMbKoV8V+bwnYmBOzXjYIZmDeHE/2Z6VDIPeX9xvZQzSc77SlPeYBRcIU/+mrahE8F5q9A900+RmVEuaKIEAe05w0fKx3UATeMLmZI6MuxdVi2pQRbTeJNmCoIHvN+j1wL0ubqeGot1OrwDiclrWuxdkqLSueW+7DKaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bSgWIv+T9rCDXiW8jcHe6E4ueKiJTaih52TYojC+bWI=;
 b=Mb1PTMMkESEjRhKrBxST0/5dhvLO13rM2IWVL+ejbe6+EYREXJ24yIGPdrHgTjd8jvhDb0MDPQ7pgjoN/z/CIlrhlPloIRoEUR8EBmsd+sk3myg2OCpa/88INN7J+sS7baM50l8JAnc+uUO40VY78bUV4k3nFu99GD/Dj4Eww+c=
Received: from BY3PR10CA0001.namprd10.prod.outlook.com (2603:10b6:a03:255::6)
 by CH2PR10MB4245.namprd10.prod.outlook.com (2603:10b6:610:7b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Wed, 24 Dec
 2025 07:00:15 +0000
Received: from CO1PEPF000066E6.namprd05.prod.outlook.com
 (2603:10b6:a03:255:cafe::a5) by BY3PR10CA0001.outlook.office365.com
 (2603:10b6:a03:255::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.11 via Frontend Transport; Wed,
 24 Dec 2025 07:00:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CO1PEPF000066E6.mail.protection.outlook.com (10.167.249.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9456.9 via Frontend Transport; Wed, 24 Dec 2025 07:00:14 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 24 Dec
 2025 01:00:10 -0600
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 24 Dec
 2025 01:00:10 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 24 Dec 2025 01:00:10 -0600
Received: from hkshenoy.dhcp.ti.com (hkshenoy.dhcp.ti.com [172.24.235.208])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BO6xohp164077;
 Wed, 24 Dec 2025 01:00:04 -0600
From: Harikrishna Shenoy <h-shenoy@ti.com>
To: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
 <rfoss@kernel.org>, <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <dmitry.baryshkov@oss.qualcomm.com>,
 <sjakhade@cadence.com>, <nathan@kernel.org>, <dianders@chromium.org>,
 <luca.ceresoli@bootlin.com>, <andy.yan@rock-chips.com>, <xiqi2@huawei.com>,
 <mordan@ispras.ru>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <aradhya.bhatia@linux.dev>,
 <devarsht@ti.com>, <s-jain1@ti.com>, <tomi.valkeinen@ideasonboard.com>,
 <u-kumar1@ti.com>
Subject: [PATCH v6 2/2] drm/bridge: cdns-mhdp8546: Add DSC support for Cadence
 MHDP8546 bridge
Date: Wed, 24 Dec 2025 12:29:49 +0530
Message-ID: <20251224065949.2268373-3-h-shenoy@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251224065949.2268373-1-h-shenoy@ti.com>
References: <20251224065949.2268373-1-h-shenoy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E6:EE_|CH2PR10MB4245:EE_
X-MS-Office365-Filtering-Correlation-Id: 731b2dd2-6e7c-4530-85d5-08de42ba16f9
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?s+AYnf8h/KmQUVVpX3YDaToH16Y+vPpuFUfAd9KRCInX7MOGmBGuNDcn/OZz?=
 =?us-ascii?Q?oLy8ZAodxS97p0oANIDKdPzzbZK1KVYF5E+3/u0Ce5O5G32MyADqWV3Dolee?=
 =?us-ascii?Q?kwjE+xzglmIqtjYXsDWXPiV/qn+0qQGGarEu3+n0uV3SsAkb+yPW2eRDs4AD?=
 =?us-ascii?Q?8cZJ26LCxIKd3eAjqsP+LxFwALRgi/hn+Df0RBJ++A/FFUfW30CZk+Z/LHhl?=
 =?us-ascii?Q?r3Fv7yf9gEZYnyVOml0Bx9UKegrD60rfyrbSv+KRC5LdZYqAmNZsXzJ0ZbKO?=
 =?us-ascii?Q?snDFSoazFRDK3UgfhVpLOVir6SzSPcGSGts9hxU6NnwjB8RswjKAqTLW/b9d?=
 =?us-ascii?Q?OEJCl3EQlUQ+QOhZ776qABdYLoJoM73duNF+Qq4hg6ST2Rf7ATggbxfJ4m05?=
 =?us-ascii?Q?m36/MVdDDEaY2mLPjb8gOoLZcTawcGC2eGvUUQWfd5FqBJSpFWeUsZLMqq5b?=
 =?us-ascii?Q?hdvJ7RRkLxZRxlT18CMgY0Od79nG0tX1UR9fvt/VQN+ohlUjQANcXOBFcnNl?=
 =?us-ascii?Q?ToKNEIuN9/5TQeaTDmYRFedo9YbGOOT8U/lz3API58jokRnNi1ktmYfTjKCe?=
 =?us-ascii?Q?T6a9kEIfWtDWoJlJw850T56WGZitkN3+RvFiDgCj8ZjWilAOeWnBriuxcotM?=
 =?us-ascii?Q?NmroeYLkGES8L+4dEVRaC1EVndX54188myh3OTMOxObPAui8EN5QkXGSpp2t?=
 =?us-ascii?Q?OzffElUycq68oPQMF67TDQdbS2jkqd35UVqr71SUs0rjDj1gdUaJ8OCBOWeL?=
 =?us-ascii?Q?pGcleqzkVyJU/GeBLrsMTJ3lIe8K4r8V7MxDhqkXZuoC7bzQ5RPU5e0xZ8n4?=
 =?us-ascii?Q?v8PAtmvJnFz6m7/TFgwQMcU2DrMwcuDaDXqvO3AItzjXvjAmGl6EOx3x4vhP?=
 =?us-ascii?Q?NBdxFiIhT9u2HZ9WTxRpsTyUaUcmOo+IkeS5n6Chsfh8QaVkhEfznCtkEdo1?=
 =?us-ascii?Q?QP6VGCUNX4xTLkyPnvSD/VTPyWX/lZKjteMClCJUHgtrq6uk75SGEiUNEyAf?=
 =?us-ascii?Q?C81GYw2qD+fAb1XL586yIInA5wcQxfPdfXLlbwib2n1RI7CW6OfkS0Esl4W3?=
 =?us-ascii?Q?P7dxPoZOPY0+81TJZ4TNzLmkOItNGvx+6nP8oOSNmhPNrLxMbu0T86tTZxZD?=
 =?us-ascii?Q?10GADKGqSThsaV9ejgThSiH/h7F2OLUCho0rc5HszHVT7qk1VOey75YgfHoe?=
 =?us-ascii?Q?Z2PruzIPB73Z41Pm6loagm/Ff6j7BhVcWtjA3H9SDHgH2IeDGAKw4mdeotrt?=
 =?us-ascii?Q?TrEsvyc9jQBBFDp/YxBw9bLukd2w6IZKIbBIMLm3KSm9XEtXtdJ/pAEloA2c?=
 =?us-ascii?Q?v9WDi20snjpzebRWX+3FovyiEN1ILLlPBQYJ+V1JTiv4k9uY2w0Ugo3qwE6C?=
 =?us-ascii?Q?4E9Oz0cmm5CUdA6BZMS/uCfgu4h52vuOA3RrL9UITMWZJiIpYJ1q4B32/Jib?=
 =?us-ascii?Q?cjtoeCj/8AXLih8yTuRTUUITNoz2/xUmN+FS/ECeXg0NYQjMuazfENkzWrbx?=
 =?us-ascii?Q?A+wOAJgBY8TrX525ksIncWKLvAmygKI3OH6Q9V6XrOCIp7L+KscPqN5EgZjg?=
 =?us-ascii?Q?hciamoCr3gEGJIEsN1bvij4aYGeIsCdGOhPV6Vg6?=
X-Forefront-Antispam-Report: CIP:198.47.23.194; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:lewvzet200.ext.ti.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2025 07:00:14.9224 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 731b2dd2-6e7c-4530-85d5-08de42ba16f9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.23.194];
 Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000066E6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4245
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

From: Swapnil Jakhade <sjakhade@cadence.com>

This commit implements following:

1)Add Forward Error Correction (FEC) which is necessary for DSC support for
the Cadence MHDP8546 bridge. This implementation includes:
- Functions to check if the sink supports FEC
- Functions to set the sink FEC ready state
- Functions to enable/disable FEC on the bridge
- Helper function to wait for FEC state changes
- Call FEC hooks from link_up and sst_enable functions.
- Add check for DP version before enabling FEC.

2)Update get_bpp function to account for dsc compression.
Implementation changes function signature and updates function
calls to align with the change.

3)Adds DSC control functions
- Setting stream compression state in video bridge registers
- Waiting for DSC operations to complete with timeout handling
- Resetting the DSC hardware block
- Updating DSC configuration registers
- Enabling/disabling DSC in both controller and sink device

4)Configure driver for DSC
- Add DSC register mapping and capability detection during probe
- Implement DSC parameter computation and configuration
- Add clock and reset management for video/packet interfaces via
  cdns_mhdp_configure_car() helper function
- Update video configuration to handle compressed streams:
  - Modified byte count calculation for DSC mode
  - Added LSB alignment for compressed video interface
  - Updated pixel representation for fractional bandwidth
- Enable DSC encoding, sink configuration, and PPS SDP transmission
- Add FEC (Forward Error Correction) overhead compensation (2.4%)
- Workaround sync polarity issues for 1920x1080 mode with DSC

The implementation automatically enables DSC when supported by both source
and sink, with fallback to uncompressed mode. DSC parameters are
configurable with defaults of 8 bpp compressed bitrate and 10 slice count.

Signed-off-by: Swapnil Jakhade <sjakhade@cadence.com>
Signed-off-by: Harikrishna Shenoy <h-shenoy@ti.com>
---
 .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 357 ++++++++++++++++--
 1 file changed, 336 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index 38726ae1bf150..6937f6b9be516 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -50,6 +50,7 @@
 #include <linux/unaligned.h>
 
 #include "cdns-mhdp8546-core.h"
+#include "cdns-mhdp8546-dsc.h"
 #include "cdns-mhdp8546-hdcp.h"
 #include "cdns-mhdp8546-j721e.h"
 
@@ -545,6 +546,104 @@ int cdns_mhdp_adjust_lt(struct cdns_mhdp_device *mhdp, unsigned int nlanes,
 	return ret;
 }
 
+static int cdns_mhdp_wait_for_fec(struct cdns_mhdp_device *mhdp,
+				  bool expected_status)
+{
+	u32 fec_status;
+	unsigned long timeout = jiffies + msecs_to_jiffies(1000);
+
+	cdns_mhdp_reg_read(mhdp, CDNS_DP_FEC_STATUS, &fec_status);
+	while (((fec_status & CDNS_DP_FEC_BUSY) != expected_status) &&
+	       time_before(jiffies, timeout)) {
+		cdns_mhdp_reg_read(mhdp, CDNS_DP_FEC_STATUS, &fec_status);
+		cpu_relax();
+	}
+
+	if (time_after_eq(jiffies, timeout)) {
+		DRM_DEV_ERROR(mhdp->dev, "Timeout while waiting for FEC\n");
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+
+static int cdns_mhdp_fec_sink_support(struct cdns_mhdp_device *mhdp)
+{
+	int ret = 0;
+	u16 dpcd_buffer;
+
+	ret = drm_dp_dpcd_read_data(&mhdp->aux, DP_FEC_CAPABILITY, &dpcd_buffer, 1);
+	if (ret)
+		goto err;
+
+	if (!(dpcd_buffer & DP_FEC_CAPABLE)) {
+		ret = -EOPNOTSUPP;
+		DRM_DEV_DEBUG(mhdp->dev, "sink does not support FEC: %d\n", ret);
+		goto err;
+	}
+
+err:
+	return ret;
+}
+
+static int cdns_mhdp_fec_sink_set_ready(struct cdns_mhdp_device *mhdp,
+					bool enable)
+{
+	int ret = 0;
+	u8 dpcd_buffer = 0;
+
+	if (enable)
+		dpcd_buffer |= DP_FEC_READY;
+
+	ret = drm_dp_dpcd_write_data(&mhdp->aux, DP_FEC_CONFIGURATION, &dpcd_buffer, 1);
+
+	return  ret;
+}
+
+static int cdns_mhdp_fec_set_ready(struct cdns_mhdp_device *mhdp, bool enable)
+{
+	int ret;
+
+	ret = cdns_mhdp_fec_sink_support(mhdp);
+	if (ret)
+		goto err;
+
+	ret = cdns_mhdp_fec_sink_set_ready(mhdp, enable);
+	if (ret)
+		goto err;
+
+	ret = cdns_mhdp_reg_write_bit(mhdp, CDNS_DP_FEC_CTRL, 1, 1, enable);
+	if (ret)
+		goto err;
+
+err:
+	return ret;
+}
+
+static int cdns_mhdp_fec_enable(struct cdns_mhdp_device *mhdp, bool enable)
+{
+	int ret;
+	u32 resp;
+
+	ret = cdns_mhdp_reg_read(mhdp, CDNS_DP_FRAMER_GLOBAL_CONFIG, &resp);
+	if (ret < 0)
+		goto err;
+
+	if (!(resp & CDNS_DP_NO_VIDEO_MODE)) {
+		ret = -EIO;
+		goto err;
+	}
+
+	ret = cdns_mhdp_reg_write_bit(mhdp, CDNS_DP_FEC_CTRL, 0, 1, enable);
+	if (ret)
+		goto err;
+
+	return cdns_mhdp_wait_for_fec(mhdp, enable);
+err:
+	DRM_DEV_ERROR(mhdp->dev, "set fec enable failed: %d\n", ret);
+	return ret;
+}
+
 /**
  * cdns_mhdp_link_configure() - configure a DisplayPort link
  * @aux: DisplayPort AUX channel
@@ -1407,6 +1506,16 @@ static int cdns_mhdp_link_up(struct cdns_mhdp_device *mhdp)
 	amp[1] = DP_SET_ANSI_8B10B;
 	drm_dp_dpcd_write(&mhdp->aux, DP_DOWNSPREAD_CTRL, amp, 2);
 
+	if (dpcd[DP_DPCD_REV] < 0x14) {
+		mhdp->fec_enabled = false;
+		DRM_DEV_DEBUG(mhdp->dev, "FEC available only in DP 1.4+\n");
+	} else if (cdns_mhdp_fec_set_ready(mhdp, true)) {
+		mhdp->fec_enabled = false;
+		DRM_DEV_DEBUG(mhdp->dev, "Cannot set FEC ready.\n");
+	} else {
+		mhdp->fec_enabled = true;
+	}
+
 	if (mhdp->host.fast_link & mhdp->sink.fast_link) {
 		dev_err(mhdp->dev, "fastlink not supported\n");
 		return -EOPNOTSUPP;
@@ -1494,10 +1603,14 @@ static int cdns_mhdp_connector_detect(struct drm_connector *conn,
 	return cdns_mhdp_detect(mhdp);
 }
 
-static u32 cdns_mhdp_get_bpp(struct cdns_mhdp_display_fmt *fmt)
+static u32 cdns_mhdp_get_bpp(struct cdns_mhdp_device *mhdp)
 {
+	struct cdns_mhdp_display_fmt *fmt = &mhdp->display_fmt;
 	u32 bpp;
 
+	if (mhdp->dsc_params.compression_enable)
+		return mhdp->dsc_params.compressed_bpp;
+
 	if (fmt->y_only)
 		return fmt->bpc;
 
@@ -1533,7 +1646,7 @@ bool cdns_mhdp_bandwidth_ok(struct cdns_mhdp_device *mhdp,
 	 * units of the rate parameter.
 	 */
 
-	bpp = cdns_mhdp_get_bpp(&mhdp->display_fmt);
+	bpp = cdns_mhdp_get_bpp(mhdp);
 	req_bw = mode->clock * bpp / 8;
 	max_bw = lanes * rate;
 	if (req_bw > max_bw) {
@@ -1693,6 +1806,74 @@ static int cdns_mhdp_attach(struct drm_bridge *bridge,
 	return ret;
 }
 
+static int cdns_mhdp_dsc_set_stream_compressed(struct cdns_mhdp_device *mhdp,
+					       int stream_id, bool compressed)
+{
+	u32 reg_val;
+	int ret;
+
+	ret = cdns_mhdp_reg_read(mhdp, CDNS_DP_VB_ID(stream_id), &reg_val);
+	if (ret < 0)
+		return ret;
+
+	if (compressed)
+		reg_val |= CDNS_DP_VB_ID_COMPRESSED;
+	else
+		reg_val &= ~CDNS_DP_VB_ID_COMPRESSED;
+
+	return cdns_mhdp_reg_write(mhdp, CDNS_DP_VB_ID(stream_id), reg_val);
+}
+
+static int cdns_mhdp_dsc_wait_for_completion(struct cdns_mhdp_device *mhdp,
+					     u8 event_bit, int stream_id)
+{
+	u32 dsc_ctrl;
+	int ret;
+	unsigned long timeout;
+
+	ret = cdns_mhdp_reg_write_bit(mhdp, CDNS_DP_DSC_CTRL(stream_id),
+				      event_bit, 1, true);
+	if (ret)
+		return ret;
+
+	timeout = jiffies + msecs_to_jiffies(1000);
+
+	do {
+		cdns_mhdp_reg_read(mhdp, CDNS_DP_DSC_CTRL(stream_id), &dsc_ctrl);
+		cpu_relax();
+	} while (((dsc_ctrl & (1 << event_bit)) != 0) && time_before(jiffies, timeout));
+
+	if (time_after_eq(jiffies, timeout)) {
+		DRM_DEV_ERROR(mhdp->dev, "Timeout while waiting for event %d\n", event_bit);
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+
+static int cdns_mhdp_dsc_reset(struct cdns_mhdp_device *mhdp)
+{
+	/* Setting reset bit in any stream resets entire DSC. Stream 0 may always be used for it. */
+	return cdns_mhdp_dsc_wait_for_completion(mhdp, CDNS_DP_DSC_CTRL_SW_RST_BIT, 0);
+}
+
+static int cdns_mhdp_dsc_update(struct cdns_mhdp_device *mhdp, int stream_id)
+{
+	return cdns_mhdp_dsc_wait_for_completion(mhdp, CDNS_DP_DSC_CTRL_REG_UPDATE_BIT,
+						 stream_id);
+}
+
+static int cdns_mhdp_dsc_enable(struct cdns_mhdp_device *mhdp, int stream_id, bool enable)
+{
+	return cdns_mhdp_reg_write_bit(mhdp, CDNS_DP_DSC_CTRL(stream_id),
+				       CDNS_DP_DSC_CTRL_EN_BIT, 1, enable ? 1 : 0);
+}
+
+static int cdns_mhdp_dsc_sink_enable(struct cdns_mhdp_device *mhdp, bool enable)
+{
+	return drm_dp_dpcd_writeb(&mhdp->aux, DP_DSC_ENABLE, enable) != 1;
+}
+
 static void cdns_mhdp_configure_video(struct cdns_mhdp_device *mhdp,
 				      const struct drm_display_mode *mode)
 {
@@ -1702,7 +1883,7 @@ static void cdns_mhdp_configure_video(struct cdns_mhdp_device *mhdp,
 		front_porch, back_porch, msa_h0, msa_v0, hsync, vsync,
 		dp_vertical_1;
 	u8 stream_id = mhdp->stream_id;
-	u32 bpp, bpc, pxlfmt, framer;
+	u32 bpp, bpc, pxlfmt, framer, dp_byte_count;
 	int ret;
 
 	pxlfmt = mhdp->display_fmt.color_format;
@@ -1716,7 +1897,7 @@ static void cdns_mhdp_configure_video(struct cdns_mhdp_device *mhdp,
 	     pxlfmt == DRM_COLOR_FORMAT_YCBCR422) && mode->crtc_vdisplay >= 720)
 		misc0 = DP_YCBCR_COEFFICIENTS_ITU709;
 
-	bpp = cdns_mhdp_get_bpp(&mhdp->display_fmt);
+	bpp = cdns_mhdp_get_bpp(mhdp);
 
 	switch (pxlfmt) {
 	case DRM_COLOR_FORMAT_RGB444:
@@ -1765,6 +1946,9 @@ static void cdns_mhdp_configure_video(struct cdns_mhdp_device *mhdp,
 	if (mode->flags & DRM_MODE_FLAG_INTERLACE)
 		bnd_hsync2vsync |= CDNS_IP_DET_INTERLACE_FORMAT;
 
+	if (mhdp->dsc_params.compression_enable)
+		bnd_hsync2vsync |= CDNS_IP_VIF_ALIGNMENT_LSB;
+
 	cdns_mhdp_reg_write(mhdp, CDNS_BND_HSYNC2VSYNC(stream_id),
 			    bnd_hsync2vsync);
 
@@ -1792,8 +1976,14 @@ static void cdns_mhdp_configure_video(struct cdns_mhdp_device *mhdp,
 			    CDNS_DP_FRONT_PORCH(front_porch) |
 			    CDNS_DP_BACK_PORCH(back_porch));
 
-	cdns_mhdp_reg_write(mhdp, CDNS_DP_BYTE_COUNT(stream_id),
-			    mode->crtc_hdisplay * bpp / 8);
+	if (mhdp->dsc_params.compression_enable) {
+		dp_byte_count = (((mhdp->dsc_config.slice_chunk_size / mhdp->link.num_lanes) + 1) <<
+				CDNS_DP_BYTE_COUNT_BYTES_IN_CHUNK_SHIFT) |
+				((mhdp->dsc_config.slice_chunk_size / mhdp->link.num_lanes) + 1);
+	} else {
+		dp_byte_count = (mode->crtc_hdisplay * bpp / 8);
+	}
+	cdns_mhdp_reg_write(mhdp, CDNS_DP_BYTE_COUNT(stream_id), dp_byte_count);
 
 	msa_h0 = mode->crtc_htotal - mode->crtc_hsync_start;
 	cdns_mhdp_reg_write(mhdp, CDNS_DP_MSA_HORIZONTAL_0(stream_id),
@@ -1852,6 +2042,9 @@ static void cdns_mhdp_configure_video(struct cdns_mhdp_device *mhdp,
 				(mode->flags & DRM_MODE_FLAG_INTERLACE) ?
 				CDNS_DP_VB_ID_INTERLACED : 0);
 
+	if (mhdp->dsc_params.compression_enable)
+		cdns_mhdp_dsc_set_stream_compressed(mhdp, stream_id, true);
+
 	ret = cdns_mhdp_reg_read(mhdp, CDNS_DP_FRAMER_GLOBAL_CONFIG, &framer);
 	if (ret < 0) {
 		dev_err(mhdp->dev,
@@ -1860,7 +2053,6 @@ static void cdns_mhdp_configure_video(struct cdns_mhdp_device *mhdp,
 		return;
 	}
 	framer |= CDNS_DP_FRAMER_EN;
-	framer &= ~CDNS_DP_NO_VIDEO_MODE;
 	cdns_mhdp_reg_write(mhdp, CDNS_DP_FRAMER_GLOBAL_CONFIG, framer);
 }
 
@@ -1869,14 +2061,60 @@ static void cdns_mhdp_sst_enable(struct cdns_mhdp_device *mhdp,
 {
 	u32 rate, vs, required_bandwidth, available_bandwidth;
 	s32 line_thresh1, line_thresh2, line_thresh = 0;
-	int pxlclock = mode->crtc_clock;
+	int ret, pxlclock = mode->crtc_clock;
+	u32 vs_f, framer, pxl_repr;
 	u32 tu_size = 64;
 	u32 bpp;
 
 	/* Get rate in MSymbols per second per lane */
 	rate = mhdp->link.rate / 1000;
 
-	bpp = cdns_mhdp_get_bpp(&mhdp->display_fmt);
+	bpp = cdns_mhdp_get_bpp(mhdp);
+
+	if (mhdp->fec_enabled) {
+		if (cdns_mhdp_fec_enable(mhdp, true))
+			mhdp->fec_enabled = false;
+	} else {
+		cdns_mhdp_fec_enable(mhdp, false);
+	}
+
+	if (mhdp->dsc_supported && mhdp->fec_enabled && !cdns_mhdp_dsc_sink_support(mhdp)) {
+		ret = cdns_mhdp_dsc_reset(mhdp);
+		if (ret)
+			dev_err(mhdp->dev, "DSC reset failed. ret = %d\n", ret);
+
+		mhdp->dsc_params.compressed_bpp = 8;
+		mhdp->dsc_params.slice_count = 10;
+
+		ret = cdns_mhdp_compute_dsc_params(mhdp);
+		if (ret < 0) {
+			mhdp->dsc_params.compression_enable = false;
+			dev_err(mhdp->dev, "DSC params computation failed. ret = %d\n", ret);
+		} else {
+			mhdp->dsc_params.compression_enable = true;
+			/* Write config for stream 0 */
+			cdns_mhdp_dsc_write_enc_config(mhdp, 0, mode);
+			cdns_mhdp_dsc_update(mhdp, 0);
+			cdns_mhdp_dsc_write_config(mhdp);
+		}
+	} else {
+		if (mhdp->dsc_params.compression_enable) {
+			cdns_mhdp_dsc_sink_enable(mhdp, false);
+			cdns_mhdp_dsc_set_stream_compressed(mhdp, 0, false);
+		}
+		mhdp->dsc_params.compression_enable = false;
+	}
+
+	/* Enable DSC for stream 0 */
+	if (mhdp->dsc_params.compression_enable) {
+		cdns_mhdp_dsc_enable(mhdp, 0, true);
+
+		if (cdns_mhdp_dsc_sink_enable(mhdp, true))
+			dev_err(mhdp->dev, "Cannot enable DSC in sink.\n");
+		cdns_mhdp_dsc_send_pps_sdp(mhdp, 0);
+	}
+
+	bpp = cdns_mhdp_get_bpp(mhdp);
 
 	required_bandwidth = pxlclock * bpp / 8;
 	available_bandwidth = mhdp->link.num_lanes * rate;
@@ -1884,6 +2122,12 @@ static void cdns_mhdp_sst_enable(struct cdns_mhdp_device *mhdp,
 	vs = tu_size * required_bandwidth / available_bandwidth;
 	vs /= 1000;
 
+	vs_f = tu_size * required_bandwidth / available_bandwidth;
+	if (mhdp->fec_enabled)
+		vs_f = (vs_f * 1024) / 1000;	//2.4%
+	vs = vs_f / 1000;
+	vs_f = vs_f % 1000;
+
 	if (vs == tu_size)
 		vs = tu_size - 1;
 
@@ -1907,6 +2151,70 @@ static void cdns_mhdp_sst_enable(struct cdns_mhdp_device *mhdp,
 						   0 : tu_size - vs));
 
 	cdns_mhdp_configure_video(mhdp, mode);
+
+	if (mhdp->dsc_params.compression_enable) {
+		cdns_mhdp_reg_read(mhdp, CDNS_DP_FRAMER_PXL_REPR(0), &pxl_repr);
+		pxl_repr &= ~CDNS_DP_FRAMER_PXL_REPR_M;
+		pxl_repr &= ~CDNS_DP_FRAMER_PXL_REPR_DIFF;
+		pxl_repr |= (((vs_f / 10) << CDNS_DP_FRAMER_PXL_REPR_M_SHIFT)
+			      & CDNS_DP_FRAMER_PXL_REPR_M) |
+			      (((100 - (vs_f / 10)) << CDNS_DP_FRAMER_PXL_REPR_DIFF_SHIFT)
+			      & CDNS_DP_FRAMER_PXL_REPR_DIFF);
+		cdns_mhdp_reg_write(mhdp, CDNS_DP_FRAMER_PXL_REPR(0), pxl_repr);
+	}
+
+	/* Enable video mode */
+	cdns_mhdp_reg_read(mhdp, CDNS_DP_FRAMER_GLOBAL_CONFIG, &framer);
+	framer &= ~CDNS_DP_NO_VIDEO_MODE;
+	cdns_mhdp_reg_write(mhdp, CDNS_DP_FRAMER_GLOBAL_CONFIG, framer);
+}
+
+static int cdns_mhdp_configure_car(struct cdns_mhdp_device *mhdp, bool enable)
+{
+	u32 dptx_car, source_pkt_car;
+	int ret;
+
+	ret = cdns_mhdp_reg_read(mhdp, CDNS_DPTX_CAR, &dptx_car);
+	if (ret < 0) {
+		dev_err(mhdp->dev, "Failed to read CDNS_DPTX_CAR %d\n", ret);
+		goto out;
+	}
+
+	ret = cdns_mhdp_reg_read(mhdp, CDNS_SOURCE_PKT_CAR, &source_pkt_car);
+	if (ret < 0) {
+		dev_err(mhdp->dev, "Failed to read CDNS_SOURCE_PKT_CAR %d\n", ret);
+		goto out;
+	}
+
+	if (enable) {
+		dev_dbg(mhdp->dev, "%s: Enable clocks for VIF and PIF\n", __func__);
+
+		/* Enable VIF clock for stream 0 */
+		cdns_mhdp_reg_write(mhdp, CDNS_DPTX_CAR,
+				    dptx_car | CDNS_VIF_CLK_EN | CDNS_VIF_CLK_RSTN);
+
+		/* Enable PKT clock */
+		cdns_mhdp_reg_write(mhdp, CDNS_SOURCE_PKT_CAR,
+				    source_pkt_car | CDNS_PKT_DATA_CLK_EN
+						   | CDNS_PKT_DATA_RSTN
+						   | CDNS_PKT_SYS_CLK_EN
+						   | CDNS_PKT_SYS_RSTN);
+	} else {
+		dev_dbg(mhdp->dev, "%s: Disable clocks for VIF and PIF\n", __func__);
+
+		/* Disable VIF clock for stream 0 */
+		cdns_mhdp_reg_write(mhdp, CDNS_DPTX_CAR,
+				    dptx_car & ~(CDNS_VIF_CLK_EN | CDNS_VIF_CLK_RSTN));
+
+		/* Disable PKT clock */
+		cdns_mhdp_reg_write(mhdp, CDNS_SOURCE_PKT_CAR,
+				    source_pkt_car & ~(CDNS_PKT_DATA_CLK_EN
+						   | CDNS_PKT_DATA_RSTN
+						   | CDNS_PKT_SYS_CLK_EN
+						   | CDNS_PKT_SYS_RSTN));
+	}
+out:
+	return ret;
 }
 
 static void cdns_mhdp_atomic_enable(struct drm_bridge *bridge,
@@ -1919,7 +2227,6 @@ static void cdns_mhdp_atomic_enable(struct drm_bridge *bridge,
 	struct drm_connector_state *conn_state;
 	struct drm_bridge_state *new_state;
 	const struct drm_display_mode *mode;
-	u32 resp;
 	int ret;
 
 	dev_dbg(mhdp->dev, "bridge enable\n");
@@ -1935,16 +2242,13 @@ static void cdns_mhdp_atomic_enable(struct drm_bridge *bridge,
 	if (mhdp->info && mhdp->info->ops && mhdp->info->ops->enable)
 		mhdp->info->ops->enable(mhdp);
 
-	/* Enable VIF clock for stream 0 */
-	ret = cdns_mhdp_reg_read(mhdp, CDNS_DPTX_CAR, &resp);
+	/* Enable clocks for video and packet interfaces */
+	ret = cdns_mhdp_configure_car(mhdp, true);
 	if (ret < 0) {
-		dev_err(mhdp->dev, "Failed to read CDNS_DPTX_CAR %d\n", ret);
+		dev_err(mhdp->dev, "Failed to enable clocks %d\n", ret);
 		goto out;
 	}
 
-	cdns_mhdp_reg_write(mhdp, CDNS_DPTX_CAR,
-			    resp | CDNS_VIF_CLK_EN | CDNS_VIF_CLK_RSTN);
-
 	connector = drm_atomic_get_new_connector_for_encoder(state,
 							     bridge->encoder);
 	if (WARN_ON(!connector))
@@ -2022,10 +2326,8 @@ static void cdns_mhdp_atomic_disable(struct drm_bridge *bridge,
 
 	cdns_mhdp_link_down(mhdp);
 
-	/* Disable VIF clock for stream 0 */
-	cdns_mhdp_reg_read(mhdp, CDNS_DPTX_CAR, &resp);
-	cdns_mhdp_reg_write(mhdp, CDNS_DPTX_CAR,
-			    resp & ~(CDNS_VIF_CLK_EN | CDNS_VIF_CLK_RSTN));
+	/* Disable clocks for video and packet interfaces */
+	cdns_mhdp_configure_car(mhdp, false);
 
 	if (mhdp->info && mhdp->info->ops && mhdp->info->ops->disable)
 		mhdp->info->ops->disable(mhdp);
@@ -2121,7 +2423,7 @@ static int cdns_mhdp_atomic_check(struct drm_bridge *bridge,
 				  struct drm_connector_state *conn_state)
 {
 	struct cdns_mhdp_device *mhdp = bridge_to_mhdp(bridge);
-	const struct drm_display_mode *mode = &crtc_state->adjusted_mode;
+	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
 
 	mutex_lock(&mhdp->link_mutex);
 
@@ -2141,6 +2443,10 @@ static int cdns_mhdp_atomic_check(struct drm_bridge *bridge,
 	if (mhdp->info)
 		bridge_state->input_bus_cfg.flags = *mhdp->info->input_bus_flags;
 
+	//TODO For DSC. Might need proper handling. 1920x1080 mode doesn't work without this.
+	mode->flags |= (DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
+	mode->flags &= ~(DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);
+
 	mutex_unlock(&mhdp->link_mutex);
 	return 0;
 }
@@ -2428,6 +2734,15 @@ static int cdns_mhdp_probe(struct platform_device *pdev)
 		mhdp->hdcp_supported = true;
 	}
 
+	mhdp->dsc_regs = devm_platform_ioremap_resource_byname(pdev, "dsc");
+	if (IS_ERR(mhdp->dsc_regs)) {
+		mhdp->dsc_supported = false;
+		dev_info(dev,
+			 "Failed to get DSC memory resource, DSC not supported\n");
+	} else {
+		mhdp->dsc_supported = true;
+	}
+
 	mhdp->phy = devm_of_phy_get_by_index(dev, pdev->dev.of_node, 0);
 	if (IS_ERR(mhdp->phy)) {
 		dev_err(dev, "no PHY configured\n");
-- 
2.34.1

