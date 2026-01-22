Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Gd/FKtZcmkpiwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 18:08:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF4E6AD23
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 18:08:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCE6910E9FF;
	Thu, 22 Jan 2026 17:08:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="pC3dxNor";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012069.outbound.protection.outlook.com
 [40.93.195.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42D1A10EA08;
 Thu, 22 Jan 2026 17:08:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FWw2SyO09Q2w8bXwa3iBT/TVmd06v7Ty5+gZboqkO/BhCZRJQSI5NFV63gVNBsoF9mF/zIMSb+wdA5siAoQrd9no9dyCrk5XYK0lPbM+aaSHDzdbHqLyD6LHVpmJPDWmFpCND0igI5p4+t7weSrhWoeG7M5m0svypnjYDYroH0l7rLUZgTDUq481tdupdIjgL9f/Pt07VvgKHplaxaEthhZ7Ux88dNcB9aNH97fUHQgCMyX+JkXZAF4Bm6g2DCE3qyZ/iEEXcqpUB+UvK/+EtNmDruu0aF6vK7eIOaTPaCdVsfOrbP9p/1Aw7aFzDpSuF+QnyKwITJ/s1mgmKZUhcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PITfEG9DLdaFQ7xOfC99g+LbbnGnOcjaU3Z7VoYLlVk=;
 b=gRrDYH3/npWTdLuPXIAGKEjNtbQZd7uF9WYCWS/xh75f9N3j8KDt+y8ugdXDTlrV/cniE8QpOukp+6svitx/DDD6HnXTdSeWvi0gJu/kYx4kkM3pQHirLYl2MXlV3kp48F469pBCVUHEF16TMi7G66emW2y2ykLQLS5Ig17+UhWQcE9sufTdPUfbo4yvzLs10IASFlzCdC3JuyPbJhIKx1qUQn4KIQGkQy5Avx4CEvcLv7AGHyQU9EhNnC5h8N2u+g9qMwTh/Fv2DWduKBQT1vgSmlb/8f3ghGURnAMwCzzEbXWYkvAcz47hH2X9gGqqQ8BAbYDt5zpuVyZHTlWLmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PITfEG9DLdaFQ7xOfC99g+LbbnGnOcjaU3Z7VoYLlVk=;
 b=pC3dxNorWNJIq97xW/ewu0RghWlbbWqwnxWQNqtjXYPvaO5DFLqg96w9cgK2y/8eebUV/I3Jic+T5kb7ouJ58Y+pvQxMzBY4x5yUG/su5C6eEbISk7ryNL43/twX53ozXe65XgJVWBcM+Yx0/evGckeMhBNA3vVTRVn6k3ibGCk=
Received: from BY5PR17CA0015.namprd17.prod.outlook.com (2603:10b6:a03:1b8::28)
 by CH3PR12MB7571.namprd12.prod.outlook.com (2603:10b6:610:147::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Thu, 22 Jan
 2026 17:08:44 +0000
Received: from BY1PEPF0001AE18.namprd04.prod.outlook.com
 (2603:10b6:a03:1b8:cafe::de) by BY5PR17CA0015.outlook.office365.com
 (2603:10b6:a03:1b8::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Thu,
 22 Jan 2026 17:08:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF0001AE18.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 22 Jan 2026 17:08:42 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 22 Jan 2026 11:03:38 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 01/10] drm/amdgpu: remove gart_window_lock usage from gmc
 v12_1
Date: Thu, 22 Jan 2026 18:01:58 +0100
Message-ID: <20260122170218.3077-2-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260122170218.3077-1-pierre-eric.pelloux-prayer@amd.com>
References: <20260122170218.3077-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE18:EE_|CH3PR12MB7571:EE_
X-MS-Office365-Filtering-Correlation-Id: 310cbfac-36c6-46e3-65de-08de59d8e50e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WJDOo8NL/mkom194PkvjyQnJjjK8pGR/biSRIu+cAymUbYYONtYmijgZJQRP?=
 =?us-ascii?Q?DwO0MeN3NcBg5mh2s3I8+CYnh/koUEcm01fE41jdDehtV8l5gRk/9HRTk0PC?=
 =?us-ascii?Q?meImF42FHjWJRTDzgSKyrMAqBmj769ZF5Kb3TfTSWoEsejZgfyNosv2dGzhj?=
 =?us-ascii?Q?XJaIEQAQJxm3MzA0Aewse2BoMQ8EG6gU7rcTTJR+sw+Qbmij3ROMctvToYCA?=
 =?us-ascii?Q?nV8AtQYl3G2C4mo8X6znkWXPLu7bNOYd0msGxuc2kGHKdYfn9zon2yhyurRe?=
 =?us-ascii?Q?Ix5KDozSqP15zi3qp4bmzGH3uurDNCMUp38t6olPFtUlB2B/1+fCvcOnxyUV?=
 =?us-ascii?Q?6tPp5SpZ2qMERDpEuPXOcSNWYsVSm2/hHYYn7Cf4u51bIGX7XSEDayb8TYbM?=
 =?us-ascii?Q?Hp1LyaxilA+9X0jB/Z0BXRAB/zrgEAylcLrq86TO5x1ecO0EzkmHeJxqpbjY?=
 =?us-ascii?Q?eaO6GPT30gLf2jsJEDcBUFEXSRsYaDkNYhMxH18t5+4LMLatWs8BpoHaO0BN?=
 =?us-ascii?Q?83gVFONUl/jrKp8mjSai7pVsoP4w+mNa2YGwhVc+XOGyiMNUGXSDNNczZ5Jr?=
 =?us-ascii?Q?uTpENuWVu0KYHr/WkHrFvvT7p1j1Ib9FheR+SWo0LefcuEDl9f6zVzEl0hRI?=
 =?us-ascii?Q?gT1iJy+NBFxPutvQe1nZVlt9MyyxIumLPRbdre3iMTrCJ4mAr8f+kw7erJsn?=
 =?us-ascii?Q?BHMvhooy+f0qs3qpZG3qwZCNDycOpT9V58Uputar+0t30AerikAzCo/dJvX6?=
 =?us-ascii?Q?WHHX2FVcDWxh7niSSCfMRP7sAeJCxm4/CyDntr2BbFf8jwaEBlwKRY2QY6Mk?=
 =?us-ascii?Q?pk0vukUUjdFwaywYyZSBrjTQIBi05lWfPv104gLTk7QRCsREVaVy4cHx85gl?=
 =?us-ascii?Q?YBnWR8kNL6fPgrSTPl2ExV3Afh1kNToIld1zMMgIeaINTU9gK3gV98bGLhH5?=
 =?us-ascii?Q?EF6w+6cUrafMbjDVUsbgu0l80hzOW/pSJ9F6XO8XON9RCkbvUzb3gaRrzBRN?=
 =?us-ascii?Q?KWj1rY2g3XZFjjfcivgT+E0o/aETwOwh4GqcU0XI+ya7mCXgkEyQC4oA7VCv?=
 =?us-ascii?Q?en2ly+C6sXJ93iDpk4xI4Zx04bRchO9FH0aK7DE3kllgBsAEEaR3eY47UDTj?=
 =?us-ascii?Q?B8UTbRo8Ci7h0T2OVFfudxDHFOAgjtKhDmtHvKO2ljCGWel3e5mNnnkGOwt5?=
 =?us-ascii?Q?cC0PsGQR1LzlrlNjnf44MzgGu7wHwK7N7sL8R5xIypjDpeky2mWggtX7ZYM8?=
 =?us-ascii?Q?LLb9GsVnuyFuVtg/QC4I/vOn3aVBKEW9xdzY1WxZlcLXLI8jCfHbedxEUMP8?=
 =?us-ascii?Q?Se1PfAWNvXql938tywGHnWFcqx/n7UomAf07AuptJYFT16HKSHXCmFenNRb0?=
 =?us-ascii?Q?RK9haWsaCue32x+vmT70WC3M9o7dpJJqTtqhjwnIi636dxW7vHuxGf9dq6Yj?=
 =?us-ascii?Q?SMtjB9F3KdEizWqc+PJVUcB/Lnd4aNx0eCzM800pliF6KyB8orBiq+jIhp3M?=
 =?us-ascii?Q?rcpEoVuNutjkbYHULi0LVm0VIf03t/5srKE41WlRa7RZw1I8VpVUhAazY+cb?=
 =?us-ascii?Q?EH2GtjjKKpbNmAoMwUu1LzuyFVWRMkWwtmaK3S1Gt4rBoaoNHqa7TtvHMHyw?=
 =?us-ascii?Q?ZbXCxNpMeLwmU721C8oGKxgCerO+/TuCOp6E3J2jLUq8lUp3NMEy6GMHZWwQ?=
 =?us-ascii?Q?hU23DA=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 17:08:42.2580 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 310cbfac-36c6-46e3-65de-08de59d8e50e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE18.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7571
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[pierre-eric.pelloux-prayer@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email,amd.com:dkim,amd.com:mid]
X-Rspamd-Queue-Id: BDF4E6AD23
X-Rspamd-Action: no action

Same as what was done in commit 904de683fa5f
("drm/amdgpu: remove gart_window_lock usage from gmc v12") for v12.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/gmc_v12_1.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v12_1.c b/drivers/gpu/drm/amd/amdgpu/gmc_v12_1.c
index ef6e550ce7c3..dc8865c5879c 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v12_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v12_1.c
@@ -345,9 +345,7 @@ static void gmc_v12_1_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
 		return;
 	}
 
-	mutex_lock(&adev->mman.gtt_window_lock);
 	gmc_v12_1_flush_vm_hub(adev, vmid, vmhub, 0);
-	mutex_unlock(&adev->mman.gtt_window_lock);
 	return;
 }
 
-- 
2.43.0

