Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DCC0BAEFA4
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 04:02:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ED3710E2E0;
	Wed,  1 Oct 2025 02:02:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="UHcxSLJq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012048.outbound.protection.outlook.com [52.101.48.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32E1410E2E0;
 Wed,  1 Oct 2025 02:02:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yD1jIRhY+bvNcYYO1i4pSKxvXkK4dzWPVFA8n7UAGpOr71sxnZnFSNg8LCaLMo8yI5wXzxxFT4F7WPhLLZkT7camtHMCtPdpmM5JenAWbe+X7iel/kDfZzUfRjt74oPL6KjJ0ibCFdNhizEGgUpeog+OKwgF9OF0S9Rj0Q6D6JBfMCwyWH6YJJMPMvnOsF6XheHnsY8HSTLZwq1ZZ0fC8wD7Wg/27dhD/0HI6lwp8DUQ9aFwxNZWrLnzskeOlL5N6xo7zjstKmcdlib4l4kn4w0MaDePSj1BgWh9N1jBJyzdPz/Uv4UdIt6AHJmAEGH8mJe1U1A6G2+boyZ+FryIiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=noS9ybqMO66wkrjhNuSB8vYrDkqnyZZ9kfivWW4lHz0=;
 b=gungsQ4pF0vsdI3/aCPBUV46oVOiYR9VtPf2+0njSQi6frSHLaX5gquGeg68GxJ71S1oQrycMPAWp0TVk0CHPe/cEXJF1QlbjWDWrPH4AoKzmXa3DpOQmcftt82dd8ENG7fHdkt0Fft97ybXxJdTczv3LbOIQYgxYg440/iVQvj4NLiQQRTq7kzLxC/SC69VHKCGQq2hFFDBZDO+rOO2qEfjYrHqsS4Kie8xxjLkxrIQFpDeTtxid/K/fjcbArwg45sQRSNwxChi3bFimU6i6UJCLbK8Nvj2POViKbxhSgF2MfYyTzRiIDIPyOsLWnIQgJTtxhEdkLDgRzDKxuA6Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=noS9ybqMO66wkrjhNuSB8vYrDkqnyZZ9kfivWW4lHz0=;
 b=UHcxSLJqSyyZXFknrG+WHTvYYqkINvIkhNnw+zbqu29oCago94VxIg1ZJeI2k9oD9emvAeOKqA1GNg5PjCyWRx+yobXjiLmeSbyjJnwqyJG/rNPx+o6OjJEo3QKG+aGkDCoMK/96DohFzhwNOXeRsJH1mgDPfHmh27Ff/+BFscJ2cA0oqMmD5l0F0JLkfdGSjfhED6je1ffjjsmdG3Gt/R5M6OkmVmkSbJlUcjNVTuZKaA2y0OnyPCwmwoxpq0W+C6k/o0kGUMrh3ddqfheRUbRmPfWRO3BYh9CwE/stzaUSdYqOYQJFt6ILkb/oFBhJ4+S8reGJs/wCVBhJecJbiA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 CY8PR12MB7243.namprd12.prod.outlook.com (2603:10b6:930:58::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.17; Wed, 1 Oct 2025 02:02:18 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9160.015; Wed, 1 Oct 2025
 02:02:18 +0000
Date: Wed, 1 Oct 2025 12:02:13 +1000
From: Alistair Popple <apopple@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 acourbot@nvidia.com, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 John Hubbard <jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
 Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org
Subject: Re: [PATCH v3 00/13] gpu: nova-core: Boot GSP to RISC-V active
Message-ID: <mvp3knyp6ls2mk5jjgzef7jis3uwjjxdm2wmuno22r6h5zue5z@ph4gsisqw2aq>
References: <20250930131648.411720-1-apopple@nvidia.com>
 <fcd4a013-0eb7-4a3a-b916-1dc6c444225d@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fcd4a013-0eb7-4a3a-b916-1dc6c444225d@kernel.org>
X-ClientProxiedBy: SYCPR01CA0031.ausprd01.prod.outlook.com
 (2603:10c6:10:e::19) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|CY8PR12MB7243:EE_
X-MS-Office365-Filtering-Correlation-Id: 2851100a-3ed7-42cf-0b7c-08de008e8cc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oTJtadBi3wRRBA0qD/WnZOwVjmBSVlbW4Bh8c5n7nM02UcWo/sjuHluOgOnM?=
 =?us-ascii?Q?kOxkXwnPKzCcx9TmyC56TtNZGz7pfuOBe/Wx87qT+Ow+x0nNcVBlT1d5TaIL?=
 =?us-ascii?Q?qjUByh5IFHoEugC3J+xeH9ETHFqhevc3sNu/bPiSsEcCtnp3/oeHX+H+LM5F?=
 =?us-ascii?Q?+IO5uYuj1YSpidzbkpT90kxMpiIeNxwNTKpppg1Dub1c/jTdAZ/A4zlaD/Xu?=
 =?us-ascii?Q?1hopZXjUottqb4uvmHVpd+yI9qRNGkhwPlEL2Mo5UviZGkxGS5yGW9yD6bOr?=
 =?us-ascii?Q?ka62T33Shp6uUN01EDjEtWpe8x/XwLNCdWYLu7FnW9igSpuqQKCveRCDjlxu?=
 =?us-ascii?Q?R3hDI8bsC9bAlVqX5H7wLfjroUw5LTUSefY0NzRiSXF6DbJaRlDTqlDMqbac?=
 =?us-ascii?Q?L8ekv2xlFaY0rYJtf6n5hSV5FuWTDYeUn0db4nqOyN08RXq9ZrIUUmk3TR4E?=
 =?us-ascii?Q?UhqgKh7E/OZ1AD9l21zYmaVg19s1Ie3cKyuxxXklmTt7MjUy861OlgnWPQ8t?=
 =?us-ascii?Q?FSZF64kRO8qIjnAwNy9fdozqrnXv31sRkcigF38h/ggWSH1tcc87Umf/+6RL?=
 =?us-ascii?Q?xphMix24lIJo9K4gss8wVwbB+eEAELxYFp1cU8RvblkwCB8k5mf3UVAE6fC+?=
 =?us-ascii?Q?Mzur4j7LpJm1SEQW3aG12/8g+PVGVV8N0ClfZ0CoaTyxbujKzF/e+rvUEXmO?=
 =?us-ascii?Q?Aw6h/UGTvfScYAdofFnCNdWqhhxYvacj5WsgPsl9rtygzZDNjktrdk9pt8/y?=
 =?us-ascii?Q?qKdD0sC2PXQihG7axBTPpvOA3Og0yMdG8OemP2gpOMjjHhFzGNjzFLT7Zj4p?=
 =?us-ascii?Q?lJxMKLXmbrIVxk67dUshk3HTDny7V10juRoeJywNW3RKoPzDgtWHJyN4L1PG?=
 =?us-ascii?Q?orvOugPsTDg30RmqenzOkX6z2Lr+v5iM0xR4R6kaXT/Rajo09mTugc7oeY31?=
 =?us-ascii?Q?HfqM1nDSMpL97Zdsh8VIepMT5wXNkBj1QlZaNk9EYIAWq1s2Sa0CXVO2ymUo?=
 =?us-ascii?Q?xZNf/HD/wAkXHUsFOE0pdb0Yh8qTNiJSgOvIak1lCdVbj92GBUCyvrjjVJ7y?=
 =?us-ascii?Q?pSzS7rAdvWDGPTbsj+HM5F7l5F/y+eccsGhlPIZks7EyG4Zc5IjlMHLxWGzy?=
 =?us-ascii?Q?W05VY1R0/g7kJOpuKFHYMSKYUoz6dSyP9tzsvWeIqoE+tasZnBLtUnv7UzVH?=
 =?us-ascii?Q?n4sFHqYnV8GVJuNXJTfw4EC+kdYugtBimPCjyzbWYVZUZkbfhBpSFO5B92T5?=
 =?us-ascii?Q?7zZ1/XrgW28L/g12/Kng3DnYVOSMvCimGDgWMFe0gW5VJbnRaDwLFaFAQkcW?=
 =?us-ascii?Q?83Q6KFQzrnV3nU4oCzOBb2Y4FxGjsbCeI81gTdFznvJFsu89QBVp61wpYsbj?=
 =?us-ascii?Q?1se7bGxxljtjl+t3RNgpocYBeDtdK0W90DzhmIBTP0G4HCQi8CZD97X/vcVo?=
 =?us-ascii?Q?4MHc9eVNcmopQCBA7XZ2ohueC1aXkpcB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VyC5mj/zdyUos1aA70l9VX0gova5EaQIrVYASQtWQr+AFI1iVIcuWyv67vL9?=
 =?us-ascii?Q?COeMaj5dpStqT9rNsADUCGoPNoVldDsLhlWlk62NheBL2g/Tdg6fCPWcWBKn?=
 =?us-ascii?Q?19Wmxh59PnXLx6lqfGPeC19ImnvuUrZB4XqMHzUgsnvi61Wn7Y+YLFB1EmBt?=
 =?us-ascii?Q?bKLzcRn5Ih+4TKe8r2kgPgS0nUDpV8HN/8U2X+XK1JS6NKcpP5RcaJ/EyrJM?=
 =?us-ascii?Q?X77ng3JtgpvTsn8Ms2HHMUSEfJU1vkP/fpRwzwXCPK4jx4o1wZv15nJbMVK+?=
 =?us-ascii?Q?OUq8WLswpQ+cQW6IV58v4yKtb1kHqXwBFvb/t1nqWb+sU7B9hLID06i1wAOl?=
 =?us-ascii?Q?2WBVO2u1ZRvWssUiO3l9kWzolKOJt/vhIM0j4OlT+bNSCy+eQKJDlLWbvJlK?=
 =?us-ascii?Q?X19Hz2yk5wP9YeApGL3RUyG89YeHHZ9DQDeFPErv/MWH/eWitupYFz7EaKyi?=
 =?us-ascii?Q?07mJkIxKFT0HofRJM/6DevjI5EpJjxtX5civ6VSv+9DqyoSpAxtjWnq8vJDg?=
 =?us-ascii?Q?qgoSSYx2RCa6yWUrX9OJ0fIDGh/ypao1xVi3uf4C+Ti3HeIydV8jHp00vNoy?=
 =?us-ascii?Q?nVFuovNkEGLJx5IP2CSi2P5B2Of6gng8lzWtse4JC7ACP9QHtKnQxk6TJ3qA?=
 =?us-ascii?Q?gFhB1Xx6512mPBgpR9au6rsro/ZW/2fjoxF9QzGbvjNi2JW/b+Vkh4AVFgGx?=
 =?us-ascii?Q?vzFG4LsHECMYqX/+q6QMuWwyU55cdHPX7oJyj6TQ/fp9a6qr9tyNSRASNa9o?=
 =?us-ascii?Q?GQkoGkYG4Qy9o+6FsBnIhENyEhGCX7+HCdrvyELMWulqY6xg8g6MccABLtSp?=
 =?us-ascii?Q?RrKnWxyDPkdlF0Fy8pjZe62FmuhZfDMYYQsLv3hfhOghSJaq9ze7hVL+0pkp?=
 =?us-ascii?Q?yg28UUxvRiVAxmfW05Kg7ssSIbRk9FSDSBRWvRV1Jlq7ZU9WFPkcJMY9Ciys?=
 =?us-ascii?Q?haeKwO6UXMlPg2nM+alNTzVlZma8aA3/a1tT/A9cXgpIvozKvh3E+Yra7wbc?=
 =?us-ascii?Q?hYBZUUd3pTwSCSEFEP1HjPlprcsAfFrjqWOGjdZ5rX2YKpMVQ3lINFXhUZm3?=
 =?us-ascii?Q?YlK6cDsoloHO3Khr6DGuEJAx8dFnhKgLbpFcndKth9BeIMFP7IyEIAhZhaI7?=
 =?us-ascii?Q?TcBLCWXYRfufQbdBR++XOqTxwA5OUybUh/3Qnq/FCWW9XwC2Ajw2T5pnnL4H?=
 =?us-ascii?Q?3qgFhSjdyS9ZawUvV9r1POIcB5nXczhT5UJm7bu9kwA9zJnPhrcFpIH3TJE5?=
 =?us-ascii?Q?bn2wqxoGdEV9s/TCBk1D2ratFQRpYVa2Oa7wJimhG3pYc3/mp43l45FFdFxb?=
 =?us-ascii?Q?FWY2gR0TLrblCrbjkroengBg6GPe3Awgy7K9wFghmZ1FSQyGLkVoGZaeYNYS?=
 =?us-ascii?Q?xN0ukoG/10d4hXNbYy7EWBaCFaG7NlCymAsDIYV757LgJLyLjgNlrjnuP84O?=
 =?us-ascii?Q?BftbZ5DoZr7XAzxkUkZQzh6+zjUPT9ELQjHsOQuigHJlAHfNDHUHA/g04FwC?=
 =?us-ascii?Q?e7YNNadALpApi+UFW6LdeUNPOhmNeb1Gth5Ps6ipW7d4zLazH3KvrewUTJ2Y?=
 =?us-ascii?Q?6+P/7UkiXdvpvd1cdxN7NuyRx7FBweSg30KV4jeT?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2851100a-3ed7-42cf-0b7c-08de008e8cc0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 02:02:18.1908 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y65Pi4PGPtNYQiNtXH71odC33l4VGOpybEIhSw/CCbNF1B/Sw9xU6AOuJE40D+WFOWU1eh7eOA6bws/lxfGtZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7243
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

On 2025-09-30 at 23:26 +1000, Danilo Krummrich <dakr@kernel.org> wrote...
> On 9/30/25 3:16 PM, Alistair Popple wrote:
> > Changes since v2:
> > 
> > The main change since v2 has been to make all firmware bindings
> > completely opaque. It has been made clear this is a pre-requisite for
> > this series to progress upstream as it should make supporting
> > different firmware versions easier in future.
> > 
> > Overall the extra constructors and accessors add a couple of hundred
> > lines of code and a few extra unsafe statements.
> 
> A bit of additional code is expected, but it's not clear to me why this would
> require additional unsafe blocks.
> 
> Can you please elaborate?

See patch 5 and 6 and specifically cpu_read_ptr(), etc. The message
headers are embedded in a structure within a DMA coherent mapping, `struct
DmaGspMem(CoherentAllocation<GspMem>)`, in cmdq.rs. Obviously we can't
call `dma_write!()` on them because we can't get to the opaque fields,
and even getting to the methods requires accessing the GspMem within the
CoherentAllocation which requires some unsafe code to get the CPU pointer.

I'm open to suggestions though, maybe I missed something as it was late when I
was trying to pull this all togeather.
