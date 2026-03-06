Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDnkKhF3qmlcSAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 07:41:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 106AC21C25C
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 07:41:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5855610E386;
	Fri,  6 Mar 2026 06:41:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="f6jadTn4";
	dkim=pass (2048-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="LcSe5VFQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0728910E1D2
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 06:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772779275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=MBTMJTT82PS0Pu/z8VlhrxomReyPLpqBl+fqlhabERY=;
 b=f6jadTn4IiKopJHu25+qY47DMJQMox15n7OkAEWRZWcbbe4MNju1Bnxv2o6Er78cw1tYDY
 NuqJrFmX+C7yX2sfVhSfbIsYe8jEmdf9oOYCUi5rRO88Z4UN13wDUAj13YyE5TV4J4S1Fl
 i6183UH/TZdZhkXLIOVbl79smAs2smM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-64-YbCY4xA9NzamzTvmyFj_ug-1; Fri, 06 Mar 2026 01:41:14 -0500
X-MC-Unique: YbCY4xA9NzamzTvmyFj_ug-1
X-Mimecast-MFC-AGG-ID: YbCY4xA9NzamzTvmyFj_ug_1772779273
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4832c4621c2so96503275e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2026 22:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; s=google; t=1772779273; x=1773384073; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MBTMJTT82PS0Pu/z8VlhrxomReyPLpqBl+fqlhabERY=;
 b=LcSe5VFQLk58/RzrOg/fPe3zRaieLQoS1DaWsCjRC9CoAc7cVPdAftdmwn4V7YR3um
 ikj4KQy3mj/oU/byOujYl/8oDQPrMjP0aq1INAxxq+G04D1xV0mq8AJ1zfvDkU15nVyx
 A67ET8I7NdeH4tzk0bNIdsOseY6NPQPSDOMIqFP8sHpD0igqjLtgyYJkR4EV8ehun8H+
 a2FBFbO4gAsz2vIPaqww+djF2AB2SY8NSk6FiFYGrbTCgZfb+Zdg8Sx0MnTYU3jO1s6p
 FsoiWRO48dRvu+qsX499XL7QhhDk6HYg1Hfjde+SZejHjSk8ppRvh/K3zNI0+z2rqNr7
 QlSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772779273; x=1773384073;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MBTMJTT82PS0Pu/z8VlhrxomReyPLpqBl+fqlhabERY=;
 b=fSz6atRpgJqthIPNWAAKh1A1dx/ZBsYIUQ2XVdMzkqrJLfCD3rbSVpebJRbFR+7RPO
 uNrgNCilg9AMAfPnxxZExwN4SNxeBmfGVighd9u1xoGPJH7vg5bI0vixlsztuM3e7xXL
 ifPk8FcNGuJUF3NOipDZzMXFUE0XXp7ggW/NyzwDzTsQWrFyMeEtv2wk/ZXP1vfAmovY
 v9CdufgC1H5Om6nwqK/3BljTclYshC3BPfgzBvSBYqDpTS58akIsnskd+admKly/bWvn
 7rT02JcBTBRKgY/3+O20UEjyAslc1mZvZhVTQC/caI6M+/cIqlf9Ia9amvym7X/beMeN
 BNwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPRULMUyq7GqDLXR0N1DfI91CJrDpvnBn+k8LXkyVlyq42PkFghIhoRQyUSVjJXCGSFXO05h3PXpo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwEefcOdOlDzT7/LrA+TpVHqYOFinK6e9arWF8O/LlHA7jDPmYp
 IXx5jUFsiz3Dc8cjekOTp7j/hJXQtmTp+meCIMd6aXPj0nUqjfuDBxCOvKUNAnAOVnjIw6Es4+o
 20TiR4BrgYTY5oZKPqRqnxwX27206ex2DrNDkti6EveG46TjdlRRJpZdOCnRs/st2jMd2XA==
X-Gm-Gg: ATEYQzx71gm/e0au2On5eZS/x5JQtCWS8D26pGtDYtiQmEpl1s0XibGWkT+PZ9MvnZG
 PlQn67pZZSp0hH1DnpNdOLcvCGQml9Icd1g0XKzOS8EX/813ZObCwJVJo/06+Ro/kMsDtlPxvIp
 RqBhML1aAMOMTED39YjxDuwadKveF41rWHpIE3PsnMoRVWkBPJT3ieAqrsE7vHguUy5M/PIQHvZ
 WsPcddAxgjo/AVFkreXpAARdu84kHS4RUiin2msqdzedn28/xWJtgyyW4orJluJSZUA1IdlWzsp
 QqH3Bj+phchJD7gF1Tr9710BwHKmZ/P5kVgsUKwB3oKoo169vBzVBxY+NPbNCzCUdlLg93Ylpw=
 =
X-Received: by 2002:a05:600c:3b0c:b0:477:7b16:5fb1 with SMTP id
 5b1f17b1804b1-48526918939mr14036775e9.7.1772779272531; 
 Thu, 05 Mar 2026 22:41:12 -0800 (PST)
X-Received: by 2002:a05:600c:3b0c:b0:477:7b16:5fb1 with SMTP id
 5b1f17b1804b1-48526918939mr14036375e9.7.1772779271987; 
 Thu, 05 Mar 2026 22:41:11 -0800 (PST)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485245dbf04sm10997855e9.14.2026.03.05.22.41.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2026 22:41:11 -0800 (PST)
Date: Fri, 6 Mar 2026 07:41:10 +0100
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
Message-ID: <20260306-grumpy-pegasus-of-witchcraft-6bd2db@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="kz3gnqntjfip7uxz"
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
X-Rspamd-Queue-Id: 106AC21C25C
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action


--kz3gnqntjfip7uxz
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: [PULL] drm-misc-fixes
MIME-Version: 1.0

Hi Sima, Dave,

Here's a new drm-misc-fixes to fast-track the syncobj revert.

Maxime

drm-misc-fixes-2026-03-06:
Another early drm-misc-fixes PR to revert the previous uapi fix sent in
drm-misc-fixes-2026-03-05, together with a UAF fix in TTM, an argument
order fix for panthor, a fix for the firmware getting stuck on
resource allocation error handling for amdxdna, and a few fixes for
ethosu (size calculation and reference underflows, and a validation
fix).
The following changes since commit 75c151ceaacf5ca8f2f34ebf863d88002fb12587:

  accel/amdxdna: Use a different name for latest firmware (2026-02-25 13:51:31 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2026-03-06

for you to fetch changes up to 021f1b77f70d62351bba67b050b8d784641d817f:

  accel: ethosu: Handle possible underflow in IFM size calculations (2026-03-05 15:21:17 -0600)

----------------------------------------------------------------
Another early drm-misc-fixes PR to revert the previous uapi fix sent in
drm-misc-fixes-2026-03-05, together with a UAF fix in TTM, an argument
order fix for panthor, a fix for the firmware getting stuck on
resource allocation error handling for amdxdna, and a few fixes for
ethosu (size calculation and reference underflows, and a validation
fix).

----------------------------------------------------------------
Akash Goel (1):
      drm/panthor: Correct the order of arguments passed to gem_sync

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

Lizhi Hou (4):
      accel/amdxdna: Fill invalid payload for failed command
      accel/amdxdna: Fix NULL pointer dereference of mgmt_chann
      accel/amdxdna: Fix major version check on NPU1 platform
      accel/amdxdna: Split mailbox channel create function

Maarten Lankhorst (2):
      drm/ttm/tests: Fix build failure on PREEMPT_RT
      Revert "drm/syncobj: Fix handle <-> fd ioctls with dirty stack"

Rob Herring (Arm) (3):
      accel: ethosu: Fix job submit error clean-up refcount underflows
      accel: ethosu: Fix NPU_OP_ELEMENTWISE validation with scalar
      accel: ethosu: Handle possible underflow in IFM size calculations

Thadeu Lima de Souza Cascardo (1):
      drm/ttm: Fix bo resource use-after-free

Tvrtko Ursulin (1):
      drm/ttm: Fix ttm_pool_beneficial_order() return type

Yujie Liu (1):
      drm/sched: Fix kernel-doc warning for drm_sched_job_done()

 drivers/accel/amdxdna/aie2_ctx.c               | 23 +++---
 drivers/accel/amdxdna/aie2_message.c           | 36 +++++++---
 drivers/accel/amdxdna/aie2_pci.c               | 66 +++++++++--------
 drivers/accel/amdxdna/aie2_pci.h               |  1 +
 drivers/accel/amdxdna/amdxdna_ctx.c            | 27 +++++++
 drivers/accel/amdxdna/amdxdna_ctx.h            |  3 +
 drivers/accel/amdxdna/amdxdna_mailbox.c        | 99 +++++++++++++-------------
 drivers/accel/amdxdna/amdxdna_mailbox.h        | 31 ++++----
 drivers/accel/amdxdna/npu1_regs.c              |  2 +-
 drivers/accel/ethosu/ethosu_gem.c              | 12 +++-
 drivers/accel/ethosu/ethosu_job.c              | 28 +++++---
 drivers/gpu/drm/nouveau/nouveau_connector.c    |  3 +
 drivers/gpu/drm/panthor/panthor_sched.c        |  9 +--
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 16 ++++-
 drivers/gpu/drm/scheduler/sched_main.c         |  1 +
 drivers/gpu/drm/solomon/ssd130x.c              |  6 +-
 drivers/gpu/drm/ttm/tests/ttm_bo_test.c        |  4 +-
 drivers/gpu/drm/ttm/ttm_bo.c                   | 11 ++-
 drivers/gpu/drm/ttm/ttm_pool_internal.h        |  2 +-
 include/uapi/linux/dma-buf.h                   |  1 +
 20 files changed, 234 insertions(+), 147 deletions(-)

--kz3gnqntjfip7uxz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaap3BgAKCRAnX84Zoj2+
dmI9AYDUmiFfUsIsj2U3URAGqZ6O3I1d+mBR/H0pOHlyfCrDWBudIsqlbnwERpWy
Q3oOMd8BgKh1s//puJCYmLkT+2L0A7g1bStPgDeThF6KTbyY70W3etZ8e/0k8284
6zHxkZJjnA==
=ozcz
-----END PGP SIGNATURE-----

--kz3gnqntjfip7uxz--

