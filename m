Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A18C9AF2B
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 10:50:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66F2A10E5D5;
	Tue,  2 Dec 2025 09:50:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="brxmFC89";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010027.outbound.protection.outlook.com [52.101.61.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8114310E5D5;
 Tue,  2 Dec 2025 09:50:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kvs3JkzCfiI2S1F66VGA0tobJ9pMsvEe/M3mKo+x3qzsWDH4QUKOV/kt6anMxH0xvCfnTKb5iFrEJZvvD4zRFXMKi06VyxzWSu6v4W2B/y+8cB9nK4WOEl19WJFERnkaHV+BXMJOtkDG5B5Rcfk17xCaRqGOpDnQ+NDpfCeoFWWAD0p7VukLscj5k6H2CMp3DyAfO1JkpXFVhqqLduly/noP/Eyn4/S5hVfs/J63eoYFVGYj/xVx+HIpKKlnYBIDqyPv+xhCACPoRYvibTcsrgo6pTePVwcZaDQEag/7DZJcZhMvHO38TOoe1YGFzPC7wc32lNFaWK5vvFzVKnCuOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qw/8DXRht84+6yYu4XZkFqc4C7ZMrxKX01yCotpIkuo=;
 b=bztjYeiBFZOYMksnRWOZaNqmE30AZfH2/7C9R5i2ss/mK6TXvVVV8ptMLFVX9ETLZ1vnHsvk/Aw/GYCY+LHIxJi7X6SiDv5JO99MeiheMDvJnKPg/C0j9UUCTET7ST+U4aIHZSZFx9M+WRc1qzMoCr/OmRwYdl8+2S8mcpDKmUv8zFxqYxubcFokwpLXaCYIw2vu973XZtB0MlSdhTFQbah2HTDk2wOaJEju2IujpXyOEvrVMHlt2pD6PTsQgXznjes2PSWkw62BUW6nwcyenW7P3NQFktePQ8FgyUH9hcCEHfTz2w9q3+5Wzsy4N6nMdFzwOXqxcfLxlgiIpLu+kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qw/8DXRht84+6yYu4XZkFqc4C7ZMrxKX01yCotpIkuo=;
 b=brxmFC8900PZ7rm2uxmsZ1XjatJkshsQjtFRSB6XOcHawOV3sBlw9mjQh3N3bpgtwysgPpQzEzpIO1x6ykGNMs4Yut28YhLj8bsOlp5irxG7Adq+BM45LwKpeISZrIYarqn3uWfjy7KWglvQUcCs/eeE0joRrGXbnkUXiyBNQlQ=
Received: from MW4PR03CA0212.namprd03.prod.outlook.com (2603:10b6:303:b9::7)
 by MN0PR12MB5859.namprd12.prod.outlook.com (2603:10b6:208:37a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 09:50:06 +0000
Received: from MWH0EPF000A6734.namprd04.prod.outlook.com
 (2603:10b6:303:b9:cafe::fe) by MW4PR03CA0212.outlook.office365.com
 (2603:10b6:303:b9::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Tue,
 2 Dec 2025 09:50:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000A6734.mail.protection.outlook.com (10.167.249.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Tue, 2 Dec 2025 09:50:05 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Dec 2025 03:49:55 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 03/13] drm/amdgpu: fix error handling in amdgpu_copy_buffer
Date: Tue, 2 Dec 2025 10:47:13 +0100
Message-ID: <20251202094738.15614-4-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251202094738.15614-1-pierre-eric.pelloux-prayer@amd.com>
References: <20251202094738.15614-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6734:EE_|MN0PR12MB5859:EE_
X-MS-Office365-Filtering-Correlation-Id: 9eb71296-3126-4cfd-fe38-08de31882c3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+q8WJdon3BuVYdk+6lfuf2uuXUWWZAS5uhXZewt0Iq0VHUokPohyqwUxWiCe?=
 =?us-ascii?Q?fbtJ8IF5R4CxYoUeuH/okpKQ1sSkc7GUqOFWTDr3kI8H3w/S8taGymi8lfBJ?=
 =?us-ascii?Q?q4GFLVAuoBYp8YrovoOzd2TwoblbT72F1Ih4nyBF636M/L3VsAeJRncu0TPE?=
 =?us-ascii?Q?ZSLCOitzcTqC1bZjKWjh3U7CXS9yDpLjd+ZCxrUNfzqIFZVS5P+CgBcEXFEW?=
 =?us-ascii?Q?dDN19AkQiNqddUcQVutj80zA9RO0P8vZdCsLVqpQFMXHPpAmhQ3lGppz59N/?=
 =?us-ascii?Q?NnQp3MH8JzODp1citczUSUCqkyRilXDQPXuHEzUEjx9Cv9v8CfpwBOtbFNIe?=
 =?us-ascii?Q?wFfn3W/PyTWApTJISH921EQIRUrQ0fTS83nYcqoY2sDZ7Rt13WWf6MjB2yN2?=
 =?us-ascii?Q?591nSuKilk1LspzGaFO8M+0UA7WKkwnfN1aNB0dAf0mNJjoiKdPlTq6NoElh?=
 =?us-ascii?Q?wfDfPkdnhePNYq0O92LddL2tmANw1MKLIZWCBzQ9KVmvA/J6ECot5+BonDPO?=
 =?us-ascii?Q?6fXBb2ndkYv7Z9gZhQD12JLXLtmvOj0JUpz2MKvBr6ac7lqt9VOCpfG71MBZ?=
 =?us-ascii?Q?RDJduazf1mL7+8uU2EI7sKPguXyGNhExLbppI22058IuOeeXfxoODnki8Tyn?=
 =?us-ascii?Q?nvpSw+JjPVpJogGFEtDMkEU4kKBJFd1uxLsNkhCsryymMei3XC9NxK38ZDMj?=
 =?us-ascii?Q?okXcn338/o/cUYxGnIUalx8z6dq5Vji2Tul+jCH1+Zrj0wWdOw+G4TGiIe3r?=
 =?us-ascii?Q?gn4YJTyGId6YHYyMIhnzprSMgbwENfrz6fuAJA3FWdbr/NcvyTEiSmjhetfe?=
 =?us-ascii?Q?CRYPbKDPI8crk8YNi6s6fBcq/bSnTmgrqz5GuUZmSI43bseMoDqexuMF1ceD?=
 =?us-ascii?Q?jSlR6/mwuiWTqENhZYB2kDMQmKDJ+meyiBRLu/QcJzUTHLlqM4X0UTT3NkKp?=
 =?us-ascii?Q?QCFrvJyBsyi6ksNRzpdEjDlXORWrmhw1kYjMztfiRMJReM1k+yvAOsixBej4?=
 =?us-ascii?Q?HqBrzHRFRDsp0tOWQvU2ezPyExaRM0VGewNHWMQjhUO7diCbQEtnOGXVvpSb?=
 =?us-ascii?Q?n4dJicgO66bG7BwYp/JKewp8EmDX+DkBzkOCMtvbg7PAMRuv6v/n5Gr6zk32?=
 =?us-ascii?Q?xWjwFzPdoKZubmYpYKbocRhdmSb/FrpbUzTDFI4zSJ94ptBrK7AbGWpURGzZ?=
 =?us-ascii?Q?BvphjXv1F70mCWnU0rlWdpxpBgoeflHf1Fhm05Mr+Nw5QEPI7LQdq1x+Phog?=
 =?us-ascii?Q?3RQvZC4AydUaKQ48OdTP7d2DjKc2khg2tMsTRFYiex6U7Ow4pvkW9yYGUdnv?=
 =?us-ascii?Q?Cx8ZiGDpX6e+pdSTY67AePVafBY0ogv6V484nwiq2+Qg+MRKFdeu6XKCmzDm?=
 =?us-ascii?Q?Wm5XhSjz5uuROIIWobCAr8BTnlW3QANbvgC+/i2NE8Uo39eVyF7HjMmAJak7?=
 =?us-ascii?Q?/Qlj90+ikyDI2k1RbZ6u7teTwFhCL4i45UabLeeyH5rCuFCHqhsJKFaTWmOj?=
 =?us-ascii?Q?naDbbqWROcbf4R73PtxfVs93Lwr2cS+azNq2z7BAGOJHR+qZpeohS30AjV6+?=
 =?us-ascii?Q?rGw/O6Vk7xW2osLps0g=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 09:50:05.9370 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9eb71296-3126-4cfd-fe38-08de31882c3c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A6734.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5859
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

drm_sched_job_add_resv_dependencies can fail in amdgpu_ttm_prepare_job.
In this case we need to use amdgpu_job_free to release memory.

---
v4: moved job pointer clearing to a different patchset
---

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index ae3ad19667df..6e8b6fd94378 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -2278,7 +2278,7 @@ int amdgpu_copy_buffer(struct amdgpu_device *adev, uint64_t src_offset,
 				   resv, vm_needs_flush, &job, false,
 				   AMDGPU_KERNEL_JOB_ID_TTM_COPY_BUFFER);
 	if (r)
-		return r;
+		goto error_free;
 
 	for (i = 0; i < num_loops; i++) {
 		uint32_t cur_size_in_bytes = min(byte_count, max_bytes);
@@ -2290,11 +2290,9 @@ int amdgpu_copy_buffer(struct amdgpu_device *adev, uint64_t src_offset,
 		byte_count -= cur_size_in_bytes;
 	}
 
-	if (r)
-		goto error_free;
 	*fence = amdgpu_ttm_job_submit(adev, job, num_dw);
 
-	return r;
+	return 0;
 
 error_free:
 	amdgpu_job_free(job);
-- 
2.43.0

