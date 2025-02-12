Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6865EA32BAC
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 17:34:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D21CB10E8FE;
	Wed, 12 Feb 2025 16:34:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="b9nDl6qc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23A5910E8FE
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 16:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1739378040;
 bh=XW2cmimmsoPZheCkX4Tx4qcVkqmDF2UJHaaVD5S3OqA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=b9nDl6qc5YGm36wJf+DcRLjlIEot2/XJ0qbti0Syzv51S7qV8AQVSW6aF3rdohJ30
 6gJWBRARJBarF7ieJ5KxsMm/OJmiB1NjUu+C5Ii4jBKs5i4bD2o68EtXCW4OTGO6sA
 C4Ra1UH8pdZ6wZ9BHip39FGePm4dmSIg2JiJAX0p6H5CURiMOpkwqh2V147GOXLB2a
 I/oah5ofk8YpRrHAG6aAbqq7KT0dKiBuQ1h784zuQq/405AmB6aLhxMj1WZykxvGxd
 ehXYktpJcl9qvf6GeaM8123pOxHaAzVE3CbQOLixswyJOYCkPQihyTlD5Jtna5kmHV
 6nekpFbZrTKpA==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 3CCE117E01B3;
 Wed, 12 Feb 2025 17:34:00 +0100 (CET)
Date: Wed, 12 Feb 2025 17:33:56 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>, Steven
 Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/panthor: Replace sleep locks with spinlocks in
 fdinfo path
Message-ID: <20250212173356.10f47318@collabora.com>
In-Reply-To: <7ee0205a-6522-465b-8795-3d7b867e2d97@ursulin.net>
References: <20250210124203.124191-1-adrian.larumbe@collabora.com>
 <2ec2a848-90f4-49bc-aaaf-8eb256f271db@ursulin.net>
 <ddnsckbpr2fcxby4i2o5xyrt3pdhornzbrvlbivuvzlyhgg66q@ejhkiz33sewn>
 <7ee0205a-6522-465b-8795-3d7b867e2d97@ursulin.net>
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

On Tue, 11 Feb 2025 11:39:49 +0000
Tvrtko Ursulin <tursulin@ursulin.net> wrote:

> On 10/02/2025 16:08, Adri=C3=A1n Larumbe wrote:
> > Hi Tvrtko, =20
>=20
> Thanks!
>=20
> > [18153.770244] BUG: sleeping function called from invalid context at ke=
rnel/locking/mutex.c:562
> > [18153.771059] in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 2=
03412, name: cat
> > [18153.771757] preempt_count: 1, expected: 0
> > [18153.772164] RCU nest depth: 0, expected: 0
> > [18153.772538] INFO: lockdep is turned off.
> > [18153.772898] CPU: 4 UID: 0 PID: 203412 Comm: cat Tainted: G        W =
         6.14.0-rc1-panthor-next-rk3588-fdinfo+ #1
> > [18153.772906] Tainted: [W]=3DWARN
> > [18153.772908] Hardware name: Radxa ROCK 5B (DT)
> > [18153.772911] Call trace:
> > [18153.772913]  show_stack+0x24/0x38 (C)
> > [18153.772927]  dump_stack_lvl+0x3c/0x98
> > [18153.772935]  dump_stack+0x18/0x24
> > [18153.772941]  __might_resched+0x298/0x2b0
> > [18153.772948]  __might_sleep+0x6c/0xb0
> > [18153.772953]  __mutex_lock_common+0x7c/0x1950
> > [18153.772962]  mutex_lock_nested+0x38/0x50
> > [18153.772969]  panthor_fdinfo_gather_group_samples+0x80/0x138 [panthor]
> > [18153.773042]  panthor_show_fdinfo+0x80/0x228 [panthor]
> > [18153.773109]  drm_show_fdinfo+0x1a4/0x1e0 [drm]
> > [18153.773397]  seq_show+0x274/0x358
> > [18153.773404]  seq_read_iter+0x1d4/0x630 =20
>=20
> There is a mutex_lock literally in seq_read_iter.
>=20
> So colour me confused. What created the atomic context between then and=20
> Panthor code?! I just don't see it.

It's actually the xa_lock() we take when gathering fdinfo data that
puts us in this atomic context. In other words, the fix is correct, but
the explanation is wrong :-).
