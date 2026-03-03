Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EBmPLnQ9p2kNgAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 20:58:44 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4921F6835
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 20:58:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC6A610E031;
	Tue,  3 Mar 2026 19:58:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dCgrcDoC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 996BD10E031
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 19:58:39 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-439c5cce2c6so222113f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 11:58:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772567918; x=1773172718; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SdLh/NWLkEm3eJhtC/mdgt/+LRhEHwHgzGrdAve98wA=;
 b=dCgrcDoCf4HAM4R3SA2RpVd2kNQAQZutTJ0pJAM1zzNNBczlkcs7ezJII2rlmWKj58
 M9DEDk4xqhMxjktk4O9fdq1U7MAktyXCIHlFWGa1B/P56EOBaAI1PwN3xB9mcU0jyWBn
 5UbkwYEsNTqFhfLRsgATgo2uxPPWAbybNDp1LBG4yqmBVl6C+9GLQt3VRKOM56zbj3ba
 ust0k4YAif7wXe7hEsM69JKVOkMWltBq3dXdZjERc3ma3hzCQSTY714Kdoq6nThPLmng
 2gy7G6bpnaeqg1e1X1hGB7/CLBy/ox8mqsNC22QTKkhszdA6eO4BIENSEfD+eipAtWSx
 MpzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772567918; x=1773172718;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=SdLh/NWLkEm3eJhtC/mdgt/+LRhEHwHgzGrdAve98wA=;
 b=nhkAdYDPNqOBXVuR99RYAwPvj81Wz2mSrU0rRf6+2SN6Jkl6cu4AHirEDLfzqR9AVb
 9XtToXDKXek2Me23PWcCUL1JZxz/DYD9PWOu9N4YO93KqWfjfN/vL6UGAdc2aSzGiaQW
 cMS+658vZC4fS6W9+L6rnUCPeNFw0RIQhEZiiyUnNVe8O7fFKoz/oOHyapkm+m/2Joy+
 rFX61UCZwKKEz4/XrroZ9QUj9oTuDSLwHvAAp7FChGWdIlEUpkGCTGFkLGeRm/JlMF0c
 BcNpKbuFaTOl7SaIkUbrIsf5aMqxGKPkO+SW5JSOPU8lDRjLfpU9Zj9XPfEQZQ8t7Y12
 HjRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfUuvCmZZrz0RaVbOwirmx/H+uahjBr5a4+dEL0zi5lOybWrLyrlI94JZVIuJqmJRWpRppSyYXTE8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyDSYrYlXIfNFdsfc6tFSwlnc7fytH2vuS3QI9B+DGWNM1d1WRs
 NWGKHXe6smGMZ428HaC08FZqpsLOz1N+ImP14fk1eUUY0jvT905zh6qZ
X-Gm-Gg: ATEYQzyV20eQLnhNtzk7hVO4gVZZm8NTbTNsHQcmFsNN7h5ZALKPZPKMXyJavdXv7Mf
 WmAF2PoOLzLEGNg0KgZ5IqoKg4QhfxvTf0g1P3JWlxKBiVYIZoBpTKRnTdez0proK+xZfmFGp+0
 ONHwNc8EgHQXl4dan4covXKCr7c3HUCRIljhePNE1riM0/6Msu8uMJlDnKvvze3A2vYAZIVMWeF
 MyV6RoYmwIZCnR6aFN4Zqd7f6dcvA2r+5fHv0AGcw3FXchxg4PRuOEG8ekHb0+XdVIzcsoFTU5l
 d+l9+NkWJtHhY+ZfqzBKjc6k0vxc1T4itBSt7D67/ez0sz1dyCVTfx7ypAzw0Xlv6Fqzw2//2/p
 dM9n8Fgkipe+FCK+yHIF8ga3QK4B1qEgth7HkbGql6J5Hata+RoOxxB7tmD9X6gpHjgLK5/EGlK
 V8U4I0MO1l9qQptmWbrXpsOEMGjK9fGIzUcVM6SMhDvrY5rBegKK4RkPBQW4vnbAgL
X-Received: by 2002:a05:6000:25c3:b0:439:be67:a038 with SMTP id
 ffacd0b85a97d-439be67a710mr9921230f8f.41.1772567917770; 
 Tue, 03 Mar 2026 11:58:37 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439b503425asm19275915f8f.25.2026.03.03.11.58.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 11:58:37 -0800 (PST)
Date: Tue, 3 Mar 2026 19:58:35 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Julian Orth <ju.orth@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Michel
 =?UTF-8?B?RMOkbnplcg==?= <michel.daenzer@mailbox.org>, Christian
 =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Dmitry Osipenko
 <dmitry.osipenko@collabora.com>, Rob Clark <robin.clark@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/syncobj: Fix handle <-> fd ioctls with dirty stack
Message-ID: <20260303195835.4c23be7a@pumpkin>
In-Reply-To: <CAHijbEUJkZHw4DeE4wmeD3dvEcnGXVqsHDg7QHHa6i=6LT38bQ@mail.gmail.com>
References: <20260301-point-v1-1-21fc5fd98614@gmail.com>
 <e0f687da-7323-40fc-af50-82abea6e25cc@linux.intel.com>
 <3c969254-ed38-4b13-84b3-5afa365b04cb@amd.com>
 <2b75199f-b78a-4915-8e75-5d186f63f7c5@mailbox.org>
 <CAHijbEXkn3+E_u1+aZgLT+pQ_vLYvKKv9VU_5kOuEaFheLRQeg@mail.gmail.com>
 <bc3417d9-d191-4cc7-95e0-968b0b9bec05@linux.intel.com>
 <CAHijbEXTPSLSADqet1=P1FV6jvoa5yGEprOuYtpQWUq_y5uT2A@mail.gmail.com>
 <c5e2cd1d-05a9-489a-be8a-be4d0d583688@mailbox.org>
 <CAHijbEWoQHTyj_V1dD9UWskPmz0WbrVwzPTD3XqJTczy1ojBnQ@mail.gmail.com>
 <d90d6eb3-72bc-4502-934d-f77dac83690d@mailbox.org>
 <88726fec-3bbb-4ca8-b724-c281b5696324@linux.intel.com>
 <CAHijbEUJkZHw4DeE4wmeD3dvEcnGXVqsHDg7QHHa6i=6LT38bQ@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
X-Rspamd-Queue-Id: 1C4921F6835
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ju.orth@gmail.com,m:maarten.lankhorst@linux.intel.com,m:michel.daenzer@mailbox.org,m:christian.koenig@amd.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:dmitry.osipenko@collabora.com,m:robin.clark@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:juorth@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[davidlaightlinux@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,mailbox.org,amd.com,kernel.org,suse.de,gmail.com,ffwll.ch,collabora.com,oss.qualcomm.com,lists.freedesktop.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[davidlaightlinux@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Tue, 3 Mar 2026 18:44:59 +0100
Julian Orth <ju.orth@gmail.com> wrote:

> On Tue, Mar 3, 2026 at 6:41=E2=80=AFPM Maarten Lankhorst
> <maarten.lankhorst@linux.intel.com> wrote:
> >
> > My point is that it works for old userspace without problems. It's only
> > newly compiled userspace with new headers that will run into problems.
> > The code as written would have continued to work, but if you update to
> > the new header and don't initialise the new members then it's a userspa=
ce
> > problem. It should not be worked around in the kernel, since it's newly
> > written bad userspace code, not old bad userspace code that stopped wor=
king
> > when the kernel changed. =20
>=20
> But it's not newly written. The example is, say, 5 year old code. The
> binary that was compiled 5 years ago works fine as you say. But if you
> take the same code and just run gcc again, the new binary will no
> longer work.
>=20

Worse, the recompiled version may well work when you test it, and even
when deployed.
But you'll get non-obvious random failures - a support nightmare.

Probably best code is something like:
	case OLD_IOCTL_CODE:
		if (ioc->flag & NEW_FLAG)
			return -EINVAL;
		/* FALLTHROUGH *.
	case NEW_IOCTL_CODE:
		if (!(ioc->flag & NEW_FLAG))
			ioc->new_field =3D 0;

    David
