Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EAD6A816A0
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 22:16:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F213910E742;
	Tue,  8 Apr 2025 20:16:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Y9fwznix";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2071.outbound.protection.outlook.com [40.107.220.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4486D10E73B;
 Tue,  8 Apr 2025 20:15:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NjJ9jCq5LLBr5BCRp4Cew74eMTZn3BeMCXZedCoLIUu6KW+BSy/wDan1EyKE+8DFJClYA49yNWyDCtHs0PPPUHmY0Kv5cny37lgItmH6iyt+qa34DOAuafiatVngIxEmR0w5GHcFFVKbqktclxyKBRZDGmdSrJUm7AyixCSvkcxDoeb1djasxMeV1XkIT3SIfv2raYJLjOkrgU56dLyJP3AjX0MD23xnrvkCjezFwBosnwsGXKaQiLOdYoGwAeyeOlmGcWr6KbwAH7pvsnX+UuyM3o+/VTAgvsYzfIrJoBSWOAMHYzWjDIK9wSasdqMTZC5SBn4qCA/EMBMj9O8CkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=22z+dJ+9N5V3RbvkDI+5IevITqHIMTMyOLozZiw8+jI=;
 b=RDdSV68Sua9NDx4lpWfWpPco5FtvhukTyfSzkmeruKNnNByB/CaBeNib/Hkqd9zYDQqlj2RCmuruGPi/WfQC35KxKpAye4LxpggPXZ/x0Z0TQMu87tUJzxs6HJOgvzxYIUUAuBOdGQXcdg3fRM4+leLE9c4dl2UJEN8lYZ9X+MiBF1PGbp/VrSuuiEwV1yrw/Q0ZH8FQCqMD/6ShOn/3phl0mJareFXWYwROZJuVOaesXfBQKQa8h4ULI7qb2XRZwtAOPoIWgLsiVQZyS3rT1rhkU1bps3kOYp2ODFrYI/lMcaCsZ8lqZ2KXBwe3sDea+TDXK1qbgO20GPqyn81DBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=22z+dJ+9N5V3RbvkDI+5IevITqHIMTMyOLozZiw8+jI=;
 b=Y9fwznixrZpBnUwqZQOPzzC8V5Yl8hyrld3BOU17UbJufLljFf1BGL2Qg3D6N64e56lMcPyxC8kWh+sJxQHo4wK5N4dw8EzOXBZBmqKGfuYKHVM0MTnLmIY8UlgayW9voWkSNc+LxlkYO9FHSn2v4yvQgFUUk81PBnZ9A0U+flqROBIZMlYyn5pZOBvrjwe9g3N6lC2ff2MJvax2EB+gMxB8BC9QhOFLAvjaqGWTwaxepdwDk/zygxLglYQwpOnwk6zjy5EYFPLAVdpS8Lqw6IZzgTcXWVaZZgtGLh3KFP6clO5dA2YB5wU59bpgV2Tf3F11FqhQ3DoH75Yuetv+5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by MN2PR12MB4126.namprd12.prod.outlook.com (2603:10b6:208:199::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Tue, 8 Apr
 2025 20:15:51 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8606.028; Tue, 8 Apr 2025
 20:15:51 +0000
Date: Tue, 8 Apr 2025 17:15:50 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 linux-kbuild@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v2 0/4] kbuild: resurrect generic header check facility
Message-ID: <20250408201550.GH1778492@nvidia.com>
References: <20250402124656.629226-1-jani.nikula@intel.com>
 <CAK7LNAS6o_66bUB6-qj6NnaTRNKvu5ycxOP+kGfizYVBNjZAyw@mail.gmail.com>
 <878qoczbhn.fsf@intel.com> <20250407171209.GJ1557073@nvidia.com>
 <871pu3ys4x.fsf@intel.com> <20250408160127.GD1778492@nvidia.com>
 <87friixzoj.fsf@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87friixzoj.fsf@intel.com>
X-ClientProxiedBy: BN9PR03CA0259.namprd03.prod.outlook.com
 (2603:10b6:408:ff::24) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|MN2PR12MB4126:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f0ce1e7-d100-434b-a3a0-08dd76da2877
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WaOlOyPnGCZ5ZE6UrK8EnTgMoePWECbwBrtfAI/UCv+/KyarkMC5B7B+ywm9?=
 =?us-ascii?Q?A5L1oamd4mIuaggZu6OCZnGKuB9warVgOyIjXzROoiVntG8y/g8f40Jc2cum?=
 =?us-ascii?Q?DUNFBVXY61nLT6AdpgrZo/tUsi8iO81pAMJD+GSGYetJICQvS4FLIlhYL2kW?=
 =?us-ascii?Q?yzPqbaljxjasY2NEaSCbDJQJSMEicKCOGKbFJOafHe8LgYRC2dV0wF/tbZrs?=
 =?us-ascii?Q?nCoKvn/8iVLEXB4tfhbdB3nB7S5yhXq+G5Vizh6jr2ndyKShRwxf7BF6TjGk?=
 =?us-ascii?Q?mhkinbnvZGHHYIBDd1pUP09YJehky4iLcJIz5Nh9q1zJL8bhCC9cNOsa7xpy?=
 =?us-ascii?Q?9uxP94WTyM4tusD/T6Pvrihf3E3JJPKeCzLK87eUw2JPDXOhTLLPXYSShv3l?=
 =?us-ascii?Q?pMdOCTiqyrCwOV5MP/T7y0fGWQ43eGvSSWOFgZMjYiP5dSyZIuRTxCvEI6ij?=
 =?us-ascii?Q?pmahPt8sOyg3AI3VV7xMlUwEXUtAqfwCICdRSY1cW9ELPR4uxFqFH+uuorxP?=
 =?us-ascii?Q?f4I/luMlRIlo+ONX2M/tddsYYI6doj3Hpl+1Xqf1aE312ObZGlATwhyEeGYx?=
 =?us-ascii?Q?Fwv32hNn9KmUTiVxJ/6WowuYs32UJOxPjvjLO5qDM0Hbu9nLe/djma0nOCGl?=
 =?us-ascii?Q?oNljScF/8uEWuDmmrLUNfNn3lYQG3bVbpgor77H6Z76t26I2CqJ/NJI9dLKR?=
 =?us-ascii?Q?6ToUa3hvlIsZCPL3RCjCPQhh6hrWCt6IBEbjrYEbUdvPKCsQbaU3vPDcs1hM?=
 =?us-ascii?Q?Diq15+bdfUOE9PnWn6NCtTN3LI7JDKnPNl8bgaVGUBwyO8Zep61LpRTp0guL?=
 =?us-ascii?Q?3OTZC8mTIbUT5jTYW9ZAIl/INJC3E4NhswWoGjzWYlv2USZJZ2hedKmpWBcO?=
 =?us-ascii?Q?A1ctZjVj/vO9lNoDT4AGJMtkLar6IIXxVK40Mc+3jDpZjEuPzHNxPQ8m3s1+?=
 =?us-ascii?Q?9iz27O6nqMZ0rTdqfSOFaR3MhXyrfn2HV8jfBuRh0HW60aqO4VaOjqM/LNod?=
 =?us-ascii?Q?Zsjva3hSSid04fUclPt2pmzNulBxQDYwijnjWZhGvlckehA1iiMyhbcIKogr?=
 =?us-ascii?Q?plgH3MbdWhhFeDSos7K7ofKUArQ2QxzaG7ekcHeTIARIczMpgXYuknhaFAEx?=
 =?us-ascii?Q?2iL5V7PhtGP0bPWqTfY7ZKxodsfJ8n2HvNIvS1kwkyJzKk5mhE1GodedjsN3?=
 =?us-ascii?Q?hpdjmnLcsg1mRk6TjE3ryf7WU74qBiO/EJy98dszTqbyz3UegHq7VlFVMGwK?=
 =?us-ascii?Q?9RgtT1KPQgLr1reAxvrcoxM7Ys1xbOhWsbtkP5fccuj1TOd10je581qADXTc?=
 =?us-ascii?Q?yiHxFOjNcHHl0adTyQSKQZuNO0krw6hAeFkiis+B7I2Ax/Ouxpx/9vt/7QDn?=
 =?us-ascii?Q?Idzzje3n+pbQWq3CP/3UXuCIN9Ip?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Hee4xbMkjjZUidYFd+0rfhcv3sR6dHYXPPXRl5UYFEiSGV5D/ydaKVplAN9Z?=
 =?us-ascii?Q?fZwQMO31c+tVkQczsgEEZRXKOd4EtXFwN6Sj44AwFbRz1wqoPzIbM/X8tjGo?=
 =?us-ascii?Q?CrtBd8ot5Z/W+PXgifY3fJxBu+2HO0E8buFcF2T8LY2G3i/h5s0b4pgmnX0M?=
 =?us-ascii?Q?Nvd4dIMMCMmZFr+Cm1Jm7eOYBFSslyqen7d/IYu4BL+dUDyruScO0AnBWb2F?=
 =?us-ascii?Q?T1VS5poqOFwaYSx6NZDbKUibkurevAh6EL7xS4bEqMxlCD4Ay7BabBGjJoVj?=
 =?us-ascii?Q?ujLRMFs+WPQrXwh10UEAPUtp9wG1FKD/iuAjkvuzpWHz7bipKMJfFv9mWOYm?=
 =?us-ascii?Q?woBda3yb5kL7t6is+FRJZKU5OyRKdkSe9AJoMJEs44phbbhz6X7yMAnInLBD?=
 =?us-ascii?Q?Q+bxiDQfHCk7rFkr/486gyOeTYlIeAm7M+1tNYECfe6iHuen28qOPec0C7UZ?=
 =?us-ascii?Q?8dfnTgn5yojwnmcWyBcyxIXHmDLN2aA7qc3WHnl1unimHNsPt34sEon5Rsab?=
 =?us-ascii?Q?T3B4RxwN/TmRT1eWeFNz5+VVHC8Edv8jDR4uBuBAORdPzkOVlAdIHvqR9S+s?=
 =?us-ascii?Q?/MUNNd2E/+HShw93ywyeZZZtHvdvPHin7yGtCzuFyoBDc/AJwjzV6qThvf9Z?=
 =?us-ascii?Q?f0s6Fv5BUgdsyJzfjbaBiHgIBD7iVJ7SI5oP3nuOkeBNKVa+o9RNmkJ1o3XI?=
 =?us-ascii?Q?Ra+M8NKXR9L49TxBxAVNmoPTvdNJwW75wuqTOl4dabJWoa7GLufR3Q8r2bDi?=
 =?us-ascii?Q?CHjSiPh6NYW6B3ph63H/8njdDK6qg61afFvWqp+D6tRmq4BKenswL3Yq6+t/?=
 =?us-ascii?Q?6rs3icgcgQrWHQsaBcweczKs5wbOTZrFdhTVirVGCER/znZz2LPiPvZwm9wk?=
 =?us-ascii?Q?osbIA1YoGa22BNfbOFnlpaNc3Yi97k9V3TScJgZgVQesR1Y+6qRQ4ymPJ/WO?=
 =?us-ascii?Q?si+Me+/fTQ2I0XaY4f4/7nkRzWlygd3M6dBgtPkUK9tRVeEenBEkVc4hSKxc?=
 =?us-ascii?Q?veV2UnqM+bYFpttL3Kmeo4+bSXgjP1CL3+aLhW2M3O/aeclLHhywdKAAYUUf?=
 =?us-ascii?Q?niIRpBFMLl+76QYSKyjuGTyEs5/HfxdmovXmKeAgtmw1l8QgkaFJLhZDRLb9?=
 =?us-ascii?Q?5R+KqN63CcLUK6Frq0EQPSU7jlGTSFUJnS3ZshecqB236JZjQzw2vxjLEgWV?=
 =?us-ascii?Q?3KcgcxTbpAvOjhTp7c0jrXY5oJWvnDmCODmBbGPeog13eOWAEh7br62jA+mK?=
 =?us-ascii?Q?v5XBYxrzIYtIqVMX5WFISAbD5q2Yf6DUqyQ/DnLRBU14yt+/3EiQ1kyjVSGv?=
 =?us-ascii?Q?/O0qqFzBdaqkh+SEhxpjunK2xOHc4KnxrhgJjQnbxwV17O8WGAIb44JJqiUO?=
 =?us-ascii?Q?sO/5gzpfs4U6/K99LHUpvC/BTOqC9c6RQqEuVnnLnccX+ssk3PA5BnZ7d1DU?=
 =?us-ascii?Q?AWRfXBM3E1I6bhl8llKDvJZ4mVm+pb6VeRUyV4L/6kUkwPyjC5VnLc8EvTJy?=
 =?us-ascii?Q?P4gYS97bAswiqeWmNEKQHIDA0GqNinyat248ENLDU0L4+AFuAo/VmGTMHHPT?=
 =?us-ascii?Q?87YJMmS1VaZ7S0kPcCGUFVmheSgmQfyJ8nLUB0Gx?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f0ce1e7-d100-434b-a3a0-08dd76da2877
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 20:15:51.4211 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AJpCE0QcOuwd8VzXNZNCKKpb5eTcT0Cng03pyPdzrCFgqHFOwssf0ljdGD5mGS0M
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4126
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

On Tue, Apr 08, 2025 at 09:42:36PM +0300, Jani Nikula wrote:
> On Tue, 08 Apr 2025, Jason Gunthorpe <jgg@nvidia.com> wrote:
> > On Tue, Apr 08, 2025 at 11:27:58AM +0300, Jani Nikula wrote:
> >> On Mon, 07 Apr 2025, Jason Gunthorpe <jgg@nvidia.com> wrote:
> >> > On Mon, Apr 07, 2025 at 10:17:40AM +0300, Jani Nikula wrote:
> >> >
> >> >> Even with Jason's idea [1], you *still* have to start small and opt-in
> >> >> (i.e. the patch series at hand). You can't just start off by testing
> >> >> every header in one go, because it's a flag day switch. 
> >> >
> >> > You'd add something like 'make header_check' that does not run
> >> > automatically. Making it run automatically after everything is fixed
> >> > to keep it fixed would be the flag day change. It is how we have
> >> > managed to introduce other warning levels in the past.
> >> 
> >> That approach does not help *me* or drm, i915 and xe in the least. They
> >> are already fixed, and we want a way to keep them fixed. This is how all
> >> of this got started.
> >
> > I imagine you'd include a way to have the 'make header_check' run on
> > some subset of files only, then use that in your CI for the interm.
> >
> >> Your goal may be to make everything self-contained, but AFAICS there is
> >> no agreement on that goal. As long as there's no buy-in to this, it's
> >> not possible fix everything, it's an unreachable goal.
> >
> > I didn't see that. I saw technical problems with the implementation
> > that was presented. I'd be shocked if there was broad opposition to
> > adding missing includes and forward declaration to most headers. It is
> > a pretty basic C thing. :\
> 
> Unless I'm mistaken, both Linus and Masahiro have said they disagree
> with headers having to be self-contained as a general rule, regardless
> of the issues with kconfig and the build artifacts.

Right, no general rule.

But the data I just ran shows the vast majority are already self
contained (~15% are not) and many are trivially fixable to be self
contained. There is a fairly small minority that will not and should
not be self contained.

So I expect there is alot of headers where people would agree to add
the missing #include <linux/types.h> for example, which I found
about 20 of in about 10 mins.

And a smallish exclusion list to ignore the special cases. Ie I
started by just regex ignoring all of asm because there was lots of
interesting stuff in there.

The point is we can probably get to a full kernel check, with a
minority of special headers excluded, that does not have any errors.

As I said in my first email I think this brings real actual value to
people using clangd. AFAICT there is no good reason that every day
normal headers should be missing their #include <linux/types.h> (which
seems to be the most common error)

This is where I think it is constructive to present what the actual
proposed header files changes would be.

> > You can run W=1 using a subdirectory build just for your drivers.
> 
> I don't think there's a way to build the entire kernel while limiting
> W=1 warnings to a subdirectory, is there? Mixing W=1 and regular builds
> causes everything to be rebuilt due to dependencies. It's not only for
> CI, it's also for developers.

You'd have to do the W=0 build then a subdirectory W=1 build.

I agree this is annoying and I do wish kbuild had a better solution
here.

> Thanks for the proof-of-concept. It's just that I don't see how that
> could be bolted to kbuild, with dependency tracking. I don't want to
> have to rebuild the world every time something changes.

I used ninja to run this because it is very easy to get setup and
going and doesn't leave behind the 'turds'. The main point was to show
that the .cmd processing and so on works sensibly and does avoid the
kconfig issues.

If people agree to stick with ninja for this then you'd use the -MD
option to gcc and the depfile=foo.d instruction then you get full
dependency tracking and incremental compilation. Along with a rule to
rebuild the rule file if any .cmd file changes. I did not show this,
but it is very easy.

Jason
