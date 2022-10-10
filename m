Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A67055FA25C
	for <lists+dri-devel@lfdr.de>; Mon, 10 Oct 2022 19:02:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43AEA10E695;
	Mon, 10 Oct 2022 17:02:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F99510E68C
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Oct 2022 17:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665421333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+c3EQZpIPsURLACPBP9f4RJ+bRE7qS3eRh9PTauwjJ8=;
 b=Zufi3q5ZXEE3b4frhPVXQn1ZtFgUElIBUrFRJ5xC0cDMx3MfC0+hI8FmD7dXaXb59+u45o
 a5BqvEqEC4hF6X89j/q+oO/zKoQI3o3okff07ntm4T5DxmaMuEsPPjqQdwGq1MGqEvO+cj
 yq5OXZQPFUhiRvR94DTebtciwdgc2xE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-362-4K610ow1NJWybCW7ToXdig-1; Mon, 10 Oct 2022 13:02:12 -0400
X-MC-Unique: 4K610ow1NJWybCW7ToXdig-1
Received: by mail-wm1-f70.google.com with SMTP id
 bg21-20020a05600c3c9500b003c2acbff422so3941475wmb.0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Oct 2022 10:02:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+c3EQZpIPsURLACPBP9f4RJ+bRE7qS3eRh9PTauwjJ8=;
 b=yUXDd7/2CCFbjCXBZjg3lkxcsMq8xpspNknfPZ84FBxQiGPOst3Kbv/76vZybIjUuJ
 J4OLAsw+1dPYTPNlt9O+gVBvMfrfic0gY3d8DNb+t0m5AfLZ+sVcrMn/djt2G0TIx6qB
 uCtXPB+ekwgEWtBQEv6s74T3Tn6Dx7tc6/lQ2fvP6SjMA6N5eVM8RK8EPOXfrwuF74oc
 vrDQtJrugsGquuwVcWqqr1OqHB1PBIXffJHiu0dzKZdy2o2piQzBQBvdO/Bq/Z3h4oY5
 cpuI+90GlIkHq7klezYY2W3CqTDIFTiUK0ROF0wT69Q2/GYRCiqT1rIRXmCkq5OBBPXV
 bFSA==
X-Gm-Message-State: ACrzQf3jQcVyP7u+JNHB58fDPJ7B1tOvllGbBW/pltRBcI5ew/uA4YaW
 UqcU2H0yE4yrvjwz7tNklJgfPU8HWFvpwd0yLWrfX1jPPVOIsuPLiXifpiOkH1FjYCzgIs5e5aY
 q4VVdm9puFesulu6jTePRcpDzG0NO
X-Received: by 2002:a05:6000:551:b0:22e:4499:a478 with SMTP id
 b17-20020a056000055100b0022e4499a478mr12200551wrf.459.1665421330695; 
 Mon, 10 Oct 2022 10:02:10 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5Qgh7vPJ9S+rl4LeW8JqyrNbCa2SFM/S3yVwBP6AfOtVL67cbLaUPV6uIlzV1fKYJjvcIUXg==
X-Received: by 2002:a05:6000:551:b0:22e:4499:a478 with SMTP id
 b17-20020a056000055100b0022e4499a478mr12200529wrf.459.1665421330447; 
 Mon, 10 Oct 2022 10:02:10 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 z5-20020a056000110500b0022b11a27e39sm9160551wrw.1.2022.10.10.10.02.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 10:02:09 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] Add a drm_crtc_helper_atomic_check() helper
Date: Mon, 10 Oct 2022 19:02:00 +0200
Message-Id: <20221010170203.274949-1-javierm@redhat.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a helper function and make drivers that have the same logic in their
struct drm_crtc_helper_funcs .atomic_check handler to use this instead.

Patch #1 and #2 are just cleanups for the simpledrm and ssd130x drivers
respectively, so that these can be converted to use the helper added by
patch #3. The changes are inspired by a patch from Thomas Zimmermann for
the ast DRM driver:

https://patchwork.kernel.org/project/dri-devel/patch/20221010103625.19958-4-tzimmermann@suse.de/

Best regards,
Javier


Javier Martinez Canillas (3):
  drm/simpledrm: Do not call drm_atomic_add_affected_planes()
  drm/ssd130x: Do not call drm_atomic_add_affected_planes()
  drm/crtc-helper: Add a drm_crtc_helper_atomic_check() helper

 drivers/gpu/drm/drm_crtc_helper.c | 24 ++++++++++++++++++++++++
 drivers/gpu/drm/solomon/ssd130x.c | 20 ++------------------
 drivers/gpu/drm/tiny/simpledrm.c  | 20 ++------------------
 include/drm/drm_crtc_helper.h     |  2 ++
 4 files changed, 30 insertions(+), 36 deletions(-)

-- 
2.37.3

