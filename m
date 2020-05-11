Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 246A61CE84F
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 00:42:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D8FC6E5BF;
	Mon, 11 May 2020 22:42:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D23D36E5C0
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 22:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589236941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=5AW1tPrIf1NH23mBvqTHaK47Gct2K80GUJUWM/a2mOg=;
 b=d9zhqa5CM9mYwpZb3WK9JxT58CX8qMTaNKbAlN0YENVVpbJ/HRGw3ySuqT2CSwWQz3UivF
 QBSlMy2n1p5aHIZfDHvKdJ1XoYucRzkKc+6Y08WD++h+6SqNg706EdmWIWA7aMfW8DX7x1
 EfK8Ec+OHaRBL17MvjCSeji7cqMr4as=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-72MkkdwwNAqOVOmAuvb87w-1; Mon, 11 May 2020 18:42:18 -0400
X-MC-Unique: 72MkkdwwNAqOVOmAuvb87w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C02E5A0BD7;
 Mon, 11 May 2020 22:42:15 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-117-238.rdu2.redhat.com
 [10.10.117.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C29DE77F2E;
 Mon, 11 May 2020 22:42:13 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org
Subject: [PATCH v3 0/5] drm/nouveau: DP interlace fixes
Date: Mon, 11 May 2020 18:41:22 -0400
Message-Id: <20200511224148.598468-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: Jani Nikula <jani.nikula@intel.com>, David Airlie <airlied@linux.ie>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sean Paul <seanpaul@chromium.org>, Ben Skeggs <bskeggs@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, nouveau doesn't actually bother to try probing whether or not
it can actually handle interlaced modes over DisplayPort. As a result,
on volta and later we'll end up trying to set an interlaced mode even
when it's not supported and cause the front end for the display engine
to hang.

So, let's teach nouveau to reject interlaced modes on hardware that
can't actually handle it. Additionally for MST, since we accomplish this
by simply reusing more of the SST mode validation we also get (some)
basic bw validation for modes we detect on MST connectors completely for
free.

Lyude Paul (5):
  drm/nouveau/kms/nv50-: Initialize core channel in
    nouveau_display_create()
  drm/nouveau/kms/nv50-: Probe SOR and PIOR caps for DP interlacing
    support
  drm/nouveau/kms/gv100-: Add support for interlaced modes
  drm/nouveau/kms/nv50-: Move 8BPC limit for MST into
    nv50_mstc_get_modes()
  drm/nouveau/kms/nv50-: Share DP SST mode_valid() handling with MST

 drivers/gpu/drm/nouveau/dispnv50/core.h     |  7 +++
 drivers/gpu/drm/nouveau/dispnv50/core507d.c | 15 ++++++
 drivers/gpu/drm/nouveau/dispnv50/core827d.c |  1 +
 drivers/gpu/drm/nouveau/dispnv50/core907d.c |  1 +
 drivers/gpu/drm/nouveau/dispnv50/core917d.c |  1 +
 drivers/gpu/drm/nouveau/dispnv50/corec37d.c | 26 +++++++++
 drivers/gpu/drm/nouveau/dispnv50/corec57d.c |  1 +
 drivers/gpu/drm/nouveau/dispnv50/disp.c     | 58 +++++++++++++++------
 drivers/gpu/drm/nouveau/dispnv50/disp.h     |  1 +
 drivers/gpu/drm/nouveau/dispnv50/headc37d.c |  5 +-
 drivers/gpu/drm/nouveau/dispnv50/headc57d.c |  5 +-
 drivers/gpu/drm/nouveau/dispnv50/pior507d.c |  8 +++
 drivers/gpu/drm/nouveau/dispnv50/sor507d.c  |  7 +++
 drivers/gpu/drm/nouveau/dispnv50/sor907d.c  | 11 ++++
 drivers/gpu/drm/nouveau/dispnv50/sorc37d.c  |  9 ++++
 drivers/gpu/drm/nouveau/nouveau_connector.c | 48 +++++++++++------
 drivers/gpu/drm/nouveau/nouveau_connector.h |  5 ++
 drivers/gpu/drm/nouveau/nouveau_dp.c        | 31 +++++++++++
 drivers/gpu/drm/nouveau/nouveau_encoder.h   |  8 +++
 19 files changed, 213 insertions(+), 35 deletions(-)

-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
