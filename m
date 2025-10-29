Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E00CBC18EE7
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 09:17:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40C3C10E724;
	Wed, 29 Oct 2025 08:17:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="kIdNriPY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013031.outbound.protection.outlook.com
 [40.93.201.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7505B10E71D;
 Wed, 29 Oct 2025 08:17:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pd/xhylvhlwqi1ih8z657s3hHBFfRsDFcjTyb1oZ3chfnN+zcEPsYaXXrIEbUjETt86RFNx9UEXIRm/jMSTRYaIPEBlDJ/aG803x0FjHMMpuHA864BomEZtXHGK25NDRu46lxh/Bf/wNH1hh9wVBscfVBtAuHlmwJ9xE/uoYEzQc9bDWWbNhQkbg/ZqjgzWbCWLXs+OY0H1GpbrZeO7mS8SOIWlt2LJ6uuR2Axep2hgwk5Sb8OKulb7Sj9p8X/mFttMN+BzAFycH+F1BPLmixTqsJk55WasmiCTIs7v+cHF6BPyUSEDz+N5GsmCJ6guDJXhKNC52Gkt2d4898TYuTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FtiZSXzJiixHUK7hibBLHh2jhohruChWIN7e0Ipj8C0=;
 b=EFGWnkyWho7HdEWJuOg8YdYeSB9kTCJBTarqtArpoU9BC1R0RJcGh2MvWqpbxFxyK/wtVf8GDPBm+FM1rdDzpsARUkx/IIIqE+z0kmbxQxeGnn5c4XvBsiU2fVTJDrym783HFXLLzxD1BOGDfMwiMTHaBQeZZDS5CRfW2MTSFgpWoJ6JPLkUSC1MAYjlpepoPaKCXYadXB4990vsoCJFdqPO+542Cf+Xian2qEC6tp1SP/Nd5J5y0NVaQ+g5lSG1bs6QqfgG+4Nnx9DD7V2b2YMQhdeDv8jPI8QBl559navlUGIjl1YHuzJ6iHkxc8ocV3YB+M5R8itC03nLOPDteA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FtiZSXzJiixHUK7hibBLHh2jhohruChWIN7e0Ipj8C0=;
 b=kIdNriPYP+K+UY/5YKpLUgQli09OhuSxlMPriZa+ssegCdoxnUjWnydp7ZaP04uWIUeFvUy9S+N/93ZNZD3WsWmCQ1ekmaEwHS3wjphpxoPShItXi4HnMSaPyakua0Cn9NEIwKIx5dnFGDMgoVV3VjDTfE4yupU9ffo5YyiBARROBVtF5SmkIIdSsjcyHpxkkEYTvw08oA4/Ci8LWudzoeVYCZ5lzMyRtzElVvlhF2Vz3lBaK2w/lohZSLbNkEFQz3rs+ybsXiWAWWVOahNDmOhuk4/w56Zb0iCNfsG9B7tBPBK/O41et/F3A0Jw5I+q6WwMppWnu0MkXnwwgiaHsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3997.namprd12.prod.outlook.com (2603:10b6:208:161::11)
 by SA3PR12MB8438.namprd12.prod.outlook.com (2603:10b6:806:2f6::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Wed, 29 Oct
 2025 08:17:27 +0000
Received: from MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316]) by MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316%4]) with mapi id 15.20.9275.011; Wed, 29 Oct 2025
 08:17:27 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 29 Oct 2025 17:16:30 +0900
Subject: [PATCH v7 03/14] gpu: nova-core: num: add functions to safely
 convert a const value to a smaller type
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-gsp_boot-v7-3-34227afad347@nvidia.com>
References: <20251029-gsp_boot-v7-0-34227afad347@nvidia.com>
In-Reply-To: <20251029-gsp_boot-v7-0-34227afad347@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4P286CA0071.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36d::7) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3997:EE_|SA3PR12MB8438:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f480b96-a6b2-4d0a-f821-08de16c398f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|7416014|376014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NVVVSU51MVRadHltMjhINHBLeThyN3V6V1Q3QnJodlBONnJOa2YrVnJ4dUtq?=
 =?utf-8?B?aXB1dTJXWHJHaTBYVUkxVU1BVG1YWWFuRlhlWHNhbjJqRDVXN3lUNjc0U0li?=
 =?utf-8?B?bW1ML25PUlpJcndtRzN2aHp5dEJKZ3ZtZnc1Q0RpUDNWdVhneEV5UGhTV2sz?=
 =?utf-8?B?YmZUMGlPQW9PNjJBMjZ0RFRRalpnTkVNaDlKeUZWMGVGNndSYTBtSWJsUGRK?=
 =?utf-8?B?aEJVWlJvdHc4M3NQVjR4QU91aUFkVlovK3dVT04xY2M4NEZ3MWVXSjlscVBl?=
 =?utf-8?B?a21KRnd5NytwMDFyK3dYNEs4OUNFQWNqRDBmTjl4STZSNDR4Qmk1TzZXN1pj?=
 =?utf-8?B?MEd6Wk1mNS9Xc29Gd1A3cFJWZW90NFIxK1ZrM0JLT01mUGVLSHJNWHBaVkRa?=
 =?utf-8?B?ZnNIamlaelljU3dqVXlPMmdXK2RnM0UzcTFjNkdubDMrY1ZDMG5ialZKM1Q0?=
 =?utf-8?B?SWsvbExUU3p5Vyt1cUJ2a3ZqSzkvRlFkdm1MN1UrWTM1VmU0RFJqenFqSlda?=
 =?utf-8?B?T2ZmN3loUnlUWEo2VHJOMTRvNmdEZ2tGTUJtTDBiaHBZMlh1dHcyaktmWXpw?=
 =?utf-8?B?MG5INjkyLzhKMElUWTRYaGtXQWJLdjZYb05YaTZldkxLR2ZHRDdKbFljVU9x?=
 =?utf-8?B?N1NCUEUwcGR6dzQydERrZVZlNkFob0REN2VrNjZ5SnNwQmVsa1B6RHliZHo2?=
 =?utf-8?B?dUN5TlVFbittSUo4VE55cFhLaGowVDloZmhiUmZCRXFXL3lNSzBLVU1TQjFr?=
 =?utf-8?B?a1RPNER5c1BKaUYzRCt3OEdjV0MreFFOMUU0QnEzcE1zQWtwRWw4cDQ5YVpP?=
 =?utf-8?B?RWpwM252L1AxcmFRSStRTDFyMDc0a0VJWHJFdVBIdmxUczYyZVpjd2JYYkxK?=
 =?utf-8?B?RUdMcEJWRXFkTityZWJ1Z1g1U2Vod2ZBWUZBR1hrNEhnd24xR1ZLaVlnOUlZ?=
 =?utf-8?B?b2RJQlgwTXR2MnQ2ODVwOW45ZUlpdmJRR1UvMGlkb0dOUmZCdlJDb3dDaDBL?=
 =?utf-8?B?dTdJSEQzMXBjQUZFdGdTYXdoaTBkcENmRWlQWSs0Umlsc2wyeElTUDg0elBm?=
 =?utf-8?B?MTNONHJ4OUgwRVR5b3Z3c2dCYTllWmcwS3RTZnp3QzdLVnU0YWgwdW9ab3Nt?=
 =?utf-8?B?cHBmdEsvS21Ia05RTThNbXM5WUkwUWhUQ1Iza2tJWUY1bVVqQlh2Y2hLdHlk?=
 =?utf-8?B?dHlIMjBBTXZBcmJoNXlmOXNyb1ZjWTUxV2M3Z3JzNjVhcHBNWlVXZFNnNmlF?=
 =?utf-8?B?eHpMSnB3NFA4a3dGSDJna3pnM0NuUWgzVnUwSmY0bjVrWHVNK2U3dkVwTDNj?=
 =?utf-8?B?aDhYNG9yZndZbFFMNWUyYkFPaWk4QVR1UjdqNkhaVEM1ZUdwNEVURWg4ZnBK?=
 =?utf-8?B?K1JKTnUvSCtYVTl6L1lwSlJhcmhlOFhQTHVkNFVIa3JKQkVSZU9iR2J5c1Jq?=
 =?utf-8?B?V3oyNWcwRHRWRjRueVFVaWFKTC9teHQ1eUVmSHV4dzk4QXgxNnFYd3RPZDNQ?=
 =?utf-8?B?OFhJZjY4R0dtOGtEdUw3aGlReW1hTms1WTEva1o2ZSsxWk1RblduWGYwSFRL?=
 =?utf-8?B?KytIUmtBZ1lxeWpxcDQ4UnVKdUt6Y1czVEhEK25Na29LMWxlVXYrdmdUQ0Jq?=
 =?utf-8?B?WndNU2dGWkZrS2lWUWpaZy9qbG43QmsweXhVRUtMMnVPNTZuZUEvRXEvc0RE?=
 =?utf-8?B?elhUY2FLZUxqa3JuMDVpU1FERlo2TC8weTJ3MzFOdDZtd1g5a25YQWE5M1VU?=
 =?utf-8?B?OEEzQUlOV3ROay9XVGxuS0xaamxOcklLV2F0Qml3YU5uNjdPNDlxYXN1eW5n?=
 =?utf-8?B?dVY4U21lV1prc2lscGU1Y08yQnFCQ1hWODZyMGdDcWJHVGFremY0SUl6TGo5?=
 =?utf-8?B?cXlMdjZkQ2FQT0Y1eVBMYU5pSGNNWFhiTndnYWJlaDJNbzI4QVhBenV2Q2o0?=
 =?utf-8?B?a0pnTVNMMmdKS1c5MmhCWVhGVFVOakFLQU14aFN3Sk9vcGdLSEl0N1NVV2d6?=
 =?utf-8?Q?DMXuwArc5LQIzR24j/O571mIB0zFnQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3997.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(7416014)(376014)(366016)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UDd1OGl2MG9vaVFnWG4wK0JBK0FqbzdiRjQyWlM4bElYS1lYR3M0SmZva3dG?=
 =?utf-8?B?RjJ4d0FhOXRFREFlZlV1dHNVSm41SDlOOXJTdTNVclkxOHZSdElPak5Kekpz?=
 =?utf-8?B?cnFITUN2NGlYUVR0TFp2T0dKMVYxNlkrV3QxWCtEQmVVY3dibDNCTW1qdkxl?=
 =?utf-8?B?K1BHbERpL2JSQ0YwYnNhQ1Q3T1drdnFzU1VaTUwzUy9SekNPVlRMTFB4ZUZx?=
 =?utf-8?B?MjlSbWo2WGJMcTgzaUtZbldJTG41VTBvZ3pwOWpBcVZncW1jWFpid05iMHV6?=
 =?utf-8?B?WnhXOGxERU5RUmlOeS9qejcwakY5aTBkUFYzRlBuN2I3U2xQZE91NkttWEIy?=
 =?utf-8?B?RjQzdXZvNFF2N0JSQnBRUE10RDN4UDBFQ3ZTaGNNWXhRd3BKY3J4MkNhZVFO?=
 =?utf-8?B?UVBhWklDZlR3R3o0NHN1cDdXRlFGYmttbUlHb3NuNExXVnpDVVpEbStvRDJl?=
 =?utf-8?B?RjZRZ0Q1OERWRytHSUl0Y3RCSUFaQS85Zzl1RUxKc0RFY0tQbUFZcXFPL0lj?=
 =?utf-8?B?cS8wbjlIQkkvbXhsSDlVbS8rdkhUOW5xazZ3Ti80bURpak9aNWE5NHNwZkVt?=
 =?utf-8?B?N0psdkRkd1ZOQlA5eG1jSm1nZCtDN0tTcXJtVDVOcjlPdlJ3MlpvUlhRRjRD?=
 =?utf-8?B?bHh1K1I1NVNwN3N5b2VRemlPNUU2MTM2dk9iaTQ1eVB3Q2tXWUswMkR1QVZK?=
 =?utf-8?B?bXNQQXBISFc5M0hSWWh2b29EVndwTUQzZ3NHZmlpOE42a3NxbzdINzdqSlFp?=
 =?utf-8?B?VW5IZS80bldqb0hLS3RsUisyV1QvZ25DOTl5bXZUYlQ3ZW1wNFZhTVJvYjE2?=
 =?utf-8?B?U2x3MEZTL2hWNXE2TzB4NlZYTzRDY1VmRlFKemRuOXUydGx2Y2JGYmkyQUI2?=
 =?utf-8?B?RHgvTk9sN0ZYQnpHL0N0WjJNVTc0T1c5SThkY0k3bVRSWVozWU5GSldvcVor?=
 =?utf-8?B?MTFpa2UzMEhDcVNSZ3pMK1hGMW5ZRWp5RzBxOEtuc0xNODBMdU5ianZtQWlj?=
 =?utf-8?B?YkpJMDBoUW8yMEJWbUkzZy9uNjh5dDE0dlRXMVFYMUt3dElkb2IyeTBSYXgr?=
 =?utf-8?B?ZzI0aWZXZUxXM2JhaWtvWmNRTy8xN1lTNnk4YnJKRHlkSjBIeHJIdXJ1Y2x6?=
 =?utf-8?B?WWhoVEVHQjNLT3dXUHFGUUhtbUNsVTZOb2RVSGRrY24ycnNKYklWRm01SklE?=
 =?utf-8?B?WGVLa1prVldiWVBJU3VjR0VZL1hwZGozYUlRQzB3VDJvemd3OGZkNTNWam9V?=
 =?utf-8?B?b20yTEo2Qk5qdmttcDVnUHN2NXhVZjd5YUNGcTlncnBkTnAwS2NDWmYwYjVs?=
 =?utf-8?B?c1U2SGRJa2k3RlpDUzJ1anYvYitXMW4rWldSNS8xZE5HaDhHR05YTUN4ajRJ?=
 =?utf-8?B?SkNBMFdja2RURERXaU5LdGlINHdXeFFDMmk4Qk1hYUdMZEdyZzF1Vjl3OHdr?=
 =?utf-8?B?VHh3a3VhSXNCOFcwR0xxV1puYlFPd2M5M0doS3o3VlBJWVhQLzZIMVQxdU9a?=
 =?utf-8?B?bEk5QUVIVnV4alY0bDhIcEpiVWQyejF4VXJrakVNTFFUMk1TcktDN3l2TFpq?=
 =?utf-8?B?bFE4dzFqbGZ5d1dYVnFuMFhqaGpQWUV1K0F6WHdzUUU0UWp5ekZnb1MyY2Fk?=
 =?utf-8?B?bjJ2QndOeit0R3FQUktOL1NXOVVYWURlYm1NcTd1SnhkRTZHamJCRzEyVGlH?=
 =?utf-8?B?MmE3M1Q0ODc5Z0JDTzdxWjlSOTZodGlsUW4xbEdIalFjUTRpcmxzQmN2RWo5?=
 =?utf-8?B?TUVPZmg4KzdMNkd4UytSeGQ2ckhQMkRET25QUHI5Tmd4QjVwMmZHSExtU1l5?=
 =?utf-8?B?Unk3RzhFdkhkZ2ZPSElXeVN6LzVpdkVaRmRsRmYzQkNKTGpRRTYrQnBKMW5X?=
 =?utf-8?B?dDZ1aERrZjZJZk5NTG55c3JtSlB6bHc0M05YdlpFemZsSURXSjlHbGw1V1k3?=
 =?utf-8?B?NzVhMldmYXBKSTRQVGlmVjFMb3A1U05hNm41NUppUlF0dGtyUmFBM0ZEaGJV?=
 =?utf-8?B?MStPekQ1a241Qk81RlRKNkl5SXA2RisvNzQwZ3hqcDkrczhqbldTQTBqUStX?=
 =?utf-8?B?SWFieXZ2Q05wOWo3Y0x5NVU0RmVVZ2ZLNTUxZXBwR0lCM1NuMTVxVWpweGV5?=
 =?utf-8?B?ajg4cmNsTHA4SHVSRG1Ob2ZpREYxc0srV2x5UWVmZWhkU3k0cDF6TmtMMHB5?=
 =?utf-8?Q?CXz2MD7b//d8yrShODOeTHEuNMoqQpXrmQHCHbDDNow2?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f480b96-a6b2-4d0a-f821-08de16c398f6
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 08:17:27.5896 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lZ+WZFoNSeRmTwb6A4lJHO5jqo2pgD7T9458S/9EaQP4PPFFiUYLAiOYfnLiCv5SnKKmr6OUnG53jDI2N/68zA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8438
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

There are times where we need to store a constant value defined as a
larger type (e.g. through a binding) into a smaller type, knowing
that the value will fit. Rust, unfortunately, only provides us with the
`as` operator for that effect, that we want to eschew.

Extend the `num` module with functions allowing to perform the
conversion infallibly, at compile time.

Example:

    const FOO_VALUE: u32 = 1;

    // `FOO_VALUE` fits into a `u8`, so the conversion is valid.
    let foo = num::u32_to_u8::<{ FOO_VALUE }>();

We are going to use this feature extensively in Nova.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/num.rs | 49 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/drivers/gpu/nova-core/num.rs b/drivers/gpu/nova-core/num.rs
index b08139ec667c..25fe2e61729e 100644
--- a/drivers/gpu/nova-core/num.rs
+++ b/drivers/gpu/nova-core/num.rs
@@ -161,3 +161,52 @@ fn into_safe_cast(self) -> T {
         T::from_safe_cast(self)
     }
 }
+
+macro_rules! impl_const_into {
+    ($from:ty => { $($into:ty),* }) => {
+        $(
+        paste! {
+            #[doc = ::core::concat!(
+                "Performs a build-time safe conversion of a [`",
+                ::core::stringify!($from),
+                "`] constant value into a [`",
+                ::core::stringify!($into),
+                "`].")]
+            ///
+            /// This checks at compile-time that the conversion is lossless, and triggers a build
+            /// error if it isn't.
+            ///
+            /// # Examples
+            ///
+            /// ```
+            /// use kernel::num;
+            ///
+            /// // Succeeds because the value of the source fits into the destination's type.
+            #[doc = ::core::concat!(
+                "assert_eq!(num::",
+                ::core::stringify!($from),
+                "_into_",
+                ::core::stringify!($into),
+                "(1",
+                ::core::stringify!($from),
+                "), 1",
+                ::core::stringify!($into),
+                ");")]
+            /// ```
+            #[allow(unused)]
+            pub(crate) const fn [<$from _into_ $into>]<const N: $from>() -> $into {
+                if N > $into::MAX as $from {
+                    build_error!("Value overflow.");
+                } else {
+                    N as $into
+                }
+            }
+        }
+        )*
+    };
+}
+
+impl_const_into!(usize => { u8, u16, u32 });
+impl_const_into!(u64 => { u8, u16, u32 });
+impl_const_into!(u32 => { u8, u16 });
+impl_const_into!(u16 => { u8 });

-- 
2.51.0

