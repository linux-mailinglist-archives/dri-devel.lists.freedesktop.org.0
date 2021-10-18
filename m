Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C31943126B
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 10:47:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE2CA6E99B;
	Mon, 18 Oct 2021 08:47:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 340626E99C
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 08:47:17 +0000 (UTC)
Date: Mon, 18 Oct 2021 08:47:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1634546835;
 bh=QrB3JVww2LcGdYZwo1winnzyb1QAWcpPcUmttB08llg=;
 h=Date:To:From:Reply-To:Subject:From;
 b=sVUracSIsJJ5Slhvkwvbjsa9kyKJTo22NTPuuqgUEgmF7My56asIHjndmHzvtXbJK
 WF7W/MkyBdl+8hsYw8NZzdlPbJ5d4gcV+WgiP+94dZxR11pKw5K+QQeAD3P6SkYC3l
 wB+fGnu15KCNDLmpV6J7+WltKLHiIzq26QuLFdFm7KeuBcWfwtXDyv/x//t8Sy1+Ju
 DPS6aUYLy9PjHUEiftfttIiw+W4iSQrVoPARI584e0nyl5SiOmC7Ke+cVjNzeG0p/p
 L8i84z8cDUYT3NyC+bh17WNnc+8lQyt5FOlScH9trUL+cqq9F+FdtaM0uFzddU8gy/
 J4pR6UK6eU++g==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH v4 0/6] drm: add per-connector hotplug events
Message-ID: <20211018084707.32253-1-contact@emersion.fr>
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

Changes in v4: address comments from Ville, Maxime and Sam.

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
 drivers/gpu/drm/drm_probe_helper.c            | 48 +++++++++++++++----
 drivers/gpu/drm/drm_sysfs.c                   | 25 ++++++++++
 drivers/gpu/drm/i915/display/intel_dp.c       |  2 +-
 include/drm/drm_probe_helper.h                |  1 +
 include/drm/drm_sysfs.h                       |  1 +
 8 files changed, 75 insertions(+), 16 deletions(-)


base-commit: f6632721cd6231e1bf28b5317dcc7543e43359f7
--=20
2.33.1


