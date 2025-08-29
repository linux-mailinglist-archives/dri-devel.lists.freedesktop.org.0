Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C49D1B3AF06
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 02:21:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AB1F10E02E;
	Fri, 29 Aug 2025 00:21:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="hgbdEujR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2079.outbound.protection.outlook.com [40.107.96.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16D2A10E02E;
 Fri, 29 Aug 2025 00:21:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=clc6BNE9m9nzBnHqQQjyD62zzxm8uFG6oQt07oAIh1GSAkmTcQ7VE+1xJcZH7YeLAdNXcHxvJq4GGpbijPQIsgQYQv9ZH99YdHSQ3S/IU1/qNwUwti2eCQ6hrqxBjMu84zTXk3aZ7qGM1NqGqP6/JV/Ll0lst9dCUwnNGrjcavOwuGRuP1oCOAirKGKcJxTlM7T/S6KPWoG07Zp2gKiikmuu6DZ+xLxApbtRUPJAHFG4vLTdbhaAy/FzE6Wvse3PcnIMirraIb7KLFvv+o245YXoMOLlwHB3FirRj2hiAoDlGDzFyk/GVAxNFt2D+QR5WNGdyYRaOj4+pR9dgg/BBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FMNr0mFGxbu6l5iAWNfdVALCWkYrw2WSFTpveD+bk70=;
 b=HWAJdOLWlJFYmZdNz8Z6LJS9GhHRVeRanXzQ3w70fJElPv2U4C/slghIIBi8aYnwQY5rH6Y7Self2X18dZLK0fA8F1kIus05tSb/hB02RofcccaEBb7HkiyMFJxXNxfVtmlFFR4fhzqGAdlaZEH4oiHWpUM5ug/XG2KDSO0Jf02B2c8xPtPZw/+1dKlliRIiuv4gB+Xl6+gjurlf8MMs47bR68Ag7zL/IHBsqiwf23BX80Ip+c98TyiCbBmvbxbTdicj5rijGIoD7ai6jRvxb2mKUXw2wLfC7YjvNqQ8jx6TYXPPxLY1fHBl3cZuaIpNDs5T/NtEd0oLAWEDh0eEHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FMNr0mFGxbu6l5iAWNfdVALCWkYrw2WSFTpveD+bk70=;
 b=hgbdEujR/oTIo/MyZBk6lRUxufSbcG3uYcvsG4mbLp3BRGb2f/rYbSHsExA38eRRla2FMGdHmm8DuCgXzsSvPsSmmzGvA7EEe6AnyLHUgRrxlZ48bd72j7AF0/+T+zPTtDbgNc9HFsGvZPs1UfZOqdHLjm3RqU9a9NIcHsTtSGbuZLVSY6CSwi1A68h1bxgTk6v4wHNKXNNA24/CGIQZ4affZj/cVtUXG1rLVfLxnx7IWcKsm6yotDVLMuO02iIdlKl3qGTOSuL8BxzaU+94N4CKpaR+1H9cf/ivsRzkDKNssTOo1uhn+CV9rgl9BC+y8IxKlAhykofCHvhw9yektg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5968.namprd12.prod.outlook.com (2603:10b6:408:14f::7)
 by CY8PR12MB7513.namprd12.prod.outlook.com (2603:10b6:930:91::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.13; Fri, 29 Aug
 2025 00:21:10 +0000
Received: from LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4]) by LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4%6]) with mapi id 15.20.9073.010; Fri, 29 Aug 2025
 00:21:10 +0000
Message-ID: <d534c11d-d4f4-4987-ba45-9628d9c039ee@nvidia.com>
Date: Thu, 28 Aug 2025 17:21:07 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] gpu: nova-core: firmware: add support for common
 firmware header
To: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Alistair Popple <apopple@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20250826-nova_firmware-v2-0-93566252fe3a@nvidia.com>
 <20250826-nova_firmware-v2-2-93566252fe3a@nvidia.com>
 <9adb92d4-6063-4032-bf76-f98dcfe2c824@nvidia.com>
 <DCD2VJ1WJW2O.VM7E4PD3DFYO@nvidia.com>
 <2532f8a1-83ba-4f72-aae7-9d810eda417a@nvidia.com>
 <DCDVECIAW1NI.2J8SHDVJLY7V5@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DCDVECIAW1NI.2J8SHDVJLY7V5@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0152.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::7) To LV2PR12MB5968.namprd12.prod.outlook.com
 (2603:10b6:408:14f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5968:EE_|CY8PR12MB7513:EE_
X-MS-Office365-Filtering-Correlation-Id: 43c1b11a-9bba-459b-b576-08dde691f479
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RWJ4cHdzckthVTNGUjZHU29SNy91b1VpSDhRbXhPNEpickc2VGVqV0hVaCtx?=
 =?utf-8?B?TFRESUY3NVJrSWdNRm1ObkRtNEdFd1l4R2FsNlpxVTNtS0hzZjV6UW9RK0dJ?=
 =?utf-8?B?ZVFIcnFHdVRuZ2lHLzNTekk0bHd1Mk4xNzNySkZLSWtueTZUNHU4Z1c2bklF?=
 =?utf-8?B?K2RmMG10MWY2aVNFU050Y1hPRWZZNEVxMk1IQzg3cVIxT3hzTGVIRUszb1Fo?=
 =?utf-8?B?THRBaThNRUJBbmYyS0lhVlRaOC9YMlgyQnFDbldqR0o3UEZyT1drejk5NGhk?=
 =?utf-8?B?NFFyOXIyUDFZOElqSlJELytBeUx4RHBFcFRLTkpkNkorNm03WUxQOEI1Si9l?=
 =?utf-8?B?elozcTRmMnZoMWs3OEVaVlFhTDl2V3pqdmpST2llNjFkQVNDbE0zV01kM2FS?=
 =?utf-8?B?Tmt5YXk1eml1RlM5dHFTak9BRW53d2M1cXA2dVc3ZlZrd1J4TTB3ODFZOVE4?=
 =?utf-8?B?M2JRODJJQ3UySHlTQUVYUE5Tayt5VHRlblRMS0ZZMjBDbXE0bUQrUnNLcWg0?=
 =?utf-8?B?cXFyeFhxNGZveXBPUUpnUTVQVzNDUlRsZDV1MlVPaUlMSkgrREZKYWVCdWdP?=
 =?utf-8?B?aXJ6Um9uQW5PamoxSzBjN3dURkV2V1ZsR3J3eGxxbkgyM3hmNStOc2YxUUFI?=
 =?utf-8?B?YWw3dndNdThydmQ2Mi9PUFpUczE3L2dDcWV1L1ZrZ2t0Qno3ZCtFaUpneFpJ?=
 =?utf-8?B?c3VrdFVzSDZIMVFsajc0Ky9OcERTa21HbzVVYkVJWllPSGVVQ0dqMEx2bUho?=
 =?utf-8?B?SDRocVdsSzlzNmpmNTRUR1M3TWFtQjBLOHptSWFEWGZYd0pWVFlJMmRJYm9x?=
 =?utf-8?B?NkZza3l6SWlnNnNhTHdEYkVGUEZIZS9VNUlPdTZXRUZFNGRiVGxEclFTZWt1?=
 =?utf-8?B?NklnSm04RmlQT05uS1VBdUVVZXZPb3lWeS81bXNNYWFLNXB6MG9ldU9TNU9O?=
 =?utf-8?B?ZUV5YzNBZlA3QzRMUWhTbm5CZjF1SnAxdFV2c25qeVpKa0Y5YWxLNElMTlJi?=
 =?utf-8?B?ZFBnb3FISnRSZVpDMnlYOXBtM0wxL09ZMDdYSE1vRTFoMXJoL0hGSWQ4bkt4?=
 =?utf-8?B?REZYbHpSRkp6QkFHbFQyaWNuNGRGWGk4anhnSmZjU1R6bzYyR1BKOElqM0Jo?=
 =?utf-8?B?SVEwcUFZeDNEZW1PNFlydmNhbEJVOFMwZlhDbXppSDA2dTFjVWpPdkU1RTl4?=
 =?utf-8?B?MDNHdVpVa2RGVkNIcytNNCtoN3VTZVpTQU5Td0FLdkRHNzBTOHhiYWRaM1F2?=
 =?utf-8?B?NUNmTy90eXhSZUhEYkQ4MExXZGs5UlVZNyt1dWVOK2J0eFZtRFUvNW4xN3FM?=
 =?utf-8?B?TUpRZWQ2cXF3WFZNTnFNWkFWNU04WWJIOS94U0d6MDVtNDRMSGE3ZlE2Q1I0?=
 =?utf-8?B?SXpmSEVWWjJVN1N4U0g3VzhLVTV6TlJwUkJ1YXE4V0xNV01pMVZJbTRod1VX?=
 =?utf-8?B?NzZsNmMvNUxrZElNWk4vQVRwOHJvT0ZiK2pXdW94Z3hKUDBBSVI1V0svR1VH?=
 =?utf-8?B?OFZFV2lEamE1di9WVjhuTGpWeTNTYWMyMjZ4V1Z6TEdXaTAzVFB3Y05GdDJP?=
 =?utf-8?B?UWhQekJZbHIrMUovUGRtWmludi81Yi9YTm9Fcis4STZYNVZndzFadXhOMXhH?=
 =?utf-8?B?dVdtai9VVGJZREgzSWUxVndpSTRaVFdFQTQzNmdhNFFaOVE1blJLOFI5NXNM?=
 =?utf-8?B?Z0tMMW5SaGhVOWJVcVVWeER1ejVRUHVQSmc2Lzc0VHViQjBudHByb3hHR05V?=
 =?utf-8?B?UzY5dHBIZUU0REtOZGxZM0pGbnpsUUwyNjBOdEJSeWs0MGlmamZZd25BK3Y3?=
 =?utf-8?B?MnRVT1dqbjZlZkFNc2I2a0RoaFFSSEhQNHFBcVE5b01MTWZUZ29jS3RHdldI?=
 =?utf-8?B?WEwveTlFSjVRMVlPelp1ZHlqUVAxSnRjMlAwbHZOeFVBT1A4NDB4djlDWUtH?=
 =?utf-8?B?bUlRQWFETGtRT0R6T2FlWUpYamFCa0dvMWoxdFVWYXJmUVZES3p0M1k0VXhX?=
 =?utf-8?B?WjBTUng4bjFRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5968.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UlJ4WktOaU9PK1FXZUtTRkJ2b1RFZG5xUkFJZFppK0YrMnVFbC93U29DTmFt?=
 =?utf-8?B?TlA1dmFyc1VRaG1iZ0RIVFhJbnBBUFRMUVhhcS9XS21qM2ZJK3Q4ZnRRYlVP?=
 =?utf-8?B?akJQYWdyUkIvbEljV05JV2FUSWtuTmdQbjBCeU9WbHd1b2wvY1BXaDFJTGFG?=
 =?utf-8?B?ekFBbnJkS0hTQU93WGcrdXcrd2M4bFAvS1ZvMFdOOFF6Tnl1N3BmSCtXQm5P?=
 =?utf-8?B?aytPbWszR0dWT3hmNEVzNnlVVW9NZTNqU2pNM1dLME1SU29uK0VRWkJtbXR5?=
 =?utf-8?B?NnNnNWxHOThYTklDZnBGanNRczRVSDRDTWlROC9DWnpJQ0dIMmdlYTFMNlQ3?=
 =?utf-8?B?Z2lJWVFvWk1hNjV1a1YvS2pNTVNzTE1VK1crY2laQTZvUDgvc3Q4ZmcvZVRr?=
 =?utf-8?B?OUF2bWpGWkFxRlZERGFFUDZvRjRUeXM5QXBiTmlIdWlzSkxIR1NBUjZQL2d1?=
 =?utf-8?B?QnNiZm5GQlFqRXpmb2N2cWlQZ3RtZXo4SFkzNloreGV1Q1oxdG1nYithWnJa?=
 =?utf-8?B?U0I5aDlhZzdvcENPYnVldDMzWTFIaks2cmlsZkdza3kzdC8wOUNOajRHdC8x?=
 =?utf-8?B?V2pNUWF0djRTMjgrcXJKMnRPYkVIenM0dmwyWDRsT1RhOEpYT3ZJQkJycTVj?=
 =?utf-8?B?Y2xaYnB2T1kvVUVxYjNkSTM2SzdLcUt4SlU4VXQ3RnR2RktoY1JCYjVlTHcw?=
 =?utf-8?B?TkY4Q2p1RHovSVoremlaOXo5ZGZrRXVLZUZTS3ROdXVIN2xNZGxHYk5uTnRM?=
 =?utf-8?B?blI5Y3JRVFpLUnNBVE1XbHMyeEpMTnRxdjhDQk5jb2drNkpwQ2dDeFdpREJW?=
 =?utf-8?B?Q0h0R0pYL2ZPQ2syZWhnQ2wxV2I3K1R6Q1JraGx6dDZsbXFQdXRRK2ZMTldy?=
 =?utf-8?B?dExLM0tzdVJQUlZpTVV1Vytya043OGQ3NEd5dFJJUjFFYXB3UEF2b1NDMVF3?=
 =?utf-8?B?OHZyMHUySzBSenNDZHZlUmhzUjRBV3BoN2VxVHNpellrS0dBUjYvOFIra3Qz?=
 =?utf-8?B?MFFFelRVbS9VbWY0L21PQTZaQ0tkamNEZUR2WWZydXIwcFdkbHBGbGNNMnpJ?=
 =?utf-8?B?OEEzdE1iM3FsVnZYZkQrazdoeWs1dVYydU9UeGNMb0QyQW1vRGpqbHBPOEc0?=
 =?utf-8?B?NlZ0TFg4cGw3MnJaSUZuQnVRRzN4UGRmRmVvRWp4U2xrMWhJVS9oR3NZUmNt?=
 =?utf-8?B?TlhDc1EzelVuVDZ0TTF2cFBuUVR4TGFnTmlheUtqUFQveEtPVGNlTXZoWXVo?=
 =?utf-8?B?ZUxBMmhveG9ReG5QWXNBM3g2QzdwMU5lZ2t3bW1tdUlGQm1yN1lDUmtzQzJz?=
 =?utf-8?B?N1ZSYlNWVWVBeGtlcnEyQTNLL3gwd1N3c2hzSVJKSFNCZ3RYZW5Kai9wSXFw?=
 =?utf-8?B?aVh3N09sQ0RKYk1kN3AwME5pZkNNaEhPWkxNYkZHM2lHSXBZRlV2TkRjNTZS?=
 =?utf-8?B?ZG9EQ3F6MHZkNVZsaE41bGdyWmZiKzdyQWwwazBUUURaRXI4UXM5bGZvSmNo?=
 =?utf-8?B?R2tEUXVxUGh5TWppWXRGdnljdGpRVWRDUmZySjJySFpVVW1NVUgwb2N1ZWFU?=
 =?utf-8?B?cGdhU3ZSdU4ya3dJUzJLWE9lcGd2bFBqWnhSMTk2eDJLTHMyOWxnOURKb3Bl?=
 =?utf-8?B?Zk5FczNBNjZPdDhkNjZJVHY1b2tNbnlSeUdxb3N3TVdibWszSFdwWnVyNldO?=
 =?utf-8?B?VHNrWlVJbENwSXhmcTJFR1dCQnBCaWtnNlJtU3J5VnVlMnNCeXBrVmhFb1pD?=
 =?utf-8?B?d2RYYWVKUkg5MUV2dFcrbjZWakxsWnhSdDBTSVI2RjVLSzJjbHBBZ0hjQzJo?=
 =?utf-8?B?Nnlrc2ZRNW1VWEZHK1J5S1hOQTE3eVIvK2s2Z0JLYVdqWFZSdTlwNnZqQ3Vp?=
 =?utf-8?B?VEwySEl5N0o4UUQvNFBJU2hnbllXeTBrSHJ3bWpkWFlOUEU4eEtQUlRDUlJ5?=
 =?utf-8?B?d1NOZXhYY1cwU0s2WmN3RVlqN3R3d0xwOUcvNW1LNUd6N09ub2NFcVpxUG4x?=
 =?utf-8?B?cENZTzRGcFphK2I4VkVLWlJXM0QzYUpFTElIZ3VJdHJXU3ZiS1ZoUXV3aEZh?=
 =?utf-8?B?aENtWU5sU0k2VFYvZHdpVitlWm5PMXFiL1o5SWlSVE10aHVrT2MvZHVGZHE1?=
 =?utf-8?Q?lLdNVQj65TH8NAttL5VgvpXqV?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43c1b11a-9bba-459b-b576-08dde691f479
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5968.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 00:21:10.4967 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1P+LvYWwBqqH2FiFCpcb9DSsgjcJ4N3gShl8KYOTEsKK0TCTxWg32RgaQEfnLaay3rs/JxzClEbY4oBI2Ppu0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7513
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

On 8/28/25 12:08 AM, Alexandre Courbot wrote:
...
>>>> This worries me a bit, because we never checked that these bounds
>>>> are reasonable: within the range of the firmware, and not overflowing
>>>> (.checked_add() for example), that sort of thing.
>>>>
>>>> Thoughts?
>>>
>>> `get` returns `None` if the requested slice is out of bounds, so there
>>> should be no risk of panicking here.
>>
>> I was wondering about the bounds themselves, though. Couldn't they
>> be wrong? (Do we care?)
> 
> Not sure what you mean by wrong bounds here? Do you mean what if the
> header data is incorrect?

Yes, that's what I meant. And I'm mainly trying to get some perspective
about what kinds of checking we should be doing.

In this case, it seems that we don't actually need anything more than
what you already have, so we're all good here.


thanks,
-- 
John Hubbard

