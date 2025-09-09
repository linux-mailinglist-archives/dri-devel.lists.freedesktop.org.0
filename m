Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC57B49E8A
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 03:11:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9612010E600;
	Tue,  9 Sep 2025 01:11:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ThXqIM+X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2059.outbound.protection.outlook.com [40.107.94.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7204110E600;
 Tue,  9 Sep 2025 01:11:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wWuS2bzvUzxEIQloRqzTtYiTG7hshQ+DyCYZfRaUX+HyaEyucQoZ6L5odQ/y6XQAUzctxsvtWvYgGRjso2NuCsu7kQwSssP52GmhOQCMmdfUO+QlhEVtsXxYlpK7MiCcbYXalx+pE3n/w73qtb5AXORQE2C8R/BDCwj314h6a55+NEylfLY9J54ntdhd65GAZgzFKAR9p8R6pnP0HS78s/JWnrThRpoUwFWp2vvkBT0JtDD+g3H+0e7e5X5EUkkryRa0rElnt+3IzfiAx6IcSwb3CJGrnEB6fqAH8gpu8UxvCPEZRnencCd47S2Mmxq+TMTkupVUzNE7PLBNcs1Vig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v9KeXehAAtIRfeeQ5v4Ves+DF3BdVMfUidvkJ/fWFD0=;
 b=wAOFM0KKopQ6MZdoiAcda9BQiMXbaXKQ4Hs0X61j5SphUKd8RyXk4nd9CHyF88RM9S4KlEVYN6uPuLU70XBgkUCr5TfkT1oH0uRnL2QvTDShxLiMtHDRzL1Nwz/m6OaWmp04+hLWGJOXI3TVBNEveQP8RaLOWG1HPH4tU4G9os8ls+8vX1P2PugtnCMvYAQ9njXKsRnobP5dV9yoyk0MwNengRtM2I1cLmDuy5Df/LaIqbGuMdERIiTUZiUiEONReIAKSGomiHrnJNMJA6Ql0UixC8+uS6NnZ0gQ/IF8Tyswf/snDWVuO5OC2JqKqe6LLsSeKRPNUl8Bl9leyQDQIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v9KeXehAAtIRfeeQ5v4Ves+DF3BdVMfUidvkJ/fWFD0=;
 b=ThXqIM+XMo5kkSOMUOGM2iNB3v8aa8i8xv4p1pOuJUXIDV44Muadvg0mw6WXvv3RyrKGWSFnubWx/U6hsNJX+pnVW2egGKd0nyNNHOr5A2uvIXCvvvGitbmgvSZDFmvaRfghdzIBsKQwD4i77pckyDTrnjiNYio2MsrDTjwaZ76WBnOYFksFDXTyReUK3iL5j+jTqlPaqz5eylvcPkRt171DeEPUkG6i4OAwtKooZgf3qpbyj3snGjgH7ilq14DIU5AIcU+IPj4Pxso5TvMcYOq2o8Q2KnTgtAddrns+SXez6kkqdPIh1i8FJDbqBnkzccQxmBdj/Ja2/LLBnpGPZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY8PR12MB7705.namprd12.prod.outlook.com (2603:10b6:930:84::9)
 by CY5PR12MB6478.namprd12.prod.outlook.com (2603:10b6:930:35::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 01:11:04 +0000
Received: from CY8PR12MB7705.namprd12.prod.outlook.com
 ([fe80::4b06:5351:3db4:95f6]) by CY8PR12MB7705.namprd12.prod.outlook.com
 ([fe80::4b06:5351:3db4:95f6%7]) with mapi id 15.20.9094.017; Tue, 9 Sep 2025
 01:11:04 +0000
Date: Tue, 9 Sep 2025 11:11:00 +1000
From: Alistair Popple <apopple@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, dri-devel@lists.freedesktop.org, 
 dakr@kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, John Hubbard <jhubbard@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, Nouveau <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 04/10] gpu: nova-core: Add a slice-buffer (sbuffer)
 datastructure
Message-ID: <tg7pzmkvaado3er7k3kojyzjwasoxsqqjyfldk2x5nmugq3sws@ysnf7hpvcgdk>
References: <20250827082015.959430-1-apopple@nvidia.com>
 <20250827082015.959430-5-apopple@nvidia.com>
 <aL1kbG0YYy0FQCGM@google.com>
 <kxriy5tmcdpbop674gt55tmcfsvdy52dnw6dw6svemj4a52dtf@xhvjfrcjxbgw>
 <DCNE4H8KT8B8.20Z8SOHSGB5AD@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DCNE4H8KT8B8.20Z8SOHSGB5AD@nvidia.com>
X-ClientProxiedBy: SY5P282CA0026.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:202::19) To CY8PR12MB7705.namprd12.prod.outlook.com
 (2603:10b6:930:84::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR12MB7705:EE_|CY5PR12MB6478:EE_
X-MS-Office365-Filtering-Correlation-Id: b3f6e30f-19ad-4500-a451-08ddef3dbf51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|7416014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?X4bi9WH9Kdv2bQ22zw6ajnY3+1LuxuN8pfBQCkjGdxn6qbZbY9L/7dY/sqeV?=
 =?us-ascii?Q?Cm+RU0M5Ea12WcrrGf/uzZbpUgD6sh1oRlzgZEMd/oBduqk3Kr2lLGLFc2ds?=
 =?us-ascii?Q?+YV3q+LRAOh41LHS+KJeZF+6HunGWcTyoteNum+cEzgU2K1wu6U7QsWBPQn4?=
 =?us-ascii?Q?xf/Hzbf101mBFZlK1VG8h59c69jqLXNaJiKGSsFCgx7fZRGgKeKHn/5iAU47?=
 =?us-ascii?Q?biu4P3HYclwhdYqIww4GUG92OITx1Hb2T236MCTrsS+ETI/M08+pmrG7i368?=
 =?us-ascii?Q?YfDKzA2n0RSyAVJ5QbKBlEssSIrQTPKJrFCfbBiEzkpSfTeF3fURuV+5QXzZ?=
 =?us-ascii?Q?UQ3wKeU2oz81V1zNr1YEmyxUHaJb5bz+iUq0H2z/MkVXEPdWZSUGiwcs4eUa?=
 =?us-ascii?Q?/4JlLPuN+Ttitn85vjb/vbJCmOJSg94vUrUI/YkFLa+cjnGWlZdTHeEdYYe8?=
 =?us-ascii?Q?mVYPA9f1mRWi3ZpPDaRz2LfvHmqGzpl7LM+t9lOvrxdfpXG/tFNhLFtgwiih?=
 =?us-ascii?Q?3a29/wS/yN15SyCWUHiC/VG6BzLAJCaIuJweFHGZb09kIUvr9jbEMeP/JOBg?=
 =?us-ascii?Q?+7WYwdW3/58M+HWVW8+EAUu3Pu553cf7i3LYfz3BV0wAr8AuHxszR5k+s57J?=
 =?us-ascii?Q?UsnNR+8LuF9RZ0bmPYd+4u2c+FdFtQ8FO6TEgPZoUOBzLJkVGMaCmHxEUD7N?=
 =?us-ascii?Q?JaEw/iFmkqdwCWFWzbI1eT9qeGYwUjjlp1/zd9aaDLEWPKYThnUGEou56CtW?=
 =?us-ascii?Q?f6C6lLi8FOALLKHvzZS8mMSvc7Qgcjo1VPfe2p2ySmC/GAC8M6T63S+ijv7I?=
 =?us-ascii?Q?8zFbjBaeZjrB/uZkHDXy+lpjZtG6ugMM7MHuTOoepAllA7ASL6nxPPUl9AB5?=
 =?us-ascii?Q?M9fXzxNXLVqY/AqR3fPPDDP9JZOS4CTSyn+aCbf1J6HIW7hHt734vJX3ejGx?=
 =?us-ascii?Q?N6U3jhmnMGOvsH9sDE/1yCMz6tzwRxpvJQpma2e3LyaWeFysL5yKg72CUu+8?=
 =?us-ascii?Q?yQxaqY7LC3wrQjYwL/pcxUGU0A7wXvJWSc5k1VmhOXFD5qQahI+O8W/lvEN2?=
 =?us-ascii?Q?uDUnJiyAY1SKcuG++/XYFGJx6PXkjuMdIX2uBjz05c8JQ1BS/4A1K3Yas6Ww?=
 =?us-ascii?Q?Yyhk4osi14VE3Pk3wgX5y/rbkPqS1U2gsqaVrJFrrzpyBwCYl7HPW1eMuCCZ?=
 =?us-ascii?Q?MVDjGA8VR2L1fu1EBKCtJR1Wr37wLoQjoT6tv22KooO/LieQSF9qcXWsAmUj?=
 =?us-ascii?Q?WsjZQXKKbJMJ2FSweXUPM4V2zN88Udz2if7T/ngap6MPkd6D1/WhyrkV6Hj6?=
 =?us-ascii?Q?BcevpbU0vo1M3h7IMTd/GxqlyjzFzWXQwDZnYdy7D6HAT+hfWRi9DHI8jyZQ?=
 =?us-ascii?Q?waTGfLvQLb+KtwKzENHmpZ3rhjBPH0mldV44SWSPmXKX02ouxgUmcsXTpvtv?=
 =?us-ascii?Q?5XMeBXU3EhQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR12MB7705.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MrUPepn8Lxsaa7PyK7wtyLnj37NHpTfr0X3BPF5rvfuJnn/Ckx1vQ2BeWbT9?=
 =?us-ascii?Q?DtLvS4yz0hniO5FRi6mgnNyPud5u8d3V38bKJ4KlkBes/yksN7mix+eHcvIr?=
 =?us-ascii?Q?CHnpyS29DLOpBcsE9qeqglapsFGe6cXpxQ1lcoQ5m9C0wbQmnYnQ/tB9tW7L?=
 =?us-ascii?Q?hXXV5DRy44EQNIhZBnEE0k8WsnyBHN9XYTk22w5eXOKk5/hCBDdKHDCupqZs?=
 =?us-ascii?Q?LkPTlEgtr0AhAKYS6v0FkkWEGtuNfDcx5Dsu/Ex4CVlY8XmN+Tp1My+q8opX?=
 =?us-ascii?Q?9SlU6haiu0clY6/FDDQe5lbcDDddBb9L7/i8dS8tnGLyhDLy+XtrGuSai1Ge?=
 =?us-ascii?Q?ses0WXk3akeCn8tIruqvg08HGXDnudaiiBzpA3c8epT6iRlGlo0ucKDypKS6?=
 =?us-ascii?Q?SB6QuKriUQ4pSxYLAQ76BHjYF3IeQze0o9RscKvVTd3B7tZzdY03JMGQfUWw?=
 =?us-ascii?Q?1Fv6wRt5ceCZJaf4Ee96u96pFaMyst6vhcVF+fK6dQO28ttnFcGZLa5rixqU?=
 =?us-ascii?Q?VE+C6brYNyokzYufjwHwNj56nhE4RFvAowQrG2QYDgV16Bqqov2ojk1/XaNj?=
 =?us-ascii?Q?dOfM8ZZzxMN4GIfvHjj3d+8lzNp4q8rUaN9HRT7xN9cjnhuMgAttikm2lBpt?=
 =?us-ascii?Q?MttR2SeUl8CSvsw0IXfr7yu267eHdFqtW1+TxCqbBNVsiSDOoT7zDyhIKXtd?=
 =?us-ascii?Q?W1TWQkA6L5vh0+OGDennSiuKBdgyWzHGb/GnkZYylBuMcPienXyuqS5GQgMx?=
 =?us-ascii?Q?wmxmf2oL1d8JVmGVL6egI3WtZtUtKrNpf2v1jnJqiGObyleT+pzhUDYUflEY?=
 =?us-ascii?Q?bQIdUplznWplAci6XZYAfgu9/Uux9UY/IJuSnpgEvNpnOXFncna5y0EYtWvw?=
 =?us-ascii?Q?B4x/J9a36pUMHtpJHsIWts4Awj6dV6z+gvv9CYPLn1aP4mZDsyMA8w4+obFc?=
 =?us-ascii?Q?JnQC1jj8mNPHTqTNnCZ+G3S0KcR2ueKktaNjDsvU56P5dRaqgrGY2eicpTa0?=
 =?us-ascii?Q?JgWGpgY2gghZkAt6bcmWCxUyTHfwAP5Stwt1liyOS8CoXBvN7DmSahlOtMaz?=
 =?us-ascii?Q?COsCADwUVugO/xvhh+wGGC/cu814VKV3jGIiTTBnSPIX1mcrzfOU8barSyh3?=
 =?us-ascii?Q?FKYEbcPvdg/cib2Q/JfixWWmesOjKex0p/atj25sqlJV5vyFwtLCzvF0eF8q?=
 =?us-ascii?Q?8Pa+UkIl3eRdjiqdnrwFTouHedlm6NoqvgIDS25hxqwqCfjZnK0St+UqLtnk?=
 =?us-ascii?Q?ScI7F2Me3HOruLDvuYAAicZ3eUC6fWrG7DPPxX0SBB2sQAVdfc1RXZyB2UCh?=
 =?us-ascii?Q?usIni50mKcUIyKbsVGgYMkGvXqpRk7G/XaX6r7GPIdSWcPRMq+hd75Ssk/jL?=
 =?us-ascii?Q?7ZYtOPOJ1daXSLbKPoWmrHCAGGeFQXmtOj1XC5rjml90PKFfYzm+MXRZBJ5e?=
 =?us-ascii?Q?UXDK1MB9WwZj41RP2P6H9x1MTR1LSrwlHzvOCWd7LA0h3P75gk6XHDk2KnBk?=
 =?us-ascii?Q?dUEhUxXk1SQX1MsHPp5u6u2fNfEgHysIbhi9L10zD8Cc5VoafZNSqrwASKet?=
 =?us-ascii?Q?n3hVyVdl4FmPcmUf4nEfCyfSuMBBQtvKusjeuW8D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3f6e30f-19ad-4500-a451-08ddef3dbf51
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7705.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 01:11:04.1298 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C/iXkgAhKyf0CSkzTQg+32YsVVenHpand/Ru+ChTzgqbd4PNU2UKnFP4SmvmZTMpWyXvkxrjAt/vEQJvnK8UMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6478
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

On 2025-09-08 at 21:42 +1000, Alexandre Courbot <acourbot@nvidia.com> wrote...
> On Mon Sep 8, 2025 at 8:31 PM JST, Alistair Popple wrote:
> > On 2025-09-07 at 20:54 +1000, Alice Ryhl <aliceryhl@google.com> wrote...
> >> On Wed, Aug 27, 2025 at 06:20:01PM +1000, Alistair Popple wrote:
> >> > From: Joel Fernandes <joelagnelf@nvidia.com>
> >> > 
> >> > A data structure that can be used to write across multiple slices which
> >> > may be out of order in memory. This lets SBuffer user correctly and
> >> > safely write out of memory order, without error-prone tracking of
> >> > pointers/offsets.
> >> > 
> >> >  let mut buf1 = [0u8; 3];
> >> >  let mut buf2 = [0u8; 5];
> >> >  let mut sbuffer = SBuffer::new([&mut buf1[..], &mut buf2[..]]);
> >> > 
> >> >  let data = b"hellowo";
> >> >  let result = sbuffer.write(data);
> >> > 
> >> > An internal conversion of gsp.rs to use this resulted in a nice -ve delta:
> >> > gsp.rs: 37 insertions(+), 99 deletions(-)
> >> > 
> >> > Co-developed-by: Alistair Popple <apopple@nvidia.com>
> >> > Signed-off-by: Alistair Popple <apopple@nvidia.com>
> >> > Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> >> 
> >> This seems like duplication of the logic in rust/kernel/iov_iter.rs [1].
> >
> > Conceptually I guess there is some overlap. The thing that's different here
> > is we don't have any C version of the iovec struct or iov_iter, and AFAICT [1]
> > doesn't provide any way of creating one from within Rust code.
> 
> Yup, I was about to ask as well - I am not familiar with the C API, but
> how can we use it from Rust, using e.g. a pair of slices as the data
> source/destination? I see that `struct iovec` also has `__user` marker
> for its base, which hints to me that it is not designed to work with
> kernel data?

There are various flavours of iovec which you can iterate over. For example
there is kvec[1] which doesn't have the `__user` marker. But none of these are
what we want because we're not interacting with C code at all here.

[1] - https://elixir.bootlin.com/linux/v6.16.5/source/include/linux/uio.h#L18
