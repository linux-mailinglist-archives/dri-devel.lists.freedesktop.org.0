Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULckJFl+e2kQFAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 16:35:53 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 433C4B18AD
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 16:35:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8405210E895;
	Thu, 29 Jan 2026 15:35:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="y15neRj0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011027.outbound.protection.outlook.com
 [40.93.194.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F388689E36;
 Thu, 29 Jan 2026 15:35:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b2py8k5rVkezxM9imQ54QryQ90kBf9BcTczX8UWehFciURzZAYNSasIvlVVCifqwyJD2WJO3nfOKSgr5t3wMwYernG3doR/ZOas8lQyXSx7q+GYzEQQr+pzSXugcMRXiOyhqi1qi6954aMImQChw0nK0H29EyW6z8+bZVZASqP9nUn3BFAlIUEyS2v2Yb5qIsMUc/6v31N6u0RyYdAIsaAoPi6hj33RmjRZDGKklajONpH5jvvBgfAedEkh4Jvzv33paQ2kKWcJnZKUOeYLuepWhlV16dp/4tNSeMIv/vLN7YffWY++4w65VKAaU09APZ5e0iOLMfW6jMjlDBvh46Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HNOfSUP3K3xPFN22IXdMHjWVj685w9m60mb71zNV+Cc=;
 b=lPXe6LyBWsbypkvnrR2gP2e+menMaGswKEqf77NAXn4S+gu99XRnq17cjNdvchUJoptDQrrEkmB0Qv6js480pQC//B5ijC1gPrAV3ez4aG72uMMCvSU4yXKzjVYfF/DgHsK3JQPY2uUfTtkoTtsqtkC/WxIDJe5XE4t+3QWS/bl7ay5dyn5FDwm9Si/GAKKUvbOoB+p0O3JIW7JDq0/EBBTVpAfrxX7SWmkcHz5DHta+ldVGloHge9Zxl5i4LW4hjfyzb/JZnmRAZBzK7Tr8PWLU5rqwdaBYNWZ8tIoHW5sf5TChMCTOdgWM1UJLcTVnTFSCh2HR82ioiQM1unGM4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HNOfSUP3K3xPFN22IXdMHjWVj685w9m60mb71zNV+Cc=;
 b=y15neRj0U0WOUEIVs6jrIUWSOo3N85I677C5+CgWs4ymCzeWp7/FMX6EXOqp1leY9ri8NhQoE8S47Xq3mBtyoOIvTuSzxPRtypwjb4mVLb2FPLY+hZ0k/E71rdoOB4H1+fVadxcipmBm1BKnZ60f71e68psjkxhnOhQIOwqCC1o=
Received: from BY3PR05CA0045.namprd05.prod.outlook.com (2603:10b6:a03:39b::20)
 by SA1PR12MB7173.namprd12.prod.outlook.com (2603:10b6:806:2b4::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Thu, 29 Jan
 2026 15:35:46 +0000
Received: from CO1PEPF000044F5.namprd05.prod.outlook.com
 (2603:10b6:a03:39b:cafe::b4) by BY3PR05CA0045.outlook.office365.com
 (2603:10b6:a03:39b::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.5 via Frontend Transport; Thu,
 29 Jan 2026 15:35:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000044F5.mail.protection.outlook.com (10.167.241.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 29 Jan 2026 15:35:45 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 29 Jan 2026 09:35:31 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 10/12] drm/amdgpu: double AMDGPU_GTT_MAX_TRANSFER_SIZE
Date: Thu, 29 Jan 2026 16:33:22 +0100
Message-ID: <20260129153336.7473-11-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F5:EE_|SA1PR12MB7173:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f2aed2d-edd3-4ce5-d06c-08de5f4c1231
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d0wvSFJYekNxaDNJVHRiYk83aHphT2N1YjRJVjlVTmFWeHBvbTVDWDgrSUZP?=
 =?utf-8?B?UzF5RzRhZ2JJZ1N4Z1lrNjBuVTVLWG1IaEJzMEVpTHFsY0tqeG5oUUJIbXpq?=
 =?utf-8?B?UXBUZmhEbU9vdnlqWUYwbCtoU1pwTGwvSStBSkJGcDdiOVNUUExET2RSWWpV?=
 =?utf-8?B?U3JVTDU2V0ljdzRMditmeFUvSDdyZWVhQWxWSmJIUG5wSjdMYVFqME1kNWFw?=
 =?utf-8?B?YUc0NXM4UWZ2cjRSaEpuSGZDUTBNS3hCT0RUWlJlR0NnZDd1R2pJczZJR3Bs?=
 =?utf-8?B?YmRYZW1ka24wNFZBelVOejR0bU91Wnd4KzRiNXZmSnk0QXFDWW45VjU2b2Zv?=
 =?utf-8?B?QWhjQ3U4T2RoZmw3V1daY0YrZlFCVktVRkRscnpXM05QWlY1bTk0eTBVeFgy?=
 =?utf-8?B?NVZGODh0M2FoamF0UGhMZ1lwZVZ6dHk0VmZ6eUp0ZndFaWZBSkloUnB6WEor?=
 =?utf-8?B?V080aGJveFAxYnZZSkdKNllYcXVVaXFyLzhPU0dyWnh0aHViZCtFTWNNMks0?=
 =?utf-8?B?VmlLSFV5d3BoOURqUzhoNDlsZVJIOWJpR05zaG5ud09GaXAybG1oU05YdE5w?=
 =?utf-8?B?OForNjVHbzFlcndoSms1K3JBUlFoeFhvTGZRZ0EzVzMwaDdWNXZsaitlWVkv?=
 =?utf-8?B?L3ZmUFhjcEtvb3lIVGFIMTFIN0RZemM1aVZ3Y0hBVWVSMHI2OERPRjRXZng3?=
 =?utf-8?B?dUVDK0JQWVVTSk9kMm03R1A5RHh6WXowZTN1dGQvMmJaazBXUVZ1b2NLV2s1?=
 =?utf-8?B?SVpadXhaeDhMdTRqcnZSaVNLd3VCbVlmY2lIeXVQeUZ2K1dSM0pWZG5qQVhJ?=
 =?utf-8?B?ZzhncEZrTHpIM2VXdHppc2x3SGRBQWI3bFFWUGRzQkpKRGgyRDZnRmtWRHFk?=
 =?utf-8?B?TjF6UHI5L05TNnIrVmRxMHFpck5ZYmpLdHArREErZW5IR2JBeXBFTmRKa2w0?=
 =?utf-8?B?ekxpUFNVMlhoUTE0NlVKQWZsVU1BbE1xdVhmMmZPSXNCTGtoU1IxcWRWU0JE?=
 =?utf-8?B?ck9sMVJBV2tKUmRMTG1xdE9sdXlyM0t4MXgzTlc3UW85dG02Z1NNOXNJMldF?=
 =?utf-8?B?Vjg3MENrMkZ0dG43SDE2eG5iUis2cWdOU0tNK20xNitFUGFYWGRSTE1maC9G?=
 =?utf-8?B?NDgzYVduTlJTQW1KM3lmUUo1UHR1NnZVZlB0ZW54a1hIVldZZ1lPYXN5WXdZ?=
 =?utf-8?B?dzVQdVRYV0hvZnphWHY0VWNxMVdTcEJ6ZEJSaDkyWGxpSzlTdlRCeHRxaVo1?=
 =?utf-8?B?dmhhZHBPanFNWmVZdDFaS1FJKzdjSlUvY016dWNSV0laOUlYdmJYRkhaZ2V6?=
 =?utf-8?B?ZkVycTg1SmNaZjEyUWIxY1ZISm9NRnJHZlY1OGlvL0NZbVpQWThPRVF0c0hW?=
 =?utf-8?B?YVJRc2VtdnhzN1YvRWVKMlgyUVF4ZFNXVlhSbTF4dzFBc3phZ1lvS1lBT1dR?=
 =?utf-8?B?TjdtQVdPM0tlRSszOUpEZzdYcFBoaitlTTFzTTM0V1d2bDc0OVJVenpWQ0pu?=
 =?utf-8?B?d2l3Y1hrZmVVYUpIcjNVUG5jK3lWN0ZoM0dkcUlDLzJ0S01yalNiTVpMT3BQ?=
 =?utf-8?B?bmR6OUU2UVliZW9zS1NXc2tRYnVmdThEanFDY3FaMUNnSHhKSlc1eTFCRkdE?=
 =?utf-8?B?cGRicVdPTURuS1p5UC80dUN4R0Z5RkRROGZLZVRnYk9hQkpHZVlmK3djc0hM?=
 =?utf-8?B?K0xUbk5kaFVCeTZYWUs1Qm8vcVJlK0F2cDJNdU9uK1FMUjRlRllXaWhFTWFk?=
 =?utf-8?B?Yk0yRnZJczFhTzFGUFZBT0VXbjl6NG1vUDdzYk9kUnF1LzcxVXVGNS9kVkI2?=
 =?utf-8?B?UU1BNHJBdGNTSm4vYktBR3g5c2syOWEwYXdETytFM3ROYmI0b01QSWozcEJ6?=
 =?utf-8?B?WHp2S2F6TlMydXhIa2V4U21GSnB3OW9Kdjg2NER5L1pRTzBSQVllYjg5a2NM?=
 =?utf-8?B?a01KbisreHVQR3N1YVE4SVY1eEtESDMzWkZKR1JyTUhjOVJ3STVxOTJua0gy?=
 =?utf-8?B?Sjc3OEI1dFZCKzA2VVE5S1ovSzB4V21PQjh2ZkRCVFVFa1FSb3hIOFhZWTM4?=
 =?utf-8?B?S3BSOEtJcDR5YS9MczFXZjJqM0tKYjJoVWo4ajRWbFVyS2xtLytiOUtIbHcx?=
 =?utf-8?B?ZVpHcEd3d3YwTG9TZlNtNm5zem9WUkkyeWtaK2MvT0swZXhxcUtuby91U3c3?=
 =?utf-8?B?N3JYQkdSL2JYWDBsbGdRalUxOHo0S1c3dmdGcUpYbXJpdW1VZnFUcXRXTy84?=
 =?utf-8?B?R1hDak9qUnlPTSswa0lYRm9UOVdnPT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 1+Kn8AaUg8z2unscoXej0WIGgrT5RHfALc1aTCHZ/FNiMGw3kdQr/yT+emaQ/3zor+Qlg1cfNtZmXNRdgnqAWu1b5AJhfvGZDsFSoMbchtCEDdNm4gbHZWc+yfU6ft4AQ/AjmFZDLYOI+q7TRpWjAAHvdSTJzd0DXGzsHs7QmCPQoCTbf8Vn1ML3q9tCwZRYYle0mM1QJOjodmwC+4J3H5YCS1C3Q19iydtRwsIrJpoMoJij+WNGfHFEQZiNUmdX5yzF1Z9wt55ppJypq/mAddnxlp4j90UivO1C3OG7F4MyFU/Ia9CoFsZRPGI+KH9AVuhFjSUufFQ87Y/dpU2wYedrCM1e59bkQLzmt+Xqy8f6aozOJsXQiDXQMF5vrZ6MtT07+7HGyQ2KxgrXBJ/W9bRsDZVPqCkkoIf1hk435QHcBDlnFvROUMxKDFSMcOr9
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 15:35:45.9269 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f2aed2d-edd3-4ce5-d06c-08de5f4c1231
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7173
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
X-Rspamd-Queue-Id: 433C4B18AD
X-Rspamd-Action: no action

Makes copies/evictions faster when gart windows are required.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index f927b793c395..bf101215757e 100644
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

