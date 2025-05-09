Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6CF5AB0ECB
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 11:22:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52AC710E9E4;
	Fri,  9 May 2025 09:22:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="rX/oC+DX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060.outbound.protection.outlook.com [40.107.243.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3669A10E9E4
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 09:22:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YeYHVWkPAV+4/pPBOMG8pos82S6cX/Sinlh20TNfV9Dqwo9nsvTu1mj1L6YIikk0sYzPcNP8jtdO4WR3hWy1CwbJbB5OQjNxHhTW5FrAqZE3hhxZ7GChD+5P44bmS6mz+DdwkJdxyKwSNh4jNa8obYgz9EqAnSwmph6mkS282TKaItQVsPvTyCdOkIhQPNQQi0EadhM60G5xmZklHDdF6BrdjCrnaLRflZy/ij6ohnnMBtRd/wSofskxrnC8e6csIdgqEMmh7ia00j17rRhooWRcdcjsPB8GUcI4tNceymukoG6IZ4kSRJoTmxG4GQAjsPcdQD/q45l5qq7YGxX0GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wGkKGF80OUGsO4c8VC7wNh9nxFRGJIl6sVDaL1nnDgw=;
 b=bc8aaUMgOL1fVqZkc7IeuSAYgv1NtxTLHrrYQFGwCAmPJucZOFY9nVHNSy8U8w12sBg6ad/5jvHYlJAVRuOTcxF1HjdJR4JgYknBU8pln9UBIGHQoqTc/ijscLU7FgbNujdNxRqfPT/rX6OuGuGk1F3P79E5WRXnyg4ZKRXtBi3UkT3cfdn2qZ43zPvDUKcRTxDoewZv+UivaSG6c39XymFLbOLO6sn+lgeHkVyvJBih/OlTrG4i4hHbkmzuncwEc+txCtZI9XEUMuBMHvijKztBmACoeZYdqB0pxSxjDm2cXbhEblkFyH0lC0roxJOFgKjSdGYphIKYIwQZcuueqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wGkKGF80OUGsO4c8VC7wNh9nxFRGJIl6sVDaL1nnDgw=;
 b=rX/oC+DXI6PfbwQJXC57e/HOueUq2rEnl9ogcsIh4s7XamDSJ8Zc7iE5kTfvQuDDyPwm2zl5QRBN6wPi2P234L+ztINoH9bRyXdXpVihkiiONOIHuCiuFrP8ILfFEk7AsYvQPly3dpXUO/2u8RBa+1IF8qVq5Oag9b53mNa+rs4=
Received: from CH0PR13CA0024.namprd13.prod.outlook.com (2603:10b6:610:b1::29)
 by MW4PR12MB6876.namprd12.prod.outlook.com (2603:10b6:303:208::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Fri, 9 May
 2025 09:22:29 +0000
Received: from CH1PEPF0000AD75.namprd04.prod.outlook.com
 (2603:10b6:610:b1:cafe::67) by CH0PR13CA0024.outlook.office365.com
 (2603:10b6:610:b1::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.20 via Frontend Transport; Fri,
 9 May 2025 09:22:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD75.mail.protection.outlook.com (10.167.244.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Fri, 9 May 2025 09:22:28 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 9 May
 2025 04:22:28 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 9 May 2025 04:22:25 -0500
From: Wayne Lin <Wayne.Lin@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: <ville.syrjala@linux.intel.com>, <jani.nikula@intel.com>,
 <mario.limonciello@amd.com>, <harry.wentland@amd.com>, Wayne Lin
 <Wayne.Lin@amd.com>, <stable@vger.kernel.org>
Subject: [PATCH v2] drm/dp: Fix Write_Status_Update_Request AUX request format
Date: Fri, 9 May 2025 17:22:18 +0800
Message-ID: <20250509092218.805771-1-Wayne.Lin@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: Wayne.Lin@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD75:EE_|MW4PR12MB6876:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f655071-0815-4046-26f2-08dd8edb04e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dno2aXF3ekh5TTROYWlHU3lGU3hObGtZRzVqYUJCaDZrMURGOVAzbnpYdHBl?=
 =?utf-8?B?aS9jcUFmL2s0eEs4L01qUGx5SGFHMnJLckloc2huZjVlS3hIUjFSbUlhT3M3?=
 =?utf-8?B?Qi9mS3Nrd1NnUW1HdmVKdDYxVEFSQ3lwODJWSkdHWXMxWlRuL056VStxQW9h?=
 =?utf-8?B?cGppZFkrOTlvWGhlaUlDTHBtTFNSaXd6N09MK1BkQTN3MzIyRGlyQmZiaWRn?=
 =?utf-8?B?RVdQTFdCTTlzV0MzY3BMdWlWdDJvTFZEaElyRzI4c2R1ZC9MbGkvcm1OYXRh?=
 =?utf-8?B?akdLWlhUTU0yY1d1eTdZS0Z5QTMvMkcwM2U0R2FkLzhyREUzZ0ZybDJ5amdX?=
 =?utf-8?B?L3F1LzI2d1NaK0ZqV3gzQ0FtQXF5MC9wb1gzNTFUbGpPaGVBME5YeUdRaG1Z?=
 =?utf-8?B?Ump6c1ByQ1RlN2hlUDFrRnFOR3NmMk9SNlV6OGw1QVlld0FEL1plYXBNbEJp?=
 =?utf-8?B?dGpzWjMzdDYvZjFKU0ZBd0VETUhMTXJjdkhrWHZaUXh0a1JQcVdSZFpOcUI2?=
 =?utf-8?B?N3lUOW9VbFFueEdCdm13QWl5dCtqYXc5eVdxMmZQTDEyeXI3SWdKQlJRbmRt?=
 =?utf-8?B?Tmo5UEpRa2FMelc0SjNxMGI4bzk5UzBzNG5OcVZyZzJoUDhRa1lVZkgvM1kz?=
 =?utf-8?B?Z1ZTV1NhREpRY3hFUXpUelZBeDlzTFFtMGZFV0laQWpSWk5GQy84SnJMV2wx?=
 =?utf-8?B?eDBFeEMvd1BZeFJNVTREUHkzNXFvZDhuQlJDVW5sdmtDZmdMbmU3aGZlYXJl?=
 =?utf-8?B?bllZd1JUcTI3REVudlNNV3BwT25YeGQ4eG1Eb0pwd3R1YmQ1ZlJkUTZucVFJ?=
 =?utf-8?B?RDdtSjhOVGZSYnFrWEVvNDBSS3VvNUJLU1VKTjJxOEVUSGNoVGRPcmt0djdE?=
 =?utf-8?B?dElHY2tscGpiYmZGRjUycTlma0VhM1VPMnhNbFI2Zy9zSVcyTEZheWhKZ3pV?=
 =?utf-8?B?azhXdzJOSUF4L1d0eFF4b0lDUmsrb3dnT1F2Ulp1Z0dxWmRuLy95Vm1wZStT?=
 =?utf-8?B?OUZHOVdvYysyaDJLRi80S3RidzZjUzRDeFFIWDJWdUg2bVJsWEVXUGJZRldC?=
 =?utf-8?B?TUJGYzE4OHI1WFpGYXByNkR5dnZ2QU04MEF5cXZNUnhPTjJKZGNwNTBzaTB1?=
 =?utf-8?B?NVpGaWRXQU0vSG1oMVF0TjdrVWJQcWtRSDh2OWZFWUk5cjdvR0laNFhmZGdw?=
 =?utf-8?B?SjJhNHpFMklaY0pIOFA0b2lXN096VTZ4WFpxdmdNVEtURFRCT0Jwd3ppZ1lH?=
 =?utf-8?B?SUlKWGs2eGZxOXBMNzBYL1lmWG4rZmRobXJHSEZBOGZ4VHY4U0UrT0sweFRP?=
 =?utf-8?B?YTNNbEc5Zmx0SHJnc3ppMWR3V2Jud3h6b1RDNXphQ0tkblNaZ3VNTVpxcnJT?=
 =?utf-8?B?aExjVlQyNzFjTk5JWEg5NGpLY2RTQzFuc1J3dHFKSzdUSjhRazRkUHdpZlFJ?=
 =?utf-8?B?ZmVMYndJU3FSZ0V3anRRMzhmL2pRRThPVjNqNFBUR0NqZHNHMm1yM21TVUdF?=
 =?utf-8?B?a1ZpMlUwNlkxK0NrVEtkZ3ZHRkVGNnU1NzhtTUhURk5RNXZDRHJyKzhyTlpw?=
 =?utf-8?B?R1ZlRGI4MUJZeU94TXRpWndQcWhhQjdyWWdDRUZVN3BoZ29qc3FUcytaT1pB?=
 =?utf-8?B?M2ZmSlEvQnNsazBUMmlpU3A1V1UwaEFMSmg3a01wczJuWnEzUmdob1Q5Snlq?=
 =?utf-8?B?RTB0TFd5eXVvY0lxYW0zcmNhSERnMHovK1lYRDZQWTlneDJ5d2hkY3Nod2VB?=
 =?utf-8?B?UDg3NVdrWlRNZFk4aWJYY1NUREdOdzJWN0llNWdCdXgwdWZmQy9PcjZhQTlo?=
 =?utf-8?B?ZFp4aThXcnBXRG02akc0cW03Q1EwNkNoNHJ2RWk1RUZlb01VdGIwZzgxaVV1?=
 =?utf-8?B?bzh4ZGN4NUlSbVo2QXdUa2JSU2lYclg4b2RRSmcvWFRNUUlLcUZqZnNtdU9u?=
 =?utf-8?B?Nk9DSFhHUy9vVk4rZmtwU3VPQWFjblduZlhWSUYvVUpXTkZLYVJOVi9zaFpm?=
 =?utf-8?B?ZmtlaUp2c1I4TWV2ekp1Y0Q3K3FQU2FEUEZNcGtQdzRrKy96MlZnd3hmMjZU?=
 =?utf-8?Q?2K0olW?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 09:22:28.7039 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f655071-0815-4046-26f2-08dd8edb04e5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD75.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6876
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

V2:
- Add checking condition before restoring msg->buffer and
  msg->size. (Limonciello Mario)
- Revise unclear comment to appropriately describe the idea.
  (Jani Nikula)

Fixes: 68ec2a2a2481 ("drm/dp: Use I2C_WRITE_STATUS_UPDATE to drain partial I2C_WRITE requests")
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: stable@vger.kernel.org
Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 54 +++++++++++++++++++++----
 1 file changed, 47 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 57828f2b7b5a..c71a1395a2d6 100644
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
@@ -2027,24 +2041,41 @@ static int drm_dp_i2c_do_msg(struct drm_dp_aux *aux, struct drm_dp_aux_msg *msg)
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
+			 * When DPTx sets Write_Status_Update_Request flag to
+			 * ask DPRx for the write status, the AUX reply from
+			 * DPRx will be I2C_ACK|AUX_ACK if I2C write request
+			 * completes successfully. Such AUX transaction is for
+			 * status checking only, so no new data is written by
+			 * aux->transfer(). In this case, here we have to
+			 * report all original data get written. Otherwise,
+			 * drm_dp_i2c_drain_msg() takes returned value 0 as
+			 * an error.
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
@@ -2063,12 +2094,21 @@ static int drm_dp_i2c_do_msg(struct drm_dp_aux *aux, struct drm_dp_aux_msg *msg)
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
+	/* In case we change original msg by Write_Status_Update case*/
+	if (drm_dp_i2c_msg_is_write_status_update(msg)) {
+		msg->buffer = orig_msg.buffer;
+		msg->size = orig_msg.size;
+	}
+
+	return ret;
 }
 
 static void drm_dp_i2c_msg_set_request(struct drm_dp_aux_msg *msg,
-- 
2.43.0

