Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 284A7B42C77
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 00:03:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 989AA10E952;
	Wed,  3 Sep 2025 22:03:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="fcAePUV2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2089.outbound.protection.outlook.com [40.107.243.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62B2310E950;
 Wed,  3 Sep 2025 22:03:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ji/LlVZGtseJYyBuA2BwQt5VXoG6at5wq0CbWaCQA88ixrU1l56zhl+dyx/z/p7pNWALsrl+YkxO4DNnvNEvpir7uwd99rjaPz0dx3SXzI1Yu9YDYwgy6joT1g78gRXHXt307BBmNWIJ/0dgTpFzL1YDsPyv2oizyCa5vnculKR33EuDl6yxdvCTJEMgaxsPwf2mp4l6yyhwE8WQKUeEGIOgNbkuAwX1xgnv/HbEcDCaOG6fgFlVK9qC+pHhlyj/EpWRULVQgyYzwBUSWhQj82VrMspuN4QVPLfXnXT2HGURNsyYP+HspGCKNe+AoVTmhm8fC6XjqSfxK1nM8yMCkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4jAyQm869mppLN6CPgS1nrMa/gsACc4wbi6KRPBmK6g=;
 b=vB4o1hNiiVU3LsJ40kiktYJaJpA8xj8rsh6xYFupg26JxY/P/gdQX71P7OmBDHgUJrOBfe1R1V5QKwQHn2LvOUgvoH9azf4o8o+hBj0TvX2N5QvP6rRfad3F5ZYfPrWX4vhEqeM5H3/2Csr2ntDBHS6axBQA8tckDMi8t0lGG/U95nWsz55EoWatVWLg8OEjABh+UZUqOSzdZrq2kL9RXQaPIHeAgl9ZVSUIcjNm9fJV7Ku+RkGFssLgM8xddYjhFdEWCdB9mvGbsJhkUTxTn98hsHFxuMBZKEx/y9fiqh3Yw2d3FTMFRTs3zlIZMywnnWjneJQ3kM7VdLYeFTZFBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4jAyQm869mppLN6CPgS1nrMa/gsACc4wbi6KRPBmK6g=;
 b=fcAePUV2yoFH7N4/bU43XvPefSzA/ozwY7/tdWkHW7lTDx1YlRW6mrtMRbCupn6QCq2DAmWnxfJ4g9IGg12GhQV2+3lujE0FBwTKJW2257Ty7myi46A9FE+DpFvMGaqbT0sqAqbJRxnX94RJdkGdaBvW/3oEAN3y4gNOKzye63vLpLzvZiBVwklJ0pwXKVGzJwj8NcHMitC22Q9Vr8tQesnQBEq1q6d99hLSw175lfVJ3SRZk8IYmGnoGk9rr/l5jCYBUTfIDRplxOUPvw8UU6jz+XDI79KfynC4Zu1/G/49WKnVIn8b6fXykk5Vopr6w0gNZszfRlWgtuUFo+sDtw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS1SPRMB0005.namprd12.prod.outlook.com (2603:10b6:8:1e3::12) by
 SA1PR12MB8743.namprd12.prod.outlook.com (2603:10b6:806:37c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Wed, 3 Sep
 2025 22:03:15 +0000
Received: from DS1SPRMB0005.namprd12.prod.outlook.com
 ([fe80::7629:20ac:4306:5f4f]) by DS1SPRMB0005.namprd12.prod.outlook.com
 ([fe80::7629:20ac:4306:5f4f%5]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 22:03:15 +0000
Date: Thu, 4 Sep 2025 08:03:10 +1000
From: Alistair Popple <apopple@nvidia.com>
To: John Hubbard <jhubbard@nvidia.com>
Cc: dri-devel@lists.freedesktop.org, dakr@kernel.org, acourbot@nvidia.com, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org
Subject: Re: [PATCH 01/10] gpu: nova-core: Set correct DMA mask
Message-ID: <3qlp36gvncccffxk3dvsh63ynydk4zqekzikv4pdzsnpgsy2wa@tqwpcc7mga4r>
References: <20250827082015.959430-1-apopple@nvidia.com>
 <20250827082015.959430-2-apopple@nvidia.com>
 <b5f42338-e5b3-4823-8aa9-9374c22f1209@nvidia.com>
 <jbkvgmj2lc7petnt5wen4hvkpyu46t6rn7e7r2sekpqdvojgj3@qste4uzb2w2l>
 <322e1b57-394a-4445-9a34-a46183d3aa45@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <322e1b57-394a-4445-9a34-a46183d3aa45@nvidia.com>
X-ClientProxiedBy: MEVP282CA0018.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:200::12) To DS1SPRMB0005.namprd12.prod.outlook.com
 (2603:10b6:8:1e3::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1SPRMB0005:EE_|SA1PR12MB8743:EE_
X-MS-Office365-Filtering-Correlation-Id: 41a9097a-d57e-4010-03d0-08ddeb35ae5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bInCI0quDbR4MgS3yR6+alHJ2ZrmEyI88A2NkSIq502iLJWbwSkd3hUclnzM?=
 =?us-ascii?Q?ECNIEN88ery8Rq1moqtHqvYuAHgn9OOVj9TT0+3jDuJiesHm4Op36Bl5Tl0Q?=
 =?us-ascii?Q?C9WxaSHrOIttWSLpTP0I9DQgLqm73qT/DeXAEMMEwaL5kq3PlbRFXCaAh2u1?=
 =?us-ascii?Q?FcIDdYC8bCbruY7ub3igog8vAT13TfZj4UH90s3OcUKKRoHLb2BFPZDlKP+i?=
 =?us-ascii?Q?DxW2NOSlT8/Os8fhgDGESk89D1XPq6ZJfCxgH4Rf6yg3g94HbAgepeGnuwNg?=
 =?us-ascii?Q?72UgmlQLM7ZoFoDmJnaIK+6l6LTX/V8JTECnKgXaH4QHUxmY1q55N+TQPkcZ?=
 =?us-ascii?Q?OKvqxkgY9t6UueQvJLXDFoGlKzlQEPkthDGb1vLW4mN/nQ0ZaU22YGjUF2pI?=
 =?us-ascii?Q?A1o3iLLKg105dgAoNMxlyCxVJVR93lom4+RNqx8ZyZWwmUaEh4ird55SEPrk?=
 =?us-ascii?Q?E5pwQyWMpDMq9cth3Spw/VS2qeQVDs+JwNyhKoUzvQBHBpENtQOqShofzZKp?=
 =?us-ascii?Q?zIYfVOfDB4wH4BAQYP3uBPMqRMJthCZ0J6OYPcruU4h7X7PctKhrNjyABw9o?=
 =?us-ascii?Q?QxDp6i/uyv75ZA9W6UW4n0jxeKSdMc8Ldf4bd4z+ZQWxcuyCw95/RAhCt3UF?=
 =?us-ascii?Q?rPvHzePWiVn0zqwqRJwo8o+e0q0yTkT/lePbjxSp6hBwcKSnQTWqTzZTf3mQ?=
 =?us-ascii?Q?eX+7Jimp9cYMoG0V9iLL2Q6StsxDXamcEQA4ezjkZIwn0nin6PvvZKuAZHjt?=
 =?us-ascii?Q?e1x27Jl0qNCOVTrp/CbBqfjD/Kg7MBIopzOHtqG7xja/6qDDABw9RdaSkcxM?=
 =?us-ascii?Q?pDvdz5bimb61bN9g72MDHZegTt4TQpUPoP8nhwYLAG1uULhlQqKYVpbqRPgw?=
 =?us-ascii?Q?d2fsJ2TgAyab4gzfK9mt+9PJAmDbzs2wBtMMiy5kawRPDsMIlgSUcCQ93WNC?=
 =?us-ascii?Q?ftxO6qSyNJ275IcLq3zfYHyy9ajyBb+CdtPPZBaoanAVi7HMUcFod+9Qneat?=
 =?us-ascii?Q?/EqZW7MYffVZzMfJYrm3LXv18aCkjYNtR7yfWzyZ4l/asrARoSkCdpr25usb?=
 =?us-ascii?Q?js+IxfjpDfacE1xqvl3T5bpYTE0HpuPlxcuX8o/dSNE5/6XLqZm8h9nvjxFi?=
 =?us-ascii?Q?yQ+5SOV9cwD0wvP2KifJvglG1D8igLvhax1wPzwqORzlEELeLmzi1VumRgeH?=
 =?us-ascii?Q?duu7rQ9fWcdm0QVzFwYP1qavmWEPc4gjsyKYITsBbzNbwY7bEgvSaDCzP77w?=
 =?us-ascii?Q?OIMT/IEH7WRilIn2BsHi1uO2wIvBf6+A0jJn2DmdKtPcYuWHFr6NSGZhQw6g?=
 =?us-ascii?Q?UjECViYwY+8EsRFTm8q7ISiduPfEHhgVSG7k32CCwN6jlzhWCjxZLuhFD8zD?=
 =?us-ascii?Q?2akFU+xl/sl4BwEW/j1O6I/PVwok5evRt02SCmydNeFhndxeAhfVuCeTiyDB?=
 =?us-ascii?Q?d1v0Ho0PVqk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS1SPRMB0005.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fjeKhWX0Ni4JaUZRyM2d0R6MZPWV//ZmkrjxSsDC/aJwQ1vmYS1HniE7yco+?=
 =?us-ascii?Q?ZkVE75WuausaRt3Y8R1F5k9aEYHQ+buJLta2Gf/VSPPZo+ZzIbKLKzJykZdr?=
 =?us-ascii?Q?OF8866Zm+KKfz0pUMr0879aIed/GETyYtX1xv/kWf7/hVSnLH/FXBKpqrR1K?=
 =?us-ascii?Q?KVvlTgRSrTdgcM25DvA8VOVrZxPzEAxxgZAYrSvYnbStIwXKrh4TZc4HN2an?=
 =?us-ascii?Q?USAApeRdeGiwUJ6cvb3b23JKDk1hRr+GCV/1exn8Povjx4U63ylb57QYCacA?=
 =?us-ascii?Q?mjpDzHSqfjDiZXGw6SALsjqPNoT4YwSqkdhjOUdO5FAEwjXDKSziUXca2nDO?=
 =?us-ascii?Q?wXMhMakkGBpSEWQ1lrlZIUo6HFUmxnukPLz/Cp1UnBiGmuSZoJqimh+4o5xX?=
 =?us-ascii?Q?8cf5x9ZW277Nm+hMRFOehQCW8Mz9gwhIs2vHVJ1REMG8tHYlZx//fkNYNmcj?=
 =?us-ascii?Q?pFlPjFZ0bsPJnvxyUfn9nAAKGMDAZD/cguhFQNaHpFuVpuFFpxJhVy77eFl+?=
 =?us-ascii?Q?eK0PjNGNDWJ+jlm49WQcd5ZcG/hQi2g5aDjtqnBRHylsYWXvy6mD6v6ukRSt?=
 =?us-ascii?Q?IPwqLAKvn6rW1QTRwAHQnAr4Ci8F++qzry2hqEp19IRNIJWkhs6aGdJW7NvO?=
 =?us-ascii?Q?5VFYvbUb4lemgXRFdrcu5v17CAR9VX0PbsrnrDH1Hoo3v3ZdLOrgLXrCGDaP?=
 =?us-ascii?Q?TBl4fP6J6q4j5n+gZtAjap8Sq2zIKK61BIfvCrXJ3mwhAmpf87lkIuj/nA3k?=
 =?us-ascii?Q?xsQn/DMdTEA51ZYvNA+QIz7Happ1XBWIrpQzvTqgddlseqL567JS4kBdCTM3?=
 =?us-ascii?Q?OGABloFP4RqCGHN61ULbYUwFt7qhXQAlEGJ2iniB7Z7d0QfM+AiZbInM2qHM?=
 =?us-ascii?Q?3+eMb3A8hopkLXQG/5qx6N9waDDKwbBliz+jaIp3iC6koEPyH1P0czKj98oY?=
 =?us-ascii?Q?UbfYxYwyC0SX3dzV8j1y+5/FLgrqkMpNby/zW3inpg3KNqyaQw7SSfcdu3gv?=
 =?us-ascii?Q?n6UuFRANLuLgauqOjZTBAVdseKeLGrFi4zSek1T6uph6J3OtP1FEuzIhmU3q?=
 =?us-ascii?Q?lp+7Ai43UonitM57S+08PKuR30obRCxTgLO2kOJejbhJoPfNavWKalXuqdIb?=
 =?us-ascii?Q?MMxiqA1gfaFfT1ISOy7M7fTpoVh7YtVs+FpeOc1HQYJqO4GN2GRyniskjdqC?=
 =?us-ascii?Q?BS6Dpd5IaGEVxuhyAe2Z4LQ/dEKX/XqOAkszBwHallhCdEKbgW9cqc4DbBjo?=
 =?us-ascii?Q?hFOf8tBps3A37Iy8+luOyie2IY3g1HhiMQzm6/zSjvVkUPyFVs8kLXAWhCcH?=
 =?us-ascii?Q?ZPfKn002wH2OBwFfq4aJvhUFl1A1r26J2QlaP4bsMU+Hd3wzO0/xnce6npY8?=
 =?us-ascii?Q?Soa2uazrdGer8jvf8+DOPVozIJC60+5Y5TLKGpO6M0nkgHkRAEkY9Ww7FZ+v?=
 =?us-ascii?Q?HyIYk2EMMGjZ5gA7VKgimv4JKF8QvhKvS8pmTDJVX4OUBq/X+gtLjCiFSeNh?=
 =?us-ascii?Q?ew3RiTSumVmzyiYajSf2h+7evATmyPiGaQ6UKntmSMuEn2DLOHnZ3PpusKxO?=
 =?us-ascii?Q?GRac596n5sqJ30Mfr4xUPDG1em/NZOwNT6hcqjc/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41a9097a-d57e-4010-03d0-08ddeb35ae5d
X-MS-Exchange-CrossTenant-AuthSource: DS1SPRMB0005.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 22:03:15.1785 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4dOP5e1PLnxepMl5f4W0kLs92a1qEb839aD+WXGu+o3zUWP0pAQqUEEVqdOk8VJbb0nrAbzdOlAnwuTr2wHdsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8743
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

On 2025-09-04 at 05:45 +1000, John Hubbard <jhubbard@nvidia.com> wrote...
> On 9/1/25 4:55 PM, Alistair Popple wrote:
> > On 2025-08-30 at 09:55 +1000, John Hubbard <jhubbard@nvidia.com> wrote...
> > > On 8/27/25 1:19 AM, Alistair Popple wrote:
> ...
> > > > +        // SAFETY: No DMA allocations have been made yet
> > > > +        unsafe { pdev.dma_set_mask_and_coherent(DmaMask::new::<48>())? };
> > > 
> > > Eventually, should be 52 bits wide, rather than 48. Or so I believe from
> > > looking at various drivers, including Nouveau (which uses 52-bit for
> > > Blackwell) and mlx* (which use a 64-bit mask).
> > > 
> > > However, it works for the current series, because this series only supports
> > > Ampere GPUs, and 48 bits suffices for those.
> > 
> > Actually based on both Nouveau and our internal docs this should be 47-bits. I
> 
> Yes. Which is why I wrote "48 bits suffices".

Sufficies most of the time, but is wrong none the less! Knowing my luck I would
run into just such a unicorn system where this would cause problems :-) So
thanks for looking at this.

> > suspect I just chose 48 during initial bring-up because that's what most CPUs
> > support but neglected to add the TODO to actually go and check this. So will fix
> > for v2.
> > 
> > > So, you could leave this patch as-is, and I'll change 48 --> 52 in the
> > > upcoming Hopper/Blackwell series. Or you can change it now.
> > 
> > We can't of course just change this to 52 bits because this needs to reflect
> > what the GPU HW supports. So ideally this needs to come from the HAL. I left
> 
> I should have been more precise. I meant, "use 52 bits, via HAL, just
> like Nouveau does".

Aha. I wasn't sure so thanks for the clarification.

> > this hard-coded because in the short-term leaving it as 47 bits even for
> > Blackwell won't cause any issues. It may force usage of an IOMMU to address
> > physical addresses greater than 47-bits when it otherwise wouldn't for
> > Hopper/Blackwell (it would always have to for Ampere/Turing), but short-term I
> > doubt many systems actually have physical memory above 47-bits anyway.
> > 
> > In other words you could leave this as 47 bits in the upcoming Hopper/Blackwell
> > series or use the HAL we have come up with (if that is available) to obtain the
> > optimal value.
> 
> Yes. I'm planning to match Nouveau's HAL approach for this, in the
> upcoming Hopper/Blackwell series.

Excellent, that sounds perfect.

> 
> thanks,
> -- 
> John Hubbard
> 
