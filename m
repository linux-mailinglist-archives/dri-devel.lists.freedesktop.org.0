Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F2E219452
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 01:33:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CDB989CC4;
	Wed,  8 Jul 2020 23:33:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4964489BF4
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 23:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594251202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=M12jSZj9FkKmLS9gHL4K7gwhuLwQagV3hlm1sbx5aIM=;
 b=OxjofCKdd68rt3RRCSOY8eZwlWHPRhlefz7KcXofshfFRPQnS7wc3ebGyHZhAJxV4lIPPh
 F6WXUjlrdbw8cRlYUmX9NJWpF0VEjmlUWVJDl/cW1Q96Dj1c1KVtaiDM8bTxLiiwbrgoTu
 qldAlGBbX0HYI+bv6DAQ2Zgro18J668=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-501-CcSDaK3WML-4iqys2mDReQ-1; Wed, 08 Jul 2020 19:33:20 -0400
X-MC-Unique: CcSDaK3WML-4iqys2mDReQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A758680183C;
 Wed,  8 Jul 2020 23:33:19 +0000 (UTC)
Received: from Whitewolf.redhat.com (unknown [10.10.115.252])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3F3D17F8A9;
 Wed,  8 Jul 2020 23:33:18 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/2] drm/probe_helper,
 i915: Validate MST modes against PBN limits
Date: Wed,  8 Jul 2020 19:33:09 -0400
Message-Id: <20200708233311.200024-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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

 drivers/gpu/drm/drm_crtc_helper_internal.h  |  7 +-
 drivers/gpu/drm/drm_probe_helper.c          | 97 ++++++++++++++-------
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 55 ++++++++----
 include/drm/drm_modes.h                     |  4 +-
 include/drm/drm_modeset_helper_vtables.h    | 42 +++++++++
 5 files changed, 152 insertions(+), 53 deletions(-)

-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
