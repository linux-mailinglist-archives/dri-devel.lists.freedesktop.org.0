Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9025FAB9BC1
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 14:16:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7045110EA86;
	Fri, 16 May 2025 12:16:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="P34j7bq7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2066.outbound.protection.outlook.com [40.107.244.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF5D110EA82;
 Fri, 16 May 2025 12:16:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gigoj0z8fHqFE1zDyfbTgdhleKQW4b6/urxqu7R7w0w19FssPjY8NcnzCUEG3ac//sUO0qBxAOoUSf71tOUCIH13nYWxZk1zso2Uzgvl65KpjiUGP1vYW6qT9g4LqY5lXaPqGvQ0pD6DbZLlREh8aHrx/K9wJUl52R1u+dAdHi7+UybczvFfAZZSxTAnLZaU5KovTMfvq99KTV5ltCJhME54VKBx17gMNmVyK45ODkL7fj21QpVGpgRo5UjM9ygCUNxqds0qkSwSUiUekV3NjzencmKHXJNJkuQaZXjruKgHr+K8GoZzvAWjbQwEMUT6sVTxcm4k8opk7qyiQglEzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SxkYp+guvseVldZZd4QHeSLy1Iq//l8PiZ86OYjUvng=;
 b=Q7355XfpaYhjjbWSlPNyF3eUJrg0YE4DK3UIC6ENyTom04Z5/bvfCEXnwvgIB0sDPJAe8sBHwySHub3hwCyloor+git/vqXzDZjVSazuyLMBCEzR+E94aO4Oqk/3XFNfykTebK332dBByOo0mwDhus0ummXxgfFVOLjIqkSOI6T+k8iVq/3lKms2IOUJaCtQTVTYACPZ5GVpJ270nJs/ZC22nD84/RdzxJtfKpPmaSWJaH+G81VycQzt1124CLAbXVCsIXRj2d3KwCO4CbE9HLFOqyu4w4JtrAbWZtU/0DfmJJ4b6y1BdpBBbWIJqquZz54QFVgaqtXAL70ajg0Bdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SxkYp+guvseVldZZd4QHeSLy1Iq//l8PiZ86OYjUvng=;
 b=P34j7bq7AoVL7GRTGCusxSkkaiIrIIlaAEEyy1jqUHoyp1/Rf8HR8MoTAhHcUia9JxNnZ4x5ygJR7cl0n+cnxFiGhRqKQZ/Ud0c+YQ+159hnrmuNYgdSGIkdR9Lhm/+cS50/G8dErEJgjaW41nvOEUQY53SKh10PEJ7H/nHfl26iFNf149OoWNDKXla7BdvEkqSHJRwmr7rSqIAp4ZP4pjwPZ0+kRsZUaU20U/WubCR9OpgBvIUe9MERYk34FfIHqyYuPjZyDjogVa3i3t8WKXIw6AjmF9zRC+iKEKZEIrv76Cyi5iaPCAOiJAL/nOwgRvxs4Ickg2yy0CKtVdnDcQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SN7PR12MB6888.namprd12.prod.outlook.com (2603:10b6:806:260::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Fri, 16 May
 2025 12:16:09 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%5]) with mapi id 15.20.8722.027; Fri, 16 May 2025
 12:16:08 +0000
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 May 2025 21:16:05 +0900
Message-Id: <D9XKT7HUDX2W.3I4LIUI35AWDV@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Jonathan Corbet"
 <corbet@lwn.net>, "John Hubbard" <jhubbard@nvidia.com>, "Ben Skeggs"
 <bskeggs@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v3 09/19] gpu: nova-core: wait for GFW_BOOT completion
From: "Alexandre Courbot" <acourbot@nvidia.com>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250507-nova-frts-v3-0-fcb02749754d@nvidia.com>
 <20250507-nova-frts-v3-9-fcb02749754d@nvidia.com> <aCNSI1iwvK8w51oJ@pollux>
In-Reply-To: <aCNSI1iwvK8w51oJ@pollux>
X-ClientProxiedBy: TYAPR01CA0046.jpnprd01.prod.outlook.com
 (2603:1096:404:28::34) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SN7PR12MB6888:EE_
X-MS-Office365-Filtering-Correlation-Id: 69de1463-39bf-49d9-9d47-08dd94737053
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|10070799003|1800799024|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RVhmaWgzcXlpWXRJeDhTdklIVEp1N3dWeFhKOTNGbUw5cGJxckttRnQ5bXJW?=
 =?utf-8?B?ZkZIczJvRUVib1BtTmdMc21TTmNBdGtTZ1N6cExuUzFlRFY4VFE1ZTVJUEpJ?=
 =?utf-8?B?M2thcERDbFBNQTlQTU1BVVo1YVEwMENqY2RGS2lxUUVjczErekVhRkR2eko4?=
 =?utf-8?B?M2pFRXJGUVdrNEFBVmhnZVgvcGYyYTRVL3NVY2hzWDdnaHBJWW1lZENidkZN?=
 =?utf-8?B?aGhjSWRyNi91aHUrYisyWDh5N25VZnFUQ3Y4T1ZPdjZVU0pZdzVwL1AvenlO?=
 =?utf-8?B?M1haL0V1MXpSMGFuNk9JeEFvSERjYzZ4NmNyQlVoNDVsVnRrbnRxc2M5KzZI?=
 =?utf-8?B?KzlpSlBLMXBxaEQ3ayt6b1NObDFPNUtUaG5aK3dRMFRWQTM0bi95eGs3MmJq?=
 =?utf-8?B?YjJVSjlBSUNxdUtBeEc2a0NBVDBIa1hkaFNaTEF3V2Z5UUEyQ28zbzVSSHlC?=
 =?utf-8?B?M2xwWGFpZWgrb2lWVkhrd3gxcWVsWVB3aTU2cU1UNEJMNlRjTndGS2NYUUZ6?=
 =?utf-8?B?bnlDanp3WDBNVFdvN2lPYVJ0WEJCcDhKZnEvY3NPWGJmTmhxdklpT3ZHS0R3?=
 =?utf-8?B?Wnh1YlRJZkVOVFFEdTA0NnhJRTBjcUlDd1Y0SUZ3U1FRVWM3WW1NckxQYUJx?=
 =?utf-8?B?KzlESmE2KzFTbWlGSGNKYWZ2bHBZNVU3T0I1V01md21tUGE0d3d4UXdUVkxQ?=
 =?utf-8?B?QTJ4VHpDeUVMWXBJaVJTU1R0OVEvRWkxY3dqcEpKY2xNUVluOWdYTTlxWGtS?=
 =?utf-8?B?ek9scG1RK3hqbGtkZVM4Y0J4dDE1eUYzTWsxenZtUm1qR0xVeGp1Y0t0QThD?=
 =?utf-8?B?YVNUd0crazdOR2pJa2tvUjQra0E5VW9qMlN2dGUxUTdQalJuRzVzWTFKTzBy?=
 =?utf-8?B?ZmE0Y0pPVW5IQjZibjdXU2pQc285TWFYZmc5NDB1Z0Rlc0lraVVNSnFBUi82?=
 =?utf-8?B?am1NcHVCSVB2QUNDOXRNMStHeDNuZnVoT1VGWldOVzBJdlNsOTFnSzIzc0da?=
 =?utf-8?B?cDR5S0NjNWtsNFZwQTI4M25tT1FYK1B0WTV4SkdsMHRUak8zbWhrS0dnR01r?=
 =?utf-8?B?SU1xUUVzbHBKKzZpa1lyUlpPcWMvK2Y1c1c3VndEWlpqbHl5dzNCU1J2VTd6?=
 =?utf-8?B?R1RHUTFTejVSMXUvK2J6aWN0VGNjUFg4aEM4VU8reW8yTDd4NE1RUldGU08v?=
 =?utf-8?B?N1JQN0xsbmhXSG9pS2lIR0FLZFZmcFlPRlBRdUdjcERzczZEN0dLL1drQnpJ?=
 =?utf-8?B?UzhaY1AyV2dOd0R6d0l4TmJDekxXMjIwL2YybnpCWXlhVE4wcXFhdzFGajBJ?=
 =?utf-8?B?MndRa2JZc21YdTVHOEhNazRhSVpwUTJXTHcwMkkzZmxLSldWcEJ3Vkh1eGJl?=
 =?utf-8?B?VXk5b0VOcDNhMjB5OE9neFhTUjhtTnh1QVJmSG91Z0ozT1pkNXlkYzBpZjlF?=
 =?utf-8?B?Q3hoRWNyS2Y1dVBqWnlvWGd1SUM2Sk84cVBzSFI4UXFlVlNpSUJwMnNlR0gz?=
 =?utf-8?B?MkoySyt0VU9oakhCN1B2dGdUcWUrakd5TWppR1pYWi9ibFBXRlpnU1JoS1dn?=
 =?utf-8?B?YzlKVlBpZjhtWkZhZ3JtemFuLzlaSEtwb0lDWU9PaHowY0x1Q2tXOW5xdnRs?=
 =?utf-8?B?aWVQN1JDMWVPdXJUamxGOFExZmVTVTVOS0lKTXlCVnN1TXNTeko1ZTRzY0pD?=
 =?utf-8?B?bmdiSmJZTWNZaWxiblFCVmJyeVhhUG9STFVRMmRZdG14d0tGVFVjOGhyMUh3?=
 =?utf-8?B?bk1pYWFLczBMZWVHS2pyRGExajB3KzlmQ3lvSlNyZVRtN0tNNDBoQ3NpSlhK?=
 =?utf-8?B?VEtCWWFtT2U5MitQVlFpcU5abXRRN0JTL3c0YXJtYWJwZ3pEZVhZbFo0c0hU?=
 =?utf-8?B?UCttakF4ZlBsa3BvOU10V1N6b1BmZTNXcXpHWS9sKytUNmJHZUkwdC9Lb2gy?=
 =?utf-8?Q?iKnlDsR4rIU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OVpVdER5eUdBNGtYOEpNS213Y1c3U1ZFYW9TV2RYSTByNEhSaXAxVnVHNmNL?=
 =?utf-8?B?VW5FUGlrUjdLV2R3Uk9Xc2FSamRDRVRaV0I1VDZrblcyUHBldkVFMVZOQkd1?=
 =?utf-8?B?ZnNWLzZDcm5QTnhvVHlOMFBVK3AvVXY4YXNoM3FXRWhYRVZhYjFZQ0gxRUJK?=
 =?utf-8?B?Smc5bld1R2VBSTJsWEZMdmFieGRpSzJLYlJQVnFYVDZCbnQ5YzdVQUNJby9q?=
 =?utf-8?B?WFprWTB0QWQ2REFNbFVCTnNUd1J4N3ZyVXVEclJxNU5zVlVlWngwdkZ0Qkwx?=
 =?utf-8?B?djRUZzNnZkdDK21yNkljMmZBdkVsaEdYYk9MWHJvdTJZYUNxUVExMzA1R1Rw?=
 =?utf-8?B?MDB2dVU1d25kVm0xSVNTZEJXUlpLeWZFRnJOVkVLN3hlQlg1elNlUDVtRFNo?=
 =?utf-8?B?VGVOWG5UV3g1YnVXdkg3Z29RdmJCL25obUlGejc2WWNPQW92TUd6UDNrYmh5?=
 =?utf-8?B?bVg1b3dlMGhQOERaS1RxVHZPL0pRbll4djFCM284NkFEWCtKUzZNamk5aG5D?=
 =?utf-8?B?cDZTVThqNTZoVXcwZ1dNUzhHdDRzY3FyM0JRYmd2R1JEc3VWeXpRZk5HWlhj?=
 =?utf-8?B?S2VnZXR0R0w4REd5eWphTVFBOUppSXFIUHdJa2tuOFMvZ2FJamd5Yk5MeXh0?=
 =?utf-8?B?M3hSWm1FS3lEM3lXNmtVc2xJUEowRXdXMFRDaCs1SzBBL20xdmR0ZjhCcEs3?=
 =?utf-8?B?NTBQaDVHcHphNFNnVU9Kb0JIQWhqN3hyVE13YkdWQ3lkVytWWUZ5ZGIvZFBF?=
 =?utf-8?B?Y1RjcjhLOFIrRUdFSG0zUy9KVHZiQUJMb0h1aUk5MTlndk02M0dqM2Yxa1Z6?=
 =?utf-8?B?T0NPaFNjalVyY3h6dllwSGdBaW5jR2Nlbk1EUEFSdkRmUGlKRW0xSTQ0cDRm?=
 =?utf-8?B?SEs4SDVkSEY5WlhOd0dOMmVVd3p2dDkraWhtTHB6N1B2UUlFRjVtNFBBaEMz?=
 =?utf-8?B?dDRoQWduWnBYVjRTZDVEaytnd1VQTFNRQUxub1owaiszaTNWaFVJN21BVk5v?=
 =?utf-8?B?SWZmWmFWT0FBNmNjbDZNWEc1Y1ZGNVBpbG9udUpuMG1pN0hVQ3RrS1lQRndR?=
 =?utf-8?B?SXA2Tk1MalpqSkZxTEM3TTVra3NDTjh0dWkzMlRHZlBZck1MWDJwQ2Z2UjZn?=
 =?utf-8?B?dFNBYmU4Ny9qa3YzeEp4K3g0VzFUaG9NOC8ybldzMEZoSE1yUXRCaXAwYjdy?=
 =?utf-8?B?VVNHTUpJM2kwRmpxc2c5bVNmL0F1a3p3Z1FqaHJzbkEybzdpVE9oK3FFT1pT?=
 =?utf-8?B?MDdSSUIyYW1sSGFIUzR5MjFyUkxJY3ZmVVpsMlI4Q1Q2TTFzcXJPWGxSSnFR?=
 =?utf-8?B?R3NwN3UvVXB1Q3JMZENSaytEMFZOdGE3ZmVQYkkzZFMrM3dyc2h4L0Vpc3Qv?=
 =?utf-8?B?c2FwbUpTUkZRVjVqb2lTMHg3b0lhRkxnYUhkY0JRRFZNOU9Zaks5dFpSeG0v?=
 =?utf-8?B?M0N3MDJmUnJYVEVpekF4dW5SOHBhQThxM01lVXdYbVh2ZkZNQ1JvZTVsRVpx?=
 =?utf-8?B?dlQ3NEpwQUVJWDBkZjNJMDRBcUV2V2FYS005R1JqNndRdFd0ODVlUTd0Q2E3?=
 =?utf-8?B?RVBGc3FwZ2JkZDB5UHBveFRydlVuVEZ2dE5oMVFEOTFSVW1wMWE0U0xRQ1VL?=
 =?utf-8?B?Ym5UY0dnU1RibWpKT3JLY2JrcXRsQ2dxWjdQWHZNOGZ6azhwYnI2YjFCejla?=
 =?utf-8?B?TVFIVllnaDFUR2ZpaGQxdVQ2UGljU0dSWUYra0l3N0tWL2wrQ0puYTI0b2dM?=
 =?utf-8?B?eVIwd2FGK1VyZmNMM0swUVlHTmlwVUZiUm5DdnBYWVoxN0VuQ2tObDk2RVJq?=
 =?utf-8?B?WThzcUNLV1pmakJPQ1pPbjZhdk1zZGxMMUQvTUJaNExNRmpSSFNaenhDK3dv?=
 =?utf-8?B?Z2dCaTQvaVIzenBLSCswMjlWKy81enRvWm9XY2lwZVNMWFdrR0Q0Vk1GUmwy?=
 =?utf-8?B?TFNQQjFOblp2VlZoNGZyV2pSMktrcnJhMFBQeHZ4cGErVWtMeks2SnNWdUJ1?=
 =?utf-8?B?RHE1OHJSbmpMNVNHZHpsNUtvc1l4L25BRmVaaklKcHNCczJhTzc1REZ5UXhp?=
 =?utf-8?B?MnpwM2o0WVYxb2hqbzl1dDJZcUZHYVFlbWpjTG8ydUVRb3g4aHJBR1BUWUVs?=
 =?utf-8?B?NjdHc2k2bkEyNENmamlSUWxlYWh6Z2g2THFuYU9xT2RDYUkxM2FReHNZSHVU?=
 =?utf-8?Q?AYZ8sE4CRlcY/E3nv0awAikGcUEtFampqvTuSi1KjJcj?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69de1463-39bf-49d9-9d47-08dd94737053
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 12:16:08.5395 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z7cc70mYIn9QNeG8qnP9JwoXTYdSJYlARorAXGud1KdVRjToHfurv/fe03jEBvcYXpL3bE5azpyPiXkqzrWN9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6888
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

On Tue May 13, 2025 at 11:07 PM JST, Danilo Krummrich wrote:
> On Wed, May 07, 2025 at 10:52:36PM +0900, Alexandre Courbot wrote:
>> Upon reset, the GPU executes the GFW_BOOT firmware in order to
>> initialize its base parameters such as clocks. The driver must ensure
>> that this step is completed before using the hardware.
>>=20
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/devinit.rs   | 38 +++++++++++++++++++++++++++++++=
+++++++
>>  drivers/gpu/nova-core/driver.rs    |  2 +-
>>  drivers/gpu/nova-core/gpu.rs       |  5 +++++
>>  drivers/gpu/nova-core/nova_core.rs |  1 +
>>  drivers/gpu/nova-core/regs.rs      | 11 +++++++++++
>>  5 files changed, 56 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/drivers/gpu/nova-core/devinit.rs b/drivers/gpu/nova-core/de=
vinit.rs
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..5be2e0344fb651e5e53c9223=
aefeb5b2d95b8de1
>> --- /dev/null
>> +++ b/drivers/gpu/nova-core/devinit.rs
>> @@ -0,0 +1,38 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +//! Methods for device initialization.
>> +
>> +use kernel::bindings;
>> +use kernel::prelude::*;
>> +
>> +use crate::driver::Bar0;
>> +use crate::regs;
>> +
>> +/// Wait for devinit FW completion.
>> +///
>> +/// Upon reset, the GPU runs some firmware code to setup its core param=
eters. Most of the GPU is
>> +/// considered unusable until this step is completed, so it must be wai=
ted on very early during
>> +/// driver initialization.
>> +pub(crate) fn wait_gfw_boot_completion(bar: &Bar0) -> Result<()> {
>> +    let mut timeout =3D 2000;
>> +
>> +    loop {
>> +        let gfw_booted =3D regs::NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_PR=
IV_LEVEL_MASK::read(bar)
>> +            .read_protection_level0()
>> +            && (regs::NV_PGC6_AON_SECURE_SCRATCH_GROUP_05::read(bar).va=
lue() & 0xff) =3D=3D 0xff;
>
> What does it mean when the first 8 bits are set? Why don't we have a mask=
 and
> value to compare for that?

Since this is a scratch register, the particular behavior of the bits
was documented in a separate OpenRM file - I finally found the
explanation after looking it up.

This appears to be a GFW boot progress counter, with 0xff meaninig that
boot is completed. I have added a (documented) specialization of this
register as well as a helper function to make this clear.

>
>> +
>> +        if gfw_booted {
>> +            return Ok(());
>> +        }
>> +
>> +        if timeout =3D=3D 0 {
>> +            return Err(ETIMEDOUT);
>> +        }
>> +        timeout -=3D 1;
>
> NIT: This means the timeout is ~4s; can we start with timeout =3D=3D 4000=
 and decrement
> with the number of ms passed to msleep()?
>
> Anyways, this should go away with read_poll_timeout() anyways.

Yes, the timeout code was a bit weird. Actually as you pointed out, we
can also use the `wait_on` helper introduced later in this series.

>
>> +
>> +        // TODO: use `read_poll_timeout` once it is available.
>> +        // (https://lore.kernel.org/lkml/20250220070611.214262-8-fujita=
.tomonori@gmail.com/)
>> +        // SAFETY: msleep should be safe to call with any parameter.
>> +        unsafe { bindings::msleep(2) };
>> +    }
>> +}
>> diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/dri=
ver.rs
>> index a08fb6599267a960f0e07b6efd0e3b6cdc296aa4..752ba4b0fcfe8d835d366570=
bb2f807840a196da 100644
>> --- a/drivers/gpu/nova-core/driver.rs
>> +++ b/drivers/gpu/nova-core/driver.rs
>> @@ -10,7 +10,7 @@ pub(crate) struct NovaCore {
>>      pub(crate) gpu: Gpu,
>>  }
>> =20
>> -const BAR0_SIZE: usize =3D 8;
>> +const BAR0_SIZE: usize =3D 0x1000000;
>
> This means that we'll fail probing the card if BAR0 is not at least 16MiB=
.
> AFAIK, that should be fine. However, can you make this a separate patch p=
lease?

Sure!
