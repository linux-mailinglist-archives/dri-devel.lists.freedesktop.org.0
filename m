Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3311AF8953
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 09:26:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5379510E95F;
	Fri,  4 Jul 2025 07:26:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="byXzmlba";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2040.outbound.protection.outlook.com [40.107.94.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0589A10E95A;
 Fri,  4 Jul 2025 07:26:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RKoen62ehCgwOGzPXxYRjdOnUINfyD1CN1U258pMdOGDx/Dv7/q38SMwdAO7wYtSgLfyx/4Rf34eV1mqZUsYsJ92QVQKd9XkvDvh+BsfJ+bPFviF+yAtBKOoDVC1S0WtP7T2ROzF2btfarsve768Yop0Tt6dfy91Ym0XJ3yXrER96LZsCfQYAOchbwe9KkzNt6Y/wjRdSPxl5RnyW1iDVm763nltf6u85H7XxhJH7HiYul8bFqnlnYYUwLah030H3MsL4lopUg8onVOK+iKHX5QD5jNSom9ga0g3m2IG9OehEwkRHHZ4n6bgCbKq9192mnJELGFAgAqjU2xZcy51QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mv5OVQdQ+6M2fpADlSUgstMcN9mjAi6gx7zJ0ds7TRg=;
 b=mUn8ON2lpKuZTTwxwAsGZVj26VpsX7fDR289b08hNBPFMkIWqtMOYRHER6nlC9wXKXN776TjoC4dzVNRUAZwdcN3YH+E9Q5m9hTgAk6lF8tmpQlTcXBs3/N9W9BMzKxrqnjf4uFW7jqezvwRCksZA+ISpyG0f1NcOJfqX3XxRpCWXJUtRvnOKOG7EYf817W0iYgBrlqaWYmY7U4LSGcGEx0KxDaGlrLO/lDFF7sgJqjTZLHF6TpPF1lNklfQlhAfc0qe1WuQl1wDhf+ZA7sP7UV1rPjFcF+HaMupXKRRns4aBMlsLms6UEYzmlAIqjW1PKD8ok2NM2wujF1lDu+5/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mv5OVQdQ+6M2fpADlSUgstMcN9mjAi6gx7zJ0ds7TRg=;
 b=byXzmlbaI9ll8CNf5589yQu9XWuW+veBak7ANRPqEHkyJ2P2cMImd6xQIK0bOLohmD43pwmGYGbJhwWHt36sbEmer2GWvl0pmRKE3B+o/+Gl1r5quS65rXIkaoX6eM14bVeubpkcfhWDbFRCZtQ3Un9eGCKZ9QxWhSSa31izgdiBnuI2uprZatzSmqHUJz2CEGFQfIuN8jSGiCFUNrmSB8MHKlJuhFGHqTMfK4+KdoVAOPAUhXz7vZ1D0nm1zqnqt8PwEdVYLZ44ntYZJyD1rAaKlfplQP7x22aWfmeLUpQYLEAks1pbLyv7mfBR+L7WXJvFYH3thJGvDZca0JgcBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MN0PR12MB6341.namprd12.prod.outlook.com (2603:10b6:208:3c2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Fri, 4 Jul
 2025 07:26:00 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8901.018; Fri, 4 Jul 2025
 07:25:59 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 04 Jul 2025 16:25:12 +0900
Subject: [PATCH 11/18] gpu: nova-core: register: generate correct `Default`
 implementation
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-nova-regs-v1-11-f88d028781a4@nvidia.com>
References: <20250704-nova-regs-v1-0-f88d028781a4@nvidia.com>
In-Reply-To: <20250704-nova-regs-v1-0-f88d028781a4@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, 
 Beata Michalska <beata.michalska@arm.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP301CA0003.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MN0PR12MB6341:EE_
X-MS-Office365-Filtering-Correlation-Id: 2226f8bb-9e91-41ab-9c32-08ddbacc062b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZWF6clNSaEZpRmp3OUIyREVnK0ZNT2VVYVRZeE5pRG13eE90c1FYQWpLMGhK?=
 =?utf-8?B?UW9PUzdGbXFlR2kwZStXTmNMZk9zQkQ3V21hY1gwSlZDUTVYK04wMHpDbWRi?=
 =?utf-8?B?WkQ5YzVkN1IreGhicjNHdVVWRXFnemFjTHlUeVhXZXNmZFFtbG84S1FQY3M5?=
 =?utf-8?B?MEJhTmNTZ051NnJvZ3NZZ1NNNmZiTTBNenJHQ1llQytoVVYrcjRPWUdpc0dM?=
 =?utf-8?B?cTM4bmpOQlZFclMwdDVpQXRIL3hNSzUwYXBXSHc4U0U1UkQyTy9PK1dEZUdM?=
 =?utf-8?B?VUdxQnF6aHUyNDZYcC9YM2tlWDcwM3ZaSStTTHEvOEs1ZDV4SlRhN3RCOHVL?=
 =?utf-8?B?QXU3NlRTZ21xbkhUeUNOTi9QNlJobkRVWTVveTVsMVNLQ1B2M05FTlpDSUM2?=
 =?utf-8?B?REdGQmR4L0s5RVBHMzFrY1BYeWFkMjhKRVZ1NUdpTVZENmFHbVFBOXd1ZzBh?=
 =?utf-8?B?T3h5SUtvS0MxYkJZckZSN1VjNFFjZFJmWEFwUE9TZEdXS2djWno2bkVQR0pL?=
 =?utf-8?B?cnFFS3lzL1F0V25Nd3diblNzMjNmUTRaSTcveG1IMVZGSFJmbjk5RGVTdThz?=
 =?utf-8?B?VHlUSG45M0Y3WmdJc2ZtS0dCMEdXWE9sdmR4cVRVbmoxaWczS3pnU0ZCcHFV?=
 =?utf-8?B?dWlWYzZPWVJKWHo3bTRIRDMvTEdPOEQ4YWo2WXFoVHphTnpRcGlHNlhiZyt4?=
 =?utf-8?B?VExITnFtenNuZWNxU2t1WENSbXlvSHI2WFJ6K1hVY1RxdVVIV1d3ZG11Z3or?=
 =?utf-8?B?RWtxaTRxaUphWXRHSTF4K1cyUCtnYXh4Q1J0UW5SZnFsZmdkc1VtMUdUaytk?=
 =?utf-8?B?U0NBbVZKcWZhNmI2a2NOWXFyUHZpSWh5VTJwL0RsbkFLTk10N0xQY1I1K3J2?=
 =?utf-8?B?MmpNTTU4dFFLcjFqcjR4eGNuZVV0WDljNGNCbHljd3ZBaHduT2lBc21ETjNl?=
 =?utf-8?B?cEVFYWMzUzB1dk44WVVxenZMaFFhMlpxZk15QmZZSXliRkZmRDhRYlVtUjln?=
 =?utf-8?B?R3djb012V0FOSzYyNmxwU21qMy84L2FGcHFLNWZQZ3dxUVpuSFVzZUFubFZZ?=
 =?utf-8?B?bkN6Ky9weW43R3EzQUpKVnhEMVlLTDBkZ0plNUttZlIxcFU5VzQ4TjFnV2Fa?=
 =?utf-8?B?Y0JmU2MxV0FWSGRhRit2TnMxTm1wNTZMZnBXS25TUUQyUEdJdjhHN1EwSWV4?=
 =?utf-8?B?Slh2c2ViZC9wcGdIbFVCajBUN2d3Kzh3S2FRZjNDQktBWUVvQTh2M3lhZFJa?=
 =?utf-8?B?ZFdWQWZRNEk0bGVXdTVKUVBWKzZMK1hnYUdkQ2ExUjZueDN5dzFRcVRCbXVC?=
 =?utf-8?B?Rmp0aTdYNklOK2hSaDlLMjl3UVEzNjR1ODNyMkc3MG1yVkFoM2MzeEVpVEFz?=
 =?utf-8?B?ZWdQTld5ejdZZDhXRWEzZGV5dnVTOEFEbG5xUFdZaWZNZFNpdVBBYm85YU1M?=
 =?utf-8?B?TzNaOTB3Qk41V2RRZElld1FVSHBQdXRxdDFvYUo0KzY2WXFjMEVJT0ZmelBP?=
 =?utf-8?B?bk1EOUFGckxKdS8yYUdKdThBZ1RRbGxXT28ydUJnVkhPUDZSZHhsUFJHNFRj?=
 =?utf-8?B?VmIyTE5ucENtWFVnT3NzcjRXMmMwMXVyMUpvdzMyRWJrWUIzS0xJc0RRU21D?=
 =?utf-8?B?N1JGMlhCblk3d0dWbFdteFNGNHlBWk9DcGxWSGw2V041UURscUFDM1ZnQVBm?=
 =?utf-8?B?blNIQjI3V3ErSENPbWtQYW1wWDNqaVFUMDFIUVFTU21uMFFRTW9lZy9pVUtK?=
 =?utf-8?B?dXEvWXd2YlN1TEhRRU5hdER5NnE0cDRrd3JSRzRFVFdDV2VVWEZkT2dlUTBD?=
 =?utf-8?B?MmFwUHdJZEZMVTBQL0p6QWhLT245cWsyNFB2Tk1jb3JSa0JYTlJIK3pySmI5?=
 =?utf-8?B?aVNxZTlkWWpZRnkzZHg4SVBmb1N0cHBZYkVQVm5qVUViMlE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NjlQT2tvRUFTQ1A2d2xsUkNYN2NHZCtSTUdGSGpxRDlPZU40ektKbXN1ZEdr?=
 =?utf-8?B?NHA0WGhJaVRXWDNVV0o2WHBqUERKZS9nZUNUdUU0RzB2OWZqNmZJejh4YTdu?=
 =?utf-8?B?WmluZ2dYcGtUUXZEV0hURk53RS9xcHc2T3NObncvTTlxL0J4aWN5V1RnSWxC?=
 =?utf-8?B?YUlTSjlCN0Rmd2ppMUU3RDlJMG1FSEpGUGpiVEowMnllc0FiOStrMEV6MjVJ?=
 =?utf-8?B?TXJJMExVVVBSSHhHM2FQVW5vWHhGZjNkbTZWNkIwVWxQVytsbFZyMDJZREFl?=
 =?utf-8?B?b25SYU1ieUVqdjAxdkw3aERzcUJLZVlnY1NsczZMV2hVRDg5cy9WRzRNWUMw?=
 =?utf-8?B?WHQxNEJaSnFIRlZiOFVqMkp0cGl1VGtSenlvdXhob2VMTjBaOE5tdVNHQmhP?=
 =?utf-8?B?MjhBQzQxUDdmMFhCSXdOc0xMM3dKUHo1MGlSVnRHMUp4dVQ0cDdxNi9HTDda?=
 =?utf-8?B?Qi9mejJjalA2M2JqNE1aVVE4R1hQb01qeEcvWXBiZnNSbjVWVmlWUGxFclVW?=
 =?utf-8?B?RTVkMlRvMVI2RXIwcy9aYXVQTWhzbnVjU0FMeGlnUzRzTSt6a3V4a0NqaW0z?=
 =?utf-8?B?MWpTOUlZSUF1ZE1ZeWtQb3U1UUdXRElNUkl5ZndvMk1GQlIyYXlRVUdra1VY?=
 =?utf-8?B?VVBhOWVjcG1YejZpTi93NWpyZFRiRDN2WFNGTk9tM1I4OWlEOFZhdHNHc1E1?=
 =?utf-8?B?SVlCY0JGT3ZDbnFrS2lZTFU0ZElBMnVOT3JON3NISVhYek44a0ZjR1BvTG03?=
 =?utf-8?B?NC82M1NxS0pOeGpXRnJrdmJVSnB4QjRhempaanJzSDYrSXY4UWFPTjlCSHBo?=
 =?utf-8?B?eWxLelFLNG5JSTlESFp6UkZVY0cva2R1S2NCRWZTZ09NV2VPczUxNFAxZGZY?=
 =?utf-8?B?bWtSQ2pmcGdIOHJNSDlxVmxmb1NOb1RDeWs2ampSMXhEakNmcGNUeklnYmxN?=
 =?utf-8?B?T0U0QkZ1STVhS3hZNmljS2dxVWlBZWgxV2czc0I2M3I0bmI4TkFVOWhBTmN2?=
 =?utf-8?B?eGpTN2ZTR3ZZaWRjVU5VblFjd1FneHVtZ3pxWlRHMGtxMjFCZGVxNUxrZ3Nl?=
 =?utf-8?B?ZmVTNDJpN0E0N1BhbXA5TjJvWCtWYnFFODFsK3lqZ1lNT1JsV1ZhY2NQUnM1?=
 =?utf-8?B?YURzMGdTRllXMU1GbmMyeTFxMHVTTFhnWDhCRDBZS3c4ZkE0MGt5UWNkUlJV?=
 =?utf-8?B?YWFkdVc0NUVoeWJLTjNDRGsrMGFHdnlEalliZ3dEaUQzbXhLOFZvbVJFV2lV?=
 =?utf-8?B?Qm4zek85ekdxUzlqc0ZDNEM1UVpVbG9TV0M1V25iMEhzSnlnK0p1NnpxSmhh?=
 =?utf-8?B?bG9EeVRpVjVBLzE3ckZUMEUxc0luSlhLWkNoNlh1QnY2cW40SEpSSUEwcExM?=
 =?utf-8?B?WjlIUEsxVkd6N08rSGhIMEpLL1V5M2Q5amNQdjRGaThZYTdsVWttY0MwMkhl?=
 =?utf-8?B?SGgwNGFXN01HY09uTVp5OXY4c0drOEtTZTMzNFZRSkFLbnVKMGJSVlp0ZHBC?=
 =?utf-8?B?ZUNGekZOSGJDU1NITEdER05YbFFRb2FwTVNNaU1NaGpDUldJc3JnZnhmdVNu?=
 =?utf-8?B?STE0L1I3R2tiQnprNFJUY09COE5tZ3hoOGFiWVIxd2xiSk5uaHN2MUlaYm5N?=
 =?utf-8?B?NjVyVHhqcHllZmpKaHRwRlVCVTVSMXBQbmV6ZmtGTHBSQlVIa1Y4dlNsL0U1?=
 =?utf-8?B?eGNLUFVTVUxMdzFzYUhTd29rZExrUnpnRlB1M3RLMkh3TCtldWZ0ZU9SMU95?=
 =?utf-8?B?a1I2SmR1Qmh1R3BPSk1xZDhBUTFMQ1lycEdTRFVxS1JqOFJCYVppcHcrUlc0?=
 =?utf-8?B?WEVVV1dPaExnRzk0RFRlc21uMy9CeGF3NDlPTGFSeXZnL1FubzJTRTdWN0xq?=
 =?utf-8?B?ZEs5WEFrSktrcjhMT2d0bUQwbWIydkh0SmFDSWlRUjNuTU1KZ3lCZHZiT2hO?=
 =?utf-8?B?QkhldGIwdEdtQk9tNGdQOVBvQmpaU1hHelZxdm9vc0U2SGdENTczZmY5cW9Y?=
 =?utf-8?B?TjgreXpYcFBtMktJaFd3U1ZBL29wMFZ3bS9RYjVVVHNUMG4rcytUTUFEMnJP?=
 =?utf-8?B?SG1OUi90SkFSV0R1ZXhyMmN0ODJwbHVjckxWL3g5QVpzN1dUc1lxY1lTVDBJ?=
 =?utf-8?B?SXp0OE1HZWhuempFdUo3OFp4VE9YNVpLYzZnRGZjblBGVm1lYlAvUVM5bG8x?=
 =?utf-8?Q?TumMvmyHytihIlRf8HJc8J9/7ngPnpGXDyJW66yec1Px?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2226f8bb-9e91-41ab-9c32-08ddbacc062b
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 07:25:59.8683 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yIrf0Jl6gi2kGh9gd9WSY9DF9eRbpQVZbk83RJFm88DpZll79XzMbLv+nSN0L26og2y6y/bZGkT5kbIKG8jUEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6341
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

The `Default` implementation of a register should be the aggregate of
the default values of all its fields, and not simply be zeroed.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/regs/macros.rs | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-core/regs/macros.rs
index 75b7b742b117240543ad292fc69e5e1341728174..97895800ff7031d287b3bbd03a00b1ca71014aa8 100644
--- a/drivers/gpu/nova-core/regs/macros.rs
+++ b/drivers/gpu/nova-core/regs/macros.rs
@@ -112,14 +112,14 @@ macro_rules! register {
 
     // All rules below are helpers.
 
-    // Defines the wrapper `$name` type, as well as its relevant implementations (`Debug`, `BitOr`,
-    // and conversion to the value type) and field accessor methods.
+    // Defines the wrapper `$name` type, as well as its relevant implementations (`Debug`,
+    // `Default`, `BitOr`, and conversion to the value type) and field accessor methods.
     (@core $name:ident $(, $comment:literal)? { $($fields:tt)* }) => {
         $(
         #[doc=$comment]
         )?
         #[repr(transparent)]
-        #[derive(Clone, Copy, Default)]
+        #[derive(Clone, Copy)]
         pub(crate) struct $name(u32);
 
         impl ::core::ops::BitOr for $name {
@@ -162,6 +162,7 @@ fn from(reg: $name) -> u32 {
             )*
         });
         register!(@debug $name { $($field;)* });
+        register!(@default $name { $($field;)* });
     };
 
     // Defines all the field getter/methods methods for `$name`.
@@ -321,6 +322,25 @@ fn fmt(&self, f: &mut ::core::fmt::Formatter<'_>) -> ::core::fmt::Result {
         }
     };
 
+    // Generates the `Default` implementation for `$name`.
+    (@default $name:ident { $($field:ident;)* }) => {
+        /// Returns a value for the register where all fields are set to their default value.
+        impl ::core::default::Default for $name {
+            fn default() -> Self {
+                #[allow(unused_mut)]
+                let mut value = Self(Default::default());
+
+                ::kernel::macros::paste!(
+                $(
+                value.[<set_ $field>](Default::default());
+                )*
+                );
+
+                value
+            }
+        }
+    };
+
     // Generates the IO accessors for a fixed offset register.
     (@io $name:ident @ $offset:expr) => {
         #[allow(dead_code)]

-- 
2.50.0

