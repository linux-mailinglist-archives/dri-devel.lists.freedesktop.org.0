Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 080C21E29F6
	for <lists+dri-devel@lfdr.de>; Tue, 26 May 2020 20:23:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0A9D6E252;
	Tue, 26 May 2020 18:23:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 733BB6E252
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 18:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590517404;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=5+EU/K2kj/k8K0E7hESfXaQ4YimAcr8+UqvyVfx2X4A=;
 b=PIKlKpTvki22GI2GiUVN/ib6fASFudlamnHZx5fja/RShN2AbqE0+LHzwBF/pzsSPm6Wxx
 tvkBQ+MjDY2c/bY2sRDJ8wo6ARwfAOis/ltHxfM/KR+Ii1DKHEpCvhH7ANvsJZDZNfZu7u
 85vxyBR0yBPTf8UE+/JQG02TfvX3QiA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-g6Gi8_IIO7aRX8Un7vznuA-1; Tue, 26 May 2020 14:23:19 -0400
X-MC-Unique: g6Gi8_IIO7aRX8Un7vznuA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 51C4C8018AD;
 Tue, 26 May 2020 18:23:17 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-120-19.rdu2.redhat.com
 [10.10.120.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BAE0079C40;
 Tue, 26 May 2020 18:23:14 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] drm/probe_helper,
 i915: Validate MST modes against PBN limits
Date: Tue, 26 May 2020 14:23:08 -0400
Message-Id: <20200526182313.4005-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Lucas De Marchi <lucas.demarchi@intel.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Lee Shawn C <shawn.c.lee@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Something we've been missing for a while with drivers that support MST
is being able to prune modes that can't be set due to bandwidth
limitations. So, let's go ahead and add that. This also adds a new hook
that was needed, mode_valid_ctx, so that we can grab additional locks as
needed when validating modes.

Lee Shawn C (1):
  drm/i915/mst: filter out the display mode exceed sink's capability

Lyude Paul (1):
  drm/probe_helper: Add drm_connector_helper_funcs.mode_valid_ctx

 drivers/gpu/drm/drm_crtc_helper_internal.h  |  6 +-
 drivers/gpu/drm/drm_probe_helper.c          | 65 ++++++++++++++-------
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 39 +++++++++++--
 include/drm/drm_modeset_helper_vtables.h    | 41 +++++++++++++
 4 files changed, 123 insertions(+), 28 deletions(-)

-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
