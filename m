Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF671C25A1F
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 15:43:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C4A610EBD1;
	Fri, 31 Oct 2025 14:43:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="P8R4e0rN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azhn15011001.outbound.protection.outlook.com [52.102.149.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D45E10EBD1
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 14:43:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cQoHTsMrDv+farJrB7xlJ3l9jcCwy516xdAPcNYUPqIhB8WWuMhYlX+3/hlOTBEAfAcwfKV3/dbLhDnmOOFIr8VSMyPunu0eH4fYaPPgis9A6COoBMrroNmm1Z86nMJRHeGVov8XWtqWXR5HYcptzUc5OWmmYvHptttVa6QC+PsX3E5LIl3tzVCI6iGi0PHk1LNu5n8Dzc3saUoD+qgnsYew9P5sXcGGyORCJHXEgDYJmK/7TEOJiLIzAnt7Dehj8bObetu6yU8+6R6K1Ef08UfUv75yZKAAghl3bVJVT7KPjM8LstyWGZ8QxCIAyUOoIv9iuP1eYNTEOp/XyJQTDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Senli/gUTlb94KaG2bqE9W4PmPXuV1AXKru6PJLwQu4=;
 b=a5dkskM17OZrtlvQlHnY4oegPgmKRxreXswZIOUvv//XZxsOgusK5KhIvfbm3h0ZsKA65ewwjWJ7Zz2K5QPB6kE0gH/ysGWF3CcuSbcrzbJs0K2VaZ6/tqEbFvWkravVemeMriQD1kMABrgn/zqIF0pi8zB2zIFMFSeF67pxII2gKdDqKnIIyNeB0QF1mQCs0+ecyBTOhUhfEFlUpqI0dm6ekAf9fCAtJ0eAwrkvvxbwOS1D3qGREmPr+ud0/6uQ9F3akswyO6exwflXjmmRTK/FnTgS0ek20zJXaRd26qUctt8D4bS66aItabv5jYSw6guJ2xzV8kOVhvp7tx+ivQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Senli/gUTlb94KaG2bqE9W4PmPXuV1AXKru6PJLwQu4=;
 b=P8R4e0rNASgq0y208QX7AI9Dfj4I5TDfQYlO7hNFjEpd5G8ODTbKxiHpVM5e5ufBiAzGRgW+dHSd8Cemrw/+SrzjOcdFhTjVhhAYv7PqlW4N4jZB6TVA7GHx1q6gqRjjabx2Clz3pzLsE2t8RLSv0pu2RmDqw73xR/qr7iuRntk=
Received: from PH8PR20CA0013.namprd20.prod.outlook.com (2603:10b6:510:23c::27)
 by DM4PR10MB7526.namprd10.prod.outlook.com (2603:10b6:8:17f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Fri, 31 Oct
 2025 14:43:21 +0000
Received: from CY4PEPF0000FCC4.namprd03.prod.outlook.com
 (2603:10b6:510:23c:cafe::2b) by PH8PR20CA0013.outlook.office365.com
 (2603:10b6:510:23c::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.15 via Frontend Transport; Fri,
 31 Oct 2025 14:43:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY4PEPF0000FCC4.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Fri, 31 Oct 2025 14:43:19 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 31 Oct
 2025 09:43:18 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 31 Oct
 2025 09:43:17 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 31 Oct 2025 09:43:17 -0500
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [172.24.233.103])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59VEgf5d4024498;
 Fri, 31 Oct 2025 09:43:12 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>, 
 <conor+dt@kernel.org>, <jyri.sarha@iki.fi>,
 <tomi.valkeinen@ideasonboard.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <aradhya.bhatia@linux.dev>, Swamil Jain <s-jain1@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, <h-shenoy@ti.com>,
 <devarsht@ti.com>, <praneeth@ti.com>, <u-kumar1@ti.com>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/2] Enable OLDI support on AM62X
Date: Fri, 31 Oct 2025 20:11:01 +0530
Message-ID: <176192142803.427883.15770841375412671810.b4-ty@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250913064205.4152249-1-s-jain1@ti.com>
References: <20250913064205.4152249-1-s-jain1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC4:EE_|DM4PR10MB7526:EE_
X-MS-Office365-Filtering-Correlation-Id: 39c6b8cb-e1e0-4f60-9bff-08de188bd587
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|34020700016|36860700013|7416014|376014|82310400026|921020|12100799066;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?KysrK1JKeVIzejUxOGM4NmhWY25Jb0JNUS9BKzlPME9tT1RENVpNcWhSenJr?=
 =?utf-8?B?aWdUYUxHc0loUjQ1MHlJVm1scFllQjVFbU1QdTY3RElWVEFtQzJPdTFmSVJw?=
 =?utf-8?B?akh6c2s2citpcUhFUzNod2JQaG91VXRBV1NxQUxSRXFNSHR6TU9HRTZocUky?=
 =?utf-8?B?YnErVlkzYnYxbmZmZU8zb0Zpd3U5K0N5YU9BUkNXUjFNVys1c0xCVHZGSkJm?=
 =?utf-8?B?c2JrSGVZQWpKd1ZVQWk5SHlyQmxaQjJpaTRYbXJGYjNaZHZJZVFaTFBFN01C?=
 =?utf-8?B?aE45WWhsVGpmMW9KS213clQyZnpaRXBVZlJiWkJhUWQxZDBZUU1ubXVETlpB?=
 =?utf-8?B?TlF3OVI0eHJyUnpkRDJCcGhaOW9KU2xLemxwUTJpQUEwVVpxVUtNS3hJY202?=
 =?utf-8?B?WFB5dGNSUXFScVMxUk12MmtYQnA2VXAvdjFCUHlNMWVUQnJtNGFxNENKb2lO?=
 =?utf-8?B?UHFEYmM4UDFVMnduaHRuZEplSG5vbVhxK1FKbTJDN0E5UEVpTEM5cUZnZzVH?=
 =?utf-8?B?bENEaVVpZTZYQjdyK1RnaW44QTZLSnhnTFMxZXREamtvQ2hsTjVVZWNxa3Ez?=
 =?utf-8?B?K0xHSGtwVzFVNU85TGF5MEZxMllHNHIyYm1HRnZUbS83UDNNRVIvOHNNaGN1?=
 =?utf-8?B?SVZKWThZanVvamsyaXNzeTZVWGxuMytCRGJNbHQweHAxMmtGbGVvY29tN0xy?=
 =?utf-8?B?UHdnTkpQOGx6Wk1UNU84L1luSEVTNVc3WWJmR3lySExMZytTMXM4WWl5Tnk3?=
 =?utf-8?B?ZG1tNG41SlhlVWFaRWZJbnlQb2lpZ2EyWVQvNnVqZUVXQ3lDNWdOR0hCZWxs?=
 =?utf-8?B?S1Q5bFl3eEtnRWRKdzhIeVlyVFZadWd4OWtDYkhmdXNHNE4zM0ZKVVUxK0lZ?=
 =?utf-8?B?LzRBRHNkMmRvV3laeWVPWmw2QXJVTmlLdUZBSHkvUFlxa3J6WHZ0YlZ6UEoy?=
 =?utf-8?B?b3gxOEtTTkJJT2Zua1RscTdEa2EvS1dzSDJsM2VLWk5rN0JuRkFvWjIxTnky?=
 =?utf-8?B?WVc3cGsvcnE0OWNWVzJXK1psbERXcmxjQ3pJMldYcDBpbHRYMU1FTVdyT1pU?=
 =?utf-8?B?Nk9McEk0Z1B1SUpzbnFOSnRWWDl6NlJvMVpBWDFuejNYaEppSjBpWWhoRlpH?=
 =?utf-8?B?SW5FWWNLQmFKRHZmNmNMbWQxMmlIMkRuckNZdkpaT3c4anhiazl0VitQLzNG?=
 =?utf-8?B?R21GbFVrUWNTaVIxTHFCQTllQktGdFExRWw5RSs2ekpNdGdyVktBQjdIM0pT?=
 =?utf-8?B?UFREUXVwZVdFU0ZjTlNjL0lMbUpKS1NiaUt1azFpOEQxRjhQa1RCa1k0aW9i?=
 =?utf-8?B?dndVamtxczcrdThLMlBOK1lYV0syZnNNcFViVk45My82dFMySUNybWZaT3N2?=
 =?utf-8?B?ci9ZUHBvL3B2VFB4TUY2alZpeDVxOVFXazZDWitxZmRoSG5vNHBMUjIrcWFY?=
 =?utf-8?B?b1RqeEpySzJ0cHZUZFluR1MzTkN6SUJXckN3OTJqYlVUaDA2eWY1dWhjYlBI?=
 =?utf-8?B?dnlVanRXZXQvNUYxaUs5dENPbkJyY3gyUWNJZjFkbVVrUkNqZzdzQ2dzNGF0?=
 =?utf-8?B?TU04YUN6S3RMWXlDNWI4cDlFOXZhTGtGT1lwallIbno5WnNOQ2NtcFRJbmN4?=
 =?utf-8?B?OEYvVVljcTF0Uk9wSXF6b0cwNUZRbFFPWGJsRTJ3Y3dRaWZUZk8vbTVLU0xo?=
 =?utf-8?B?MEU3RllSSFY2S2lMU2tQYzJwZDM2S04xTXFHbFlrTDZ1elVtbS9WYjdkcjcr?=
 =?utf-8?B?MW5sRGRReDFRdkpkRTNiVWFIUzc1TkxWOStKVWIra1ZkRlVRbURXeHFOaDZB?=
 =?utf-8?B?SnJSaHd5ZUJ0WmJHeVVHMXZ1Tkt1ZGZWRVRuMmpjMkxDU0d0VDRwdU5NN096?=
 =?utf-8?B?SjJWdlIyZEY4SmNZWW9XOEpBK0RyVHJxUE1GTlRzTXVLWWtDT1BRSjlYK2JN?=
 =?utf-8?B?ZnBzMjdsVWVHU3IrN0FTci9wM29XWGpxcVc4YTIrZktxUzhLSTFxMXNOdjA0?=
 =?utf-8?B?SnJFdWNQNGMwQnVPOXloNWtWc3Zvb3BwWFNMZFRtN0U0MVBXQmFMQzFnVGUw?=
 =?utf-8?B?d3lGbzlYMU45aFBhc2NUb2hqeWJWOWFHTmRxSDZXYW9pZ3JCZHQzOUdVYnhT?=
 =?utf-8?Q?Gzlo3xM/9TNvZLxaEDgVqJn6e?=
X-Forefront-Antispam-Report: CIP:198.47.23.195; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:lewvzet201.ext.ti.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(1800799024)(34020700016)(36860700013)(7416014)(376014)(82310400026)(921020)(12100799066);
 DIR:OUT; SFP:1501; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 14:43:19.4382 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39c6b8cb-e1e0-4f60-9bff-08de188bd587
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.23.195];
 Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB7526
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

Hi Swamil Jain,

On Sat, 13 Sep 2025 12:12:03 +0530, Swamil Jain wrote:
> The AM62x SoC features 2 OLDI TXes each, which makes it possible to
> connect them in dual-link or cloned single-link OLDI display modes. This
> series enables OLDI support on AM62X[1].
> 
> [1]: https://www.ti.com/product/AM625
> 
> Aradhya Bhatia (2):
>   arm64: dts: ti: k3-am62: Add support for AM625 OLDI IO Control
>   arm64: dts: ti: k3-am625: Add OLDI support
> 
> [...]

I have applied the following to branch ti-next on [1].
Thank you!

[1/2] arm64: dts: ti: k3-am62: Add support for AM625 OLDI IO Control
      commit: 779ea073dba35a8f29c8403684c6e0177504775b
[2/2] arm64: dts: ti: k3-am625: Add OLDI support
      commit: a00ee8014d5b6bb00bc41d7fc947fd52f53c9209

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent up the chain during
the next merge window (or sooner if it is a relevant bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
--
Vignesh

