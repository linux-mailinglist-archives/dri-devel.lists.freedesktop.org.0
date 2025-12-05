Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B66CCA6444
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 07:52:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C14610EA18;
	Fri,  5 Dec 2025 06:52:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="BD5QxAIg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010003.outbound.protection.outlook.com [52.101.56.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D1CE10EA18;
 Fri,  5 Dec 2025 06:52:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GW9HlwfoXbSGBCJILdPOCBk8UF/KOQxu9k7ScddFVKRQGTU548VeymuBU351K2jIJUNUmEFjLbGTm4uBzFl8769Fo1IWiMchM8gtIlY8wUU4iUvpwHxdDRIQ4FQpXKYRb5O6PcPlrSnUG0lo6UiraJWP8kIl/d6KjICen5Gp/gH5Hmcn4DnTTZHfpnWiBIJQWBYRdagkm9n9ROB3x5KEfMfjHJXS906YvMhx9zE8fgC/mZwpC4UBkOQmk6Ou7whrKUfXa24FbpRcV+DXL9+Xjsn6ikfhAH327R9Q0+Et58ccm82PCVRo9U+hLrxtmhcYThyR3EUwRttYJwvN3gMjOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1s1agTl5/wK5jsZeSEoayqP66OsRkfzvC7pHS+q6110=;
 b=VOlrNr06Z5k++OOJ0nka2Rp6XPRdWVrQSS/ELdFGSDf0k3bownwoCecRk1IRYwsbH9Lu5b1W9JxiGsdsAt65sUFBYesgCodSVmphbkB7vTAXf7xwAcHl9eMcUYZf8EFsUuWjZlGcmwNnYPzQCDA64SzQbfi53rf+K4gSC7NAKfDNX1bmnZABQV4GWkTTf5k9s5IHzASAahRNmA66zhI3FkdLhoUziIwh7WL/SSOpOubNhJoVqT6sNUJSsSIt6hEsmAjIIwny8zcCw6o/2iivJtHXxEIU1QsIRAa+m8Tn6gMTMhUCV9z4AwxzilICEHYQUGXoEeEF+Y+cBYAd0WRdMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1s1agTl5/wK5jsZeSEoayqP66OsRkfzvC7pHS+q6110=;
 b=BD5QxAIgL5LTc28l96FERPwWoRStBMxpng3aNuBxSTPDVvnDhaFF4/lDigmFqlYXUFpOEeAUXrPswbh8stL57TrRZVqC8UCRr05q6QZScVlXC4erkLC8ruSrGCrOuxKz2BOx8P/MJtJP2cIkXyu+ZxSPM/pjLQoNMVF0Xqnq4VE=
Received: from DM5PR07CA0112.namprd07.prod.outlook.com (2603:10b6:4:ae::41) by
 MN0PR12MB6294.namprd12.prod.outlook.com (2603:10b6:208:3c1::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.17; Fri, 5 Dec 2025 06:52:11 +0000
Received: from DS1PEPF0001708F.namprd03.prod.outlook.com
 (2603:10b6:4:ae:cafe::e8) by DM5PR07CA0112.outlook.office365.com
 (2603:10b6:4:ae::41) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.11 via Frontend Transport; Fri,
 5 Dec 2025 06:52:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS1PEPF0001708F.mail.protection.outlook.com (10.167.17.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Fri, 5 Dec 2025 06:52:10 +0000
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 5 Dec
 2025 00:52:07 -0600
From: "Yo-Jung Leo Lin (AMD)" <Leo.Lin@amd.com>
Date: Fri, 5 Dec 2025 14:50:55 +0800
Subject: [PATCH v5 2/5] drm/amdgpu: add helper to read UMA carveout info
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251205-vram-carveout-tuning-for-upstream-v5-2-1e87cf3b57be@amd.com>
References: <20251205-vram-carveout-tuning-for-upstream-v5-0-1e87cf3b57be@amd.com>
In-Reply-To: <20251205-vram-carveout-tuning-for-upstream-v5-0-1e87cf3b57be@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>
CC: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>, "Tsao, Anson"
 <anson.tsao@amd.com>, "Mario Limonciello (AMD) (kernel.org)"
 <superm1@kernel.org>, "Yo-Jung Leo Lin (AMD)" <Leo.Lin@amd.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5797; i=Leo.Lin@amd.com;
 h=from:subject:message-id; bh=ASdiq3kjKJdaJjxTBSLBkmVna+yxq0v6+iOeXV/tDKA=;
 b=owEBbQKS/ZANAwAKAV8XsZZKKe6GAcsmYgBpMoEDDBQdH58gK6t/T7ySDvQJ6cixksgW4rwY6
 ATuyjU/b8aJAjMEAAEKAB0WIQQzqV4kW+yguuqHrw5fF7GWSinuhgUCaTKBAwAKCRBfF7GWSinu
 hqRDD/98iz0Ctgrxm43UIHme2neaqc+vqbHbJyZnTAT79boWSUiQLZYBwcd7J91sjqEQUk6Uz4w
 JC10u1Kfk4h1JV1VkMWUTZ+mBNDr2iH0QL8be2NWskrFyLJXJ1bfnVRyTcDa+gPt1uHFfROvZjv
 MhOCjwUeeKnQmqP+ZcU/kTaPdxMoJEw3UHP+y6AeXbbBu9qcgLuKSRlANTb02G08ZW69WGwWjD1
 lZjAAXdo5byefrbu2nI+91ZTK0l+eoUZv2G/jzJsCFJr/Gva5CS3+G+j0fx4dvVNcZnjFxIr42N
 TkwdvQLYMxpHmaaxWz9nk5XOo8MdO7OR3bx++vPGWgQM3o+fU73Sh/0eMGxztCygX9FMekO7EMV
 9Jo4OEAzTfQ0r2S7cy5dBG/bX0fQNyMn/EnI4HWtln0Dix9nNgJIVTRdc2urwoiQrG0CX/U+STo
 57Dkxkw7lzUmzeRiWhXJVhY3zPVpR95K5yEEdNZ+XPTcIpfx5PBSEpGk4i8ScXlMSbESag+ld1v
 5aGse4utq3EYD+/guF29lRQt/Ez9n9aSBDyb5fYNHyUn1kwEiAgiQyRKeEGqOttHfcjZYi5F/W1
 XPE4MmPk3u49Yud5gTvteke3BTuPYQA6aHksXE+kTouOsUs8KFzvSwFpuupz99fMns4kA2bTq8v
 y52lXEiHHUgr4Og==
X-Developer-Key: i=Leo.Lin@amd.com; a=openpgp;
 fpr=33A95E245BECA0BAEA87AF0E5F17B1964A29EE86
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708F:EE_|MN0PR12MB6294:EE_
X-MS-Office365-Filtering-Correlation-Id: 27adb972-d991-4d53-8f65-08de33cad097
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|7416014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NE5zdmRXNnpUUW5hWjE3MlBEOVBsWVJFL1B3UDA0WkhTcHZFQ29jakJIRU1L?=
 =?utf-8?B?UXZrd1BBR1ZyRVY2TS81NFdjb0xTaWwwQ3ArOHZNRGJDK1o3YVhOZWkrZUto?=
 =?utf-8?B?VDNSSzZpUDNBK0xCTE0zanR0R0x4eXhLeVVKQktYS1lwdjh2Q0xmYnpXMURQ?=
 =?utf-8?B?WDc0dGR4NWtJNmZ1QVhTUmVwU1BzampJLzhCbEYvWXd3bmRxek9PV3FWdCtY?=
 =?utf-8?B?dEhVRWhneW9ielZGaDRLY1oyRmVRdG8wY0lNaU9aRWpXaWJmeXN5UzNhYy8v?=
 =?utf-8?B?WnQwTTlxQitIeGdjcE9WMDROZ2NYb2QvOG9lSUFvYzRnRkdyR2xUUHFydy9w?=
 =?utf-8?B?Y3NNV0Z3bXZQQk1wNmt2T0FEWVhQVmdNZlBJa1MwcGxKYTZ2YnhoclpZKzdk?=
 =?utf-8?B?RHRxWHlvUGZSQUJ0elJhM0ZtUlN4UnRpUjR5bStSTUlRZlpFcXR1ZmVPV1ZP?=
 =?utf-8?B?R2hqbHdXYjNKN3EvQ2xvcDF6UkNJc2d5UUdnNkFkbjd3eUtCWFFYYUZxN0dn?=
 =?utf-8?B?aWU2NTJqVGxQN21HNG5MVEFmYTNJNlR3TVJrbHBGODNaVVEwQUZHTjlLNFVp?=
 =?utf-8?B?aUtiZnBFNUZQNUFQMWMxaUxDR0FkTTJBcDUra1NZbWx5ZzFFNWs3TkpDOXZ0?=
 =?utf-8?B?K1hPUVYxcC9FUW5EbU1hTXlYNHNjV2VHMkdxMnI2ckVLWERNT242cHhhN3Fv?=
 =?utf-8?B?MGczREZmT3BZd3k5UFhoL2xvZ29FZ1pEVlhUQlEyT201RWl2Yy9pTTA2SDVl?=
 =?utf-8?B?TmhGQnU0MGFMbjNwZ25XZFRvTThOSlRYdTF4bk56SEpSbythQTFYLy9HQmRY?=
 =?utf-8?B?ZXA5a3FnaVBQblNMSGdFcnRmRFMramJaY0RlenVMVWtCU29TM0ZaakRFcnlj?=
 =?utf-8?B?aitwa3BpWUZUZWQ0ZkFWK0VhL2N4bEFPQmszc3Q0alZLOTFJY2hET1hHcTBy?=
 =?utf-8?B?dnlXUm1ZdFRXSXBLbjdZYVdhbXlrRmlNb0ZyVll2am9UQkFlQ21PYUd5RFVW?=
 =?utf-8?B?UmJNTDhnRldiTzlkNWY0bHJGZ1lBRkNWV3FXRDlDVFIzc0R0QzE0SW9XcGdx?=
 =?utf-8?B?K0p4aVFwQm9wM1hpdFJjVHNTVjhjZ0dZcm43SnA3SytmRTgyU3Z5OGxoNDhK?=
 =?utf-8?B?NmJmSG5zMnRGWXpjaWdCM29SeUhWay9Xb0E5VlI4UXV1WUNBa1BQTzBuUDJY?=
 =?utf-8?B?aU9ZTXVPNm9DMGNvbW5SMWJzSGZhTFNzUTRSZFIwTUJHbVJiaE4rb2F3ZDlU?=
 =?utf-8?B?R1FRMzNTRUpKSEJobGNIbmRCM25CQW91YzN0Q091ODdxMmFJcWZ5QSs0YWlt?=
 =?utf-8?B?V1lJQ285WDQwRVBWOU1uQnp5Rk9hVnI2cFpjdE9UV0FycndlS1FhcWdkTUFQ?=
 =?utf-8?B?NFZWYTFTZzdMQXJuRko2MWdUVmVib3Z6Mk5VWURsOVovSXRXRTRsaWpXWUlH?=
 =?utf-8?B?M3dwSjc5RVZQYS9kdXFka0VIUVVwQ25oMmJyVEh4TUZyLy9IWEVLOHJpckpk?=
 =?utf-8?B?VmV3QUFWMER0NU9hekh4YVZlTUZJK081NEp1WmxPcFJrakdVNDJVdy9lcy9k?=
 =?utf-8?B?WlFucklYS2FRdjMySy92N1dvRzh6cTBMbnk4T2dGNkQ4Q3lmWXhJc1NxNXlz?=
 =?utf-8?B?dGFuelZrR1JRbWZGekVQaE5SRGhXU3JYMHI0OEFKamo1VENUMzJETXRWVWdo?=
 =?utf-8?B?UytMUVhya2JWRXZwSFIvaDF2RzRaL0hqUWVkM1pQZjdHaWZFazF0TllHNkFG?=
 =?utf-8?B?WHBiNWpCS2s0NnFZc0RVNllJUnJic2tJOUVKaEMvMnh3WGxYSHA5Y1dFMHdx?=
 =?utf-8?B?V2l0N0NGdHE1NUlXRzZPUTJDYkNFQ052alJGU0dpajlheTFRT0gxMnU5TkNT?=
 =?utf-8?B?aDVxS0grMm9vcll5SWlDaXJVNkJqSHp2YmxwZkFHc0tHT1QxeVZCcGNCNjBO?=
 =?utf-8?B?aGF5MUZORjA3RzdXbXVtVEhQOG4razh6OUhCWmZVWUVsS0YxUGIzMENaWTBQ?=
 =?utf-8?B?V2QvYmU0NXJWQUpRelpYWDgxMHltams0M1RCNy94dDE1aHY4eXFZWjRERzFD?=
 =?utf-8?B?M3hJQjZyVlpWcSs2YkRTc0dhaFplT1F0NVVuQlhLSjc2YzFHZllxMXJhTU9N?=
 =?utf-8?Q?gCWQ=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(7416014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 06:52:10.8416 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27adb972-d991-4d53-8f65-08de33cad097
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001708F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6294
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

Currently, the available UMA allocation configs in the integrated system
information table have not been parsed. Add a helper function to retrieve
and store these configs.

Co-developed-by: Mario Limonciello (AMD) <superm1@kernel.org>
Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h              | 34 +++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c | 77 ++++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.h |  2 +
 3 files changed, 113 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 9f9774f58ce1..aca2ddddc64c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -836,6 +836,38 @@ struct amdgpu_uid {
 	struct amdgpu_device *adev;
 };
 
+#define MAX_UMA_OPTION_NAME	28
+#define MAX_UMA_OPTION_ENTRIES	19
+
+#define AMDGPU_UMA_FLAG_AUTO	BIT(1)
+#define AMDGPU_UMA_FLAG_CUSTOM	BIT(0)
+
+/**
+ * struct amdgpu_uma_carveout_option - single UMA carveout option
+ * @name: Name of the carveout option
+ * @memory_carved_mb: Amount of memory carved in MB
+ * @flags: ATCS flags supported by this option
+ */
+struct amdgpu_uma_carveout_option {
+	char name[MAX_UMA_OPTION_NAME];
+	uint32_t memory_carved_mb;
+	uint8_t flags;
+};
+
+/**
+ * struct amdgpu_uma_carveout_info - table of available UMA carveout options
+ * @num_entries: Number of available options
+ * @uma_option_index: The index of the option currently applied
+ * @update_lock: Lock to serialize changes to the option
+ * @entries: The array of carveout options
+ */
+struct amdgpu_uma_carveout_info {
+	uint8_t num_entries;
+	uint8_t uma_option_index;
+	struct mutex update_lock;
+	struct amdgpu_uma_carveout_option entries[MAX_UMA_OPTION_ENTRIES];
+};
+
 struct amd_powerplay {
 	void *pp_handle;
 	const struct amd_pm_funcs *pp_funcs;
@@ -1319,6 +1351,8 @@ struct amdgpu_device {
 	struct work_struct              userq_reset_work;
 	struct amdgpu_uid *uid_info;
 
+	struct amdgpu_uma_carveout_info uma_info;
+
 	/* KFD
 	 * Must be last --ends in a flexible-array member.
 	 */
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c
index 636385c80f64..7f4751e5caaf 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c
@@ -296,6 +296,83 @@ static int convert_atom_mem_type_to_vram_type(struct amdgpu_device *adev,
 	return vram_type;
 }
 
+static int amdgpu_atomfirmware_get_uma_carveout_info_v2_3(struct amdgpu_device *adev,
+							  union igp_info *igp_info,
+							  struct amdgpu_uma_carveout_info *uma_info)
+{
+	struct uma_carveout_option *opts;
+	uint8_t nr_uma_options;
+	int i;
+
+	nr_uma_options = igp_info->v23.UMACarveoutIndexMax;
+
+	if (!nr_uma_options)
+		return -ENODEV;
+
+	if (nr_uma_options > MAX_UMA_OPTION_ENTRIES) {
+		drm_dbg(adev_to_drm(adev),
+			"Number of UMA options exceeds max table size. Options will not be parsed");
+		return -EINVAL;
+	}
+
+	uma_info->num_entries = nr_uma_options;
+	uma_info->uma_option_index = igp_info->v23.UMACarveoutIndex;
+
+	opts = igp_info->v23.UMASizeControlOption;
+
+	for (i = 0; i < nr_uma_options; i++) {
+		if (!opts[i].memoryCarvedGb)
+			uma_info->entries[i].memory_carved_mb = 512;
+		else
+			uma_info->entries[i].memory_carved_mb = (uint32_t)opts[i].memoryCarvedGb << 10;
+
+		uma_info->entries[i].flags = opts[i].uma_carveout_option_flags.all8;
+		strscpy(uma_info->entries[i].name, opts[i].optionName, MAX_UMA_OPTION_NAME);
+	}
+
+	return 0;
+}
+
+int amdgpu_atomfirmware_get_uma_carveout_info(struct amdgpu_device *adev,
+					      struct amdgpu_uma_carveout_info *uma_info)
+{
+	struct amdgpu_mode_info *mode_info = &adev->mode_info;
+	union igp_info *igp_info;
+	u16 data_offset, size;
+	u8 frev, crev;
+	int index;
+
+	if (!(adev->flags & AMD_IS_APU))
+		return -ENODEV;
+
+	index = get_index_into_master_table(atom_master_list_of_data_tables_v2_1,
+					    integratedsysteminfo);
+
+	if (!amdgpu_atom_parse_data_header(mode_info->atom_context,
+					  index, &size,
+					  &frev, &crev, &data_offset)) {
+		return -EINVAL;
+	}
+
+	igp_info = (union igp_info *)
+			(mode_info->atom_context->bios + data_offset);
+
+	switch (frev) {
+	case 2:
+		switch (crev) {
+		case 3:
+			return amdgpu_atomfirmware_get_uma_carveout_info_v2_3(adev, igp_info, uma_info);
+		break;
+		default:
+			break;
+		}
+		break;
+	default:
+		break;
+	}
+	return -ENODEV;
+}
+
 int
 amdgpu_atomfirmware_get_vram_info(struct amdgpu_device *adev,
 				  int *vram_width, int *vram_type,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.h
index 649b5530d8ae..67c8d105729b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.h
@@ -32,6 +32,8 @@ void amdgpu_atomfirmware_scratch_regs_init(struct amdgpu_device *adev);
 int amdgpu_atomfirmware_allocate_fb_scratch(struct amdgpu_device *adev);
 int amdgpu_atomfirmware_get_vram_info(struct amdgpu_device *adev,
 	int *vram_width, int *vram_type, int *vram_vendor);
+int amdgpu_atomfirmware_get_uma_carveout_info(struct amdgpu_device *adev,
+					      struct amdgpu_uma_carveout_info *uma_info);
 int amdgpu_atomfirmware_get_clock_info(struct amdgpu_device *adev);
 int amdgpu_atomfirmware_get_gfx_info(struct amdgpu_device *adev);
 bool amdgpu_atomfirmware_mem_ecc_supported(struct amdgpu_device *adev);

-- 
2.43.0

