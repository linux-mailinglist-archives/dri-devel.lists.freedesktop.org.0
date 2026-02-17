Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEjvJyOalGkoFwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 17:41:07 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D2814E589
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 17:41:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F04D10E515;
	Tue, 17 Feb 2026 16:41:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GLwGwah7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E23410E518
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 16:41:04 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id
 4fb4d7f45d1cf-65a1faf828bso529766a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 08:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771346463; x=1771951263; darn=lists.freedesktop.org;
 h=mime-version:user-agent:content-transfer-encoding
 :disposition-notification-to:references:in-reply-to:date:cc:to:from
 :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=r/mWn0NTZppbdGJFnI/ErDwdANkgeIegPSZLoS1BE5U=;
 b=GLwGwah7+Erw7DnT1m6GR6nWA6GBTdGM9QFQxLSXpZHKqk9JY2tE7+fGjf0b1O0w0Q
 g08V4MkTajgiIE/LfWSnRx2oxbSygplypC5DmAnbQXJRP7+rkCDABbvgzMWZ6bPbbBc/
 FVUYJt/DVisbFlElXtlJA5bHocUZvNEn6wO600Z57se7foFO6OOIIRxCT/L4rEsGbmJe
 tugU0LHMobOL9fEPSRzzCmYe0obrXW7bMoULRwYEt3SbBZNjDudrSWoHJXkvYPGIXGOP
 jnFB5djkzw27u+HkAhfAgWRNyvZuZ4GnFj6H9dI66pfF6VBCc3L+m8vnvzJFzl+vHQWX
 PXLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771346463; x=1771951263;
 h=mime-version:user-agent:content-transfer-encoding
 :disposition-notification-to:references:in-reply-to:date:cc:to:from
 :subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=r/mWn0NTZppbdGJFnI/ErDwdANkgeIegPSZLoS1BE5U=;
 b=n5Iu83vDiaDQL1rw9tqz1Bp7NG4s8wcasX8CAemab9blWA7slSZTefxpNgHRS9ZHj0
 o9stL7JI1kVe/akzvsQkg0scoXKta8tHo4C9i/4WEzrAekUAMpu7vNq8PxnvnnuZCy1O
 HkBKyVx/NL6ttT1hqATAauG/H3qBXM/8zOb7fNlLkm1CSpX2w3GAwrBE8EjFC0EQYhlc
 wyziGVMY3lOpgcquzgyb4ne0ihUPQC2DE37GCYxZkzt3LVKAwZsXCAMpuBq8SwIg1LR6
 ZJPT2qbpOetNpDPYET7LvglO392ImTsrT6nbAcR7uKCQ8och8/mD5MLihY0dJ+/1Zc8W
 MSRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyJG/4C884om9GMGoJ5K+0CwVjAA/FnzHsdbka8Lvt4ZrXjBIMUm6D5qb9ekoT4q2qSRdb8MSl+ic=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy21syokf+cnBTlrO1iUoKXh8YjOOExlKMI0KUYj38MH88NH9ay
 UPRx23WkhbLmTyKgGtrXex+9ALwimGkRsLxq9nv8Nxkw+AJ8xviJeobc
X-Gm-Gg: AZuq6aJulbCX2kswQ8x3uf0cCHYL/w8zTs/59GxEcobxhkacUdfmnShjXsNpFRfXjx5
 9gGB3Js1WXvfxwrz92okh9/JI06gdq1ns5DFmxreswGcauw9UcFvY1WtNn3GyD64dkrBUF/XIrJ
 RSiiO6fxPGaIvnKr6IjaOVIf97jo1gxKJoaGZaS0zzNswGivAHY2PHKbFTfm0p3aZuUYlPehh/X
 2qvwExpprnHnW4tZxaUGRPlfGWO5dI5duKwNjmsCuQ0iXbmaliiiPC1FpThXI5QDRF7gIYlgkEG
 m+/guwPCuseZAh6jzl6XGvrsHBc7DQ8UWJiYmlIiUIJlkP0LN3N3hhv7p/EzS7M3mI9PoGmXpnP
 OOPjsEC1JnGDqH4202g4glslp/hRcn+FfJK3uqgexueS2rmHLquDD300BFE17FB5XDBTSpVY1de
 lTOtpRopqJHX5PBzqtvDfiAovChz78SAKrJI+V9Mgy59WXfDRXVXrbQb3FSvu8dqsRxTXYPOdUj
 G4FOfRgHgc=
X-Received: by 2002:a05:6402:5244:b0:65b:a76d:6ff6 with SMTP id
 4fb4d7f45d1cf-65bad140f57mr4283834a12.3.1771346462611; 
 Tue, 17 Feb 2026 08:41:02 -0800 (PST)
Received: from [192.168.1.239] (87-205-5-123.static.ip.netia.com.pl.
 [87.205.5.123]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-65bad3f1294sm2511183a12.26.2026.02.17.08.41.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Feb 2026 08:41:02 -0800 (PST)
Message-ID: <8006baea7c35850de3a39f155b7aa004c4896495.camel@gmail.com>
Subject: Re: [PATCH v4 23/27] drm: Add passive_vrr_disabled property to crtc
From: Tomasz =?UTF-8?Q?Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: Michel =?ISO-8859-1?Q?D=E4nzer?= <michel.daenzer@mailbox.org>, 
 alexander.deucher@amd.com, harry.wentland@amd.com, sunpeng.li@amd.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, 	airlied@gmail.com, simona@ffwll.ch,
 siqueira@igalia.com, 	dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, 	linux-kernel@vger.kernel.org,
 bernhard.berger@gmail.com, daniel@fooishbar.org
Date: Tue, 17 Feb 2026 17:41:00 +0100
In-Reply-To: <c6a852ae-4edf-4336-9f2a-448c296cc045@mailbox.org>
References: <20260216164516.36803-1-tomasz.pakula.oficjalny@gmail.com>
 <20260216164516.36803-24-tomasz.pakula.oficjalny@gmail.com>
 <c6a852ae-4edf-4336-9f2a-448c296cc045@mailbox.org>
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:michel.daenzer@mailbox.org,m:alexander.deucher@amd.com,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:siqueira@igalia.com,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:bernhard.berger@gmail.com,m:daniel@fooishbar.org,m:bernhardberger@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[tomaszpakulaoficjalny@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,igalia.com,lists.freedesktop.org,vger.kernel.org,fooishbar.org];
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
X-Rspamd-Queue-Id: 06D2814E589
X-Rspamd-Action: no action

On Tue, 2026-02-17 at 09:21 +0100, Michel D=C3=A4nzer wrote:
> On 2/16/26 17:45, Tomasz Paku=C5=82a wrote:
> > Many TVs and other HDMI sinks suffer from blanking and possibly other
> > glitches when VRR is toggled. With VRR present on such sinks and
> > vrr_on_desktop enabled, they behave like the signal is always variable,
> > even in fixed refresh rate situations. DisplayPort and eDP enforce
> > seamless VRR transitions but HDMI unfortunately doesn't.
> >=20
> > Keep VRR toggled if it's supported and not explicitly disabled. It can
> > be used for any VRR sinks, but this is mainly targeted for HDMI.
> >=20
> > Functionally, for an end user, this is the same as normal, fixed refres=
h
> > rate mode. The only difference is that sink is kept in VRR state which
> > enables seamless transitions into/out of variable refresh rate.
> >=20
> > Basically, the driver shouldn't change it's behavior around VRR_ENABLED
> > set to false, jut keep sending info packets/frames with VRR/FreeSync/
> > G-Sync/HDMI VRR active.
> >=20
> > Enabled by default for sinks that claim it's support
>=20
> Having a negation term like "disabled" in the property name can be confus=
ing (as it involves double negation when the property value is 0) and is be=
tter avoided.
>=20

I understand that and felt a little cheaty by doing this but I couldn't
for the life of my figure out how to make it so a driver could override
this by default, before the compositor will set this. Would a "set"
function work, just like for "capable" properties?
=20
I 100% believe this "Passive VRR" for HDMI should be the default and
helps massively but I'm not even that convinced if this must be user
configurable. Alex asked to make it a property, but In the end, it's not
something thsdat can be controlled on other OSes. I still believe that
users should be able to change this somehow, but if amdgpu module
setting wasn't a good fit, I don't know what is.

In the end, I can just yeet all this completely and hardcode
freesync_on_desktop =3D true for HDMI like it's done in the windows
driver.
