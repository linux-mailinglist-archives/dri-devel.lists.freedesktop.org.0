Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WB8/JnQKp2kDcgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 17:21:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4163B1F39E1
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 17:21:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 810D110E850;
	Tue,  3 Mar 2026 16:21:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Yeb7piwF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012028.outbound.protection.outlook.com [52.101.48.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BC0610E84F;
 Tue,  3 Mar 2026 16:21:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=myjWHltR6qPu3iA/MgJc5CLrOubCwCtM5LG+xSV6bd9/EmYslED53e4Bh5SDoJOqA1E48eRfxtC8fZYEPbVmwe3sIo1Bok/wJDKlcBmE4mdJJlu9zvcVu28auLikXKq3gWGj7SVzrWBiBhLNOQm4jqZw096z7HHBHmgfkBRMeJQjRV2t+NDHB23arU5CdJ8VBRaG4eTqiGDFDLUx/6bVn+iy/SWTJj0trZiNoyKqC0FDmLapCa3OiiaRo3PM0CpB31jbXTfpxKO5qCtnuC+g+dASuW+lfkvL8frFwCAYgy56yf6GOpl/6gauHYP9cbccVHJryDyvpWdhYTunc+75bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xm84kqhe/POZRyz2Pjz8cOFd1GoG8iAMouLb/n2A9wg=;
 b=kXNuHrlRl+bwJdk9p0Q8HgR2gJ+aAtbtzC+12BccVaC0VQGJc+ojZfUTUir0VYEGbuV6zdcceC6Nh7INpg/77yVF7aqKUkK6kiWjYr0Tp4VaNq8XH8aKDVSke84JRfDi48LzO94MV9DVpNrLLNjSVzMz2Qswq5PSTfhEZA0k1YN9gmWJG0AoPFctudxXVt1VEUqOwHc99gF9xF9nwHjPL+49JrwdgeUiD30X7ekGgQC7oDjfqSZ0GNInAhfGKDARXocmxJcU6aAJpFQoJngea1a9iAWC6hfff62Ll99/fFi4ci/pxjmMbZPIHC2cOCLpyNygfM9lSgyVkQYMdjNr0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xm84kqhe/POZRyz2Pjz8cOFd1GoG8iAMouLb/n2A9wg=;
 b=Yeb7piwFZmnEQs6W8bn/7Mz3G+59DeJqPvhPr5M3BAng5WkIa7mOZ4ZU4jrYENxoo/ZPNYBvjMBqnWgFHHF2SVVmA04pGLEgdXY4+eAEB3hyVLvkqXGdB3qLgczzX3praRk8W6RyVBRN1WiUV/Tl7OYTDSyLdzCEB6CFkozTyVQ=
Received: from PH1PEPF000132F4.NAMP220.PROD.OUTLOOK.COM (2603:10b6:518:1::39)
 by PH8PR12MB8432.namprd12.prod.outlook.com (2603:10b6:510:25b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Tue, 3 Mar
 2026 16:21:01 +0000
Received: from SN1PEPF0002BA4D.namprd03.prod.outlook.com
 (2a01:111:f403:f90e::3) by PH1PEPF000132F4.outlook.office365.com
 (2603:1036:903:47::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.21 via Frontend Transport; Tue,
 3 Mar 2026 16:21:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF0002BA4D.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Tue, 3 Mar 2026 16:21:00 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 3 Mar 2026 10:20:58 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Kees Cook
 <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-hardening@vger.kernel.org>
Subject: [PATCH v3 5/6] drm/amdgpu: store ib info for devcoredump
Date: Tue, 3 Mar 2026 17:18:18 +0100
Message-ID: <20260303161824.7765-5-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260303161824.7765-1-pierre-eric.pelloux-prayer@amd.com>
References: <20260303161824.7765-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4D:EE_|PH8PR12MB8432:EE_
X-MS-Office365-Filtering-Correlation-Id: b6f853dc-0ecf-47f3-1021-08de7940dba5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: kUpJSsAg+lVUN73Z8Cb3AXk7mwdRXuSy00tioks/5Y+l7EdyqTWFJN0u+zIQTaXrNsaWMtDeuTgTDkcT+Kl0v3pKH07eG6Fw6l1VtnYXzI1y/7XOq3C9u1fdfyUAlIoAnIBhlDt9O5Is6GC51a2IxJendZWE26oV+/HmPlGnADdc5aTy33wno8PQdh73p4Om7YzEwEfEKlPlx6DRP0RVzPTAbdMAXIuyI3Nhs5hIaDV6qlS77jDw5qsClOlOHYPBv9Vl2a2oi66SlaB8zwH3Hx6OvKguvwVN/mY3FshhLqtiW/9zPgDXxPM6oUAJIp6acKv3FefvImo+EQY7ZIZk5gXYFMKiYwUdSxLk8+mOO+Vhd3QibDaI70WyWaoGYepcW3q2TXQWa6cIuykLbfVPtMtCvZ3sYm5ZS4fT0RnN/ap5DcMQepqZx7uWNNWS2VYkvvyHW9K4Stw722VzoMrDQyGEMcsKvlUIURVkmYkep9VOdU7oLjkFXa1oYg72ZRHpNJM5V+6aNXDgLHO0+hgA+6WJaKlY/x2r/qiDrzuEik4gbjSAH8qFqs4wqW2xotRI60pcvkl297JweemfrUYeKpt81Rnd7kPjHFcSKTgT5CkrhS3fpmSHpWRxOAMAjuBHMAWvFd6Ixm5k0dt4itikTcyKGwHyxUBf7LKN67xZ8509AKVfL+Naji3t6pfN8VDyE+UyGhNV/TOPwuFrMiYkA1T2lzn8EuK5l6iDR+3+zA6F3MXPLYnFHkrxJm1SfacUDXK9HdlfBN7DzPs/KEBIisZFdnbVp8pYX0y/853byxp84rMjSdg02M3i6IlqR5+FTm1nEPSToUT9h5ZSXLD5yg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: k5IqqTWy6LxKoS22gnqpSGeb4ZKDzS54aiJV/3+70Ga9+iT6CMaOEeVZ/cVWaSTKHY2N4qUWsPKAMNcpcAM9/erxw3afJdUe7ltayi81Qimdrvwhs9gD2eeJQf1ziLc31Ati05pEq+fyKusTY6xTTAGQFYOf6MOTeQrmYhuAZk7CJycP/gZF0NvzaoIW3/79k47RMGrS5ZgLMH4qfpqzZRWImJNmZURs76Czhq1NwJ5rNx6xMC5TqNhjsvtYaGKLBFtmWTG9mpBNo6v63E0eCTGNv6VIW4Nh+KilKTig57SZy0hRMWxvtUTuWvr/iN8bYH/+2y0Q31A4mk0nzZie4y4Z1v7+ZUTj5PDSLHa2B+ryAMZTxPgbZDcFChSLEiHXegIzw8mxA47cpYaIVrJICBLQpj8wH46GgqzNh7Sd5XUPc2MHLdk6yfSWrp3Za4vw
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 16:21:00.2434 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6f853dc-0ecf-47f3-1021-08de7940dba5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA4D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB8432
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
X-Rspamd-Queue-Id: 4163B1F39E1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[pierre-eric.pelloux-prayer@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Store the basic state of IBs so we can read it back in the
amdgpu_devcoredump_format function.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c | 12 +++++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h |  9 +++++++++
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
index 58b2e764dd7c..82814646695d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
@@ -395,6 +395,7 @@ void amdgpu_coredump(struct amdgpu_device *adev, bool skip_vram_check,
 {
 	struct drm_device *dev = adev_to_drm(adev);
 	struct amdgpu_coredump_info *coredump;
+	size_t size = sizeof(*coredump);
 	struct drm_sched_job *s_job;
 	u64 total_ring_size, ring_count;
 	struct amdgpu_ring *ring;
@@ -404,12 +405,16 @@ void amdgpu_coredump(struct amdgpu_device *adev, bool skip_vram_check,
 	if (work_pending(&adev->coredump_work))
 		return;
 
-	coredump = kzalloc(sizeof(*coredump), GFP_NOWAIT);
+	if (job && job->pasid)
+		size += sizeof(struct amdgpu_coredump_ib_info) * job->num_ibs;
+
+	coredump = kzalloc(size, GFP_NOWAIT);
 	if (!coredump)
 		return;
 
 	coredump->skip_vram_check = skip_vram_check;
 	coredump->reset_vram_lost = vram_lost;
+	coredump->pasid = job->pasid;
 
 	if (job && job->pasid) {
 		struct amdgpu_task_info *ti;
@@ -419,6 +424,11 @@ void amdgpu_coredump(struct amdgpu_device *adev, bool skip_vram_check,
 			coredump->reset_task_info = *ti;
 			amdgpu_vm_put_task_info(ti);
 		}
+		coredump->num_ibs = job->num_ibs;
+		for (i = 0; i < job->num_ibs; ++i) {
+			coredump->ibs[i].gpu_addr = job->ibs[i].gpu_addr;
+			coredump->ibs[i].ib_size_dw = job->ibs[i].length_dw;
+		}
 	}
 
 	if (job) {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h
index 5d6c58abf589..cdcdde39f88a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h
@@ -38,6 +38,11 @@ struct amdgpu_coredump_ring {
 	u32				offset;
 };
 
+struct amdgpu_coredump_ib_info {
+	uint64_t			gpu_addr;
+	u32				ib_size_dw;
+};
+
 struct amdgpu_coredump_info {
 	struct amdgpu_device            *adev;
 	struct amdgpu_task_info         reset_task_info;
@@ -56,6 +61,10 @@ struct amdgpu_coredump_info {
 	 */
 	ssize_t				formatted_size;
 	char				*formatted;
+
+	unsigned int			pasid;
+	int				num_ibs;
+	struct amdgpu_coredump_ib_info	ibs[] __counted_by(num_ibs);
 };
 #endif
 
-- 
2.43.0

