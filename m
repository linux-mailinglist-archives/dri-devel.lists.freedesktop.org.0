Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 962ADBD19D7
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 08:20:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 132CD10E0A7;
	Mon, 13 Oct 2025 06:20:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="YZ2BzvWj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010059.outbound.protection.outlook.com
 [52.101.193.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 556B010E0A7;
 Mon, 13 Oct 2025 06:20:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yzdkDcbTMp2vX3a5WNU/m3Qrf4qw2VTPY6Vptng8s9HHPou7mKmf+Bo4wIhkWW0DSbkr6Sb/AnWuD4+BzwSjbggb5kwtwpSrJLERuD3F9Y79mcFY2h1vUO3tAFXFmjOmIJCKe7vg684zeivnJI4mvvMqRF08hzKXNxAwAbRVB/C0Gj3o0y/idkTRcksdNEOhtHIDFo/sRd30H44TOcVA9EDOIHraTO66dYrfgz3ZuTrqCf4zxjOqLk5U5MxITNSdULezk/Jydk+9OctHRBt42l5Ze57SqmntQLgdbdyvme5UVhj0uFgtZDiO4Ni+NMf0WinzmYJl/GQzIpavTEDyQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HFVyLW9jZ17u/C+fS3oWQ9s/74dqSjmRr7sQdn9LPJQ=;
 b=IFlOs1V0iejKufkADI3IcJ9f2dxS8sy/XlEp5rJNaBOgrdrN0zcX6EtIbJ3TdLVJQbEvQQ66+YW24NU9lwZGHW2tpSWBYuYzCsTfk1jROZJbnlb6cCh3/C9nev3bYu12S2jIVMX8cynhiF72JrFTH2AIMZ/gIIcKryl/Ie+WIJyQT9UfEV5PxG3YOWHIvlgCgv8Jr7uRHYsp/3zO6llckZ1hhE8qRyxUPyPiuMRkb+YUM+9AyZyXyZf+ysGeXtPlYjeg5JpHSsnAjz9XJlFk8yfsBohYfPwkZn9pCcMy/m3LUVHD2ZC/v20hQUYkPv9LDLqClv0eF+BJLT5GT9Ncvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HFVyLW9jZ17u/C+fS3oWQ9s/74dqSjmRr7sQdn9LPJQ=;
 b=YZ2BzvWjtzjTA6YSHnhhGaTxKEdIBZ/YiHjofPRLrjRxIziJ8XEDqee4Kqg/dZwTBbD23vmK0wn6er7UWAdLZcu4PgzELKmCFAZdnvskhkasWB/qr9qGKRm3UVJPt1JO8zQZfTd0H1uUr53qgeUP7MN/IDkXyNAMn6vVgu5GxAo5TBhC/GEG9U5sYbscvZFsjfnRFqMUDeoZ/B2fISDeCZv5zhfhW10ku8v5iUGluXLXCnTUJrB+HsNvie6GaWz7bFomEdvaFNpDtd+ZPe9xU5uIuazXUo7WfzxdzX1GGUpBVrDMUYPYn4z+ofv+emNsgeD47jR9OmRYRQZkwnm91A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 CY5PR12MB6406.namprd12.prod.outlook.com (2603:10b6:930:3d::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.12; Mon, 13 Oct 2025 06:20:47 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 06:20:46 +0000
From: Alistair Popple <apopple@nvidia.com>
To: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, acourbot@nvidia.com
Cc: Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org
Subject: [PATCH v5 00/14] gpu: nova-core: Boot GSP to RISC-V active
Date: Mon, 13 Oct 2025 17:20:26 +1100
Message-ID: <20251013062041.1639529-1-apopple@nvidia.com>
X-Mailer: git-send-email 2.50.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SY5PR01CA0018.ausprd01.prod.outlook.com
 (2603:10c6:10:1f9::9) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|CY5PR12MB6406:EE_
X-MS-Office365-Filtering-Correlation-Id: b24193c1-902c-42a7-685c-08de0a20a567
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OXBKMkpOZkJpbjZwUktQL05aZTd6VG55Nm5PaEtBUUxyUHBNdnA0a0FmWktO?=
 =?utf-8?B?dHNabTk4NDFvYzB3NEZORWt1aWlwY3R4c2t0MkFIanQ2d25DdkZWUHl5MnNK?=
 =?utf-8?B?VkJMak5hWk9kRnFZaDZhMmxrZ3gyQ2w5dFFrRTkyYW5objVUZzcxd2o4UlVT?=
 =?utf-8?B?akJYcnZ6TWpRQmhiR1doZjMvdGdtTG14czFSdGxEa0ZGVWVoTXMyb0lWdWdl?=
 =?utf-8?B?aFlyWVdSbCtUSFVnSWxjMS9Ga3FoRUJZMmovblVhcng2NDRQOXBvT3pUUERi?=
 =?utf-8?B?SWV6aG8rN3VpMndVK0lmVjhWTEhza3g0UitCNjdWMHYxNjdQY0d6am04c0V5?=
 =?utf-8?B?ZjlHOFBjVUVhRVlvVURTS2NoVUR4LzQ3bmZTWTFoSkp4L3lURlBxdG5QYm1W?=
 =?utf-8?B?OERzbkJRKzRUUmlEZllDcDBLOVZ5dElsL2p5eGFMWkMwakpVSElPeitPK0tC?=
 =?utf-8?B?M0p0dUU3N3ljOG9IT3FWWjU4Q3BnVEJNdS9XK2VzNHZQUGlNYjRPWFNDb0Zt?=
 =?utf-8?B?dTc5OVRNNVpNTVRYSHhNaWk4ZWVDVjFTekVVNWFHMU9UbUNFMUdFbTF5SHN0?=
 =?utf-8?B?N3ZaUGs1Q1JJbDd0Rk5jSTVRR0xYL3gyeDJSa0oxNE1yak9wTUVJMWcxTVFZ?=
 =?utf-8?B?bk81VzJUcG9NSTdLRmpicGNKUWI5Y1IweERsdm04WWFxQXpEcXRQbExzRmht?=
 =?utf-8?B?anNubDV2YjgzZ2dJSU9xcnhFeVYyeGtHVlhDL051WHRyWE9zOXBYVnU4Vjla?=
 =?utf-8?B?SXJ3cWV6NGI5aW4ydENySW5wSTNYcGNOaThVZDNuSVcxOW42YWx6QmRMdFNN?=
 =?utf-8?B?dkhCblp0aCtvdnpJRHQwc0RBSC9NbC90K2JLNkFOam9iVDNHU2ZQWUxLQWtv?=
 =?utf-8?B?UHllMEVTcUR6UXJXek1zRGE2c3ZKUXluL0dkS1U3NHQ1b3haQVd2SmtCeENY?=
 =?utf-8?B?bm9zemVobVJmSld3KzY1MGJmMmJVYWVRajJGcERTWW9xNHhMMjgwMmtndEVw?=
 =?utf-8?B?VTY0RE81YS94UlYzc051VjRjeWFZU2MrM2xQZTczL1V4dHJOVmk0UElpUlZZ?=
 =?utf-8?B?MDBOMHY2V2NOOEo3azh4Snh0eStwOGM5ZXYrdWh4c0dtV1ZzUGVHUkxHV3Uv?=
 =?utf-8?B?LytPMWtrOWN5WHI1eGxrRzFLRkRLa2dObmtqYlBlbE1BU0VETXlmMHRpOU5p?=
 =?utf-8?B?TWR1a0xTVEkvUmpnRlA0bUVtTSttd2hWRVBYU09xMHFuekxtMzNNcnNxR3VK?=
 =?utf-8?B?VW1TY2oyT3c0VkJMNlhIdmRkdW53NDkwUDhXWkZuN1hacWVXTkZhMTBudllC?=
 =?utf-8?B?SWVOUkE1T1RHZ2xzbUxOZHVWaHBsUmdOREdWUVRJTDRRUTVhTTlTOFRxcGUv?=
 =?utf-8?B?bG9DQzdwWStBNjlqTjhOZjEvekNiaDZpR1VDUzI0T0N5aC9HVHU4MHRsZExr?=
 =?utf-8?B?WWZQSGtmT2F4QXZYaFJWWVg4N2FtS3Z1ajA0QkcxOHdRcU1pR0xEaGJjM0FQ?=
 =?utf-8?B?bWpzYkhFcm1wOTVqTkdORndxTU1hRWJMMzVjOFltT0hZdDRZU3AyS09iNHRm?=
 =?utf-8?B?UVQ5cnhQUW45R1lvalBOSWp4UWYzdEphZHd3S2psaHN2RnU0TzBneE5kL1l4?=
 =?utf-8?B?eUN0SHdDRjFhNXhGWXJBdDJYNlF3WnNnS1VxL0ZsblpuVkVmMjVqN0tMT0hh?=
 =?utf-8?B?eGFFdmZJOTBPN0lSQlNTeENoMHhpK3lsNHpRbkg4ajJwZjlRbDZ4cmRaNTV2?=
 =?utf-8?B?cXV1a2VaOTZJWUVTOFJZZndkbEtPOThabFRkc09FMnFDZ0xTMDBrK0ZwUGxr?=
 =?utf-8?B?V1hwNmhQMWNnZGxXUWlQZkFxajJYZE92dWNQNzZhYm10c2VNUHhtUU5RT1Yx?=
 =?utf-8?B?cHR4K2JTaTRYb2lMdFdZWEVvQXpKYnIraVRXMGc2dTduc1d4Y0ptc3VRRzZF?=
 =?utf-8?B?eDZFb2JtWFQ1ZER1TXB4d3hxMGNDcGdFZEtET2hNdVVLSk42U25iRzJSbFJY?=
 =?utf-8?B?eE1VWkl6eEZBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cEVoZmh0NGdlUHV5b3dtVUdYMjI1ZHplRUJFN0VLcEJYaDE2L1d2STZtYzFN?=
 =?utf-8?B?dnRWc1hWMEhrYVZqWmNlaHlmT3VyQUsrajRHOWZCdG94Z0xhVW1FTFh2RmRW?=
 =?utf-8?B?eTQyN1lkbFB4WkJLaExrZWJxWldJYnlPTGFsQ0JwRnNHeHl0M21jdFE2MHBR?=
 =?utf-8?B?MTkvU2pkLzNZNFc1SFJqcUNxcHN2RVIwTno2WTk2RXlMOG5BbDlSQVo5ekdo?=
 =?utf-8?B?dXM4ZTA1UktEYVM0WFI1dE1OU1hodkVlNVBjMnBJdm5Ka1ZNaEFnWi9rS1dQ?=
 =?utf-8?B?ZDhYeW1IcWw1czIvR2xJalZkV3FWQ2Z0alJxdEM5Q3oycGtFdnB6dFVyUy9n?=
 =?utf-8?B?M25pNE56REpTTmpqbUJuZWVqVHJNdXVVMjZZdzZGZUlXVmc0R0RUTkhhMXQ1?=
 =?utf-8?B?dlQrYnRKYWxPbXg0bjM3SU1KWlEvYzF0M2VaNE1qUkcwZEVHUStxVDVkQ0Fq?=
 =?utf-8?B?VnZUNEM0NEVWdmFuZlM4eFJDMWFZT0tjTDB4MjNuMUFSc3NXM2xKQ1hBNUF4?=
 =?utf-8?B?SVRkKzRESzErVUw1SzFldmFZMnhyRjhDZFpNV1dqZkZOeDJRY2hick9rVmZi?=
 =?utf-8?B?ZnlNcnMvQUs4N29PZjdaR3grcXZ6NFA2N0VoSHF6OU5CMEJ4TVBSQnhLVXIr?=
 =?utf-8?B?THhXQ0VUaGlEL1FUUllVMmVObDU2bkZGalg5ckRUZkR4TzhjaWwrNmFxbEdv?=
 =?utf-8?B?Ti9NNDRhNlpydFpOUDd0ZnA5aStKaEhwNDZjbmIvanpqclYyOElaYlRkc3NP?=
 =?utf-8?B?akg0VkxtOWR0cTNXUWp4NTNmZ2tVREUwUlZKTzdtUVJMa2k0OG1ZYXBwZWp2?=
 =?utf-8?B?WUNRNDRJZldOcUVsTHNmTmJKcnVobXgvZkFBUEdEdFF5SmFjdFNVQ3UzTVB4?=
 =?utf-8?B?eFIyOGlHdnVzOTVLcFpLRStQM01lK1IweG1IK3dPME82NHFwL2ZQYm40TlRY?=
 =?utf-8?B?a1kzSHRPNGdIZ0JiVks0MmRoZU9GVkI1c1NmZFlIaVZKa1Y5aGZ3ZzBBcFBU?=
 =?utf-8?B?OS9XWE1tM1hKY2R3ZDNaZ2lqWXRrR3QvWjFUalIyTjE0ejVMWi9vaGxmRi9o?=
 =?utf-8?B?TnRFMWhaSys0WGpidE14K3pEbytqMnY1QTdvc3JEZGhEcUlQRlU3NEczUGgz?=
 =?utf-8?B?Rk5nanNRVWxKeUJ5VTFmOVl6bEdGd0JGUGRLeHNJc052V2tXMmFjRHRBK1pR?=
 =?utf-8?B?SCtKY1dVNS9KL3MzQ2p1eUVMVTlBN2N5UEtGMVR0ZVNMZHpkbE1obE5hbHJO?=
 =?utf-8?B?dTFCWnFaVjVZUWg4QkUwQlJQazZzTEpJejNFTG9Pcmw4Q25TWGh6azlSNWYz?=
 =?utf-8?B?anZQZGlXRlU4TnFGMU9ZTjRXUW0zV3ByRmxnZEI1Um9nQXlPVUxLSHRjUmtD?=
 =?utf-8?B?Y1RCL0tzclNDb2JiN2pydkdqNzFob0wwN0Ywa3ZuV1ZpT0NqNVUvRXM3Vkh5?=
 =?utf-8?B?aEZvQmVNSUMwbmI0V0U5bllRYXUycDBpekU1bUtUYWZhakM3UU51TWxOVkFi?=
 =?utf-8?B?UlFpSHpDWlpuUEFoRGdadkJxL0lZeWZMVXFVNkxucGpXS21qbEdQZHFELzBm?=
 =?utf-8?B?VEQ0a1RtMVREUkxoMWVrZ1JBRENHYU1ra3Z5K25FN1dXUmxOQWNZSE4zUUht?=
 =?utf-8?B?VHhKMDQ1ajdwTGFTd20ydy8za1lHNkY3QjZNN1V4T0JtWnNaYnRVZG5mOUtQ?=
 =?utf-8?B?N1I1R1hjYWR0NzdjdHpvNzZOVnZkdlNibzBLWGhiaVQ1TDdFZGZvQlMvb3BR?=
 =?utf-8?B?NlFUandWU2tyVWl6dnVaVDRUUjIwYmlBZnBxc05tOUMxSFlUNlhlTXpGY20w?=
 =?utf-8?B?bVY2blN3WjNZaUxDQjhuQ3VuK3c1VWhLQVV6bmQrTmNBTDIvbkswMVUveVNM?=
 =?utf-8?B?MXBXWDdDbXRNVHVQV1VQOHY4VFdiN3Y1MVo1S01haXI5OXJCNlY5TjNhWUZz?=
 =?utf-8?B?cjA2SHdaS2tBUkVaZUNWRjRJM0JvN2xjOEFteTNXMG9VdFU3VC9KSnd0a3lR?=
 =?utf-8?B?VkhsRGYzakRrUTNWNFBpZm1XN2h0TjVnWG0wbjhDVlF5YmF5RGhrZ1AvdHUx?=
 =?utf-8?B?Mkc3aHZoQXkwSHd1cmZkNjVGOXhONU5YWnZ6UDhGdFhRZVNNdG9JZ25GZ3c1?=
 =?utf-8?Q?rfH7h3LwTXwIuS8gIfV3CKXkx?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b24193c1-902c-42a7-685c-08de0a20a567
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 06:20:46.7130 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nkOTVGocC2IKSYnYYf0yerfjSgcGFxFd1vd2QKfzYpDGDuIhxouymKHb9BozHxprPWcNfOPBiWVLwyRcnyeIpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6406
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

Changes since v4:

The main change for this revision is to derive the Zeroable trait for most
of our bindings. The rest of the changes just address relatively minor review
comments made for v4 of the series.

This series is still based on a merge of drm-rust-next
and drivers-core-testing made by Alex. A complete copy of
the tree with these patches applied will be available at
https://github.com/apopple-nvidia/linux/tree/nova-core-for-upstream-v5

Changes since v3:

The main change for v4 is to switch to using the `init!` macros to ensure all
fields on in-place initialised structs get initialised. This will require our
bindings to derive the `Zeroable` trait, however for now I have left this as a
TODO with manual implementations for each trait. That is because rebasing the
binding changes is a bit of a pain, so I want to give reviewers a change to see
if deriving `Zeroable` for all bindings makes sense or not.

Other changes include addressing most of the outstanding TODOs left in v3 and
addressing review comments from v2 and v3. In particular some of the comments by
Timur that had not been picked up.

Changes since v2:

The main change since v2 has been to make all firmware bindings
completely opaque. It has been made clear this is a pre-requisite for
this series to progress upstream as it should make supporting
different firmware versions easier in future.

Overall the extra constructors and accessors add a couple of hundred
lines of code and a few extra unsafe statements.

Other changes include addressing a bunch of other comments - see the
individual patches for further details. There are also still some
outstanding comments and TODO's to address which I have not gotten to
yet - these will be done in the next version of this series.

Changes since v1:

 - Based on feed back from Alex the GSP command queue logic was reworked
   extensively. This involved creating a new data struct (DmaGspMem) to
   manage the shared memory areas between CPU and GSP.

 - This data structure helps ensure the safety constraints are meet when
   the CPU is reading/writing the shared memory queues.

 - Several other minor comments were addressed, as noted in the individual
   patches.

This series builds on top of Alex's series[1], most of which has been
merged into drm-rust-next, to continue initialising the GSP into a state
where it becomes active and it starts communicating with the host. A tree
including these patches with the prerequisite patches is available at [2].

It includes patches to initialise several important data structures
required to boot the GSP. The biggest change is the implementation of the
command/message circular queue used to establish communication between GSP
and host in patch 6. Admittedly this patch is rather large - if necessary
it could be split into send and receive patches if people prefer.

This is required to configure and boot the GSP. However this series does
not get the GSP to a fully active state. Instead it gets it to a state
where the GSP sends a message to the host with a sequence of instructions
which need running to get to the active state. A subsequent series will
implement processing of this message and allow the GSP to get to the fully
active state.

A full tree including the prerequisites for this patch series is available
at https://github.com/apopple-nvidia/linux/tree/nova-core-for-upstream.

[1] - https://lore.kernel.org/rust-for-linux/20250911-nova_firmware-v5-0-5a8a33bddca1@nvidia.com/
[2] - https://github.com/apopple-nvidia/linux/tree/nova-core-for-upstream-v2

To: rust-for-linux@vger.kernel.org
To: dri-devel@lists.freedesktop.org
To: Danilo Krummrich <dakr@kernel.org>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>
Cc: Gary Guo <gary@garyguo.net>
Cc: Björn Roy Baron <bjorn3_gh@protonmail.com>
Cc: Benno Lossin <lossin@kernel.org>
Cc: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>
Cc: Trevor Gross <tmgross@umich.edu>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: John Hubbard <jhubbard@nvidia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Timur Tabi <ttabi@nvidia.com>
Cc: linux-kernel@vger.kernel.org
Cc: nouveau@lists.freedesktop.org

Alistair Popple (11):
  gpu: nova-core: Set correct DMA mask
  gpu: nova-core: Create initial Gsp
  gpu: nova-core: gsp: Create wpr metadata
  gpu: nova-core: Add zeroable trait to bindings
  gpu: nova-core: Add GSP command queue bindings
  gpu: nova-core: gsp: Add GSP command queue handling
  gpu: nova-core: gsp: Create rmargs
  gpu: nova-core: Add bindings and accessors for GspSystemInfo
  gpu: nova-core: Add bindings for the GSP RM registry tables
  gpu: nova-core: gsp: Create RM registry and sysinfo commands
  nova-core: gsp: Boot GSP

Joel Fernandes (3):
  gpu: nova-core: Add a slice-buffer (sbuffer) datastructure
  nova-core: falcon: Add support to check if RISC-V is active
  nova-core: falcon: Add support to write firmware version

 drivers/gpu/nova-core/driver.rs               |  16 +
 drivers/gpu/nova-core/falcon.rs               |  15 +
 drivers/gpu/nova-core/fb.rs                   |   1 -
 drivers/gpu/nova-core/firmware/gsp.rs         |   3 +-
 drivers/gpu/nova-core/firmware/riscv.rs       |   9 +-
 drivers/gpu/nova-core/gpu.rs                  |   2 +-
 drivers/gpu/nova-core/gsp.rs                  | 134 +++-
 drivers/gpu/nova-core/gsp/boot.rs             |  76 ++-
 drivers/gpu/nova-core/gsp/cmdq.rs             | 509 +++++++++++++++
 drivers/gpu/nova-core/gsp/commands.rs         | 115 ++++
 drivers/gpu/nova-core/gsp/fw.rs               | 455 +++++++++++++-
 drivers/gpu/nova-core/gsp/fw/commands.rs      | 100 +++
 drivers/gpu/nova-core/gsp/fw/r570_144.rs      |   1 +
 .../gpu/nova-core/gsp/fw/r570_144/bindings.rs | 592 +++++++++++++++++-
 drivers/gpu/nova-core/nova_core.rs            |   1 +
 drivers/gpu/nova-core/regs.rs                 |  17 +-
 drivers/gpu/nova-core/sbuffer.rs              | 215 +++++++
 scripts/Makefile.build                        |   2 +-
 18 files changed, 2231 insertions(+), 32 deletions(-)
 create mode 100644 drivers/gpu/nova-core/gsp/cmdq.rs
 create mode 100644 drivers/gpu/nova-core/gsp/commands.rs
 create mode 100644 drivers/gpu/nova-core/gsp/fw/commands.rs
 create mode 100644 drivers/gpu/nova-core/sbuffer.rs

-- 
2.50.1

