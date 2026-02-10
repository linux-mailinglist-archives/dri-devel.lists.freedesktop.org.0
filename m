Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qFjwNpJ8i2n6UgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 19:44:34 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E2A11E613
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 19:44:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B88A010E0E5;
	Tue, 10 Feb 2026 18:44:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WW3VRSvu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAB9410E5E6
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 18:44:29 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-b8ea0a386cdso73403566b.2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 10:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770749068; x=1771353868; darn=lists.freedesktop.org;
 h=mime-version:user-agent:content-transfer-encoding
 :disposition-notification-to:references:in-reply-to:date:cc:to:from
 :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=/vjg7jBZyNSnOMcxeJ/7tKwSwZwzjChFHxfqJ1Ig5Ic=;
 b=WW3VRSvuEw8CY1Feip3vVxQOcN/Ccy5cbT3ie++CGnMoQiig4DbD0lkSPbDaR3KY62
 OxkmJKDLJzkS9X1c7ptLgi9t66FnF46GcDC9r/N8xDjUElebEClffaVJ/gDNdQsBJxVe
 69hVvznri4HLXYwMXr+m6L22E9GjJDNAUOEpuoHj4Z4VFI7rjKrEP/Z5y/R5Axe0n44t
 1Wa4ow6svu2wzva9kesy91gOmJr+CPE7pDoqrOJvVREFJF9I4UQl6CbdboXkzLlR/oMI
 ElEy9HzuYX2Gqiauqc5A9RGLg3hKVfk+7tI3hrBXY/3uCevY1vA7K/R2BrJfMVWNwfKl
 niGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770749068; x=1771353868;
 h=mime-version:user-agent:content-transfer-encoding
 :disposition-notification-to:references:in-reply-to:date:cc:to:from
 :subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=/vjg7jBZyNSnOMcxeJ/7tKwSwZwzjChFHxfqJ1Ig5Ic=;
 b=TnPzaBoKyoMnNfU+h0CPJorNOmMLnJyEkeugC/3Sf77emZeUYAmX0QzFUK29T4BzES
 wzzDQ1xXUffWFMxvayVqeSuCfPNENjlsLZLU7AUxotGsZWv00xME6blE2tMbINwPsoI4
 tKvJ9jLxCDNg/uoPuvP/5MFDKYhUbFPeBuSt6QmXwEAAzoTlSpAPNVPEqwwG+jYS+SQF
 1CxsZFX/jRAyJ4Gpa9g2X3WPog+HQXyLmddBaXAmvulxaXUm02x1AQbeHakgtnwHhJEC
 B9ZS+tOzqrJxfVVRhvuDis8WP01wU401GRButpCgdj60RygXRY3PlpOHs3kdvPvNF518
 /SVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCTOngYhzqnW4k8RaJ9H8w2/pJ/H5y+2yTnXexTaZ8xCGzAeT6Ln68fh/jVZRptNz7GLCWgUcCAhw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzssspVF1wYBZtOBPr64hoNQhFV/TmsulaERTp7x7qIhgmLrmkF
 W1lIBOfcAhN+Kaq/ZV2grlcBd3QOep238yg8C1MJsLinAx8vG96ONqcK
X-Gm-Gg: AZuq6aKJs8ZZAg9PUhtT+94w5H1l95stxTCUhVjXuLV1obR0R+Y8gLgiKBcaTaCLEXK
 neWWbY34meiH2awMHeFnOuOM5eWsyZqSaNcE2k+cEPxpEZgwDXoeT498Oecpn1+yvyBaAttAqQN
 XSD0R1erP1IBjfM8OPcz8yWSDg/AJe6VqV3XJEWA6NoodlteyRma96ErzFe+gkKVjYwnLWbPYWN
 FJy6b1450yF6Z4YQB29kqY7v3CVCPOTQPlI4HIoxP3nPdwoxfG13oWUQRBHm8YO9Fw/dqRBc6Y1
 gQHlvNCFO1aaN3irMybgxLuVtWvIcJQGMgfA7IpYk2SgD5XOXuGjL4O7MyEX0S+AHa6fk8iM+EM
 KEn5oZr3Q2+IaofCpZXVyKzqrIbLw4uZ7t4BsUE6Oovm9jBkRCt9RcYNiPJcvmDdCUWN8JJ2n0p
 kFgM2kewYRo/2sGk/jN2xq1boYX35C1+4diuBkXSmBlk30lHdSr8kxGQpdfdCgPGXNZuor728s6
 ZGUX9RZKkE=
X-Received: by 2002:a17:907:9709:b0:b8d:e665:d653 with SMTP id
 a640c23a62f3a-b8f54cd45e4mr106196766b.7.1770749068016; 
 Tue, 10 Feb 2026 10:44:28 -0800 (PST)
Received: from [192.168.1.239] (87-205-5-123.static.ip.netia.com.pl.
 [87.205.5.123]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8edae3bab5sm537503066b.61.2026.02.10.10.44.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Feb 2026 10:44:27 -0800 (PST)
Message-ID: <1002281ca27d58a47a47fb655a88637e49776706.camel@gmail.com>
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
Date: Tue, 10 Feb 2026 19:44:25 +0100
In-Reply-To: <CADnq5_PhcNPU=4s1P30OqbWY7qPD3dHmjEtoz4_Md41u=xaxFw@mail.gmail.com>
References: <20260203185626.55428-1-tomasz.pakula.oficjalny@gmail.com>
 <20260203185626.55428-17-tomasz.pakula.oficjalny@gmail.com>
 <f19af3c6-f865-4758-8c50-aba40ec1cf68@amd.com>
 <79264ab170e48e1372b3b847d75f4635dcc57aa6.camel@gmail.com>
 <CADnq5_PhcNPU=4s1P30OqbWY7qPD3dHmjEtoz4_Md41u=xaxFw@mail.gmail.com>
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
X-Rspamd-Queue-Id: 21E2A11E613
X-Rspamd-Action: no action

On Fri, 2026-02-06 at 17:04 -0500, Alex Deucher wrote:
>=20
> Also, maybe a per connector kms property would be preferable.  Then
> you could change it per display.
>=20
> Alex

I've dealt with all Harry's comments but wanted to make sure I
understand properly. Do you mean, that the two settings should be a
connector property like VRR_ENABLED? I understand the intent and I think
in some time, it would be best to have these exposed in compositor
settings but how would a user control this until then?

Would it suffice to fire IOCTLs from a third-party tool like LACT where
support for this could be added in a short time?

I made it a module property in the first place, because I thought such
settings are pretty set-and-forget and module properties are just easy
to set :)

Still, I think the defaults are sane. If I have to spend some more time
to get the connector properties working, I could send the patches with
the module properties ripped out for now.

Tomasz
> > >=20
