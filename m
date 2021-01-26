Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 438D830440F
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jan 2021 17:58:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 441E16E499;
	Tue, 26 Jan 2021 16:58:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5499D6E499
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jan 2021 16:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611680300;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=GNM/0L6Str90PLnrib5C+SbrfVOcyT/Hdv+IJOPAKt0=;
 b=UVrord+Q2uMNaSVJlNw5idXVqVrqidyZVN3CZ45tj0YIYBXfTT+OLPbSdsqq+BiKVPcl7Y
 qSjvN9X5e+3nJiD0ohlIkUHknvzZt8w+L2FWYtaFCl29XPq9T2RA5zP7X84vd8ggjnBEW7
 JAgE76O5Mv/zPnnjU80l8ljz16iZ+VE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-wu3hphOzM3-Z9aIoI1mnfQ-1; Tue, 26 Jan 2021 11:58:18 -0500
X-MC-Unique: wu3hphOzM3-Z9aIoI1mnfQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B0392802B42
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jan 2021 16:58:17 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-27.ams2.redhat.com
 [10.36.113.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 930195FC29;
 Tue, 26 Jan 2021 16:58:14 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E579418000B9; Tue, 26 Jan 2021 17:58:12 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 0/5] drm/qxl: fix driver shutdown issues.
Date: Tue, 26 Jan 2021 17:58:07 +0100
Message-Id: <20210126165812.1661512-1-kraxel@redhat.com>
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

Almost there.  Still getting this on driver unbind:

   kobject: '(null)' ((____ptrval____)): is not initialized, yet kobject_put(=
) is being called
   [ ... ]
   Call Trace:
    ttm_device_fini+0x133/0x1b0 [ttm]
    qxl_ttm_fini+0x2f/0x40 [qxl]
    qxl_device_fini+0x88/0x120 [qxl]
    drm_minor_release+0x3d/0x60

but I don't think this is the qxl driver's fault.

Gerd Hoffmann (5):
  drm/qxl: use drmm_mode_config_init
  drm/qxl: unpin release objects
  drm/qxl: release shadow on shutdown
  drm/qxl: handle shadow in primary destroy
  drm/qxl: properly free qxl releases

 drivers/gpu/drm/qxl/qxl_drv.h     |  1 +
 drivers/gpu/drm/qxl/qxl_display.c | 11 +++++++++--
 drivers/gpu/drm/qxl/qxl_kms.c     | 22 ++++++++++++++++++++--
 drivers/gpu/drm/qxl/qxl_release.c |  3 +++
 4 files changed, 33 insertions(+), 4 deletions(-)

--=20
2.29.2


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
