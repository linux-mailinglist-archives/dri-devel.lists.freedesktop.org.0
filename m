Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B85258805
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 08:22:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C858D6E180;
	Tue,  1 Sep 2020 06:22:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6512C6E180
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 06:22:45 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id c15so37787plq.4
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 23:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oTJ5pvtNQxrk9Lcwfc0FfHwyW5E/r8XmOjx4wCngqbY=;
 b=E2a2L6cwaXjFouYizPEuvuYQpVqHSy3hFYgpFjjD7a8WiWTFnAM9Fz5bjhg+pdZCFZ
 XBgjeLAtRJmG2dA9fqQuSeOOoveqXXbPkaCudUIkJHksYBcqe4OWDcwpVmKTvAoEU9M7
 XvDFtyHkvcJ5j8v6Kf8BpAHb5ibwuBbtTivdQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oTJ5pvtNQxrk9Lcwfc0FfHwyW5E/r8XmOjx4wCngqbY=;
 b=dNZJiacmjji+q+X67y8+ieE+yNoK9tY1xrr6M/OhBazNe4itETYreaFWVy7ORf3171
 xDm9nq+8V4vyGrVRm7Knz6R7+7J8spekAr3LBG3097c2zyndxYursXM7MWt+xkMk/Ax2
 vsq6BQ7Ve4WDdyfa9+Ud4gQqIX5DBarvTxVyIsZKbmxWucF1Bx9g4epWtZkkIJp17uPC
 P4ROo8MqdMY/exted0wv6ssDrye5hxYwHjs/WFSGmL8nlOfCw8tDhyhH2n7KFVkb+rim
 B6wm2VwHQ5FQVnJmamsVleVBFLNz08f0NIM9wSjdfy5taWE89QdKKA0h9HPFZgMG6gB4
 mv4A==
X-Gm-Message-State: AOAM530m+j7DuAjiGhl5EmfjfbtM74rarxFMzqunfCFO2nMg2UVaG4eX
 KBRdLdDg7e0AvDdoDMYVhP66Idhnp8SENw==
X-Google-Smtp-Source: ABdhPJzQJKnW7unr2YtvEvMkN3qtJbPGwnIUMbFKbsFv6d8l9uPQhCqy9lFeNYGSngzgr6gXv2tB9w==
X-Received: by 2002:a17:90a:db49:: with SMTP id u9mr139106pjx.90.1598941365043; 
 Mon, 31 Aug 2020 23:22:45 -0700 (PDT)
Received: from localhost ([2401:fa00:9:15:7220:84ff:fe09:cabc])
 by smtp.gmail.com with ESMTPSA id y9sm338017pfn.85.2020.08.31.23.22.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Aug 2020 23:22:44 -0700 (PDT)
From: Sam McNally <sammc@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH 3/5] drm_dp_mst_topology: export two functions
Date: Tue,  1 Sep 2020 16:22:17 +1000
Message-Id: <20200901162133.3.I6c917ff82a1d2ae2253a3bd4d750d58879387cac@changeid>
X-Mailer: git-send-email 2.28.0.402.g5ffc5be6b7-goog
In-Reply-To: <20200901162133.1.I8693156f555875e5c8342e86ab37ce968dfdd277@changeid>
References: <20200901162133.1.I8693156f555875e5c8342e86ab37ce968dfdd277@changeid>
MIME-Version: 1.0
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
 Sam McNally <sammc@chromium.org>, Hans Verkuil <hans.verkuil@cisco.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Hans Verkuil <hans.verkuil@cisco.com>

These are required for the CEC MST support.

Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
Signed-off-by: Sam McNally <sammc@chromium.org>
---

 drivers/gpu/drm/drm_dp_mst_topology.c | 6 ++----
 include/drm/drm_dp_mst_helper.h       | 4 ++++
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index 0d753201adbd..c783a2a1c114 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -62,8 +62,6 @@ struct drm_dp_pending_up_req {
 static bool dump_dp_payload_table(struct drm_dp_mst_topology_mgr *mgr,
 				  char *buf);
 
-static void drm_dp_mst_topology_put_port(struct drm_dp_mst_port *port);
-
 static int drm_dp_dpcd_write_payload(struct drm_dp_mst_topology_mgr *mgr,
 				     int id,
 				     struct drm_dp_payload *payload);
@@ -1864,7 +1862,7 @@ static void drm_dp_mst_topology_get_port(struct drm_dp_mst_port *port)
  * drm_dp_mst_topology_try_get_port()
  * drm_dp_mst_topology_get_port()
  */
-static void drm_dp_mst_topology_put_port(struct drm_dp_mst_port *port)
+void drm_dp_mst_topology_put_port(struct drm_dp_mst_port *port)
 {
 	topology_ref_history_lock(port->mgr);
 
@@ -1935,7 +1933,7 @@ drm_dp_mst_topology_get_port_validated_locked(struct drm_dp_mst_branch *mstb,
 	return NULL;
 }
 
-static struct drm_dp_mst_port *
+struct drm_dp_mst_port *
 drm_dp_mst_topology_get_port_validated(struct drm_dp_mst_topology_mgr *mgr,
 				       struct drm_dp_mst_port *port)
 {
diff --git a/include/drm/drm_dp_mst_helper.h b/include/drm/drm_dp_mst_helper.h
index c7c79e0ced18..d036222e0d64 100644
--- a/include/drm/drm_dp_mst_helper.h
+++ b/include/drm/drm_dp_mst_helper.h
@@ -754,6 +754,10 @@ drm_dp_mst_detect_port(struct drm_connector *connector,
 		       struct drm_dp_mst_topology_mgr *mgr,
 		       struct drm_dp_mst_port *port);
 
+struct drm_dp_mst_port *drm_dp_mst_topology_get_port_validated
+(struct drm_dp_mst_topology_mgr *mgr, struct drm_dp_mst_port *port);
+void drm_dp_mst_topology_put_port(struct drm_dp_mst_port *port);
+
 struct edid *drm_dp_mst_get_edid(struct drm_connector *connector, struct drm_dp_mst_topology_mgr *mgr, struct drm_dp_mst_port *port);
 
 
-- 
2.28.0.402.g5ffc5be6b7-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
