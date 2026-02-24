Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2PWFJIfPnWn4SAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 17:19:19 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E01F7189B15
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 17:19:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAE5A10E5D8;
	Tue, 24 Feb 2026 16:19:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="D9c6AZP6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0495A10E5D8
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 16:19:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A8CCB440C7
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 16:19:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89643C4AF09
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 16:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771949951;
 bh=dLXqKRJ3EHq4YwfsK1mVBbooQOdoDKd3lRce0LWedZ8=;
 h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
 b=D9c6AZP6YfPD8QiAvVoOwznk2QHoI2eYwu3Qc5yQ3ac+C/qJ5MYiR2HA3vZ7D4IwN
 ib3CVlEIngi2y0DOTNp0JPFy2wbPn3voRnKQhqHztaDVA4hCbYBMe/Mk8Rs+RuPSHs
 9kg9s6Gdf7I0DA2QW4Zho1tcDhfHfxstP0T2fJqWEY1NsrXOka0VXqoXrWVtj2ue1l
 vIfaRJQ4C0WeYfZKw7f+Z7ft9Ghft1mJjzlHAxUhfxLc+x3huFtWW1jOcSt7ERbEG7
 jAeQx0cSenIG1OJA0Gsn7ON73jeMpjz8TZi1pHn/9vLWrqV1hKpi1i3/i0IX7R0+5h
 Fs8EEA3K7HTdQ==
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-38706b10b3bso56879691fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 08:19:11 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUKzauk0c9wqxZ0tKh8sy9IL+0zXVSIxPXwCyiv0w2QM6CrJg0ZWNQAlgPkM44yh0ZEXbRf9aCT250=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy1H5RqNdCqPKPgCTJaBfhxL3SkUmklTOGfQGjTL2JlkkGxsaIa
 ACC0fbX4famKHw7darMOKfPWyJt24UlcZQd97ytDHsW3GQ6LJ+TM86NfTwUnAsYp8eXH4HcK9/n
 Ok76LfVczj2ttvUM4sZfuoLINu7HPQJU=
X-Received: by 2002:a05:651c:3242:b0:387:eb1:9322 with SMTP id
 38308e7fff4ca-389a5cfe101mr35460811fa.17.1771949949905; Tue, 24 Feb 2026
 08:19:09 -0800 (PST)
MIME-Version: 1.0
References: <20260224153656.261351-1-tzimmermann@suse.de>
In-Reply-To: <20260224153656.261351-1-tzimmermann@suse.de>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 25 Feb 2026 00:18:57 +0800
X-Gmail-Original-Message-ID: <CAGb2v647KWOOTUxpLdgom53kDmF5z0m+retOqy2HOmLei2m=_w@mail.gmail.com>
X-Gm-Features: AaiRm50hCew_I87lwkTN5CarWqRdkNHPwJ7DRrFz_eKd9Xk2Li42Y4dTolaKxVg
Message-ID: <CAGb2v647KWOOTUxpLdgom53kDmF5z0m+retOqy2HOmLei2m=_w@mail.gmail.com>
Subject: Re: [RFC PATCH 00/16] drm/mipi-dbi: Replace simple-display helpers
 with regular atomic heleprs
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: javierm@redhat.com, lanzano.alex@gmail.com, kamlesh.gurudasani@gmail.com, 
 david@lechnology.com, architanant5@gmail.com, mripard@kernel.org, 
 maarten.lankhorst@linux.intel.com, simona@ffwll.ch, airlied@gmail.com, 
 dri-devel@lists.freedesktop.org
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
Reply-To: wens@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tzimmermann@suse.de,m:javierm@redhat.com,m:lanzano.alex@gmail.com,m:kamlesh.gurudasani@gmail.com,m:david@lechnology.com,m:architanant5@gmail.com,m:mripard@kernel.org,m:maarten.lankhorst@linux.intel.com,m:simona@ffwll.ch,m:airlied@gmail.com,m:lanzanoalex@gmail.com,m:kamleshgurudasani@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[wens@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[redhat.com,gmail.com,lechnology.com,kernel.org,linux.intel.com,ffwll.ch,lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[wens@kernel.org];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wens@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-0.989];
	RCPT_COUNT_SEVEN(0.00)[11];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,suse.de:email]
X-Rspamd-Queue-Id: E01F7189B15
X-Rspamd-Action: no action

Hi,

On Tue, Feb 24, 2026 at 11:37=E2=80=AFPM Thomas Zimmermann <tzimmermann@sus=
e.de> wrote:
>
> We keep getting new drivers based on the obsolete simple-display pipeline=
,
> such as the recent driver for st7789v panels. [1] But submitters cannot
> know, as the simple-display helpers are fully documented and still used
> in several places.

Could you include a reference to the discussion to obsolete the
simple-display pipeline? That would be helpful. All I can find are some
patch series that convert individual drivers, and many of them just say
that it is obsolete, without pointing to actual discussion or documentation=
.


Thanks
ChenYu

> Hence, convert all the mipi-dbi drivers over to regular atomic helpers
> and remove simple-display support from mipi-dbi in this series. Then
> undocument the helpers and add TODO items for final their removal.
>
> Patch 1 changes the mode-setting logic get CRTC and panel updates into
> the correct order. This patch is probably the most fragile change in the
> series.
>
> Patches 2 and 3 prepare mipi-dbi to allow for atomic helpers to be used.
>
> Patches 5 to 14 update mipi-dbi drivers one by one. The st7735r driver
> requires some additional minor preparation. Overall, the refactoring is
> always the same.
>
> Patches 15 abd 16 clean up mipi-dbi and the simple-display helpers.
>
> These patches need some testing, as I can only compile them. At least
> one of the drivers should be tried on hardware. Regressions should be
> easy to fix, as these changes are mostly refactoring jobs.
>
> [1] https://lore.kernel.org/dri-devel/20260221071351.22772-1-architanant5=
@gmail.com/
>
> Thomas Zimmermann (16):
>   drm/mipi-dbi: Only modify planes on enabled CRTCs
>   drm/mipi-dbi: Support custom pipelines with drm_mipi_dbi_dev_init()
>   drm/mipi-dbi: Provide callbacks for atomic interfaces
>   drm/hx8357d: Use regular atomic helpers; drop simple-display helpers
>   drm/ili9163: Use regular atomic helpers; drop simple-display helpers
>   drm/ili9225: Use regular atomic helpers; drop simple-display helpers
>   drm/ili9341: Use regular atomic helpers; drop simple-display helpers
>   drm/ili9486: Use regular atomic helpers; drop simple-display helpers
>   drm/mi0283qt: Use regular atomic helpers; drop simple-display helpers
>   drm/panel-mipi-dbi: Use regular atomic helpers; drop simple-display
>     helpers
>   drm/st7586: Use regular atomic helpers; drop simple-display helpers
>   drm/st7735r: Rename struct st7735r_priv to struct st7735r_device
>   drm/st7735r: Rename priv variable to st7735r
>   drm/st7735r: Use regular atomic helpers; drop simple-display helpers
>   drm/mipi-dbi: Remove simple-display helpers from mipi-dbi
>   drm/simple-kms: Deprecate simple-kms helpers
>
>  Documentation/gpu/drm-kms-helpers.rst   |  12 -
>  Documentation/gpu/introduction.rst      |   5 -
>  Documentation/gpu/todo.rst              |  32 +++
>  drivers/gpu/drm/drm_crtc.c              |   6 +-
>  drivers/gpu/drm/drm_gem_atomic_helper.c |  22 --
>  drivers/gpu/drm/drm_mipi_dbi.c          | 352 ++++++------------------
>  drivers/gpu/drm/drm_modeset_helper.c    |   3 -
>  drivers/gpu/drm/drm_simple_kms_helper.c |  83 ------
>  drivers/gpu/drm/sitronix/st7586.c       | 194 +++++++++----
>  drivers/gpu/drm/sitronix/st7735r.c      | 142 ++++++++--
>  drivers/gpu/drm/tiny/hx8357d.c          | 138 +++++++++-
>  drivers/gpu/drm/tiny/ili9163.c          | 139 +++++++++-
>  drivers/gpu/drm/tiny/ili9225.c          | 193 +++++++++----
>  drivers/gpu/drm/tiny/ili9341.c          | 139 +++++++++-
>  drivers/gpu/drm/tiny/ili9486.c          | 130 ++++++++-
>  drivers/gpu/drm/tiny/mi0283qt.c         | 139 +++++++++-
>  drivers/gpu/drm/tiny/panel-mipi-dbi.c   | 142 ++++++++--
>  include/drm/drm_mipi_dbi.h              | 140 ++++++----
>  include/drm/drm_simple_kms_helper.h     | 216 +--------------
>  19 files changed, 1366 insertions(+), 861 deletions(-)
>
>
> base-commit: 1c44015babd759b8e5234084dffcc08a0b784333
> --
> 2.52.0
>
