Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPM/Katkf2lNpgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 01 Feb 2026 15:35:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12692C62C7
	for <lists+dri-devel@lfdr.de>; Sun, 01 Feb 2026 15:35:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5020F10E0AB;
	Sun,  1 Feb 2026 14:35:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="RNnt7vkC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010028.outbound.protection.outlook.com [52.101.46.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A1B910E0D2
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Feb 2026 14:35:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vPjYBogiFIH4iqvCnqp9HxZIlmUiyxbwmBZiT/NHrfsfa5PRZo6rgV6YETTRd/RyGs4mPoXJqSznf/OB1PFAK20KQpOSZcCjJogUnGQ0aGwmB/7v7yjLh562Yw7LQucMbFSmPC25Du9PVFaRHBGxv/VtFHlJy95W6TnzT3b7RoqdfA0m3M5vQfVYB0tO4OVkAx72ic4lPbVCHq/+Ed81gLmj603q+HsA8i7ohvqULydtufQgJ4EcL1UiIN9WhjIGEU7Tn7mcYkgbLuo3rhdeERBJPt2LIGsgaVZqbRgWPWp1Xmo6Q9vDJAJVTIM1f1irSWgkqXTn34yKduDbaz4/Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CqQjI1+i7zIp2HLfkd0TeFGaF4Ig+F/CBt8oFBlJzlg=;
 b=xMNS5f9Yb4FyLxsFHGRm/tllVmzwhAdHiprlJqIiulQuRTvDKkqHj3EHmBVrK0Cd0sEnJNhjJTJV5eSIgUfNBMiw9A72rPTXSU5GlA5GZ7n4kaeGnbl9wil7gRErrSx7M/abINhZ/Hi3oUw1yMNL5OYR2cPWzL5hMeB/bFHNDwAcgBQCI8rvGPcTjj0TyxqJkkiacoOz5vRcD0KxjlDOr5MzULJXd2HftvQgp/YCkAZEeOOcGlvPEvp9U2GSXxnXUkoUAdK4gAJ55gSsDQGRaiBaRnW9c6rFF1TtimZ8VEjPA64yjWf8DaB6jh9sTTlzw6ReEiUTK8yOJOhixpny8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=ziepe.ca smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CqQjI1+i7zIp2HLfkd0TeFGaF4Ig+F/CBt8oFBlJzlg=;
 b=RNnt7vkCCAn3vqWaCQx5/bcuUewNs0mkwkzqVTgmFsuQ3P0t2ItWsRDWXJctt3N5IhjIP/HzuU1eBGphuFuy//9JOvmP/SeaKr+PQc723eI7uR2j6wcWsNDiNGxEqdN1oJwViMYr3rxWc3BIQL3TqmeSBkrgo4kuwnkjFwAK26eq/I2xETR3Aeqil4dlIc+X7KhYagfpkVkHhj3MV3ZAxnwHBCTD7FilwiKMRzsBCV9fVAGBy6K41DtJuhhdKSS5o2XRWQAXBSZ5hGkOILdV5jC2vhuZD+5x6M4/6F0FZr10tP0wfeROUVMOP6TieRnf6uDiMS42sMvqha2ri99CCg==
Received: from BN9PR03CA0060.namprd03.prod.outlook.com (2603:10b6:408:fb::35)
 by PH8PR12MB6916.namprd12.prod.outlook.com (2603:10b6:510:1bd::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Sun, 1 Feb
 2026 14:35:15 +0000
Received: from BN3PEPF0000B06B.namprd21.prod.outlook.com
 (2603:10b6:408:fb:cafe::59) by BN9PR03CA0060.outlook.office365.com
 (2603:10b6:408:fb::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.15 via Frontend Transport; Sun,
 1 Feb 2026 14:35:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN3PEPF0000B06B.mail.protection.outlook.com (10.167.243.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.0 via Frontend Transport; Sun, 1 Feb 2026 14:35:15 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 1 Feb
 2026 06:34:59 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 1 Feb
 2026 06:34:59 -0800
Received: from c-237-169-180-181.mtl.labs.mlnx (10.127.8.12) by
 mail.nvidia.com (10.129.68.6) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Sun, 1 Feb 2026 06:34:56 -0800
From: Edward Srouji <edwards@nvidia.com>
Date: Sun, 1 Feb 2026 16:34:04 +0200
Subject: [PATCH rdma-next v3 1/3] RDMA/uverbs: Support external FD uobjects
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260201-dmabuf-export-v3-1-da238b614fe3@nvidia.com>
References: <20260201-dmabuf-export-v3-0-da238b614fe3@nvidia.com>
In-Reply-To: <20260201-dmabuf-export-v3-0-da238b614fe3@nvidia.com>
To: Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, "Sumit
 Semwal" <sumit.semwal@linaro.org>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>
CC: <linux-kernel@vger.kernel.org>, <linux-rdma@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, Yishai Hadas <yishaih@nvidia.com>, "Edward
 Srouji" <edwards@nvidia.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769956492; l=2919;
 i=edwards@nvidia.com; s=20251029; h=from:subject:message-id;
 bh=sVKb3nq/MHyjSi6RiIWEpVeGvtgdrTgJi+GqWpgSRhE=;
 b=TDeA41ostJZxvrNONlRI8EKJfPeCBTjtDL71LgGCet1DLymy872nNr6YIFlxb9triQmz6O62h
 HW/Z7AjTe/ZBiUp8NR5lzWRlWYFpMX3q+RrRKyyu3slZuB7ySthyRuT
X-Developer-Key: i=edwards@nvidia.com; a=ed25519;
 pk=VME+d2WbMZT5AY+AolKh2XIdrnXWUwwzz/XLQ3jXgDM=
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06B:EE_|PH8PR12MB6916:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a9e8f2e-96d6-418b-d7e7-08de619f1d6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?LzkwQ3dwS0h2Tm8vNWJ3enhiZFZBYVJjZk5hQkZpL2J3TTJadm5OSGRiSmRx?=
 =?utf-8?B?eW0zVGlteDN2ZTViNE52dlZQSWxRTjA0QTVOOGM4d0hKTmFJOTE0SzhtTWh6?=
 =?utf-8?B?RmZJeWovT2RUTEl2RiszenpwbGRWOUN3KzlISXE5U2Q1RXlFOHVIS0ZnU2pH?=
 =?utf-8?B?OGZ1L3Z4QW1KODErZmorL3AweFd5cDJDVHRnRUs5c3RnaE1jVG1PbTU5NnZQ?=
 =?utf-8?B?Z09Uck9aYWtRVWtTWml6clBma2MxUzVmNzJjRnJ4Q2NTTTJkR3pmOVQvLzFT?=
 =?utf-8?B?R085K3FuY2hpWTUyYlNNTzFuNllieHk2ckhER3Nmbmc3YzI4N21JajRUVmFr?=
 =?utf-8?B?VlgvcHpxNEs4QW1jQllGWmFBTG45dkdqSjZSQmd6ZDNiWXBKcUJ4T2RKdHdk?=
 =?utf-8?B?ZHRnTVZZSjVOYVQ3ZzJzck5yTGxIUDVIUDJ4VUhXdnprQlFBNkMraklLVW1m?=
 =?utf-8?B?eE5sazNrTHFIMmJMNHVLQUxSK2VPWkc5WTR1T3RxMVpiektEQ2ZjVU9zZk5J?=
 =?utf-8?B?eW9Kc1FTOW8zcGc3ZEgrcE1uOXF5YVMzbE92YzBXQ0ZCS2N1cE9NR0paZitY?=
 =?utf-8?B?M0Y5Z0pVRXhPa3FPU2d1ZzlJQmFZT3hWRnVzTXBRQkRMc1JVOHlaNW1xMEUy?=
 =?utf-8?B?YUh5a2tGQllzM25TVWk2QjBvWUUwRk8wbWhEOGZNNlBEM0tJbjN4SDlEbjVa?=
 =?utf-8?B?d2FhcWtJdWNHOFFjQ3l6eFdYdkU3NHJ4bnQ4eTMwSFhRTmF2eTcvb050YUNJ?=
 =?utf-8?B?MjBlRlpFaHZtSU45TlpqUWY5QTZYdE5XQW1xWlpFTnhxbStLRC82VnRhT01a?=
 =?utf-8?B?QXhXaFhESjJrRGxXUEh4SGxYNDltd3kxSFllY1h0L0g0eDAxa0hraXIyUkpw?=
 =?utf-8?B?ZDZEYW1xWkZaK3ZKdjlPNCtLL0VJVkh0Wjd0Zm5zWHAwU3orWWVXSjJYb0pZ?=
 =?utf-8?B?YjVDaHpqQXJhTFR3UTBIdC9mVTlRWXFERTFjZXllcmFFRlRvTTQvcWxGWXV4?=
 =?utf-8?B?UGxlNHB5dzFqRUI4dHpQL3N0Qk5xOEZoL3ErYVFZeUNIcmZZbXRGVDVibkpS?=
 =?utf-8?B?WGp3MXdPUWdmdlJJbjlacWcxb2dBemlJQTBHZVVONi9vbDRXQUVZMDNJQ3dN?=
 =?utf-8?B?RGlEVGhsQ2QzRjcwWGlkTzB3TjZCMFdBN3dwYUxQT09hR2FzSVRvTTZHSkJv?=
 =?utf-8?B?aFo3cXZOTG5acW0rWEtrQkxMVytKcFdtWm1qOFpaSDQ1aXhUMmk3M3NHNTBZ?=
 =?utf-8?B?elp3VzZQQ2xpYTRLVjkxQzBwL1JBK1AvQXJDa2RPalNEaDkwYURKSWFRaVln?=
 =?utf-8?B?aVkzcHBpQUcrUnlaQ3RCZm5PMVRXVVNFNlcxcG5ROUdIU3lXa2NDcUxQNitG?=
 =?utf-8?B?cm9MNDMvTko1MnRhWFJQa0FSWFY5V0RJckNMd0FqS2psYTlDMnN5UkRnNUtV?=
 =?utf-8?B?anRkWWlHWHE0UWw1N3pTRlhEdkIvZ0V2Ty9Sd3hXK2l6UWwrdE1TS1kySk1i?=
 =?utf-8?B?ejVnM0VYeEdWOFlzVE8ybThDNlhkbWxkcnVmMWhlT2NGbVBwam5LTG9lRFJt?=
 =?utf-8?B?RFZ5VjFycW95VmJIRTJJMU16K0dlSXJJQlFsMEtaOEpKcEpLbWl3Z2RkY1BP?=
 =?utf-8?B?VVdpVVNaZWFXbFE3RUNUcHl1alVNeTBLeENBWjJwTEc5MjhydXJMQzVMUUx1?=
 =?utf-8?B?T2pPSEVpTlU2UVZLeHpuaXRUdHl4SnM5ME5aV25tcnBlR1loTjJBRnpoci9C?=
 =?utf-8?B?Q1JaZXFhb3lwVk1HejdVRnFWdWVjRWNqanJ6YkdUOS9rN0V3UDFPWDJES1V0?=
 =?utf-8?B?TG1JYnZsMkUvKzB0VlB6ZURoTlFEMEVLVzhpZXRtSWxTbEhlMmd6VVFQajMx?=
 =?utf-8?B?NTIvQ29GOXBTd2lOeEQrd1dwc3RqMFNQZzRud0JZNDhxd3JObFpOenQzL1Ew?=
 =?utf-8?B?WVJMUWVwWGpXeG5mcWJPVXN2M29RWDZUcW1qWEJKamd1UCt0cDI1dTNpS0lt?=
 =?utf-8?B?eVRKN0owTlFyTmJVUzE1eUdDUG5wc281aGxpWjhSaHBzcEhETFM5ekx1Yjdy?=
 =?utf-8?B?Z2oxN3A1LzJZZ0IxeUdWTDJlNmxZRy9McExCSHJ1bEJITCtwRHo2UXFnK2RZ?=
 =?utf-8?B?TFo2czkzMGdmT3VxZXliQW1pVkVEMjJpOVFkcEI4eEgrbm0xd2hqa0lrbTNr?=
 =?utf-8?B?NFI2ZndkTmtPY1J0ekttd0ZGTTdsNkJhM1JGMXFrSlBGQk9sU3NIWGppMUxo?=
 =?utf-8?B?Tml2UXRCZVVoWlAxK2FRNXlPbm1nPT0=?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: WLc3j7WPSD7ETnpsN5OnfYFgq/SBZ8dBin10YcfTOyAGGAB5yyRhUjwv4cwbIA+poP3AjL0FFz1b1pursY9TVlKr/jAAKpZNcMjyIV6hcy9R61cMWGjpD+SvfncLu27KZneTRCQXQNrr0qOc6UDULMTdrsQYd88SFBHgC3G9E4u+YDZlVZ2zxz1u/1BWZ0J/kKteTKuoP983yMWK/wqb/UX3KzzBHONnMFWDw6CVxHTaWu+anQJAYwwoYullCMVE3kCfOOZ2x7J6OQJZJlqyeTGqGtDEqjL4Y97giD/79sMPsFFZGUxYsL+R//ZSOfk8VEOw7OPdL84h/SRsH2EANyPajbaRS+7xaXbOFLcwF5BFJtRKYz90z7IbbNtXMHY4KWPONil9YoaCSGCCYJB/j0Z86zDVhgXeE7T7yE9QH5v//L99cPV+Vp+lggXuxrKv
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2026 14:35:15.2597 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a9e8f2e-96d6-418b-d7e7-08de619f1d6c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B06B.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6916
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[edwards@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_RECIPIENTS(0.00)[m:jgg@ziepe.ca,m:leon@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:linux-kernel@vger.kernel.org,m:linux-rdma@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:yishaih@nvidia.com,m:edwards@nvidia.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[edwards@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 12692C62C7
X-Rspamd-Action: no action

From: Yishai Hadas <yishaih@nvidia.com>

Add support for uobjects that wrap externally allocated file
descriptors (FDs).

In this mode, the FD number still follows the standard uverbs allocation
flow, but the file pointer is allocated externally and has its own fops
and private data.

As a result, alloc_begin_fd_uobject() must handle cases where
fd_type->fops is NULL, and both alloc_commit_fd_uobject() and
alloc_abort_fd_uobject() must account for whether filp->private_data
exists, since it is populated outside the standard uverbs flow.

Signed-off-by: Yishai Hadas <yishaih@nvidia.com>
Signed-off-by: Edward Srouji <edwards@nvidia.com>
---
 drivers/infiniband/core/rdma_core.c | 35 +++++++++++++++++++++--------------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/drivers/infiniband/core/rdma_core.c b/drivers/infiniband/core/rdma_core.c
index 18918f463361..b6eda2fb0911 100644
--- a/drivers/infiniband/core/rdma_core.c
+++ b/drivers/infiniband/core/rdma_core.c
@@ -465,7 +465,7 @@ alloc_begin_fd_uobject(const struct uverbs_api_object *obj,
 
 	fd_type =
 		container_of(obj->type_attrs, struct uverbs_obj_fd_type, type);
-	if (WARN_ON(fd_type->fops->release != &uverbs_uobject_fd_release &&
+	if (WARN_ON(fd_type->fops && fd_type->fops->release != &uverbs_uobject_fd_release &&
 		    fd_type->fops->release != &uverbs_async_event_release)) {
 		ret = ERR_PTR(-EINVAL);
 		goto err_fd;
@@ -477,14 +477,16 @@ alloc_begin_fd_uobject(const struct uverbs_api_object *obj,
 		goto err_fd;
 	}
 
-	/* Note that uverbs_uobject_fd_release() is called during abort */
-	filp = anon_inode_getfile(fd_type->name, fd_type->fops, NULL,
-				  fd_type->flags);
-	if (IS_ERR(filp)) {
-		ret = ERR_CAST(filp);
-		goto err_getfile;
+	if (fd_type->fops) {
+		/* Note that uverbs_uobject_fd_release() is called during abort */
+		filp = anon_inode_getfile(fd_type->name, fd_type->fops, NULL,
+					  fd_type->flags);
+		if (IS_ERR(filp)) {
+			ret = ERR_CAST(filp);
+			goto err_getfile;
+		}
+		uobj->object = filp;
 	}
-	uobj->object = filp;
 
 	uobj->id = new_fd;
 	return uobj;
@@ -561,7 +563,9 @@ static void alloc_abort_fd_uobject(struct ib_uobject *uobj)
 {
 	struct file *filp = uobj->object;
 
-	fput(filp);
+	if (filp)
+		fput(filp);
+
 	put_unused_fd(uobj->id);
 }
 
@@ -628,11 +632,14 @@ static void alloc_commit_fd_uobject(struct ib_uobject *uobj)
 	/* This shouldn't be used anymore. Use the file object instead */
 	uobj->id = 0;
 
-	/*
-	 * NOTE: Once we install the file we loose ownership of our kref on
-	 * uobj. It will be put by uverbs_uobject_fd_release()
-	 */
-	filp->private_data = uobj;
+	if (!filp->private_data) {
+		/*
+		 * NOTE: Once we install the file we loose ownership of our kref on
+		 * uobj. It will be put by uverbs_uobject_fd_release()
+		 */
+		filp->private_data = uobj;
+	}
+
 	fd_install(fd, filp);
 }
 

-- 
2.47.1

