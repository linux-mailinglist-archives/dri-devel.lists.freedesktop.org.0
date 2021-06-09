Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE353A1EEF
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 23:24:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 809CE6EB48;
	Wed,  9 Jun 2021 21:24:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.protonmail.ch (mail-4317.protonmail.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8040C6EB41;
 Wed,  9 Jun 2021 21:24:10 +0000 (UTC)
Date: Wed, 09 Jun 2021 21:24:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1623273848;
 bh=CRpCmV6JJvjSWIefuOMH4SCsYiJSl92J72nXZg36ElE=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=XTDKNX2oTSMf5r8Z9kCRg0LOrMUAnlSW83jpURVJFYUe2G9xmU1ff6Rlbn5CIhTDL
 wx+NewdFxon7fANrvUD8KISS5ZrZ+bLoDfAb2tCCai4lrkDgFja1bPdVeJevr+oCLi
 pjJWaE/zBfix/endv7nQNt6qXYl8anyDV/h84ZqNfAimI12uCMFu5TQNVXeyLH9P2Z
 5OmKPb9HkvRdIoJlS1zkKomuiINMoqCZuHhmOFhriJebtRyM5gus5mTgFmKHVbbFra
 nlnSaw2toviWN2VQus1cd/1IMTreN2g0IOhcYIZuoBeW2I20EXBYZ54m9/k92sUd+M
 J31em3eI58x+Q==
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH v2 6/7] i915/display/dp: send a more fine-grained link-status
 uevent
Message-ID: <s2nCZi12JRcxrixhDW8UTiJsEpPvIQhnFBMtgdRXMk@cp3-web-020.plabs.ch>
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
Cc: pekka.paalanen@collabora.com, michel@daenzer.net, alexander.deucher@amd.com,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When link-status changes, send a hotplug uevent which contains the
connector and property ID. That way, user-space can more easily
figure out that only the link-status property of this connector has
been updated.

Signed-off-by: Simon Ser <contact@emersion.fr>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915=
/display/intel_dp.c
index 5c9222283044..0ce44a97dd14 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -5276,6 +5276,8 @@ static void intel_dp_modeset_retry_work_fn(struct wor=
k_struct *work)
 =09mutex_unlock(&connector->dev->mode_config.mutex);
 =09/* Send Hotplug uevent so userspace can reprobe */
 =09drm_kms_helper_hotplug_event(connector->dev);
+=09drm_sysfs_connector_status_event(connector,
+=09=09=09=09=09 connector->dev->mode_config.link_status_property);
 }
=20
 bool
--=20
2.31.1


