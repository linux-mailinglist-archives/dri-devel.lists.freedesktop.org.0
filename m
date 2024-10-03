Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0EA98F192
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 16:36:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EBCB10E865;
	Thu,  3 Oct 2024 14:36:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="LcAYo8IW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0342110E865
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2024 14:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1727966214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=wmHFhHvTlhZbjis5SO5ISW//g3PYc+wkhvmntwtXl9Q=;
 b=LcAYo8IWCrMuXe2Harv+IMsotgO0IcaKbwfNvtIgPnXr92XjLRUSDrFGReXSi7s2C9iTxO
 2ZdiPcQG45rtx73mClQriKi8SF5kZPtfLPTghku7UybCDlEVBcvWKR8RjhLLCJjLd4ukym
 Tt0jGnTNuthrrSjmWVL37yNv7FUZsdo=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-594-wpHKGQw2PlyF44wM2ErNwA-1; Thu,
 03 Oct 2024 10:36:52 -0400
X-MC-Unique: wpHKGQw2PlyF44wM2ErNwA-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 1A6591925389; Thu,  3 Oct 2024 14:36:49 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.112])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id B811C195605F; Thu,  3 Oct 2024 14:36:46 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 6.12 regression fix 0/2] drm/radeon regression fixes
Date: Thu,  3 Oct 2024 16:36:38 +0200
Message-ID: <20241003143640.14932-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi All,

My main workstation still uses a good old R7 250E card. After dogfooding
6.12-rc1 my system would first hang at boot and after fixing that GDM would
not show.

After identifying the problematic commits I have gone for the easy solution
of reverting both, which was straight forward in both cases.

Both patches have a stacktrace in their commit message and I'm willing to
try other ways of fixing things.

Regards,

Hans


Hans de Goede (2):
  drm/radeon: Revert: "remove load callback from kms_driver"
  drm/radeon: Revert: "use GEM references instead of TTMs"

 drivers/gpu/drm/radeon/radeon_drv.c    | 5 +----
 drivers/gpu/drm/radeon/radeon_gem.c    | 2 +-
 drivers/gpu/drm/radeon/radeon_object.c | 7 +++++--
 3 files changed, 7 insertions(+), 7 deletions(-)

-- 
2.46.2

