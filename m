Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F89FA99BBE
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 00:55:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFAF710E704;
	Wed, 23 Apr 2025 22:55:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="S/PQ6YET";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2066.outbound.protection.outlook.com [40.107.243.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A99D610E6FC;
 Wed, 23 Apr 2025 22:54:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SwEjuFtd86C1cRANHrrQKjUmB3mf0Rx19zn5WknBwKj5xhyjwDzftb784G0Yez3y8T/OmMDiL60ccsoElqy7Zi6faQJiGxzziRqlykamvd1HwMOZUZLfLZut8iM8iISXVUGn0yvXHsqfIhpBDzurrUPVTs0q9W4Bdlph3I7UZhk2VHe/O48bkJOGmQeQ10TrSui+LpVIWHm1+Sbt0GbnFa/bjbvY3uOLMkhjR26UKU2NSETrrQZS3i7+dbBgW7TYPXK60sdqRsBbO74mLoaC7qvKqWE8+uzKwn3Wwf8l0oqHxniGJMHCZPZRaI4wkSz48XzUDHAvD8phaL8Yewlhrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Du5IHCP3h1SeKWBFAGevlPV8wkdfq6KQ3lU3PEJL1bg=;
 b=kEc92SZhd0HtlLmbGZ0RDb7yKMwzbX6kOCZBinY0Q2AxQ+KKGqz+QxZturfHB+6EYCVzbZCSy+jK3rTnIy040h8AaXOjhzQ1LnTboTa66c4470iiPZqjasfonNKi1kRf1G5Do+pfmkGeIKtRC7nLs32jn+fRes1uxKkPqMfGcYcIqmVtpWHI0Ym+oamSc/9rnOaYJZ6wXgvExpIhOfjfSlnk+5LvRl8Xpd+NF+9xMKiaJJm45sBlKzlPooaPKoHN8YWr6KRhs2Q81Nn1/HEpiuyHBVNiB1fV/Cy1fteb9ZNGKAF3Yee6or5VuBoSFp1gun9FyklYSQ64KYFX0cjo9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Du5IHCP3h1SeKWBFAGevlPV8wkdfq6KQ3lU3PEJL1bg=;
 b=S/PQ6YETfu+13D/iA5JhJM67/vnpYWSb49Ao4fEkg3U7U1rPRX/b3MLx43bIhH5Q+PJkVEkaHZgopzHfyZ4o0Cde3pFMRPnNVphAObTJs7U+AuCvSFXuHDwxNTDJI5Ys7OypHnHxl/uGeYCJoGoeFgcjYlynoqWJrGe3fFuQ2I6lLLD3ILc9ZSQGvgRef1wz889BhnyDdcVFY5RRVWtWB2iUpUwr/pMkjxc99JSpfqhMhOnf6sq7PrCtSrlNiS8nQCcht4v97D79w0U0A5WS30n1RA5fa8pEX6dtRqGWLV3K1yuEAepW8WEOfYnO1hNlsE7S8fmBT6A9Qo70MowQ1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by PH7PR12MB7841.namprd12.prod.outlook.com (2603:10b6:510:273::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.24; Wed, 23 Apr
 2025 22:54:26 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%6]) with mapi id 15.20.8655.033; Wed, 23 Apr 2025
 22:54:26 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alexandre Courbot <acourbot@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>,
 Shirish Baskaran <sbaskaran@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Ben Skeggs <bskeggs@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 linux-doc@vger.kernel.org
Subject: [PATCH 4/6] nova-core: docs: Document fwsec operation and layout
Date: Wed, 23 Apr 2025 18:54:00 -0400
Message-ID: <20250423225405.139613-5-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250423225405.139613-1-joelagnelf@nvidia.com>
References: <20250423225405.139613-1-joelagnelf@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR02CA0009.namprd02.prod.outlook.com
 (2603:10b6:208:fc::22) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|PH7PR12MB7841:EE_
X-MS-Office365-Filtering-Correlation-Id: 69784aab-5b45-4cba-74cd-08dd82b9cc36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dlFucWF3cDRsSEg4blgrQ0U1S0pPNnh4a21RVU5wV1RXZFJRV2kyeGlOVlVE?=
 =?utf-8?B?SXp0V1hHRk1ELy94SGpMeFYrU3UzcXpVTDZVbDJHNGpOUU14bW1lcVNYR1JG?=
 =?utf-8?B?UzhMNGVwRUkwd0xNcVV5Znk3RE9kL0s5Z0xJOFRIQVBncU5FMHJyRUdOZ3FI?=
 =?utf-8?B?b3NpYTJFNExTMFZEam9oV1BWNTNwWC9mZWFqUkR1UkJQTGdwRk95WDJ3VERQ?=
 =?utf-8?B?eGwxcnN1cnpnNGV3WUFXR0FUSlF1S2JCNVZTak05eEIwdm1MZ0x4b2VyYVhp?=
 =?utf-8?B?akVpNmY5eS9tUFEwOVl6L2pVNW1kZFVhalJyNDRCbTVqVkU2WGNTOENlQzBD?=
 =?utf-8?B?TTk3c3M2Z3MxMllFUCtidUVURlNXTUg3ZzNka2E0TCtZVFZkLzRDRXBGNm9u?=
 =?utf-8?B?eWNuandjSjg4dVZWMFlYYXNzT2V4TWVpbzVtNGVXWDR0dUh6UUJRZ3NXSFk2?=
 =?utf-8?B?U0JNQnk3MGdsdm9veUE0bzdNUHlNUDBSYkpVVjQ2aUJ5SVQ4YWxvbVJ3WFpH?=
 =?utf-8?B?MGJBamZkN25pSkhPclEvZVo5cmFkODh4Vlp4TUNKSUMxN2FGTUtIZ2NaUDI1?=
 =?utf-8?B?eWZaeGIwNHlabW9Ib0hsTWV1WDI4MUQyOWs1eVlZK2VtVUorN09WY1l6NmdI?=
 =?utf-8?B?cTh4MGJONUdvTGtKSTVOTGg0ZkZHbFFkL2hYa0x5blVndmlaOTB5UmJDNC9p?=
 =?utf-8?B?QWc4d2VkSlNDNGRTdFd4cUhpdElja3NBNnBXZ0sxZEtlUzNONTdUZ3laaXBo?=
 =?utf-8?B?UURRY1kxVk5NWW52T3RiTlR6aVpidUVEem5JbmUxa080RTJDQlNJRXBjWDhX?=
 =?utf-8?B?NkFaU1JZV3Q5enVSK0RqMkFWejh0NUtRZjFXN014QnR0S2lTSzZEOFlDaW5a?=
 =?utf-8?B?WUZsRFNpRkN4K0V1OVhZY2NQUm5Xa0pIRHBCQ1NQYnFmQTJQUG5pdnFXdlZD?=
 =?utf-8?B?NWhHazN2OElQaGIydGFCaTR6OVBsUk96TzhtY3gyN0NWVDZ1TTFWV0J4bEIr?=
 =?utf-8?B?UnJrQ3VYclBrMDl5T1RpYkdzTlF5VnY3dEF3YXlaYjltQUc0eHRhVklad1dN?=
 =?utf-8?B?VldjRVpYWHBFd2xjbjJKUDVWMnY4NTdsMDcrWHhXbXhiYWpmSHhHd1paZzVl?=
 =?utf-8?B?cjk1TFBpZGpHdi8xUzlKTGFobnMwYkgrVW9JYzlSVitlZ0l2MEl3Sm93Z1J5?=
 =?utf-8?B?ajVVcXNzcUl4T0lIMjNZeE5DRkJPRTVBNEVYYlluY2pIUnh1WmhwLzEvOGRo?=
 =?utf-8?B?UXpWRVZxMGN6ajl1dUUzbHFVOXViZC92SlFrazRQWk9Lc0ZRKzk3Y0h6eGxT?=
 =?utf-8?B?WjJOZ0RadlZTbEttSVZjTWdKMGpTaVh6R3ZQZWQrWjVDZ2RGNlBiTXJ2akdV?=
 =?utf-8?B?TkE5dTNic1ZKdTNTZTVTMksxUjR2WE5uMzlpdEx0djRQbmZrUHU5cFZhZXU0?=
 =?utf-8?B?TUFhNjArZy9zSVZCQnhJbi9QWEl1Z3g0T0U3TWtsQzBMMytqeHFtbXVkdnYr?=
 =?utf-8?B?eUJWdzFOK3FwbzNlVkc4a2pLM2NIN21zTGlIcWRPSnZZR3pqdlhzcHFhV0RI?=
 =?utf-8?B?Y1RiRUpNMytDM1JhcjZwY3lCU3hRNFJjTDZsQkt4REEvWmhvZnFmbG9mUkdT?=
 =?utf-8?B?bVRUOHJHTmx6YStrRVBwOUdaRG9tbWp3b3FwRHRGaWprS2dSeGl2UjJHaDMy?=
 =?utf-8?B?c3NSZnYxdDIxcWV4b1piR0YweGJEWnkrR3hDWDNoRkgxanpOMDhPMW00YTh1?=
 =?utf-8?B?RXZ5WkRGcVN6aGxoak81Y0JNQ09GWjdqamxtRlhuRXNzYWNDY3JWTEVMalFN?=
 =?utf-8?B?NnIrR3AzQlNmK2VZUWYwTFo0ejVBN3U2eVh2b0Q4bkhXWHkzMkU2ZFZiU1Y2?=
 =?utf-8?B?czk3Z0JLM1FxZVVrTGtkcTBDQ1p3TG9qMnJ1V0JBNkJIQi9DbUFOMzhtQWE2?=
 =?utf-8?Q?qL4nR+NaCs0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YU0wVktaVVZMSCtrVnBRZG1ieUdwRkdZakt3dWRLQzdnQ0owVFppc2JuK21X?=
 =?utf-8?B?cU5MNEJoV0FobmZwVzVSMUptMzJkYjVpZFJxelRQZDN3ZWQvSnMyUjlmandX?=
 =?utf-8?B?Vk1nQzRiRHdYYXVPY1pSNG5yY3gzSVJKZmJBV090ZVJFd1kzT0R2a1VSUTY5?=
 =?utf-8?B?eDdmSXJ3OGR4d1dqQnI4a1B3eVNFa29UR2F1WVJyZ0lZYXdKdlVCS2ZFRUlR?=
 =?utf-8?B?NWRDczVXLzdySWx2S2phRWl2bWFraURqMU5iT1ZQUWJnbFJkRld5YVB4cDBv?=
 =?utf-8?B?SEEzR1M0STQrRzVwTmRka2NMTXpUT055cHRaOTR1ZHVIQjNxVUJqVzRQTzRj?=
 =?utf-8?B?ZEV4OHI5YlJpTXVZM3B3b05OUGVrVkEzbnI4YWtvUDlkTldJTGhtZnFnL3pW?=
 =?utf-8?B?c0RwSEFrTElVWWw3bGV4THRwazRqbXI0UlVHKzRPWnlhUUFoMklqZlB6OGxP?=
 =?utf-8?B?M0YwYW5pcHVvcEg2aC9idXhMRXNDOVorTHRnVVpuYmF0enkvVlIycFlSNjNB?=
 =?utf-8?B?b3pFMEdFRGs4R3NNUVFYdWhBelg4RjBYUE5Cd3RYSUZ4R3ZpbzNuYUZiYUZ1?=
 =?utf-8?B?aDh5bXgxSkROZ1Eyb2lUcTJMQ2hVMUNrcXdhWU1RK1FYRDhQT0JadFpmVDV5?=
 =?utf-8?B?aE1EK0ExYUpvWjI0SzRwL2FGNU0zUS94TmZhekMwdUM5WTY1Y2J4SkR3TDJ5?=
 =?utf-8?B?dlZzNmc4Q09aSU5NV0lSOFVjb1hQUFBhTDZrbitWeXFjTFJtdTJLbEhwendj?=
 =?utf-8?B?TlNaU3k0QnhQTUduMkdleDRna2w1blErektQMTV6cnVnU0ZrYWlTbkdmSEdT?=
 =?utf-8?B?RnF5a1pqK1dlcHhXbjRLL3RlNU1GQUExUGNRbUZ0MmRpUTZlenpXRTYxN1hZ?=
 =?utf-8?B?MjRIU0pQY3BuK21mUllvUTN1SWx0NVhLeGFuNi9PQTFBaWtCKytWcjRRT1VN?=
 =?utf-8?B?UjVaNXp6b2pzaDdvYm8rT1hRd01mZzVNTWZMeVJ4NHVZTk5BbXRVTkhuV2dh?=
 =?utf-8?B?UnlaMzVyZmhZSmFMMW8rTFVnL1BnVmJyY1NNREtMcXJwcWxXUXd4RWVaODlB?=
 =?utf-8?B?c2xIRWJxakRyQ2tWYXZCWFdGZTVxLzlvK0gxL0JOaTRBaWlNTUxiMmpvaEFk?=
 =?utf-8?B?cjZCaWl0RXpVbG04c0twOGVwdzJFUGdQLzdKU3FUbjZXbHpDaWh2a0VEaXo4?=
 =?utf-8?B?bUQ1ODBZUHJkWk45NUFhOEJaN3JtdFBLYlJCK0NGdEdVeURUYU53VlRnZCtL?=
 =?utf-8?B?KzlFNkk5bThTWGx4bXNYUUFsVjVndXc3TFo3Y21mTEV4YUpvdEk0UFpzcnZI?=
 =?utf-8?B?MHhGT2ZDQ1BEYlBzb2NzVll5RzE3WUo1NUgvV2NIOUM5VzlzWDhpVE9lWjB2?=
 =?utf-8?B?WVlDaFNDWHBqREFBOGtzSnlYdG12YVMyeEdaK0pUODArMFZzdXpMZ3pFRDRP?=
 =?utf-8?B?T2g3WHpzTnZnbG4zc2NwQ3h0VmU2bFFUbkx4azFrbnJBV0NpMStpeEdTZWd0?=
 =?utf-8?B?UnVRdzF1QVpSYmtXL1VBQUcxa3hVckVhcnFPVzVNSmlLVTM3aDVDRnNDdlp3?=
 =?utf-8?B?MEkzU2Vkczk2VTlrWGVPUkc3Y1ZMNFpndFMxYzdDOHhHUjZ5eWcyNUtKWmpE?=
 =?utf-8?B?aGRnWWNYZjF5T3Q3OUk1by9TVE1TVGtNUUR2WUVFQWVnaGQwL1ExZmtKUCtE?=
 =?utf-8?B?eFlTc01hOEM4TTc0VW9WUWdtdGp1TFg0Ly9BQjN2ZFpyRjFGbGhmMXl0djBr?=
 =?utf-8?B?dVowSHQ3N21JVTJpcGJCdFcveFpyTC9XUmp5VzZPUnNBMkM2dW8vdDJBM2lW?=
 =?utf-8?B?YkFEclgvTjFzNUdKVy93bnpwQ3FOUERDSndxMTBMWDBCSTdOZ2xTaFp1M3Fz?=
 =?utf-8?B?MjlpdkxQVkxqNzBPZ0hwQkxwdXpsdTNpZTVLbHFtd281aHdqY2p0OXdHVDhi?=
 =?utf-8?B?TWQ3aUdYVlZDQVduemxKQk9lSTB0Vyswb0o1Q1g2UnFSclY2dWZSODNpRUF1?=
 =?utf-8?B?aGpxWFFZWVB0U0FpaFZQWHZHNGNKNW1XU2RwaW12eVZnamY5RTJVUi9BSEF5?=
 =?utf-8?B?VHVFbm1qOERjcGRyUGhibzg5eG9aUTdRaC9BYzQxeTBnM0poWjg5RnJqemQy?=
 =?utf-8?Q?641wFj/jF7MJ13abG2MemHiRV?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69784aab-5b45-4cba-74cd-08dd82b9cc36
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 22:54:26.5059 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ucxNLL7yLe15+/kMTH/4sRIoJAP5fRmMREVUB0yjFZT0zaREft32cP+pxcJ/NMfOCvK+YULK0wnwtVpUmpMhSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7841
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

Add explanation of fwsec with diagrams. This helps clarify how the
nova-core falcon boot works.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 Documentation/gpu/nova/core/fwsec.rst | 173 ++++++++++++++++++++++++++
 Documentation/gpu/nova/core/vbios.rst |   3 +-
 Documentation/gpu/nova/index.rst      |   1 +
 3 files changed, 176 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/gpu/nova/core/fwsec.rst

diff --git a/Documentation/gpu/nova/core/fwsec.rst b/Documentation/gpu/nova/core/fwsec.rst
new file mode 100644
index 000000000000..03d1f0d67414
--- /dev/null
+++ b/Documentation/gpu/nova/core/fwsec.rst
@@ -0,0 +1,173 @@
+.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+=========================
+FWSEC (Firmware Security)
+=========================
+
+The role of FWSEC to provide firmware verification and perform secure operations
+such as carving out the WPR2 region (Write protected region). It is critical to
+the boot sequence of the GPU.
+
+The FWSEC image is located in the VBIOS ROM. For how it is extracted, see vbios.rst
+and the vbios.rs source code.
+
+The Falcon data in the FWSEC image is a combination of headers, data sections
+(DMEM) and instruction code sections (IMEM).
+
+FWSEC itself is a central location for all microcodes in the VBIOS that run on
+various microcontrollers (PMU, SEC, GSP etc) some of which (such as devinit) are
+executed after GPU power-on before the nova-core driver is even loaded.
+
+For the purposes of nova-core driver, the FWSEC contains microcode called
+DMEMMAPPER which executes the "FWSEC-FRTS" command (among other commands it is
+capable of executing) that is executed on the GSP to carve out the WPR2 region
+(Write protected region).
+
+FWSEC Memory Layout
+-------------------
+
+The memory layout of the FWSEC image is as follows (this is using an GA-102
+Ampere GPU as an example and could vary for future GPUs):
+
+┌───────────────────────────────────────────────────────────────┐
+│                         FWSEC image (type 0xE0)               │
+│                                                               │
+│  ┌─────────────────────────────────┐                          │
+│  │     PMU Falcon Ucode Table      │                          │
+│  │     (PmuLookupTable)            │                          │
+│  │  ┌─────────────────────────┐    │                          │
+│  │  │ Table Header            │    │                          │
+│  │  │ - version: 0x01         │    │                          │
+│  │  │ - header_size: 6        │    │                          │
+│  │  │ - entry_size: 6         │    │                          │
+│  │  │ - entry_count: N        │    │                          │
+│  │  │ - desc_version:3(unused)│    │                          │
+│  │  └─────────────────────────┘    │                          │
+│  │         ...                     │                          │
+│  │  ┌─────────────────────────┐    │                          │
+│  │  │ Entry for FWSEC (0x85)  │    │                          │
+│  │  │ (PmuLookupTableEntry)   │    │                          │
+│  │  │ - app_id: 0x85 (FWSEC)  │ ───┼────┐                     │
+│  │  │ - target_id: 0x01 (PMU) │    │    │                     │
+│  │  │ - data: offset ─────────┼────┼────┼───┐                 │
+│  │  └─────────────────────────┘    │    │   │                 │
+│  └─────────────────────────────────┘    │   │                 │
+│                                         │   │                 │
+│                                         │   │                 │
+│  ┌─────────────────────────────────┐    │   │                 │
+│  │     FWSEC Ucode Component       │<───┘   │                 │
+│  │     (aka Falcon data)           │        │                 │
+│  │  ┌─────────────────────────┐    │        │                 │
+│  │  │ FalconUCodeDescV3       │<───┼────────┘                 │
+│  │  │ - hdr                   │    │                          │
+│  │  │ - stored_size           │    │                          │
+│  │  │ - pkc_data_offset       │    │                          │
+│  │  │ - interface_offset ─────┼────┼────────────────┐         │
+│  │  │ - imem_phys_base        │    │                │         │
+│  │  │ - imem_load_size        │    │                │         │
+│  │  │ - imem_virt_base        │    │                │         │
+│  │  │ - dmem_phys_base        │    │                │         │
+│  │  │ - dmem_load_size        │    │                │         │
+│  │  │ - engine_id_mask        │    │                │         │
+│  │  │ - ucode_id              │    │                │         │
+│  │  │ - signature_count       │    │    look up sig │         │
+│  │  │ - signature_versions ───┼────┼─────┐using hal │         │
+│  │  └─────────────────────────┘    │     │          │         │
+│  │         (no gap)                │     │          │         │
+│  │  ┌─────────────────────────┐    │     │          │         │
+│  │  │ Signatures Section      │<───┼─────┘          │         │
+│  │  │ (384 bytes per sig)     │    │                │         │
+│  │  │ - RSA-3K Signature 1    │    │                │         │
+│  │  │ - RSA-3K Signature 2    │    │                │         │
+│  │  │   ...                   │    │                │         │
+│  │  └─────────────────────────┘    │                │         │
+│  │                                 │                │         │
+│  │  ┌─────────────────────────┐    │                │         │
+│  │  │ IMEM Section (Code)     │    │                │         │
+│  │  │                         │    │                │         │
+│  │  │ Contains devinit, fwsec │    │                │         │
+│  │  │ instruction code etc.   │    │                │         │
+│  │  └─────────────────────────┘    │                │         │
+│  │                                 │                │         │
+│  │  ┌─────────────────────────┐    │                │         │
+│  │  │ DMEM Section (Data)     │    │                │         │
+│  │  │                         │    │                │         │
+│  │  │ ┌─────────────────────┐ │    │                │         │
+│  │  │ │ Application         │ │<───┼────────────────┘         │
+│  │  │ │ Interface Table     │ │    │                          │
+│  │  │ │ (FalconAppifHdrV1)  │ │    │                          │
+│  │  │ │ Header:             │ │    │                          │
+│  │  │ │ - version: 0x01     │ │    │                          │
+│  │  │ │ - header_size: 4    │ │    │                          │
+│  │  │ │ - entry_size: 8     │ │    │                          │
+│  │  │ │ - entry_count: N    │ │    │                          │
+│  │  │ │                     │ │    │                          │
+│  │  │ │ Entries:            │ │    │                          │
+│  │  │ │ ┌─────────────────┐ │ │    │                          │
+│  │  │ │ │ DEVINIT (ID 1)  │ │ │    │                          │
+│  │  │ │ │ - id: 0x01      │ │ │    │                          │
+│  │  │ │ │ - dmemOffset X ─┼─┼─┼────┐                          │
+│  │  │ │ └─────────────────┘ │ │    │                          │
+│  │  │ │ ┌─────────────────┐ │ │    │                          │
+│  │  │ │ │ DMEMMAPPER(ID 4)│ │ │    │                          │
+│  │  │ │ │ - id: 0x04      │ │ │    │                          │
+|  |  | | |  (NVFW_FALCON_  | | |    |                          |
+|  |  | | |   APPIF_ID_DMEMMAPPER)   |                          |
+│  │  │ │ │ - dmemOffset Y ─┼─┼─┼────┼─────┐                    │
+│  │  │ │ └─────────────────┘ │ │    │     │                    │
+│  │  │ │ ┌─────────────────┐ │ │    │     │                    │
+│  │  │ │ │ MULTI_FALCON (5)│ │ │    │     │                    │
+│  │  │ │ │ - id: 0x05      │ │ │    │     │    (See note [1])  │
+│  │  │ │ │ - dmemOffset Z ─┼─┼─┼────┼─────┼────────────────┐   │
+│  │  │ │ └─────────────────┘ │ │    │     │                │   │
+│  │  │ └─────────────────────┘ │    │     │                │   │
+│  │  │                         │    │     │                │   │
+│  │  │ ┌─────────────────────┐ │    │     │                │   │
+│  │  │ │ DEVINIT Engine      │<┼────┘     │                │   │
+│  │  │ │ Interface           │ │    │     │                │   │
+│  │  │ └─────────────────────┘ │    │     │                │   │
+│  │  │                         │    │     │                │   │
+│  │  │ ┌─────────────────────┐ │    │     │                │   │
+│  │  │ │ DMEM Mapper (ID 4)  │<┼────+─────┘                │   │
+│  │  │ │ (FalconAppifDmemmapperV3)  |                      |   |
+│  │  │ │ - signature: "DMAP" │ │    │                      |   |
+│  │  │ │ - version: 0x0003   │ │    │                      |   |
+│  │  │ │ - Size: 64 bytes    │ │    │                      |   |
+│  │  │ │ - cmd_in_buffer_off │ │────┼────────────┐         |   |
+│  │  │ │ - cmd_in_buffer_size│ │    │            │         |   |
+│  │  │ │ - cmd_out_buffer_off│ │────┼────────────┼─────┐   |   |
+│  │  │ │ - cmd_out_buffer_sz │ │    │            │     │   |   |
+│  │  │ │ - init_cmd          │ │    │            │     │   |   |
+│  │  │ │ - features          │ │    │            │     │   |   |
+│  │  │ │ - cmd_mask0/1       │ │    │            │     │   V   |
+│  │  │ │ - multiTgtTbl-------┼─┼────+────────────+─────+────┐  │
+│  │  │ └─────────────────────┘ │    │            │     │    │  │
+│  │  │                         │    │            │     │    │  │
+│  │  │ ┌─────────────────────┐ │    │            │     │    │  │
+│  │  │ │ MULTI_FALCON        │<┼────+────────────+─────+────┘  │
+│  │  │ │ - version           │ │    │            │     │       |
+│  │  │ │ - targetId (PMU/SEC)│ │    │            │     │       |
+│  │  │ │ - loadType          │ │    │            │     │       |
+│  │  │ │ - initStack         │ │    │            │     │       |
+│  │  │ └─────────────────────┘ │    │            │     │       |
+│  │  │                         │    │            │     │       |
+│  │  │ ┌─────────────────────┐ │    │            │     │       |
+│  │  │ │ Command Input Buffer│<┼────┼────────────┘     │       |
+│  │  │ │ - Command data      │ │    │                  │       |
+│  │  │ │ - Arguments         │ │    │                  │       |
+│  │  │ └─────────────────────┘ │    │                  │       |
+│  │  │                         │    │                  │       |
+│  │  │ ┌─────────────────────┐ │    │                  │       |
+│  │  │ │ Command Output      │<┼────┼──────────────────┘       |
+│  │  │ │ Buffer              │ │    │                          |
+│  │  │ │ - Results           │ │    │                          |
+│  │  │ │ - Status            │ │    │                          |
+│  │  │ └─────────────────────┘ │    │                          |
+│  │  └─────────────────────────┘    │                          |
+│  └─────────────────────────────────┘                          |
+│                                                               │
+└───────────────────────────────────────────────────────────────┘
+
+Note:
+[1] MULTI_FALCON section in DMEM can either be looked up by
+    MULTI_FALCON App Interface, or from multi_tgt_table entry
+    in DMEM_MAPPER's App Interface.
\ No newline at end of file
diff --git a/Documentation/gpu/nova/core/vbios.rst b/Documentation/gpu/nova/core/vbios.rst
index 17411f21b410..da759b56fb2d 100644
--- a/Documentation/gpu/nova/core/vbios.rst
+++ b/Documentation/gpu/nova/core/vbios.rst
@@ -44,7 +44,8 @@ VBIOS ROM Layout
 
 The VBIOS layout is roughly a series of concatenated images as follows:
 (For more explanations of acronyms, see the detailed descriptions in vbios.rs).
-
+Note: this diagram is using an GA-102 Ampere GPU as an example and could vary
+      for future GPUs.
 ┌────────────────────────────────────────────────────────────────────────┐
 │ VBIOS (Starting at ROM_OFFSET: 0x300000)                               │
 ├────────────────────────────────────────────────────────────────────────┤
diff --git a/Documentation/gpu/nova/index.rst b/Documentation/gpu/nova/index.rst
index 2701b3f4af35..c01dcc5657e2 100644
--- a/Documentation/gpu/nova/index.rst
+++ b/Documentation/gpu/nova/index.rst
@@ -27,4 +27,5 @@ vGPU manager VFIO driver and the nova-drm driver.
    :titlesonly:
 
    core/guidelines
+   core/fwsec
    core/todo
-- 
2.43.0

