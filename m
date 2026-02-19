Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wHqBAovnlmmNqwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 11:35:55 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 261E115DD78
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 11:35:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DEE610E17E;
	Thu, 19 Feb 2026 10:35:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="vvjcUYQf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B1FA10E17E
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 10:35:50 +0000 (UTC)
Received: from smtp102.mailbox.org (unknown [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4fGqXd5r98z9tVr;
 Thu, 19 Feb 2026 11:35:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1771497345; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EaLfa733yi/pMvpBxK8JoX/oM2Ynzp2v7F1bUzt3jtM=;
 b=vvjcUYQfASyrZHozaaftd8GAqyWhg5pul2m6bdegcifccX9MAt9KWJyZvsXpV9o4wKk+jP
 5qEeTn9MW0MoH4jXhIVYBCpGShHrZbLDMJYFcB14I8iFgvessCGhETUWmzGhOkO1U3hCdG
 YSyMFAFPFBrOucOOwoMPBsHsmFWjpsN/nH5aF4dtH2MBGTw7mP+rrkJhZftiPJuaT9Gbp5
 bd6ETMTnDxca/9k/pwv+TAvnGtHItWsFVTKc4EhpDpiimiMi7/pxUfSVmJBzqMeoKZ2Nqj
 YV98RHcvi3SdcCuQpVuhttLxFYIcOhJvdSuD49uART1EPUm9jNuqknA8n3/moQ==
Message-ID: <4d5d718fb646f8723ab31452b906f9bfee029e9f.camel@mailbox.org>
Subject: Re: [PATCH 1/8] dma-buf: protected fence ops by RCU v5
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 phasta@kernel.org, matthew.brost@intel.com, sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Date: Thu, 19 Feb 2026 11:35:42 +0100
In-Reply-To: <53a84ddb-9202-48bb-bcb1-e76ee3097eb7@amd.com>
References: <20260210102232.1642-1-christian.koenig@amd.com>
 <20260210102232.1642-2-christian.koenig@amd.com>
 <f1345723cc5a61cdec5a6f168f71a323b822b7e2.camel@mailbox.org>
 <f357c2fc-3c72-42ac-b079-849222de4c6e@gmail.com>
 <9f929535744546bcb4eed26f6c27b4497ebc37bb.camel@mailbox.org>
 <53a84ddb-9202-48bb-bcb1-e76ee3097eb7@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: o1oxcprnizd7nyq39sicoqjc9cs1k6yk
X-MBO-RS-ID: 113cdcd0500d276bceb
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:phasta@kernel.org,m:matthew.brost@intel.com,m:sumit.semwal@linaro.org,m:linaro-mm-sig@lists.linaro.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[phasta@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phasta@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	HAS_REPLYTO(0.00)[phasta@kernel.org]
X-Rspamd-Queue-Id: 261E115DD78
X-Rspamd-Action: no action

On Thu, 2026-02-19 at 11:23 +0100, Christian K=C3=B6nig wrote:
> On 2/12/26 09:56, Philipp Stanner wrote:
> > > > > @@ -454,13 +465,19 @@ dma_fence_test_signaled_flag(struct dma_fen=
ce *fence)
> > > > > =C2=A0static inline bool
> > > > > =C2=A0dma_fence_is_signaled_locked(struct dma_fence *fence)
> > > > > =C2=A0{
> > > > > +	const struct dma_fence_ops *ops;
> > > > > +
> > > > > =C2=A0	if (dma_fence_test_signaled_flag(fence))
> > > > > =C2=A0		return true;
> > > > > =C2=A0
> > > > > -	if (fence->ops->signaled && fence->ops->signaled(fence)) {
> > > > > +	rcu_read_lock();
> > > > > +	ops =3D rcu_dereference(fence->ops);
> > > > > +	if (ops->signaled && ops->signaled(fence)) {
> > > >=20
> > > > Maybe you can educate me a bit about RCU here =E2=80=93 couldn't th=
is still
> > > > race? If the ops were unloaded before you take rcu_read_lock(),
> > > > rcu_dereference() would give you an invalid pointer here since you
> > > > don't check for !ops, no?
> > >=20
> > > Perfectly correct thinking, yes.
> > >=20
> > > But the check for !ops is added in patch #2 when we actually start to=
 set ops =3D NULL when the fence signals.
> > >=20
> > > I intentionally separated that because it is basically the second ste=
p in making the solution to detach the fence ops from the module by RCU wor=
k.
> > >=20
> > > We could merge the two patches together, but I think the separation a=
ctually makes sense should anybody start to complain about the additional R=
CU overhead.
> > >=20
> >=20
> > Alright, makes sense. However the above does not read correct..
> >=20
> > But then my question would be: What's the purpose of this patch, what
> > does it solve or address atomically?
>=20
> Adding the RCU annotation and related logic, e.g. rcu_read_lock()/rcu_rea=
d_unlock()/rcu_dereference() etc...
>=20
> This allows the automated statically RCU checker to validate what we do h=
ere and point out potential mistakes.
>=20
> Additional to that should adding the rcu_read_lock() protection cause per=
formance problems it will bisect to this patch here alone.

Alright, thx for the info. Very useful

>=20
> > Adding RCU here does not yet change behavior and it does not solve the
> > unloading problem, does it?
>=20
> Nope, no functional behavior change. It's purely to get the automated che=
ckers going.
>=20
> > If it's a mere preperational step and the patches should not be merged,
> > I'd guard the above with a simple comment like "Cleanup preparation.
> > 'ops' can yet not be NULL, but this will be the case subsequently."
>=20
> A comment added in this patch and removed in the next one? Na, that sound=
s like overkill to me.

ACK.
But then lets do a normalkill by adding the info you provided above
into the commit message, shall we? ^_^

"At first glance it is counter intuitive to protect a constant function
pointer table by RCU, but this allows modules providing the function
table to unload by waiting for an RCU grace period."

This doesn't reveal what the patch is actually about, just that
something is counter-intuitive to someone already very familiar with
the series' intent and the code's deeper background :)

"This or that about dma_fence shall be cleaned up in subsequent
patches. To prepare for that, add =E2=80=A6 which allows the RCU checker to
validate =E2=80=A6"

*Philipp reads that*: ["Ah, this patch is in preparation and allows the
RCU checker to validate everything!"]

;p

P.
