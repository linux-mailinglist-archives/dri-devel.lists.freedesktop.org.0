Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7F519DEF6
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 22:08:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA39D6E97A;
	Fri,  3 Apr 2020 20:08:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7891E6E97A
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 20:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585944487;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=TkamcyvUPqN5kcSYh+i5OtzU6Ni2nQG6cLAfWaqbe6M=;
 b=ccqKboDP+TZLRxRZOgYyjkMt4+diYX6GWxrDWrJY/OWAL5QI0FaNAPi7H6GW7NI+JCGZ2E
 7PiqVew0+oPU5RESmq3FQ8wAx/8XzGRnGxaYpjqIcyUXloTz5PXq2zTmbXr/bizziDq63X
 gRWdxxhBpCsfQvuT20MV46v/YFSjuYY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-124-zi1qdTwpPL-Atu5STQHOvA-1; Fri, 03 Apr 2020 16:08:06 -0400
X-MC-Unique: zi1qdTwpPL-Atu5STQHOvA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 786B6107ACC4;
 Fri,  3 Apr 2020 20:08:04 +0000 (UTC)
Received: from Ruby.redhat.com (ovpn-117-203.rdu2.redhat.com [10.10.117.203])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F3B235C541;
 Fri,  3 Apr 2020 20:08:02 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/4] drm/dp_mst: drm_dp_check_act_status() fixes
Date: Fri,  3 Apr 2020 16:07:52 -0400
Message-Id: <20200403200757.886443-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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

 drivers/gpu/drm/drm_dp_mst_topology.c | 50 ++++++++++++++++++---------
 1 file changed, 34 insertions(+), 16 deletions(-)

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
