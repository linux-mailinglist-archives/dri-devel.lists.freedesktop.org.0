Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E722C73EBD
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 13:15:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0009610E743;
	Thu, 20 Nov 2025 12:15:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="RkOqRpk6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012026.outbound.protection.outlook.com
 [40.93.195.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A4C610E74E
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 12:15:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F1P3EblJ4nckn0snUeCqFS/P5HNW8OFX+X9EDpD3fU2fWpEA/G1sSwMl0ebDboB66jCDvZW3GwzMQnWutl20t068VHmxzbiDKZMgdWzjvLoc4BPMFwcEJFE/PSgC7fPwScNibUUlf82B/jhwQYYmyPuYjQ5TByv2C7sqJH5PwdLsupxIyPQA40UDT0P/5EUdJXlwMhJrV6VH0Wuz0n6rQvxc/porLtwocosYyDmGWsN9PpE+zwTvtkcA/4A9E/pdv6PKHvFMsq3lfwmgm4TXZ0Qp6LzVqeIQy5ZMJVtkjfvtelsstv87h/8tTng7lHBeLfEMeNmKpMxRXKtIo1H+OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zo2yAB64mQbhFoNPbrHpiXafZf3Ft4t6a6E+Q3vDpws=;
 b=MYvANYXcocWb4GOGUWRZempFuL9lZpcsZ3+jSupgjoUc25+/r2XievgO9U9c7IgSn4xEFxzp2L6DYmJATvMaqEuLoRy420OmQylILIXXCNHWJ2mhs29Ntf21ZKEvIaNbcm4RkbTfZ3nPFo2eRH12dRtZw7wkdk80iNctIqpfRzc5sWL4x1UP1cdL8UdBLz/sWW5LW5BxX+s/9J3RK4P1R0Ulo4fwqeV4tlVhGGguY469PNOpxvTNZdRwY0Q9WJ5+nQypILt/mDwORtZZnWUDI78sDphI8+PlHSjH1nbpPva7BbGb9l9cSoemzY9U0yjwA7IjCU9ehW18IpLkFh+zdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=suse.de smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zo2yAB64mQbhFoNPbrHpiXafZf3Ft4t6a6E+Q3vDpws=;
 b=RkOqRpk67WC8Vx83HVxoInahR1LMQp0SqWqZ7VVZxzZsiCDrs6MYBUD/HWpNKkm5kFHNJ61ToZT+VBnAmJKSPc+4duQTKsHwMpP3xNql/2hAZczVqQoy9FRplG8p31qdUpO8sw3+KHqOHdTMxIgghu/dgjgr/oa/BNThV64/spE=
Received: from MN2PR06CA0014.namprd06.prod.outlook.com (2603:10b6:208:23d::19)
 by IA1PR10MB7334.namprd10.prod.outlook.com (2603:10b6:208:3fc::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 12:15:11 +0000
Received: from BL02EPF0002992E.namprd02.prod.outlook.com
 (2603:10b6:208:23d:cafe::51) by MN2PR06CA0014.outlook.office365.com
 (2603:10b6:208:23d::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.11 via Frontend Transport; Thu,
 20 Nov 2025 12:15:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL02EPF0002992E.mail.protection.outlook.com (10.167.249.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Thu, 20 Nov 2025 12:15:11 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 20 Nov
 2025 06:15:04 -0600
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 20 Nov
 2025 06:15:03 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 20 Nov 2025 06:15:03 -0600
Received: from hkshenoy.dhcp.ti.com (hkshenoy.dhcp.ti.com [172.24.235.208])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AKCEHE13636470;
 Thu, 20 Nov 2025 06:14:57 -0600
From: Harikrishna Shenoy <h-shenoy@ti.com>
To: <Laurent.pinchart@ideasonboard.com>, <airlied@gmail.com>,
 <andrzej.hajda@intel.com>, <andy.yan@rock-chips.com>,
 <aradhya.bhatia@linux.dev>, <devarsht@ti.com>, <dianders@chromium.org>,
 <dri-devel@lists.freedesktop.org>, <javierm@redhat.com>,
 <jernej.skrabec@gmail.com>, <jonas@kwiboo.se>,
 <linux-kernel@vger.kernel.org>, <linux@treblig.org>,
 <luca.ceresoli@bootlin.com>, <lumag@kernel.org>, <lyude@redhat.com>,
 <maarten.lankhorst@linux.intel.com>, <mordan@ispras.ru>,
 <mripard@kernel.org>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <s-jain1@ti.com>, <simona@ffwll.ch>, <tomi.valkeinen@ideasonboard.com>,
 <tzimmermann@suse.de>, <u-kumar1@ti.com>
Subject: [PATCH RESEND v9 6/6] drm/bridge: cadence: cdns-mhdp8546-core: Reduce
 log level for DPCD read/write
Date: Thu, 20 Nov 2025 17:44:16 +0530
Message-ID: <20251120121416.660781-7-h-shenoy@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251120121416.660781-1-h-shenoy@ti.com>
References: <20251120121416.660781-1-h-shenoy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992E:EE_|IA1PR10MB7334:EE_
X-MS-Office365-Filtering-Correlation-Id: c0ea5cf5-69b0-45a6-845e-08de282e73fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|82310400026|36860700013|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Rzd2XXoBJqrFymC6zNPxHVL4kR7cxUS2HatR4canFEknDhdsUS6yoAmFiQGg?=
 =?us-ascii?Q?thd5UdqZDyOzNph9MRUFcVwbQnCyhBVwo79aJhwgMLRfn1UQB6VZ2O+qK6AF?=
 =?us-ascii?Q?9EizNcX5neVyvgUOWNqDdzvpOis0XGESq258XsBhw9SbqtICE4Y1FwDZlRb9?=
 =?us-ascii?Q?HSonvTpcAbaWwp5+tYTAixwVgTubMqYN/hRm6xaZo3AAh4I6bcgE9xFgYbZk?=
 =?us-ascii?Q?jx1Xm2hgSmdCmVlPiZbOoIwiSM2s0FUmDDiRMz8Vy015Muz2RDYkOg17s5Bk?=
 =?us-ascii?Q?4XDVTyDOQ825Ir3zmLmRJ4Icsh6YHY+kMDtKLsPV8MeZU4gWns6fNHnsyeSr?=
 =?us-ascii?Q?ScfJkswAJyYMiXT5+5o35AAWG/jSVRToJ0vemIQCs+V0jzt+azyadYjA1Znj?=
 =?us-ascii?Q?eW7YGkSfFrpmrQ/GAz6gvtL1Qj/yrIYqn4Y46OLGRVc1eGbkjLUbrnyxoPR0?=
 =?us-ascii?Q?KcR3+NxvJT/JzKLcpUlHNad8G5zHQAF8omnM9Q++6lvQqrRn1t7KV8f5mRsD?=
 =?us-ascii?Q?MfbEGvMVM8gkzMciEveDFSaydCJH/W8gvuPwILKPXCX6fFfXV0/CKQC3HSsa?=
 =?us-ascii?Q?WHl77cAWv69MPQnyTWkYZWbEXROClL1mhNTnMMX8L9ZgJayHf9KvAr5Pf7iz?=
 =?us-ascii?Q?95g3XJazCVCzHATLiTaoKlfnRXX440RwOEVLw2TxN2ykfJ5qEWAPmAwRFC+j?=
 =?us-ascii?Q?5JwOVHoVmPDT20/enGlJuu7ROQ17D4m4NX5JSr8eo2aSxSz8fnLOq63xuI9R?=
 =?us-ascii?Q?q4BcXdUJ8rTrvH2+wmRR/nrv8by6r/kwBi9xrDRMz8hxQUXdWUdVJlQmN7tu?=
 =?us-ascii?Q?hC3oEC225F5EuZSOUbdjzsfLj8WDrPQ0FTgS2VohfZiySyE2gbSSf409BVIP?=
 =?us-ascii?Q?4to+fdogTHib0YG/llqbCiBaUNUYrn5zXpCgm1sK3WE8sjPjTnS/FSS3+S3f?=
 =?us-ascii?Q?rPsTUzSaQcYUpWYz0pOoDReo3PVWIPLZa5a+Mzi3Nk/kF4xlH71joZK3iyEX?=
 =?us-ascii?Q?oNIUJqmMgi6AIj6U3xCbGEx0w9BGrc2xJ0Qz9h6Fyk1ecKWrq1gEHLWjn56t?=
 =?us-ascii?Q?AfsA8XMMaO2eWYWY3EfM0tKdHdsUAqCduyYkodzcgHD1gaZKvOBKMqZOBdV/?=
 =?us-ascii?Q?EsWXDUZGIJTSoG1Z9/7zbq/RakVjxoFF8RJnYww7rgOFYlYKtQIwIJppnC+v?=
 =?us-ascii?Q?Q3WVAchhGocUyAzL7GejzAKSWhaMtDLepcvc/m3nE6/REnlDX4mxTmPVp2tm?=
 =?us-ascii?Q?NKdEXDJRnDkIEyziJbCXXQkaTLgmqMBPT9CJg/+AIGVD8WNICh81gjVkHu5H?=
 =?us-ascii?Q?76vtgqiMIWt6wtUyMohlMXmhz6QBDpUDKLP+4sIcru0HUg7jY4ztZeHXuhXI?=
 =?us-ascii?Q?0VCOZzEY5F0UI1yLV4watCOF5Aygw0s0vSYuzLeI8wwVDdisLwwvA+zGFDGk?=
 =?us-ascii?Q?NdI03GYz6v7QfV+/GvR8uDokDPToSzaP85o/r3j7SgAmV8Rao9zNFWZ+I4gU?=
 =?us-ascii?Q?+xu5e17OgvP3z2d86F0cMEhVr6r2U5m11MVebm2OFZP9lrlzzTRddnmpv+Hr?=
 =?us-ascii?Q?QXQIhywtboBPtqFzqyav9nSq6cvKRK8QQYB4KDhn?=
X-Forefront-Antispam-Report: CIP:198.47.23.195; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:lewvzet201.ext.ti.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(7416014)(376014)(82310400026)(36860700013)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 12:15:11.1423 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0ea5cf5-69b0-45a6-845e-08de282e73fa
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.23.195];
 Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0002992E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7334
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

From: Jayesh Choudhary <j-choudhary@ti.com>

Reduce the log level for cdns_mhdp_dpcd_read and cdns_mhdp_dpcd_write
errors in cdns_mhdp_transfer function as in case of failure, there is
flooding of these prints along with other indicators like EDID failure
logs which are fairly intuitive in themselves rendering these error logs
useless.
Also, the caller functions for the cdns_mhdp_transfer in drm_dp_helper.c
(which calls it 32 times), has debug log level in case transfer fails.
So having a superseding log level in cdns_mhdp_transfer seems bad.

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
Signed-off-by: Harikrishna Shenoy <h-shenoy@ti.com>
---
 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index 002b4be3de674..120eb7ffe20c0 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -778,7 +778,7 @@ static ssize_t cdns_mhdp_transfer(struct drm_dp_aux *aux,
 			if (!ret)
 				continue;
 
-			dev_err(mhdp->dev,
+			dev_dbg(mhdp->dev,
 				"Failed to write DPCD addr %u\n",
 				msg->address + i);
 
@@ -788,7 +788,7 @@ static ssize_t cdns_mhdp_transfer(struct drm_dp_aux *aux,
 		ret = cdns_mhdp_dpcd_read(mhdp, msg->address,
 					  msg->buffer, msg->size);
 		if (ret) {
-			dev_err(mhdp->dev,
+			dev_dbg(mhdp->dev,
 				"Failed to read DPCD addr %u\n",
 				msg->address);
 
-- 
2.34.1

