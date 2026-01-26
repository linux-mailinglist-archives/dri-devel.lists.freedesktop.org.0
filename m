Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +PNRIVVud2nCfQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 14:38:29 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDA288F10
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 14:38:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C79A10E435;
	Mon, 26 Jan 2026 13:38:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="n310izjd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010020.outbound.protection.outlook.com
 [52.101.193.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AEBE10E442;
 Mon, 26 Jan 2026 13:38:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZoxWD9axhb5cOM3yLJcPIx56AgWn9xLLLx+cjHZC8lXhZQJpRd/9oymAHsUaATtLyeqTw+T6hBWqyZEF+z4VtCqEmcgBGnr0D8po9VLTu0vVvYjENl+rbtWER/Lg0tfViDLAv7N+P03sdsk3ahqX9AfThv1YPWBn5GaABDy7EU5E+cv4tyJysH/59iMu22eqB1geMRjEXQy+53ONSZwzJOcMuuw+J1ond2ZB3dvwdiF/gZnDW7YaW5WEqRKCUtEWrfTh7rO4y51yaFD62g6phsxtJZyWThsxtNlnoCresmu2J4rD3r1otDskBmCG8WDoWZYnNVuAyrOpz3ZrfdCU2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yyVr4cDVSa8ix4RsK54vhrXRNmqbYglsNhaJlOSLL7g=;
 b=V89PqwU3YxXP74dxQUQashw+DPrVl791pL2Rzam82Vk7phZGTW8+l9IJ3BuveClDKaJ9RpjuttPvdCrFuTp0XYQRp/sBZM87OMKLCyHdshRti2qsmnweE8t+EN9gxw5wszsGvd/Z6BZ2H2UGLQo5d61lTYddnfp5b1nMCGHSN2YH5/WP58qxRB9Nxpsv4xbSsEdubUcRKhKN9QGoZXLUdknKwG/YQ1PLI07lRjiAdBxusPrtMEK65QF1Mi5pP6bxVJAAOt0UJfNrC0x5UaBzhj86RNtyXAOyMmdza8TbLJS6jq7oBQ0HNSyqDpUieBBAfudoiQ+grfFrjToWm76bsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yyVr4cDVSa8ix4RsK54vhrXRNmqbYglsNhaJlOSLL7g=;
 b=n310izjdoqfiQz073xOl8+07aUCbb5tDRHmFO/SXdG5ZsIUDXROFL1bNrkrs7bEVe0Zi73o35Mhk5LHHYQIBs0Zs0tDWeMqInfq7OES6tnavxEgBuuG66HJwuNoO8d81qs3iA/u4I80PMviPWfvHIU2Zvlj0/cYwMM7dHJefVV0=
Received: from SJ2PR07CA0015.namprd07.prod.outlook.com (2603:10b6:a03:505::28)
 by MW3PR12MB4393.namprd12.prod.outlook.com (2603:10b6:303:2c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 13:38:20 +0000
Received: from SJ1PEPF000023CC.namprd02.prod.outlook.com
 (2603:10b6:a03:505:cafe::d9) by SJ2PR07CA0015.outlook.office365.com
 (2603:10b6:a03:505::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.16 via Frontend Transport; Mon,
 26 Jan 2026 13:38:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF000023CC.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Mon, 26 Jan 2026 13:38:20 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 26 Jan
 2026 07:37:58 -0600
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb09.amd.com (10.181.42.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 26 Jan 2026 05:37:19 -0800
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 09/11] drm/amdgpu: double AMDGPU_GTT_MAX_TRANSFER_SIZE
Date: Mon, 26 Jan 2026 14:35:04 +0100
Message-ID: <20260126133518.2486-10-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260126133518.2486-1-pierre-eric.pelloux-prayer@amd.com>
References: <20260126133518.2486-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CC:EE_|MW3PR12MB4393:EE_
X-MS-Office365-Filtering-Correlation-Id: 2899c850-5d7b-4205-9a7b-08de5ce02ba2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S3AvRXMzNU95QTQySHIzeE1kR2RJd1pqajdQdzJxT1NYT28yRmxzTCtINTRn?=
 =?utf-8?B?YVlHUzB3OFNoRElXblE5dXVDS29SMjViVmE0OE90WmFZZFExbnUrK1p2TVZJ?=
 =?utf-8?B?dkFSczE1Z0FwcWw2WUVvVDE3UU5kQTBBWVJYRnQvREw4NWZyVUdNRXB6bEdK?=
 =?utf-8?B?SldKS2xKdXI1b0JEYTlxanZGdUNlWGpwQ2xBY3FLeU1OQVRlbXZvNlMrc1Fu?=
 =?utf-8?B?MGxENDdZd3p5dWovSWw3TWczK3RnQ3hLbFdTZjNVVlQrY1RlN25CYVB5TVBP?=
 =?utf-8?B?TW0vcUhvTDMwSENCSldlMTVRUGJZM2dnanhWMGlITlNnRWdJSlAxUDhtRXV6?=
 =?utf-8?B?TmVDSWlVNnJ3cVpXZTRubWNzSVRldFI5amFORG9DV0VKQlVXYys1aHk1RG1z?=
 =?utf-8?B?WmlXZGZrd2tBS01zblN1dUkzckkzT0I3SFo3Z281ZEpnaERvYy9ZbkxGZGlh?=
 =?utf-8?B?Zjh0MWFwb2c1NzcyQ2Uva3ZFN09lUk5NVzZNL2hLQkJTZUF6RTFOYklFSHFV?=
 =?utf-8?B?NUJNNXdZL21NWUlvenVXNU9saHVHVDQ0czBLdVppUDRsS1hYV2c2elNwMGtj?=
 =?utf-8?B?TnhHbHBGZGR3eklxTW9xdzE1NGpFemg3ejZ6cjRSZ0lnV2Zyb1pieTVQRVh4?=
 =?utf-8?B?VGtVT2NsWWVCdFZ1QjF1bUZmMXh6TUZhbXlzYlAvVVVSTWwzRTNFd1dLZGxT?=
 =?utf-8?B?L2RmL3NTa2VYM3B0UFRYUDNwWlpNcHJiZHkxZjNLdUQ0UHhLdlFUazBVRThN?=
 =?utf-8?B?Mzc0TFFrTndpa2xPVnZWRno4TU9EbHNxS0V1K3ZrV0d0VkRKbnJybG5hbXNn?=
 =?utf-8?B?QWhZaEZpQzk1QkNId0VrcEtuWkFaWmZlSmFlSVVCWEtoZ1NtUDByMEF0Rzdt?=
 =?utf-8?B?NWJGUXl6bWVUMjg4Q0E5ODlhT0EzMUpoWmlPSWwyWiszcVh4WVIvOVJKdlE4?=
 =?utf-8?B?YVRNVXFkcDhabWFqRTJZUXVzMk1IQVZ3Z0hybVhSOEQ1R1hhRlVWVjc4SHEw?=
 =?utf-8?B?emk1eHZsYmgvWWFFZk4wVVl4SVZhT3RXV01OOWpXNE5sNjlYNStMQ0tzT0Iv?=
 =?utf-8?B?K05pMVhMdkZ1S2hYMUhSZTBndVpIVDBiZnZGdDJuaGZkSTRFQ3FIa2VzZ1ly?=
 =?utf-8?B?V0V5cHB0ckFvYUZzQllNeTVhdUlxNFNUek1PRFVDVTVkTVFIdExCSG5jN1dR?=
 =?utf-8?B?VFliOE84S1duUUNpUWlVQW5RcndLOG5ua21GMzBpK0F5dHpxenRKRU5lNzla?=
 =?utf-8?B?Lzl6Q0lMcEkzdWY5TmgvNDgzS1I3VzRPaU40L0d4cnEwYTdEQkFabVZJbWR6?=
 =?utf-8?B?TmRjNTJzdndDcGQzdFlGeVVHSVdmMk1ydisvYmowNXdNc0wrMEZlR3Jabjhj?=
 =?utf-8?B?Ym1SUXhPczdqU0FiNTg5RWU3RXhPVUJUNlBURkgyVDVMSkdqNU10UDVydFhs?=
 =?utf-8?B?OG1qUmg2Mk10SGduUUNoaTZYdGZsVXREeWVUZ0xDMjJWTUlnYS9WTUpqQ0px?=
 =?utf-8?B?VkJodVo3dXMwaGlYVjM1aGVqU2k1M2hLeEZnaGs0dTZhbUh3OFJIWDRHV3hn?=
 =?utf-8?B?dDZMb1pjbHRPZXhQTHRNcGRpYkJ2TVNMdW8xbEtSekNxVkx1L2JMNUJtYkty?=
 =?utf-8?B?RnFWYlJWZEp4REI5VkFOZTdJQXNyS0RBYlh5NWlWRDBhV29pVS9laktQdW04?=
 =?utf-8?B?UGYwYTlKS2ZUSTdybVBDKy9wTVAwdnloZC9pK3lndGl6S2c1QmFKVTIvUCtk?=
 =?utf-8?B?L3psbEV2Qk5pYWx0YnkxQk1SaHljMm8ydCtqZEsvN2w2aXVnNTdqWDVLWXJl?=
 =?utf-8?B?eTAzQ1dORDIwWS9Ud1duRXQzQWwxOXg0QkRSVWdLc282S1dlVkgrQlFmT0hU?=
 =?utf-8?B?MUpxZEY3N2lBbStQY1VrNzNhbkttMVAzUERLTmozMVhyU0NtcnZKU1kzUlgz?=
 =?utf-8?B?VCs4dFgxeENQaTQ0dzlseUJOSzRRZlhSOThZN21UZ1BzbVZvclovR2N6U2Ft?=
 =?utf-8?B?L2p3NXpIbzhOT21WQll3SWhRbGtPTHdFd0ZjVUkxWWRHS2Q2N01QeDdLeU8w?=
 =?utf-8?B?TGFndXBuQjRRanpreUVCMXVKL08vczRMSTBkZTBmRlZEbUUxc21UUXppOHRJ?=
 =?utf-8?B?TnRUdzMzMFRiVXpqZk54Y0FEcWQrd0JrNzFsMHhINkZMSk1lL3hveDlIUzR2?=
 =?utf-8?B?Tm9La1NWOFJzSXp2enp5cFFnS3ZpU1VjZGZITnplcTJGMFh5ZzlXdDQ5Yjg2?=
 =?utf-8?B?Ulk1TUg1REFOTXFTcUJSdXphM0JnPT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 13:38:20.6952 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2899c850-5d7b-4205-9a7b-08de5ce02ba2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023CC.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4393
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pierre-eric.pelloux-prayer@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0CDA288F10
X-Rspamd-Action: no action

Makes copies/evictions faster when gart windows are required.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index c8284cb2d22c..6fce4bc10faf 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -39,7 +39,7 @@
 #define AMDGPU_PL_MMIO_REMAP	(TTM_PL_PRIV + 5)
 #define __AMDGPU_PL_NUM	(TTM_PL_PRIV + 6)
 
-#define AMDGPU_GTT_MAX_TRANSFER_SIZE	512
+#define AMDGPU_GTT_MAX_TRANSFER_SIZE	1024
 
 extern const struct attribute_group amdgpu_vram_mgr_attr_group;
 extern const struct attribute_group amdgpu_gtt_mgr_attr_group;
-- 
2.43.0

