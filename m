Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD9B42F845
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 18:33:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C58DC6E514;
	Fri, 15 Oct 2021 16:33:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B476F6EDAC
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 16:33:49 +0000 (UTC)
Date: Fri, 15 Oct 2021 16:33:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1634315627;
 bh=iz8tfN2svdtF6KSSfSoVoVZ29qbGEbFnbC+v/Fx70h8=;
 h=Date:To:From:Reply-To:Subject:From;
 b=SkeNRxsO79EQOvQWkTYiu/bmDFpNztqSFp2GKcUv5EHq770j9+AYyndkTokrAYEys
 sqlblwXvRa5heHzYZI+xn9mLgTQ+opSo5IIhZIl4fuIYW1CGeOOV6CTxr25blGGi+C
 /YtNhnVCyNF/JrIC9eAnVC1hl73w4/uZLQ5cGKtBRA7M3QcASB50sPa5W9z+rmX8Rw
 sqmO5lsfOgLUHFHaQ4ckcqtp81Sg2qQRrXGWO4ndipP1km1LJFz2x+3HT2tmD7QqIE
 0jVWTV4aHneOVAy2i/2QiyV+CIw16j+rS6vIKY/HFWeYukeVGqtNBDRFOEsPVXg+KP
 ykJclbCWnH/Hw==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH v3 0/6] drm: add per-connector hotplug events
Message-ID: <20211015163336.95188-1-contact@emersion.fr>
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

When a uevent only updates a single connector, add a CONNECTOR property
to the uevent. This allows user-space to ignore other connectors when
handling the uevent. This is purely an optimization, drivers can still
send a uevent without the CONNECTOR property.

The CONNECTOR property is already set when sending HDCP property update
uevents, see drm_sysfs_connector_status_event.

This has been tested with a wlroots patch [1].

amdgpu and the probe-helper has been updated to use these new fine-grained
uevents.

Changes in v3: rebase

[1]: https://github.com/swaywm/wlroots/pull/2959

Simon Ser (6):
  drm/sysfs: introduce drm_sysfs_connector_hotplug_event
  drm/probe-helper: add drm_kms_helper_connector_hotplug_event
  drm/connector: use drm_sysfs_connector_hotplug_event
  amdgpu: use drm_kms_helper_connector_hotplug_event
  drm/probe-helper: use drm_kms_helper_connector_hotplug_event
  i915/display/dp: send a more fine-grained link-status uevent

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  8 ++--
 .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c |  4 +-
 drivers/gpu/drm/drm_connector.c               |  2 +-
 drivers/gpu/drm/drm_probe_helper.c            | 43 +++++++++++++++++--
 drivers/gpu/drm/drm_sysfs.c                   | 25 +++++++++++
 drivers/gpu/drm/i915/display/intel_dp.c       |  2 +
 include/drm/drm_probe_helper.h                |  1 +
 include/drm/drm_sysfs.h                       |  1 +
 8 files changed, 75 insertions(+), 11 deletions(-)


base-commit: f6632721cd6231e1bf28b5317dcc7543e43359f7
--=20
2.33.1


