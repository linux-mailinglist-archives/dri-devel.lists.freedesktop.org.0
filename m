Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2209AB3F886
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 10:33:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 485C410E5F3;
	Tue,  2 Sep 2025 08:33:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tcKHyCJ7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C096310E5F1
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 08:33:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A013640BCE;
 Tue,  2 Sep 2025 08:33:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31EA0C4CEED;
 Tue,  2 Sep 2025 08:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756802024;
 bh=6b7UDJ+K9JSaJwNLdD3QfXhiSHmFYmCS7AH4OMReX7k=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=tcKHyCJ73DiG2+bV0DmAVYO281tfF1oII6jNu4Ni9UZ+VS33CAFwbj7BPYNLsMqds
 76zAP+CNcYC17mW0qd5gUDLCRo5XYuDA4pO17os6WGe5mI7CQ77nVdFzrh9pdR64J1
 L/9bS3EkulDu84Wrqb+JNT+1lrFC/bHgljGyH68RrZOLqcHEsf6EdiluZ74cO6N3vl
 DSwwAPsaLptfPipQ/stUd3WD5HBwwEjZF2NAnN4tsoFK5M8iGoRp/25Ye6iZ5ELfdZ
 ToXhDSYDYN6d3ZWj7SD9l/aULw/RovpIj4/iQStPWir1ED0htQfNHnW9b8970b7JL8
 pnAFSslf9hpDw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 02 Sep 2025 10:32:41 +0200
Subject: [PATCH 13/29] drm/atomic_helper: Compare actual and readout states
 once the commit is done
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-drm-state-readout-v1-13-14ad5315da3f@kernel.org>
References: <20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org>
In-Reply-To: <20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Devarsh Thakkar <devarsht@ti.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10708; i=mripard@kernel.org;
 h=from:subject:message-id; bh=6b7UDJ+K9JSaJwNLdD3QfXhiSHmFYmCS7AH4OMReX7k=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnbVu/ScliyYfPSwLJZzCGr7k9M0bPc/cJi8uPJTxZNY
 nnFEvGToWMqC4MwJ4OsmCLLE5mw08vbF1c52K/8ATOHlQlkCAMXpwBMhNmPsWHXM713baxThDvu
 XMk4VlnceZw3JHvl3T3Hgnf7txR+XFYnt/rOamHJrXtXPj3SHKjjU8TYcP7eFYnFa6puCDtXNJV
 3cIhermZcs9ojeXemJhvbvz0Xnvxk/Rvwe9Lt9W//Ve6/Unb+NAA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

The new atomic state readout infrastructure can be hard to test because
getting access to every firmware variation is hard, but also because
most firmware setup will be pretty basic and won't test a wide range of
features. Noticing whether it was sucessful or not is also not very
convenient.

In order to make it easier, we can however provide some infrastructure
to read out a new state every time a non-blocking commit is made, and
compare the readout one with the committed one. And since we do this
only on non-blocking commits, the time penalty doesn't matter.

To do so, we introduce a new hook for every state, atomic_compare_state,
that takes two state instances and is supposed to return whether they
are identical or not.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_helper.c | 113 ++++++++++++++++++++++++++++++++++++
 include/drm/drm_atomic.h            |  14 +++++
 include/drm/drm_bridge.h            |  14 +++++
 include/drm/drm_connector.h         |  14 +++++
 include/drm/drm_crtc.h              |  14 +++++
 include/drm/drm_plane.h             |  14 +++++
 6 files changed, 183 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 14d9bc282ca570964e494936090898b2dc6bee31..aa8f52b5d5a5e6146a6472eebaf02e675c35ccd2 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -428,10 +428,120 @@ void drm_atomic_helper_readout_state(struct drm_device *dev)
 	drm_atomic_helper_install_readout_state(state);
 	drm_atomic_state_put(state);
 }
 EXPORT_SYMBOL(drm_atomic_helper_readout_state);
 
+static bool drm_atomic_helper_readout_compare(struct drm_atomic_state *committed_state)
+{
+	struct drm_device *dev = committed_state->dev;
+	struct drm_printer p = drm_err_printer(dev, NULL);
+	struct drm_private_state *new_obj_state;
+	struct drm_private_obj *obj;
+	struct drm_plane_state *new_plane_state;
+	struct drm_plane *plane;
+	struct drm_crtc_state *new_crtc_state;
+	struct drm_crtc *crtc;
+	struct drm_connector_state *new_conn_state;
+	struct drm_connector *conn;
+	struct drm_atomic_state *readout_state;
+	unsigned int i;
+	bool identical = true;
+
+	readout_state = drm_atomic_build_readout_state(dev);
+	if (WARN_ON(IS_ERR(readout_state)))
+		return false;
+
+	for_each_new_plane_in_state(committed_state, plane, new_plane_state, i) {
+		const struct drm_plane_funcs *plane_funcs =
+			plane->funcs;
+		struct drm_plane_state *readout_plane_state;
+
+		readout_plane_state = drm_atomic_get_old_plane_state(readout_state, plane);
+		if (!readout_plane_state) {
+			identical = false;
+			continue;
+		}
+
+		if (!plane_funcs->atomic_compare_state)
+			continue;
+
+		if (!plane_funcs->atomic_compare_state(plane, &p, new_plane_state, readout_plane_state)) {
+			drm_warn(dev, "[PLANE:%d:%s] Committed and Readout PLANE state don't match\n",
+				 plane->base.id, plane->name);
+			identical = false;
+			continue;
+		}
+	}
+
+	for_each_new_crtc_in_state(committed_state, crtc, new_crtc_state, i) {
+		const struct drm_crtc_funcs *crtc_funcs = crtc->funcs;
+		struct drm_crtc_state *readout_crtc_state;
+
+		readout_crtc_state = drm_atomic_get_old_crtc_state(readout_state, crtc);
+		if (!readout_crtc_state) {
+			identical = false;
+			continue;
+		}
+
+		if (!crtc_funcs->atomic_compare_state)
+			continue;
+
+		if (!crtc_funcs->atomic_compare_state(crtc, &p, new_crtc_state, readout_crtc_state)) {
+			drm_warn(dev, "[CRTC:%d:%s] Committed and Readout CRTC state don't match\n",
+				 crtc->base.id, crtc->name);
+			identical = false;
+			continue;
+		}
+	}
+
+	for_each_new_connector_in_state(committed_state, conn, new_conn_state, i) {
+		const struct drm_connector_funcs *conn_funcs =
+			conn->funcs;
+		struct drm_connector_state *readout_conn_state;
+
+		readout_conn_state = drm_atomic_get_old_connector_state(readout_state, conn);
+		if (!readout_conn_state) {
+			identical = false;
+			continue;
+		}
+
+		if (!conn_funcs->atomic_compare_state)
+			continue;
+
+		if (!conn_funcs->atomic_compare_state(conn, &p, new_conn_state, readout_conn_state)) {
+			drm_warn(dev, "[CONNECTOR:%d:%s] Committed and Readout connector state don't match\n",
+				 conn->base.id, conn->name);
+			identical = false;
+			continue;
+		}
+	}
+
+	for_each_new_private_obj_in_state(committed_state, obj, new_obj_state, i) {
+		const struct drm_private_state_funcs *obj_funcs = obj->funcs;
+		struct drm_private_state *readout_obj_state;
+
+		readout_obj_state = drm_atomic_get_old_private_obj_state(readout_state, obj);
+		if (!readout_obj_state) {
+			identical = false;
+			continue;
+		}
+
+		if (!obj_funcs->atomic_compare_state)
+			continue;
+
+		if (!obj_funcs->atomic_compare_state(obj, &p, new_obj_state, readout_obj_state)) {
+			drm_warn(dev, "Committed and Readout private object state don't match\n");
+			identical = false;
+			continue;
+		}
+	}
+
+	drm_atomic_state_put(readout_state);
+
+	return identical;
+}
+
 /**
  * DOC: overview
  *
  * This helper library provides implementations of check and commit functions on
  * top of the CRTC modeset helper callbacks and the plane helper callbacks. It
@@ -2382,10 +2492,13 @@ static void commit_tail(struct drm_atomic_state *state, bool nonblock)
 						 (unsigned long)commit_time_ms,
 						 new_self_refresh_mask);
 
 	drm_atomic_helper_commit_cleanup_done(state);
 
+	if (!nonblock)
+		drm_atomic_helper_readout_compare(state);
+
 	drm_atomic_state_put(state);
 }
 
 static void commit_work(struct work_struct *work)
 {
diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index f13f926d21047e42bb9ac692c2dd4b88f2ebd91c..d75a9c7e23adf7fa264df766b47526f75e9cc753 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -226,10 +226,24 @@ struct drm_private_state_funcs {
 	 * Frees the private object state created with @atomic_duplicate_state.
 	 */
 	void (*atomic_destroy_state)(struct drm_private_obj *obj,
 				     struct drm_private_state *state);
 
+	/**
+	 * @atomic_compare_state
+	 *
+	 * Compares two &struct drm_private_state instances.
+	 *
+	 * RETURNS:
+	 *
+	 * True if the states are identical, false otherwise.
+	 */
+	bool (*atomic_compare_state)(struct drm_private_obj *obj,
+				     struct drm_printer *p,
+				     struct drm_private_state *a,
+				     struct drm_private_state *b);
+
 	/**
 	 * @atomic_print_state:
 	 *
 	 * If driver subclasses &struct drm_private_state, it should implement
 	 * this optional hook for printing additional driver specific state.
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 15b63053f01869786831936ba28b7efc1e55e2e8..5ea63b51a4dd4cb00468afcf7d126c774f63ade0 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -511,10 +511,24 @@ struct drm_bridge_funcs {
 	int (*atomic_readout_state)(struct drm_bridge *bridge,
 				    struct drm_bridge_state *bridge_state,
 				    struct drm_crtc_state *crtc_state,
 				    struct drm_connector_state *conn_state);
 
+	/**
+	 * @atomic_compare_state
+	 *
+	 * Compares two &struct drm_bridge_state instances.
+	 *
+	 * RETURNS:
+	 *
+	 * True if the states are identical, false otherwise.
+	 */
+	bool (*atomic_compare_state)(struct drm_bridge *bridge,
+				     struct drm_printer *p,
+				     struct drm_bridge_state *a,
+				     struct drm_bridge_state *b);
+
 	/**
 	 * @atomic_duplicate_state:
 	 *
 	 * Duplicate the current bridge state object (which is guaranteed to be
 	 * non-NULL).
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index f68bd9627c085c6d2463b847aaa245ccc651f27b..dc2c77b04df9010cbfb2028de8ef8c747003c489 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1534,10 +1534,24 @@ struct drm_connector_funcs {
 	 * This callback is mandatory for atomic drivers.
 	 */
 	void (*atomic_destroy_state)(struct drm_connector *connector,
 				     struct drm_connector_state *state);
 
+	/**
+	 * @atomic_compare_state
+	 *
+	 * Compares two &struct drm_connector_state instances.
+	 *
+	 * RETURNS:
+	 *
+	 * True if the states are identical, false otherwise.
+	 */
+	bool (*atomic_compare_state)(struct drm_connector *connector,
+				     struct drm_printer *p,
+				     struct drm_connector_state *a,
+				     struct drm_connector_state *b);
+
 	/**
 	 * @atomic_set_property:
 	 *
 	 * Decode a driver-private property value and store the decoded value
 	 * into the passed-in state structure. Since the atomic core decodes all
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index 11e3299cfad1572c6e507918c7cceae7a28ba4cf..21c20ecdda40f3d155d3c140e06b3801270f5262 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -676,10 +676,24 @@ struct drm_crtc_funcs {
 	 * This callback is mandatory for atomic drivers.
 	 */
 	void (*atomic_destroy_state)(struct drm_crtc *crtc,
 				     struct drm_crtc_state *state);
 
+	/**
+	 * @atomic_compare_state
+	 *
+	 * Compares two &struct drm_crtc_state instances.
+	 *
+	 * RETURNS:
+	 *
+	 * True if the states are identical, false otherwise.
+	 */
+	bool (*atomic_compare_state)(struct drm_crtc *crtc,
+				     struct drm_printer *p,
+				     struct drm_crtc_state *a,
+				     struct drm_crtc_state *b);
+
 	/**
 	 * @atomic_set_property:
 	 *
 	 * Decode a driver-private property value and store the decoded value
 	 * into the passed-in state structure. Since the atomic core decodes all
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index 691a267c857a228f674ef02a63fb6d1ff9e379a8..c24c10ccc8e8f2ba23e77e279aef61ae86e320c7 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -449,10 +449,24 @@ struct drm_plane_funcs {
 	 * This callback is mandatory for atomic drivers.
 	 */
 	void (*atomic_destroy_state)(struct drm_plane *plane,
 				     struct drm_plane_state *state);
 
+	/**
+	 * @atomic_compare_state
+	 *
+	 * Compares two &struct drm_plane_state instances.
+	 *
+	 * RETURNS:
+	 *
+	 * True if the states are identical, false otherwise.
+	 */
+	bool (*atomic_compare_state)(struct drm_plane *plane,
+				     struct drm_printer *p,
+				     struct drm_plane_state *a,
+				     struct drm_plane_state *b);
+
 	/**
 	 * @atomic_set_property:
 	 *
 	 * Decode a driver-private property value and store the decoded value
 	 * into the passed-in state structure. Since the atomic core decodes all

-- 
2.50.1

