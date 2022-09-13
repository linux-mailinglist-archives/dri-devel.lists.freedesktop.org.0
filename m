Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E4F5B7CE2
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 00:15:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 259A810E563;
	Tue, 13 Sep 2022 22:15:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6062C10E563
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Sep 2022 22:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663107302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=QkRwvxkxuZTjDo6IP2NnlgO32UW0G4L0LhzpMPjt8ng=;
 b=CqAAmP+WxYfwChJ3e09RIpH7t4Rf27EXptCLHiYh7fVozPhbNeRgDBSjHbcMCAWs1m4/Ip
 UvsY/4YuURst9QPkfDvyC+1CPKac9thgbZTEyhrQoivEu2Y9QOBQhTfQn24CjtMMVcuJNM
 qt97o6VOJPjI2LY3s0UcksiwpEclJOU=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-546-nc8-LF70MAG0M_zhc3oETQ-1; Tue, 13 Sep 2022 18:15:01 -0400
X-MC-Unique: nc8-LF70MAG0M_zhc3oETQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 qb30-20020a1709077e9e00b0077d1271283eso3033835ejc.2
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Sep 2022 15:15:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=QkRwvxkxuZTjDo6IP2NnlgO32UW0G4L0LhzpMPjt8ng=;
 b=RCOkyimofuRrEMUlUquPepKq8hNRRY4aajLExaN1Ae/gALwiZjkwiyCz1Ekl9AZngV
 /iHXyde5wqFbzeGTsxyOtm9Np649rP36aCLyNKkWk3ImPVlmM+xigHTj1WP3lumChlky
 /QPu8NanfBVQv+DhBDquHZf0kyoPfsuiuoxX0umg9uUmDOD5rRY+Tl7wn7MdilpyR2q7
 6sYSlJwm8f2hxlL6YBAIagH4WClfilqlCWgfAyfMM2oP8yjQTmm8tNCUDHuVgy048S6g
 CB/MO3Yo2Z2ba0IbuVxuSWogaseefnjp92+X0eU0DgLsGcokcpvVSZ4NjHy29dGs/Kyk
 Rpog==
X-Gm-Message-State: ACgBeo0Sd06+rZMu0yoSMDa+HlEyLVOY2M1X+ekjFqUB847/Y8m2KBzE
 hqt65MXfpElegbHwocesJHKQUo2uUMA3odNfppHNeJZWDqoAWGR9g5CHd12FE93Poam7kiyYOpC
 lLLpY9YwmsqoMj/J2m+ZtNpd+oJV0
X-Received: by 2002:a17:906:974d:b0:780:2c07:7617 with SMTP id
 o13-20020a170906974d00b007802c077617mr567161ejy.707.1663107300121; 
 Tue, 13 Sep 2022 15:15:00 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5jydPgHVu9oBy62e7em4JC2Tq4/WiNSDgZNWnV9jpoLtxkk4Svofq01XCc7D1WMANcOytpmw==
X-Received: by 2002:a17:906:974d:b0:780:2c07:7617 with SMTP id
 o13-20020a170906974d00b007802c077617mr567144ejy.707.1663107299961; 
 Tue, 13 Sep 2022 15:14:59 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 ep19-20020a1709069b5300b0073093eaf53esm6615666ejc.131.2022.09.13.15.14.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Sep 2022 15:14:59 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org,
 liviu.dudau@arm.com, brian.starkey@arm.com
Subject: [PATCH drm-misc-next v2 0/6] drm/arm/hdlcd: use drm managed resources
Date: Wed, 14 Sep 2022 00:14:50 +0200
Message-Id: <20220913221456.147937-1-dakr@redhat.com>
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
  - drop patch "drm/arm/hdlcd: crtc: use drmm_crtc_init_with_planes()"

Danilo Krummrich (6):
  drm/arm/hdlcd: use drmm_* to allocate driver structures
  drm/arm/hdlcd: replace drm->dev_private with drm_to_hdlcd_priv()
  drm/arm/hdlcd: plane: use drm managed resources
  drm/arm/hdlcd: use drm_dev_unplug()
  drm/arm/hdlcd: crtc: protect device resources after removal
  drm/arm/hdlcd: debugfs: protect device resources after removal

 drivers/gpu/drm/arm/hdlcd_crtc.c | 76 ++++++++++++++++++++++++--------
 drivers/gpu/drm/arm/hdlcd_drv.c  | 36 ++++++++-------
 drivers/gpu/drm/arm/hdlcd_drv.h  |  2 +
 3 files changed, 79 insertions(+), 35 deletions(-)


base-commit: 75cebd664d57a78af3e46c14bd2659df0a08847b
-- 
2.37.3

