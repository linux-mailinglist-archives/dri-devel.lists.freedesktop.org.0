Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7942C52962
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 15:00:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC1DE10E745;
	Wed, 12 Nov 2025 14:00:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="TQQ2KOmG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 719B310E745;
 Wed, 12 Nov 2025 14:00:45 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4d64mp2m4vz9tkJ;
 Wed, 12 Nov 2025 15:00:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1762956042; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YYLf2JVafG2xHRMUrhipg24sCV1x5XqBd7F598RpB6Q=;
 b=TQQ2KOmGXLeIh8+O9Dj0K+hKgr1WETvdD11NUjdxfIWayEMMNpTEX2wCEDRXqUK3rPyp+5
 K2CbbtufbPvFKFSUcCI2y46pHB5mnPfUVtCrqcWLdurCzbzR9rTrfXjkA6P1wcLjrp80Hh
 uapSS07xgxqa7FJeiHSLTAiFatNBXlTZ4mnHdIRKbRzv8aycwjj+TINfzXdC4PRrwe7S9a
 4PX594Awl84diXb5zZv1gcXDPja4yoVQKhcoAvDBBX+l1/7Rl9Yofsa+JjPgBPRw8vXU/S
 8/dK3HKBTKSyMwjCBMjMx6QCi6ZdOlxzPCgRxLkXdpI42GPcwKTS3ijkOMt1xQ==
Message-ID: <e3869daefb0fd7abe293a6d445c44a8f98f14e1c.camel@mailbox.org>
Subject: Re: [PATCH 07/20] dma-buf: use inline lock for the dma-fence-array
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 phasta@kernel.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch, 
 tursulin@ursulin.net, airlied@gmail.com, felix.kuehling@amd.com, 
 matthew.brost@intel.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Date: Wed, 12 Nov 2025 15:00:35 +0100
In-Reply-To: <52d862d2-fd26-4770-91ab-9a2ea8073282@amd.com>
References: <20251031134442.113648-1-christian.koenig@amd.com>
 <20251031134442.113648-8-christian.koenig@amd.com>
 <54bdf125bec4dd612d45fc96bb81f03e5a432b02.camel@mailbox.org>
 <52d862d2-fd26-4770-91ab-9a2ea8073282@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 074dabd9c758d3d26c1
X-MBO-RS-META: 95xpezcnqafbf13ewk69wm1hzf5hg1aa
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

On Wed, 2025-11-12 at 14:53 +0100, Christian K=C3=B6nig wrote:
> On 11/7/25 13:04, Philipp Stanner wrote:
> > On Fri, 2025-10-31 at 14:16 +0100, Christian K=C3=B6nig wrote:
> > > Just as proof of concept and minor cleanup.
> >=20
> > I maintain that even relatively simple commits should give a new
> > reader
> > ore one who's browsing through the log in 3 years a rough idea
> > what's
> > going on.
> >=20
> > That is: quickly describe what the situation (motivation) is and
> > what
> > the commit does.
> >=20
> > At the very least "proof of concept" is nothing anyone would expect
> > in
> > a non-RFC patch. To me as a non-expert in dma-buf it's not clear at
> > all
> > whether this patch here is actually necessary, i.e., solves a
> > problem.=C2=A0
>=20
> Proof of concept in the sense "I use this patch to test the concept
> with with the kernel unit tests and robots".

I think since independent fences are the recommendation (see below),
it's better to have this commit being about moving users to the
recommended usage.

>=20
> > I also don't see how replacing one lock position with another is a
> > "cleanup". Sharing spinlocks is perfectly legal and will remain so,
> > no?
>=20
> Well that's the more interesting question.
>=20
> On the one hand I'm now pretty sure that allowing those shared fences
> was a really bad idea, there is simply no valid use case for them.
>=20
> On the other hand changing all the existing implementations would be
> tons of work with limited gain. I already tried that before and
> without some intermediate solution like this here it would be an
> enormous patch set touching all current implementations at the same
> time.

I also prefer (want) non-shared fences for Rust.

What we can do is explicitly document that independent fences are the
strong recommendation for new users. "It is recommended that you pass
NULL for the fence so that fences get separate locks, which allows for
cleanly decoupling fences from their issuer and even the fence context
object (being protected by the same spinlock)."

I think that's not included in the series yet.


P.
