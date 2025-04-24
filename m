Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CD8A99F46
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 05:08:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87E6310E718;
	Thu, 24 Apr 2025 03:08:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4BcyLo5i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2076.outbound.protection.outlook.com [40.107.236.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A67210E716
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 03:07:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O+ueXqDATfg+AAiuqJ+0JE+G8qCqWcbN4+vir9W+JIPtiV3xG3Z9LkrPTBaZ1irEdE4fR4RyeZk1LFjakv5UTAbvAArt2b5yI4AmAnizI4p7YdwSVbkX+5aG1FU8YvL2Yv/cXzPo4fA4z12WcZ6+mfoejKQZ+wJbfzTsYfAMvygR20Sw1ykykJAZaby9CJTQvaATgYVgMRK9bCPCRjEqR8Ul1oZWuNwo9ekZyOJ852IxWin7DEo3BqMSVfVtNTspb3Q5GB0s/+DPmz6TJm3GIFRuA0nABuSk+p8gjf713PY3/tytY27W0CvNCifJIuAm73aCMH1mEzIDaI5lbfvXdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YujiokCRQZ0FHQongaKBGAFOEOKk5XnyanmZqHzYGqI=;
 b=M1XLTSayap928lkhiIcHl/Vzuyfvv4gIO27NjiDPVx0Ul38js1r6Z7P4sUlKsxPvit5+MCJP3Oer/rTzNh5ALgcL4MbTbDIXr3xMn9Zau6oP8CE+OIxuTeHfDQN3WAfQM3/aavbhSbRlWF2jT9iI9/iFuZ6r0ro9Zz6RJQvl+w2b04K0/vSb3qBuCDEnWt0C2KfBiV/nG777XMHzTdbfeiKenxYwS97qZkJkV9Kav2ZiAkeJvydM6crCIWnoQOQFWsbUcllbFyfAo9nFTTcAdwsU7jz0VOnwpmkeNCHTSSYa0WKw16+WxvXLueYeepIP7CpOZSNO/kPRTO/uAnvHRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YujiokCRQZ0FHQongaKBGAFOEOKk5XnyanmZqHzYGqI=;
 b=4BcyLo5iZ3FiTWI2O/WhVaL8DGAybzLeHO0V8+NCh1i2X4r4Vm1kQeb4cV3iB2Xexc+sAB/wn3n/ViZQ2W1/7zggxb82CVD0yeFweexdnFcTrr8FSs9hwxswiOEZQFuppSA/5c2Y2jX9Pampemg6NEy2gq8M7xj5VakqMZr42VI=
Received: from CH2PR03CA0024.namprd03.prod.outlook.com (2603:10b6:610:59::34)
 by CY3PR12MB9607.namprd12.prod.outlook.com (2603:10b6:930:103::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Thu, 24 Apr
 2025 03:07:51 +0000
Received: from CH2PEPF00000142.namprd02.prod.outlook.com
 (2603:10b6:610:59:cafe::67) by CH2PR03CA0024.outlook.office365.com
 (2603:10b6:610:59::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Thu,
 24 Apr 2025 03:07:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF00000142.mail.protection.outlook.com (10.167.244.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Thu, 24 Apr 2025 03:07:51 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Apr
 2025 22:07:50 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 23 Apr 2025 22:07:47 -0500
From: Wayne Lin <Wayne.Lin@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: <ville.syrjala@linux.intel.com>, <jani.nikula@intel.com>,
 <mario.limonciello@amd.com>, <harry.wentland@amd.com>, Wayne Lin
 <Wayne.Lin@amd.com>, <stable@vger.kernel.org>
Subject: [PATCH 1/2] drm/dp: Correct Write_Status_Update_Request handling
Date: Thu, 24 Apr 2025 11:07:33 +0800
Message-ID: <20250424030734.873693-2-Wayne.Lin@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000142:EE_|CY3PR12MB9607:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e6e3784-4b6b-42d0-c4f1-08dd82dd32f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Yk1BdkZpODI2RUhabFNHckZJZnNRMVRjLzBNdWVUWWk0UVNtTGVPWEVCSldV?=
 =?utf-8?B?RWh4VE1naUtQdGZ5OHBvRHgxTTJoc0d5bEpyU2xMUGU4L3k5TTQyODg3ells?=
 =?utf-8?B?NnVJRXkraXlqTkgxN1o4Uk5zM1RLSWtGMGgrb3ZOY3UwYkVlN2F6WXQzKy9P?=
 =?utf-8?B?SWlvdDdvZ0s2Vy9jM2VsSW9nUXBKM296TXl6TG9ncEhJVy9kcnRQcXZEd3d2?=
 =?utf-8?B?dVc5d3FxUGw1bE5WM25BMGV4T0E1MWE2MHR1UGVWdlVlaDEvSXFZMCsyN1Bt?=
 =?utf-8?B?Ym9sSjNGQVE0OUU4djZ3MEpZN0pKa1B2UEh3NjVPdTEwcnZ0c0RzWkJOUUM2?=
 =?utf-8?B?ZlJEZ3E3L0VJQWhTb0l0ajVTNThFTUZXQ2Rjb1BOZlZ4YUs2UUp6cUExYlI0?=
 =?utf-8?B?Mk15VDhiZlJsVnBSbHEvbTBYc2xyMDNVaU1sUWpQU0xUc2JIRE8zM3BzOXpq?=
 =?utf-8?B?Z2JtYzM1b0NKeWR6bEsvSGNWMDdRVEdGZ0Z1NThFLzJTMXYvdURhbGdqU0Vk?=
 =?utf-8?B?VHllNlQwUUx2WlcrelRqVXZlOU5YS3h6b1A3OHlOblRwN3NnSjNON09tVXpj?=
 =?utf-8?B?eEhaaVBlMHlrUXhFNHJoU2lVYXEvMkVNb1lMN3hYVVVKZlBIVzgvTjI0VVB0?=
 =?utf-8?B?RG11OE02WEhxOGx3V2VJVmtOaW9md1dOSk9yRlp4K1BhK0dVcFZINGxkaXpu?=
 =?utf-8?B?eGZRNjFNUXJsU09kSnRKVXFxQjNyQ0ZYSUdBN1B6Z2hFUzdNbURPNFJYK2R5?=
 =?utf-8?B?RXVpKzQ5dFlQSitRdUhydzcreWJHRTFvMGhHK3R2dXNVYzRQM3k0aENhblhX?=
 =?utf-8?B?ZlhnOXhIOHR1QzJ2bTlwbzZZOG9PU2NNZ0pQMUE5cmRGZWhaSnh2eVh1VzNr?=
 =?utf-8?B?QWxYOHg0QWNGbFcvN0hJWWRCc0RDUmNDcjZoVUIrZ21aMVBlNEVqQjdSVFd4?=
 =?utf-8?B?QXR3MnpYTVhlTzJ6VGFHWDduQ3A2SUZlSUJVZDRNRDFaV2wwRmN2Tm1SNGZz?=
 =?utf-8?B?NkZMSnJRUFM4R1dDMFZkOExldUo1UGRFRTNFaTFBWkJySVBGVi8zOUdJTjZ4?=
 =?utf-8?B?U29hQ1Z4eE1JdlI0ZnhWakFRa08yV3g3cm84T2I5b245TFNKd2xycTRwSy9W?=
 =?utf-8?B?ckhiUlkwYzBBNk80SGQvL3Fiemx1dFBPOFlyWldPKzdqelU3aUd4V040NTFv?=
 =?utf-8?B?TUNySFhISDlyNFpWYmdyMXdubDRpWWY3bkQwTDZ0ZjlKQW5aMjdJbUJNNEht?=
 =?utf-8?B?cktLbVQzY1dHTDNrbVVvYmdxNktIU2l4RW1Cd251QTlkbVQ1eTRjamhCTUw4?=
 =?utf-8?B?VnA2bUQvZG1jNHJnT3ovUEVjbHM0dFdISFdNemVnUUkrSTVTelJDOWdiY2J2?=
 =?utf-8?B?OHR3blFqSFoyS0pnUGY5RGVZMGlLSXBTa0tvSkk2M0JBYzlibEorTnZaL2l4?=
 =?utf-8?B?QXVtcFNqR1hKNU1UOWphRVFaN1lTWWJYYWtGZHhEZm9QSVhTT1BxRlpQNGJx?=
 =?utf-8?B?d2hDcnZnNUJzUU9MVUxUelN3dG53Y2dmNU9KSFowenJ3elhUR0xWcGdIanJx?=
 =?utf-8?B?aCtzWXFaQ0w3WmI0OVBGazVmK0V5Ri9NcFU4a2hLd0tWSG51Zm9wK1hsdGpn?=
 =?utf-8?B?K3BUNG1yQU1odXNtWkNGdzJVNEVpSVU5TU8rZzJQUHU1KzJTcTlraG1HUG96?=
 =?utf-8?B?VU10TitHbVc1R2tMSzNYKzEwUTZxaDlxN256c0ovekNNNFUrVVF0L3FmaytS?=
 =?utf-8?B?QVlJcUhUSDZ3QklobmEvRlhWWVhtcG12TnYrWHRqaytlUmFMSzJZYVRGRXJv?=
 =?utf-8?B?dTR2SWdSc3J3VUNXMm5TUnlJdmNNR0owbWNJeDlSQVU1dTFxS3hrZTdYcGJ6?=
 =?utf-8?B?bFNQbGFWQmJaM3l5TzJDUFhST09jNWhLbDVaWXZMN2l1eFdVSVhMcExEL0pY?=
 =?utf-8?B?OFFLdnFuL1NoTlZpRlFiaWxtNHFpTXkrcW9EcTBJUzdHWlQ0MWxRRk9Qd2R3?=
 =?utf-8?B?OUZ3VnlJRjltcXU4WUhqY2RsOVE0Lzc3a1UzQkcxdDZ1Q3I5alhnekFNMjdu?=
 =?utf-8?Q?ml1F2u?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 03:07:51.0198 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e6e3784-4b6b-42d0-c4f1-08dd82dd32f5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000142.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9607
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
Notice few problems under I2C-write-over-Aux with
Write_Status_Update_Request flag set cases:

- I2C-write-over-Aux request with
  Write_Status_Update_Request flag set won't get sent
  upon the reply of I2C_ACK|AUX_ACK followed by “M”
  Value. Now just set the flag but won't send out

- The I2C-over-Aux request command with
  Write_Status_Update_Request flag set is incorrect.
  Should be "SYNC->COM3:0 (= 0110)|0000-> 0000|0000->
  0|7-bit I2C address (the same as the last)-> STOP->".
  Address only transaction without length and data.

- Upon I2C_DEFER|AUX_ACK Reply for I2C-read-over-Aux,
  soure should repeat the identical I2C-read-over-AUX
  transaction with the same LEN value. Not with
  Write_Status_Update_Request set.

[How]
Refer to DP v2.1: 2.11.7.1.5.3 & 2.11.7.1.5.4
- Clean aux msg buffer and size when constructing
  write status update request.

- Send out Write_Status_Update_Request upon reply of
  I2C_ACK|AUX_ACK followed by “M”

- Send Write_Status_Update_Request upon I2C_DEFER|AUX_ACK
  reply only when the request is I2C-write-over-Aux.

Fixes: 68ec2a2a2481 ("drm/dp: Use I2C_WRITE_STATUS_UPDATE to drain partial I2C_WRITE requests")
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: stable@vger.kernel.org
Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 27 +++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 6ee51003de3c..28f0708c3b27 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -1631,6 +1631,12 @@ static void drm_dp_i2c_msg_write_status_update(struct drm_dp_aux_msg *msg)
 		msg->request &= DP_AUX_I2C_MOT;
 		msg->request |= DP_AUX_I2C_WRITE_STATUS_UPDATE;
 	}
+
+	/*
+	 * Address only transaction
+	 */
+	msg->buffer = NULL;
+	msg->size = 0;
 }
 
 #define AUX_PRECHARGE_LEN 10 /* 10 to 16 */
@@ -1797,10 +1803,22 @@ static int drm_dp_i2c_do_msg(struct drm_dp_aux *aux, struct drm_dp_aux_msg *msg)
 		case DP_AUX_I2C_REPLY_ACK:
 			/*
 			 * Both native ACK and I2C ACK replies received. We
-			 * can assume the transfer was successful.
+			 * can't assume the transfer was completed. Both I2C
+			 * WRITE/READ request may get I2C ack reply with partially
+			 * completion. We have to continue to poll for the
+			 * completion of the request.
 			 */
-			if (ret != msg->size)
-				drm_dp_i2c_msg_write_status_update(msg);
+			if (ret != msg->size) {
+				drm_dbg_kms(aux->drm_dev,
+					    "%s: I2C partially ack (result=%d, size=%zu)\n",
+					    aux->name, ret, msg->size);
+				if (!(msg->request & DP_AUX_I2C_READ)) {
+					usleep_range(AUX_RETRY_INTERVAL, AUX_RETRY_INTERVAL + 100);
+					drm_dp_i2c_msg_write_status_update(msg);
+				}
+
+				continue;
+			}
 			return ret;
 
 		case DP_AUX_I2C_REPLY_NACK:
@@ -1819,7 +1837,8 @@ static int drm_dp_i2c_do_msg(struct drm_dp_aux *aux, struct drm_dp_aux_msg *msg)
 			if (defer_i2c < 7)
 				defer_i2c++;
 			usleep_range(AUX_RETRY_INTERVAL, AUX_RETRY_INTERVAL + 100);
-			drm_dp_i2c_msg_write_status_update(msg);
+			if (!(msg->request & DP_AUX_I2C_READ))
+				drm_dp_i2c_msg_write_status_update(msg);
 
 			continue;
 
-- 
2.43.0

