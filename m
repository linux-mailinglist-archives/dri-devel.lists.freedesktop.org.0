Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94641B39249
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 05:39:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A2EF10E18D;
	Thu, 28 Aug 2025 03:39:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="bb1xV8XF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYPPR03CU001.outbound.protection.outlook.com
 (mail-japaneastazon11012008.outbound.protection.outlook.com [52.101.126.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 081C510E18D
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 03:39:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ecGGSWX/S8TkF/AspgZi7NsR1intQshnohqHpP+jFJ4q2tlnJlFyVYwamCO7Zb5sK/arWRdBK1T8QpAQrfPVLo8eNTDCwa5YH26Q/G2abi86aML6N81DBvJ50uvpx4bSuzmB4SJOKa/XPil9fl6Wg3cwtxWqYktyTmp1IZ8H9RTxisRqPUW3ec8nAX8f8GCohG3OlWVSQN1ih20lyregYdBQpUCeeF3SMsawLZgA7Si//ady5GY3vD8rYk2xFt+WQXCNVR7GCI6OTbs0PQkWVnyClVbs0j9lWWCcboWw9mJeuGsda3AWzMg8JLMrSsJSiCRgSngXHZZRSwkwtnf6zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nQbjHG8E0/lXWpEwdDfSN/dvod75YOFpJ8VorEt+wH0=;
 b=JZ/jxrd8BuSw/TCJb8eNRnxHe/2NnyqWm7JIC2Uo4BRwB1T90zGh64PT2bonQn/jMyqwNtkf3AFmxbcfJCMdcbZad7AASD+yj6zncYfm/0iuu4pgJEaF8sJ5JJDKxqoqpSyYleHOb6jNY7rFYjpJOxOzH9e4wSGmPM3GvbdQlMmom2BpHGU5DXMjrQIBj6e33J2WkKXkb7RUOP750wgAWPUzQXQdOwVzMAMUAcXw7ta/pR0yLLFn67A57LvyTBv05siUsrLEnmCI6YqUr9qoHhEly6eCVf8LXUN1tCQdqpf1Ve7nUqznpEdTqevgU/HVBBwRtEIy2z6a1+ke3pzw6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nQbjHG8E0/lXWpEwdDfSN/dvod75YOFpJ8VorEt+wH0=;
 b=bb1xV8XFa6C+I7UxF9PayKV9zHWf8kqthViGA2WZHeLI8ZrK52tB7qLmhjlBn3hkzSFjzRbSECkQeNhCenN0DhCmMNMdOTe12Iu32jv3zWr/cBPucfHGEl80nVHVW9tR2dPwzOkgfOh75m4QiprVjFKh5dn3rxSsPKKqL+GaJ5zm5HSfhw1XsYJCuaG3QR0f4Pjo6ZQUMWnEsWqC8W7CfcxCqapA79w8sH09RL8a119eVoKRQABWXeWGAF2hgJlEqY18fq9KSRxmKEKv0OaW56inuF6iIp8PzIrOYm8rKBavRriOqmjX/o+2dREqZvrlDT3vJ19zZVzm3jmTELM8BQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 TYZPR06MB6467.apcprd06.prod.outlook.com (2603:1096:400:464::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.20; Thu, 28 Aug 2025 03:39:46 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%5]) with mapi id 15.20.9073.010; Thu, 28 Aug 2025
 03:39:46 +0000
From: Qianfeng Rong <rongqianfeng@vivo.com>
To: Min Ma <min.ma@amd.com>, Lizhi Hou <lizhi.hou@amd.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Qianfeng Rong <rongqianfeng@vivo.com>
Subject: [PATCH v2] accel/amdxdna: Use int instead of u32 to store error codes
Date: Thu, 28 Aug 2025 11:39:17 +0800
Message-Id: <20250828033917.113364-1-rongqianfeng@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0350.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::16) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|TYZPR06MB6467:EE_
X-MS-Office365-Filtering-Correlation-Id: cf3a9a43-86e9-4b70-75f8-08dde5e4888c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|366016|1800799024|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tMLRe9Xroq6jd3GWpfsVnytterXBsAnHohi4pxmiMk2O1XO5ClADluW/rgOl?=
 =?us-ascii?Q?j9AZNAChuuRFxPoW03QOUTfnZ6B3CwNve/jmfY6RIl/mzJbDSiUrvXIi6LXe?=
 =?us-ascii?Q?3hn2phDcqlzvlEnnGWKc1Ih+cC2RcIXzO5bowMVKvSD4Aque87XahsApXsiB?=
 =?us-ascii?Q?XSJxbkbw7dGTwio1My7LfOgg7mir5mR7D+HxpbZzhj3BblMwWXaDBwz+u1qz?=
 =?us-ascii?Q?0oJ09C9y62QyU9tt5dr0ws1gcYNCrw+MDd1gK+LVimmMsFLCZ+PXj5IYJaz5?=
 =?us-ascii?Q?k3VlQIB3hRPKsL9fmcLztW7Cmb45ROHWeb4mlQZv52pebXMLi/0B8drY/NpD?=
 =?us-ascii?Q?gLD4eg8IxXSHp6MePUwKydyPCMOGGhb38N6PylVmubeeUxj9/P5M1XBpQ6+/?=
 =?us-ascii?Q?vWzlcYov5p/hNdbY4pGA05UuwQi9Tx1A8MRLYqGYR+EyA1O5l75McBs0cS43?=
 =?us-ascii?Q?kwbVzs/FOiR8GOlP/HDqAR0VWVtTwvr70pMjE4EYUGu99RAqrGSjumBKTeCp?=
 =?us-ascii?Q?iZKmAE+yx06CT8Lp5n2v3pqS1cNp+kQtWOflfUq8rxQvV/YKkkOte3n4GsRv?=
 =?us-ascii?Q?1pa4bwtsKti1VCd22AiSRbFppyUcVt11iLd3aXLIWG9CGkUCcObfsivb3X5g?=
 =?us-ascii?Q?IdNJZrxADhmdqqQr0bECkKNvXsWRJV6quO5BNp4buQN5r/BkMgjAnBVGEiDq?=
 =?us-ascii?Q?BNxwU7O3fwu3htKOxch6myOAiPsuJizTjTqFx46Tsot2xwk66f87IxmIYYsj?=
 =?us-ascii?Q?m3vTLHuG0bsrVE3GR5kPoBghtmcgIp/NM2ks0X+3uWFtzcLaXFWsfeMa7XAA?=
 =?us-ascii?Q?xsPPPmoBha3byuVLanqwbSqPzGgz0USiv0aY4Om5s/3LcFwBTHlRyxNffoUx?=
 =?us-ascii?Q?GYYpbKMRFkoQzYmAJWTJFtwniin/L3k1zCWG5rB52no2eRCpvFTG/PXxqnGY?=
 =?us-ascii?Q?tBjBRBrmh26959axKMMoJeYupJlUI7AaXzefv4NQlDh1OJ/9lj4QJEzLZMA2?=
 =?us-ascii?Q?nQjeGBmMvtwoV8VEaTmjBUNrGHDo3iNtD9mbYL6PZ1TSgAya7Li7XD5laEaz?=
 =?us-ascii?Q?8s1UBWgk/n3oTa5Aliln5p1s4vR+iy5g+5Zp0luG3OikgagRN7puNaifXEZL?=
 =?us-ascii?Q?woeJO4hv2Y6C/5VIbSMGgMmryprqbnb4wH6x2hpQsAw5njGGXxrheL0x/PzC?=
 =?us-ascii?Q?hljpA0fej3ixS9gLakIBpEHwpGZCqZ/hzQE1K07rGFsLxF/pEWD92f1cW0eR?=
 =?us-ascii?Q?DlJqtB7rijL0i0/3/yFPvX9+orgrMQbRSYGlVqFExyhblwtUpPjs98Zth6zp?=
 =?us-ascii?Q?zEJHUianu032ATy8ADgEWWKFCXJq/KLTRtzVLciuVfiqQh/rrr2TYKNFiEw3?=
 =?us-ascii?Q?Bn3LFCS9w2k06+s79O7boIkfxI3D3yuAE31gfQ7EkWY1/UOL0URQ5IB8Dtte?=
 =?us-ascii?Q?sAg8wmGTaAWgovT6A+oUUvZCbAP2GrDuwTqAzgzs4mVTn33kK4JTSA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR06MB5140.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(366016)(1800799024)(376014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lsBlqHATMYipo1vnoQyxJwIqJ/fksa19Qp65po3StQI8iox37Gvit/0ez3xW?=
 =?us-ascii?Q?58plOZJEONXRIgH4ktmBO5XSz601bnIYr2Y7qwS/JCuj066pUDXDymhoPOs8?=
 =?us-ascii?Q?AoLPRnTiyeYY7jvxX4T7eZ8rNRY8KdTfejwR2YZ01gc59OIdEragqToekJet?=
 =?us-ascii?Q?rs744hGoZQMSyfPnj5CiYZE/COC8sOh7xtsyiv8JoONZw2k04S0aDsB9blHl?=
 =?us-ascii?Q?Ou6bMQk5XeuijzLc6ypSvs4hhqcSGYV9/N//LOYq89kPzJjpOw9UzZXozScY?=
 =?us-ascii?Q?pc92WPNXUIFDrZrdNlsZMKALMqCcRFPZZ56xjeky1h+o3DHQvshjoPAN7wxJ?=
 =?us-ascii?Q?0TDviUrjiaW/AnsPspKH1n0XN9PAYIO7ed64hE3CRd+5JLkbD5rgnkIVAqZj?=
 =?us-ascii?Q?Av2xLkmMteTtmqodQetEkaQAP0b0D5XWnDVHDR6lEu8DOodHW/rMT2HI/E1z?=
 =?us-ascii?Q?HnZSORWWzQUpXKR4U+LcxVvUKDf9+govGtpTnTl06mRR73tw+P4NS6G9nxCd?=
 =?us-ascii?Q?hcYQQEWT/kG8EIud0doYwEm/3Q8B0PX1uuMBM0/nXUx0HsbNUFq96S7Odeqo?=
 =?us-ascii?Q?6s5KHNMPEUUapel7BloKQdWGrsEFq79SiNWmEwkzmAN1Sk+Zi08IDpN8xN0Q?=
 =?us-ascii?Q?+0n59aAm8dpvlkNL6WbLlSXoUzawrB3BJ9daWZQxtkNQM3WMGraMwJEe1Qxy?=
 =?us-ascii?Q?0qQw+Duf+8AWNN8jrRS4krS9M/n5bYL5jVEJSV/0nRFGkBN+F7sfvMwyQZ2q?=
 =?us-ascii?Q?Vwu1401iyJQK+dH++ucVpoHtKuQ4xM/V99Dj2uRzDDqAH2YxOlefAg2vGX9P?=
 =?us-ascii?Q?ODD3ye44sB8vxBAnZBqerOr18Tp2obSYRSJrM0Cambh5+31Y+owyAEBEqb21?=
 =?us-ascii?Q?awrK+97eAqT2TkztLtODqVOyyRah44e0jj5HVR7fRiDr3Dqz9ZRRul+Ia7cB?=
 =?us-ascii?Q?xGQgShMjWwhL3v/HE6obcOUCrn6oNZdjmDi3Xq68kULqRF36CpUPjdaKL2j4?=
 =?us-ascii?Q?HuSWm4hB6DTiiiHII0fwjKz3tyeULX1Nb7wLXQGcFmlL3JeTM6JAa6lD4v5h?=
 =?us-ascii?Q?KvOg8uQWTd9yOag3wIJYFSvo6aOEQY+Fd3ZUI7xT1dgcqOo+yBodlG6ua6Ms?=
 =?us-ascii?Q?hGhTkKKPZqyN4x05tYctRhbAS0DYLYwq4tggqMHSD2+OaBKTONbRlqiNo6W7?=
 =?us-ascii?Q?7Pjo6ExvH7DlE+nZdHVJuGaLVQDdzBq8vqXvoeU+PIz6RYlwm1PTiuYapcGa?=
 =?us-ascii?Q?qJsyiU2kUtY5AA+v7O96DTs+g0zRlNvYuoD6ZSMSb8TRPZOE2MIyhMJ7/uWD?=
 =?us-ascii?Q?+l3LalpksHH22oIDP5401Z4H2Z21znKIVeQJNophYm94Qc4JCSJCUmbcuFwb?=
 =?us-ascii?Q?yFb+NfN/F6twwMWen/0dq/3eFnnSamWzLV73wTQKaww3ohHTY3TZQmpvaVoJ?=
 =?us-ascii?Q?NPBTShEuVhjjR/u8h/9FbNFcEhQa7YosK+9Hf85PC19e8PwtBtKdJmVr0cDF?=
 =?us-ascii?Q?3mPrqhU125g8lB/V8797hLVZw5psgwHKI3ymHf6hmioLGaw3hnx8pEaxudal?=
 =?us-ascii?Q?njnVIJ7zfsk9kU/I2gNmLfqYIwWAw1hYG/kJtTLF?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf3a9a43-86e9-4b70-75f8-08dde5e4888c
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 03:39:46.4319 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: abPiFishp0LBqdvHPAhcZ//VlSoWhJ6ymTNsdBxLxSJcll4fYGi6meW/l6GDh3if2RnSSLeOLKCPxnZDimQpSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6467
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

Change the 'ret' variable from u32 to int to store -EINVAL.  Storing the
negative error codes in unsigned type, doesn't cause an issue at runtime
but it's ugly as pants.

Additionally, assigning -EINVAL to u32 ret (i.e., u32 ret = -EINVAL) may
trigger a GCC warning when the -Wsign-conversion flag is enabled.

Fixes: aac243092b70 ("accel/amdxdna: Add command execution")
Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
---
v2: Modified commit message and add a fixes tag as suggested by Lizhi.
---
 drivers/accel/amdxdna/aie2_ctx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
index 420467a5325c..e9f9b1fa5dc1 100644
--- a/drivers/accel/amdxdna/aie2_ctx.c
+++ b/drivers/accel/amdxdna/aie2_ctx.c
@@ -199,7 +199,7 @@ aie2_sched_resp_handler(void *handle, void __iomem *data, size_t size)
 {
 	struct amdxdna_sched_job *job = handle;
 	struct amdxdna_gem_obj *cmd_abo;
-	u32 ret = 0;
+	int ret = 0;
 	u32 status;
 
 	cmd_abo = job->cmd_bo;
@@ -229,7 +229,7 @@ static int
 aie2_sched_nocmd_resp_handler(void *handle, void __iomem *data, size_t size)
 {
 	struct amdxdna_sched_job *job = handle;
-	u32 ret = 0;
+	int ret = 0;
 	u32 status;
 
 	if (unlikely(!data))
@@ -257,7 +257,7 @@ aie2_sched_cmdlist_resp_handler(void *handle, void __iomem *data, size_t size)
 	u32 fail_cmd_status;
 	u32 fail_cmd_idx;
 	u32 cmd_status;
-	u32 ret = 0;
+	int ret = 0;
 
 	cmd_abo = job->cmd_bo;
 	if (unlikely(!data) || unlikely(size != sizeof(u32) * 3)) {
-- 
2.34.1

