Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QAfICSN+e2kQFAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 16:34:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA66B1822
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 16:34:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00F6A10E884;
	Thu, 29 Jan 2026 15:34:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yX2+rUD1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010014.outbound.protection.outlook.com [52.101.85.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76BC410E883;
 Thu, 29 Jan 2026 15:34:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KEhLN4vT8iGCA3++xTlvRTCeGj34zRSOTwqHD6PyWiJQO47HHxd8x6x9izLxgSuq5guIjXdbEoSITixtat48Vu5kKaVlmA9EZo2X0Xro0jkv5MrwRnjoB5/06lrjZfyM2CIOpeNQFLoibAjEXUYJH+5KKiZyEon/2v06m5KZjj3W8rbvI/LZpzUCBzG45RvZSfE5DcAVz54bUI/ztBq98noRwql95DeK/8qvOvJP/AfdWc5AUtt6D5Ti5/txRq9E04bccMBayRZzSCzjJyGukyuUCFVJrdXRnjKvRV/RbpqqwlkKhCS3E3uTdhrVWPWLRpmftRDnnB7stuhAjluneA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NTkAmAfPQPk2CNp8ztuG/QV9jlUEdXMbaa71Wtafv3M=;
 b=pcDGd+ZsrA5ntWbiGamPwNu8XcXLZLgvG6wEJcEZqch1WIX8KQM9Dj7KA2QEzMozOFObYj/MXDxLnnpexCmojNO6YCI3yEucNulAEF5c0pKIML2lN19Oe7S0tRKs9CXu99I5+dqkx5+mQwPLPWIPU9oT3QmFzHBQ17H+C056EZQycnU7ZLlfjG1WTlmOsE1ido0dkHpKNJ2OWhbg0Xq42Hub8puwmeQv1USvjuEcUzvY63nC9qDIMWuVYaFw6OxoeZVRlIEO2McsbFpGbHBHt/ro056ZaGmI8j03DiHb2iG5j+1lDWffEwrMqGPkup82GQ9smAkOqC7E77LfO6gJzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NTkAmAfPQPk2CNp8ztuG/QV9jlUEdXMbaa71Wtafv3M=;
 b=yX2+rUD1tW8ziUtqHLGUT3sz3v/nWgOeWZDFL1GEa7efDbUbXXhoALWVCEAO44vfHLNHaGw/ljqLMR9TtvITqquGNyX1M4o8GCVE1Kc5QIz2OeUiZo7jwRi/JthsohTy9hplbG9TD6CICfjlL70IZ5J95tKCZFH0FulNx7LzbtQ=
Received: from BL1PR13CA0186.namprd13.prod.outlook.com (2603:10b6:208:2be::11)
 by DS0PR12MB8813.namprd12.prod.outlook.com (2603:10b6:8:14e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Thu, 29 Jan
 2026 15:34:50 +0000
Received: from MN1PEPF0000F0E1.namprd04.prod.outlook.com
 (2603:10b6:208:2be:cafe::de) by BL1PR13CA0186.outlook.office365.com
 (2603:10b6:208:2be::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.4 via Frontend Transport; Thu,
 29 Jan 2026 15:34:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000F0E1.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 29 Jan 2026 15:34:50 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 29 Jan 2026 09:34:48 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 03/12] drm/amdgpu: add amdgpu_ttm_buffer_entity_fini func
Date: Thu, 29 Jan 2026 16:33:15 +0100
Message-ID: <20260129153336.7473-4-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260129153336.7473-1-pierre-eric.pelloux-prayer@amd.com>
References: <20260129153336.7473-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E1:EE_|DS0PR12MB8813:EE_
X-MS-Office365-Filtering-Correlation-Id: c3d77282-a3aa-4c00-7205-08de5f4bf0d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bFUraXZoQlIxaTcwVEZocTFwYjdiaWE5OThtWCtkOHNhUTZ6UVdCMXl4SzNE?=
 =?utf-8?B?L0Rvejh1QUxNNnJ2UEVwcHJJM09jaHBmNm96czBUZ2djTjNSWHA5L2VQcmIz?=
 =?utf-8?B?V24vdERiWE5GcGFUS09ZajZDUDMwSjloQXlmdTRMMEVHeDIzUDBjZTNlY1Rh?=
 =?utf-8?B?cVd0c2FCMXE2c3UxbFd1Mk5Wc0lNWlI3S2FvQ1ozWm0wbGdGSDNUQ2RkZHM0?=
 =?utf-8?B?dEFrblBqZXJXMmZIZzNCTzlGZ0U0dzg1N21QUlc4S2dmWkR3SVhJQmlybFkr?=
 =?utf-8?B?aktiNGxQa0VLdjA3aGdyRjdKSHdGRU12aWo5OVAvOXdpWGI5MndPUXlQRE1h?=
 =?utf-8?B?QXVHeEt3Qmw5MGMwdHgvV0h5ZXhLOHh3WDJCcG1uems0OC83U3ltQkIvTGRD?=
 =?utf-8?B?SmRjM3RJYTlBU1VjdlpIcG8vQkRPL0RmNFAzd1owV3ViNDByVjhvaHU3dnQz?=
 =?utf-8?B?dXlhNHNBUDdPSmZRRWI4VVdUd0Vha1RGSEI1RjZZcTJTQTI4bUFNN3FzU2Ur?=
 =?utf-8?B?SC9FVkJhWGRzWnZQVFhPS3BoeWR4czd3NFIwMHdYRnRnTlB3SUdya3VZU0l1?=
 =?utf-8?B?b1dXQVdhdlVjNHpwRUk5Q0ZSZTZpcUVYSVEyUUcrakhqcjNhNHlCemk2V3Qy?=
 =?utf-8?B?bW16OVNkUkRzSWlUenNWL3EzRzJmREIwRGdTZTlNWGFBN1ZQdW9aU1BFQVNp?=
 =?utf-8?B?NDdXTUtkbi91L0lOaWdwQ0ZQZ0Y2V01TNEhXak9ydnNoT2xMaTJUK09XcE1U?=
 =?utf-8?B?UmpFV2xud1htY3lONHBPU2NIMytJRW5TZ1NJZHh2TS9WdmF5QnE5aXlHSHBq?=
 =?utf-8?B?Z1pYQ3NOVlJwb2ErZVluemNwVnpzQm1jcUxJTkdlZ3ovZktQVmY0TjgrMTRo?=
 =?utf-8?B?OG1NaTZCaDRTWVdVc2JvZWxpd3lDRUpKUktQVFo1anN1a0gxNmpkMHN5Yzcw?=
 =?utf-8?B?Nms1dVBUOExNNldPSGhlRXlWc0lyaExtcHZDeE83cGhsSVNUU2NjNElndUx1?=
 =?utf-8?B?VUVzdloxc3Vib244eEsxTVdIcjA0RC9Zd0Zva3lZZkxNaE8rMGxLczVwZms0?=
 =?utf-8?B?QVhhZERmS3FUMWd3T0sySlQ2K085c3VUVk1SNTVlZ2hwMzd4WHBhWUFEM0Vk?=
 =?utf-8?B?V1MrQ1N5MkRTNTY4WnFXekZSRkRLRTVNRjEvVGF6QkJpbTJEclNjMDJzVVhI?=
 =?utf-8?B?WDdSeUJ6eDI0WkpmYStGYW51THViaUNlakNLcEZieHovL3dVL1pmdDlheEJK?=
 =?utf-8?B?VXBsczJvS2loTXdqUU5hdlZ0dDdtZWVHbTA5bC9yd1IvcnFwVGg2NXE0aG1E?=
 =?utf-8?B?bnovdEo3UUpMZUxYeDM4Y053dEV6ZDdXVTR6b1lkZENWZE9UakpDbUJOZG1J?=
 =?utf-8?B?MmZWL0o0YmVDaXh2amlBQ1dDWmZkU1ZEOXYwMG9JZHVaTWJuSnRnUVpVU1Ux?=
 =?utf-8?B?ZEtLaFUrRWRsWk12UUJaT2JzQkpJbjhvNzNUaHJTMXozY215VE8wR0RtSTQx?=
 =?utf-8?B?RWlkM25DeThkZjRzdjJBdWc3a2pTQnVVdXhoZjUxUzlsTTk4ZElybDBSbndV?=
 =?utf-8?B?VzBoV2lHcm11Y2lUSkhYMXB6SVIvVXZDUWVJSExHM0E0MGdUYmh6dFp2WU80?=
 =?utf-8?B?dGVPbkdPRnFHc0pBVEcyT2o4dUd3ckFkNWZPK3BieVJDYXR6cFp4ckUzempm?=
 =?utf-8?B?VGkvT281MHYwMHFERWJYNjgzMUJMck1GUHI0ZHNrK2pUQUZzQkx4VUVFaGpi?=
 =?utf-8?B?aHlPbzFEaGRDS2FBR1FVU01IeUs3WmZBeHpadnh3R1RCQ3gyV0FBM0Q5c1Zi?=
 =?utf-8?B?NTh3OWR2YzVVWkw1bXB0dEFUR1VFdTRSM0JIV29qN0dFWmRDWklDN0pIcCsx?=
 =?utf-8?B?c0ZPajJocTQ2OXB4UnZhUU5HZUl1OXVqeG5CSTV6QnZWWnpkNHlDL2JVWjJV?=
 =?utf-8?B?NEZYU3I2Z01nQ2hVNmVmM3UwbXlUdVlMeld2eE94OWNhV2ZBamVGaVQ0OG9V?=
 =?utf-8?B?Y2l2NmR5SlJFcDV0QlBsMUlhd3JTWlJDRWF0T1dIdHdPRlh3WU9aK25SZUEv?=
 =?utf-8?B?UjI5a1pIUzZwa1lDK1ZBZjNISGRnTUV3YmtqbkkrL0pNZnYwZ1FKejUvUWtx?=
 =?utf-8?B?RSttZ1FhZmJ1NlpEOFRGZFZ5c1lsdlhBTGx5R1FDL3I0L3JYNHh6WmRDZ1Nk?=
 =?utf-8?B?ZTlGOTQvODN5UUNsN2ZQWW5wbmdvUXNjeklIRHpUSlFYM3dVOGdzODFZVDVD?=
 =?utf-8?B?Z3NVM1FQOUV6L2FlU2FlZ0JOTW1RPT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Kxpy3c1ylRLUehmpsliMFXneUHLREZ2UuB1K8cc9v5AOaFwGOtwxtjmDvAcdtdlOUi0/hJx64UBWyVeRtxad8o+DLqF02UW0aqRIRcyhqjxv8Jg4VhGD716ClwI+hTKbnnvyeqK+7eh/6j1i05vLh85BrCMZcdknhV1lt9RZtGetbyiepKdmbDTr7+SR2Xg1XLB1EdAwk6QNUJRlf6SDAJVknGyaAfn26lf2bpQbo18e776a70+O0xW16d57Ec74uztHzH92IiyLVq06umABwQBM3Nc+rRmVfmReKoHGskqyzrWaFx6+TitP5jA9QG5wz4sic2+atIMV7XZ8ViUnGZjh6VuJ9zgsw0xooKVOoIzE2G7IFqvLlok7Y4ymR+pulv81+ObdX3DUTp1HSbhZqdC1rg/S7Hsn5EH5n9uwcQer6tcEou+VphaM4gFUFVVB
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 15:34:50.0380 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3d77282-a3aa-4c00-7205-08de5f4bf0d4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8813
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[pierre-eric.pelloux-prayer@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email,amd.com:dkim,amd.com:mid]
X-Rspamd-Queue-Id: CCA66B1822
X-Rspamd-Action: no action

This allows to have init/fini functions to hold all the init and
teardown code for amdgpu_ttm_buffer_entity.
For now only drm_sched_entity init/destroy function calls are moved
here, but as entities gain new members it will make code simpler.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 73 +++++++++++++------------
 1 file changed, 38 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 5850a013e65e..8b38b5ed9a9c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -2013,10 +2013,18 @@ static void amdgpu_ttm_free_mmio_remap_bo(struct amdgpu_device *adev)
 }
 
 static int amdgpu_ttm_buffer_entity_init(struct amdgpu_ttm_buffer_entity *entity,
+					 enum drm_sched_priority prio,
+					 struct drm_gpu_scheduler **scheds,
+					 int num_schedulers,
 					 int starting_gart_window,
 					 u32 num_gart_windows)
 {
-	int i;
+	int i, r;
+
+	r = drm_sched_entity_init(&entity->base, prio, scheds, num_schedulers, NULL);
+	if (r)
+		return r;
+
 
 	mutex_init(&entity->lock);
 
@@ -2033,6 +2041,11 @@ static int amdgpu_ttm_buffer_entity_init(struct amdgpu_ttm_buffer_entity *entity
 	return starting_gart_window;
 }
 
+static void amdgpu_ttm_buffer_entity_fini(struct amdgpu_ttm_buffer_entity *entity)
+{
+	drm_sched_entity_destroy(&entity->base);
+}
+
 /*
  * amdgpu_ttm_init - Init the memory management (ttm) as well as various
  * gtt/vram related fields.
@@ -2317,7 +2330,6 @@ void amdgpu_ttm_fini(struct amdgpu_device *adev)
 void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 {
 	struct ttm_resource_manager *man = ttm_manager_type(&adev->mman.bdev, TTM_PL_VRAM);
-	u32 used_windows;
 	uint64_t size;
 	int r;
 
@@ -2331,47 +2343,36 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 
 		ring = adev->mman.buffer_funcs_ring;
 		sched = &ring->sched;
-		r = drm_sched_entity_init(&adev->mman.default_entity.base,
-					  DRM_SCHED_PRIORITY_KERNEL, &sched,
-					  1, NULL);
-		if (r) {
+		r = amdgpu_ttm_buffer_entity_init(&adev->mman.default_entity,
+						  DRM_SCHED_PRIORITY_KERNEL, &sched, 1,
+						  0, 0);
+		if (r < 0) {
 			dev_err(adev->dev,
-				"Failed setting up TTM BO move entity (%d)\n",
-				r);
+				"Failed setting up TTM entity (%d)\n", r);
 			return;
 		}
 
-		r = drm_sched_entity_init(&adev->mman.clear_entity.base,
-					  DRM_SCHED_PRIORITY_NORMAL, &sched,
-					  1, NULL);
-		if (r) {
+		r = amdgpu_ttm_buffer_entity_init(&adev->mman.clear_entity,
+						  DRM_SCHED_PRIORITY_NORMAL, &sched, 1,
+						  r, 1);
+		if (r < 0) {
 			dev_err(adev->dev,
-				"Failed setting up TTM BO clear entity (%d)\n",
-				r);
-			goto error_free_entity;
+				"Failed setting up TTM BO clear entity (%d)\n", r);
+			goto error_free_default_entity;
 		}
 
-		r = drm_sched_entity_init(&adev->mman.move_entity.base,
-					  DRM_SCHED_PRIORITY_NORMAL, &sched,
-					  1, NULL);
-		if (r) {
+		r = amdgpu_ttm_buffer_entity_init(&adev->mman.move_entity,
+						  DRM_SCHED_PRIORITY_NORMAL, &sched, 1,
+						  r, 2);
+		if (r < 0) {
 			dev_err(adev->dev,
-				"Failed setting up TTM BO move entity (%d)\n",
-				r);
-			drm_sched_entity_destroy(&adev->mman.clear_entity.base);
-			goto error_free_entity;
+				"Failed setting up TTM BO move entity (%d)\n", r);
+			goto error_free_clear_entity;
 		}
-
-		/* Statically assign GART windows to each entity. */
-		used_windows = amdgpu_ttm_buffer_entity_init(&adev->mman.default_entity, 0, 0);
-		used_windows = amdgpu_ttm_buffer_entity_init(&adev->mman.move_entity,
-							     used_windows, 2);
-		used_windows = amdgpu_ttm_buffer_entity_init(&adev->mman.clear_entity,
-							     used_windows, 1);
 	} else {
-		drm_sched_entity_destroy(&adev->mman.default_entity.base);
-		drm_sched_entity_destroy(&adev->mman.clear_entity.base);
-		drm_sched_entity_destroy(&adev->mman.move_entity.base);
+		amdgpu_ttm_buffer_entity_fini(&adev->mman.default_entity);
+		amdgpu_ttm_buffer_entity_fini(&adev->mman.clear_entity);
+		amdgpu_ttm_buffer_entity_fini(&adev->mman.move_entity);
 		/* Drop all the old fences since re-creating the scheduler entities
 		 * will allocate new contexts.
 		 */
@@ -2388,8 +2389,10 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 
 	return;
 
-error_free_entity:
-	drm_sched_entity_destroy(&adev->mman.default_entity.base);
+error_free_clear_entity:
+	amdgpu_ttm_buffer_entity_fini(&adev->mman.clear_entity);
+error_free_default_entity:
+	amdgpu_ttm_buffer_entity_fini(&adev->mman.default_entity);
 }
 
 static int amdgpu_ttm_prepare_job(struct amdgpu_device *adev,
-- 
2.43.0

