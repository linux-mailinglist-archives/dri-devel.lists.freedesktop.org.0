Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aG31EWz4hWlEIwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 15:19:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BB1FEBB6
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 15:19:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C17610E7B4;
	Fri,  6 Feb 2026 14:19:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="eB8JjbUH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012062.outbound.protection.outlook.com
 [40.107.200.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6ECB10E7B4
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 14:19:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BXcKoeP3LfpM8Eb0fVJgUJuEW/gA3UMsbGnGDiWXXl/3vnmIafVpipfugi30KpRbP/fOp0hFXuSGmWZLPlrHKAJQuM+XYJrU9Hi4L2q80sHbQP5TevIgtFFhzMmg7M+3eGJpOe1XyNojCQCI/SddORD1n1XJhMUfg8YQZv+1Zan0sYnNkp4noSAC1y5/8kzlkXTBIN9NVQ+OyxfdtkYframBs4iufsyoowOJN5Xpksd3ZdsUazvM2wkww6QjcoQOcK4ob3fYGMd9p4ZJtJS7EVBqXCS3VSzxVX4f3aCf7FmZWGN9Tnp2S4IiWW8RrXUl6Pk8OCMWPaIAVnhZBvwrOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GrYbLntD8393MmXThGdR416p+MdLVbFkqVhmWbAwgPw=;
 b=QRHBXuqBX7CBPAiDPcdyuYb8JWKzO5+rTd2GkZ4puJGSJySwxDw0YvUUjP+RTYdS4rgJ3aHZFPShUgBKpNmxZS0MbHD7ADe8GX2hfyRS6Knhqn6UfAZHjnbAbhYn9Cah/xTpq93YljE65j0sMhOb5Laq2gLAeUMxsA9xRW9+eu5KUym8seXmgGBbBgwvMbbbFd2X9j8rTi8eLawo7r/T51fDgSg8/4dYXuDEEUaXCeC2nP8vMJtORzdAlAs7MvCaNs4ntt/PfquWkFyJwo0oPBwlC5BPKeBXi6OBPV1j1OU9oNfrhkaoCt7Q5lUvicTBDdhg9btbvBQfK52JoRiHgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GrYbLntD8393MmXThGdR416p+MdLVbFkqVhmWbAwgPw=;
 b=eB8JjbUH9a6/OKDScdfx70GuDcfDAVheO/mB5IpydZEvVo0ujWC6u0i1YecRmRIn+pcnJCl+kMWACE7nu8PqaWn6TBrMJWI2fYtu+mDKbLYA+ygwOJae506/E5lSEJntatg+aN6qCfS2zi33P9leEk1a4eYVfsdHry6DS59yQ/4=
Received: from CP5P284CA0162.BRAP284.PROD.OUTLOOK.COM (2603:10d6:103:22a::14)
 by SJ5PPF842B33876.namprd10.prod.outlook.com
 (2603:10b6:a0f:fc02::7b1) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.16; Fri, 6 Feb
 2026 14:19:15 +0000
Received: from BL6PEPF0001AB4C.namprd04.prod.outlook.com
 (2603:10d6:103:22a:cafe::25) by CP5P284CA0162.outlook.office365.com
 (2603:10d6:103:22a::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.16 via Frontend Transport; Fri,
 6 Feb 2026 14:19:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL6PEPF0001AB4C.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Fri, 6 Feb 2026 14:19:12 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Feb
 2026 08:19:05 -0600
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Feb
 2026 08:19:04 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 6 Feb 2026 08:19:04 -0600
Received: from [172.24.233.20] (a0512632.dhcp.ti.com [172.24.233.20])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 616EJ0en1381181;
 Fri, 6 Feb 2026 08:19:00 -0600
Message-ID: <4b554339-95e1-4980-8899-57ba637ba80c@ti.com>
Date: Fri, 6 Feb 2026 19:48:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: display: ti, am65x-dss: Fix AM62L DSS reg
 and clock constraints
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <jyri.sarha@iki.fi>, <tomi.valkeinen@ideasonboard.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <devarsht@ti.com>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <praneeth@ti.com>, <vigneshr@ti.com>
References: <20260129150601.185882-1-s-jain1@ti.com>
 <20260205-spectral-dramatic-jellyfish-cec4e2@quoll>
Content-Language: en-US
From: Swamil Jain <s-jain1@ti.com>
In-Reply-To: <20260205-spectral-dramatic-jellyfish-cec4e2@quoll>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4C:EE_|SJ5PPF842B33876:EE_
X-MS-Office365-Filtering-Correlation-Id: e274ad3f-2f96-45ed-bff9-08de658ab385
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|7416014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Nzk2TVVBNHVsa2ExYmU1MW1GMytyWGFFQy9aemh5N1I2OGo0MnpudTV6VVBN?=
 =?utf-8?B?M2Znb00rd3FxRDNrK0oxNEJCM3VDbWVHdVBxNEtST3NpcllCamxMdGlXZDc3?=
 =?utf-8?B?eUJVaHA0ZEdwZ0paYVNIUHdISFdWemNqUkxLcjNJZkhaTmJkUXBvQ21iMjFa?=
 =?utf-8?B?eXJ0Z2R1Q1MyZmpSdUpER3doNUpwUjJ2ZW5mZU5lK1UyODluOGpUcEQ5UW1Z?=
 =?utf-8?B?cnRZcXpmUTFneDRpQWZJRFIrbkNmeG5qS3FUOTBVc1hUMEtjYUJWVXpmQTRl?=
 =?utf-8?B?ZWRmU0xIeUoreWpwTVU3eGtDeGk2SzFnbHpITlhDSHg5MGF2b3pZS251V3J1?=
 =?utf-8?B?OWY1K3RhYmNDaUZwRWVKU3V6a3pqcjlHNjZGazhFaUUzcEtJdXg1RzQyVmRF?=
 =?utf-8?B?L0ZCamFsNWozOTFQR0txZnBQNXNwWUtsWUhSa2sxSmQ5QUp3dVNEaXA0TXNp?=
 =?utf-8?B?NGFuaHpJajM2RGNMcGhqYjNxeDAyay9FQnVVVzJFQjNURnBWaWF1b1lZc0lh?=
 =?utf-8?B?M3VrQUplTGpJTWpSWTJhZDQrYW9OWHhVejU3N2FKSTVjN1NxbStvamVBTS84?=
 =?utf-8?B?Wk4wTXJqWHFNWFhMY1ZxakM3dCtmWmNlVVZlYjdmUXN2UUdZQmVPV0VWZE9j?=
 =?utf-8?B?bk5PV3NoWlM3U3Fta0hqRVRNMkUvbS9wZWROQXBocGM1SGdnVWNva3ZvNmF1?=
 =?utf-8?B?R3kyd2NPU2pSVzkvdVd2OEg5N0tNYkZGNlBYY2lqcEtaYVdlNndRdnpJOEtH?=
 =?utf-8?B?VEVHbHRnV2VvWTREQTRuemNiZ1VQVUtEUTNGeFJPaG5UZkRSMlBOTFJiU1Iw?=
 =?utf-8?B?QVhvaENwRStQeGVGcHd1SFlUek84L1o2MDhDSU05bDlZSzlyMHJaS2cvTTBi?=
 =?utf-8?B?YUFIOWY1Q296WEhHQUJIRkx0UFVaeHMzejRsZHo3RXo3dFh4eEEvN3VGY3d1?=
 =?utf-8?B?RlpJMDRPT1c5L0krcTB4OWh4aUpYM29YUHNtUWw1LzU5VjVzcVltb3ZWTUhw?=
 =?utf-8?B?cG9sOHBaWHE4ZmdLalRkYkxrNmVMa3ZBcTdva2ZzKzZVb21JaDhZSzVjUCs0?=
 =?utf-8?B?cUFNaUt5VWsrMVYrVEVMY1JrQytwM2FHNUVEV0Z3QjF6TFV3NXk1cDhyaTBo?=
 =?utf-8?B?bHM5cDZ5TUdZd3JsaGFvbzJlVXBDL3V2TmpwcFRPbDBKZmYvU3djVzFrUi95?=
 =?utf-8?B?TWl5YTFpVWcydmt3cnJaZ1VPZlhDRFJHVnFaTUUvNG9xYXBPdEdhdmNqRFRs?=
 =?utf-8?B?cTVXYUdKQWp2TXUzWk5yVTBBd3ZjUW5UZC93Y0hqVU93SDZvTVIyYXhQK0Vk?=
 =?utf-8?B?eStzd1Y4L3lqTzZkN1Y4ODMvTXRkMmxYWmVQZXBPWFFsNXNIRjgrS3VxSHNs?=
 =?utf-8?B?bENvTmVXSzFEclNNV3J1QTBFbk1MaFRhb2pDMHZYczRKc0xCSmVHUlc5K3VW?=
 =?utf-8?B?YXlEUmtiUDNTN3ZCRU5FekhyNnVEYnZYT2tVR2UzU0M1YllURm9GdU5wdi9w?=
 =?utf-8?B?dkk4VjdSQzduMHFEZ0pGUGk3Y0JEeVgyOUVFeXBQNERUWnJxU0VZWVVaWEsv?=
 =?utf-8?B?cm1ZS1cyY0FnSEVOTVVRSVF2K0ExR2h5N2l6cEs4Yi9ZWVg5Y0ZVeDlyR2Nx?=
 =?utf-8?B?NUF3UkRkUzFha0xWZkVmSHd5ZDc4QnJaUzlmSHRDTTBINSthbkM5RldlcTFI?=
 =?utf-8?B?c1hteElNOEdRZDFURDRMSGhycGJUUXZpbm4zSG1LL1VZRVFzM3NyZVZQdEIw?=
 =?utf-8?B?d2hDc2RXSTZZZ0JieFU2bWNqV2x0TXloVU96UEVDanFyNzFmVExJRGxocWMx?=
 =?utf-8?B?TGozbHBEQXZVcnRibkdJT2FVTS80cEVacytqKzVLNFdGeU9JbGZTbis0OUQz?=
 =?utf-8?B?MlhzZE1uMEk4clVDUDhxcjNuRkliNDFVY0NiSmFaV0tTNEZReWRZYjZJeUpO?=
 =?utf-8?B?Ukk3bHVLV1BRNmRzQnVlVEg5RnFWZTVId3BtUFhpOWs5RnNIUTlHTWxqN2pM?=
 =?utf-8?B?aUFEN2I2L0tJRFQ5TW8rQUxTTENXNndRem1JOE1lTm5uL3ZjVy92eHpwSzg2?=
 =?utf-8?B?Yk1EajRyK3pFaGlUSVc5NnIzaWR2ZzFqMm9hRkdPZndTd3FLQXFLODQzbk03?=
 =?utf-8?B?T1FDempjZEd6Sm5PMGJwcVhIVTFyMEdOWGx5SkRWdndTdVdDaXRJVWdRZDQv?=
 =?utf-8?B?L0p5dWh2RTZMbHl1SzN1eWNXTnN5MHVsZ2U1Yi9qU1EwaXlOSDJCZDJLcUt5?=
 =?utf-8?B?ak9zZzlQdUoxNWFqODEzYWU1aGlBPT0=?=
X-Forefront-Antispam-Report: CIP:198.47.21.194; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:flwvzet200.ext.ti.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(7416014)(36860700013); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 05tuhDgwLNy+O56NtpXvnt+h7e0gAgL339tm9tyrbfYSrKu/ZOcmQiB+hR+dRP+MOLUmk+Yb7wRkWYZgnlxX4VkjO12dL2ObWCFG6y++qhlnspgObmWESAhpZQYQAtTRpVdnBzlrf8w+ZSD4NKLUJtpNC0II6+CAYtGxqH+zv+/oBVpe5+brNCIMgqbmaz6604IfYN/AN73IZndgoYQWyMCNJRlDrGfKDFNB+FP7ZiY67GrXVyjDYzeJEJosPacqqmPXP0nWztfrT+34au4O+1EWwVeLWfsRr9YdnuKF5BlgFT6qL458isyu/3iA08C1omIXL1bPB6i64E4K8GLf0W08694VqPrPlX8KHXsj3Y2vy6uWF1tWRRS4PtFoY38Rk7jrS+pw/vzJ4RmWtk+77hYMNa6B94p7Lk57O43Kfe6ndRyU5E4ptzZPPNerk3xN
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 14:19:12.4287 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e274ad3f-2f96-45ed-bff9-08de658ab385
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.21.194];
 Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF842B33876
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
X-Spamd-Result: default: False [4.39 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[ti.com : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[ti.com:s=selector1];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:jyri.sarha@iki.fi,m:tomi.valkeinen@ideasonboard.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:devarsht@ti.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:praneeth@ti.com,m:vigneshr@ti.com,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[s-jain1@ti.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ti.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[s-jain1@ti.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[iki.fi,ideasonboard.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,ti.com,lists.freedesktop.org,vger.kernel.org];
	NEURAL_HAM(-0.00)[-0.955];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 70BB1FEBB6
X-Rspamd-Action: no action

Hi Krzysztof,

On 2/5/26 18:55, Krzysztof Kozlowski wrote:
> On Thu, Jan 29, 2026 at 08:36:01PM +0530, Swamil Jain wrote:
>> The AM62L DSS [1] support incorrectly used the same register and
>> clock constraints as AM65x, but AM62L has a single video port.
>>
>> Fix this by adding conditional constraints that properly define the
>> register regions and clocks for AM62L DSS (single video port) versus
>> other AM65x variants (dual video port).
>>
>> [1]: Section 12.7 (Display Subsystem and Peripherals)
>> Link : https://www.ti.com/lit/pdf/sprujb4
>>
>> Fixes: cb8d4323302c ("dt-bindings: display: ti,am65x-dss: Add support for AM62L DSS")
>> Cc: stable@vger.kernel.org
>>
> 
> There are never blank lines between tags.
> 

Sorry, will fix this.

>> Signed-off-by: Swamil Jain <s-jain1@ti.com>
>> ---
>> Changelog:
>> v1->v2:
>> - Remove oneOf from top level constraints, it makes bindings redundant
>> - Remove minItems from top level constraints
>> - "dma-coherent" property shouldn't be changed in v1 itself
>> - Add description for reg-names, clock and clock-names
>> - Add constraints specific to AM62L and for other SoCs within allOf
>>    check
>>
>> Link to v1:
>> https://lore.kernel.org/all/20251224133150.2266524-1-s-jain1@ti.com/
>> ---
>>   .../bindings/display/ti/ti,am65x-dss.yaml     | 93 +++++++++++++------
>>   1 file changed, 67 insertions(+), 26 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
>> index 38fcee91211e..dbc9d754cf9e 100644
>> --- a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
>> +++ b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
>> @@ -36,38 +36,18 @@ properties:
>>     reg:
>>       description:
>>         Addresses to each DSS memory region described in the SoC's TRM.
>> -    items:
>> -      - description: common DSS register area
>> -      - description: VIDL1 light video plane
>> -      - description: VID video plane
>> -      - description: OVR1 overlay manager for vp1
>> -      - description: OVR2 overlay manager for vp2
>> -      - description: VP1 video port 1
>> -      - description: VP2 video port 2
>> -      - description: common1 DSS register area
> 
> No, I do not understand this change. We spoke so many times, documented
> it, wrotre on presentation slides: broadest constraints are always
> defined in top level. TI received this feedback more than once.
> 

There is no superset constraints since am62l register sequence (common, 
vidl1, ovr1, vp1, common1) is different than non-am62l SoCs (common, 
vidl1, vid, ...-> here it is different), so thought to adopt this 
approach where there is if-else block for each SoC and ran this through 
dt-bindings check as well, looking at the replies maybe I misunderstood 
what the suggestion was, reading the reply as I understand below is the 
suggestion:

```
reg:
     description:
       Addresses to each DSS memory region described in the SoC's TRM.
     oneOf:
       - items:
           - description: common DSS register area
           - description: VIDL1 light video plane
           - description: VID video plane
           - description: OVR1 overlay manager for vp1
           - description: OVR2 overlay manager for vp2
           - description: VP1 video port 1
           - description: VP2 video port 2
           - description: common1 DSS register area
       - items:
           - description: common DSS register area
           - description: VIDL1 light video plane
           - description: OVR1 overlay manager for vp1
           - description: VP1 video port 1
           - description: common1 DSS register area

.....(Similarly for reg-names, clocks, clock-names,...)

allOf:
   - if:
       properties:
         compatible:
           contains:
             const: ti,am62l-dss
     then:
       properties:
         clock-names:
           maxItems: 2
         clocks:
           maxItems: 2
         reg:
           maxItems: 5
     else:
       properties:
         clock-names:
           minItems: 3
         clocks:
           minItems: 3
         reg:
           minItems: 8

```

Could you please confirm on this?

Regards,
Swamil.


> Sorry guys, but you are not individual contributors which do it in spare
> time. Why the same feedback - already documented - has to be repeated?
> 
> Best regards,
> Krzysztof
> 
> 

