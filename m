Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mMsBIqfNgWl1JwMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 11:27:51 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C30ED79D4
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 11:27:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E4BD10E5F7;
	Tue,  3 Feb 2026 10:27:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="K2Vh22ET";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010002.outbound.protection.outlook.com
 [40.93.198.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4B9210E5F7;
 Tue,  3 Feb 2026 10:27:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rx+JLPfN3QmlgfVqxbvDrzynK1ULf2jN45LN4O1dZE7801YqRQt2ZVtGEc+kf92ICmkVVmP/Ns9giJzaSQD1NX3WXZBowUSO+9nV0gTkD3fY+xRd/vlH8p0KqIrw1h7bOnkLmdU83tYYdJJJdvdXvhB/Yoy9rmferiSq7Ddtb9/6jQFuw5L3LgJET3G8mU0HvUyOedTVpOWQlykoH2gqKU6JfZnx657zB91ewOxwWa4hrsskFZeK65Ibd0QpIKZvOMs/f1O6x0jPIJZDtLVSKp931ZFBgFn0Sdn77Mr1S9UsITEsftgABjx2UFUavJSc13UXOR5ZhdLZuWNU7zJSzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XkUbViHG+hylrvQTJKUIbiXubBZb/lDDgNiCoNSKPoo=;
 b=KvY9/tacVZjeTESE9a7aKbON8cLciZvCXfOejWz076Chvcy1RpvXcNNCWEWnXRc8zUTiRXz+TeHt1nN3pek9fp3csQHDXOC9oYQzeyCXBEQ6XTYtKwwzuG3mCbO86ExbuQoFFkXSlYGN0w/iOCSH6hLmdj+fHBA7pAkNe6TBDpKWdDITOm6ctMO6M1kZdmhD5y8o6808gTkJ+jn631MbCc6EMSffdVP4c3JvBhsZSXZFVqBILxl8M1OKN+c5M6/9qb1dRPh7eSwk+yHc8FJVqctEEhKm1ApGjRcEnrlqKKLGs88HW+aRQ0Zwz9TSYriUaZ+2Rw5G7wPavyqse1Jytg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XkUbViHG+hylrvQTJKUIbiXubBZb/lDDgNiCoNSKPoo=;
 b=K2Vh22ETrj2iXW3Te3v+dPTPfhdd4fNY/WbA6T+d4Y5v8OkKsf3NJmyK3+LKbabA9Jdkomronng9jjB0MP0fGaPSUSBG0bFs2QzpDpO1ur3F5g+awTFNbNqEdsOKS1+bvVIjfxmxn+88SnrzLlEBw0Xv5fk6mV5ImqoFfbsTMDQ=
Received: from BY3PR05CA0005.namprd05.prod.outlook.com (2603:10b6:a03:254::10)
 by DM4PR12MB9733.namprd12.prod.outlook.com (2603:10b6:8:225::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.12; Tue, 3 Feb
 2026 10:27:43 +0000
Received: from CO1PEPF000075F0.namprd03.prod.outlook.com
 (2603:10b6:a03:254:cafe::9d) by BY3PR05CA0005.outlook.office365.com
 (2603:10b6:a03:254::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Tue,
 3 Feb 2026 10:27:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000075F0.mail.protection.outlook.com (10.167.249.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 10:27:42 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 3 Feb 2026 04:27:38 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 09/12] drm/amdgpu: give ttm entities access to all the sdma
 scheds
Date: Tue, 3 Feb 2026 11:22:16 +0100
Message-ID: <20260203102236.3456-10-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F0:EE_|DM4PR12MB9733:EE_
X-MS-Office365-Filtering-Correlation-Id: e2fa7c17-680e-4aef-f378-08de630edd90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Vkl1dVRYSmZ6c1dZTnNDVlFiaW1EUFJYOG5DTnVDRUJyL3ZzQTVOMTBSaUU2?=
 =?utf-8?B?eStkMWhkby9pQ1F1d2lMRXpNVlhaOVN0TkhqazZHZTJ6QW1pNk9rVGszSkxQ?=
 =?utf-8?B?VjBPcGEwSE9IYWdyOURsVUxINGFjV3kzSUQvcytoSThXdmIvcXl2V0Z4ZUFC?=
 =?utf-8?B?ZUtvZTFkNmI5dmlvL1M5SGdKdzByeVZMSE9zVWo5Mm1GRTNHcWZ0K2ZzaDZr?=
 =?utf-8?B?aVFLcC9jVGFGT29NMlJJTlpHOVNPdXk1RTlJdTJ0cnhVUE9vcjN0U1J4SEF1?=
 =?utf-8?B?UjVudUVBVDBFcVJwdnpod3ZySGlNdkVDRkhjSFAwOU5URytjZ0MyQVdFR0RD?=
 =?utf-8?B?QmJzZ2liOG5yYlJwYXRyelBIVU5wNDVjOFpkTSs3UUUzSkpNeW5SY1hyUkIr?=
 =?utf-8?B?eXZvYzZtYms0dFlMbGVOVU5lcGtkMXl0ZjNnNElzSkVRSDFNMVNWVXZIbGNF?=
 =?utf-8?B?WjhvaTF6c0pFWldCMGlWLzhML0dkYjVldmRpNDU0bHhybUtaQytodVhpODZZ?=
 =?utf-8?B?dkl2NnhEeW5GcGFwb0d0Q2tQb2xoK0IvdlVlWWFEeTVyWXdXd09UcTBZTDJj?=
 =?utf-8?B?WUpZNEtPTXNLUURDck9PWEJtTUkxamlya3ZZdkJqYjJXQ3d6Q0lPQkNjOWlH?=
 =?utf-8?B?Wk5lUFoxb1ErSTl6bE01QUNqcGJBakpJcDQ4ci9qdnMxQlNOVkgwTUpaZHpn?=
 =?utf-8?B?Zk1hOHFYY1VKRG52VVNlMGo0Rk93Z1M1cDJsaGY2cytZNUFQcVVJb1EzaGtm?=
 =?utf-8?B?Y0pGb29KYlZCMy9iSU9aR2NiTmNYckE1NzRxM2UwZ3A1cnUvZ1UzWVlWNUkw?=
 =?utf-8?B?eHBLRXhhOUwxdlpiUnZWa0psbEZlZERFL2cvVVFLUUFoNHoxNHR6dnYzZGhM?=
 =?utf-8?B?SUliNC9sSVVXSmJ6akZYb1JVL3ZYNWhiTU1uT3VVcnV2M2xPYkdoSWRZT0Ny?=
 =?utf-8?B?UkNGdE0rYmpsZm1MY2EwV2N3TmZFZWZLcGpHZW1oN0Y5QkYvRVpDT3VvQ2pL?=
 =?utf-8?B?WUFyMHRyL0EzVWhUVzU1VXBtVFZnRy9LZDl1WUZqRGl5dU1PWE9LRDdUVnFw?=
 =?utf-8?B?TTJVWXpqRHkrYkdoREdCaENDYTk0d2xmNXBVck9HYTQ1WXlvd3JEU21PcWlG?=
 =?utf-8?B?amU3dC9HQWNoSFBUbElFd1F2UDhtSEtFbTdMSmFSMDhpRVEvUk1GUXlydDM5?=
 =?utf-8?B?NGF2WUM3aVR4SFM2WmtEdU1BV3lKK0p3a0cwR2g2WGd6K0NxSzhPUms1SWh1?=
 =?utf-8?B?N3k2UE1sY2Z3YzlBZW1GckF4dU1DMlk0MW9yWHJZWHlLVFlKOHlwT0FReS9S?=
 =?utf-8?B?Vk5NN1A5RDE3alNvSGpHVzFZOEZNa1lYend3ck9rbTZpbmhRck9jRm03bGJa?=
 =?utf-8?B?Z2U4VHJ5NnVjYkxHMnBIVDFHQVAxc0EwNzgxSFVheExtNFluN0EwTzh3eXVX?=
 =?utf-8?B?MWlTYWY5dU1EODZLczFua1BEQ1VpMFlJRkhtdmNIcFNUOEFSdjdmRzBhUDJ1?=
 =?utf-8?B?VEJCRHR1RnpHUWNzeUNmQUppclZLQ2Y4VU9SRUJsVGFDOEhpNGtqM0Nod2hh?=
 =?utf-8?B?NkJXRHFaSThiSTNvMjYyaFRWRG9yUHVINkUxNUkvQVBaRXdSTXhVcnUvZi9E?=
 =?utf-8?B?UW05aytRK0dZT0IyY0R0Y05jQjduZGlrUm84czlHV1hvWnYyclIwVWtYNzhK?=
 =?utf-8?B?N3hFa21MZXlFWFByV3M5dDR3NVZZV29MMmhwRUVSTXduMUVSQlV0UldXaVpU?=
 =?utf-8?B?WGlPRGxuaTd1KzZDRzlpSzVQRXJWTVE0MWNLMDVyT1FlcXJDMUxEVG1xWDE1?=
 =?utf-8?B?S2NZdEV2M25OZU5pUFVVa2VMUmFkcVo2NW5IYnAwb0MxNW8vOWxsM1E0NmEz?=
 =?utf-8?B?Mm01Rm4relFDL1U0cDdKdEluY1JDUW1zRkFGeUVOa3pHYW1tN2FwTTIxbWli?=
 =?utf-8?B?bUticjl3RXRyQSsvdEovS0c2R1doRDJSUmhXVFVNN3JnRlhzRTNIeE9UUDBq?=
 =?utf-8?B?UjM4cG5ieXd3Nk83NU5DczdBQjI5NkNJVHVpQnpsRjd6L0RoVW9jMkR5NDFW?=
 =?utf-8?B?UDRpUzRGVUJMWDFWSDM2Yi93a3VJU0hFREhMNVBFZTl4TVA5NGxqNHMreU1v?=
 =?utf-8?B?U0EvYS9VTmFqTm5Pb2F0R00xZjJ6Mnl3TEN6V3R6NGFFL1NRTGRhY1N5cDVU?=
 =?utf-8?B?VlRTck5VclRTTE1lZlBXZFN1QkFrSWpLdkpIM1MrNFhsbWJPNmJMd3V1TTVn?=
 =?utf-8?B?SGZmRkU2TUdjSGVzMmdZQzd3REpRPT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: EUFSiBcyP1J0rQiLUbVu83utL4xzVeTbdg0Jw1zselDfzNIWNuHz7aRklBFaWqlB29Sk+BB85JmkJ246lxluqAJCEY6/P0l+45S9fHbNlYxNTP8qGLuf7jNjUJV6/qOr85Dh9UAc+z2hF6CoxbxNGGSqehuIKQUnFHRq7gdpsxrmm0cRDZa9MIpc61SJ+Jqmp4qpTS7rK3cgh5F749uhoe0/yWMhLWAmkD3wh5rNzc4YfveZ9yJ9r7ERsNhXTvuxJII6+huX1F6/5ESTVPeyYIGQcjUstSiS1aznpQTmhG8p3yQV1e/iFH9u2OcDYUfGaUdh5u+ISeR09tQseH5anMGb0j2kmL33Hm3QR3X5TVg9wS4TLPT1TwEkEFfdJFpfKeDAM3xRsF3omkIMbk7YzYH1yedduiQlcojXsQvoxr7XSzM+P6xuv6TStLGt6wIK
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 10:27:42.9653 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2fa7c17-680e-4aef-f378-08de630edd90
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075F0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB9733
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
X-Rspamd-Queue-Id: 0C30ED79D4
X-Rspamd-Action: no action

With this change we now have as many clear and move entities as we
have sdma engines (limited to TTM_NUM_MOVE_FENCES).

To enable load-balancing this patch gives access to all sdma
schedulers to all entities.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index b233bcc61ec0..f4304f061d7e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -2359,8 +2359,6 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 		return;
 
 	if (enable) {
-		struct drm_gpu_scheduler *sched;
-
 		if (!adev->mman.num_buffer_funcs_scheds) {
 			dev_warn(adev->dev, "Not enabling DMA transfers for in kernel use");
 			return;
@@ -2368,11 +2366,10 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 
 		num_clear_entities = MIN(adev->mman.num_buffer_funcs_scheds, TTM_NUM_MOVE_FENCES);
 		num_move_entities = MIN(adev->mman.num_buffer_funcs_scheds, TTM_NUM_MOVE_FENCES);
-		sched = adev->mman.buffer_funcs_scheds[0];
 		r = amdgpu_ttm_buffer_entity_init(&adev->mman.gtt_mgr,
 						  &adev->mman.default_entity,
 						  DRM_SCHED_PRIORITY_KERNEL,
-						  &sched, 1, 0);
+						  adev->mman.buffer_funcs_scheds, 1, 0);
 		if (r < 0) {
 			dev_err(adev->dev,
 				"Failed setting up TTM entity (%d)\n", r);
@@ -2390,8 +2387,11 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 
 		for (i = 0; i < num_clear_entities; i++) {
 			r = amdgpu_ttm_buffer_entity_init(
-				&adev->mman.gtt_mgr, &adev->mman.clear_entities[i],
-				DRM_SCHED_PRIORITY_NORMAL, &sched, 1, 1);
+				&adev->mman.gtt_mgr,
+				&adev->mman.clear_entities[i],
+				DRM_SCHED_PRIORITY_NORMAL,
+				adev->mman.buffer_funcs_scheds,
+				adev->mman.num_buffer_funcs_scheds, 1);
 
 			if (r < 0) {
 				for (j = 0; j < i; j++)
@@ -2410,7 +2410,9 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 			r = amdgpu_ttm_buffer_entity_init(
 				&adev->mman.gtt_mgr,
 				&adev->mman.move_entities[i],
-				DRM_SCHED_PRIORITY_NORMAL, &sched, 1, 2);
+				DRM_SCHED_PRIORITY_NORMAL,
+				adev->mman.buffer_funcs_scheds,
+				adev->mman.num_buffer_funcs_scheds, 2);
 
 			if (r < 0) {
 				for (j = 0; j < i; j++)
-- 
2.43.0

