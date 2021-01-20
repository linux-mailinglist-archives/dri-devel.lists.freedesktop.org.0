Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DACA92FCEE0
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jan 2021 12:13:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A3166E17D;
	Wed, 20 Jan 2021 11:12:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F6FD6E175
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jan 2021 11:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611141172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2/1bsuu4BhL56fPWDCrgTWmSvF01ZSO8IX7hrGvUcr4=;
 b=JXGeCwHTFZ0HPanGIJFu5hjKQbwcAElz5WJM0B0GAvmI1Mo6yWblUSFFHBfWIa5dpvErb9
 P74qC1XMmAQJZ0N1ZJBUfc3zbrz7ZuYkOu1yr+msSiEgDw889GBp0rH4i3y6RDlHWN5Vf8
 5npJl1Z3+UM7f5Z7rxZ4UhH7U8qCvIs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-u_CdHJr5PKqFCgs_DLr01Q-1; Wed, 20 Jan 2021 06:12:47 -0500
X-MC-Unique: u_CdHJr5PKqFCgs_DLr01Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 18E2A806662
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jan 2021 11:12:47 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9AC4F71CA4;
 Wed, 20 Jan 2021 11:12:43 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C95FB18000B3; Wed, 20 Jan 2021 12:12:40 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 0/4] drm/qxl: fix some driver shutdown issues.
Date: Wed, 20 Jan 2021 12:12:36 +0100
Message-Id: <20210120111240.2509679-1-kraxel@redhat.com>
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

Some progress.  Not complete though, I still
get an unclean mm warning on shutdown due to
some release objects not being freed yet.

Gerd Hoffmann (4):
  drm/qxl: use drmm_mode_config_init
  drm/qxl: unpin release objects
  drm/qxl: release shadow on shutdown
  drm/qxl: handle shadow in primary destroy

 drivers/gpu/drm/qxl/qxl_display.c | 11 +++++++++--
 drivers/gpu/drm/qxl/qxl_release.c |  1 +
 2 files changed, 10 insertions(+), 2 deletions(-)

-- 
2.29.2


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
