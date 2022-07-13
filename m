Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0AFB573199
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 10:55:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C510298852;
	Wed, 13 Jul 2022 08:55:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6274398852
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jul 2022 08:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657702506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dI6YVPovohaWrafIFhdI1Cj4BYIDUe0+jr5w6UInkNw=;
 b=NTHfC2L63ucC2x3mslB2wPcL7WOIHa2rQv8u73mCVU5tI5XlgrsHNHg28uB+WLrS0neJ6B
 CQ+9l/9R/Ordr8ylIZ8JbyqE9udzWBa2diVDDQiqXWgj4LVV8V6ak8Z1gNaCX6AOfhHQRj
 Lva9sO4uD7cipKUKbuVrKA0GXJfvlfI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-329-ursxgiMROFiBMoPBgI5s3w-1; Wed, 13 Jul 2022 04:55:05 -0400
X-MC-Unique: ursxgiMROFiBMoPBgI5s3w-1
Received: by mail-ed1-f70.google.com with SMTP id
 f13-20020a0564021e8d00b00437a2acb543so7877472edf.7
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jul 2022 01:55:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dI6YVPovohaWrafIFhdI1Cj4BYIDUe0+jr5w6UInkNw=;
 b=rGDtS6okijqvYJZXQN7jT+nECtWz+81+K76scFM7kcTfz2frSLrVouab+eMCemxKib
 eJgdlL8lQK4nRhxaHe7StHjEBXsdGc8qUNhjNmFMrybo4ml9w1M4SL24gdWc4BtKLMO/
 ZPWwuD65GHKgKKRBRVziZannvJSLQeQREqNRlAylFEBnNHkP+M78lPQu0rxK/csteS4d
 MH1NlVrQKZvX9oy98EYHklEFm161XgTBl43agnsYKftHBCK/H9Efs2yO61re85oBHxKg
 Up5gI8GbMLc4GudER6E0VmG0fgcEa5VKuM9hjvIKWV7MmCtnXB8/XQTavepVXGVjO2Y/
 /yaw==
X-Gm-Message-State: AJIora+DMD26vu2HHiPHuGnR3ew/P7D9JvogUcP4bY1wzVin9CRIQKOm
 qTvSjKCcREAFCaDq9I4T28FjPxBIbAWH4mExDGio2TrmhQcEycGPkpnRfNWmA92bV/9LLS1nyKP
 KF9J7zMlfotgpV8AXdXStGH94GX3I
X-Received: by 2002:a17:906:a0cf:b0:726:cbdd:466b with SMTP id
 bh15-20020a170906a0cf00b00726cbdd466bmr2304577ejb.410.1657702503916; 
 Wed, 13 Jul 2022 01:55:03 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t26IcZ7VFVC0piZNYs8yiLS0rqclevP1xbJGt8yW/60SZvrzRzMBVQayVzizXS5sVAhCcQqg==
X-Received: by 2002:a17:906:a0cf:b0:726:cbdd:466b with SMTP id
 bh15-20020a170906a0cf00b00726cbdd466bmr2304561ejb.410.1657702503741; 
 Wed, 13 Jul 2022 01:55:03 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 e2-20020a056402088200b0042dcbc3f302sm7547655edy.36.2022.07.13.01.55.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jul 2022 01:55:03 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: emma@anholt.net,
	mripard@kernel.org,
	daniel@ffwll.ch,
	airlied@linux.ie
Subject: [PATCH 0/3] drm/vc4: use drm managed resources
Date: Wed, 13 Jul 2022 10:54:57 +0200
Message-Id: <20220713085500.1970589-1-dakr@redhat.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dakr@redhat.com
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

This patch series converts DRM modeset object allocations from devm_*()
to drmm_*() memory allocators, or their corresponding convenience
wrappers, respectively, in order to tie the release action to the
underlaying struct drm_device.

This can prevent potential use-after free issues on driver unload or
EPROBE_DEFERRED backoff.

Danilo Krummrich (3):
  drm/vc4: plane: use drm managed resources
  drm/vc4: crtc: use drm managed resources
  drm/vc4: encoder: use drm managed resources

 drivers/gpu/drm/vc4/vc4_crtc.c  |  2 +-
 drivers/gpu/drm/vc4/vc4_dpi.c   | 11 ++++++-----
 drivers/gpu/drm/vc4/vc4_dsi.c   | 10 +++++-----
 drivers/gpu/drm/vc4/vc4_hdmi.c  | 10 ++++++----
 drivers/gpu/drm/vc4/vc4_plane.c | 19 +++++++------------
 drivers/gpu/drm/vc4/vc4_txp.c   |  2 +-
 drivers/gpu/drm/vc4/vc4_vec.c   | 11 ++++++-----
 7 files changed, 32 insertions(+), 33 deletions(-)

-- 
2.36.1

