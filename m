Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8NO5MaMvnmk/UAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 00:09:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3691C18E12B
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 00:09:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67A0310E645;
	Tue, 24 Feb 2026 23:09:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="c5/BkXbR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azhn15012015.outbound.protection.outlook.com [52.102.136.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B6D010E645
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 23:09:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FnZdGaeVnHmS+7EKn2CioXdFe/exQsTq+7BKWvguKPHQwDyAt2//UePW2oONRp7xy+TDgwdm1uKwnFNVshNBqwUEPMr19fBY6PV3qVL0DjQqZirrPO24D+ozBZJ7VhG38n42tskdbHXvas7V6RdcZhic2w8zbi48nLT6iUhUxn07Px8cY0jomT2r2czOtj8ClxTefl5nCsZERavE5Qy71ekBJvNtIniAavxAJVKW3wviWpSgeKsd0V/VRStjtfjnCdM6778EAJ/h1IlkPqrcMKTGagzLj6tmOrTNwcSsNeesoVhBlkr2lFnQm6JfFUIKUH2yRzoTr2ha81O8ipzBLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=grnaIQ0szOPwuFXbxYyIdIjkVQ7/zV9BQaWP7fAeU28=;
 b=Nz4u0VCCGuJIaFOp925N3Hy5uNhv+4ylNNNhxg04Uiub/dD7tLkvCmUISMo6pdpw77icVsJeJj/fL0pTXoSkJdZ/7nvGSu2DIkyHyKCZ4zCwtF+IrAPrXE6beFLyDY55IhKM+AjCm+QHspvp4vHhDP8e1ahUsVyhu6TKDMHIoRShdWRmWvyjxH7nvKcdZRisQ0KfipJHs84PtqoiGgW6+aE/6oqYoyEVA8ERY5bEuWZkSBOKGK0opoHSVKVHDuJqKjxmXGhasDKN2pVxxsKDHda6OgFVyIz62PRTBidYO7YHgAZh7OdjUIkZKMmQHRSwGDQN2zDin8CnxpwmmsSEGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=grnaIQ0szOPwuFXbxYyIdIjkVQ7/zV9BQaWP7fAeU28=;
 b=c5/BkXbRTHCogI3pxc1qs0pvs4zw5JAhROaeGM4aAtLHzx/okOHd27gGYfTIyIrSDXKvQmuSKwhkPXfMkq/F23lCQEM/lZyM6vVCE1D3JWvBP2p4zLQASP4FmM9ymK5QVkWjyu3px15m2zBp8vrD8/k4MYy5z57wb0wJ9LpuQEU=
Received: from CH0PR03CA0041.namprd03.prod.outlook.com (2603:10b6:610:b3::16)
 by MN0PR10MB5957.namprd10.prod.outlook.com (2603:10b6:208:3cf::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Tue, 24 Feb
 2026 23:09:15 +0000
Received: from CH1PEPF0000AD79.namprd04.prod.outlook.com
 (2603:10b6:610:b3:cafe::86) by CH0PR03CA0041.outlook.office365.com
 (2603:10b6:610:b3::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.17 via Frontend Transport; Tue,
 24 Feb 2026 23:08:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH1PEPF0000AD79.mail.protection.outlook.com (10.167.244.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 23:09:14 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 17:09:14 -0600
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 17:09:14 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 24 Feb 2026 17:09:14 -0600
Received: from [10.249.42.149] ([10.249.42.149])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61ON9D2L3066362;
 Tue, 24 Feb 2026 17:09:13 -0600
Message-ID: <26d186bf-fdf5-4bcb-ba53-7b884a95eb07@ti.com>
Date: Tue, 24 Feb 2026 17:09:12 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] dt-bindings: gpu: img: Add J721e SoC specific
 compatible
To: Antonios Christidis <a-christidis@ti.com>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Frank Binns <frank.binns@imgtec.com>, "Matt
 Coster" <matt.coster@imgtec.com>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Santosh Shilimkar
 <ssantosh@kernel.org>, Michael Turquette <mturquette@baylibre.com>, "Stephen
 Boyd" <sboyd@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-clk@vger.kernel.org>
References: <20260224-gpu_dts-v1-0-cc5ddffe140c@ti.com>
 <20260224-gpu_dts-v1-2-cc5ddffe140c@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20260224-gpu_dts-v1-2-cc5ddffe140c@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD79:EE_|MN0PR10MB5957:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f8cc727-ed84-4f1a-cc28-08de73f9bab2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|34070700014|7416014|376014|36860700013|82310400026|1800799024|921020|12100799066;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OXVBVkJNTWRWSkhKTm93TnYvUDhWMEUrK0lJVWd6SHFPMWZFMEFOQUV4NzRX?=
 =?utf-8?B?cE16WTlEZUVzTFN6d29rajRkaXMrVmNsTHl4Um5heFVLY1JmYW9DbUpYaEhI?=
 =?utf-8?B?QTZSSkRDNUwrUG5wU3l2U3duOEJLUXRUSlRMQzMxU2V4M2daY3BZSDNHay9a?=
 =?utf-8?B?cEdjNUNaUU1BR1Voa0ZmdFZuUXN3VFJWYkFLeHpBRTMxWjhsWEtqTllwZFNk?=
 =?utf-8?B?WWVpZ2o5ek1NREtTU1pKdDlrOTZIVlJXYTNUeXVXRmE0Zk5GZDBhS2RaNWl3?=
 =?utf-8?B?MWYxK0VuMmpTUFBvVlVsdTRYc3loSi92Z3ZyQS92VU1NYzVPUDgxQ0I5KzFu?=
 =?utf-8?B?R3h0MGtTeFZSRUdvV2NKTUZQUVBaZWwxZTNScEVqNE1lc0ZjMUhNWmswWnNT?=
 =?utf-8?B?RzQySDBzK0dTcXZ3QUhoOXhSTlJQakFJQkpVTWJxakdOSmxqQlcvSUtJL2Vj?=
 =?utf-8?B?WmNZY1hrcC8yQklQNHBQd2NTZVVlSk9Qd3NtMkVyYzk5NExwVnpFeXZMTTA0?=
 =?utf-8?B?VVNpUldQY2JuRDF3aEFja2VuOUxnY1AwdDEyMVlMSUw2QlBtV0hKNWtlQnpj?=
 =?utf-8?B?dyt2NjljUU5NNnU3ZWN3Zm1LTzBsR3FISGZEeGZ2VzFza3lkY0tPb2Jyc3Ey?=
 =?utf-8?B?bFZTOHQ3WlQ2VytKVGZLVXFpOE1qV3A5VkRwL1BocEdIMmgrVi9xV0c5WEZL?=
 =?utf-8?B?L3lNOWU4Ly8vczhIY3dYcGpMbmxSL0JFd0FOTDBVN0dTSjFqVloxbU4yQVFF?=
 =?utf-8?B?dHF4SjNIVWRRbGcwUHc3VVdxT0xKUXFGOXFrUk4wQmJQaFNDbnVZYXdJTWU3?=
 =?utf-8?B?OXc3RDJ3L1lsTkRvaEt1bXNjaWl5c3FGSXFLYkRvanBKcm56ZDUxN2tMWll6?=
 =?utf-8?B?Y1ZKem12M3ZsMUFWU3o5NFBCYWFwaC92c2N6OCtUeVZtbUkxakxIU2wxWHNS?=
 =?utf-8?B?SVZDZFZoOHl3YS9DVnZJV0JVUjh6M0QzdTRmQjBtemQ3a29wLzJSRGhxRGxF?=
 =?utf-8?B?dE1yVWtQdDl1MGdOQ2xxTVdoUGdVMForT0dGN21uNVJEZVpLU2N0ZGh6RUM5?=
 =?utf-8?B?L0srT1EwZm9vM3ZMNG82UnEvN2d0UG8vSUxLUVZ4YS9QRitCZWhxaUVjZmV0?=
 =?utf-8?B?TDhIQ0dkdkY4Y2JSd0hsVGRFUUZMQnhseXBGaG1ITlVzR00zL2wxWnhBUGlS?=
 =?utf-8?B?SkQ2bGF2Z0N3Q0xUdzNuZmQwTkY1NjVtWWU2WlVNaHJzZ1dtZG9KVzI4Titt?=
 =?utf-8?B?ay9qeTlheFhkU3JlUkdkbXJreVVjbUNyeEdkTUZRR0RNdVIwd3JXS1RqZzFz?=
 =?utf-8?B?ak01d2tTT0VJYStZdDRKS05rL0VlNDR2VklIYUJYeXZrbXZQbVBmOFU3bWNx?=
 =?utf-8?B?N2NuK0lnNGVFYnE0RHYrS2JPSUVNMnNwaFVBbjh6Vks0UFNIQnY4aVBhWkYv?=
 =?utf-8?B?QUtGZU1SNktIYkhSNnFqdVVldGJZcmJxUFZFTXJRMUh5RDBkQnJyeW1ndzU3?=
 =?utf-8?B?Rnp1cG15VVlhMjVmSzU2cTZ1b2haOE1xcitCU3l4Y3JrQXVpUVd5MDhlUGZs?=
 =?utf-8?B?Z0s0d2JRV29VUG1Wc3FML083V29ZZFNLY0VDY01NNUNkYXYvU3U3RzV3b3k3?=
 =?utf-8?B?blRNcG9ZL2FtRVRJWjJtYVlGSUQ4SThYQzVFQkFCbVExNnYrQnRsT2VjcXBs?=
 =?utf-8?B?TTVlK3FQa05BcVZHeGZTenppVDIxRjNUY2M2alJIcGNrOCtRUjNLNFJVQXRO?=
 =?utf-8?B?TkxZNThvOFFrRlhFR3FzYXgwNnJIYTBJZjVSY09IS1BsU01pZ3ZSZkZQTmdz?=
 =?utf-8?B?VnkzK3JZcHNDeTlreXYxSW96QjRsR2NzRzA4Z1RxSFpqQ0FYdjM0aXAwVUxk?=
 =?utf-8?B?Z0JCdU9pSlVpVkF2R21mN1NvZHAzVEMzcnlkeGZZOXFZdk84WmdZdFQ4MnN6?=
 =?utf-8?B?ZXVpSEJ3T2hDSXBrK25oWDB3MjJXU0ltOVhKdUVYZlpJNUZITTdVZFZiYXdP?=
 =?utf-8?B?aEErZ0JEK0dRT05OL2hXNHpMbTJTaTRlTERLeWl2bEluWFZpRG9oclZWTDNM?=
 =?utf-8?B?SG0wMmVVcWFKdHhVKy8rN3htalIvbW1YWjBsejdjbStkWVM1eW15SElFY3Z5?=
 =?utf-8?B?NExjeHZaMk9obFRQOXRXcHNEOW5GYTR1L1hVbXg2VzErSUpBc2JPNTBnOXBB?=
 =?utf-8?B?MDFOYjFGMEhQcWUvck1XVC9yNm9wYkJnbGtkL2ZZdlBHUTZGaE9qZFBhMlFL?=
 =?utf-8?Q?2wD/zup28DVv81PgbiiCD/4kC17i2IhcqjzfcBM9/U=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.195; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:lewvzet201.ext.ti.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(34070700014)(7416014)(376014)(36860700013)(82310400026)(1800799024)(921020)(12100799066);
 DIR:OUT; SFP:1501; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: UKWZnQ+GmXSTfe1UpWbqT/2CUm4jIuvdJgJXZKRjIlD2FlvGJxSfN4r65XcpYtNJLHksyyYQM83qjpECdms5MkjyWdX9EaBzwNC/g5gHdzYFKda4vpREpkTkJyNwQ1IwaMBC52llRsd66OFxs0gy9OIOJ70TqPxQY/DnDRnnYEygYuV9+AOetewPxVq9fe8Y+uBgQ/uuUyQ3CeyCU3vAIXucYNz4nHi6GNyvMFbrJiSw0oQPucUxj6dqd/bFh8jhUT2V9D+18zMkGcSaqevxPwyZdO+JjiMyVVDZFpmWYUOcU52B6aIIo2I+qe6orBHmLJ1wcps6oYKxRVRAD/MOnP1sRRpzO6+EOCN78EY1MMULwXhJD5yerBiyscnoU28ICC7lA9VHZkp9X3TTpSsbTcQ+4hYbAQc6k+2MQAApzw+HkG9HAo9u3CHT39QPrVER
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 23:09:14.8546 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f8cc727-ed84-4f1a-cc28-08de73f9bab2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.23.195];
 Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD79.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR10MB5957
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:a-christidis@ti.com,m:nm@ti.com,m:vigneshr@ti.com,m:kristo@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:frank.binns@imgtec.com,m:matt.coster@imgtec.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:ssantosh@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[afd@ti.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_TO(0.00)[ti.com,kernel.org,imgtec.com,gmail.com,ffwll.ch,linux.intel.com,suse.de,baylibre.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:mid,ti.com:dkim,ti.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[afd@ti.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 3691C18E12B
X-Rspamd-Action: no action

On 2/24/26 12:09 PM, Antonios Christidis wrote:
> Add J721e SoC specific compatible.
> 
> Signed-off-by: Antonios Christidis <a-christidis@ti.com>
> ---
>   Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> index a1f54dbae3f3..56249d1e65aa 100644
> --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> @@ -44,7 +44,11 @@ properties:
>                 - ti,j721s2-gpu
>             - const: img,img-bxs-4-64
>             - const: img,img-rogue
> -
> +      - items:
> +          - enum:
> +              - ti,j721e-gpu
> +          - const: img,img-ge8430
> +          - const: img,img-rogue

Leave the newline at the end here before the comment.

Also, binding updates need to go before you make use of them. This patch
needs to go first in the series.

Andrew

>         # This legacy combination of compatible strings was introduced early on
>         # before the more specific GPU identifiers were used.
>         - items:
> @@ -103,6 +107,7 @@ allOf:
>                 - ti,am62-gpu
>                 - ti,am62p-gpu
>                 - ti,j721s2-gpu
> +              - ti,j721e-gpu
>       then:
>         properties:
>           clocks:
> 

