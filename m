Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F32C33CF0
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 03:50:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ED9410E6A6;
	Wed,  5 Nov 2025 02:50:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="cd+VcGHm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013001.outbound.protection.outlook.com
 [40.93.196.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5594F10E6A6;
 Wed,  5 Nov 2025 02:50:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EdAka19v2Usfg4DoKAupPS4iDtrUDRbal/4eqPGWCPl+js31nML2XyZo1g1GLGLf15aS2eXObh3OUTDfpOlMQccIpkp9ncF9N0hfl7S378i0fyn8uKBXGsrXAZ5ifiFZmlLZwDpfgNKHYOMUS/KKkuYSEzHCSX+JGjq3SokOcm1bt1scYa4E0rKLx3V17IA0e58w7hZtG6L5OSHPS6N/ceQZU6BqxCUqeAzC6l9lYOIwJqQxEU51IB+6qKNX/ryhXGBTs82BcfaykXjBz6Exs/+wId1P+kjwpiX8LyfYIshD1uwLST9quFv6zRuoZWZPVfb9SqWpLdmrddK+8qRYiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jhkORVFVcuIwITgnQNEMpv9qIaAuBnjbKXSJRvpQrgA=;
 b=qJhW1ZyoY/JflCABbzQ+f8iKa+w7qyoYaX4UKzDo/Hqd7uhHzeRdTHRDbnNTC4BnNvX2vKaCn2elzNAgkRv4EHreDqw+FGLdXuMe2IPjcWwQ5Z6bY47QHMRlf+tab4Uvmsxnsio+BHTpyAgQJ4G6p6DyqEisz3xolMaze3aZs+b05FSqesmdJSB970jIuYWjZJzwG0pw23uRGYwC2KwYfPa/bCkWpBBglPLrIl+/fafgmaSeyYPDaMEszRRebbxmgAp2bO8rWfzc5R2YPRy7/ORQfYlm9ampKl9DE7yfCw/z9bRs+ZjGWapmnXTWgKbFjx5Na1dU4+kbBPGEhvRI+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jhkORVFVcuIwITgnQNEMpv9qIaAuBnjbKXSJRvpQrgA=;
 b=cd+VcGHmvB5Bh5eLvLukf4Z22/OwxkGQdFGci4LrHIW1DN+VDguVcAQYIcbV60JdH+kfVymgkGxe1BXAH0IRMNRHKmVidSC9pMDd7BIGAwipG4qitmFfKFuO3FnwiYnUyno1AbhCFtGQs1KXh7z5X/w3byS96OysGEijsmSRDqNLGc3Fs1H2NaEuopOzKyZRDIikS4HRr3nhEUJF+edD6+YNXiSyIc+W9cKvdAM1cVB7PKXf9Xx9dOEnl7NSDtcUVkVCKBAZXdhFEyQIyFukVxVoiVtVN4MBCu7Ag7x/mWJWscsXLNz2aSnqfJGd5z63lPVLV6EKC0cw8Bnsys30Qw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by DM4PR12MB7765.namprd12.prod.outlook.com (2603:10b6:8:113::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Wed, 5 Nov
 2025 02:50:33 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9298.006; Wed, 5 Nov 2025
 02:50:33 +0000
Message-ID: <d6c9c7f2-098e-4b55-b754-4287b698fc1c@nvidia.com>
Date: Tue, 4 Nov 2025 18:50:15 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/12] nova-core: sequencer: Add register opcodes
To: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, acourbot@nvidia.com
Cc: Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Timur Tabi <ttabi@nvidia.com>, joel@joelfernandes.org,
 nouveau@lists.freedesktop.org
References: <20251102235920.3784592-1-joelagnelf@nvidia.com>
 <20251102235920.3784592-9-joelagnelf@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20251102235920.3784592-9-joelagnelf@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0103.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::44) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|DM4PR12MB7765:EE_
X-MS-Office365-Filtering-Correlation-Id: 4655ece9-5a20-447f-3405-08de1c16170f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MVZsRXRhQ0hJb3YxeE5VeHhFeVh2bTlrSlQyZ2hXbmRlRVRmbFp4YUNFVGNk?=
 =?utf-8?B?ZU9rd3JlY3FnS092alFTV2JwVHpCQyszL3UwZDVlZlB0ZktQYWZaOTdFUEtE?=
 =?utf-8?B?bGxnaGRIM3dCaFJvUXJVR0JzY3BZNWZmdFN6YmQrMTBqb3crV0pnS1JkUm1M?=
 =?utf-8?B?Tmp2cnVQNVBudm1GaHZ3a0tScnExemRoQVU4eVllditaZGd1L0UwR3lNamdP?=
 =?utf-8?B?Nys2QnBCSmxPVnp3NmtRTzBuaUdhK1JxM0R5ZFY2eXV1cDBiSEJiZzBxR2dI?=
 =?utf-8?B?K01VWUdPaWtHTGxlUTY1SW84d3VoT3dzQm9GTXFnUXNjNlJJaXpnVDU0R2hI?=
 =?utf-8?B?enQ5OTVDaVNpdEhDVDNSYWtOK0tmRUt6WlVOMkRaNU9FYTVsdTlaR3loNFRL?=
 =?utf-8?B?ZHZkV09qbE41NjdhWWpFdThhSEtYaC8xTDR2YW5xMDYzTmhiTHQ3TTFKeW1j?=
 =?utf-8?B?dS9wMmVldXNZWmxpU1lmclpIN1dDTVk4YVZQYndiR3lRdHBRUEFJL1ZKRmd3?=
 =?utf-8?B?TXh1RlN1VzVRR0NiNDAxbklCNTZ4STF2MmxwNWg3Si9VclQvaHR5aGs5MmRl?=
 =?utf-8?B?a3RuMHp0M0FCUUsvYXZXbEVOZENaSGI1WDhDYm5lWGt0djhjeFhVaWpmZ2Zy?=
 =?utf-8?B?WG1sU0EwKzlPcC9tWWQ3TEZxYllwSjRNeE9tcmRZM0RVQVZHWnl1cmd1enlO?=
 =?utf-8?B?YUJVOHV4ZG8vL0FjUWxkK1Q0TXE4bUZYNFA1Wng0Z0g2RE9yNHROT3NvZVFS?=
 =?utf-8?B?UmhjeDdxblV2MVQxZ29wRlFuSlYwbDh2Qm1UK3NqM1dibFpLa0pPdGl0am9V?=
 =?utf-8?B?S0g4K294OU05bjRmRXl6OXFGWDhZOFpHZVJSM2thbmk4d0VzRTJZMTdEOEJL?=
 =?utf-8?B?MFZSNGJKb3YwdkVaZ1h1WjM4S1hicUR4T3RVdnNQWHNObDIxNDk0cUxpSXBN?=
 =?utf-8?B?NDZXR1Y0VmprbTlPTmdzKzRRS3NyVkk2ZXFpVDk3SGRpeXBDMWg5RHVDNnd4?=
 =?utf-8?B?blVyYzFuejR2KzMrRy92WGJpOHNVeXE4KzlCbjZrSVkwTkpKdXM5eDFWRExv?=
 =?utf-8?B?NWwvNVdiUFZ3TTl5T3gwSE5lTGREb1QwTjd6TVJTbDZEbzlsUGpYSGpGUjcw?=
 =?utf-8?B?Sm4vTmc2VENxVGhKbWltZmx5K3cyT3AySzh2NE9xOWdMNnQyMWJWVHRQdU9V?=
 =?utf-8?B?U2hYRFdmaUdUc1BOMkZXVHFVUEozNGFVL29pVUNWMkpGUmR5a1RWVVJZZTcy?=
 =?utf-8?B?aU10WDcwVXlsZWlYRTJzM0lRNmNVZzVNckNCaDRCNldjQlNLK0RNZk56L3Jm?=
 =?utf-8?B?ZndyWGNuWithdVJJckE1L0dsaks3eGZKcWIvUzI3ZURnN2F4eHpidm1lT0RL?=
 =?utf-8?B?K01vQkoxaW5qd3NzNTdaaWNrODZ3czNxdXBFNXB6N213bDkrVFcwalVGc1VG?=
 =?utf-8?B?OXdpdVNudk1aOUxrRFM2dXZBZUp4dWZQSTlwQ3NxRlhEUGNWemlwL2lxeXZL?=
 =?utf-8?B?VTRwVm9kYVc2a243SUxZUmpTeDBEUTlOcWxsSFVxM0lVdzhvZjVTUGpKdUhK?=
 =?utf-8?B?YkEvcGttMmpkQ2tlRU5QVVhXR1NOeWdIcUdBUlJKRlV3NDFmVzZhTURZdjZ0?=
 =?utf-8?B?bmhSNlVDYkJET1NpTW1TRDRkM0dmazhrQTluVVF5Y2FPaGFXRnlNVmF2NWpJ?=
 =?utf-8?B?OGJaMFcyV3VMZFJtSmtwdVdsSDEwQkI3MmRyMTVKYXlyd3BVdWhnbDdDY2dJ?=
 =?utf-8?B?eXFEdGg1bkY3NUgxNW1zQjhHMHRFODArSzZ4cnVzZ3laOWdrc2JYSEJmTW9S?=
 =?utf-8?B?VENQVi9rd0l3Q1VMQUoxR3JSbEpUTVVpS3FxcnlpV0xzUFJ3OGhzVnl2azJJ?=
 =?utf-8?B?VGJYaWVnUktWK3ZrdTlub1Y2cGIxaWlNNDNDMkV3YzVhdEVZWVNpTUZkN08z?=
 =?utf-8?Q?OBsBCbirFE9upgjL7F1oMURmag3ZimfJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UGgwa2FiRSt4N3MwZmhxanY2alR1UWxKcXhmd2dPUEFZMVFpTmZSTHFKOVM3?=
 =?utf-8?B?VzJxSWpJaFdlNDRYeE5QRUdNNGc0ajZtamF0RTkwcC9LRkpXUTlaUG5JcGRn?=
 =?utf-8?B?ZVBVcjVHUlBWdXBjTytDWlZEY1cyMDhseHVEZWovcjNjbFo5R3NPMEozYytW?=
 =?utf-8?B?ZHI3RWU1ejhicFdTMEFlTUV6d21XdzRld0k2Sk50MU9BRDFYU1dPNlFhT25w?=
 =?utf-8?B?WllUV05iUUJtQzhNQUxjS0Ztd0ZNcng0dmhqYkZVUkNDbXlMRGs2bGlUNEg5?=
 =?utf-8?B?L3pGSU41WEpuZDdLMWRKMGVaMUZNc1FNLzMwK08xbSszWHZCQ3ZGbHV0N3Ny?=
 =?utf-8?B?VCtHZ1pLQXZkeTdFSytwMmhxdkh1VjhQTVJEbXNoR2tJd0NVcnNpdlFoVFZP?=
 =?utf-8?B?MGNzUi9YVmM0M0hYMzJyZWNUZktwVVY0VWJvVjVPalBPZHNXajRVR2NlMlYv?=
 =?utf-8?B?MWp2TlRORVpUU1ZCSTlPdDA4QlJFcjh2aGVpWjBVM3B6QkdOMU1RdlU2bTRk?=
 =?utf-8?B?cFJKWFo5N1ZuMThnOWtWVzZaN05mbjlnMlcvTHBEWkQycEc1elFZNHZUQzVv?=
 =?utf-8?B?STZ1UUpvVTYwTnNiQ0YxanFteFNROTRzZno5YkJ1OEpCT2k3MDFBQjJrTkd6?=
 =?utf-8?B?OCtlTG9PSXdYLy9GMW5xeXA5ZHNadVMwcWtScWNkelZSQVJ6emdaNE1vd1Fh?=
 =?utf-8?B?ckZsRSsyY2RsNW0xZndjS3BVVmdGbzFXaldhWEpNckFxQkhhYzFNSGNLUzg0?=
 =?utf-8?B?a21yQXdXL1VSczFCb0V4UVhZK0Zaa2FDdEtwWnFwVUxhUkNpWGs1b0d5QlhQ?=
 =?utf-8?B?Tjc1ekZQMTJDd0ZtdGxlb1dzVDJwbDdrUXQ4K3BNSW1Ud1NCemkyQzYwa2tx?=
 =?utf-8?B?TXE0eFlzVEdWUWRvZXl2WkZqTnRLL1FKRmtFNFBLVGlKcG1ReGIzWnlnTTFp?=
 =?utf-8?B?Q2V4MlV3WGJ4Y3U0dWIvN1lQeFl5djlEbS9taWVUVUJHM0lYQmM1dGlMTndu?=
 =?utf-8?B?T3kzSjJ4dDIzckRCbk8wUXFubUxxWC9OV0U0aDUxN2gzL1B0RXk0WjUxVGtC?=
 =?utf-8?B?Yk1HSjZmckpoM2ZqVW53MmRGVHpORzRZejJLbWM1NmZBQ2VMYWhDcnRJK2ta?=
 =?utf-8?B?UDE1UGZHNlZBKzVBM0JJM2Z5eEY2eWdBVnZuQ3RRbEp5a05JL01JWTUxWHpv?=
 =?utf-8?B?RjEvNXk3dW5WRUljbFU0YlBCUnpGTUVSTFg0bWtKMEZOdXN4Sm5aVG5iZjF3?=
 =?utf-8?B?NURreDlXdDR4c05YdHZUcjRqOWJsdXArZENzTEJqV2ZjVTNEVjZKcGNDT1Uy?=
 =?utf-8?B?eGJlWkkwbmVQbEVvalhoYkJndWNNbi9FYThxMXZDRWhsbm9XVU9IbCs5SUFx?=
 =?utf-8?B?eEZsM3NpU0ZocGFTSVlKY2JVUWZRcHRSRy8zRGsxeWNzWTB6UkVOcVY4N3B1?=
 =?utf-8?B?SjdnMElETjVwVm5ld0hqL0NISysveG5CZlFXNVJHOUM2WGZCUXJYZlNZRkZH?=
 =?utf-8?B?aFAvZGlUdnRYdS8wSEloOFRnL3hmR3F5NkV0TFpyZVVpckNRWGtUSHhKd2ZC?=
 =?utf-8?B?Q0tGcTJtUTg5ejVjSGd6S2JZeWVXZTNxbmpBWXl4dVBxVWJ3emE3dGpqTVF6?=
 =?utf-8?B?NXZuUHhWUlVWRzVYQVFuNXZPUlZWRjNyeGx4Rnp0a0RBMUdFa210b2JmbHZE?=
 =?utf-8?B?TDdiWlNlaWpnWU1sUGE0bGhpWkEwK2VsYWtUcFdUZXhFeVp4a281ZnF2Uzkz?=
 =?utf-8?B?VEtIRnN4N2JUbmVGdzFkTnM5RWZDRlZ4N1NzMGhyTWExakNGNW1lK3p0VGF4?=
 =?utf-8?B?R2IrdWk0aEhyaGRDc25JNDUwZ1B6K3RBZjN5RWFpV2xmcGNYOE94OXQzWk5K?=
 =?utf-8?B?K1Q4WXVIQWZGVVdQREQ4RS9PU2hNTS8yajB0TXJJVzV1MDBxWVFGTXlkZC9h?=
 =?utf-8?B?OUVNTXNhaFpOdDFrMEZKYmFDVkgyS2l3cThockErRlRqd3dNUk1haHdUbVJD?=
 =?utf-8?B?aEtELy90ZDNEMTIxZ0UzN0tCaHpKdGlGL3Q5cTI4TjRkUTlqZzQxako5Rmgr?=
 =?utf-8?B?Vzduc255VUo0N1d3RitYQUN2WnkrYkdHTzErQktpbVBiOUQ3U28zN2hqdi9G?=
 =?utf-8?Q?CtGfypuD/webmwO7ETnJf9Fn9?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4655ece9-5a20-447f-3405-08de1c16170f
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 02:50:33.6483 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /hjwRiboP4XO/UbSN29UnCu94jAF6ppV44meHkP4findi5CJ9Tzdfw6Nide6/dj7c4BKy1Ux2zvPR1j/kqx6OQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7765
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

On 11/2/25 3:59 PM, Joel Fernandes wrote:
> These opcodes are used for register write, modify, poll and store (save)
> sequencer operations.
> 
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp/sequencer.rs | 138 +++++++++++++++++++++++--
>  1 file changed, 131 insertions(+), 7 deletions(-)
...
> @@ -83,12 +116,103 @@ pub(crate) trait GspSeqCmdRunner {
>      fn run(&self, sequencer: &GspSequencer<'_>) -> Result;
>  }
>  
> -impl GspSeqCmdRunner for GspSeqCmd {
> -    fn run(&self, _seq: &GspSequencer<'_>) -> Result {
> +impl GspSeqCmdRunner for fw::GSP_SEQ_BUF_PAYLOAD_REG_WRITE {
> +    fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
> +        dev_dbg!(
> +            sequencer.dev,
> +            "RegWrite: addr=0x{:x}, val=0x{:x}\n",

Hi Joel,

The RegRead, RegWrite, RegPoll prints generate over 400 lines
per GPU, into the logs. This is too much, especially now that
it's been working for a while.

I'm thinking let's delete these entirely. If we somehow get
into debugging this aspect of the sequencer, we can temporarily
add whatever printing we need, but I think it's one notch too
far for the final product, now that you have it working.


thanks,
-- 
John Hubbard

