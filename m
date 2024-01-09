Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6177E8283D5
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 11:20:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8491B10E3DE;
	Tue,  9 Jan 2024 10:20:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27EFA10E3DE
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 10:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1704795644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8SIIXck5uwYvwPpJnTFzb6gmOuEum/JO9/k2N35WTjM=;
 b=UmG85CJ24W7LNNgH8PQnxEUoWhCNZsg1ZS85ebT0PXIVyU9xdWVHkRZ73SFldK8Q3OzNJD
 +zmJTsR0w03OYyPvVDubEHPMkVk9Hau7HybhqNWTGVTBMEYBPWfdx8bvmLOW9VkMxBD30Z
 Rl/V8ofwrbkWKi67UNUl9YALt4OVFFc=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-595-1_D4q3wiN2mrbrihg4k4vQ-1; Tue, 09 Jan 2024 05:20:43 -0500
X-MC-Unique: 1_D4q3wiN2mrbrihg4k4vQ-1
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7815b7f7a78so69182185a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jan 2024 02:20:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704795643; x=1705400443;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8SIIXck5uwYvwPpJnTFzb6gmOuEum/JO9/k2N35WTjM=;
 b=LyVXOJlPqJzIgsj+YIzCDa/5r0QcUlkKd4pbUas/2w7vp7vHFD3ODEXB87yM7XNP6r
 kCbeEKLb5VgODmpyPnK79jEH12+nrsZqZcU09nD52hJqqRzFotKuPUdX4MvgBDQaMZ7V
 Qoz6h6ozNiCk5SNstVWHn9z6FOIqX51G9Yv7e/afBnyGhAYloZwWgRvmTGGuAF9zjnL3
 rhATx9UznRLFeGUdiT3hsI8ck9FHuI+aYDsyazNJW6G4z9BOLPESgdB82aNQs7BFtVIz
 ZOTIP17/EbPdREICrtIUqPdqKeyprf+yzAZcqivLzcj5V7MtWJGnQuvLGwjGo6oOXxJH
 MGrQ==
X-Gm-Message-State: AOJu0YxyiWN5mOK2fhFbh1o6tz67pOWhVHRNx02Uge9j2RiVHM9i8neW
 dYkgBrgquTzhHN5U5J6EeGVDnPK8P2JgQxN8Gxdusz3DWWhzn/SaoTDCpW2mszuTDOYdmoOANCr
 tI//er4sUtxpF4wtyfEKMCJPjrgEupYHhqvv2
X-Received: by 2002:a05:620a:410a:b0:783:1077:714d with SMTP id
 j10-20020a05620a410a00b007831077714dmr10128966qko.7.1704795642829; 
 Tue, 09 Jan 2024 02:20:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGm98LGFsI95VtFsTojt3ky3TV9lUFR+SqWmfn+hfcm+azOazpPki9dG32RlcMzB3+1Pr17LA==
X-Received: by 2002:a05:620a:410a:b0:783:1077:714d with SMTP id
 j10-20020a05620a410a00b007831077714dmr10128942qko.7.1704795642563; 
 Tue, 09 Jan 2024 02:20:42 -0800 (PST)
Received: from pstanner-thinkpadt14sgen1.remote.csb
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 m24-20020ae9e018000000b00783217607d6sm679695qkk.115.2024.01.09.02.20.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 02:20:42 -0800 (PST)
From: Philipp Stanner <pstanner@redhat.com>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 0/2] drm/imx/dcss: implement region request and devres
Date: Tue,  9 Jan 2024 11:20:30 +0100
Message-ID: <20240109102032.16165-1-pstanner@redhat.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: linux-arm-kernel@lists.infradead.org, Philipp Stanner <pstanner@redhat.com>,
 NXP Linux Team <linux-imx@nxp.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dcss currently does not request its memory resource. This series adds
that request with devres. As we're at it, it also ports all the ioremaps
and associated allocations to devres.

I can build this, but I don't have the hardware available to test it. So
you might want to have a closer look.

P.

Philipp Stanner (2):
  drm/dcss: request memory region
  drm/imx/dcss: have all init functions use devres

 drivers/gpu/drm/imx/dcss/dcss-blkctl.c | 14 +++-----------
 drivers/gpu/drm/imx/dcss/dcss-ctxld.c  | 15 ++++-----------
 drivers/gpu/drm/imx/dcss/dcss-dev.c    | 18 +++++++++---------
 drivers/gpu/drm/imx/dcss/dcss-dpr.c    | 25 ++++++-------------------
 drivers/gpu/drm/imx/dcss/dcss-drv.c    | 12 +++---------
 drivers/gpu/drm/imx/dcss/dcss-dtg.c    | 23 ++++-------------------
 drivers/gpu/drm/imx/dcss/dcss-scaler.c | 22 ++++------------------
 drivers/gpu/drm/imx/dcss/dcss-ss.c     | 11 +++--------
 8 files changed, 36 insertions(+), 104 deletions(-)

-- 
2.43.0

