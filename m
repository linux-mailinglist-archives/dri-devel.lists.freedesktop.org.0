Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wI9oEDgpqGkdpAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 13:44:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E411FFC5D
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 13:44:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23B4B10E170;
	Wed,  4 Mar 2026 12:44:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jkppyfbP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE49110E0FD
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 12:44:35 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4833115090dso69744925e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 04:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772628274; x=1773233074; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LHByxMKryOjmtkThOv7ygNgBhXzSd+UZ7YG3LhRsijU=;
 b=jkppyfbPOqu25R+wUGTuVOzRHl3jCV1JmqFCOfNn+TZy7oefDK5Ee4lpVEXIBtK7oi
 JQJQNUbiAASnQysGvMn06VirGsTsA+w8ATWz98mm6VVzUaViVs3K2xyoSslbM8+VSRx0
 4VEUZiMAOl018lK2Npa6qxRn8cLkBsUAipF5wPWaAUbq8R2q6BEwtBwtsRWM47Cktv07
 RTlEcBnWQw96/CG8r7x44qDwYW7MitfcJY5AvDf+GeFrhbPI0jxYjL9yBLiSidpKxHdN
 Yt7tCq12XeYXPzlRzPgt90tbmEFbH++e277bqbyOsKR/KImIVpJs0PMtEWwgeCLpYBFZ
 pYRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772628274; x=1773233074;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=LHByxMKryOjmtkThOv7ygNgBhXzSd+UZ7YG3LhRsijU=;
 b=mlLHocBdXodO4EVEMYPVNn2lSpjGb1FxxpT1os+wUETN1GSj6Vw3fwaLJQeLnGhZ2U
 ysxmCX56r1caVHHt8L4pmghuxAtTuRl7m6d4/SOWUzChQvO5egPh/Cn0avc/c9g/Iray
 GLV2hgoaXuEKC6irbrDo3A+bM7t7/3jypzliVhBMN2ZYebyPWMKiYWq/PzkKPCttJNZ5
 e9v9zWE9qEqQsI6NWS2U86Q2MUP515G574A2rnbmo5iTA0u8IHoDiv0Ep3Lw7r2t3vtF
 XqI6toS8mEP2B8WOAmfg478hD2RE3z85k/IFsatfVgutlmxCjPopTuM4OzgUdpJyDhZh
 4Bhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVb8Ggij5mO4/Ce5DVd8K1pFDOycCZ430KBQlvOl9rfg+rSLOF9v0pYL40IJp8M71vs7zOSo6fuy70=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxd850J9qquNq543HE9Llmcuy5olameoVrcLv6xzSG4oyvyaL25
 8svCHhJEMbo6qMQNPvvjTUfc4L4dYbWo0qwxZYoJ0XI5Y1N6fzQ2iBLf
X-Gm-Gg: ATEYQzzJrxP2zCcWi+TQ6SigvFdVung49Tp1n8028zxpyId2V8/S7Boas/kWSzDPnSW
 2DwnUEBZ5IYB8oOEEPSq/IArhWpNmRh6uVOBtHGx4Z9gppmKQHzG3xoMui0m/6CzdWZCPdjUYTy
 nVCkpY3b5MWeGG1ijDQuC2kGZ35DGccEMuG6S3zH5t58w5lGcOsYlIi+QlEaYAPRKgK6gpmDB3c
 LyiXs9KpyJpzW6y1zbK8QWF4hEqR6T6M/qHu07oMjNdeXONKZmdgrrQLsD6ZB0BD9hEee63KtnH
 0+k4SuFauU4zZVoMfcOJcK1RHViOzkPouS+h/K2lDg3WDvTwvBMbeGA60HG9WTa+nhcpMmITrhV
 BMmFSS0OmtoB2nZqVxATM/NSYnEQqwH3H3W4xrfZ0Sjk77o1WzrLNqZsp7mf5ZbVu+RO5qgephc
 6LYM9rNv2SlsYSZpAJh8J8cAqbj/dkvrY/x2RiWs5V9vbwWR+lb69NznmLL9JKayT/O8karSkLs
 ttCIpaj
X-Received: by 2002:a05:600c:1e2a:b0:465:a51d:d4 with SMTP id
 5b1f17b1804b1-48519848388mr27553155e9.6.1772628273692; 
 Wed, 04 Mar 2026 04:44:33 -0800 (PST)
Received: from timur-hyperion.localnet (540018D2.dsl.pool.telekom.hu.
 [84.0.24.210]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851884a24asm50661015e9.7.2026.03.04.04.44.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2026 04:44:33 -0800 (PST)
From: Timur =?UTF-8?B?S3Jpc3TDs2Y=?= <timur.kristof@gmail.com>
To: Rosen Penev <rosenp@gmail.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Kenneth Feng <kenneth.feng@amd.com>,
 Alex Hung <alex.hung@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Lijo Lazar <lijo.lazar@amd.com>, "chr[]" <chris@rudorff.com>,
 Sasha Levin <sashal@kernel.org>, Wentao Liang <vulab@iscas.ac.cn>,
 "open list:AMD DISPLAY CORE" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCHv2 for 6.112 and 6.6 0/2] amdgpu: fix panic on old GPUs
Date: Wed, 04 Mar 2026 13:44:31 +0100
Message-ID: <5828571.IbC2pHGDlb@timur-hyperion>
In-Reply-To: <4d00945c-f439-4460-9f8b-12e7e498fb20@amd.com>
References: <20260228045356.3561-1-rosenp@gmail.com>
 <2596902.XAFRqVoOGU@timur-hyperion>
 <4d00945c-f439-4460-9f8b-12e7e498fb20@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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
X-Rspamd-Queue-Id: E4E411FFC5D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:rosenp@gmail.com,m:christian.koenig@amd.com,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:alexander.deucher@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:kenneth.feng@amd.com,m:alex.hung@amd.com,m:gregkh@linuxfoundation.org,m:lijo.lazar@amd.com,m:chris@rudorff.com,m:sashal@kernel.org,m:vulab@iscas.ac.cn,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,amd.com];
	FORGED_SENDER(0.00)[timurkristof@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_ALL(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,linuxfoundation.org,rudorff.com,kernel.org,iscas.ac.cn,lists.freedesktop.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[timurkristof@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,gitlab.freedesktop.org:url]
X-Rspamd-Action: no action

On Wednesday, March 4, 2026 11:06:53=E2=80=AFAM Central European Standard T=
ime=20
Christian K=C3=B6nig wrote:
> >=20
> > Hi Everyone,
> >=20
> > The patches actually come from a branch of mine:
> > https://gitlab.freedesktop.org/Venemo/linux/-/commits/v6.12.74_si_dc_fi=
xes
> >=20
> > For context:
> >=20
> > The crash comes from a patch that I wrote for 6.18 that fixes some issu=
es
> > on the default, non-DC code path, that was backported to stable kernels.
> > DC was not the default code path before Linux 6.19, so I didn't mark the
> > patches that also fix DC for backporting, because I had assumed nobody
> > uses the DC code path on these kernel versions.
> >=20
> > After a user reported to me that this causes issues for him with DC on
> > 6.17
> > and older kernels, I sent a backported series to Greg and Sasha, in an
> > email thread with the subject line "Fixing an amdgpu crash caused by a
> > backported patch". The fixes were backported to 6.17 then.
> >=20
> > I assumed that the stable maintainers would backport the fixes to all
> > older
> > kernels that were also affected, but Rosen brought it to my attention t=
hat
> > it didn't happen. So I made the backports in the above branch. Rosen th=
en
> > decided to send them to the mailing list.
> >=20
> > > Hope that helps clear up the situation.
>=20

Hi Christian,

> In theory Harry an Leo should take care of stuff like this

I don't blame them for this. It is my fault for breaking it in the first pl=
ace,=20
and I didn't think there was any interest in using DC on older kernels.

> pretty much everybody is overworked.

Yeah. We all are.

>=20
> In that case guys feel free to go ahead and ping the stable maintainers t=
hat
> something is missing.
>=20
> Just make sure that when a patch passes through your hands that you add a
> Signed-off-by tag.

Thanks! Probably I should have sent the patches myself, then they already=20
would have had all the necessary tags. Sorry for the confusion.

Now that the situation is cleared up, is there anything else we need to do =
for=20
these two patches here?

Best regards,
Timur



