Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yFclH4jakmnKywEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 09:51:20 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE913141AE1
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 09:51:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22BE910E0B0;
	Mon, 16 Feb 2026 08:51:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="lsB5/U5X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C44E610E0B0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 08:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1771231875;
 bh=0GAZUpmOR2HUnzIZWBgRgIowoiwTceuDp8ETqOk43xQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lsB5/U5XXJEPK4WZ2jjJDx8oztnLX1W51m1hdem6hxRaP5BX9pE4BYEdaOS7S3upo
 ivQa9tep8Fjw6KQKGh6/VYT4FNXmLoMWBE8AOXo2Zt9odOcuj90ulxDryz6lztn+qS
 nAq3yr63ioIWAOW1TnTi6P76hLyNO6/oIwYQFjg5TY/v1z1wgyAJvWwUmkS8hhnwtQ
 avLoBtGtommerIPxmpsjJIWHbN15uABCj91QSiCBuaVm/L0f2GC0Vltrp5K5ozWBEk
 bgDXK3r9iWT1K6dXsNzsZMty8HtJWGR0Cix8zeVS6f+UmI8FG0E3ejGeeAiHQls+l8
 eVQXOJCi00kEQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id B91E217E150E;
 Mon, 16 Feb 2026 09:51:14 +0100 (CET)
Date: Mon, 16 Feb 2026 09:51:10 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Chia-I Wu <olvaffe@gmail.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Akash Goel <akash.goel@arm.com>, Rob Clark
 <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, Konrad Dybcio
 <konradybcio@kernel.org>, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Dmitry
 Osipenko <dmitry.osipenko@collabora.com>, Chris Diamand
 <chris.diamand@arm.com>, Danilo Krummrich <dakr@kernel.org>, Matthew Brost
 <matthew.brost@intel.com>, Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?=
 <thomas.hellstrom@linux.intel.com>, Alice Ryhl <aliceryhl@google.com>,
 kernel@collabora.com
Subject: Re: [PATCH v3 9/9] drm/panthor: Add a GEM shrinker
Message-ID: <20260216095110.324c0cde@fedora>
In-Reply-To: <CAPaKu7SRZDi3yqPie_C8xh+KmENNKtm95im+v404fWK07_GytA@mail.gmail.com>
References: <20260211080343.1887134-1-boris.brezillon@collabora.com>
 <20260211080343.1887134-10-boris.brezillon@collabora.com>
 <CAPaKu7SRZDi3yqPie_C8xh+KmENNKtm95im+v404fWK07_GytA@mail.gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:olvaffe@gmail.com,m:steven.price@arm.com,m:liviu.dudau@arm.com,m:adrian.larumbe@collabora.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:akash.goel@arm.com,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:dmitry.osipenko@collabora.com,m:chris.diamand@arm.com,m:dakr@kernel.org,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:aliceryhl@google.com,m:kernel@collabora.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[arm.com,collabora.com,lists.freedesktop.org,gmail.com,ffwll.ch,oss.qualcomm.com,poorly.run,kernel.org,linux.intel.com,suse.de,intel.com,google.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:email,collabora.com:dkim]
X-Rspamd-Queue-Id: DE913141AE1
X-Rspamd-Action: no action

On Thu, 12 Feb 2026 17:19:20 -0800
Chia-I Wu <olvaffe@gmail.com> wrote:

> On Wed, Feb 11, 2026 at 12:22=E2=80=AFAM Boris Brezillon
> <boris.brezillon@collabora.com> wrote:
> [...]
> > +static unsigned long
> > +panthor_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_con=
trol *sc)
> > +{
> > +       struct panthor_device *ptdev =3D shrinker->private_data;
> > +       unsigned long remaining =3D 0;
> > +       unsigned long freed =3D 0;
> > +
> > +       if (!can_swap())
> > +               goto out;
> > +
> > +       freed +=3D drm_gem_lru_scan(&ptdev->reclaim.unused,
> > +                                 sc->nr_to_scan - freed, &remaining,
> > +                                 panthor_gem_try_evict, NULL);
> > +       if (freed >=3D sc->nr_to_scan)
> > +               goto out;
> > +
> > +       freed +=3D drm_gem_lru_scan(&ptdev->reclaim.mmapped,
> > +                                 sc->nr_to_scan - freed, &remaining,
> > +                                 panthor_gem_try_evict, NULL);
> > +       if (freed >=3D sc->nr_to_scan)
> > +               goto out;
> > + =20
> Do we need to check for can_block here? panthor_gem_try_evict will
> block for bos on lrus below.

Yep, we do. Will fix that in v4.

>=20
>=20
> > +       freed +=3D panthor_mmu_reclaim_priv_bos(ptdev, sc->nr_to_scan -=
 freed,
> > +                                             &remaining, panthor_gem_t=
ry_evict);
> > +       if (freed >=3D sc->nr_to_scan)
> > +               goto out;
> > +
> > +       freed +=3D drm_gem_lru_scan(&ptdev->reclaim.gpu_mapped_shared,
> > +                                 sc->nr_to_scan - freed, &remaining,
> > +                                 panthor_gem_try_evict, NULL);
> > +
> > +out:
> > +#ifdef CONFIG_DEBUG_FS
> > +       /* This is racy, but that's okay, because this is just debugfs
> > +        * reporting and doesn't need to be accurate.
> > +        */
> > +       ptdev->reclaim.nr_pages_reclaimed_on_last_scan =3D freed;
> > +#endif
> > +
> > +       /* If there are things to reclaim, try a couple times before gi=
ving up. */
> > +       if (!freed && remaining > 0 &&
> > +           atomic_inc_return(&ptdev->reclaim.retry_count) < 2)
> > +               return 0;
> > +
> > +       atomic_set(&ptdev->reclaim.retry_count, 0);
> > +
> > +       if (freed)
> > +               return freed;
> > +
> > +       /* There's nothing left to reclaim, or the resources are conten=
ded. Give up now. */
> > +       return SHRINK_STOP;
> > +} =20

