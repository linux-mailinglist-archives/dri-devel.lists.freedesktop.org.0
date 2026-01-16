Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1ECD33AD8
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 18:06:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF22010E901;
	Fri, 16 Jan 2026 17:06:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="GrU6s6PD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010019.outbound.protection.outlook.com
 [40.93.198.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF37D10E8FE;
 Fri, 16 Jan 2026 17:06:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JErl0mnU9+JD6WuB7D0c3hRKOER333KVe/vEG2qdV9d1xAE68FeNNjMGZACBiXFkwlFOi97KBGPKZne20b1dYRRbXMSx6teNZw2iV1JpZO2+5VP2Ucfpv6cWqidwr2YyOgpaTBW4hypoVIPs5PoURNr2oYEd4uq09u9VOsCQMQCVie71BpxrhXqMdgvyOCFGrYIwyzPB8BEOOnsmsegv6yWmWEsOwalG6dQGom9c/TujPLQbXlZJqCyTn/1L34weV9FOMBQgh0N9wBjeopH2m94JzC6fUZLIzPzazEWPk5jSxYXyK3MJeKYBFXpVTG5SItyv94jWWg9OpSGUh5XM5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EUA5ix9tTMTbY+JqkLaoDy5b9QXqh7I9mxGJIKR92KU=;
 b=jFDxKcjWb/6TQbaWnfy9/S43Q9dVZelsINzpVpECIW0K/FoABcZZ3SbV31SBiAjqbJyLyVS7UAIzaiQ/4KlP8L1ahStFzm59lkf6OUeerkqqx9rN+axQ6yUgmdiAqFhDaRqhljqdq+5UJpTmkXZovVr/etstBnBHryft3i72TUAnAT2Sz9k1hkMX1ijl+mVj94HDcXteruslAWOqtjecZKOrd3Flb4YaUxmBBW2DCmsVbp+KA/H9radkkkJfp0r+Z+QW491tazvX9VJZ4oATIiOUH29lKIs0Vns057jdrBmQbmTg72xe6jfLNpH9qO8xIGsu6zm/IoS2F2hfIw/8vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EUA5ix9tTMTbY+JqkLaoDy5b9QXqh7I9mxGJIKR92KU=;
 b=GrU6s6PDWbjvwM4/oflcRdSp7NdJg7GX8LsF2vzBm989arJ8VLtu6+Nbo0MO+MTlLwY0u7pfN3KO7tC79zpkvuJwiLX8JiR6mz/kv4IAQllbjQI6X8RMwcU3spVGwMXyRdE/ZWrXy+YnDcoS6SLlPMzU7ufNnnSy51BfhHXg4REOSCpFwAcvx6qdEqibMDxyx2zNvFVF6u8+m9tlXYGFfgM4ev/muQYJfrTVXafcBBxUCWGznkiilyQdfxTHtD7EYoMi6QAsu93TVxcFnbG32q+h0UaGBLXSCdcvZSlxDuagB7cV3VRfQR2WzrvROPCQGmLxCQ4XonPbPJVTF4QEhA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB8786.namprd12.prod.outlook.com (2603:10b6:8:149::17)
 by CH3PR12MB8329.namprd12.prod.outlook.com (2603:10b6:610:12e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 17:06:39 +0000
Received: from DS0PR12MB8786.namprd12.prod.outlook.com
 ([fe80::cd1a:bacf:6ab9:6f91]) by DS0PR12MB8786.namprd12.prod.outlook.com
 ([fe80::cd1a:bacf:6ab9:6f91%3]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 17:06:39 +0000
Date: Fri, 16 Jan 2026 12:06:37 -0500
From: Yury Norov <ynorov@nvidia.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Christophe Leroy <chleroy@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, Ingo Molnar <mingo@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 David Laight <david.laight@runbox.com>, Petr Pavlu <petr.pavlu@suse.com>,
 Andi Shyti <andi.shyti@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Daniel Gomez <da.gomez@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-modules@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org,
 "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
Subject: Re: [PATCH v5 0/6] Unload linux/kernel.h
Message-ID: <aWpwHbrvQ2MMGgH-@yury>
References: <20260116042510.241009-1-ynorov@nvidia.com>
 <aWoVRlm1GFux-Z-9@smile.fi.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWoVRlm1GFux-Z-9@smile.fi.intel.com>
X-ClientProxiedBy: BN1PR13CA0024.namprd13.prod.outlook.com
 (2603:10b6:408:e2::29) To DS0PR12MB8786.namprd12.prod.outlook.com
 (2603:10b6:8:149::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB8786:EE_|CH3PR12MB8329:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a16e140-1da1-4453-500a-08de55219d4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|10070799003; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aKTZDQDkJcFpNO/kEL3BFWT2ReW1BSXW9G5L9KKRxJavqrC63d9BkXeQ8X9v?=
 =?us-ascii?Q?9UT7C/FvS/ITX5TDPrUzrk9XvC8EdC4We73gEj7234GzL6uQifogtjOkpPxI?=
 =?us-ascii?Q?7SiofOrjH1wxh4y0pzLUmt1wxCaGr4KuOgJ9hRyfhAU6WA//5/P6tohk7BHI?=
 =?us-ascii?Q?E1DD2yKfDvKFMSjksdsVRwYFtA4ewEfPcY9SnsePFvMGst+/jEM2JfkZREro?=
 =?us-ascii?Q?1yj114wJU3bvLvbtzlOIJbq33UwzonR1Tyb4tlMo/h1R1K4Qd7uLaVkPBf2X?=
 =?us-ascii?Q?z7x4gYZJGf30Tb5vJNVJ/2D2F9YOyFbZ0B+moM+6ehMoBzZaLUEc8JqTKe+/?=
 =?us-ascii?Q?WNVt9ucb/AD8/sXorm1A79/Z7tPYABijkCBApEchhyVGN/NV5rd2Qk6iy5vU?=
 =?us-ascii?Q?SQSPvgElflfVHd91ejWZLIWpI6nHpVg6+UPpde1mfxCYamo4chPydK6r6hEC?=
 =?us-ascii?Q?P/2mLzSamqWoFqGIjgdVm6hCCKIhLYCXDPRcWlQVjFou9Ddxln2d8Mop+Z/Q?=
 =?us-ascii?Q?tbBd3cMWLT2SLI3VzyqTBWp+QYL3jpVFQX6kwxgXb4n8J+CGUdu8CznZl4ZT?=
 =?us-ascii?Q?0Nf8v/1GfvX8GgsgG+JmHhWmnyQb56LepX4/xZ8YVvjUCvjfHwmB6/3y5Rde?=
 =?us-ascii?Q?VVjUMaSC8WfrtyT8rMu9PpguOrFOq993TikTuzcC3raGt1bZ2CQ4zfP+dWn9?=
 =?us-ascii?Q?3RfeS3ke6ntCFDVmmrdLHW/lfXNenKmSr9lFe/Sn7cZbIgqQpeFETjFKvibN?=
 =?us-ascii?Q?UBMTMmlhuzUeRwMq8aHqD/cCKrqbUoDTGIQ+8SP3E1SgYO291749FXmSBSL+?=
 =?us-ascii?Q?1tipyiG2xqCMZbRzWUR6D/51UZ3ERWB6LgIDCQtK64vMIULBfo9CqmQjKkVD?=
 =?us-ascii?Q?9NtQ3N0au/TMkIu/VhhTN/WoKUHDUY+uYHiInuEtOukC3aUZ027dJj2PAprK?=
 =?us-ascii?Q?QZyLkPOVIvKHNakzQLPvyNn2lHMcWaQ7/jwLDs9AhllxR87XhFMCKE1htBMw?=
 =?us-ascii?Q?qmx8/s/SK1LxK4qxWt+idJNK5gWGYJjpH2db4+C9qimEkxEe6Wsqsm0h7lZ0?=
 =?us-ascii?Q?NWDX1I23NrgfLe7vGhaMBBJb3CtLd90WEE5uyY2Iiv8C7IugT6N+P2RnHsob?=
 =?us-ascii?Q?vOjJf8fcZ6CbF1Ia30KoUxbV50KKUzcvc1X8SGphAVTjXUsGfuWWT8PwaiCb?=
 =?us-ascii?Q?Rg0V6ySzWR96UoMkNqvzzYbm5UiN28kv9l8L0Qz0/zV8O4GqCN4sl5dwRnrB?=
 =?us-ascii?Q?Vu7MKsOxTmV54Sx9t7b/aQe9QDf87AyhgHVjigmtdi734GsDa+rkhhOYe1iH?=
 =?us-ascii?Q?VkrASbNObmHOt12baqC3uaTVI50ptZWKXBSiT1LjRiRUs1LaT895IyO13RlM?=
 =?us-ascii?Q?OkHSJ81ntrX7/DKOAl4gLIJk/OD6pVKTa/3hk2CGj9dNemAiHwBkYFE2znlM?=
 =?us-ascii?Q?Xj1Oakys85sXsxB4tniw54/ZRWX+w5sBTJfYtdHmOu4fXwFw9wvvG9NvC92f?=
 =?us-ascii?Q?NF/XD5+HttwX4o4E0dB3p3s8M3tDKOq/stvVH7v7pnxiYTFPnrJbtte4viLM?=
 =?us-ascii?Q?hh4F2Moygvb/EtJVM0o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB8786.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Fg+kVQQc9GKHhLQCXz2LlWRGAOJcsS8WdEOmyqIzl3rr2QO3sNMU9ikNWkai?=
 =?us-ascii?Q?QUQ0odBOXGl+N2skf61IXOpJNaCRtwvUPS7v6KZBiBR8RSEl+wicrnkUcNfS?=
 =?us-ascii?Q?InoEZet9aXHwweKJk1DIFlAjUZlae+1C0y3qXkVtcK6CZCEu35chTXvSdYld?=
 =?us-ascii?Q?fHnI/JSeoDDDNFpXfaNMdaxY4+uuf7jct8sY5DNq4HiorcEdLCdD6EB/fj4S?=
 =?us-ascii?Q?xZhV0E52T+puH08wS++tnW+z68aJIeSwee5jpWqZDmlFg1O3y2kD5ieDRJAo?=
 =?us-ascii?Q?PIb60ySkpts7F/HkaHGrQS3tQdFVIN6nA6k3wwDsq1i03noDyfHpOKHFJNgf?=
 =?us-ascii?Q?Ufb+lHpEUV2K0m0vMZdU85vU7VaRKsNbOeS4I9L31EiPB/rYRtqr369XI4qL?=
 =?us-ascii?Q?L0tk6AG1cEpttH9u+jkf1cmiklndBrIplSG27lKsax8gbrQ2Ot//wSB32YEM?=
 =?us-ascii?Q?0Mm5TWgfgVFN/yWPoCbNwj70IK6p+2W6O6LKmZtyb/8TEfNzPSMQ2lfTZ7SC?=
 =?us-ascii?Q?FUejZgro2i0ZgEiGNDCSRodntJ47Zuo85u3kYf4ZynqvRkoHGYPzDdlirgbw?=
 =?us-ascii?Q?Sk/c5RnbkyysP3AnvM4A5mUQtwIahj+GcpcSBXgp72TClAh4Zj84avJzUKZu?=
 =?us-ascii?Q?4TyBs+NG0YQggj7AkDoN4BTeNpi4uXoDvsJgotTHBOlCLkmAbQBs7FUpSHOW?=
 =?us-ascii?Q?hQ3kmiIKRFbAY4rZ95BT9gxci/z2M3uEUqSQ4xF0P5Jag6ElEufJNDgDMiz6?=
 =?us-ascii?Q?f2QBx1bROJ5gy4/cEMMejwiqGjRQnPcY4helkLZcTSbDeu/s5oefxauwc9qS?=
 =?us-ascii?Q?rOwigSFMoZhAK2b1DauoOdvv0ZJcphpK12VjlkzjAT8Asyml/0fCqcIN8K63?=
 =?us-ascii?Q?N1kgI8VhuUtlZElGDoQU3Q4AqQ98g+FqmULh+A3Nmb1yy+ByS8PKgszCEGx6?=
 =?us-ascii?Q?seWkwx1hlNp8bl0mADPpfqIFWNubvkkEHaqalr2ud3SgZcMGL/8wbnmcNbtY?=
 =?us-ascii?Q?UOYVuhy0gyJFymOUTBEfIb+8hUt+gOEsC/kj9ewIBcQuzPCa6UyIQ4e/JEiu?=
 =?us-ascii?Q?lqWjuP1LNBhUw30RRXoh61ZsqFDe5TxKq4Pdrwt8exSYgwEGSIo0ia7ieSBe?=
 =?us-ascii?Q?PK/zAttRhYOuNZ7LzBKQOKlRGEJaHMxrn5CXpeuCiC703UYgI4+8tH+EC73m?=
 =?us-ascii?Q?Ou0WSNKta5OXHyHFS7ncKDROGqa0n9+ziyjpesNswvdIj0TdmrH+Wyldl1TE?=
 =?us-ascii?Q?/nkd2GSNAEF59qEq16YeOVzCuZeapmfEXfvectmbIQCMI+GjsYoFLD2Pb3iR?=
 =?us-ascii?Q?JY/BnNWlopgusPrhPpX/x+MWIOc9wjXYVpiYDyqcsMOVG3ApNcn9pQ7efo8d?=
 =?us-ascii?Q?ECMaHmX1FzBkZ2PvQdeIFZ+CF+GoAu0NQBD8ZxeFwN8AeXFGHs5fBZFmHVrF?=
 =?us-ascii?Q?3OJEonUBHeEfOXP+PByKr3KLSC8CUEwR+5WbGUm6WtnBQxz3eyLGk4EDqYZ1?=
 =?us-ascii?Q?EL0GhE2MwfN09vzrGe+a5IXiN439iDajbevSppIFbHtlvRbcppOZ35GBtKtX?=
 =?us-ascii?Q?HuhvxEZdBKnViASHPr6JIZZOfVTKhjzaAL7sEtZ0/+0g9JRtIO7Peazy1uBg?=
 =?us-ascii?Q?vt4tcSJ7/lz5PCl535t/VZwhP/4x2wzRmDCiioKvzFc5RXogUFMOs2b+Joio?=
 =?us-ascii?Q?xztG/ymH71uUGQIYr0gJSjsDmuDDpoUjAjhv5S8oydzHU1NuwvutAwSJIy6/?=
 =?us-ascii?Q?YSBHUk++qU8P5a54gcaW5d78kKKnwuiWWdeB2+6DczyvTWmfnKxP?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a16e140-1da1-4453-500a-08de55219d4e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB8786.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 17:06:39.7406 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3+Trq3B/agv/XYU3mEGmuqJtfc7vFSWmWHvx63JIWk/bdFwQds1jdWDgXjTK9To8NXt1gh2vgTRp9zhgKG3uOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8329
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

On Fri, Jan 16, 2026 at 12:39:02PM +0200, Andy Shevchenko wrote:
> On Thu, Jan 15, 2026 at 11:25:03PM -0500, Yury Norov wrote:
> > kernel.h hosts declarations that can be placed better. This series
> > decouples kernel.h with some explicit and implicit dependencies; also,
> > moves tracing functionality to a new independent header.
> 
> Thanks! Which tree should it go through?

Andrew or Steven maybe? As a last resort, I can move it myself.

Thanks to you and everyone for review!
