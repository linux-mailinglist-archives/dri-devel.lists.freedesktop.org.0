Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0CqzOMBDe2l+DAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 12:25:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDE8AF96C
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 12:25:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B60810E31E;
	Thu, 29 Jan 2026 11:25:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hMV5RgLu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B011910E31E
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 11:25:48 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4801d7c72a5so6577455e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 03:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769685947; x=1770290747; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ouo/mg65aOcXSM62YmotwBXBKDEb8Yzi3FDBO7jCaMY=;
 b=hMV5RgLu5DfVna3ybsrfuHgWttd+JnMg0cB1oagGKfRb4cxPRhYo+GY7fNDcNBfdXA
 ZluEcM4mReKVX7ysbo+1GjGD7nzcbG120H6bPvVQ/a0dzZYk7hTNvR86jOne6Hg1gqAL
 TttNhEZkxla7SOTVC/zqz5k/IMDeCRgH/gusgXfgxZ7FxKB0TNLvvlQYQQuZMR4yEWhk
 x+pkpTXsaluWzD7EYj4zzBkw0EUvcqRhbTTMdbJKrUuVwdNCzZt8kxDwd2P71Fnj9ITy
 FdHSWx0vdReGD20sM5ixNr7S2VODpkLlf5hXMZd7UXdk3klRaJ2ljrxn75DbEr4Oki3M
 OXdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769685947; x=1770290747;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Ouo/mg65aOcXSM62YmotwBXBKDEb8Yzi3FDBO7jCaMY=;
 b=hnmkNAv+mdz1Nee1o6W8vre3f4lFUnanervkQ5ck4P3le6f4xCOzq8U+pIaFUDUjYW
 G6tw14hQrvpUe5/DdGneZ14es2mcHh3NYy3zWuWHTzL7a3CzRgiWhJKSMuc4uSShWmYB
 1WojmxkWtKSciugvJw/aZD4aCwHJaop2UDBQoBzalQlmdF9b0nV/5Divs2cjNUiY82Nu
 grCB9yytihi8z61Dghyw49r2JGhInHjf0GzN3SBfOf+a415byMwqxI+wk96nbGvdghn1
 J8vYhIEYFqE5J9OSQVKsATZgTzHn2xXErBAAN3fOnh2+Ud64MYzIiSiWLxxX8IaD9a27
 t+fA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6cXr9/l5gGOfzjPDStDAT4kPnjhXxnuPUplcdKz/90lvaUOygIpTk2j/9skF0e2TFC+tx+3b9LzE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyzNkKSqArc6YCdXqFDQkPiSbhYyWr66wQ3LYZgydeQo0X2SXWv
 etGsbryPl687gW9iR6JDHm7rd3hf/X4PV4RpbnNNOOYZA+aCzeVM1lnX
X-Gm-Gg: AZuq6aLgck8rkM575i9t/Fute2+R++Ta86QTggV76Y4SYotCXzuezWJM9kl3qEKDZxd
 1cADJHRnsZZYm5uzO+0a+CRQqe9uqREmJgEeuA+5HMzngvbU6MijUE6ZSKH3qsiZJSzLTaDTN1A
 7hd65Dsw/+pHAKqIoRkLbEDLj6mkdEn3e1jfIHYJaagw9BlpwaQ6P5VCtc5Dnz1gShzuRNKZCa4
 Lhcazlxr21hYks6jyPdiLMw4kIjSuiSD0FsVToMrSdiUDNOeoJ8C5zEDuih+audf2NkgvZU5i7X
 Om/3Mu4Lfxxj/FXomCzf/BfzEXYrgZF7Yck4oP3hGXzUXZE5h7dDHmxtd6MlAFvrmVohZe3gmlF
 mtTOK6+mbPKHVqKP4ddcMF0DLSNwjrbloSqRqOlfbfmCD/ZJ+vhSLPwPxex6kuLU3iVnatzn2to
 ZRFNRfa05cBAamz+YCw4ZmwT3cQXTRbqIw3NRTun0ntbWiDp1gfz+afoLdtDo=
X-Received: by 2002:a05:600c:4e8b:b0:480:1b65:b741 with SMTP id
 5b1f17b1804b1-48069c4ae9cmr98553855e9.15.1769685946522; 
 Thu, 29 Jan 2026 03:25:46 -0800 (PST)
Received: from timur-hyperion.localnet (5401DF8B.dsl.pool.telekom.hu.
 [84.1.223.139]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4806cddffc0sm151978565e9.5.2026.01.29.03.25.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jan 2026 03:25:45 -0800 (PST)
From: Timur =?UTF-8?B?S3Jpc3TDs2Y=?= <timur.kristof@gmail.com>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Alex Deucher <alexdeucher@gmail.com>,
 Hamza Mahfooz <someguy@effective-light.com>,
 Michel =?UTF-8?B?RMOkbnplcg==?= <michel.daenzer@mailbox.org>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sunil Khatri <sunil.khatri@amd.com>, Ce Sun <cesun102@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, Kenneth Feng <kenneth.feng@amd.com>,
 Ivan Lipski <ivan.lipski@amd.com>, Alex Hung <alex.hung@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>, Melissa Wen <mwen@igalia.com>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] drm: introduce page_flip_timeout()
Date: Thu, 29 Jan 2026 12:25:44 +0100
Message-ID: <2719069.vYhyI6sBWr@timur-hyperion>
In-Reply-To: <6f1239d2-eec3-40b6-aca7-5b278350dd04@mailbox.org>
References: <20260123000537.2450496-1-someguy@effective-light.com>
 <ab52825d-8f26-4b52-af5d-4051760b2aa4@mailbox.org>
 <6f1239d2-eec3-40b6-aca7-5b278350dd04@mailbox.org>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:alexdeucher@gmail.com,m:someguy@effective-light.com,m:michel.daenzer@mailbox.org,m:mario.limonciello@amd.com,m:alexander.deucher@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:siqueira@igalia.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:sunil.khatri@amd.com,m:cesun102@amd.com,m:lijo.lazar@amd.com,m:kenneth.feng@amd.com,m:ivan.lipski@amd.com,m:alex.hung@amd.com,m:chiahsuan.chung@amd.com,m:mwen@igalia.com,m:Jerry.Zuo@amd.com,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[timurkristof@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,effective-light.com,mailbox.org];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[timurkristof@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[amd.com,lists.freedesktop.org,gmail.com,ffwll.ch,igalia.com,linux.intel.com,kernel.org,suse.de,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 3DDE8AF96C
X-Rspamd-Action: no action

On Thursday, January 29, 2026 11:06:11=E2=80=AFAM Central European Standard=
 Time=20
Michel D=C3=A4nzer wrote:
> >>>=20
> >>> Christian, why would the CRTC be turned off?
> >>=20
> >> Exactly that's the question we need to answer.
> >>=20
> >> But from what you describe the CRTC keeps on, just doesn't send any mo=
re
> >> vblank events.>=20
> > The vblank interrupt source getting accidentally disabled might be one
> > possible cause though.
> Another possibility is that test-only commits with the
> DRM_MODE_ATOMIC_TEST_ONLY flag (which can happen in parallel while the
> kernel is processing a "real" commit) accidentally have side effects on t=
he
> current kernel state, resulting in the "real" commit failing to do
> something it should. There have been bugs like that in the amdgpu DM code
> before.
>=20
>=20
> Anyway, this is all speculation. Somebody just needs to dig in and get to
> the bottom of why the commits aren't getting completed.

Yes, I agree.

However, just like we do with ring timeouts, we also need to be prepared fo=
r=20
the situation where a page flip timeout happens and we should try to recove=
r=20
from it. And if it isn't recoverable, fall back to GPU reset.

I strongly suspect that there are many different issues depending on the=20
hardware generation and display configuration. There isn't going to be a si=
lver=20
bullet to fix all of them, and in case it cannot be fixed, I think a GPU re=
set=20
is the right thing to do - it's drastic, but still better than letting the=
=20
machine just freeze irrecoverably.

One example of such a bug was fixed by 6cbe6e072c5d where DC was trying to =
use=20
an interrupt that didn't exist on some hardware. This type of bug would be=
=20
impossible for userspace to solve in any way, but a GPU reset would have=20
helped to recover the machine into a usable state.

Another example would be Strix Halo with adaptive sync and/or tearing updat=
es=20
enabled, which 100% reproduces a page flip timeout for me. I haven't had ti=
me=20
to investigate that one just yet.

Timur


