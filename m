Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4825619FEB9
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 22:07:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D5D06E4BA;
	Mon,  6 Apr 2020 20:07:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD9CA6E4BA
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Apr 2020 20:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586203621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=rXIYebum9QchqOrGhXWLQLLK7a5E49kIN0en0Oaf2sg=;
 b=XkdZPW+cOYVR/p/jcsaObVQnUWcCpht90Uq+FhrlHYaQVWn+K/v4brznu4rpEJy6SB/Byt
 1aZQMY5uQGn+qhfsPucsKiF/nzouvSP077xD5Zmkbi/C7o11Jv8PH7V6FZD1/oNz0CVTIT
 GI+zmvluXWRIn57RdAwkbhMrZTMCdAs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-35-KCzBsCLTMzuH58e91jJXyQ-1; Mon, 06 Apr 2020 16:06:59 -0400
X-MC-Unique: KCzBsCLTMzuH58e91jJXyQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 80ED88018A6;
 Mon,  6 Apr 2020 20:06:57 +0000 (UTC)
Received: from Ruby.redhat.com (ovpn-117-12.rdu2.redhat.com [10.10.117.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1572B6EF97;
 Mon,  6 Apr 2020 20:06:54 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/2] drm/i915/dp_mst: Cast intel_connector->port as
 drm_dp_mst_port
Date: Mon,  6 Apr 2020 16:06:41 -0400
Message-Id: <20200406200646.1263435-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Chris Wilson <chris@chris-wilson.co.uk>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The only reason for having this cast as void * before was because we
originally needed to use drm_dp_mst_get_port_validated() and friends in
order to (attempt to) safely access MST ports. However, we've since
improved how reference counting works with ports and mstbs such that we
can now rely on drm_dp_mst_port structs remaining in memory for as long
as the driver needs. This means we don't really need to cast this as
void* anymore, and can just access the struct directly.

We'll also need this for the next commit, so that we can remove
drm_dp_mst_port_has_audio().

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Sean Paul <sean@poorly.run>
---
 drivers/gpu/drm/i915/display/intel_display_types.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 5a0adf14ebef..0ddc98afe252 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -438,7 +438,7 @@ struct intel_connector {
 	   state of connector->polled in case hotplug storm detection changes it */
 	u8 polled;
 
-	void *port; /* store this opaque as its illegal to dereference it */
+	struct drm_dp_mst_port *port;
 
 	struct intel_dp *mst_port;
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
