Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D9ACCC002
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 14:28:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0592D10E9DF;
	Thu, 18 Dec 2025 13:28:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="dIpkRhVF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013005.outbound.protection.outlook.com
 [40.93.201.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF58010E9DF;
 Thu, 18 Dec 2025 13:28:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=osVGLCKDA2BTxiaJhcJx2SjRUuQu74e8V0fK04WmBjXtM4Bx4pZD20iahgaiIyNxpK7va6evokzqy/93kVTsfdHJdjWsnW2ENCfDe9beCVJe95A7ZaVEasEpoxurS6W7ynZNE8Nu4KefePIkyj0MfLfNvS32YDtRffDTmxLA0P4wx5tQ0gCNlQ+50QVECexrqg/819VKEIbD0DHHArCH/3rKgY65i/Hk9WWXNqdEV85HucFkA5767xpej+Q5vy+YGY54qLvN15Sf3AOpVcSxfCrbeOJZxQ+wqORdC1oR/0MBUiaC1C+wx290QQGxI6sdd1XqLqR9EdolelTrsuq8Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5rFzKHsDaZ3RJcr6S1R91nXKIyUD9DkwKR71jQxND8k=;
 b=tgibJ2wWEmoBsE4EGIlbx2ZvEN54FZm5QTmw/NAQtEZtfuwoUGMIZHkWIJQ/FJFmsA0S3RmE6Ph5vOguPL24hc6DFPYCxm3G8FOtTQgi9cNkp3RkPCJu5Dls8F6iK2dRuO5wtX6tCw4oraHsaLSDgIWLGwJaOzoymKvBOclDGVof2ver932ITIxLJztIltGGwnkPIIH+/UNg4Qi6zsmBGwFvyxJIUy87c4oUgQZqUgqAQe9+xmsLrTKuFbYz9INJlWZf/KWg3+dYfrDJEUa3XxuspiaI+ZsXyOFZ4reRYG1mxzcri75NJjMxETdlWitDhuqriLc0+aseZvwvq/NiaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5rFzKHsDaZ3RJcr6S1R91nXKIyUD9DkwKR71jQxND8k=;
 b=dIpkRhVFDpustSx+WM37wNn5vvbQAIGcDyaS8PgrbjLkRZOLF8uhZtjgiLLNyZIAxbtFyKAp0NuLXpO4hksImvaA9/aDp7gUdRao7t3U8q+Kr40alubtuLDzqqkqSpdykgcLvtYJsM4RCX4TUreGKYzeTRz431IAs+kQgN8S826+GcsRPjJ0lLN3D/vF1mjF3RQ2D9HZpj4y+5GaM70BNC6uaBhK/bqcXM9kyPPnsOgfvwI5hfyZBp+zl4zvIIy5NSc/mrQTMNWdi2pbnZMhsmnzbzF9SHB2rZ0xpIY9sne+6Ss+76nXy7p/HFbScrqeFHS3bVirwCv7qLp4bmWIlQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM4PR12MB9069.namprd12.prod.outlook.com (2603:10b6:8:b8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Thu, 18 Dec
 2025 13:28:00 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 13:28:00 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 18 Dec 2025 22:27:57 +0900
Message-Id: <DF1DLWE9OOR6.2P43ATQYNAU3A@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn Helgaas"
 <bhelgaas@google.com>, =?utf-8?q?Krzysztof_Wilczy=C5=84ski?=
 <kwilczynski@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Alistair Popple" <apopple@nvidia.com>, "Eliot
 Courtney" <ecourtney@nvidia.com>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-pci@vger.kernel.org"
 <linux-pci@vger.kernel.org>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 6/7] gpu: nova-core: send UNLOADING_GUEST_DRIVER GSP
 command GSP upon unloading
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251216-nova-unload-v1-0-6a5d823be19d@nvidia.com>
 <20251216-nova-unload-v1-6-6a5d823be19d@nvidia.com>
 <C890CCBB-76C0-4E70-A7B8-846E34DABECE@nvidia.com>
In-Reply-To: <C890CCBB-76C0-4E70-A7B8-846E34DABECE@nvidia.com>
X-ClientProxiedBy: TYCP301CA0053.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::20) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM4PR12MB9069:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b229ae2-4d3f-4348-8de6-08de3e3943ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|366016|376014|10070799003|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cGt0c1FidkhBT2hkR0VhcHd5VDBwMjBvZ2c2U0JwcU1QejRDaGlsWDJUZXEz?=
 =?utf-8?B?UytXWnlCLzNkNHZ0Rk9pWmRXOStlOWlvaC9jYVFXajgvNTNnNGY3ZVZwTXRO?=
 =?utf-8?B?SVZ6TXhCMW5WcUVZYXJvM2M4bXVxOW1LcEwyUXUzSW1SMGpzeFZHVUh2bmVZ?=
 =?utf-8?B?Y0QxeThiMTJGVGRFUytzeEkvMVNSSkwveFkzK2ZJbVg5R0VFb3BsZis0RVZp?=
 =?utf-8?B?eXUrNHBGc29uNm9FV0Mwb3pwVlM3SndKRjZWUEtOT0hJL0F3T0d4ZkJzWVNm?=
 =?utf-8?B?cjlVZzFEdWxqeWE0WERLdURIOGpvMi94Nmdvc0xOK05nY1h1T3VWemhuRXJa?=
 =?utf-8?B?Nmw1SXVPYnhDMzN4Q1RKOWd2SmFHWEJtcllzUkEzRFEwL1lxbStmV2Q4SkxQ?=
 =?utf-8?B?OENiaHdudG91UVpEaG42Rk5PcUhheVdyWUZYaFFWNFdrSTRnVGVZZFJNTVlr?=
 =?utf-8?B?anlycnQvQ1FJNUhHaW1SQ29aR3h2b1RNU0gxMWRyUmJFdFFIS3BjcityVlp0?=
 =?utf-8?B?dUxOaS9sckc2aWZIckJXTStEcUh1anREZ2M4NW82SmtnWmMrTm1BZ2FONEsx?=
 =?utf-8?B?ZDVZOWZQL1BFOWRQK3Q3c0RHbFIvTWVuTG96WlRZQ2JyR1d0b2dLRGxkL05q?=
 =?utf-8?B?VkNSNDNFV0g4QktTRytLekZ1K2IrRmROL2hJVzdHc3BlSTFpZzNXQXhtbG5m?=
 =?utf-8?B?WTZIcisvMENWbyszeVdnWkhXb0Y2V24wWHU0SjdXZ1BPSi95eHllaXUwZzJL?=
 =?utf-8?B?d1UrQzBLOEJaNVFLdEJ4UEM5RUlBdHNKR3IwN2FlWVJhTUx0cG5XUGtYWElO?=
 =?utf-8?B?RmFNcHZYYkJIazBJUUZsSDlQeEM2TDJoOXovRlRodVVZREhyemxRZnpGZHgy?=
 =?utf-8?B?QlhzS2NLWDZ5Uk02UFl5Z3VVSCtKVW10UnB0T1p0WGJmSlNiZHNzcERqQXZa?=
 =?utf-8?B?Rlk1Z1lYS1N1bzBjNnJCREg0OEsvR3cxUnkrSGdvV3BhcFJXbWtkRTBFSjNJ?=
 =?utf-8?B?S3FSak5ncWNqV1JHL0RXMTNRdlZ0dFhrendtRnJxd2hQOFU4REE0NFFOYWdW?=
 =?utf-8?B?UXRlUFRmMWVqeWppWWZ4Ym94dXJQMlB0WGlrdlB3QWJqMHlnRXFYeTUyaDRw?=
 =?utf-8?B?V0ZuQmFlbUtaWGtucjAwS1U0TElEUC9Ic2dzRll5UU9ZaENyUE5pL3NDQnl6?=
 =?utf-8?B?cXNndyt4WXkwNHNETnN3aGJUaklOcFVlL3JTWnFpa2JTZktaSTJLZkRLTGVx?=
 =?utf-8?B?d2tHcVlSRUo5MEtMUHN2YlpORjU3Z1ZHRXVxbmgvTDNlalBMOUJzaEJ2MDFw?=
 =?utf-8?B?TWwyS2JoVVg1b05ZYlQzNFlvcnZiSjhKT2U2Z3NheldTd2REMHFrdjhnRUdK?=
 =?utf-8?B?N0Zyc1pQeW5wUE1MNlRNWlZ2bWFiWkJkUmVhK01ZOEZMRVVkUW1LWW5tY3RY?=
 =?utf-8?B?aTFhUHJPVVV0eTFXVVJJR1NlM2JZMzBhZ242TjhyR1FaekxyVVFEYkZmSHVm?=
 =?utf-8?B?U1FVVHlnMnRBZDJTR3dvaE9DTzlibjNvRElVVUVRdnJFVlZpZk1TNnhEZnBL?=
 =?utf-8?B?UTZja3lMWGxBQUppMm9VclhjYVdNRFFMM1RvV3A1RUIwY3ZzY1Y1RDFaUHBh?=
 =?utf-8?B?b2YxUXJibmtXbkRNWGdqazhQdENOZEFaY2dHN0xySVhLM1FrYnYvd1I4cVdr?=
 =?utf-8?B?MkJ5SXpPZEJnWWQxYzhHU0JmZzVsM1B4NFA5STlWWUhxVGNYVjB6a2pvZ0JN?=
 =?utf-8?B?NXE3dGYzcC9teU1jK01tWkhHNWM2eHc3SGlyZ2ZnME5FTnhVeEZFcHUrbGdz?=
 =?utf-8?B?VjFYV0lNdkQ3QTZpRnY2N0pkZFBLVmpFY0p0TUJpT2N3T1RxQ0tUaFlvcEhq?=
 =?utf-8?B?QTg5MTNJaVRSK25sUkJZWHlKQkdMbWx0bE84VHJxVVoweHNtb1BHbE5FZzMz?=
 =?utf-8?Q?k+iFwsUlxjrt3wY/MWz8Ycti4i/SOHXv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(376014)(10070799003)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VlVKbjNUQUtEdnl3T2IvaXpLekxST3FOS2hVd3llanJ2Ni9KSEZWejg4VnEy?=
 =?utf-8?B?MmlCNGdLVkQyVitmcnpRR2pKZnhoZ041K1pzc1lXdjdFTVNZOVMwMGFJOTBh?=
 =?utf-8?B?Yy83V1ltT1oxbHNGcUZhNUJSdld4VlNJVFl2ZVQ1VzNzeUE3cms4bmdhZHhk?=
 =?utf-8?B?dko4ZWU5MktwZEtMRVF1UHJEdW9kNHpKYk9pQkN0VU54S0hOYWZKZFlyWVY3?=
 =?utf-8?B?SGpNZDcwUHNsa2FQbUdiUWZNSFRxY0x6UVd0R0lDcUJDVjZ2T0ZGejQ4RHls?=
 =?utf-8?B?QjZ0Q05WSHRTc2J1ZXNTNXFFNDhEdFhrdklacm9iTG9jRXl6eitrU2FncnlT?=
 =?utf-8?B?Rmx5K1JHeXhHVzE5L1FxQi9pdXgwdVEvQjEyeGpTakFaVitWTmJxcEtNWUVR?=
 =?utf-8?B?eThwSURiL3UySkpFc2ZkZExneG1DRUdmbXNrQWZXeXIyM1A5dWthSUdDYkZE?=
 =?utf-8?B?bUczTjNjRGVQNjQ3YTZqUzBpQjBzSDBIZ0xxNFE5ZjZLeG5XRmlEMmFlRFpD?=
 =?utf-8?B?TGhEUTFvaEtuUDJZT2VtWVlEQU43ZXdOYnVTQlZCNnZ3U05lbW9ZTFNUazhx?=
 =?utf-8?B?c3NwTzJnMHpzS2VNNVRQVkNuVVI5MHNWV3dwS1RTb3hsRVFjUm9xTDJBbTk4?=
 =?utf-8?B?TGI0WHkxOUNLcXlYU3hMWVlTSEx0MGl2Zk01eHZsODJzL1NKVW00SVdaSlVn?=
 =?utf-8?B?Y216WnVYbXYzNWZpRUwvbmxNN0x0Ry9Ud3dtMEp3ZEtxd2V4eVVwZ2FFWWNR?=
 =?utf-8?B?eDF2amRaSDBpbUZPQ1UxMm9VZy93cWg4bnRMUnl3d2R5U2tIaU9uRjhwV0tQ?=
 =?utf-8?B?QkQ3N0VLWDlrakFlUGthR2FXN1dmc2k0aldsNXdOZmxuQVY2djNsSWkzZmJJ?=
 =?utf-8?B?NTFMZzBjLzNhMFMvQVhsbnRYd2k4TmlPY01CbDlIRVhGTmF6OWNTbkNNVFl0?=
 =?utf-8?B?a2c3U1FWck9sSEErK1ZYVUxKeHM1S2FMTDRwMXM5cUk2dUpPWEc0QUpDNjhV?=
 =?utf-8?B?RmYybHBRR25CTlFEc0p2RkQ1dmNvY2Y1ak5kTkRpaW5KSDN1TThDbS9aSEdG?=
 =?utf-8?B?L1VtQ1BhV2J0MUhaa3hYU1VlWjFydk5hR2MrOVBCY1YrTmFzZ05venFPU0ZZ?=
 =?utf-8?B?ZkJjWTZCNEUyWVluRmpZU21xM0ZTUEV6TkNZWFdyUVVxZFF0dndDcDJ4ajZV?=
 =?utf-8?B?eVhXMEk4aEMyTEsvMlh0Y0s5Um9sbnd6bS9zOXc2MWNDK3VCS0liNys1dTlD?=
 =?utf-8?B?VENaaS9BVVBjMUQxMm9EMndEaVdTY3FETTJLQmNsSEJWaUxBZGtOVWJoQy92?=
 =?utf-8?B?R2Z3dmNpV3Zab2x3ZkYzODRIWEpmY3YxTVU4THhiV3NFMGF3c1ZqdnBhYXlk?=
 =?utf-8?B?TXpNeDZETTZnMGloYW9KMFBBczNIT2Raa0dqUlR0NVY2UTF1MjlIUmtjN3d4?=
 =?utf-8?B?NTI1enFlUnJyOVliazJ0V1JwSVoyNFY1N3FmMGFqSkZRR2d1UkQ2cHJCTkdU?=
 =?utf-8?B?TGxoZXZsUkZ4aWJPa0NiNkVrMkdWaXBETHpGQ3d1eXdBa3pycTNnTVkvekZn?=
 =?utf-8?B?RWFjeEZBZGdYUm1FRXNhVys4ZEhZbDZ5TmVScXM2eE9TZ2tVRnhBZGR6bFB6?=
 =?utf-8?B?UW1tN29Mbnl5TUVJR3hNSDRHaXlKU0ZDTGFTYnJuRElaaVFOTXAvYUFzOEdL?=
 =?utf-8?B?OGZyM2Z3RCtoNlVmSjg4emFuV0xEeDVyT1F4NW5hNTJITGtvQ1Vqd3JFL3Y0?=
 =?utf-8?B?bzA1YUpOdUNlNnZhZWpzd1VWVDBiSjJQMndlQUpmY2owa3V0R0NzRWQ5blZE?=
 =?utf-8?B?K2F4Q2JjeUxlaExKck5ISHkySGZkTXVLVTZrcE1sSzU3RjBiYWZNVERIRmJu?=
 =?utf-8?B?eUhZbWllYzhiSkxuUE5pQW9XbEpGRTd3ak9FVGNhUzI5SHB2VWlTdDhtd05p?=
 =?utf-8?B?UVJJWkZaRmY4cEI3dUN1dkJMd0pYS2hjZkNTcStudGU0T2dwcmFyazYrS2Nl?=
 =?utf-8?B?L1V4TzhLcE9MSkNwNG9zVzNVWXc2WkVwc0lleFRDUUZPYmttZ3o3UUFBOVRX?=
 =?utf-8?B?UXpyRnRjaXk5MkQwOHd5STJRckhtYk5ZRm0vU1FlcEJwR2ZqRGlidTQ4VzZh?=
 =?utf-8?B?cmNsbWtNZzNtMDZaSjJPZEVUQk1uNU03bE9wakxCT3NmNmRYZXdhMnRkb3Np?=
 =?utf-8?Q?iqWR8DhD3F5RYFQGKLuXF8QNinRH/H4mpWW211JmhJ2Y?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b229ae2-4d3f-4348-8de6-08de3e3943ad
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 13:28:00.6514 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 02Px0BN0bjKFmb6CGLzVbePgGP8VHu5jSLLlU+nfP0VPJfTOE1o+vnpt7hnE1uMq9U9C2ZFISGhoQELXw11MRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB9069
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

On Wed Dec 17, 2025 at 12:39 AM JST, Joel Fernandes wrote:
> Hi Alex,
>
> Just did a quick pass, will do a proper review later:
>
>> On Dec 16, 2025, at 12:13=E2=80=AFAM, Alexandre Courbot <acourbot@nvidia=
.com> wrote:
>>=20
>> =EF=BB=BFCurrently, the GSP is left running after the driver is unbound.=
 This is
>> not great for several reasons, notably that it can still access shared
>> memory areas that the kernel will now reclaim (especially problematic on
>> setups without an IOMMU).
>>=20
>> Fix this by sending the `UNLOADING_GUEST_DRIVER` GSP command when
>> unbinding. This stops the GSP and let us proceed with the rest of the
>> unbind sequence in the next patch.
>>=20
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>> drivers/gpu/nova-core/gpu.rs                      |  5 +++
>> drivers/gpu/nova-core/gsp/boot.rs                 | 42 +++++++++++++++++=
++++++
>> drivers/gpu/nova-core/gsp/commands.rs             | 42 +++++++++++++++++=
++++++
>> drivers/gpu/nova-core/gsp/fw.rs                   |  4 +++
>> drivers/gpu/nova-core/gsp/fw/commands.rs          | 27 +++++++++++++++
>> drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs |  8 +++++
>> 6 files changed, 128 insertions(+)
>>=20
>> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
>> index ef6ceced350e..b94784f57b36 100644
>> --- a/drivers/gpu/nova-core/gpu.rs
>> +++ b/drivers/gpu/nova-core/gpu.rs
>> @@ -291,6 +291,9 @@ pub(crate) fn new<'a>(
>>=20
>>     /// Called when the corresponding [`Device`](device::Device) is unbo=
und.
>>     ///
>> +    /// Prepares the GPU for unbinding by shutting down the GSP and unr=
egistering the sysmem flush
>> +    /// memory page.
>> +    ///
>>     /// Note: This method must only be called from `Driver::unbind`.
>>     pub(crate) fn unbind(self: Pin<&mut Self>, dev: &device::Device<devi=
ce::Core>) {
>>         let this =3D self.project();
>> @@ -299,6 +302,8 @@ pub(crate) fn unbind(self: Pin<&mut Self>, dev: &dev=
ice::Device<device::Core>) {
>>             return;
>>         };
>>=20
>> +        let _ =3D kernel::warn_on_err!(this.gsp.unload(dev, bar, this.g=
sp_falcon,));
>> +
>>         this.sysmem_flush.unregister(bar);
>>     }
>> }
>> diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/g=
sp/boot.rs
>> index ca7efdaa753b..e12e1d3fd53f 100644
>> --- a/drivers/gpu/nova-core/gsp/boot.rs
>> +++ b/drivers/gpu/nova-core/gsp/boot.rs
>> @@ -32,6 +32,7 @@
>>     },
>>     gpu::Chipset,
>>     gsp::{
>> +        cmdq::Cmdq,
>>         commands,
>>         sequencer::{
>>             GspSequencer,
>> @@ -231,4 +232,45 @@ pub(crate) fn boot(
>>=20
>>         Ok(())
>>     }
>> +
>> +    /// Shutdowns the GSP and wait until it is offline.
>> +    fn shutdown_gsp(
>> +        cmdq: &mut Cmdq,
>> +        bar: &Bar0,
>> +        gsp_falcon: &Falcon<Gsp>,
>> +        suspend: bool,
>> +    ) -> Result<()> {
>> +        // Send command to shutdown GSP and wait for response.
>> +        commands::unload_guest_driver(cmdq, bar, suspend)?;
>> +
>> +        // Wait until GSP signals it is suspended.
>> +        const LIBOS_INTERRUPT_PROCESSOR_SUSPENDED: u32 =3D 0x8000_0000;
>> +        read_poll_timeout(
>> +            || Ok(gsp_falcon.read_mailbox0(bar)),
>> +            |&mb0| mb0 =3D=3D LIBOS_INTERRUPT_PROCESSOR_SUSPENDED,
>> +            Delta::ZERO,
>> +            Delta::from_secs(5),
>> +        )
>> +        .map(|_| ())
>> +    }
>> +
>> +    /// Attempts to unload the GSP firmware.
>> +    ///
>> +    /// This stops all activity on the GSP.
>> +    pub(crate) fn unload(
>> +        self: Pin<&mut Self>,
>> +        dev: &device::Device<device::Bound>,
>> +        bar: &Bar0,
>> +        gsp_falcon: &Falcon<Gsp>,
>> +    ) -> Result {
>> +        let this =3D self.project();
>> +
>> +        /* Shutdown the GSP */
>> +
>> +        Self::shutdown_gsp(this.cmdq, bar, gsp_falcon, false)
>> +            .inspect_err(|e| dev_err!(dev, "unload guest driver failed:=
 {:?}", e))?;
>> +        dev_dbg!(dev, "GSP shut down\n");
>> +
>> +        Ok(())
>> +    }
>> }
>> diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-co=
re/gsp/commands.rs
>> index 2050771f9b53..0bcfca8c7e42 100644
>> --- a/drivers/gpu/nova-core/gsp/commands.rs
>> +++ b/drivers/gpu/nova-core/gsp/commands.rs
>> @@ -225,3 +225,45 @@ pub(crate) fn get_gsp_info(cmdq: &mut Cmdq, bar: &B=
ar0) -> Result<GetGspStaticIn
>>         }
>>     }
>> }
>> +
>> +impl CommandToGsp for UnloadingGuestDriver {
>> +    const FUNCTION: MsgFunction =3D MsgFunction::UnloadingGuestDriver;
>> +    type Command =3D Self;
>> +    type InitError =3D Infallible;
>> +
>> +    fn init(&self) -> impl Init<Self::Command, Self::InitError> {
>> +        *self
>> +    }
>> +}
>> +
>> +pub(crate) struct UnloadingGuestDriverReply;
>> +
>> +impl MessageFromGsp for UnloadingGuestDriverReply {
>> +    const FUNCTION: MsgFunction =3D MsgFunction::UnloadingGuestDriver;
>> +    type InitError =3D Infallible;
>> +    type Message =3D ();
>> +
>> +    fn read(
>> +        _msg: &Self::Message,
>> +        _sbuffer: &mut SBufferIter<array::IntoIter<&[u8], 2>>,
>> +    ) -> Result<Self, Self::InitError> {
>> +        Ok(UnloadingGuestDriverReply)
>> +    }
>> +}
>> +
>> +/// Send the [`UnloadingGuestDriver`] command to the GSP and await the =
reply.
>> +pub(crate) fn unload_guest_driver(
>> +    cmdq: &mut Cmdq,
>> +    bar: &Bar0,
>> +    suspend: bool,
>> +) -> Result<UnloadingGuestDriverReply> {
>> +    cmdq.send_command(bar, UnloadingGuestDriver::new(suspend))?;
>> +
>> +    loop {
>> +        match cmdq.receive_msg::<UnloadingGuestDriverReply>(Delta::from=
_secs(5)) {
>> +            Ok(resp) =3D> return Ok(resp),
>> +            Err(ERANGE) =3D> continue,
>> +            Err(e) =3D> return Err(e),
>> +        }
>
> This outer loop can go on infinitely, lets bound it?
>
> Either outer timeout or bounded number of tries. Bounded tries better sin=
ce it has inner timeout.

Yes. And what we really want is a more generic way to do this, because
this pattern occurs with several commands so far (and more to come).

>
>> +    }
>> +}
>> diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp=
/fw.rs
>> index 09549f7db52d..228464fd47a0 100644
>> --- a/drivers/gpu/nova-core/gsp/fw.rs
>> +++ b/drivers/gpu/nova-core/gsp/fw.rs
>> @@ -209,6 +209,7 @@ pub(crate) enum MsgFunction {
>>     GspInitPostObjGpu =3D bindings::NV_VGPU_MSG_FUNCTION_GSP_INIT_POST_O=
BJGPU,
>>     GspRmControl =3D bindings::NV_VGPU_MSG_FUNCTION_GSP_RM_CONTROL,
>>     GetStaticInfo =3D bindings::NV_VGPU_MSG_FUNCTION_GET_STATIC_INFO,
>> +    UnloadingGuestDriver =3D bindings::NV_VGPU_MSG_FUNCTION_UNLOADING_G=
UEST_DRIVER,
>>=20
>>     // Event codes
>>     GspInitDone =3D bindings::NV_VGPU_MSG_EVENT_GSP_INIT_DONE,
>> @@ -249,6 +250,9 @@ fn try_from(value: u32) -> Result<MsgFunction> {
>>             }
>>             bindings::NV_VGPU_MSG_FUNCTION_GSP_RM_CONTROL =3D> Ok(MsgFun=
ction::GspRmControl),
>>             bindings::NV_VGPU_MSG_FUNCTION_GET_STATIC_INFO =3D> Ok(MsgFu=
nction::GetStaticInfo),
>> +            bindings::NV_VGPU_MSG_FUNCTION_UNLOADING_GUEST_DRIVER =3D> =
{
>> +                Ok(MsgFunction::UnloadingGuestDriver)
>> +            }
>>             bindings::NV_VGPU_MSG_EVENT_GSP_INIT_DONE =3D> Ok(MsgFunctio=
n::GspInitDone),
>>             bindings::NV_VGPU_MSG_EVENT_GSP_RUN_CPU_SEQUENCER =3D> {
>>                 Ok(MsgFunction::GspRunCpuSequencer)
>> diff --git a/drivers/gpu/nova-core/gsp/fw/commands.rs b/drivers/gpu/nova=
-core/gsp/fw/commands.rs
>> index 85465521de32..c7df4783ad21 100644
>> --- a/drivers/gpu/nova-core/gsp/fw/commands.rs
>> +++ b/drivers/gpu/nova-core/gsp/fw/commands.rs
>> @@ -125,3 +125,30 @@ unsafe impl AsBytes for GspStaticConfigInfo {}
>> // SAFETY: This struct only contains integer types for which all bit pat=
terns
>> // are valid.
>> unsafe impl FromBytes for GspStaticConfigInfo {}
>> +
>> +/// Payload of the `UnloadingGuestDriver` command and message.
>> +#[repr(transparent)]
>> +#[derive(Clone, Copy, Debug, Zeroable)]
>> +pub(crate) struct UnloadingGuestDriver {
>> +    inner: bindings::rpc_unloading_guest_driver_v1F_07,
>> +}
>> +
>> +impl UnloadingGuestDriver {
>> +    pub(crate) fn new(suspend: bool) -> Self {
>> +        Self {
>> +            inner: bindings::rpc_unloading_guest_driver_v1F_07 {
>
> We should go through intermediate firmware representation than direct bin=
dings access?

Only if the size of the bindings justifies it - here having an opaque
wrapper just just well, and spares us some code down the line as we
would have to initialize the bindings anyway.

>
>
>> +                bInPMTransition: if suspend { 1 } else { 0 },
>
> Then this can just be passed as a bool.
>
>> +                bGc6Entering: 0,
>> +                newLevel: if suspend { 3 } else { 0 },

Note to self to figure out these magic numbers. :)

