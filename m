Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPnVKiCkj2nASAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 23:22:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D59D139C5C
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 23:22:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EFE210E308;
	Fri, 13 Feb 2026 22:22:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JWFVI9Ff";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F8DC10E308;
 Fri, 13 Feb 2026 22:22:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5060042AF9;
 Fri, 13 Feb 2026 22:22:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B957C116C6;
 Fri, 13 Feb 2026 22:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771021339;
 bh=JZG9zpO3v26S4FfIoUMCHmNqp0Ksq9OU7wxZoT298/g=;
 h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
 b=JWFVI9FfTpCRFluJKQFdWPC0eQ8LKFMbZkCTuWMLXd8u8taybBVw59hcDTR/NKju8
 d2iCaDIrlDcc5iN8tNy8KRlXUkArJpVfICH8XY9ENMkLNTniEHVjP8vYZ333vGD4Xk
 FaUBJgnq/iGGYAclZspPyB70Smyh8A3uEPnwkG9C+KV5QxDzIQal5/zxRR8yg9rwqB
 Ew9AYbLgpD6doQp8Hx4lVBl4drJrHNaAUetdPJ5iyjhsQXaOORdJ9DpM6+H5DTnQu+
 OBEmddjmnjhSc+U+Mb4c1B0nJsGJfuthVTJ+QfdXu2FhEqC/m1CFZ7/nQuVrg42idq
 fy1ivTUTXAMgw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Feb 2026 23:22:15 +0100
Message-Id: <DGE6O1OYR4F3.2PSFQLJ8XXJ78@kernel.org>
Cc: "Lyude Paul" <lyude@redhat.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Mary Guillemard"
 <mary@mary.zone>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
To: "M Henning" <mhenning@darkrefraction.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2 1/2] drm/nouveau: Fetch zcull info from device
References: <20260205-zcull3-v2-0-ac572f38cc7b@darkrefraction.com>
 <20260205-zcull3-v2-1-ac572f38cc7b@darkrefraction.com>
 <DGE036OEW8ZK.1PX0DRV8R9EVB@kernel.org>
 <CAAgWFh0zX=u7OZYq3QBrs0ySve897LXb1PN9QFzhYg0gtHy5wQ@mail.gmail.com>
In-Reply-To: <CAAgWFh0zX=u7OZYq3QBrs0ySve897LXb1PN9QFzhYg0gtHy5wQ@mail.gmail.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[redhat.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,mary.zone,lists.freedesktop.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,darkrefraction.com:email]
X-Rspamd-Queue-Id: 0D59D139C5C
X-Rspamd-Action: no action

On Fri Feb 13, 2026 at 10:48 PM CET, M Henning wrote:
> On Fri, Feb 13, 2026 at 12:12=E2=80=AFPM Danilo Krummrich <dakr@kernel.or=
g> wrote:
>>
>> On Thu Feb 5, 2026 at 7:56 PM CET, Mel Henning wrote:
>> > This information will be exposed to userspace in the following commit.
>> >
>> > Signed-off-by: Mel Henning <mhenning@darkrefraction.com>
>>
>> For someone looking at this commit, this commit message is not very usef=
ul.
>>
>> Please add at least a brief explanation of what the patch does and - eve=
n more
>> important - why it does it. See also [1].
>>
>> [1] https://docs.kernel.org/process/submitting-patches.html#describe-you=
r-changes
>
> What I'm struggling with is that I don't know how to do this without
> repeating myself. If you want, I can copy-paste my explanation of
> zcull here too and then it will appear three times, once in each
> commit and once in the cover letter. But that kind of repetition
> doesn't seem very helpful to me.

Again, the commit message should explain what the commit does and why. For
instance, I asked you why you did combine those two callbacks below.

The commit message could mention this, e.g. it could be something along the=
 lines
of:

"Add struct nvkm_gr_zcull_info, which serves as abstraction layer between t=
he
corresponding uAPI (added in a subsequent patch) and the firmware (version
specific) structure.

This is needed in order to not leak the uAPI layer into nvkm. Also note tha=
t we
are bypassing the nvif layer, since ...

Also note that we reuse the get_ctxbufs_info() callback, since ..."

I.e. make it obvious to maintainers what's going on and what's the motivati=
on
for the patch and it's implementation details.

> Because of this, I decided that it was simplest to combine them in a
> single call, which avoids repeated rpc calls to the gpu without the
> complexity of handling partially complete states.

Ok, that seems reasonable.

>> > +     if (WARN_ON(IS_ERR(zcull_info)))
>>
>> What justifies this WARN_ON()? To me this seems like normal error handli=
ng, i.e.
>> it is not a violation of some API invariant, etc. Also, this is in the d=
river's
>> probe() path.
>
> I was just copying the error handling that already exists in this functio=
n.
>
> I do think these are weird error cases though - they mean that the gpu
> was partially but not fully initialized which shouldn't happen during
> normal usage. The only cases I can think of that would trigger this
> warning are a kernel bug or an intermittent PCI link, which I think
> are both reasonable to warn on.

It could also be that the firmware is buggy, etc. In any case, I don't see =
that
a WARN_ON() is justified. Please use dev_err() instead.
