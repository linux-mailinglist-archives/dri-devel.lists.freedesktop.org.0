Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5871A00AA
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 00:13:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26E186E4CD;
	Mon,  6 Apr 2020 22:13:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F7476E4CD
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Apr 2020 22:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586211187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/HSM7a17NXiCfmU3HyJmqf3yicBWvNyRVvlLx1TwWsY=;
 b=XNWPy1Uld+uI/l2bcBsiZnor6EXu0TKtSqerI8KgHVwgAQlM1wrXgZghu7P0x4ByIsxaAc
 ihqxsKbjDPQhjGH8v9NdKxyoLEmcTOkTt7lS/Yg96xXGkULTKOTL+Vav0Cx2WfWYyMm1kA
 LO9cIw/C4uW+2YdspB1hwyja5jbC19Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-_kdFTnKNMnCSBorMBVkrDg-1; Mon, 06 Apr 2020 18:13:05 -0400
X-MC-Unique: _kdFTnKNMnCSBorMBVkrDg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8FBC4801A07;
 Mon,  6 Apr 2020 22:13:03 +0000 (UTC)
Received: from Ruby.redhat.com (ovpn-117-12.rdu2.redhat.com [10.10.117.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7ACC89D359;
 Mon,  6 Apr 2020 22:13:01 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/4] drm/dp_mst: drm_dp_check_act_status() fixes
Date: Mon,  6 Apr 2020 18:12:49 -0400
Message-Id: <20200406221253.1307209-1-lyude@redhat.com>
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
Cc: Todd Previte <tprevite@gmail.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Noticed this while fixing some unrelated issues with NAKs being dropped
- we don't wait nearly long enough to receive ACTs from MST hubs in some
situations. Also, we take the time to refactor this function a bit.

This fixes some ACT timeouts I observed on an EVGA MST hub with i915.

Lyude Paul (4):
  drm/dp_mst: Improve kdocs for drm_dp_check_act_status()
  drm/dp_mst: Reformat drm_dp_check_act_status() a bit
  drm/dp_mst: Increase ACT retry timeout to 3s
  drm/dp_mst: Print errors on ACT timeouts

 drivers/gpu/drm/drm_dp_mst_topology.c | 71 +++++++++++++++++----------
 1 file changed, 44 insertions(+), 27 deletions(-)

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
