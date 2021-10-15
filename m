Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD22542F847
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 18:34:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D0A76EDAC;
	Fri, 15 Oct 2021 16:33:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E6656E329
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 16:33:51 +0000 (UTC)
Date: Fri, 15 Oct 2021 16:33:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1634315629;
 bh=aCE9y3qSThbD2y1rUgyiT7Irei9XmhQaPbaufThP6Ts=;
 h=Date:To:From:Reply-To:Subject:In-Reply-To:References:From;
 b=sdojlnRfrUoIgvW0m2HrNGXri+4wnDGX1wD/1ynwXxydobs190m/sKTymhFzi/Y92
 uMBtKN7IMc3vlCX15b1018sQMoMv2rwspV8ZXJUG4wAPt9Vbtx9uBjaSj9JIZcid88
 fszyX27hNP6t+aLqmPgx2lHnHFoOZS2t6s7xoe6A3U6lWbGOocayjfhy9Fx4yi1kNC
 XzulrxnjYCx0AtzHDjdGIWP1AAj1w4VVA+mzHXT478NW1r/pM72nj1tgF0rwI2YWTM
 LAX76650Ky6Nj6Q12PkbzPfj2SKk79dkMV6+KC3mIy+eToGYQsCL//UIOaymS1MaRI
 0ZoVAgWFubHPA==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH v3 6/6] i915/display/dp: send a more fine-grained link-status
 uevent
Message-ID: <20211015163336.95188-7-contact@emersion.fr>
In-Reply-To: <20211015163336.95188-1-contact@emersion.fr>
References: <20211015163336.95188-1-contact@emersion.fr>
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
connector and property ID. That way, user-space can more easily
figure out that only the link-status property of this connector has
been updated.

Signed-off-by: Simon Ser <contact@emersion.fr>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915=
/display/intel_dp.c
index 04175f359fd6..afbe34b6e5be 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -5264,6 +5264,8 @@ static void intel_dp_modeset_retry_work_fn(struct wor=
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
2.33.1


