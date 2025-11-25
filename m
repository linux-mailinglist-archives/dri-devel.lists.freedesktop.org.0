Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E27C4C83E60
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 09:11:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D60C10E380;
	Tue, 25 Nov 2025 08:11:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="NjwwEV1Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011008.outbound.protection.outlook.com
 [40.93.194.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D857E10E059;
 Tue, 25 Nov 2025 08:11:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XL7XrqCa1u4dfsEqj21XFRDl1vNAn3sMAMKv7hN8QbM+89fLuUHMarSCRwmZgZtdH0PmRPshuvn40hrAvpBwo7ERD6JfGvs9tJ0mL7Q2LnAzc8XqE3pVEMUQRXDANhkF6VNCbSH9sjYzWbwKN9lanZvQ6j8zj8vAgUtxOzRdLa6Xo4XM/JeqNQAiuJm3yNjU+rjErUeSAKnrGf6T5pfv4gNqaElP+kwePZKFzGq3JE8LlxOgMgeSY56l6PJRy0tUYtuWHW6dXmKVm5ncC/mnvz9qU/B9dklM4a4V88lCNRv0ySUSsE6aG4fAyAbunIgtdl8fGkGD6iTCEQI8Cy9YPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zlaqHOGScwMFe0aPUXRKvdlf3lhDMcXZZ2lO3MtGjgQ=;
 b=AnQvXDQoQ549MtJbYjB1dYRg49NV5dRniBl/1iRUvxsE6ar/qX7Yi41Ahp0UG2o7KNN3+zluENTMQnnAcZC7igSLOWMDeASbMCv5F13uMHSB8fRK8tKgixM1L1TUmGUQ3roUAmebjzNO7ws4W6N9sP8B+KEvpQMocsuTwTD9FSL9/wKf2kR2xGwTu6+6irPAjIKrPgylXza/2mK1XuOsGbVesCg4M6LUdUugL7WiZNW1jljtZ8C0+lCqnqNCTv+F0RT3C4V3uquswQ+aqojPl68hQ8zTiguxr6ZKjhjXJ0KRMok973JARhr//ifvS3zPeJdwU47H8nRyvdb9/6ukDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zlaqHOGScwMFe0aPUXRKvdlf3lhDMcXZZ2lO3MtGjgQ=;
 b=NjwwEV1Zf+v3VyCIctXIyaXqSOD+tauzkVa64ayAQuBH0pRkqDDxcuuts2cqptzUJV+Hp1XAC4xY3IPxm9F81KoEhffa7fe5+ERG1ld/coyrsodvcfwQUNnA/yVsse8/sBmwwXLiwTjc5xQ041IxyhQ7Zce3a1pcudAXEnp1ggI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW6PR12MB8707.namprd12.prod.outlook.com (2603:10b6:303:241::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Tue, 25 Nov
 2025 08:11:04 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 08:11:04 +0000
Message-ID: <9f433dee-7ad9-4d0f-8ac1-e67deb409b70@amd.com>
Date: Tue, 25 Nov 2025 09:10:54 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpu: Move DRM buddy allocator one level up
To: John Hubbard <jhubbard@nvidia.com>, Dave Airlie <airlied@gmail.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Alex Deucher <alexander.deucher@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Helge Deller <deller@gmx.de>, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org
References: <20251124234432.1988476-1-joelagnelf@nvidia.com>
 <f73e4536-ec89-4625-96d4-6fa42018e4e4@amd.com>
 <CAPM=9twe3xcVBgrNCT+1_pGECPL-ry_aA2dxBwbKVeai4+S7AQ@mail.gmail.com>
 <24d4f02b-8ecd-4512-a1f0-ba41684ede1d@amd.com>
 <dfc50417-66ce-44ce-b607-917d678c5631@nvidia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <dfc50417-66ce-44ce-b607-917d678c5631@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0144.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW6PR12MB8707:EE_
X-MS-Office365-Filtering-Correlation-Id: 49523eec-1751-4eec-7a1d-08de2bfa2d65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OEpFNDJEUlJXQjVmYjlxSlBGaVpOd2lDcTU3ejA2anUza3d1RjY5TytZSXds?=
 =?utf-8?B?OElHT3hDWE9zd05UbVRCQ05ENHlEa3VKcWpCUGhBb0VOVmFjKzdCQm9ZaElT?=
 =?utf-8?B?NVNXemlueng0aDNPRCt1ZFBJYWg1Q3NYRnhpYXRYc09ybllEVTFUdXByV3Fh?=
 =?utf-8?B?eUlvd1hCbHMzU2RDM2t2TUNJZVJocE9pSDA0L24xSGxkRVhVUHNwVzlyU0dh?=
 =?utf-8?B?ME9pZWFiUEJubXMvME9zb3lQRHVqV0o0Z1M5OGorem5nMkFETnVMTkx6WXlZ?=
 =?utf-8?B?M3d3M1lkN25GQjdnN0lIYnIyeHRyVXdZbHdKTGtKZlhWUjJteEdtekRsdWMx?=
 =?utf-8?B?MndRVEt3OU9Nei9uVHM5WU16eEd1a1dIRHB2RE00dTRud1RPZmFBOEFSYndI?=
 =?utf-8?B?UXBObHVLK2tZTnV0UTVqWHRjTHdSU0xNSDZ0eUR2NzZzQzZ2dVhFRlNpL01H?=
 =?utf-8?B?bEpQN040dWRnRUpFRE4rbWpGMis3TzYzRjVCZVQ1YktvUnpINHdBVDcrSTF0?=
 =?utf-8?B?RmxBbXFRSUZ6K0JyVS9BcEJsbzh5eGxnZURHc1ZFUnI3cUlPZWxsK3Buem5Z?=
 =?utf-8?B?VCtLRURBUUsxRWhQM01rYWZMTjI5Y1lOOTRKVndvWmY3UjdVbnJxZ21IZ0FS?=
 =?utf-8?B?TzZJdEZmTnBoalREWERwdVB1QjZNSjRRZXkxUDJZVmd5aDM2NEtTTnlaOFRV?=
 =?utf-8?B?TitEWjRDUlovSUpGaEtZMU9NQlZ6cUowZ3JPUUtHUDlQZlhlTzRtcjdITEhT?=
 =?utf-8?B?dmY4aW5Rejc3dEY2ZnJkVzByWWxrampKUFBNR1BPOWJsNjE2YlpBbHZmWFUy?=
 =?utf-8?B?WlU5RmViUU9EeXN5ZjdiS3UrNnpzWEpYMFhaZHRGaTVVV0llOVNWUTk2b1o2?=
 =?utf-8?B?VHpDSVV6L0RISFIzUENxVTBZWHR3eTNyNldIZlFWTUFqalV2NytMTU9EZUxS?=
 =?utf-8?B?NWZWNEc1N3pwOWlGRXBXVW5DU2RsUHFKVWZJdE5LN2lEc0xhRTlHR0lwREZx?=
 =?utf-8?B?SkZWd0VkNENxZEpJOWVCM1JUR2d3eG1ORHZveG9QM3oyZU8xM0lqYXZVelp6?=
 =?utf-8?B?WVNFK0RpTlJxYWlKZWFSbDU3QVB6KzJsd0RoYkhUbEMrUDZoNXJxRWlpTTFn?=
 =?utf-8?B?K3o2YXQvRlJYb2dsR2kwb3ZkY1N1TG1lV3Y3SjB1bStWbnk3WjVCdm1Fd0VM?=
 =?utf-8?B?c3kxSXlqRWw2aHVScG5KTWpUQkxsRzF0Y3FBaVFDcm1EeldMV25NWnlpYXls?=
 =?utf-8?B?MkNxczlDbklTdk5SWFZVRlo3L2hBcnFwR003TXIvaVZTWGRWYjh6T3IreTR4?=
 =?utf-8?B?UjQ2NjdqUlA3ZlJ1VTZyR3pWVXVzZWtRZGRQSWNudXFIZ0NUbEFVKzQxNEFl?=
 =?utf-8?B?bVd5WVZ3VGNGaW1JQk1OZ2dpdWExdHdMdG1ucERNbGNPM1dKbVVneVczSHVW?=
 =?utf-8?B?VHkrRG1TRVQwS3FUdUpsR0ZxcFB2Z3RaakdibHZjbFdlRnUzellSUVRhK2xl?=
 =?utf-8?B?ODMxMUQ4ei9sWEJYeHFRbWFFZWdLMHpFL3NUcGJzRWNxL3o1NGVVQWlvVXNw?=
 =?utf-8?B?ZW4xMkNISXNTSHlDRDhnUkJLdjBVM0ZRUW9DUXd4MmhBTmF3Y1dPa2NzaGlj?=
 =?utf-8?B?ZVVUVHFyWkk0LzdMSEZHWkJoTHRPREpscDF1cFpiMzROTE90UU5WUGMrTmRB?=
 =?utf-8?B?R0NIaXNaSGl1cTF5K2ZuRzVveFFBTmxqYnRPdFpUUTlFQkdZZ040SE5RZHlK?=
 =?utf-8?B?dWVoTEtYUGpHZmRJeVpoMjc1Q0pDMDNEcXlPNHpEMUpTQW5laGN0VndwWTNs?=
 =?utf-8?B?TG1OY0RnanI3THNiRXQwZW1kSXpaWWkrTFAwZ3d1Nnhhbmh6akNQNHNoWVA4?=
 =?utf-8?B?UDdPU3hmVjUxZ3NXV09CSExLWXQxMUZHdVBvdGNWOVYwR0N2STR5RmNsSXNY?=
 =?utf-8?Q?pTbuJWWlDq32R1WmMg8hkAwOB9kWIuYG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3VjQ1BPYlV4cmdJZk50d0diRHhpUU1kSHptb2V4ckxnbGtlM1NsQVBNcW5V?=
 =?utf-8?B?WmJia21FN0JlTzF6SGc1NG5GTkpLeUdEZXdOWHdZTVlNVEZLRWFxU3pSTnhT?=
 =?utf-8?B?T29aZGVIeElyV3hXVHlHQ1FkejkvZVJCcUVQRWtwRnVOMkNac3VXOTVjL1cy?=
 =?utf-8?B?VXhiK2tWYzdlOEp2U1ZremJ1TmVEbDhEd2RydzEwM0thUGRVcnRPKzVXcVht?=
 =?utf-8?B?VlU0TEwzSnVvYzE1VlRPSnVBMXpmNEZ2T2xUVm9FWE1VMFJqWTRWamFaNzZ4?=
 =?utf-8?B?L05CalJJNnFVZXplYVQ0OHdlS044RGhGVzhOeVNQdkV6NUZXTDV0NG8xYzRz?=
 =?utf-8?B?ZC9EWE16SDl1dlh0dUhoMkpBeUE5dEtzdVNmblpVdEt6eWhUeE5WQjlreS9I?=
 =?utf-8?B?ZXNISldITVAxT3FjQ3phZDNLNnE1ZXVlclBaYVBkR3gvU05vVXlVQy8rSzRS?=
 =?utf-8?B?TmtoL2psZGJrWkdPMEc5RmphdVBGQmcvdHkwa0hlMGovY0R4WWpjK1ltSk1L?=
 =?utf-8?B?a0NBaW1RbnA4VTBZSUxnUjgxY1BpVE9UQ2t5WWR5alRKMzFhbXN4NjBEY3My?=
 =?utf-8?B?S2NqZG9qaERrMml0a2JGMlNyR0UxcDh5OHdvVFpDdk92eGdqMEU3cDdVcXJk?=
 =?utf-8?B?dzFMZlFvRmNZYWp3Y0FKR2VmUWpaNEh4ZENONC95M0s0cVhiS1EyNUhxcXUr?=
 =?utf-8?B?WmlUY05TL2xoMjZMRmZQTW9KV1RGOEp3end4OFoxRmNYL3dpYi8wVWZvU1Nr?=
 =?utf-8?B?OTc5eVErZGlWSGEwQlhCOUtiN2c1YWFISDQ0N1VSak50NmlXRGx1M3duT2w1?=
 =?utf-8?B?YXVNZnplNFpJUGlxanV3dG5XZWdvcHJrdHVSVjZkN1I1ZnVUOElGQ0J1Ty9R?=
 =?utf-8?B?SzYxV0NMSDMrR2EydkhzK3RNaTBwUXBYR3JWNG1aUUlFSmVldkdyN3dRMm5o?=
 =?utf-8?B?b2U3LzRZOVJZcmNBVXdoY1B3MGlra1JRVk1FQ1hQaUNPVWI2SThnTlBMcWh3?=
 =?utf-8?B?NGFsYkdpOHJOdSs1WU12MHlGb3k2cjVEQ253WWlXVjdudmlxQXF3UTUwSzVK?=
 =?utf-8?B?eWFFdDN4ZjZYeHdGNngza0tKRnZwWU40dmhjNkltMnV6VzlNQm9HUytDWlZ6?=
 =?utf-8?B?cFE5bEhmMkxrWVhpN05FZTBURTBtVE1xUWtxV2plNVdHWXYwdE4yOUdXdGxG?=
 =?utf-8?B?VDlKY0RnVnJQd2duTTE4YnZXUk5uZkpMK1VoVlVPbUlyR0VSSlBRSWU5TUpz?=
 =?utf-8?B?VmlJYVZzWGRIblhEcVBHSGs2S0N0Y25KL1ViQlZpQUlCTVBYaW5LTWtXTjNv?=
 =?utf-8?B?YXJHWTBWOENPeWw3MElUVnpudHJyblpwTWc5SmU3dmtaNUd2OHJzRkx6bHlO?=
 =?utf-8?B?UmJzd1Uzdm51WDZXaHhtdmhDeDFZTDl5bTNldUtPOGVQZUZzRmhxMVlobk1L?=
 =?utf-8?B?Rk1YTklieWhCUXZMZ3ZLdEM0Q2dQQVZNQVVHNVRxRkxZQ1ZGM043bDVxajg2?=
 =?utf-8?B?djh2RFN4NDRxZWNIVzk5S0Z1MVpWVnhYMnNHa1h6YlZPbFJRTnBkVk4xZzE5?=
 =?utf-8?B?WGZTTzB3aVJhWmdsNitjcGNQUFRCSC9LY0VFc1ZiQnRuTkFXYmhmckVlS1dB?=
 =?utf-8?B?RjJoTTdmNXVjdWJWa3oxd2hQWmxvU2szeUJRWlJmZlNSY21obnEvUEVLT0o5?=
 =?utf-8?B?VUQwWG5ZZkxHamRSL0IydXMxMEMrc2tsSGRWZUpzVFVraGRBNCtmRUt2L2cy?=
 =?utf-8?B?MFM3T1kwWlVncnRydXJqelJ6Mko3dVJkMFExUXQxWFRYYnhyU1VYYUJmbENN?=
 =?utf-8?B?QjZ3VzB3dkJIdlZVajFvSExvbVZELzBSMWgzQTBwZ3pCbllyNzJiRGZTa3VI?=
 =?utf-8?B?QkJaRGdrRlU5Z0tZOGU5SDhoZjM2S0gvc3paRWpQSmZCSkZtb2hQN05SaHc2?=
 =?utf-8?B?Q3lKMysxbysxc2JoMXNRV09UeE1HaE4xcDJpSXZRU2ZKVlpPeUNQMHh2ZE9w?=
 =?utf-8?B?VTNsVnNDT2NUVWxKWWVJekhVWUpaYmFhRWhvY2l3YlBQZ01HVWx3MEdxb0Fy?=
 =?utf-8?B?d0pxZHFrQ24wT0oxL2V2Nk1xOGhrUmc4WXd5WFVyck1xS2I4OUpSYVc4Z01R?=
 =?utf-8?Q?OcC8DyWKgfX3JgoGE+3izPDFY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49523eec-1751-4eec-7a1d-08de2bfa2d65
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 08:11:04.0683 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WP8CuDfd9XYrfwJB8tB3QRBW06YSmRc0WDNBCjklHbqVlrMMYkdgAucJdG0iUxI1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8707
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

On 11/25/25 08:59, John Hubbard wrote:
> On 11/24/25 11:54 PM, Christian König wrote:
>> On 11/25/25 08:49, Dave Airlie wrote:
>>> On Tue, 25 Nov 2025 at 17:45, Christian König <christian.koenig@amd.com> wrote:
> ...
>> My question is why exactly is nova separated into nova-core and nova-drm? That doesn't seem to be necessary in the first place.
>>
> The idea is that nova-core allows building up a separate software stack for
> VFIO, without pulling in any DRM-specific code that a hypervisor (for example)
> wouldn't need. That makes for a smaller, more security-auditable set of code
> for that case.

Well that is the same argument used by some AMD team to maintain a separate out of tree hypervisor for nearly a decade.

Additional to that the same argument has also been used to justify the KFD node as alternative API to DRM for compute.

Both cases have proven to be extremely bad ideas.

Background is that except for all the legacy stuff the DRM API is actually very well thought through and it is actually quite hard to come up with something similarly well.

Regards,
Christian. 

> 
> thanks,

