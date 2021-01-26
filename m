Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BE53030DB
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jan 2021 01:10:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 821D86E3C1;
	Tue, 26 Jan 2021 00:10:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 356E76E3C1
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jan 2021 00:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611619839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=PsQf0XiiwKZJEanXsqJQbh/mbkkSqp2b8afcHx0WcXc=;
 b=Eetn6OkSq08Wzd9jEfKdzwQv5rqcLkOh3fX8dXqaC0c7rYAOgmcdEfKek+zSjklaQHjP7t
 xUI62LHeclvmaidm2TnjR86457XH5OF0bLiRaJ7i0RdErkutH+9O97uBoxGbH7yVZjpA+Y
 z+3sXB2Hsmf9nlLrRfke/Om0w9UVFhY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-471lXH9ZMf2jCoFH3zsEAw-1; Mon, 25 Jan 2021 19:10:35 -0500
X-MC-Unique: 471lXH9ZMf2jCoFH3zsEAw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A3A7180A097;
 Tue, 26 Jan 2021 00:10:34 +0000 (UTC)
Received: from Whitewolf.lyude.net (ovpn-118-245.rdu2.redhat.com
 [10.10.118.245])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5D6106F973;
 Tue, 26 Jan 2021 00:10:33 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [RFC v2 0/5] drm: Extract DPCD backlight helpers from i915,
 add support in nouveau
Date: Mon, 25 Jan 2021 19:10:26 -0500
Message-Id: <20210126001031.881048-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
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
Cc: Jani Nikula <jani.nikula@intel.com>, greg.depoire@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series:
* Cleans up i915's DPCD backlight code a little bit
* Extracts i915's DPCD backlight code into a set of shared DRM helpers
* Starts using those helpers in nouveau to add support to nouveau for
  DPCD backlight control

v2 series-wide changes:
* Rebase

Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Dave Airlie <airlied@gmail.com>
Cc: greg.depoire@gmail.com

Lyude Paul (5):
  drm/nouveau/kms/nv40-/backlight: Assign prop type once
  drm/nouveau/kms: Don't probe eDP connectors more then once
  drm/i915/dp: Remove redundant AUX backlight frequency calculations
  drm/dp: Extract i915's eDP backlight code into DRM helpers
  drm/nouveau/kms/nv50-: Add basic DPCD backlight support for nouveau

 drivers/gpu/drm/drm_dp_helper.c               | 332 ++++++++++++++++++
 .../drm/i915/display/intel_display_types.h    |   2 +-
 .../drm/i915/display/intel_dp_aux_backlight.c | 315 ++---------------
 drivers/gpu/drm/nouveau/dispnv50/disp.c       |  30 +-
 drivers/gpu/drm/nouveau/nouveau_backlight.c   | 170 +++++++--
 drivers/gpu/drm/nouveau/nouveau_connector.c   |   6 +
 drivers/gpu/drm/nouveau/nouveau_connector.h   |   9 +-
 drivers/gpu/drm/nouveau/nouveau_encoder.h     |   1 +
 include/drm/drm_dp_helper.h                   |  48 +++
 9 files changed, 607 insertions(+), 306 deletions(-)

-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
