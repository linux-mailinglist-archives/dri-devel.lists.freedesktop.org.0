Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eGsFDSKbi2k3XAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 21:54:58 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8618C11F244
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 21:54:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E4C310E030;
	Tue, 10 Feb 2026 20:54:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="getsRlrh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A27710E030
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 20:54:51 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-b8eb39e24ddso85147466b.3
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 12:54:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770756890; x=1771361690; darn=lists.freedesktop.org;
 h=mime-version:user-agent:content-transfer-encoding
 :disposition-notification-to:references:in-reply-to:date:cc:to:from
 :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=kfTsDpxF/1pt/GYWHrHA8HMvDdV44JWrQ/sRs5nS5WI=;
 b=getsRlrhs5aXI8H4t6kLLLmmI5oms0Fe/JO1IGf0xNA70h8ek4iHISNG0w4gX3F2v5
 mO72ZvrqYj3gXu8EN0l8i0ZBk+yodgAUM9kBQ8ZcQ0RtXJMNtd1lYwP+poc3Jk9ZsmXJ
 zx3QJ+nm2ssGzYzElAmUX38+CvODJfbgvrDnoPkr2WH3YCGxHUACpkFIDj5lZZkFVz89
 2HyqlmRURa2ktidFanp5wSUCHSvMbvPK2tJ3w+QF91hzlrzlsYRwMNaWx6yLReLipoWw
 BYWIp16HlWf4+LUgDRz4Zyzcr0+NTKAetZ4aECUxhvKcSr37DR9Fy6pCVpnpH2LqdWnC
 MNyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770756890; x=1771361690;
 h=mime-version:user-agent:content-transfer-encoding
 :disposition-notification-to:references:in-reply-to:date:cc:to:from
 :subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=kfTsDpxF/1pt/GYWHrHA8HMvDdV44JWrQ/sRs5nS5WI=;
 b=mW85uvWJLMdkK/43zG6jTwJlsCvQcFXfVV9BdiB/KcLOP0ruMIio+7Fc2UVIAcF+pH
 CqA04f91ZD12J/Srroa0F1Ean1mTDFXF5utGZzqD98dMQX695Uu8HHNc9u0WVgkwf720
 Pq4WAfZw1pYP1mZ70QMQQ23AE0Zx6hxuk0M0rkJ8nQhfS2zoPKIcs9NR13U/DgL49zV1
 5XhegNqiM0SBRjuRZ4oXtWgZauNzsrii5S/7HgkNIMG0UaHjJ1hO/DKaUVlWmq3lfQT8
 ZvcutC0YWA4G/qVpm9U9ZdtmYxKUembN1acN1BNFPe4IHpSjhjz7PetXe8FmySG04g7K
 Jx4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdSaMCGDeQYqEjARwRsKsVWJekE74PFIcT5h0uR5sQfYImRT/ClARTS9C3n4qN/pCwnWEuI2i88ds=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyTSiB0DmUXAyhbhlV9XMlTV5PJ33Iuo4VMfKKrb7iRRBSyXCy0
 KK/1/zpHhbOq7UBEDnvo7likF2hcOeZ2EpibLjLU/a6u6K8gMBzYQh1s
X-Gm-Gg: AZuq6aKkpaGvA9VOyZD760lY9WbOZ9BRkvBkHAD4xo+4hJ7zqpGno5r3+rIpCNkEmZF
 DkQERDI8h2QGhHMy+JZXb8OJbZ9WNLdWKk9BE1RSHZ5AR3WDol+rTvK0ay+5iJ/3SdXUpfyMwiO
 mS6f8YDiYqd1xDnyZbW/mhpGftKPpq6gyL6FBAVIQiRhOVUCBpOcTgFI7Gne2PmIOTgRmB2mHFr
 QLdoE6xwIKDPoJpgGvjDz2Y0tStO2kDHT9v5Sys2QGxz7EqhqlimGUEsX/GMFlpQqz0WYP0eho+
 3wEiViTLiEhCga42ywU8EL+J7WD3lC40EbxxKtYvRbdoaUlEFlDJr9Qmrt1bIsfchemxcka0tgO
 1+ZXHSqr7mo0Ko/rvBa9CHzPnPl1kWdjp7td3UXh5kga5SqfZI8/O63xEdxfvSmClDSTuUH5auu
 kplTDyKNluHFkMgoqmBayc+TwQauESuJ3m0CfmMsBxdSHPCvQjngtOo8vGdMMVbB8tW6o7jWnuU
 vfMLn36pNfmCsjjMKwVIw==
X-Received: by 2002:a17:907:1c03:b0:b87:6c5c:d3d4 with SMTP id
 a640c23a62f3a-b8f549a17cbmr130270466b.2.1770756889693; 
 Tue, 10 Feb 2026 12:54:49 -0800 (PST)
Received: from [192.168.1.239] (87-205-5-123.static.ip.netia.com.pl.
 [87.205.5.123]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8f6e71dce1sm93866b.0.2026.02.10.12.54.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Feb 2026 12:54:49 -0800 (PST)
Message-ID: <0627d5bfb4b58e7c767097fd8bf58345eb7196bd.camel@gmail.com>
Subject: Re: [PATCH v3 16/19] drm/amd/display: Add parameter to control ALLM
 behavior
From: Tomasz =?UTF-8?Q?Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Harry Wentland <harry.wentland@amd.com>, alexander.deucher@amd.com, 
 sunpeng.li@amd.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 siqueira@igalia.com, 	dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, 	linux-kernel@vger.kernel.org,
 bernhard.berger@gmail.com, 	michel.daenzer@mailbox.org,
 daniel@fooishbar.org, admin@ptr1337.dev
Date: Tue, 10 Feb 2026 21:54:46 +0100
In-Reply-To: <CADnq5_Nrni6_Y7BCn9GH-aF2A1iOjgbr4Ebouf76Qogtb_v3zQ@mail.gmail.com>
References: <20260203185626.55428-1-tomasz.pakula.oficjalny@gmail.com>
 <20260203185626.55428-17-tomasz.pakula.oficjalny@gmail.com>
 <f19af3c6-f865-4758-8c50-aba40ec1cf68@amd.com>
 <79264ab170e48e1372b3b847d75f4635dcc57aa6.camel@gmail.com>
 <CADnq5_PhcNPU=4s1P30OqbWY7qPD3dHmjEtoz4_Md41u=xaxFw@mail.gmail.com>
 <1002281ca27d58a47a47fb655a88637e49776706.camel@gmail.com>
 <CADnq5_Nrni6_Y7BCn9GH-aF2A1iOjgbr4Ebouf76Qogtb_v3zQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
MIME-Version: 1.0
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
X-Spamd-Result: default: False [1.99 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:alexdeucher@gmail.com,m:harry.wentland@amd.com,m:alexander.deucher@amd.com,m:sunpeng.li@amd.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:siqueira@igalia.com,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:bernhard.berger@gmail.com,m:michel.daenzer@mailbox.org,m:daniel@fooishbar.org,m:admin@ptr1337.dev,m:bernhardberger@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[tomaszpakulaoficjalny@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,igalia.com,lists.freedesktop.org,vger.kernel.org,mailbox.org,fooishbar.org,ptr1337.dev];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[tomaszpakulaoficjalny@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 8618C11F244
X-Rspamd-Action: no action

On Tue, 2026-02-10 at 14:17 -0500, Alex Deucher wrote:
> On Tue, Feb 10, 2026 at 1:44=E2=80=AFPM Tomasz Paku=C5=82a
> <tomasz.pakula.oficjalny@gmail.com> wrote:
> >=20
> > On Fri, 2026-02-06 at 17:04 -0500, Alex Deucher wrote:
> > >=20
> > > Also, maybe a per connector kms property would be preferable.  Then
> > > you could change it per display.
> > >=20
> > > Alex
> >=20
> > I've dealt with all Harry's comments but wanted to make sure I
> > understand properly. Do you mean, that the two settings should be a
> > connector property like VRR_ENABLED? I understand the intent and I thin=
k
> > in some time, it would be best to have these exposed in compositor
> > settings but how would a user control this until then?
> >=20
> > Would it suffice to fire IOCTLs from a third-party tool like LACT where
> > support for this could be added in a short time?
> >=20
> > I made it a module property in the first place, because I thought such
> > settings are pretty set-and-forget and module properties are just easy
> > to set :)
> >=20
> > Still, I think the defaults are sane. If I have to spend some more time
> > to get the connector properties working, I could send the patches with
> > the module properties ripped out for now.
>=20
> My understanding is that these are something the compositor would like
> to manage.  I'd like to avoid adding module parameters if we can help
> it because they usually cause more trouble than they help due to
> unforeseen interactions with other features or "conventional wisdom"
> blindly followed which leads to a bad user experience.
>=20
> Alex

Sure!

I'll remove the parameters for now and send v4 to get some feedback on
the cleanups and then I'll figure out the KMS properties. You're right,
leaving that in would surely lead to issues and then people lamenting
their removals..

Thanks for all the comments and all your work!

Tomasz
