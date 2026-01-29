Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oFx5AvSsemmv9AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 01:42:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 644C3AA4FC
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 01:42:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D81E10E78F;
	Thu, 29 Jan 2026 00:42:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="BzAhDTpF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010048.outbound.protection.outlook.com
 [52.101.193.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E359010E2F2;
 Thu, 29 Jan 2026 00:42:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uM6mJGRndEvcJvxkzb7Q80pSf9XZ1KkDvzfyc9bIw2cfOFCl9D+zUsF0xHYtR+KTcaTeyZznP6IptDa8bEmXfO3YlflUU1U2ww+xWffwkz/H9CFgWw/8XvL6gMLr044vcDHIPZAASIf+SXN0yc0ghkudxK/D4yb+kqtjiAna7F+Eya/c+dzUpYAX+VFkt9NZdBm/XP8BgccXApumC8So9QSnOcQc+pqe+Xm8fhZQ/7ZZY3Y0/rZ6AF4aQHsvXESaJq34wAsIwTIEmTWhzuq6HkTrRd1GLW8mT/oB08BAjDPxbITz7QMssvZsG7Eg8e7c9f0ISjMaUzPlzplflhSUMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ZoOlK80HSutQxcEqDGE89rHRQHYHj0HZ+FW+ITd8d0=;
 b=Xoi+IJO4/GzIkSHIX/qkBXUrUbM9Aioj8K7igDsbhBhyMYQlWQEnposxnxhxijMu5fntMmNWh6dye/j076hv82mnT4VgXIt+Wp6p2vC26HrFboWcFDyDfhvIZINl+h1n2xlhj06hr/gKYhoV+QGtghyJaknnI+OiPEr8etPVTg6SPJHpVgDd2/fC0qWJAdpuZVcMrbQVYzLo7922q26wtgQOsfZjhoBrIh12VP9hilUtGETNy7DBRcG+ABS40TDnmoJdCJO3EMicn+kyG+UdnQ52eWEy44nM8w42MkN6Qh77JCEUV6U4QjuKRANIIaWS/uqQtr6IfelruAOVQnjdUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ZoOlK80HSutQxcEqDGE89rHRQHYHj0HZ+FW+ITd8d0=;
 b=BzAhDTpFtxx/SKVwVXeeXus/o09ybUikHmEhTD6KWnwgcOnmxWA53y+2XpQGfwOac23aNCh9kwrEZI6wO5YFikuiyoB0EPxSHv9KBlXbxtv6PZcFWNcK2nL04x7z2VyLjxnKXh4CMrAXpK0+wDbFwGWZSjychn3e9rPBO/5ehL8jmR+HZo9pzsKjAxBWCfPla1N9Yn80cGXNwluYUyh3po7b4tYOOyDwzb5MhdpX2Qkfr+LonYEAPTniHYFgQ0EkXBSR2lnS2Oj0o2xka/hXZc+gWI+8fq6S8mPljxlS7dWgGO18Xhxz+56t19Tx/WEmr/XEXeSsIyRMJ8UQ6hVdlA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 DM6PR12MB4089.namprd12.prod.outlook.com (2603:10b6:5:213::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.7; Thu, 29 Jan 2026 00:42:17 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9542.010; Thu, 29 Jan 2026
 00:42:17 +0000
Message-ID: <052eeef2-179c-4b00-9606-24b586e7efd5@nvidia.com>
Date: Wed, 28 Jan 2026 19:42:12 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] gpu: nova-core: use checked arithmetic in FWSEC
 firmware parsing
To: Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Alistair Popple <apopple@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Alex Gaynor <alex.gaynor@gmail.com>, Dirk Behme <dirk.behme@gmail.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20260126202305.2526618-1-joelagnelf@nvidia.com>
 <20260126202305.2526618-2-joelagnelf@nvidia.com>
 <DG0607SU943F.1FDOPYPN38FCS@kernel.org>
 <259bdacf-d16e-4fff-9f6b-f860feb40aa8@nvidia.com>
 <DG0N5PNS1ZQ0.13WMT4XYDXNUS@kernel.org>
 <DG0NI832K0H5.25HYXTD205X7B@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <DG0NI832K0H5.25HYXTD205X7B@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: IA4P221CA0011.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:559::14) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|DM6PR12MB4089:EE_
X-MS-Office365-Filtering-Correlation-Id: 8afde174-34df-4eee-8a89-08de5ecf4085
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OGh2MHpoWkFjTDlLYkhhQkdRMXJiQVl1Ulo1Ukc0K2h3cmdhS2JkbVRGcjZC?=
 =?utf-8?B?RmJnQ1NPV2tjRXMxdU9Zc0tSZnNkTWZPSklDejAwNVkwbzFKemFnckdtbWs3?=
 =?utf-8?B?OCtmcUtuVW5sZkwyekdZaU5EYk1ieGJCWlRFTkI5cTJsa1NVS1IxcmZNWWho?=
 =?utf-8?B?cXJxNEprdHdIaU1xRXhKbE1wQkZuZCtxeXAzdlNTM3ZNSWFVZUpQV2RlSmhK?=
 =?utf-8?B?bGNBNkNGdXN4SlpYa09NOGoyd1pPUE5BQlZIb0FmTm5mTnN0Y2g2N1hIbzlN?=
 =?utf-8?B?YVFNZ1h2YXFYNEFPQmJTOTlMcGRQR0JnN1lrMTJDYSttUkI2a1drdVBDa2lu?=
 =?utf-8?B?UUM1UERQWkMzWmtDMTdnbmpiQXVxdEsrMWxwMGtNVTVLVjBOeHlYYXA0eVFY?=
 =?utf-8?B?RE11QkZGQlNLU0pmem12RGxuSUcxYW5XSFhqR2dtcWduejNXRzgwR2hJN3Fu?=
 =?utf-8?B?RkN2dVYxeUdQOHl4R21HM2gyT0hKamlZS2I5MmVSVXVvS1N2bU0rdmxSd3k5?=
 =?utf-8?B?NEptWDRCT2hjaHpUY0hZMXFqZFJydEMyQ1QvOXF1R1JKWmxEL3VpRkVUSVo0?=
 =?utf-8?B?dlZxWUtwd0w2Qjg5REJIWVdjeUtaY1RhTU10VTU4Yk91ZnM4MUt0OVJlS3Zk?=
 =?utf-8?B?SHY1ei9xcVpwbk1CRTNLbmNPeEtKU1lpejJlRWc1SENnNENOZnBFWERZTzE1?=
 =?utf-8?B?UzY3a0lNdmRnK1duTmJKNlhGZXFCZ25ibGxOaTFkd0NYQmJzZUFXNllpQzc3?=
 =?utf-8?B?WEhMQ3dRSnZMaGlhbk05dENwT01TNThYcnQ4bUk3azlBMEI2MFNGNmt5OExa?=
 =?utf-8?B?MWUvMDVvQkhLUFFCSDhRcXBiN0MySG44d3dWMU94dUJ5eDYrVEdCZVNJckRP?=
 =?utf-8?B?dTVjSDNUUmRKSi9qQTJ3dFQ0Z1RBR2s0TVIzQnZNUkhjMDB0RC9ORmh4a20w?=
 =?utf-8?B?Z29VV050UU5abWFEQ21RZ01VN0VrRmxCYkhZZzFvMkIrTmJFTzBla1c2cXpz?=
 =?utf-8?B?NWJNcWpLSnlDYkRrQjRvTzE1TnlWTFI1ZjdZejdkWnlsVW5aZDBWQXhpN0Vu?=
 =?utf-8?B?SXY4VXdVSnM2cWxUSnhCc0FURFBqQmNoUTZvYnM4V2taQlJuclJLM0RqVkVh?=
 =?utf-8?B?aUZrMXFtSmJDVEV3RDF6OFArOE00c2oyMzEySkhOeUsyOTBtVnZrb2I3S2Zk?=
 =?utf-8?B?d3FHRkFCekZjb2p6QS9uVUw0dFNJVDh2MWZaUXJrYndxM2VuMjd0V0xCZS9O?=
 =?utf-8?B?bWRQS3AwNlRxM093aFhmYnBnL2pPVmxDdGVmOUFaSXZ0RzR6bDFKNG9LNi9L?=
 =?utf-8?B?MWI0ZVBGOVQzM2VBOGRmOEVCZlY0MzYvelJsNFZPUC9VTjBzRXVRQXNHZGRS?=
 =?utf-8?B?NFI1N0hhK3Z0NUViYS85SURtTXo3bkJIN05iNTdNUkVDT3RZMjE3U08rSUZM?=
 =?utf-8?B?aHVhMDRENUdQS0t5di84N3ZmVTF5eHljM3RYaWUrRDdUL2E4cDJiY1V3WDhv?=
 =?utf-8?B?aXpKU2NTYTMvSzFxWTA0QWdkODBuaHAxZllsZ3JpMGJzbzROckx5cldoZXVl?=
 =?utf-8?B?ODZtR1pvdncxL1RtWDhQbis3ckxwUllsYm43UEFVMGlpNGpLemcrTUpTQVZj?=
 =?utf-8?B?L3B5R3lQaklTRi9uMytyUnloeTgxUnpFL2VkZ0J1ZmEvQm1LbmUza3RSUEZN?=
 =?utf-8?B?RXNObmVSeHpDOTVXYkNTbWF5WGtiS3BUcDhJeWgwMXF1N3RtNjl0ZHNKMzZ6?=
 =?utf-8?B?dElGbzNzM1lnNHlYZFdJaDhqWVk1VXJjU0pPRk9wVG1kN2sxWmt3a1M2cGhD?=
 =?utf-8?B?a01HRkVyTk9sV3BRa2tIM3NjK2UxNWNQdWVoM3N4dnlxZFNiS1Bob1A5ZXNo?=
 =?utf-8?B?dEc0R3ROdUdhUlE0VlVubEVSSjl0blhYOGtQU25KVFQ2MlcyWmVPU3QvNnJW?=
 =?utf-8?B?cG5BeC9HdldwUXhTWU02UFlhTjY2L0ZYOVhGcEduVW9rekhsNlpkUGFVOUNk?=
 =?utf-8?B?TEhxRHM0VVdRNUZpOXJQa1RMNkNUcmMrZG0yenFjTW9hT1AxUmtlUG5Yd0tv?=
 =?utf-8?B?RjcxSzdGdVlnbVBHazZjOXVSek85aG56RU0ydm93czlEWmVVSmVlUDFwK3Bs?=
 =?utf-8?Q?DZVk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVlRRld5OU5HeWlrY29aUjlDZjdQQU1WKzZYNm1pZkFKaWJheWp6bGl2ZHN1?=
 =?utf-8?B?SHFUOGRZcDRBQlZadzdlZTExMnkrYXJkRi81eTdNOENUc1Y1dFRjZnZKSHRJ?=
 =?utf-8?B?b1FWbERoYmdLbTl3Q3ZyMHdqUE1zakpNamV1R1Bkckh4dEl1V3l4ZzBFZVBj?=
 =?utf-8?B?S1RncFJralJ2WGJZV2FvRHZuYnprZVppbnNzVGlUSjNEWm5HZUhoTWMxcGhT?=
 =?utf-8?B?dUJyek8zR1RBbUMwZW1yaTZkdlJseUlrN09qUklsd0xlNnAyaVkxZWUwVC9N?=
 =?utf-8?B?MU95YlI5NjdvY3hGdjI0enFUUW1MMTRKMzZ2eEdDbDJMdFdkcnRBKzRZRWIw?=
 =?utf-8?B?a1VrQlgyOUMxREFZa3Rod0tVMnU5UnlmdGxTN1hrMVhJS3c1WER4MS9Bc2Rr?=
 =?utf-8?B?YTFIdkVoZjlydE1OTFA1K3lRa0lNQ1BxSXExMlA0ZGNQWWFyd1U2UllWdm5k?=
 =?utf-8?B?em13VUg3WDh2ZXdnUVEveWdQdWtMRW5YTUNrYkgzdGdqS2l2cU9TOGMvcHg3?=
 =?utf-8?B?SEZHWlRlUFpEK0hFd0J6WkpydHNTMmEwU3lZZGZ6RStTQmVyTXdYYkJFRjNj?=
 =?utf-8?B?ZEVZMzlkUUwybkhTbVA1Vitxai8wNThhNGZmVzRxcWZsWmVGWEtRdHhoTGtC?=
 =?utf-8?B?eGxWenV0WGZ2RTc1VG9TZXFGS3h2Y0hSMjVnT3Q0clg1N01Ccy9UUkNaUThj?=
 =?utf-8?B?UjE0Y3NqQ3BteGxIaWJyME5TeGdia3hGNWtKZ3NQWWFXc0UranZSSlJDQmZ1?=
 =?utf-8?B?RDVrT25TR2hxQkkrRUNRb0JYK0V2d2UveG9ONjVtckloand5cDdLVjRoWTR3?=
 =?utf-8?B?VXU4amZKRUYvMzdSQ2FIdXBidnJOclZpWHp2aktBaHhobk5lZ3J5NHVnd2F2?=
 =?utf-8?B?c0RQWXM0YjhZT3JSd2V4NFE0Y3lJZWVkdXBLTllGS2puUm9FWXRaaFFZNVhv?=
 =?utf-8?B?d3U3V2o5ZW93V3BOT1ZsRzc2bytpZGxucWFoUVYrTG4vZDlhT0IyMVh2c2Zi?=
 =?utf-8?B?OGE2czZ4RStxTVA1T3B4czdXank2ZTRwZVBwZHQvdVg2emdLa0dJOWdRVith?=
 =?utf-8?B?KytEUUYwc2xlb2pqNFBib0RDZG8xOFFLcFRnNm1ySkR0QmtYT21ZYUJoNnpE?=
 =?utf-8?B?VzhlVDhkSlRET1YwcEtQVTM4R3JiczIvazA5aUhGRFgwVGNGVWNTcUVQSXFK?=
 =?utf-8?B?S1luYjloK09mak9uUC9NbEpkZUxRakpXY3psVkQxMXFnYzVCYW5IaUhPY0Uz?=
 =?utf-8?B?ak9zNEZJa2pqbS9lSVRQNXZkR3FJQWdha1ZKZWxjTm41c3I1aDFmV2NTc3gy?=
 =?utf-8?B?dWxxMXcyNFVJSUZ6UU92Q1dRTEl5elFnNmt4Y0MrS1ZVQURmNCtTekozTHFZ?=
 =?utf-8?B?cnpKdkIweGpIZXVyYWVtNVFxNDdrSjNlZW1GbVRXQ2tnV2cxNDRuVmo1WGlE?=
 =?utf-8?B?Z052Si95M3VMdFEvNStXeDdaZlBhZDl2aUUzeUg0L0tveFdDaUlrQzJNL0hY?=
 =?utf-8?B?VlhlKzdlZm1xVmlNNW9IaTMrOWJCdW1hM1V4QzZLcEZRelc0UEE1RmV3WE43?=
 =?utf-8?B?c1BKZFJZeEZXRU5nZXF2RE9EelBNTFEzVkpWcE9NODRlWDNsaWtYVnlXeHFv?=
 =?utf-8?B?ZHlqa0VPdWsvNTgvVVNYdXdvNXAxMnBiVUROQXJFeWZTTytHd1BPTUdsK2Nx?=
 =?utf-8?B?dGpZUUhjSWY5Wnc2bld5SWxQdXc1NG1CY2pJdnJkZEFrRWZkbU5SWW41d3ZP?=
 =?utf-8?B?cDRRV1NGaFFXc3lteTdJUUtoS1JNOVBWTTh4TGtzTDduS3BZWGpsTHRsTHJm?=
 =?utf-8?B?YzlVbWFrNlg2NmR0NWRFMTBaOGxyY010ZjI2UFVVd1B3dXNuWGVvSXg1VUtj?=
 =?utf-8?B?Sk1CZSs5VW1neHlBS2t6UXJqZWp5RWFyWUFZeis4TU0zSHI3N1dOVlc2ckdI?=
 =?utf-8?B?dkM4TkNpVURpK3JmbmNRRU9CZ3dsUnpoeTJGMFZpR0x0UHVEanNCV1RnZ29X?=
 =?utf-8?B?anh6S3Nmd1lZWndBTDFjRUE0T3lPbko0TFcwcjlDUzBXalk4blZRNlFVWVND?=
 =?utf-8?B?NGZ4MFY3dHBqazdwR3hzUHJmNkFnREZDOXhLZHpFeFFKWW5Nc202SzZQTzNx?=
 =?utf-8?B?b2Z0NkR2QW1RRjJobksvSEZ6dzJXWHpQMEZMeGRMZjVhRHpyZGJ5Z2x5UWRm?=
 =?utf-8?B?Uk5reDRhSWh6S1hMSkw5K1ZSVG94dmhrZTF5aFJnNUhNZi81NVA3ZU4xWUJN?=
 =?utf-8?B?d2FxMlg2TlM5czMxcUcrMXVlNGxTamNmTDBDb2pZcm5DSWZPK3BBTjZLOXQ2?=
 =?utf-8?B?WHdBU3gwdnBXKzVqdmZvUStNelBVMUlsdWNDck1Ya1FPQ3BXL0FMQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8afde174-34df-4eee-8a89-08de5ecf4085
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 00:42:16.9186 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ELwt1KkbJ+1TcpRzgbf7PaBlvsb3JIijlGcS3Gj7vVujmnOTqWY183EPQp7T3deDGlw4aUthqTzS1K3z1rVTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4089
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,dabbelt.com,eecs.berkeley.edu,ghiti.fr,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,nvidia.com,ffwll.ch,lists.freedesktop.org,lists.infradead.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 644C3AA4FC
X-Rspamd-Action: no action



On 1/28/2026 7:36 PM, Alexandre Courbot wrote:
> On Thu Jan 29, 2026 at 9:20 AM JST, Danilo Krummrich wrote:
>> On Wed Jan 28, 2026 at 4:14 PM CET, Joel Fernandes wrote:
>>> On 1/28/2026 5:53 AM, Danilo Krummrich wrote:
>>>> On Mon Jan 26, 2026 at 9:23 PM CET, Joel Fernandes wrote:
>>>>> @@ -267,7 +264,12 @@ fn new_fwsec(dev: &Device<device::Bound>, bios: &Vbios, cmd: FwsecCommand) -> Re
>>>>>           let ucode = bios.fwsec_image().ucode(&desc)?;
>>>>>           let mut dma_object = DmaObject::from_data(dev, ucode)?;
>>>>>   
>>>>> -        let hdr_offset = usize::from_safe_cast(desc.imem_load_size() + desc.interface_offset());
>>>>> +        // Compute hdr_offset = imem_load_size + interface_offset.
>>>>
>>>> I do get the idea behind those comments, but are we sure that's really a good
>>>> idea? How do we ensure to keep them up to date in case we have to change the
>>>> code?
>>>>
>>>> If we really want this, I'd at least chose a common syntax, e.g.
>>>>
>>>> 	// CALC: `imem_load_size + interface_offset`
>>>>
>>>> without the variable name the resulting value is assigned to.
>>>>
>>>> But I'd rather prefer to just drop those comments.
>>> The idea of adding these comments was to improve readability. However, I 
>>> can drop them in the v3, that's fine with me.
>>
>> Yeah, that's why I wrote "I get the idea". :) But as I write above, I'm
>> concerned about the comments getting outdated or inconsistent over time.
>>
>> Besides that, it more seems like something your favorite editor should help with
>> instead.
>>
>>> Do you want me to wait for additional comments on this series, or should 
>>> I make the update and repost it?  Thanks,
>>
>> As mentioned, I tend to think we should just drop them, but I'm happy to hear
>> some more opinions on this if any.
> 
> For safety I would keep something like the 
> 
>   // CALC: `imem_load_size + interface_offset`
> 
> you suggested. From simple operations yes, the code would be obvious,
> but there are also more involved computations where order matters and it
> is good to have a reference. These shouldn't change often anyway, and
> the `CALC:` header catches the attention of anyone who would update
> them, similarly to a `SAFETY:` comment.
> 
> If Joel agrees, I will amend the comments accordingly in my staging
> branch.

This approach sounds good to me. I am of the opinion, this "pseudocode comment"
should not change as long as the actual code's changes does not cause arithmetic
changes.

Whatever we decide, thanks for fixing it up Alex.

--
Joel Fernandes

