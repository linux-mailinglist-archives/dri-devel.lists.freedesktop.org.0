Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBADA4848E
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 17:17:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5416110EB2A;
	Thu, 27 Feb 2025 16:17:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="po3o4DWq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2046.outbound.protection.outlook.com [40.107.92.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F283010EB2D;
 Thu, 27 Feb 2025 16:17:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yYjTyIyUcaFirdbnYA2Xqrz4rvBNEuCmkSW7/PxzzUU/TtddLUVaVkGA4ppUfKM4HGCOU9RlJjv5zRzVlhDkE+/3W+2N6VdlqL+r5exvw5HJIKjsc/YGD+u72aVPFGKpAxXOHLT70eiLRQfLaEn62FFxwoZkgzbR5TSlvU4nt3D/Z4tjyasaqAcd3aqYOpMv1DiCAWWLJ/3NBzSemoVEW38XC8OKxWxZhPJkB78q2BJwzDU6fNN9GVg+rI9hYB0IyTYiWu8t0lDRIpMV9ZeCTRnZnYa4809hUaU2+ZZxJlo3qWFRG1+bzOSxTOlXNYakIHOczLaVPROJHCcFGDFwJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mseToeDaQiM8bb5Ajb/R6SCSzrXL1aN6Ryo+S3946XU=;
 b=TFeiZinKR8k9Sc5fv9QhctRg4/3akQzpQZmhpiyrusAukYnmGtHpzHarqO8ZS7o1m11O2UNvgtDazhRwp4tyBqnALjAOlEoC4s9Eb+OZg7QwZZ9Hoy+qR39I0JKoaXcDXiSfwTJOxPVWvSvnaorIWm1Q7K1CNvWYRBWnkP4qHTANte9lJCTbBRurOrGuRrkXn4tV8oX3MKU2rCBvXD24NjdJWPUGN0tvfLQU2x3krbflI933buPaUrpyLrAM73x8ufUuuCrlbfUxHcWK8Hz/G9Pk8DGiMq5EjdR7p89X7BLMjBV98915BwY96V44zH7Fj9Kiyp3WaaaH2vLzWUEinw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mseToeDaQiM8bb5Ajb/R6SCSzrXL1aN6Ryo+S3946XU=;
 b=po3o4DWqHwcqeAkWAM6iC4GH1xXjf40jrh4uFc2miLEeLd5tlDXcdBJT0gvjr9Eukdue126r1j45liAmsVSHgCRrXf/9tGmTAtZvRe8bTVZqMLRxdjR4T1KFGn38DBoUYANKkFKiadhsk8Y3DqzRgRIKlDf3e8yL1IZHKAu3d+1lS/XSIHrI5lSmp+qPXp1NOqxwX464fbA3cf8VrpbODKW6GTbMhVgbImiBfHHiMQbCRJWnrCjRj5DsXpyOHTFXioQ2eqTAcXBX5cOG6r1S2WSnLtXiCM7+xX+D10QNGYKDG7jDD85MGM22gK50ZhSAstcwuS8gaMZ8mPBnXr7KQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW6PR12MB8663.namprd12.prod.outlook.com (2603:10b6:303:240::9)
 by MW4PR12MB6753.namprd12.prod.outlook.com (2603:10b6:303:1ec::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Thu, 27 Feb
 2025 16:17:35 +0000
Received: from MW6PR12MB8663.namprd12.prod.outlook.com
 ([fe80::594:5be3:34d:77f]) by MW6PR12MB8663.namprd12.prod.outlook.com
 ([fe80::594:5be3:34d:77f%2]) with mapi id 15.20.8489.018; Thu, 27 Feb 2025
 16:17:34 +0000
Date: Thu, 27 Feb 2025 12:17:33 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Dave Airlie <airlied@gmail.com>, Gary Guo <gary@garyguo.net>,
 Joel Fernandes <joel@joelfernandes.org>,
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 paulmck@kernel.org
Subject: Re: [RFC PATCH 0/3] gpu: nova-core: add basic timer subdevice
 implementation
Message-ID: <20250227161733.GH39591@nvidia.com>
References: <20250225225756.GA4959@nvidia.com> <Z75WKSRlUVEqpysJ@cassiopeiae>
 <20250226004916.GB4959@nvidia.com> <Z75riltJo0WvOsS5@cassiopeiae>
 <20250226172120.GD28425@nvidia.com> <Z7-IHgcVVS8XBurW@cassiopeiae>
 <20250226234730.GC39591@nvidia.com>
 <Z7-0pOmWO6r_KeQI@boqun-archlinux>
 <20250227144618.GE39591@nvidia.com> <Z8CCKl_yA74WjpQ1@Mac.home>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8CCKl_yA74WjpQ1@Mac.home>
X-ClientProxiedBy: BN8PR04CA0003.namprd04.prod.outlook.com
 (2603:10b6:408:70::16) To MW6PR12MB8663.namprd12.prod.outlook.com
 (2603:10b6:303:240::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW6PR12MB8663:EE_|MW4PR12MB6753:EE_
X-MS-Office365-Filtering-Correlation-Id: d65e6306-1a82-4a8a-a6bb-08dd574a3e65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LKV7L+40/izksOZxRDtWQKZSmQjbTpgGqqucR8yybZLyIomILogAUBX6LugG?=
 =?us-ascii?Q?6gG+xc1QS0DlibDFH6ATzbCrKREAPYfPWOITvb9XICY45fUEeAH72pF+KAw/?=
 =?us-ascii?Q?h1Ngnv7FxN/gCpS9dXplSAy2llc1nsNpX3dQdxoG3CHJQb94o63xMWvhAGH5?=
 =?us-ascii?Q?YiikMlSDxD0nP9+XTOXTWo1D2tVxOajDqCDMsIbkWE7nicWHv9gptGU/mi4l?=
 =?us-ascii?Q?oR0Usbh7XyErnp/75PO1R9FGbNEENXUkCZ4/KWBYideghP+/6kOzTy738ggc?=
 =?us-ascii?Q?pXt/IWUM5Gz5e8ZA3e5tKokSymkAZO+3hk0bTphCfNIUxrRXPx4pXVo+k6Tl?=
 =?us-ascii?Q?9JLfC6yE0eGBaw6v/k5seNPgqZH2wJt1ND7AAOnB+P5TLXnbAutUZDldWINv?=
 =?us-ascii?Q?mamvhFLuAe8nKRWvQT/rpwwqjia1L3WiPqRNk7FmuvDFgrMw8f91Zm1esynC?=
 =?us-ascii?Q?aQgscAfqenDeXcVIkQlFsh+sb8ZwxFLFhk9u3DX8o5DXN2j+8ekXFflfo4n6?=
 =?us-ascii?Q?/aAYs0H6L4V92rQCwLtBg51lNRB7NogJA2+8XVB36mRHxIbKB3bimTXr1AuB?=
 =?us-ascii?Q?dajPJjRrYqLT5U64l9JrWKhzL70/aZjNowPmawqLmUWkvqJ6FbuIcFhAmUBs?=
 =?us-ascii?Q?HHBRVprKN8KLOzD40mgw5jb3yKG9sMn6bbISnHm1mJuOmmk4daYfZM2UOPFn?=
 =?us-ascii?Q?iC0Ln6lMM2cC57mQtQvmTkH2aJyFqeEzl+wC/19IKMH31fEqDzr/OG5apIBs?=
 =?us-ascii?Q?CRUn7bk4pJKwXIIKkhs0X22GGWo5kXl+Ft3vznsHAv0LNBvWUomrm2odzDQ2?=
 =?us-ascii?Q?pau9iDdylAzIqx6KMm/xlzT3AyCKEIxZU0OKR8mg0ZMreO+48gXW32TEh1E4?=
 =?us-ascii?Q?W2pw2zPabbHxpxD6TX081aPF/cTTd0vx03qz1PHJ/pW0pKW35IU4RV93kkVh?=
 =?us-ascii?Q?kgVB2lglanHbGDwIZysUSEcd3cTvPezjo4Wa78AoF6wvlqq5tUOJgcB/uT3Q?=
 =?us-ascii?Q?SbC+tEaKpz65YN8dwAKe39qFNO/mTLpULAN6NvZ0Wxh9UWGH8OCh2EYuf9RK?=
 =?us-ascii?Q?z4B5OCvZrJFL3IGv7XCB8dE3/Tsi/84HaLeTJV+y9CQPbymvFVK70PDWR/S3?=
 =?us-ascii?Q?a/d74KdBltudpQ5SL3xeSGnoQFPJXvSWtTxluQfjrqA6GfpwcF7COwj+s5bo?=
 =?us-ascii?Q?exk7lflh2tFA5bDtwfqwYiJVDezLOE4/Ev+A65ef2GtVVvq63eD3YcHgGm1l?=
 =?us-ascii?Q?c0Wo7z7NbcNvS6mSQT45gPL2iN00m7FXarN91pQvJuhLP3tIMLT2OFHASF+4?=
 =?us-ascii?Q?fqZ/Nv0skBgv8dWbaNk7fkjR1jyM9ZghUyEOBA6h+FTl2QIVy08DZ2FMhr7S?=
 =?us-ascii?Q?26E9ar67/V5GPc8WJAcXNJsOYeHF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW6PR12MB8663.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Dg6ubyGo/kyHAaZgaELHXScM+e2c+m2C+UhScsPYV3jUmon/dfYNpAJPSUg/?=
 =?us-ascii?Q?9VMmr8BbtqVDs7v6clwJrp3/vUo+9NwzF2y3qr9Mp7X9M4YX8Oh89ftbKBAK?=
 =?us-ascii?Q?2sgA/2o5TmRaiE1kB7mIp5Cxq/QmB7uYqerV44roXCgWge9d9q0Jpaxo220D?=
 =?us-ascii?Q?R5ODpw4RcFigI85Urepkdk9ceiCuegAFjCL86qUBGbQr360gx0Rurc8+qFdX?=
 =?us-ascii?Q?J1Tex7JtXubRVpF2U99cEuEyjiBRAY5R5d/XlWLvJareQ47SvoWmzWSBI0Tk?=
 =?us-ascii?Q?CEwF/Nh8AiIjd3zDFAUK96sefu5quwREY5QOx+7pnMsm24WaZaDT68gCtIHX?=
 =?us-ascii?Q?nf2I+z5agZcQJjjbW0Ug8tu97lFxocGp69ZD0Ctd14ZFtVlBvbLw1ob7j2e+?=
 =?us-ascii?Q?KsSYLYV+PHEIV10r2jdYHGx3OtV6rPaPTiDmWYWN07rGUfUjkibZeCr8G4BZ?=
 =?us-ascii?Q?3DlpkQFdnqE8fyqfC/l/YKcrufqFvP7aqxlunmxC93FquxrNwWMD5q0ZQvlV?=
 =?us-ascii?Q?ki7DdPsiBNIEnKI2G7t36e1DxEun4kSEdEkbsMl2RohsyBP7neCeji8yQtgl?=
 =?us-ascii?Q?fXlxUCJqrFG8wqtjyvztrdnxQQ3JQJc2c8aKVQH5v8M8wk0MAbS1s3FGptbX?=
 =?us-ascii?Q?GEVHoBouQkzU4uNST71GWnWFeQfMErXk+0xlZ5aIZ3YqeK5hox/3K1brFHJs?=
 =?us-ascii?Q?KLZgS4maGL0PeI8EVEejoSXQGFwiOcYX72tlkqC85YcJVbbog1JbcHX2Cijo?=
 =?us-ascii?Q?eIPilCkSFekHk7sx3wGUaTWwpA2LfGwAVvyluHL2PNg+o2iqtvw9aK0faDtm?=
 =?us-ascii?Q?WwKr3T5s2hM1GDWONRBfFpY7aBe9OLvqYhh8cRjHMAJfB1O9X6WUpgLx8bwP?=
 =?us-ascii?Q?p0Uow5jNuQfOD7mclV4lmsLGy6E3Hobd4wGFTiGmOe7g1VIfQ5ihTmZxzVCr?=
 =?us-ascii?Q?IgnImakCbFBZ29uZH+JPPl6z8a+e7+6CAiUIIiknvzM8S4sZ+EEsYhIeMa3s?=
 =?us-ascii?Q?I5TcDORzANGOgEOnD8fHgbnyxwpQSqqmyAPwCYMQX00VGAP4uR/iSO96WkPE?=
 =?us-ascii?Q?B67goMJt0mom8YjL003fitNA/1arXSADxeJjt6qC18kHvYTGvgU9OymmLUDs?=
 =?us-ascii?Q?6NficmgtTwaE8gTYD0/fz1FoK78xf5Qa8MenKGY7WIs9zQP9YlJea5+eve8y?=
 =?us-ascii?Q?XZd1ryVGZ2Rz0UMtsk9swyjqoQoJ+M4HdZgo/tHcLEHjxo5Kx//fYn4IO5ZQ?=
 =?us-ascii?Q?d6DsyEKrxCRzdeRzwGdZ9jcIfL0pH627RsCeWB+o4gHqh73fdK+TTERFzQ/R?=
 =?us-ascii?Q?32LAVnNUpA47yggcHp9+ffhNgwI5F3PEUiFMCQSlt0m5jLK4aeUX2HpErKAA?=
 =?us-ascii?Q?Awjw1aC0AoeEZ6TzWqnSxWMrc/rRZHzJgt39BKTz6UGT7UeZ05ibhpDE8ndk?=
 =?us-ascii?Q?u3zn3wllHdjEEmvr+Br049ZjL1ZTgbKq7OFITJxpCl0o1CWdilJrgRS8FVwC?=
 =?us-ascii?Q?sWGMD6+xZ2j5LHAx+vqohUHsVh8IX5lNgCGKg96Zrv01PuWXYzHrtUhNEVYc?=
 =?us-ascii?Q?htU27uB1+17snbjiB7Y=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d65e6306-1a82-4a8a-a6bb-08dd574a3e65
X-MS-Exchange-CrossTenant-AuthSource: MW6PR12MB8663.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 16:17:34.4332 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sknfMVj3zZ5s9HzjdT8Zr4dLCMmIFikDbw08Fbmix7/CfuqByE1ZvhFcFO3tLmow
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6753
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

On Thu, Feb 27, 2025 at 07:18:02AM -0800, Boqun Feng wrote:
> On Thu, Feb 27, 2025 at 10:46:18AM -0400, Jason Gunthorpe wrote:
> > On Wed, Feb 26, 2025 at 04:41:08PM -0800, Boqun Feng wrote:
> > > And if you don't store the HrTimerHandle anywhere, like you drop() it
> > > right after start a hrtimer, it will immediately stop the timer. Does
> > > this make sense?
> > 
> > Oh, I understand that, but it is not sufficient in the kernel.
> > 
> > You are making an implicit argument that something external to the
> > rust universe will hold the module alive until all rust destructors
> > are run. That is trivialy obvious in your example above.
> > 
> 
> The question in your previous email is about function pointer of hrtimer
> EAF because of module unload, are you moving to a broader topic
> here?

No

> If no, the for module unload, the argument is not implicit because in
> rust/macro/module.rs the module __exit() function is generated by Rust,
> and in that function, `assume_init_drop()` will call these
> destructors.

That is not what I mean. You can be running code in multiple threads
from multiple functions in the module those are all being protected
implicitly by external C code functions. Rust itself is not managing
module life time.

Then you are making the argument that everything created by a rust
module somehow traces its reference back to the module itself,
regardless of what thread, callback or memory was used to create it.

So all bindings for everything are expected to clean themselves up,
recursively.

That does make sense, but then it still raises questions that things
like workqueue don't seem to have the cleanup.

I still wonder why you couldn't also have these reliable reference
counts rooted on the device driver instead of only on the module.

Jason
