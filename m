Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C2B5BE970
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 16:58:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5249F10E1E1;
	Tue, 20 Sep 2022 14:58:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3DA210E1E1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 14:58:14 +0000 (UTC)
Received: from maud (138-51-86-159-lsn-2.nat.utoronto.ca [138.51.86.159])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: alyssa)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 84D98660038D;
 Tue, 20 Sep 2022 15:58:12 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1663685893;
 bh=J8jFpEZKkwJ+A1zZdsROpdR81+2E7PlSdt6U6SMu0DU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MPrB+9lixlFP1AioKtL6aG1GAI1U8Hul1NErM4i1aDPqKDYFAMBzS2OAdXLTal3R2
 kcbXgc6SVDPcwos8nFwNCQUDzsRNeD/gORD1zb/PClINcyGTsYbe9wMqAMLduQt0Pg
 MU+47c7maTFv/CjS0uaNzz93UK4qG93aKr+7n32j4OwCt12sjGOmPK+jgwhoNRuSQS
 LwsnxGSTz0v/EoOPLxQLWWLlCzV4u+vfSop9+Zx4BeblC1CNaMK3DO7L6kzRjmTVHq
 hp2yEXMySzyep5QVMBtMxD3mUQrYgFkLJaY4oM1d59m6debWc3eN1JF0hlEL4gFl2+
 fQURJKV2u/lKw==
Date: Tue, 20 Sep 2022 10:58:08 -0400
From: Alyssa Rosenzweig <alyssa@collabora.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH] drm/panfrost: Give name to anonymous coredump object union
Message-ID: <YynVAAaQPIPhuN55@maud>
References: <20220912164413.2181937-1-adrian.larumbe@collabora.com>
 <5898d7a6-14c2-8e20-abc3-5971a4bcfd85@arm.com>
 <20220919064411.lmco2cyb4lpb5etu@sobremesa>
 <4dad1be9-fd0c-a745-a3a5-91f12c1d97d2@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4dad1be9-fd0c-a745-a3a5-91f12c1d97d2@arm.com>
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
Cc: Adri??n Larumbe <adrian.larumbe@collabora.com>,
 alyssa.rosenzweig@collabora.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 20, 2022 at 02:26:52PM +0100, Steven Price wrote:
> On 19/09/2022 07:44, Adri??n Larumbe wrote:
> > Hi Steven,
> > 
> > On 13.09.2022 09:45, Steven Price wrote:
> >> On 12/09/2022 17:44, Adri??n Larumbe wrote:
> >>> Building Mesa's Perfetto requires including the panfrost drm uAPI header in
> >>> C++ code, but the C++ compiler requires anonymous unions to have only
> >>> public non-static data members.
> >>>
> >>> Commit 730c2bf4ad39 ("drm/panfrost: Add support for devcoredump")
> >>> introduces one such union, breaking the Mesa build.
> >>>
> >>> Give it a name, and also rename pan_reg_hdr structure because it will
> >>> always be prefixed by the union name.
> >>>
> >>> Bug: https://gitlab.freedesktop.org/mesa/mesa/-/issues/7195
> >>>
> >>> Signed-off-by: Adri??n Larumbe <adrian.larumbe@collabora.com>
> > 
> >> Ouch! It's frustrating how C++ isn't quite a superset of C. However I
> >> think we can solve this with a simpler patch, I'd appreciate testing
> >> that this does indeed fix the build issues with Mesa with all supported
> >> compilers (I'm not so familiar with C++):
> > 
> > I just tested your changes on Mesa and they do fix the build.
> 
> Thanks Adri??n!
> 
> Alyssa: Could you give your R-b if you're happy with this change? It
> would be good to get this fixed before it hits -rc1.

R-b, however the issue isn't totally gone: in a separate but related
issue, apparently the __le types aren't portable and the devcoredump
support has now broken the panfrost (mesa) build for FreeBSD, which has
a UAPI-compatible reimplementation of panfrost.ko ...

Do we maybe want to change all the __le to u at the same time? If we
have to break UAPI, better do it before the UAPI is actually merged.
Panfrost is probably broken in far worse ways on big endian anyway. Or
maybe we want to keep doing little-endian but in u32 containers and have
conversions in the kernel for big-endian CPUs. Or maybe we want to just
"we don't care about big endian, because you'll have worse problems", at
a GPU level Mali hasn't supported big endian since Midgard so I doubt
the recent DDKs would work on BE either.

Anyway, ideally we'd solve both at once, and soon, so we don't have to
revert the devcoredump stuff from mesa.

Thanks,

Alyssa
