Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yO5uIBGXjWkt5AAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 10:02:09 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88BCB12BA65
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 10:02:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 476A010E705;
	Thu, 12 Feb 2026 09:02:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="JzRp29Dd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37FBD88C11
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 09:02:05 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4fBTnc2QSqz9v8y;
 Thu, 12 Feb 2026 10:01:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1770886916; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f1sITTc6VLMvly5lD7CERtLHOgz554xhk5CK5UpomXM=;
 b=JzRp29DdhTb7eA6fUaPJzqSCCduyYqka2lYrv/nTRbCxlAu/P19v/AahS8YSnoTT+YtosA
 4hBWf+gOP/oquCCv0PObtC4N5lRKIDWQF4yn7quGmDpsHyjTi0cHHjrPEQ1fmOPlfisSvQ
 Xjnn6sKv/yxCB72A1unK7JjvlADPTL1X4hfdEHect3TQ/+p84SuY60KQG6QYYSuuC2I8/R
 gqz52Nq6gCp/ZGfY81KyEW8dVSzpF0JltKnCltrTT7Xhx+cvnzSz+EvFA0CfxMIaY/bO74
 nWTFpogEBHygl1zieUoCFdu2SiSGOB49Uj5mSQeJYB8wVSXsr+2Kg5lHopvQ7w==
Authentication-Results: outgoing_mbo_mout; dkim=none;
 spf=pass (outgoing_mbo_mout: domain of phasta@mailbox.org designates
 2001:67c:2050:b231:465::202 as permitted sender)
 smtp.mailfrom=phasta@mailbox.org
Message-ID: <69ff58e846ea7bf60e6f5dc58cf224f7c461d0d6.camel@mailbox.org>
Subject: Re: [PATCH 4/8] dma-buf: inline spinlock for fence protection v4
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 phasta@kernel.org, matthew.brost@intel.com, sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Date: Thu, 12 Feb 2026 10:01:49 +0100
In-Reply-To: <96407179-3ab9-4ba8-9b1c-171187683b41@gmail.com>
References: <20260210102232.1642-1-christian.koenig@amd.com>
 <20260210102232.1642-5-christian.koenig@amd.com>
 <ebfe7aa7f409513d5e04ac407700a8bbac76e948.camel@mailbox.org>
 <96407179-3ab9-4ba8-9b1c-171187683b41@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: xfxr9prmzmg4icwgwdp3x863j7o6jbck
X-MBO-RS-ID: ddf017a0c489f767024
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:ckoenig.leichtzumerken@gmail.com,m:phasta@kernel.org,m:matthew.brost@intel.com,m:sumit.semwal@linaro.org,m:linaro-mm-sig@lists.linaro.org,m:ckoenigleichtzumerken@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[phasta@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,intel.com,linaro.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mailbox.org:mid,mailbox.org:dkim];
	DKIM_TRACE(0.00)[mailbox.org:+];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phasta@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[phasta@kernel.org]
X-Rspamd-Queue-Id: 88BCB12BA65
X-Rspamd-Action: no action

On Wed, 2026-02-11 at 15:59 +0100, Christian K=C3=B6nig wrote:
> On 2/11/26 10:50, Philipp Stanner wrote:
> > On Tue, 2026-02-10 at 11:01 +0100, Christian K=C3=B6nig wrote:
> ...
> > > Using a per-fence spinlock allows completely decoupling spinlock prod=
ucer
> > > and consumer life times, simplifying the handling in most use cases.
> >=20
> > That's a good commit message btw, detailing what the motivation is.
> > Would be great to see messages like that more frequently :]
>=20
> Yeah, but they are not so easy to write.

Valuable things are rarely easy :}

>=20
> > > =C2=A0	trace_dma_fence_init(fence);
> > > @@ -1091,7 +1094,7 @@ __dma_fence_init(struct dma_fence *fence, const=
 struct dma_fence_ops *ops,
> > > =C2=A0 * dma_fence_init - Initialize a custom fence.
> > > =C2=A0 * @fence: the fence to initialize
> > > =C2=A0 * @ops: the dma_fence_ops for operations on this fence
> > > - * @lock: the irqsafe spinlock to use for locking this fence
> > > + * @lock: optional irqsafe spinlock to use for locking this fence
> > > =C2=A0 * @context: the execution context this fence is run on
> > > =C2=A0 * @seqno: a linear increasing sequence number for this context
> > > =C2=A0 *
> > > @@ -1101,6 +1104,10 @@ __dma_fence_init(struct dma_fence *fence, cons=
t struct dma_fence_ops *ops,
> > > =C2=A0 *
> > > =C2=A0 * context and seqno are used for easy comparison between fence=
s, allowing
> > > =C2=A0 * to check which fence is later by simply using dma_fence_late=
r().
> > > + *
> > > + * It is strongly discouraged to provide an external lock. This is o=
nly allowed
> >=20
> > "strongly discouraged [=E2=80=A6] because this does not decouple lock a=
nd fence
> > life times." ?
>=20
> Good point, added some more text.
> =C2=A0
> > > + * for legacy use cases when multiple fences need to be prevented fr=
om
> > > + * signaling out of order.
> >=20
> > I think our previous discussions revealed that the external lock does
> > not even help with that, does it?
>=20
> Well only when you provide a ->signaled() callback in the dma_fence_ops.

Mhm, no?

The external lock does not protect against signaling out ouf order,
independently of that callback, because a driver can take and release
that lock in between signaling.

The way how to get this right is to make the fence context and actual
object with actual rules. In Rust, it could also house timeline and
driver name strings, requiring two fewer callbacks.

>=20
> The reason we have so much different approaches in the dma_fence handling=
 is because it is basically the unification multiple different driver imple=
mentations which all targeted more or less different use cases.
>=20

When did dma_fence actually come to be? I suppose at some point we
discovered that all drivers basically have very similar requirements
regarding their job completion signaling.

> > >=20

[=E2=80=A6]

> > > =C2=A0
> > > =C2=A0enum dma_fence_flag_bits {
> > > =C2=A0	DMA_FENCE_FLAG_INITIALIZED_BIT,
> > > +	DMA_FENCE_FLAG_INLINE_LOCK_BIT,
> >=20
> > Just asking about a nit: what's the order here, always alphabetically?
>=20
> In which the flags are used in the code flow.

Not intuitive, but it's OK, no big deal



P.
