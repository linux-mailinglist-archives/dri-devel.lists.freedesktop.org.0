Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D10191EC295
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jun 2020 21:18:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9D636E1CF;
	Tue,  2 Jun 2020 19:18:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch
 [185.70.40.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C127F6E1CF
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jun 2020 19:18:25 +0000 (UTC)
Date: Tue, 02 Jun 2020 19:18:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1591125503;
 bh=XkcYEPKzTngNE/ax82fDOr+ZOgz+f0C+ZE0lG3UHhAw=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=iA9AcmaqhzikyIIXrJcc5J4wUl9A/Ade0Z9NI1YrUGJ/cM0VPUhABXxyhYbBar3Ru
 IshCZXI0Cmh6dneOylR/gdLl+sAqvLYW8FJYuuIMu09M4FdoBhpTolI2Cin40cknCt
 pceN0NfqMdKDNckw3sK/5PdJjLJn1YouO2St+VA4=
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH v2] drm: document how user-space should use link-status
Message-ID: <a3tPhSgOvV4Vn3if_Bqhg-QDwCIVZfHc99EeOVWLRkxOWQoF2tL3QSz-6SLEv3pIJRg2VANaS5rmZUkTkyqi3y0PO9qY84oOa7v_yNFpauY=@emersion.fr>
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

[1]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/commit/fbe61f529737191d0920521946a575bd55f00fbe

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Manasi Navare <manasi.d.navare@intel.com>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
---
 drivers/gpu/drm/drm_connector.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index f2b20fd66319..829b21124048 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -994,6 +994,21 @@ static const struct drm_prop_enum_list dp_colorspaces[] = {
  *      after modeset, the kernel driver may set this to "BAD" and issue a
  *      hotplug uevent. Drivers should update this value using
  *      drm_connector_set_link_status_property().
+ *
+ *      When user-space receives the hotplug uevent and detects a "BAD"
+ *      link-status, the sink doesn't receive pixels anymore. The list of
+ *      available modes may have changed. User-space is expected to pick a new
+ *      mode if the current one has disappeared and perform a new modeset with
+ *      link-status set to "GOOD" to re-enable the connector.
+ *
+ *      If multiple connectors share the same CRTC and one of them gets a "BAD"
+ *      link-status, the other are unaffected (ie. the sinks still continue to
+ *      receive pixels).
+ *
+ *      When user-space performs an atomic commit on a connector with a "BAD"
+ *      link-status without resetting the property to "GOOD", it gets
+ *      implicitly reset. This might make the atomic commit fail if the modeset
+ *      is unsuccessful.
  * non_desktop:
  * 	Indicates the output should be ignored for purposes of displaying a
  * 	standard desktop environment or console. This is most likely because
-- 
2.26.2


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
