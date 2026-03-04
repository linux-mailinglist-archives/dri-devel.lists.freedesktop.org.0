Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wEBNL82gqGmZwAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 22:14:53 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA75207D95
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 22:14:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A884C10EAB7;
	Wed,  4 Mar 2026 21:14:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="RWFLOlQD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EC7A10EAB7
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 21:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772658888;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VwXpGODzBh1nxOLdbhOMytxnKCztTe6yaO6nIvkid9U=;
 b=RWFLOlQDcKHfaFnkEiYfrNECPuNoiVY0Z9IMMOrPGyNdFpAvFEszob8nJyJMtov5ceUwr9
 ITT4EKcjp5KkpTTkCnpi7/FoqqlsZcWW1DMHnjWg+A2C50PbUJhK+/QVONbD4B5T+mv7wN
 CfPVFmCzVOzajmdX50aZSDNtwLTDlvw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-264-V7CcPvJeMm-vkc4DbUZOCA-1; Wed, 04 Mar 2026 16:14:47 -0500
X-MC-Unique: V7CcPvJeMm-vkc4DbUZOCA-1
X-Mimecast-MFC-AGG-ID: V7CcPvJeMm-vkc4DbUZOCA_1772658886
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-660fa747a8aso781812a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 13:14:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772658886; x=1773263686;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=VwXpGODzBh1nxOLdbhOMytxnKCztTe6yaO6nIvkid9U=;
 b=jqC8Z8wsfDpYX8OWl0QQFtbJnViJZrMipNZ97RPokQK2QxtkSz3jp8cyqPqrFQcNaY
 XNj0Y4f4G58cOwR853AvGX1nZ5j9d8m5KOeHQywL2aVXdaNlcIJ2f0IUw1O3XGWIOA35
 hnFea6tBakrcvDpKvctLyzCyCNG9cnz+T33K6fCGWg7UMFEndchsT8nXbSWswzpYe6t/
 l5jvLCgwawBcOSH8FFf9bRQG4NTYdNOk6hGWICcBPWj5jSoDm3cQYfDlOWpW8q+uWeaj
 6kGQxCPACbbWzOJ3z3ud+hNY2ib0rQ9ImGECS65MvzXIHirFplTMoXsJB8oTPT5L0jwj
 Py1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKTNz5NRKJq28H7Yw1V9kOqCBt0q3Lkv+Y6qwCP7IRjORsDJzd38S9nBypcdGXOj46GLJNfqVACqM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyumQW+ujpXnY3sSO5rHOrxnHd1hzt43UnfDiI86IDdWeA7WkZZ
 xzGLE+RruTWVwFGK/lN9TaDBCVJBL079mveqDQmQ18fKvy4VOz0IIw1edUC2HX2STZjgGSh8LK5
 OxoqA9zlO9ZkQv0tRJRH+uUPq4Ow8XGT5VPn1i1+/PaWb3uSvRGy+tcw6hBOI3FhOW8X2Zmkxcs
 tRnc32OLrur/bDJKUjBCfbwWSkfjzJgm+S8dPioiHZixV2
X-Gm-Gg: ATEYQzyhMAGUy8wXeg0UMN76PLoh96gsVWi63bnwl6FYWdObL0KtSe8lOkmzi6kNHWW
 a8Pdp1DkO5gLkC6XfryruCqdQrm6GWUaenjE+zUw1ok19HYCRPVLkEfvT+Y9VgoxR+ll8iw9INw
 fymMJOfivO41CJWRWhq48bQ4VY8oQZyIfpGIYtFl3aZZCR697leEJq+rfEdS6SFN6jKsX4xPOH2
 KhEJ2I=
X-Received: by 2002:a05:6402:26c9:b0:65c:420:d28 with SMTP id
 4fb4d7f45d1cf-660efcc220amr1819981a12.9.1772658886285; 
 Wed, 04 Mar 2026 13:14:46 -0800 (PST)
X-Received: by 2002:a05:6402:26c9:b0:65c:420:d28 with SMTP id
 4fb4d7f45d1cf-660efcc220amr1819970a12.9.1772658885816; Wed, 04 Mar 2026
 13:14:45 -0800 (PST)
MIME-Version: 1.0
References: <25ca7b31-7fde-4259-8370-a28b4e459bad@nvidia.com>
 <CACO55tvtLOkvSx9_4NzWHs=zC2AwwVo9=fLd51TBKFDTyLExpw@mail.gmail.com>
In-Reply-To: <CACO55tvtLOkvSx9_4NzWHs=zC2AwwVo9=fLd51TBKFDTyLExpw@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Wed, 4 Mar 2026 22:14:09 +0100
X-Gm-Features: AaiRm52dsGrYh1lj0IYZXxqevXJRjBl3hwPSb3itkdUdDoPew_8EdXf2_4MQ9sc
Message-ID: <CACO55tvrWLbOf+X7Ru3C54pzEiYG2Z2KTpPqY5RUgQNcSk1owg@mail.gmail.com>
Subject: Re: nouveau mailing list is stripping Cc headers from relayed messages
To: John Hubbard <jhubbard@nvidia.com>
Cc: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Dave Airlie <airlied@gmail.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Alexandre Courbot <acourbot@nvidia.com>, 
 Eliot Courtney <ecourtney@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: e5IJnGNO7lbGi24gyYdXPd2SBP6fXlyYealVlvO84CA_1772658886
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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
X-Rspamd-Queue-Id: 2BA75207D95
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jhubbard@nvidia.com,m:lyude@redhat.com,m:dakr@kernel.org,m:airlied@gmail.com,m:acourbot@nvidia.com,m:ecourtney@nvidia.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[kherbst@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[redhat.com,kernel.org,gmail.com,lists.freedesktop.org,nvidia.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[kherbst@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,lists.freedesktop.org:email,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Wed, Mar 4, 2026 at 10:10=E2=80=AFPM Karol Herbst <kherbst@redhat.com> w=
rote:
>
> On Wed, Mar 4, 2026 at 7:18=E2=80=AFPM John Hubbard <jhubbard@nvidia.com>=
 wrote:
> >
> > Hi,
> >
> > I'm worried about this because eventually Nova will have to use this
> > mailing list, at least according to the current plan.
> >
> > The nouveau@lists.freedesktop.org mailing list is stripping Cc recipien=
ts
> > from message headers when relaying posts. Recipients who are Cc'd on th=
e
> > original message but are not subscribed to the list get silently remove=
d
> > from the Cc header in the copy the list delivers.
> >
> > This breaks "reply all" workflows: anyone whose mail client picks up th=
e
> > Nouveau-delivered copy ends up replying without the original Cc recipie=
nts,
> > dropping them from the thread.
> >
> > Here is a concrete example. This message on lore shows me (jhubbard@nvi=
dia.com)
> > in Cc:
> >
> >     https://lore.kernel.org/DGTNPPB7GUP0.KDZGQ9AHPOG2@nvidia.com
> >
>
> uhm.. I took a second look and your email address
> "jhubbard@nvidia.com" doesn't seem to appear there either? Do you have
> a link where it does?
>

you are also not on the rust-for-linux reply here:
https://lore.kernel.org/rust-for-linux/DGTNPPB7GUP0.KDZGQ9AHPOG2@nvidia.com=
/

> > But the copy delivered through the Nouveau list has my address stripped=
 from
> > Cc. The rust-for-linux copy of the same message (same Message-Id) prese=
rves
> > the full Cc list correctly.
> >
> > Could the Mailman settings for the nouveau list be checked? The list ap=
pears
> > to be munging or filtering Cc headers on outgoing posts. Vger-hosted li=
sts
> > (like rust-for-linux and linux-kernel) do not do this.
> >
> > thanks,
> > --
> > John Hubbard
> >

