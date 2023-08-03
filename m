Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7F676E20C
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 09:39:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AAC510E5BC;
	Thu,  3 Aug 2023 07:39:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44E4B10E5B5
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 07:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691048368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=ux6/F/8zNxcMXbZYyvs2PsfvsSCrOuLEm40mTn4N4jg=;
 b=YfHFYc6c5GeuWl2XO3rj+J1X3C/gFMplRwzWyEcX8h408x1EmHqmDo/P22SwkIIoKqd5Yo
 hizlHaHZ+h2KcU3LhacMXs3GMpuQXmxi8UnHos4xpsqs9eeV2faH+7XLV80sAjVacfachh
 DqQ+3Z2/VFTxp9FAZsfj+FwG88STYlA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-327-pSXFOvSZMLGRh1OcNAhsaw-1; Thu, 03 Aug 2023 03:39:26 -0400
X-MC-Unique: pSXFOvSZMLGRh1OcNAhsaw-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-31785455660so395788f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Aug 2023 00:39:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691048365; x=1691653165;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ux6/F/8zNxcMXbZYyvs2PsfvsSCrOuLEm40mTn4N4jg=;
 b=f94NAa4YQV1bjHd9FGim9QgIl+xuF48I6pabYMP48WdFU/lO6yWHRkFbEJ9TQtARws
 R6CzHiB67J+tfhT8NCiReeYyq8cLlKqLgeoAVTSMQy8Q+42uiickVdiRvZ4yhOlTTVFW
 LEbAAvWXOvs9iiRzF7E9vVS7hKWTkS4oA2qXzIiHQd1eYcl1RZ0Pmokp18743vNUQOdh
 +Xer6MMIi92oh2lZWibfmuYbsx/asY5gOIDbXonKO0Qlx8HB8YQzsITrAKZBh6gwsijm
 Yc4SmzUiRbIGAVvHXKIekYMEq6EvXHF984iiWb0pVKdHTNQFC1FiF1Wes6e7UPiTL6sW
 U0rA==
X-Gm-Message-State: ABy/qLZjFiSVMe16kHltMEs/v0avdNdKz/Wl8CcINVBoAf6SBU4VIrjz
 KqfGxTqAygoPpYjeoADOEcs6h2Csf9JciHFk9oUujgL4vyIkEpG4Ab0VyD5VaTliXTugdOYzXrM
 trFFbz4Y+jPntEBHihEDZmEH2A3Mw
X-Received: by 2002:a5d:6387:0:b0:317:6992:855c with SMTP id
 p7-20020a5d6387000000b003176992855cmr6816949wru.19.1691048365487; 
 Thu, 03 Aug 2023 00:39:25 -0700 (PDT)
X-Google-Smtp-Source: APBJJlH0ZaqurtShCL2+B3g9cWGgJxZXiWQdLkYMbG/BPwu8oAiUd9ONd5l/QDkz4IO5o41rQhObOA==
X-Received: by 2002:a5d:6387:0:b0:317:6992:855c with SMTP id
 p7-20020a5d6387000000b003176992855cmr6816926wru.19.1691048365169; 
 Thu, 03 Aug 2023 00:39:25 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 l6-20020adfe586000000b0031416362e23sm21181185wrm.3.2023.08.03.00.39.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Aug 2023 00:39:24 -0700 (PDT)
Date: Thu, 3 Aug 2023 09:39:24 +0200
From: Maxime Ripard <mripard@redhat.com>
To: Dave Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <ztfogof2dhtlvjwe73mvd2jp5kbldhkkav7k5culuseqblwpti@qfobohwx3c3j>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="xcahitbmxezrjv7i"
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--xcahitbmxezrjv7i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Here's this week drm-misc-fixes PR

Maxime

The following changes since commit 39b1320e5dc2b707dfb5c25b0298ce9d4fc05aea:

  drm/fb-helper: Remove unused inline function drm_fb_helper_defio_init() (2023-07-25 20:38:37 +0200)

are available in the Git repository at:

  ssh://git.freedesktop.org/git/drm/drm-misc tags/drm-misc-fixes-2023-08-03

for you to fetch changes up to c71b7aa8619a0c9700132d0733e33999fb614339:

  drm/panel: samsung-s6d7aa0: Add MODULE_DEVICE_TABLE (2023-08-02 10:56:50 +0200)

----------------------------------------------------------------
A NULL pointer dereference fix for TTM, a timings fix for imx/ipuv3 and
the addition of a MUDULE_DEVICE_TABLE for the samsung-s6d7aa0 panel.

----------------------------------------------------------------
Alexander Stein (1):
      drm/imx/ipuv3: Fix front porch adjustment upon hactive aligning

Guchun Chen (1):
      drm/ttm: check null pointer before accessing when swapping

Nikita Travkin (1):
      drm/panel: samsung-s6d7aa0: Add MODULE_DEVICE_TABLE

 drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c        | 2 +-
 drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c | 1 +
 drivers/gpu/drm/ttm/ttm_bo.c                  | 3 ++-
 3 files changed, 4 insertions(+), 2 deletions(-)

--xcahitbmxezrjv7i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZMtZrAAKCRDj7w1vZxhR
xT0eAQDd5R2mYSvbb62DliHnsaQKOXm3yl9mIemRxJhDhe3pAwEAhas3qZbaVkT8
MSJ4LLXdoKRva271997VTr3fFjExtgs=
=XLp8
-----END PGP SIGNATURE-----

--xcahitbmxezrjv7i--

