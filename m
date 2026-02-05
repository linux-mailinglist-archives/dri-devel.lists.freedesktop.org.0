Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDmHAHx9hGl/3AMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 12:22:36 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49789F1CFD
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 12:22:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1FF010E867;
	Thu,  5 Feb 2026 11:22:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="CVSvKeGw";
	dkim=pass (2048-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="oZOGtSUR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80A9F10E166
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Feb 2026 11:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1770290550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=PtoeRjJPoKPjVJ+o8aSXahjNNCmAGeSluGEium8wMe0=;
 b=CVSvKeGwLGwW41mh+JF6biZwwJ/hVHrmxcrOpgztrkEHxwZXAZh6kTiMbS7yGLzsyJ2zZp
 TkK69xliZIKt9/YdbbR1xT8ymGvKjDP1C2G4jYDb+LLY0Q0gEpjLYBNuDX0WQszFIY0I3A
 4PV/VORDBkGnm/DkGuXRJsQ/OnaRelM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-NbeWHUZUNq6f2_dvZjKznQ-1; Thu, 05 Feb 2026 06:22:27 -0500
X-MC-Unique: NbeWHUZUNq6f2_dvZjKznQ-1
X-Mimecast-MFC-AGG-ID: NbeWHUZUNq6f2_dvZjKznQ_1770290546
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-430f57cd2caso853752f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Feb 2026 03:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; s=google; t=1770290546; x=1770895346; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PtoeRjJPoKPjVJ+o8aSXahjNNCmAGeSluGEium8wMe0=;
 b=oZOGtSURXHzoWajFEvwZgpKivgJ4wKQwpLmPg3+xZV5BAw70e8qb5T/jduBxXtTyfa
 1U6NvjyHV5HoM2ATTFlex0yynR+ohbSjhRbgwVnqR0bYofBAo1H2i2bdParlmXq7wRfM
 sAbW6T3s/GNmr1tML6DqL09XXt9bH3wpV+9pZ4twb8rxp3AIxnBXXUNxQQ8E+iJ0RIGT
 HKxBLxUAdg/TAPbXMt0a1eU9WPHtzoA209agQ+FcYJTl+u8fbKjvvqnUYUohfP8pkcO6
 z+TIG1LXE3VQozgrlhCp0eEXXxCN3jnZWyZxkbCM27Q0tr9oz2Uw6sepaJz784MwkejZ
 jMPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770290546; x=1770895346;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PtoeRjJPoKPjVJ+o8aSXahjNNCmAGeSluGEium8wMe0=;
 b=ecscrSU0t2Api95OCq7FrL3OiClPQ3RbEU1lbk61NTOtiSV0k9+HmGViO2hKcmh4mV
 u08bXpoJQWmEQ+qwb+90F0F1enSAsj5Dkn/5hbqH+IPGJHPx7IrBTGK/GNr5fTUKhA7Y
 uqinOX5sgOtRaoCaByoiBD/IQO8DGcAWwM3F0Da6ffS2/CzqM73eVKg/pXDvj6md2KBN
 ZL/bJU3Gz2QGi0AUB75V51KbU2LVUfDj6vkW1JbR4oXMcB6fnQK6R3KToj9VDSkbNHZB
 tpSEx693F/Bb1fhHrHiSXatsCCPWDPVXvolzd1msykhWmXubxG9ZwG6RsV1He1AkJF8M
 kaTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfbDJkAjaHi/5jEusToucny15eVGQw0GzMlR2xwxz6DxQpg813QnSAdj/qe4J487+dcRaJgEla/Os=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw//fagE4nPLCTyiOzqK380PhYHkoDTflL8XYWymibBiAmZGXqa
 KQ+Sa2c1BdK4hU3BZytLTMonSXraxZLL0OwkvS9xtfYzKDsQ0VPoja6AcBypoD7XDv/X9AcXu8x
 Z57xTggULmCnZlkFwfSDI7hAF8nFIvEQAxRCaoBS736z+qnLmuMSkAJjeDYCtko2+d7r7kA==
X-Gm-Gg: AZuq6aJB+oEHHybIcJxDNvZYE5EyANNZD4pQ91UUx21Nv1NcKhNXrOszO2LLupVN2Wd
 KGEyqjSzZa1Mix/cARicCUz7TYQrkPE6BPxvKv7g1AUxEn5mZaSsOdbw/gIAJ3qERG1z4Xs83VI
 xGMqTi/QtgN7yC9qi1oUYBIF5uNyVA6XYn90LYeN7kve4DY3RsJ0obxhg9Ne/Uyhax+Y+h4HkSj
 NagpQaJyMXyw12XGnn8zNRcpqiOPt/Otpfsd9x7X1klliph2u4/C/dATxpjx01pJj3wUDj1ETt1
 JSgJgwxT9S7Rh2mVDS9uIqs58p26QRwN1uxCm/uWlAwx7eLT9tCsRES3XL5xBw==
X-Received: by 2002:a05:6000:2909:b0:430:ff81:2961 with SMTP id
 ffacd0b85a97d-4361805d057mr9636926f8f.51.1770290546053; 
 Thu, 05 Feb 2026 03:22:26 -0800 (PST)
X-Received: by 2002:a05:6000:2909:b0:430:ff81:2961 with SMTP id
 ffacd0b85a97d-4361805d057mr9636872f8f.51.1770290545520; 
 Thu, 05 Feb 2026 03:22:25 -0800 (PST)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43617e38ec5sm14063139f8f.14.2026.02.05.03.22.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Feb 2026 03:22:24 -0800 (PST)
Date: Thu, 5 Feb 2026 12:22:24 +0100
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
Subject: [PULL] drm-misc-next-fixes
Message-ID: <20260205-refreshing-natural-vole-4c73af@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="ow64eandfwfxuszq"
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,gitlab.freedesktop.org:url]
X-Rspamd-Queue-Id: 49789F1CFD
X-Rspamd-Action: no action


--ow64eandfwfxuszq
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: [PULL] drm-misc-next-fixes
MIME-Version: 1.0

Hi Dave, Sima,

Here's this week drm-misc-next-fixes PR.

Maxime

drm-misc-next-fixes-2026-02-05:
Several fixes for amdxdna around PM handling, error reporting and
memory safety, a compilation fix for ilitek-ili9882t, a NULL pointer
dereference fix for imx8qxp-pixel-combiner and several PTE fixes for
nouveau
The following changes since commit db7e7ea838c916ee4cdf26bee126fd36f58295dc:

  drm/bridge: imx8qxp-pxl2dpi: Fix NULL pointer dereference in imx8qxp_pxl2dpi_bridge_destroy() (2026-01-27 12:22:22 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-next-fixes-2026-02-05

for you to fetch changes up to 69674c1c704c0199ca7a3947f3cdcd575973175d:

  accel/amdxdna: Move RPM resume into job run function (2026-02-04 13:08:48 -0800)

----------------------------------------------------------------
Several fixes for amdxdna around PM handling, error reporting and
memory safety, a compilation fix for ilitek-ili9882t, a NULL pointer
dereference fix for imx8qxp-pixel-combiner and several PTE fixes for
nouveau

----------------------------------------------------------------
Dave Airlie (3):
      nouveau/vmm: rewrite pte tracker using a struct and bitfields.
      nouveau/vmm: increase size of vmm pte tracker struct to u32 (v2)
      nouveau/vmm: start tracking if the LPT PTE is valid. (v6)

Liu Ying (1):
      drm/bridge: imx8qxp-pixel-combiner: Fix bailout for imx8qxp_pc_bridge_probe()

Lizhi Hou (6):
      accel/amdxdna: Hold mm structure across iommu_sva_unbind_device()
      accel/amdxdna: Stop job scheduling across aie2_release_resource()
      accel/amdxdna: Remove hardware context status
      accel/amdxdna: Fix incorrect error code returned for failed chain command
      accel/amdxdna: Fix incorrect DPM level after suspend/resume
      accel/amdxdna: Move RPM resume into job run function

Nathan Chancellor (1):
      drm/panel: ilitek-ili9882t: Remove duplicate initializers in tianma_il79900a_dsc

Zishun Yi (1):
      accel/amdxdna: Fix memory leak in amdxdna_ubuf_map

 drivers/accel/amdxdna/aie2_ctx.c                   | 48 +++++--------
 drivers/accel/amdxdna/aie2_message.c               |  3 +
 drivers/accel/amdxdna/aie2_pm.c                    |  3 +
 drivers/accel/amdxdna/aie2_smu.c                   |  2 -
 drivers/accel/amdxdna/amdxdna_ctx.h                |  5 --
 drivers/accel/amdxdna/amdxdna_pci_drv.c            |  3 +
 drivers/accel/amdxdna/amdxdna_pci_drv.h            |  1 +
 drivers/accel/amdxdna/amdxdna_ubuf.c               | 10 ++-
 .../gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c    |  2 +-
 drivers/gpu/drm/nouveau/nouveau_drv.h              |  4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c      | 82 ++++++++++++++--------
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h      | 16 +++--
 drivers/gpu/drm/panel/panel-ilitek-ili9882t.c      |  4 --
 13 files changed, 103 insertions(+), 80 deletions(-)

--ow64eandfwfxuszq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaYR9bwAKCRAnX84Zoj2+
dpccAYC3hibmSRRvXuB0MgqO2qrGhihntcn/vNIF9FTLWdoMiuza11H9Sf2enr/p
64XqztsBgPiWWrzdmLtzUQcMzU815Y5DRYJA8zfX+7f/fPe+Q1JI5/uHqLDwpRZO
1SiTu+ZY6Q==
=rkc7
-----END PGP SIGNATURE-----

--ow64eandfwfxuszq--

