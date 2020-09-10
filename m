Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D12A263EFF
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 09:51:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A48389E38;
	Thu, 10 Sep 2020 07:51:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch
 [185.70.40.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37DF4890DB
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 07:51:11 +0000 (UTC)
Date: Thu, 10 Sep 2020 07:50:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1599724268;
 bh=huJ4+ir8ZhrSzzNkmMZll8YBm5scwWHpr/6DKvVuSbA=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=I9IL4KkHwGkZ5Wr3IsX1KZVaq5eZCyPRTJIL+GYr+DhC9mT96/wglqG1CnlOBD1h3
 ZcVbIiZhDjPMLOBzJZ/pKCcfLbhPRXXmBJUgfAxIoOUlfg7sGNxeTvDevcMD+YMFYk
 jXSr7At3AMytpsCQxSwRDnTu/fBXwrh5NF1lN8cKOgh3LGwWdldED73QNZTdSMmshs
 DrerLbtqeWuWSZFkyqA0fzI4vb7uaJMlspvMzKZBGqIcH0j0f68OTRAEmGgMAnXD3r
 txncoVP8NpFrPt3rQGbFNU9EDSXcon6gBhu4KewV8WAsaPgsAJkhvUi+lw9ALz/V7M
 wi7inTcTT3aWA==
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: per-plane LUTs and CSCs?
Message-ID: <n5uMyyDW2WrhtODRwgsqla2mU-pP-gLV4vHHoIZzjvmzG17epyoBjSh8HxIcnaPAwIlRQZ7Aj7cuUz_iby97UlRMw-WAOss7k0oPQD8YPaQ=@emersion.fr>
In-Reply-To: <20200909105727.f5n5c6zudx2qyz2f@fsr-ub1864-141>
References: <20200909105727.f5n5c6zudx2qyz2f@fsr-ub1864-141>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, September 9, 2020 12:57 PM, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com> wrote:

> Hi all,
>
> I was wondering whether you could give me an advise on how to proceed further
> with the following issue as I'm preparing to upstream the next set of patches
> for the iMX8MQ display controller(DCSS). The display controller has 3 planes,
> each with 2 CSCs and one degamma LUT. The CSCs are in front and after the LUT
> respectively. Then the output from those 3 pipes is blended together and then
> gamma correction is applied using a linear-to-nonlinear LUT and another CSC, if
> needed.
>
> Currently, downstream, we have all those CSCs and LUTs hard-coded into a header
> file. Based on the colorspace, range, gamut selected for the output and/or
> plane input, we pick up the right CSCs and LUTs from that header file to
> configure our pipes... I guess this solution does the job, userspace doesn't
> need to care much about how to generate those tables. But, it's also not very
> flexible in case there is an app smart enough to know and actually generate
> their own custom tables. :/
>
> Looking through the dri-devel archives, I've seen that there was a tentative to
> implement a more or less generic per-plane LUT/CSC solution but it didn't make
> it in due to lack of userspace consumers...

Apart from full color management mentioned by Pekka, are there other
use-cases for these per-plane props?

One thing I can think of is that some drivers annoyingly only apply the
per-CRTC gamma LUT to the primary plane. I think it would make more
sense to not attach a gamma prop to the CRTC and instead only attach it
to the primary plane to make that clear. But I guess that would also
break existing user-space?

The gamma LUT is currently used by some compositors to implement "night
light"/redshift-like features.

> Adding CSC and degamma LUT properties for each plane as well as a gamma
> LUT and CSC for CRTC, would help get rid of the LUT/CSC header and rely
> entirely on userspace to fill in those tables. But userspace has to know
> how to generate those LUTs and colorspace conversion matrices in the
> first place...

So it wouldn't be enough for user-space to fill these gamma LUTs with
linear ramps and get colors that look fine? Would the process be more
involved? Would user-space need to know about the driver and generate
gamma LUTs depending on the driver?

That would be a show-stopper.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
