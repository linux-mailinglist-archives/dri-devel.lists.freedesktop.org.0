Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D534288B72
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 16:34:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7B2E6ECFE;
	Fri,  9 Oct 2020 14:34:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E04B6ECFD;
 Fri,  9 Oct 2020 14:34:23 +0000 (UTC)
Received: from embeddedor (187-162-31-110.static.axtel.net [187.162.31.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 262C02226B;
 Fri,  9 Oct 2020 14:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602254063;
 bh=NI5DLF6uPJ5jya9JuzI9Ra3gtpgV9aB2BH0rzTb6zPM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rJrRD065RVWZjHBQeufYQpcmp+VhiPjAiFyotfN37ETJ9AvJBbpjGfFgucwPeHHbD
 Pz1H92kmLDZnIkdkG0Hhg7YMQnRWRzye+bxbKlsBaJ3Ob5KT7cMRQeK9WmBYZ9L+Ca
 /OX1TyVGfVNQm9EwZ56xQvA/nf/yG65ezRlm+bT8=
Date: Fri, 9 Oct 2020 09:39:47 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH][next] amd/amdgpu_ctx: Use struct_size() helper and
 kmalloc()
Message-ID: <20201009143947.GA32493@embeddedor>
References: <20201008143450.GA23077@embeddedor>
 <4fe00048-2612-39f3-29bb-c9424000f836@amd.com>
 <20201009135430.GA31347@embeddedor>
 <de2282e7-7eb9-db79-1082-36d6508b05dd@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <de2282e7-7eb9-db79-1082-36d6508b05dd@amd.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 09, 2020 at 04:29:55PM +0200, Christian K=F6nig wrote:
> > > > -	entity =3D kcalloc(1, offsetof(typeof(*entity), fences[amdgpu_sch=
ed_jobs]),
> > > > +	entity =3D kmalloc(struct_size(entity, fences, amdgpu_sched_jobs),
> > > NAK. You could use kzalloc() here, but kmalloc won't zero initialize =
the
> > > memory which could result in unforeseen consequences.
> > Oh I see.. I certainly didn't take that into account.
> > =

> > I'll fix that up and respin.
> =

> Shit happens, we already have a fix for this. Alex merged it and it
> immediately broke our testing systems.

:/

> So one of our engineers came up with a fix which should already have been
> applied.

Great. Good to know it's already fixed! :)

Thanks
--
Gustavo
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
