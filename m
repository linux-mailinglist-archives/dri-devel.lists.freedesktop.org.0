Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55003A9E243
	for <lists+dri-devel@lfdr.de>; Sun, 27 Apr 2025 11:51:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C10710E187;
	Sun, 27 Apr 2025 09:51:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="PTfScoCH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2053.outbound.protection.outlook.com [40.107.243.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3999210E187
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Apr 2025 09:51:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=USCUlwN4DCFqNOVnbSfvsn2Bhyl5ky/dBdSb7uyT3E4UM/a0AHOFzSJttVzgEqcR6/BS0s+hxck0mhmh4qJEhQ66OFkX3QqpXyyuQh4H7nLKpJJKUG69Hj9ZWvnsCPOdaYUc6DksgHJdak/O0sKjkYKQg0eT6QEeRfxCH+e+uusbVZP9gQVmnDutgahdu1EO8yHDwBQwCIYLYo9VtSUoQOn8Vv5Z2qRCOewlsw1viRkEd6SncSZF9XAUy3U5zo9Qd093ZtQ01WZjCAjRzKagk5ambZrrgey6sQI0eXrURtiv7kUJ3m0EbiILL7winAy0x1cyUBTRU0w1lxamFN4hKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NwXr2FIn49+nDX3058nvUMFpOVHAHpG4hezhQU2khZE=;
 b=sa/uZXEuVpo9E1WZCWdrdntS7xOmKotYbbHvTUc3dAJJsFFZLtbpH71zKPHD2O6xv+2JA3qb4MZlIlK2VeBrJmQDmL8qxf/v0rgPI4WbcSCTj1R+Py+FEq+uLkJlBrD8RZ73Fe415a1nAVV/V/297v6dhmX0VzQpV3+QZAQlFjepEwpRC4Qmrfd/sYa+ZJScFeuhsfJb2/OKERrQxIMb3YtWo5eIjvo3ChmJ5AZJ5+EkhDAyXJkzxXgOAHP7SwNQFZCXH+0Z4Cx0rlzgWwaxID8s44CNCjCEgmosQJhvKefQZ+VOnoIUIqlJrlnqbcmrMayXr7JiPI60d3s9Lht0bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NwXr2FIn49+nDX3058nvUMFpOVHAHpG4hezhQU2khZE=;
 b=PTfScoCHST+3vCxzQG7L4LJyqIwNiTE6iFZADg/wTeyaPvp+Srswdkg3vDSCr7300L1lJ6QkIaD0DCfatVX1sKG+jhXyVsTMaRiwt0+nppfyHO2iVtrnyu+ZjnmMJ/aOuTTlWFBjWoAiN3wbtfLuSHqDen0rAOQYbRseOgFbG3M=
Received: from MW4PR03CA0141.namprd03.prod.outlook.com (2603:10b6:303:8c::26)
 by PH7PR12MB5712.namprd12.prod.outlook.com (2603:10b6:510:1e3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Sun, 27 Apr
 2025 09:51:06 +0000
Received: from SJ1PEPF00002316.namprd03.prod.outlook.com
 (2603:10b6:303:8c:cafe::ff) by MW4PR03CA0141.outlook.office365.com
 (2603:10b6:303:8c::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.37 via Frontend Transport; Sun,
 27 Apr 2025 09:51:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00002316.mail.protection.outlook.com (10.167.242.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Sun, 27 Apr 2025 09:51:05 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 27 Apr
 2025 04:51:05 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 27 Apr
 2025 04:51:04 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sun, 27 Apr 2025 04:51:02 -0500
From: Wayne Lin <Wayne.Lin@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: <ville.syrjala@linux.intel.com>, <jani.nikula@intel.com>,
 <mario.limonciello@amd.com>, <harry.wentland@amd.com>, Wayne Lin
 <Wayne.Lin@amd.com>, <stable@vger.kernel.org>
Subject: [PATCH] drm/dp: Fix Write_Status_Update_Request AUX request format
Date: Sun, 27 Apr 2025 17:50:53 +0800
Message-ID: <20250427095053.875064-1-Wayne.Lin@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002316:EE_|PH7PR12MB5712:EE_
X-MS-Office365-Filtering-Correlation-Id: 89034645-3225-49ed-0c46-08dd85710795
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bmhuR2g2UGUyaG5hLzY3aE5iaXQySDRZOXZVNytJVCtDZWFDNGF4S1BkVk5T?=
 =?utf-8?B?eldTT3JXRFNKRWdpaDE1TzJ3aVIydWpZeXVEb2VKUnNLcHEwZCtNUTdRQXNk?=
 =?utf-8?B?ZE5tL1BYTjVlZStFQWtKQmNYd2dlRGxkdWxSTUlZRGV2QXBNaWVBQUJ5dE1N?=
 =?utf-8?B?WjRjNGszVEQ2MnlHeEVYM2FJQTZZUjFLL2R3dG1IbWdOZzR2TzZnK2dGRklk?=
 =?utf-8?B?dnViR1hJR2ZxZUtvUlNmdUpFN0VuQXVvOUxrSjB5WVhaTGdIRFRIcUhiLzNp?=
 =?utf-8?B?RDIrdHJwL2RtaUI2aVpXQjN0ckZMTlhlK3NXdXFTRmQwejhTNldvVkVvM2Vx?=
 =?utf-8?B?K2pVdkFReWc1VFJWOFp4S1Ftdy85REM0QnJSa01KU1JLRVFsSlVKbFpGaVJX?=
 =?utf-8?B?NXZ6STVzWCsyMExnNllQblJpVE56dDZSaWtCbFYvRWVxL2MrbUl4R2R0MVNk?=
 =?utf-8?B?d1hmc08za1pqZEJCdncwZ1l4VFlTWCs1Z1lRU3kzdldleWNubjNtcTVWV2pp?=
 =?utf-8?B?RnltK3YrODZkLzVKOXo4Q3UxZk5YbjFPQlViSXFyVHdOZDFDeS84WlJ1akVK?=
 =?utf-8?B?NU0rek5OeVJnYUpHaUJwOTdUcHo2cXlxZXJDTmZubXZSU01ITDBhbjkreWZD?=
 =?utf-8?B?ZjZkTnZ0MGllc2U5N0MxSXVLdWtCNFErWjh1a1pNWnRQejc1bHlWV2ROT285?=
 =?utf-8?B?Ni9CRVdtei9uWEx2Vk45b3lTc1l0dVc2Q0tuV2VKQUI2a0lnbTVBRFpaQit3?=
 =?utf-8?B?MjVKQkFTU1QzWkJheS9yeFU3SlRuSzVSODNhRmNOMlpYaHRaTW5hRXhpcUFP?=
 =?utf-8?B?UlEvM2taQmN6MGs1Z0ZRMjI2dnE5a2ZrNkxrdFc4OVhWRS9ycHJKZDdIdEJo?=
 =?utf-8?B?L2ZiKzdQSHFJdk5xSmhlcU41c3ZQZmt1RkhFVjRVd3h5T0YrVUdWNWxPc2p0?=
 =?utf-8?B?MXNiZklHN3ZNRGl6TlJPcHRyQWFlZ1E4WVJ5c09PSXZxbjZOalo1d3cweFpI?=
 =?utf-8?B?WUk4Wkw3NzhGSkkzdThqRmtoTjBsTVZ0TlZuaVZnNXRGMVl6VEdycVYwZ09N?=
 =?utf-8?B?aytMMkV5TEFLOFBoaUtYYzRxRnB2Tkp4NUNIeDBZMnluV0poeUVlOXVqLzMz?=
 =?utf-8?B?K0hQaFFqTWlqMTE1WW4xZy81dmdXNmRJdGFzUjZtYWVyK1lUYUF1eWY1VUgz?=
 =?utf-8?B?dDZvNTlLTmNRNzNSckpPNWRyemRXenpiVFZkMmtvUFdxNzYwamxlK0xaSTJy?=
 =?utf-8?B?QldEeWpQalJaS3N3cEpjaEtyK1VFNUQ0RzlHRVAxaUNCeWtOZllCS0RPTDRU?=
 =?utf-8?B?UVk2Uk1lVzlCZzM0TFhZRUM1azZRTmVuRFllbWs0U3NaZlplQ2haR3paL2NE?=
 =?utf-8?B?d1htNWlDRjlQS2VsaVJQTXVCRzlmdTVmcGVabS9aWGIwdmRZUC9UeGFKZjdX?=
 =?utf-8?B?UlBUY2J4QlVPNkVCaXZHc05aWDdqR2hraGdNelpMRU1RVjB6azA4amNRczVT?=
 =?utf-8?B?U1BxM2NZSlRwd1AwdTZIcm16N3BnU25oUVlwazJHbkFKTThFWC91TDdGVy9J?=
 =?utf-8?B?Zi9jZ1FGekxuajhGSFAwK09yTTlaRFhhc2tWeFFoSGo4eFBWNnNmUEJiWHhu?=
 =?utf-8?B?MW5TdzYxUXZuaHIwTExGRGhvSjRzR3JNMldjbG5Ub0RGK3lDekI1bHFBa1Za?=
 =?utf-8?B?eFhZUDVreDBHK2F6VExPdS9WVGhwRG9PakZFZEFOcWFyTUFBVENsdUNsaUpO?=
 =?utf-8?B?emozcHo3TDFpSEdzWk4rNW8wRm5hRURFZDJQUFQwbzcrMWZFdGx4cE5mUDlW?=
 =?utf-8?B?amNTcGdKQTlucTNHenNQUW5FT0RVSVBsV2NDY3hlbFJMcXRab2NzRDBPVDZX?=
 =?utf-8?B?eWpCT0lTMWptUHprZ3dYZE01TzBITkJUVTZzV0dOZjVVMEN5N081UnFhNWFK?=
 =?utf-8?B?b1dxc2lrZlJEcHN4Tk5Md1R3MEZrbGllaHZaKzduVllJZVhhZzVUeW16MEhj?=
 =?utf-8?B?OTg0OTRUeTlDRDE0bmVtbVhRZEh0OFBIWmdYa1BFQzFSeWRJUWtzS2tKQWlU?=
 =?utf-8?Q?5AlIBv?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2025 09:51:05.9923 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89034645-3225-49ed-0c46-08dd85710795
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002316.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5712
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
Notice AUX request format of I2C-over-AUX with
Write_Status_Update_Request flag set is incorrect. It should
be address only request without length and data like:
"SYNC->COM3:0 (= 0110)|0000-> 0000|0000->
0|7-bit I2C address (the same as the last)-> STOP->".

[How]
Refer to DP v2.1 Table 2-178, correct the
Write_Status_Update_Request to be address only request.

Note that we might receive 0 returned by aux->transfer() when
receive reply I2C_ACK|AUX_ACK of Write_Status_Update_Request
transaction. Which indicating all data bytes get written.
We should avoid to return 0 bytes get transferred under this
case.

Fixes: 68ec2a2a2481 ("drm/dp: Use I2C_WRITE_STATUS_UPDATE to drain partial I2C_WRITE requests")
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: stable@vger.kernel.org
Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 45 +++++++++++++++++++++----
 1 file changed, 38 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 57828f2b7b5a..0c8cba7ed875 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -1857,6 +1857,12 @@ static u32 drm_dp_i2c_functionality(struct i2c_adapter *adapter)
 	       I2C_FUNC_10BIT_ADDR;
 }
 
+static inline bool
+drm_dp_i2c_msg_is_write_status_update(struct drm_dp_aux_msg *msg)
+{
+	return ((msg->request & ~DP_AUX_I2C_MOT) == DP_AUX_I2C_WRITE_STATUS_UPDATE);
+}
+
 static void drm_dp_i2c_msg_write_status_update(struct drm_dp_aux_msg *msg)
 {
 	/*
@@ -1965,6 +1971,7 @@ MODULE_PARM_DESC(dp_aux_i2c_speed_khz,
 static int drm_dp_i2c_do_msg(struct drm_dp_aux *aux, struct drm_dp_aux_msg *msg)
 {
 	unsigned int retry, defer_i2c;
+	struct drm_dp_aux_msg orig_msg = *msg;
 	int ret;
 	/*
 	 * DP1.2 sections 2.7.7.1.5.6.1 and 2.7.7.1.6.6.1: A DP Source device
@@ -1976,6 +1983,12 @@ static int drm_dp_i2c_do_msg(struct drm_dp_aux *aux, struct drm_dp_aux_msg *msg)
 	int max_retries = max(7, drm_dp_i2c_retry_count(msg, dp_aux_i2c_speed_khz));
 
 	for (retry = 0, defer_i2c = 0; retry < (max_retries + defer_i2c); retry++) {
+		if (drm_dp_i2c_msg_is_write_status_update(msg)) {
+			/* Address only transaction */
+			msg->buffer = NULL;
+			msg->size = 0;
+		}
+
 		ret = aux->transfer(aux, msg);
 		if (ret < 0) {
 			if (ret == -EBUSY)
@@ -1993,7 +2006,7 @@ static int drm_dp_i2c_do_msg(struct drm_dp_aux *aux, struct drm_dp_aux_msg *msg)
 			else
 				drm_dbg_kms(aux->drm_dev, "%s: transaction failed: %d\n",
 					    aux->name, ret);
-			return ret;
+			goto out;
 		}
 
 
@@ -2008,7 +2021,8 @@ static int drm_dp_i2c_do_msg(struct drm_dp_aux *aux, struct drm_dp_aux_msg *msg)
 		case DP_AUX_NATIVE_REPLY_NACK:
 			drm_dbg_kms(aux->drm_dev, "%s: native nack (result=%d, size=%zu)\n",
 				    aux->name, ret, msg->size);
-			return -EREMOTEIO;
+			ret = -EREMOTEIO;
+			goto out;
 
 		case DP_AUX_NATIVE_REPLY_DEFER:
 			drm_dbg_kms(aux->drm_dev, "%s: native defer\n", aux->name);
@@ -2027,24 +2041,35 @@ static int drm_dp_i2c_do_msg(struct drm_dp_aux *aux, struct drm_dp_aux_msg *msg)
 		default:
 			drm_err(aux->drm_dev, "%s: invalid native reply %#04x\n",
 				aux->name, msg->reply);
-			return -EREMOTEIO;
+			ret = -EREMOTEIO;
+			goto out;
 		}
 
 		switch (msg->reply & DP_AUX_I2C_REPLY_MASK) {
 		case DP_AUX_I2C_REPLY_ACK:
+			/*
+			 * When I2C write firstly get defer and get ack after
+			 * retries by wirte_status_update, we have to return
+			 * all data bytes get transferred instead of 0.
+			 */
+			if (drm_dp_i2c_msg_is_write_status_update(msg) && ret == 0)
+				ret = orig_msg.size;
+
 			/*
 			 * Both native ACK and I2C ACK replies received. We
 			 * can assume the transfer was successful.
 			 */
 			if (ret != msg->size)
 				drm_dp_i2c_msg_write_status_update(msg);
-			return ret;
+
+			goto out;
 
 		case DP_AUX_I2C_REPLY_NACK:
 			drm_dbg_kms(aux->drm_dev, "%s: I2C nack (result=%d, size=%zu)\n",
 				    aux->name, ret, msg->size);
 			aux->i2c_nack_count++;
-			return -EREMOTEIO;
+			ret = -EREMOTEIO;
+			goto out;
 
 		case DP_AUX_I2C_REPLY_DEFER:
 			drm_dbg_kms(aux->drm_dev, "%s: I2C defer\n", aux->name);
@@ -2063,12 +2088,18 @@ static int drm_dp_i2c_do_msg(struct drm_dp_aux *aux, struct drm_dp_aux_msg *msg)
 		default:
 			drm_err(aux->drm_dev, "%s: invalid I2C reply %#04x\n",
 				aux->name, msg->reply);
-			return -EREMOTEIO;
+			ret = -EREMOTEIO;
+			goto out;
 		}
 	}
 
 	drm_dbg_kms(aux->drm_dev, "%s: Too many retries, giving up\n", aux->name);
-	return -EREMOTEIO;
+	ret = -EREMOTEIO;
+out:
+	/* In case we change original msg by Write_Status_Update*/
+	msg->buffer = orig_msg.buffer;
+	msg->size = orig_msg.size;
+	return ret;
 }
 
 static void drm_dp_i2c_msg_set_request(struct drm_dp_aux_msg *msg,
-- 
2.43.0

