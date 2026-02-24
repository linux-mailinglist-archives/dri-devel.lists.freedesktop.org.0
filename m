Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Gd+N6fpnWlDSgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 19:10:47 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 447FE18B0B8
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 19:10:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54AB810E60E;
	Tue, 24 Feb 2026 18:10:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="vq9S1z9a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010055.outbound.protection.outlook.com [52.101.85.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4724210E60E
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 18:10:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N4Z7m3SkYl+rjBC08Ediy8WdpB2Hu6uMOv7QUWYZrK5wFaxoE/lWGXUep0naRatZi8Vzoqrp7SnVP+Gye5Dh8dL5RymeZzz0RniR/Ih3CvADVRY37nl4hHCddQOpRFhmO40EB0reaL/ha4xduijY4cR9HXKWAmlqcGrAGZ+Z5/rV1o4R4imDbxcN/1KGbA/vCnVs3zdgCUmwv6O3t8OYOYlIIAcjjnJM9B/Di4P0+6Z7luvepjeK4K76AwXRkv6M6Tnuph3ptBQ74OSDfnCeWRsvwwqt1bGmsD68PLvg9HCeRNeED1/IiVW/DHMy8wujiUu1IKFDHM4FrS5RX1jyPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sRcvAQ7/9BozLVUCTTFPnDAktnex573RQGPF2Rk/pSc=;
 b=Qt5cAzjrzG3ZbnWg9g77vK5srdmJhR+VBsp/Ocs+H+me7++qTUfz6fmgrrC348mb66Xl1offeOI7zqi3pxZRhJwnyTRs5qMeeaL0yCu43Gu4VH0xZJHUuRNPZe1UtSvOkhoN2Y4OEISMKhQAo4rTP6D72UiaKMgLOOsdq6C03FJ7KM0U9biNwHSoXxIecczbqBgfneuEnw9YXfEtEOY/+TRgkth9iBo8JfTQmsgDgv6+gT1HRnI1pByggVrD+RJu/vfVJ6pdEzszOz/AAoKp8XO4OVsp+2397w6foMfIvHcCADHxYIrVyoyjq1K7U+hgi0kFg1ZumYWgRzYZeRzz+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=gmail.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sRcvAQ7/9BozLVUCTTFPnDAktnex573RQGPF2Rk/pSc=;
 b=vq9S1z9akvK+0yK2PNfaYKyWuwJ5rxLxYrvSLT6ViOjTU7DsVHnvVnAEy0eSPH5sd+mGSzlP4SY18jLkBlpKcB/4//0AuCs9BL1RIwNx6mEQpPlkePyyITa2d9KOA/cDaz+px98HmqKqE+IFPQfUO7GZzGFxFJ4cPggYyaWU+qg=
Received: from BN1PR14CA0003.namprd14.prod.outlook.com (2603:10b6:408:e3::8)
 by PH0PR10MB997569.namprd10.prod.outlook.com (2603:10b6:510:37f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 18:10:42 +0000
Received: from BN3PEPF0000B36D.namprd21.prod.outlook.com
 (2603:10b6:408:e3:cafe::ad) by BN1PR14CA0003.outlook.office365.com
 (2603:10b6:408:e3::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 18:10:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN3PEPF0000B36D.mail.protection.outlook.com (10.167.243.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.0 via Frontend Transport; Tue, 24 Feb 2026 18:10:41 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 12:10:24 -0600
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 12:10:12 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 24 Feb 2026 12:10:12 -0600
Received: from [127.0.1.1] (antonios-thinkstation-p3-tower.dhcp.ti.com
 [128.247.81.112])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61OIABBU3186529;
 Tue, 24 Feb 2026 12:10:11 -0600
From: Antonios Christidis <a-christidis@ti.com>
Date: Tue, 24 Feb 2026 12:09:15 -0600
Subject: [PATCH 1/5] arm64: dts: ti: k3-j721e: Add GPU node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260224-gpu_dts-v1-1-cc5ddffe140c@ti.com>
References: <20260224-gpu_dts-v1-0-cc5ddffe140c@ti.com>
In-Reply-To: <20260224-gpu_dts-v1-0-cc5ddffe140c@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Frank
 Binns" <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, "David
 Airlie" <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, "Santosh
 Shilimkar" <ssantosh@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-clk@vger.kernel.org>, Antonios Christidis <a-christidis@ti.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771956611; l=1120;
 i=a-christidis@ti.com; s=20260224; h=from:subject:message-id;
 bh=Q0SvaaSfjWLXeTMGjWiDYSHfBUPvrvABnJZEnfcqWWE=;
 b=2g62liA+7HxwFBRNvct3OClW2aGqEkASSv+YXYVRsiZyOzJa4YArju5eK7+TViUsgzB9ic6ng
 pz1uLu96e7YANFhaG1jVosZ0X6keDSWtD2NBCdNBS3Fq2lNo0hOdIwT
X-Developer-Key: i=a-christidis@ti.com; a=ed25519;
 pk=HcbNQnPnde8WLoob9CZpry+ZyXrXg5+wessZiBGMaFw=
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36D:EE_|PH0PR10MB997569:EE_
X-MS-Office365-Filtering-Correlation-Id: 9eeea4ce-487b-422f-5e63-08de73d005aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YzE3UnVQZG1IT3drV3pONjNQTW5ydEl0b0d4MVVsbERKa3Q1ekZUZ0gyNHFa?=
 =?utf-8?B?M1NodzhJSEM4dzJxRXZUMWFGaHlwT2FJQ2ZTSEpJbjVEcFBaeGI4VktXdE02?=
 =?utf-8?B?WnIwQ1o4N1B2TXVUaUQ4WHdqZWI5MnZ2RWdKQ3VjZEVnSW5nVGJjbXFzVFhO?=
 =?utf-8?B?NlBmSVEyV1ZFU1EzYVNSZ2FCOW40UkVVMnU1cW9VbE5jbjlyZlJhZHBWdXJt?=
 =?utf-8?B?eEk5a0ZEdERLNW40b2Q3T3FSYTRkOFpEdlZsRFh3VmRNMm1WdkZBVTh4Z0k4?=
 =?utf-8?B?aGpvMldVa090MVVzQXpRL1puNE1LckxFRXBudVZOcmpzL3BxcHhXN2NSZlFZ?=
 =?utf-8?B?MmYxSWRXYlR0RUxDb2k0a253UTNVSW10ZU5IL1VZOE1zSEhCbVR6ZnVON0FV?=
 =?utf-8?B?aENuRFpPUS9CdmIyRnhYQzZLTWhkQzUzS01McTVaRHdpMVI3Mk8vRFM0VURw?=
 =?utf-8?B?UTdYQW9FMVRpeDNXMmFpbTA5dDU0eWhyeGJmMU5nY0xHRHYwN3FrRkNvY0dp?=
 =?utf-8?B?azlDaWpkRi9GQWJWS29EY0pJN1ZReThRMEFvOFV4VE5MeFRqTnZBSmVJZEJ5?=
 =?utf-8?B?WCtyTkJlTjUvVFdKT0FOcjdwMW1vY2tKRTRJdUlZYVRYZ21iNThqUHBSRG5D?=
 =?utf-8?B?SlZqdDhGbmp4YWxRL1VJdEl1U2VIT1FJcHJQREcyLzBzSnZ3NHdPald3czUw?=
 =?utf-8?B?UmQzUUNiL0JUOFJITGZWT1hWdFpCc0pLWXQ4blN1SUFzZ0NBL2JKSjNKUU11?=
 =?utf-8?B?MnBCTUYzK0NZem5mRTE4QUxudzZhNGNtU2VLRXdReUdac1ZXRjR6bHZ6Mzh2?=
 =?utf-8?B?bU12VzVxbHZObGRabU1lY0U0K0FFN1VOaWVaZ0JWb0N4UEwxOVVpdjlWQzFG?=
 =?utf-8?B?WlA4d0g0ajl3a2hvQUlLclExVmxlRzZ5SU5yK3JaQlY2ZjNuZjduT1htMXJJ?=
 =?utf-8?B?Zis3Rjh5TFEvWVphNjdDUUpETm5sbGRCOVpuNEYwaDFrR29PMy9ydDFmOE5m?=
 =?utf-8?B?TlJBWm83dllRMEJhWlJhR3RMMnFOZWhQeU8vQzNPRDVtOEpXdndxL240cjFi?=
 =?utf-8?B?TzV3RUtaUS92QlpNYjVwNVUrQkNQUGhoVTlkY3dnUEM4cW00dktjWlM3TUU3?=
 =?utf-8?B?ZHh4N1lpbnhZU29qMkxQSWtFd3pnQWc4aUNseVZiUkZjU05XODZqN2dSeUF1?=
 =?utf-8?B?VHBCUDIyUUNiYU1nYnpQMHVycExxY0NrZE9IcVFzdkF0ZE1GamxkUlpTUExx?=
 =?utf-8?B?bUVWRHlFbzlxREZtaGZ5QkM3L1g0bG9GRVhqQ3lHYndZZFlnTnJKalFrMkxj?=
 =?utf-8?B?dVdQUC9nT0lEWXdDODZYZ3dnTzhoSTl3VGlQQjFPVU9yT1dpVlF0TC9BbUk0?=
 =?utf-8?B?bkFLVENtN3l4VEJ1NEc1M3lOSmpERGQ5dGp1WmNpbU4xSXJ1OFBXTENQMlFj?=
 =?utf-8?B?RmduZ0NtbEtXM0RLVjB4Q0NjYWZKc3VpTHNxQ1BaZFpLRGNCWWdyaTVXdEJL?=
 =?utf-8?B?UlRPcHQvbVhJWXZMRVFoQno0VloyTC9zTU1TWFFTNnhVVEcvZksrcWpBRXF0?=
 =?utf-8?B?NVJLS1BZV1hlTEFNVjhjdUxZbmFkN01rMzAxajBsRG13VVdveXE1OUM3SkNX?=
 =?utf-8?B?M0RjYldzYWNtaGpraEZENWNnRkZNbmZQZWhUcVJLK2FiMWZ0eG05cTRvYUtV?=
 =?utf-8?B?QzN2MzBocnovSENqU3RaRmtBOUU3MCtSRWt4WG1pemNrRXI5L0RwNTljUGFW?=
 =?utf-8?B?ekFrVldHcnQ5NTcyVnBnbmVSQ3lUWmFSZFNabm9VRnA4V3hvbEF5bjB0NWhu?=
 =?utf-8?B?clpoQ3VHalYxK0p2MFlyNnhJVC9yU3hWMi9CRUNlYS9CNUY4WWdMMFo5NkNy?=
 =?utf-8?B?MWp4VkV0OThXT0V2djE4SFJsRDA1YW9qWUlCampObE4xRDVUZWhQN1VkWksx?=
 =?utf-8?B?L2xxdk1oenJycE9EQ2UzVHNPNHJhbkdqckZrTWpPVlJzS1J2V2hVVEhERFkr?=
 =?utf-8?B?ZERZVTI2bWp3VGxLN1ZndnNEN0d3MmlJQVE0cjRPMEFFbEdUcFNxdTFuNURq?=
 =?utf-8?B?RERpZVcwek1CTVU0OXM3S1hYa0s4NzhKTTJyK2tCV2x4UlpLemhzT21IQ2RM?=
 =?utf-8?B?Snc1eEhwRUg3MXJFVUVBMXFXU3BaTHJBMmdCTFBQNWVPSVgrTG1mblBKbE05?=
 =?utf-8?B?YTVnMFNwSVByajZIcUhEWHR0U0R1ODNVVGcrbmNGUUd0b01XaWU2M20vejR5?=
 =?utf-8?B?UkhQRHg5WHljL256K2pzVUh4dXZBPT0=?=
X-Forefront-Antispam-Report: CIP:198.47.23.195; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:lewvzet201.ext.ti.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: CUNZsEnKf9uf5IXKFjMnInOUVf2OTfAZT5k+emcICw6JZsnGqiLwk6SRkRhBaiApZ/I6sTUjpW5ojdTlOigpor3r3q6JYvW1Imd0MLzkM3di6j5qSjxTsje2KlBwwck66pVRmXtl1UvOFKyIW0P/5mMuPqItlNSUtLmASHTWEou+rA/XIydTPJFTyFaua+ZKewNX9C9X1MRy8K9qFE1iapxleGOd2SaEb1eimJBabhzOACbtmPA6BZbdT7IciXIify0sbXhEPUy7OHy8ZbH78wgtBvg+AaNxdCS7xT0HA8l+VliF5pfxGmD4mEbhr/yXddIIYI8aIxj1Ke/v3DfvkEVrrX/pX9MG2IInZlBXFx2zBkLfkjm9M7kWZZ+idirQDGHgCRjjyeqdVGshHLVUkXqP5GOiUkrvvv2u3bphZjLc1j2jU4tLjcqj7LMJyr05
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 18:10:41.7468 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9eeea4ce-487b-422f-5e63-08de73d005aa
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.23.195];
 Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B36D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB997569
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
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[a-christidis@ti.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:nm@ti.com,m:vigneshr@ti.com,m:kristo@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:frank.binns@imgtec.com,m:matt.coster@imgtec.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:ssantosh@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:a-christidis@ti.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[ti.com,kernel.org,imgtec.com,gmail.com,ffwll.ch,linux.intel.com,suse.de,baylibre.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,ti.com:mid,ti.com:dkim,ti.com:email,4e20000000:email,0.0.126.144:email];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[a-christidis@ti.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	DBL_PROHIBIT(0.00)[0.41.54.200:email];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 447FE18B0B8
X-Rspamd-Action: no action

Add the series 8XE GPU node for j721e device tree.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
index d5fd30a01032..be91e7a2afe5 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
@@ -2624,6 +2624,20 @@ icssg1_mdio: mdio@32400 {
 		};
 	};
 
+	gpu: gpu@4e20000000 {
+		compatible = "ti,j721e-gpu", "img,img-ge8430", "img,img-rogue";
+		reg = <0x4e 0x20000000 0x00 0x80000>;
+		clocks = <&k3_clks 125 0>;
+		clock-names = "core";
+		assigned-clocks = <&k3_clks 125 0>;
+		assigned-clock-rates = <750000000>;
+		interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+		power-domains = <&k3_pds 125 TI_SCI_PD_EXCLUSIVE>,
+				<&k3_pds 126 TI_SCI_PD_EXCLUSIVE>;
+		power-domain-names = "a", "b";
+		dma-coherent;
+	};
+
 	main_mcan0: can@2701000 {
 		compatible = "bosch,m_can";
 		reg = <0x00 0x02701000 0x00 0x200>,

-- 
2.34.1

