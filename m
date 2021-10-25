Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E2843A68F
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 00:30:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64D0688EF2;
	Mon, 25 Oct 2021 22:30:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF99188EF2
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 22:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635201042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=0rVLTkzL+CC5DsjZcAbFddThzjyd1wa1/08osRCigXg=;
 b=bEHlTzoPkknqkmlL+fyEeXGjJy3epoRMJQFAeMzdqZ7dkJ+J2uxjeU1qwwbs0svid5Uvpn
 iiOc8ZtnaRT52B6yoRhj6TNkX4crXj9BPC8oMr2RDsMLP+w4IqjjXXn+A//Hq5TOnC89Od
 vgvt/SvfwaEJjcSkrYgF5nNo+/VWf/k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-Z7ms3oBlORa8a04fhG7z5A-1; Mon, 25 Oct 2021 18:30:39 -0400
X-MC-Unique: Z7ms3oBlORa8a04fhG7z5A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 337D310168C0;
 Mon, 25 Oct 2021 22:30:38 +0000 (UTC)
Received: from emerald.lyude.net (unknown [10.22.9.162])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1C20618368;
 Mon, 25 Oct 2021 22:30:37 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	amdgfx@lists.freedesktop.org
Subject: [PATCH v5 0/4] drm/amdgpu, Add DP 2.0 MST support + drm/dp_mst helpers
Date: Mon, 25 Oct 2021 18:30:24 -0400
Message-Id: <20211025223029.300891-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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

Just resubmitting this patch series from AMD with _very_ minor changes
(just a typo and fixing a debug message) so that this can be pushed
upstream with a proper patchwork link. Will be pushing this into a topic
branch and submitting to airlied in a moment.

Bhawanpreet Lakha (3):
  drm: Remove slot checks in dp mst topology during commit
  drm: Update MST First Link Slot Information Based on Encoding Format
  drm/amd/display: Add DP 2.0 MST DM Support

Fangzhi Zuo (1):
  drm/amd/display: Add DP 2.0 MST DC Support

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  29 ++
 .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c |   3 +
 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c |   5 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c      |  14 +
 drivers/gpu/drm/amd/display/dc/core/dc_link.c | 292 ++++++++++++++++++
 .../gpu/drm/amd/display/dc/core/dc_link_dp.c  |  19 ++
 drivers/gpu/drm/amd/display/dc/dc_link.h      |   7 +
 drivers/gpu/drm/amd/display/dc/dc_stream.h    |  13 +
 drivers/gpu/drm/drm_dp_mst_topology.c         |  42 ++-
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |   4 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c       |   2 +-
 drivers/gpu/drm/radeon/radeon_dp_mst.c        |   4 +-
 include/drm/drm_dp_mst_helper.h               |   5 +-
 13 files changed, 423 insertions(+), 16 deletions(-)

-- 
2.31.1

