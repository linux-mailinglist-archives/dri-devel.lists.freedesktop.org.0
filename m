Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87295AA7A77
	for <lists+dri-devel@lfdr.de>; Fri,  2 May 2025 22:00:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77F0010E16A;
	Fri,  2 May 2025 20:00:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="U6mgtz64";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2058.outbound.protection.outlook.com [40.107.223.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F97110E16A;
 Fri,  2 May 2025 20:00:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=imJVL4O6Bv6QuTDM6qVMp/1RLYROSXuxp5IVfn7A9enqjthFaYRt+i+YBTsqoFmKfLZ4xGEeF7igod1JlhJ3spRl+XGRf9rBzMeshIzMOZzFLvDm781IlLlgLNTYYo7YOud7JD5LqbojlDVxyEmVUb1hnrjqYmUCJhZkb0N8zgSnNVl+r3yMjR62+Cveeg2haCIk+w5s5XTJofsyJ7IFCyxAoLNE2OhyAaw50t1xgSXKRLQlOS4PvM6TBNLiVvWOxELRzfU4Y9OX/x5CUeoLOxIa6i9irONgupsRM4veBq8QhURWmMjrXV4Ef82DJ0D8IDQOs8cVVypGOZlpV7/GLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BjOQWLdU5gFPJHd6HcUwefoRJ/H5PcxbWPrejgbCUEo=;
 b=AnY6o+SOWQCs39G9YTvLrkkwOznU0yy6eJu1DjKr7MHBMPHnl5E309cw1AlbxsUA45rIXbnkdhBfydscGnC9j3JqDQuTPO9KckKQrZ6lJY/6Z3TbxuNOQe51mErVVMlnHX8leuh04jvfA7Fvtrbdrn3PIWHRO6xTBacE61FoS2cvAA2+GtFYFT/mURtBXoEYUa5+aE3TvVY65yECmSJFZZeuupwDhFlfP4cUAL1TGp4xA+0bXBgl4p77tD9LcNOwtpLF3A4TOMcaG4SFk5R+DvZ6YEENCgwSvMTW/wWeFcqr0c/sb95p61O2H82UCkqjAXV0RQaIGoLBDqX8qCde2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BjOQWLdU5gFPJHd6HcUwefoRJ/H5PcxbWPrejgbCUEo=;
 b=U6mgtz64shXuMns565TiYb8eCAkg0tEaOiDh360yXJ1CFRs6FPYi+txl0vjf2lvFuw86IRFBRBnk8tA4UawJKZlq9ZZd0wYxEHl46R6wNoZ3ak7CZTdRGv/2nk0RsN6mHSInLHjzAuarEG9ho+Qrp6HoKrIzAvNlMGl6Hgjd87bq6OWZeDpCKu51PSu5L4SFrCprv/CnfytG+aOLqMeHZdP1KVa/hm0O65Bginp2SakMOkETuclEN+rpIUA61d/TQUlS+WcFI2m9D2FHkWRqs9V29HxyJgzu4lgrso12Jj7xb1xyra7rdfAatfYsHhrhvj0srWGwfbyjbvWcTKFBsg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by BL3PR12MB6451.namprd12.prod.outlook.com (2603:10b6:208:3ba::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Fri, 2 May
 2025 20:00:03 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8699.021; Fri, 2 May 2025
 20:00:03 +0000
Message-ID: <d6962ea3-282d-437c-b3cf-ce701d514558@nvidia.com>
Date: Fri, 2 May 2025 15:59:59 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 17/21] rust: num: Add an upward alignment helper for
 usize
To: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20250501-nova-frts-v2-0-b4a137175337@nvidia.com>
 <20250501-nova-frts-v2-17-b4a137175337@nvidia.com>
 <D9LEQ1U1PLO8.3N22GRY380ZM3@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <D9LEQ1U1PLO8.3N22GRY380ZM3@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR16CA0046.namprd16.prod.outlook.com
 (2603:10b6:208:234::15) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|BL3PR12MB6451:EE_
X-MS-Office365-Filtering-Correlation-Id: 889bf129-83c9-42a2-3c83-08dd89b3ed59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SkoxVnkraHB2aExhWFpuSjdma0cyVXV5MTkySTVDT0hkTytLWXIrVk9CT3VX?=
 =?utf-8?B?anlIQlRGVXhGQjh6UitDM1plcytNTGEvT29nd3JMSDJHU1VrVXExS05uL0h0?=
 =?utf-8?B?ZVpXRGxzall0Y1RubU5ieVpKV3NQTkpETTFyVGYyb1grMHFDTGQyQWhzOHB0?=
 =?utf-8?B?QzhaVDc1WGhhalZoaUtKY3RselNlelJmYzZGNGxHS1ZtRjFwRjR6YmZzc2t0?=
 =?utf-8?B?RStIWW5vNmhNRWtxajZmT0RCZVhyTjZ2TWo4UmxYMmxlcWtFM2prWUozRFVz?=
 =?utf-8?B?OTRmdmVlN0NUZFM1ajlTeG02TGdmWkRvTUxrSjRUdEZDM05ZWGs5bThaRFA2?=
 =?utf-8?B?R1Z5WDVZbW0weUNiWlY5WjUyVXRRTnJWcDA0MHdaV0ZNbzFtaUxBenN6QXBQ?=
 =?utf-8?B?MVExMGFmU2RHMjY2QVFuclphQUtTS0dZL1dyMVF0NzY2dzk0WnRBR200OWFu?=
 =?utf-8?B?VUFoWXkvc1Yxa0czajFGY1lhZGpQbWcyWDZLaDdVRG5WTlkyMWRIVEIzRjBI?=
 =?utf-8?B?WmJGNVVrcnRhZHI5OSt3b3dBVUlwZitiN1cwdTd2L3FZemhQdGR5eStNNHMw?=
 =?utf-8?B?L3BiRGE3bU9ORVB5S2Q5WEZHSlNUWm04VzhIVHNNRkM5NEVpM28ySUxOdkRz?=
 =?utf-8?B?M0J4MFlHVjY5dG5nbVNGRDRBRFVzT0E2YjA4a0VqbE9ISHNvVVhCSXdBUHRm?=
 =?utf-8?B?QTVFMDBqOFhuWWtGaldFdGptdE5uZlpjUVZ5NW9jSDByYWY5RlFucFl0QVcr?=
 =?utf-8?B?VUhOM3E5V0h0WHU4b0NQVHhvN0RYR3kwZVFGYXEvUzlqOHFCUUZ4T1F1cFZj?=
 =?utf-8?B?cnFsWUdRMVFqRTRsUnB5YmNFQzczeGQ5N0RpclF3YjU3SlBQcy9hZVVJRFlW?=
 =?utf-8?B?WkowQzFMU1VWTW14TE0vc0MwY3UvTVM1dHU4S01vUzkwQlRDNmRXWjRhZUU4?=
 =?utf-8?B?VlY4TFFyM05sZ29vTjBuOG5rSlV1QU02bkNUN25VK2EvWlM5Z1VXOHViR1Nw?=
 =?utf-8?B?UnhZeFFULzFoNzViK3o3K1pFL2xmb0xlL1k0cmNGQXozc2Qzc3hwLzJyK25o?=
 =?utf-8?B?M1FIVHpERW5YK1BwbktMZHdvVzRnYm1RZDIwZEJiSFgrYnBNbG1oU3IzMnRC?=
 =?utf-8?B?c3Q1WjUxRGxRR2pZdW4wVk9JOG9aTmxxeXNPdlpLVGszUjB5M3krc1ViN0k3?=
 =?utf-8?B?b3VkSGdnRnlIV2Z0UzlLNU94cHNmcUROdlFnclJtU013OVF3NEo4Ym9iWVY0?=
 =?utf-8?B?dlcraG0wcW1nUTJSMHpWbWNnNU1vRDFWZTY0czIwVlIvNCt3SUJuQzBZMDd5?=
 =?utf-8?B?dHN0VXZsanFNTDNGMkdrb3dzM0FQK2c3WUJ4OVhRa2R4dmprSU9JOWNTbEJX?=
 =?utf-8?B?SkdJQ1R4SUdvSkkxSHozZHZMZ1VkMjFIempVQ0dLUk5jUE1VWXBEa0pOd1pX?=
 =?utf-8?B?OXFZL3ZvbStKUDRSVEhwanVMc3ZER1FoU3Ntayt1TGx2eUFwTjZQbHp6Ynd1?=
 =?utf-8?B?a1FLdm1HSWNtL0IvRGxPM2JEYXlBSXRBOHYwcC9GOUZvRHNWRTNVZ2lQek1Y?=
 =?utf-8?B?QlhjUmIyQ3puWFNzWGtGdFVEdVRqcytPTGJRVGR1R094RWI3NFFlOFQ0N1VU?=
 =?utf-8?B?SXc2eGNvWUhNYndQM2xmUnE2b201NTIyKzROQ2RjK24rUXdBQ2NyR0ZOSmFa?=
 =?utf-8?B?Snc3ejZXNTJpeXNzcEx6bk1zNVpQd3lkMUI2bTlYK0tLMUo4d2I5bWtxYTNy?=
 =?utf-8?B?NCsrZ1RkUkpmWWNQaG5pUFc2cnBOYjJGN2JRU25PYVdramZ0R1JrcjdTL1dq?=
 =?utf-8?B?YzlJVXEwMDNESGt6cHREdGFydVc1N1Y2dnhJS2VUeHFXd3VqMkJRZjB1YVpN?=
 =?utf-8?B?NDBjRWpVZEFoL2o4L1Q0d0g2eTlmUkVSVjZwTFpBSkttR2lCQXJsL2haQldq?=
 =?utf-8?B?OG1EVFUwaTJoenpDdWVaRU5oYXU0OHhaZDRTS1hjZkJEcGpKTEN6MEF3QTNE?=
 =?utf-8?B?YzZidUR0bUpnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXhHSmpaTlFGRXRmREFiQmcyNHpiRmpPV2o2aUNUbGtmUDFNZDFSWFMrMEZY?=
 =?utf-8?B?UENQYWtkSnBBcjJMdzNBUVVaeTFaNlpCMFJBY1ZaaHhoNDFyK25iSWxwdGdz?=
 =?utf-8?B?cDBLb1VjTFh2UWhCUHVCK05Ub1RERFZ5cyt3ck5kNy8zRUZudDFBay9vRkdX?=
 =?utf-8?B?ZmRBMmtiOTVtSzBIdC9yUGV6aWRmMEFZQ2svUXdQd2RJRWo1bXZIQlNXTDgv?=
 =?utf-8?B?QnUzMm1XTU5sZ2NkQWNkamdsOWg4ZUdsZ2UrQmZqTVBROG5reFZEOHg2NWlQ?=
 =?utf-8?B?UGFEV0NKVFhyN1NTNi93RGMrUnAwY05XVnBQZUhFWDR4cjVmUzBTcCsrN3kz?=
 =?utf-8?B?bklUNVZoaFpITEJTQ0dDSGt1cC9zVmRoRlVSdXlNVkVFZ09QSHFySS9vdVpi?=
 =?utf-8?B?YTBlNDZjT1A1QWN3NWxxYzMwTGZyOUFEbDJWRXJ2d3RyYk5rY3hic1hkWXV1?=
 =?utf-8?B?RktaRHVxcjhGRjYwaUdoVDNSbTFGNENqYmJRbitFV3k2V0MwM2lUNnczT09x?=
 =?utf-8?B?QUZOK2JEY3NRd2lncmcxTzFTR3BxbFpGRFZrL29nQnNMeGpna2RaUGFVVCt3?=
 =?utf-8?B?MUJkckxVR2xiTDYxeWxNc1M2TVplbEFvM3R6ZUhwNXhjMmhMQmpnTDFmT0dY?=
 =?utf-8?B?TmMyUXV1MlFub2lHNmEvUEJQTXFYZURqVmVrSGtURUp3S216NGNkMTZNYWdG?=
 =?utf-8?B?VEZvU3hUUHNIRHQyL0FaT1dHUTltNTVQdGhRaDZTaS9WWjdmV1l1RHJWcmhR?=
 =?utf-8?B?cUMvZ1RRTmcyQzlnWDZ5OVA1WDBhTHZLMmxYM25oaDdiNUtRT2laZDRwTUpl?=
 =?utf-8?B?UkxHS2NHd09WdDdmNEgyeVB0SzNma0VKWDNqUkJINXVzVmxMK3E5OCswSkhV?=
 =?utf-8?B?K3FkTXZ1SnlMQnNpaGZaQ21Fc1UyRjlHVy9zNzdoWDJyM3R0Z2dMaDJGOC9X?=
 =?utf-8?B?L0gwVVlYWnE1OEMrR1k3UC9wL0dLZzh4RlBySEtWR1VZc3hTQm85aFRFa1JO?=
 =?utf-8?B?YlhmNWQ2Z0FqTzlXeHNUb2RFaGUvSXdqbnU1ODRFamFwOG4xaExBSStiNTlr?=
 =?utf-8?B?eXlud3dSemM5K0tVTkNBVEJFbnQwMXl0QVl3aG1TbUJGRU1XeXBTQnBBQ2ZE?=
 =?utf-8?B?d0ZkZ0ovc29ERm8xZWxZeVFUUVc1YjBCeDhhWnpjUEJrQjdhRy9LbjBoS0V0?=
 =?utf-8?B?NkRYQSs1MjlSelFrZkI1SThOa25FamlCK3Fkc2dqMG1RclAreEpHZ2Q5Nmhx?=
 =?utf-8?B?d1VlbmJXMFZ0bWhGQytHZ2lTU0MrQTY3QXZ4NDFKWmZNRDZHellNNDd1YzJY?=
 =?utf-8?B?eE9QZGU2UlMwaFNHeWhRazlTa1Zzc21ZMjRNczZIV3JKWXRBeTJOYVFvU2RZ?=
 =?utf-8?B?bittZFVWSGlOK2cyTU4wLzI1MS9PYThtQXlvR0FaeHJKS0UxTG14M3JvdGcy?=
 =?utf-8?B?NjJDZXR3MmV3V04zTWdoU2tLZHQ2d2pBUUFvTDl0a1FVSGR1UU83c3dSb0lK?=
 =?utf-8?B?QkIzcmg1RzN2MzFSZ2kwWHRhOGZ4Z3g1aVR5UzZUN1AvTFhON1VUanZuTzFr?=
 =?utf-8?B?RVQvRHRQM3VGL0YraHZDc3pNSFRnNTJsemtudys0VUcrUzU1UEVTZTR1bUpK?=
 =?utf-8?B?TlAweFZWMXpENi9ReHQ4SzFQOWdRZHpNZTBsdGdnSHR5RHEzMHpFTkdoL3Bz?=
 =?utf-8?B?TFhvS01GdS91SUpCK20rZmVDeGl4c3V1cmRGcEZDaXA3Nzc0Um8rREVtcnBj?=
 =?utf-8?B?aXZTR1ZFa01oRjBMNmhZYmFXYlBQVURCeThOVU1XbjdzdzZWUWNXeGVTOHIy?=
 =?utf-8?B?VFdKbENwcDIxNUdSZFdGOUZhbEYyNGZyN3MwdVdmVDlUU0JCUFFUeGowWjAv?=
 =?utf-8?B?Q3FISWhERUFRa0NPb3JicU9EK3RlblMzTHBub3dsY1NscHhMNlhhOGZRdTlQ?=
 =?utf-8?B?aWRJSmhPZ1VPZWFmUFl3YkVZelkyeE0xb0I3TlU5OTJQTTBzeFQ5NmM0QjVR?=
 =?utf-8?B?aTdyczRWWWlpK0hiUUp1bHlPV3hEeFkrWHQweWtKSS8wbjUwK2IwWENTSktr?=
 =?utf-8?B?ZVhYWWVNT2Ywa04zazQxTHBqQVBGdTN6a0wyVmJrOWV2WndIbWlqMFRWK2xR?=
 =?utf-8?Q?UQy1lnacf8Q8Ct/hqam1IxvRF?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 889bf129-83c9-42a2-3c83-08dd89b3ed59
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 20:00:03.3117 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1SvNh0CgF5gR1D7IEI2+nyGIIgHgkyekf3VuZ5p4myoHrhvgNfWKqd+w398iP7S2KuirNf6doN7eJ+ysATb8Hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6451
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

Hello, Alex,

On 5/2/2025 12:57 AM, Alexandre Courbot wrote:
> On Thu May 1, 2025 at 9:58 PM JST, Alexandre Courbot wrote:
>> From: Joel Fernandes <joelagnelf@nvidia.com>
>>
>> This will be used in the nova-core driver where we need to upward-align
>> the image size to get to the next image in the VBIOS ROM.
>>
>> [acourbot@nvidia.com: handled conflicts due to removal of patch creating
>> num.rs]
>>
>> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>>  rust/kernel/lib.rs |  1 +
>>  rust/kernel/num.rs | 21 +++++++++++++++++++++
>>  2 files changed, 22 insertions(+)
>>
>> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
>> index ab0286857061d2de1be0279cbd2cd3490e5a48c3..be75b196aa7a29cf3eed7c902ed8fb98689bbb50 100644
>> --- a/rust/kernel/lib.rs
>> +++ b/rust/kernel/lib.rs
>> @@ -67,6 +67,7 @@
>>  pub mod miscdevice;
>>  #[cfg(CONFIG_NET)]
>>  pub mod net;
>> +pub mod num;
>>  pub mod of;
>>  pub mod page;
>>  #[cfg(CONFIG_PCI)]
>> diff --git a/rust/kernel/num.rs b/rust/kernel/num.rs
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..953c6ab012601efb3c9387b4b299e22233670c4b
>> --- /dev/null
>> +++ b/rust/kernel/num.rs
>> @@ -0,0 +1,21 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +//! Numerical and binary utilities for primitive types.
>> +
>> +/// A trait providing alignment operations for `usize`.
>> +pub trait UsizeAlign {
>> +    /// Aligns `self` upwards to the nearest multiple of `align`.
>> +    fn align_up(self, align: usize) -> usize;
>> +}
> 
> As it turns out I will also need the same functionality for u64 in a
> future patch. :) Could we turn this into a more generic trait? E.g:
> 
>     /// A trait providing alignment operations for `usize`.
>     pub trait Align {
>         /// Aligns `self` upwards to the nearest multiple of `align`.
>         fn align_up(self, align: Self) -> Self;
>     }
> 
> That way it can be implemented for all basic types. I'd suggest having a local
> macro that takes an arbitrary number of arguments and generates the impl blocks
> for each of them, which would be invoked as:
> 
>     impl_align!(i8, u8, i16, u16, ...);

I actually tried this initially before settling for the simpler solution.

We can do this in 3 ways I think, generics, macros or both.

Unlike the last attempt, this time I did get generics to work. So how about this?

use core::ops::{Add, Sub, BitAnd, Not};

pub trait AlignUp {
    fn align_up(self, alignment: Self) -> Self;
}

impl<T> AlignUp for T
where
    T: Copy
        + Add<Output = T>
        + Sub<Output = T>
        + BitAnd<Output = T>
        + Not<Output = T>
        + From<u8>,
{
    fn align_up(self, alignment: Self) -> Self {
        let one = T::from(1u8);
        (self + alignment - one) & !(alignment - one)
    }
}

I know you must be screaming the word monomorphization, but it is clean code and
I'm willing to see just how much code the compiler generates and does not
requiring specifying any specific types at all!

This also could be simpler if we had num_traits in r4L like userspace, because
num_trait's PrimInt encapsulates all the needed ops.

use num_traits::PrimInt;

pub trait RoundUp {
    fn round_up(self, alignment: Self) -> Self;
}

impl<T> RoundUp for T
where
    T: PrimInt,
{
    fn round_up(self, alignment: Self) -> Self {
        (self + alignment - T::one()) & !(alignment - T::one())
    }
}

fn main() {
    let x: u32 = 1234;
    let y: usize = 1234;

    // Output 1536
    println!("u32: {}", x.round_up(512));
    println!("usize: {}", y.round_up(512));
}

For the monomorphization issues, I do wish Rust in general supported restricting
types further so if we could say "where T is u32, usize etc." but it does not
afaics, so maybe we can do this then?

/// This bit can go into separate module if we want to call it
/// 'num_traits' something.

ppub trait Alignable:
    Copy
    + Add<Output = Self>
    + Sub<Output = Self>
    + BitAnd<Output = Self>
    + Not<Output = Self>
    + From<u8>
{
}

impl Alignable for usize {}
impl Alignable for u8 {}
impl Alignable for u16 {}
impl Alignable for u32 {}
impl Alignable for u64 {}
impl Alignable for u128 {}

//////////////////////

And then num.rs remains simple but restricted to those types:

pub trait AlignUp {
    fn align_up(self, alignment: Self) -> Self;
}

impl<T> AlignUp for T
where
    T: Alignable ,
{
    fn align_up(self, alignment: Self) -> Self {
        let one = T::from(1u8);
        (self + alignment - one) & !(alignment - one)
    }
}

If we dislike that, we could go with the pure macro implementation as well. But
I do like the 'num_traits' approach better, since it keeps the align_up
implementation quite clean.

pub trait AlignUp {
    fn align_up(self, alignment: Self) -> Self;
}

macro_rules! align_up_impl {
    ($($t:ty),+) => {
        $(
            impl AlignUp for $t {
                fn align_up(self, alignment: Self) -> Self {
                    (self + alignment - 1) & !(alignment - 1)
                }
            }
        )+
    }
}

align_up_impl!(usize, u8, u16, u32, u64, u128);

Or, we can even combine the 2 approaches. Use macros for the "impl Alignable"
and use generics on the Alignable trait.

macro_rules! impl_alignable {
    ($($t:ty),+) => {
        $(
            impl Alignable for $t {}
        )+
    };
}

impl_alignable!(usize, u8, u16, u32, u64, u128);

pub trait AlignUp {
    fn align_up(self, alignment: Self) -> Self;
}

impl<T> AlignUp for T
where
    T: Alignable,
{
    fn align_up(self, alignment: Self) -> Self {
        let one = T::from(1u8);
        (self + alignment - one) & !(alignment - one)
    }
}

Thoughts?

>
>> +impl UsizeAlign for usize {
>> +    fn align_up(mut self, align: usize) -> usize {
>> +        self = (self + align - 1) & !(align - 1);
>> +        self
>> +    }
>> +}
> 
> Note that there is no need to mutate `self`, the body can just be:
> 
>     (self + align - 1) & !(align - 1)

Sure, that's fair enough. I am Ok with either.

> 
> This operation can trigger overflows/underflows, so I guess for safety it
> should return a `Result` and use `checked_add` and `checked_sub`, after moving
> `align - 1` into a local variable to avoid checking it twice.
> 
> There is also the interesting question of, what if `align` is not a power of 2.
> We should probably document the fact that it is expected to be.

Good idea, makes sense to return Result and also check for power-of-2.

> 
>> +/// Aligns `val` upwards to the nearest multiple of `align`.
>> +pub const fn usize_align_up(val: usize, align: usize) -> usize {
>> +    (val + align - 1) & !(align - 1)
>> +}
> 
> Let's add a statement in the documentation saying that this exists for use in
> `const` contexts. The `impl` version can maybe call this one directly to avoid
> repeating the same operation twice.

Sure.

> Actually I'm not sure whether we want the `impl` block at all since this>
provides the same functionality, albeit in a slightly less cosmetic way. Can
> core R4L folks provide guidance about that?

Yeah I am Ok with this as well, however as you noted it is less cosmetic.

To clarify for r4l folks, Alex is asking do we add an impl on the types for
aligning them up as done by this patch, or do we provide a bunch of helpers
(possibly using generics or macros to keep the code clean)?

thanks,

 - Joel

