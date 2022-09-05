Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B56DF5AD61A
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 17:19:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FE7E10E411;
	Mon,  5 Sep 2022 15:19:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1FEB10E411
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 15:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662391167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=txJ7rH0HcdmbXZEFY4EaZQQpLp+37J+9klKnKTy/C5g=;
 b=gzbwLCbed8UAcS4lgpvwx2jxGyqPbtSh7+iI/elSmfX8mDOpsSB2uQ5jGZ5sN9SLb4x6vJ
 vvxfHPTDYRrKfNO6zS2qqJLcae1sQtyvHbESvKWNRWVAkKpStYuolwXOgqXHQN4UxV9E0P
 tOWuvkqyv44Gfxg4ZDVqypin7aTm1WU=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-204-q3LOMwOKOGiU8_RVbo1qRQ-1; Mon, 05 Sep 2022 11:19:18 -0400
X-MC-Unique: q3LOMwOKOGiU8_RVbo1qRQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 nc21-20020a1709071c1500b0076120d57502so941031ejc.18
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Sep 2022 08:19:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=txJ7rH0HcdmbXZEFY4EaZQQpLp+37J+9klKnKTy/C5g=;
 b=e5lvTEl42i0Becs7Xdv7v6591RYmb0fcFloxW1S44yKrArt0PDTGT5eDEhuKJ4UxkA
 0TMMylSGFOK3sHE7rP5p9SJaPAIrqAmVnbYXU2CWMg39ils9E/oKA+UEuUcQhWYWzf0r
 h2wIHUelzF1lXt/uPt+oiSVV6pMjn7ewSfTzVbxEvOnBJkSl83eJ8/pskWmMKbi1nRar
 QV6aOcf8RSHhVazs3fmIh97WmSDs++STLLyu0vTLyVfjs2FTVz1pUKENtOPDc+3vit/L
 SWkKKq11rWjm1Qq5b4YTBAZZ/BZYHi7wKfuq+8hKUv0ZQt7AdIXou2XA5XfUdoZ5/SaL
 +OPg==
X-Gm-Message-State: ACgBeo33H8u8z5uLNWuEqV114S3dfO+0pRAGfGt6078uLzJIU5Tp/GAB
 be8bnFmXgZ3HD/rKgvjT7yJw9HiaS9fPfRtxF1zK4LQQDeYHU3u1vDyhJHOHUMtn9gpsWIezYdW
 wm7FEdxeywQLxHPxgngQOLAO6NJ2c
X-Received: by 2002:a50:fc15:0:b0:44e:4895:b290 with SMTP id
 i21-20020a50fc15000000b0044e4895b290mr6857413edr.394.1662391157459; 
 Mon, 05 Sep 2022 08:19:17 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5FJUgNZbo1aOl4CuBy5cBZqK3JuAHiQxIYNAOSEEgNofU1OxE/Luv0TkpD6CSznKVWTYq1Qg==
X-Received: by 2002:a50:fc15:0:b0:44e:4895:b290 with SMTP id
 i21-20020a50fc15000000b0044e4895b290mr6857409edr.394.1662391157316; 
 Mon, 05 Sep 2022 08:19:17 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 n12-20020aa7d04c000000b0044e702cd712sm2741485edo.41.2022.09.05.08.19.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 08:19:17 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org,
 liviu.dudau@arm.com, brian.starkey@arm.com
Subject: [PATCH RESEND drm-misc-next 0/8] drm/arm/malidp: use drm managed
 resources
Date: Mon,  5 Sep 2022 17:19:02 +0200
Message-Id: <20220905151910.98279-1-dakr@redhat.com>
X-Mailer: git-send-email 2.37.2
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

Danilo Krummrich (8):
  drm/arm/malidp: use drmm_* to allocate driver structures
  drm/arm/malidp: replace drm->dev_private with drm_to_malidp()
  drm/arm/malidp: crtc: use drmm_crtc_init_with_planes()
  drm/arm/malidp: plane: use drm managed resources
  drm/arm/malidp: use drm_dev_unplug()
  drm/arm/malidp: plane: protect device resources after removal
  drm/arm/malidp: crtc: protect device resources after removal
  drm/arm/malidp: drv: protect device resources after removal

 drivers/gpu/drm/arm/malidp_crtc.c   | 48 +++++++++++++++++++++---
 drivers/gpu/drm/arm/malidp_drv.c    | 58 ++++++++++++++---------------
 drivers/gpu/drm/arm/malidp_drv.h    |  2 +
 drivers/gpu/drm/arm/malidp_hw.c     | 10 ++---
 drivers/gpu/drm/arm/malidp_mw.c     |  6 +--
 drivers/gpu/drm/arm/malidp_planes.c | 45 +++++++++++-----------
 6 files changed, 100 insertions(+), 69 deletions(-)


base-commit: 8fe444eb326869823f3788a4b4da5dca03339d10
-- 
2.37.2

