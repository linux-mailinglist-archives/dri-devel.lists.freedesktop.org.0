Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C555427C1A6
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 11:51:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D8CD6E1B7;
	Tue, 29 Sep 2020 09:51:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BC7989913
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 09:51:23 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601373081;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6rpdPFn5bI2bU/Q+aP+3iu//SzWPcyQ8sB6cL0a4tvc=;
 b=MwWRMbE+71katISXxMN4Nlu1dMBTuEATW01bhgRAdUdJWaHatAYLAUoG7doJIwTVFJ7MV7
 QiWS9eXHmq19cU+JpkNx9lDszZ+0IwDk2O6+dxiCdyIcr0tuCW/ofF/3WZWcgoKNF+IyrS
 Yq46XyaMoiHFuLKpl+fwwuRPbcssUyE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-DYoXsO_CMi6NSuiuApjc1A-1; Tue, 29 Sep 2020 05:51:20 -0400
X-MC-Unique: DYoXsO_CMi6NSuiuApjc1A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 495C31091065
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 09:51:19 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-56.ams2.redhat.com
 [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0E16B5C1BD;
 Tue, 29 Sep 2020 09:51:16 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 48D3C358095; Tue, 29 Sep 2020 11:51:15 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/4] drm/qxl: fix stale mm entries on driver shutdown
Date: Tue, 29 Sep 2020 11:51:11 +0200
Message-Id: <20200929095115.24430-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

v2: repost, add a pin fix.

Gerd Hoffmann (4):
  drm/qxl: use drmm_mode_config_init
  drm/qxl: release shadow on shutdown
  drm/qxl: handle shadow in primary destroy
  drm/qxl: use qxl pin function

 drivers/gpu/drm/qxl/qxl_display.c | 11 +++++++++--
 drivers/gpu/drm/qxl/qxl_object.c  |  2 +-
 2 files changed, 10 insertions(+), 3 deletions(-)

-- 
2.27.0


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
