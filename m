Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E678D797087
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 09:44:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 534C610E21C;
	Thu,  7 Sep 2023 07:44:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8ED910E05B
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Sep 2023 07:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694072678;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=P2lql2HG0KmUdTztc7rXyyrgq7Szgu4lMAR+05SwhrA=;
 b=P46HIwFNHx/cnB5bl5LcWnQi/y0BGSq1c88iLbNEjJOWbOZZd8t5JrKiaB6lJLtQsGryCf
 TjZa7/u0dzpFL9kJb1gz9Byu9OqzDHjZZ19U6j/LjiZR7/s5Luk9LF57KmoOTHFBNnGIOW
 TP+TzOaH4G8d6l9R1VtRXBi9TaG679E=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-513-j0oTtgVHNoCorA7j4bX8wQ-1; Thu, 07 Sep 2023 03:44:36 -0400
X-MC-Unique: j0oTtgVHNoCorA7j4bX8wQ-1
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-64943195f29so7699296d6.2
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Sep 2023 00:44:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694072675; x=1694677475;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=P2lql2HG0KmUdTztc7rXyyrgq7Szgu4lMAR+05SwhrA=;
 b=fsMUiuBOppfBWaAb6k6jtwg12hf2f0rxhvyLoOy4Lylt1sZxP8p6tiEDK3WW82fIz/
 Xplx/cR7ECNgcnIIcr8DFpjx7LzojZzZtL0pViSaBeHqihuZSg/SbMesqobXui3Mj+cs
 D8k8h6rAxHQM0S8wihuZB+IBcug4F/gpNuTe203EDifqbDhntsBWEBX10NVg8ZxPHvEZ
 en7vk/mS1pEKT03qX40c2qVST85x5npLMwxM+z24ec2qyQ13OWU+UhQI8+rfps+UBNWs
 hJckZhPSMdqTDtLA2DlpSTtgF7jmWGkXmg8oPFPf0+X2ntzuoaMR2o0foVQqxMytWFCF
 A32A==
X-Gm-Message-State: AOJu0YwZNXORgxNTpKs72GnsaTOA7a3HUvyaQ5WbEUUW0K5wN32dVjYt
 7SJn/n/p5rVqy+0+EDUmGCNakx1mll0379K/6DWBcv5b8pDIGNXbIvnxe/PpEn/yL5kkfNwz3VD
 JM/HE7XeRyKF563RN6bulenBpEZt4
X-Received: by 2002:a0c:e0d4:0:b0:655:81e4:aac4 with SMTP id
 x20-20020a0ce0d4000000b0065581e4aac4mr8904578qvk.42.1694072675748; 
 Thu, 07 Sep 2023 00:44:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEy7nem7oGjLOQnBj2IctAgYR0dYvrRPi05/CBV0fc0ZPxWM+t18S+40lSeUFMTxKywRL4VPA==
X-Received: by 2002:a0c:e0d4:0:b0:655:81e4:aac4 with SMTP id
 x20-20020a0ce0d4000000b0065581e4aac4mr8904569qvk.42.1694072675498; 
 Thu, 07 Sep 2023 00:44:35 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 z11-20020a0cf24b000000b006516780a0a5sm6099546qvl.117.2023.09.07.00.44.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Sep 2023 00:44:35 -0700 (PDT)
Date: Thu, 7 Sep 2023 09:44:33 +0200
From: Maxime Ripard <mripard@redhat.com>
To: Dave Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <w5nlld5ukeh6bgtljsxmkex3e7s7f4qquuqkv5lv4cv3uxzwqr@pgokpejfsyef>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="i3mwmexzb4sj24cq"
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


--i3mwmexzb4sj24cq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Here's this week drm-misc-fixes PR

Maxime

drm-misc-fixes-2023-09-07:
One doc fix for drm/connector, one fix for amdgpu for an crash when
VRAM usage is high, and one fix in gm12u320 to fix the timeout units in
the code
The following changes since commit f9e96bf1905479f18e83a3a4c314a8dfa56ede2c:

  drm/vmwgfx: Fix possible invalid drm gem put calls (2023-08-23 13:20:04 -0400)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2023-09-07

for you to fetch changes up to 7583028d359db3cd0072badcc576b4f9455fd27a:

  drm: gm12u320: Fix the timeout usage for usb_bulk_msg() (2023-09-04 10:00:57 +0200)

----------------------------------------------------------------
One doc fix for drm/connector, one fix for amdgpu for an crash when
VRAM usage is high, and one fix in gm12u320 to fix the timeout units in
the code

----------------------------------------------------------------
Jinjie Ruan (1):
      drm: gm12u320: Fix the timeout usage for usb_bulk_msg()

Lee Jones (1):
      drm/drm_connector: Provide short description of param 'supported_colorspaces'

Simon Pilkington (1):
      drm/amd: Make fence wait in suballocator uninterruptible

 drivers/gpu/drm/amd/amdgpu/amdgpu_sa.c |  2 +-
 drivers/gpu/drm/drm_connector.c        |  2 ++
 drivers/gpu/drm/tiny/gm12u320.c        | 10 +++++-----
 3 files changed, 8 insertions(+), 6 deletions(-)

--i3mwmexzb4sj24cq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZPl/YQAKCRDj7w1vZxhR
xXpvAQDNkfhZBTYGlqZlnFt64e6yFFkvMrHGtKRa7kkCDBd42AEA9LFNgvVxJfRS
AtHonSDpCo3ZpjOz4oXVpXc+TWTjngA=
=Qw8y
-----END PGP SIGNATURE-----

--i3mwmexzb4sj24cq--

