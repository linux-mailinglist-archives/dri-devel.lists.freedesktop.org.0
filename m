Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C868A947B4
	for <lists+dri-devel@lfdr.de>; Sun, 20 Apr 2025 14:20:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D97C10E2FE;
	Sun, 20 Apr 2025 12:20:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="QYSXpR8M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2070.outbound.protection.outlook.com [40.107.236.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1D8110E2B0;
 Sun, 20 Apr 2025 12:20:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ybrzYRz7PoxCpX6wCKBscoCfQZBOK4uqQNpcLb9WXzLHEFxx3Vhepln/4QVC5EVTIc3cs08ZvKPbxIPnyWYtvhbPO9e6FPgoAa8Zhy4dchrc6T9SsIZGR3Cmv12S585IP/a21ST1oCK6uu2qlzf3h7J8r1raiql1ndg4TaWlklS6yTNH1+toF7iDbTS8q6CuR5vFESmrCqnQQDzqdSeLzZCVyjthHcu34RoCArmqilbkB+WROrcTTnvqJ3ys3L/QePvAeNxHFdEWya4zf/D1NTgR501BdtZ6d5NEK+uq5mukpPe+2L3N7OuM9uiSB5nEPzsRw4thfj7gwMbYymAj2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ZfmoFrp/WsGmA+wdzIM2RG2s6FVeuYL/YMW9fghwKA=;
 b=mAGL+M02jzbQO3vxRG6+iAHpMts+WifsPSaIY0LVMjjhhNK9Ap2l/5z93ts33OVLOI1xL8He2LTfGwAzeTJAtaeYggCozFcbfLKOQ9iad7/dvYW9Rs8i5LZGiVjJqukX3Ivl69Ws8fB+HxMLqXfxKwJaJN7fA42jkb+8vJqdVQ6NxVyuBn0hiWcStcJbACl3AlmdoJfq7qPqb7DmJ7KK+LGfXBYlFL8uw3ynNwyRRBwgAeBK4Tao1xxPb4rBy29PgXOhwlSHuml9G4iJPWtDX3PkLWcCFLLXffw3Gl4CeK6VL7wAnVU2GvJez+gAm9GMrAkymwFQLp4rOZhyrjdycA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ZfmoFrp/WsGmA+wdzIM2RG2s6FVeuYL/YMW9fghwKA=;
 b=QYSXpR8M2YTAQUiADR6+i3QC+ILYcljvqqKTR6NsW30DIigaUkE9qLkQM1a3uxhCBjqm28ci/QUZ3yT0FIQ8MNdSZnLVqpY2fsBmW7shzU7wNzVoluKWNqZJFEvHWHgsbcXvwBkPEfGmcZJpUSSaG+ep+0X+TwDXP8+q4sedLNut7vfc1aaY9J6wHMpairOyrHFNeAM+/3fPRWWx6/l8LIT0ocZYY45cMDKpvlqQD/THO5wL5BaUNgTqUwvG0a9OmrA/bXhb8ZBrrGuQ/Jgpu+fbBqxLMWeYIVi/GHNIR2qDDVvh2NKfEC53nljDZc9uqkF4jQv6XlwyAnVQf9YIpg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB9175.namprd12.prod.outlook.com (2603:10b6:510:2e6::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Sun, 20 Apr
 2025 12:20:11 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8655.025; Sun, 20 Apr 2025
 12:20:11 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sun, 20 Apr 2025 21:19:38 +0900
Subject: [PATCH 06/16] gpu: nova-core: define registers layout using helper
 macro
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250420-nova-frts-v1-6-ecd1cca23963@nvidia.com>
References: <20250420-nova-frts-v1-0-ecd1cca23963@nvidia.com>
In-Reply-To: <20250420-nova-frts-v1-0-ecd1cca23963@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP301CA0045.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB9175:EE_
X-MS-Office365-Filtering-Correlation-Id: c4d85820-0b41-47e2-86c0-08dd8005b251
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|10070799003|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U3dPc2dGNHA4WkNzcHdZRkhkUTZZOGltb2l3eTc5cmkvRkNrWDF2YjhLQWhR?=
 =?utf-8?B?RWhBV3djVmNreG1aQ2VQVmtYRFVNaHJ0bWVreEUzcktJNXg2dXFoUlhRQ2x6?=
 =?utf-8?B?WUc3bHRkYldjMW9PUzg1NHFPTTVSaWdzcXJ4c25uOTBlaGVCaXZhZk9ibDZo?=
 =?utf-8?B?dkppNjlYRmoxRTZ5OGFFUHRnak5rQVBkRG9YU1A3V0JpeTA4TVM4RlZTRnFt?=
 =?utf-8?B?cEpzTEhnb0xUSVhaSmdxREQ4RjVWVU0zUjhKbENRTVdtSElrVlRFZVA2STZm?=
 =?utf-8?B?TVRZekRnV3pSVmZyakV2MFNJVkJobmd5WUVTNDZ3RHhETFhsVHFNcnNOb2NI?=
 =?utf-8?B?ZjErNWJMbWdKYndhOUJWSVJJb3J5aWxKdlhiUXFIbVl2NFdHczRxTU9ObkhH?=
 =?utf-8?B?Z0dEbUxsTDhueERJTVRWSVlHV3dNRmt6bTZqWmpZYmQwckltYmNqRmUvSVZR?=
 =?utf-8?B?Y0o5ZGJvZlhRSWFZc0lkRWdZTW1ZeDZyUE5HaEE1OUQyblUrOXVCNTJDZ0xJ?=
 =?utf-8?B?RmZVYkk4M0tESHRjc1ZjSXp4blNjaHpQMjROU1VxMmRYLzRHZzltazRWUk1x?=
 =?utf-8?B?TnJUQVEyM1p4OW1rSkNzRkFmV1ltNjBxR0RkZDk0UFJpQktRUnltbUhUUE5j?=
 =?utf-8?B?S1VPYzh5aVllSjU3cTlKV3pvbDl3T3Z3OW9WUCtQTTR6ZE02WFhhbEdUY1l2?=
 =?utf-8?B?dGR0VklMejFPODZ6djlTSnpJYVdkR1JycVovYWdSNzA5OFNiYk5YbFh6WjZt?=
 =?utf-8?B?NzFtbDg0RW1TMmVYNW5UOUhUUjdZS2JTa01yL1JNK3JwSnZHQ1EySEhZZWY3?=
 =?utf-8?B?ZkZLNmxzK2Y2WlkreUhxcmJVSWU1WGxpYk1RNnUxZVVlRWFGei83R2dJTnRw?=
 =?utf-8?B?dHNyUi9PYTlaUFI3dHkwckVUR2JzZ29QdERBcHNQYzZxSWRCcUZCMjBXRlVu?=
 =?utf-8?B?UEJYR1NEdTZEdUlwbWkzV25CUFJDWExOQUtNWTJSSHF2ZXprQXo2dEdoVUpS?=
 =?utf-8?B?NEdqTW5BWmRreVQ4cEFOS0g2bzZaWEVHZll3eEJLZHNLVDUrRDFyekxkbWI0?=
 =?utf-8?B?b0R3cmQyakVQSEZJaVhjZ1lwTUpsdDlwN0hvNjl3eG9weVQrOUV2RXlHUUZ3?=
 =?utf-8?B?UzkraU15dFczMVhyZUlZdkZ6MnA0cmlBMGVURVU1UTBwdUJySVdJVVB0Y0ls?=
 =?utf-8?B?OGY1UzNvUThXVTdtdlFPMi8yNUVZVnpoQnh2d082UWtHMGJYVEl2SVVWQVlY?=
 =?utf-8?B?amU1TGZpZHJ6aGRKdlo3QitPNnlsb0pBZlV5VDRVaVRIR0JWMktVamFsS1Nn?=
 =?utf-8?B?OHE5ZVJsZDhwNEJWZE5PSzJRWlZQeE9WQ2dxSXdPekRWeTUzb0ozam0yNHAz?=
 =?utf-8?B?T0JMRGthZjUwQW5uaEdELzJjbWxYdnhsV2FWNlB1d2NGVXo2bDJpY1c3VUtt?=
 =?utf-8?B?UG1paFZkTFJ3OHlDYmRicFVMdXQrMWUvcVVuMmVreVBOZkVOQWJkRkhEUTFQ?=
 =?utf-8?B?N2FmM3Q2RldKT0UwSWNvOTJmdXBPYmJsWVk2WVlhRTJGem9PZ3RsczVRdEpK?=
 =?utf-8?B?R2l3MHJDOGFFTHFkTnZoVjZqZXJpaXV2RkRmSVZEYVloakFqb1dJS2lreldH?=
 =?utf-8?B?QkMyZGNOaTVmaG5zTkhoSHRhcFVLSWtWT2N4R0x2UnN4UCt4a3F4dlpKVk94?=
 =?utf-8?B?VHMvZ0VmYkpoUnBFS29UQWRqeTdJS2JiSWJjMGdSb1hSNDhBanFhRC9qMGVE?=
 =?utf-8?B?NXoxVys5L01nR0JTQ1puRzBhdCtsSzBwcjR0TXE1R04wbDlFdS9CWGhESUNw?=
 =?utf-8?B?aTN1c3NWQ3M4TDZSK0hXVGhXRU9mS1dyYkpvWlNIaWJnckZUMVI3a2dWQU53?=
 =?utf-8?B?VUpINWtsditTajV1ZzZoSTJrR1pJRjdZUjFVb1NUSDM1dWhaTHRGZ0lKenMz?=
 =?utf-8?B?TjUxcURDTGFUVFc0MVhBTWVJYU0rMFVOaHhaN05HZmpUVkliaWdyTFdEazN3?=
 =?utf-8?B?ZzlHMzNUUjBnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(10070799003)(1800799024)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjVkRElGWm10T05NZ1F5R0hHeHBGZURDVXlPZFdYZ1J2cVp1MnRndHpjelN3?=
 =?utf-8?B?NVNmMU5rR3pyN0JiTkczWld5NHRoZWhUNk5EZDZ6SzNIVUxudnFYNEFLeVov?=
 =?utf-8?B?Yit1cUlveFo0SHFaUng3VXFVV29Fb2FEYnhTdTRnSklOYk5MNDZ3VC9kT29L?=
 =?utf-8?B?TFozaHF6cnNOZVV0ZGJzS1NWemdCbUlhclNOMG16TndCak1XSzdwTS83a0Zq?=
 =?utf-8?B?RDZwZEM0SFUxUmt1dzVjcVpiRnNGK2JuQVp1SENSb0psb2ZIZUM1TmsxYVZ4?=
 =?utf-8?B?K0E1SWJ6NXhJRXk0d2swV3pySXNhQzZYMTlhMlBrb0g3aG5jMzV2cmE3dVNx?=
 =?utf-8?B?ODR4UUtBK1JlcU41aXNNMk9aeEhpeERDcERMT0xpaFJNSGdIM2t6RitpWExD?=
 =?utf-8?B?YldHeHpQVCtOVjRPdytoQVRMVHQ3SXpNa2JOczg1blREV1dBc1I0UlhjTkVo?=
 =?utf-8?B?NG9DOFJnM0ZQYUx3cngrRzFxM1FDVHVHcWNncEEvajEyNWZrd1FoTmlnK29M?=
 =?utf-8?B?WGE2dlN6QzREM2VhMGZoMkRkZ0VVSDZHV2NBNEJwTVJoME9CUnRNL3dNakxl?=
 =?utf-8?B?eEpJWjNXR0NHUWgrQ3krTE1nWTZNZlZlRFYyUlcraU5UMW8wckM0enZxbFln?=
 =?utf-8?B?MzVOZ1A2ZU1hc3ljeTNpNS8vRmsxNXBKd1lNMnVBNjBrZzNUMWhKZHFZMUJT?=
 =?utf-8?B?VHV0UEx1S0hMSmRQK1g5OEllalN0cStacnlvSEVyRjl1NklYR1BSb1ZYZ2hE?=
 =?utf-8?B?dUdCM2hXdGJmL2hrTTEwZ1pHUFdoNUxQL0wxU3h2ejY4cHVTdlUxbEIrbnBn?=
 =?utf-8?B?MmtmRGUzdTFNRHlLUEREMFp6MEtHa3dzZnMyNDY1cmZrQytBWFAyMUFybkFP?=
 =?utf-8?B?b1VyUDl5TUUrRFZ6ZVB4KzJ4bVI5alkyandRNzZNOEFVVk5VNUUrdis1dzc5?=
 =?utf-8?B?SnJyL05PeFJxZ2F0TFNyWFhHTTdTU2libjN0eFlMWGlGc2xTQ25WMm45clVJ?=
 =?utf-8?B?MTl0WXJqSEJFUGxEVGN4L21pVElEdTVGdWlzb1FVR1ZRaFNnbC84Wk5WanFz?=
 =?utf-8?B?NkJyZ0NCUnlIT2oyU0JXcHVZU1VXU3FhelMvTDQ2MEkweFlaQyt5WE55Ny9J?=
 =?utf-8?B?M0lkbE1EVm5nS0c4TWkzZ3dybWNzdXJWV255emVNR2xnL1dBR0U5aDNmT1ZT?=
 =?utf-8?B?NFlwY2krajBPQXI2b2M3Nnd0OGhxZWI5WmJvbkxPR1BydU9NRnl6bW9EM2Z6?=
 =?utf-8?B?Ly9iTXVBUEJ2UGQrZVc3NzZ1ZWdjYkZ2UjhtYWhDRlJUUHQ0RXVTMHJBSlJk?=
 =?utf-8?B?OSthODZkRzd6cU1QQkF2Nng1L2ZSdzNIMSs0RTR3MVpiejhUcFlHUlVRWHJT?=
 =?utf-8?B?TjlDbGVyZXlxUHhwOElrS2pTc1BKR1FHVHpBMVZEU3hha0hWcTZhQThzbXZS?=
 =?utf-8?B?WFZITGpueWRDUDNoM1FZeWZkUTgyMUlURXcySkNnUytlT29YWnhRVksxTHJl?=
 =?utf-8?B?YVk2WkRPckkyWTVtMW5oNjd1c1VpQml2RUNQSTNtcUl6K2lkVy9xSWZUM0tP?=
 =?utf-8?B?MVpTUmdSR0kwTnRzWUdwRFpnTFRBRVcwT0J0SGlpWnN0Z0FlU043SEVWS3Nw?=
 =?utf-8?B?UStxbkVvYysxU1pFcVY5dUROTFNDTWpZdG5naGRMa1lSalhTQU43MEJYbC9z?=
 =?utf-8?B?WEplWEZNNUdPaGE5Z2hwODExaS83R2dCOFlTM2IzTDRHZVY1OVl5VEVnbXFi?=
 =?utf-8?B?M3plR1QwbEYxNEF2K1pCMU4wNzVSZy9RR242VzNlMElCdkRiV2VLSmhuc1NS?=
 =?utf-8?B?YjdjbHlScEpESC9kSEl5MWVpYjZpeUU5ZCs0bFdZUDlFLzJXVDNCL0dWMXlV?=
 =?utf-8?B?VlkxbVhmMjQ1ZVJGL3FDOUxrT3NKdVpUM0F2RkVseWh4bmk4eDVweG51dCtD?=
 =?utf-8?B?UXJxRVljaHQ5MUdoUzAxTnFUWU1nV3lvZ0FaNi9uTFFtcGxVOHU1NWNEcFow?=
 =?utf-8?B?eDhTNDVMeVcvYnZNeHhya3pvS3JlN0VRQklJcDkrYVI1N3NsUlJkVnBheGp3?=
 =?utf-8?B?ZjBsd2dseEJLTUJMRDdLSzJOTXkrL0NGU3k3eVBBU1JsOVRsU0VONDlhRHNR?=
 =?utf-8?B?M2l5Vk93d0EzSTVDaHBZTHlaSThNSG5ZUVBHYlY5d1QwNVFXK0xwM2FSV0do?=
 =?utf-8?Q?+9JJDQkBHKcgtlcZj9D9J4DitFB+5cIaoE10lySucZos?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4d85820-0b41-47e2-86c0-08dd8005b251
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2025 12:20:11.2626 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h6OqRSSWnOVuXFYkshFToBIxXR85ZNZ95qN/VlgjN/Tz5oBp8exOzKvqgbL0YT4heDonOdZ9t4k8g6rHrtHWhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9175
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

Add the register!() macro, which defines a given register's layout and
provide bit-field accessors with a way to convert them to a given type.
This macro will allow us to make clear definitions of the registers and
manipulate their fields safely.

The long-term goal is to eventually move it to the kernel crate so it
can be used my other drivers as well, but it was agreed to first land it
into nova-core and make it mature there.

To illustrate its usage, use it to define the layout for the Boot0
register and use its accessors through the use of the convenience
with_bar!() macro, which uses Revocable::try_access() and converts its
returned Option into the proper error as needed.

Suggested-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 Documentation/gpu/nova/core/todo.rst |   6 +
 drivers/gpu/nova-core/gpu.rs         |   5 +-
 drivers/gpu/nova-core/nova_core.rs   |  18 +++
 drivers/gpu/nova-core/regs.rs        |  60 ++-----
 drivers/gpu/nova-core/regs/macros.rs | 297 +++++++++++++++++++++++++++++++++++
 5 files changed, 333 insertions(+), 53 deletions(-)

diff --git a/Documentation/gpu/nova/core/todo.rst b/Documentation/gpu/nova/core/todo.rst
index 234d753d3eacc709b928b1ccbfc9750ef36ec4ed..8a459fc088121f770bfcda5dfb4ef51c712793ce 100644
--- a/Documentation/gpu/nova/core/todo.rst
+++ b/Documentation/gpu/nova/core/todo.rst
@@ -102,7 +102,13 @@ Usage:
 	let boot0 = Boot0::read(&bar);
 	pr_info!("Revision: {}\n", boot0.revision());
 
+Note: a work-in-progress implementation currently resides in
+`drivers/gpu/nova-core/regs/macros.rs` and is used in nova-core. It would be
+nice to improve it (possibly using proc macros) and move it to the `kernel`
+crate so it can be used by other components as well.
+
 | Complexity: Advanced
+| Contact: Alexandre Courbot
 
 Delay / Sleep abstractions
 --------------------------
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 19a17cdc204b013482c0d307c5838cf3044c8cc8..891b59fe7255b3951962e30819145e686253706a 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -135,11 +135,10 @@ pub(crate) struct Spec {
 
 impl Spec {
     fn new(bar: &Devres<Bar0>) -> Result<Spec> {
-        let bar = bar.try_access().ok_or(ENXIO)?;
-        let boot0 = regs::Boot0::read(&bar);
+        let boot0 = with_bar!(bar, |b| regs::Boot0::read(b))?;
 
         Ok(Self {
-            chipset: boot0.chipset().try_into()?,
+            chipset: boot0.chipset()?,
             revision: Revision::from_boot0(boot0),
         })
     }
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index a91cd924054b49966937a8db6aab9cd0614f10de..0eecd612e34efc046dad852e6239de6ffa5fdd62 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -2,6 +2,24 @@
 
 //! Nova Core GPU Driver
 
+#[macro_use]
+mod macros {
+    /// Convenience macro to run a closure while holding [`crate::driver::Bar0`].
+    ///
+    /// If the bar cannot be acquired, then `ENXIO` is returned.
+    ///
+    /// If a `?` is present before the `bar` argument, then the `Result` returned by the closure is
+    /// merged into the `Result` of the macro itself to avoid having a `Result<Result<>>`.
+    macro_rules! with_bar {
+        ($bar:expr, $closure:expr) => {
+            $bar.try_access_with($closure).ok_or(ENXIO)
+        };
+        (? $bar:expr, $closure:expr) => {
+            with_bar!($bar, $closure).and_then(|r| r)
+        };
+    }
+}
+
 mod driver;
 mod firmware;
 mod gpu;
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index b1a25b86ef17a6710e6236d5e7f1f26cd4407ce3..e315a3011660df7f18c0a3e0582b5845545b36e2 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -1,55 +1,15 @@
 // SPDX-License-Identifier: GPL-2.0
 
-use crate::driver::Bar0;
+use core::ops::Deref;
+use kernel::io::Io;
 
-// TODO
-//
-// Create register definitions via generic macros. See task "Generic register
-// abstraction" in Documentation/gpu/nova/core/todo.rst.
+#[macro_use]
+mod macros;
 
-const BOOT0_OFFSET: usize = 0x00000000;
+use crate::gpu::Chipset;
 
-// 3:0 - chipset minor revision
-const BOOT0_MINOR_REV_SHIFT: u8 = 0;
-const BOOT0_MINOR_REV_MASK: u32 = 0x0000000f;
-
-// 7:4 - chipset major revision
-const BOOT0_MAJOR_REV_SHIFT: u8 = 4;
-const BOOT0_MAJOR_REV_MASK: u32 = 0x000000f0;
-
-// 23:20 - chipset implementation Identifier (depends on architecture)
-const BOOT0_IMPL_SHIFT: u8 = 20;
-const BOOT0_IMPL_MASK: u32 = 0x00f00000;
-
-// 28:24 - chipset architecture identifier
-const BOOT0_ARCH_MASK: u32 = 0x1f000000;
-
-// 28:20 - chipset identifier (virtual register field combining BOOT0_IMPL and
-//         BOOT0_ARCH)
-const BOOT0_CHIPSET_SHIFT: u8 = BOOT0_IMPL_SHIFT;
-const BOOT0_CHIPSET_MASK: u32 = BOOT0_IMPL_MASK | BOOT0_ARCH_MASK;
-
-#[derive(Copy, Clone)]
-pub(crate) struct Boot0(u32);
-
-impl Boot0 {
-    #[inline]
-    pub(crate) fn read(bar: &Bar0) -> Self {
-        Self(bar.read32(BOOT0_OFFSET))
-    }
-
-    #[inline]
-    pub(crate) fn chipset(&self) -> u32 {
-        (self.0 & BOOT0_CHIPSET_MASK) >> BOOT0_CHIPSET_SHIFT
-    }
-
-    #[inline]
-    pub(crate) fn minor_rev(&self) -> u8 {
-        ((self.0 & BOOT0_MINOR_REV_MASK) >> BOOT0_MINOR_REV_SHIFT) as u8
-    }
-
-    #[inline]
-    pub(crate) fn major_rev(&self) -> u8 {
-        ((self.0 & BOOT0_MAJOR_REV_MASK) >> BOOT0_MAJOR_REV_SHIFT) as u8
-    }
-}
+register!(Boot0@0x00000000, "Basic revision information about the GPU";
+    3:0     minor_rev => as u8, "minor revision of the chip";
+    7:4     major_rev => as u8, "major revision of the chip";
+    28:20   chipset => try_into Chipset, "chipset model"
+);
diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-core/regs/macros.rs
new file mode 100644
index 0000000000000000000000000000000000000000..fa9bd6b932048113de997658b112885666e694c9
--- /dev/null
+++ b/drivers/gpu/nova-core/regs/macros.rs
@@ -0,0 +1,297 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Types and macros to define register layout and accessors.
+//!
+//! A single register typically includes several fields, which are accessed through a combination
+//! of bit-shift and mask operations that introduce a class of potential mistakes, notably because
+//! not all possible field values are necessarily valid.
+//!
+//! The macros in this module allow to define, using an intruitive and readable syntax, a dedicated
+//! type for each register with its own field accessors that can return an error is a field's value
+//! is invalid. They also provide a builder type allowing to construct a register value to be
+//! written by combining valid values for its fields.
+
+/// Helper macro for the `register` macro.
+///
+/// Defines the wrapper `$name` type, as well as its relevant implementations (`Debug`, `BitOr`,
+/// and conversion to regular `u32`).
+macro_rules! __reg_def_common {
+    ($name:ident $(, $type_comment:expr)?) => {
+        $(
+        #[doc=$type_comment]
+        )?
+        #[repr(transparent)]
+        #[derive(Clone, Copy, Default)]
+        pub(crate) struct $name(u32);
+
+        // TODO: should we display the raw hex value, then the value of all its fields?
+        impl ::core::fmt::Debug for $name {
+            fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
+                f.debug_tuple(stringify!($name))
+                    .field(&format_args!("0x{0:x}", &self.0))
+                    .finish()
+            }
+        }
+
+        impl core::ops::BitOr for $name {
+            type Output = Self;
+
+            fn bitor(self, rhs: Self) -> Self::Output {
+                Self(self.0 | rhs.0)
+            }
+        }
+
+        impl From<$name> for u32 {
+            fn from(reg: $name) -> u32 {
+                reg.0
+            }
+        }
+    };
+}
+
+/// Helper macro for the `register` macro.
+///
+/// Defines the getter method for $field.
+macro_rules! __reg_def_field_getter {
+    (
+        $hi:tt:$lo:tt $field:ident
+            $(=> as $as_type:ty)?
+            $(=> as_bit $bit_type:ty)?
+            $(=> into $type:ty)?
+            $(=> try_into $try_type:ty)?
+        $(, $comment:expr)?
+    ) => {
+        $(
+        #[doc=concat!("Returns the ", $comment)]
+        )?
+        #[inline]
+        pub(crate) fn $field(self) -> $( $as_type )? $( $bit_type )? $( $type )? $( core::result::Result<$try_type, <$try_type as TryFrom<u32>>::Error> )? {
+            const MASK: u32 = ((((1 << $hi) - 1) << 1) + 1) - ((1 << $lo) - 1);
+            const SHIFT: u32 = MASK.trailing_zeros();
+            let field = (self.0 & MASK) >> SHIFT;
+
+            $( field as $as_type )?
+            $(
+            // TODO: it would be nice to throw a compile-time error if $hi != $lo as this means we
+            // are considering more than one bit but returning a bool...
+            <$bit_type>::from(if field != 0 { true } else { false }) as $bit_type
+            )?
+            $( <$type>::from(field) )?
+            $( <$try_type>::try_from(field) )?
+        }
+    }
+}
+
+/// Helper macro for the `register` macro.
+///
+/// Defines all the field getter methods for `$name`.
+macro_rules! __reg_def_getters {
+    (
+        $name:ident
+        $(; $hi:tt:$lo:tt $field:ident
+            $(=> as $as_type:ty)?
+            $(=> as_bit $bit_type:ty)?
+            $(=> into $type:ty)?
+            $(=> try_into $try_type:ty)?
+        $(, $field_comment:expr)?)* $(;)?
+    ) => {
+        #[allow(dead_code)]
+        impl $name {
+            $(
+            __reg_def_field_getter!($hi:$lo $field $(=> as $as_type)? $(=> as_bit $bit_type)? $(=> into $type)? $(=> try_into $try_type)? $(, $field_comment)?);
+            )*
+        }
+    };
+}
+
+/// Helper macro for the `register` macro.
+///
+/// Defines the setter method for $field.
+macro_rules! __reg_def_field_setter {
+    (
+        $hi:tt:$lo:tt $field:ident
+            $(=> as $as_type:ty)?
+            $(=> as_bit $bit_type:ty)?
+            $(=> into $type:ty)?
+            $(=> try_into $try_type:ty)?
+        $(, $comment:expr)?
+    ) => {
+        kernel::macros::paste! {
+        $(
+        #[doc=concat!("Sets the ", $comment)]
+        )?
+        #[inline]
+        pub(crate) fn [<set_ $field>](mut self, value: $( $as_type)? $( $bit_type )? $( $type )? $( $try_type)? ) -> Self {
+            const MASK: u32 = ((((1 << $hi) - 1) << 1) + 1) - ((1 << $lo) - 1);
+            const SHIFT: u32 = MASK.trailing_zeros();
+
+            let value = ((value as u32) << SHIFT) & MASK;
+            self.0 = (self.0 & !MASK) | value;
+            self
+        }
+        }
+    };
+}
+
+/// Helper macro for the `register` macro.
+///
+/// Defines all the field setter methods for `$name`.
+macro_rules! __reg_def_setters {
+    (
+        $name:ident
+        $(; $hi:tt:$lo:tt $field:ident
+            $(=> as $as_type:ty)?
+            $(=> as_bit $bit_type:ty)?
+            $(=> into $type:ty)?
+            $(=> try_into $try_type:ty)?
+        $(, $field_comment:expr)?)* $(;)?
+    ) => {
+        #[allow(dead_code)]
+        impl $name {
+            $(
+            __reg_def_field_setter!($hi:$lo $field $(=> as $as_type)? $(=> as_bit $bit_type)? $(=> into $type)? $(=> try_into $try_type)? $(, $field_comment)?);
+            )*
+        }
+    };
+}
+
+/// Defines a dedicated type for a register with an absolute offset, alongside with getter and
+/// setter methods for its fields and methods to read and write it from an `Io` region.
+///
+/// Example:
+///
+/// ```no_run
+/// register!(Boot0@0x00000100, "Basic revision information about the chip";
+///     3:0     minor_rev => as u8, "minor revision of the chip";
+///     7:4     major_rev => as u8, "major revision of the chip";
+///     28:20   chipset => try_into Chipset, "chipset model"
+/// );
+/// ```
+///
+/// This defines a `Boot0` type which can be read or written from offset `0x100` of an `Io` region.
+/// It is composed of 3 fields, for instance `minor_rev` is made of the 4 less significant bits of
+/// the register. Each field can be accessed and modified using helper methods:
+///
+/// ```no_run
+/// // Read from offset 0x100.
+/// let boot0 = Boot0::read(&bar);
+/// pr_info!("chip revision: {}.{}", boot0.major_rev(), boot0.minor_rev());
+///
+/// // `Chipset::try_from` will be called with the value of the field and returns an error if the
+/// // value is invalid.
+/// let chipset = boot0.chipset()?;
+///
+/// // Update some fields and write the value back.
+/// boot0.set_major_rev(3).set_minor_rev(10).write(&bar);
+///
+/// // Or just update the register value in a single step:
+/// Boot0::alter(&bar, |r| r.set_major_rev(3).set_minor_rev(10));
+/// ```
+///
+/// Fields are made accessible using one of the following strategies:
+///
+/// - `as <type>` simply casts the field value to the requested type.
+/// - `as_bit <type>` turns the field into a boolean and calls `<type>::from()` with the obtained
+///   value. To be used with single-bit fields.
+/// - `into <type>` calls `<type>::from()` on the value of the field. It is expected to handle all
+///   the possible values for the bit range selected.
+/// - `try_into <type>` calls `<type>::try_from()` on the value of the field and returns its
+///   result.
+///
+/// The documentation strings are optional. If present, they will be added to the type or the field
+/// getter and setter methods they are attached to.
+///
+/// Putting a `+` before the address of the register makes it relative to a base: the `read` and
+/// `write` methods take a `base` argument that is added to the specified address before access,
+/// and adds `try_read` and `try_write` methods to allow access with offsets unknown at
+/// compile-time.
+///
+macro_rules! register {
+    // Create a register at a fixed offset of the MMIO space.
+    (
+        $name:ident@$offset:expr $(, $type_comment:expr)?
+        $(; $hi:tt:$lo:tt $field:ident
+            $(=> as $as_type:ty)?
+            $(=> as_bit $bit_type:ty)?
+            $(=> into $type:ty)?
+            $(=> try_into $try_type:ty)?
+        $(, $field_comment:expr)?)* $(;)?
+    ) => {
+        __reg_def_common!($name);
+
+        #[allow(dead_code)]
+        impl $name {
+            #[inline]
+            pub(crate) fn read<const SIZE: usize, T: Deref<Target=Io<SIZE>>>(bar: &T) -> Self {
+                Self(bar.read32($offset))
+            }
+
+            #[inline]
+            pub(crate) fn write<const SIZE: usize, T: Deref<Target=Io<SIZE>>>(self, bar: &T) {
+                bar.write32(self.0, $offset)
+            }
+
+            #[inline]
+            pub(crate) fn alter<const SIZE: usize, T: Deref<Target=Io<SIZE>>, F: FnOnce(Self) -> Self>(bar: &T, f: F) {
+                let reg = f(Self::read(bar));
+                reg.write(bar);
+            }
+        }
+
+        __reg_def_getters!($name; $( $hi:$lo $field $(=> as $as_type)? $(=> as_bit $bit_type)? $(=> into $type)? $(=> try_into $try_type)? $(, $field_comment)? );*);
+
+        __reg_def_setters!($name; $( $hi:$lo $field $(=> as $as_type)? $(=> as_bit $bit_type)? $(=> into $type)? $(=> try_into $try_type)? $(, $field_comment)? );*);
+    };
+
+    // Create a register at a relative offset from a base address.
+    (
+        $name:ident@+$offset:expr $(, $type_comment:expr)?
+        $(; $hi:tt:$lo:tt $field:ident
+            $(=> as $as_type:ty)?
+            $(=> as_bit $bit_type:ty)?
+            $(=> into $type:ty)?
+            $(=> try_into $try_type:ty)?
+        $(, $field_comment:expr)?)* $(;)?
+    ) => {
+        __reg_def_common!($name);
+
+        #[allow(dead_code)]
+        impl $name {
+            #[inline]
+            pub(crate) fn read<const SIZE: usize, T: Deref<Target=Io<SIZE>>>(bar: &T, base: usize) -> Self {
+                Self(bar.read32(base + $offset))
+            }
+
+            #[inline]
+            pub(crate) fn write<const SIZE: usize, T: Deref<Target=Io<SIZE>>>(self, bar: &T, base: usize) {
+                bar.write32(self.0, base + $offset)
+            }
+
+            #[inline]
+            pub(crate) fn alter<const SIZE: usize, T: Deref<Target=Io<SIZE>>, F: FnOnce(Self) -> Self>(bar: &T, base: usize, f: F) {
+                let reg = f(Self::read(bar, base));
+                reg.write(bar, base);
+            }
+
+            #[inline]
+            pub(crate) fn try_read<const SIZE: usize, T: Deref<Target=Io<SIZE>>>(bar: &T, base: usize) -> ::kernel::error::Result<Self> {
+                bar.try_read32(base + $offset).map(Self)
+            }
+
+            #[inline]
+            pub(crate) fn try_write<const SIZE: usize, T: Deref<Target=Io<SIZE>>>(self, bar: &T, base: usize) -> ::kernel::error::Result<()> {
+                bar.try_write32(self.0, base + $offset)
+            }
+
+            #[inline]
+            pub(crate) fn try_alter<const SIZE: usize, T: Deref<Target=Io<SIZE>>, F: FnOnce(Self) -> Self>(bar: &T, base: usize, f: F) -> ::kernel::error::Result<()> {
+                let reg = f(Self::try_read(bar, base)?);
+                reg.try_write(bar, base)
+            }
+        }
+
+        __reg_def_getters!($name; $( $hi:$lo $field $(=> as $as_type)? $(=> as_bit $bit_type)? $(=> into $type)? $(=> try_into $try_type)? $(, $field_comment)? );*);
+
+        __reg_def_setters!($name; $( $hi:$lo $field $(=> as $as_type)? $(=> as_bit $bit_type)? $(=> into $type)? $(=> try_into $try_type)? $(, $field_comment)? );*);
+    };
+}

-- 
2.49.0

