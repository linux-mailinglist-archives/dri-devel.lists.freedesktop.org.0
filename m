Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8B2727822
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 09:05:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D41B110E354;
	Thu,  8 Jun 2023 07:05:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BECA610E354
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jun 2023 07:05:17 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id E17B26606F10;
 Thu,  8 Jun 2023 08:05:15 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1686207916;
 bh=PFSZSY34fILhyWnAcD/+FYvtz3M8hH4oa2qrJdZma7g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=TMnq4wnhSNV3AN9pI+8SgKXjDHX0zoHfC1Ka5T6LAShbR6dvuSAPCRhnIad6bdQqt
 HcuCwGiz3aYYSNqtIMf+Mj1IoMnFgrxVCuOv2KJPxpnvLhFOhHrK6kdW3+4PbO+kWW
 8yfhzep8QfqfJwrXhMWCsdD0ZKBmojMeYfx/TWLYsx4zd9JH/m+DpP2jBVacN0PjyU
 oH7p5afEj3QQC1TIO2FwUq/Ky6gPGeixi+H1zNSH4ttOVwU1Mpm0DD1aY6AEs0cxrC
 pqIr8R2+bk4qGlJsW+wsFHoF0ZA2In5ZZiw7XEy52fNFKmXZRhuY7mAJI8kcze+1CN
 hM9s+cVppSY/A==
Date: Thu, 8 Jun 2023 09:05:12 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: [RFC PATCH] drm/sched: Wait for the currently popped dependency
 in kill_jobs_cb()
Message-ID: <20230608090512.33a381c0@collabora.com>
In-Reply-To: <20230608065551.676490-1-boris.brezillon@collabora.com>
References: <20230608065551.676490-1-boris.brezillon@collabora.com>
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
Cc: Sarah Walker <sarah.walker@imgtec.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>, Donald Robson <donald.robson@imgtec.com>,
 Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu,  8 Jun 2023 08:55:51 +0200
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> If I understand correctly, drm_sched_entity_kill_jobs_cb() is supposed
> to wait on all the external dependencies (those added to
> drm_sched_job::dependencies) before signaling the job finished fence.
> This is done this way to prevent jobs depending on these canceled jobs
> from considering the resources they want to access as ready, when
> they're actually still used by other components, thus leading to
> potential data corruptions.
>=20
> The problem is, the kill_jobs logic is omitting the last fence popped
> from the dependencies array that was waited upon before
> drm_sched_entity_kill() was called (drm_sched_entity::dependency field),
> so we're basically waiting for all dependencies except one.
>=20
> This is an attempt at fixing that, but also an opportunity to make sure
> I understood the drm_sched_entity_kill(), because I'm not 100% sure if

               ^ the drm_sched_entity_kill() logic correctly, ...

> skipping this currently popped dependency was intentional or not. I can't
> see a good reason why we'd want to skip that one, but I might be missing
> something.
>=20
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Frank Binns <frank.binns@imgtec.com>
> Cc: Sarah Walker <sarah.walker@imgtec.com>
> Cc: Donald Robson <donald.robson@imgtec.com>
> Cc: Luben Tuikov <luben.tuikov@amd.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> ---
> Stumbled across this issue while working on native dependency support
> with Donald (which will be posted soon). Flagged as RFC, because I'm
> not sure this is legit, and also not sure we want to fix it this way.
> I tried re-using drm_sched_entity::dependency, but it's a bit of a mess
> because of the asynchronousity of the wait, and the fact we use
> drm_sched_entity::dependency to know if we have a clear_dep()
> callback registered, so we can easily reset it without removing the

                          ^ we can't ...

> callback.
