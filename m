Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09253BE0A3D
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 22:33:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6825910E8E2;
	Wed, 15 Oct 2025 20:32:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ijH2FZNh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011069.outbound.protection.outlook.com
 [40.93.194.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 357B910E8E1;
 Wed, 15 Oct 2025 20:32:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q1JbpBVtPHnqSLyoqeZg0IkZUHEQQzbT/M6eNMtIL+t6lQ10lkiL8haV3xuZf6DyGGHPMvybXB+mKiIDEtvc8Bfcqe+zYTV2a+rQXGqKFyZHtTjFvYfVZ7jlNAC6homVEKY4y5dS7drzDxKaRNo1/jLEpJHfF4zL/WjZ3IWr7968uHMV9NlpvIW0JUV128eu7ua4ovRFKIpJe0MaEle16FBfgwt5X+p628O5n5W16GESbj4PDBlQJXz2ByDF2GOY8bhILkQfiu7Wh61Nka8XeC0meDfnKhF6Zh71m2Tf06kC9+7zZHE6ibTXknwLD1/7JKB/uwCT1M1eZTRri7oI4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7xMq6YbJpNIKPiaVryI/RqjV5+cnVhAUYbjxkLbNkHk=;
 b=Vt6uWg6vKQI8Bgug6MypKxQ/yb5ZexSgJW9vDRoSpl5De28172tp+Ycmb3LwnOgc8Tu4EqAZGpxvrMu7ihtPbAvPsJSGPUywEkonH4DTEc41R9V+8CvG1E+0RILxQXVDy+jpWQ9QIrJoRVooR5H9IIciDkFFKVL4IonZ9nomr1JbQ/BlV7EvMXRK5gkna3cjoN/PK5m43NGvdDmyvmkXFxfn2tenn2Z7x2VkGSv47ZDcKBQzroQ++O+E/TDZ+49fzpVStePIK0z21IAgLc8qmFfdGT3Vwm7xfylTJ3EFp/kCwJnLHUOPbGcE4tKAuYgxlerNJPMwGoiUa7OBYaXfxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7xMq6YbJpNIKPiaVryI/RqjV5+cnVhAUYbjxkLbNkHk=;
 b=ijH2FZNheEgLVEdv8y/zNeY+krZE4Y97xBwkROhMELX5swjBiQ4j+JmmlWCxYPq1oD23+E8IX0+bEF02Oks/4un3hNUfdUrReZZ50i7pqt/aX7iEalKzdcGtklCgKadkd8pu2iRCTN5pLFyNy2Vix31xeOQflkyK9IAvHC5NOZMrhqMXsRxGLn/Gn4XEnvC3QWvTaoysk3VWEkSf9o2fxtR+uaD/T3dD2qgm8td9WXFV4TUrxWeVkot2axKZw5blusWJQBdOoIFiYwp0MzSc5Pd3/qWcUaqA1yppkE8YFrfJvQmVl/cj87nshFdqbHRjriZtTuKLFlyE3cRqSmTzdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DS7PR12MB8321.namprd12.prod.outlook.com (2603:10b6:8:ec::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Wed, 15 Oct
 2025 20:32:41 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9228.010; Wed, 15 Oct 2025
 20:32:40 +0000
Message-ID: <7a15f50f-ab0d-489c-b252-1102348d967b@nvidia.com>
Date: Wed, 15 Oct 2025 16:32:37 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] rust: pci: Allocate and manage PCI interrupt vectors
To: Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, acourbot@nvidia.com,
 Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Daniel Almeida <daniel.almeida@collabora.com>,
 nouveau@lists.freedesktop.org
References: <20251008190726.823527-1-joelagnelf@nvidia.com>
 <DDIWAK8RNEMY.2D4471L1K87QT@kernel.org>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <DDIWAK8RNEMY.2D4471L1K87QT@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9PR03CA0690.namprd03.prod.outlook.com
 (2603:10b6:408:10e::35) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DS7PR12MB8321:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bd3c967-1ada-4848-56d9-08de0c29fc78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q3dqSGxDRm50elJiZVpUTWlHT1cxZ3k0cnR3T25STnZpdnF3ZG1pdlRUb0Rx?=
 =?utf-8?B?SkxLSkxhd0llMUVZVXRCTHI5bjlCUENJeW82Z2srT25QZHhlZ0x3S2VjanJW?=
 =?utf-8?B?Ty8rTWx3M1RhWVMzTGI5eXJJVzJXTEJ3NHlNSS9sNlpWWGxWT25zZjY1OUNi?=
 =?utf-8?B?TjkzZVhDRXp1UWRTT0ttV0x5TG9QS0JPQ0NUcGJTN3AwRjRnbkxKN0pYWXEw?=
 =?utf-8?B?eE4yemVhMjc0QWg2SldXcFQyV2IzRDB6K2pncEFya2NoYlBONEVnalBHcTJF?=
 =?utf-8?B?RnppL0VDNG1NUXhDTGppNGR1dWw4MTRKVXh5OG41VVQrTzFXU2RSbmRLOEZB?=
 =?utf-8?B?dEZWNTlLc1RveGkvSHFwL1ZGVVpncG40Mys4M2EvakcvR2Z1VTdUL21Cc3Uw?=
 =?utf-8?B?R0FiYm1sV0VUNDlxZktaSnFGRWdNdXpxeFJ4c2lKNUxmZFJDUFVEeExHZlhN?=
 =?utf-8?B?OCtDazVDamI3SmllcURndHlHT2hYMVE2UDVnUFEvME84WlhNWmQ5eVN2OTc1?=
 =?utf-8?B?ZDVSZnAremZwU3JBVENvMThpTkZnYi80R0wrbmtwbVJRZUlBcEMrK1RMVkow?=
 =?utf-8?B?V29RcmJ6d2NPVHJ3U3VvWWE2QnhyV1VweXJ6dEhORWhtS1dtUDlzZHo1TFZq?=
 =?utf-8?B?c1QvUjdoaWlDbUpQeGJYSUM0VFVZTFZjaVVkdlFydjNLWGN2MXVGTTEyM2Rk?=
 =?utf-8?B?NUV5bTk1UGc5M01hWVArODRxZHlhME1qSmg2NjZOVnV5Wm40YXIwQWFKZERu?=
 =?utf-8?B?bEpnbEM4d0NOS1N1Ti9aWlhmb3F1V3IzUytsQUZwK0tVOUk3VmZrRGJUNUta?=
 =?utf-8?B?bmlGc2JkS09YTjZZS0JsS3pTN01WZlJOTU44SzJ0c3VtZWp1RWNDZENlK2pK?=
 =?utf-8?B?RkpteHJ5dExOVUQ4M2tlR2lkclFDS0hzNFJCdFM3bUg1ZUlOQS9GKzZ2b1Nk?=
 =?utf-8?B?b1dKODRJRUtWU0IrQXZLTVFNVG5GZytObHBuNlZWa0M5VWJOV1pHY0x4MXJD?=
 =?utf-8?B?cmE0YTFtN3ViRVFGWElqSjBHT0syUTlKeElISklLbVIyNTJ6bTUwUVEyZXAx?=
 =?utf-8?B?MU5haUY4S29UQkhJZ3kzbERNWEdnakNuRW5GWHBrc1FYTW54R0lMRzdibXkr?=
 =?utf-8?B?b1BrOURRRmlsL3VrdllEZDIxMzErNWRGQXRyNXNwRXVwdzRCRmZ6by9QTHlm?=
 =?utf-8?B?TUhvd1NFdkNyTUdCbUlXQ0lwM3R3c0hjeDE4TzluNGZqWU9TMDBIekNNNFp3?=
 =?utf-8?B?YXJnUmREcnphd1U0WnFoRkNqTmVDYkEvSElUUFFsWFI4STNCWnhSazVMRW9v?=
 =?utf-8?B?Tkh0dTlIbGQ5Rk1kZUErYk1MUXRyVjhGcFBVMDhYTUJlc01yOFdZOEM3RGNv?=
 =?utf-8?B?SGRqUmlzOVRUcjhud09lVTVzV0dHNUUrQk91UmMyMktTRXR1RmE3TFFDZkhL?=
 =?utf-8?B?eWNJdERkRHJ4dlpFUEoxK05XWGJaVU5oeEE4T2JTSktrR244dGlZUGdVUG1n?=
 =?utf-8?B?VEZrUmZERVd4d0dPQ2tVRk9vNXAxWm00dW10b1FvSlczUXlIUndlc0VQaVpO?=
 =?utf-8?B?Nk9icjliZ3d5cGFvY0dWZnZVc1crZkg3bldzYlR5RUFxR1FQRDNMY3phWk1B?=
 =?utf-8?B?QnlzSTlaQi8zdFVkdXIyaWVTSXpkRm1hUm9laUk0TXZBQUtGTWR5Yko5NFZp?=
 =?utf-8?B?YUtiQUlMQjFoRDIwN21DcHBPTFJvOXc3cEFBczUvMzNSQytqbDdZT1hYM3NG?=
 =?utf-8?B?TzBJbGp3N3ZCZXdrOFJqQmNuVHlsVGNOSEh4bk1XYnRrQW1CU0ZuOHlqTElZ?=
 =?utf-8?B?YWRaSmVCbVNpTGlMTThFdkNSbWtEaEN0RTZXcHoyWmo4WkU1ejYyM3JTTUdR?=
 =?utf-8?B?emd1ZVpFYm9XZ3FwMy9nYU5ucnFXdkFDMnZGcDd4aEF0WjBjWnlvNWhnVWtO?=
 =?utf-8?Q?Ab8QO/fhxs+rJkEjZXE4FLvZGcrgRClP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1Nocm5weW9MM3lHQlJwL0k0TnpsUXpBY2E5R004bkMydnZUK0FMZHdnRUlZ?=
 =?utf-8?B?dkx5WlpzODFmUG55Q0FrL3NVaWlxdndoeS9NSTZNMGRxd2V2TzZvemJ4Y0Rx?=
 =?utf-8?B?bzhvK2h1TlRTcEZsaEMrRHlkWnFXOHIwV3lYVmZSOGZVZTFsNnJKRytVTXgx?=
 =?utf-8?B?ejlObnUyN2NONDQxMEJFN2VqZDB5L0lsQVZyWXhGb1hwNnVDSm5mcGxzVmlr?=
 =?utf-8?B?ZEZqaVJhTHRDazVraEhaL2RjV1lKNG9vMDRNR0NqSGhuOTh1MG5BVEw1TTNi?=
 =?utf-8?B?SEVOM0lGRklGL1loc0hNNmdWUy9uMEdaTlJmZm5ac1dlbk9lRnN3Q3Z2R3Rj?=
 =?utf-8?B?YTVyQ3NKNlNBVldsN29SQk1KQ1J4QmN0aU5nTTU0N0cxUDE1RFVjbW5CSWp3?=
 =?utf-8?B?V2NiZmxxNnBzdFR4WDByUUFEbmFCMjhLcXZSMmJnNnFJbUJZR2crMjdiV05Z?=
 =?utf-8?B?LzVMYVhtaDhnMGg2alRXZUZmSlhxcDZXaHdkTU4xYUdxU0lmQy94QktrbE1y?=
 =?utf-8?B?MXJtOCtUd0FCQzRwT0pQR2F0blVXWXduRnZBeFQ2TlMxUjFkL1lNNS9pTDQ2?=
 =?utf-8?B?SG5RamJ1TkphUHM4aGU3MnI5Tko1N3pLYWZhZ1ZvSHllU1dTTFhUdHJBK3M1?=
 =?utf-8?B?c3RCQ1JJT2ljWnYwSnpqM2UxZ0cxeUExci9uRGF2MzBRb0tZZzJhdkVqNG9W?=
 =?utf-8?B?WHdtUWkwR21WYmtNVGpuYk5lellNK05waHRXeXlUWVVSTStDenRwNFlzek1W?=
 =?utf-8?B?UVR0S3g0cEZDQmNRREF4WWVPUXdZQ3JZVmFsNjFBcWg1RjBwUERLMFUzaENu?=
 =?utf-8?B?VGFDQ1JxVSs4QXNYTEhRTCsvaW02U2Z5UndkU1diSDZScnYvYnFMZk1obnMw?=
 =?utf-8?B?MXRNNmtkYWRjbnpHbE5oVE9Za0JsRWxOK2xDMExPcG9GNXE2QStNTUJ4dmFN?=
 =?utf-8?B?eElydktYbE15RzVodjNjclBaSnVIMFM4NzR1RXQ5Y3Z6VDdPenFncmZNeDUy?=
 =?utf-8?B?Q0JpMVR2aHJLZjVEd2oxL0FQck51OW1EL01LdE41M2FVb3JNdDRueW5FS3Q0?=
 =?utf-8?B?czdRbDQ5TXdZYzVXeittVnRMVTgwMkNNTDdiMlZPd1YzVC9ENDh2djRjSFVF?=
 =?utf-8?B?ZmFIc1VUMEpsRkJyNGtkQXg4bEMrNlh0SmMwUDJsOVhwN0F4c0RwejJUdi9i?=
 =?utf-8?B?WDRoaC9LRTJBV0xOZjI3d0t2eEtOQVBHVVVXNitlQ2h3dzk3dzdNSmxndDdh?=
 =?utf-8?B?bEJWbEZvUVJKeXJyYWlhZEcydEhqWDd1RUxaaTNVdW9LeTR6a1h1b0pKbCt4?=
 =?utf-8?B?Zjd1ODhtYmIvUGN5Y29QRUlsYk4vUndaTmk4MFN4eGp4Z1NkNnV0cmRPQzlK?=
 =?utf-8?B?VHBnUGlJVWpBMkxLLzE0eEtWZ1FwcnVSWUUwSGFPV2loNVdGS2lvVnR6cklq?=
 =?utf-8?B?QVFkTllVMi9GMk05di9hVnlqTlNYbzhXamxlL3NFUXphTEU1TkJjMllZeDJi?=
 =?utf-8?B?UGNZcXNCYWdHcDF4Tnp6cXN5RE1BWUdpazh5bE42dXlZSXVlNzlhNjJJa1kv?=
 =?utf-8?B?QTRLb3NITFNYSXBPY2xPY0l1SFFSMmFOdXVFR2g1YWNHUDBiTndwcW5OZGZr?=
 =?utf-8?B?ZkxnNWNGZ3ZqYU1aVmRCMzNVREwvczNvcWFvR3JSbGRvRlJHc29qd0VFZkh1?=
 =?utf-8?B?VHgwMUQ5Mlo5dnp3eXhTNUxJU2QwcUlqOUVFd3J5Tk5QSVI5T0dPem9Qdmln?=
 =?utf-8?B?ZTJvdmV4dEUyTkNwZVpVb2pmWEp6bkNML1NKWjV2UThhdWVWL2JPYndzTTZk?=
 =?utf-8?B?TGIrZHdhNlVUUUFPUnRlWTJmTnNOaEtJZEpPdHBDaFhhS0xHYlUzeTJ6ZkNq?=
 =?utf-8?B?L0hJNHFubzFuZVVIMXBCUUNmbWZTSUJ4OUc1emo2UUlaUFF5VW1xR2dqVmdo?=
 =?utf-8?B?Uk9GYm1UYUdhL1BpSmRVMENBbVhaRDllSWM0K2krZ2FRenhqZ3RwN3VpYVdO?=
 =?utf-8?B?NHlCTGxsZ0R2NnpaSG5SeGpPKzl5N1RCWTdrbmtVWnBaTGxhWURVeFd5bldU?=
 =?utf-8?B?eUVHWlR1OExzUlZ2ZjNHdGkrMXFQUVNOTWNvNzdjd3NPdUZ4dnJwWGNsbGFT?=
 =?utf-8?Q?/5mfASTxUaSjct5SME9XPY55y?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bd3c967-1ada-4848-56d9-08de0c29fc78
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 20:32:40.4086 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sJOyML5Q6kGmVkEgkTxW+gDPteDS6yxewJ4CKe8mzRRzJwnpG9++NXWI7RBTth05m02b11E72WTF++qZT97plA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8321
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



On 10/15/2025 8:29 AM, Danilo Krummrich wrote:
> On Wed Oct 8, 2025 at 9:07 PM CEST, Joel Fernandes wrote:
>> Add support to PCI rust module to allocate, free and manage IRQ vectors.
>> Integrate with devres for managing the allocated resources.
>>
>> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> 
> Applied to driver-core-testing, thanks!
> 
>     [ Add links in doc-comments; add missing invariant comment; re-format
>       multiple safety requirements as list and fix missing backticks;
>       refactor the example of alloc_irq_vectors() to compile. - Danilo ]

Thanks Danilo! :-).

 - Joel

