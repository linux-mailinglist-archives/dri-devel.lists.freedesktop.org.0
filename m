Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F698431272
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 10:47:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8113A6E99E;
	Mon, 18 Oct 2021 08:47:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 805BC6E863
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 08:47:40 +0000 (UTC)
Date: Mon, 18 Oct 2021 08:47:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1634546858;
 bh=AqZrLz2VN/83fP01hhtFuIxcRXjNQUIEhxswPOHOGis=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=d71doQL5A42fl/CdgmBYCVjleamLp5nXyrGaQjXzAAAogJvKpBMzAXfW5lFreU/VN
 fIBa8vBXX0eQRWaWpjx3dUofA+IzGDMq3sp85iL91r0DGVI6vTscDbmzJyMOUH+jRj
 3NHMTjRE0MHcpr9zOlugkweQmu8snTUX6pJDfuX4hoOj9TNQZbzf1RBU3AhIGFU3Yr
 SOvCf51RCLAkQQo8yMcbxkn3wPjLYn3skLBqSIf6qnip0eYJYUVMxDGH17+RPsGQVM
 WMF0CnvsQvN5lrfGDcGJz9bKVT9rpsAz6eWPFR/Z6N1m3qmfR4hYkrytXM9sBRNl5W
 Hh8ioN5D7fNHQ==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: [PATCH v4 6/6] i915/display/dp: send a more fine-grained link-status
 uevent
Message-ID: <20211018084707.32253-7-contact@emersion.fr>
In-Reply-To: <20211018084707.32253-1-contact@emersion.fr>
References: <20211018084707.32253-1-contact@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When link-status changes, send a hotplug uevent which contains the
connector ID. That way, user-space can more easily figure out that
only this connector has been updated.

Changes in v4: avoid sending two uevents (Ville)

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915=
/display/intel_dp.c
index 04175f359fd6..8b81a709d33b 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -5263,7 +5263,7 @@ static void intel_dp_modeset_retry_work_fn(struct wor=
k_struct *work)
 =09=09=09=09=09       DRM_MODE_LINK_STATUS_BAD);
 =09mutex_unlock(&connector->dev->mode_config.mutex);
 =09/* Send Hotplug uevent so userspace can reprobe */
-=09drm_kms_helper_hotplug_event(connector->dev);
+=09drm_kms_helper_connector_hotplug_event(connector);
 }
=20
 bool
--=20
2.33.1


