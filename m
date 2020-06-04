Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 415541EE11B
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jun 2020 11:20:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EE356E21D;
	Thu,  4 Jun 2020 09:20:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch
 [185.70.40.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47CA16E2BC
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jun 2020 09:20:36 +0000 (UTC)
Date: Thu, 04 Jun 2020 09:20:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1591262434;
 bh=S77ijj3zO/iqtCoxNNl6Le0cycvdwXVNi7kBaWwXqlo=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=rBpdAcogQoaZWmPC5crBw+Nzo+MG42yBMXajnus/ghqG/joo07y0r59CMXAwTPxe4
 BTI3A1vATE7DiBMxv10HJcqx8Wt/Oa8aDoa2btpOs8D+m2RviCsHH4j49eSiu6C03V
 6CB490mbVrvDHSGbZVVRhQ89pw8FAve5iu3ABvos=
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH v3] drm: document how user-space should use link-status
Message-ID: <kFylMmeRMGJk-oi8f-Td8A7GNa1C-GsK23-vjKg77VhWfwpkLJg7QxFlQ_g9KdVxZiyWl9eJWpUGa5PYasR9YcyvIbuBmHVfKeHb4rH0yTM=@emersion.fr>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Manasi Navare <manasi.d.navare@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Describe what a "BAD" link-status means for user-space and how it should
handle it. The logic described has been implemented in igt [1].

v2:

- Change wording to avoid "enabled" (Daniel)
- Add paragraph about multiple connectors sharing the same CRTC (Pekka)
- Add paragraph about performing an atomic commit on a connector without
  updating the link-status property (Daniel)

v3:

- Fix description of what happens when link-status isn't reset to
  "GOOD", and when link-status is reset without ALLOW_MODESET (Daniel,
  Ville)
- Changing link-status to "BAD" is a no-op
- Clearly state that "BAD" means black screen (Manasi)

[1]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/commit/fbe61f529737191d0920521946a575bd55f00fbe

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Manasi Navare <manasi.d.navare@intel.com>
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
---

I'm not 100% sure the paragraph about not resetting link-status or not
using ALLOW_MODESET is accurate. Just like the previous version, this
is just an attempt at documenting the current kernel behaviour.

 drivers/gpu/drm/drm_connector.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index f2b20fd66319..1df036b3353b 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -994,6 +994,26 @@ static const struct drm_prop_enum_list dp_colorspaces[] = {
  *      after modeset, the kernel driver may set this to "BAD" and issue a
  *      hotplug uevent. Drivers should update this value using
  *      drm_connector_set_link_status_property().
+ *
+ *      When user-space receives the hotplug uevent and detects a "BAD"
+ *      link-status, the sink doesn't receive pixels anymore (e.g. the screen
+ *      becomes completely black). The list of available modes may have
+ *      changed. User-space is expected to pick a new mode if the current one
+ *      has disappeared and perform a new modeset with link-status set to
+ *      "GOOD" to re-enable the connector.
+ *
+ *      If multiple connectors share the same CRTC and one of them gets a "BAD"
+ *      link-status, the other are unaffected (ie. the sinks still continue to
+ *      receive pixels).
+ *
+ *      When user-space performs an atomic commit on a connector with a "BAD"
+ *      link-status without resetting the property to "GOOD", the sink may
+ *      still not receive pixels. When user-space performs an atomic commit
+ *      which resets the link-status property to "GOOD" without the
+ *      ALLOW_MODESET flag set, it might fail because a modeset is required.
+ *
+ *      User-space can only change link-status to "GOOD", changing it to "BAD"
+ *      is a no-op.
  * non_desktop:
  * 	Indicates the output should be ignored for purposes of displaying a
  * 	standard desktop environment or console. This is most likely because
-- 
2.26.2


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
