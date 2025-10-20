Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED244BF37C9
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 22:45:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20B1310E509;
	Mon, 20 Oct 2025 20:45:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="sbllqgvH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011039.outbound.protection.outlook.com [52.101.57.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14E1710E509;
 Mon, 20 Oct 2025 20:45:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HigpaxzJffiIXW57LpxVxXaRx0ytk9uvIseXzWNP5rwoSjVO8dHvjZ+OcgWvvQ+vEcSRIwYq4k094dKjvw4Ze/HTmOtKZmlAhwgTlA8RBli06cLallObvNdsFIBCOP6bxNx6dRDhoBNlvjW4pDof5gcITvc3iKCASaUYj4k7YvianwQ4ALd/m/eZ2YkXA+mWDf7vZIUPFTz2L8Su4AKuUAv6gBgw6+zwCYOVhjNGo7BdEgGWTPQcsjYETlM4dF62xV8cHRDLkXuEKLqJ3Gb7xTlM4LfZP8a+eoks/M/i/J/VhYpe1tLFKpXk0De3lsy+whJRnlT4uBymMrJLzQKuDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D+Zh3baJ/OLkRW8ICrbqHkl2lB69eiZiH18VRHyReKk=;
 b=YQmoq+pEAY7+qMZHGoehK+Qs+jgCJ1j9mUKnvXg3z9BWLyxhwRrNh45kdOKuriLmDZibpEQx9IY9njPR2I9GYEFmQEWY1vk6m56r1Phjm2V8vhUWxc4H5r83Cha/Niuk1Y/5aR8jzhCBq1MzxSmiW5w8yOQ2TRirY/0GIvu4XHyjCLqPmoUE1E0Z2RUHQ28wkdrHwOxlUk9vLtLGukMQRMkw42bvPawFsBblpr74Mrr6VUtMJIJiOJrMq7IXr/4omqbIM2veVxzFHZeLt5s63ZzqEzjDlSM10Z0JAGFxEqCg6vTtjMQ7ceX5Ir925kQBgLHMUXfBBYN262ZDA2hkJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D+Zh3baJ/OLkRW8ICrbqHkl2lB69eiZiH18VRHyReKk=;
 b=sbllqgvHxe+h0Xv6AotpGjvePbqKa3QfQcFBCxD1vT8ciwakH2r3y/0JcYLVFlIZ1GeayYcNWFhfc1GpbQFAfqaC8hywIA6P9CNHg/3NOIiCdfpdusOBKz3lHF+rvynP91K1THi/PoRoZlUabvvAGmDnJ9uQRsFz2sAo6NeTc8WqXYSOJCrwZG0idi8/UAtk6OXwCWINUWYRcL9N5I7R23BxXdkA5POg5N7xP3kiglB4LGF8J/c2y+zXKqtKOKG83To3VpfvrYoCHKCNM963nGJ39Sp/RyZssxyeDPtsFbAlMnYWMVGWA/vrscKlQpBrKTS+Rcqk9QuorKeylaHpyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SN7PR12MB6671.namprd12.prod.outlook.com (2603:10b6:806:26d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 20:45:39 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 20:45:39 +0000
Message-ID: <32c266bc-6fef-40be-b95e-9f9080ff8938@nvidia.com>
Date: Mon, 20 Oct 2025 16:45:38 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] docs: gpu: nova-core: Document the PRAMIN aperture
 mechanism
To: John Hubbard <jhubbard@nvidia.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "dakr@kernel.org" <dakr@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Timur Tabi <ttabi@nvidia.com>,
 "joel@joelfernandes.org" <joel@joelfernandes.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
References: <20251020185539.49986-1-joelagnelf@nvidia.com>
 <20251020185539.49986-5-joelagnelf@nvidia.com>
 <506e84b8-1a99-4548-b2c6-b502d790f4e1@nvidia.com>
 <0B70DC73-6796-4114-9C2B-6B1B9AD560A5@nvidia.com>
 <c65d6318-0de4-46cf-8f70-8a1c4aba179a@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <c65d6318-0de4-46cf-8f70-8a1c4aba179a@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN0PR04CA0150.namprd04.prod.outlook.com
 (2603:10b6:408:ed::35) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|SN7PR12MB6671:EE_
X-MS-Office365-Filtering-Correlation-Id: 934ca68e-515a-4185-ebc8-08de1019a0b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TmY4dkwwa0RPNXp4OXczWGxzbGtiV2hyU0NZYlVWN003SG5kbmQ3Ly8xc0VB?=
 =?utf-8?B?YlpGQU1IYUhHSzdrZEplM1FFbFJpdlhkM0NqKyswNWk3SDJwQ2pEVnk2cGhQ?=
 =?utf-8?B?THMvS3d0L3hlN1diclhSUjYva1hCdjI4ZUxYTHFrZUZnMmRNYUhTMXJDMThQ?=
 =?utf-8?B?bjFpd0ZPUGI3Ui9ReHEzYks2eGFZQUtIRWhNM1dRWHZwTXA3NVhFRkh4OTFy?=
 =?utf-8?B?OHZTZWVKLzFsNnQzb1ZpamhaZzR6bGtHUTJzTzNaSHZYZ1J5RkhVU2xRbVdz?=
 =?utf-8?B?YUhuT1VtQWkzMTRPejdXcVR3aXlYb01BVEVGOWMyTTdrYllISDFiN0tDOXQz?=
 =?utf-8?B?OGUzY1E3ajFlb0NrdjFNTHBkZXZ0NWtzb2NSVnp4bm1Hc0Ywalp3bkNab05D?=
 =?utf-8?B?MDJSbW5jaU9mdURQOEQ3RVB4bkkza24zSFNFSUNaTmRGdVFoM2tNZGFZbUh3?=
 =?utf-8?B?Q3V2dm9zK1I4TkswT05udWhWdUw3UTBxYjRURXB4KzRZbERYdEMrQXpIeWJo?=
 =?utf-8?B?ZjRLMXdXYXlCdFRsajE2V2JtM3VIZWhqQlBGN2ZJaFYvR1F3YXB0cnA2d2kv?=
 =?utf-8?B?cGJ3MHdiUDhzTWtXSXphYmJYUmVjNXpCbkkydXRKQUVDbGhVZUtmU29ScitZ?=
 =?utf-8?B?Y3pxL1NMZERnL0o2bGV2VnhPbTBPbGFyQkV3dW43dlZxUkFhWlRWazMyRW01?=
 =?utf-8?B?Z1NuckJDbFd6Mk5BbFdVWmxGeldQNFhpalRRY3haQnRENTBpTGdwUy8yeXJU?=
 =?utf-8?B?MmVnNmN2QWNGaDFIazRkdFc3YWtmcnp4YnFKQmt5ZEk1L3dWLzhCZjFCYmxO?=
 =?utf-8?B?ckVnRjR3MXlaM2pkZHNIdDVxVW9NMW1FY2t3QUs5RVJqM0FNcTRGNzNTN01W?=
 =?utf-8?B?eDNFcXNtS2JSdFdpMTNINWtkemZLL3F6bkNESGxDVjNNYnpXNjhadDdsMDZl?=
 =?utf-8?B?NWNLRzd0ZjBkOEp0UGJLT21NUlFVdCt3N2JteUVuWmkxQmFsUDJVTTZ3RjFS?=
 =?utf-8?B?TnU3SnF5ODZGelRZdEhQVmZIZnNwWEVqZUdhV1FSakxNbHc0MCt0WHpNR2ov?=
 =?utf-8?B?KzVTcnplcnVVaWJ4c0F2bHEwV2FodHhCanlMRkVIVXhSYWpLNHArRjlPd01X?=
 =?utf-8?B?d2tMczhXaWJ1YVhCS3V4bVpVTWNmWWVXM3NQQjZSaVVzUS9vSU55TDFEU3dF?=
 =?utf-8?B?Y0Q0U3RXa3RDUFdKdUdnRG9MTmpKU3R1Ti9mQUtBdi93SG5BREsvVEcrR1VW?=
 =?utf-8?B?djc4RXhpZzNvZlVZN2FnOWpjNm1MamRuYU1tUFhHS2E0ZURuQkR2U2hFNDVa?=
 =?utf-8?B?NTZGNHhRYit0K3hnWnA5TkhtdWpiYmJmY2JVWHdDWVg1amZHeGNKNHVCTTFz?=
 =?utf-8?B?WWpFUzJTOWhwc3RVVXpDS01LbkFUWSt1bHJ6aStGcHlnRktPVms2SGhkQUIv?=
 =?utf-8?B?cUJNRE5KVzhoc3dYbGsvTmpCWDh2TjJDUUJvQWZTNkZMR09EMjJTUGhuZEZ0?=
 =?utf-8?B?aFA1bUJrclhBMVdKRXEyYnB5TjBVa3JSZmpvVUl6YWE3SFVLaEgzNDJ3R1p5?=
 =?utf-8?B?SW1VZnpsdUh3T3A3bkFVRnpXNG1PTUlDZy9hNFYrQ2wzdDQzWXNXeExHazls?=
 =?utf-8?B?NUF3Z1RBaU0yOFZuTCtnWnc1U2doM3hpYlFyaDlDb0g2SUl4U09aTDBPdEh5?=
 =?utf-8?B?RFl5Y0tRTlg0TXJUVDUvNXdncEhkY0Y4TENqQjJGclk0bGduSTYxRmxUdlh3?=
 =?utf-8?B?dVhwZytHeEI5QzR4RlM1U2RRSWwrZ29EWHk1YlhaWlp3QTNxSEJpR2M4TnlK?=
 =?utf-8?B?ay8ydmkvMjhzYXZXaDFaZW9MT0ZtMXJZZTZ2aExvaGtRU0cxSHVZeEhiVjZV?=
 =?utf-8?B?c3MzUEd0VXM2c1I3VjNYTkU2cnhaWElDcXVNZzJTdTRTTXpJYXBWMGhKMm1N?=
 =?utf-8?Q?pkMEekAd7tHpC5YdwnOGQWKogQpaDBLB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UE55OWQ0ZjVvUFJKNEx2aG0xSkd3QmdwWWVRcUx1RnNoMmVUTnd6VFV1M3Y4?=
 =?utf-8?B?NEN0Y29BdkVSZ1A2ZmtJVzBzYkJDOFRLOEtDTzlNeWU0dnpFNkliWG4zc2JG?=
 =?utf-8?B?WTQreWh3U3IzR29CQ1Z3dGY5WGx1bllTSzZ4Q0t5bU1jdUV6UDRScG9ycHdG?=
 =?utf-8?B?RmwzdUxGVVoycEovVGRHM284bWZPRXNrclFPMnp6eFB3TTB3Zk90QWtObFpW?=
 =?utf-8?B?anBBalM5Um1KMWJGRWlZWHZySDdzYitPdzJVZ3ltTUxMN05waEw2UmNYNWJ5?=
 =?utf-8?B?dUEvWE85Z2FrWFIwREJYSDVPcmNwWFBQcklGdFoxTWFxMVFOQ25vT3ArN2NN?=
 =?utf-8?B?WnlZbk1GWWhEeFg1bzcwS2RGNzd1dGd4cWNReEd5em1MeVE5VWpZak1VRi90?=
 =?utf-8?B?eitMQzFaMm90ejhLOHAyelhGUVcvRTUrUXR6bzR1ak9WTFZHSWg3SGpRd1BM?=
 =?utf-8?B?UFc3d3ZQWkMvZVd2SlRKUXMzTHN6ZzhOeHdJWDdlcGpWTGl2ckVydHJDMTBB?=
 =?utf-8?B?ck51Q1dHK0xwUXJ4OURUZUhla2svbk5wL21kYW9mRFIvc3UyZFhFQ0VZMW5E?=
 =?utf-8?B?RGFteUFIbmdDcWR2cWFIRjZxSjN3ZjJEeGREYXlmejlDa2UvWXRMcFA5akEx?=
 =?utf-8?B?Q2syZ2VteTRYcDd3bHArZ0lNYnIrcGRNeHNrSTM4b0hCK2xuY0ZvWUJkTGd5?=
 =?utf-8?B?b3hHRUcrRllKOG1yVU1iZ2UwT2o1MVpQMWd3eDEvSnYzV1NpWWxuOTRiL2p6?=
 =?utf-8?B?VnlRM1djREdTZWEvY04vSWw1d1VQZS8xQjBNS1lmalViVWQzNENpUS80UkZw?=
 =?utf-8?B?ZXZ0V1orb1JJaFdiTmUzTGNoRDB2YTZ1SGl2MU1lSEZSQXZUUHQ2K255S3Jx?=
 =?utf-8?B?SEJYNE95MGtHRE9ycHg4UjlPZlZ2VHBKbVJIUnVpM040ZmNNbzlocHNHckNx?=
 =?utf-8?B?bnZjaXZJdFFsWEVyUXYyREV5QmIxVTFzbitiTWZhSlhTNkRrVk9HRzRDbGFX?=
 =?utf-8?B?NUJWQzdFNjYzejVsZnBBdWNNVUNlTzRvREtxUFVsQVI3VW11MzhYRWFFS0d2?=
 =?utf-8?B?NlhVbGFkald5cTZKaG1rS1hxQVhGeGMrb0NpblpqY3RQRi91REl0bjcwd2Qy?=
 =?utf-8?B?WVcrK3E5YmkyVi9QLy9VdjlWdlBTVEVPbEVmRlROdUNoMjNOWWt1ZS8rclhX?=
 =?utf-8?B?bTJ0TkNwSXloWnk3dlFBcTcyVDhFSWtyck04ZloyUGhGSEw4KytMYXRhR1dU?=
 =?utf-8?B?ekJuZ2tyR1Y4TGpKQnNaOWtBNkpKWmF5VVhBUy9qRFJVR2h1N2dvZlZseEFM?=
 =?utf-8?B?RlF2amZiQVhoV0ZKR003U2tDSzlQdU0yUFE2cDBGckV2VU9BWHNKMHpuWlBv?=
 =?utf-8?B?TnFuRkZoUm45cFdEa3pROEZkeWtCMDI4aXpoRjFHMStDczV2dDdvWnVhcmpQ?=
 =?utf-8?B?cGpqTjRXWlppMnhla1lzNkkrMTlOWEEyQ2tlMTRMdGFCRG1EbzVkTnVRMGM1?=
 =?utf-8?B?ZjlSZTF3bkZKRnhjekdNYUdRbzZBRTFrVms4MjJkVzdWUjZONmNlRThyRzVI?=
 =?utf-8?B?bkZIU1FCRHYrdFlsYTEwcUR3dmw1L0pVWWM2SitQelQrbElSbmpaL0h0NWhF?=
 =?utf-8?B?YlQwdVRkSnVSci9sTzBjNlNNUzZ1NzlVTm5pMDJLQW10b0QwdHJBcEF1UWxK?=
 =?utf-8?B?ZlVaRGgySVJSNldzRUx0N2J4OTQvVmVqOWJJL1pWa3h4VDJ5bDVZekY3YWlD?=
 =?utf-8?B?U0h1WGhpVmVJc0lGMEpzWEpYWDBsa2QvZmZoM2x1V1ZzZHVmaWZVWTB2UFhy?=
 =?utf-8?B?dDliMk5kS3l5NG9xaEljdmJpQjd4cHJCZGhOVUp2ZTRlVllWZTlCVzBjSnNu?=
 =?utf-8?B?blZBeXl3MUhGb2NJTEZEQzdxVVJpZ2Fwc1lKVUEzc1BTdGdsbUhRUGJYSm4r?=
 =?utf-8?B?U3l4bXUzVGpsV0dxSVNXNWhhdjU2Z1dOemdkdjdKNkVHL1QxWVhBS1h1WFpJ?=
 =?utf-8?B?elVpY0cydHYxd3VERHZJdnJpOXdOQXdiWjN0ZERLUCtSNld2SjdEY3RHVEZN?=
 =?utf-8?B?YkpjZm1jZkhDSXQrSmRON0ZOZnZUWTVCSkdxbk9qNHNPK25SeDRLNDkwRE1y?=
 =?utf-8?Q?n0R3OT8HPj5HSn3x6hxrsXGRS?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 934ca68e-515a-4185-ebc8-08de1019a0b3
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 20:45:39.1087 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fQCLxB0JfDN0Pizmuf42siEi8aukbknMQ+T4tQcTiLshNORgKntMsPrcncviVYQFv1SJx+b0G9+RFQtZ2chtIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6671
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



On 10/20/2025 4:42 PM, John Hubbard wrote:
> On 10/20/25 12:48 PM, Joel Fernandes wrote:
>>
>>
>>> On Oct 20, 2025, at 3:36 PM, John Hubbard <jhubbard@nvidia.com> wrote:
>>>
>>> ﻿On 10/20/25 11:55 AM, Joel Fernandes wrote:
>>> ...> +Logically, the PRAMIN aperture mechanism is implemented by the GPU's PBUS (PCIe Bus Controller Unit)
>>>> +and provides a CPU-accessible window into VRAM through the PCIe interface::
>>>> +
>>>> +    +-----------------+    PCIe     +------------------------------+
>>>> +    |      CPU        |<----------->|           GPU                |
>>>> +    +-----------------+             |                              |
>>>> +                                    |  +----------------------+    |
>>>> +                                    |  |       PBUS           |    |
>>>> +                                    |  |  (Bus Controller)    |    |
>>>> +                                    |  |                      |    |
>>>> +                                    |  |  +--------------.<------------ (window always starts at
>>>> +                                    |  |  |   PRAMIN     |    |    |     BAR0 + 0x700000)
>>>
>>> Quick question: does "window always starts at" actually mean "windows
>>> is always initialized to" ? Or something else?
>>
>> It means start of the 1MB window (offset 0) is accessed from the BAR at that location.
>>
> OK, yes. May I suggest this slightly tweaked wording:
> 
>    (window into VRAM starts at BAR0 + 0x700000)
> 
> ? 
> 
> This avoids "always" (because HW may change someday), and also
> gives a subtly stronger hint about how this is laid out.
> 

Sure, I will change to this wording for next posting. Thanks,

 - Joel

