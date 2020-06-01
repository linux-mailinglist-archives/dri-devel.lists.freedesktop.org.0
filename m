Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F251EA646
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jun 2020 16:49:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C20BC89FFD;
	Mon,  1 Jun 2020 14:49:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail1.protonmail.ch (mail1.protonmail.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1D9A89FFD
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jun 2020 14:49:07 +0000 (UTC)
Date: Mon, 01 Jun 2020 14:48:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1591022945;
 bh=EQuBvQ7n4G31ddRYEDhSZ+pus1K6EB5qR5vZ5LX6Vns=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=DU6t5pblFdffBIfwdrJjVVXHdZPL7LaNaYx7H6nIOPa6rQEah8zS6bqGYSNgojqKW
 eYfxfPom3CkOP7hmMI6hUP/s7R6oUbP81jeBiKev5oFvdMRodN/Qako3GiJhUqhVG8
 b2xfzabd4iMiSrNj4dLjJ1/SGE4aqBm53YmPU1r0=
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH] drm: document how user-space should use link-status
Message-ID: <krnCwRP0UCcVJbY-8ILP_gEFf4EaUdKPSuuHisFkphFaoOl2EAnU032oOWAeJi2xlsFsA7qeR8lypXs71-SoULZnd2gP5C7ohDEfsWTB5-A=@emersion.fr>
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

[1]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/commit/fbe61f529737191d0920521946a575bd55f00fbe

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Manasi Navare <manasi.d.navare@intel.com>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
---
 drivers/gpu/drm/drm_connector.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index f2b20fd66319..08ba84f9787a 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -994,6 +994,12 @@ static const struct drm_prop_enum_list dp_colorspaces[] = {
  *      after modeset, the kernel driver may set this to "BAD" and issue a
  *      hotplug uevent. Drivers should update this value using
  *      drm_connector_set_link_status_property().
+ *
+ *      When user-space receives the hotplug uevent and detects a "BAD"
+ *      link-status, the connector is no longer enabled. The list of available
+ *      modes may have changed. User-space is expected to pick a new mode if
+ *      the current one has disappeared and perform a new modeset with
+ *      link-status set to "GOOD" to re-enable the connector.
  * non_desktop:
  * 	Indicates the output should be ignored for purposes of displaying a
  * 	standard desktop environment or console. This is most likely because
-- 
2.26.2


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
