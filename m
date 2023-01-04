Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA0E65D69E
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 15:55:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD2EA10E4F6;
	Wed,  4 Jan 2023 14:55:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AF4510E4F6;
 Wed,  4 Jan 2023 14:55:36 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8337161738;
 Wed,  4 Jan 2023 14:55:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64B76C433F0;
 Wed,  4 Jan 2023 14:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1672844134;
 bh=zwF9T2z5L044ggy5j+5rYTatc9avuUbCH+Aw6bOhtFs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=szIP0Hr7BqLslgfZBQLFYOHb4HjlQ1udMsGC8m19ZnM0dkAO6sqNgCIJsYSoemi2x
 XvPOWn93w1b7RUKQ7aqoqhOIRBNemu8X9SwbtwVRX+Ig6ju9lCf7rdCMaSNf4/Jnyu
 n9BBVL+qOmeXJRkhKLlFLsoE/w9GKWKUGyYOr2D4=
Date: Wed, 4 Jan 2023 15:48:11 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH 4.19 1/1] drm/amdkfd: Check for null pointer after
 calling kmemdup
Message-ID: <Y7WRq7MaFaIJ2uGF@kroah.com>
References: <20230103184308.511448-1-dragos.panait@windriver.com>
 <20230103184308.511448-2-dragos.panait@windriver.com>
 <Y7Vz8mm0X+1h844b@kroah.com>
 <a8c6859f-5876-08cf-5949-ecf88e6bb528@amd.com>
 <CADnq5_Ons+yMyGxcSaFaOb5uNXooHgH_4N=ThHOGYaW9Pb_Q8A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADnq5_Ons+yMyGxcSaFaOb5uNXooHgH_4N=ThHOGYaW9Pb_Q8A@mail.gmail.com>
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
Cc: David Zhou <David1.Zhou@amd.com>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>,
 Dragos-Marian Panait <dragos.panait@windriver.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 stable@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 04, 2023 at 09:35:03AM -0500, Alex Deucher wrote:
> On Wed, Jan 4, 2023 at 8:23 AM Christian König <christian.koenig@amd.com> wrote:
> >
> > Am 04.01.23 um 13:41 schrieb Greg KH:
> > > On Tue, Jan 03, 2023 at 08:43:08PM +0200, Dragos-Marian Panait wrote:
> > >> From: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> > >>
> > >> [ Upstream commit abfaf0eee97925905e742aa3b0b72e04a918fa9e ]
> > >>
> > >> As the possible failure of the allocation, kmemdup() may return NULL
> > >> pointer.
> > >> Therefore, it should be better to check the 'props2' in order to prevent
> > >> the dereference of NULL pointer.
> > >>
> > >> Fixes: 3a87177eb141 ("drm/amdkfd: Add topology support for dGPUs")
> > >> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> > >> Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
> > >> Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
> > >> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> > >> Signed-off-by: Dragos-Marian Panait <dragos.panait@windriver.com>
> > >> ---
> > >>   drivers/gpu/drm/amd/amdkfd/kfd_crat.c | 3 +++
> > >>   1 file changed, 3 insertions(+)
> > > For obvious reasons, I can't take a patch for 4.19.y and not newer
> > > kernel releases, right?
> > >
> > > Please provide backports for all kernels if you really need to see this
> > > merged.  And note, it's not a real bug at all, and given that a CVE was
> > > allocated for it that makes me want to even more reject it to show the
> > > whole folly of that mess.
> >
> > Well as far as I can see this is nonsense to back port.
> >
> > The code in question is only used only once during driver load and then
> > never again, that exactly this allocation fails while tons of other are
> > made before and after is extremely unlikely.
> >
> > It's nice to have it fixed in newer kernels, but not worth a backport
> > and certainly not stuff for a CVE.
> 
> It's already fixed in Linus' tree:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=abfaf0eee97925905e742aa3b0b72e04a918fa9e

Yes, that's what the above commit shows...

confused,

greg k-h
