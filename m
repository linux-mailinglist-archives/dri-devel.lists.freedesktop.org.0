Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6658FCA6458
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 07:52:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B429110EA1E;
	Fri,  5 Dec 2025 06:52:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="uX30vmYQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011007.outbound.protection.outlook.com [40.107.208.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 977B510EA1C;
 Fri,  5 Dec 2025 06:52:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vvv2GPXF2N1b2CuL3g3UEwZB1ofajynFTrE+xJfjgm44gGxFtYUQrk2+DW+aH+UhwTmM7gJpNjishz6K6j8wK4ZEORuDCoZHBhThOjJj2X1BqGfgDUxCRriDoxssTBfrCc58zKktkd8mIa9ilEbQPUdscSRr3JgbGj6lqVH9oPJkfLikyvC64qZ6mdXMEAEvRdw+fXDxu6QyNLrBsG+mNNTQ38dAC4bjHw4gOXStTHxbciR9z+Sza+N1ncHNvMpj+tWWwMlZlN1389oNcqEtmw9KZv1R+v8B0HtJNkkfpw+oLKJJsjBOO5X01njrPcpomvhLaF6km6bp7ZE12ctGGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8oGSwUVseApxuEq74NExCWk3MqqndQd9SzDYDwbQYUA=;
 b=ee45+/EdrbMo8GmbcW4zIj5fQuB4ZQNDRHPGaUKhEuVi7WnXi7xV4ZBg5VG8QLzARmppp5Fv586woawRSTcy64m7H0QoL/g3HUHUyqafny42W+hRPE4TyR59dAuyuSjlVgVDFLzVQN/5vIotivUvoQCBpgbHoGiLbR9kKbov+9MgzwsvEd5SWs4uVr6uw7Qi4FSuyIZjIbDSpoYu/yyLxfhmsUm0rXxZt2/76rYuMsvqBEw+vhbA2AcZdqgLJuxcc2fJDdZR5C7VJEtv8YZ/r+iw9TbVwPOhaKleEU7eXvQpFEtn3lg2lTXvnmPxHwI3CoAGoQA91K77cD7ftYHWMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8oGSwUVseApxuEq74NExCWk3MqqndQd9SzDYDwbQYUA=;
 b=uX30vmYQd/8qcoZMw/I8DNplJ7432bnFcPn6rCEnUXTl0InanEamzuPtg+FROGq1AqBWrhwPnHKu85+UxEiFZe9o67k2hCeygEXxTXSDOHHHKhli/Fbe4rCizkRzMdEqNYLaAtWugVzT7PHeyxvIPhCoI5as6/KZfDd2gUGTdUA=
Received: from DS7PR03CA0084.namprd03.prod.outlook.com (2603:10b6:5:3bb::29)
 by DS0PR12MB7778.namprd12.prod.outlook.com (2603:10b6:8:151::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.13; Fri, 5 Dec
 2025 06:52:17 +0000
Received: from DS1PEPF00017092.namprd03.prod.outlook.com
 (2603:10b6:5:3bb:cafe::c6) by DS7PR03CA0084.outlook.office365.com
 (2603:10b6:5:3bb::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Fri,
 5 Dec 2025 06:52:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS1PEPF00017092.mail.protection.outlook.com (10.167.17.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Fri, 5 Dec 2025 06:52:17 +0000
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 5 Dec
 2025 00:52:14 -0600
From: "Yo-Jung Leo Lin (AMD)" <Leo.Lin@amd.com>
Date: Fri, 5 Dec 2025 14:50:57 +0800
Subject: [PATCH v5 4/5] drm/amdgpu: add UMA allocation interfaces to sysfs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251205-vram-carveout-tuning-for-upstream-v5-4-1e87cf3b57be@amd.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6648; i=Leo.Lin@amd.com;
 h=from:subject:message-id; bh=H1TIWs+zw6Cg1v5OIVIey3hgAxGbLDcZ4aQXx0lGDFg=;
 b=owEBbQKS/ZANAwAKAV8XsZZKKe6GAcsmYgBpMoEDn9tm7W8CjfQDJEzIEEufeyk8FTCmpxvz+
 QfVQzrC4TyJAjMEAAEKAB0WIQQzqV4kW+yguuqHrw5fF7GWSinuhgUCaTKBAwAKCRBfF7GWSinu
 hsmSEACEokBGUQwpHy+GHWPCmg1um2Tdeb//JvvdlKs2REsyGWypnkJpw0g8frgBqYlMcMt/KYV
 ri3PvjSZwsONh6yguz0TD+oB9u7Pyl1UbeEV/VGMBDe47xEjq+RYBYxunVD0HQyCONH6mYO3Z4B
 PgqlulcIwgh0aN/KjkpuXHx7gwMLIm+rgBeM/AuFv2GWz4dxMiASNDfPcxUGdxhWr7G2MA1huuy
 tr2X8RJPzL5LdjuRZ/Z0AKMk0rS0XUnkOI3AThwGeqs9hHSGOOREfTf86IJrCLquYGUTAJqJRgY
 f7olQ12cTZqKhDJ0OkSq+Za1mpDwILe2d7ruLbJkJPhWJncdkR5x/lAp9moxi5hRRF+0JZBPN3X
 n4PN/7ipC1jId20OvTtiPic9E73Y1SYdDBAJfbM6S4jL25KNGtz4xpb2VN2DeroC9ajmRsjdhqS
 l/M0Hq2yV/H12kddwv7DWAFPvZZzJ2sJRT0RO1aZZ+R9bAp0KuxVIBaDNZcNtboPvXuooLVkOCQ
 KC+GU4HPGoog8aj31cjQcu2ivhJYuwD2zz5ysBRvSZFOtwHQjs8u2fpzcTX9ZdT8/j6GzKn230F
 3zVtP0YpuyKtuQlwCjSKyOMQqrf8GJZgmPwx0pYO22J9HR/D8ZKD9nc+Ntk+GXPetpl0EZNDOn+
 0YZX8b4EQKiSyPQ==
X-Developer-Key: i=Leo.Lin@amd.com; a=openpgp;
 fpr=33A95E245BECA0BAEA87AF0E5F17B1964A29EE86
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017092:EE_|DS0PR12MB7778:EE_
X-MS-Office365-Filtering-Correlation-Id: 1eccfe88-0b41-4633-d4f6-08de33cad4bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|7416014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V3J2NGR2ejNmSjZoRm5SdGNldzVFL3llbkc4Q2Y3M0VQQ1BkTFlMbkVnNHk0?=
 =?utf-8?B?WHpndHFub0FwRG5XNG9qdnNMOUhQWkN2UXFGdXRYTU42VW1sbnBJWjBkUjRm?=
 =?utf-8?B?UjhTcisxS1ZuK0hycTRuanUrd29qa1BHYnZBWHFkNEo1aFRoVERJZlJzVzl1?=
 =?utf-8?B?ZkpEWklGemh2S0ZjMHBRdTVWN0lrdmc5R2JOc2t4c24zUDl5TlhGRG8yQndo?=
 =?utf-8?B?WU5naDhaeGdIMHh0UmpwMmtXbTI0Q3BoamxRNXAwSTZQSms5cXljeGNHR050?=
 =?utf-8?B?S0pHYTNvcGVoeTk2SW1PcDZReGdON2Q5ZjFLVHNWTndQZlFOV0VJYUdmMkxB?=
 =?utf-8?B?NlJSN0RpYTBvMG5IcEh2R2FQWU1QM1VGQUdPamo0Y0RDSk5rZkdBN2ZsWStT?=
 =?utf-8?B?RFBES05LZ0tVTS9hanBTNHQ0ZEU3NnBIRTBzMXpmWlNOZkhXSEdVKzlYenBo?=
 =?utf-8?B?NTZyd3hyWnRucXNoLzNmWXMwY0NhN2xINEVEbkpSVkxMWmpka2s2UWRkbXlh?=
 =?utf-8?B?ZGFwTmhzNnlYV0FpN05WMEdHdFAvZ1M3T0hkUk9MNTZoWFN3N09sSFE4L0Yw?=
 =?utf-8?B?VTY2Y0E2R2VINE16SlJHeW1iUUxWMmtMd29vU3YzSFZXWXhIcEdkWkhVdko1?=
 =?utf-8?B?Y0ViczVhQkZYVWhBbmlmbmU5ZnFKalpKRFl3VDBVSFF3TG94TTNwdHE3L3FL?=
 =?utf-8?B?NlZ6TDU4NGF0Q25KTzNzeXlQNmZYeWNpejMxQXdtR05HakJVYzFrNHhZOWwx?=
 =?utf-8?B?WnFkZ0NiOWxaRlN6MzNvajlMc2tWc0V3UlZ1WTluV1BtSWZrWldGZ0dnL0or?=
 =?utf-8?B?WkRpT0IyVmhsSktVVHBRTFdSeVJSVHFtVEE3UUtQc25vNzZkOTNTcDlYY0Fr?=
 =?utf-8?B?ald0UWdNMngrTmJKMit6d1FPanVKUXR3SW9GdzNEam9DSGlLTHQwdDZGY3NG?=
 =?utf-8?B?QUdhVFc5ZjhQRjNjQ0JPTEFUWUlXWCtvUWZ4dnk1YmhCcDdrWitxZ1c2UzM5?=
 =?utf-8?B?MW9PU3h2MlVQSHk3Q2hTYzRTc0dobWhPRE00N3NacTdjeDd6VG5adHg2TDFr?=
 =?utf-8?B?S0NQZGRuWlpjd2xYaTNkb0N5aEJjVTdXRjNOUjRMUTF5U0IzZ0ZvaHlOWnc5?=
 =?utf-8?B?cW9zZkk0b0VkdHRJdFg5blozYUR1VG5UUWQ1VVR6Qy9iS1Z2NmFIQkd2NUtM?=
 =?utf-8?B?RXJDKzlLRm5sSjJDWWY2Y1BobmZXdzhkVjhIWmdaTU1aZitGUlB0Q28wUzNX?=
 =?utf-8?B?OUhWcUJZT2dMQm5yV0hWa0hJV0h4Y2RvYWNGRWhJczJKQWh6c0t5Nm81V0NV?=
 =?utf-8?B?Yzg4QURSUVBmc2hwRkpIZmNSckQ1d01SRDhpSHh0cWFTbzVVSWF2VHF6M0h2?=
 =?utf-8?B?RElGUCt0MWs4UWZSZ0VoZk5vTGFsdlREOGFKb1NtWDdtbk9ZTlF3SXlxREVq?=
 =?utf-8?B?bk9aeFBBNy9uN2hrL0hWd25CVUo5U3hpQnBESHFTNkREWjFZbHUwNko1eWVz?=
 =?utf-8?B?cVhoSHhIU3BCQjlqSzI2MzA4aVBLWlc2RFordDN3enNuSnlSbXFSdVdpN3JR?=
 =?utf-8?B?NDUxQllGaDc1ekRhMlh2T2lhTEl4MkNzd1NLMFo4YUlvdk1zNS8xTnZDWUoz?=
 =?utf-8?B?aEhHS245YTBFaEUxSXFqTVJHdW9IcWk0dEcyRzl6MjAwcFNIMnBYVkdFanZR?=
 =?utf-8?B?NmRhYnRTM0w3NkhUb0dScHQyTHEzSVQ0bkp1ZXhxWmd6dmhJS054Z3JrQUpx?=
 =?utf-8?B?Z2VTK0lOM1l0Zmdxa3cyUkthL2pjTE9xOG5qNHVOOGpSc1dLRU1UWnJQRW9h?=
 =?utf-8?B?cHJNZFFMZmk3dm5BbjVQSk5aNktBL2YzUnAvYkpjM2E3VlozbmdVVCtiVk41?=
 =?utf-8?B?QU9BZmUzUGY5RlVVdFRVTkRneHdDeGdkSzJ0NXZYQnBXQnFUeGoyeTlwNXlz?=
 =?utf-8?B?RTM5TVB3cUVFR0ZVYi9kdk5teWZjcEdpY1MxdDl2MWI3N3RiRW1rV2tUcWpv?=
 =?utf-8?B?VGtLUTA5Z3pqMVNGK1VQSmJwNTc5dkxCcUdDRDV0Uzl1UE1rL3VNOCtFSnRx?=
 =?utf-8?B?cTN0anRHZ2xDOWQ2bCtCVkJSaTFHdjkvenliZlJ4bUVSVGhST296WjR1RVYr?=
 =?utf-8?Q?eUCQ=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(7416014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 06:52:17.8014 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eccfe88-0b41-4633-d4f6-08de33cad4bd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017092.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7778
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

Add a uma/ directory containing two sysfs files as interfaces to
inspect or change UMA carveout size. These files are:

- uma/carveout_options: a read-only file listing all the available
  UMA allocation options and their index.

- uma/carveout: a file that is both readable and writable. On read,
  it shows the index of the current setting. Writing a valid index
  into this file allows users to change the UMA carveout size to that
  option on the next boot.

Co-developed-by: Mario Limonciello (AMD) <superm1@kernel.org>
Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h        |   4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c   |   7 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 138 +++++++++++++++++++++++++++++
 3 files changed, 149 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 6bf626a51dfc..177376ff5811 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1846,4 +1846,8 @@ void amdgpu_device_set_uid(struct amdgpu_uid *uid_info,
 			   uint64_t uid);
 uint64_t amdgpu_device_get_uid(struct amdgpu_uid *uid_info,
 			       enum amdgpu_uid_type type, uint8_t inst);
+
+int amdgpu_acpi_uma_option_init(struct amdgpu_device *adev);
+void amdgpu_acpi_uma_option_fini(struct amdgpu_device *adev);
+
 #endif
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
index bdafcde51107..b2779fc2f712 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
@@ -1288,6 +1288,12 @@ static int amdgpu_acpi_event(struct notifier_block *nb,
 int amdgpu_acpi_init(struct amdgpu_device *adev)
 {
 	struct amdgpu_atif *atif = &amdgpu_acpi_priv.atif;
+	int rc;
+
+	rc = amdgpu_acpi_uma_option_init(adev);
+
+	if (rc)
+		drm_dbg(adev_to_drm(adev), "Not creating uma carveout interfaces: %d", rc);
 
 	if (atif->notifications.brightness_change) {
 		if (adev->dc_enabled) {
@@ -1340,6 +1346,7 @@ void amdgpu_acpi_get_backlight_caps(struct amdgpu_dm_backlight_caps *caps)
 void amdgpu_acpi_fini(struct amdgpu_device *adev)
 {
 	unregister_acpi_notifier(&adev->acpi_nb);
+	amdgpu_acpi_uma_option_fini(adev);
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index a7594ae44b20..979298d9c213 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -36,6 +36,7 @@
 #include <linux/pci.h>
 #include <linux/pci-p2pdma.h>
 #include <linux/apple-gmux.h>
+#include <linux/nospec.h>
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_client_event.h>
@@ -7835,3 +7836,140 @@ u64 amdgpu_device_get_uid(struct amdgpu_uid *uid_info,
 
 	return uid_info->uid[type][inst];
 }
+
+static ssize_t carveout_options_show(struct device *dev,
+				     struct device_attribute *attr,
+				     char *buf)
+{
+	struct drm_device *ddev = dev_get_drvdata(dev);
+	struct amdgpu_device *adev = drm_to_adev(ddev);
+	struct amdgpu_uma_carveout_info *uma_info = &adev->uma_info;
+	uint32_t memory_carved;
+	ssize_t size = 0;
+
+	if (!uma_info || !uma_info->num_entries)
+		return -ENODEV;
+
+	for (int i = 0; i < uma_info->num_entries; i++) {
+		memory_carved = uma_info->entries[i].memory_carved_mb;
+		if (memory_carved >= SZ_1G/SZ_1M) {
+			size += sysfs_emit_at(buf, size, "%d: %s (%u GB)\n",
+					      i,
+					      uma_info->entries[i].name,
+					      memory_carved >> 10);
+		} else {
+			size += sysfs_emit_at(buf, size, "%d: %s (%u MB)\n",
+					      i,
+					      uma_info->entries[i].name,
+					      memory_carved);
+		}
+	}
+
+	return size;
+}
+static DEVICE_ATTR_RO(carveout_options);
+
+static ssize_t carveout_show(struct device *dev,
+			     struct device_attribute *attr,
+			     char *buf)
+{
+	struct drm_device *ddev = dev_get_drvdata(dev);
+	struct amdgpu_device *adev = drm_to_adev(ddev);
+
+	return sysfs_emit(buf, "%u\n", adev->uma_info.uma_option_index);
+}
+
+static ssize_t carveout_store(struct device *dev,
+			      struct device_attribute *attr,
+			      const char *buf, size_t count)
+{
+	struct drm_device *ddev = dev_get_drvdata(dev);
+	struct amdgpu_device *adev = drm_to_adev(ddev);
+	struct amdgpu_uma_carveout_info *uma_info = &adev->uma_info;
+	struct amdgpu_uma_carveout_option *opt;
+	unsigned long val;
+	uint8_t flags;
+	int r;
+
+	r = kstrtoul(buf, 10, &val);
+	if (r)
+		return r;
+
+	if (val >= uma_info->num_entries)
+		return -EINVAL;
+
+	val = array_index_nospec(val, uma_info->num_entries);
+	opt = &uma_info->entries[val];
+
+	if (!(opt->flags & AMDGPU_UMA_FLAG_AUTO) &&
+	    !(opt->flags & AMDGPU_UMA_FLAG_CUSTOM)) {
+		drm_err_once(ddev, "Option %lu not supported due to lack of Custom/Auto flag", val);
+		return -EINVAL;
+	}
+
+	flags = opt->flags;
+	flags &= ~((flags & AMDGPU_UMA_FLAG_AUTO) >> 1);
+
+	guard(mutex)(&uma_info->update_lock);
+
+	r = amdgpu_acpi_set_uma_allocation_size(adev, val, flags);
+	if (r)
+		return r;
+
+	uma_info->uma_option_index = val;
+
+	return count;
+}
+static DEVICE_ATTR_RW(carveout);
+
+static struct attribute *amdgpu_uma_attrs[] = {
+	&dev_attr_carveout.attr,
+	&dev_attr_carveout_options.attr,
+	NULL
+};
+
+const struct attribute_group amdgpu_uma_attr_group = {
+	.name = "uma",
+	.attrs = amdgpu_uma_attrs
+};
+
+int amdgpu_acpi_uma_option_init(struct amdgpu_device *adev)
+{
+	int rc;
+
+	if (!amdgpu_acpi_is_set_uma_allocation_size_supported())
+		return -ENODEV;
+
+	rc = amdgpu_atomfirmware_get_uma_carveout_info(adev, &adev->uma_info);
+	if (rc) {
+		drm_dbg(adev_to_drm(adev),
+			"Failed to parse UMA carveout info from VBIOS: %d\n", rc);
+		goto out_info;
+	}
+
+	mutex_init(&adev->uma_info.update_lock);
+
+	rc = devm_device_add_group(adev->dev, &amdgpu_uma_attr_group);
+	if (rc) {
+		drm_dbg(adev_to_drm(adev), "Failed to add UMA carveout sysfs interfaces %d\n", rc);
+		goto out_attr;
+	}
+
+	return 0;
+
+out_attr:
+	mutex_destroy(&adev->uma_info.update_lock);
+out_info:
+	return rc;
+}
+
+void amdgpu_acpi_uma_option_fini(struct amdgpu_device *adev)
+{
+	struct amdgpu_uma_carveout_info *uma_info = &adev->uma_info;
+
+	if (!amdgpu_acpi_is_set_uma_allocation_size_supported())
+		return;
+
+	mutex_destroy(&uma_info->update_lock);
+	uma_info->num_entries = 0;
+}

-- 
2.43.0

