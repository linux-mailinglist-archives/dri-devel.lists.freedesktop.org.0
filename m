Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEA917C908
	for <lists+dri-devel@lfdr.de>; Sat,  7 Mar 2020 00:49:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59F736EDA8;
	Fri,  6 Mar 2020 23:49:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 134A66EDA6
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 23:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583538572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=v+JBQbCOXTS0FlnC1/Gxr+beCyEpCMXP0Ynor51xOGs=;
 b=BzBEU96cEU7KT1QIpAaqI+oTQ4mSvpfRWniRgjq38/bsqspisWkd80zQsc34OBdh2eidf8
 KXXq1yB3dGGma31ajDoEdv/3EXT2HmYuSa02GHqAAPZv2hg7BZgakSENN9jhlNh7Z3NO0t
 uYNSDdaMx/TE7OgdnQaMeljZy6a/Ouk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-LrfGex8wPz2qwyStpsC_6g-1; Fri, 06 Mar 2020 18:49:28 -0500
X-MC-Unique: LrfGex8wPz2qwyStpsC_6g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5918A800D4E;
 Fri,  6 Mar 2020 23:49:26 +0000 (UTC)
Received: from Ruby.bss.redhat.com (dhcp-10-20-1-196.bss.redhat.com
 [10.20.1.196])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EDD4791D7A;
 Fri,  6 Mar 2020 23:49:24 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] drm/dp_mst: Fix link address probing regressions
Date: Fri,  6 Mar 2020 18:49:20 -0500
Message-Id: <20200306234923.547873-1-lyude@redhat.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 David Francis <david.francis@amd.com>, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Mikita Lipski <mikita.lipski@amd.com>,
 Benjamin Gaignard <benjamin.gaignard@st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While fixing some regressions caused by introducing bandwidth checking
into the DP MST atomic helpers, I realized there was another much more
subtle regression that got introduced by a seemingly harmless patch to
fix unused variable errors while compiling with W=1 (mentioned in patch
2). Basically, this regression makes it so sometimes link address
appears to "hang". This patch series fixes it.

Lyude Paul (2):
  drm/dp_mst: Make drm_dp_mst_dpcd_write() consistent with
    drm_dp_dpcd_write()
  drm/dp_mst: Fix drm_dp_check_mstb_guid() return code

 drivers/gpu/drm/drm_dp_mst_topology.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
