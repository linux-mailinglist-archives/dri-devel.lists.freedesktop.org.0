Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OEW7HE9Ne2n9DgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 13:06:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9C8AFE0B
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 13:06:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8840C10E85A;
	Thu, 29 Jan 2026 12:06:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DBKF/koT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F0AD10E854
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 12:06:34 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-4359228b7c6so715572f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 04:06:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769688393; x=1770293193; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6QTOQktx+T8aTDWlJDPhGlWk3qvhIQsNrxNsbMFHUik=;
 b=DBKF/koT6XPHq1PxPXjLq8IwrY+oyMJzklMVTfF85789ow1o1HrplZ2PXUnE/dvuiN
 CJtAC8ZZXb+JyVcFRXTsewfX0j9dTaIn+YEaIAwHAGNzE6zPRdKfWZNrFuK08u+OQXgp
 10noOqeJqlJ32c0DWaWqCGZLqE+58nv0RQJmz74x2TSI/Tu8spNkZYuPDjlOE7juHPsz
 8YOxiGmMW0MQ2TkwAhM9nvYgz+ZBZVT7RbZfaIjgacXfmCHw7MBRXcjIsb4/Xlp8y2AJ
 R2n/rdak+D598HWWcF6idicq8JNHe8Yn9fVu122EnvpmNgRMHkcjWAuKn8nG/4UILAnj
 ftfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769688393; x=1770293193;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6QTOQktx+T8aTDWlJDPhGlWk3qvhIQsNrxNsbMFHUik=;
 b=WAqG/EtMe6ZAeDO/Y0io0By0AYj8UoyQ1D+bmc3C3H3g51djo3c5WZoD2vw3ZN0x4V
 xRR3rQKhWLzTHsBHFpe/Q6KdzM1/o8XelZVMfK35ceMCmJWIhMZjfAcz1zqyAzc0IDWb
 Y51278cpG7pBHkWCwp/cwuEMzcUOhprYX1mNgAPsMoUN0P1bUeO6brwUXoi8HvFhnpSY
 E7n8jVLZAJi4LTBLD0IAZ3fmjAmMNAeIReWKryMllLe+Zd0mKWxA3oj/txOiyOLUK55P
 Sl9pMEGHF2M45R/uUpAl9fIfZ5l03yfgXey6epyBY6CoxwpCht2HaURsALGKPBEgNcU+
 xIKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0ZR4CEiACIsLwdD9e0KdVzAZPNs75u3MqPh77amHB0GPwrQUICSchaYbNKK85EcCP1rL83p659w0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZa66g9sNo+4LinwNOMxNOKkXrq5Hjk7ozHdDoKftoDZ6hodeA
 e/TTWJhMnk82puXkNyPl0iqlE2zsYNL2lnQlKyNNp792bmp6ZcJw4Z66
X-Gm-Gg: AZuq6aJgW8WxFuamFJrmPHw/Jyrpm2dlKJzq7HwRqkDKpYPUOkGJSlicI1gRREc3LHv
 K05v6Qe9RI4Ry2IDh9MEthDd/UJejWSqg/cA37fWqbJivGNj8qciM1uV+C1p/JYS+iQL8KJorgl
 3ErW0Yg3bs1mISYOQM6IcNnCH3c8rCnc52RP7HNyQJt9DhkX4l7TYtE91jBpk5+ceEQFRWeBkbO
 XklViKeuTysbzJ6xsZs16RJRFYJJUpDyPHrR/locuwKYrLQhaYy8uo3o1sNf2Yfsof8BxNN8P7Y
 wx9LSEErWIHILDfDFCjT8dRKrwTXQB/4Tm8sul/QJrKKlS5YZCZdOrk1qDaNDB3J0yVxkugPAnb
 7Ue3hL+83hsbI7YokCqFE5LtFMy4L+fYVisFoiJ+Kn0N+nEK3IFBqS47n5K8ObPZZnSwY703RfA
 mcVwNGAGe3a+bahvkkACS0ys0ahByXzc0WF3QWCwWZGTEitxSPJ7AZO8fHR28=
X-Received: by 2002:a05:6000:258a:b0:430:fdc8:8bbd with SMTP id
 ffacd0b85a97d-435dd0b3702mr13425165f8f.41.1769688392626; 
 Thu, 29 Jan 2026 04:06:32 -0800 (PST)
Received: from timur-hyperion.localnet (5401DF8B.dsl.pool.telekom.hu.
 [84.1.223.139]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e131ce93sm13719217f8f.24.2026.01.29.04.06.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jan 2026 04:06:31 -0800 (PST)
From: Timur =?UTF-8?B?S3Jpc3TDs2Y=?= <timur.kristof@gmail.com>
To: Alex Deucher <alexdeucher@gmail.com>,
 Hamza Mahfooz <someguy@effective-light.com>,
 Michel =?UTF-8?B?RMOkbnplcg==?= <michel.daenzer@mailbox.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
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
Date: Thu, 29 Jan 2026 13:06:30 +0100
Message-ID: <2285353.hkbZ0PkbqX@timur-hyperion>
In-Reply-To: <30f2480d-016f-417e-9ddf-7805e4943e7b@amd.com>
References: <20260123000537.2450496-1-someguy@effective-light.com>
 <2719069.vYhyI6sBWr@timur-hyperion>
 <30f2480d-016f-417e-9ddf-7805e4943e7b@amd.com>
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
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:alexdeucher@gmail.com,m:someguy@effective-light.com,m:michel.daenzer@mailbox.org,m:christian.koenig@amd.com,m:mario.limonciello@amd.com,m:alexander.deucher@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:siqueira@igalia.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:sunil.khatri@amd.com,m:cesun102@amd.com,m:lijo.lazar@amd.com,m:kenneth.feng@amd.com,m:ivan.lipski@amd.com,m:alex.hung@amd.com,m:chiahsuan.chung@amd.com,m:mwen@igalia.com,m:Jerry.Zuo@amd.com,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,effective-light.com,mailbox.org,amd.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_SENDER(0.00)[timurkristof@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_FROM(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[timurkristof@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[amd.com,lists.freedesktop.org,gmail.com,ffwll.ch,igalia.com,linux.intel.com,kernel.org,suse.de,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 0E9C8AFE0B
X-Rspamd-Action: no action

On Thursday, January 29, 2026 12:38:30=E2=80=AFPM Central European Standard=
 Time=20
Christian K=C3=B6nig wrote:
> >=20
> > However, just like we do with ring timeouts, we also need to be prepared
> > for the situation where a page flip timeout happens and we should try to
> > recover from it. And if it isn't recoverable, fall back to GPU reset.
>=20
> No, that is clearly a bad idea.

I don't see why it's "clearly" a bad idea. It's not clear to me at all, ple=
ase=20
clarify it for me.

> CRTCs are fixed function devices that GPU
> reset helps here is just pure coincident.

Currently, the driver doesn't handle page flip timeouts at all, which means=
=20
that if it happens, there is 0% chance of recovering from it.

If the GPU reset improves that chance to non-zero, it's already an=20
improvement, and already more than what AMD did to address this problem for=
=20
the past few years. I just find it incredibly disrespectful towards the=20
community that AMD proposes a solution that they neglect to implement, then=
=20
when somebody from the community steps up to implement it, it's rejected.

> What we can certainly do is to improve the error handling, e.g. that the
> system doesn't sit there forever after a page flip timeout.

Sure.

>=20
> Let's maybe try a complete different approach. We force a page flip timeo=
ut,
> and see if the system can handle that or not.
>=20
> E.g. every 300 page flip we just fail to signal and see if things still w=
ork
> after the timeout.

How do you propose to do that?



