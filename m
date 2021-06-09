Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 042DC3A1039
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 12:44:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F04996E560;
	Wed,  9 Jun 2021 10:44:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 311 seconds by postgrey-1.36 at gabe;
 Wed, 09 Jun 2021 10:44:30 UTC
Received: from mail-4321.protonmail.ch (mail-4321.protonmail.ch [185.70.43.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00C7D6E529
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 10:44:30 +0000 (UTC)
Received: from mail-02.mail-europe.com (mail-0201.mail-europe.com
 [51.77.79.158])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail-4321.protonmail.ch (Postfix) with ESMTPS id 4G0Nrp0f9Hz4xMPX;
 Wed,  9 Jun 2021 10:39:22 +0000 (UTC)
Authentication-Results: mail-4321.protonmail.ch;
 dkim=pass (2048-bit key) header.d=emersion.fr header.i=@emersion.fr
 header.b="qoM1SvR1"
Date: Wed, 09 Jun 2021 10:39:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1623235156;
 bh=LjUJ5eqlBd2mywiTIMnBvU4gY15eyVm9VKwLqlUHyDs=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=qoM1SvR1chY4aMoFXIu5gvOcCT9TvqHrBYg859V4Xi+ALpzg3EAU0YglQq6bqkF8C
 Uhq9ieBotf95IbFp6Gg5D5JzF089FFOd40jkE3uI7fNXMFC4pxSeXlHe+iFMB1DPW3
 W+MvTIsGmkdfsCmYI5Jq7XPNuIEmPC+mVrMAsz/EnXnj791wlQgsGHuGUklkyUHnrG
 Hh27/BJX6wOTf9+Nk3PzdvzVOLMY5ySucHlz9GBrLpABDI8/3Mup2f7/ysEtdDfcX2
 VdCu1MS7IvXETlU5VpaS5gerzpebKxyVG5UDshb+DWRCqeTHD7snxQJR2BFp3tX0dY
 Kaq5Ccfi2qy+Q==
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH 0/4] drm: add per-connector hotplug events
Message-ID: <H6LOTVFhdBPSi5N5zQIYRvkif2VhbZgfDIyWTvdSrY@cp3-web-051.plabs.ch>
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
Cc: pekka.paalanen@collabora.com, michel@daenzer.net, alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When a uevent only updates a single connector, add a CONNECTOR property
to the uevent. This allows user-space to ignore other connectors when
handling the uevent. This is purely an optimization, drivers can still
send a uevent without the CONNECTOR property.

The CONNECTOR property is already set when sending HDCP property update
uevents, see drm_sysfs_connector_status_event.

This has been tested with a wlroots patch [1].

amdgpu has been updated to use these new fine-grained uevents.

[1]: https://github.com/swaywm/wlroots/pull/2959

Simon Ser (4):
  drm/sysfs: introduce drm_sysfs_connector_hotplug_event
  drm/probe-helper: add drm_kms_helper_connector_hotplug_event
  drm/connector: use drm_sysfs_connector_hotplug_event
  amdgpu: use drm_kms_helper_connector_hotplug_event

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  8 +++---
 .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c |  4 +--
 drivers/gpu/drm/drm_connector.c               |  2 +-
 drivers/gpu/drm/drm_probe_helper.c            | 20 +++++++++++++++
 drivers/gpu/drm/drm_sysfs.c                   | 25 +++++++++++++++++++
 include/drm/drm_probe_helper.h                |  1 +
 include/drm/drm_sysfs.h                       |  1 +
 7 files changed, 54 insertions(+), 7 deletions(-)

--=20
2.31.1


