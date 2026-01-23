Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iCvcLtPPc2kCywAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 20:45:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DAF7A419
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 20:45:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3EF410EBCC;
	Fri, 23 Jan 2026 19:45:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="FRQDOQb5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-g123.zoho.com (sender4-pp-g123.zoho.com
 [136.143.188.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2F4110EBD1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 19:45:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1769197506; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=ZZeIUxhHGLLW1TpVMN+2bYNTy5fEaz8QT6hFYTEazw+rlyK+0F4jW8xMzwWs4zey5LSoiS6aohnxZjj/CTNol54Wte4bzmleM4U16WDatRY97u8XdX1mlzbRa483Hft1YaDV3R2dFdUNzVcAq3GI3M9OkBqPSyXpZSfYMNkJ0Tc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1769197506;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=GixBB0mHLWyff2llQFG2MB6dBljhru2tDrgr7BydCcU=; 
 b=PZ0ykkc2x7/7TmhNC9z3m7GLopk4WkjBzrExRf9TTm1egxQO49DIxE3pulJpk/V2ATZNJuKPp9O6TYRwfBBuXJDxC0Vim8mn5i2c1j7ianHC/08rYur2I9tLUkAjUP9dYlqQF6oYp/h0xVYpUvFesRtD1paqtVFitym2WLxj1mk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769197506; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
 bh=GixBB0mHLWyff2llQFG2MB6dBljhru2tDrgr7BydCcU=;
 b=FRQDOQb567U1nwYyQwbcBaH4Fr7UsyEvL51mykJWX3Atkqw6Bmy0uKWfLA+/hzBc
 KzsuYptmyQL5SkxbWDeQ2uvFYMvE4i0IewFcX9FTZcgY3piVBI8yHE7nFDfFOikVUeu
 Dc+y4MveLDLI9yscH4xPCdngreOFUgR8RARFNKKs=
Received: by mx.zohomail.com with SMTPS id 1769197504248926.5854579056753;
 Fri, 23 Jan 2026 11:45:04 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: [PATCH v6 0/4] Pass down hot-plug CONNECTOR ID to user-space
Date: Fri, 23 Jan 2026 20:44:01 +0100
Message-Id: <20260123-hot-plug-passup-v6-0-aaaf61d960bb@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/zWOwQ6CMAyGX4X0bJENQcPJ9zAcxiiwBNjsGDEhv
 LtTsZfmy99+7Qae2JCHKtmAaTXe2DlCeUpAD2ruCU0bGWQmy0xIgYNd0I2hR6e8Dw67G7VZ3l1
 1nIC45Zg68/oaH3Xkju2Ey8Ck/p5CfKqUeX5LRSEuAgVOik3w6Tqq9q7tOKrGskq1nQ4l0zPE3
 5afFxrlCWM6maVKWo4HjDsfHep9fwMwKX6h1wAAAA==
X-Change-ID: 20260121-hot-plug-passup-f8ed03f7c202
To: =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 Daniel Stone <daniel.stone@collabora.com>, 
 Ian Forbes <ian.forbes@broadcom.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Marius Vlad <marius.vlad@collabora.com>
X-Mailer: b4 0.14.3
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ville.syrjala@linux.intel.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:louis.chauvet@bootlin.com,m:hamohammed.sa@gmail.com,m:melissa.srw@gmail.com,m:daniel.stone@collabora.com,m:ian.forbes@broadcom.com,m:dmitry.baryshkov@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:kernel@collabora.com,m:nicolas.frattaroli@collabora.com,m:marius.vlad@collabora.com,m:hamohammedsa@gmail.com,m:melissasrw@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,bootlin.com,collabora.com,broadcom.com,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER(0.00)[nicolas.frattaroli@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.frattaroli@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.812];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,collabora.com:dkim,collabora.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 26DAF7A419
X-Rspamd-Action: no action

I will be taking over this series from Marius Vlad. 

This series addresses a shortcoming whereby a hot plug event is sent
without it being passed the actual connector that caused it. This takes
into consideration both the polling path and the HPD (Hot Plug Detect)
path. It also adds support for the vkms driver (using ConfigFS) for
propagating the connector ID when changing the connector's status.

The motivation is that user-space applications such as Weston would
previously receive non-connector-specific hotplug events, and then have
to figure out themselves which connector needs to have a modeset
executed on. This notably did not work when the hotplug events came in
too fast, resulting in Weston missing an on-off-on transition of a
connector, seeing that its state was unchanged from "on" so can't be the
one that was hotplugged, and skipping reinitialising it as it looks
through the other connectors that could've caused it.

The real world implication is that on setups with slightly sketchy HDMI
connections, a brief flicker in the HPD signal could result in video
output bidding farewell entirely until a manual proper re-plug was
performed.

By sending connector specific hotplug events, this ambiguity is
resolved without any change to the user-space API.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
Changes in v6:
- Rewrote cover letter to explain the motivation for this series more
  plainly
- Rename "status_changed" to "pending_hp"
- Set "pending_hp" in the existing path that would also affect
  epoch_counter
- No longer set the boolean in drm_helper_probe_single_connector_modes,
  as it does not appear to be necessary
- Reword commits to better justify the changes
- Link to v5: https://lore.kernel.org/r/20251111162338.15141-1-marius.vlad@collabora.com/

Changes in v5:
- vkms: add support for sending the CONNECTOR ID when hot-plugging through
  ConfigFS - as reported by Louis, vkms can now make use of ConfigFS to
  simulate connector status.
- vkms: add a small change to ignore previous/old drm connector status
  when sending out hot-plug uevent.
- Link to v4: https://lore.kernel.org/r/20251103174558.7709-1-marius.vlad@collabora.com/

Changes in v4:
- removed the "This patch" bit - Dmitry
- added a short note when the flag is set and cleared - Dmitry
- address double dead-locking detected - kbot: https://lore.kernel.org/dri-devel/202509251410.fdfbcac3-lkp@intel.com/
- virtual connectors do not seem have any kind of hotplug - added
  polling in vkms - as noted by Ian
- Link to v3: https://lore.kernel.org/r/20250923083636.4749-1-marius.vlad@collabora.com/

Changes in v3:
- Address comments from Dmitry:
  - guard connector status write with mode_config.mutex
  - avoid setting up the connector status and immediately unset it. Do the
    unset in drm_kms_helper_hotplug_event/drm_kms_helper_connector_hotplug_event
- Link to v2: https://lore.kernel.org/r/20250729165708.9947-1-marius.vlad@collabora.com/

Changes in v2:
- Address comments from Daniel:
  - split patch into 2, one that introduces a bool to track connector
    connection status change and a patch that uses that to be able to send
    hot plug events with the proper CONNECTOR ID to udev and further pass
    that down to user-space
  - nuke out mutex when iterating connector list
  - fix typo
- Link to v1: https://lore.kernel.org/r/20250627131751.2004-1-marius.vlad@collabora.com/

Marius Vlad (4):
  drm: Introduce a new connector status
  drm: Propagate connector status change
  vkms: Do not send hotplug events for same connector status
  vkms: Pass the vkms connector as opposed to the vkms device

 drivers/gpu/drm/drm_connector.c       |  1 +
 drivers/gpu/drm/drm_probe_helper.c    | 39 +++++++++++++++++++++++----
 drivers/gpu/drm/drm_sysfs.c           |  1 +
 drivers/gpu/drm/vkms/vkms_configfs.c  | 12 +++++++--
 drivers/gpu/drm/vkms/vkms_connector.c |  6 ++---
 drivers/gpu/drm/vkms/vkms_connector.h |  4 +--
 include/drm/drm_connector.h           |  3 +++
 7 files changed, 54 insertions(+), 12 deletions(-)

--
2.47.2

---
Marius Vlad (4):
      drm: Introduce pending_hp to drm_connector
      drm: Send per-connector hotplug events
      vkms: Do not send hotplug events for same connector status
      vkms: Pass the vkms connector as opposed to the device on hotplug

 drivers/gpu/drm/drm_connector.c       |  1 +
 drivers/gpu/drm/drm_probe_helper.c    | 39 ++++++++++++++++++++++++++++++-----
 drivers/gpu/drm/drm_sysfs.c           |  2 ++
 drivers/gpu/drm/vkms/vkms_configfs.c  |  6 ++++--
 drivers/gpu/drm/vkms/vkms_connector.c |  6 +++---
 drivers/gpu/drm/vkms/vkms_connector.h |  4 ++--
 include/drm/drm_connector.h           |  3 +++
 7 files changed, 49 insertions(+), 12 deletions(-)
---
base-commit: ab42b1c3fe4ce1ae5534c51b880d3a97e6bba145
change-id: 20260121-hot-plug-passup-f8ed03f7c202

Best regards,
-- 
Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

