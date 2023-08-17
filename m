Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0673277F7DF
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 15:39:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E3EE10E48C;
	Thu, 17 Aug 2023 13:39:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17A2910E487
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 13:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692279542;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=Ty1oIhhQ7byU/Dm75CvlZO0hlYAOBNHBN71sN2Mt1b0=;
 b=X/eDmVgPeFixE8Iuw99I1yx8fWUVPbj3GE3+ZdjYkh1ku1OnIASvHJHrTZVtsI7165WDTR
 ctb9xhGAEx5jRr8BOh+9Fe+mwJva0rEIVYQXk0Z4Eu60djD/j6qh4yP7Be+dwpli2L5r1j
 /XiZHGdnPz8ooSyTvV+LWjN82szWV7s=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-120-xtTUtIJVNByNlyoO6OgjoA-1; Thu, 17 Aug 2023 09:39:00 -0400
X-MC-Unique: xtTUtIJVNByNlyoO6OgjoA-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-30e4943ca7fso4156909f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 06:39:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692279539; x=1692884339;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ty1oIhhQ7byU/Dm75CvlZO0hlYAOBNHBN71sN2Mt1b0=;
 b=iWKDdSS3Di5LL1Fh2H/tqTYccSCiC/9e/7KHg+34ya0K1nESNltp3xPIoS8uUudU1S
 omaaGNtG+s6Ey1n6GuY5iEb/mdpyLkfeqccxkyZhMhWLDEYgJtCcpxhvjaZnapFFM0+p
 6pOat0vnRHR7eK46UNqmVsEfLUsukv2CDRFQCSnw4hv5whfM0cg0MXGlYXnyI2TUj/gZ
 jFbBHFL/nuMo7Yj6mb7lsZl6mHkcA6M0QkQLXuo9g3VKjISd2mSIn3+swhLTXqnPUyZ9
 Uzt/unpVPNRurLTXFye1Aw/pXIVgOSwwV9udk5jTow2WExR9AF+P7BtlhayA4JToi8TN
 9Beg==
X-Gm-Message-State: AOJu0Yx+HKy1nJ3t4uVf1+HVk8LCdkiESVNC6jYEPAAUvVSpdK9EpbBp
 2XpNmNO+iFUjMkVjglyTxVFJJ33kL7fwOEMsXgJzJ/yrFo6v60aUOlJgciwJG8xBWRBHWP9CVpd
 zFectPh2kej4aRNlQZ8nkejSPoPdI
X-Received: by 2002:adf:ea85:0:b0:317:e025:5a5c with SMTP id
 s5-20020adfea85000000b00317e0255a5cmr3614260wrm.48.1692279539543; 
 Thu, 17 Aug 2023 06:38:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGF0S6oXPzXigKkIgiiy8ydq8OKsC2KvQccVh0tN+uQdMV+nUW6lm9Tb/tgSzkEoGmFwmuzVA==
X-Received: by 2002:adf:ea85:0:b0:317:e025:5a5c with SMTP id
 s5-20020adfea85000000b00317e0255a5cmr3614231wrm.48.1692279539180; 
 Thu, 17 Aug 2023 06:38:59 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 v9-20020a5d6b09000000b0031759e6b43fsm24838200wrw.39.2023.08.17.06.38.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Aug 2023 06:38:58 -0700 (PDT)
Date: Thu, 17 Aug 2023 15:38:58 +0200
From: Maxime Ripard <mripard@redhat.com>
To: Dave Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <3olqt33em5uhxzjbqghwcwnvmw73h7bxkbdxookmnkecymd4vc@7ogm6gewpprq>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="npc4dorxccvsv2oa"
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
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--npc4dorxccvsv2oa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Here's this week drm-misc-fixes PR

Maxime

drm-misc-fixes-2023-08-17:
One EPROBE_DEFER handling fix for the JDI LT070ME05000, a timing fix for
the AUO G121EAN01 panel, an integer overflow and a memory leak fixes for
the qaic accel, a use-after-free fix for nouveau and a revert for an
alleged fix in EDID parsing.
The following changes since commit 07dd476f6116966cb2006e25fdcf48f0715115ff:

  drm/shmem-helper: Reset vma->vm_ops before calling dma_buf_mmap() (2023-08-10 08:29:14 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2023-08-17

for you to fetch changes up to 50b6f2c8297793f7f3315623db78dcff85158e96:

  Revert "drm/edid: Fix csync detailed mode parsing" (2023-08-17 14:39:12 +0300)

----------------------------------------------------------------
One EPROBE_DEFER handling fix for the JDI LT070ME05000, a timing fix for
the AUO G121EAN01 panel, an integer overflow and a memory leak fixes for
the qaic accel, a use-after-free fix for nouveau and a revert for an
alleged fix in EDID parsing.

----------------------------------------------------------------
Dan Carpenter (1):
      accel/qaic: Clean up integer overflow checking in map_user_pages()

David Heidelberg (1):
      drm/panel: JDI LT070ME05000 simplify with dev_err_probe()

Jani Nikula (1):
      Revert "drm/edid: Fix csync detailed mode parsing"

Karol Herbst (1):
      drm/nouveau/disp: fix use-after-free in error handling of nouveau_connector_create

Luca Ceresoli (1):
      drm/panel: simple: Fix AUO G121EAN01 panel timings according to the docs

Pranjal Ramajor Asha Kanojiya (1):
      accel/qaic: Fix slicing memory leak

 drivers/accel/qaic/qaic_control.c              | 26 +++++++++++++------
 drivers/accel/qaic/qaic_data.c                 |  1 +
 drivers/gpu/drm/drm_edid.c                     | 29 ++++++---------------
 drivers/gpu/drm/nouveau/nouveau_connector.c    | 11 +++++---
 drivers/gpu/drm/panel/panel-jdi-lt070me05000.c | 36 ++++++++++----------------
 drivers/gpu/drm/panel/panel-simple.c           | 24 ++++++++---------
 include/drm/drm_edid.h                         | 12 +++------
 7 files changed, 63 insertions(+), 76 deletions(-)

--npc4dorxccvsv2oa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZN4i8gAKCRDj7w1vZxhR
xdH0AP9xBZc16miFgJD9TrIEAEkYnyVZUeDQndjvwVgKNvPdqQD+OODBo1V+OIJv
zC6igGNrt3FKh6g1H+BTIoYoYJAU0Q4=
=BvUL
-----END PGP SIGNATURE-----

--npc4dorxccvsv2oa--

