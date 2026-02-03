Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8IR3GMbNgWl1JwMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 11:28:22 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12206D7A37
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 11:28:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EB4B10E5FF;
	Tue,  3 Feb 2026 10:28:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="nU7NF+ie";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010024.outbound.protection.outlook.com [52.101.61.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E690610E5FD;
 Tue,  3 Feb 2026 10:28:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KrWWRRgxYjyJ3frQrqWYQAMwgh+MujF4GUXesYgzrZDWh1qyX608Im99Tq6eB1cVHkyxZnXHIWLPUAj0cTjHPm4jJMlQu/fY+xM4pUAL+uH6vC46oUPhIXDGIgR9KH/0xq2DpUH0l+9pa/nsZpwZpOEvvDCZcB7MIqLyUEjcsgppl9oUrcnxGeQv53xskthzmaEKyBGkS1fMYP6BMs4cUHLdXfgDLQ6EH1YFY3SnS0bPVPFGXj33mLQiRfIjsBhoyQDlcepe1Chom0ejBZn8hTZTm7VgjFuJ0+ooPUhfrmR4Hj6SbF9m4ffKqb1+hTNQwdwArCp4Ni1bQvodgyyc5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=byQwypPfXyOc4LpI25G8S4bIf4Nv5YTsDT18p2N8/jI=;
 b=yqOd0kRL+6j6kGNreMO0OEhWGqam4HX/tGAsnSpA6c/odzn7G36NOCbuci1n4T8U2nKJLHINUUENMafHKjPuU/NaD6dSk7tbTpfjET02Q1tOVcRTanqQuTDKE3BnnuYp2//0TIFtgLZV4tDCb1zyEGcZbq7/v0Z24AQ0Di8YRwvteyjNK0Szec+CrOhlGd9YIA7vS2D8hCloQJXNmmByjG1qEOahgy6dJVVeY1tH7nxi29SmQiA8Z4rmT+ibkTXtAC2q1HIGETgMMaBtqrpiOIASzcmE8MNrv6BRqy095B6r9HOK3/FqsOEiDAR7ttGB6dRj1pd3A6nCXoXPnrKFLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=byQwypPfXyOc4LpI25G8S4bIf4Nv5YTsDT18p2N8/jI=;
 b=nU7NF+iet+Jtq1Yk5c7WnG7GYT3rm3aJY0OvzSvQExCvnLJ6iF/c83kX/Gk3CRAgFLTz63NTfmZJJVAfFLthrI6eIcR5rxkQQ0/LRqz4RJ7WjpwR63ts8wlgNdK7av+IQTLNehsPyONz241H8InIEyoYMqo+CvkBDjzrrzEu52U=
Received: from SJ0PR13CA0181.namprd13.prod.outlook.com (2603:10b6:a03:2c3::6)
 by DM4PR12MB7549.namprd12.prod.outlook.com (2603:10b6:8:10f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Tue, 3 Feb
 2026 10:28:13 +0000
Received: from SJ5PEPF000001D0.namprd05.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::7a) by SJ0PR13CA0181.outlook.office365.com
 (2603:10b6:a03:2c3::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Tue,
 3 Feb 2026 10:28:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001D0.mail.protection.outlook.com (10.167.242.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 10:28:12 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 3 Feb 2026 04:28:10 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 12/12] drm/amdgpu: split amdgpu_ttm_set_buffer_funcs_status
 in 2 funcs
Date: Tue, 3 Feb 2026 11:22:19 +0100
Message-ID: <20260203102236.3456-13-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D0:EE_|DM4PR12MB7549:EE_
X-MS-Office365-Filtering-Correlation-Id: 448bea07-202f-421b-2a95-08de630eef44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S0VMRHF6YjdzZmVBYTNuanFNY21QbFhIeTZZK2ZISytWZitkL2ZsaUVIc05S?=
 =?utf-8?B?SDUwOTFPTHNmQ3QxQ0h6c1RldDJ3REcvcGU1SXBVS0dFSjNPckVjOUQ5SVVw?=
 =?utf-8?B?L0x2cHl6d25LMDZia1ZndW9kUy9teXJobm9yRm9jaWlkQkhNVWNLOWpVajZs?=
 =?utf-8?B?Z1VsZ3NZM0ozaUxja0JteDF6azRLeDJxa3NRQlIvYUNxMmpiekNoMUw4QTU3?=
 =?utf-8?B?TEpOSE16VFdrVWF1b2lyQjhvcFhUWm5XdGJFUjVKeTZVSkgrVDArdGN6TXJ1?=
 =?utf-8?B?WThleHFLY29TbVdHelU5WEJURWVLWXJ2MEUzR3FjdDhya3dTYktYWkhXMVhK?=
 =?utf-8?B?dTh3WjcrTncvNVM1Z3Nrb2xaRXFidC9qM01CV0V1MlFBajc0cjNTQU1uRTlD?=
 =?utf-8?B?YTdTS3ROSzF5MjJOSFkyU1VqRFU5dUlmSUcweUtNMzFRVmtXek8yUDdlckdl?=
 =?utf-8?B?VDE0ZTIwR1NMWXAzQ203bEV6SlVTbElySFBic0NxTm1ucVF5VE5ocWhMSUg1?=
 =?utf-8?B?Q0RTdS9lQ0tGRjBKRU1GOGhVOFY5RG03TEE3MUhVaUVmUW14K0hvSUJmRGNN?=
 =?utf-8?B?OHVCeXpaRVNOSkFDbGNETlJoSHZFNWF2Ukxxa0JDekMycHBvTUpGYkpwNUxU?=
 =?utf-8?B?N1JLZnM0WGtZN2c4NUxsR2RXWmYxc0hKaEdZSW5XN1F0b1lXeUZ3VWlFOUEv?=
 =?utf-8?B?K21Zc0R5ZGxDMGZMS3BMMEVmd2dyZGJLRmFqTXVKUUdlMlZPekIwQ3lBSGVK?=
 =?utf-8?B?b3ZZUWlaWUFNUGNNU2Q4QWpWWFdoVWlLc1hyK0tlUEpCTEtXQy91dlcvcW8z?=
 =?utf-8?B?WTVkUXhTNnY5UUR2SHR0blV2RXNscXNyTTFxeXBoaDdVall6c1lUQlM2UXhD?=
 =?utf-8?B?cFFGWE1JczNKNkt3Zk1LNVhzSVRrcVh4bk1mSVFSMGxnemxCQ2p2YnlSc3Ur?=
 =?utf-8?B?TGM5OGNTVFJrQlRQcEErdkcvbmorRElHaGJvZUkyRDBqcVRFS3oyV1pZdkZ2?=
 =?utf-8?B?NUhUbHdoUFNyQ2Z2cDlqSkR5OTBvUnQ1MFJxbzY5bTB6NXNkNEVMVEJBSGNH?=
 =?utf-8?B?aDNLYUkyZmlZdVd1SnRRcUR3YXhiWExESXBqV3hKbkJJaEFRNGE3L3NTMHdI?=
 =?utf-8?B?dWpnWlpqSEM4MW9uVHJvRXFFNkRIcmpCdDFDamg3Q1NheTVqU3Rmalpid1NB?=
 =?utf-8?B?NHhwTzd4eGZYb0R4VTlibU1mSDFpUmgzY1dNQzlmRWZyUWlMTHVtQTZZN3JV?=
 =?utf-8?B?WEdjeUtqZzBIZk1PNWdJcVFQRnRtd1FrUy9QWUh5dGhnUDRuS05QQ29rdkZa?=
 =?utf-8?B?emVtdzBBYnV3T1F2QVkyYldXOFl1VkJtVURqL1ZhTXhOUU0zbkJVY2JjMnF6?=
 =?utf-8?B?Q09ma0c3dkdIQmpVUHF5eTBJVDNuWVM1dG5KRVRZbSswZk5sakttR1ZOSWZW?=
 =?utf-8?B?dERCVEZFbzJHWXA2N2ZVeFFhR01vQzNqYmEzVVhOMzVvVnFVbjVFdEN6L2h0?=
 =?utf-8?B?dThtMlVIVGg3OWdYZUZvbStkRU1ZcTQ2NksvTk9RZzVYeEtTcGRpeVhuaG9N?=
 =?utf-8?B?SVhxcUdFTUVoajk5VWgySW9UT0FqWjgzVHZwOEFGQTA3MXpmaS9QMVFjekJy?=
 =?utf-8?B?ekdnNU5QTXUyeDY1OUhZRGZHNDBCTTFxQkJEZnphbFB5cCtCWkpDZnU1MlZK?=
 =?utf-8?B?Qm1SRlh4bzBvbUpTTXR1OVdrRllid245YWJPWEFtYUVseFR1ejA5bDFjczAw?=
 =?utf-8?B?OW5HQnVpYVRiVStHOUJUb0M3cFRneWZ5RmlNWXdjMmV4WlBmQlhTZDlJTDkv?=
 =?utf-8?B?UWxQcmZwRklKK3lHd01rdjlFazN2TTRmMmpOSWR6VXFibzhQRGdSTno4azZ3?=
 =?utf-8?B?R2xFQWR4OHJjVDlhMVl4WWdidFBrUXBGZk9qM1lTTVBTQ2drRytmQ3E3cU5P?=
 =?utf-8?B?SC9jcHNnSy9QVHNVUHRLbHd1UTNkajEvSzV3Slh1dEMrdkIxV2Rvd3pUb1FC?=
 =?utf-8?B?Y2ZRcy9WcldnZG4zbVRyZVVtUmlDa2RUeWJrTTRUTFY5akpza3JHMmZ2T0Ex?=
 =?utf-8?B?V2VuNVlmaUNYc01GemVTdGhhNmQ0a2ljWWVjdyszU2ZhZVhIOGZRdS95T0dJ?=
 =?utf-8?B?NVRNY1BiOFJiZTR1ckpGRXhuZzFiZkcrK3d1UFBaZTQwVEgvRnRsakUzd3d6?=
 =?utf-8?B?QSt3bk91M01kdEdBRXphRUtDOGNWYktIREF5MXgzZEJlR3JhQVh3YlVSTmhv?=
 =?utf-8?B?WWFPNnM0N0RwUTBnNTQvVEtFMnd3PT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: vH6tJ+q2HzSE2prf1VunleeYGnOjLcdCr47KlYLKDEDxaTvanP1RbaP2zbbTz5s61DtxybXMWTe586TCftFyHbprDbTXNnAQjgx53HlqVWwqucioADZsonJPaa/3Wr6TWEpn9IKCNF20T/Arn4crHxDhb6XmSig9Di8ZGoEYlGRnIQMrrR/x5ai1QM7rNJYP8X9tYEk5v7Ql+N2XY/+gPRgn2C4fjaq0EJF5KUJFroRLi1Iz1K81eSh9QOm8/2v/ogWhIq7ayyt4nM32ECCoXIS8S+fEGYC6+yAHSnbmNJkTvZ2XMFL89zNGi4KBhGyehkexImJvShOPIanasdwa12/36V/DXvbyM5BFDmbydlBzOwEbAna88sJ73Mbsblqo6RxblJ5Xl/e8vNnZXep2pchIyCPhaNpfoykVXh+tXs8GhXLyW02Dtj1XIT/o6Ksc
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 10:28:12.7388 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 448bea07-202f-421b-2a95-08de630eef44
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7549
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
X-Rspamd-Queue-Id: 12206D7A37
X-Rspamd-Action: no action

Makes a code slightly clearer and reduces indentation.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Suggested-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    | 186 +++++++++++----------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h    |   4 +-
 3 files changed, 108 insertions(+), 96 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index b5c48ff3d67e..072c671a3c95 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3158,7 +3158,7 @@ static int amdgpu_device_ip_init(struct amdgpu_device *adev)
 	if (r)
 		goto init_failed;
 
-	amdgpu_ttm_set_buffer_funcs_status(adev, true);
+	amdgpu_ttm_enable_buffer_funcs(adev);
 
 	/* Don't init kfd if whole hive need to be reset during init */
 	if (adev->init_lvl->level != AMDGPU_INIT_LEVEL_MINIMAL_XGMI) {
@@ -3835,7 +3835,7 @@ static int amdgpu_device_ip_suspend(struct amdgpu_device *adev)
 		amdgpu_virt_request_full_gpu(adev, false);
 	}
 
-	amdgpu_ttm_set_buffer_funcs_status(adev, false);
+	amdgpu_ttm_disable_buffer_funcs(adev);
 
 	r = amdgpu_device_ip_suspend_phase1(adev);
 	if (r)
@@ -4050,7 +4050,7 @@ static int amdgpu_device_ip_resume(struct amdgpu_device *adev)
 
 	r = amdgpu_device_ip_resume_phase2(adev);
 
-	amdgpu_ttm_set_buffer_funcs_status(adev, true);
+	amdgpu_ttm_enable_buffer_funcs(adev);
 
 	if (r)
 		return r;
@@ -4916,7 +4916,7 @@ void amdgpu_device_fini_hw(struct amdgpu_device *adev)
 	/* disable ras feature must before hw fini */
 	amdgpu_ras_pre_fini(adev);
 
-	amdgpu_ttm_set_buffer_funcs_status(adev, false);
+	amdgpu_ttm_disable_buffer_funcs(adev);
 
 	/*
 	 * device went through surprise hotplug; we need to destroy topology
@@ -5182,7 +5182,7 @@ int amdgpu_device_suspend(struct drm_device *dev, bool notify_clients)
 	if (r)
 		goto unwind_userq;
 
-	amdgpu_ttm_set_buffer_funcs_status(adev, false);
+	amdgpu_ttm_disable_buffer_funcs(adev);
 
 	amdgpu_fence_driver_hw_fini(adev);
 
@@ -5196,7 +5196,7 @@ int amdgpu_device_suspend(struct drm_device *dev, bool notify_clients)
 	return 0;
 
 unwind_evict:
-	amdgpu_ttm_set_buffer_funcs_status(adev, true);
+	amdgpu_ttm_enable_buffer_funcs(adev);
 	amdgpu_fence_driver_hw_init(adev);
 
 unwind_userq:
@@ -5930,7 +5930,7 @@ int amdgpu_device_reinit_after_reset(struct amdgpu_reset_context *reset_context)
 				if (r)
 					goto out;
 
-				amdgpu_ttm_set_buffer_funcs_status(tmp_adev, true);
+				amdgpu_ttm_enable_buffer_funcs(tmp_adev);
 
 				r = amdgpu_device_ip_resume_phase3(tmp_adev);
 				if (r)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 3b369b3fbce8..7a72f634f05b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -2110,7 +2110,7 @@ int amdgpu_ttm_init(struct amdgpu_device *adev)
 	}
 
 	/* Change the size here instead of the init above so only lpfn is affected */
-	amdgpu_ttm_set_buffer_funcs_status(adev, false);
+	amdgpu_ttm_disable_buffer_funcs(adev);
 #ifdef CONFIG_64BIT
 #ifdef CONFIG_X86
 	if (adev->gmc.xgmi.connected_to_cpu)
@@ -2339,115 +2339,91 @@ void amdgpu_ttm_fini(struct amdgpu_device *adev)
 }
 
 /**
- * amdgpu_ttm_set_buffer_funcs_status - enable/disable use of buffer functions
+ * amdgpu_ttm_enable_buffer_funcs - enable use of buffer functions
  *
  * @adev: amdgpu_device pointer
- * @enable: true when we can use buffer functions.
  *
- * Enable/disable use of buffer functions during suspend/resume. This should
+ * Enable use of buffer functions during suspend/resume. This should
  * only be called at bootup or when userspace isn't running.
  */
-void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
+void amdgpu_ttm_enable_buffer_funcs(struct amdgpu_device *adev)
 {
 	struct ttm_resource_manager *man = ttm_manager_type(&adev->mman.bdev, TTM_PL_VRAM);
 	u32 num_clear_entities, num_move_entities;
-	uint64_t size;
 	int r, i, j;
 
 	if (!adev->mman.initialized || amdgpu_in_reset(adev) ||
-	    adev->mman.buffer_funcs_enabled == enable || adev->gmc.is_app_apu)
+	    adev->mman.buffer_funcs_enabled || adev->gmc.is_app_apu)
 		return;
 
-	if (enable) {
-		if (!adev->mman.num_buffer_funcs_scheds) {
-			dev_warn(adev->dev, "Not enabling DMA transfers for in kernel use");
-			return;
-		}
+	if (!adev->mman.num_buffer_funcs_scheds) {
+		dev_warn(adev->dev, "Not enabling DMA transfers for in kernel use");
+		return;
+	}
+
+	r = amdgpu_ttm_buffer_entity_init(&adev->mman.gtt_mgr,
+						&adev->mman.default_entity,
+						DRM_SCHED_PRIORITY_KERNEL,
+						adev->mman.buffer_funcs_scheds, 1, 0);
+	if (r < 0) {
+		dev_err(adev->dev,
+			"Failed setting up TTM entity (%d)\n", r);
+		return;
+	}
+
+	num_clear_entities = MIN(adev->mman.num_buffer_funcs_scheds, TTM_NUM_MOVE_FENCES);
+	num_move_entities = MIN(adev->mman.num_buffer_funcs_scheds, TTM_NUM_MOVE_FENCES);
+
+	adev->mman.clear_entities = kcalloc(num_clear_entities,
+						sizeof(struct amdgpu_ttm_buffer_entity),
+						GFP_KERNEL);
+	atomic_set(&adev->mman.next_clear_entity, 0);
+	if (!adev->mman.clear_entities)
+		goto error_free_default_entity;
+
+	adev->mman.num_clear_entities = num_clear_entities;
+
+	for (i = 0; i < num_clear_entities; i++) {
+		r = amdgpu_ttm_buffer_entity_init(
+			&adev->mman.gtt_mgr,
+			&adev->mman.clear_entities[i],
+			DRM_SCHED_PRIORITY_NORMAL,
+			adev->mman.buffer_funcs_scheds,
+			adev->mman.num_buffer_funcs_scheds, 1);
 
-		num_clear_entities = MIN(adev->mman.num_buffer_funcs_scheds, TTM_NUM_MOVE_FENCES);
-		num_move_entities = MIN(adev->mman.num_buffer_funcs_scheds, TTM_NUM_MOVE_FENCES);
-		r = amdgpu_ttm_buffer_entity_init(&adev->mman.gtt_mgr,
-						  &adev->mman.default_entity,
-						  DRM_SCHED_PRIORITY_KERNEL,
-						  adev->mman.buffer_funcs_scheds, 1, 0);
 		if (r < 0) {
-			dev_err(adev->dev,
-				"Failed setting up TTM entity (%d)\n", r);
-			return;
-		}
-
-		adev->mman.clear_entities = kcalloc(num_clear_entities,
-						    sizeof(struct amdgpu_ttm_buffer_entity),
-						    GFP_KERNEL);
-		atomic_set(&adev->mman.next_clear_entity, 0);
-		if (!adev->mman.clear_entities)
+			for (j = 0; j < i; j++)
+				amdgpu_ttm_buffer_entity_fini(
+					&adev->mman.gtt_mgr, &adev->mman.clear_entities[j]);
+			adev->mman.num_clear_entities = 0;
+			kfree(adev->mman.clear_entities);
 			goto error_free_default_entity;
-
-		adev->mman.num_clear_entities = num_clear_entities;
-
-		for (i = 0; i < num_clear_entities; i++) {
-			r = amdgpu_ttm_buffer_entity_init(
-				&adev->mman.gtt_mgr,
-				&adev->mman.clear_entities[i],
-				DRM_SCHED_PRIORITY_NORMAL,
-				adev->mman.buffer_funcs_scheds,
-				adev->mman.num_buffer_funcs_scheds, 1);
-
-			if (r < 0) {
-				for (j = 0; j < i; j++)
-					amdgpu_ttm_buffer_entity_fini(
-						&adev->mman.gtt_mgr, &adev->mman.clear_entities[j]);
-				kfree(adev->mman.clear_entities);
-				adev->mman.num_clear_entities = 0;
-				adev->mman.clear_entities = NULL;
-				goto error_free_default_entity;
-			}
 		}
+	}
 
-		adev->mman.num_move_entities = num_move_entities;
-		atomic_set(&adev->mman.next_move_entity, 0);
-		for (i = 0; i < num_move_entities; i++) {
-			r = amdgpu_ttm_buffer_entity_init(
-				&adev->mman.gtt_mgr,
-				&adev->mman.move_entities[i],
-				DRM_SCHED_PRIORITY_NORMAL,
-				adev->mman.buffer_funcs_scheds,
-				adev->mman.num_buffer_funcs_scheds, 2);
+	adev->mman.num_move_entities = num_move_entities;
+	atomic_set(&adev->mman.next_move_entity, 0);
+	for (i = 0; i < num_move_entities; i++) {
+		r = amdgpu_ttm_buffer_entity_init(
+			&adev->mman.gtt_mgr,
+			&adev->mman.move_entities[i],
+			DRM_SCHED_PRIORITY_NORMAL,
+			adev->mman.buffer_funcs_scheds,
+			adev->mman.num_buffer_funcs_scheds, 2);
 
-			if (r < 0) {
-				for (j = 0; j < i; j++)
-					amdgpu_ttm_buffer_entity_fini(
-						&adev->mman.gtt_mgr, &adev->mman.move_entities[j]);
-				adev->mman.num_move_entities = 0;
-				goto error_free_clear_entities;
-			}
+		if (r < 0) {
+			for (j = 0; j < i; j++)
+				amdgpu_ttm_buffer_entity_fini(
+					&adev->mman.gtt_mgr,
+					&adev->mman.move_entities[j]);
+			adev->mman.num_move_entities = 0;
+			goto error_free_clear_entities;
 		}
-	} else {
-		amdgpu_ttm_buffer_entity_fini(&adev->mman.gtt_mgr,
-					      &adev->mman.default_entity);
-		for (i = 0; i < adev->mman.num_clear_entities; i++)
-			amdgpu_ttm_buffer_entity_fini(&adev->mman.gtt_mgr,
-						      &adev->mman.clear_entities[i]);
-		for (i = 0; i < adev->mman.num_move_entities; i++)
-			amdgpu_ttm_buffer_entity_fini(&adev->mman.gtt_mgr,
-						      &adev->mman.move_entities[i]);
-		/* Drop all the old fences since re-creating the scheduler entities
-		 * will allocate new contexts.
-		 */
-		ttm_resource_manager_cleanup(man);
-		kfree(adev->mman.clear_entities);
-		adev->mman.clear_entities = NULL;
-		adev->mman.num_clear_entities = 0;
-		adev->mman.num_move_entities = 0;
 	}
 
 	/* this just adjusts TTM size idea, which sets lpfn to the correct value */
-	if (enable)
-		size = adev->gmc.real_vram_size;
-	else
-		size = adev->gmc.visible_vram_size;
-	man->size = size;
-	adev->mman.buffer_funcs_enabled = enable;
+	man->size = adev->gmc.real_vram_size;
+	adev->mman.buffer_funcs_enabled = true;
 
 	return;
 
@@ -2463,6 +2439,42 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 				      &adev->mman.default_entity);
 }
 
+/**
+ * amdgpu_ttm_disable_buffer_funcs - disable use of buffer functions
+ *
+ * @adev: amdgpu_device pointer
+ */
+void amdgpu_ttm_disable_buffer_funcs(struct amdgpu_device *adev)
+{
+	struct ttm_resource_manager *man =
+		ttm_manager_type(&adev->mman.bdev, TTM_PL_VRAM);
+	int i;
+
+	if (!adev->mman.buffer_funcs_enabled)
+		return;
+
+	amdgpu_ttm_buffer_entity_fini(&adev->mman.gtt_mgr,
+				      &adev->mman.default_entity);
+	for (i = 0; i < adev->mman.num_move_entities; i++)
+		amdgpu_ttm_buffer_entity_fini(&adev->mman.gtt_mgr,
+					      &adev->mman.move_entities[i]);
+	for (i = 0; i < adev->mman.num_clear_entities; i++)
+		amdgpu_ttm_buffer_entity_fini(&adev->mman.gtt_mgr,
+					      &adev->mman.clear_entities[i]);
+	/* Drop all the old fences since re-creating the scheduler entities
+	 * will allocate new contexts.
+	 */
+	ttm_resource_manager_cleanup(man);
+
+	kfree(adev->mman.clear_entities);
+	adev->mman.clear_entities = NULL;
+	adev->mman.num_clear_entities = 0;
+	adev->mman.num_move_entities = 0;
+
+	man->size = adev->gmc.visible_vram_size;
+	adev->mman.buffer_funcs_enabled = false;
+}
+
 static int amdgpu_ttm_prepare_job(struct amdgpu_device *adev,
 				  struct amdgpu_ttm_buffer_entity *entity,
 				  unsigned int num_dw,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index d7b14d5cac77..8a5f34aaabac 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -178,8 +178,8 @@ bool amdgpu_res_cpu_visible(struct amdgpu_device *adev,
 
 int amdgpu_ttm_init(struct amdgpu_device *adev);
 void amdgpu_ttm_fini(struct amdgpu_device *adev);
-void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev,
-					bool enable);
+void amdgpu_ttm_enable_buffer_funcs(struct amdgpu_device *adev);
+void amdgpu_ttm_disable_buffer_funcs(struct amdgpu_device *adev);
 int amdgpu_copy_buffer(struct amdgpu_device *adev,
 		       struct amdgpu_ttm_buffer_entity *entity,
 		       uint64_t src_offset,
-- 
2.43.0

