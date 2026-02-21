Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id jzQiEty3mWl7WQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 21 Feb 2026 14:49:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 844F316CF3B
	for <lists+dri-devel@lfdr.de>; Sat, 21 Feb 2026 14:49:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 573A610E052;
	Sat, 21 Feb 2026 13:49:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="bUVARW/3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D30DC10E052
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Feb 2026 13:49:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1771681744; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=l/04NL4T5oQvVDYJD6G1KUhkPLfD4kRn07JGUsf/+yLO+aIhuiMFliPaEDx4Eu88brw29oJmJrhVSZszfLhJT64Sjtr/5Thf4dZf0Ii0UIH+T8OPjF3J6yR5JBXV+8WTqK61lSzMpUnAZwyCDtv/xwInhBQvxcUYLufzgb7TJTs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1771681744;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=eAmu3VW6ddEaB/ezAKpj8LOV8eZUAkq0rF53NN8BJFc=; 
 b=joDmVtVjD4tsD9iFjF7BqPfohBelvueLlUb6mWsUEa/LnBT5XMMnt2BQZJbFHHKPuZ0WAI9EIOyU0s/u9Hccm4pSZo3XX5YAkiw3bZlPUjm5l6AeDhve8I8aIGzmHBByTn5YyKhk15dJIX6gSmlKlQIk20v0MMt377cHDithYtY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1771681744; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Content-Transfer-Encoding:From:From:Mime-Version:Subject:Subject:Date:Date:Message-Id:Message-Id:References:Cc:Cc:In-Reply-To:To:To:Reply-To;
 bh=eAmu3VW6ddEaB/ezAKpj8LOV8eZUAkq0rF53NN8BJFc=;
 b=bUVARW/3aJTZkaEWsQhlFT84IrtsFXfTzAufE4fw9zFDEBl3GOqqUF4z/h9Rg6Zk
 og2lJ/wTjOVWCbz3G8txF5iqvTHPYv2D6riHzg3pzzRXNsScFdSfUWT6Nxuh0FHBGI+
 +lskjHC7dGbIm5Em4K/CyjLg1vAB2yTjT1I09qnE=
Received: by mx.zohomail.com with SMTPS id 1771681743288371.94964133806286;
 Sat, 21 Feb 2026 05:49:03 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Daniel Almeida <daniel.almeida@collabora.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH 07/12] drm/tyr: Add generic slot manager
Date: Sat, 21 Feb 2026 10:48:47 -0300
Message-Id: <A6C92AE7-06F1-46AB-A197-7A48C7C6AC23@collabora.com>
References: <aZm1zL1nA97zur0v@google.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Deborah Brouwer <deborah.brouwer@collabora.com>,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 beata.michalska@arm.com, lyude@redhat.com
In-Reply-To: <aZm1zL1nA97zur0v@google.com>
To: Alice Ryhl <aliceryhl@google.com>
X-Mailer: iPhone Mail (23D127)
X-ZohoMailClient: External
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:deborah.brouwer@collabora.com,m:rust-for-linux@vger.kernel.org,m:beata.michalska@arm.com,m:lyude@redhat.com,m:aliceryhl@google.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[daniel.almeida@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	APPLE_IOS_MAILER_COMMON(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.almeida@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:mid,collabora.com:dkim,slot.rs:url]
X-Rspamd-Queue-Id: 844F316CF3B
X-Rspamd-Action: no action


> On 21 Feb 2026, at 10:40, Alice Ryhl <aliceryhl@google.com> wrote:
>=20
> =EF=BB=BFOn Sat, Feb 21, 2026 at 09:44:45AM -0300, Daniel Almeida wrote:
>>=20
>>=20
>>>> On 21 Feb 2026, at 08:17, Alice Ryhl <aliceryhl@google.com> wrote:
>>>=20
>>> On Thu, Feb 12, 2026 at 11:11:13AM +0100, Boris Brezillon wrote:
>>>>> +type LockedSeat<T, const MAX_SLOTS: usize> =3D LockedBy<Seat, SlotMan=
ager<T, MAX_SLOTS>>;
>>>>> +
>>>>> +impl<T: SlotOperations, const MAX_SLOTS: usize> Unpin for SlotManager=
<T, MAX_SLOTS> {}
>>>>=20
>>>> Do we really need to explicitly flag this type Unpin? I thought this
>>>> was the default if the struct is not pinned (and it's not AFAICT).
>>>=20
>>> It may be cleaner to add `#[pin_data]` to the struct and rely on the
>>> Unpin impl it generates.
>>>=20
>>> In general, the default Unpin implementation is to inherit from the
>>> fields. When you add #[pin_data], it's changed to only inherit from
>>> fields marked #[pin]. By adding #[pin_data] but not marking any fields
>>> #[pin], it will be Unpin unless any of the zero fields marked #[pin] are=

>>> Unpin, i.e. it will always be Unpin.
>>=20
>> Why do we need this if all fields are Unpin?
>=20
> Its fields are not necessarily Unpin. 'manager' could be any type,
> including !Unpin types.
>=20
> Adding #[pin_data] without marking any fields #[pin] is equivalent to
> the explicit impl Unpin the patch has now.

If the T or the slot data is !Unpin, then the SlotManager is !Unpin and that=
=E2=80=99s fine. This has been my point from the beginning.

I don=E2=80=99t see why we need to deviate from this default behavior. This i=
s much clearer than deriving pin_data with 0 #[pin] fields.

>=20
>>>>> +        // FIXME: Annoying manual copy. The original idea was to not a=
dd Copy+Clone to SeatInfo,
>>>>> +        // so that only slot.rs can change the seat state, but there m=
ight be better solutions
>>>>> +        // to prevent that.
>>>>=20
>>>> Okay, I guess we want some inputs from Daniel and/or Alice on that one.=

>>>=20
>>> You could consider only implementing Clone. That way, copies do not
>>> happen unless you do so explicitly. Or add a private method on the type
>>> that has the same function as Clone if you do not wish to expose it.
>>=20
>> Please check my solution where clone is not needed.
>=20
> If you do not need to return it from the function, then that's fine too,
> of course.
>=20
> Alice

