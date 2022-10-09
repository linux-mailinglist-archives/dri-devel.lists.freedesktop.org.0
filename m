Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2AA5F942E
	for <lists+dri-devel@lfdr.de>; Mon, 10 Oct 2022 01:53:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCEB610E597;
	Sun,  9 Oct 2022 23:53:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F373310E592
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Oct 2022 23:53:07 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 800B160D3F;
 Sun,  9 Oct 2022 23:53:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99AA1C43142;
 Sun,  9 Oct 2022 23:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665359586;
 bh=E8lnajgY5yjgmA9Ze197EDHKNzbkkiNgzzOdflXRywI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=siaFa+E9z32rgaYY1oorFeDSqNnzMRHxwELXjayX4vzG99RlHbqMg5UeiZfJ18b1x
 tzoyMsHmvKkh0+KmdTKdon2/r/qm6PIXqrp9wXYL5kXkIKqYZAH2Sx7YkMVDqJHNTP
 nYhzmX99d2aauIHfkfemARhbdCI7ZxGxpQrMJpIL7laTIpQ+L5TbALbklx6yw7QgrL
 k/r1KR2HrFS05AxYfWrM6fWri4Psk8Fn9qV0sS6V4VeZg7/aG8iR/SUzy8V3B/hsZZ
 MPK7sKWFgFRDK9WmoU8XJ7K0WhrJvwDfLGJF/pg+q0JTPuw1BzBVt2Omt0d/lttrxe
 vp/B51ZywuqPg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.19 13/36] drm: hide unregistered connectors from
 GETCONNECTOR IOCTL
Date: Sun,  9 Oct 2022 19:51:59 -0400
Message-Id: <20221009235222.1230786-13-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221009235222.1230786-1-sashal@kernel.org>
References: <20221009235222.1230786-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
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
Cc: Sasha Levin <sashal@kernel.org>, Jani Nikula <jani.nikula@intel.com>,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Simon Ser <contact@emersion.fr>

[ Upstream commit 981f09295687f856d5345e19c7084aca481c1395 ]

When registering a connector, the kernel sends a hotplug uevent in
drm_connector_register(). When unregistering a connector, drivers
are expected to send a uevent as well. However, user-space has no way
to figure out that the connector isn't registered anymore: it'll still
be reported in GETCONNECTOR IOCTLs.

The documentation for DRM_CONNECTOR_UNREGISTERED states:

> The connector […] has since been unregistered and removed from
> userspace, or the connector was unregistered before it had a chance
> to be exposed to userspace

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20220801133754.461037-1-contact@emersion.fr
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/drm_mode_config.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
index 37b4b9f0e468..6a326b41d193 100644
--- a/drivers/gpu/drm/drm_mode_config.c
+++ b/drivers/gpu/drm/drm_mode_config.c
@@ -150,6 +150,9 @@ int drm_mode_getresources(struct drm_device *dev, void *data,
 	count = 0;
 	connector_id = u64_to_user_ptr(card_res->connector_id_ptr);
 	drm_for_each_connector_iter(connector, &conn_iter) {
+		if (connector->registration_state != DRM_CONNECTOR_REGISTERED)
+			continue;
+
 		/* only expose writeback connectors if userspace understands them */
 		if (!file_priv->writeback_connectors &&
 		    (connector->connector_type == DRM_MODE_CONNECTOR_WRITEBACK))
-- 
2.35.1

