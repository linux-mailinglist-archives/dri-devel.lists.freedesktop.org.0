Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6OLbOkUhe2mCBgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 09:58:45 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A01CEADE3C
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 09:58:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4C7F10E82D;
	Thu, 29 Jan 2026 08:58:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="UxBW1H/d";
	dkim=pass (2048-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="OEwC98oI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76EB510E82D
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 08:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1769677121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=tXPLi5MPleV0XT1GzNz4vZO6yU1p82vu1eMa85GiDrc=;
 b=UxBW1H/dac+jT5u1zkJ6RvZGXQMjEbbZ/CjDQtk5HsjLVIh7z26GKH4uaeT5BhA3OeAR1F
 TO0n1AfN0wYFx/97IDR0zT9stDphz8D1bVmuejIaIHnkshR32oPxZOKQD3NBzvUFwdCjN9
 fjyZcay30Sg/xTm3kCYAHYK4MFfCLkI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-472-JZ4kZEfpNGK3ZSv1hwUT9g-1; Thu, 29 Jan 2026 03:58:39 -0500
X-MC-Unique: JZ4kZEfpNGK3ZSv1hwUT9g-1
X-Mimecast-MFC-AGG-ID: JZ4kZEfpNGK3ZSv1hwUT9g_1769677119
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-48057c39931so9353605e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 00:58:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; s=google; t=1769677118; x=1770281918; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tXPLi5MPleV0XT1GzNz4vZO6yU1p82vu1eMa85GiDrc=;
 b=OEwC98oIE/gmRH6G5Yz5N4/xmW52WArLT00m9oHfAMDPUrinRCQDO7tUIjEvxlUG4C
 Yb0NwD6CuA5PnL2MSg86xVlLTsQYK9a4wFwZh9sPF4foetv4+W7DBBBzavy8gsobNoa4
 LPJJ/Ob47kSP5kVEMa14SXiWa8EpTJITyda+G891Gz7eq/GNo/pvmRiS2SYqrfQwXlOm
 W9JkSMmuZlCdkupYqly6kmQzJam/bvGCz9Trzy2kOl3f6WRBS6EViuGuj//AxPNj6QlK
 Q5Hc8hJvI4DNjfnjz6B7MRCsIEYTva4pLpeiZ2l+U/VWJPFN8dS2sJkODs6Yn0jew9Yg
 q6Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769677118; x=1770281918;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tXPLi5MPleV0XT1GzNz4vZO6yU1p82vu1eMa85GiDrc=;
 b=pTT69INLc1O6w81a+VdSIHxJE0EYbU+cwoXT5iwCmI4Y3ImDLsqtbTiHSKyu0KObxi
 vQXGSLwW2itUfyNXxg9mBTgZ2qGb/7lLUdAXOSi1vx5y9SGLVW15vWpDgkvWlZ5hSIwm
 wKfN3HM+xDMWJSpAehvN/FOF+2Qke5jW0Q57jrq5mFSfHFMuMSzYOpa+7+8jDDEfnAFF
 3qu7fyzmzK/HnUm10YOMmxCjTP7UETAjX56TIaFvUmTm6+BvuGgpi6zQDq6DodkQRkjG
 PD/rq22cab54FfllXnXlN2g0xzoh8O6vCtfSCupUomzjrR0hoy8BYJWyYhLv6qUUfcEY
 L61A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXl0EkQti1sSW/j2ggKtcgztR7vXKLk5SHgEVw4wL2DuoNGPjFjgHMVwLwZHtuie7Os3q6Sm2ZiYvk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxCqrQiT1oTEu7jO50B5ToilBjvmENNXbNr13cZRehZfuPS0lYz
 uqI4chenaKsCeHFggz7adqUnTepEbReplwOhnLFcLNazzUkT5PDpi6ioYcoAPI4LRpSc9CHec0B
 ydVkdO48/eCE4mYQXDwkQhVVeJ118j1yM+uagpuGShHb2eUaMD0eyPPsHNiqsDlGN7nabWQ==
X-Gm-Gg: AZuq6aKQmqOPmmKBHy1/ihTKkrX8txELzvUD7cedluH5iwAqvBpFV6wGo3s2/BfLqyZ
 1MHknIC916m+YkHRkl9UdHuJQshE++IKyn+2ntg5NM1eNpGuZksrJnVvUhu2Kw3zsKPBFNi03sD
 bVJrQji/DFdKfhuDeoV/NIc+Ck/DNnSFGoss5PfuXQipylAZPCXILvxLF64RKp/0/C6pMpGjtBx
 1JGo3H/Yers88OZybEWWBG+DuKsWlToIByfcVnpzR0Vyf2VIW16HzB1NOt2Np8+GA/rww7+A7nX
 84OPirq4PDuYl6eBR3TI6Ut5Ktu9pg24CyarZaPr9Jdr27iWJjI5icBwRud7RQ==
X-Received: by 2002:a05:600c:820c:b0:47b:de05:aa28 with SMTP id
 5b1f17b1804b1-48069c0e172mr100786445e9.2.1769677118612; 
 Thu, 29 Jan 2026 00:58:38 -0800 (PST)
X-Received: by 2002:a05:600c:820c:b0:47b:de05:aa28 with SMTP id
 5b1f17b1804b1-48069c0e172mr100786155e9.2.1769677118181; 
 Thu, 29 Jan 2026 00:58:38 -0800 (PST)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-481a5d31650sm5802175e9.4.2026.01.29.00.58.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jan 2026 00:58:37 -0800 (PST)
Date: Thu, 29 Jan 2026 09:58:37 +0100
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
Message-ID: <20260129-efficient-jerboa-of-ecstasy-822832@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="qzorfjkesxyen2l3"
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: A01CEADE3C
X-Rspamd-Action: no action


--qzorfjkesxyen2l3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: [PULL] drm-misc-next-fixes
MIME-Version: 1.0

Hi,

Here's this week drm-misc-next-fixes PR.

Maxime

drm-misc-next-fixes-2026-01-29:
Two fixes for NULL pointer dereference in imx8 following the bridge
refcounting conversions, and one for the bridge connector following the
HDMI audio reworks.
The following changes since commit b2c6627e406d00bc53903ff6204aabb0c6a22b1a:

  Merge tag 'drm-misc-next-2026-01-22' of https://gitlab.freedesktop.org/drm/misc/kernel into drm-next (2026-01-23 12:45:15 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-next-fixes-2026-01-29

for you to fetch changes up to db7e7ea838c916ee4cdf26bee126fd36f58295dc:

  drm/bridge: imx8qxp-pxl2dpi: Fix NULL pointer dereference in imx8qxp_pxl2dpi_bridge_destroy() (2026-01-27 12:22:22 +0100)

----------------------------------------------------------------
Two fixes for NULL pointer dereference in imx8 following the bridge
refcounting conversions, and one for the bridge connector following the
HDMI audio reworks.

----------------------------------------------------------------
Dmitry Baryshkov (1):
      drm/display: bridge_connector: move audio_infoframe checks to OP_HDMI

Liu Ying (2):
      drm/bridge: imx8qxp-ldb: Fix NULL pointer dereference in imx8qxp_ldb_bridge_destroy()
      drm/bridge: imx8qxp-pxl2dpi: Fix NULL pointer dereference in imx8qxp_pxl2dpi_bridge_destroy()

 drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c       | 7 +++++--
 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c   | 3 +++
 drivers/gpu/drm/display/drm_bridge_connector.c | 9 ++++++---
 3 files changed, 14 insertions(+), 5 deletions(-)

--qzorfjkesxyen2l3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaXshPAAKCRAnX84Zoj2+
dt5gAX9pLQKJqPi71NBJ0MlwXV8Fw2qlSyadbcBKrNT6zVmvePwu1VujKc72vdbK
PGa8m1UBfihH1CZO4n4ggv7HJw2uTr/I6jE1EJKhPaEFh8p56JbOMM/9ySGzgoHY
9jcd7C9RUg==
=5QvF
-----END PGP SIGNATURE-----

--qzorfjkesxyen2l3--

