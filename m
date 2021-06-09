Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B95663A1EDF
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 23:23:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 651D56EA83;
	Wed,  9 Jun 2021 21:23:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail1.protonmail.ch (mail1.protonmail.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C19996E406;
 Wed,  9 Jun 2021 21:23:25 +0000 (UTC)
Date: Wed, 09 Jun 2021 21:23:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1623273803;
 bh=O59p1XnGFmzprEBJ1OBmXfghWF/+Fzjmwvd7LymMVa0=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=nQdklizb32UffrfpcVdBwM+QM0V9W/Oq6YVf2bfljWBA3cJG33B9HwI10ATflH+wM
 lsS39ryKHSMQeVAAHi9VoV4OsYjlqdsUXMw5tEcvT8w9NPAlgWQ7IKiYXD+n+cpOs6
 /ixJcT9tZzBLPcivL+C58UVjLFeaoAefEzYbkixOjc0AfCeXpLNUsf4kCp1ZS9qXIv
 9ZccMkydHhriMR7s5kFVqtvHDf/4EQPnnfJwhC4Ct7uVvPlzr56ReMxoEwGeRd2N2O
 KdH/DtCGCYpQ8bA6mhgpwRg4aWKHXJin64RiAFgFeqSy2hwUceMP6avtKNNVHsbuGT
 64lkURxsdqETQ==
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH v2 0/7] drm: add per-connector hotplug events
Message-ID: <s5D1m6hjidKxuxaN6qpewqhxco48P4poVuMf1zi4qA@cp3-web-012.plabs.ch>
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

When a uevent only updates a single connector, add a CONNECTOR property
to the uevent. This allows user-space to ignore other connectors when
handling the uevent. This is purely an optimization, drivers can still
send a uevent without the CONNECTOR property.

The CONNECTOR property is already set when sending HDCP property update
uevents, see drm_sysfs_connector_status_event.

This has been tested with a wlroots patch [1].

amdgpu and the probe-helper has been updated to use these new fine-grained
uevents.

[1]: https://github.com/swaywm/wlroots/pull/2959

Simon Ser (7):
  drm/sysfs: introduce drm_sysfs_connector_hotplug_event
  drm/probe-helper: add drm_kms_helper_connector_hotplug_event
  drm/connector: use drm_sysfs_connector_hotplug_event
  amdgpu: use drm_kms_helper_connector_hotplug_event
  drm/probe-helper: use drm_kms_helper_connector_hotplug_event
  i915/display/dp: send a more fine-grained link-status uevent
  drm/connector: add ref to drm_connector_get in iter docs

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  8 ++--
 .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c |  4 +-
 drivers/gpu/drm/drm_connector.c               |  2 +-
 drivers/gpu/drm/drm_probe_helper.c            | 42 +++++++++++++++++--
 drivers/gpu/drm/drm_sysfs.c                   | 25 +++++++++++
 drivers/gpu/drm/i915/display/intel_dp.c       |  2 +
 include/drm/drm_connector.h                   |  5 +++
 include/drm/drm_probe_helper.h                |  1 +
 include/drm/drm_sysfs.h                       |  1 +
 9 files changed, 79 insertions(+), 11 deletions(-)

--=20
2.31.1


