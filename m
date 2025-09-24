Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F33EB9B1A8
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 19:46:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C17D910E24D;
	Wed, 24 Sep 2025 17:46:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="iKnZE+de";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010009.outbound.protection.outlook.com [52.101.201.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5236B10E24D;
 Wed, 24 Sep 2025 17:46:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KBm7nXijZG7EVTY4LnLyTUdCWHutAuyK7Xq3bFErDDXzX1hsx2X4B5nYLpo9A5KC1nvzciSRmbhR08ebKVLsrKhq3oNGTHL03wIuywMwXJNt+KNZHA6HBg0OndsjchrEuB/Ol2ZYtoQbgD0oeuJDe9PiVXXoJPIERSVRG5u719asdG9bjzH1CifmIiX3ulmO29BJxlwE6efZlx9BZHBF30JmA2pSundPaHsjiJNdGfV5NDgWPZ+pxBjfC4xyWXkaIduS8AMmXDla5pkzjLpktQil4uvZkUE9mK+8dI/qanP48AqKVCxK7EuWGMHm8NCMu2ugn/K9vfoYoIWAKIpbJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AfBU/26vx5iUxmA6p8bQ3bGqeUzfH5nqJoeUwbZCo68=;
 b=XvxU9xVkdij87oC8Q8OMgKlvw0iv5l+h1vFLiz5BQVoWSZi46RWKJsOLLExrS8SG1pnJTTC0qTUDWdXfko/Vi6C+6urxTXMb/nYoJLd76fp5Jbcs4D/TpjVwU3MPj22R0XR8kKXZnyoWSFNganGyb+qlTOweCg1C+GWZ+5XKJYN/HmSc/5X3PhrYnoM0mGMYbhPT/6LJrZeAaA608/X4s7FBUJE5RSsfZmy/cnz2LRwQ0RgydnLYgLchFJ7wNuwHYQY6rjEXKFC4v2AzqlLtATXOWgpyO//FKXiUp4qDop1OirHaak6PGKvBYZ0g0ecOvDtz/fcvN20FhkxWZHqUwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AfBU/26vx5iUxmA6p8bQ3bGqeUzfH5nqJoeUwbZCo68=;
 b=iKnZE+detI7xXJiPudzm/LXSx32cqTHVHyv4IoGfWeb/AzTB5tmYE5Fui4oksWm45s9S1WCdWLLe0+KSTUnQycQKgG0A8gi38TquGjXjdK1FZWF5OwYWG8pTlQuJ/IxNRtPVNpMiTsb8KwYGNbqnlbCrHaCdn/edOq3Jnpfui0L6yj+vYicUKDN3q11pkudiiR3iusC3bzQpmD5SXG7GAjuJTIHV7zkxxsh6aJK6Ah39FK6Uh7jnMeahqr/+oLTXUr43e8f+zim+Q8fG+qpo7fDJ8eUoHTVTpSaTHNLUzfl6q1apdzbsBsXvN1+LzlQbkvGdqcgtJNU1pmaoxyjoQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CY8PR12MB7732.namprd12.prod.outlook.com (2603:10b6:930:87::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 17:46:25 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9137.018; Wed, 24 Sep 2025
 17:46:25 +0000
Message-ID: <2979b6b8-ebdb-43cf-ba3a-5d428101f74b@nvidia.com>
Date: Wed, 24 Sep 2025 19:46:19 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/6] nova-core: bitfield: Move bitfield-specific code
 from register! into new macro
To: Yury Norov <yury.norov@gmail.com>, Greg KH <gregkh@linuxfoundation.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Benno Lossin <lossin@kernel.org>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, acourbot@nvidia.com,
 Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>, nouveau@lists.freedesktop.org
References: <20250920182232.2095101-1-joelagnelf@nvidia.com>
 <20250920182232.2095101-2-joelagnelf@nvidia.com>
 <2025092157-pauper-snap-aad1@gregkh> <DCYHCLM67KRZ.366VS9PDKLYKY@kernel.org>
 <2025092125-urban-muppet-1c2f@gregkh> <DCYIX8URVIWM.2ZK3GHH3J82XQ@kernel.org>
 <2025092432-entrust-citizen-0232@gregkh> <aNQCVslEIHHSm8f5@yury>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <aNQCVslEIHHSm8f5@yury>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0135.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:36e::6) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|CY8PR12MB7732:EE_
X-MS-Office365-Filtering-Correlation-Id: 939f0585-e9d0-4d22-73e6-08ddfb924828
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UHp6OHZkMWtNSmR2SWJ3ZVhZc21SZUszdCt0MXMxMCtjU3pORmp0ZWpTUHFO?=
 =?utf-8?B?MDlQbXY4YWZqRERWYndhZlc5a0JBa1QyRitaemMvL3pjWVpjNVNVYjRvOXhJ?=
 =?utf-8?B?aE5oZGc1MTQwREY1Z1FMT1Z3K2dGbFFpOUdCUTUwVUZsZWMyZDdFdDQyV1pO?=
 =?utf-8?B?Q2lVYUlldnlBZ0FhdUlsMTBNUWdVSGsydDdmU2FXOHpzTUpKTlFXdk9PNzc0?=
 =?utf-8?B?QVpjdGdUNWZnY1IvcThIRkFJdDhRK0NpZHNzNm5hOEFEZWcwY3FUaFNNZVZk?=
 =?utf-8?B?c0Frd3JZU3JUVkdpSk5yWXhwaG14RFF2VXZtUWJFWnFnai8yQ0V3WFFpb2Y0?=
 =?utf-8?B?cWRneThKZW5iRW52Wkh3cFVzZldSVWZ4aExJZEhDSHp1eWFndTRiMVM3c2lT?=
 =?utf-8?B?NDhFYVJQWFArSG0zNmZuL1M4TC85Z1BpRDRyUW5qZTl4TkNkd3U3RkZacG9n?=
 =?utf-8?B?MERpMzQ4a0djakVjOEgxYmtMa0FmU1Y4UEpvTklnWEpYOVV1eVRIUXpkUWJJ?=
 =?utf-8?B?Mjg4QnloRlZKL01hbzBzTG9wWHZqY2JvMENsUHFUUDVUWlFkYVpYcmo2d253?=
 =?utf-8?B?OTE0RFBqYWJ1Q2M1S0JxMzlBUDdLVEVRWllXUjVNbVVQL3RPR0ptNzFPWnpP?=
 =?utf-8?B?QXZjWXp3cUE1Q3dxdXpHZHYwUTdsTDhKM3UzVEtrTW9BSmRZV2JlTUxBd09p?=
 =?utf-8?B?S0pNZGRFbXVUdGV5VFJkaVVQR0R3cUg2RnBZNzR6Q2lKUWFLK0ErU0xWamZT?=
 =?utf-8?B?NXRsRy9Rb25ENWZUODkxV3M1dFdIdHdQYmIyV1A3NGtxNFI5eDdLTHN6ZGpr?=
 =?utf-8?B?NFpOdTlJYko0Vk9McG1pK242dUdRR2p5OFRpNnU5VE5qYVRicXZDWU5yTnhH?=
 =?utf-8?B?NE95Zm9zMW16b20rOHRzN1h3RFdFVU1UclA0RTlEUy9ENy96QXNaRG5GdDZ6?=
 =?utf-8?B?b1NFcHdvU1dCalZGVUh3UjZHaC9jNzVsVmJMbWhydE05RHovbUo4N0lEOGZG?=
 =?utf-8?B?bEJJNDh3REFHTVQxUDBMdmVaN005ZzJ5SExVQXFMS0hEb3BrYmV2UzdsVGVv?=
 =?utf-8?B?anVpWStYcUVsUkhDY3M0aVNEMFVZcGwxTzJQZXhTb1ZxOUUrTk5XZmR3WFph?=
 =?utf-8?B?U0NWTW5uS3M2N2UvSExZVGlFcUtkWElIYzJVWENjbUdZRWVVTFpTMFg3cGY5?=
 =?utf-8?B?YUxtUmR1WmJhMi9GWmNxLzluSHE3NDVsL2F2VE9wMzloaVhqVjBkUGVEaEFa?=
 =?utf-8?B?ZFNmaFQ5Vm5XUkJSbXRoNzJTOU83TDh6Lzk5OHNIWUc0TnREQ1BEUWxITXVE?=
 =?utf-8?B?bTJkZGJuY1dDR0E2WTNnSDVRaTdibGpaNm5aMWs2K01UN3FaMHVoK3JNSEU4?=
 =?utf-8?B?MEhWblBSQUR4L2V4SVJPdlhkZS81WlZYU0FtUkZzTWgyY2dNSjh0UEJVeTRX?=
 =?utf-8?B?WlFYU2dnMnlmQzYvTHByeHZkN3FhempXd2RsWHpGVHFMK1ZKM3E2RVlsaTFD?=
 =?utf-8?B?UUFESTFSMnFzNzNKQnplUTFXcjJIS24xRmVCMHNNUzF6MmR4WTU0TGNKRlpD?=
 =?utf-8?B?WDBoN2NDejV5VjNGQXVCYm4zUGxqYXB6WlM5RUNqbFBGSGJGNjJreXpkKzRq?=
 =?utf-8?B?WUxJUWNSU1dPZGlYeG5CZHdINXdtOGNhbUtTZndNRm9hNllmYTF6RXA0V0JH?=
 =?utf-8?B?RmJ1WXlkUy9jSjZWdHF0MEVkSGE5Rk5zSkpNNDVvUDdUQk5PMDZtMUtwcm1o?=
 =?utf-8?B?TlVDSGJ1eTY0OVJMeVN1NXk2VkJkUFpWVS84bG5nbGppSmJKV3g5WUJKOVJ5?=
 =?utf-8?B?dnhjcDRkSWZWWENIczhBbVNIN1RVWDJMMHlIaFJTc3IzNjMwVFJRZlpKcU1m?=
 =?utf-8?B?LzJJR0NuaXd1bmRJc1RqeXBVT1RENm05YndJZk8ydXFaelVMbTZpMGhBSk1Y?=
 =?utf-8?Q?s/T6pr6wtSs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eU9IOCs3bk14b29UUi9lajZtTDEvMCs1Y0ZUOGlvdVFvUE1TL3FrTzJ5L1Zy?=
 =?utf-8?B?OWQwSGhTRlRLZmhSaDJJSS9VaXRZWGJkTHBXNEtlOVVRU1hYdGRkUWZMdFFs?=
 =?utf-8?B?eWtzbFdQdjZDcXFEcGVJSWEyRTFKMUtwU3J6bVB4bGxLNm9RQ1oxcWVDb1Vr?=
 =?utf-8?B?UEVRTCtwQlQyUjN1VERUbHFtRUllSzFKZ1JYZnRvbFBXalpkNXE5a2VNYWFF?=
 =?utf-8?B?WXR4UE4xNmFHY0VqZlQ3WWo4QTRQTE8vOGxJU0VuNFg2TXJKUkdYZzJENXNx?=
 =?utf-8?B?b2hyT0ZJWnNWczY3RFRwRFN6WDd5TVljSXQxdTNNbXVOZGxTZXZFQXoyWWZa?=
 =?utf-8?B?MDVpcTB5MnZVOVZLb3l0Z29ldFV3akJNajBSclJ5K2plYmw2YjFKY2NWVmJa?=
 =?utf-8?B?OVZMeDVPVVorYlVUT1ZDMnE4UnBJdzl1OVlRTUdmS2M1YmZncW13UVlRcjlO?=
 =?utf-8?B?K1VWWVFvQmI5S0dVYzkzOGkyVUhHWEIyVmhQUnJqVHYzd1NiN2FrQ0dIQ3Jj?=
 =?utf-8?B?ZWJSbEFhdEx0SzRwOExTN0cxMVVJbW1BbDd1VFRpOUVVb1l3OXEweGxMUTlU?=
 =?utf-8?B?bG5sK1I1b1JjejBhYzNFN1ZhYmRvZU5XeU8rM3gzelNWMG5iLzFjMVFKT2dy?=
 =?utf-8?B?aGdOR0ZPN09tUjZjRm5qQWFQcGEzQit2MmlkMmF0NzBBNGtlaEpwVlNuUkZJ?=
 =?utf-8?B?ZThLSEJHTDJocHJ6NzNiQ0JzdTkrYUF4Zjd2ZHFKYStiOWFWeGN4TVNlalpo?=
 =?utf-8?B?UnNNZm40eVFMdVJLU29FVXY5clluUXJrZlc5T1JKZ1YyQ3FLS2RkUDlUWjRX?=
 =?utf-8?B?cG1qNG05R3pOSmFWbiszUjkvcDFyRzUvUUF2VlZwUUdJRUF6Mmd3K0t3ZDV6?=
 =?utf-8?B?MEswaFBLU3RmOXd3bVpHdWxLRjR0TzI0b3hnWUJqQ3NyVW9SckNrVEhGaGJX?=
 =?utf-8?B?SXNzVCtUeGR5WXJiMnoxNU1tQXlkTlFGdkpST3pENUtPWmZYSEF0c2tVMVFT?=
 =?utf-8?B?YWdJSGlrSDRyQ09rZC9iK0syVTRoNjQxZjZnVDBMK0J0YnVIMmM4YXJtUVZn?=
 =?utf-8?B?Zmd4czFNQzh0R1NpWUl4YVYva3JmMFRvMWZXMWRSZGlkUDlCT0FEK2RtMGZR?=
 =?utf-8?B?akROYXZtNWFIWjRHTk1MdXE5b0sxZ3g4d1ZZa0pMeWNYRmE3R1N1a0NWcDAy?=
 =?utf-8?B?dmFrQ2lPWi95V2VvWlErWnRieXpiSmt0Ti9mWTB5ZTR2WGlxZFgrdGJqUnNJ?=
 =?utf-8?B?bTkxVTRoUE5HdHdhQmxTMVRhbUo4eVNXN1VXWHduUHFZdEduOTBBaVllbW1h?=
 =?utf-8?B?WGN0SHAvZlN0RnFIZWJ1WGQ1YUxiMzdncHZQL2EzdnVWb3ZpOTY2aGxBcXlO?=
 =?utf-8?B?blRsSmk0Y1RUTTUyTGtsUmREak5selUzNnprZEFLTm9XcFFSZlVhMlp5Yk45?=
 =?utf-8?B?QWhvZTh1Vmx2R1d5bEd6cTUwK0IwanVBYVZremFXdEovSnFjMjBuQjBoL0dZ?=
 =?utf-8?B?Nko2LzFKY080aS92Vkw0bWtPWVlDNTFIMVd6eHZmandhZGpCOUorQU5sOUNT?=
 =?utf-8?B?LzlVbXpoY3RIQVhvdHlYTHZ4RnBNTjV0Unlibzh0N2NoNHcySXpWdktMSmxm?=
 =?utf-8?B?a3p1cmNZMWYvNWw4VmYwVEM2UllOVkJyM2JjaUx0Mm45STZRWXdBRDNUUzUw?=
 =?utf-8?B?a1RUM0RxdjZsZHRnZ3dEQXVjUVA2NW9IK0tsNmVyODI2M2pnUk1yOVVIT1RQ?=
 =?utf-8?B?SE03a2R1VEc3MjI1blY0b1JQSW4xL0d3bVdaTGNKR1phQXNZZDhRN0VIdmxM?=
 =?utf-8?B?akpiRjFKaDcyeWdJSENDSmQ4UzNTWWx4V0lqbFJwdWI0SFlIdjJmYlhMcyts?=
 =?utf-8?B?ZUJ2V2FtYWNhR29ITmd2UkhucG9hbWFEWHZkTkZ0M0xYNE5ES1pHQTlQeG1D?=
 =?utf-8?B?MlNaR3RmWkJPdVpqSHIxdEJmdDRrRnpSWkRjSDR2QUhJV0pzcU5sV2EzTk5j?=
 =?utf-8?B?SW54WXFrYWloV0JnRFlKaEdicXdNMGpkMnA5Z1Z4UzMvOWg1allGcjk3bHVx?=
 =?utf-8?B?ZWJkRXgvQ0xmVUQzT0tHeTlxVTg0bC8rNjJzS0g5bkVGUVJKRXBjVzNpOEw5?=
 =?utf-8?Q?sVpF4PfKtGBZOw8o4nMSLhM8M?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 939f0585-e9d0-4d22-73e6-08ddfb924828
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 17:46:25.3779 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VUMJvr+b2IJeWpMfoJUePk+wv3w1JZr4VSI0hm+C3VMwW0k0heXN6uWsUiD4VN0qEo39pVBYR22T1e1Ysfwd7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7732
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



On 9/24/2025 4:38 PM, Yury Norov wrote:
> On Wed, Sep 24, 2025 at 12:52:41PM +0200, Greg KH wrote:
>> On Sun, Sep 21, 2025 at 03:47:55PM +0200, Danilo Krummrich wrote:
>>> On Sun Sep 21, 2025 at 2:45 PM CEST, Greg KH wrote:
>>>> Again, regmap handles this all just fine, why not just make bindings to
>>>> that api here instead?
>>>
>>> The idea is to use this for the register!() macro, e.g.
>>>
>>> 	register!(NV_PMC_BOOT_0 @ 0x00000000, "Basic revision information about the GPU" {
>>> 	    28:24   architecture_0 as u8, "Lower bits of the architecture";
>>> 	    23:20   implementation as u8, "Implementation version of the architecture";
>>> 	    8:8     architecture_1 as u8, "MSB of the architecture";
>>> 	    7:4     major_revision as u8, "Major revision of the chip";
>>> 	    3:0     minor_revision as u8, "Minor revision of the chip";
>>> 	});
>>>
>>> (More examples in [1].)
>>
>> Wonderful, but I fail to see where the endian-ness of this is set
>> anywhere.  Am I just missing that?  The regmap api enforces this idea,
>> and so the 
>>
>>>
>>> This generates a structure with the relevant accessors; we can also implement
>>> additional logic, such as:
>>>
>>> 	impl NV_PMC_BOOT_0 {
>>> 	    /// Combines `architecture_0` and `architecture_1` to obtain the architecture of the chip.
>>> 	    pub(crate) fn architecture(self) -> Result<Architecture> {
>>> 	        Architecture::try_from(
>>> 	            self.architecture_0() | (self.architecture_1() << Self::ARCHITECTURE_0_RANGE.len()),
>>> 	        )
>>> 	    }
>>> 	
>>> 	    /// Combines `architecture` and `implementation` to obtain a code unique to the chipset.
>>> 	    pub(crate) fn chipset(self) -> Result<Chipset> {
>>> 	        self.architecture()
>>> 	            .map(|arch| {
>>> 	                ((arch as u32) << Self::IMPLEMENTATION_RANGE.len())
>>> 	                    | u32::from(self.implementation())
>>> 	            })
>>> 	            .and_then(Chipset::try_from)
>>> 	    }
>>> 	}
>>>
>>> This conviniently allows us to read the register with
>>>
>>> 	let boot0 = regs::NV_PMC_BOOT_0::read(bar);
>>>
>>> and obtain an instance of the entire Chipset structure with
>>>
>>> 	let chipset = boot0.chipset()?;
>>>
>>> or pass it to a constructor that creates a Revision instance
>>>
>>> 	let rev = Revision::from_boot0(boot0);
>>>
>>> Analogously it allows us to modify and write registers without having to mess
>>> with error prone shifts, masks and casts, because that code is generated by the
>>> register!() macro. (Of course, unless we have more complicated cases where
>>> multiple fields have to be combined as illustrated above.)
>>>
>>> Note that bar is of type pci::Bar<BAR0_SIZE> where BAR0_SIZE in our case is
>>> SZ_16M.
>>>
>>> However, the type required by read() as generated by the register!() macro
>>> actually only requires something that implements an I/O backend, i.e
>>> kernel::io::Io<SIZE>.
>>>
>>> pci::Bar is a specific implementation of kernel::io::Io.
>>>
>>> With this we can let the actual I/O backend handle the endianness of the bus.
>>
>> Ok, great, but right now it's not doing that from what I am seeing when
>> reading the code.  Shouldn't IoMem::new() take that as an argument?
>>
>> But, that feels odd as our current iomem api in C doesn't care about
>> endian issues at all because it "assumes" that the caller has already
>> handle this properly and all that the caller "wants" is to write/read to
>> some memory chunk and not twiddle bits.
>>
>>> (Actually, we could even implement an I/O backend that uses regmap.)
>>
>> That would probably be best to do eventually as most platform drivers
>> use regmap today as it's the sanest api we have at the moment.
>>
>>> So, I think the register!() stuff is rather orthogonal.
>>
>> I think it's very relevant as people seem to just be "assuming" that all
>> the world (hardware and cpus) are little-endian, while in reality, they
>> are anything but.  As proof, the code that uses this register!() logic
>> today totally ignores endian issues and just assumes that it is both
>> running on a little-endian system, AND the hardware is little-endian.
>>
>> As a crazy example, look at the USB host controllers that at runtime,
>> have to be queried to determine what endian they are running on and the
>> kernel drivers have to handle this "on the fly".  Yes, one can argue
>> that the hardware developers who came up with that should be forced to
>> write the drivers as penance for such sins, but in the end, it's us that
>> has to deal with it...
>>
>> So ignoring it will get us quite a ways forward with controlling sane
>> hardware on sane systems, but when s390 finally realizes they can be
>> writing their drivers in rust, we are going to have to have these
>> conversations again :)
> 
> Hi Greg, all,
> 
> Endianess is not the only problem when dealing with registers mapped
> to the memory, right?
> 
> I recall some built-in 12-bit ADCs in 8-bit AVR microcontrollers. That
> required to read 4-bit LO register before 8-bit HI, if you didn't want to
> loose those 4 bits.
> 
> Bitfields don't address that issue as well. In my understanding, it's
> done on purpose: bitfields encapsulate shifts and masks, and don't
> pretend that they are suitable for direct access to a hardware.
> 
> Notice another rust bitfield project. It tries to account for endianess
> and everything else:
> 
> https://docs.rs/bitfield-struct/latest/bitfield_struct/
> 
> I didn't ask explicitly, and maybe it's a good time to ask now: Joel,
> Danilo and everyone, have you considered adopting this project in
> kernel?
> 
> The bitfield_struct builds everything into the structure:
> 
>         use bitfield_struct::bitfield;
>         
>         #[bitfield(u8, order = Msb)]
>         struct MyMsbByte {
>             /// The first field occupies the *most* significant bits
>             #[bits(4)]
>             kind: usize,
>             system: bool,
>             #[bits(2)]
>             level: usize,
>             present: bool
>         }

Thanks for raising this. The syntax seems quite different from what we need, in
particular since register! macro is based on our bitfield! macro, this syntax is
incompatible with the need to specify bit ranges, not just the number of bits.
In other words, it appears the out-of-crate does not satisfy the requirement.
They have to specific 'order' property mainly because they don't have the notion
of bitfield index, just number of bits.

Regarding endianness in that crate, it appears to be configurable based on
user's requirement so we can make it such if needed for any kernel usecases. But
the default in that crate is native-endianness just like our implementation right?

Thanks.

