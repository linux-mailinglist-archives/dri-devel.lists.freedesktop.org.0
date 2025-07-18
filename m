Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B10FAB09C5E
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 09:26:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1322110E8FA;
	Fri, 18 Jul 2025 07:26:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="WLblox6y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2073.outbound.protection.outlook.com [40.107.100.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5087010E8FA;
 Fri, 18 Jul 2025 07:26:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j0+JGDBBUCxr93fN4zFuFTgQ5yFdCfCE+6VoRU88T+mBRRDQrAD1kpHhXGXt4slT8YNxljQa8dySEEmHBRARi0T6kF0BpiPBqRk+s6umb5k7yEc88hpOnIMi/2yaC4iizfxTkW5DzpUcDM3pQfC6HbtB4qsO68jfC0efQyOVGycWQva1OOkqp+zpFzL8MwzqQI5XoHsJyNvrA637V56iUCMKrpJC8QOJPONZoJ/x8uLblXLYdwtW5X4NlJeVZ6ubZM+X11vB3GPujx3UDYFQL2fZCoViXZtdyZbpoJp1oZo1uLhbo3wRll1gpwIVX2vepOPQ8pOPKsPhmbWa4eFjvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BgObRRovbh/LxRzAi8hsiDM8hOC9BfkPpsov5NmPtfE=;
 b=JRtvBBrn66MZV5/VrjTLuUEGTlFDWhmbtwEYr13WLQeEoySELAQU1xl2rkuVQb3VYHyRcGun16MiIbNXUJyV0AHq2mtAhiMGp8YOx4OWqkkzhsfxkmOPnIIzapBqFPyhOmCOUyuPdtp2fKEYf81Eqgvt3pxd2kX4UheeiOT1SatizG3VgZ6YFcodUvFFbK5pgWsA/cSiILJEVtv1BXV1Zlbjh6JSh9YxtaJ+aQOMBxIzUpPG2QiksMva7L/24FCnggu87txJikZ3V8I6xTGSP0ZxD4gLRqKUX621LH1VfDwjaUjAWB70+C3aEZ39dAG8PSnKhPUpMjfvM2Dy7XHIwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BgObRRovbh/LxRzAi8hsiDM8hOC9BfkPpsov5NmPtfE=;
 b=WLblox6yQIy0wlV7eUEPJnRthtRqf4XFPoLD/bOpKONvwL7b9VLgv3+t6G9DrblsYmt/3h64XcbiYnyJ9j6JS+FKqILtaSO5hbvzFtM41auuLRIYrW7FrDXU4iV8/36+6Ms9nAOeU7/N14ve34rPc7jmHBryOfCBpQLM0FM/7w0xl8H86alsGv2pIbU4k5UTieTXBVC+mtbYcNVwE6Owq17uUhoanMxrWLwDApSZ2P4BceApQb9BIxLWzQ2bE5jrUQjAJSl8oRxdF+Qcyt0AOi506YUrqNlbwHbdEStZELlWwC5JTLIoAXvQKmchJT6kLTpzraxdHKee2+o/DmkjuA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM6PR12MB4091.namprd12.prod.outlook.com (2603:10b6:5:222::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.25; Fri, 18 Jul
 2025 07:26:32 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8922.037; Fri, 18 Jul 2025
 07:26:32 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 18 Jul 2025 16:26:09 +0900
Subject: [PATCH v2 04/19] gpu: nova-core: register: improve documentation
 for basic registers
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250718-nova-regs-v2-4-7b6a762aa1cd@nvidia.com>
References: <20250718-nova-regs-v2-0-7b6a762aa1cd@nvidia.com>
In-Reply-To: <20250718-nova-regs-v2-0-7b6a762aa1cd@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, 
 Beata Michalska <beata.michalska@arm.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TY1PR01CA0189.jpnprd01.prod.outlook.com (2603:1096:403::19)
 To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM6PR12MB4091:EE_
X-MS-Office365-Filtering-Correlation-Id: d808dc71-a862-430f-0c0a-08ddc5cc6bb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UHF2UHBXdVM4WDVJQnZKTkJWYzI3K00vRzVpOEZzMG9jaDFwTk5ZOEF2ckNj?=
 =?utf-8?B?M21DaklobE5ZVEFRenNOcDk3a1g0dTVMSGZna0JJWWttV25jaDBoZUU4aTdU?=
 =?utf-8?B?a0xTK2lkQkREYjR4NnZDZ25iWnJtUnNpSGJNTzBFZXhNUndRc0g4YmxzYmds?=
 =?utf-8?B?UE5tTTgxcVIwQzFIbllEbUFMdTJraW92QS85QXJWNjYzZE5jUCtUdWk1YWQv?=
 =?utf-8?B?SUpIQWNVMEhNUS9mdm9wcjY5NUNYMzZqSGNGMi9uc216MXlxdjlFRVRqY1JJ?=
 =?utf-8?B?UlNpczZNdEc5bEt0QUYyWEpwaDNaOXZNUlh6K21ycko1bnRTK2UrN3NIcjN3?=
 =?utf-8?B?a0dQODhOdk5QOW12YWFqQTZ5ZmNWTjRCQW5WRStqQ21RSi8vSGJJN0lNbGpS?=
 =?utf-8?B?S0t1eFNjQzk4blhJMWZKaFZwRHFrM0d3V3NFUkcxMTJUbHJWWTBFL295cE10?=
 =?utf-8?B?UnJ1TlhvamZNTy84NEhCSUtzSWFSVXhWUWNHcy9xWjJDdEprdlBkY3lFaFlH?=
 =?utf-8?B?OUZWUjlxaUlocldRYUR3SzQ2SXVib3lSOWNmdGdXL21VdnJPaDcwV0JwaXpZ?=
 =?utf-8?B?elNLNGxlTXVjUm51NU56cXNTNGp0T1dhdGJ4eVQrWHV0bVpLckcyS0V4U0dI?=
 =?utf-8?B?cGY1cWNCaHBsdlpLR3BudUczS0NmL1Z3UmtoK2RsY2hYMVEyWWtDenpuVDI1?=
 =?utf-8?B?NHIyc3g5SlJoaVFiYUlGNXRrMlBiWFJFSXpmVWtHblBnU2NpankwNmlPYVls?=
 =?utf-8?B?NDJjYWE2VDBrZXd6aHRGMmg3VVdjUXZhNE5oMHRtYmZ6WGxEK3FDUUh1aXND?=
 =?utf-8?B?Z1E0c2xlTlNsRnpkMzJCSDQyWXlxbHBtN29qcWlUUVp1cnNDbFBCRDF4NHk3?=
 =?utf-8?B?N1lmMUpNTVNDc3BwV1dvM3JrR0lnSEF6WmdYMmNMYVNHL0Nka1A4aFF1cjlo?=
 =?utf-8?B?MXhjdjRaOFc4YnoxK0NaQ0d5cmNaQWN6S0h4cEZmaE9yQWpVajBJeHpTZWN4?=
 =?utf-8?B?NjJZRlZWS0p0c05uVzU5MkxBRDhLVmFsZ2oxY1h6akNCV0RVb1Vna3JBRk5O?=
 =?utf-8?B?S1JXVUpxR3YzcWE2enpvaG1BUnpHekVGWSt3cWVENmJ6eUcrSjZEaGZKZVkv?=
 =?utf-8?B?Q1o0MzFOV3h4VVNiN1dUNjBTUHdPejcvN1o1bGZ0cDk3d2FuUDF3NjR0Y2c2?=
 =?utf-8?B?ZWtHNXUydFJhT0JZREpIZjBTcmI5MWFJaFJpOUptY0E4WndWeEdBMCtpbzBT?=
 =?utf-8?B?REM2MStsRTVIMkd0YmdBOUpvY0pnV0xMMjNsU1dMS2hlbkgxZ3p0bmwxWSt1?=
 =?utf-8?B?Mmo2RENWYzRHV0JSSmpvZmlxRGRGSzljT0RUTDE1V0pxVzBXTFJwODl2Ukcr?=
 =?utf-8?B?Qlg0NFJTV01CTldqL1k0Q0ROMHhyS0VRM3pkOWVSWmk4UVFHbjJPTVhzSXFS?=
 =?utf-8?B?SUJjNElhOEJjR2hGNU9TQ1BHeGloRy85Y3BTRFBxSkJ3N2EydEE5K01zR3Fw?=
 =?utf-8?B?ekdXdUgxdTFIZVJNajc2S3Irc08rUnozZ0lzaDc5cE04QlBxRG1DVzArWHZV?=
 =?utf-8?B?UUxZdVljY1dHTTlJSnpHYnduUUQxNDNxaHVoWkJ0d2VWazFOVjV0RlR1bk5F?=
 =?utf-8?B?U1NPZnl0bVNYN0ZjUTM2d1FUQjFqZkdWNVFkMisxcGhUSjFURGR5OGhJUEs5?=
 =?utf-8?B?SS9ubm1iVThtVDUyVnNERnd3Z1pYNlRYWEVVOGk0RkRzQk82NGdCaUZJYldr?=
 =?utf-8?B?Z2YyelVTRHZXMGtnYml1OGhvZ0FrVGZ4NlAzd3FKd2NYZlhLQXQ1M212bVRS?=
 =?utf-8?B?TzBuT3RRUEc4eGVwVFdJSHlQc1VhN09WYjZoT3FqZmk5c3pRR0R5NkdQU201?=
 =?utf-8?B?elloUXVnVWZPVjU1NFZoanFsTjY2T1BNR09HMHRIRWhpZ0E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eExXRnZTbmRjYnVrbDgwN2hYTlhMVUNTWk1xODk0Zk5mRnR6MHJKRU00c2J0?=
 =?utf-8?B?Z3d6bUZNYmY3YlEvQ25RV0xsMm9Ta1diN2FPdzhLSHJyY2dCazhUQnVwZDA1?=
 =?utf-8?B?ZW5LQXBXUE03VnZLV1RhRGNrY3plaDh1ZXFDK052c2MzcW85b0crYy91V2xI?=
 =?utf-8?B?bGxUOWRQUUNpWjNINFhQMW92VE5rNEZkdzRObDFkcnh6eFUrTUNBWHFlcHM3?=
 =?utf-8?B?eVR0dk11WlZKUGpmUmN6T2h3OFlaRTAxSW1DZzhnRlljK1FGVk5oeFJIdHcy?=
 =?utf-8?B?NU11WW1QOXU1eHp1LzN4SXErUEliTGE3NUZwaFNFNXZRUExxTy9tUWUzbURl?=
 =?utf-8?B?ckNxSjFkRng1cVAwcmFjUlRWQmtCL1Q5NUFnTWE4b2ZFZjBieEFLc29CU2o4?=
 =?utf-8?B?dzFHdjQwSy8rZVZDNW5McEhhaUYrbCsyblY1V3ZEeTlNQnBseEdCdkJENGd3?=
 =?utf-8?B?akVHR2xrN1NHYWNkOWtGMmdMb3ZiWGVUUGpXT0FlNk83VHhvNFBUV2xVQUVt?=
 =?utf-8?B?TXlobHZVbFR4R3ZDSHZLd0RuN1dEajBqc0NKbVNFRUVVMnd0eURkcmZhN0wv?=
 =?utf-8?B?KzJRTDlWQ3VmUXk3VXVmRVhFQzhjVCtFbjlFeXhVWXJ2dmtza0E1VlZqL3o4?=
 =?utf-8?B?Smpid2JiUDlJbVJJMEtFcW9rKys4TEE2MVNJZndnMERPR3A5U3NIZ21EWGFO?=
 =?utf-8?B?VzZtS0Fxem1TZDBEdVJ4OU9wc2ZiODhuUDdMTWdldXgwelNMcUxQR3NOOGs0?=
 =?utf-8?B?ZkQvVmVvZEc4eGhGQ1FxcWpiNnB5S2RXWmlPVDB4T1BrbHdScWJualRUS1hi?=
 =?utf-8?B?Rk01UUNUaU9scTF1U3czOHZTeWt6bG9mc1NUZHRRSUlDWVpkNWVJanBXZ0I3?=
 =?utf-8?B?R3FYUVgzUWhRQldLSFc0UGpsNVZmM0dUVVU0ME11VER5VVlmYkN2aWg4c1p6?=
 =?utf-8?B?TldSNUNONkhFejBScFdmRjgxTVgzcHFPTlBxbkh2cWFTVVYxdDlOeEVENVA4?=
 =?utf-8?B?WjdFOVBQeVRINjFYT1ZITnE1K2NmeFR4NjM5dFJDdlVoM2xUN0k5WTJmbC9t?=
 =?utf-8?B?Y0pRUEkvYWpHNVVjNXBJZW1kWDVDMjU5MUZYNG4xQld4ODB6N3NxV3YzeDhy?=
 =?utf-8?B?Zjl4Vk9xaEtwOFo2SjIxU1hpYlRKbWtPcTJGLzRKZGNDNWRRNVk1ZWxyeGhj?=
 =?utf-8?B?MFE5Tll2Uk0wM2piZGlGVFdTK0o1T3dDVWRVRi8wd2NseklXTVR2RTlwTXZP?=
 =?utf-8?B?SDFkU2t4elZTUXVtVWZIV256WlFobW42bUt1VDBuQnBxZ09VaDBXeGhYOHhB?=
 =?utf-8?B?U1habVNLY2JNK1gvWmZUQm5vLzViOStQZDdFeWo1RXFJWjNzempSTmVyazc0?=
 =?utf-8?B?L3E1cEJCbGc2bDlBaDY4d2g2U3IyTkQ4VW96dlFDdWJnbkpFV0hMSXVNSmVl?=
 =?utf-8?B?S1hxTWRCUFRCSkZmUU5yTFR4Z2hzT3ZyQlY5WGwvRmZkdmJ3MDdGd0hGZDBw?=
 =?utf-8?B?bmxZbmJJMGQzNkxYNno1UlA3cXFkUE5xcUVHL2NGeTR2ZFRMZSsvblNVTyti?=
 =?utf-8?B?U3gvbmZZeG9UbGpUQUNYZXBCYmJQWjU5ajVsTTNVbml3V0xTdDBNVFlRTzlS?=
 =?utf-8?B?N0VTQVF1dHFtOSt6TEVsemt3OHViM1N3b2ZMYWd6cWtNSTlGMFRqMWFYbnZr?=
 =?utf-8?B?TEhrYjdoVXZoeDNXbXRHanRJczYrL1BQd01jbzJEU3VxcWpWK3N6MjE5Rno1?=
 =?utf-8?B?NDdoZy94YWVUVUdkaDdTWW1yRlhFdWk3ZmJ6UVRFRDV6Z1NxZFVrL0RMSytC?=
 =?utf-8?B?SXBuSkRQOTh3ZFRKOFk2Uzc4S3FaZmRzSmtRVmhweXllOUdvbC8rVzRGanRY?=
 =?utf-8?B?MDJ5ckRLcEk3b2RCeEtOL3RkOHFpYnJ4dFFyUmJvdWxROEJnMFh5WWs5SWFq?=
 =?utf-8?B?R05OUzNHTWRGdmsxNkhBSjJiRlFVTklJZmppV2JybmlxbmN0dlZNWEcwKzZ2?=
 =?utf-8?B?c2VlRDRZWHUzNTQvbjRzeDJTYk1yeklRVmtZWnNmbGl2YThvTDJzMDV0MlZo?=
 =?utf-8?B?VDdMUWwwQ0NJbGRBT05tUmw3M2JJRTErd1VnaURyKzduZ3dnREpsUnliNjc1?=
 =?utf-8?B?WEdZQ3BYV2ViVXZzelNiVDdhbS9sRXRGc2tkcjE3a1kwb1Z0MTBMbWRoYXUw?=
 =?utf-8?Q?Aq8NQu6x6LKNZ6Eew5Jf/yMcpHqnRdojkEfA35fbDw7A?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d808dc71-a862-430f-0c0a-08ddc5cc6bb8
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 07:26:32.8712 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /jDwmnrJK7g2AsK1ETRr/FTjpeFxIuSXFKenhQF5BMg1Om9a0v0FL4Br/DI2+n0PQcEjWORj4jLgn1hwD8Pk7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4091
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

Reword parts of the documentation that were a bit heavy to read, and
harmonize/fix the examples.

The relative registers section is about to be redesigned and its
documentation rewritten, so do not touch this part.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/regs/macros.rs | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-core/regs/macros.rs
index d015a9f8a0b01afe1ff5093991845864aa81665e..dac02f8055e76da68e9a82133fa09a1e794252bc 100644
--- a/drivers/gpu/nova-core/regs/macros.rs
+++ b/drivers/gpu/nova-core/regs/macros.rs
@@ -33,25 +33,25 @@
 /// let boot0 = BOOT_0::read(&bar);
 /// pr_info!("chip revision: {}.{}", boot0.major_revision(), boot0.minor_revision());
 ///
-/// // `Chipset::try_from` will be called with the value of the field and returns an error if the
-/// // value is invalid.
+/// // `Chipset::try_from` is called with the value of the `chipset` field and returns an
+/// // error if it is invalid.
 /// let chipset = boot0.chipset()?;
 ///
 /// // Update some fields and write the value back.
 /// boot0.set_major_revision(3).set_minor_revision(10).write(&bar);
 ///
-/// // Or just read and update the register in a single step:
+/// // Or, just read and update the register in a single step:
 /// BOOT_0::alter(&bar, |r| r.set_major_revision(3).set_minor_revision(10));
 /// ```
 ///
-/// Fields can be defined as follows:
+/// Fields are defined as follows:
 ///
-/// - `as <type>` simply returns the field value casted as the requested integer type, typically
-///   `u32`, `u16`, `u8` or `bool`. Note that `bool` fields must have a range of 1 bit.
+/// - `as <type>` simply returns the field value casted to <type>, typically `u32`, `u16`, `u8` or
+///   `bool`. Note that `bool` fields must have a range of 1 bit.
 /// - `as <type> => <into_type>` calls `<into_type>`'s `From::<<type>>` implementation and returns
 ///   the result.
 /// - `as <type> ?=> <try_into_type>` calls `<try_into_type>`'s `TryFrom::<<type>>` implementation
-///   and returns the result. This is useful on fields for which not all values are value.
+///   and returns the result. This is useful with fields for which not all values are valid.
 ///
 /// The documentation strings are optional. If present, they will be added to the type's
 /// definition, or the field getter and setter methods they are attached to.
@@ -76,15 +76,17 @@
 /// for cases where a register's interpretation depends on the context:
 ///
 /// ```no_run
-/// register!(SCRATCH_0 @ 0x0000100, "Scratch register 0" {
+/// register!(SCRATCH @ 0x00000200, "Scratch register" {
 ///    31:0     value as u32, "Raw value";
+/// });
 ///
-/// register!(SCRATCH_0_BOOT_STATUS => SCRATCH_0, "Boot status of the firmware" {
+/// register!(SCRATCH_BOOT_STATUS => SCRATCH, "Boot status of the firmware" {
 ///     0:0     completed as bool, "Whether the firmware has completed booting";
+/// });
 /// ```
 ///
-/// In this example, `SCRATCH_0_BOOT_STATUS` uses the same I/O address as `SCRATCH_0`, while also
-/// providing its own `completed` method.
+/// In this example, `SCRATCH_0_BOOT_STATUS` uses the same I/O address as `SCRATCH`, while also
+/// providing its own `completed` field.
 macro_rules! register {
     // Creates a register at a fixed offset of the MMIO space.
     (

-- 
2.50.1

