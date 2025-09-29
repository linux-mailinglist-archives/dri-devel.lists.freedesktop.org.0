Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37052BAA7EE
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 21:47:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C04910E48A;
	Mon, 29 Sep 2025 19:47:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="a9y625/d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011045.outbound.protection.outlook.com
 [40.93.194.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AAEC10E48A;
 Mon, 29 Sep 2025 19:47:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E8pKRt28j11cRpyuv4YADh66nQT+aISi9Q5j9+Psqtdmrnt288qA1V1pbBimvzN1gSNcLo9SJmiLtiQhYRCOzCmow/5MynDJCQuGZiALnykg/6R6V7gzwqUnJXplgq389EmeAmULTVxSrawe2PNN4G7fJ0Qyb3+zXHymaugHW1hRpB+SglzIXNbJXKDpFEvaEgZgGLWH/mFM41g7xujBwD+OX5FFm5bgnSq0m7U2U7Qpd6igO911HL1kpyJDyqLGfdRc6qWG+NvRZlXe9qIkexXdLmrONolVKZvY0SvL1z376oI9xRiuHrS7F2xJSOKCjmKXqmLQLqjR+nPMXBoing==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zFg8ZP+521vKXoXp7HiNLh7AroZ7dutepQfKmCnTa14=;
 b=al3hpdlN7QqbUSLvTPPrx62lufojseFnkd5EZCuQcpqHbznacqIpuhKCXLCCYu1QSIJvbZnGXPIqkV2hA8HsVoiAs9ZrYIcLJ7BBSkug4CeXG7Ql0Tu24bZ4ahI9ao4zDHs6JZ82sgI1sLkTXVUhF7YT32QXfHOXRAmltabe3iGYGTkaADLoMyWNpGHOJH3ATeZf8thRGK7c7Nx1cHjptMtGyK9CvXfnNkgxvxpMDB8UFCtjJ7NC75AoTACwTS+BUs1bkffVA8kd6jHD/LsqFxGVXhZZvVB0lazKisVV9mpZVeKwTBFZKSgTxiAyPdlKbZT5p53fpoPd4LMEyTTy0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zFg8ZP+521vKXoXp7HiNLh7AroZ7dutepQfKmCnTa14=;
 b=a9y625/dIirV2t1Uaumig8HEaqy/5y0oIbj4R3VIK0jNVcz8MGx8OztXlxnEzL95cTzVGYanOgJqG7T7Zp+XFd+m6G76d/gnaOyggXova96w8CFBCWxWGdd9aDJhS3Xyct/eXMNjv/UD8GFW6pMQEi8+g5uAuZyk/YqEaft+fdM1j/LDhahS4m7vQqoHxPyfB/j+r/4xjfinl8Rd+dCr339KPgieN8qQj9PZ4z2LsvrNuNQQqD56hiuDWI6zqSCMGtYiBxarS97jmhK4NtNXk+qdARBGHM6Uj5K0n5x+9F4VGCUZjw/eocXW2uAW0NKbyND1wCbTJHjvSmHIeQ5lAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by IA0PR12MB8694.namprd12.prod.outlook.com (2603:10b6:208:488::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 19:47:38 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 19:47:38 +0000
Message-ID: <1a55b7ec-bc06-495b-8f94-92ff34b3353d@nvidia.com>
Date: Mon, 29 Sep 2025 15:47:35 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/6] nova-core: bitfield: Add support for different
 storage widths
To: Alexandre Courbot <acourbot@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org
Cc: Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
 Yury Norov <yury.norov@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, nouveau@lists.freedesktop.org
References: <20250920182232.2095101-1-joelagnelf@nvidia.com>
 <20250920182232.2095101-3-joelagnelf@nvidia.com>
 <DD52GXPTVVNN.33HBTCY3RQ681@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <DD52GXPTVVNN.33HBTCY3RQ681@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0162.namprd13.prod.outlook.com
 (2603:10b6:208:2bd::17) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|IA0PR12MB8694:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d319388-1bd3-4078-1c06-08ddff910b7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dHFRMU5WZFFDeFBuZnFrbVlPS0ExRFo3K1g2dXBmQ2pObHdCZzV1eXZUTXFw?=
 =?utf-8?B?bkd5eCtodDlueHliZzZLWFZkTnFxNVlJdlhqNkpac2xTUzJVZEJzbnJob0py?=
 =?utf-8?B?ZVNjRlNTTUFQQjVjUjFVTTlwMU1SR0Q1K3BCWlFNVit6anhJcVhiWHhVWnl6?=
 =?utf-8?B?NEZVZWdHNVAvZnlheGQ2WkN3Y0JzaEpENXVXdU5qaGp4THdUSU9FeEZmdThC?=
 =?utf-8?B?Mm0wdmhlL09jR0FyRS84NjhQa2s4c3JaWkViNDVVTFBVU041dmpqc0k5RlEz?=
 =?utf-8?B?dHpwbUo5eVZ5QVRwamd0RjRFTklVQi9KQ1J5MHU1MCtuWEZZNWZpNEc4UVRa?=
 =?utf-8?B?aS9rZ0JicU15WWFHREdTOFRwVExpcWxYRnN5WjVFZm5HMWJFSnhpb05Jcmps?=
 =?utf-8?B?bmRuRUxjR2xyREh4aGowZ0x5Zzl1M1lsb25kY2p2YXR2MjY3UE1ERXBLQVJZ?=
 =?utf-8?B?dmdjZnpCMmFoUTRKWHZmcS9NRlZGUjBRcUREUnc0QVBEYm1xWGltNzZuaGVQ?=
 =?utf-8?B?TmVoeGVRRzRNOU4yb3pRR1pEM0R3c0VUVUpJMjdCOERkY0xrNmdibHNqMnlx?=
 =?utf-8?B?dEJJdVVMU2E4cGpSaUxNNHZkZFJOajErUDhadzNwTmdGMGpHU1lUT1l1UFA5?=
 =?utf-8?B?TWVOQ1VCZTh1dWxmYzBBZWlLTFNZK29GNnQ1aXduQ3hZZVhTTmN3ZUlDSmFt?=
 =?utf-8?B?Z0VjakFHL2RNa3I4MXFqcnNrZE44NlJ2L2FzSkp2ZzduMVF4bjVoZzcraE5m?=
 =?utf-8?B?N0xkWmMrbHpMREtpVmQyVlhZTFV4dnowVllGMTZQOTdHQXVMSWoxY3VacGVt?=
 =?utf-8?B?Y1Y4cDNRTkxSR05mclhRZWcyNDZWcEV6TDNIcG1oQVpiYnBHV2F3eDhCRmV0?=
 =?utf-8?B?NlVzb251eTNRdUlmQXVaMDQ5Um1ja05xRkhCOFcrL3lqVlNJUmJpUTQrZHpz?=
 =?utf-8?B?YmVQZC9VZjhLVHZ0dkV4WHhrQUlFN2VYWVVKVmwwQWEyTTZNK2NvMTREQ1lo?=
 =?utf-8?B?Z0QwMWxVeUVEM2hnbUoxalQ2VTE3OVNtSGw3Y21acDJ2N1ZVb2VtSEFWSlBj?=
 =?utf-8?B?dXFEMnNBOHBiWXJQY3htS25zTjFhU3k5RTlHYlJHYkRQUHJiYTZxSEFmcW80?=
 =?utf-8?B?OVFLV1VlNGpxbTlYV1lvbnM3ZWJENnpoeVBEVitzempaZHZFNkhYbXU2am1Q?=
 =?utf-8?B?ckRyaDUyNmZEWHY1NUxEZlREa2R5U2h1Yy9kRE16bElKZy95QzJKWUhPeUZK?=
 =?utf-8?B?VHJqV3BkWEtGdS8vTjI2T0xBOXdjK0krOXR6KytFRUhOMVgzcjczQ2tObURP?=
 =?utf-8?B?eGVtdXJiMVd3VEhpNE5wOVVZeDdTcHdiMHdZYWhzTGxTeW5WVXVNV1hQeXRL?=
 =?utf-8?B?YStZSnJQUnhhZ0ZDR3Z5eDN6QWhSMDErUmFLVnRyT0o2UndyelVxNVNKWG1z?=
 =?utf-8?B?VkRtbmJqVlMzczdkR3JHOEhnOE1lVXZQNEI4STNBbE95TlRZRGlGSUpFRnFm?=
 =?utf-8?B?SGJiNVdNZjN0ZFdySnRJMTNEcXFFZGk2QVYyd0hpTFg0UEpKN0xUM1ZzWHlj?=
 =?utf-8?B?Njh6b0dpdGVoajVJZ3pyQ0RlMUExcU4rbEVmaThCTzR2WURRK3JnSXUvQjFO?=
 =?utf-8?B?YUVsMkNNU2tQbTJZQ1Vza2Nka0hWaDJqekk0MzEwVUMxVTQ3UHBSSmJ4cXYv?=
 =?utf-8?B?dHVoa3ZaWnBHV01NUTVzZ0FGckYwNVFrWk5tdmpnR3UrL3AzRi83MlA0Snhn?=
 =?utf-8?B?bXhWNVl6OGY0QXpRQzJEaUMwTWh3VjlhbElOclBzTWVOaHRGaVFZSms3clY1?=
 =?utf-8?B?Qzh4TFJHa0JuVWk5d1RMVVpjbUxSdXM1RzJoZWNCaC9FNFVkUTZ0NEZqTGFj?=
 =?utf-8?B?MkxPQ1lCUHk5cFc3L3Jqb0tMbjZmSnB0OVJGaWhjd2E3Nk9OdFFGTTRHLzF4?=
 =?utf-8?B?NFc2ZDQwb2hhRjZ6Ulg3MDZMWG84V2k1enR5WEpWVTJQdUlJL3dzdkNPdFoy?=
 =?utf-8?B?RHowQWd5VHlnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cEZjNllpNXFiMzU2aEFKSDRFcU5NMlZxQkFJdzdTMzRCTDZyTElseGR2bThk?=
 =?utf-8?B?NS9lY3RCd245cFpOOXY2MjUzWXZYdUhvdTE0Sm1oR0FIQTJHOGlYdGpVMEtZ?=
 =?utf-8?B?b1R3S3Zqb1I1aFF1Wms5MEtqem41MWFPRDV2ckx0bis0dVlxYk9jdmFKVlcz?=
 =?utf-8?B?UjVHQTcxNjBrOGxOYmpBa3lQZUdYSlp2MmJQN21vY0FGcUltMDV1OXJ1VkJm?=
 =?utf-8?B?U0JpRFRUQjIvVlB6TTBFTENYNXg4M05lZlA5WlplUzhHNk5jbDdZOGFHcVZn?=
 =?utf-8?B?OHhQOFRSQ3JsdnFlTk9uVWp4QjdiazJva1lZK3N0b0w0aTd2VDhsbHlRQ0Rm?=
 =?utf-8?B?K0svUGNWSTlEbjhTeHBIZEJINXZ1cXF0VnBYT1VHZHdHY0xlRUMwc1BmSysr?=
 =?utf-8?B?dGY3V3oyK3cwRFRJSy8wR1cvb3BNejA2cGlNNUJ3QjJaQ2wzbExUL1RqRUJH?=
 =?utf-8?B?bUdmK2NaaG8zdmkxb2VHYmVhVDVnYTM2bjVnQTJwNzBiczI1clplcE1adHp6?=
 =?utf-8?B?aXcvZHZRT293RVdwQ1VWN2FIbk52cHJEMlR0OXgyNGRzeW04dEEyZk11MmM1?=
 =?utf-8?B?RmVwYXBWQndMZDlBYm1ScS9wSDBRcWhnQmxPWmUyc1pPMkJVK3ZRdWdoSlFP?=
 =?utf-8?B?dTVZM2VCZWsxYTBLNHlXMk5ZblZPZS9UWDF5V0ZrWlNkNjFrZ0hpNXJQR3Iy?=
 =?utf-8?B?OXJ3WloxY0VBVUJaVTBqWmtUc0dXbFZIaU1sck56YW5kbGxYR1NCRlBGNVpo?=
 =?utf-8?B?ekpNeXdJWDFqVlprRStUTHcrdjVIU3hkYTVTcHkwK0h3eXFvZ2ttN2hlR1M4?=
 =?utf-8?B?YVR4alNQRmRJUmlWNm1ZZmJBbjVFaVJVeDhQTVJOekQ1dlRjL1VQcE5PVU0z?=
 =?utf-8?B?cEI0VHozVlMvTFFkR3YrcjJiL29qRGZsTUZMM3F6TnNZVURpNDZhaFpwd09y?=
 =?utf-8?B?bUhadmZuUUJoc1FWVFlJM2pWSkcwRW9RWmJIR3cwbmd6azVVZlV5SEQ3ZDJJ?=
 =?utf-8?B?K213NSs3eXlPQVVDODd4cW1CZ1BqbXUwWW5GV01HMVhYV3g1TlVpc09Dallw?=
 =?utf-8?B?emhPOTBQNUEvRGJ0b3dYSVFYalR1ZUsydWhSbVVJT3hRN2FhM0ExVkpBY3pX?=
 =?utf-8?B?VmZQSUNWVHEzV1prRHQzNjRVU3Q2OGdEdW1uTEdzbGFwRDFFZ0tEa1RaTCtW?=
 =?utf-8?B?NzhJSGJ0WnB6UW92Zk90elBMbTJVU201Y0hhQ1RrckZRaldjM1M4Q1g1YXVH?=
 =?utf-8?B?NmhaNjVabWdhTkhaR3JZcEZRRVdWL25rNWQ5a2RLV251bCsvZDlhRkdwb3pY?=
 =?utf-8?B?ekQ0STRaK1lyRkFlSFdBUHNDOG4xQnNzMmo2STd5NGh0OVZKdU1hNW5xcDdF?=
 =?utf-8?B?QmgraktzMnQ4aEo4SU02WHFoNWk2QkZMbk1Zb3AxQVdRSS9kVmtsN0ZwVC9L?=
 =?utf-8?B?OEhKSWZVTFMrdXovVHJmSXVodnNRWXNjZXBpZXhVU3Y2aWRrREVlSHlpRkVo?=
 =?utf-8?B?Wi9HTUl2eXJOUk12U0M5L2hKSnM1Rlc4bWNaNysrV3V2QmVmS0V1OWd1MlM4?=
 =?utf-8?B?aWNDazFlaWp4ZWVhTHVrNVlBRnlnN3RhZ1JIYzl0N3h3TzhCZW0wby8wNDVu?=
 =?utf-8?B?bU9PM3hGcmkvV3ZyMHl2ZHlsNVFrRE4wVDZ4bUFlL1BOYmhRblNpMWFvUVZI?=
 =?utf-8?B?N1EwTitsSzB1S1BHN2NDa3E3TXVpYlZ5UWk4U3BuSk82b0grajZNRjdlb21J?=
 =?utf-8?B?OU1CR29ZZkphN1YwcFhEWEt3WTBKaEhzNVQxNitCeGQxaXVrMnM3N1RtRGpx?=
 =?utf-8?B?dFJKalk5aXJGUjFITm5WSHBXL3lSQ3QxbDRNYldtZE54eWtKdGVWZXVQZGVv?=
 =?utf-8?B?ZTkxbmhmUDFQSnRxaE44ZzJCbzZUWk5YT0EwSmZxUS9BWlJDVUhQTmVCMkU3?=
 =?utf-8?B?b0JaZWZhS1JhVm84Z0trZ243anAwajZBLzZtc010clJ1RTQvWU9pK09RSmhZ?=
 =?utf-8?B?c2psV0VkVytxMDl6RExJSHdEdjBQK1RPNEx2Ui9oMVpLUHY0VzNRU0FKby96?=
 =?utf-8?B?YllSNU5wWjBlcFhna2dHNDN4TmhsLzRXWmtSUmI1OURUMEd6bDZiWFoyc095?=
 =?utf-8?Q?Vm52eH6M8M6Dih+K5clgpsXFo?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d319388-1bd3-4078-1c06-08ddff910b7a
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 19:47:38.6479 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aW1Rr9k4au2sEe1XKAzNCPnz9TR/vhGRaV/UAgDEfPM8LNTkNIKaoptxVmmlEEQv6+7EP+siJMDSDSAPvdromw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8694
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



On 9/29/2025 8:22 AM, Alexandre Courbot wrote:
> On Sun Sep 21, 2025 at 3:22 AM JST, Joel Fernandes wrote:
>> Previously, bitfields were hardcoded to use u32 as the underlying
>> storage type.  Add support for different storage types (u8, u16, u32,
>> u64) to the bitfield macro.
>>
>> New syntax is: struct Name: <type ex., u32> { ... }
>>
>> Reviewed-by: Elle Rhumsaa <elle@weathered-steel.dev>
>> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/bitfield.rs    | 71 +++++++++++++++++-----------
>>  drivers/gpu/nova-core/regs/macros.rs | 16 +++----
>>  2 files changed, 52 insertions(+), 35 deletions(-)
>>
>> diff --git a/drivers/gpu/nova-core/bitfield.rs b/drivers/gpu/nova-core/bitfield.rs
>> index ba6b7caa05d9..687ef234be75 100644
>> --- a/drivers/gpu/nova-core/bitfield.rs
>> +++ b/drivers/gpu/nova-core/bitfield.rs
>> @@ -51,7 +51,7 @@
>>  //! }
>>  //!
>>  //! bitfield! {
>> -//!     struct ControlReg {
>> +//!     struct ControlReg: u32 {
> 
> Haven't we agreed in [1] to align the type definition syntax to that of
> an actual Rust struct? E.g. `struct ControlReg(u32)`?
> 
> [1] https://lore.kernel.org/all/3814d6b7-7551-4e8c-b78a-4ac6236eb406@nvidia.com/

Sorry this slipped (conference travel and all :P). I will make the change this
time. Btw v5 also has other changes in addition to this, your review is much
appreciated :)

 - Joel

