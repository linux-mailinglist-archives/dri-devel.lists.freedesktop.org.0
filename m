Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A022F7386B6
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 16:21:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DAB510E497;
	Wed, 21 Jun 2023 14:21:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1237710E497
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 14:21:29 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 508096606F94;
 Wed, 21 Jun 2023 15:21:28 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1687357288;
 bh=EdzlLtSDJcVYdpNEfOFGw7sk81LSueECG7Is1nZmO4s=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Bm8sNZqVMmuBJVvy53nWGRJ0Fc3CtnBXhxHftSHmB5/soF6wx+tDFgKjMbzF0yVZw
 CHXqi7vmCVFS9e4HXfF2ijhXeyNhVOr/+DCX+sDJrvC+K3ravAVHI/qOrFv1VURAbF
 oBgu9o79+Dz7NWX0kFWdUjbFh7Q9GBg6yn3y0fldqUfRre/rgKKqpCGyluC0Ev+UD2
 tqWOlI6v9V/MGlcsKEPLirjzdWF25qVtSiqaFVKRrOAtgK02N03lE53B9RJbz9/cNW
 FD1+pQHDk1PmzxOsS3ISoXvwo+JoadITwdKW/BIAfQouPdOM44td6QALB1PIjkn6pl
 7T4ny3y/s8SiQ==
Date: Wed, 21 Jun 2023 16:21:25 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [PATCH] drm/sched: Call drm_sched_fence_set_parent() from
 drm_sched_fence_scheduled()
Message-ID: <20230621162125.1fa29793@collabora.com>
In-Reply-To: <7333ddbd-6444-a6d5-73b2-4d1648ec4cec@amd.com>
References: <20230613094424.2176746-1-boris.brezillon@collabora.com>
 <20230613114611.11402411@collabora.com>
 <7333ddbd-6444-a6d5-73b2-4d1648ec4cec@amd.com>
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
Cc: Sarah Walker <sarah.walker@imgtec.com>, dri-devel@lists.freedesktop.org,
 Luben Tuikov <luben.tuikov@amd.com>, Donald Robson <donald.robson@imgtec.com>,
 Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

On Tue, 13 Jun 2023 13:06:06 +0200
Christian K=C3=B6nig <christian.koenig@amd.com> wrote:

> Am 13.06.23 um 11:46 schrieb Boris Brezillon:
> > On Tue, 13 Jun 2023 11:44:24 +0200
> > Boris Brezillon <boris.brezillon@collabora.com> wrote:
> > =20
> >> Drivers that can delegate waits to the firmware/GPU pass the scheduled
> >> fence to drm_sched_job_add_dependency(), and issue wait commands to
> >> the firmware/GPU at job submission time. For this to be possible, they
> >> need all their 'native' dependencies to have a valid parent since this
> >> is where the actual HW fence information are encoded.
> >>
> >> In drm_sched_main(), we currently call drm_sched_fence_set_parent()
> >> after drm_sched_fence_set_parent(), leaving a short period of time =20
> > after drm_sched_fence_scheduled(), ... =20
>=20
> I was just about to complain, but yeah sounds like the right idea to me.
>=20
> Just let me review the patch in more detail.

Did you have time to look at this patch in more detail? Should I send a
v2 fixing the mistake in the commit message?

Regards,

Boris
