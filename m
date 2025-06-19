Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1E2AE06F5
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 15:24:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14A3710EA32;
	Thu, 19 Jun 2025 13:24:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="sbLa2Zo3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2085.outbound.protection.outlook.com [40.107.101.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83D6B10EA2F;
 Thu, 19 Jun 2025 13:24:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J28ZUayOOR3ob0bG4ljew3TgHx8WKdjV45yPJNUn5AofH7+HeUrv3t3UfGVTayryuZpRDS760v7rFnECJA1obLu4tPwc52FC0E4qRzKjESB9f9z0ceolGgj52Z4aizzJAu0nCoK2nwPvJY+WJogwaXr74/1KAhbPPKcjFZY8edST6Yghq9EeovELUnBchitiOuSmnAm8XTdHkgTYPNRJ5zv47wOwKou8lcs1DLTqNKIHeGsYEx3aFLVSLMy329E4bwDF17dPCTvkwX6v4q7L3QJmROr0VsK0yotTA4b7AVfydjIbuqj8hEAm2XhlBLp15sBaR08X0MEsxOzLJv8ghw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j+8ADV6Z24Akg7ePmWT3QB1pHPxU3c26dbPwqF93foQ=;
 b=XiY0fzRt7B9hTVLlkBZEp83wf9vDHAq4qlEENvEMNrdu/DsfcNq9zMhqi26oerQBLF3pg2N+4RHnGPBwQzSuD69FErlh93AI5sApZRzxaJ7Q0O5OMq0GFhnJvJWWjzbkaO3/8mfxmxgIFBnq51RW/lj+SUFItaVNW6XbU+6pAyDJCXEKLFEBlgoOP/hAiLsxmx32M3Tlsr8UUpe4LgZ/6e2yJlchASWFtFSiSgKptQOXvHFRoiq/2jLKvz8S7X14LWVVGio1Y/c5dNw0gWXphW0TLVL/YxbFd+rsH4vI/0Wgf9N34U5vlJ+8KvfsZNqZYHdvDHbqABDJVlrzrDEKqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j+8ADV6Z24Akg7ePmWT3QB1pHPxU3c26dbPwqF93foQ=;
 b=sbLa2Zo3b2hcGidf5/ymdqukuUAU8ARC7bjZWCBM5wYp+R4diz0xj+8UNbNs7m4Z5jyzkfutM/mou7azhQZEVXZLtMpGi4pTDZsh4OTrpHf2FVEOVv+hpLtC1urNfn9kbUXbSPB57x5CuEuJZ0fnjO/4WtCDpQbT24wdMH4xJ5LxZdM8xPn/7z8w1166qUlBWfZUE4XUdsR6eF9GKIYQZl8sPV99yRfktEjXGjNXMDydcW5tPjFaiVhISNThSuBHo7uZjh1GL3IoD8RpajEyv5smHurGCHa4FVhJuqKySK2JZo+8Za2qVdVp7+O8OhVMqXiGscA9jz/Eqg6WS9IE2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB8122.namprd12.prod.outlook.com (2603:10b6:510:2b7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Thu, 19 Jun
 2025 13:24:34 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8857.019; Thu, 19 Jun 2025
 13:24:34 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 19 Jun 2025 22:23:47 +0900
Subject: [PATCH v6 03/24] rust: dma: add dma_handle_with_offset method to
 CoherentAllocation
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-nova-frts-v6-3-ecf41ef99252@nvidia.com>
References: <20250619-nova-frts-v6-0-ecf41ef99252@nvidia.com>
In-Reply-To: <20250619-nova-frts-v6-0-ecf41ef99252@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Benno Lossin <lossin@kernel.org>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYWPR01CA0034.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::21) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB8122:EE_
X-MS-Office365-Filtering-Correlation-Id: 69db213c-409d-492c-ee46-08ddaf34a1c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|10070799003|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c1JoajlmbmIvTW9ySEtoMERIVVJXbXA4cnhHSTF5RUtDR1MvNU5iQjJIYzBh?=
 =?utf-8?B?aXJPck9sWHNjR1k3NnVQTnBsSUxTYjcyTzk1SU5HY3lPUC9TUlQ3YWRpR2RO?=
 =?utf-8?B?RTkyNUlSMmdRNkVlU1JTRWxRcVRlSkFNQmgrcFZIaHlteFJES2RxbzNxOFZR?=
 =?utf-8?B?NG5BcHRPTGJ0ZmtqdjJsaXhucENqL3dqb1ZWbEpCaFlnUkdYTHBYYkl0b1FH?=
 =?utf-8?B?SHYwUE9nMy9jbUVVTG4xL3I1SmJUNFVOcXVVcjhVYzdDcGU2YlMxTWdzZ1BT?=
 =?utf-8?B?SHd3NFRwOGVFKzJrSC8zbkdBWVBvdEdvTGdGM0p5dUhuUTc4VFNGMk5hVStE?=
 =?utf-8?B?alYveHlrOUhHRlZKMkhjbmtWRWhHQjROeHlBRkxnK05Vek5rT05rTHduR0Qy?=
 =?utf-8?B?bWh2VGpJU1o1TUVtRnJKWGthZlB5ZnZ4bmFJNCs1QWxTY1p1ZUw3c0ZUNEhk?=
 =?utf-8?B?R1psdWRaR293eUk4THpnL2RpcDcyeHE1Y05qRUxJUWVZZG9Fdk9XRlltM1BB?=
 =?utf-8?B?YWt0dlNWYVMrdi8vU00xN2kzcm45RFpub2VHMEk2czZZVnNXd2lqUEQvekt4?=
 =?utf-8?B?My8zL05jV1Fnc0tZT0RhVDdPbFVIa1h2UkhrYWtaR1hOMWI3SzlDemYvUUZ2?=
 =?utf-8?B?UW1zTUsrVkExbjZvcUNCUWVmMEsvTWFJV0sraS9YSkhxamUydEdFRU9MRjRy?=
 =?utf-8?B?bTEwcm9OcE9zODZVVUJxMVNOOGV0c2FFTEhwbmhjcE5iTWxnTGZUR09Eazl5?=
 =?utf-8?B?SGpKbjRqRG1KeGFacStiL3BqMDNPdnM3ZEdDRk85QzJsK0c2dGNMSThNU0dY?=
 =?utf-8?B?V3RFL1lRalc5QSs5Ty9ua3hYRXRISjV1M1c1VlAxOU9wOVJtZFUyeFNGenBv?=
 =?utf-8?B?UzYzbmhaYUpyTDc1M3RBSHFhNjV5N29jTHUvbG9COFhMSU0rV3d5eC9TRmg4?=
 =?utf-8?B?SDI1cG05cmh1YUhwNXU3NVpXdVhhTG8wYlRaNVcxbEg2WG5wY2syQjlwcUdj?=
 =?utf-8?B?Y1pXQ1N2WWdtb0VoTm9YZWg0NE54YXJtVXFvVGNQV1JDYjBkSm90YWFxc2hY?=
 =?utf-8?B?WjdIVC9qbkJFcXhSQ0ZaMlIwbjlwaGxRK3lxN1hBWlRURXZZUW9hRjZnKzNr?=
 =?utf-8?B?QmVtZHRlcXlNTVV3UEVNb1dINGZtUWEyazlNeXd4WERVUkRueWNyWHQ0UnBz?=
 =?utf-8?B?bDV4eGNOT2k2dXBzVWkxd2pmMU5mOE1QWHFkRUdpSjE4TUlvUEdTaEhmRzFp?=
 =?utf-8?B?M0IveEwvZzVnWVplTlpPZWVHMEhvUnpwbFpmUHNJU3Q5SU1uOEtTQVVEdm5U?=
 =?utf-8?B?eHpCWXhNSzg0SUwvc2toNEl0N2JXdFFWekhHcDBZTlJROEpyN0lXckxrU2JK?=
 =?utf-8?B?RlYxMXFscVJ2bGVyS1pqemlBM0Z3YjBpQmRnaTU2b2lVaS8yZnR2SUkxSGd3?=
 =?utf-8?B?SldWMTBDQkZaODkrVmQxR2dVbWlnYVhPaFozZlpXQWI4bE9VRUpqV29GVDdR?=
 =?utf-8?B?bUt6REJ1ZGI5ZTRjcnU1ZVBoWXhXamhHSlVBUTduZUs4SXpNMGdqT1JPSDgv?=
 =?utf-8?B?akI3SGJEUkREOVQ2ekVYVnAybXZlSlJmV0VteUp0OXJvOFRveUNSVXk0T3pt?=
 =?utf-8?B?Z0xVajYrc1ZqYlpURitGZElyR1JKQWVZQm9PcFRhem9MMGpTMkZiL00yeXUv?=
 =?utf-8?B?UEQ0M1JzODNBZlI2UDVOaHZSc0U3d0QxcU9YdFlvcW1rcm5ORHY3LzhhazRw?=
 =?utf-8?B?MVVjc2tacVVYMnVydjM5SXU4bUdLeGxvY1Z3UGNEZzJMd281S0Nyc0lqaWJG?=
 =?utf-8?B?KzNwUUVyZitGMThuWGFiY09ydE9jalljaG41UmNtVlBySjhNS2Ric2Z5Wnd4?=
 =?utf-8?B?MU5WWm91L1IzSzZOSnBYNWV0ZnhIOVVweU5kYUlRRHp1T0V2N2tXU1dNMjA5?=
 =?utf-8?B?OFlwMUwvYTNpTmZ6MG5YMEp2RXBWT0JCU2lOVHI1SkxZRVMzUHZrVlFMMjlx?=
 =?utf-8?B?cXliWE1JNWpRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(10070799003)(1800799024)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MjQ4UTJGMHVFYVYxMVQzdXloR0JFSDUycElvblg4U0pGOHhRZU5xZ0tDN3BG?=
 =?utf-8?B?cllPdEpubVhINS8wRlpnbEtaaUUzRUx1QzRqejgzZFZsZTVRWng5UWx6Ny8y?=
 =?utf-8?B?RWxMZy9vbHNudUpobHFoNDFaTFRHbktOdzVPYkxPaVhaamdjWjdQQTRwNlll?=
 =?utf-8?B?MExZdnR0OC9seGs0dnpnQVFTRjIremcvL1BRNGNEbFVMS3ViWEFBclFLSDM1?=
 =?utf-8?B?QVJheC9CWTZrZWxJSE4vNWl4U25GcEJWaTBRM0xYaS9IRkJ6aFpJeTkxb01E?=
 =?utf-8?B?dWo2NnNwNXNuTEhZcytwa3Y0b0VlN2tBVUNkekhOK1dZWFl5YW1RMG40cEFJ?=
 =?utf-8?B?blQ0YUFnQnA4WVhxSVlEeVo1TDljcGpXRy9yNDlFZ2JKQmhOTlhTYVUvV1lI?=
 =?utf-8?B?NC8zTUhmT1hxd2ZGc2pHS2phWldaZ3RyWTV5VWhaSFp1QTNzMm83bnN1dE1q?=
 =?utf-8?B?bUhUSWZubzQrSWJPQXdGb20xNFJNcmVXR0Jkd3Bpc05jVjZQK2hFWjdpWm1u?=
 =?utf-8?B?a2xFZExoU3lQbTNNYy91dVRNeDUwVEpVWGl6N3hxcGMvaFFEUEhoL2RyRVQ2?=
 =?utf-8?B?cE5XR2NsaklpaUZ5bUVOUDM0YjBKc1JFRUZNa0FzWTlDNHkzbkFaSXhuL25Z?=
 =?utf-8?B?cDhIVzBEOWdDajhPZDNyQ0xUcnBSb08rTEIxdUlXSzR5R3I5YlpWRTRiQmJu?=
 =?utf-8?B?Vko0QXNib1ZEQWVRaXlhNFJXUGdPdzU3cUNwaEpNQjBGdUppaFZTZWRPM2o1?=
 =?utf-8?B?N2FsWkVrZjRVZkt5ci80UGJ1bmRiY2h2VU1ZSU9HVzluMTNiWGJKbzBhZk5R?=
 =?utf-8?B?RHBSRGFoMThDWW9pWGY1Mk14b21XNjNER1VSRXpkZGNBYzR6eWE2NFlKTmNJ?=
 =?utf-8?B?UHVpb084VU9aZmMvY0czbXIwWUhoYVZYOGdQQjF0K3Q4SDB1dWRtU0c0UEpX?=
 =?utf-8?B?bm9xUzBPK3U4a252RnRFS0s0WStQUEdoUDlRRG9Cd01uN0JrVHFadnhJYi9M?=
 =?utf-8?B?RklCUEZpZ2hrTTkrK3UzQ09PQWRTMG1oRjhWeDBTclFmemdiNS9GQ1cyWGpE?=
 =?utf-8?B?RnZ4M1BrTC8yZzBOeDUwYVJxYnJSU1ZkWDBUV2NxeTJrVWR2eGVCaGRRVXFO?=
 =?utf-8?B?SEJwMTRuZy9Hd25LMThSMklUbExWOExncXRTc01NbUdTU1ZoSlQvMFZ6NDJv?=
 =?utf-8?B?NEExT29wbitDa00wSlVmeHJHdVJqQTQ5STdYTEYzNTgyUDljQTlyMW01eXZy?=
 =?utf-8?B?a3A4Uk45NTdMR0VjeithSkJOdFRzVzcvenUxRnVBWCsxMEtaRlJaalBIUWtU?=
 =?utf-8?B?a000VVR3TkhFT0J3TUZIaUFDaWVXRmRqZTdNbFdYTjUxVzE5bmh3ZnY2T1dq?=
 =?utf-8?B?OUFEeG9HRkV6MDZiTHhIT1BCYlJDUU5zR2dEWVRpQkVsbUc1WGovc2xaWmFK?=
 =?utf-8?B?SmQ2ZFRlQ2tzcWV3RW11d2hLNHhMQm80Um02QVpqZGQ4dThwYnFJSVcrSy94?=
 =?utf-8?B?UnBxK3RRTWdoQkVwUE42K0ZPMEFqMHZmZnBhMUYvOVVMMG5PeTB3SHBLU0Jz?=
 =?utf-8?B?Y0lTT256N25TWFR0c252UTJxejJkUUFPRVEzZE51ZkR2czFkM1orVkFycVJT?=
 =?utf-8?B?cTBYeldMbzRRL0JrYUJNUUpLTlhwdDhvS3U3K2RvbUhzOVdnMy9OU1F1dFFR?=
 =?utf-8?B?b3AyMUNMM25uTXpabktmd1YvUVVaUHE5Um1MQ3dJUkhJVFVzaTI0M1JGYkZN?=
 =?utf-8?B?d3AyckhLeGEyVXZVRk9WTUs0UnEvdGVUOUN1YlNKZmNiYVg3WXd0bGxtU3Fx?=
 =?utf-8?B?U0tVZnIzblhoMDR5RXRSVkVacTF3aS9ZSURFWXZzeXNKTE14SFk5TmoxTmJu?=
 =?utf-8?B?SmRGbVpMaGpXSDFEZGZWNFlTWXN6L0JzTGF5SlhFNWpVWDA4LzlrUUFsUVhI?=
 =?utf-8?B?Y0RoUkRjM1NGM203YTZKekp3WDVvWGN1OUhNUGxvTTk4WDVQMVpIMTJoVDB5?=
 =?utf-8?B?N2hvaThReXQrVzE3WmM2OVVuekIvK2NWaHFwNTdyVXQvZHliOGI2MURTejJD?=
 =?utf-8?B?MVd5a3dhZjNGNS8zZ1RWN0FaSHpFQWdmWEVJSmFxd1ZCeVRDOU5GVXhxekN4?=
 =?utf-8?B?M0hDMStKdE1aYVdqTk9GNWR6S3YyZk0yWUczUEFXSWVJVTZEUlRYeXZGdWNH?=
 =?utf-8?Q?m66UewLME14tyIsw5DPEWA8FZRv2Eqiz1uEAdozNZy60?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69db213c-409d-492c-ee46-08ddaf34a1c8
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 13:24:34.7253 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: svcSls2Rw4SGJW8YgdyiBgdKCn3SBVwZp8kUc8+c7XkOjHai21OkWRD4ew610bNOM6vY3DxLuIvR5pnusWpkrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8122
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

Sometimes one may want to obtain a DMA handle starting at a given
offset. This can be done by adding said offset to the result of
`dma_handle()`, but doing so on the client side carries the risk that
the operation will go outside the bounds of the allocation.

Thus, add a `dma_handle_with_offset` method that adds the desired offset
after checking that it is still valid.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/dma.rs | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
index 15ff639b3067d0e4a39e181bbe709a9c372a591a..04546e58252d308e7a9f17bd2eae0aebfdc3c271 100644
--- a/rust/kernel/dma.rs
+++ b/rust/kernel/dma.rs
@@ -238,6 +238,20 @@ pub fn dma_handle(&self) -> bindings::dma_addr_t {
         self.dma_handle
     }
 
+    /// Returns a DMA handle starting at `offset` (in units of `T`) which may be given to the
+    /// device as the DMA address base of the region.
+    ///
+    /// Returns `EINVAL` if `offset` is not within the bounds of the allocation.
+    pub fn dma_handle_with_offset(&self, offset: usize) -> Result<bindings::dma_addr_t> {
+        if offset >= self.count {
+            Err(EINVAL)
+        } else {
+            // INVARIANT: The type invariant of `Self` guarantees that `size_of::<T> * count` fits
+            // into a `usize`, and `offset` is inferior to `count`.
+            Ok(self.dma_handle + (offset * core::mem::size_of::<T>()) as bindings::dma_addr_t)
+        }
+    }
+
     /// Returns a pointer to an element from the region with bounds checking. `offset` is in
     /// units of `T`, not the number of bytes.
     ///

-- 
2.49.0

