Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qN/fAVDNgWl5KAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 11:26:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 959A7D7936
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 11:26:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8BF610E5EB;
	Tue,  3 Feb 2026 10:26:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="XAWBkbEr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013066.outbound.protection.outlook.com
 [40.93.196.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F22910E5C6;
 Tue,  3 Feb 2026 10:26:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OtPx7mYoaDIGCwNAtQU3suxwOR7VSeAlhfx8suigT+14T4+VxTYJSDYiwGXxQH95azSNOGNbBLG3knAOE4sZm9x5Z1BAchpbaejTZQdIjg1v1pgIj+0ADygOpsDBjjgjggBXp2Rk7hAL+8eJVCEJfmTQoVHPofUX44v3kpMF+7/D/HIZra8ty3fqmMv8qFYw5Qhr2Yfd7bwxWZ38D9b7sw2WM86MPnpPza34Ihe9eEQw5vgmC7ZxWTep7J+f2AupKQciP9idN1ImX+oK1U59yWpO/2DQGOjXQbuvq08/vg0yxunp3ImFDxvOk9I5ymeewYYWLZMXPmfc+YSrCS63Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9rMlIiQ1MVju2OV8YD7J90sOhxXIGq6/ZvuG+2CELTA=;
 b=f457bZBTe8XqaXjtlA+qWTK3IFsGfwzROUPdT74emetQ+kFHYQ9InqDwSP9B99hUqiIviKOirVt7wbTEvb5wQGdkNuSXxn6ttZhScE2dKSceoVjgbcB1EnxzKHRpGJQuaipnW4qD4zs9z7jxP9JJUyhD8dPEmmU2SN1XJ/AdOIC5Xdes9VvglnaE+QR8EJV/1EeXV+N8l8PNA0x8fQd8ZKYRYLln4fqPsJRnYDfX4qVK4CwnGIyrQB9pFcyL74+bWdezBLRDQXK7B679xVfPzs5FvaLF/yQqIL6A1pi+aX8QwngSXlDww1h0YHX/dbi1rJAjnfQ/RIIQxjBW8vLgfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9rMlIiQ1MVju2OV8YD7J90sOhxXIGq6/ZvuG+2CELTA=;
 b=XAWBkbErj0MyWz7bEQQJ1HMdOHodQUxO+cPkF2n3nYkBf4AKwo1OJjPsgSstRp2kHd0KQz2Bw2oA57HAC0q2oEaEk/tIZBmD5gRuR66fQ0RYuFWNFZYjBpwmaOoOPb7izm/OCujWmF0c+aLPNDKu4ktsXpKh/kqIhZdUjquAAMk=
Received: from SJ0PR03CA0178.namprd03.prod.outlook.com (2603:10b6:a03:338::33)
 by IA1PR12MB8312.namprd12.prod.outlook.com (2603:10b6:208:3fc::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 10:26:15 +0000
Received: from CO1PEPF000075F2.namprd03.prod.outlook.com
 (2603:10b6:a03:338:cafe::e6) by SJ0PR03CA0178.outlook.office365.com
 (2603:10b6:a03:338::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.16 via Frontend Transport; Tue,
 3 Feb 2026 10:26:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000075F2.mail.protection.outlook.com (10.167.249.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 10:26:14 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 3 Feb 2026 04:26:12 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 05/12] drm/amdgpu: use multiple entities in amdgpu_move_blit
Date: Tue, 3 Feb 2026 11:22:12 +0100
Message-ID: <20260203102236.3456-6-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203102236.3456-1-pierre-eric.pelloux-prayer@amd.com>
References: <20260203102236.3456-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F2:EE_|IA1PR12MB8312:EE_
X-MS-Office365-Filtering-Correlation-Id: f2f17b0d-ab11-4177-6305-08de630ea8ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RGJsakExZWpVMUl4bDNJVGRwdGNQOVlaWHJMZVRXaDVhSG1kWm9wdUc2c1hY?=
 =?utf-8?B?ZGhrOVpuckVpSnBURzV4OExxRmJnZVUxRUtNWTVJL3VZNnczNjlROGFKZ01F?=
 =?utf-8?B?Q1djSTZhcDIxTFB3RVphemx0bnRXMklTVkxWTGU4N3Y0NEEyZm04VWVyVTY3?=
 =?utf-8?B?TmppWWltclQ5aCtIcm1hakNQM3haT2RqekJ1NmduSFBqMjZGbVBycUtIY1Rs?=
 =?utf-8?B?MERrcWdNOWFZZmM3WDRFd3JXRFB0SW80MTJ3QzlmRDlxV2hrT1lWQUNnSWJ2?=
 =?utf-8?B?YWpOcWUwWGI3STdoK0lUbVJJRkZxdytiKzdhRXlVNkQzTVFnSXV3MlMrSHE2?=
 =?utf-8?B?WXJzaVY3R01BZU9SR0lTVlUwYlUyNFdUQy9UbHhJNDRsZUhYRzN4Y1BkSFZx?=
 =?utf-8?B?YndrZVlNM2hwUzdUK3A1eFdVVWEvemtpankzanlZYmpqMFQxY3RiWlJQby9C?=
 =?utf-8?B?Rm10TmF3N1ppZzI1VTZCb1lhWVlyU1F4VkkwcldNT0EvZkhZOEVmaDM1Z3BX?=
 =?utf-8?B?S3ZvRkNpcU1zYVBjNXF3VkpjZG9XVXNyT0VwcTh1dDltZmQxMnQzaGkwQ3Q3?=
 =?utf-8?B?WWJmNkZvT2NaOGxBS3BZWjg2cDRwODg3Q1RLU3BZSk9RSG5Mb0RlUnBYVlBo?=
 =?utf-8?B?UXhTTDJxVzhVeDhtQXFWT2pKdXRXZjBGMDdFRGZBRjdyNk9LK2dtRmpPeWNC?=
 =?utf-8?B?RmtyamVjaXpuTHkvKzNrT2ZTWlJKWnhaVmlmODZYdkp4RGlLbnFRa2V2Vlhh?=
 =?utf-8?B?anUzZUYxbG9QaitGaENNR2xMQytGR0dSMHRTNmJUT1F3Z01UcVZna21RRUpR?=
 =?utf-8?B?Ni8xTnNvNmk0ZDNsc2tTOFVBdGxYeFhiSWRKYlVGM2VOOHVJdzdYN1k4MzNY?=
 =?utf-8?B?YXlHQmlCMnZaVGtBNkxDM0QzSFRXS0hkVTQvZzA0K0NzNGZhNmFhUSswWnRr?=
 =?utf-8?B?QW92Q05Mb0RFMTdWcVdwY0lyV01ON3o2SURKemZuOHk1MzNuU2Z5OHVwR0Q1?=
 =?utf-8?B?TUw0enU3L3RRS3I5WFpoYmFNUEI0cTBNeUhqc0ZCdFA4ZU9IcG1rNGVRV3FL?=
 =?utf-8?B?TlpwUm83SGRES3kzVFQ4NUVmUTZLWXhWaGlvdVlmb0xpSzV6WlYxYjNWUzQw?=
 =?utf-8?B?SXZYU01sRkR3dkN1TjdSWHc1c2Mxc3R5NFlPZjFEOURqczYrRmRvYmdiZ1RM?=
 =?utf-8?B?ZnRvYVQvRDNrdEdnU0FxeVFyVGhmVEh1Q253MURxL0RuaDdXa1ZFT3lxSkdh?=
 =?utf-8?B?eXE4NW05ZFZYbmN6TCttR1RRTjRQR0JidDVrclZueGRnNXkzMzZKeklnWGl3?=
 =?utf-8?B?K2xqUWFXc1pSbFpwL3hhbUlZbzBwQVpuS3VSZUlSbVRYWU1SaUovRjAvc0dB?=
 =?utf-8?B?MnIrYkJXRDlEb1RZQmtSWEJOeEcyVUtWRWlRNjBsTDJnbCtaQ0RodkJDODFw?=
 =?utf-8?B?TEFpaWVOeDEvZElUTVpRNVVwZEJFYjFlclp0bEo0UkovVFArS0dHWXRhMmFO?=
 =?utf-8?B?Z24rOUtrUHovYXRQek00UXZrS3Q1TmI0N3VFRkhvNTJHWVpxdm5CN2hvb3A1?=
 =?utf-8?B?eUVFTGJ1b0V6bUF2RzR1UzJCY0o5QzZpVm41YUs2SWswdkpqeStDeUQ4STBn?=
 =?utf-8?B?U0gxbVcrRGNhZVdXRnlSeVZDVnhJdndhQzMwK3Y2Sm5PaUhEVUczbDVaOW1o?=
 =?utf-8?B?NzhIZDZ6NEp2VnAvL0dXSy9YWXUxQ2tKSFdVZkJraWtaWDVmODZMVWFieGdm?=
 =?utf-8?B?UTY1d05DRHpJTnhlNGN6VWM3Sjc1Y1NLQ2pxaUhWb3ZsdFVWbXZ5NEEwQ2g5?=
 =?utf-8?B?VDA4YlhWdlVjU2NYSUFSenh2YTNLaVpRaHVNREJCdGR3K1ZGMmE4YVRiRHpo?=
 =?utf-8?B?YVVXQkl3TTVuRzlYcjZRSlJDMzFHSXlmWkVRMUp0VlIvbFdOK0hoaTYrbWNk?=
 =?utf-8?B?Zm04QWdJd0swZEEwYzIrRldzMHcxMnNJM2t4Ny9MOHIzbFNLcmVyZTBwVTJF?=
 =?utf-8?B?NkNkZWx6ODlIQTkvVytPbkxjN2dLZEIwS0VaRXZ0Q2xuUllyTmNFT1AxS1Z6?=
 =?utf-8?B?VUJYQ0QwbVMxSWd2KzRqR1U3SXA4MGJyQWt4eHAvQlBTdlExNUhtd1UyeWdZ?=
 =?utf-8?B?NVZtMXo1MlhwNXJqMkEwNVdsWmFqbUszeEpaNStSemt6QmQ4TGNya0hYWkpX?=
 =?utf-8?B?WldVWWljdkUweGtNbmUzMjkzUEVMMUUzZ2RwYzBpUDhJMFFrRURLQjlFWCtV?=
 =?utf-8?B?OFlRbnc5MWtQRTdNcVNHZG03Z1RBPT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: SgaxdS63OHzbTAwRpY4bmvw3J4TEBfzLO4cg4pXmfbP+9GAbhOiKsRWO/aQMgGst7WxwjUbfTjFGD6BwkOLKCZUwbEXTPAJZiJZMmKhfQsoCtY093SzdF50JnSpcaz5JfOvEQtM+ucYNUnlIm+fsEoR4nirjwq88iz9IKtl7Rsu1XrpR8MMR14GqIndfRJQZLZCL9WV4tkhjUdRbBQDVcl3aN+fBRlmwzM0YJmT9lov8E3AUL+Rzdie4IivJPq1R6O/HGx728btk/svMZGBnrLHghHA7xnbOizLgQgYRzB6NGma6jWcDK42Ewmgyq9cESqNfg8JCQDpRX133lGVjDLVLmxsGLPJuqptze/5wDi+m6GXvYsJV3FHlYyvRV2Qmc+EpURwtJvuyjDggkkT4OdDH46EISvOuZXP3XpFzGPNiG1/RhK3h0fAeIwNoJVE3
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 10:26:14.4375 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2f17b0d-ab11-4177-6305-08de630ea8ca
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075F2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8312
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
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email,amd.com:dkim,amd.com:mid]
X-Rspamd-Queue-Id: 959A7D7936
X-Rspamd-Action: no action

Thanks to "drm/ttm: rework pipelined eviction fence handling", ttm
can deal correctly with moves and evictions being executed from
different contexts.

---
v4: use u32 for the index in the entities array
---

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 13 +++++++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h |  1 +
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 56b4f560ea7f..91fcf4f08181 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -387,9 +387,11 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
 {
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->bdev);
 	struct amdgpu_bo *abo = ttm_to_amdgpu_bo(bo);
+	struct amdgpu_ttm_buffer_entity *entity;
 	struct amdgpu_copy_mem src, dst;
 	struct dma_fence *fence = NULL;
 	int r;
+	u32 e;
 
 	src.bo = bo;
 	dst.bo = bo;
@@ -398,8 +400,12 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
 	src.offset = 0;
 	dst.offset = 0;
 
+	e = atomic_inc_return(&adev->mman.next_move_entity) %
+			      adev->mman.num_move_entities;
+	entity = &adev->mman.move_entities[e];
+
 	r = amdgpu_ttm_copy_mem_to_mem(adev,
-				       &adev->mman.move_entities[0],
+				       entity,
 				       &src, &dst,
 				       new_mem->size,
 				       amdgpu_bo_encrypted(abo),
@@ -411,9 +417,7 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
 	if (old_mem->mem_type == TTM_PL_VRAM &&
 	    (abo->flags & AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE)) {
 		struct dma_fence *wipe_fence = NULL;
-
-		r = amdgpu_fill_buffer(&adev->mman.move_entities[0],
-				       abo, 0, NULL, &wipe_fence,
+		r = amdgpu_fill_buffer(entity, abo, 0, NULL, &wipe_fence,
 				       AMDGPU_KERNEL_JOB_ID_MOVE_BLIT);
 		if (r) {
 			goto error;
@@ -2403,6 +2407,7 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 		}
 
 		adev->mman.num_move_entities = num_move_entities;
+		atomic_set(&adev->mman.next_move_entity, 0);
 		for (i = 0; i < num_move_entities; i++) {
 			r = amdgpu_ttm_buffer_entity_init(
 				&adev->mman.gtt_mgr,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index cf32db3defb1..3b1973611446 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -76,6 +76,7 @@ struct amdgpu_mman {
 	atomic_t next_clear_entity;
 	u32 num_clear_entities;
 	struct amdgpu_ttm_buffer_entity move_entities[TTM_NUM_MOVE_FENCES];
+	atomic_t next_move_entity;
 	u32 num_move_entities;
 
 	struct amdgpu_vram_mgr vram_mgr;
-- 
2.43.0

