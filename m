Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 359EBAA58FC
	for <lists+dri-devel@lfdr.de>; Thu,  1 May 2025 02:22:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CD9810E156;
	Thu,  1 May 2025 00:22:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="cDLmS7RE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2048.outbound.protection.outlook.com [40.107.102.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68F9010E13B;
 Thu,  1 May 2025 00:22:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ShNsy2IPixAtFNmu+pACIOyt5XF+4BiTCIW13QIGQZKYf/CN5QPmAfSZkYqepmNSVkp4VFSK//CRhjKRLpQvRSIqm/9kMEhyMmjKKdDOHNMJyya2jbPvMwcMy1Ul0FbFVEWHbbWuXYO2zzhwnsajFnIJfSh2fS0deEjFKVLMWIGy0pGwRaXqijY3Q8+LH8oHobdwFUcia+6PbeWWNsShj3GGMxI3YZJVUjyt8gHa2rKiZbuwFT2p7e01XHf7RHlDKaHlkVd22bGTEW9V1Ayr9AUaffUxptmJtkubA+/uZN/T01aAYGzCvjeR5LQCh3Yd260xJH0RQnLCQ/zRk0zxTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uZgDsrePgEfT9rvmaKE/OrN8y4UE/XBb2YQWDgjWFLw=;
 b=HMxV2cyi4c1m3SkqZmegXUxyVyARN5TH+z5Pgw0O/c+YSHmmaAXUbs5XkqMYXM1j9UeQ92+dEX+ZXyJAObyhZySzqyscnVtxNydhFE5GRjnoC3rroef9Jq7pXMODtJyzFhbd7IvagT7OV1xlXDSdoPIfsBkorn4LR743o8iN6xTtNRihDIV/9Ea7D7LV4zz6U4+cTNbNXNtvuUd3iTX7mTksWO5/seFPzb6W9hK7CV0xlAiOOccujmq+kF3db5a/b+ZXq7Gh5382O8Blg8ba/HWauvtBrPyGjVo4Gytieah1WiopLLUP6J/rJ/6Xcu+Hu8Zd9fJ4D2qlnVf+F4mjGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uZgDsrePgEfT9rvmaKE/OrN8y4UE/XBb2YQWDgjWFLw=;
 b=cDLmS7RE4YBBxS4aALP8phZZeRJ242cTzZpOhMbKN54oegVY2Wdip5CCVMyeUBGkYGDPKLXiBULPGxttYiKq8L2WZG7KwSEuW5GQVdLccXv426eL193SIDkd6uVif3C1xJS8N6b5vdHzOKCdPX1Uj7gvjTgeuWdk5OhkYlu1NToFIymIzrHHxgXfktre3cy8GIbnxUPK1kLs94T1TFUkc6gXcBVzmWJI6YtZfe9evfEdhl64XP/JHDEUAL5wQZkWzRFfJR6MM4mHWo5aWMb2bipiw5UU232Mr6JEak4eqLU99pNaIJOaqmjTWF6K8GPD93VMVSvgNrC58oiiiPxqbw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by MN0PR12MB6294.namprd12.prod.outlook.com (2603:10b6:208:3c1::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Thu, 1 May
 2025 00:22:20 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8699.021; Thu, 1 May 2025
 00:22:20 +0000
Message-ID: <8cd32991-cb4e-4c07-98b0-ab73c2039250@nvidia.com>
Date: Wed, 30 Apr 2025 20:22:16 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/16] gpu: nova-core: add falcon register definitions and
 base code
To: Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, John Hubbard <jhubbard@nvidia.com>,
 Ben Skeggs <bskeggs@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20250420-nova-frts-v1-0-ecd1cca23963@nvidia.com>
 <20250420-nova-frts-v1-11-ecd1cca23963@nvidia.com>
 <aAerWF9j5d01pQv0@cassiopeiae> <D9K09AU4KTQJ.3TVVZPMDB0H7I@nvidia.com>
 <9977ad2e-ce2d-48b5-a222-f74a821abfeb@nvidia.com> <aBJo9qNDn8xDEwlk@pollux>
 <D9KDYOVU0EG3.2TA8UJHMW66Q6@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <D9KDYOVU0EG3.2TA8UJHMW66Q6@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN8PR04CA0029.namprd04.prod.outlook.com
 (2603:10b6:408:70::42) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|MN0PR12MB6294:EE_
X-MS-Office365-Filtering-Correlation-Id: d0c259cc-9d40-4cb5-189f-08dd88463c8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?azZ5T2c5U080d0tEUEcwSUdtNHdXRENvT1paZmloMys0cjFXSG5QK2I3Njhw?=
 =?utf-8?B?a1E2RU4zT3A5aFN0Qm1UWW1kSHd3RTdOb0Y5Z1F3VEVia1lDeFMzSUVSMnIx?=
 =?utf-8?B?emZsUHhGZXhWWWFNTDhvUE1paHBkdjBXK0UzMTVpL3dpY3ljaHUwcmZzM3cz?=
 =?utf-8?B?Vm9ienBGYjR5aUpkcjU0UWxUcGthaVphTjJSSS9yQi9oTG1LUUdpMUxDQmd5?=
 =?utf-8?B?YURhMzVVaVMyUlBOL1FkS2JaTG5nbmJGd0FlSHhiL0I0YXljWjd6SnF3NFVm?=
 =?utf-8?B?dzR0aXBueDBKY1JkZlZ2aTZhL1Z6SEdtaXpDbDI1MUIwdzhSL0Y3Rko4Tkx1?=
 =?utf-8?B?WjJBdnQvbkJxMVZkYTkzZUlVSklvMEJmY2Z3Y3NpaG53V3hkczJMMVJWUkQ3?=
 =?utf-8?B?dmxQNGkxMlhjdUM5L3hCd1RXVktaankvWWNGU2ZYbHdtZ1ZJYlNyYlI4czBY?=
 =?utf-8?B?dE1uOFY2MTlubER0NnNjbU9xVjY3TjVhajB4QjdIR0pzWmpmcklwUkpSWlda?=
 =?utf-8?B?dHM3OGhoN2NLM0Z4aS9BTldaaHRFS3UyTml3VE9ISGJkcCtrQlhKWFNIUFlP?=
 =?utf-8?B?VzhMS2FwZnc4K3lXWTRDRnZMOFgwM3ZxMjVtK0dqQzNiUFVQMXc3K2l6QUcw?=
 =?utf-8?B?L2MvSU1vRHQ5RFJNM2s4RFg4S2lYMGJFZjBMYnlranNhaXF3SmtTWmNPRVhG?=
 =?utf-8?B?ajEyMXgrSGEvL1Z5RXhBaHJWdThDVGtFOXpnUHYyYS90MkhhZjNwQlRSUHdB?=
 =?utf-8?B?K3J1dFJub1BxVEFKK083SXZGL3pvdUZwYWNlRjdybFJIa1ROWjNlU1NNeDdi?=
 =?utf-8?B?SjlZMlJJdFhOdEV3aUUzRC8rbWsxRlFBTm83ZjIxS2w0d20veEZ3eEcrTk4x?=
 =?utf-8?B?RTVWcUt6d1hNbG1WWXRCb0tzb04rRVRGUFpxTjUyM3cxRzl4bWNmSVdEZjZ3?=
 =?utf-8?B?WnhhVElDUHdaTm1NWEQ3MU9NeE14ZFQ4TUxzY0R0T0dRTmVYVGhnWjJiVWJL?=
 =?utf-8?B?b3hSRjBpRXpScHRkTFp0Wnl2TjE1Ui9qZ3hkWEFFWW1Mb1dTQ2IvWlJKSDRl?=
 =?utf-8?B?MFJMWXQ4b1h1MnV4WDRzTzhhMC9TNTVkakxmTzlQL0x5K3JIUjBPV0pYaXVG?=
 =?utf-8?B?ZzYvYmpNeDFNdHh1aUMvSlRWaHVGMjB0UGc2bUNSQTJkSjdGSUNKbmpoeTd5?=
 =?utf-8?B?MGMxc2d4WVlUQThPUUxCWE1QTC94ZFNHek0vbm16Um4wVUFSUllMTW40VnRl?=
 =?utf-8?B?NU9HODBpL2xuTVd5UGMwNTFqRVl2WVBqMUp0ZVpkR2JXdW1aL2F5ZjJnT3l2?=
 =?utf-8?B?dVFvaEs2d2MrcnlIYy9YRmFNd0VaZW5wZlBQb0wxZjlTQmNXTktudXo0azhG?=
 =?utf-8?B?OGliSUtwbVN1T2YrMTVNOWVuazF2ZnhEeUpaNmpRMVJON2hITHRyanVSdC9w?=
 =?utf-8?B?Zmc1dEw2U0xyTHpGaTlxTmFqMmhjOUI3dk1zWnVVWFZNN3BwbjJncEV2NnF0?=
 =?utf-8?B?Q3VFV3l6OGRiOUZrZ2RMS0d3eU9NRVB2V09yYWtMUzNBMHBLUFQ1aW5iei9V?=
 =?utf-8?B?YmJDMkMzYkFiL0RVNzJFbEprdFNJRVhFM0lqSmRmenk2OERRUlRjNW5Ob1g2?=
 =?utf-8?B?ZFVXa1N4NDZMT0xCamJjK3NJOW96cEVyMVdCdExmMjFLSlk2RHpDQUMzbDZ6?=
 =?utf-8?B?Wm9BcldtQytCd3VCU1BTMjYyVFRtbmxLUk1pSDM1TXFVbkJpRW84dFlaVVZB?=
 =?utf-8?B?T3h4VVJtM1FsdVk1RTlDK3dkaFNRVTVRdFZYRW9RUzFWV0xpZXNlNHFEbFl3?=
 =?utf-8?B?d0V1dWJ2cFVUeHpXUVZLbFNhSXZ4Rm9FNCtKWlJTZHhwUWFMaTFyUWwyZGF4?=
 =?utf-8?B?V2tONkVrYTZGWjJBOFNqYXhKYWhkaFcvLzYxSjlvd0pDQ2c4QlY5d1lCZG1M?=
 =?utf-8?Q?uUS4/HryZ9Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWszS20wNGFidlpjOHJBV0tzT1cxa0pMakNaM1BacDVEZnIvc01JSkZVUnp1?=
 =?utf-8?B?d3pKYjB0M2tudVZOb3BseVhETEdCMzlXWjJjd1kxWG1WRTZMM2l6LzhDY2dH?=
 =?utf-8?B?a3ZWb3QvbVBpdnNQSU9haXRvY3VBc0RLZXFsK09PbUYxR0Z3bXdvOTZsQnVZ?=
 =?utf-8?B?Y1BHODQwMDNNRU41U3l2Z1BCTU5QWWp6TjVaVVcySGhuWTY2ODBmT1FwZDh2?=
 =?utf-8?B?U05raEtkdDkvNTJaV1ZkSWtLVXhnbGl1SHFqMDhRbG5QTEErYUZuS0hZOHln?=
 =?utf-8?B?a3pUY2Q0YnNycFFubEdzc2JaVTE3Vit6WVV5WUZEVU0zQ0hxOHZSY1pINVIz?=
 =?utf-8?B?Q0UycVZhcU5WN3NMQktxc3RwSWtkSGMvTXJ1aVVWRVR5Rk5NSHlJVE01MHJ4?=
 =?utf-8?B?aDAwTEtnYnFEb2VEaFpuMmdVczNQODRZb21zb09mOUVOaEdEQ1o4MzRIMzlK?=
 =?utf-8?B?WXdiNG5aVDBJQjE4eTRJS09kbXFyK2JEZHQxNzA3cVRWNmV3dWVSY1RLbmpE?=
 =?utf-8?B?dTh1Z3l1TEMxam43OGFGMndqOEs5NmlqeUVGaE1ndkZhcmhlMEFLY2ZBYmYy?=
 =?utf-8?B?VVJCZ1IxRXVVK0o0R2hOTzZiVXdSSWxBNzJydWV3V2pjYkdnRWtxZTFtYjlV?=
 =?utf-8?B?UXExZ1Y2YWY5bnVzQjFVV1BrOGV0UnllSGlIb1Q2QkowMU1nVXc1engxaWUw?=
 =?utf-8?B?K3EzVDFTd0JBTkhKUGNJV1E1TlV1a1Z0MEI5OWxaZkY3Y3ZrRUlUTC83SG9Y?=
 =?utf-8?B?dUtpZU40cDNBOEtyVkJwRnFKUEJpUEg4MnBoQkNOdHE2bDd6ejFSdENwd3ZK?=
 =?utf-8?B?dG4yTXRCWVhxTjBDVktCTjZ1a3d3c2Y4cmJIczkzb0k4alRJUmRRTElUeGZu?=
 =?utf-8?B?RWZYbVRDL2lyR0thK3ZPQmtLYnBVTzB2SVcxN3B1RkdNMGIvK0tVeEpvUm43?=
 =?utf-8?B?dGlLTGF4MEtObzJZZkhURDZkVkNWa1BCL3hxMmZoUjZIK2FxMk1zWTBrSnRX?=
 =?utf-8?B?MExUdHBleUxlZ1h3QldUdHVvcFFHeU4ybU1ETCtRR2E4d09hdFpwMW10MStu?=
 =?utf-8?B?aFIxck1IYVJUcHFFMGM0aEJ6ZVFQbUxPV2tXK0xwUjNZTlNnUnpMT3JhM2dn?=
 =?utf-8?B?Vkg4TUdXT3k5WE85VGhObTQyWHZPWUtKNVIzRjNEUmRYaEllTjRsZ1grdGdQ?=
 =?utf-8?B?WW9wc2o3dWp3akl4Rm92ZWdpSm9lQ1ltdEJyNHhkRi81M00wY3dpZ1ZHTnVv?=
 =?utf-8?B?SnBOTkJwd0lWR29hbHV6NmQ0TjFmSmcyL0FENDhPZy9LS0R1aFJlRldrbUlh?=
 =?utf-8?B?NHRtNzYxdWJZdllUVjVXaWxTU04xWmkwYUhobHR4M25OQ1o4aVlXOWt4YVBI?=
 =?utf-8?B?Ti9XdXp5R3VMWG85WnRPd2ptNzQrNDBtb2FRRGNlY0tnRE5yYThHVTdja2ty?=
 =?utf-8?B?Q1YvQm9yVnFHQU1JdXRKKzE3cGdhWUJFUlFEYlZYWG9pekZQS2c5OE1KNWhh?=
 =?utf-8?B?WVV3ZkdXZzF3ckcxb3cwR09OL0VZY2ZvM2l1cTY4MnhjUXllZmhhTGJjRCtG?=
 =?utf-8?B?a3JyS29ISWI1KzJvU09BbXN1UGMwNXNKQTEzWU5COEhHQmRLclE1VVdqa3R1?=
 =?utf-8?B?V2VDUkRIWU96Ni83Q0lWVU9EWms4TEpLMWtPQjkrMFEzQkdYS1gxMzFvOVQx?=
 =?utf-8?B?d0xRMU5jWkVubXFoVW12Ryt6ODNKM2tzcXdkTjRmM0doQXhJeGNIMHpPSDdI?=
 =?utf-8?B?OU4rZGFqUHlHSk52a0UvNUdUekJ4RSt2SE1ibWM0L2NDTkpsOFgxN2I4Z0x0?=
 =?utf-8?B?cjJDdjQ2OWZLYjVmOTNyRnRFblVZNk9YaXFXSEsrRGdsM2Q2ZkhWQXo0U0xz?=
 =?utf-8?B?Z1Q3ODd6MHVnZ1MrL2dvQytFUXFQTmhUSlVEVzIyYXpTNy9JQ25oNnhUK0tX?=
 =?utf-8?B?NEp2UVZUbjlpNURtZk90RE5ieG5CTk1RSjNvdlBEcDgycU1DOUJ3MUIvWFU4?=
 =?utf-8?B?NjVYYnUvaGM0UjJseHpnZktXNFE1M09vY1B3Mis2MlFVSVNDTitwQXFzUENm?=
 =?utf-8?B?RWtHV29pclZjdVlpZzRUazZFUEwrYUdXb3llQWluV0kwZjdlOWlOVkp6QkRE?=
 =?utf-8?B?eE9VSndkdjRldWlVV3hVL3BUZXpqMFJoWHNKVGhWVmg1ZXhKcVJveVI5VExp?=
 =?utf-8?B?Vnc9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0c259cc-9d40-4cb5-189f-08dd88463c8d
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 00:22:20.3410 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PG6ZyWoxep8B/ijbJHkbmI4IFiDs0MnBoGMbLXbZwczcUTNfPof24jEequMIxoaZC6cjge5fGr3ZBruk9FZHAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6294
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

Hi Alex,

On 4/30/2025 8:09 PM, Alexandre Courbot wrote:
>>> I am just not seeing the benefits of not using dyn for
>>> this use case and only drawbacks. IMHO, we should try to not be doing the
>>> compiler's job.
>>>
>>> Maybe the only benefit is you don't need an Arc or Kbox wrapper?
>> That's not a huge concern for me, it's only one single allocation per Engine,
>> correct?
> Correct. Note that for other engines we will be able to store the HALs as
> static singletons instead of building them on the heap like I am
> currently doing. The reason for doing this on falcon is that the
> dual-dimension of the instances makes it more complex to build and look
> them up.
> 
> ... or maybe I could just use a macro? Let me try that and see whether
> it works.

Do you mean a macro for create_falcon_hal which adds an entry to this?

 let hal = match chipset {
    Chipset::GA102 | Chipset::GA103 | Chipset::GA104 | Chipset::GA106
|Chipset::GA107 => { .. }


Actually it would be nice if a single macro defined both a chipset and created
the hal together in the above list, that way the definition of a "chipset" is in
a singe place. Kind of like what I did in the vbios patch for various BiosImage.
But not sure how easy it is to do for Falcon.

Or perhaps you meant a macro that statically allocates the Engine + HAL
combination, and avoids need for Arc/KBox and their corresponding allocations?

thanks,

 - Joel

