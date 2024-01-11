Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6FF82ABA5
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 11:11:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C94AB10E866;
	Thu, 11 Jan 2024 10:11:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5613110E818
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 10:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1704967902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=q1U051qfVVvOpDYruWIoTalq2OARTCsiq7Vq2e152Zs=;
 b=IQ1HmPS1EOsHEDoSfW1FzHnZTYxa8NMyFde42NtubMwocc67a52LT/x8V06hwI9BfzwQuL
 ZaCan9xFJc1ZXM387AZhYO1fsUV4w5dGrP+Ndhy6qsJYhK3qfGrpnAbnYg0HHkdFLmnz1D
 AAB9AXpCruTMOjTeq5qdGoCIxb1nF5Q=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-97-E_9kunAdNOahJVvibS9WeQ-1; Thu, 11 Jan 2024 05:11:39 -0500
X-MC-Unique: E_9kunAdNOahJVvibS9WeQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-40e541ddf57so16126105e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 02:11:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704967898; x=1705572698;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=q1U051qfVVvOpDYruWIoTalq2OARTCsiq7Vq2e152Zs=;
 b=Oce9ctGaBGxR2c7HeLCoRHYpQn3nKTS5S2NYqykMXt/ILh8FKsbHz8Q9M6ec3d/MsR
 FNAYbGSl0v7qjvgXorNvM/298b/Leh1dLwVTFvf2sl2gEf1UbIDyVOe7FpGhF+GA62PY
 JykF3nckuB1gpxosbC9BNoRuajJdsZ6RPDK2v5DACoMCgTKoWamyRmIyU89/9kv5iI7T
 FQyN0FiKGGXMsgXQxRw+pn5LYnIfoCXLI2dDp51qz5KQf5vlJHsBnrxl6TMJyzv2LRjo
 ToqkD7UFAwefI60c5pfM4LlvHZBIWpC4yh4PzrSgp6CFv8w4+0o/pmfpuwqt8pgnYXuQ
 Fvtw==
X-Gm-Message-State: AOJu0Yyz2VQ5GotAvJQdxMsAPT1ziskjUa08bDU6qTA56Lei3iEBBklG
 umbUP1UPoI7TjIm92oJlvwqyfrtG6wk2zUsIzDhIyNIDVnIX/obFEjMol3dtinO1lM92O5SZUaI
 lqZFNUCYPHJaT6q5O4YdgBqIultUBQxoYHZTO
X-Received: by 2002:a05:600c:1384:b0:40e:4990:89a9 with SMTP id
 u4-20020a05600c138400b0040e499089a9mr283554wmf.125.1704967898658; 
 Thu, 11 Jan 2024 02:11:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGQOrl0/x7BMHK1cASBEoKt7rxJsF5rZd6e6W5v1lrVZmLftXObkqlbWQkUWk95pBTtKZquOQ==
X-Received: by 2002:a05:600c:1384:b0:40e:4990:89a9 with SMTP id
 u4-20020a05600c138400b0040e499089a9mr283535wmf.125.1704967898342; 
 Thu, 11 Jan 2024 02:11:38 -0800 (PST)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 je6-20020a05600c1f8600b0040d8d11bf63sm1311154wmb.41.2024.01.11.02.11.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jan 2024 02:11:38 -0800 (PST)
Date: Thu, 11 Jan 2024 11:11:37 +0100
From: Maxime Ripard <mripard@redhat.com>
To: Dave Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next-fixes
Message-ID: <warlsyhbwarbezejzokxvrpnmvoaajonj6khjobvnfrhttrsks@fqoeqrjrct6l>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="u7ubydzr4xswh6nr"
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


--u7ubydzr4xswh6nr
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Here's this week drm-misc-next-fixes PR.

Maxime

drm-misc-next-fixes-2024-01-11:
A fix for the v3d register readout, and two compilation fixes for
rockchip.
The following changes since commit eee706839333ec0643f1b4898a37588025bf4cb5:

  drm/imagination: pvr_device.h: fix all kernel-doc warnings (2024-01-02 11=
:50:05 +0100)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-fixes-2024-=
01-11

for you to fetch changes up to 89fe46019a62bc1d0cb49c9615cb3520096c4bc1:

  drm/v3d: Fix support for register debugging on the RPi 4 (2024-01-09 14:2=
1:47 -0300)

----------------------------------------------------------------
A fix for the v3d register readout, and two compilation fixes for
rockchip.

----------------------------------------------------------------
Cristian Ciocaltea (2):
      drm/rockchip: vop2: Drop superfluous include
      drm/rockchip: vop2: Drop unused if_dclk_rate variable

Ma=EDra Canal (1):
      drm/v3d: Fix support for register debugging on the RPi 4

 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c |  4 +---
 drivers/gpu/drm/v3d/v3d_debugfs.c            | 20 ++++++++++----------
 2 files changed, 11 insertions(+), 13 deletions(-)

--u7ubydzr4xswh6nr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZZ++2QAKCRDj7w1vZxhR
xZVkAP41KaQ7V6SVZJqPsQS+XTrTVPwAN+M6oZV4+QTqki2+XAD/WWjvF4iyIqPy
c8ztIkCYVnDypPqV/fCqt/iTxVYYMw4=
=5wmL
-----END PGP SIGNATURE-----

--u7ubydzr4xswh6nr--

