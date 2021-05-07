Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC6B376BDD
	for <lists+dri-devel@lfdr.de>; Fri,  7 May 2021 23:42:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39A666E588;
	Fri,  7 May 2021 21:42:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2D8A6E588
 for <dri-devel@lists.freedesktop.org>; Fri,  7 May 2021 21:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620423746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZoTcHkNvjmIdSHWRw1A3T95KgNRdw8mZxQhxd84MX8M=;
 b=M/nCoSNNFxhgcR6kM2h+oPf6MA1roa34aBjp+PpBofM4LGqm7VIMhLdAdpTaWuwLXTd5Lh
 kZXOYqEMGowpp6cszZQfaK2rjL+vtPF2sUcsLQo0ebf25ZToc8kmeqw6LmX8nUUccgs32P
 QT1xPr8JFHUV/MLeq5dzYVkX+TXGBwM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-bjLmcu3kO4GejKlhh4TTGA-1; Fri, 07 May 2021 17:42:25 -0400
X-MC-Unique: bjLmcu3kO4GejKlhh4TTGA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C9253107ACCA;
 Fri,  7 May 2021 21:42:23 +0000 (UTC)
Received: from Ruby.redhat.com (ovpn-112-131.rdu2.redhat.com [10.10.112.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 288C563B8C;
 Fri,  7 May 2021 21:42:21 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/dp: Fix bogus DPCD version check in
 drm_dp_read_downstream_info()
Date: Fri,  7 May 2021 17:42:09 -0400
Message-Id: <20210507214209.554866-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ville pointed this out to me when fixing some issues in
drm_dp_read_downstream_info() - the DPCD version check here is bogus as
there's no DisplayPort versions prior to 1.0. The original code from i915
that this was extracted from actually did:

  dpcd[DP_DPCD_REV] == DP_DPCD_REV_10

Which is correct, and somehow got missed when extracting this function. So
let's fix this. Note that as far as I'm aware, I don't think this fixes any
actual issues users are hitting.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_dp_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index 0f84df8798ab..55b53df6ce34 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -677,7 +677,7 @@ int drm_dp_read_downstream_info(struct drm_dp_aux *aux,
 	memset(downstream_ports, 0, DP_MAX_DOWNSTREAM_PORTS);
 
 	/* No downstream info to read */
-	if (!drm_dp_is_branch(dpcd) || dpcd[DP_DPCD_REV] < DP_DPCD_REV_10)
+	if (!drm_dp_is_branch(dpcd) || dpcd[DP_DPCD_REV] == DP_DPCD_REV_10)
 		return 0;
 
 	/* Some branches advertise having 0 downstream ports, despite also advertising they have a
-- 
2.30.2

