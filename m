Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 646A560E514
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 17:59:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4006610E20C;
	Wed, 26 Oct 2022 15:59:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 313ED10E20C
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Oct 2022 15:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666799983;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qgreuePZp+4AtHTNoAATRGXVf37qFz6VqTZ1TsIsSCk=;
 b=QWcc5rm9yCTUf1Ua3eohgJnSDlhFJPbXY9tf34N29kWqQsD7VUomKw3I9szjnrmyQgY8iE
 hRLBrT1TO3P7bEcvNKu3EFFAybN6ahbzG+X4lSRUQ41q6NesMeOGNLrgq8CV/s1ZtXWXuv
 Mziwcbg9yCzWbQOVoLUn/96O+Rz/7Yg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-591-KH7EaKPkMROZPPuRv6MOTQ-1; Wed, 26 Oct 2022 11:59:41 -0400
X-MC-Unique: KH7EaKPkMROZPPuRv6MOTQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 s3-20020a056402520300b0046262a46f88so1465926edd.5
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Oct 2022 08:59:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qgreuePZp+4AtHTNoAATRGXVf37qFz6VqTZ1TsIsSCk=;
 b=E2uI/nIq4eBo6UKXV6EIeH0/VIYVwz7gwDs7vybnCZ8PEuvvfkEQHal5ChQ2xvHnF1
 hRVmYduOlgSbKlWKLzGTQrLnzA/f/jxkJopJSwfhXP1csmXo6HEzY6CIQcet5aNptDzB
 fHK8kDA50xSU0inoHJRi5gMYTicGKKwS2yk1hlAZb6e2/jnk/vD+yy6Bxa5EaBQFampv
 DA5Veh+YkJb4xjXB3tsoCaDIt3/rUDBLV3DHL6Cu7LQgKrwVqQPz40DpXk2vEa2lmvLA
 woslRuCwa1CDp9QDlGd5P+59x/UOrTCKGHlRKk9yu4DjpSIQTnsvJMN3NzROi3RPbsT9
 cwdw==
X-Gm-Message-State: ACrzQf1Mvt8VRkmi0fvhzsS7qM5qJ0ws6WzMW7OYcE93fjR8tUgq208A
 cqVVDDrgUeQ3UUM8P31rzHllxnI7J7vY3JcBPCKlW/AEwwWJIl565/lf3tiy/PB7vnToaMNAiyL
 osX6G1n7EkPJYhO8nnZ2hSi5KWlzp
X-Received: by 2002:a17:907:6e18:b0:78d:b374:8989 with SMTP id
 sd24-20020a1709076e1800b0078db3748989mr37902978ejc.552.1666799980699; 
 Wed, 26 Oct 2022 08:59:40 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4nFY1b7F7PXIeIa9vbku1XcB89X6nlx28mnFIdln+HRp8pTaHGtsxr4DiRXOYLY2Ek4SMHlA==
X-Received: by 2002:a17:907:6e18:b0:78d:b374:8989 with SMTP id
 sd24-20020a1709076e1800b0078db3748989mr37902957ejc.552.1666799980484; 
 Wed, 26 Oct 2022 08:59:40 -0700 (PDT)
Received: from pollux.. ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 m19-20020a1709066d1300b0078d4c72e2cesm3119035ejr.44.2022.10.26.08.59.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 08:59:39 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org,
 liviu.dudau@arm.com, brian.starkey@arm.com
Subject: [PATCH drm-misc-next v3 0/5] drm/arm/malidp: use drm managed resources
Date: Wed, 26 Oct 2022 17:59:29 +0200
Message-Id: <20221026155934.125294-1-dakr@redhat.com>
X-Mailer: git-send-email 2.37.3
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
Cc: Danilo Krummrich <dakr@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This patch series converts the driver to use drm managed resources to prevent
potential use-after-free issues on driver unbind/rebind and to get rid of the
usage of deprecated APIs.

Changes in v2:
  - While protecting critical sections with drm_dev_{enter,exit} I forgot to
    handle alternate return paths within the read-side critical sections, hence
    fix them.
  - Add a patch to remove explicit calls to drm_mode_config_cleanup() and switch
    to drmm_mode_config_init() explicitly.

Changes in v3:
  - Remove patches to protect platform device bound resources with
    drm_dev_{enter,exit}, since this would leave the hardware enabled when
    regularly unloading the driver e.g. via rmmod.
    Instead do this in a later series, once we got drm_dev_unplug() in place
    to deal with a regular driver shutdown.

Danilo Krummrich (5):
  drm/arm/malidp: use drmm_* to allocate driver structures
  drm/arm/malidp: replace drm->dev_private with drm_to_malidp()
  drm/arm/malidp: crtc: use drmm_crtc_init_with_planes()
  drm/arm/malidp: plane: use drm managed resources
  drm/arm/malidp: remove calls to drm_mode_config_cleanup()

 drivers/gpu/drm/arm/malidp_crtc.c   |  7 ++-
 drivers/gpu/drm/arm/malidp_drv.c    | 69 +++++++++++------------------
 drivers/gpu/drm/arm/malidp_drv.h    |  2 +
 drivers/gpu/drm/arm/malidp_hw.c     | 10 ++---
 drivers/gpu/drm/arm/malidp_mw.c     |  6 +--
 drivers/gpu/drm/arm/malidp_planes.c | 32 ++++---------
 6 files changed, 48 insertions(+), 78 deletions(-)


base-commit: e1e7bc481d49c3e3ada11029ce0d9b85a0a539d7
-- 
2.37.3

