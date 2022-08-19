Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C22A59A77F
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 23:20:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C292C10E202;
	Fri, 19 Aug 2022 21:20:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA30610E6DB
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 21:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660944022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=j2+ccIXOzc7ebn5TN2QLgICjqsh9inkfp4HMER57Oc4=;
 b=DeFbcbb7HGdHGDEOtC0u4C5kZyKr9kLwSM6vnggildKJUaRRY3TmcTvLg9j3mt4ByVvzK1
 uFJEBopgnZ4T0zbGl1SMgNjA7iNS0476g8QqOKr2XC9uXcUeZt7At+nNm9YRlQo6DIDISA
 zeHAmhnTcDslkMrynK1hBnc9H8LNFGU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-655-wtvFLRXZNN65A5f8e4hLSw-1; Fri, 19 Aug 2022 17:20:19 -0400
X-MC-Unique: wtvFLRXZNN65A5f8e4hLSw-1
Received: by mail-ed1-f72.google.com with SMTP id
 h8-20020a05640250c800b0044642d29d35so1522499edb.18
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 14:20:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=j2+ccIXOzc7ebn5TN2QLgICjqsh9inkfp4HMER57Oc4=;
 b=Wwh+1y5qI8jaAMJohehoFM09tpdLkTuenvlOy+27YAb1WHfPv1fui/naXj+T5mlO/0
 djhT1Lo3MjMyTSpikKAyXTLhVxSOiyBMX9iCwqviY01CJrzkCngV9QhuowkrJCWSVwr9
 /0m5Bd6/NlZ9ElH7gHu7UOfwGiEeeDqt2VZaC97ePKYyuLqF+fBz8Yfi96IId2jCmnQ4
 D+5s/cldnSffFKDTyYMZnRQzAigNOHEgo9MCt8W1R4gTWQ5SSx78vWmtrzSnuuAxuTnc
 xYF0Uzlg/1qmr6gZyVoZ6HwgxcjQkD6yA541BK0qduQStS47oVnwvqOxqdca37qSbxBs
 IM8w==
X-Gm-Message-State: ACgBeo20mo1vO2cbXqg1s1fNv61Pw825mbnqMGaIQnYixDBvxRJIN9zD
 azZx0Zd3r9A4ma6Kc/2+iy3Ux1oX7DKp49oTqlv+tNdrFZX6ghnofuMKYmkmC84BdqQt3zUMQcS
 upwPLhnw4CMWLrikYAYZQCRtnIeuB
X-Received: by 2002:a05:6402:400d:b0:446:6fe1:7663 with SMTP id
 d13-20020a056402400d00b004466fe17663mr392386eda.376.1660944018424; 
 Fri, 19 Aug 2022 14:20:18 -0700 (PDT)
X-Google-Smtp-Source: AA6agR466OXqq6BVG/zJYaiyEpFRVqjwIYX750SN/UUM38RlWDntKPsBW4hHv9mrKyzs1ZBat73diA==
X-Received: by 2002:a05:6402:400d:b0:446:6fe1:7663 with SMTP id
 d13-20020a056402400d00b004466fe17663mr392366eda.376.1660944018228; 
 Fri, 19 Aug 2022 14:20:18 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 y14-20020a1709063a8e00b0073a644ef803sm2777029ejd.101.2022.08.19.14.20.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 14:20:17 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org,
 liviu.dudau@arm.com, brian.starkey@arm.com
Subject: [PATCH drm-misc-next 0/8] drm/arm/malidp: use drm managed resources
Date: Fri, 19 Aug 2022 23:20:07 +0200
Message-Id: <20220819212015.556220-1-dakr@redhat.com>
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


base-commit: 8869fa666a9e6782c3c896c1fa57d65adca23249
-- 
2.37.2

