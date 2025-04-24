Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECE5A99F45
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 05:08:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6057E10E715;
	Thu, 24 Apr 2025 03:08:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="diSciXOc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2086.outbound.protection.outlook.com [40.107.92.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51A0410E715
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 03:07:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mLqwGCH5y/ka53nbHYc6lXh37Ra1uA+pGuEoDdefmm8sDLTdw9/XUFdWQgCqsmY07kdY3xGtDv/svqID+7y7rKbORt29ut5850yi6LC3nrtaf2v4F3PYScV/IUpjI2xvgJAyxpy5zoWtaHD2ALDrVojZmW7NwFgnROmBFu+6KNpYNhAqv91OMKVLMN7Yu6PW+w8uYehMgxRhHNFFmp5spHKluP090JbeaIuqDMz/TmtmTGKaJBpD+rcBj+ZdubICMU6QcidLstC2HXjndjMsRm3HGW3DL+QEKo1KYCAhhJwUYymjcizmIIKKpk0bHej97jBPV1l3usCEZArXur6UCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4T+flvdCKGgyYDbCLIo6sHYCTE1edwGTVzihI0+v6KY=;
 b=Bd28e0b7DSX2KADwVwCsYNgd/LvzYhIf2e2xgK85APFXCIdXP5YqYn/kDJGbK/mK2qfIenZSgaPG8fkkxZPLaL7gknXLyWqcMmAlU1XyLxPVSO28MPc/gq0Pv2jzn2yrG42AMQoxLT6P4sNV4JW+cU59QvRyeqKygzY33tG0zRYe4LnnBOq2/7avmm7uf8P9Bqn9vqGks+YtZvwIDKLLfBQyShLEfOkuU/ilr18co5QiU9qabvNzvGfw2poTtq6uKhqNOTVLpp4f9uAMsKYQmOEv5MNwJ791n2v5M19M6Jb47EhsWmUsR0T3/OdK0A1ZLl0BsoJ9HuqXo1I8TXRMJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4T+flvdCKGgyYDbCLIo6sHYCTE1edwGTVzihI0+v6KY=;
 b=diSciXOcJg4qJPkyVUThRQwzMhcW3xfsZ/H72YQ5T/J6FJRB6YHzzEO3mur4OfafRwGce3yHxAmZMZMTOJ9DDMOdKM+pXstDSH+uYukVAkthEBZTTsA5zNs6799/LfLVuzcR8mTgafKDYhjeGgTre0a//DBk91QzqwnUpi+1zU4=
Received: from CH0PR03CA0242.namprd03.prod.outlook.com (2603:10b6:610:e5::7)
 by SN7PR12MB7105.namprd12.prod.outlook.com (2603:10b6:806:2a0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Thu, 24 Apr
 2025 03:07:54 +0000
Received: from CH2PEPF0000013E.namprd02.prod.outlook.com
 (2603:10b6:610:e5:cafe::e0) by CH0PR03CA0242.outlook.office365.com
 (2603:10b6:610:e5::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Thu,
 24 Apr 2025 03:07:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF0000013E.mail.protection.outlook.com (10.167.244.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Thu, 24 Apr 2025 03:07:53 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Apr
 2025 22:07:53 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 23 Apr 2025 22:07:50 -0500
From: Wayne Lin <Wayne.Lin@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: <ville.syrjala@linux.intel.com>, <jani.nikula@intel.com>,
 <mario.limonciello@amd.com>, <harry.wentland@amd.com>, Wayne Lin
 <Wayne.Lin@amd.com>, <stable@vger.kernel.org>
Subject: [PATCH 2/2] drm/dp: Add handling for partially read under
 I2-readC-over-AUX
Date: Thu, 24 Apr 2025 11:07:34 +0800
Message-ID: <20250424030734.873693-3-Wayne.Lin@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424030734.873693-1-Wayne.Lin@amd.com>
References: <20250424030734.873693-1-Wayne.Lin@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: Wayne.Lin@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013E:EE_|SN7PR12MB7105:EE_
X-MS-Office365-Filtering-Correlation-Id: 8732362c-b0b3-428a-cf40-08dd82dd34b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QnUrenhacG1nQ0xRQncyYUZvM1IxQitWMXgyMXJHNmdGRytseU83aE9LOVov?=
 =?utf-8?B?YlpreGhTT29VWk9sS1NQdWMvRU5GeWVFSXQ2dFliOGtqVEpubXZiZk9sSDlR?=
 =?utf-8?B?cGx1K21KWktaOUhkeGxodGxTUXl0VXdlcnpnTVhVaEVjZVBZM0l3ZU1iYTNI?=
 =?utf-8?B?NHVjdmJMRFlpMVlhM3FoMUhPVlBqLzVLQWxhS213czA4akt6YVhzSmhqV1Bu?=
 =?utf-8?B?cW83R3dWN0J5WWE3NVF2Z2pDaGV3KzlESVFuZEZWaFNNbHZFclNZNVoxTXBT?=
 =?utf-8?B?TWZLWDlRaUlzQkxieCtQNTZWcEpaa3FibWFRSk95dExVbVYza0pMOFo2bFlN?=
 =?utf-8?B?TnRjSnpiMzM1WFhYT0hhR2tjZ1h1WFZXa25GMUhRSkkyQTltUjVtNFZhN2hY?=
 =?utf-8?B?Sk9MSnJVWTlEWGZSTmZZNzM3NFBFa2tTTCt1QUhHaDdyTWFPazJlQjBMT0tE?=
 =?utf-8?B?YzZzM2dreXE4aFBmSk9DMU92ay9rYlcydWdhNW5nL0JPTEZ3TUkwZlJ5d1gx?=
 =?utf-8?B?VzRZTitOOGVPcUUvYS9wWnMwZWpGOEd1aWdXcGZhSTlqKzNYbklXMjVMUkdH?=
 =?utf-8?B?ZnlScS9tdndqWkxvU094WkRrZmw3bmdndlpPdVNNWnFhYzZTM0dEcVY1MDhw?=
 =?utf-8?B?TVBveFBkL3d3L0JRaHRiVWlYaEhFem94NnQ0Y3p3TzZHV0NuWXNwZnUxakl3?=
 =?utf-8?B?NUZ2cDZlU1pqTE43eXEyS1VPZk1WeEhQbUw5aWNMQ2l3ZHdoVkxPSTM0ejZW?=
 =?utf-8?B?K0N0Y1ROU2hONnZPR20yOXc3dEkrL1Z2TXdIQU1hY0prR1VTK1dhci9pNmM2?=
 =?utf-8?B?UXloaHNTdit0aDVtMUlLOElyOWhFaVdhNXQvWXFDQzlObFQvQnRMd2Y3SytE?=
 =?utf-8?B?SVNFOVFBOXJzNjJ4VldLM1k1TmFTam9lOTRpaVNvbXE3Yzl1M2VlWVJZYjFG?=
 =?utf-8?B?b0g5LzFkbzVlOTkrUzd0ZytQaFNoREdiWmJkQzBleC9pUldpRnBGM0tBSVJM?=
 =?utf-8?B?TGMvM005SlY4MitMMkJrQjk2ZksySW42WGdJSmNZbUYwSWtrdzJKK3JGYWFB?=
 =?utf-8?B?WEcrV0hIaFFMcEE2cE5XZ0l3ZENYRm5FNEZTcVA2TENHdk4xWGxYWVVLODMz?=
 =?utf-8?B?WVpQZVc5MzdWT0pDN1pseHNtY2E3YTJPUWw2dmhGRVVlNjBkUTh1VEVKN3Q4?=
 =?utf-8?B?K0hIY3pLS2hYTXdGRVE0MGFOeGdmMWtycHNROGtic093RlZTaDRFTnN0Vm1B?=
 =?utf-8?B?Mm5XQm9zYWhyTGs5MXRVY0h0d2JiVU5vYUMrVXMrWFR6RGZvT0ZpTjVPVzhx?=
 =?utf-8?B?Nk4xQnBHVDRvZ1E1OGpHbEJrdVQ2UGlGaHJOVUx4M0d3OGtRazlvQm45Vnpa?=
 =?utf-8?B?MVM2aUVwaDAzUjM4ZGt5T082ZFdqcGh2Tkl0TmUwcnAxbC9JVkxVY1B0R0lK?=
 =?utf-8?B?NGZRWEVaU1kzNmUwQjdTRnkvayt6a05VVVI2Y1A0WVBZaFZudEFzdHlVRFlY?=
 =?utf-8?B?Z2dneGk5T0hwcXZ0SkQ0eVZ1bXQ2TURKczVobGNraWVrTFd3QmMvUmpjRUNU?=
 =?utf-8?B?ajFZbXk3N3ZxbzNMNkRWZnN0YVJIa0xVb3MxQW5ST2xqOVFTZnBUZThuZHI1?=
 =?utf-8?B?Y0RGd0ZCNittQ2FqSGtVOXJxRlhZQ2dRY2tUTlRjWDFTMmpkRlVsWExPSDg0?=
 =?utf-8?B?U2VPUEp0U3R5a0NCajFSRFhoRy9aQ3B5TkJzYkRuRXJIV2xCb2NIZ0lTN1pz?=
 =?utf-8?B?MnJiOGhkQzQ1TE5YcDI5UnJOOEhGcVhnaTFERmJxWVJ1VVFKUXFLOHNaQTlS?=
 =?utf-8?B?U2t6a2JEdzZldk4xVTMwRWhMYjkzekpCbmlyYVNGeWFnVXdidkU0SkdHNlpB?=
 =?utf-8?B?NEtNWVEyQVBnZ0VseTR0Z1hJQ1d0aXZjOHpPNWJIdk9ZcVVPMTV4QkxlQVVs?=
 =?utf-8?B?UnpaMWY5THE5NEl0TDhxVGlUY1dUai9XR3J4bHN6dCtQdEFxbGQ4am5vVXlC?=
 =?utf-8?B?RVM5RHg2d20wK1hhaWlzNWJ2clZwNDFvQWY3ejV6Q1pwUzJYbTJJSlMwQkxF?=
 =?utf-8?Q?iFmMuO?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 03:07:53.8943 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8732362c-b0b3-428a-cf40-08dd82dd34b2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7105
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

[Why]
There is no handling for I2C-read-over-AUX when receive reply of
I2C_ACK|AUX_ACK followed by the total number of data bytes Fewer
than LEN + 1

[How]
Refer to DP v2.1: 2.11.7.1.6.3 & 2.11.7.1.6.4, repeat the identical
I2C-read-over-AUX transaction with the updated LEN value equal to
the original LEN value minus the total number of data bytes received
so far.

Fixes: 68ec2a2a2481 ("drm/dp: Use I2C_WRITE_STATUS_UPDATE to drain partial I2C_WRITE requests")
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: stable@vger.kernel.org
Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 28f0708c3b27..938214a980a9 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -1812,10 +1812,11 @@ static int drm_dp_i2c_do_msg(struct drm_dp_aux *aux, struct drm_dp_aux_msg *msg)
 				drm_dbg_kms(aux->drm_dev,
 					    "%s: I2C partially ack (result=%d, size=%zu)\n",
 					    aux->name, ret, msg->size);
-				if (!(msg->request & DP_AUX_I2C_READ)) {
-					usleep_range(AUX_RETRY_INTERVAL, AUX_RETRY_INTERVAL + 100);
+				usleep_range(AUX_RETRY_INTERVAL, AUX_RETRY_INTERVAL + 100);
+				if (msg->request & DP_AUX_I2C_READ)
+					msg->size -= ret;
+				else
 					drm_dp_i2c_msg_write_status_update(msg);
-				}
 
 				continue;
 			}
-- 
2.43.0

