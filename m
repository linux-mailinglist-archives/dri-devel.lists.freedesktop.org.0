Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLjHIUV+e2kQFAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 16:35:33 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F93B1895
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 16:35:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9030910E896;
	Thu, 29 Jan 2026 15:35:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="NuEPadk7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012015.outbound.protection.outlook.com [52.101.43.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBBF710E891;
 Thu, 29 Jan 2026 15:35:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wM8H8Y9B8dOG2H3ZNASQLmfJ5HlNPc55LPYze6dmYFd4G2UVHP5I/lSXsrwV3b6143jHFVW1zkFHNByQWeXXLdu2nGr/qAOOkZN5GTr2X3c0MMkwp99SDrJ+eGmxgL7kVw2XAxl3RZUmc7IcQpThpw5T8Ul/rx8q1AuAGCnvgnHhrXJs2Fr+fw53bVtfNtxPe9wfGMYlICSQFAeQgG6A2JmPH55Z4cB2/wv4/0AneRBi7D2nHWh8fFtQrr8Oy0PwQPohIZr+hwPbQAjixH+i4aFP158UzHYqbC9zhjE6ukwV4FGZt8I8zjR+U4B5QG/ZxTt7l/0FcTWNCBXfjc4XNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8QZkcIW7q4K8h44BP/Hy8WSz6qMDO9t4LyVbOLg/e/k=;
 b=vro3+8DvdaLqZGhKltUCQe+Bcjx+EDpv4H9078YEnqqBwkrZEJk6Nsj96toQVwurkVc/taeZ9FzPOgVMGzLE54+hccOXYDdj4VOATJrSRKhNOdSZm9ea/CStBfiMV1ZaMhBZXD4VOWpzYTlUeHNR/2ROKTVxj1ODpQlnknYTCjMkRLcyPOriuM3+bz7Y6L2tr6v8+gTz7nOLRwvyUzu4Z5JiXGnovyaXVTQSJRC/JlT6aJCiX0o3ANQHdNUcONfzLt1kMdmRAC9+SJnv8cm9QkNs7g5FAQvVNjxSXj1m5JZEMZ1n0VE9yXtRTInktNhn0dW9zWXJmcuWrRJoxim9nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8QZkcIW7q4K8h44BP/Hy8WSz6qMDO9t4LyVbOLg/e/k=;
 b=NuEPadk7KQRi+ANeblbpxUgDUaIBWXJdmsHX/PvJrz6pPTHl0Un07myi1fRWlCANhoq2yB/zVTidUENAh5WfNVM8nCSKuJpjn15YWDCbbhwqtvdBQK03bd4x3KBstfZPr7dNf48AS9QfFBEj4KFFv/jtViAqiyzkujiNLowDJ8U=
Received: from BY3PR05CA0024.namprd05.prod.outlook.com (2603:10b6:a03:254::29)
 by LV8PR12MB9418.namprd12.prod.outlook.com (2603:10b6:408:202::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Thu, 29 Jan
 2026 15:35:17 +0000
Received: from SJ1PEPF00002317.namprd03.prod.outlook.com
 (2603:10b6:a03:254:cafe::54) by BY3PR05CA0024.outlook.office365.com
 (2603:10b6:a03:254::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.2 via Frontend Transport; Thu,
 29 Jan 2026 15:35:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00002317.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 29 Jan 2026 15:35:16 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 29 Jan 2026 09:35:14 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 07/12] amdgpu/gtt: remove AMDGPU_GTT_NUM_TRANSFER_WINDOWS
Date: Thu, 29 Jan 2026 16:33:19 +0100
Message-ID: <20260129153336.7473-8-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002317:EE_|LV8PR12MB9418:EE_
X-MS-Office365-Filtering-Correlation-Id: bcbfa769-0834-4103-6f16-08de5f4c00ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T0JnVVJ2ODJ0Sy9mdUpTMlE4Y1M0WFlQSUh5eWtkTzlubGI0MTRsQnBHQ0Nz?=
 =?utf-8?B?OHFkbFFLdlRENjRSOTJDRmhZUS8zdFFoRzJmeTRQYUJCM3FjdnlhVTRFc2Ro?=
 =?utf-8?B?NjIrQ1JRMytYTXRxQ3VLMXJaTnZhRGl4anFzUW5xSkcrS1NUV0N5SUlIUzcw?=
 =?utf-8?B?NHh3T0RFclZkVktxeEhPSHNET3FSaW8vS3d2enlGTmxvWDhZZ1RIMHppSGNt?=
 =?utf-8?B?MEhJOTBwLzYvQjExQk9DcXFXSWNaRkNPN0JScjg2aURtaFdWdUFINTdMeTFT?=
 =?utf-8?B?Qnh0MWpQZFJQMDM2eGJYN3o5MElWS1BqZzNlRlh2OEtJaTJlLzdzc2RHbnNG?=
 =?utf-8?B?QnVMMmNJUlF0NHFzT3lpbkpzbVdjK1FnL2g5WEVNNGRLc2hvNDlLY3g2cmNj?=
 =?utf-8?B?RjFTaU9aVDR3Z0RrWU9RaWtEd3J1aGNQSVJpWFpPT0N1VnQwNXNTY2lERUE2?=
 =?utf-8?B?cVloNlFZVWcrakR3S05wR2JTa2NSd1NBR0N3T1dmdjc0ZGVvSFNTL3E0dGNX?=
 =?utf-8?B?ZkFCWDNwSkZzOXhDZ3NZelZ3dVRuaWFGc0dhWDFYOG9nanFiOFQzK3doZEFL?=
 =?utf-8?B?MlhSVHRuckFXVjR1cWFjalBkUDluSHJOTm83TlhSVDN3clVUQkhLUVFabzVP?=
 =?utf-8?B?TGhTdERZVUZmVkdKRUdLbWxVcDJDUnRTT1FRaWl0bmNUdGtVVUU1cUxrQmVE?=
 =?utf-8?B?cG93dHRVOGovaDJROTRHZkZoOXdZcjNMbGFOZVh3Um9Rc3B0Q1NHalREOWVJ?=
 =?utf-8?B?bnpEZEZNRURHTTdta29YWUY4UnVsZkRuSWtEOUlVVzV2SnlMWnl5bFI0d20w?=
 =?utf-8?B?OW0zN1BQZi9yWHowb3o0SnFrN0hMSXkrUWJSaytORDJSVGFCQmtzbExSSW1C?=
 =?utf-8?B?VTZWY2xrRU5yUUM4dGNKQk1WSFd4MXkrc09vS0s2S3BpVWhadVhSZ1UxcVVC?=
 =?utf-8?B?KzBpVk9KWDd1Y25aZ1VrWEJ6NmpKVHQwTHZ6bjh0SHlTWXcvSUd6NTRvVkRx?=
 =?utf-8?B?bjh1dms0MS9HMDhEelZETnRlUUMrSWJoM0dJVDR4RC9BSy9sbjNqTWRueHh0?=
 =?utf-8?B?VzdZYzhxVmxhL2NVaWFOY0RRcEM4SXMwU01UeUlockZ4NG1jZFpkcklSQUdr?=
 =?utf-8?B?VTM5RkxqYjFDUm1aVWk1N3U3em53MFFOSVdNOStQejFibDJTTjIrNDBkeU1K?=
 =?utf-8?B?NUdZQms4N2ZTMUV6L3JiajdMUStGdWtxd0xSdERRSWN3V1ZlR2sreUcrcXZ5?=
 =?utf-8?B?WXZveGIrMlRld1kyMGVzRkZ2RXp0VmIrVHQ0NU52WldibWV0TloxVHRBS2tq?=
 =?utf-8?B?YVdSWVNtRG5MNk83cytLME9iWVpsVDhEM2ttZW9HSG5oei9LYnFLRFdZMngr?=
 =?utf-8?B?Nm05WXp0Qm9DVVdwU1VadDFqTCsxUExrdGNoTUlHUmx0b3JvWTh6amk0OFNH?=
 =?utf-8?B?TGZjTzAyaUFGSW1VMWxOaW5ORXc5NVlTd2NuL01VeEt1RGZRVGpkMnpkNU16?=
 =?utf-8?B?dHlVQ3J6MnFhZ3lva3hPVzNUaWZMS21QOVI0VDFwUXA5TjNqb2RFVU0vRzBP?=
 =?utf-8?B?b1p0RFpueGNqb3Q4UGxVL3oyOFlnSzNmZ1hySU1vazBJZmhEMnVVNHdvdFpT?=
 =?utf-8?B?anZaZklFRW9SdURKNzFxWU5ha2RWSy9NQVN2RVFNS3pOaDE2QmhUYVFyNDVZ?=
 =?utf-8?B?ZndmcDM5azZ1cUlCbEk2Y01QeWZFNllnYi8rY1UwMXVPVzVVb1RpdUlPSVor?=
 =?utf-8?B?d1RXRk5JTmhoNE5PcGVqZ2FpSTR3bFlwR3BIRTJxcG9ZY2J2eXlWckVBZFha?=
 =?utf-8?B?dVIrNUdZN21wdGdtVG54ZzFDRXV1WXRkQlpicklJcE5RbTFEUmlldUVZWXBv?=
 =?utf-8?B?c1l6NjR4YkI4dFpNQkhHL3Z2Z0IyZHNWVzF1ZFlvVXBOeEExeUk1RmxxSmZ5?=
 =?utf-8?B?Z3JibmVReTdjeC9Yem9tUTRjSHk5M0NzZTBKSmIxa0w5TTdKVDZMWXdPZ0M1?=
 =?utf-8?B?V3RGTTl5ejgzeWd3NWhodmdSMFFXM2xUdlltRE9PWjdnZU5leDV1aEVYcW5y?=
 =?utf-8?B?dENzanBYOUZFTUlMR3BtZDN4M3FBWExrd1NJeTVIZ2R4MnhIWGtvOE9jMWRX?=
 =?utf-8?B?T1p0S3ZSQnhwS01Wc01tYlFzOTR0cVRJY2xHY2M3MDUvOFVwMmR0cHlJTXBJ?=
 =?utf-8?B?dnp2SmtkM2Y2T1RCQk01TnV1Um9sZURrUDBZRVJSUWQ3VzlGcTA4M3M4aDZ5?=
 =?utf-8?B?RE5PWW4rZU54clNjVmNwaTNDdkJRPT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: EP3CTQFkHp0imLoOdY/eYh4HSEKzHTWURBhyPCrTyTPC6xMdmvY0868rjk6h/K3YV4CDbDRjybtu+1R5DwXRnu+gRtGh/K0+EYVdcLWcDbwgXEKDprSIm27bYksjjTnBPOzwVf5xhxzcmL9tTz9dxZ2AGqWXwo1O82u4QN+DfwqF5/bODF/7M8NUQ83MkJREaItu6lxBCGk6ruMxfuCheuJDZToG4dXXWamJPKWpYC/Poz+OkJfY5p9b2kWVJ1QwYMsNOElPqPLdPSG5/wrbptIdCoFe9QNIwn/F91qvDqlQqEpAMxCD8DK6jMHC5LnDj9h0fZk8K2x/gybpYzBdKxQvn20f2J63SPQjJh14/4IE68YWdbCU3KLT8DjnAIwOGdPb4gQojomr+W0Ufk1MJs5E/kF2zze31BrY7gtsX9tvT5B/DHfswDf8aTLUh6ao
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 15:35:16.5546 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bcbfa769-0834-4103-6f16-08de5f4c00ac
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002317.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9418
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
X-Rspamd-Queue-Id: 39F93B1895
X-Rspamd-Action: no action

It's not needed anymore.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c | 5 +----
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h     | 1 -
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
index f2e89fb4b666..9b0bcf6aca44 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
@@ -324,16 +324,13 @@ int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size)
 {
 	struct amdgpu_gtt_mgr *mgr = &adev->mman.gtt_mgr;
 	struct ttm_resource_manager *man = &mgr->manager;
-	uint64_t start, size;
 
 	man->use_tt = true;
 	man->func = &amdgpu_gtt_mgr_func;
 
 	ttm_resource_manager_init(man, &adev->mman.bdev, gtt_size);
 
-	start = AMDGPU_GTT_MAX_TRANSFER_SIZE * AMDGPU_GTT_NUM_TRANSFER_WINDOWS;
-	size = (adev->gmc.gart_size >> PAGE_SHIFT) - start;
-	drm_mm_init(&mgr->mm, start, size);
+	drm_mm_init(&mgr->mm, 0, adev->gmc.gart_size >> PAGE_SHIFT);
 	spin_lock_init(&mgr->lock);
 
 	ttm_set_driver_manager(&adev->mman.bdev, TTM_PL_TT, &mgr->manager);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index 8af0aab7608c..f927b793c395 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -40,7 +40,6 @@
 #define __AMDGPU_PL_NUM	(TTM_PL_PRIV + 6)
 
 #define AMDGPU_GTT_MAX_TRANSFER_SIZE	512
-#define AMDGPU_GTT_NUM_TRANSFER_WINDOWS	3
 
 extern const struct attribute_group amdgpu_vram_mgr_attr_group;
 extern const struct attribute_group amdgpu_gtt_mgr_attr_group;
-- 
2.43.0

