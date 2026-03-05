Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kHy3DkA6qWkd3QAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 09:09:36 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD5520D37A
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 09:09:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28CE810EB58;
	Thu,  5 Mar 2026 08:09:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="TQ2l+OE6";
	dkim=pass (2048-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="dVXICtCK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7771A10EB54
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 08:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772698171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=m2qyIYKFUP0m9wA/UEgSZpALpRru5dabPxt8eU3MBlw=;
 b=TQ2l+OE6qVPerV9+YVQSl4IihBgQ+rCtjeWdysY59TBmvGn06L1YFs1uxNAd1TCm2up2nu
 Lk6wOccew287OddC01KMAHq5YafAmrFi42TuWDjove+89gicARtnMhABoBgb+vrLrfvJGA
 h26ED+4KKXnfXbDg1sKPxxcWxWGFLS4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-117-50loa8aGOJCE-SCwZMKUJA-1; Thu, 05 Mar 2026 03:09:30 -0500
X-MC-Unique: 50loa8aGOJCE-SCwZMKUJA-1
X-Mimecast-MFC-AGG-ID: 50loa8aGOJCE-SCwZMKUJA_1772698169
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4836bf1a920so83473145e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2026 00:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; s=google; t=1772698169; x=1773302969; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=m2qyIYKFUP0m9wA/UEgSZpALpRru5dabPxt8eU3MBlw=;
 b=dVXICtCK0aUMOoFCEogBSHGu0NUEkGWi5r0LPJKWvcDNoDPS26mUHqLsbaJ1igH2q1
 eSPQtAjNNT9UqUEPTqJI5DZxAYU7dN3BasvASjTcfpgg7Xkv/mbza6GdwBFJmWSizK7s
 7vT9hZZm0OVmI8jqkCLfYsW6oNCrOB0HCELTvvuyeDVbqbNr4asJggnx544WDzM5ILge
 caccZyAckV5uoIreBnJurwUZNn6kXmuhlJq3AiavHfaOIx7W8U8ZMWfeoNfCdlrNF8O7
 x82JRDqIXDT2ozg455lSJg+U8oTqMcuOpbMnih5sAO2IqeYKJpgkfLQ5qcgfSwFxMwRX
 BTuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772698169; x=1773302969;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=m2qyIYKFUP0m9wA/UEgSZpALpRru5dabPxt8eU3MBlw=;
 b=mGualbzGYSIeoMq3gnIgbP0tAN3PaGsVuEGtOWsDhesmmS8D1auMsyYnA1rgm4b4Jz
 mBQCBPJu7ZOZf6K30Rutu1isO4jbmJDJ6gtYCX8tcm/wUk9+kDPwMngBeFCkGys3lC4R
 YmGutiMcM+8gIUa5YwdFk1D28O0E+gqjf2ZoCi2LlVfOq396+zdTrPulr1O8cmYPQzfs
 bFNElnwVuhjTcDqtBsrKtHTZTuFV9L4BDg2CmsZVp+x0ebEf5+oQ/HoWJvhdR1TZImXZ
 Nh7nKv7M/YL/Hn9zGg8RAblP3E07cBYRfA36is2kU18vHYkSVv11oHirmcipdCWWJ21G
 hlsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMo4sHsF34QC5VuI88N+b0fSu9vyZxTPMSSXyDY247LoLMB9M0YIbNrjQolx7qMww+8eYInl7NzkQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxVSCz5BIg/SADfXVQ44+aKtMXowZ/0E11UBNgPy2gzUL4lMoyk
 f6rXSoKzH66l0hfInDMzJUCv3+AowF36/3jzBCO9pqZBblqPmLQoClnRZ6fJAXYuEVWO45H5eMP
 60LC8gv5B8nfTsvQCyv31TC8EXcV10Rte8iFLi5D33AKhgtZ2D5WuiRyGZHalMJlbJvWNoQ==
X-Gm-Gg: ATEYQzxY3a2hL4nQ6MJusdkriZCeIVriS9YyrRyjmysjGrNaexDVUlubLC82vSX47KD
 pCgcHxqaN+az7eT5eH72MNfWgUv2IsqYERSicXkXw+OltVrYa4PdruLZHwMtYUbS2PI3cYXuT+i
 oe65Q/s72hg6vV8quvyQ3fkxxoh0BwTzMZZwf+hahunm90EkItrzxPtiU0pcWWROB9t/EBJ/sT9
 Bf84xAkqTNPZfQU4ez8zhNiLnQFY9XzkI4JKaKuM9oNGqcW2ihY0QWGN+6ENpoQihWWHu7KB7x0
 r8rnfc7Ru0N6KnkFN1QgK+0K5FOfjrr8PaNPw66Pyq9jDmW3XVx5HrlGSaApfk1J1riDX8nAIg=
 =
X-Received: by 2002:a05:600c:3b9e:b0:477:5cc6:7e44 with SMTP id
 5b1f17b1804b1-4851984f5bemr88508675e9.11.1772698168796; 
 Thu, 05 Mar 2026 00:09:28 -0800 (PST)
X-Received: by 2002:a05:600c:3b9e:b0:477:5cc6:7e44 with SMTP id
 5b1f17b1804b1-4851984f5bemr88508245e9.11.1772698168337; 
 Thu, 05 Mar 2026 00:09:28 -0800 (PST)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851fad01d2sm25418255e9.3.2026.03.05.00.09.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2026 00:09:27 -0800 (PST)
Date: Thu, 5 Mar 2026 09:09:27 +0100
From: Maxime Ripard <mripard@redhat.com>
To: Dave Airlie <airlied@gmail.com>, 
	Simona Vetter <simona.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Matthew Brost <matthew.brost@intel.com>, 
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-misc-fixes
Message-ID: <20260305-ludicrous-quirky-raven-7cdafd@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="ylij2qs72s7ecmod"
Content-Disposition: inline
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
X-Rspamd-Queue-Id: DDD5520D37A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.91 / 15.00];
	SIGNED_PGP(-2.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:airlied@gmail.com,m:simona.vetter@ffwll.ch,m:jani.nikula@linux.intel.com,m:joonas.lahtinen@linux.intel.com,m:tursulin@ursulin.net,m:rodrigo.vivi@intel.com,m:tzimmermann@suse.de,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:ogabbay@kernel.org,m:intel-gfx@lists.freedesktop.org,m:intel-xe@lists.freedesktop.org,m:dim-tools@lists.freedesktop.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch];
	FORGED_SENDER(0.00)[mripard@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action


--ylij2qs72s7ecmod
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: [PULL] drm-misc-fixes
MIME-Version: 1.0

Hi Dave, Sima,

Here's this week drm-misc-fixes PR.

Maxime

drm-misc-fixes-2026-03-05:
A return type fix for ttm, a display fix for solomon, several misc fixes
for amdxdna, a DSI clock rate fix for rz-du, a uapi fix for syncobj, a
possible build failure fix for dma-buf, a doc warning fix for sched, a
build failure fix for ttm tests, and a crash fix when suspended for
nouveau.
The following changes since commit 75c151ceaacf5ca8f2f34ebf863d88002fb12587:

  accel/amdxdna: Use a different name for latest firmware (2026-02-25 13:51:31 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2026-03-05

for you to fetch changes up to 8f3c6f08ababad2e3bdd239728cf66a9949446b4:

  nouveau/dpcd: return EBUSY for aux xfer if the device is asleep (2026-03-04 22:08:01 +0100)

----------------------------------------------------------------
A return type fix for ttm, a display fix for solomon, several misc fixes
for amdxdna, a DSI clock rate fix for rz-du, a uapi fix for syncobj, a
possible build failure fix for dma-buf, a doc warning fix for sched, a
build failure fix for ttm tests, and a crash fix when suspended for
nouveau.

----------------------------------------------------------------
Chris Brandt (1):
      drm: renesas: rz-du: mipi_dsi: Set DSI divider

Dave Airlie (1):
      nouveau/dpcd: return EBUSY for aux xfer if the device is asleep

Francesco Lavra (1):
      drm/solomon: Fix page start when updating rectangle in page addressing mode

Isaac J. Manjarres (1):
      dma-buf: Include ioctl.h in UAPI header

Julian Orth (1):
      drm/syncobj: Fix handle <-> fd ioctls with dirty stack

Lizhi Hou (3):
      accel/amdxdna: Fill invalid payload for failed command
      accel/amdxdna: Fix NULL pointer dereference of mgmt_chann
      accel/amdxdna: Fix major version check on NPU1 platform

Maarten Lankhorst (1):
      drm/ttm/tests: Fix build failure on PREEMPT_RT

Tvrtko Ursulin (1):
      drm/ttm: Fix ttm_pool_beneficial_order() return type

Yujie Liu (1):
      drm/sched: Fix kernel-doc warning for drm_sched_job_done()

 drivers/accel/amdxdna/aie2_ctx.c               | 23 ++++++++--------------
 drivers/accel/amdxdna/aie2_message.c           | 21 +++++++++++++++-----
 drivers/accel/amdxdna/aie2_pci.c               |  7 ++-----
 drivers/accel/amdxdna/aie2_pci.h               |  1 +
 drivers/accel/amdxdna/amdxdna_ctx.c            | 27 ++++++++++++++++++++++++++
 drivers/accel/amdxdna/amdxdna_ctx.h            |  3 +++
 drivers/accel/amdxdna/npu1_regs.c              |  2 +-
 drivers/gpu/drm/drm_syncobj.c                  |  4 ++--
 drivers/gpu/drm/nouveau/nouveau_connector.c    |  3 +++
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 16 ++++++++++++++-
 drivers/gpu/drm/scheduler/sched_main.c         |  1 +
 drivers/gpu/drm/solomon/ssd130x.c              |  6 ++----
 drivers/gpu/drm/ttm/tests/ttm_bo_test.c        |  4 ++--
 drivers/gpu/drm/ttm/ttm_pool_internal.h        |  2 +-
 include/uapi/linux/dma-buf.h                   |  1 +
 15 files changed, 85 insertions(+), 36 deletions(-)

--ylij2qs72s7ecmod
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaak6NgAKCRAnX84Zoj2+
dhbSAYDiK+Tlgc4M1b78/SsyoMZnUj9Ar7Ng0Xl9zLTTzyeb6ppi2/x1Tos5HxSG
xAjONRYBgJO8bjLZzhy+E0A12Jl84j8jchkWzfP8dtTxmSxFaDNO/WduyyqBIR/t
HjKu7W6gMQ==
=5wx3
-----END PGP SIGNATURE-----

--ylij2qs72s7ecmod--

