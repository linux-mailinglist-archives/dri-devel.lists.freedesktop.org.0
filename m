Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D927D9C1FF1
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2024 16:03:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8712C10E9E4;
	Fri,  8 Nov 2024 15:03:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="dAimDrk5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5344C10E9E4
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2024 15:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1731078193;
 bh=lVE9Z4wMs8/n6IY849qZ+RNMvwVjXcDRrWSl5bm9WmM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dAimDrk5OBskJePRu9XRsV0OeSwKWFumZ3qxhGexk0V+53T0TFRkthBjdA654ZoMf
 J7O6XXGT/O0qOJqhDFvPw8xnximFlM07urF9N+gyOHlfaFHpJTctSYCDCquqK2K93I
 J77RZ8T84XfGiYWnQs/e1NdLG7kCXoXG5qePQ4HQPHDEECgRs+5hJiqmOWjum6JiwB
 mApuU1WPabd5Y/VMMgoOe44jl4vBSgSAorA9n+A/zWLfOFVoiKPjKfRZKcCuArLBPu
 9Ho1xWV/aDnx6iJBWcxatbkjSroZ98xDdz1w1046EVw9ajlODveB9tQt9U2K0CXhAT
 SmjoOv1yyWVRQ==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 96A0A17E36A7;
 Fri,  8 Nov 2024 16:03:12 +0100 (CET)
Date: Fri, 8 Nov 2024 16:03:09 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Christian =?UTF-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>, olvaffe@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 lionel.g.landwerlin@intel.com, dri-devel@lists.freedesktop.org,
 faith.ekstrand@collabora.com, simona@ffwll.ch
Subject: Re: [PATCH] dma-buf: fix dma_fence_array_signaled
Message-ID: <20241108160309.484c08b5@collabora.com>
In-Reply-To: <f9d27c0a-084f-4b35-bd6c-af25a6bb830d@gmail.com>
References: <20241108094256.3717-1-christian.koenig@amd.com>
 <20241108094256.3717-2-christian.koenig@amd.com>
 <cce719d7-adc9-4f5b-803a-fd173d325806@ursulin.net>
 <f9d27c0a-084f-4b35-bd6c-af25a6bb830d@gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Fri, 8 Nov 2024 15:18:38 +0100
Christian K=C3=B6nig <ckoenig.leichtzumerken@gmail.com> wrote:

> > }
> > =C2=A0=C2=A0=C2=A0=C2=A0}
> >
> > =C2=A0=C2=A0=C2=A0=C2=A0dma_fence_array_clear_pending_error(array);
> > =C2=A0=C2=A0=C2=A0=C2=A0return true;
> > }
> >
> > Or if the optimisation to not walk the array when signalling is=20
> > already enabled is deemed important, perhaps a less thinking inducing=20
> > way would be this: =20
> ...
> > Decrementing locally cached num_pending in the loop I think does not=20
> > bring anything since when signalling is not enabled it will be stuck=20
> > at num_fences. So the loop walks the whole array versus bail on first=20
> > unsignalled, so latter even more efficient. =20
>=20
> That is not for optimization but for correctness.
>=20
> What the patch basically does is the following:
> 1. Grab the current value of num_pending.
>=20
> 2. Test if num_pending was potentially already modified because=20
> signaling is already enabled, if yes just test it and return the result.
>=20
> 3. If it wasn't modified go over the fences and see if we already have=20
> at least num_pending signaled.
>=20
> I should probably add a code comment explaining that.

Sorry, I didn't sync my inbox before replying. Looks like we're on the
same page here: the code clearly needs comments to explain what's going
on.
