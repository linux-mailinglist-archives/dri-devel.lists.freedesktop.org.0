Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 835012889FF
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 15:49:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91DEC6ECF3;
	Fri,  9 Oct 2020 13:49:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25FA46ECE4;
 Fri,  9 Oct 2020 13:49:06 +0000 (UTC)
Received: from embeddedor (187-162-31-110.static.axtel.net [187.162.31.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0304B222B9;
 Fri,  9 Oct 2020 13:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602251345;
 bh=wl1fuI8lefh+3YsVxao7a3dyyLNUQhlLz4oNgzuFbLc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lVGWz6bscyAd1Q327E060Iz1w2Nr7nAKiIC7kTgVLRveWqIs/oKeRRovqVDW0jBJV
 tTVFadyniJetltJn8E2xB4ij52UJMud3O6wIH21iOKxycc7XLZg+kvK9HzImLrXdU3
 3WC9lAOb/e2eKvKZWOThK0VmDWL/eqUi7NhYl1wI=
Date: Fri, 9 Oct 2020 08:54:30 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH][next] amd/amdgpu_ctx: Use struct_size() helper and
 kmalloc()
Message-ID: <20201009135430.GA31347@embeddedor>
References: <20201008143450.GA23077@embeddedor>
 <4fe00048-2612-39f3-29bb-c9424000f836@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4fe00048-2612-39f3-29bb-c9424000f836@amd.com>
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

On Fri, Oct 09, 2020 at 09:08:51AM +0200, Christian K=F6nig wrote:
> Am 08.10.20 um 16:34 schrieb Gustavo A. R. Silva:
> > Make use of the new struct_size() helper instead of the offsetof() idio=
m.
> > Also, use kmalloc() instead of kcalloc().
> > =

> > Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > =

> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_ctx.c
> > index c80d8339f58c..5be125f3b92a 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
> > @@ -100,7 +100,7 @@ static int amdgpu_ctx_init_entity(struct amdgpu_ctx=
 *ctx, u32 hw_ip,
> >   	enum drm_sched_priority priority;
> >   	int r;
> > -	entity =3D kcalloc(1, offsetof(typeof(*entity), fences[amdgpu_sched_j=
obs]),
> > +	entity =3D kmalloc(struct_size(entity, fences, amdgpu_sched_jobs),
> =

> NAK. You could use kzalloc() here, but kmalloc won't zero initialize the
> memory which could result in unforeseen consequences.

Oh I see.. I certainly didn't take that into account.

I'll fix that up and respin.

Thanks
--
Gustavo
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
