Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6097A78DAC
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 14:01:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23DF710E709;
	Wed,  2 Apr 2025 12:00:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="sBXeOag/";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="yMlCQGvA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E777C10E709;
 Wed,  2 Apr 2025 12:00:51 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4ZSNjs4ZQ6z9tJM;
 Wed,  2 Apr 2025 14:00:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1743595249; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nl4l8of68HS2zq9TP8rEIRyIj3+DQpTOv77MizaWLHc=;
 b=sBXeOag/ghzZoGHeAe3RbBftpfhpPE+F29kbNcOpf+8x1Ce4eqP4hlkZCGZ7FCJW5FyvPC
 ZhPDf4zeyaPrzAgMipwjPznA1BA5FhR4cn3GOJt1TaaMuYi81oAzVl8Hbm7aiRuVjUk6kF
 rQJKUnvz1k7rdTn9UFZc9jZYSeCPvIc6gqEnNg9++as2dYfzsttDl6PaDReaygfZaW751S
 MTnRFwHNuRtNXeEWUf1o4sL2k2m2l3gvjEK/kXp06wflzEra856EJb+GXBtUTX0ckfYuCv
 rZgzu3cv99X9PuauSz39dL8qWKwoJDmpjkcOPfDPKvNMc9DR+E2fGbQ8B9R93Q==
Message-ID: <58b680faeeeea1c317b43a34c71d978efe72009d.camel@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1743595247; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nl4l8of68HS2zq9TP8rEIRyIj3+DQpTOv77MizaWLHc=;
 b=yMlCQGvAJ2wZrrgWX/5TlbJhLsEV6fvuTB/oK/FVF7nBEmYhCoTwvsW0SOh1RsZyOA0ciC
 VeC5y1lgWokpbqkac1eyh5oWfr0UPOLGpTgzATkDk6gC8dW5KzJ3E2nLrQh78QqsXQ9274
 JB6jHSO4pqT+xEUQgbOczg82twAyUcRliD4ocqgoePbAY9nvjpgKv5TgirYVseLwDdpgx2
 YPZp9ievUegcYBcQ8uxhiRib6coTxXZ5prZXnvKAcFxC3dyr655WDTqEZ/lKAmYeL6jzDB
 n1KtdTfnnVI+s8MMhtoVFiyeK2U4DAwOmZNlUntUMKiZE7sEnh/yWnOtOeJPYA==
Subject: Re: [RFC v3 06/14] drm/sched: Implement RR via FIFO
From: Philipp Stanner <phasta@mailbox.org>
To: Michel =?ISO-8859-1?Q?D=E4nzer?= <michel.daenzer@mailbox.org>, 
 phasta@kernel.org, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>, Matthew
 Brost <matthew.brost@intel.com>
Date: Wed, 02 Apr 2025 14:00:43 +0200
In-Reply-To: <264be6a0-b9be-4430-9de4-276456e34214@mailbox.org>
References: <20250331201705.60663-1-tvrtko.ursulin@igalia.com>
 <20250331201705.60663-7-tvrtko.ursulin@igalia.com>
 <e4594adff1606e6a92714bbcad5838c3f100acdf.camel@mailbox.org>
 <264be6a0-b9be-4430-9de4-276456e34214@mailbox.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: 3er5ar3tgnfg8hfj9ga9j7z7yk49mgnj
X-MBO-RS-ID: 0a9728b9762fa2d0e38
X-Rspamd-Queue-Id: 4ZSNjs4ZQ6z9tJM
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

On Wed, 2025-04-02 at 12:58 +0200, Michel D=C3=A4nzer wrote:
> On 2025-04-02 12:46, Philipp Stanner wrote:
> > On Mon, 2025-03-31 at 21:16 +0100, Tvrtko Ursulin wrote:
> > > Round-robin being the non-default policy and unclear how much it
> > > is
> > > used,
> > > we can notice that it can be implemented using the FIFO data
> > > structures if
> > > we only invent a fake submit timestamp which is monotonically
> > > increasing
> > > inside drm_sched_rq instances.
> > >=20
> > > So instead of remembering which was the last entity the scheduler
> > > worker
> > > picked, we can bump the picked one to the bottom of the tree,
> > > achieving
> > > the same round-robin behaviour.
> > >=20
> > > Advantage is that we can consolidate to a single code path and
> > > remove
> > > a
> > > bunch of code. Downside is round-robin mode now needs to lock on
> > > the
> > > job
> > > pop path but that should not be visible.
> >=20
> > Why did you decide to do it that way and then later remove RR &
> > FIFO
> > alltogether in patch 10, basically?
> >=20
> > I think the far cleaner way for our development-process would be a
> > separate patch(-series) that *removes* RR completely. Advantages
> > are:
> >=20
> > =C2=A0=C2=A0 1. It should be relatively easy to do
> > =C2=A0=C2=A0 2. It would simplify the existing code base independently =
of
> > what
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 happens with your RFC series here
> > =C2=A0=C2=A0 3. Before changing everyone's scheduling policy to a compl=
etely
> > new,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 deadline-based one, we could first be su=
re for a few release
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cycles that everyone is now on FIFO, est=
ablishing common
> > ground.
> > =C2=A0=C2=A0 4. We could CC every- and anyone who might use RR or might=
 know
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 someone who does
> > =C2=A0=C2=A0 5. If it turns out we screwed up and someone really relies=
 on
> > RR, it
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 would be easy to revert.
> >=20
> > I am not aware of any RR users and have, in past discussions, never
> > heard of any. So removing it is more tempting for the above
> > reasons.
>=20
> https://gitlab.freedesktop.org/drm/amd/-/issues/2516=C2=A0has a bunch of
> RR users...

Right, there's a number of people complaining about the regression. But
what I'm interested in is: how did it evolve since then. Are there
distributions who set the module parameter? Does Steam do it? Or is it
individual users who work around the problem that way?

https://gitlab.freedesktop.org/drm/amd/-/issues/2516#note_2679509

^ this comment for example seems to indicate that on newer Wayland
versions part of the problem has vanished?
