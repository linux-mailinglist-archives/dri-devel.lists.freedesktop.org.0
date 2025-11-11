Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 817EBC4BBC6
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 07:52:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DED410E097;
	Tue, 11 Nov 2025 06:52:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="xAFMq6S5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD93F10E097
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 06:52:40 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4d5HKK1fsjz9sVh;
 Tue, 11 Nov 2025 07:52:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1762843957; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fy7+wkF0oQv3oCtjE+5B16eRZULzNqc8FDFTQSP8DsI=;
 b=xAFMq6S5K91Awn1CzwfbwM6gkDU8YecjxplnJ9+RK2FygFCof5IcSlmtVESDLw9RAxXHfQ
 Qj2vM+YhHhr0zIAVq5KO9IESZ7PnWaM78uhx7HCOe2yn5HSk2l+EFNjNXvLOIH+ZnCy/PH
 1WtWJotKx2Maly+UnonpmY/wjKNJfrEOYp0ex20ctpbIHrfC4JKYcqD0tVEX0UYurBZRZY
 zzp6a61rsTXnYZ5KnHZRH3k1ZJq23xjQeW9ifCXIbuAHlRIsCVS1tNkUyR/bNHZVI8O0C4
 2fzN9tR3mo3eXnHAOP4gosItViM0whSi4IFCjFR3COgUsRWgFv+9iR+LORvxdw==
Message-ID: <9e74c7a8614591c1f7c08bac1460f7043173c856.camel@mailbox.org>
Subject: Re: [PATCH] drm/sched: Fix UB in spsc_queue
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 phasta@kernel.org, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, Andrey
 Grodzovsky <Andrey.Grodzovsky@amd.com>, dakr@kernel.org, Matthew Brost
 <matthew.brost@intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
Date: Tue, 11 Nov 2025 07:52:32 +0100
In-Reply-To: <a3eefc87-2678-4a4d-82c8-f6aedf74be75@amd.com>
References: <20251110081903.11539-2-phasta@kernel.org>
 <ee63ca7d-77d2-44d8-973b-7276f8c4d4a5@amd.com>
 <ee9fe54f3764bc0ee4ebafe5c10ad4afe748ef19.camel@mailbox.org>
 <2c72eb6e-7792-4212-b06f-5300bc9a42f9@amd.com>
 <987527ead1fe93877139a9ee8b6d2ee55eefa1ee.camel@mailbox.org>
 <05603d39-0aeb-493e-a1ed-8051a99dfc41@amd.com>
 <589a1be140f3c8623a2647b107a1130289eb00ba.camel@mailbox.org>
 <a3eefc87-2678-4a4d-82c8-f6aedf74be75@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 1effdb85b9b9436c5dd
X-MBO-RS-META: fcjbgqxjfgnpt3kh36rkzrjh4wufkjus
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

On Mon, 2025-11-10 at 17:08 +0100, Christian K=C3=B6nig wrote:
> On 11/10/25 16:55, Philipp Stanner wrote:
> > Lock + head (same cache line) + head->next
> > head->next->next
> >=20
> > when popping:
> >=20
> > Lock + head + head->previous
> > head->previous->previous
> >=20
> > I don't see why you need a "current" element when you're always only
> > touching head or tail.
>=20
> The current element is the one you insert or remove.

That won't cause a cache miss because you have just created that
element in the submitting CPU, owning it exclusively.

>=20
> >=20
> > Now we're speaking mostly the same language :]
> >=20
> > If you could RB my DRM TODO patches we'd have a section for drm/sched,
> > and there we could then soonish add an item for getting rid of spsc.
> >=20
> > https://lore.kernel.org/dri-devel/20251107135701.244659-2-phasta@kernel=
.org/
>=20
> I can't find that in my inbox anywhere. Can you send it out one more with=
 my AMD mail address on explicit CC? Thanks in advance.

I can see to it. But can't you download the mbox file on the link and
import it in your mail client?

> > Lockless magic should always be justified by real world use cases.
> >=20
> > By the way, back when spsc_queue was implemented, how large were the
> > real world performance gains you meassured by saving that 1 cache line?
>=20
> That was actually quite a bit. If you want a real world test case use glM=
ark2 on any modern HW.
>=20
> And yeah I know how ridicules that is, the problem is that we still have =
people using this as indicator for the command submission overhead.

If we were living in a world were you'd always need 5 cache lines than
that would just be the reality. And 5 would already be better than 8.
So what's the deal? It seems this was not about "too slow" but about
"faster than".

There's two topics which often make us pay the high price of buggyness
and low maintainability. One of them being limitless performance
optimizations.

I think that correctness always trumps speed. How happy does it make
your customer if your driver delivers 5 fps more, but the game crashes
2 times per hour? (which btw happens to me with Steam on my amd card.
Sometimes there are even hangs without a reset happening, which is
strange. I'll open a ticket next time I see it happen).


P.
