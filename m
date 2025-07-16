Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCC3B073D8
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 12:46:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EFBA10E6CC;
	Wed, 16 Jul 2025 10:46:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="v99ol0CC";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="pYLW2dMl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F303C10E6CC
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 10:46:28 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4bht5Z50TQz9t6p;
 Wed, 16 Jul 2025 12:46:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1752662786; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wfa0ZJiljtuCgGDIwdh4CKbpg0ixd4/aCoVCY7+num4=;
 b=v99ol0CCJaFhYw8+1wmx2vdJvJPv8qIUJYViFEhAyf0HFyH5MpSVErzo8FoDT2XQa45dWm
 vhuXcmhm4oSI7/O6mC6GcGY+wj4v64ANyw0zZEsD/xqyQYD++tw9JrfmaoDEWFJCKFN8SX
 6SUXSWblNQobvS2P1wgaBd0bhzY39uDhCUcT+UqfziXs3MsjpQNOtS9a3529eXYEUGD+vl
 eT0LhdCMyceHluyGRtwimjP/tYpVqT70knva+EOS+nJGsfJad/Z8QGVyw4enxocRn++Ylc
 c+GHdeYB9QPKyEB3J6Fp9Arfi7fCUpYRSmJTI1LXo4WWjpof/6afen1uvjdsQQ==
Message-ID: <49d822fc0f46e0fdeaccaeb2fbb1ade1c5cb1e5d.camel@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1752662784; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wfa0ZJiljtuCgGDIwdh4CKbpg0ixd4/aCoVCY7+num4=;
 b=pYLW2dMlhpzpMXJalKjkvqhaB/MW5ibA2Hu6CEEUmm0o/zA9tI/Yu0G3cHz6bS2HSK6CHf
 ZcqsDBqE2Z3olGCaMDxIH0tzkij5JwQSixzc22JEeQw8GYjj9C0GgnqXssT8wxrD9OYzWF
 u5dcj6j24nbYeMiFMaYsG2y73AP8KKOtbByVkcAsXs8KuHEyH0K/uOsRTSYO7AgVr6pBOk
 15O2Ft6nIk/d+2WF5XtVgG93rb8CmxNfCWYf4zfJwJ+rpJn29K3dYnVukP2nXTPACemCgc
 sBQoKa0vR08yje2UVGTHfiRU8ANuWdslzBB2aVs2V2ZlHJBCjUwf0I2aNHQh0Q==
Subject: Re: [PATCH] drm/sched: Remove optimization that causes hang when
 killing dependent jobs
From: Philipp Stanner <phasta@mailbox.org>
To: Michel =?ISO-8859-1?Q?D=E4nzer?= <michel.daenzer@mailbox.org>, 
 phasta@kernel.org, "cao, lin" <lin.cao@amd.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: "Yin, ZhenGuo (Chris)" <ZhenGuo.Yin@amd.com>, "Deng, Emily"
 <Emily.Deng@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>, 
 "dakr@kernel.org" <dakr@kernel.org>, "matthew.brost@intel.com"
 <matthew.brost@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sasha Levin <sashal@kernel.org>
Date: Wed, 16 Jul 2025 12:46:21 +0200
In-Reply-To: <fd46ca0c-e484-4bf8-b74e-0139ecc7deae@mailbox.org>
References: <20250715135033.706126-1-lincao12@amd.com>
 <b7e207ef3a775fed0f344ca24990c5aeb36b2507.camel@mailbox.org>
 <CO6PR12MB5491F9E1F21F95C89CC91DA2F556A@CO6PR12MB5491.namprd12.prod.outlook.com>
 <df5fe40e79db8e988661704ea4f72be1a2e4c14c.camel@mailbox.org>
 <fd46ca0c-e484-4bf8-b74e-0139ecc7deae@mailbox.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 139ebe45d70cd42c3c3
X-MBO-RS-META: 4ehwkaafmpdwggadbyahmxhepyaq5gxz
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
Reply-To: phasta@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+Cc Greg, Sasha

On Wed, 2025-07-16 at 12:40 +0200, Michel D=C3=A4nzer wrote:
> On 16.07.25 11:57, Philipp Stanner wrote:
> > On Wed, 2025-07-16 at 09:43 +0000, cao, lin wrote:
> > >=20
> > > Hi Philipp,
> > >=20
> > >=20
> > > Thank you for the review. I found that this optimization was
> > > introduced 9 years ago in commit
> > > 777dbd458c89d4ca74a659f85ffb5bc817f29a35 ("drm/amdgpu: drop a
> > > dummy
> > > wakeup scheduler").
> > >=20
> > >=20
> > > Given that the=C2=A0codebase has undergone significant changes over
> > > these
> > > 9 years. May I ask if I still need to include the Fixes: tag?
> >=20
> > Yes. It's a helpful marker to see where the problem comes from, and
> > it
> > adds redundancy helping the stable-kernel maintainers in figuring
> > out
> > to which kernels to backport it to.
> >=20
> > If stable can't apply a patch to a very old stable kernel because
> > the
> > code base changed too much, they'll ping us and we might provide a
> > dedicated fix.
> >=20
> > So like that:
> >=20
> > Cc: stable@vger.kernel.org=C2=A0# v4.6+
> > Fixes: 777dbd458c89 ("drm/amdgpu: drop a dummy wakeup scheduler")
>=20
> FWIW, Fixes: alone is enough for getting backported to stable
> branches, Cc: stable is redundant with it.

Both are used all the time together, though. And the official
documentation does not list dropping Cc: stable as a valid option in
this regard

https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#opt=
ion-1


As long as the official documentation demands it, I'm not willing to
drop it. If the docu were to be changed, that would be fine by me, too.


P.


>=20
>=20

