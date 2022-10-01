Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D76B85F1841
	for <lists+dri-devel@lfdr.de>; Sat,  1 Oct 2022 03:19:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC9AE10EDEF;
	Sat,  1 Oct 2022 01:19:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCF7210EDEF
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Oct 2022 01:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664587151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=wdNYs4R1bXZF1j2fHdctKVizjm4B3/LsaPspkYayHLg=;
 b=NGAMB9gw5/TZL9geNeo2uB6dwWCGmqDFUJsU2WpGS7icSA3OAx2bJLD9sRdK5pv9NwYWkA
 gDOWyEZYTEPzNJy+s1Cq+1NzNv5Mr//AHYpDrLVHF2DbNJ3ey7XZOg9vaQTRdXhMQGbvyM
 3FrdhKtv7alA2pM2hpAMXCurcmfkd30=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-544-5s3Vimj9M4SCW8AaSWA-AQ-1; Fri, 30 Sep 2022 21:19:10 -0400
X-MC-Unique: 5s3Vimj9M4SCW8AaSWA-AQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 y9-20020a056402270900b00451dfbbc9b2so4628407edd.12
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 18:19:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=wdNYs4R1bXZF1j2fHdctKVizjm4B3/LsaPspkYayHLg=;
 b=i13nJTxgrcNzkFdAe2/qRi8UtiKx0T+CH3H5XWb6QsOFMA+PWeUMAFhBE+lrWBuo86
 DFlBtlYhF3HNIDt/1lOlgLJLGsbVIgYtcDfrC83tZa4lHFK642AgYTE/mwaxDNVt3ATO
 wyh4BePPZgV7eqLQV9sAS/+3eTnlF/34Dy6eETg5yQqc8Q5ymXdCpKuCV5N+mMHZJEsW
 Bx7gDCJ42FroV6jKyZTUogCUI7f9R7mijxlggzHvXDuWY+iksQQGRKxZUTL8C91FAoI7
 p44PDklKmY1ANXr4ZHU2tyz1XEHO4N0mmos73l3eHoqhmOpOcx88YcJNJr4Fb4srhEHk
 2eUQ==
X-Gm-Message-State: ACrzQf1TVBED/O4sxowZdRfLO0DG7JHCnkdUOlsQuCPB8K+zndOYCWpp
 jVYHm8UEfCQKubVWS1ueCx15EXE6gZNxwwPK04OHUun17d9mDx7vQA06jrxj7buH+7V2E7zBJpd
 vWEpCbfqPnQ0PiNlp18O89NHigBmq
X-Received: by 2002:a05:6402:493:b0:445:b5f0:7a0f with SMTP id
 k19-20020a056402049300b00445b5f07a0fmr9717246edv.120.1664587149236; 
 Fri, 30 Sep 2022 18:19:09 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5r+fvRRbozeqSmGuL4DdbQm6Wcqo6l8koGDcwHtEbf+YfhfpQQbmvdhWAdhseet4Oim1KQBw==
X-Received: by 2002:a05:6402:493:b0:445:b5f0:7a0f with SMTP id
 k19-20020a056402049300b00445b5f07a0fmr9717233edv.120.1664587149085; 
 Fri, 30 Sep 2022 18:19:09 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 n15-20020a056402514f00b00458b41d9460sm327502edd.92.2022.09.30.18.19.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 18:19:08 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org,
 liviu.dudau@arm.com, brian.starkey@arm.com
Subject: [PATCH drm-misc-next v3 0/7] drm/arm/hdlcd: use drm managed resources
Date: Sat,  1 Oct 2022 03:18:58 +0200
Message-Id: <20221001011905.433408-1-dakr@redhat.com>
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

Changes in v3:
  - Fix alternate return paths in srcu read-side critical sections causing a
    stall when unregistering the driver.
  - Fix potential null pointer dereference in hdlcd_crtc_cleanup() introduced
    dropping the patch in v2.
  - Add a patch to remove explicit calls to drm_mode_config_cleanup().

Danilo Krummrich (7):
  drm/arm/hdlcd: use drmm_* to allocate driver structures
  drm/arm/hdlcd: replace drm->dev_private with drm_to_hdlcd_priv()
  drm/arm/hdlcd: plane: use drm managed resources
  drm/arm/hdlcd: use drm_dev_unplug()
  drm/arm/hdlcd: crtc: protect device resources after removal
  drm/arm/hdlcd: debugfs: protect device resources after removal
  drm/arm/hdlcd: remove calls to drm_mode_config_cleanup()

 drivers/gpu/drm/arm/hdlcd_crtc.c | 84 ++++++++++++++++++++++++--------
 drivers/gpu/drm/arm/hdlcd_drv.c  | 55 ++++++++++++---------
 drivers/gpu/drm/arm/hdlcd_drv.h  |  2 +
 3 files changed, 98 insertions(+), 43 deletions(-)


base-commit: 08fb97de03aa2205c6791301bd83a095abc1949c
-- 
2.37.3

