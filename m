Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4A172C915
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 16:59:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4BC810E2A0;
	Mon, 12 Jun 2023 14:59:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6900910E0CB
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 14:59:08 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 58A37660583E;
 Mon, 12 Jun 2023 15:59:05 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1686581945;
 bh=j6RQF1VwyZXGz9zdAJ7Bf1DQrbbnAU194jmzC/3zXyI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=OuUD3QYCzm2NW7kfdhkCiMpHQfLlkcJ7mCTeCJPNuGq7gN788UOtZBhFj4qS0awTu
 rJ9PBTbLH4vcDp4xtK5kITMaLw4lGqtwA/rjjHsX1x17t/58RLIRz9PWx354D6xGAT
 ubMHdOArkgdKXRZZ3F3NrhfBQojmBY8jq1HmVjjysjbpymkTRAwfjJflrkqsXvoJsG
 vjL59uyhscyuG9BfpGOuekNf2/HqJvomGb/izRllN8cZeXTMCh8GBaYNfQjrSbaFQZ
 +XQFmkKYW0pca+LgvCSdjejHHPGTyeHReK6sSTzC1cTDxVFuBdFGtQYDNQOrl2xFZf
 Nk6yKk+BoppWg==
Date: Mon, 12 Jun 2023 16:59:02 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [PATCH] drm/sched: Add native dependency support to drm_sched
Message-ID: <20230612165902.437345c4@collabora.com>
In-Reply-To: <5fcf04fa-1f45-30dd-1a37-cb0eba6d5f4a@amd.com>
References: <7ced7c0a101cb2467c34b69d2b686c429f64d8c2.camel@imgtec.com>
 <5fcf04fa-1f45-30dd-1a37-cb0eba6d5f4a@amd.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
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
Cc: Sarah Walker <Sarah.Walker@imgtec.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "luben.tuikov@amd.com" <luben.tuikov@amd.com>,
 Donald Robson <Donald.Robson@imgtec.com>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

On Mon, 12 Jun 2023 15:16:03 +0200
Christian K=C3=B6nig <christian.koenig@amd.com> wrote:

> Am 08.06.23 um 15:23 schrieb Donald Robson:
> > This patch adds support for 'native' dependencies to DRM scheduler.  In
> > drivers that use a firmware based scheduler there are performance gains
> > to be had by allowing waits to happen in the firmware, as this reduces
> > the latency between signalling and job submission. =20
>=20
> Well, if I'm not completely mistaken this patch here is superfluous=20
> since we already use that functionality.
>=20
> This strongly sounds like the HW dependencies we have in amdgpu. See=20
> AMDGPU_CHUNK_ID_SCHEDULED_DEPENDENCIES.

I'll look at it in more details. Thanks for the pointer.

>=20
> Basically userspace can instead of giving a hard dependency to finish=20
> something before the current submission starts also give a soft=20
> dependency and only let the other submission be scheduled.
>=20
> This way you can then wait for the firmware for certain operations of=20
> the previous submission to complete by comparing memory or registers.
>=20
> You don't necessarily need to give control over this to userspace, if=20
> your kernel driver can determine a fw assisted wait by itself that=20
> should also work fine.

That's what we did initially. We had a separate 'native_deps' xarray in
pvr_job that we were managing ourselves, and that worked fine, except
for the kill_entity() stuff. If you don't wait for those
'native-fences', you're potentially signaling the job finished fence
earlier than it should.

Just to make sure we're on the same page, the native fences we
have here are really dma_fences that can be waited upon FW side:
they're not exposed to userspace, the GPU can't access the memory
region containing the counter (it's visible to the FW VM only, and
a kernel side CPU mapping), and we do make sure they signal in finite
time thanks to the job timeout. Feels a bit different compared to
USER_FENCEs most GPUs have nowadays, on which you don't have this
isolation guarantee, and which, AFAIU, are currently used to do some
advanced userspace driven scheduling between queues belonging to the
same context. My understanding, after discussing it with Daniel a few
weeks back, was that exposing USER_FENCEs as dma_fences was risky,
especially if they're used to do inter-context synchronization,
but the FW-visible-only ones were okay to expose as dma_fences. Maybe I
misunderstood what he suggested.

I'm done with this digression, now back to the original topic: we can of
course wait for all those native fences before calling
drm_sched_enity_destroy(), but that's a bit weird to do some partial
wait in the driver while the entity is still active (pretty sure that's
racy anyway), and then delegate the rest to the core.

If we decide we don't care about waiting for native fences when
killing jobs in the kill_entity() path, because we assume drm_resv is
covering us, that's fine, but then I don't really see why
drm_sched_kill_entity() should wait at all, because this 'should wait,
but maybe not for all your deps' behavior is quite confusing.

Regards,

Boris
