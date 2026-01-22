Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 1h7YIulYcmmJiwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 18:05:45 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 301A66ABFE
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 18:05:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46DCC10EA2C;
	Thu, 22 Jan 2026 17:05:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="VDab1MN3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012070.outbound.protection.outlook.com
 [40.107.200.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 857FA10EA29;
 Thu, 22 Jan 2026 17:05:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JNWPw8as1RBOAR0ohBHMDMFl/vKT4BlzRayfvbJc3Zpn6nhDxp4n9RYsSgrcGvUN2BX5tR1YABFiDHJ1w8msrGmkB64fAqv6C4gJ99UKCg5VmaUa0JHUuLvadGFfpERAs2EL+mbmTh4VnQ+f7ZqikpvMPAOdDan77QHsvysYZhVhUKxu8zpoS0+vrkS0kYcOStMNM5MRmaTFxiOCwFrQTc36QLfHvwrAhdPKyZ+mj+Jvn8K9gDX++NELSl/B3I9vOjJ8iSuQDNeweaU13Ro4cViCedgk4KOKgV20M+yOV80ghW2zyXolSN7fU8uB/7JYjWnSSXeP51QttTeI6Z6YYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yyVr4cDVSa8ix4RsK54vhrXRNmqbYglsNhaJlOSLL7g=;
 b=TGk3XgJ/iRbyzm/oXY4+DOheQRI3LfgWjuF0cb/7rFebol42+qUthFi41HqnQfi7cwFdHqzCozFySl2AkJI62peiNou2/+luQ065M2m5euYOhNc4v1NYmzAZVmLsKiMnsDb8wXtuT1SI+x0kZx7BdlLPaZYVhmUy2aCbeG7F7RLfFehFCtRD0cbvjsQzbY85ku6EMsUaycrp8dFyLwwbraBuQuLNiBQ9WmkG8VMCBINHxDCSWZORe4mYbKGkovjHooZFnaXqjgvDH0yyOqNH2eXxvkQ3iMuePPzqbKoMWaIiE25WF+YVTASiOlkB8BnIPhWO9CtsiVn7yoWUootQKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yyVr4cDVSa8ix4RsK54vhrXRNmqbYglsNhaJlOSLL7g=;
 b=VDab1MN3fq+oWquELaFdTJZaWqs7glT36x9CxjArE5PSKEuF3cCawLZZyfUw5kVJChBhSX/JHPcsj8Ud6G/nuhdItBL2tmQIiT+at3kR/PbG/V7H/FTqSuQZfQSSkEPM/UNWBZXYf5xbSO7VYxSH/b4VgOLleElsBKFVGZt3WB0=
Received: from BY5PR04CA0023.namprd04.prod.outlook.com (2603:10b6:a03:1d0::33)
 by MN2PR12MB4439.namprd12.prod.outlook.com (2603:10b6:208:262::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 17:05:34 +0000
Received: from BY1PEPF0001AE19.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::ea) by BY5PR04CA0023.outlook.office365.com
 (2603:10b6:a03:1d0::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Thu,
 22 Jan 2026 17:05:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF0001AE19.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 22 Jan 2026 17:05:33 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 22 Jan 2026 11:05:32 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 07/10] drm/amdgpu: double AMDGPU_GTT_MAX_TRANSFER_SIZE
Date: Thu, 22 Jan 2026 18:02:04 +0100
Message-ID: <20260122170218.3077-8-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260122170218.3077-1-pierre-eric.pelloux-prayer@amd.com>
References: <20260122170218.3077-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE19:EE_|MN2PR12MB4439:EE_
X-MS-Office365-Filtering-Correlation-Id: eee3288a-4f01-4d45-7e45-08de59d874a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OXpEVWdzeTExL05BSkFQMGFRU2FQejhtZ0pyakRvUjViYk1JM25EcllsV1V1?=
 =?utf-8?B?VDRUajJvdzVrL0VnMWZWaFBmQXdzdlk5MjFseWhVU3V2UC9HUWJ5aHBBSHFh?=
 =?utf-8?B?TWQwZjU3bHV2Y204SXBoNWlvWFhHMEgxSjBOM1NaVTRoWUFVSnRsZ0VrM2tn?=
 =?utf-8?B?ZG5ONVRsS0h3RjVha28wY2U0Q1ZYQ3ZOZnJ2L2dEMm9mdEtIUXZSY2x0YlAz?=
 =?utf-8?B?ajY2dkM1N1F0RGlUTm9qS0RZelpkdXo5Sy9wTUdVd1hsbUY0alFNTlQ4bm5s?=
 =?utf-8?B?VEZCK0N4aTFNclBvQ1B6K2tvTzl6SEVZelhwTHMxZGtIRmNkYytoNVVvWERh?=
 =?utf-8?B?enRhOCtUWUl1VlhFVTNlOFBYVHZ3TWxGaGhERExSN21zcTNVdHhRRzRQQURF?=
 =?utf-8?B?WFZFRk5nZXVhdmNyRVd5TDFhWUo1Nk8wbVo1NWdTbC9wMEJLTURVeEFyd29T?=
 =?utf-8?B?c0p2VndsYXFubVdxMmQ3Um8zbkpvcTZLeHVyK0RQUTRMNlpJRHM4Rmk3V1VS?=
 =?utf-8?B?ek4wOGxIaEM4NUFuSUtRdXB3RFk1dlY1b20wb2lqQmppKzd0bkY0ZXkzZEIv?=
 =?utf-8?B?aUVrS292eXY4RmRhUERWSTlPSEtidmFNMTdkampUSnZlVFRBU3pWcjJMdU9m?=
 =?utf-8?B?aWFQcFhsZlBBenVOMnUxTHo0aldlaEo1blNtQmgrQ0ZTVzZOdUdLTXRZNk1Y?=
 =?utf-8?B?ZkQzR2xuWjR4MGdmYkdxNFBRbjZhNG5IblBUbS9RL29IdGtjYk5ERENOVS9U?=
 =?utf-8?B?U2pna1VWczl4a3djalExZ0phZlM2OWxLcDlXZE9sWUJxcjhJc3dURTMvUHBv?=
 =?utf-8?B?emxpNTFLa1lnbnY4amxmTEFjT3pnWmtON3RxNEx0eVVoQXhBb2tWdlFyNmlE?=
 =?utf-8?B?VmE1Qjc1cTJPMVlLRi9lckVhT1YxY1c4RFhsNWt2VDlzc3FlMkgyVk5yVDVM?=
 =?utf-8?B?dVZvRkdKOXV3YjlzcFBTRDVJTGcvbS9HMHVWNVFHNEdQNGJGVmtyUHN4bENx?=
 =?utf-8?B?ZW03cEs4QndDbDJndXJ6dmUyVklCZFB0U0VSSXhZRnJtNEdZY3Y5V2d6T1lw?=
 =?utf-8?B?Kzc2UXF3LzNsek1XNEhXS0xGSDlQbFNJRWFVVE9Ic004UFRKOFZWMEY3dmJU?=
 =?utf-8?B?eFNUbThyS0dJaSs5SG1xZlFRT3duUHN0S1FIdi9OdXpYaE1tQ0N5ZllzSDY1?=
 =?utf-8?B?djlvSEt2T2hPSlRUU0U3ayt5dTV5eklJMVZsTnJNYkpJcTd3VVhRZnhiUHVs?=
 =?utf-8?B?eDliaTk3NHk2bFNwa2J6YUxiQWFvUGIrRW9qVlRLRHNTVHhXWThmdGVGaVRI?=
 =?utf-8?B?QUJRMW5JeFNYTEwxMDNMMFpmSkJoVkplYWNTc1lJQit3TkdYa2NFeCtpTFVh?=
 =?utf-8?B?azduVjFqOXZ4aUs1Rm4xZk5RbUZ5K1lpY0tIQmozMUtPUnBDd2EwWStPdzly?=
 =?utf-8?B?RjFJbXVvbFF5UFdoZVN6VTBpVHhyOHVQVGVxTUZScXVrZmFoN0NGNDhDUXBO?=
 =?utf-8?B?SmF5V0FSaUhFQ0RZYlh6dHVOR1c1U1ViMTVkSmpIaThYUnlteHFodVVxbG5i?=
 =?utf-8?B?bDJQUzQzV1NJZ2ZTaXdudUhLRXFyWWlld1dkOGgxYjlIYjg2S1M3RDNUOXRK?=
 =?utf-8?B?WXBpUU5zZUpLVEJPSEVGcmwrMmZ3RFBxZGlYOE1QOW5Kdkw2VEN1MHhud0tq?=
 =?utf-8?B?WkEvcnlhNEJIWFYyS2tqUzQveVBzbm1VQ1VINkpjdEhmdzZsMDJEbnVDNWEr?=
 =?utf-8?B?cW5UV2g2MUlDSHI5cktVclNqSmdrSGlDbU9aQm1Qc2NhdzFDaUVrSjc4Y1Zl?=
 =?utf-8?B?OUlna0h2ZU9wNVVBMUpYbXRCY293UFNhald4Y3JpM0JPK244MEVQTHhxQUtr?=
 =?utf-8?B?UUJCMEI3dXZhdmQ4MXJEcitadlBhM0pTMEJEbmMvRTBnR1hkbzcwTld0Zkdt?=
 =?utf-8?B?b2xHMll3WGFDSFo2RGZwcGx3QWl3SmRpNzF5U01WOXF4a2RMMTk4N25KNVU0?=
 =?utf-8?B?U1RlNzJPelNMNFIwbGlreVZhZEFLbEVFQUFEL08zSm91cW5BSjlpS0YwNXBr?=
 =?utf-8?B?VWtFWVk4R0ZCeVdLYkdNVFZ4RUtIWmVPWEpyMU5HdWROWC9EcHpYWTFxNDFj?=
 =?utf-8?B?ZWFkU2kxZXN4MlRGNFZYVUQ3K3A3QlZSdWVYd3hGY2syQitHTzc1aEFGOHdL?=
 =?utf-8?B?WkdKdE5HcVVDNEo1SG15WWxUMTBEaE11eHQzSzhvSjN0bXRBWHRiMW56MjVR?=
 =?utf-8?B?cjY2VFB5TWRNQ3JiclBjSzJWZlNBPT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 17:05:33.6702 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eee3288a-4f01-4d45-7e45-08de59d874a6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE19.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4439
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
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[pierre-eric.pelloux-prayer@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email,amd.com:dkim,amd.com:mid]
X-Rspamd-Queue-Id: 301A66ABFE
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

