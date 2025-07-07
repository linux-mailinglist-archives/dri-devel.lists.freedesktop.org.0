Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF509AFB55A
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 15:54:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD01E10E49E;
	Mon,  7 Jul 2025 13:54:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="DXOoGT8M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3ECC10E4A6;
 Mon,  7 Jul 2025 13:54:37 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4bbQhp2bbYz9snN;
 Mon,  7 Jul 2025 15:54:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1751896474; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2BqhwT8Nr4vG7FFUJaWUmxP9QQSwgaOjItrDKQSh2ZI=;
 b=DXOoGT8MhARLRaliROBmSJNijpxY/AbJ1O2N+jsG4asOTxRB2QMjWeigPRlxYJ19SFGNAB
 H78kQ3V6kMaRn5qC9e0bVKE3bg7a3N+yhqp+UwMMVZuksOuojGriUpoNOkWuPIubPoxRlF
 bQEluWwQELB92vGG+VKzOI7RB8a25NY+BsW8/tx2d4NHVok3qpujZv97NnMYg76/jCDoFf
 4/404RsQyMoxxzVQghu+dDOeTDXLU0h1x2JhTzlY+AZlShxjk5gREAu6K58ychlZUC/Cyq
 ymms1NCjYmdCo3qpHT/4vFCpMaaqbjqL3TaoXdlw779PSJQ/jiQYHvBC6klDag==
Message-ID: <7d5137a8c71c525c4e806f8ff06102d2e3a47ccc.camel@mailbox.org>
Subject: Re: [PATCH v2 7/7] drm/nouveau: Remove waitque for sched teardown
From: Philipp Stanner <phasta@mailbox.org>
To: Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Sumit Semwal
 <sumit.semwal@linaro.org>, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Date: Mon, 07 Jul 2025 15:54:26 +0200
In-Reply-To: <89b0a4bf-2a66-4610-93d2-8f2f096592a3@kernel.org>
References: <20250707134221.34291-2-phasta@kernel.org>
 <20250707134221.34291-9-phasta@kernel.org>
 <89b0a4bf-2a66-4610-93d2-8f2f096592a3@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: b05b9421ee7d28b08f7
X-MBO-RS-META: kuh7iboedyuumzst34pgyixoy47xmkat
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

On Mon, 2025-07-07 at 15:47 +0200, Danilo Krummrich wrote:
> On 7/7/25 3:42 PM, Philipp Stanner wrote:
> > struct nouveau_sched contains a waitque needed to prevent
> > drm_sched_fini() from being called while there are still jobs
> > pending.
> > Doing so so far would have caused memory leaks.
> >=20
> > With the new memleak-free mode of operation switched on in
> > drm_sched_fini() by providing the callback
> > nouveau_sched_fence_context_kill() the waitque is not necessary
> > anymore.
> >=20
> > Remove the waitque.
> >=20
> > Signed-off-by: Philipp Stanner <phasta@kernel.org>
>=20
> Doesn't this break the driver until fixed up by the subsequent patch?
>=20

Did you mean to answer to patch 6?

Patch 6 implements the cancel_job() callback for nouveau, which makes
sure the (still existing) waitque will never block. The, now redundant,
waitque then gets removed in patch 7.


P.
