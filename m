Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E869BE640F
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 06:05:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4926510EAED;
	Fri, 17 Oct 2025 04:05:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="RA5TbE4T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011026.outbound.protection.outlook.com [52.101.62.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8624510EAED;
 Fri, 17 Oct 2025 04:05:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VsPuvuuIfXCiUd9rkTDX0j5O/NBQ1Qke8J0pHm8Riyx/ZaRw986wT26E3T/XPZCvTZL2N7+7QhstRgfSFWa48V1JmsW7YM4dyjQRVcWu4/6LJpv1IoO2R5XqmQ0Wk5ERHudrdu9lmWSoTFQMawxK5TPYZPO+QSx3tv1WnCnKortQiN8++zYBEHukAjSKBCZGB5cev4tb78VqirsQiE6+vndwwWSCQn0xkZbCvKULZZ9ajhut/k9CImJKm+q0gUPmBOx1xp0TkdCE/3kw31nIKuzaw3+31e6OazTF4HdB2OC/QKgrs/GD9xoFY6T1wDHqdRQe88kmyjsj5ShDFvMTAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lc8d8Czl34BM73hZ0eInm4x3/cpTxJ7XBvqhzb6TJHY=;
 b=qlviCcaN/ZaM/2thMtM797+Ody5/TBXHfAHkOtXXbyEbiYuEMMLYKdI0LnQar0DDGhrw3ShnwgLh6y0Qz1Nl8Rp6s7m7NROddHyQJ5rMkIeMlEXOkjvesELqQtNJh1QNQp4kgWs8N9ixNeey1lt24BiaQZER3tEVItlJODHqLUfH1u2vXZSEXk6pENji1A0/Ic7OEjxIE9I44s6f+DrkzmdztUCmT+2Hz1dYxdBw91aVTZvSuGu7wQxVqKbFzjBq5w/D0+hUk/sX5ZslblUF+gaYiYhNrXl0RCrSf/xC+nS4UQ125hwz36npidob21A6gT8c+qiha1ybsdIKZpHd+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lc8d8Czl34BM73hZ0eInm4x3/cpTxJ7XBvqhzb6TJHY=;
 b=RA5TbE4TcHgmb24JY7TdjEuZrCWld5KgnZ1ZfmV8k3qN0g4rCK84SNV262Amv1uigt6PzL+PXmrDXGxNOpoFQnyPBSz+ddem+dqkEJwUVq5RgliwepU8KlmN/R77hxPUGzBK6qy1ZJRZv/Fkc4LQ5CSawDtEvndhWiD88vnME4fdsOOdqnSfXicFDNVhtsrUcll/CdJ1CBKvMqdQMKTnDKamgEoO4CWYuvI7ggcpy6UJiwtv6mjQEU0y32oz70QE/PT5XZaRG0R5XhU3r86qKiYM1+chA5xRg27P5CDoguQk87EmuwVeqVYmxkWP3ihatjWE23MDcKFH7wXumfO86w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 DS0PR12MB8199.namprd12.prod.outlook.com (2603:10b6:8:de::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.11; Fri, 17 Oct 2025 04:05:46 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9228.012; Fri, 17 Oct 2025
 04:05:46 +0000
Date: Fri, 17 Oct 2025 15:05:41 +1100
From: Alistair Popple <apopple@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 dakr@kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
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
Subject: Re: [PATCH v5 09/14] gpu: nova-core: Add bindings and accessors for
 GspSystemInfo
Message-ID: <xkmbrwcwigurrq5htxe7tkd7qedydk3bmmymlwhnuhvk7jzf3e@k3qnugk6r65f>
References: <20251013062041.1639529-1-apopple@nvidia.com>
 <20251013062041.1639529-10-apopple@nvidia.com>
 <DDJJ5GJI5HJ8.2388S19QXO8G0@nvidia.com>
 <5jw63qwbeb2g7ngxpapn3prgv4dbceb7uhmw6ddntljznkxiks@ppnp6gknek2z>
 <DDK7R7X621Y7.4D5CSTY8BOG2@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DDK7R7X621Y7.4D5CSTY8BOG2@nvidia.com>
X-ClientProxiedBy: SY4P282CA0008.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:a0::18) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|DS0PR12MB8199:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c7dc966-5a3e-4fc6-fab5-08de0d3272b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?r59YEiHFYt0zXtGl0pN0mDqTfYpQCU4FurEf4Ti0LA4TZ76d7Pb2T58rAFcu?=
 =?us-ascii?Q?D1KX+fQVFsd7LWSKGyu8E9MK3KcNdH4omfUWS4zA2cIvbHjJ/3ucJMtzeL0M?=
 =?us-ascii?Q?u+Tgqq4fogtc8uRS3Bci4ad+o/g3EHx0eR4AOWo7MalulNHzkSOIwWoWTObG?=
 =?us-ascii?Q?hGqF92aVhz3tRE91otXWi2tUN/KdbrkxrqI2DYEOrdS/uY++a9ekmDlwPWoX?=
 =?us-ascii?Q?/7Sq+skQCrD3y3/W7OZsTVWh3s1C1EgOKmD0C58aHAlPgOjBZweXp8tVVomH?=
 =?us-ascii?Q?sBaouJjbvuVzN3Sic1uFokQE15/U6oTnPXpmS1NKpc77avGAECaJu1uDjAOb?=
 =?us-ascii?Q?El2HS+s+AjJjuGtQeAhZUBYi2RvUbtfaMp9IgrldcsN6p/tbfucUyRueRPD/?=
 =?us-ascii?Q?TdVT74Uzm2fC3bFp15uBzCC/aO/FbbtQ99FpiQ8cVgD1x5F4zuQr9CKFVLHh?=
 =?us-ascii?Q?jIgiKh0wGFF2DOoEoO1jdAHtXWHxqicb/mwJSFFe40NFvQqksvg/SEfni4/O?=
 =?us-ascii?Q?J4jrENDDt6c0S7BCAOtOgjXCacP+1GKCOBNV5i4nkchgQjGIuTl97PPPD9WV?=
 =?us-ascii?Q?4A0PV1b3/Z+JUmmSaOiETX5Ej6UBYZVbaAN43lL/gaWsKN2aVKjkP2hH50NF?=
 =?us-ascii?Q?daL3Mbpx67CHRdNVHiv5XUi9w7Zo4KwElJyj6qLUO+KzC83ydi+vetbSpuRl?=
 =?us-ascii?Q?JPgCMM64AFuPZmvbEFfGluLdbGEiRy5vxVQxGUdvlZyQc/5ewbNtuojmam1O?=
 =?us-ascii?Q?BxNDlm2SzAacXJ5np3py2WQeSMMtbhT9+VfbUUbppM4zYuMOYPiu2YStvVYV?=
 =?us-ascii?Q?sGSR1CDXYCLmUjIhh07LJaPbGEf7a9Z/CmEcozdGvayD9sKDGwZoRGrA6Z8z?=
 =?us-ascii?Q?LNHV8eJqw/s36Expo2WBx1iksKO5nSMYH5VuiEUf+xTLyEcVHw40kqqk6a+S?=
 =?us-ascii?Q?ZPR5DNyLKDeNKS46HWoMzTyyCAkFJbBLpjsACHc8RLrAuqtgX5x8F2vlqh/i?=
 =?us-ascii?Q?qcx3+ycUFZIpo0AgtuEnT/MEgf22/XQre+RP3m9jXXmntZeQjZ9Sos1+dYWm?=
 =?us-ascii?Q?JNS7qkVfZR+8+JDH6vSwEmsuHgFT7cgYF7iaVoqbejRtOGJdY0jlPzu3oE5A?=
 =?us-ascii?Q?KhfcNGKR2PSfS8ctM8vnridMKOsOZvSbfqn7GwKJHZEm/lmNSZeVk0YxSKYT?=
 =?us-ascii?Q?s0n2A6Zex1PcXyKFQX94iYeMrBRx6C1vmA30V6lBfjA2Pjh0JUn6RY/7lRcI?=
 =?us-ascii?Q?qaA4Kjz1F70VUFUPnN5huHKTEq/F8w0lQ2tOHAkLGr5pLa9mgOF8DfTobNFE?=
 =?us-ascii?Q?JbS4tq6NaKtOQc2i/nTfT4Hcm0Wg80N8V70/9M5pFkAawFfxvRjLWkaB2SeV?=
 =?us-ascii?Q?QtdnTcdoOwessJEX4WCpiVkRo6i9425qPBTxGUAz2fQGLXY8cSve8ONRir5c?=
 =?us-ascii?Q?5v7dlt7FOqVq5L21h+LFIzQMtbPvsZFv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aB4HGZzLuW76pkpQCgpNrAY5wrM0ABCD1InWhvU3mM4CBm14U/0hmwnKZJRh?=
 =?us-ascii?Q?lGeA+WQ9r9EYMBNyRBm1s77NCwTmRCxjZDX90J4Q6Sym8BsGDz4DmsKLqYRF?=
 =?us-ascii?Q?Y5jUVSG8ztAUYgMvFZNh7RkqbDzxT8zwrZKcmo+8dJ/rqhAMoI/7y2EwpC20?=
 =?us-ascii?Q?PWp4HRidocX8HYpUz5Fa6feZCCQ22jaeJ0WNjp7f1LoDq/I+ULekoKHAFSSQ?=
 =?us-ascii?Q?jpmNtyajyVXfvaBU1M6+Dgcw7DMl9fvJQyqMWJqdt70AJPRZHEzvQdaTbg/d?=
 =?us-ascii?Q?eijhv54Y3r4k4VnTa3+tG688bhmn3ra4QpqcP7O23R2+9ClgeWL40/y39k3z?=
 =?us-ascii?Q?4ZhGcTVmW8L62Y5gf+hZHJJYPFFr6zDl9L1NA1MnHqT/j68f2lVehyCvuuFH?=
 =?us-ascii?Q?PfBE+IZeQiGwc4D02Wos5975RKDbXS1mNwVlvu729dLiNZFlYCOfdx+s2v2G?=
 =?us-ascii?Q?QWqSJsSy2zlrbmFo6Tjjd8rTzz9FUW3nkD6pnlhhlrYplhQ72rLjrFJQRPP4?=
 =?us-ascii?Q?+U4SXHYI9iFiWzqdg0WR6zR8IOu3/76su0oUgG4Sd6jldwm//2Vr+AgzRwq4?=
 =?us-ascii?Q?bvYbWAjNCaKl51gVQgFcWfOo+kK9/p9vs6D0GirWBQNRiFiaPIN4cJnJLnrM?=
 =?us-ascii?Q?qSVEYkFElfeLFM0Jm4hzPdKV/dnn8wAoq7QI1r0E1YZZ8mQcO0em7UwEXys5?=
 =?us-ascii?Q?rv8JwrEe5YEDnhvN8+g7hR7lDoqWxt4UTe/GYBZEyZb3MAZo1ibdXpSYsjk5?=
 =?us-ascii?Q?Q4L81YvlxpZ6spUH6M44jyamlHMtmdQF0gEP0G4+d4H5AMR5Sb4VLqjm8AaO?=
 =?us-ascii?Q?kpjBYYQc7yOK3YqZkhFMS9y/ka3b0Y+4R3N0+7f9zDVjL9/0OcOLe5n34O6n?=
 =?us-ascii?Q?1ewCnEHPBUJxbI2Xy5/MT7jqNHgjEU+Nv2bKOJEGb9x9plOAvJ0eB8roEhac?=
 =?us-ascii?Q?3fbqklQBu35cjXfqMISBcb3EOzowH9zpLGncIaQBuoZhcsC44qipSQXHl8bY?=
 =?us-ascii?Q?Lj+L6BWp0Gsp0gZVya2PefyOi2AOpqnxZEvqgwKMu8T85pEqmAyFWA6cfAL4?=
 =?us-ascii?Q?q101wePsrhsK9vxnxNYlhrskhEyb1aFekcAgoQ7xtcRnSSF9jfOh7t3cqxWG?=
 =?us-ascii?Q?krk4w8hhnUkElqYn2C8DswG03PahqnJV7LCJYpuL3tTzS5CrcEiX2nDQRwKe?=
 =?us-ascii?Q?mGYrtCCrONhnPHC7jgGgv+mSsnYIfpQmViowwLqjegJNHdrgjGSCM8YS2/8y?=
 =?us-ascii?Q?JaMc/lXzp3Md57fbOlbKetM+EMPjGbWQHZNIqjpzlLXci1tAxdl0ZOJ0pzAw?=
 =?us-ascii?Q?t0HijHDWgTlZZH5fkiAjnzyrtbthafXR9mBT8xpfJpJuwpR0dHG984q4Qunj?=
 =?us-ascii?Q?iEg0BbSxBmcWsur86dFr4NavnMJUA6/9Thh2pLq6yOYptxWxEasiUS1IInF7?=
 =?us-ascii?Q?txgS6dG+5ci6rMQHy98eK/JFSuCJskF1H+WQQgSnSuiU/z9kSzuLLf/UN4GT?=
 =?us-ascii?Q?U7z+Obqrk0EjNVREpucUr61xIZeIYWHOxe2qLptRVkXlPMRsEWz5fwdmoZOA?=
 =?us-ascii?Q?Rq96azjX7vBBeEVbFfADFRaQF9THb0OBlvx4gc56?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c7dc966-5a3e-4fc6-fab5-08de0d3272b5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 04:05:45.9261 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8K6EcjfhMEVPsiuAgj5xYUTYCxuy8su0XVmXjpbVxoViMPcqVZ16BaFOpamm0cmENQDqrvac3qHCULjW+x+UMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8199
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

On 2025-10-17 at 12:41 +1100, Alexandre Courbot <acourbot@nvidia.com> wrote...
> On Fri Oct 17, 2025 at 9:56 AM JST, Alistair Popple wrote:
> > On 2025-10-16 at 17:24 +1100, Alexandre Courbot <acourbot@nvidia.com> wrote...
> >> On Mon Oct 13, 2025 at 3:20 PM JST, Alistair Popple wrote:
> >> > Adds bindings and an in-place initialiser for the GspSystemInfo struct.
> >> >
> >> > Signed-off-by: Alistair Popple <apopple@nvidia.com>
> >> 
> >> I am getting a new unused warnings on this patch - we should either
> >> annotate or merge.
> >
> > Yeah there are quite a few unused warnings. They're a pain to deal with during
> > patch revisions and rebasing/rewriting so I was waiting until all the comments
> > settled down before dealing with them as it's pretty tedious work adding lint
> > statements in one patch and removing them in the next.
> >
> > As you say the easiest solution is just to merge patches, but that just promotes
> > larger patches. I wish we didn't have to make that trade off, but I guess if we
> > want clippy bisection to be clean we have to.
> >
> > I will probably just merge all the bindings into the patches that use them.
> 
> Miguel's suggestion of adding a temporary, file-global `expect(unused)`
> directive would also work very well if you want to preserve the patch
> sequence.

Yeah, I quite liked that suggestion as a way of alleviating some of the tedium.
But given the bindings are pretty self-contained anyway lets just squash them.
