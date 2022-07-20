Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7463357B772
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 15:28:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F8BA8B3FF;
	Wed, 20 Jul 2022 13:28:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A5D88B219
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 13:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658323720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=RapKFRgB4EzGxXQV5igUnFMX4O8hQnrKv2Yj7n/KS4Q=;
 b=Or3BootdihxihsTJFng4PtZBpkajt6LvwXrjPPFuJc97COic78j0jglznopdWH62dZYFXn
 0tdMji4B4nWo91eRbHlPxvZl4g4oQyORCsp1BJi01eFqNCyFQaj3CfbHa/B+NqR8YTB3pg
 Zl8M5s9EKkm8wQ3ZQ6Rv90Aw5GMNIqU=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-41-jnLGrr6EP0S_wwQWxAYWdA-1; Wed, 20 Jul 2022 09:28:35 -0400
X-MC-Unique: jnLGrr6EP0S_wwQWxAYWdA-1
Received: by mail-ej1-f71.google.com with SMTP id
 qk18-20020a1709077f9200b0072b95d9eea3so4013229ejc.4
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 06:28:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RapKFRgB4EzGxXQV5igUnFMX4O8hQnrKv2Yj7n/KS4Q=;
 b=3QAtmZx3NgkqTRflzyBXbDyihAkK5FX+dex1pjOdHYOILfGYEN/MC8+4lvsILPHXdT
 g4/qJXJltbvF0MYi2o7LvUw4Mz/rXcMzn+YSSq0+0i27IYvnqz7UT2/o3ADI7DrA03Zu
 TVCPvKChSEf8uPXZLivcDoXBjvJzkWA+GLOtq8S0GiViGvKICzTHuuZJ4nx5DOE9B+Es
 +OUzz4SCJdICn73SrUdgr42GZvLapfDJjPCM4ig2gIUHjUKRa2df57TrMQHG3aulF31T
 ebi8xuJWfFrFFQQNJz+n/s1xnB2/2HpqWE00z1lmHoBnNV70Xf/ysICkI8FZs96Lcd+0
 0a3A==
X-Gm-Message-State: AJIora/h7PJ3GL6njbYr7H7ENgm/qyVkgc6yGwk9037K9rgP8WU7oOJP
 /UzlLo1TFd394gg4N/arKyPEcJ8VI0+Ug6oUrbrP2q7d1IimUYpnT9q3C0yBhPBDqEbNSxT2ZFV
 sLrjMT4Fa8loaKJXr85KDBr65bQWs
X-Received: by 2002:a05:6402:3301:b0:43a:9ad4:633 with SMTP id
 e1-20020a056402330100b0043a9ad40633mr52855526eda.261.1658323713798; 
 Wed, 20 Jul 2022 06:28:33 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tQq0kyj3KE44mUBEJcH3sju1Q79A1Wa0PoFJ7ZdXRKNvdRktSROjXwZ8IaoyiHd2Ux4Y6lfQ==
X-Received: by 2002:a05:6402:3301:b0:43a:9ad4:633 with SMTP id
 e1-20020a056402330100b0043a9ad40633mr52855504eda.261.1658323713593; 
 Wed, 20 Jul 2022 06:28:33 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 x7-20020a05640225c700b0043ac761db43sm12220687edb.55.2022.07.20.06.28.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 06:28:33 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@linux.ie, daniel@ffwll.ch, mripard@kernel.org,
 christian.koenig@amd.com, emma@anholt.net
Subject: [PATCH RESEND 00/10] drm: use idr_init_base() over idr_init() if
 applicable
Date: Wed, 20 Jul 2022 15:28:20 +0200
Message-Id: <20220720132830.193747-1-dakr@redhat.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dakr@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

This patch series initializes IDRs with idr_init_base(&idr, 1) rather than
idr_init(&idr) in case for the particular IDR no IDs < 1 are ever requested -
this avoids unnecessary tree walks.

Danilo Krummrich (10):
  drm/amdgpu: use idr_init_base() to initialize mgr->ctx_handles
  drm/amdgpu: use idr_init_base() to initialize fpriv->bo_list_handles
  drm: use idr_init_base() to initialize master->magic_map
  drm: use idr_init_base() to initialize master->lessee_idr
  drm: use idr_init_base() to initialize mode_config.object_idr
  drm: use idr_init_base() to initialize mode_config.tile_idr
  drm/sis: use idr_init_base() to initialize dev_priv->object_idr
  drm/v3d: use idr_init_base() to initialize v3d_priv->perfmon.idr
  drm/via: use idr_init_base() to initialize dev_priv->object_idr
  drm/todo: remove task for idr_init_base()

 Documentation/gpu/todo.rst              | 12 ------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c |  2 +-
 drivers/gpu/drm/drm_auth.c              |  4 ++--
 drivers/gpu/drm/drm_mode_config.c       |  4 ++--
 drivers/gpu/drm/sis/sis_drv.c           |  2 +-
 drivers/gpu/drm/v3d/v3d_perfmon.c       |  2 +-
 drivers/gpu/drm/via/via_map.c           |  2 +-
 8 files changed, 9 insertions(+), 21 deletions(-)

-- 
2.36.1

